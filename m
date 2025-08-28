Return-Path: <linux-media+bounces-41211-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 00F20B39346
	for <lists+linux-media@lfdr.de>; Thu, 28 Aug 2025 07:50:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CE49E7A6AA6
	for <lists+linux-media@lfdr.de>; Thu, 28 Aug 2025 05:48:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50EC02765F3;
	Thu, 28 Aug 2025 05:50:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kerneltoast.com header.i=@kerneltoast.com header.b="ConIoOJW"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 274901EF397
	for <linux-media@vger.kernel.org>; Thu, 28 Aug 2025 05:50:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756360208; cv=none; b=uFI20qqbO1loaU92hk27CaBar6OcTPufsJQ/yThQNrDfn9Ummws60qeZ98nLvMzVF5TYmOR83H9aK3hi/qzwvlPuBhKkFtnMZJ6QlpUkZaCqdhwoYnfBcMSOgpJmM9ex8psig7SZbZjQEW5V8f0A1ZEK/md8xqsy/hvgqGR7aCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756360208; c=relaxed/simple;
	bh=F0gkpNpiTEA2wABFko6DKyFJdU7crFTml9Ubyssko00=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nueNELiZsBDZkRdoTx3NGRK2tTbJIuccJY4JYsfAKotburcg2ZQYwiBfUgHK+vJMUpg49VnaoLHv5ps4CDHzkN9wmYXZXgJQbdLNBr3Fwgn9ghz4KLYOPCdHZHayOVUEFnGFoWwIjYOIrQoPJljs4BrNRLh7WzX7Wqg7M7PYHc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kerneltoast.com; spf=pass smtp.mailfrom=kerneltoast.com; dkim=pass (2048-bit key) header.d=kerneltoast.com header.i=@kerneltoast.com header.b=ConIoOJW; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kerneltoast.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kerneltoast.com
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-7720c9e2900so747528b3a.0
        for <linux-media@vger.kernel.org>; Wed, 27 Aug 2025 22:50:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kerneltoast.com; s=google; t=1756360206; x=1756965006; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=u1s4FfqRKDOUWN6Ld/CL91P0ePv7wl1zC5Joy8ipjYI=;
        b=ConIoOJWE6I9s+0oBxsnSrEpXZB2owDrzho3YXHUEiDujHGUSLTe59ltmdOCL3MPAD
         Elh0h9EZRRVkPD3L1rn+zVeh4S4cNyNp3PsTRrqJfdEaf3hfe0r7tXTw4+os3BFbztf1
         Mn1RSIm1JkFpw6zw7RrwyRHB25Djlwi8BCPc5+KDAy2jgJwX3QngBBKZa3jJXJvHo/g0
         rg2d2mUwL5q9rqmg9yk5tSaD1R1pun2lLQD6XxOxRhrhkMBD17hv8W2kZMcs1MrPs1JO
         weDWSXlgabGgKmICgfCKbxYi2xxFFHbn9DmAXsN25DxUWtsOGsKMzrMol43wOvg+k29L
         3adA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756360206; x=1756965006;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u1s4FfqRKDOUWN6Ld/CL91P0ePv7wl1zC5Joy8ipjYI=;
        b=W9zRBgz1efz6s1EmdHxdTe9XMN8pb0Pux4oPIandqM5u37QsB2zBGf9ixsStlGnXgg
         xHqfBCszemDpaSFj0eGAoFCZheHR+A1GgXWOQmYEczBWogheCP+wbAYPLlq8Ml91QClI
         j2Q2BrX1Hf7YF4i2vvmhE6Wki8j61sIB7OMG3F20vWNcF4jtpM02RTlPpuS2xziqdyTF
         zub5zhuLmZn0Thw3A2BmD8+TPQgiIyX/zSCqDtomHx/UF7xXbxM98mYUzHfbu7XyM9E5
         doRa+EYmuw4dtd1T83d7yUwBza5IriusDQXx/vRX5wDPNlL8vFVM5h1Mq8IhYSCvrhxu
         kguQ==
