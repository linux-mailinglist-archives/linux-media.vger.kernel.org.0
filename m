Return-Path: <linux-media+bounces-47579-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 003CBC7A957
	for <lists+linux-media@lfdr.de>; Fri, 21 Nov 2025 16:39:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 06A443A0FD6
	for <lists+linux-media@lfdr.de>; Fri, 21 Nov 2025 15:39:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F20C36D514;
	Fri, 21 Nov 2025 15:39:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kerneltoast.com header.i=@kerneltoast.com header.b="YfPJDDpU"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F4822C0281
	for <linux-media@vger.kernel.org>; Fri, 21 Nov 2025 15:39:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763739554; cv=none; b=J767VErTtcArvQ8KdV/zvaS2cnalD0lXfwqRxqp/v1wP4zujmzNDLU0T6PStR4B40IDQD85e3TWtroToWUZCw5NPEKSLx82pJAa0RO+ccBsyrKKjgSJ1RUHCi23yQC5UtKyDz4wMY4uD1NN5qgJFM9V4h7K7SYVFKsuSjTv0yDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763739554; c=relaxed/simple;
	bh=kd2pqO7ku2l+Wtk4Q9RutlYCOYwu/GcVd1HxS2LUsDI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q4MtdBPezYAQFodqXhsTeXJSzYPWoLoZD1bBBcBgBvLdb40j38MEKmkPOBw5KC847DvIfQmgKPPqZRWcLVSStOy1hcddTpaLTWFS3bh8HssUcmkYfJtZhcTXBMadX8qymdnkA72axklRVj1ubbhAk6aDxl9rdjTmCebZr+4/tm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kerneltoast.com; spf=pass smtp.mailfrom=kerneltoast.com; dkim=pass (2048-bit key) header.d=kerneltoast.com header.i=@kerneltoast.com header.b=YfPJDDpU; arc=none smtp.client-ip=74.125.82.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kerneltoast.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kerneltoast.com
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-2a45877bd5eso3177848eec.0
        for <linux-media@vger.kernel.org>; Fri, 21 Nov 2025 07:39:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kerneltoast.com; s=google; t=1763739547; x=1764344347; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HY3Z5FxD2LmU489vwnt9+L2ZpNRb+CdeKJoFoLV9790=;
        b=YfPJDDpUgbOxW417LxSFpK9eTr+0u2oOGIA3L+g8MWm+fCkbYehxEW5ScxD4ebj22D
         7wIYH0SCk0huKhwfZk6mTN1g4oLbzKmCsF6docMtCGUMFAC6zefK2MPU7aeajpsce314
         bF0gKCYUVyFdDelSgvK+2SuMTJ0rEI5AsEqBLNypcbE8IgGFIGeKVT7LEsiNCIvxhlD4
         daS+cSTsXETUdEI7TIvpTwe3KFjZnGdwiaOvc0aqdl/a4/dfdwmA9mVX4PSWKsJ+w4u0
         fh+DoAsFj4d3tJPZr2eou1Q0CK3ZXGdeitok8YxWzF295/D0E567oMIP7pLgkNVkQtYT
         0v/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763739547; x=1764344347;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HY3Z5FxD2LmU489vwnt9+L2ZpNRb+CdeKJoFoLV9790=;
        b=XJyceKaDSfC62duPnotc/Wh8H78cbgyml6NQVRaHcfZRIsxC9Wp4+Fp5fSSXDYr4Bi
         bvgIc3HLrWgoxXMpNIp0obHDNN0n3IjdWYYW87NPGWmld08dWgIA9zBomV0/JDs+NPnD
         Ge9F4UI4N9f3POFe8YqhFwby/ZAqcLYDF70prNS5EywNDwwCxUzi7L/IwcH5lnkLXHNp
         5A4KaZuAZMuOtrXSzP6rBNxYUHX5tS2j0C7LiSZwP9+O6eoCMTm+xsGcj6fxCMh+jMIs
         UGJAXHm/lEjNi3Y9JNhodHlvJIA/Jc12k9k+o7MMgDYGwCIre2RQ5THDNwG7yMAv0cr5
         HLxQ==
X-Forwarded-Encrypted: i=1; AJvYcCW53Lltr5Nlcio5351WxzO+pm86L8PQGvquhd4W/3QiV4dGlmpmggiz+XUqOwzEfNX2zM7vHWl3OUYEAg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxlGUDBP+voNMlQrOx6thnm+I8f92LcDojYTVGYsD/L+/Wlh8nl
	sS3q2JEvOYicCT7TxPvZJU4cOmOpANQAZ5+NqL7NxLzvdM06P0BFJCzkePFgFh3UlINX
