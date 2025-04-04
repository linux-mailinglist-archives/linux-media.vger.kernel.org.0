Return-Path: <linux-media+bounces-29418-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 04318A7C185
	for <lists+linux-media@lfdr.de>; Fri,  4 Apr 2025 18:25:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 12DA6189946F
	for <lists+linux-media@lfdr.de>; Fri,  4 Apr 2025 16:25:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05E7420C478;
	Fri,  4 Apr 2025 16:25:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="lIFG05Ly"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 417B120ADD5;
	Fri,  4 Apr 2025 16:25:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743783925; cv=none; b=EOvCQ+C9Nf6KM4snE/eeCSNDmSqUAU0+p/pr8tiCIi+ozqNYBBvTrDs/F9NuTfxTLtWrSKT08d98/yrxIvn2Ot1rRYlOSKIVNXigT9kK7ZOyu1TTo/Vzr8T3XO6+QlrZG5JCq4f9DxflXbyFt3MRJ4nTaN7GBR8H6vWwZIJhDi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743783925; c=relaxed/simple;
	bh=DPKesb5zEufm5ZzxHksY/n1wcad6WX+VWC9xfDlF+90=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=syqgUkz37z3tCBnTqK6m5PIdRDZuEq6vFZ+GwidlDhsO3gtmEb45G0tIVGSnmZ5xV9YVfLiGIV1Xk+0pDCUCvTKBNY/6c3LVCSVQvL/lhm2f/1el4qpWD+BtZyLglfaHto9HEKdNcxlSgZAkKR7kw+jK6BsqOq23Nt3ySJLZvj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=lIFG05Ly; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1743783921;
	bh=DPKesb5zEufm5ZzxHksY/n1wcad6WX+VWC9xfDlF+90=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=lIFG05LyoSoDkuiDxZiNPzbpH10QW9uId0znLHEjJuSF4coYTaTDP7fDogFee97IW
	 O+kszdWoEd+qrdaoVTFfIitY7/Px4UFPItdD6/pq5rhVnl8zLGMaJwWYwngtGlNrgp
	 ymlqE0l1aNhGLYMKD7xCAVE24/6TMNthG5CZUITG+asvK8QSiW9QlKIyK98CFge1bb
	 93lglrT+4MwWf1N0uV5iBUd+xWCDPVvTRhy2dNgzjrcQUJO3HM72WU1dru/xK6j9fp
	 8bwDvXqfFR06fdsIpDFmt7/kW4VoggFyr1oOem+S7Xyqeh6QgC8xgALER9XIaKRkGJ
	 Cr0Kdin3DCYmQ==
Received: from [192.168.42.160] (mtl.collabora.ca [66.171.169.34])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9678D17E07F2;
	Fri,  4 Apr 2025 18:25:17 +0200 (CEST)
Message-ID: <91799a0e05deadc34b9aa688ba44c43c67011a0f.camel@collabora.com>
Subject: Re: [PATCH v13 0/6] Add Synopsys DesignWare HDMI RX Controller
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Tim Surber <me@timsurber.de>, Dmitry Osipenko	
 <dmitry.osipenko@collabora.com>, Hans Verkuil <hverkuil@xs4all.nl>, Shreeya
 Patel <shreeya.patel@collabora.com>, Heiko Stuebner <heiko@sntech.de>,
 Mauro Carvalho Chehab	 <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski	 <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, 	jose.abreu@synopsys.com, nelson.costa@synopsys.com,
 shawn.wen@rock-chips.com,  Sebastian Reichel
 <sebastian.reichel@collabora.com>
Cc: kernel@collabora.com, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, Christophe JAILLET
	 <christophe.jaillet@wanadoo.fr>, Diederik de Haas <didi.debian@cknow.org>
