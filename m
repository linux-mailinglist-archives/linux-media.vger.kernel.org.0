Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 14C1B7B8EA
	for <lists+linux-media@lfdr.de>; Wed, 31 Jul 2019 06:55:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728821AbfGaEza (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 31 Jul 2019 00:55:30 -0400
Received: from lb1-smtp-cloud7.xs4all.net ([194.109.24.24]:44049 "EHLO
        lb1-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725970AbfGaEza (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 31 Jul 2019 00:55:30 -0400
Received: from [IPv6:2001:983:e9a7:1:a003:9a19:9f18:5372] ([IPv6:2001:983:e9a7:1:a003:9a19:9f18:5372])
        by smtp-cloud7.xs4all.net with ESMTPA
        id sge6h2adHur8Tsge7hB9Hs; Wed, 31 Jul 2019 06:55:28 +0200
Subject: Re: [PATCH v8 00/14] Rockchip ISP1 Driver
From:   Hans Verkuil <hverkuil@xs4all.nl>
To:     Helen Koike <helen.koike@collabora.com>,
        linux-rockchip@lists.infradead.org
Cc:     devicetree@vger.kernel.org, eddie.cai.linux@gmail.com,
        mchehab@kernel.org, heiko@sntech.de, jeffy.chen@rock-chips.com,
        zyc@rock-chips.com, linux-kernel@vger.kernel.org,
        tfiga@chromium.org, hans.verkuil@cisco.com,
        laurent.pinchart@ideasonboard.com, sakari.ailus@linux.intel.com,
        kernel@collabora.com, ezequiel@collabora.com,
        linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        zhengsq@rock-chips.com
References: <20190730184256.30338-1-helen.koike@collabora.com>
 <dbdfed3e-7bb6-bf1f-64b9-ab7298193e2d@xs4all.nl>
 <41e7e574-2708-eb4c-ea30-e6a1ac9c073e@collabora.com>
 <8ce532de-6c26-f8db-8754-c8dd1eb0764b@collabora.com>
 <74bb0ba1-2859-39ff-d946-129a440ba150@xs4all.nl>
 <fb1327fb-0903-ce62-4eea-94b81f599b62@xs4all.nl>
Message-ID: <13d89676-ae84-5904-7606-935501cb2d89@xs4all.nl>
Date:   Wed, 31 Jul 2019 06:55:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <fb1327fb-0903-ce62-4eea-94b81f599b62@xs4all.nl>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfP/q3EnArJxBpSF7A97Y6c/kJMiNjcY8zTy1HJDi56O4eVd8ArhL5LDpNvq47gai47NHfK3L/be0dDM8KvqGTek5mSMdQdRExvMPD+eKajxit+ZkID0N
 MAdRENuetD+cl+lty3C1NbyjzQw0VJwr+5++KWyNiJuCIcI6RMa0rCtwptR0Ad0cEM9CGiWNY8QqF0YzI+q+VO71GOui9E0B3/UhGbf8ZxlHIFzWqMfeI4i6
 hLWvaxKefJkS7bfuinmY8GOR76RBltnftT/YDcbRHO3qY7dvkTgmMOerg/xHF4Ij2Lq5th5LvovVHJuW5klfK2VsG0uTjJ6ZMBUZ4rbnf37GxY6WaXSJ6XJB
 FhTW2BEfW4VenQAPOHaIkm3hQn1X7ekj6x6EV1LIa/wquo48Rh09wt2Xq8y1NyOOI4iC/ErXScmxv/DACce1qOh++h573A7rEbb4f3KNnXNQV2JUXvOpZ0NL
 R61GhuJ8xT3kvjNlLgnB+0moQokpBHWbKMXSau7N1DoSrliH0OBM/4GORn82wfr7VHmHPEQRSkKHVGmfZFPUbuBCXbMGG3I23gBpV7sBLP6dzVKCzNuMaw61
 RrgOQZUI+bQH/UZEBHlCzF4GKdncBvitwaF30Na1rgM6pcQSbbbfkf61ugGvnfVCCYyYXt86cWVGQ8tH5Ps1N/DDRZpc77DoSW0FJI9iQGpgDjg8sG9q+8F7
 Q5HDIJMyGkIOgfynRe+Xcqdd3Exjaahm0TAimUwjNUkCZF3A4ORSifmE687wkIo2quw33fguQ9xP4A518Nbq1//AXAtlFAMbJlJ5vUkCGx2voDSE58lM7oit
 VOKxNY5RXCVnLXHu5YPk9eJe9BPGdStm/Orc3ckITathFVYxO1SwlrSYbgdXwMmn7/Oj2wdFLxCXkn20eCOXGdtEmbKK7PKMMnHZaj3y
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 7/31/19 6:33 AM, Hans Verkuil wrote:
> On 7/31/19 6:29 AM, Hans Verkuil wrote:
>> On 7/31/19 2:08 AM, Helen Koike wrote:
>>>
>>>
>>> On 7/30/19 5:50 PM, Helen Koike wrote:
>>>>
>>>>
>>>> On 7/30/19 5:15 PM, Hans Verkuil wrote:
>>>>> On 7/30/19 8:42 PM, Helen Koike wrote:
>>>>>> Hello,
>>>>>>
>>>>>> I'm re-sending a new version of ISP(Camera) v4l2 driver for rockchip
>>>>>> rk3399 SoC.
>>>>>>
>>>>>> I didn't change much from the last version, just applying the
>>>>>> suggestions made in the previous one.
>>>>>>
>>>>>> This patchset is also available at:
>>>>>> https://gitlab.collabora.com/koike/linux/tree/rockchip/isp/v8
>>>>>>
>>>>>> Libcamera patched to work with this version:
>>>>>> https://gitlab.collabora.com/koike/libcamera
>>>>>> (also sent to the mailing list)
>>>>>>
>>>>>> I tested on the rockpi 4 with a rpi v1.3 sensor and also with the
>>>>>> Scarlet Chromebook.
>>>>>>
>>>>>> Known issues (same as in v7):
>>>>>> -------------
>>>>>> - Reloading the module doesn't work (there is some missing cleanup when
>>>>>> unloading)
>>>>>> - When capturing in bayer format, changing the size doesn't seem to
>>>>>> affect the image.
>>>>>> - crop needs more tests
>>>>>> - v4l2-compliance error:
>>>>>>         fail: v4l2-test-controls.cpp(824): subscribe event for control 'Image Processing Controls' failed
>>>>>> test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: FAIL
>>>>>
>>>>> Can you mail me the full v4l2-compliance output?
>>>>
>>>> Sure, please check here: http://ix.io/1Q5u
>>>> I updated v4l-utils with the latest version and I re-ran bootstrap/configure/make,
>>>> but for some reason the hash from the link above is not the latest commit, probably some
>>>> old configuration somewhere. I'll resend this log as soon as I get v4l2-compliance
>>>> properly updated.
>>>
>>> Please see the output of v4l2-compliance here with an updated v4l-utils: http://ix.io/1Q6A
>>
>> So this FAIL is for /dev/v4l-subdev0 (rkisp1-isp-subdev).
>>
>> What is weird that this subdev does not appear to have controls at all.
>>
>> What is the output of 'v4l2-ctl -d /dev/v4l-subdev0 -l'? And if it lists
>> controls, then why?
>>
>> If you run 'v4l2-compliance -u /dev/v4l-subdev0', do you get a fail as
>> well?
> 
> I see the same issue with v4l-subdev1, but I see no "Media Driver Info"
> in the v4l2-compliance output for that subdev. That's strange. It would
> be good to know why that's happening.

It looks to be some parenting issue: v4l2-compliance expects to find
a mediaX directory in /sys/dev/char/81\:Y/device/ where 81:Y is the major/minor
of /dev/v4l-subdev1.

Because is this mi_get_media_fd() cannot find the media device for the subdev
in v4l2-compliance.

Regards,

	Hans
