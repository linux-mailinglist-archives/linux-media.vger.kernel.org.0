Return-Path: <linux-media+bounces-47603-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id A9225C7C383
	for <lists+linux-media@lfdr.de>; Sat, 22 Nov 2025 03:55:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id D58974E1C8A
	for <lists+linux-media@lfdr.de>; Sat, 22 Nov 2025 02:55:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A55702C158F;
	Sat, 22 Nov 2025 02:55:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kerneltoast.com header.i=@kerneltoast.com header.b="ZKBXwyWP"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 749E126E717
	for <linux-media@vger.kernel.org>; Sat, 22 Nov 2025 02:55:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763780119; cv=none; b=ZNgSOCKN8M2sSHnJLludnVSjEtIyy8A38Z9aOz9dRFj77JAG3UYTeAmoBPFwlgA7hdaxznG6ShgPk20m7wHNWsKAgoY9XHPrVrrDhRXcr9z7ApjIcyq/F0EKGeKyZOaZR/yCc8OF6BsIeY27GSh12bxtgfMWMtP8J3DqoMjJyng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763780119; c=relaxed/simple;
	bh=hkzXNzIeTlfVmRU29UmF9h+bdV+58KnmrXMVhKjnuek=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W6U0dsrblPi+TO5q7GkZQa+++Gd1tv8k2lOBF80IEyJh2XaAgPNF/RwaSow/Ko2n9PSk9whkCf/qNtBamV8M0UNNB9g/S7qxusQJ7s4cTXBuRoI/8NYt7r1l9Y+O99px2/nopn1XmRqLRkqvTSSB//AFIDLRPAg3+IzWrR/omKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kerneltoast.com; spf=pass smtp.mailfrom=kerneltoast.com; dkim=pass (2048-bit key) header.d=kerneltoast.com header.i=@kerneltoast.com header.b=ZKBXwyWP; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kerneltoast.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kerneltoast.com
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3438231df5fso3300672a91.2
        for <linux-media@vger.kernel.org>; Fri, 21 Nov 2025 18:55:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kerneltoast.com; s=google; t=1763780116; x=1764384916; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dOLBmR+rKBKfA2PoMqb5v+zoiczVSFGXmi9IMB5kxU8=;
        b=ZKBXwyWPupQE8AE6V+dnd9d+Px9JfzQ4eOskRnUzu9MH2BvulirY3qeZ70K03XhcdM
         xBNrSE9kygTflvYV4G/10ihyZRERY5DSdZEAVl/Y2QspQowjyfGVPsJmQerrenzBZMwX
         q0DJrx7MAS+kMEJh/RQnQrXOMilgbzn8gzWPdCwECD982Nn1+XBu1Cq2guVpO9CZt35K
         6OxxDJwHShJRb+1ln6lBozQShTRf5CBRnShTS20O3WrjclXGcUs4oLV8AOVGRYaXiIli
         saDKWJ3Au0ZINSo3CjzOxX0o8bZfep4W85hyeA7xpgRP0Vdx52Qciua20JUTEBABKMcx
         Sp2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763780116; x=1764384916;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dOLBmR+rKBKfA2PoMqb5v+zoiczVSFGXmi9IMB5kxU8=;
        b=RqsXYBTWLYxWKHJ1iOtJms5ldtVH6Sdo1/ieJn7RraagGKlfUrKDNsvhWboPosqClg
         v4bWgfOfqK7vzrOkJNzT3XNLJOSiYF8ouBNvxUAGT1imv/sSdhTi2tenhU0SDWV38FlL
         M2JhtLJi4oAQnux5C9XRjHJe07ZCWtmbB7BMorh+InuSLuJOkOpHo6YpwOupiy8Tii5S
         zf+9C+TcE0zzitP2qHb9OejT9dWiN2hDz9NEiRIL6QA50DNHYPEr3fUXK+iIS7NUOUuv
         t0h+Tn8qpzgTegOJsWwmSyvIoVx1glKS8WCrE7bp3/V3HZeOPUzMLmN7ZkfoHOlFn0vG
         oYyg==
X-Forwarded-Encrypted: i=1; AJvYcCXGVemmyIkEkJIY5xPDsQe4ct+vZ+a7783FbdBMcWo95y6GoDCu4YdjcAR5G/LgwgdUG1G8LpoJST4veg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwAX5x7KR0NGDLFFj+uuTevIZ/FLSPDgG7KbgRKuBhczelGN+mI
	OB8XWdAnFuUu/48NrToqTq9P7APc6Mn4+ja2aord1ILXMfRhS2oVaiIY4PPhNEc6SX+y
X-Gm-Gg: ASbGncuBBb3KSf9C2upC3eAlcavur6w6qN3M55Snq1kktZr6GBj24MrWg3sg9mwH4Ob
	FR0B5i3OdGJQypeXBszulWgK3vMNAmKM1lPz72VJ5gNGKdopS4bTdHoLu/kRrqhDMJ2fDAp/VyK
	Tzalpk36tIFpipOUyGgCIjpTyHXeaTPFVjn9OhFww8dLp9qjM3juTbb9BscSjP15eQsiKS0RDkE
	lrD+Yrv64bf4qbHK85czyrMDQNcgXjUp1LO0XzKGVmgIB34hiduW7KMEBjJqX/9cwK+feF8jpJY
	rxB3bMSjj9TW2UiNborw4Cp9AqbID2LFFiQNFG76iajnEa9JsXw5mAeFKhHDRYXzNUfjLcAJUDv
	GzUVQ3QCSDMu5qpg8nbQBjyjkg9CrgteQhrLfXP1s6U70oJZLJpyhpFfVdg9ImyoneQ1sh45i0z
	hE2FMRXGkWn2TLWw==
