Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BBDD2101D78
	for <lists+linux-media@lfdr.de>; Tue, 19 Nov 2019 09:31:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727097AbfKSIbG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 19 Nov 2019 03:31:06 -0500
Received: from lb3-smtp-cloud7.xs4all.net ([194.109.24.31]:33631 "EHLO
        lb3-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725815AbfKSIbG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 19 Nov 2019 03:31:06 -0500
Received: from [IPv6:2001:983:e9a7:1:9879:d2e2:f0e2:9c7]
 ([IPv6:2001:983:e9a7:1:9879:d2e2:f0e2:9c7])
        by smtp-cloud7.xs4all.net with ESMTPA
        id WyuXiBiMtcs92WyuYixyxi; Tue, 19 Nov 2019 09:31:03 +0100
Subject: Re: [PATCH v11 00/11] Rockchip ISP Driver
To:     Ezequiel Garcia <ezequiel@collabora.com>,
        Helen Koike <helen.koike@collabora.com>,
        linux-rockchip@lists.infradead.org
Cc:     mark.rutland@arm.com, devicetree@vger.kernel.org,
        eddie.cai.linux@gmail.com, mchehab@kernel.org, heiko@sntech.de,
        linux-arm-kernel@lists.infradead.org, gregkh@linuxfoundation.org,
        jeffy.chen@rock-chips.com, zyc@rock-chips.com,
        linux-kernel@vger.kernel.org, tfiga@chromium.org,
        robh+dt@kernel.org, hans.verkuil@cisco.com,
        laurent.pinchart@ideasonboard.com, sakari.ailus@linux.intel.com,
        kernel@collabora.com, linux-media@vger.kernel.org,
        jacob-chen@iotwrt.com, zhengsq@rock-chips.com
References: <20191114051242.14651-1-helen.koike@collabora.com>
 <996a9b6a-0e45-d627-9263-539c22e5f1c0@xs4all.nl>
 <7fd4bf99fd6316da8acaf0a27b6845bedbf4b25f.camel@collabora.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <eafffc6f-061e-65ab-079b-b2bd613d61cb@xs4all.nl>
Date:   Tue, 19 Nov 2019 09:30:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <7fd4bf99fd6316da8acaf0a27b6845bedbf4b25f.camel@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfMGsN9TkGwtzRSuVMeonrxJLrUw1XmSkg4IsuhBSRsDFrLC11ivzCFX8aJcfdWeCV5jNkPvVEVJSSeMksMMXQZnuPOLV3vA0z47kH28NIXezbzRMwJVm
 i0kEQCLAGczqiaGYtSeRJesLq8/NrrPpGhMsD5vDBBc/iagU+JIHt8BmMKjF2tn59ibNsHaMuAnmFWra4a3gUMCdRT/gdrQnHJnrgik0lQofZ0esyk/Nu/DX
 D65EhczIhRRFxGvaB1eAhJi/v0F6Ozd1KE9URen/4s2vGTWfsgIEnqi5DQRRBJ3pKz0y7XeprGFaVM8esUrwKqcOaItP9rvtsxQLOCB1suLvdupJrx6pZYcd
 iWWSqkh2ooYO5vpz+kAD70HUg1T9njp9gUjPEB1af8RTf1yux/jSVXu9QBMou3ErrndZ/+b7CCQUyjSvRcI54ZJ1qKKEogk7KHzRN5GuJiW4izKHthrhtquJ
 lJRTd5LRqspOvFC13to5LvBSzTB/A6dc8kERZs3++ygx9drc3Pfswnzxjv4UFLAzJgD55HoGwrTnTGGiqk/0l76+4P1eGQqy+V5z6BSX/MQz/uqOVmkwIQvh
 WgyLG9k1iJZt7GaX1QAUCU60ghZsWb2U2SbFm4CfNmutP3mOH2/S5S80JOkq+4SDt7GapP1ysMdumPOfxMrNrOWP3GIS/LD3j0ezNW201zm+k+NTVxtsn0Ya
 HkMF0ziheb1qenYexxUxz7vlP/y+71YSjuoQNMyW3snuPKVVdh+soPSbqcn6vYv63+ZXtP1L1lQMPl2DcMxoJ49vEp/WW69/QbpDfkwNJBrK6Kl2rOoTW8dY
 NPEIK9sFKpczRAj9HHUjgeBUW0rX4OPH1vKozIZYCDVG7Zps434Nnr/angm3ZTcstyAS+glPSm0Fhg5fLeXjIzwqwsxsE9veXu/iHB5znhQFN0JBAly+qNUa
 gx9OZhTsTsatruBMqPo8WnJkJQ+8GIKhvtmPx37mkaMGy+AWBhswC+PNn0A7UhKlvALCrAZCqGTq1XPM00wI+N0yrzK9CsIKHTUokmZ2MZc3b8Kf
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 11/18/19 7:52 PM, Ezequiel Garcia wrote:
> Hi Hans,
> 
> Thanks for taking care of this.
> 
> On Thu, 2019-11-14 at 09:42 +0100, Hans Verkuil wrote:
>> On 11/14/19 6:12 AM, Helen Koike wrote:
>>> Hello,
>>>
>>> This series adds the Rockchip Image Signal Processing Unit v1 driver to
>>> staging.
>>>
>>> The main reason to be in staging is that people are already using it from the
>>> mailing list (including libcamera), and having it in mainline makes the workflow
>>> easier. Also, it is easier for other people to contribute back (with code
>>> or testing the driver).
>>>
>>> We plan to actively work on this driver to get it our of staging.
>>>
>>> This patchset is also available at:
>>> https://gitlab.collabora.com/koike/linux/tree/rockchip/isp/v11
>>>
>>> Libcamera patched to work with this version:
>>> https://gitlab.collabora.com/koike/libcamera
>>> (also sent to the mailing list)
>>>
>>> The major difference in v11 are:
>>> - Fixed compiling warnings found with W=1
>>> - Fixed checkpatch errors
>>> - Add clock-names values in dt-bindings
>>
>> Looking at checkpatch I see a few remaining issues that I believe should be
>> fixed before merging this:
>>
>> CHECK: spinlock_t definition without comment
>> #575: FILE: drivers/staging/media/rkisp1/isp_stats.h:43:
>> +       spinlock_t irq_lock;
>>
>> CHECK: struct mutex definition without comment
>> #581: FILE: drivers/staging/media/rkisp1/isp_stats.h:49:
>> +       struct mutex wq_lock;
>>
>> CHECK: spinlock_t definition without comment
>> #1648: FILE: drivers/staging/media/rkisp1/isp_params.h:25:
>> +       spinlock_t config_lock;
>>
>> CHECK: spinlock_t definition without comment
>> #2058: FILE: drivers/staging/media/rkisp1/capture.h:145:
>> +       spinlock_t vbq_lock;
>>
> 
> I'd rather merge this as-is, adding a TODO entry stating
> we need to revisit locking specifically, because I'd like
> to take a close look at these spinlocks/mutex,
> instead of just addding comments for then.

Fair enough! Just as long as it is mentioned somewhere.

> 
>> Once this is done together with the Jacob Chen email clarification
>> it is ready to be merged for v5.6.
>>
> 
> I'll find out more about this.

Thanks!

Remember that we are in the code freeze until v5.5-rc1 is released,
so you have time to make more adjustments if you want to.

Regards,

	Hans

> 
>> It passes all the sparse/smatch tests, so that's very good.
>>
> 
> Great!
> 
> Thanks,
> Ezequiel
> 

