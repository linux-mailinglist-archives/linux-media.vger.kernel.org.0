Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DA7F33C598
	for <lists+linux-media@lfdr.de>; Tue, 11 Jun 2019 10:09:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404560AbfFKII4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 11 Jun 2019 04:08:56 -0400
Received: from lb1-smtp-cloud8.xs4all.net ([194.109.24.21]:38881 "EHLO
        lb1-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2404401AbfFKII4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 11 Jun 2019 04:08:56 -0400
Received: from [192.168.2.10] ([46.9.252.75])
        by smtp-cloud8.xs4all.net with ESMTPA
        id abpqhfVXM41bFabpthCqbK; Tue, 11 Jun 2019 10:08:54 +0200
Subject: Re: [RFC PATCH 1/5] media: videodev2: add
 V4L2_FMT_FLAG_DYN_RESOLUTION
To:     Tomasz Figa <tfiga@chromium.org>,
        Maxime Jourdan <mjourdan@baylibre.com>
Cc:     Hans Verkuil <hans.verkuil@cisco.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Kamil Debski <kamil@wypas.org>,
        Jeongtae Park <jtp.park@samsung.com>,
        Andrzej Hajda <a.hajda@samsung.com>
References: <20190609143820.4662-1-mjourdan@baylibre.com>
 <20190609143820.4662-2-mjourdan@baylibre.com>
 <CAAFQd5AR1SXdMp6xiCEksrmpF7qk+Tg2-w7Ogw47GZx1pU6T_Q@mail.gmail.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <4241550c-e4de-0f93-6181-73c35e527446@xs4all.nl>
Date:   Tue, 11 Jun 2019 10:08:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAAFQd5AR1SXdMp6xiCEksrmpF7qk+Tg2-w7Ogw47GZx1pU6T_Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfNt+QX6Gt6HTLQDYiLPI+p5h6c/Dl1RcRIjpvtUuvuP73Mp8gApth8ZmOSZFZY9FebXa2GHJiIhA6avrGgu1k5kbyD6mDhalEoaxnN6ydXQrL86FjWJc
 2hm+EheUzuhs8toajYBov6cKF1bYDC23pXP0BohdO5AHpLVI63hRcBYbzrKH1+O7t2NALFD5uDfBGyip11255zztx7zLf5aHNzHxUtPcAC74BOkqi0mNPQ5M
 hQh37mdZ1LHVTZLo1XaJIdaIqessS5yyfdKBY4tEuMrOtraEi2Vs65pp5Rv4LstgarAd59AUKIcLDa+ZN8yIOFb1ZJSCOsKzWgjXqXxhA1KjZUgkVzn7X8JF
 +uUB/jwIba6B+8dVK98rDEXvjaGxXOTa3LRHUd6CeWo23+ydKZBY8KIWVJ9T3xoDgg+n/GcwY8NuI+PUlzzywTiIg2lwdQUakE5lsZ7prlJf1+IVsYHF1zCM
 69UAXHWQP5S+XbZtO61v4RNSaNhSq3qMbvC0VvySSrd1122FZnyHWrk0GK/xZL7tYEDiap04r13LJWMa4PEesUKvYkXiYiV+ormLHkFJpm4V6sAAGvN07Wfr
 ZXc=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 6/10/19 5:48 AM, Tomasz Figa wrote:
> Hi Maxime,
> 
> On Sun, Jun 9, 2019 at 11:38 PM Maxime Jourdan <mjourdan@baylibre.com> wrote:
>>
>> Add a enum_fmt format flag to specifically tag coded formats where
>> dynamic resolution switching is supported by the device.
>>
>> This is useful for some codec drivers that can't support dynamic
>> resolution switching for all their listed coded formats. It allows
>> userspace to know whether it should extract the video parameters itself,
>> or if it can rely on the device to send V4L2_EVENT_SOURCE_CHANGE when
>> such changes are detected.
>>
> 
> First of all, thanks for the patch!
> 
> Given the aspect of compatibility and also the general preference for
> the drivers to actually handle dynamic resolution changes, I'd suggest
> inverting the meaning of this flag. With something like
> "V4L2_FMT_FLAG_STATIC_RESOLUTION" it would be more of an exception
> rather than the default behavior.

We had a discussion about that, see this thread: https://lkml.org/lkml/2019/5/31/256

Regards,

	Hans