X-Google-Smtp-Source: AGHT+IF8aoz9l5dcdqCz9Nhhyr73wj8KHPLM+ZNAgHg5L8E4zYgBpIs/gHP3aD6b4QY/d8Ksmdi8bg==
X-Received: by 2002:a05:7022:2495:b0:11b:9386:7ed1 with SMTP id a92af1059eb24-11c9d871499mr2353843c88.46.1763780115133;
        Fri, 21 Nov 2025 18:55:15 -0800 (PST)
Received: from sultan-box ([142.147.89.237])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11c93de6d5csm22075128c88.4.2025.11.21.18.55.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Nov 2025 18:55:14 -0800 (PST)
Date: Fri, 21 Nov 2025 18:55:10 -0800
From: Sultan Alsawaf <sultan@kerneltoast.com>
To: "Du, Bin" <bin.du@amd.com>
Cc: mchehab@kernel.org, hverkuil@xs4all.nl,
	laurent.pinchart+renesas@ideasonboard.com,
	bryan.odonoghue@linaro.org, sakari.ailus@linux.intel.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	pratap.nirujogi@amd.com, benjamin.chan@amd.com, king.li@amd.com,
	gjorgji.rosikopulos@amd.com, Phil.Jawich@amd.com,
	Dominic.Antony@amd.com, mario.limonciello@amd.com,
	richard.gong@amd.com, anson.tsao@amd.com
Subject: Re: [PATCH v5 0/7] Add AMD ISP4 driver
Message-ID: <aSEmDlwKH6PT3i4y@sultan-box>
References: <e09207fd-1879-44c8-a5c1-838a140dcd4b@amd.com>
 <aRPH1hV7bEfagPtE@sultan-box>
 <aRPhMCwJjpMqAROG@sultan-box>
 <d9afc6db-fd8a-4069-a8a8-1e2d74c1db3a@amd.com>
 <aRQyAdyiQjhsC11h@sultan-box>
 <aRQ5aA4Gus4iCVLp@sultan-box>
 <591efd28-805a-4a13-b7e2-0f78a3ca3eac@amd.com>
 <aRwhuNmPRlPGxIia@sultan-box>
 <8288a5b3-6e56-4c9a-a772-99ca36bb7c52@amd.com>
 <aSAg1MUVZtDlCC96@sultan-box>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="uu5/KLTtljtJFo9n"
Content-Disposition: inline
In-Reply-To: <aSAg1MUVZtDlCC96@sultan-box>


