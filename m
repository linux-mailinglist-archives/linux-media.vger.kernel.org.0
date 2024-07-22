Return-Path: <linux-media+bounces-15276-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EEB4C9394BC
	for <lists+linux-media@lfdr.de>; Mon, 22 Jul 2024 22:26:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2CE9E1C21717
	for <lists+linux-media@lfdr.de>; Mon, 22 Jul 2024 20:26:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 462862CCD0;
	Mon, 22 Jul 2024 20:26:51 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CA4217C8D;
	Mon, 22 Jul 2024 20:26:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721680010; cv=none; b=hvDhWGug/sN40rLxL8SPBcYP2nLnnVapK8ImRjUNS/lSxg6imowOAIKDsrf9wlxsoqGiL+SS24k5Gh4JT3mBL3L1HUOzskBKCLMfsp9kq/GBnbryOLXdYNPJkdV/R0ULPEWczRWGdqFk2gkhk1phZp5XxVLcxNtIl8EaMmSh3Dw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721680010; c=relaxed/simple;
	bh=PDhWG48FfeZ9Iz4GyMw7dlBvGX6UW/gxvZDmFODusXQ=;
	h=From:In-Reply-To:Content-Type:References:Date:Cc:To:MIME-Version:
	 Message-ID:Subject; b=Di4iQz+uHggiHGTHpiuhuVL/3og96A4ADc+L+sR2FyhiNGLUD2n0Czym+5aCY1QPJNmsYiRY5FL8fZnKXU003a6tql608MzR3ieumuImWt1VcySjFXkKNgzFDg6uwIGFqBYyOv6e9eCrea2tgrG7dm741+TXr7/ns+gCJI6x3Fs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Received: from harlem.collaboradmins.com (harlem.collaboradmins.com [IPv6:2a01:4f8:1c0c:5936::1])
	by madrid.collaboradmins.com (Postfix) with ESMTP id A2DE53780692;
	Mon, 22 Jul 2024 20:26:45 +0000 (UTC)
From: "Shreeya Patel" <shreeya.patel@collabora.com>
In-Reply-To: <20240722193946.1246372-1-hoff.benjamin.k@gmail.com>
Content-Type: text/plain; charset="utf-8"
X-Forward: 127.0.0.1
References: <20240719124032.26852-1-shreeya.patel@collabora.com> <20240722193946.1246372-1-hoff.benjamin.k@gmail.com>
Date: Mon, 22 Jul 2024 21:26:45 +0100
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, heiko@sntech.de, hverkuil-cisco@xs4all.nl, hverkuil@xs4all.nl, jose.abreu@synopsys.com, kernel@collabora.com, krzk+dt@kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, mchehab@kernel.org, mturquette@baylibre.com, nelson.costa@synopsys.com, nicolas.dufresne@collabora.com, p.zabel@pengutronix.de, robh@kernel.org, sboyd@kernel.org, shawn.wen@rock-chips.com
To: hoff.benjamin.k@gmail.com
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <354380-669ec080-1-27ae20c0@20216750>
Subject: =?utf-8?q?Re=3A?= [PATCH v4 4/4] =?utf-8?q?media=3A?=
 =?utf-8?q?_platform=3A?==?utf-8?q?_synopsys=3A?= Add support for hdmi input 
 driver
User-Agent: SOGoMail 5.10.0
Content-Transfer-Encoding: quoted-printable

On Tuesday, July 23, 2024 01:09 IST, hoff.benjamin.k@gmail.com wrote:

Hi Benjamin,

> > Add initial support for the Synopsys DesignWare HDMI RX
> > Controller Driver used by Rockchip RK3588. The driver
> > supports:
> >  - HDMI 1.4b and 2.0 modes (HDMI 4k@60Hz)
> >  - RGB888, YUV422, YUV444 and YCC420 pixel formats
> >  - CEC
> >  - EDID configuration
> >
> > The hardware also has Audio and HDCP capabilities, but these are
> > not yet supported by the driver.
> >
> > Reviewed-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
> > Tested-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
> > Co-developed-by: Dingxian Wen <shawn.wen@rock-chips.com>
> > Signed-off-by: Dingxian Wen <shawn.wen@rock-chips.com>
> > Signed-off-by: Shreeya Patel <shreeya.patel@collabora.com>
> > ---
> >
...
> > +
> > +static const struct of=5Fdevice=5Fid hdmirx=5Fid[] =3D {
> > +	{ .compatible =3D "rockchip,rk3588-hdmirx-ctrler" },
> > +	{ },
> > +};
> > +MODULE=5FDEVICE=5FTABLE(of, hdmirx=5Fid);
> >
> >
> According to the platform=5Fdriver struct, they like the `remove=5Fne=
w` over remove.=20
> When I was compiling for Armbian, I was getting a type mismatch that =
prevented compililng
>=20
> See here: https://github.com/torvalds/linux/blob/933069701c1b507825b5=
14317d4edd5d3fd9d417/include/linux/platform=5Fdevice.h#L236
>=20

This patch series is based on linux-next and there seems to be some rec=
ent changes
related to .remove and .remove=5Fnew. New drivers are supposed to use .=
remove()

See the reason here :-
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tre=
e/include/linux/platform=5Fdevice.h?h=3Dnext-20240722#n239

If you apply the patches on top of linux-next then there shouldn't be a=
ny
compilation error.

> >
> > +
> > +static struct platform=5Fdriver hdmirx=5Fdriver =3D {
> > +	.probe =3D hdmirx=5Fprobe,
> > +	.remove =3D hdmirx=5Fremove,
> > +	.driver =3D {
> > +		.name =3D "snps=5Fhdmirx",
> > +		.of=5Fmatch=5Ftable =3D hdmirx=5Fid,
> > +		.pm =3D &snps=5Fhdmirx=5Fpm=5Fops,
> > +	}
> > +};
> > +module=5Fplatform=5Fdriver(hdmirx=5Fdriver);
> > +
> > +MODULE=5FDESCRIPTION("Rockchip HDMI Receiver Driver");
> > +MODULE=5FAUTHOR("Dingxian Wen <shawn.wen@rock-chips.com>");
> > +MODULE=5FAUTHOR("Shreeya Patel <shreeya.patel@collabora.com>");
> > +MODULE=5FLICENSE("GPL");


