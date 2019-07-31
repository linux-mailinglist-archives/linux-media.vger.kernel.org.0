Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 390EB7B8B2
	for <lists+linux-media@lfdr.de>; Wed, 31 Jul 2019 06:30:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728136AbfGaEaJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 31 Jul 2019 00:30:09 -0400
Received: from lb1-smtp-cloud7.xs4all.net ([194.109.24.24]:53259 "EHLO
        lb1-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726601AbfGaEaI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 31 Jul 2019 00:30:08 -0400
Received: from [IPv6:2001:983:e9a7:1:a003:9a19:9f18:5372] ([IPv6:2001:983:e9a7:1:a003:9a19:9f18:5372])
        by smtp-cloud7.xs4all.net with ESMTPA
        id sgFTh2U6zur8TsgFUhB7Xs; Wed, 31 Jul 2019 06:30:06 +0200
Subject: Re: [PATCH v8 00/14] Rockchip ISP1 Driver
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
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <74bb0ba1-2859-39ff-d946-129a440ba150@xs4all.nl>
Date:   Wed, 31 Jul 2019 06:29:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <8ce532de-6c26-f8db-8754-c8dd1eb0764b@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfGzGe2A7zD3Qrqunsp8MLlEAQbAkyPphsu4wr29b/OTwg0ooPoJd7bndOwd3J9ejKOkxJ0cbjD/OJg+O16w41BuIWIlG3qWHhNj4eIzypt9VClWiUenQ
 4x7WMzM3EDH3+8ogHw2UwVEBfa1MyMYbAnDNey6xByiD5Wv9r4W4gy7c0JqdRYslaPc5CXk8ImfWn1WmyK1UxzxdABmfyRE9wRSGN6LUnRMNLnz2h3Uu3Zmj
 GcuBNqz1HMIzXzU+K1FbkUOirZ8hl1gN5Ssxqc+CsDC7DV+GxuL4etCx//b1LD5Hlqetzi3oAgR3sb9xwyO5/2TmIw8FFif2dAanEKIld2rvhd8QMb1Ard9X
 PDWv82mvvKdmyhnVELfgFBaZRw3s2XdoSSbeQW8AkPIs1RaoLZXROpEzXjU9+o1F4A1nHRoTawPL2PCZdzCienvTs8zOw83mL8a44xdnTsavmL1afCD6f4o9
 sBvzFt3sWvguoyiCdxA0UqHmC4GqQt3xY34Xfk3dad0NU1wBTzlPGHEb8Wt6epA6/mthSbkYjmX9HKU1HgVA+0VqgcWfBXyk22gylbCvUdM3XAyeuw1gwNkY
 cJwgsZ2DQesP0gsq8wwmYH8LmF0MFVMfpyb02nlrYe/As0/mdsNQ80mV1DrsBW9dsmz3HyGuLRcfBcBGzjvEnfd2VyM90uoGX9xXzBnWiFVtMgDdtrxaqiY9
 UzEjBxyl9QMWoDHPyXkQ40ghRZD9rCmYenDzIA0wqYdwF9Se2KK6HdVv7nW98Dy9rMitePuYayEtMq0Lz2A7I1aT4D13sBVPeJfIkMiq0V3nUEvzq06roAep
 A9RYAfeRK/G6AAJlh5HBySCFH+2nIX3sqTXDEFlh61RvW+cgEfjWE9Y7PIfEbPh2tpvmAthNdusM/7GBkEA/nTyxHG+5jTfVc1ds3Cx/
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 7/31/19 2:08 AM, Helen Koike wrote:
> 
> 
> On 7/30/19 5:50 PM, Helen Koike wrote:
>>
>>
>> On 7/30/19 5:15 PM, Hans Verkuil wrote:
>>> On 7/30/19 8:42 PM, Helen Koike wrote:
>>>> Hello,
>>>>
>>>> I'm re-sending a new version of ISP(Camera) v4l2 driver for rockchip
>>>> rk3399 SoC.
>>>>
>>>> I didn't change much from the last version, just applying the
>>>> suggestions made in the previous one.
>>>>
>>>> This patchset is also available at:
>>>> https://gitlab.collabora.com/koike/linux/tree/rockchip/isp/v8
>>>>
>>>> Libcamera patched to work with this version:
>>>> https://gitlab.collabora.com/koike/libcamera
>>>> (also sent to the mailing list)
>>>>
>>>> I tested on the rockpi 4 with a rpi v1.3 sensor and also with the
>>>> Scarlet Chromebook.
>>>>
>>>> Known issues (same as in v7):
>>>> -------------
>>>> - Reloading the module doesn't work (there is some missing cleanup when
>>>> unloading)
>>>> - When capturing in bayer format, changing the size doesn't seem to
>>>> affect the image.
>>>> - crop needs more tests
>>>> - v4l2-compliance error:
>>>>         fail: v4l2-test-controls.cpp(824): subscribe event for control 'Image Processing Controls' failed
>>>> test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: FAIL
>>>
>>> Can you mail me the full v4l2-compliance output?
>>
>> Sure, please check here: http://ix.io/1Q5u
>> I updated v4l-utils with the latest version and I re-ran bootstrap/configure/make,
>> but for some reason the hash from the link above is not the latest commit, probably some
>> old configuration somewhere. I'll resend this log as soon as I get v4l2-compliance
>> properly updated.
> 
> Please see the output of v4l2-compliance here with an updated v4l-utils: http://ix.io/1Q6A

So this FAIL is for /dev/v4l-subdev0 (rkisp1-isp-subdev).

What is weird that this subdev does not appear to have controls at all.

What is the output of 'v4l2-ctl -d /dev/v4l-subdev0 -l'? And if it lists
controls, then why?

If you run 'v4l2-compliance -u /dev/v4l-subdev0', do you get a fail as
well?

BTW, note that struct rkisp1_isp_subdev has a ctrl_handler field that
isn't used at all.

Regards,

	Hans
