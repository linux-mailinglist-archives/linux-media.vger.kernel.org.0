Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E2DE65FD75D
	for <lists+linux-media@lfdr.de>; Thu, 13 Oct 2022 11:54:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229533AbiJMJyQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 13 Oct 2022 05:54:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41886 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229493AbiJMJyP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 13 Oct 2022 05:54:15 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B8D8D34986
        for <linux-media@vger.kernel.org>; Thu, 13 Oct 2022 02:54:13 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 4ACE36175A
        for <linux-media@vger.kernel.org>; Thu, 13 Oct 2022 09:54:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A53EC433D6;
        Thu, 13 Oct 2022 09:54:11 +0000 (UTC)
Message-ID: <73113af5-7482-0242-52ae-79168c101fdd@xs4all.nl>
Date:   Thu, 13 Oct 2022 11:54:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [PATCH] Remove priv_user_controls in v4l2-test-controls
Content-Language: en-US
To:     Ricardo Ribalda <ribalda@chromium.org>
Cc:     Yunke Cao <yunkec@chromium.org>, linux-media@vger.kernel.org
References: <20220929-remove_private_control_check-v1-0-80a304b76269@chromium.org>
 <00c6c05e-de08-5823-2692-fadc65b218a9@xs4all.nl>
 <CANiDSCs-ajz_NUF0ZYbOdrfC5PXy82_iJiE2BsY5i6xF5ote=A@mail.gmail.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <CANiDSCs-ajz_NUF0ZYbOdrfC5PXy82_iJiE2BsY5i6xF5ote=A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-7.9 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 10/13/22 11:52, Ricardo Ribalda wrote:
> Hi Hans
> 
> 
> On Thu, 13 Oct 2022 at 09:55, Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:
>>
>> Hi Yunke,
>>
>> On 9/29/22 06:11, Yunke Cao wrote:
>>> Removing priv_user_controls and its related checks.
>>>
>>> I suspect this is wrong because:
>>>
>>> 1. priv_user_controls == priv_user_controls_check is not always true.
>>>
>>> priv_user_controls counts the number of controls with
>>> id >= V4L2_CID_PRIVATE_BASE (0x08000000).
>>> priv_user_controls_check uses V4L2_CTRL_DRIVER_PRIV ((id) & 0xffff) >= 0x1000).
>>>
>>> The private controls defined in V4L2_CID_USER_BASE + 0x1000 will count towards
>>> priv_user_controls_check, but not priv_user_controls. For example,
>>> V4L2_CID_USER_MEYE_BASE (include/uapi/linux/v4l2-controls.h#n158).
>>>
>>> 2. Line 205 returns error for id >= V4L2_CID_PRIVATE_BASE. Counting
>>> priv_user_controls will not happen.
>>
>> A long time ago all private controls in a driver started at ID V4L2_CID_PRIVATE_BASE.
>> When the control framework was created, all private controls were changed to start
>> at a control class base + 0x1000, and to stay compatible with old userspace the
>> control framework emulated enumerating such controls from V4L2_CID_PRIVATE_BASE.
> 
> The emulated controls are also enumerated with?
> 
> qctrl.id = id | V4L2_CTRL_FLAG_NEXT_CTRL | V4L2_CTRL_FLAG_NEXT_COMPOUND; ?

No, they are not.

> 
> Because if so, they wont pass the test:
> 
> if (id >= V4L2_CID_PRIVATE_BASE)
>     return fail("no V4L2_CID_PRIVATE_BASE allowed\n");

Exactly: they should never be enumerated that way, if they appear, then the
emulation is broken and this test fails.

Regards,

	Hans

> 
> Thanks!
> 
> 
> 
>>
>> These compliance tests verify that that emulation is still working correctly.
>>
>> So this code is OK. If you have an example of where it fails, then that is likely
>> to be a bug elsewhere. I would need more information to see what could be the cause
>> in that case.
>>
>> For the record:
>>
>> Rejected-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
>>
>> Regards,
>>
>>         Hans
>>
>>>
>>> Signed-off-by: Yunke Cao <yunkec@chromium.org>
>>> ---
>>> ---
>>>  utils/v4l2-compliance/v4l2-test-controls.cpp | 22 +---------------------
>>>  1 file changed, 1 insertion(+), 21 deletions(-)
>>>
>>> diff --git a/utils/v4l2-compliance/v4l2-test-controls.cpp b/utils/v4l2-compliance/v4l2-test-controls.cpp
>>> index 999dbcd7..18c9f638 100644
>>> --- a/utils/v4l2-compliance/v4l2-test-controls.cpp
>>> +++ b/utils/v4l2-compliance/v4l2-test-controls.cpp
>>> @@ -182,7 +182,6 @@ int testQueryExtControls(struct node *node)
>>>       __u32 which = 0;
>>>       bool found_ctrl_class = false;
>>>       unsigned user_controls = 0;
>>> -     unsigned priv_user_controls = 0;
>>>       unsigned user_controls_check = 0;
>>>       unsigned priv_user_controls_check = 0;
>>>       unsigned class_count = 0;
>>> @@ -299,30 +298,11 @@ int testQueryExtControls(struct node *node)
>>>               user_controls++;
>>>       }
>>>
>>> -     for (id = V4L2_CID_PRIVATE_BASE; ; id++) {
>>> -             memset(&qctrl, 0xff, sizeof(qctrl));
>>> -             qctrl.id = id;
>>> -             ret = doioctl(node, VIDIOC_QUERY_EXT_CTRL, &qctrl);
>>> -             if (ret && ret != EINVAL)
>>> -                     return fail("invalid query_ext_ctrl return code (%d)\n", ret);
>>> -             if (ret)
>>> -                     break;
>>> -             if (qctrl.id != id)
>>> -                     return fail("qctrl.id (%08x) != id (%08x)\n",
>>> -                                     qctrl.id, id);
>>> -             if (checkQCtrl(node, qctrl))
>>> -                     return fail("invalid control %08x\n", qctrl.id);
>>> -             priv_user_controls++;
>>> -     }
>>> -
>>> -     if (priv_user_controls + user_controls && node->controls.empty())
>>> +     if (user_controls && node->controls.empty())
>>>               return fail("does not support V4L2_CTRL_FLAG_NEXT_CTRL\n");
>>>       if (user_controls != user_controls_check)
>>>               return fail("expected %d user controls, got %d\n",
>>>                       user_controls_check, user_controls);
>>> -     if (priv_user_controls != priv_user_controls_check)
>>> -             return fail("expected %d private controls, got %d\n",
>>> -                     priv_user_controls_check, priv_user_controls);
>>>       return result;
>>>  }
>>>
>>>
>>> ---
>>> base-commit: 7f560aede797b659b585f063ed1f143f58b03df5
>>> change-id: 20220929-remove_private_control_check-ab8cc38a1b9e
>>>
>>> Best regards,
> 
> 
> 
