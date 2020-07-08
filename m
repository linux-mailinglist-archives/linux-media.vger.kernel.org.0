Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D4D8721821A
	for <lists+linux-media@lfdr.de>; Wed,  8 Jul 2020 10:22:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727826AbgGHIW1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 8 Jul 2020 04:22:27 -0400
Received: from lb1-smtp-cloud8.xs4all.net ([194.109.24.21]:60567 "EHLO
        lb1-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726121AbgGHIW0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 8 Jul 2020 04:22:26 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id t5LQjdN19JcNHt5LTjnmgB; Wed, 08 Jul 2020 10:22:24 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1594196544; bh=zSLr/U1428Ir+70nwCBNJc7m3SPFHU0JiCtQ9gOD9PE=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=MtEDWLuh+m1/bqLBpqcGlR9dqYy93c0M2ofKnGQqABMGUzXjt+WwS1JTJdAJKEgs7
         SGgr+HH7e6YXYwp4a/kAnrXzrn9Wuqa5flom/SC76A/F4JQ5QMNq2bGubJUQ/1JKuK
         J/YOT9bGRZFcUriBZI+y+fei+AyPS5sAA2L6Vq5ZExnrM4mARJWOsJP8mjXv3bvskS
         +56Q9ESOk4eHOEcbMOjxpC1pajehEhJ4cOIgtjCFsXd1SInnt1l0J/ZdCn8fyG2Xt3
         YjKSGrV+2t8LFOLBfsxa9qQwQFufj9i70xo3Cea0BT7UGorFkzv1nTKC0WdOyP80Yz
         fUjxVDXN3eSQQ==
Subject: Re: v4l2-compliance tests for cache flags
To:     Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Sergey Senozhatsky <senozhatsky@chromium.org>
References: <CAPY8ntAogTZHd7Oh_7L+ghh4_DP9AzZ4DuJ9xChN_EmVbGXb1Q@mail.gmail.com>
 <34df23a8-6ab1-aaba-19f7-5193d18a60b0@xs4all.nl>
 <CAPY8ntAjV7vxpb2qFQVY+EYk3Mb0nBfGovYcAvw+0NMFH0j5PQ@mail.gmail.com>
 <20200708035940.GB571@jagdpanzerIV.localdomain>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <01fb82b0-a1b6-9cae-b462-46cbe33491ce@xs4all.nl>
Date:   Wed, 8 Jul 2020 10:22:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200708035940.GB571@jagdpanzerIV.localdomain>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfMqO6LWP0JAyYw3ccqNnqh2f0XDlvotmr37hQM+QSMXRWI63W6Wf4cv3O2nmwEfkrgPPCgzbI/JnNyi5y7xbh16mD+fYGt2VmTUIkAHCETRq8Di+P4OW
 1P6OyEt7wvlDjQTG7tPd+4smUpEu9FhccC6C/IpqsXgKm7IHJnVO/v2tWiLOhqW2tvQ6aXQURwd+Arnjq9DIldmHUsesNJw0N5JJKlMg6RY76Ih6A53k7o0z
 Vxlh+V60d/Y5pPCB/g4qQ4XYsE6vbQgHCrTmpMRIMwGxh132sbJagGwq5yqBUlhJqVl99GLAnjrxJw0yEwIM3A==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 08/07/2020 05:59, Sergey Senozhatsky wrote:
> On (20/07/07 15:41), Dave Stevenson wrote:
>>> v4l2-compliance tests are in sync with our master and it expects that
>>> that kernel is used.
>>
>> Thanks, I'd never noted that restriction. All previous times I'd used
>> v4l2-compliance against any kernel it had performed as expected. This
>> is the first change that causes a major failure of tests due to an
>> older kernel.
> 
> It depends on Linux UAPI headers, so the restriction is sort of mandated,
> but probably not widely recognized the by the distributions, looking at
> arch, for instance:
> https://git.archlinux.org/svntogit/packages.git/tree/trunk/PKGBUILD?h=packages/v4l-utils
> 
> Adding a Linux version check code can be a bit intrusive. There has been
> a whole bunch of changes all over the place, for instance:
> 
> ---
> 
> +++ b/utils/v4l2-compliance/v4l2-test-buffers.cpp
> @@ -381,8 +381,6 @@ int buffer::check(unsigned type, unsigned memory, unsigned index,
>         if (g_flags() & V4L2_BUF_FLAG_BFRAME)
>                 frame_types++;
>         fail_on_test(frame_types > 1);
> -       fail_on_test(g_flags() & (V4L2_BUF_FLAG_NO_CACHE_INVALIDATE |
> -                                 V4L2_BUF_FLAG_NO_CACHE_CLEAN));
> ---
> 
> So running newer v4l-compliance against the older kernel or older
> v4l-compliance against the newer kernel may trigger various failures.

It shouldn't. It's (I believe) just the check that those two flags
are cleared if cache hints are not supported that should be under a
version check.

Regards,

	Hans