X-Forwarded-Encrypted: i=1; AJvYcCVhYdy2Z0BNcsD/5DImSs75fPLPjjjsngTCx0o14XYxma9aa4qhAUw1qJrWVn4Pu0L2Cuug09LK9sFY3w==@vger.kernel.org
X-Gm-Message-State: AOJu0YznU/FtgKM2Q8Rwk2hQTvLdko7qSkdMlOmIC0CltDYWKdxh6Pvm
	8ZIvdh4oyoEMxOJWa+W8rqUIujYrjgim/guMBinMa5GlyQpJG756vWZbeEptrCn9oNJH
X-Gm-Gg: ASbGncsH2W2zvvzHLj5RBI3fRxwD8bqI/4KhtSRJvHDSV2h+MRPh82U5saneNNNePQo
	sj/F3GqiJoHN/OKmEXTMGlqxhUxrEoYtQNW3RX+eSMYXcWtlYsW4VBm6O+h60nRtEkWXMansok2
	5+4Npzxiq2puBUbJ4FmXGHnDUzimbH0AdTuElQocc9DhAPxEt53Qn2EQN1ZeMTCa+khCQUCUSMT
	zttMtaSU0rxDIq5G5uBkhjyaLOL+bINX+l7oM4vms0aVmj405/KBQe1TvqUKHAh9xSnYUlU2LTz
	YU0DIvbHeT6A1UTBRzIT8uoxucnB3kRURKdqB/HQSNulQKHzesCmp2uhVuYC9KPM/ZPVQX4h/9D
	rlNiaDfL/bUgchEboiT3LOV/ANmFNNz15gJTs
X-Google-Smtp-Source: AGHT+IGyFcmlu9PKZJuAXUZ2eaBHMjKG5KuS6pBlBz7RSeJq2X0th+9YOl3Ouks4QwXCuEFP+j4z5w==
X-Received: by 2002:a05:6a21:99a7:b0:240:15d2:aa7c with SMTP id adf61e73a8af0-24340cd2e3amr39325394637.36.1756360206173;
        Wed, 27 Aug 2025 22:50:06 -0700 (PDT)
Received: from sultan-box ([142.147.89.218])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b49d48ebe53sm11687013a12.53.2025.08.27.22.50.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Aug 2025 22:50:05 -0700 (PDT)
Date: Wed, 27 Aug 2025 22:50:02 -0700
From: Sultan Alsawaf <sultan@kerneltoast.com>
To: "Du, Bin" <bin.du@amd.com>
Cc: "mchehab@kernel.org" <mchehab@kernel.org>,
	"hverkuil@xs4all.nl" <hverkuil@xs4all.nl>,
	"laurent.pinchart+renesas@ideasonboard.com" <laurent.pinchart+renesas@ideasonboard.com>,
	"bryan.odonoghue@linaro.org" <bryan.odonoghue@linaro.org>,
	"sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>,
	"prabhakar.mahadev-lad.rj@bp.renesas.com" <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"Nirujogi, Pratap" <Pratap.Nirujogi@amd.com>,
	"Chan, Benjamin (Koon Pan)" <Benjamin.Chan@amd.com>,
	"Li, King" <King.Li@amd.com>,
	"Rosikopulos, Gjorgji" <Gjorgji.Rosikopulos@amd.com>,
	"Jawich, Phil" <Phil.Jawich@amd.com>,
	"Antony, Dominic" <Dominic.Antony@amd.com>,
	"Limonciello, Mario" <Mario.Limonciello@amd.com>,
	"Gong, Richard" <Richard.Gong@amd.com>,
	"Tsao, Anson" <anson.tsao@amd.com>
Subject: Re: [PATCH v2 0/8] Add AMD ISP4 driver
Message-ID: <aK_uCunEww-I5Jd7@sultan-box>
References: <20250618091959.68293-1-Bin.Du@amd.com>
 <aJ2H6CIyZvN8W2sS@sultan-box>
 <ed9deffd-296c-465b-ad8a-314ed0968390@amd.com>
 <aKfqVNk_WSEeBxlz@sultan-box>
 <1633b6cd-c84f-4cac-9f87-9dbfd0d2847c@amd.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1633b6cd-c84f-4cac-9f87-9dbfd0d2847c@amd.com>