X-Gm-Gg: ASbGncvMtfC0wIlLrLNh8f5HD4xD09jcNt134FDF48g1pZ+l4Hrj0JyqN5gLXjoXWF1
	AOrg6HtYowk+plvE2t0m5+sevpoAKC3uxiZs36OBM4dNwr2N/KtJQ7Jr1OSvAUUPk/PkelV12Lg
	g5PYpI2IkqWPd/WOwEx0P2D3q/+Y8X42deUd9M0aKQu3z8iC1ng3loxqYT8Irk4AI0Zmx7PJobq
	LA5jpYJLZ7i165/HMxaK7YBayd3TVx2QtseRLWNQQfWnPnbTdaNfjuCAdJAsziQAw0guCe7bBIX
	Ar75vl80uuy5yhcgzpR2nBrdmaQFqlKYY6ucj4e3iAu8WFTH/MMAP6pbTatdPT5spxevvsSPCFG
	8kMwiQzkmd/d9X1m2wqi8+68N7CgcLjy25GhjsVfC+1wE4ybqgyj2zsZfrnu47hfzrODfmged2J
	Y3j7g2MXePOFTmzA==
X-Google-Smtp-Source: AGHT+IEfksXsW1M/+58Lq6BHAItqVjkpb8OAHRWQPKg5R4NSOjF2sdMerMJ0fRbbu3J0GJ/yoXkyIg==
X-Received: by 2002:a05:7301:fc83:b0:2a7:721:f615 with SMTP id 5a478bee46e88-2a707220f28mr1327884eec.12.1763739546952;
        Fri, 21 Nov 2025 07:39:06 -0800 (PST)
Received: from sultan-box ([142.147.89.233])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2a6fc4f6671sm26761632eec.3.2025.11.21.07.39.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Nov 2025 07:39:06 -0800 (PST)
Date: Fri, 21 Nov 2025 07:39:02 -0800
From: Sultan Alsawaf <sultan@kerneltoast.com>
To: Mario Limonciello <mario.limonciello@amd.com>
Cc: "Du, Bin" <bin.du@amd.com>, mchehab@kernel.org, hverkuil@xs4all.nl,
	laurent.pinchart+renesas@ideasonboard.com,
	bryan.odonoghue@linaro.org, sakari.ailus@linux.intel.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	pratap.nirujogi@amd.com, benjamin.chan@amd.com, king.li@amd.com,
	gjorgji.rosikopulos@amd.com, Phil.Jawich@amd.com,
	Dominic.Antony@amd.com, richard.gong@amd.com, anson.tsao@amd.com
Subject: Re: [PATCH v5 0/7] Add AMD ISP4 driver
Message-ID: <aSCHlvWMYEdRb2ey@sultan-box>
References: <aRPH1hV7bEfagPtE@sultan-box>
 <aRPhMCwJjpMqAROG@sultan-box>
 <d9afc6db-fd8a-4069-a8a8-1e2d74c1db3a@amd.com>
 <aRQyAdyiQjhsC11h@sultan-box>
 <aRQ5aA4Gus4iCVLp@sultan-box>
 <591efd28-805a-4a13-b7e2-0f78a3ca3eac@amd.com>
 <aRwhuNmPRlPGxIia@sultan-box>
 <8288a5b3-6e56-4c9a-a772-99ca36bb7c52@amd.com>
 <aSAg1MUVZtDlCC96@sultan-box>
 <546a8d8e-514b-4f6b-bf46-1ec0c9974e7e@amd.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <546a8d8e-514b-4f6b-bf46-1ec0c9974e7e@amd.com>

