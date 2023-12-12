Return-Path: <linux-media+bounces-2216-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B6C580E99B
	for <lists+linux-media@lfdr.de>; Tue, 12 Dec 2023 12:06:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9E1691C20B1A
	for <lists+linux-media@lfdr.de>; Tue, 12 Dec 2023 11:06:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB01E5CD18;
	Tue, 12 Dec 2023 11:05:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b="dJiQ9hKZ"
X-Original-To: linux-media@vger.kernel.org
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [185.185.170.37])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BDED7AB
	for <linux-media@vger.kernel.org>; Tue, 12 Dec 2023 03:05:51 -0800 (PST)
Received: from hillosipuli.retiisi.eu (2a00-1190-d1dd-0-c641-1eff-feae-163c.v6.cust.suomicom.net [IPv6:2a00:1190:d1dd:0:c641:1eff:feae:163c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4SqG4Y4h3kz49Q05;
	Tue, 12 Dec 2023 13:05:49 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
	t=1702379149;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vST25mNNGP40wfgVj0i3xS9myN+61OWtSfZD07OFvrA=;
	b=dJiQ9hKZ6JEeN6h5CuixIbC3sKzgFpT3mS11VkP7bxYWSMV5rhgMvMFK+O8wuEsPKnv6y1
	bgGsEns7fWpGCq4QyK+P8mVdQt//DPUaslifq+47pzB+ob5dx/hP7o46apWRlZL62vipxw
	NDllpPAiawg72UyolNWV9+agShirpRcBIG9boNMLlljlaBtiMEmLGSPzPcnfRDCIjJb7Cb
	xMRD+Gtmd6u5AZdQ4hOX9mEnQibSevDee9wjiR3rLN8IaflcdJ0eOxBEib515bG5jFmpsM
	Zf4c9/M+PcK2eo1SRp8xJ9izWEznzljbwbiRBwxdXBwcwufs/8mu42JvxAApbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=lahtoruutu; t=1702379149;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vST25mNNGP40wfgVj0i3xS9myN+61OWtSfZD07OFvrA=;
	b=om9cQcY0sony0KDdWkxlgOnqTbxiRwdeXKfQPE0cjq094yF8EYCQcxSmzaYmofJyEmslrs
	bFNfU96HpwhNl8l9hVm+3rIoFIfzSL06bLaq5QisUNB352YJd3JwaqHBq7yP+yCxw81yn9
	9Kwl7z/zufTlhtpiYQljXKBLScaSufrsIU4YM7Lsgj2KYvlP5A+qub/0lg8ppA/kmc4BjB
	EGzbyWxxA6mUPiDL0hykaswaEZyxLAdFABsKGWpWHsXTPveDQw13mfYafyFdRzFXTBghGu
	A/XKVkieBSzcN1i37Oyjrbn744U4dfjwIaW2FF2PjgoQuiW+bKt+dS+tj0uXhA==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1702379149; a=rsa-sha256;
	cv=none;
	b=vK762uS5dwI3/vqY2DN/EZ/6KZwyRmFu6eKnvF8dVHFitZV6x9NHs0wH855zfxEz7c6TH1
	9N3dUb01gUjI+iRai7c3AO8ALNbTD2ZAaS2nRud/8cld4kp8+7nXPkDDxvELYHDSgBtaRZ
	ibqmztCOa+eOQEJvrXB9Aq1AgLqmTz+NoOZs4lR0PqJJygmprSt+sGbNl9U8a75oi3kEvU
	tLT7icjTIuMtbubk1CIdLi2ULTkFrzEcNElHv7SMoZTbWMpUofoiwNzbel32XnqSzdcrWS
	Mi2StPTvV0UBSxPmrEY/Hw5j3uLShrfu/KRWBmmIdM10iC8wX5gSJ0Lg9ff+wQ==
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 29C3D634C93;
	Tue, 12 Dec 2023 13:05:49 +0200 (EET)
Date: Tue, 12 Dec 2023 11:05:48 +0000
From: Sakari Ailus <sakari.ailus@iki.fi>
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org
Subject: Re: [GIT PULL FOR 6.8] Some fixes and new drivers, too
Message-ID: <ZXg-jP23tEaj_RJk@valkosipuli.retiisi.eu>
References: <ZXgW25b9tV_YE7Mq@valkosipuli.retiisi.eu>
 <03b41071-e477-44c0-83f8-c90ce545c6de@xs4all.nl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <03b41071-e477-44c0-83f8-c90ce545c6de@xs4all.nl>

Hi Hans,

On Tue, Dec 12, 2023 at 10:09:31AM +0100, Hans Verkuil wrote:
> On 12/12/2023 09:16, Sakari Ailus wrote:
> > Hi Hans, Mauro,
> > 
> > Here's a nice set of some fixes as well as new drivers that some of which,
> > in turn, depend on the fixes. In particular, there are a few sensors
> > (imx290 in particular) that have little endian registers, either just some
> > or all, and this was missed in V4L2 CCI conversion earlier on. Another
> > driver also needs these CCI_*LE() macros later in the set.
> > 
> > There are new drivers for Galaxycore gc0308, Omnivision ov64a30 camera
> > sensor as well as Avnet Alvium camera modules.
> > 
> > Miscellaneous fixes exist for imx335, imx214, imx415, ov2740 as well as the
> > IPU bridge.
> > 
> > Documentation improvements for camera sensors are included, too.
> > 
> > Please pull.
> 
> Running the build script gives me 3 sparse warnings:
> 
> drivers/media/i2c/imx415.c:402:30: warning: decimal constant 2376000000 is between LONG_MAX and ULONG_MAX. For C99 that means long long, C90 compilers are very likely to produce unsigned long (and a
> warning) here
> drivers/media/i2c/imx415.c:417:30: warning: decimal constant 2376000000 is between LONG_MAX and ULONG_MAX. For C99 that means long long, C90 compilers are very likely to produce unsigned long (and a
> warning) here
> drivers/media/i2c/imx415.c:432:30: warning: decimal constant 2376000000 is between LONG_MAX and ULONG_MAX. For C99 that means long long, C90 compilers are very likely to produce unsigned long (and a
> warning) here
> 
> (2376000000 should be 2376000000ULL)

But the C standard used here is C99, not C90. So there doesn't seem to be
an actual problem here.

Although I agree with you in explicitly specifying the type.

> 
> and one smatch warning:
> 
> drivers/media/i2c/alvium-csi2.c:2429 alvium_probe() warn: passing zero to 'dev_err_probe'

There seems to be an issue not catched during the review. The ret
assignment is one line too late, so dev_err_probe() still gets the wrong
value. This indeed should be fixed.

> 
> checkpatch.pl --strict also complains about a few things:
> 
> 0001-media-atmel-isi-Fix-crash-due-to-missing-subdev-in-s.patch:
> 
> ERROR: Please use git commit description style 'commit <12+ chars of sha1> ("<title line>")' - ie: 'commit bc0e8d91feec ("media: v4l: subdev: Switch to stream-aware state functions")'
> #8:
> As a result of converting to the stream-aware state functions, commit

This is a warning from checkpatch.pl which is apparently produced by commit
being on the previous line. I.e. a false positive.

> 
> 0009-media-i2c-Add-support-for-alvium-camera.patch
> 
> A bunch of:
> 
> CHECK: Assignment operator '=' should be on the previous line
> #1120: FILE: drivers/media/i2c/alvium-csi2.c:1027:
> +       alvium->is_mipi_fmt_avail[ALVIUM_BIT_YUV420_8_LEG]
> +                                 = avail_fmt->yuv420_8_leg;
> 
> and:
> 
> CHECK: Unnecessary parentheses around '!alvium_csi2_fmts[fmt].is_raw'
> #1174: FILE: drivers/media/i2c/alvium-csi2.c:1081:
> +               if ((!alvium_csi2_fmts[fmt].is_raw) ||
> +                   (alvium->is_bay_avail[alvium_csi2_fmts[fmt].bay_av_bit]))
> 
> CHECK: Unnecessary parentheses around '!alvium_csi2_fmts[fmt].is_raw'
> #1191: FILE: drivers/media/i2c/alvium-csi2.c:1098:
> +               if ((!alvium_csi2_fmts[fmt].is_raw) ||
> +                   (alvium->is_bay_avail[alvium_csi2_fmts[fmt].bay_av_bit])) {
> 
> WARNING: Improper SPDX comment style for 'drivers/media/i2c/alvium-csi2.h', please use '/*' instead
> #2630: FILE: drivers/media/i2c/alvium-csi2.h:1:
> +// SPDX-License-Identifier: GPL-2.0
> 
> WARNING: Missing or malformed SPDX-License-Identifier tag in line 1
> #2630: FILE: drivers/media/i2c/alvium-csi2.h:1:
> +// SPDX-License-Identifier: GPL-2.0
> 
> 0037-media-dt-bindings-Add-OmniVision-OV64A40.patch:
> 
> WARNING: Co-developed-by and Signed-off-by: name/email do not match
> #11:
> Co-developed-by: Lee Jackson <lee.jackson@arducam.com>
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> 
> 0038-media-i2c-Add-driver-for-OmniVision-OV64A40.patch:
> 
> WARNING: Co-developed-by and Signed-off-by: name/email do not match
> #11:
> Co-developed-by: Lee Jackson <lee.jackson@arducam.com>
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> 
> 0039-media-i2c-imx415-Convert-to-new-CCI-register-access-.patch:

I'll ask Jacopo to fix these.

But overall, apart from the missing SoB lines (I missed this while looking
at the long list of warnings the patches produce), is there something that
prevents merging this? I agree there are bugs, but this all is still found
at the time the PR has been sent which makes remedying them very difficult.

> 
> CHECK: Alignment should match open parenthesis
> #461: FILE: drivers/media/i2c/imx415.c:462:
> +               cci_write(sensor->regmap, IMX415_BLKLEVEL,
> +                                  IMX415_BLKLEVEL_DEFAULT, &ret);

-- 
Regards,

Sakari Ailus

