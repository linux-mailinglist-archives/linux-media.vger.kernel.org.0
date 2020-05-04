Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3D0401C391F
	for <lists+linux-media@lfdr.de>; Mon,  4 May 2020 14:18:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728678AbgEDMSR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 4 May 2020 08:18:17 -0400
Received: from lb3-smtp-cloud7.xs4all.net ([194.109.24.31]:36921 "EHLO
        lb3-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726744AbgEDMSR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 4 May 2020 08:18:17 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id Va2zj7GgatKAsVa32jNiyx; Mon, 04 May 2020 14:18:13 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1588594693; bh=HVNXIkkNMZQlYuLbLWLUIzp75qNsPdBtM9JVbTK3Ih4=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=wGwc8o0VwP2CuMsWR0P9h8hr75SYZR//XkpDxYxIoAEUs2UWI2rUYDSsYClO1rsbX
         4YR4EInbdAiGRaoVPMGRBKDa6I+tivF1a6RxbGIwmp6kcpPMz+7qvLHt9Gfy/Nh+gU
         V4dM19O2uhp663hUUjf8uYJHcGBCyR1knX7GBFYF/wRzOdR/MJ+PdoSTE8y7FAx776
         C5EczPZqzdksKfLOe0i6KqiTHWWR/qn2eDM4d8ZRfE8KuA2s78wi6ZrVjz9RAmNjRb
         3iBgT6vAW4IKnRrCaOoYvIKM8KF61T9gXTy1x6KhcL55DWgEkkK320HNOuZYVuBkTd
         gSToIAztD0NiA==
Subject: Re: [RFC PATCH v11 6/9] media: tegra: Add Tegra210 Video input driver
To:     Sowjanya Komatineni <skomatineni@nvidia.com>,
        Dmitry Osipenko <digetx@gmail.com>, thierry.reding@gmail.com,
        jonathanh@nvidia.com, frankc@nvidia.com, sakari.ailus@iki.fi,
        helen.koike@collabora.com
Cc:     sboyd@kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
References: <1588197606-32124-1-git-send-email-skomatineni@nvidia.com>
 <9aa64f21-7b23-7228-b5eb-d2ff092682ad@nvidia.com>
 <668cc4a0-2c81-0d87-b801-9fbf64e19137@nvidia.com>
 <bf3f654e-b8f8-d560-fc5e-03d73cb7eab0@nvidia.com>
 <525e481b-9137-6fdd-bbf9-3779a5704e6b@nvidia.com>
 <fe7ebad6-0368-b1f0-4f58-648baa5e3f79@nvidia.com>
 <4f095181-2338-3b71-316c-f8bbfc7865cc@nvidia.com>
 <50e872bb-913a-7b47-3264-af6b1cedb0e2@nvidia.com>
 <e17a8a49-be53-465d-f64c-3f4c77391d98@nvidia.com>
 <da5154b4-85f9-3e56-a440-f75debaec3a8@nvidia.com>
 <cbb047ae-97dc-8b9a-a5ba-8e2a5dab3771@nvidia.com>
 <6ae2d00d-7955-d12b-5b56-955ef72ece26@nvidia.com>
 <f9073b28-f1f1-636c-be53-764fb0a531a1@gmail.com>
 <1767e50f-efb7-5e89-22f6-0917821b660d@nvidia.com>
 <235a4cd4-4d4a-04b8-6c65-43a4dba48a0b@nvidia.com>
 <f8103170-7879-8597-3e3c-da9a3b6a40b3@nvidia.com>
 <5d847770-dad9-8f18-67b5-c1ba79084957@nvidia.com>
 <4abf30e0-fed9-ba39-ae38-350789bce99d@gmail.com>
 <b5f6a4e0-6e97-05ae-f034-b84fc5a1129a@nvidia.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <eddb1de3-81c2-159b-b24b-2e30ba2ba948@xs4all.nl>
Date:   Mon, 4 May 2020 14:18:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <b5f6a4e0-6e97-05ae-f034-b84fc5a1129a@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfC/9I5yCpR9QTbwYRfbWeo4XJNYMtYq035bhhkI8MQx/AST33orAwOy3B+7rSNzuLEKTn+BP8TP4v3lQpr5eY92DFADr1wm4twGH0oPCblkgZQCIz7xP
 2d4+LmDJoxyFmt8FStQa3jP8RfSkxlrghM/gqpbF+FHpt2lxG/Rm98CgBlWYJDC0IRvus9jFc/x1YHHCsppBBBstssOqEoiPCafQEJ/umSLVTEkZNeyKYLhv
 PGLTjBoIe2Bgm/044DdeMVvYU0r16rHeOIvcNQxHOiVy7R+tKUkw8fzBpfashZJILiPbJ4887peC4Tr6j1+BpD4I3mEqNhICd523ar6SrRFapcXn/V6fP5UV
 V8GWhXe9OKNxo2RNgrl+ySbExrUPNFcnmdlEu7NBVXhFofkF1af1XPhcrKMem2s2plFUs1g8vzEuNJw0FQoAGRGEDgHqc1/6dIJAQXvMc6KdgZwIftPGK8xJ
 pxHL9+3JPaUIpguLVGpFvXZQdVqz+agLFNE6i6Ci7xx8fz79Hf97TbdP5t2dwsS+ywtd6otVlOAXhaJAviwKymEzo7uQYczO0Di5l8kG2x20Fq9jrlYPlkR5
 uk0=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 03/05/2020 00:46, Sowjanya Komatineni wrote:
> 
> On 5/2/20 1:48 PM, Dmitry Osipenko wrote:
>> 02.05.2020 19:55, Sowjanya Komatineni пишет:
>>> Also stop stream ioctl request happens during suspend where both threads
>>> will be stopped properly. done thread stop happens only after finishing
>>> all outstanding buffers.
>> Do you mean that V4L core takes care of stopping the streami on suspend
>> and re-starting it on resume from suspend?
>>
>>> Stop stream request happens from streaming applications so even without
>>> driver suspend/resume implementation currently, streaming will be
>>> stopped prior to system  suspend where both threads will be stopped
>>> properly (after finishing out standing buffers) and will be resumed by
>>> application on system resume
>> All userspace is frozen on suspend. System suspension is transparent for
>> userspace applications. I'm not sure what you're meaning here.
>>
>>> Also tested suspending while streaming with this unconditional freeze, I
>>> don't see any issue as application stops stream where v4l_streamoff gets
>>> executed during suspend and on resume streaming starts where
>>> v4l_streamon happens.
>>>
>>> So, I don't see any issue with existing implementation of unconditional
>>> freeze.
>> I don't understand why freezing is needed at all if V4L core takes care
>> of stopping the stream on suspend, what is the point? If there is no
>> real point, then let's make threads non-freezable and done with that.
> 
> video device fops unlocked_ioctl is set to video_ioctl2() in vi driver.
> 
> video device fops unlocked_ioctl gets executed with stream off cmd 
> during suspend and stream on cmd during resume which eventually calls 
> v4l_streamoff and v4l_streamon during system suspend/resume.

That's news to me. The 'only' thing that suspend/resume needs to do is to
stop the HW DMA on suspend and to restart the HW DMA (and typically reconfigure
the whole HW video pipeline) on resume. Userspace doesn't do anything special.

That's how e.g. a UVC webcam behaves when you close the lid of a laptop while
it is streaming and open it again later.

It can be hard to get this right, and I suspect many media drivers will fail
this test.

> 
> My understanding to have freezable threads is during system suspend user 
> space applications are frozen prior to kernel freeze and during suspend 
> when opened video character device node gets closed these ioctl gets 
> invoked and stream off during suspend and stream on during resume 
> happens. So probably we still need to use freezable threads to sync with 
> user space application when frozen before really entering suspend.
> 
> Will wait for Thierry/Hans comment to correct if my above understanding 
> is wrong and help clarify if we need freezable threads at all in this 
> case...
> 
> Note: I see other drivers using freezable threads for capture drivers.

Well, it's often a copy-and-paste without truly understanding what is
going on. You should not assume that the author knew what was happening.

To be honest, I'm not an expert on this either.

Looking at the tegra start/finish threads: they basically look at the
chan->capture and chan->done lists. Freezing the threads should not be
a problem as long as the actual suspend/resume doesn't mess with those
lists. If it does, then it may get tricky to prove that it is safe to
do suspend/resume (I think).

An alternative is to stop and restart those threads when suspending or
resuming. Then those threads do not need to be 'freezable' and it might
be easier to validate the code.

In any case, I do not want to postpone the merger of the upcoming v12 for
this. Changes can be done in later patches, if needed.

Regards,

	Hans

> 
> 
> Assuming we use freezable threads, I was saying we don't need 
> conditional try_to_freeze() like you pointed because even if finish 
> thread freeze happens prior to frame capture initiated by start thread, 
> vi hardware will still continue to update this single ongoing buffer and 
> will finish max within 200ms and actually there is no direct processing 
> of this done by finish thread itself except that it returns buffers back 
> when done and in this case it returns back when unfreeze/wake up happens.
> 
> So, I don't see any issue of unconditional try_to_freeze() even with 
> freezable threads.
> 
> Thanks
> 
> Sowjanya
> 
> 