--uu5/KLTtljtJFo9n
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Nov 21, 2025 at 12:20:36AM -0800, Sultan Alsawaf wrote:
> On Wed, Nov 19, 2025 at 06:14:17PM +0800, Du, Bin wrote:
> > 
> > 
> > On 11/18/2025 3:35 PM, Sultan Alsawaf wrote:
> > > On Wed, Nov 12, 2025 at 06:21:33PM +0800, Du, Bin wrote:
> > > > 
> > > > 
> > > > On 11/12/2025 3:38 PM, Sultan Alsawaf wrote:
> > > > > On Tue, Nov 11, 2025 at 11:06:41PM -0800, Sultan Alsawaf wrote:
> > > > > > On Wed, Nov 12, 2025 at 02:32:51PM +0800, Du, Bin wrote:
> > > > > > > Thanks Sultan for your information.
> > > > > > > 
> > > > > > > On 11/12/2025 9:21 AM, Sultan Alsawaf wrote:
> > > > > > > > On Tue, Nov 11, 2025 at 03:33:42PM -0800, Sultan Alsawaf wrote:
> > > > > > > > > On Tue, Nov 11, 2025 at 05:58:10PM +0800, Du, Bin wrote:
> > > > > > > > > > 
> > > > > > > > > > On 11/11/2025 5:05 PM, Sultan Alsawaf wrote:
> > > > > > > > > > 
> > > > > > > > > > > On Mon, Nov 10, 2025 at 05:46:28PM +0800, Du, Bin wrote:
> > > > > > > > > > > > Thank you, Sultan, for your time, big effort, and constant support.
> > > > > > > > > > > > Apologies for my delayed reply for being occupied a little with other
> > > > > > > > > > > > matters.
> > > > > > > > > > > > 
> > > > > > > > > > > > On 11/10/2025 4:33 PM, Sultan Alsawaf wrote:
> > > > > > > > > > > > > Hi Bin,
> > > > > > > > > > > > > 
> > > > > > > > > > > > > On Wed, Nov 05, 2025 at 01:25:58AM -0800, Sultan Alsawaf wrote:
> > > > > > > > > > > > > > Hi Bin,
> > > > > > > > > > > > > > 
> > > > > > > > > > > > > > To expedite review, I've attached a patch containing a bunch of fixes I've made
> > > > > > > > > > > > > > on top of v5. Most of my changes should be self-explanatory; feel free to ask
> > > > > > > > > > > > > > further about specific changes if you have any questions.
> > > > > > > > > > > > > > 
> > > > > > > > > > > > > > I haven't had a chance to review all of the v4 -> v5 changes yet, but I figured
> > > > > > > > > > > > > > I should send what I've got so far.
> > > > > > > > > > > > > > 
> > > > > > > > > > > > > > FYI, there is a regression in isp4if_dequeue_buffer() where the bufq lock isn't
> > > > > > > > > > > > > > protecting the list_del() anymore. I also checked the compiler output when using
> > > > > > > > > > > > > > guard() versus scoped_guard() in that function and there is no difference:
> > > > > > > > > > > > > > 
> > > > > > > > > > > > > >        sha1sum:
> > > > > > > > > > > > > >        5652a0306da22ea741d80a9e03a787d0f71758a8  isp4_interface.o // guard()
> > > > > > > > > > > > > >        5652a0306da22ea741d80a9e03a787d0f71758a8  isp4_interface.o // scoped_guard()
> > > > > > > > > > > > > > 
> > > > > > > > > > > > > > So guard() should be used there again, which I've done in my patch.
> > > > > > > > > > > > > > 
> > > > > > > > > > > > > > I also have a few questions:
> > > > > > > > > > > > > > 
> > > > > > > > > > > > > > 1. Does ISP FW provide a register interface to disable the IRQ? If so, it is
> > > > > > > > > > > > > >         faster to use that than using disable_irq_nosync() to disable the IRQ from
> > > > > > > > > > > > > >         the CPU's side.
> > > > > > > > > > > > > > 
> > > > > > > > > > > > > > 2. When the IRQ is re-enabled in isp4sd_fw_resp_func(), is there anything
> > > > > > > > > > > > > >         beforehand to mask all pending interrupts from the ISP so that there isn't a
> > > > > > > > > > > > > >         bunch of stale interrupts firing as soon the IRQ is re-enabled?
> > > > > > > > > > > > > > 
> > > > > > > > > > > > > > 3. Is there any risk of deadlock due to the stream kthread racing with the ISP
> > > > > > > > > > > > > >         when the ISP posts a new response _after_ the kthread determines there are no
> > > > > > > > > > > > > >         more new responses but _before_ the enable_irq() in isp4sd_fw_resp_func()?
> > > > > > > > > > > > > > 
> > > > > > > > > > > > > > 4. Why are some lines much longer than before? It seems inconsistent that now
> > > > > > > > > > > > > >         there is a mix of several lines wrapped to 80 cols and many lines going
> > > > > > > > > > > > > >         beyond 80 cols. And there are multiple places where code is wrapped before
> > > > > > > > > > > > > >         reaching 80 cols even with lots of room left, specifically for cases where it
> > > > > > > > > > > > > >         wouldn't hurt readability to put more characters onto each line.
> > > > > > > > > > > > > 
> > > > > > > > > > > > > I've attached a new, complete patch of changes to apply on top of v5. You may
> > > > > > > > > > > > > ignore the incomplete patch from my previous email and use the new one instead.
> > > > > > > > > > > > > 
> > > > > > > > > > > > > I made many changes and also answered questions 1-3 myself.
> > > > > > > > > > > > > 
> > > > > > > > > > > > > Please apply this on top of v5 and let me know if you have any questions.
> > > > > > > > > > > > > 
> > > > > > > > > > > > 
> > > > > > > > > > > > Sure, will review, apply and test your patch accordingly. Your contribution
> > > > > > > > > > > > is greatly appreciated, will let you know if there is any question or
> > > > > > > > > > > > problem.
> > > > > > > > > > > > 
> > > > > > > > > > > > > BTW, I noticed a strange regression in v5 even without any of my changes: every
> > > > > > > > > > > > > time you use cheese after using it one time, the video will freeze after 30-60
> > > > > > > > > > > > > seconds with this message printed to dmesg:
> > > > > > > > > > > > >        [ 2032.716559] amd_isp_capture amd_isp_capture: -><- fail respid unknown respid(0x30002)
> > > > > > > > > > > > > 
> > > > > > > > > > > > > And the video never unfreezes. I haven't found the cause for the regression yet;
> > > > > > > > > > > > > can you try to reproduce it?
> > > > > > > > > > > > > 
> > > > > > > > > > > > 
> > > > > > > > > > > > Really weird, we don't see this issue either in dev or QA test. Is it 100%
> > > > > > > > > > > > reproducible and any other fail or err in the log?
> > > > > > > > > > > 
> > > > > > > > > > > Yes, it's 100% reproducible. There's no other message in dmesg, only that one.
> > > > > > > > > > > 
> > > > > > > > > > > Sometimes there is a stop stream error when I close cheese after it froze:
> > > > > > > > > > > 
> > > > > > > > > > >       [  656.540307] amd_isp_capture amd_isp_capture: fail to disable stream
> > > > > > > > > > >       [  657.046633] amd_isp_capture amd_isp_capture: fail to stop steam
> > > > > > > > > > >       [  657.047224] amd_isp_capture amd_isp_capture: disabling streaming failed (-110)
> > > > > > > > > > > 
> > > > > > > > > > > When I revert to v4 I cannot reproduce it at all. It seems to be something in
> > > > > > > > > > > v4 -> v5 that is not fixed by any of my changes.
> > > > > > > > > > > 
> > > > > > > > > > 
> > > > > > > > > > Hi Sultan, could you please try following modifications on top of v5 to see
> > > > > > > > > > if it helps?
> > > > > > > > > > 
> > > > > > > > > > diff --git a/drivers/media/platform/amd/isp4/isp4_fw_cmd_resp.h
> > > > > > > > > > b/drivers/media/platform/amd/isp4/isp4_fw_cmd_resp.h
> > > > > > > > > > index 39c2265121f9..d571b3873edb 100644
> > > > > > > > > > --- a/drivers/media/platform/amd/isp4/isp4_fw_cmd_resp.h
> > > > > > > > > > +++ b/drivers/media/platform/amd/isp4/isp4_fw_cmd_resp.h
> > > > > > > > > > @@ -97,7 +97,7 @@
> > > > > > > > > > 
> > > > > > > > > > #define ADDR_SPACE_TYPE_GPU_VA          4
> > > > > > > > > > 
> > > > > > > > > > -#define FW_MEMORY_POOL_SIZE             (200 * 1024 * 1024)
> > > > > > > > > > +#define FW_MEMORY_POOL_SIZE             (100 * 1024 * 1024)
> > > > > > > > > > 
> > > > > > > > > > /*
> > > > > > > > > >      * standard ISP mipicsi=>isp
> > > > > > > > > > diff --git a/drivers/media/platform/amd/isp4/isp4_subdev.c
> > > > > > > > > > b/drivers/media/platform/amd/isp4/isp4_subdev.c
> > > > > > > > > > index 248d10076ae8..acbc80aa709e 100644
> > > > > > > > > > --- a/drivers/media/platform/amd/isp4/isp4_subdev.c
> > > > > > > > > > +++ b/drivers/media/platform/amd/isp4/isp4_subdev.c
> > > > > > > > > > @@ -697,7 +697,7 @@ static int isp4sd_stop_resp_proc_threads(struct
> > > > > > > > > > isp4_subdev *isp_subdev)
> > > > > > > > > >            return 0;
> > > > > > > > > > }
> > > > > > > > > > 
> > > > > > > > > > -static int isp4sd_pwroff_and_deinit(struct isp4_subdev *isp_subdev)
> > > > > > > > > > +static int isp4sd_pwroff_and_deinit(struct isp4_subdev *isp_subdev, bool
> > > > > > > > > > irq_enabled)
> > > > > > > > > > {
> > > > > > > > > >            struct isp4sd_sensor_info *sensor_info = &isp_subdev->sensor_info;
> > > > > > > > > >            unsigned int perf_state = ISP4SD_PERFORMANCE_STATE_LOW;
> > > > > > > > > > @@ -716,8 +716,9 @@ static int isp4sd_pwroff_and_deinit(struct isp4_subdev
> > > > > > > > > > *isp_subdev)
> > > > > > > > > >                    return 0;
> > > > > > > > > >            }
> > > > > > > > > > 
> > > > > > > > > > -       for (int i = 0; i < ISP4SD_MAX_FW_RESP_STREAM_NUM; i++)
> > > > > > > > > > -               disable_irq(isp_subdev->irq[i]);
> > > > > > > > > > +       if (irq_enabled)
> > > > > > > > > > +               for (int i = 0; i < ISP4SD_MAX_FW_RESP_STREAM_NUM; i++)
> > > > > > > > > > +                       disable_irq(isp_subdev->irq[i]);
> > > > > > > > > > 
> > > > > > > > > >            isp4sd_stop_resp_proc_threads(isp_subdev);
> > > > > > > > > >            dev_dbg(dev, "isp_subdev stop resp proc streads suc");
> > > > > > > > > > @@ -813,7 +814,7 @@ static int isp4sd_pwron_and_init(struct isp4_subdev
> > > > > > > > > > *isp_subdev)
> > > > > > > > > > 
> > > > > > > > > >            return 0;
> > > > > > > > > > err_unlock_and_close:
> > > > > > > > > > -       isp4sd_pwroff_and_deinit(isp_subdev);
> > > > > > > > > > +       isp4sd_pwroff_and_deinit(isp_subdev, false);
> > > > > > > > > >            return -EINVAL;
> > > > > > > > > > }
> > > > > > > > > > 
> > > > > > > > > > @@ -985,7 +986,7 @@ static int isp4sd_set_power(struct v4l2_subdev *sd, int
> > > > > > > > > > on)
> > > > > > > > > >            if (on)
> > > > > > > > > >                    return isp4sd_pwron_and_init(isp_subdev);
> > > > > > > > > >            else
> > > > > > > > > > -               return isp4sd_pwroff_and_deinit(isp_subdev);
> > > > > > > > > > +               return isp4sd_pwroff_and_deinit(isp_subdev, true);
> > > > > > > > > > }
> > > > > > > > > > 
> > > > > > > > > > static const struct v4l2_subdev_core_ops isp4sd_core_ops = {
> > > > > > > > > 
> > > > > > > > > No difference sadly; same symptoms as before. FYI, your email client broke the
> > > > > > > > > patch formatting so I couldn't apply it; it hard wrapped some lines to 80 cols,
> > > > > > > > > replaced tabs with spaces, and removed leading spaces on each context line, so I
> > > > > > > > > had to apply it manually. To confirm I applied it correctly, here is my diff:
> > > > > > > > > 
> > > > > > > > > diff --git a/drivers/media/platform/amd/isp4/isp4_fw_cmd_resp.h b/drivers/media/platform/amd/isp4/isp4_fw_cmd_resp.h
> > > > > > > > > index 39c2265121f9..d571b3873edb 100644
> > > > > > > > > --- a/drivers/media/platform/amd/isp4/isp4_fw_cmd_resp.h
> > > > > > > > > +++ b/drivers/media/platform/amd/isp4/isp4_fw_cmd_resp.h
> > > > > > > > > @@ -97,7 +97,7 @@
> > > > > > > > >     #define ADDR_SPACE_TYPE_GPU_VA          4
> > > > > > > > > -#define FW_MEMORY_POOL_SIZE             (200 * 1024 * 1024)
> > > > > > > > > +#define FW_MEMORY_POOL_SIZE             (100 * 1024 * 1024)
> > > > > > > > >     /*
> > > > > > > > >      * standard ISP mipicsi=>isp
> > > > > > > > > diff --git a/drivers/media/platform/amd/isp4/isp4_subdev.c b/drivers/media/platform/amd/isp4/isp4_subdev.c
> > > > > > > > > index 4bd2ebf0f694..500ef0af8a41 100644
> > > > > > > > > --- a/drivers/media/platform/amd/isp4/isp4_subdev.c
> > > > > > > > > +++ b/drivers/media/platform/amd/isp4/isp4_subdev.c
> > > > > > > > > @@ -669,7 +669,7 @@ static int isp4sd_stop_resp_proc_threads(struct isp4_subdev *isp_subdev)
> > > > > > > > >     	return 0;
> > > > > > > > >     }
> > > > > > > > > -static int isp4sd_pwroff_and_deinit(struct isp4_subdev *isp_subdev)
> > > > > > > > > +static int isp4sd_pwroff_and_deinit(struct isp4_subdev *isp_subdev, bool irq_enabled)
> > > > > > > > >     {
> > > > > > > > >     	struct isp4sd_sensor_info *sensor_info = &isp_subdev->sensor_info;
> > > > > > > > >     	unsigned int perf_state = ISP4SD_PERFORMANCE_STATE_LOW;
> > > > > > > > > @@ -688,8 +688,9 @@ static int isp4sd_pwroff_and_deinit(struct isp4_subdev *isp_subdev)
> > > > > > > > >     		return 0;
> > > > > > > > >     	}
> > > > > > > > > -	for (int i = 0; i < ISP4SD_MAX_FW_RESP_STREAM_NUM; i++)
> > > > > > > > > -		disable_irq(isp_subdev->irq[i]);
> > > > > > > > > +	if (irq_enabled)
> > > > > > > > > +		for (int i = 0; i < ISP4SD_MAX_FW_RESP_STREAM_NUM; i++)
> > > > > > > > > +			disable_irq(isp_subdev->irq[i]);
> > > > > > > > >     	isp4sd_stop_resp_proc_threads(isp_subdev);
> > > > > > > > >     	dev_dbg(dev, "isp_subdev stop resp proc streads suc");
> > > > > > > > > @@ -785,7 +786,7 @@ static int isp4sd_pwron_and_init(struct isp4_subdev *isp_subdev)
> > > > > > > > >     	return 0;
> > > > > > > > >     err_unlock_and_close:
> > > > > > > > > -	isp4sd_pwroff_and_deinit(isp_subdev);
> > > > > > > > > +	isp4sd_pwroff_and_deinit(isp_subdev, false);
> > > > > > > > >     	return -EINVAL;
> > > > > > > > >     }
> > > > > > > > > @@ -957,7 +958,7 @@ static int isp4sd_set_power(struct v4l2_subdev *sd, int on)
> > > > > > > > >     	if (on)
> > > > > > > > >     		return isp4sd_pwron_and_init(isp_subdev);
> > > > > > > > >     	else
> > > > > > > > > -		return isp4sd_pwroff_and_deinit(isp_subdev);
> > > > > > > > > +		return isp4sd_pwroff_and_deinit(isp_subdev, true);
> > > > > > > > >     }
> > > > > > > > >     static const struct v4l2_subdev_core_ops isp4sd_core_ops = {
> > > > > > > > > 
> > > > > > > > > > On the other hand, please also add the patch in amdgpu which sets *bo to
> > > > > > > > > > NULL in isp_kernel_buffer_alloc() which you mentioned in another thread.
> > > > > > > > > 
> > > > > > > > > Yep, I have been doing all v5 testing with that patch applied.
> > > > > > > > > 
> > > > > > > > > BTW, I have verified the IRQ changes are not the cause for the regression; I
> > > > > > > > > tested with IRQs kept enabled all the time and the issue still occurs.
> > > > > > > > > 
> > > > > > > > > I did observe that ISP stops sending interrupts when the video stream freezes.
> > > > > > > > > And, if I replicate the bug enough times, it seems to permanently break FW until
> > > > > > > > > a full machine reboot. Reloading amd_capture with the v4 driver doesn't recover
> > > > > > > > > the ISP when this happens.
> > > > > > > > > 
> > > > > > > > > As an improvement to the driver, can we do a hard reset of ISP on driver probe?
> > > > > > > > > I am assuming hardware doesn't need too long to settle after hard reset, maybe
> > > > > > > > > a few hundred milliseconds? This would ensure ISP FW is always in a working
> > > > > > > > > state when the driver is loaded.
> > > > > > > > > 
> > > > > > > 
> > > > > > > Actually, each time the camera is activated, the ISP driver powers on the
> > > > > > > ISP and initiates its firmware from the beginning; when the camera is
> > > > > > > closed, the ISP is powered off..
> > > > > > 
> > > > > > Hmm, well I am able to put the ISP in a completely unusable state that doesn't
> > > > > > recover when I unload and reload amd_capture. Or maybe it is the sensor that is
> > > > > > stuck in a broken state?
> > > > > 
> > > > > Here is the log output when I try to start cheese after unloading and reloading
> > > > > amd_capture, where the ISP is in the broken state that requires rebooting the
> > > > > laptop (annotated with notes of what I saw/did at each point in time):
> > > > > 
> > > > > ==> opened cheese
> > > > > ==> cheese froze after a few seconds
> > > > > ==> closed cheese
> > > > >     [   34.570823] amd_isp_capture amd_isp_capture: fail to disable stream
> > > > >     [   35.077503] amd_isp_capture amd_isp_capture: fail to stop steam
> > > > >     [   35.077525] amd_isp_capture amd_isp_capture: disabling streaming failed (-110)
> > > > > ==> unloaded amd_capture
> > > > > ==> loaded amd_capture
> > > > > ==> opened cheese
> > > > >     [  308.039721] amd_isp_capture amd_isp_capture: ISP CCPU FW boot failed
> > > > >     [  308.043961] amd_isp_capture amd_isp_capture: fail to start isp_subdev interface
> > > > >     [  308.044188] amd_isp_capture amd_isp_capture: invalid mem_info
> > > > >     [  308.044194] amd_isp_capture amd_isp_capture: invalid mem_info
> > > > >     [  308.044196] amd_isp_capture amd_isp_capture: invalid mem_info
> > > > >     [  308.044197] amd_isp_capture amd_isp_capture: invalid mem_info
> > > > >     [  308.044198] amd_isp_capture amd_isp_capture: invalid mem_info
> > > > >     [  308.044198] amd_isp_capture amd_isp_capture: invalid mem_info
> > > > >     [  308.044199] amd_isp_capture amd_isp_capture: invalid mem_info
> > > > >     [  308.044200] amd_isp_capture amd_isp_capture: invalid mem_info
> > > > >     [  308.044200] amd_isp_capture amd_isp_capture: invalid mem_info
> > > > >     [  308.044201] amd_isp_capture amd_isp_capture: invalid mem_info
> > > > >     [  308.044202] amd_isp_capture amd_isp_capture: invalid mem_info
> > > > >     [  308.065226] amd_isp_capture amd_isp_capture: power up isp fail -22
> > > > >     [  308.174814] amd_isp_capture amd_isp_capture: ISP CCPU FW boot failed
> > > > >     [  308.177807] amd_isp_capture amd_isp_capture: fail to start isp_subdev interface
> > > > >     [  308.178036] amd_isp_capture amd_isp_capture: invalid mem_info
> > > > >     [  308.178043] amd_isp_capture amd_isp_capture: invalid mem_info
> > > > >     [  308.178044] amd_isp_capture amd_isp_capture: invalid mem_info
> > > > >     [  308.178045] amd_isp_capture amd_isp_capture: invalid mem_info
> > > > >     [  308.178046] amd_isp_capture amd_isp_capture: invalid mem_info
> > > > >     [  308.178047] amd_isp_capture amd_isp_capture: invalid mem_info
> > > > >     [  308.178048] amd_isp_capture amd_isp_capture: invalid mem_info
> > > > >     [  308.178048] amd_isp_capture amd_isp_capture: invalid mem_info
> > > > >     [  308.178049] amd_isp_capture amd_isp_capture: invalid mem_info
> > > > >     [  308.178050] amd_isp_capture amd_isp_capture: invalid mem_info
> > > > >     [  308.178050] amd_isp_capture amd_isp_capture: invalid mem_info
> > > > >     [  308.198776] amd_isp_capture amd_isp_capture: power up isp fail -22
> > > > >     [  308.306835] amd_isp_capture amd_isp_capture: ISP CCPU FW boot failed
> > > > >     [  308.311533] amd_isp_capture amd_isp_capture: fail to start isp_subdev interface
> > > > >     [  308.311723] amd_isp_capture amd_isp_capture: invalid mem_info
> > > > >     [  308.311723] amd_isp_capture amd_isp_capture: invalid mem_info
> > > > >     [  308.311724] amd_isp_capture amd_isp_capture: invalid mem_info
> > > > >     [  308.311725] amd_isp_capture amd_isp_capture: invalid mem_info
> > > > >     [  308.311725] amd_isp_capture amd_isp_capture: invalid mem_info
> > > > >     [  308.311726] amd_isp_capture amd_isp_capture: invalid mem_info
> > > > >     [  308.311726] amd_isp_capture amd_isp_capture: invalid mem_info
> > > > >     [  308.311726] amd_isp_capture amd_isp_capture: invalid mem_info
> > > > >     [  308.311727] amd_isp_capture amd_isp_capture: invalid mem_info
> > > > >     [  308.311727] amd_isp_capture amd_isp_capture: invalid mem_info
> > > > >     [  308.311727] amd_isp_capture amd_isp_capture: invalid mem_info
> > > > >     [  308.335281] amd_isp_capture amd_isp_capture: power up isp fail -22
> > > > > 
> > > > 
> > > > Thanks Sultan for the detailed info, I agree with you, tend to believe it
> > > > may related to the sensor, I will follow up with the FW team to investigate
> > > > further.
> > > > 
> > > > > > > > > Thanks,
> > > > > > > > > Sultan
> > > > > > > > 
> > > > > > > > A small update: I reproduced the issue on v4, but it took several more cycles of
> > > > > > > > closing/opening cheese and waiting 30s compared to v5.
> > > > > > > > 
> > > > > > > > Right now my best guess is that this is a timing issue with respect to FW that
> > > > > > > > was exposed by the v5 changes. v5 introduced slight changes in code timing, like
> > > > > > > > with the mutex locks getting replaced by spin locks.
> > > > > > > > 
> > > > > > > > I'll try to insert mdelays to see if I can expose the issue that way on v4.
> > > > > > > > 
> > > > > > > 
> > > > > > > Could you kindly provide the FW used?
> > > > > > 
> > > > > >     commit a89515d3ff79f12099f7a51b0f4932b881b7720e
> > > > > >     Author: Pratap Nirujogi <pratap.nirujogi@amd.com>
> > > > > >     Date:   Thu Aug 21 15:40:45 2025 -0400
> > > > > > 
> > > > > >         amdgpu: Update ISP FW for isp v4.1.1
> > > > > >         From internal git commit:
> > > > > >         24557b7326e539183b3bc44cf8e1496c74d383d6
> > > > > >         Signed-off-by: Pratap Nirujogi <pratap.nirujogi@amd.com>
> > > > > > 
> > > > > > Sultan
> > > > > 
> > > > > Sultan
> > > > 
> > > > -- 
> > > > Regards,
> > > > Bin
> > > > 
> > > 
> > > Thanks, Bin. I looked deeper at the code and didn't find any reason the issue
> > > could be due to the driver. Also, the problem happens outside of cheese for me
> > > (like in Chromium with Zoom meetings), so v5 of the driver is pretty much
> > > unusable for me until this issue is fixed. :(
> > > 
> > 
> > Oh, really sad to hear that :(, there must be some difference between our
> > platforms because we still can't reproduce the issue you mentioned, to help
> > on this, would you share more info like your Ubuntu version, Kernel
> > version/source, ISP driver version, BIOS version, .config used to build the
> > kernel, FW: commit a89515d3ff79f12099f7a51b0f4932b881b7720e.
> > Just wondering, if possible, could you provide the kernel image either so we
> > can directly test on it. Also, the HW is not broken, right?
> 
> I figured out why you cannot reproduce the issue. You need to pass amd_iommu=off
> on the kernel command line to trigger the issue.
> 
> The reason I am using amd_iommu=off is because this laptop otherwise doesn't
> ever wake from suspend under Linux once it reaches the S0i3 state. The keyboard,
> power button, and lid do not respond to wake up the laptop from suspend. This
> happens 100% of the time once S0i3 is reached, and occurs on the OEM Ubuntu
> image from HP as well. The only fix I have found is to pass amd_iommu=off, which
> other owners of this laptop also found fixes the issue.
> 
> > 
> > > I've attached a v2 of my big patch, which includes more improvements and another
> > > ringbuffer bug fix. Please check the ringbuffer logic on the FW side to make
> > > sure FW doesn't have the same bug, where it may let rd_ptr == wr_ptr upon
> > > filling the ringbuffer, even though rd_ptr == wr_ptr is supposed to indicate the
> > > ringbuffer is empty.
> > > 
> > 
> > Thank you for your huge contribution. We'll review, verify, and merge as
> > much as possible into v6 and hope this marks the final significant update.
> > We typically avoid large changes to reduce regression risks and minimize
> > additional debugging, testing, and schedule impact.
> 
> I understand. Don't worry, that is indeed the final significant update. Please
> let me know which changes you don't merge in, since it could be an important
> change. And thank you for considering my changes! :)
> 
> And please be sure to check the ringbuffer code in FW to see if it has the same
> bug I found in the driver.
> 
> > > Also, I have a suggestion for a FW change to improve IRQ handling in the driver:
> > > 
> > > 1. Change ISP_SYS_INT0_ACK behavior so that it also clears the acked interrupts
> > >     from ISP_SYS_INT0_EN.
> > > 
> > 
> > Based on my understanding, this pertains to the hardware design and cannot
> > be modified.
> > 
> > > 2. Change ISP_SYS_INT0_EN behavior so that it only enables the interrupts in the
> > >     provided mask, so RMW of ISP_SYS_INT0_EN in the driver won't be necessary to
> > >     re-enable interrupts for a stream.
> > > 
> > 
> > I'm not sure I understand your point. Are you saying that ISP_SYS_INT0_EN
> > only considers '1' in the mask and ignores '0'? If that's the case, I'm
> > curious about how to disable an interrupt. Also, this is also determined by
> > the hardware design.
> 
> No worries, it's not a big deal. Just a small optimization I thought of.
> 
> My idea was:
> 
> 1. Current behavior of ISP_SYS_INT0_ACK:
>      isp4hw_wreg(mmio, ISP_SYS_INT0_ACK, intr_ack) results in:
> 
>          regmap[ISP_SYS_INT0_STATUS] &= ~intr_ack;
> 
>    Proposed behavior of ISP_SYS_INT0_ACK:
>      isp4hw_wreg(mmio, ISP_SYS_INT0_ACK, intr_ack) results in:
> 
>          regmap[ISP_SYS_INT0_STATUS] &= ~intr_ack;
>          regmap[ISP_SYS_INT0_EN] &= ~intr_ack;
> 
> 2. Current behavior of ISP_SYS_INT0_EN:
>      isp4hw_wreg(mmio, ISP_SYS_INT0_EN, intr_en) results in:
> 
>          regmap[ISP_SYS_INT0_EN] = intr_en;
> 
>    Proposed behavior of ISP_SYS_INT0_EN:
>      isp4hw_wreg(mmio, ISP_SYS_INT0_EN, intr_en) results in:
> 
>          regmap[ISP_SYS_INT0_EN] |= intr_en;
> 
> 
> And to disable an interrupt with this design, you can write to ISP_SYS_INT0_ACK.
> 
> Sultan

Hi Bin,

Thanks to Mario's help, I'm running with the IOMMU enabled now and as a result,
I'm able to use the v5 driver without issue. No more freezes!

Since I'm able to use v5 now, I was able to perform more testing on my big
v2-media-platform-amd-Big-squash-of-fixes-cleanup-on.patch I sent before.

I found a regression in my big patch where stopping the stream would fail 100%
of the time, tested by opening and then closing cheese. I've attached a small
fix for this.

Please apply media-platform-amd-Don-t-wait-for-cmd_done-under-isp.patch on top
of v2-media-platform-amd-Big-squash-of-fixes-cleanup-on.patch.

With these two patches applied on top of v5, everything works well for me. :)

FYI, I think there is an issue in the FW's error handling, because that bug in
my big patch breaks the ISP until I reboot the laptop, with the same symptoms as
what I reported before when I was testing v5 with IOMMU disabled (and _without_
any of my changes to the driver).

Maybe you can take advantage of the bug I caused, and use it to find why the ISP
or sensor never recovers after the driver fails to disable the stream.

Cheers,
Sultan

--uu5/KLTtljtJFo9n
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment;
	filename=media-platform-amd-Don-t-wait-for-cmd_done-under-isp.patch

From db21ee18ac1e3eacf8fada691495f086aa636794 Mon Sep 17 00:00:00 2001
From: Sultan Alsawaf <sultan@kerneltoast.com>
Date: Fri, 21 Nov 2025 18:25:31 -0800
Subject: [PATCH] media: platform: amd: Don't wait for cmd_done under
 isp4if_mutex

This fixes a regression in "[PATCH v2] media: platform: amd: Big squash of
fixes/cleanup on top of v5 patchset" (and in the v1 version) where waiting
for completion of a command was accidentally moved underneath isp4if_mutex,
causing the following error every time when closing the camera:
  [   56.136720] amd_isp_capture amd_isp_capture: fail to disable stream
  [   56.643383] amd_isp_capture amd_isp_capture: fail to stop steam
  [   56.643531] amd_isp_capture amd_isp_capture: disabling streaming failed (-110)

Fix it by moving the wait outside of isp4if_mutex, and also moving
unrelated operations outside of the isp4if_mutex scope as an optimization.

Signed-off-by: Sultan Alsawaf <sultan@kerneltoast.com>
---
 .../media/platform/amd/isp4/isp4_interface.c  | 100 +++++++++---------
 1 file changed, 50 insertions(+), 50 deletions(-)

diff --git a/drivers/media/platform/amd/isp4/isp4_interface.c b/drivers/media/platform/amd/isp4/isp4_interface.c
index 8d36f8b483ff..3ad93b888a3e 100644
--- a/drivers/media/platform/amd/isp4/isp4_interface.c
+++ b/drivers/media/platform/amd/isp4/isp4_interface.c
@@ -388,35 +388,6 @@ static int isp4if_send_fw_cmd(struct isp4_interface *ispif, u32 cmd_id, const vo
 		return -EINVAL;
 	}
 
-	/* Allocate the sync command object early and outside of the lock */
-	if (sync) {
-		ele = kmalloc(sizeof(*ele), GFP_KERNEL);
-		if (!ele)
-			return -ENOMEM;
-
-		/* Get two references: one for the resp thread, one for us */
-		atomic_set(&ele->refcnt, 2);
-		init_completion(&ele->cmd_done);
-	}
-
-	guard(mutex)(&ispif->isp4if_mutex);
-
-	ret = read_poll_timeout(isp4if_is_cmdq_rb_full, ret, !ret, ISP4IF_MAX_SLEEP_TIME * 1000,
-				ISP4IF_MAX_SLEEP_COUNT * ISP4IF_MAX_SLEEP_TIME * 1000, false,
-				ispif, stream);
-	if (ret) {
-		struct isp4if_rb_config *rb_config = &isp4if_resp_rb_config[stream];
-		u32 rd_ptr = isp4hw_rreg(ispif->mmio, rb_config->reg_rptr);
-		u32 wr_ptr = isp4hw_rreg(ispif->mmio, rb_config->reg_wptr);
-
-		dev_err(dev,
-			"failed to get free cmdq slot, stream %s(%d),rd %u, wr %u\n",
-			isp4dbg_get_if_stream_str(stream),
-			stream, rd_ptr, wr_ptr);
-		ret = -ETIMEDOUT;
-		goto free_ele;
-	}
-
 	/*
 	 * The struct will be shared with ISP FW, use memset() to guarantee padding bits are
 	 * zeroed, since this is not guaranteed on all compilers.
@@ -432,34 +403,63 @@ static int isp4if_send_fw_cmd(struct isp4_interface *ispif, u32 cmd_id, const vo
 		break;
 	default:
 		dev_err(dev, "fail bad stream id %d\n", stream);
-		ret = -EINVAL;
-		goto free_ele;
+		return -EINVAL;
+	}
+
+	/* Allocate the sync command object early and outside of the lock */
+	if (sync) {
+		ele = kmalloc(sizeof(*ele), GFP_KERNEL);
+		if (!ele)
+			return -ENOMEM;
+
+		/* Get two references: one for the resp thread, one for us */
+		atomic_set(&ele->refcnt, 2);
+		init_completion(&ele->cmd_done);
 	}
 
 	if (package && package_size)
 		memcpy(cmd.cmd_param, package, package_size);
 
