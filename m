Return-Path: <linux-media+bounces-15332-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5091593BF80
	for <lists+linux-media@lfdr.de>; Thu, 25 Jul 2024 11:56:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EA7D11F234A8
	for <lists+linux-media@lfdr.de>; Thu, 25 Jul 2024 09:56:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CA5B198E7B;
	Thu, 25 Jul 2024 09:56:37 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2064197A77;
	Thu, 25 Jul 2024 09:56:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721901397; cv=none; b=KXuFEIKe7AbsFP1mh+TxJ8hkqK3O1wXOOM3q5kud277jAqG8rM25N4eePkxvDeoEAf72LmKfI7uzJI/ZgD8Aya2OqfUtrf3yLpbUQtEBVpZ1LJvso7WH5aD3oA43Bc2pwK/ZZ0Cr25QzP+DMnkfOar0MDHUE8DjyZFsjv6QpQLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721901397; c=relaxed/simple;
	bh=Duzi/QfNzIZlK7OJBbOsub5rdSVYCkmQxkU+Ywf9oCo=;
	h=From:In-Reply-To:Content-Type:References:Date:Cc:To:MIME-Version:
	 Message-ID:Subject; b=WFuQbYY51KfZ3DUKN0uy0hxKIDyXa06/gtvR2Qkz/dJjjUUp/46CbOTMliTKfb1Jyo4a56OQG/7pKE0gID9s3B2fEdGJyJ/hQGZ5JDv+bzBgpnWAOc0KSw3c3XWqwzzaZBf5m9pVeigQODG/jjXjjcg0d2C9MySlfYibVvjrpsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Received: from harlem.collaboradmins.com (harlem.collaboradmins.com [IPv6:2a01:4f8:1c0c:5936::1])
	by madrid.collaboradmins.com (Postfix) with ESMTP id 7AD8D37811F4;
	Thu, 25 Jul 2024 09:56:32 +0000 (UTC)
From: "Shreeya Patel" <shreeya.patel@collabora.com>
In-Reply-To: <b8f1c80f-0e5f-41fc-bc20-0807db6c31d5@xs4all.nl>
Content-Type: text/plain; charset="utf-8"
X-Forward: 127.0.0.1
References: <20240719124032.26852-1-shreeya.patel@collabora.com>
 <20240719124032.26852-5-shreeya.patel@collabora.com> <b8f1c80f-0e5f-41fc-bc20-0807db6c31d5@xs4all.nl>
Date: Thu, 25 Jul 2024 10:56:32 +0100
Cc: heiko@sntech.de, mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, mturquette@baylibre.com, sboyd@kernel.org, p.zabel@pengutronix.de, jose.abreu@synopsys.com, nelson.costa@synopsys.com, shawn.wen@rock-chips.com, nicolas.dufresne@collabora.com, hverkuil-cisco@xs4all.nl, kernel@collabora.com, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, "Dmitry Osipenko" <dmitry.osipenko@collabora.com>
To: "Hans Verkuil" <hverkuil@xs4all.nl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <ae40e-66a22180-1-60612780@204847186>
Subject: =?utf-8?q?Re=3A?= [PATCH v4 4/4] =?utf-8?q?media=3A?=
 =?utf-8?q?_platform=3A?==?utf-8?q?_synopsys=3A?= Add support for hdmi input 
 driver
User-Agent: SOGoMail 5.10.0
Content-Transfer-Encoding: quoted-printable

On Sunday, July 21, 2024 14:21 IST, Hans Verkuil <hverkuil@xs4all.nl> w=
rote:

Hi Hans,

> On 19/07/2024 14:40, Shreeya Patel wrote:
> > Add initial support for the Synopsys DesignWare HDMI RX
> > Controller Driver used by Rockchip RK3588. The driver
> > supports:
> >  - HDMI 1.4b and 2.0 modes (HDMI 4k@60Hz)
> >  - RGB888, YUV422, YUV444 and YCC420 pixel formats
> >  - CEC
> >  - EDID configuration
> >=20
> > The hardware also has Audio and HDCP capabilities, but these are
> > not yet supported by the driver.
>=20
> FYI: if you want to add HDCP support, then please contact me. I have =
code
> available for that (i.e. the public API part), although it is out of =
date.
>=20
> But if you want to enable HDCP in this driver, then I would be very h=
appy
> to clean it up and post patches for that. It is something we (i.e. Ci=
sco)
> have been using for several years now in out-of-tree drivers.
>=20

Currently we do not have any plans to work on the HDCP support.
But in case the requirement arises in future, we will definitely reach
out to you.

Thanks,
Shreeya Patel

> I will try to review this patch in the next few days.
>=20
> Regards,
>=20
> 	Hans


