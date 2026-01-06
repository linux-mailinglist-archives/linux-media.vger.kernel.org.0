Return-Path: <linux-media+bounces-50012-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 43A38CF80CA
	for <lists+linux-media@lfdr.de>; Tue, 06 Jan 2026 12:31:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4250C311F079
	for <lists+linux-media@lfdr.de>; Tue,  6 Jan 2026 11:26:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99E24326D62;
	Tue,  6 Jan 2026 11:26:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="b0wz1gSP"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC8574400;
	Tue,  6 Jan 2026 11:26:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767698808; cv=none; b=WnUVX6hOEHl8T1eJnOhdazcT/mRFsD3e89CJPWjFLMeTnev1mvEUppZPGqB9ruaSdJCBFhrRQ4HR9YkuatsoL9uY2tX19A1+pofbisBiHHV70wzoMFI86ODqidONleT+/z0GUyxuqjEauP8xo9SPvz2m4UGVZNWPUyr/A7iFdXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767698808; c=relaxed/simple;
	bh=MD2K1cjyBeNPzlNMIHrh0NsATFQMEXdblKij9BkmAww=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=OVAYBZdv4H3YZgHGrQ1yN0QEb7QB5p82hjg+6pA5zFwecEunLeZzWkC/SRUpY4Q11gPUr2xZHa01qjQlyOleXgLJ847DytVKb0LqFR971M8wcOGp9zqQCe3QK5Jdv9qvYx2ElkH03N+GbiVJuI8mIhwejle9HjluKv+OIToLURE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=b0wz1gSP; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c66:7a27:be73:8a11:8e2e:dcd3])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 147D078E;
	Tue,  6 Jan 2026 12:26:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1767698783;
	bh=MD2K1cjyBeNPzlNMIHrh0NsATFQMEXdblKij9BkmAww=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=b0wz1gSPdHt1B4ccVlGqmB/QUU1L+SW2RUEo9GGl9CMMkCT7VVm7cLaP1k3dk80ti
	 67qXqpt1xvRC/Cu842NOEPX8zxPLu7UfEykV1rf1chMxMScjK3NLRHpt1OsOKBV0dX
	 hy5LIObicOE55v/PD6vivFxryfFtyscndcdTQMy0=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20251219122955.2078270-3-y-abhilashchandra@ti.com>
References: <20251219122955.2078270-1-y-abhilashchandra@ti.com> <20251219122955.2078270-3-y-abhilashchandra@ti.com>
Subject: Re: [PATCH V3 2/4] media: i2c: ds90ub960: Use enums for chip type and chip family
From: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: hansg@kernel.org, mehdi.djait@linux.intel.com, ribalda@chromium.org, git@apitzsch.eu, vladimir.zapolskiy@linaro.org, benjamin.mugnier@foss.st.com, dongcheng.yan@intel.com, u-kumar1@ti.com, jai.luthra@linux.dev, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, y-abhilashchandra@ti.com
To: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>, conor+dt@kernel.org, hverkuil@xs4all.nl, krzk+dt@kernel.org, laurent.pinchart@ideasonboard.com, mchehab@kernel.org, robh@kernel.org, sakari.ailus@linux.intel.com, tomi.valkeinen@ideasonboard.com
Date: Tue, 06 Jan 2026 16:56:39 +0530
Message-ID: <176769879989.1604677.2711861319449479575@freya>
User-Agent: alot/0.12.dev62+gb9d6144a6

Hi Abhilash,

Thank you for the patch.

Quoting Yemike Abhilash Chandra (2025-12-19 17:59:53)
> Replace chip-specific boolean flags with chip_type and chip_family enums.
> This simplifies the process of adding support for newer devices and also
> improves code readability.
>=20
> Signed-off-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
> ---
> Changelog:
> Changes in v3:
> - Change conditional checks to check for applicable chips over negated ch=
ecks. (Tomi)
> - Keep the model name in the ub960_hw_data structure and remove the switc=
h-case from the probe function. (Tomi)
>=20
>  drivers/media/i2c/ds90ub960.c | 38 +++++++++++++++++++++++------------
>  1 file changed, 25 insertions(+), 13 deletions(-)
>=20

Reviewed-by: Jai Luthra <jai.luthra@ideasonboard.com>

[...]

