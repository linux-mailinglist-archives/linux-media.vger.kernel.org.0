Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D6AFD7B8BC
	for <lists+linux-media@lfdr.de>; Wed, 31 Jul 2019 06:33:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728695AbfGaEdQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 31 Jul 2019 00:33:16 -0400
Received: from lb3-smtp-cloud7.xs4all.net ([194.109.24.31]:33771 "EHLO
        lb3-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728455AbfGaEdQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 31 Jul 2019 00:33:16 -0400
Received: from [IPv6:2001:983:e9a7:1:a003:9a19:9f18:5372] ([IPv6:2001:983:e9a7:1:a003:9a19:9f18:5372])
        by smtp-cloud7.xs4all.net with ESMTPA
        id sgIYh2UxBur8TsgIZhB7oo; Wed, 31 Jul 2019 06:33:11 +0200
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
Message-ID: <fb1327fb-0903-ce62-4eea-94b81f599b62@xs4all.nl>
Date:   Wed, 31 Jul 2019 06:33:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <74bb0ba1-2859-39ff-d946-129a440ba150@xs4all.nl>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfEaWO9wIFWm8X+G7TYQwIadLRFXiGM7jx6AHCtLf88bMkZ2Bzi3fT6ovkUy5dg9H734PKmhtKSn28Kl0V5z2nXAfF55ZUJehCnTKFrLSEbfHbYCMVj0V
 AdK4qCjivJzIPZAxYnRLbxZuYQPi2DII98Iq4GMGm1Pdh+0MPMibGL/RspqvqcwkpxsESqJDnYol38s183u3MMC8CteYV9rK0J8UtoUIgimlCIffgCkicd1y
 v6bSOrSlDoAqfENUPdzoYP4kL6BBiddJwgBk+gCTwa4MSB9WddH7CGDTdfdN7JxhOfLAbBip9rscpaCopmE6PMNkz0/InnEnNDdb5rRL4h7cbq6lfigdBBdr
 DcdlkXhiJi4N98aBRuLL+T6uOLaJTWtB1KrS3U+iJyeEfXflY1no8/QIA9zJA4MHduEYYCTlVTAxFz/Uj5eYe+bjK8A4MW2byCizEcGtTOrgejHErtKbcuNr
 45W/HpOE6wM7dRT4LnQ2pgkT2gptz9/sIXgOLM7yNARhYB6cl4kCqgYoBmJp0eIZOrRLRcMD3aCpjXriwA5Vo2a5tiDOAs/YenYb8NV0QBBvtLkMrkglUjRe
 dP/3S1W5wuDNRhVwn8Qk+WubDlmdR+yDWqt80MUHWJ2cHzGlSJglDhk2xQm6r5osHBsos7eODGO2xwD4hF2DnEr6eJlY3a6PzuB4HfW+cis62LGTFNwrPYp7
 eXuBQPWn69n4V9IV3GaXIOoZ2dS0vYD7gh3cNmJObqDOl51gODwzcV2qEAKD6aNLoZVrW0Lq7WStOVlgl6MFOM7+5YQySO3NtGZtYh9sWfIA4vfdE1mNmWoQ
 RC6nCFIb+tvbJJlCznXJZQjSn66Gjy8+hS4JUstjk0C2Zk/VuaRONpc+s91B0IeBcPd7aWIEw3eJQcRDqJzE/a+VbRVmYoMjd5EI6GiE
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 7/31/19 6:29 AM, Hans Verkuil wrote:
> On 7/31/19 2:08 AM, Helen Koike wrote:
>>
>>
>> On 7/30/19 5:50 PM, Helen Koike wrote:
>>>
>>>
>>> On 7/30/19 5:15 PM, Hans Verkuil wrote:
>>>> On 7/30/19 8:42 PM, Helen Koike wrote:
>>>>> Hello,
>>>>>
>>>>> I'm re-sending a new version of ISP(Camera) v4l2 driver for rockchip
>>>>> rk3399 SoC.
>>>>>
>>>>> I didn't change much from the last version, just applying the
>>>>> suggestions made in the previous one.
>>>>>
>>>>> This patchset is also available at:
>>>>> https://gitlab.collabora.com/koike/linux/tree/rockchip/isp/v8
>>>>>
>>>>> Libcamera patched to work with this version:
>>>>> https://gitlab.collabora.com/koike/libcamera
>>>>> (also sent to the mailing list)
>>>>>
>>>>> I tested on the rockpi 4 with a rpi v1.3 sensor and also with the
>>>>> Scarlet Chromebook.
>>>>>
>>>>> Known issues (same as in v7):
>>>>> -------------
>>>>> - Reloading the module doesn't work (there is some missing cleanup when
>>>>> unloading)
>>>>> - When capturing in bayer format, changing the size doesn't seem to
>>>>> affect the image.
>>>>> - crop needs more tests
>>>>> - v4l2-compliance error:
>>>>>         fail: v4l2-test-controls.cpp(824): subscribe event for control 'Image Processing Controls' failed
>>>>> test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: FAIL
>>>>
>>>> Can you mail me the full v4l2-compliance output?
>>>
>>> Sure, please check here: http://ix.io/1Q5u
>>> I updated v4l-utils with the latest version and I re-ran bootstrap/configure/make,
>>> but for some reason the hash from the link above is not the latest commit, probably some
>>> old configuration somewhere. I'll resend this log as soon as I get v4l2-compliance
>>> properly updated.
>>
>> Please see the output of v4l2-compliance here with an updated v4l-utils: http://ix.io/1Q6A
> 
> So this FAIL is for /dev/v4l-subdev0 (rkisp1-isp-subdev).
> 
> What is weird that this subdev does not appear to have controls at all.
> 
> What is the output of 'v4l2-ctl -d /dev/v4l-subdev0 -l'? And if it lists
> controls, then why?
> 
> If you run 'v4l2-compliance -u /dev/v4l-subdev0', do you get a fail as
> well?

I see the same issue with v4l-subdev1, but I see no "Media Driver Info"
in the v4l2-compliance output for that subdev. That's strange. It would
be good to know why that's happening.

Regards,

	Hans

> 
> BTW, note that struct rkisp1_isp_subdev has a ctrl_handler field that
> isn't used at all.
> 
> Regards,
> 
> 	Hans
> 

