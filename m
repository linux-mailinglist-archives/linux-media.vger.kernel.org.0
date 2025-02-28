Return-Path: <linux-media+bounces-27185-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 674EDA48FDA
	for <lists+linux-media@lfdr.de>; Fri, 28 Feb 2025 04:51:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0DEF07A51F4
	for <lists+linux-media@lfdr.de>; Fri, 28 Feb 2025 03:50:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4559192B8C;
	Fri, 28 Feb 2025 03:51:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="j1GJWQ1w"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E76617BA3;
	Fri, 28 Feb 2025 03:51:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740714705; cv=none; b=j8CvScH3Bg0IyaRloAy/zw0WCHYT+I38TjGVwhJ7JfXyuKihTpbnkGnPydsXuVWT62p+u6d8hHZgm21WZhRI23IB2ThHr13T+o66qkoiSUP2wwZm294BS4eFcmQj5i0l2K1QKjbATg58q1t4fEh/3AtDWNPMSzvx5wdgWsjTZCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740714705; c=relaxed/simple;
	bh=yKN09BvLDaiC4SpyxvS+pwLkqAqDF739KyfOxk8S3Kc=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=H5r/gKdjk1TcDwIPizBpwZ04hvqsV5InsYLhuAOWzyfWGi16kr6pt6ZMkkGoFtmfbHlGPQuwXQ2ENlDFhODLqMJWNcFdU3FjpYgMSvx5NVTqO7kSPFamg5xPMm7fMRN8XORtm8a8stzQSADOocd6c9dprlxPL/Iiw8tWhH51hIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=j1GJWQ1w; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1740714701;
	bh=yKN09BvLDaiC4SpyxvS+pwLkqAqDF739KyfOxk8S3Kc=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=j1GJWQ1wVo8l4SQahFnNcPJYoiKrWO4p6GuKLQqi9NXrqiI/ALqUHsY+6ae0TwfjO
	 EJy6vjVy7RI7ktX0Q/b5kfDO2PbDGV9ox6un8mHJz1RG6h5k3lyM1UnuMA+0UT3my4
	 ljFI4RkkAAvht5Z9f9OE8s7LxWKeuTZ5Zzfnx7irYvgPuBZABELIf6vZfsF1cgPPl4
	 puzJaCA0KxlBE6OYKhiOOVLIEtbsi+kME8mQ1qF0Mt6XIzSl+87FLfIgNzwl1E6FR1
	 RyA7284U97mbh/h1nzhleMd8DZ5cr42NTY5UnHPqvvS+ZgrR5m2ovFbGn0RdrkG4Dz
	 VHT/13iVcfWag==
Received: from [IPv6:2606:6d00:11:e976::c41] (unknown [IPv6:2606:6d00:11:e976::c41])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 04C5B17E087E;
	Fri, 28 Feb 2025 04:51:38 +0100 (CET)
Message-ID: <863f9c1beb7a912f94f8740b3e5095e09e49cee5.camel@collabora.com>
Subject: Re: [PATCH v10 6/6] arm64: defconfig: Enable Synopsys HDMI receiver
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Hans Verkuil <hverkuil@xs4all.nl>, Dmitry Osipenko	
 <dmitry.osipenko@collabora.com>, Shreeya Patel
 <shreeya.patel@collabora.com>,  Heiko Stuebner	 <heiko@sntech.de>, Mauro
 Carvalho Chehab <mchehab@kernel.org>, Rob Herring	 <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley	
 <conor+dt@kernel.org>, jose.abreu@synopsys.com, nelson.costa@synopsys.com, 
	shawn.wen@rock-chips.com, Sebastian Reichel
 <sebastian.reichel@collabora.com>
Cc: kernel@collabora.com, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, Tim Surber <me@timsurber.de>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Thu, 27 Feb 2025 22:51:37 -0500
In-Reply-To: <a8a6c8c8-ee3b-422a-8573-a2cbb61fc3aa@xs4all.nl>
References: <20250225183058.607047-1-dmitry.osipenko@collabora.com>
	 <20250225183058.607047-7-dmitry.osipenko@collabora.com>
	 <a8a6c8c8-ee3b-422a-8573-a2cbb61fc3aa@xs4all.nl>
Organization: Collabora Canada
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Hans,

Le mercredi 26 février 2025 à 09:31 +0100, Hans Verkuil a écrit :
> On 25/02/2025 19:30, Dmitry Osipenko wrote:
> > From: Sebastian Reichel <sebastian.reichel@collabora.com>
> > 
> > The Rockchip RK3588 has a built-in HDMI receiver block from
> > Synopsys. Let's enable the driver for it.
> > 
> > Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> > Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
> > ---
> >  arch/arm64/configs/defconfig | 2 ++
> >  1 file changed, 2 insertions(+)
> > 
> > diff --git a/arch/arm64/configs/defconfig
> > b/arch/arm64/configs/defconfig
> > index cb7da4415599..3dccc9e1c4aa 100644
> > --- a/arch/arm64/configs/defconfig
> > +++ b/arch/arm64/configs/defconfig
> > @@ -859,6 +859,8 @@ CONFIG_VIDEO_SAMSUNG_EXYNOS_GSC=m
> >  CONFIG_VIDEO_SAMSUNG_S5P_JPEG=m
> >  CONFIG_VIDEO_SAMSUNG_S5P_MFC=m
> >  CONFIG_VIDEO_SUN6I_CSI=m
> > +CONFIG_VIDEO_SYNOPSYS_HDMIRX=m
> > +CONFIG_VIDEO_SYNOPSYS_HDMIRX_LOAD_DEFAULT_EDID=y
> 
> I do not believe it is a good idea to default to y for this option.
> 
> The EDID depends on the specific device you make, and you should
> think carefully about whether the default EDID fits the needs of the
> device.
> 
> So if you want the default EDID, then you should manually select it
> and not have it autoselected.

Following up here, from the device maker perspective sure, but I'm not
sure this is the best choice for generic Linux distribution. As of
today, pretty much no userspace capture software knows about this,
meaning the device will not work out of the box in OBS, GStreamer,
Ffmpeg, Web Browsers. In comparison, if you pick any UVC HDMI capture,
it just work, with a default EDID that covers the range of
capabilities, which in this case are defined by the SoC.

Whatever we make as a choice, will always be the wrong choice for
someone, though I expect this to be a lot easier to change for
"specialized" implementation. Now, since there is no reason you can't
do a specilized implementation on generic Linux distro, and because you
might disagree with me, perhaps a compromise is to also add a module
parameter, so that there is a run-time override to this.

Nicolas

> 
> Regards,
> 
> 	Hans
> 
> >  CONFIG_VIDEO_TI_J721E_CSI2RX=m
> >  CONFIG_VIDEO_HANTRO=m
> >  CONFIG_VIDEO_IMX219=m
> 
> 

-- 
Nicolas Dufresne
Principal Engineer at Collabora

