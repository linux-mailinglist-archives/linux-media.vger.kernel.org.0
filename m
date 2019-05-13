Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 826C01B728
	for <lists+linux-media@lfdr.de>; Mon, 13 May 2019 15:38:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729610AbfEMNif (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 13 May 2019 09:38:35 -0400
Received: from lb2-smtp-cloud8.xs4all.net ([194.109.24.25]:43027 "EHLO
        lb2-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725866AbfEMNif (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 13 May 2019 09:38:35 -0400
Received: from [192.168.2.10] ([46.9.252.75])
        by smtp-cloud8.xs4all.net with ESMTPA
        id QB9whjKyd0YQeQBA0hdDdD; Mon, 13 May 2019 15:38:32 +0200
Subject: Re: test VIDIOC_G/S_PARM: FAIL on stable 4.14, 4.9 and 4.4
To:     Naresh Kamboju <naresh.kamboju@linaro.org>,
        linux-media@vger.kernel.org
Cc:     open list <linux-kernel@vger.kernel.org>,
        Sami Tolvanen <samitolvanen@google.com>,
        paul.kocialkowski@bootlin.com, ezequiel@collabora.com,
        treding@nvidia.com, niklas.soderlund+renesas@ragnatech.se,
        sakari.ailus@linux.intel.com,
        Hans Verkuil <hans.verkuil@cisco.com>, mchehab@kernel.org,
        lkft-triage@lists.linaro.org
References: <CA+G9fYuC8dgKs04HmyCaKeQ_xwqKBxnh=zsOFjQK+3Fq7AZRyw@mail.gmail.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <5de0df37-f0d0-f54c-2eef-a7533cbe7a25@xs4all.nl>
Date:   Mon, 13 May 2019 15:38:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CA+G9fYuC8dgKs04HmyCaKeQ_xwqKBxnh=zsOFjQK+3Fq7AZRyw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfOZD1CorHOqojS7/3knRw8+4oscN4wDn5nPd5jP0VMGoFObN6OaK/d2CY/dIca8YNDwZBTS5R3Efz9YAGRrjc7DXzFnEiEER+yoXdrLb8Kx/PHczSnjo
 zpeVodVdOwVqSnnXcfjCfmnz7oMu5uTgadcXC+F4oD1StgeKe7rPhW7FodSoQaNfs5+pZJKmeaqwyqbOhAruJOc/weueFi5WjuTMRvSlDdjqV4Xnj+bZ2nej
 wo9DSRVUZGwxglGUWQ3H/zrVyr8E1kRpeYz2kVA6R0t9gKNX+FfMLlPT11zOxr93/08V6hI1k565p8rN75GIzlKBlLCzLsVd3xA0niUVCd1FVLEBb+9jKnN+
 bo4ohxHSClBA6h2HLuP/NpQX2luZeQ3vUhxcMhpsXS/490cETFNZwLYWm99mSIJXRA3Hjy4ecMtkOgtH90CLJWsb+u/pazUufjq3z5MS0wq7c3jBVZUliQTj
 jh+XwcJnr7yHs8A/WY5yMd/sdF6+JAtPD6JAlip5gu5zk+axLY+7L4jFUdgqEiCtJv+ims45PJ+Smi2YOJwfo/bsAkuDew57exNEUJiusZfAFzvEIZzGozIw
 tgNKYdA/L9s5yPkW1A77TdJS
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 5/13/19 3:32 PM, Naresh Kamboju wrote:
> Do you see test VIDIOC_G/S_PARM: FAIL on stable 4.14, 4.9 and 4.4
> kernel branches ?

Probably related to commit 8a7c5594c0202 (media: v4l2-ioctl: clear fields in s_parm).

Regards,

	Hans

> 
> test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
> fail: ../../../v4l-utils-1.16.0/utils/v4l2-compliance/v4l2-test-formats.cpp(1132):
> reserved not zeroed
> test VIDIOC_G/S_PARM: FAIL
> 
> Test passes on mainline, -next, 5.0 and 4.19
> Test failed on 4.14, 4.9 and 4.4
> 
> steps to reproduce:
>        # boot any 4.9/4.14 kernel on x86_64 / Juno / hikey  device
>        #  install v4l-utils package
>        # modprobe vivid.ko no_error_inj=1
>        # v4l2-compliance -v -d /dev/video0
> 
> Full test log,
> https://lkft.validation.linaro.org/scheduler/job/708755#L1791
> 
> Test results comparison on all branches,
> https://qa-reports.linaro.org/_/comparetest/?project=22&project=6&project=58&project=135&project=40&project=23&project=159&suite=v4l2-compliance&test=VIDIOC_G-S_PARM
> 
> Best Regards
> Naresh Kamboju
> 

