Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DC34B2CD402
	for <lists+linux-media@lfdr.de>; Thu,  3 Dec 2020 11:54:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388756AbgLCKxP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Dec 2020 05:53:15 -0500
Received: from lb2-smtp-cloud8.xs4all.net ([194.109.24.25]:41459 "EHLO
        lb2-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2387738AbgLCKxO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 3 Dec 2020 05:53:14 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id kmDtkaW6k2G8DkmDwkj9mf; Thu, 03 Dec 2020 11:52:32 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1606992752; bh=KBvSn23tYeV1HB2cd4rfn/0UQytvfi2NLT1b+pX514k=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=fBUCi1kYPJZlga6B8K8UyOExO03e91CZnmUWmVYjJR8CybWK7cXqakcBzum6GioIJ
         OQBIZ/nYPl5ky+AqjfYEesXnhxb0En3z0jED6jZblqV3VN+LB8+g3gqobxz209i/Mr
         qPAhHnNNBf0o07/l+vlv8DuaWQL5hY3IboCR7KPCYLf4R2wEe58DiqhXqa8++u+Hni
         aR3PJGhXW995xaMxmDK31ShZC6Wul39Opqfv5jGqICav/wABb6J+IlF58T2DE70sWV
         gv6YhKMOnaP4QFtd50ZKUvXjMIys6idm48igNiQMpz175RW4gx3TO8iq1VvcOZA/yX
         Wcqi5OEy0N3EQ==
Subject: Re: [PATCH 5/6] vidioc-g-ext-ctrls.rst: add missing 'struct' before
 the types
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linux-media@vger.kernel.org,
        Ezequiel Garcia <ezequiel@collabora.com>
References: <20201126132717.1216907-1-hverkuil-cisco@xs4all.nl>
 <20201126132717.1216907-6-hverkuil-cisco@xs4all.nl>
 <20201203114928.2e21964b@coco.lan>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <66240aa3-1916-dd7d-83bc-367dc8675c40@xs4all.nl>
Date:   Thu, 3 Dec 2020 11:52:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201203114928.2e21964b@coco.lan>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfONCM3v/a9faCNPiiG5Tn/TxnseaniToFGSTFzn4DdUBl9HmHxWzlKXH0ci/Xeqv3v5K3fjXljd1PE1oJuIBWqGhJe3EyiWhB8nt7h01OTSt639S9ieo
 f0CeDyvgjUXMOWIVB1uy0t/Na9OYBpmz+/wh2rxyWBKLuPELidLK3Eei1QR5To359KRdOwleFBwbKsG4MNdDIYIL+LrEdK8oNjlC7GncJ3skncEVmH03kqSF
 BcKEJLJWvL1RUrGuYFYlv79W97UHnQniqmlEP7R0QK4=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 03/12/2020 11:49, Mauro Carvalho Chehab wrote:
> Em Thu, 26 Nov 2020 14:27:16 +0100
> Hans Verkuil <hverkuil-cisco@xs4all.nl> escreveu:
> 
>> Add 'struct' to clarify that these are pointers to structs.
> 
> This patch is actually wrong :-)
> 
> It is incompatible with Sphinx 3.
> 
>>
>> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
>> ---
>>  .../userspace-api/media/v4l/vidioc-g-ext-ctrls.rst | 14 +++++++-------
>>  1 file changed, 7 insertions(+), 7 deletions(-)
>>
>> diff --git a/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst b/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
>> index 726d6a97325f..5b1fc62ade0d 100644
>> --- a/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
>> +++ b/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
>> @@ -180,31 +180,31 @@ still cause this situation.
>>        - ``p_u32``
>>        - A pointer to a matrix control of unsigned 32-bit values. Valid if
>>  	this control is of type ``V4L2_CTRL_TYPE_U32``.
>> -    * - :c:type:`v4l2_area` *
>> +    * - struct :c:type:`v4l2_area` *
> 
> 
> See, with Sphinx 3, :c:type: can only be used for typedefs and defines.
> 
> The right markup for struct is:
> 
> 	:c:struct:
> 
> Actually, due to automarkup.py extension, I would just rename them to:
> 
> 	struct foo
> 
> And let the automarkup code to use the right markup, as it will ensure
> that the proper dialect will be used, no matter what Sphinx version 
> will be used to produce the docs.
> 
> So, I'll drop this patch from the series. I'll propose a new one
> instead, after testing with multiple versions of Sphinx.

'git grep struct.*:c:type Documentation' shows a lot of those incorrect
markups. Perhaps make a media-wide patch to fix this? Otherwise people
will just keep copy-and-pasting the same incorrect markup.

Regards,

	Hans

> 
> Regards,
> Mauro
> 
> 
> 
>>        - ``p_area``
>>        - A pointer to a struct :c:type:`v4l2_area`. Valid if this control is
>>          of type ``V4L2_CTRL_TYPE_AREA``.
>> -    * - :c:type:`v4l2_ctrl_h264_sps` *
>> +    * - struct :c:type:`v4l2_ctrl_h264_sps` *
>>        - ``p_h264_sps``
>>        - A pointer to a struct :c:type:`v4l2_ctrl_h264_sps`. Valid if this control is
>>          of type ``V4L2_CTRL_TYPE_H264_SPS``.
>> -    * - :c:type:`v4l2_ctrl_h264_pps` *
>> +    * - struct :c:type:`v4l2_ctrl_h264_pps` *
>>        - ``p_h264_pps``
>>        - A pointer to a struct :c:type:`v4l2_ctrl_h264_pps`. Valid if this control is
>>          of type ``V4L2_CTRL_TYPE_H264_PPS``.
>> -    * - :c:type:`v4l2_ctrl_h264_scaling_matrix` *
>> +    * - struct :c:type:`v4l2_ctrl_h264_scaling_matrix` *
>>        - ``p_h264_scaling_matrix``
>>        - A pointer to a struct :c:type:`v4l2_ctrl_h264_scaling_matrix`. Valid if this control is
>>          of type ``V4L2_CTRL_TYPE_H264_SCALING_MATRIX``.
>> -    * - :c:type:`v4l2_ctrl_h264_pred_weights` *
>> +    * - struct :c:type:`v4l2_ctrl_h264_pred_weights` *
>>        - ``p_h264_pred_weights``
>>        - A pointer to a struct :c:type:`v4l2_ctrl_h264_pred_weights`. Valid if this control is
>>          of type ``V4L2_CTRL_TYPE_H264_PRED_WEIGHTS``.
>> -    * - :c:type:`v4l2_ctrl_h264_slice_params` *
>> +    * - struct :c:type:`v4l2_ctrl_h264_slice_params` *
>>        - ``p_h264_slice_params``
>>        - A pointer to a struct :c:type:`v4l2_ctrl_h264_slice_params`. Valid if this control is
>>          of type ``V4L2_CTRL_TYPE_H264_SLICE_PARAMS``.
>> -    * - :c:type:`v4l2_ctrl_h264_decode_params` *
>> +    * - struct :c:type:`v4l2_ctrl_h264_decode_params` *
>>        - ``p_h264_decode_params``
>>        - A pointer to a struct :c:type:`v4l2_ctrl_h264_decode_params`. Valid if this control is
>>          of type ``V4L2_CTRL_TYPE_H264_DECODE_PARAMS``.
> 
> 
> 
> Thanks,
> Mauro
> 

