Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 05242584ECF
	for <lists+linux-media@lfdr.de>; Fri, 29 Jul 2022 12:31:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235476AbiG2KbC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 29 Jul 2022 06:31:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56414 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231830AbiG2KbB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 29 Jul 2022 06:31:01 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B0261BE97
        for <linux-media@vger.kernel.org>; Fri, 29 Jul 2022 03:31:00 -0700 (PDT)
Received: from [192.168.1.111] (91-158-154-79.elisa-laajakaista.fi [91.158.154.79])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 65F1B52F;
        Fri, 29 Jul 2022 12:30:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1659090657;
        bh=VzRN/8tZ1bLLS+o4xQyAJ/zurKwbc3ikgcPmJxsQmsA=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=hevMtU/GKHGh6AmxGRKB/aMkBTdJaEiniIH/cgJDqwSl6C32t/JfrIZJ0Uy5rSI0s
         jTHin7O0wDYr4LN8DC9NQN5ZV1TuFfY5UvwB/Mgdr87TinvWJqb44EPkt04v+GZzkY
         YRqMVP7e9iy6w4gbMLWbJIpfms0k0XkkYyYt9QD0=
Message-ID: <44c3a308-8755-dcb6-b8c4-dc1c36c724aa@ideasonboard.com>
Date:   Fri, 29 Jul 2022 13:30:55 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [EXT] [PATCH v12 20/30] media: subdev: add streams to
 v4l2_subdev_get_fmt() helper function
Content-Language: en-US
To:     Satish Nagireddy <satish.nagireddy@getcruise.com>
Cc:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Pratyush Yadav <p.yadav@ti.com>,
        Kishon Vijay Abraham <kishon@ti.com>,
        Tomasz Figa <tfiga@chromium.org>
References: <20220727103639.581567-1-tomi.valkeinen@ideasonboard.com>
 <20220727103639.581567-21-tomi.valkeinen@ideasonboard.com>
 <CAG0LG94pP4=ifCqt_swta2Av6hx9uMGizmOpwq_g7zKFtt2G=A@mail.gmail.com>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <CAG0LG94pP4=ifCqt_swta2Av6hx9uMGizmOpwq_g7zKFtt2G=A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 29/07/2022 12:16, Satish Nagireddy wrote:
> Hi Tomi,
> 
> Thanks for the patch.
> 
> On Wed, Jul 27, 2022 at 3:37 AM Tomi Valkeinen
> <tomi.valkeinen@ideasonboard.com> wrote:
>>
>> Add streams support to v4l2_subdev_get_fmt() helper function. Subdev
>> drivers that do not need to do anything special in their get_fmt op can
>> use this helper directly for v4l2_subdev_pad_ops.get_fmt.
>>
>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
>> ---
>>   drivers/media/v4l2-core/v4l2-subdev.c | 10 +++++++---
>>   1 file changed, 7 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
>> index 0dd612f09f35..95fd2e07d69f 100644
>> --- a/drivers/media/v4l2-core/v4l2-subdev.c
>> +++ b/drivers/media/v4l2-core/v4l2-subdev.c
>> @@ -1455,10 +1455,14 @@ int v4l2_subdev_get_fmt(struct v4l2_subdev *sd, struct v4l2_subdev_state *state,
>>   {
>>          struct v4l2_mbus_framefmt *fmt;
>>
>> -       if (format->pad >= sd->entity.num_pads)
>> -               return -EINVAL;
>> +       if (sd->flags & V4L2_SUBDEV_FL_STREAMS)
>> +               fmt = v4l2_subdev_state_get_stream_format(state, format->pad,
>> +                                                         format->stream);
>> +       else if (format->pad < sd->entity.num_pads && format->stream == 0)
>> +               fmt = v4l2_subdev_get_pad_format(sd, state, format->pad);
>> +       else
>> +               fmt = NULL;
> 
> fmt can be initialized to NULL at the declaration, so that the above 2
> lines can be removed.

That is true, but I personally like the above better, as it handles all 
the cases in the same if-else-sequence.

  Tomi