On Fri, Nov 21, 2025 at 08:32:34AM -0600, Mario Limonciello wrote:
> 
> 
> On 11/21/2025 2:20 AM, Sultan Alsawaf wrote:
> > On Wed, Nov 19, 2025 at 06:14:17PM +0800, Du, Bin wrote:
> > > 
> > > 
> > > On 11/18/2025 3:35 PM, Sultan Alsawaf wrote:
> > > > On Wed, Nov 12, 2025 at 06:21:33PM +0800, Du, Bin wrote:
> > > > > 
> > > > > 
> > > > > On 11/12/2025 3:38 PM, Sultan Alsawaf wrote:
> > > > > > On Tue, Nov 11, 2025 at 11:06:41PM -0800, Sultan Alsawaf wrote:
> > > > > > > On Wed, Nov 12, 2025 at 02:32:51PM +0800, Du, Bin wrote:
> > > > > > > > Thanks Sultan for your information.
> > > > > > > > 
> > > > > > > > On 11/12/2025 9:21 AM, Sultan Alsawaf wrote:
> > > > > > > > > On Tue, Nov 11, 2025 at 03:33:42PM -0800, Sultan Alsawaf wrote:
> > > > > > > > > > On Tue, Nov 11, 2025 at 05:58:10PM +0800, Du, Bin wrote:
> > > > > > > > > > > 
> > > > > > > > > > > On 11/11/2025 5:05 PM, Sultan Alsawaf wrote:
> > > > > > > > > > > 
> > > > > > > > > > > > On Mon, Nov 10, 2025 at 05:46:28PM +0800, Du, Bin wrote:
> > > > > > > > > > > > > Thank you, Sultan, for your time, big effort, and constant support.
> > > > > > > > > > > > > Apologies for my delayed reply for being occupied a little with other
> > > > > > > > > > > > > matters.
> > > > > > > > > > > > > 
> > > > > > > > > > > > > On 11/10/2025 4:33 PM, Sultan Alsawaf wrote:
> > > > > > > > > > > > > > Hi Bin,
> > > > > > > > > > > > > > 
> > > > > > > > > > > > > > On Wed, Nov 05, 2025 at 01:25:58AM -0800, Sultan Alsawaf wrote:
> > > > > > > > > > > > > > > Hi Bin,
> > > > > > > > > > > > > > > 
> > > > > > > > > > > > > > > To expedite review, I've attached a patch containing a bunch of fixes I've made
> > > > > > > > > > > > > > > on top of v5. Most of my changes should be self-explanatory; feel free to ask
> > > > > > > > > > > > > > > further about specific changes if you have any questions.
> > > > > > > > > > > > > > > 
> > > > > > > > > > > > > > > I haven't had a chance to review all of the v4 -> v5 changes yet, but I figured
> > > > > > > > > > > > > > > I should send what I've got so far.
> > > > > > > > > > > > > > > 
> > > > > > > > > > > > > > > FYI, there is a regression in isp4if_dequeue_buffer() where the bufq lock isn't
> > > > > > > > > > > > > > > protecting the list_del() anymore. I also checked the compiler output when using
> > > > > > > > > > > > > > > guard() versus scoped_guard() in that function and there is no difference:
> > > > > > > > > > > > > > > 
> > > > > > > > > > > > > > >         sha1sum:
> > > > > > > > > > > > > > >         5652a0306da22ea741d80a9e03a787d0f71758a8  isp4_interface.o // guard()
> > > > > > > > > > > > > > >         5652a0306da22ea741d80a9e03a787d0f71758a8  isp4_interface.o // scoped_guard()
> > > > > > > > > > > > > > > 
> > > > > > > > > > > > > > > So guard() should be used there again, which I've done in my patch.
> > > > > > > > > > > > > > > 
> > > > > > > > > > > > > > > I also have a few questions:
> > > > > > > > > > > > > > > 
> > > > > > > > > > > > > > > 1. Does ISP FW provide a register interface to disable the IRQ? If so, it is
> > > > > > > > > > > > > > >          faster to use that than using disable_irq_nosync() to disable the IRQ from
> > > > > > > > > > > > > > >          the CPU's side.
> > > > > > > > > > > > > > > 
> > > > > > > > > > > > > > > 2. When the IRQ is re-enabled in isp4sd_fw_resp_func(), is there anything
> > > > > > > > > > > > > > >          beforehand to mask all pending interrupts from the ISP so that there isn't a
> > > > > > > > > > > > > > >          bunch of stale interrupts firing as soon the IRQ is re-enabled?
> > > > > > > > > > > > > > > 
> > > > > > > > > > > > > > > 3. Is there any risk of deadlock due to the stream kthread racing with the ISP
> > > > > > > > > > > > > > >          when the ISP posts a new response _after_ the kthread determines there are no
> > > > > > > > > > > > > > >          more new responses but _before_ the enable_irq() in isp4sd_fw_resp_func()?
> > > > > > > > > > > > > > > 
> > > > > > > > > > > > > > > 4. Why are some lines much longer than before? It seems inconsistent that now
> > > > > > > > > > > > > > >          there is a mix of several lines wrapped to 80 cols and many lines going
> > > > > > > > > > > > > > >          beyond 80 cols. And there are multiple places where code is wrapped before
> > > > > > > > > > > > > > >          reaching 80 cols even with lots of room left, specifically for cases where it
> > > > > > > > > > > > > > >          wouldn't hurt readability to put more characters onto each line.
> > > > > > > > > > > > > > 
> > > > > > > > > > > > > > I've attached a new, complete patch of changes to apply on top of v5. You may
> > > > > > > > > > > > > > ignore the incomplete patch from my previous email and use the new one instead.
> > > > > > > > > > > > > > 
> > > > > > > > > > > > > > I made many changes and also answered questions 1-3 myself.
> > > > > > > > > > > > > > 
> > > > > > > > > > > > > > Please apply this on top of v5 and let me know if you have any questions.
> > > > > > > > > > > > > > 
> > > > > > > > > > > > > 
> > > > > > > > > > > > > Sure, will review, apply and test your patch accordingly. Your contribution
> > > > > > > > > > > > > is greatly appreciated, will let you know if there is any question or
> > > > > > > > > > > > > problem.
> > > > > > > > > > > > > 
> > > > > > > > > > > > > > BTW, I noticed a strange regression in v5 even without any of my changes: every
> > > > > > > > > > > > > > time you use cheese after using it one time, the video will freeze after 30-60
> > > > > > > > > > > > > > seconds with this message printed to dmesg:
> > > > > > > > > > > > > >         [ 2032.716559] amd_isp_capture amd_isp_capture: -><- fail respid unknown respid(0x30002)
> > > > > > > > > > > > > > 
> > > > > > > > > > > > > > And the video never unfreezes. I haven't found the cause for the regression yet;
> > > > > > > > > > > > > > can you try to reproduce it?
> > > > > > > > > > > > > > 
> > > > > > > > > > > > > 
> > > > > > > > > > > > > Really weird, we don't see this issue either in dev or QA test. Is it 100%
> > > > > > > > > > > > > reproducible and any other fail or err in the log?
> > > > > > > > > > > > 
> > > > > > > > > > > > Yes, it's 100% reproducible. There's no other message in dmesg, only that one.
> > > > > > > > > > > > 
> > > > > > > > > > > > Sometimes there is a stop stream error when I close cheese after it froze:
> > > > > > > > > > > > 
> > > > > > > > > > > >        [  656.540307] amd_isp_capture amd_isp_capture: fail to disable stream
> > > > > > > > > > > >        [  657.046633] amd_isp_capture amd_isp_capture: fail to stop steam
> > > > > > > > > > > >        [  657.047224] amd_isp_capture amd_isp_capture: disabling streaming failed (-110)
> > > > > > > > > > > > 
> > > > > > > > > > > > When I revert to v4 I cannot reproduce it at all. It seems to be something in
> > > > > > > > > > > > v4 -> v5 that is not fixed by any of my changes.
> > > > > > > > > > > > 
> > > > > > > > > > > 
> > > > > > > > > > > Hi Sultan, could you please try following modifications on top of v5 to see
> > > > > > > > > > > if it helps?
> > > > > > > > > > > 
> > > > > > > > > > > diff --git a/drivers/media/platform/amd/isp4/isp4_fw_cmd_resp.h
> > > > > > > > > > > b/drivers/media/platform/amd/isp4/isp4_fw_cmd_resp.h
> > > > > > > > > > > index 39c2265121f9..d571b3873edb 100644
> > > > > > > > > > > --- a/drivers/media/platform/amd/isp4/isp4_fw_cmd_resp.h
> > > > > > > > > > > +++ b/drivers/media/platform/amd/isp4/isp4_fw_cmd_resp.h
> > > > > > > > > > > @@ -97,7 +97,7 @@
> > > > > > > > > > > 
> > > > > > > > > > > #define ADDR_SPACE_TYPE_GPU_VA          4
> > > > > > > > > > > 
> > > > > > > > > > > -#define FW_MEMORY_POOL_SIZE             (200 * 1024 * 1024)
> > > > > > > > > > > +#define FW_MEMORY_POOL_SIZE             (100 * 1024 * 1024)
> > > > > > > > > > > 
> > > > > > > > > > > /*
> > > > > > > > > > >       * standard ISP mipicsi=>isp
> > > > > > > > > > > diff --git a/drivers/media/platform/amd/isp4/isp4_subdev.c
> > > > > > > > > > > b/drivers/media/platform/amd/isp4/isp4_subdev.c
> > > > > > > > > > > index 248d10076ae8..acbc80aa709e 100644
> > > > > > > > > > > --- a/drivers/media/platform/amd/isp4/isp4_subdev.c
> > > > > > > > > > > +++ b/drivers/media/platform/amd/isp4/isp4_subdev.c
> > > > > > > > > > > @@ -697,7 +697,7 @@ static int isp4sd_stop_resp_proc_threads(struct
> > > > > > > > > > > isp4_subdev *isp_subdev)
> > > > > > > > > > >             return 0;
> > > > > > > > > > > }
> > > > > > > > > > > 
> > > > > > > > > > > -static int isp4sd_pwroff_and_deinit(struct isp4_subdev *isp_subdev)
> > > > > > > > > > > +static int isp4sd_pwroff_and_deinit(struct isp4_subdev *isp_subdev, bool
> > > > > > > > > > > irq_enabled)
> > > > > > > > > > > {
> > > > > > > > > > >             struct isp4sd_sensor_info *sensor_info = &isp_subdev->sensor_info;
> > > > > > > > > > >             unsigned int perf_state = ISP4SD_PERFORMANCE_STATE_LOW;
> > > > > > > > > > > @@ -716,8 +716,9 @@ static int isp4sd_pwroff_and_deinit(struct isp4_subdev
> > > > > > > > > > > *isp_subdev)
> > > > > > > > > > >                     return 0;
> > > > > > > > > > >             }
> > > > > > > > > > > 
> > > > > > > > > > > -       for (int i = 0; i < ISP4SD_MAX_FW_RESP_STREAM_NUM; i++)
> > > > > > > > > > > -               disable_irq(isp_subdev->irq[i]);
> > > > > > > > > > > +       if (irq_enabled)
> > > > > > > > > > > +               for (int i = 0; i < ISP4SD_MAX_FW_RESP_STREAM_NUM; i++)
> > > > > > > > > > > +                       disable_irq(isp_subdev->irq[i]);
> > > > > > > > > > > 
> > > > > > > > > > >             isp4sd_stop_resp_proc_threads(isp_subdev);
> > > > > > > > > > >             dev_dbg(dev, "isp_subdev stop resp proc streads suc");
> > > > > > > > > > > @@ -813,7 +814,7 @@ static int isp4sd_pwron_and_init(struct isp4_subdev
> > > > > > > > > > > *isp_subdev)
> > > > > > > > > > > 
> > > > > > > > > > >             return 0;
> > > > > > > > > > > err_unlock_and_close:
> > > > > > > > > > > -       isp4sd_pwroff_and_deinit(isp_subdev);
> > > > > > > > > > > +       isp4sd_pwroff_and_deinit(isp_subdev, false);
> > > > > > > > > > >             return -EINVAL;
> > > > > > > > > > > }
> > > > > > > > > > > 
> > > > > > > > > > > @@ -985,7 +986,7 @@ static int isp4sd_set_power(struct v4l2_subdev *sd, int
> > > > > > > > > > > on)
> > > > > > > > > > >             if (on)
> > > > > > > > > > >                     return isp4sd_pwron_and_init(isp_subdev);
> > > > > > > > > > >             else
> > > > > > > > > > > -               return isp4sd_pwroff_and_deinit(isp_subdev);
> > > > > > > > > > > +               return isp4sd_pwroff_and_deinit(isp_subdev, true);
> > > > > > > > > > > }
> > > > > > > > > > > 
> > > > > > > > > > > static const struct v4l2_subdev_core_ops isp4sd_core_ops = {
> > > > > > > > > > 
> > > > > > > > > > No difference sadly; same symptoms as before. FYI, your email client broke the
> > > > > > > > > > patch formatting so I couldn't apply it; it hard wrapped some lines to 80 cols,
> > > > > > > > > > replaced tabs with spaces, and removed leading spaces on each context line, so I
> > > > > > > > > > had to apply it manually. To confirm I applied it correctly, here is my diff:
> > > > > > > > > > 
> > > > > > > > > > diff --git a/drivers/media/platform/amd/isp4/isp4_fw_cmd_resp.h b/drivers/media/platform/amd/isp4/isp4_fw_cmd_resp.h
> > > > > > > > > > index 39c2265121f9..d571b3873edb 100644
> > > > > > > > > > --- a/drivers/media/platform/amd/isp4/isp4_fw_cmd_resp.h
> > > > > > > > > > +++ b/drivers/media/platform/amd/isp4/isp4_fw_cmd_resp.h
> > > > > > > > > > @@ -97,7 +97,7 @@
> > > > > > > > > >      #define ADDR_SPACE_TYPE_GPU_VA          4
> > > > > > > > > > -#define FW_MEMORY_POOL_SIZE             (200 * 1024 * 1024)
> > > > > > > > > > +#define FW_MEMORY_POOL_SIZE             (100 * 1024 * 1024)
> > > > > > > > > >      /*
> > > > > > > > > >       * standard ISP mipicsi=>isp
> > > > > > > > > > diff --git a/drivers/media/platform/amd/isp4/isp4_subdev.c b/drivers/media/platform/amd/isp4/isp4_subdev.c
> > > > > > > > > > index 4bd2ebf0f694..500ef0af8a41 100644
> > > > > > > > > > --- a/drivers/media/platform/amd/isp4/isp4_subdev.c
> > > > > > > > > > +++ b/drivers/media/platform/amd/isp4/isp4_subdev.c
> > > > > > > > > > @@ -669,7 +669,7 @@ static int isp4sd_stop_resp_proc_threads(struct isp4_subdev *isp_subdev)
> > > > > > > > > >      	return 0;
> > > > > > > > > >      }
> > > > > > > > > > -static int isp4sd_pwroff_and_deinit(struct isp4_subdev *isp_subdev)
> > > > > > > > > > +static int isp4sd_pwroff_and_deinit(struct isp4_subdev *isp_subdev, bool irq_enabled)
> > > > > > > > > >      {
> > > > > > > > > >      	struct isp4sd_sensor_info *sensor_info = &isp_subdev->sensor_info;
> > > > > > > > > >      	unsigned int perf_state = ISP4SD_PERFORMANCE_STATE_LOW;
> > > > > > > > > > @@ -688,8 +688,9 @@ static int isp4sd_pwroff_and_deinit(struct isp4_subdev *isp_subdev)
> > > > > > > > > >      		return 0;
> > > > > > > > > >      	}
> > > > > > > > > > -	for (int i = 0; i < ISP4SD_MAX_FW_RESP_STREAM_NUM; i++)
> > > > > > > > > > -		disable_irq(isp_subdev->irq[i]);
> > > > > > > > > > +	if (irq_enabled)
> > > > > > > > > > +		for (int i = 0; i < ISP4SD_MAX_FW_RESP_STREAM_NUM; i++)
> > > > > > > > > > +			disable_irq(isp_subdev->irq[i]);
> > > > > > > > > >      	isp4sd_stop_resp_proc_threads(isp_subdev);
> > > > > > > > > >      	dev_dbg(dev, "isp_subdev stop resp proc streads suc");
> > > > > > > > > > @@ -785,7 +786,7 @@ static int isp4sd_pwron_and_init(struct isp4_subdev *isp_subdev)
> > > > > > > > > >      	return 0;
> > > > > > > > > >      err_unlock_and_close:
> > > > > > > > > > -	isp4sd_pwroff_and_deinit(isp_subdev);
> > > > > > > > > > +	isp4sd_pwroff_and_deinit(isp_subdev, false);
> > > > > > > > > >      	return -EINVAL;
> > > > > > > > > >      }
> > > > > > > > > > @@ -957,7 +958,7 @@ static int isp4sd_set_power(struct v4l2_subdev *sd, int on)
> > > > > > > > > >      	if (on)
> > > > > > > > > >      		return isp4sd_pwron_and_init(isp_subdev);
> > > > > > > > > >      	else
> > > > > > > > > > -		return isp4sd_pwroff_and_deinit(isp_subdev);
> > > > > > > > > > +		return isp4sd_pwroff_and_deinit(isp_subdev, true);
> > > > > > > > > >      }
> > > > > > > > > >      static const struct v4l2_subdev_core_ops isp4sd_core_ops = {
> > > > > > > > > > 
> > > > > > > > > > > On the other hand, please also add the patch in amdgpu which sets *bo to
> > > > > > > > > > > NULL in isp_kernel_buffer_alloc() which you mentioned in another thread.
> > > > > > > > > > 
> > > > > > > > > > Yep, I have been doing all v5 testing with that patch applied.
> > > > > > > > > > 
> > > > > > > > > > BTW, I have verified the IRQ changes are not the cause for the regression; I
> > > > > > > > > > tested with IRQs kept enabled all the time and the issue still occurs.
> > > > > > > > > > 
> > > > > > > > > > I did observe that ISP stops sending interrupts when the video stream freezes.
> > > > > > > > > > And, if I replicate the bug enough times, it seems to permanently break FW until
> > > > > > > > > > a full machine reboot. Reloading amd_capture with the v4 driver doesn't recover
> > > > > > > > > > the ISP when this happens.
> > > > > > > > > > 
> > > > > > > > > > As an improvement to the driver, can we do a hard reset of ISP on driver probe?
> > > > > > > > > > I am assuming hardware doesn't need too long to settle after hard reset, maybe
> > > > > > > > > > a few hundred milliseconds? This would ensure ISP FW is always in a working
> > > > > > > > > > state when the driver is loaded.
> > > > > > > > > > 
> > > > > > > > 
> > > > > > > > Actually, each time the camera is activated, the ISP driver powers on the
> > > > > > > > ISP and initiates its firmware from the beginning; when the camera is
> > > > > > > > closed, the ISP is powered off..
> > > > > > > 
> > > > > > > Hmm, well I am able to put the ISP in a completely unusable state that doesn't
> > > > > > > recover when I unload and reload amd_capture. Or maybe it is the sensor that is
> > > > > > > stuck in a broken state?
> > > > > > 
> > > > > > Here is the log output when I try to start cheese after unloading and reloading
> > > > > > amd_capture, where the ISP is in the broken state that requires rebooting the
> > > > > > laptop (annotated with notes of what I saw/did at each point in time):
> > > > > > 
> > > > > > ==> opened cheese
> > > > > > ==> cheese froze after a few seconds
> > > > > > ==> closed cheese
> > > > > >      [   34.570823] amd_isp_capture amd_isp_capture: fail to disable stream
> > > > > >      [   35.077503] amd_isp_capture amd_isp_capture: fail to stop steam
> > > > > >      [   35.077525] amd_isp_capture amd_isp_capture: disabling streaming failed (-110)
> > > > > > ==> unloaded amd_capture
> > > > > > ==> loaded amd_capture
> > > > > > ==> opened cheese
> > > > > >      [  308.039721] amd_isp_capture amd_isp_capture: ISP CCPU FW boot failed
> > > > > >      [  308.043961] amd_isp_capture amd_isp_capture: fail to start isp_subdev interface
> > > > > >      [  308.044188] amd_isp_capture amd_isp_capture: invalid mem_info
> > > > > >      [  308.044194] amd_isp_capture amd_isp_capture: invalid mem_info
> > > > > >      [  308.044196] amd_isp_capture amd_isp_capture: invalid mem_info
> > > > > >      [  308.044197] amd_isp_capture amd_isp_capture: invalid mem_info
> > > > > >      [  308.044198] amd_isp_capture amd_isp_capture: invalid mem_info
> > > > > >      [  308.044198] amd_isp_capture amd_isp_capture: invalid mem_info
> > > > > >      [  308.044199] amd_isp_capture amd_isp_capture: invalid mem_info
> > > > > >      [  308.044200] amd_isp_capture amd_isp_capture: invalid mem_info
> > > > > >      [  308.044200] amd_isp_capture amd_isp_capture: invalid mem_info
> > > > > >      [  308.044201] amd_isp_capture amd_isp_capture: invalid mem_info
> > > > > >      [  308.044202] amd_isp_capture amd_isp_capture: invalid mem_info
> > > > > >      [  308.065226] amd_isp_capture amd_isp_capture: power up isp fail -22
> > > > > >      [  308.174814] amd_isp_capture amd_isp_capture: ISP CCPU FW boot failed
> > > > > >      [  308.177807] amd_isp_capture amd_isp_capture: fail to start isp_subdev interface
> > > > > >      [  308.178036] amd_isp_capture amd_isp_capture: invalid mem_info
> > > > > >      [  308.178043] amd_isp_capture amd_isp_capture: invalid mem_info
> > > > > >      [  308.178044] amd_isp_capture amd_isp_capture: invalid mem_info
> > > > > >      [  308.178045] amd_isp_capture amd_isp_capture: invalid mem_info
> > > > > >      [  308.178046] amd_isp_capture amd_isp_capture: invalid mem_info
> > > > > >      [  308.178047] amd_isp_capture amd_isp_capture: invalid mem_info
> > > > > >      [  308.178048] amd_isp_capture amd_isp_capture: invalid mem_info
> > > > > >      [  308.178048] amd_isp_capture amd_isp_capture: invalid mem_info
> > > > > >      [  308.178049] amd_isp_capture amd_isp_capture: invalid mem_info
> > > > > >      [  308.178050] amd_isp_capture amd_isp_capture: invalid mem_info
> > > > > >      [  308.178050] amd_isp_capture amd_isp_capture: invalid mem_info
> > > > > >      [  308.198776] amd_isp_capture amd_isp_capture: power up isp fail -22
> > > > > >      [  308.306835] amd_isp_capture amd_isp_capture: ISP CCPU FW boot failed
> > > > > >      [  308.311533] amd_isp_capture amd_isp_capture: fail to start isp_subdev interface
> > > > > >      [  308.311723] amd_isp_capture amd_isp_capture: invalid mem_info
> > > > > >      [  308.311723] amd_isp_capture amd_isp_capture: invalid mem_info
> > > > > >      [  308.311724] amd_isp_capture amd_isp_capture: invalid mem_info
> > > > > >      [  308.311725] amd_isp_capture amd_isp_capture: invalid mem_info
> > > > > >      [  308.311725] amd_isp_capture amd_isp_capture: invalid mem_info
> > > > > >      [  308.311726] amd_isp_capture amd_isp_capture: invalid mem_info
> > > > > >      [  308.311726] amd_isp_capture amd_isp_capture: invalid mem_info
> > > > > >      [  308.311726] amd_isp_capture amd_isp_capture: invalid mem_info
> > > > > >      [  308.311727] amd_isp_capture amd_isp_capture: invalid mem_info
> > > > > >      [  308.311727] amd_isp_capture amd_isp_capture: invalid mem_info
> > > > > >      [  308.311727] amd_isp_capture amd_isp_capture: invalid mem_info
> > > > > >      [  308.335281] amd_isp_capture amd_isp_capture: power up isp fail -22
> > > > > > 
> > > > > 
> > > > > Thanks Sultan for the detailed info, I agree with you, tend to believe it
> > > > > may related to the sensor, I will follow up with the FW team to investigate
> > > > > further.
> > > > > 
> > > > > > > > > > Thanks,
> > > > > > > > > > Sultan
> > > > > > > > > 
> > > > > > > > > A small update: I reproduced the issue on v4, but it took several more cycles of
> > > > > > > > > closing/opening cheese and waiting 30s compared to v5.
> > > > > > > > > 
> > > > > > > > > Right now my best guess is that this is a timing issue with respect to FW that
> > > > > > > > > was exposed by the v5 changes. v5 introduced slight changes in code timing, like
> > > > > > > > > with the mutex locks getting replaced by spin locks.
> > > > > > > > > 
> > > > > > > > > I'll try to insert mdelays to see if I can expose the issue that way on v4.
> > > > > > > > > 
> > > > > > > > 
> > > > > > > > Could you kindly provide the FW used?
> > > > > > > 
> > > > > > >      commit a89515d3ff79f12099f7a51b0f4932b881b7720e
> > > > > > >      Author: Pratap Nirujogi <pratap.nirujogi@amd.com>
> > > > > > >      Date:   Thu Aug 21 15:40:45 2025 -0400
> > > > > > > 
> > > > > > >          amdgpu: Update ISP FW for isp v4.1.1
> > > > > > >          From internal git commit:
> > > > > > >          24557b7326e539183b3bc44cf8e1496c74d383d6
> > > > > > >          Signed-off-by: Pratap Nirujogi <pratap.nirujogi@amd.com>
> > > > > > > 
> > > > > > > Sultan
> > > > > > 
> > > > > > Sultan
> > > > > 
> > > > > -- 
> > > > > Regards,
> > > > > Bin
> > > > > 
> > > > 
> > > > Thanks, Bin. I looked deeper at the code and didn't find any reason the issue
> > > > could be due to the driver. Also, the problem happens outside of cheese for me
> > > > (like in Chromium with Zoom meetings), so v5 of the driver is pretty much
> > > > unusable for me until this issue is fixed. :(
> > > > 
> > > 
> > > Oh, really sad to hear that :(, there must be some difference between our
> > > platforms because we still can't reproduce the issue you mentioned, to help
> > > on this, would you share more info like your Ubuntu version, Kernel
> > > version/source, ISP driver version, BIOS version, .config used to build the
> > > kernel, FW: commit a89515d3ff79f12099f7a51b0f4932b881b7720e.
> > > Just wondering, if possible, could you provide the kernel image either so we
> > > can directly test on it. Also, the HW is not broken, right?
> > 
> > I figured out why you cannot reproduce the issue. You need to pass amd_iommu=off
> > on the kernel command line to trigger the issue.
> > 
> > The reason I am using amd_iommu=off is because this laptop otherwise doesn't
> > ever wake from suspend under Linux once it reaches the S0i3 state. The keyboard,
> > power button, and lid do not respond to wake up the laptop from suspend. This
> > happens 100% of the time once S0i3 is reached, and occurs on the OEM Ubuntu
> > image from HP as well. The only fix I have found is to pass amd_iommu=off, which
> > other owners of this laptop also found fixes the issue.
> 
> You're the first report I've heard of this.
> 
> Are you using storage encryption or a storage password of any kind (software
> or hardware) by chance?
> 
> If you are can you please describe it?
> 
> Also can you generate a report using amd-s2idle?  I don't think it's going
> to flag anything but I would like to confirm.

The issue is mentioned on a Reddit post [1]. A specific comment mentions
amd_iommu=off fixing the issue [2], which is where I got the idea to do that.

You will find conflicting reports about this issue online, with some people
saying it doesn't happen anymore after some kernel update [3], and others saying
it worked until something updated [4].

The reason for all the conflicting reports online is because this issue only
occurs when S0i3 is reached, and I suspect that no one realized there's a delay
before S0i3 is entered. Reaching S0i3 appears to take at least 60 seconds
*after* suspending the laptop. If S0i3 isn't entered, then you *can* wake the
laptop but there will always be this message indicating S0i3 wasn't hit:
  [  107.428836] amd_pmc AMDI000B:00: Last suspend didn't reach deepest state

I am using LUKS1 encryption on my storage (software encryption). However, I'm
not sure any of my configuration info is relevant because I reproduced the issue
from a live USB using HP's OEM Ubuntu image [5], with nothing else physically
plugged into the laptop and not connected to anything over WiFi or Bluetooth.

I had the thought of generating a report using amd-s2idle a couple months ago...
except I have no way to wake the machine from suspend at all. I have to hold the
the power button to do a hard shutdown. I tried using no_console_suspend but of
course userspace processes are frozen so systemd couldn't record anything for
me. I tried UART over USB and connected the output to another laptop but it
would only work for a few seconds right after booting up the laptop (could've
just been because I was using PL2303 serial converters, which aren't so great).

I have also tried several different combinations of settings toggled on/off in
the BIOS setup menu, as well as resetting to the factory default values, without
any change in behavior.

I'm at a loss on how I can retrieve some debug info for this issue. :/

[1] https://www.reddit.com/r/AMDLaptops/comments/1mmrlgz/hp_zbook_ultra_g1a_ubuntu_fully_working_now_or/
[2] https://www.reddit.com/r/AMDLaptops/comments/1mmrlgz/comment/nd4cldp/
[3] https://forum.level1techs.com/t/the-ultimate-arch-secureboot-guide-for-ryzen-ai-max-ft-hp-g1a-128gb-8060s-monster-laptop/230652#hibernate-suspend-and-kernel-versions-16
[4] https://www.reddit.com/r/AMDLaptops/comments/1mmrlgz/comment/nd1xbtd/
[5] https://ftp.hp.com/pub/softpaq/sp158501-159000/stella-noble-oem-24.04b-20250422-107.iso

Sultan