-	seq_num = ispif->host2fw_seq_num++;
-	cmd.cmd_seq_num = seq_num;
-	cmd.cmd_check_sum = isp4if_compute_check_sum(&cmd, sizeof(cmd) - sizeof(u32));
+	scoped_guard(mutex, &ispif->isp4if_mutex) {
+		ret = read_poll_timeout(isp4if_is_cmdq_rb_full, ret, !ret,
+					ISP4IF_MAX_SLEEP_TIME * 1000,
+					ISP4IF_MAX_SLEEP_COUNT * ISP4IF_MAX_SLEEP_TIME * 1000,
+					false, ispif, stream);
+		if (ret) {
+			struct isp4if_rb_config *rb_config = &isp4if_resp_rb_config[stream];
+			u32 rd_ptr = isp4hw_rreg(ispif->mmio, rb_config->reg_rptr);
+			u32 wr_ptr = isp4hw_rreg(ispif->mmio, rb_config->reg_wptr);
+
+			dev_err(dev,
+				"failed to get free cmdq slot, stream %s(%d),rd %u, wr %u\n",
+				isp4dbg_get_if_stream_str(stream),
+				stream, rd_ptr, wr_ptr);
+			ret = -ETIMEDOUT;
+			goto free_ele;
+		}
 
-	/*
-	 * only append the fw cmd to queue when its response needs to be waited for,
-	 * currently there are only two such commands, disable channel and stop stream
-	 * which are only sent after close camera
-	 */
-	if (ele) {
-		ele->seq_num = seq_num;
-		ele->cmd_id = cmd_id;
-		scoped_guard(spinlock, &ispif->cmdq_lock)
-			list_add_tail(&ele->list, &ispif->cmdq);
-	}
+		seq_num = ispif->host2fw_seq_num++;
+		cmd.cmd_seq_num = seq_num;
+		cmd.cmd_check_sum = isp4if_compute_check_sum(&cmd, sizeof(cmd) - sizeof(u32));
+
+		/*
+		 * only append the fw cmd to queue when its response needs to be waited for,
+		 * currently there are only two such commands, disable channel and stop stream
+		 * which are only sent after close camera
+		 */
+		if (ele) {
+			ele->seq_num = seq_num;
+			ele->cmd_id = cmd_id;
+			scoped_guard(spinlock, &ispif->cmdq_lock)
+				list_add_tail(&ele->list, &ispif->cmdq);
+		}
 
-	ret = isp4if_insert_isp_fw_cmd(ispif, stream, &cmd);
-	if (ret) {
-		dev_err(dev, "fail for insert_isp_fw_cmd camId %s(0x%08x)\n",
-			isp4dbg_get_cmd_str(cmd_id), cmd_id);
-		goto err_dequeue_ele;
+		ret = isp4if_insert_isp_fw_cmd(ispif, stream, &cmd);
+		if (ret) {
+			dev_err(dev, "fail for insert_isp_fw_cmd camId %s(0x%08x)\n",
+				isp4dbg_get_cmd_str(cmd_id), cmd_id);
+			goto err_dequeue_ele;
+		}
 	}
 
 	if (ele) {
-- 
2.52.0


--uu5/KLTtljtJFo9n--

