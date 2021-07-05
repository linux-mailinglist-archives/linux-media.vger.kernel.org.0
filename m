Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 77CBB3BB9F7
	for <lists+linux-media@lfdr.de>; Mon,  5 Jul 2021 11:13:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230223AbhGEJQA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 5 Jul 2021 05:16:00 -0400
Received: from lb2-smtp-cloud8.xs4all.net ([194.109.24.25]:34085 "EHLO
        lb2-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230149AbhGEJP7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 5 Jul 2021 05:15:59 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id 0KfCmVHIk48Zv0KfHmU2Zr; Mon, 05 Jul 2021 11:13:22 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1625476402; bh=EVV4pWJjhygIDni5YpZJJpimG1bTVjJlOqNxwUTjf4Y=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=iorw6qD1CvcN2Dtg/f9j935mbxH+goTxuCQk/4pYHY4M5yi5ACnTZjivw6pwrEE7q
         OFBpdrvx/Fa0Uon6lttXFOM25NoIyr6PaCz0MpN4zTnYDp9Rdnz2r1Fa2qajD08Gd1
         L6qAIDkKwhcQbxN7qd8PIVTUaN8ogCxLxG6ESTa9KHHmvVYlaMR6UwlBurGDjgr/zN
         OfsBq+SpOQlLtFsVpH6SbETqTnnPuIudh55cpUZHF53tRfXdVImFgBCkywZHjPUWPX
         +YISYB6FzUaT/X1dmqnq+ePMgGDyoJxNR+69JON89OR4ubk72R8rtiY6CeDHKHng+E
         kYGB5dqOLzCbQ==
Subject: Re: [RFC PATCHv2 02/11] v4l2-ctrls: add support for dynamically
 allocated arrays.
To:     Daniel Almeida <daniel.almeida@collabora.com>,
        linux-media@vger.kernel.org
Cc:     Yunfei Dong <yunfei.dong@mediatek.com>,
        Dikshita Agarwal <dikshita@codeaurora.org>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        John Cox <jc@kynesim.co.uk>,
        Nicolas Dufresne <nicolas@ndufresne.ca>
References: <20210610113615.785359-1-hverkuil-cisco@xs4all.nl>
 <20210610113615.785359-3-hverkuil-cisco@xs4all.nl>
 <c9adc182-2167-26bd-e3a9-4a51fd619970@collabora.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <07aca7fd-5647-57dc-dcce-eea213554ade@xs4all.nl>
Date:   Mon, 5 Jul 2021 11:13:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <c9adc182-2167-26bd-e3a9-4a51fd619970@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfA+P0aMNatU9SSr+665pMmI/qDwBnS5bl6qjRQ6i6KZWnWIPan8UPD5PcZfjqQbJ16lKnSniWLUzbzTPNorZ8ZxyjWETSL5KeNpjKkW9nhu3RmRhnYAk
 k/zCZWbBlFcb0M+NcUyK/Z7XIUF5wLGjJDGYkYw34QP2Cqq97qAEAeUxJT66ya5fRSOLtLqCo1Bhp0TyXz2cbLAGYMibD5Coj0CaEqDDZIlLDOO7+FXoCy/W
 jwuZStPppl46HI6dlP7l5dR2F3W/4b9cut7nBjbUI82Zrv23hGvUdkw50EE20FNQcx29+F24auVw6/RN5IfgjFm3LdeCto8k+OJvvls9Fezn9CC61jNuJIfE
 FXep6EM0KfGiGeLEy5547Bz48BTJBU1NgNArkXSW/MsSu5c5TU4tA4tTxb/BMSUwr5QvElR6
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Daniel,

Sorry for the delay, it's been very busy lately...

On 26/06/2021 18:42, Daniel Almeida wrote:
> I am sending this again because apparently I sent it originally from my 
> personal email by mistake.
> 
> ---------------
> 
> 
> Hi Hans!
> 
> I have been working on testing this lately as you know.
> 
>  From the example you've added to vivid, i.e.:
> 
> +static const struct v4l2_ctrl_config vivid_ctrl_u32_dyn_array = {
> +    .ops = &vivid_user_gen_ctrl_ops,
> +    .id = VIVID_CID_U32_DYN_ARRAY,
> +    .name = "U32 Dynamic Array",
> +    .type = V4L2_CTRL_TYPE_U32,
> +    .flags = V4L2_CTRL_FLAG_DYNAMIC_ARRAY,
> +    .def = 50,
> +    .min = 10,
> +    .max = 90,
> +    .step = 1,
> +    .dims = { 100 },
> +};
> +
> 
> +    v4l2_ctrl_new_custom(hdl_user_gen, &vivid_ctrl_u32_dyn_array, NULL);
> 
> 
> I was under the impression that it'd be enough to pass the id and 
> V4L2_CTRL_FLAG_DYNAMIC_ARRAY in the config before calling 
> v4l2_ctrl_new_custom. Apparently that's not the case though, because 
> v4l2_ctrl_fill will then set its own flags if I understood correctly, i.e.:
> 
> 
>      if (name == NULL)
>          v4l2_ctrl_fill(cfg->id, &name, &type, &min, &max, &step,
>                              &def,&flags)

v4l2_ctrl_fill doesn't know about custom controls. It only handles standard
controls. For custom controls you always need to fill in everything.

> 
> <snip>
> 
>      *name = v4l2_ctrl_get_name(id);
>      *flags = 0
> 
> 
> <snip>
> 
> 
> To be honest, I didn't quite understand whether you wanted individual 
> drivers to signal they want to treat a given control as a dynamic array 
> or whether I should add that flag in the switch statement in 
> v4l2_ctrl_fill, thereby enabling this feature by default for all drivers 
> that use that control if I understood correctly.

If a standard control (i.e. not a private driver control) is a dynamic array,
then that flag must be set in v4l2_ctrl_fill().

> 
> If the former, I was expecting to communicate it to userspace via a menu 
> control, e.g. for h264 and cedrus:
> 
> enum v4l2_stateless_h264_decode_mode {
>       V4L2_STATELESS_H264_DECODE_MODE_SLICE_BASED, /* i.e. a single 
> slice per request */
>       V4L2_STATELESS_H264_DECODE_MODE_FRAME_BASED,
> +    V4L2_STATELESS_H264_DECODE_MODE_SLICE_ARRAY_BASED, /* i.e. an array 
> of slices per request */
>   };
> 
> @@ -56,6 +56,7 @@ static const struct cedrus_control cedrus_controls[] = {
>       {
>           .cfg = {
>               .id    = V4L2_CID_STATELESS_H264_SLICE_PARAMS,
> +            .flags  = V4L2_CTRL_FLAG_DYNAMIC_ARRAY,
>           },
>           .codec        = CEDRUS_CODEC_H264,
>       },
> @@ -86,7 +87,7 @@ static const struct cedrus_control cedrus_controls[] = {
>       {
>           .cfg = {
>               .id    = V4L2_CID_STATELESS_H264_DECODE_MODE,
> -            .max    = V4L2_STATELESS_H264_DECODE_MODE_SLICE_BASED,
> +            .max    = V4L2_STATELESS_H264_DECODE_MODE_SLICE_ARRAY_BASED,
>               .def    = V4L2_STATELESS_H264_DECODE_MODE_SLICE_BASED,
>           },
>           .codec        = CEDRUS_CODEC_H264,
> 
> -- Daniel
> 

If a driver supports arrays of slice params, then it will need to create a
new V4L2_CID_STATELESS_H264_SLICE_PARAMS_ARRAY control. You can't just change
V4L2_CID_STATELESS_H264_SLICE_PARAMS from a regular compound control to a
dynamic array control, they have to be different controls.

A driver can support either V4L2_CID_STATELESS_H264_SLICE_PARAMS,
V4L2_CID_STATELESS_H264_SLICE_PARAMS_ARRAY or both, with the corresponding modes
enumerated in V4L2_CID_STATELESS_H264_DECODE_MODE.

I hope this helps.

Regards,

	Hans
