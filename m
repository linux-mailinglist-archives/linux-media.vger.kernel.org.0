Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 31E881B78A
	for <lists+linux-media@lfdr.de>; Mon, 13 May 2019 15:56:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730283AbfEMN4k (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 13 May 2019 09:56:40 -0400
Received: from lb1-smtp-cloud8.xs4all.net ([194.109.24.21]:45417 "EHLO
        lb1-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727272AbfEMN4j (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 13 May 2019 09:56:39 -0400
Received: from [192.168.2.10] ([46.9.252.75])
        by smtp-cloud8.xs4all.net with ESMTPA
        id QBRShjPqt0YQeQBRVhdGfx; Mon, 13 May 2019 15:56:37 +0200
Subject: Re: Format ioctls (Input 1) test Cropping failed: 4.19, 4.14, 4.9 and
 4.4
To:     Naresh Kamboju <naresh.kamboju@linaro.org>,
        linux-media@vger.kernel.org
Cc:     open list <linux-kernel@vger.kernel.org>,
        Sami Tolvanen <samitolvanen@google.com>,
        paul.kocialkowski@bootlin.com, ezequiel@collabora.com,
        treding@nvidia.com, niklas.soderlund+renesas@ragnatech.se,
        sakari.ailus@linux.intel.com,
        Hans Verkuil <hans.verkuil@cisco.com>, mchehab@kernel.org,
        lkft-triage@lists.linaro.org
References: <CA+G9fYv+M_8p99c6i=akmuhHSCW6MdF-29CPKrwDsd2EW_LsbQ@mail.gmail.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <cc4b91e4-13f8-c489-e2ce-445770ddf876@xs4all.nl>
Date:   Mon, 13 May 2019 15:56:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CA+G9fYv+M_8p99c6i=akmuhHSCW6MdF-29CPKrwDsd2EW_LsbQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfOJt+EMQhInEWS9jXag4ZCtTkSsqAUQJjnm8CAQqWK/QNYsj+Ujy5F68DvUKN3/pgZWiTaE42IbajxxMa6TEK8MFstYf0qfqIs5vG8GalZVz6tTd0PSd
 d4k85wfsG36O8iHu/aYwHuw9Z6uCuwQIXhvimkeEkH/eWRH4uGCxIgvd0ckka1pbsN3DkJ5Ig6ba3XLqvhC7+8K0V5ZiIJP0syEPNJbpBxMNB4+MF1p5u8rM
 vgnWp84A+ZraRmR6HNXCwqPSpwoAhAfBCZ+h3J1u2VqQbRFEC8seWmvRpAD0iYWRloHLO0ngm2FGviMD3NhfTZKgAHVGVPBLyJQuKwXCuxQHm1uKHoLk6H4T
 9rjg0HMFdn1gw0GxEJaFgYMTLZKdEpSUHCN9QkVomBjIVFRSM9f7yL03kBDtHaLZGVKuOOXYGOaHSH/0JQiXrbkAXQ3NVmU/HK+FnSCoV7VXivrTVYbJQmeB
 AD1AiLx6RiI1+eQbBVBrDT7uG8GSkZqG3FQl5miHk8/8NlL8V1A0FYd14xSfx85o0v11+owoBgLSqZqJut1z66wWR81gbNJlUmPMqJAvFBdq7EkmmJu2ZiIv
 F3xbSVXWEhtz2JSP0DNOht6t
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 5/13/19 3:36 PM, Naresh Kamboju wrote:
> Format ioctls (Input 1) test Cropping failed on all devices running
> 4.19, 4.14, 4.9 and 4.4 kernel branches.
> 
> Format ioctls (Input 1):
> 
> ...
> test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
> fail: ../../../v4l-utils-1.16.0/utils/v4l2-compliance/v4l2-test-formats.cpp(1425):
> doioctl(node, VIDIOC_CROPCAP, &cap)
> fail: ../../../v4l-utils-1.16.0/utils/v4l2-compliance/v4l2-test-formats.cpp(1447):
> testLegacyCrop(node)
> test Cropping: FAIL

There is no easy patch you can backport to fix this and I wouldn't bother with this.

> 
> Test passes on mainline, -next and 5.0
> Test failed on 4.19, 4.14, 4.9 and 4.4 for all devices
> 
> steps to reproduce:
> 
>        # boot 4.19/4.14/4.9 kernel on x86_64 / Juno / hikey /  device
>        #  install v4l-utils package
>        # modprobe vivid.ko no_error_inj=1
>        # v4l2-compliance -v -d /dev/video0
> 
> Test results comparison on all branches,
> https://qa-reports.linaro.org/_/comparetest/?project=22&project=6&project=58&project=135&project=40&project=23&project=159&suite=v4l2-compliance&test=Cropping
> 
> Test output log,
> https://lkft.validation.linaro.org/scheduler/job/708755#L2236
> 
> Best regards
> Naresh Kamboju
> 

Be aware that v4l2-compliance is meant to be compiled directly from the
v4l-utils master repo, and run against the latest media-tree master
repository. It's not meant to be backwards compatible with older kernels.

If you want to do regression testing with v4l2-compliance against older
kernels, then it would actually be better to pick a v4l2-compliance version
from around the time that kernel version was first released.

Regards,

	Hans
