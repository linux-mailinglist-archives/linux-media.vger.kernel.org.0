Return-Path: <linux-media+bounces-1283-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 462E17FBDA3
	for <lists+linux-media@lfdr.de>; Tue, 28 Nov 2023 16:05:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 736661C20C93
	for <lists+linux-media@lfdr.de>; Tue, 28 Nov 2023 15:05:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E8A65C8FF;
	Tue, 28 Nov 2023 15:04:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b="S3gSFWPq"
X-Original-To: linux-media@vger.kernel.org
Received: from meesny.iki.fi (meesny.iki.fi [195.140.195.201])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EEFE2199
	for <linux-media@vger.kernel.org>; Tue, 28 Nov 2023 07:04:50 -0800 (PST)
Received: from hillosipuli.retiisi.eu (185-9-10-242.cust.suomicom.net [185.9.10.242])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by meesny.iki.fi (Postfix) with ESMTPSA id 4Sfm2g2JsczyTW;
	Tue, 28 Nov 2023 17:04:40 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
	t=1701183886;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ptHvVlKfmF8dkIVmdWfp9Gc42zlFWrOpYBvRuWxnEBc=;
	b=S3gSFWPqzBrXJnd4IV2KYnMTMmoH1pNmniV76YbOI1SX1IhRVZZY3trML4G0/jNXIbUR8c
	RXVCX5iRthZNd5NVlPg29JR6dot7iW0qereFqSKNjsERlhvdvJ1MDivmJw6/N8kprG8l1H
	2kvaQSBlHYWwxXXmXSwmJYWN1Z6dDAM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=meesny; t=1701183886;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ptHvVlKfmF8dkIVmdWfp9Gc42zlFWrOpYBvRuWxnEBc=;
	b=XNwEOiNIDen1qKjmyCtSbrZ9Iicrg4BLkOAi11hOIU0QWKlf3WivgqgfKCucrAUnPexFXd
	42vne/4XZ13K9HIy2lxV6e9j44O06+2gJDbOlGGx07uSC4qAjKLGswbfsLVhoWMRn79hLL
	IbPWUXBm4C4D2RQmFBy5NmmMGR3Sd/c=
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1701183886; a=rsa-sha256; cv=none;
	b=tEkuVL9efafuxpxkElNUXbGiW7z4OtVOMQgC1EADkUF+0MCCQiX/FRm6ybc6MnvX8SmJ5X
	UsFZ1Z7x5mXARUfGDZ2d55wXm2wossjPWl7eckUHHhunNOLAcYd+0HlOcr3y22CybsYhft
	lqq08/Fhg+xcDWgosXfWqTV7NuvQUpY=
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 61B79634C93;
	Tue, 28 Nov 2023 17:04:39 +0200 (EET)
Date: Tue, 28 Nov 2023 15:04:39 +0000
From: Sakari Ailus <sakari.ailus@iki.fi>
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: Hugues Fruchet <hugues.fruchet@st.com>, linux-media@vger.kernel.org
Subject: Re: [GIT PULL FOR 6.8] V4L2 sub-device API changes plus new drivers
Message-ID: <ZWYBhxWJMlpbtE5f@valkosipuli.retiisi.eu>
References: <ZWXVYqYXYQvUnEjp@valkosipuli.retiisi.eu>
 <78dd2d05-5634-459b-82d7-bb125f873703@xs4all.nl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <78dd2d05-5634-459b-82d7-bb125f873703@xs4all.nl>

Hi Hans,

On Tue, Nov 28, 2023 at 03:55:07PM +0100, Hans Verkuil wrote:
> Hi Sakari,
> 
> On 28/11/2023 12:56, Sakari Ailus wrote:
> > Hi Mauro, Hans,
> > 
> > Here are a bunch of new drivers (Thine ISP, gc2145 sensor driver, dcmipp
> > camera interface driver) and an init_cfg pad op change to init_state
> > internal op. Included is also the media tree portion of the DisCo for
> > Imaging support and a new fwnode property API function, needed by the Thine
> > ISP driver. Also a number of fixes and improvements to the mipid02 and
> > vgxy61 drivers are included --- they also depend on the sub-device API
> > changes.
> > 
> > Please pull.
> > 
> > 
> > The following changes since commit 3b8551e73271fc375b15c887db54ad31686eb2ea:
> > 
> >   media: wave5: add OF and V4L_MEM2MEM_DRIVERS dependencies (2023-11-24 14:11:22 +0100)
> > 
> > are available in the Git repository at:
> > 
> >   git://linuxtv.org/sailus/media_tree.git tags/for-6.8-4-signed
> > 
> > for you to fetch changes up to 710fd99e818be5dc946f689a05971c2a9a1c3b8d:
> > 
> >   media: stm32-dcmipp: STM32 DCMIPP camera interface driver (2023-11-28 12:31:47 +0200)
> > 
> > ----------------------------------------------------------------
> > V4L2 patches for 6.8
> > 
> > ----------------------------------------------------------------
> > Alain Volmat (15):
> >       dt-bindings: vendor-prefixes: Add prefix for GalaxyCore Inc.
> >       dt-bindings: media: i2c: add galaxycore,gc2145 dt-bindings
> >       media: i2c: gc2145: Galaxy Core GC2145 sensor support
> >       media: i2c: st-mipid02: correct format propagation
> >       media: i2c: st-mipid02: add usage of v4l2_get_link_freq
> >       media: i2c: st-mipid02: don't keep track of streaming status
> >       media: i2c: st-mipid02: use cci_* helpers for register access.
> >       media: i2c: st-mipid02: use active state to store pad formats
> >       media: i2c: st-mipid02: use mipi-csi macro for data-type
> >       media: i2c: st-mipid02: removal of unused link_frequency variable
> >       media: i2c: st-mipid02: add Y8 format support
> >       media: i2c: st-vgxy61: Add V4L2_SUBDEV_FL_HAS_EVENTS and subscribe hooks
> >       media: i2c: st-vgxy61: add v4l2_fwnode ctrls parse and addition
> >       dt-bindings: media: add bindings for stm32 dcmipp
> >       media: MAINTAINERS: add entry for STM32 DCMIPP driver
> > 
> > Hugues Fruchet (1):
> >       media: stm32-dcmipp: STM32 DCMIPP camera interface driver
> 
> I'm getting these kerneldoc warnings/errors in dcmipp-common:
> 
> drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-common.h:59: error: Cannot parse struct or union!
> drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-common.h:106: warning: Function parameter or member 'pads_flag' not described in 'dcmipp_pads_init'
> drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-common.h:106: warning: Excess function parameter 'pads_flags' description in 'dcmipp_pads_init'
> drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-common.h:147: warning: Function parameter or member 'handler' not described in 'dcmipp_ent_sd_register'
> drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-common.h:147: warning: Function parameter or member 'thread_fn' not described in 'dcmipp_ent_sd_register'
> 
> It is likely best to resolve this in a follow-up patch. Hugues, can you take
> a look at that?
> 
> In addition, this PR conflicts with the "[PATCH] media: vsp1: Remove unbalanced
> .s_stream(0) calls" vsp1 v6.7 fix: that was merged in mainline yesterday, but this
> PR was created without that patch.
> 
> I plan to merge v6.7-rc4 into staging on Monday, so perhaps the best way forward
> is if you can apply that fix to your tree, then add the patches from this PR on top
> of that, resolving the conflict. Then I can merge the updated PR on Monday. There
> are no other issues with this PR, it passed all other tests.

I'll send a new version, probably tomorrow, after rebasing on the current
media stage tree.

-- 
Regards,

Sakari Ailus