Date: Fri, 04 Apr 2025 12:25:16 -0400
In-Reply-To: <e0e144be-5cf9-4a79-a602-2ab2b7cd9aa1@timsurber.de>
References: <20250304085819.108067-1-dmitry.osipenko@collabora.com>
	 <78ff36f6-01a7-4df4-b653-c4509fb93af4@timsurber.de>
	 <1039aca7-89b9-44ef-9775-e7852e956362@timsurber.de>
	 <9b4b1e65-127d-422b-a359-a1d8e25652f9@xs4all.nl>
	 <88054acf-3051-414c-aef7-4c0f085d5182@collabora.com>
	 <47e022f4-1c1b-43c4-8f6c-bc1ff23ad39f@collabora.com>
	 <e0e144be-5cf9-4a79-a602-2ab2b7cd9aa1@timsurber.de>
Organization: Collabora Canada
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.56.0 (3.56.0-1.fc42) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Tim,

Le mercredi 05 mars 2025 à 11:41 +0100, Tim Surber a écrit :
> Hi,
> 
> so the 4:4:4 issue was just a gstreamer bug and it worked when I
> applied 
> an experimental fix [1].
> 
> So everything works for me using the default EDID now.
> 
> Tested-by: Tim Surber <me@timsurber.de>
> 
> [1]: 
> https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/8534

Thanks, I'll try and get this fix moving soon. I now have a RK3588 with
hacks that let me force YUV in the 3 subsampling, so I can easily
reproduce now.

Nicolas

p.s. I also hit some buffer starvation issues (inside GStreamer), for
which I will be sending a fix to this driver so GStreamer is aware of
the lost frames.

> 
> On 3/5/25 10:09, Dmitry Osipenko wrote:
> > On 3/5/25 12:03, Dmitry Osipenko wrote:
> > > On 3/5/25 11:10, Hans Verkuil wrote:
> > > > On 05/03/2025 01:59, Tim Surber wrote:
> > > > > Hi Dmitry,
> > > > > 
> > > > > I did some more testing. That the Apple TV did not work was a
> > > > > bit
> > > > > misleading.
> > > > > 
> > > > > It was just, that the Apple TV defaulted to 4:4:4 Chroma
> > > > > which does not
> > > > > work at all for me. (The same happens using the vendor
> > > > > driver).
> > > > > 
> > > > > When I changed the EDID to match the vendor driver the HDMI
> > > > > handshake
> > > > > happened with 4:2:0 chroma, where I could verify even 4k60fps
> > > > > using your
> > > > > driver, nice!
> > > > > 
> > > > > So the remaining problems I see are:
> > > > > - 4:4:4 chroma not working in any resolution
> > > > > - 4:2:2 and RGB not working in 4k60fps (is this a hardware
> > > > > limitation?)
> > > > > 
> > > > > A possible workaround could be to disable these non supported
> > > > > formats in
> > > > > the default EDID.
> > > > I would like to merge this driver this week, since otherwise it
> > > > will likely
> > > > slip to v6.16. So if there is a working EDID, perhaps it can be
> > > > used for now,
> > > > and later on it can be patched if there is a better EDID.
> > > > 
> > > > Would this EDID work? Tim, can you try this?
> > > > 
> > > > v4l2-ctl --set-edid type=hdmi-4k-600mhz,ycbcr444,ycbcr422
> > > > 
> > > > Alternatively, if there is indeed a HW limitation that prevents
> > > > 4kp60 to work,
> > > > try this:
> > > > 
> > > > v4l2-ctl --set-edid type=hdmi-4k-300mhz,ycbcr444,ycbcr422
> > > > 
> > > > Whichever of the two works is what we can use as default EDID.
> > > 
> > > Disabling 444 and 422 is an option. Though, they work on my setup
> > > at
> > > 4k@60p.
> > > 
> > > In general, it often a challenge to get 4k@60p properly with any
> > > of
> > > these small board devices. 4k@60p works only using a short HDMI
> > > cable
> > > for me. Also, not everyone aware that the micro HDMI adapter
> > > needs to be
> > > compliant with HDMI 2.0 for 4k@60, that's why 300MHz is the
> > > default.
> > > 
> > > Will be nice to have the good EDID enabled by default in the
> > > defconfig.
> > > Dealing with problems like that will be a headache for majority
> > > of
> > > people, IMO.
> > 
> > BTW, I don't see it as a blocker. Driver works in general, new
> > issues
> > can be resolved with additional patches.
> > 

-- 
Nicolas Dufresne
Principal Engineer at Collabora

