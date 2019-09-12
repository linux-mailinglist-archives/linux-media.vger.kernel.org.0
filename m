Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 520F0B11D0
	for <lists+linux-media@lfdr.de>; Thu, 12 Sep 2019 17:08:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732842AbfILPIX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 12 Sep 2019 11:08:23 -0400
Received: from lb2-smtp-cloud8.xs4all.net ([194.109.24.25]:39049 "EHLO
        lb2-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1732566AbfILPIX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 12 Sep 2019 11:08:23 -0400
Received: from [192.168.2.10] ([46.9.232.237])
        by smtp-cloud8.xs4all.net with ESMTPA
        id 8QhliC04eQUjz8Qhpi9hWT; Thu, 12 Sep 2019 17:08:21 +0200
Subject: Re: [RFC] V4L2 & Metadata: switch to /dev/v4l-metaX instead of
 /dev/videoX
To:     Philipp Zabel <p.zabel@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>
References: <f26a4eb0-7009-a25f-29bc-3a292d2d79e1@xs4all.nl>
 <60769f0c-506c-4057-00ce-f4c8620441c5@ideasonboard.com>
 <20190912112114.3a66663f@coco.lan>
 <cb7fe2ed-d1f2-6ac8-6c0f-ec6b1aa5ddf3@xs4all.nl>
 <1568300229.3069.4.camel@pengutronix.de>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <dbea3dbe-835c-f68f-9fd5-0806efd1bae0@xs4all.nl>
Date:   Thu, 12 Sep 2019 17:08:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1568300229.3069.4.camel@pengutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfH2WdZ67u8cKJQEVuVsEN2dzQm5IjDHFpNRs71pskFRTZoOhu2W/P9CKZZM7hlD+VTn1hOwI7koeog6s/sGE3jQS+7XxJ56bDPNF0i5DFH471alE3XXe
 oCRvzwNcwumLsC5t6AZkTI9lzgRAKXS5JpwZkDjmBJXFOrQlA+9UsP9/qs8vbOpS049hhjxJqoLRYj5G922gAVVIJZVdq36jSx8S+kT6eE6gYRSlp7vyElAJ
 RnnsyS2QzAnsSjDjjbMddZXJ53fOpIny/7WFrrX6vHQ5C1VnlbNovMP818JQc3eA
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 9/12/19 4:57 PM, Philipp Zabel wrote:
> On Thu, 2019-09-12 at 16:49 +0200, Hans Verkuil wrote:
>> On 9/12/19 4:21 PM, Mauro Carvalho Chehab wrote:
>>> Em Thu, 12 Sep 2019 14:16:11 +0100
>>> Kieran Bingham <kieran.bingham@ideasonboard.com> escreveu:
>>>
>>>> Hi Hans,
>>>>
>>>> On 12/09/2019 08:48, Hans Verkuil wrote:
>>>>> Hi all,
>>>>>
>>>>> I am increasingly unhappy about the choice of /dev/videoX for metadata devices.
>>>>>
>>>>> It is confusing for end-users (especially w.r.t. the common uvc driver) and
>>>>> if we want to change this, then we need to do it soon.
>>>
>>> Kernel has (about) nothing to do with how the userspace devnodes are
>>> named, as the actual name is given by udev.
>>
>> To my knowledge the standard udev rules do not rename anything for media
>> devices, so in reality it IS the kernel that decides this.
>>
>> But this is why I suggested to put it under a kernel config option.
>>
>>>
>>> Anyway, from Kernel standpoint, it sounds too late to change the name
>>> of the devices from "videoX" to something else, as a change like that
>>> may break existing apps.
>>>
>>> It could make sense to have something like that at udev rules.
>>
>> But wouldn't that break existing apps as well?
>>
>> A bigger problem is that it isn't easy to detect the difference between
>> a regular video device and a metadata device: you'd have to call QUERYCAP
>> to determine that.
> 
> v4l_id does call VIDIOC_QUERYCAP [1] to fill the ID_V4L_CAPABILITIES
> colon separated list.
> 
> [1] https://github.com/systemd/systemd/blob/master/src/udev/v4l_id/v4l_id.c#L66

Interesting. It's very outdated, though.

Regards,

	Hans

> 
> regards
> Philipp
> 