On Wed, Aug 27, 2025 at 06:30:14PM +0800, Du, Bin wrote:
> On 8/22/2025 11:56 AM, Sultan Alsawaf wrote:
> > On Fri, Aug 22, 2025 at 10:23:48AM +0800, Du, Bin wrote:
> > > On 8/14/2025 2:53 PM, Sultan Alsawaf wrote:
> > > > On Wed, Jun 18, 2025 at 05:19:51PM +0800, Bin Du wrote:
> > > > > AMD ISP4 Key features:
> > > > > - Processes bayer raw data from the connected sensor and output them to different YUV formats
> > > > > - Downscale input image to different output image resolution
> > > > > - Pipeline to do image processing on the input image including demosaic, denoise, 3A, etc
> > > > 
> > > > BTW, another problem I have which I would love some help with: may I get the FW
> > > > commands for setting basic 3A parameters?
> > > > 
> > > > It seems like the default AE mode does frame-averaging, which is really
> > > > unsuitable for video calls on the webcam. My face is really underexposed as a
> > > > result during the daytime because there's a lot of ambient light in the
> > > > background.
> > > > 
> > > > The webcam on this laptop also has a very wide field of view, which makes my
> > > > face appear small and shows too much of the background. This also exacerbates
> > > > the AE problem.
> > > > 
> > > > I'm thinking CMD_ID_SET_ZOOM would fix the FOV problem, and then either
> > > > CMD_ID_AE_SET_MODE to change the AE mode or CMD_ID_AE_SET_REGION to set the AE
> > > > ROI would fix the exposure problem. What do you think?
> > > > 
> > > > Thanks,
> > > > Sultan
> > > 
> > > Thanks Sultan for the suggestion, sorry for the late response because we
> > > spent some time internally to discuss the feasibility.
> > 
> > Thanks for looking into this!
> > 
> > > Yes, it's really good suggestion. Because current V4l2 doesn't have standard
> > > ioctl for like region setting, to support it, besides adding FW command, new
> > > customized ioctl also needs be added and no existing APP can benefit from
> > > it. So our idea is not to add them to our current upstream driver, but we
> > > would be really glad to help you to enable them locally with dedicated
> > > thread, suppose it can help to improve the IQ with correct input setting
> > > like the correct ROI region, but we aren't sure because we didn't do that
> > > before on Linux and would really expect your test result and feedback.
> > 
> > I'm happy to help develop this and even help write the code. :)
> 
> Thank you very much for your consistent help, that's invaluable.

Of course! :)

> > For advanced functions that don't have a standard V4L2 control, maybe we can set
> > some defaults in the driver to improve the experience for front-facing cameras,
> > i.e. webcams.
> >
> > Depending on the features exposed by FW, maybe setting a ROI for AE isn't
> > necessary. Is it possible for the FW to do face detection and set 3A according
> > to the face landmarks/ROI?
> 
> Oh, so sad, our FW doesn't embed algorithm to do face detection. :(

Ah, that's unfortunate. :(

> > I think a lot of useful functionality can be put upstream just through V4L2,
> > like V4L2_CID_EXPOSURE_METERING to control the AE mode.
> 
> Yes, that's feasible, the consideration is if we add support to control AE
> mode, as a complete solution, then we have to add support to set again and
> exposure time in manual mode by FW command , besides that, extra work is
> also needed from QA to develop new testcases, all these together will cost
> more time. So, our current plan is first to upstream a version with basic
> functions, after that, we can submit incremental patches to add more
> features. Does it make sense?

Yes, I understand.

For now, what about just changing the default AE mode to center-weighted? I
think this would produce a big IQ improvement since the typical usecase for the
webcam is to show your face in the center of the frame. This change could even
be made in the firmware instead of the driver.

Or alternatively, HDR could be enabled by default.

What do you think?

Thanks,
Sultan

