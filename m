Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 81E4F2C6765
	for <lists+linux-media@lfdr.de>; Fri, 27 Nov 2020 15:07:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730407AbgK0OEB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 27 Nov 2020 09:04:01 -0500
Received: from lb2-smtp-cloud9.xs4all.net ([194.109.24.26]:45979 "EHLO
        lb2-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727653AbgK0OEB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 27 Nov 2020 09:04:01 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id ieLokWrUxkGBYieLrkPdBM; Fri, 27 Nov 2020 15:03:58 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1606485838; bh=dL6R3XINDQOv2MpyAtjutJ5DZWejevhjpZrVM3DI8BE=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=o5PgjNJ+Ol04e9xwYTgM9Z8uHPfXiK2aYuBlNGDzdrq98t3uLGTTGX5r6uwd0l/eT
         rHmM6aWouUISRaxTdVFGsBG9TRuomiCqqEFeG5T3ntgrsrBFVmqeY/Hz+QPZLs7z9R
         bGULhIgtNGWiUD0nU6Y7c3Pi4tXM46JVFhHVBASYG366zDQz4NO58f0bjowK4NbhaJ
         hC6xCINokQVHu8z4syI8qOqagF7aPKmoMFF4LEp2G8Iw1XP5AYABlDJhbN0bwRGU7L
         hEKrZ+4TF/hM9mSFMLyWADOqCpb9/DIcxABHdXAHtfRJnVwLt6yEFIucWe/hBoHYIw
         t9Ex+BSIOKfEw==
Subject: Re: v4l2-compliance: v4l2-test-formats.cpp(265): unknown flag
 000001e0 returned
To:     Naresh Kamboju <naresh.kamboju@linaro.org>,
        open list <linux-kernel@vger.kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        lkft-triage@lists.linaro.org
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Alexandre Courbot <gnurou@gmail.com>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Maheshwar Ajja <majja@codeaurora.org>,
        Pi-Hsun Shih <pihsun@chromium.org>
References: <CA+G9fYvLt1A_VZJk96ixFxx4Ep9eX9zy8hFDLLZ=WwKLBMXaEA@mail.gmail.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <76f2b297-b901-2efc-231e-7ebcba668f71@xs4all.nl>
Date:   Fri, 27 Nov 2020 15:03:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <CA+G9fYvLt1A_VZJk96ixFxx4Ep9eX9zy8hFDLLZ=WwKLBMXaEA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfEIy9timQZYqLkM13Y+aRy/hjd/Nvexvyl5xMYri0l1UZk+MWfhyFLQeChpu2d2llRTHfR4NjmANDRcJcKNsrKHVun1qcHdz6QUMihXfNLmfN7Wv8ILi
 f+scWYC5xbb4bcwJXpOqNGqmxRfrfgY/GhAslF3ssnKD+C80tU3fFTThAdYoH18Ks48mnOr5BreuPNRW16CL/Hm2JUf7t2wt8mdvq4ycif3ZbcM+R9SHHu09
 U0H1VZRtiRom9ELkw5yOi4qzl34dYKfDYJYPKrIFbAb3eR/Vfjw/DS2Jv/X09BWlf8QPCo4NW9F/cRUdWc4CM7GtX5pH0n2z53ON6D0fG74JkszeZDDVr7vd
 w6M8EvbIw11NQnrNK85nIa4ZOPNVsX89BDEsJEY3sotP9e7IGK3Sjy21kRO+GvIPH4JPbg6XuguUlrD2MvfK4EXiw+U849WAT3jXSg2gBQrdalcoB87SmOLd
 yePJiglDcwG9C4Ev7Ku4Akn0mtSb6cVAcyl9mUCVJpymmFNPJdLVO2rbzrx3ikX/5bj+sY8fiB7em64JJ3e5wJuwEk2ZGmj2/zjGEHsaTskBPBEev+EYd/RC
 KQKloOmVM5r2YyJS2LRanUx+30uPgyzvM33RKn7Wk3CIilSy+pywg4JU1VLBhfNatfQ=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 27/11/2020 15:00, Naresh Kamboju wrote:
> FYI,
> you might have seen this problem, but for the record I am reporting here,
> Following test cases have been failing for a while on the mainline kernel.
> Please find crash log and git short between bad and good commit.
> 
> List of failed test cases:
> v4l2-compliance
>     * VIDIOC_ENUM_FMT-FRAMESIZES-FRAMEINTERVALS
>     * VIDIOC_G_FMT
>     * VIDIOC_S_FMT
>     * VIDIOC_TRY_FMT
> 
> test output log:
> -------------------
> Format ioctls (Input 0):
> fail: ../../../v4l-utils-1.18.1/utils/v4l2-compliance/v4l2-test-formats.cpp(265):

1.18.1 is much too old.

If you want reliable output from v4l2-compliance, then always compile from the
git repository (git://linuxtv.org/v4l-utils.git).

The version distributed by distros is much too infrequently updated, and shouldn't
be used.

If you still have issues with the version from the git repo, then let me know!

Regards,

	Hans

> unknown flag 000001e0 returned
> test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: FAIL
> warn: ../../../v4l-utils-1.18.1/utils/v4l2-compliance/v4l2-test-formats.cpp(1320):
> S_PARM is supported for buftype 1, but not for ENUM_FRAMEINTERVALS
> test VIDIOC_G/S_PARM: OK
> test VIDIOC_G_FBUF: OK
> fail: ../../../v4l-utils-1.18.1/utils/v4l2-compliance/v4l2-test-formats.cpp(444):
> pixelformat 56595559 (YUYV) for buftype 1 not reported by ENUM_FMT
> test VIDIOC_G_FMT: FAIL
> fail: ../../../v4l-utils-1.18.1/utils/v4l2-compliance/v4l2-test-formats.cpp(444):
> pixelformat 56595559 (YUYV) for buftype 1 not reported by ENUM_FMT
> test VIDIOC_TRY_FMT: FAIL
> fail: ../../../v4l-utils-1.18.1/utils/v4l2-compliance/v4l2-test-formats.cpp(444):
> pixelformat 56595559 (YUYV) for buftype 1 not reported by ENUM_FMT
> test VIDIOC_S_FMT: FAIL
> 
> Reported-by: Naresh Kamboju <naresh.kamboju@linaro.org>
> 
> # git log --oneline  dfef313e9990..c4439713e82a  -- drivers/media/v4l2-core/
> 1efe3c28eba1 media: v4l2-mem2mem: Fix spurious v4l2_m2m_buf_done
> 463c43fcd97e Merge tag 'v5.9-rc7' into patchwork
> 1698a7f15112 media: v4l2-mem2mem: simplify poll logic
> 566463afdbc4 media: v4l2-mem2mem: always consider OUTPUT queue during poll
> 5823833c9ada media: v4l2-ctrl: Add VP9 codec levels
> 32b6e400c34d media: v4l2-fwnode: Use debug level for printing link frequencies
> d13ee586e026 Merge tag 'v5.9-rc4' into patchwork
> 1faa39e0f3bc media: videobuf-dma-sg: number of pages should be unsigned long
> 44f5b2fffc32 media: v4l2-ctrl: Add frame-skip std encoder control
> 4ad1b0d410c8 media: v4l2-ctrls: Add encoder constant quality control
> d9358563179a media: uapi: h264: Clean slice invariants syntax elements
> f9879eb37829 media: uapi: h264: Increase size of DPB entry pic_num
> c02ff21952a6 media: uapi: h264: Clean DPB entry interface
> eb44c6c9c236 media: uapi: h264: Split prediction weight parameters
> 911ea8ec42de media: v4l2-mem2mem: add v4l2_m2m_suspend, v4l2_m2m_resume
> 38df0b850613 media: v4l2-subdev: Introduce [get|set]_mbus_config pad ops
> 
> 
> Full test log,
> https://lkft.validation.linaro.org/scheduler/job/1987206#L1664
> 

