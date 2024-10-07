Return-Path: <linux-media+bounces-19139-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DD92992556
	for <lists+linux-media@lfdr.de>; Mon,  7 Oct 2024 09:04:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1E0B3B226F2
	for <lists+linux-media@lfdr.de>; Mon,  7 Oct 2024 07:04:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F094E17624D;
	Mon,  7 Oct 2024 07:03:45 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9361C6FC5;
	Mon,  7 Oct 2024 07:03:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728284625; cv=none; b=IqHY6uQgLLK0fSK+ANtl8yUzCwUbWAhoWPtqwgs8lkMtJnwS55Wsu5ii5ZRgIg0LziCDZGInPynARrESW5D03JQO9K0AWbXzGMVrjc63SI6+Om2Zo6mpOVwHyclNYe/7ogl9qEujQdcGlqo73WLySwyj4i422xVMdGBD9LEWzsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728284625; c=relaxed/simple;
	bh=V7Mq9T/uHbq/T6W91yAEF8OSSVeryB8qdqE8YqEUB6M=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=L+Po1rMhI3ZK0f8agYoRgJ7twmaN4RKWq7RHMztx2gtzcSO13iG9n+3ixUkmLraXcecOFDNebTyfD+uh5m/WHTdiG+TAhTYWHGGqI3Y73KpDyV9DkqoBT/X0qiieyZxJ+rZkk4zClOgU69dHForRW2wt7EU26m4CuVgrE5hd/Jg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E282C4CEC6;
	Mon,  7 Oct 2024 07:03:43 +0000 (UTC)
Message-ID: <382ba4d3-4928-43eb-9bd9-f219e8dfc6ae@xs4all.nl>
Date: Mon, 7 Oct 2024 09:03:41 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: PROBLEM: WARN_ON triggers in v4l_querycap with BlackMagic atem
 console connected via USB
To: Ulrich Drepper <drepper@gmail.com>, mchehab@kernel.org,
 sakari.ailus@linux.intel.com, laurent.pinchart@ideasonboard.com,
 jacopo.mondi@ideasonboard.com, naush@raspberrypi.com,
 benjamin.gaignard@collabora.com, jeanmichel.hautbois@ideasonboard.com,
 linux-media@vger.kernel.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <CAOPLpQdP_=UZbOfAdzH9Nn_ZJADxJGLOT2nowTtRATwNYSGkFw@mail.gmail.com>
Content-Language: en-US, nl
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <CAOPLpQdP_=UZbOfAdzH9Nn_ZJADxJGLOT2nowTtRATwNYSGkFw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Ulrich,

What is the output of 'v4l2-ctl -D -d/dev/videoX' of the video device that causes
the WARN_ON to appear? I can't tell what driver is used.

The WARN_ON just checks if the capabilities field is a superset of the device_caps
field. If not, then that's a driver bug. If this is an out-of-tree driver, then
it has to be addressed there. Note that that WARN_ON has been there since mid-2019.

Regards,

	Hans

On 06/10/2024 12:50, Ulrich Drepper wrote:
> I cannot really say when this problem started but I know that perhaps
> six months back (or a bit more) I used the console successfully as a
> video source device (webcam).  This is a ATEM Mini Pro which has a
> large number of USB interfaces.  What trips up is videodev.  Various
> userlevel programs (uvcdynctrl, chromium) notice the device being
> added and use ioctl(), triggering the problem.
> 
> This is with the current Fedora x86_64 kernel (6.10.12) but a) it
> happens for a while now and b) as far as I can see this is just the
> upstream code, no local changes.
> 
> The call trace is:
> 
> Call Trace:
>  <TASK>
>  ? v4l_querycap+0x119/0x140 [videodev]
>  ? __warn.cold+0x8e/0xe8
>  ? v4l_querycap+0x119/0x140 [videodev]
>  ? report_bug+0xff/0x140
>  ? handle_bug+0x3c/0x80
>  ? exc_invalid_op+0x17/0x70
>  ? asm_exc_invalid_op+0x1a/0x20
>  ? v4l_querycap+0x119/0x140 [videodev]
>  __video_do_ioctl+0x518/0x630 [videodev]
>  video_usercopy+0x1f1/0x7a0 [videodev]
> 
> I traced the offending code to an 'ud2' instruction (makes sense,
> undefined) which is reached from this code in
> drivers/media/v4l2-core/v4l2-ioctl.c (v4l_querycap):
> 
> WARN_ON((cap->capabilities &
>       (vfd->device_caps | V4L2_CAP_DEVICE_CAPS)) !=
>       (vfd->device_caps | V4L2_CAP_DEVICE_CAPS));
> 
> The asm code is:
> 
>     747e:       8b 73 54                mov    0x54(%rbx),%esi
>     7481:       81 ca 00 00 00 80       or     $0x80000000,%edx
>     7487:       48 b9 00 00 20 00 00    movabs $0x20000000200000,%rcx
>     748e:       00 20 00
>     7491:       48 0b 4b 54             or     0x54(%rbx),%rcx
>     7495:       21 d6                   and    %edx,%esi
>     7497:       39 f2                   cmp    %esi,%edx
>     7499:       75 6e                   jne    7509 <v4l_querycap+0x119>
> 
> where 7509 is the address of the ud2 instruction.
> 
> The register dump shows
> 
> RDX: 0000000085008003 RSI: 0000000085008002
> 
> which, if I'm right, means that cap->capabilities has the extra bit
> 
> #define V4L2_CAP_VIDEO_CAPTURE          0x00000001  /* Is a video
> capture device */
> 
> set.
> 
> I don't know what 'ops' points to in the code.  It seems to me that
> the bit is set in the
> 
> ops->vidioc_querycap(file, fh, cap);
> 
> call just preceding the test.
> 
> Just going by the name of the capability, it seems that the bit should
> be set as this device is used as a camera as well so maybe the
> information which comes from the call the
> 
> struct video_device *vfd = video_devdata(file);
> 
> is incomplete?  Or the test WARN_ON condition is actually incorrect?
> 
> 
> Any idea?  I can try to run more tests if someone can tell me how to proceed.
> 
> Thanks.


