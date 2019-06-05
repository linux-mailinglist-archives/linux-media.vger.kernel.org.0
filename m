Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1F8D435A9C
	for <lists+linux-media@lfdr.de>; Wed,  5 Jun 2019 12:44:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727162AbfFEKoP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 5 Jun 2019 06:44:15 -0400
Received: from lb3-smtp-cloud7.xs4all.net ([194.109.24.31]:41783 "EHLO
        lb3-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727076AbfFEKoP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 5 Jun 2019 06:44:15 -0400
Received: from [IPv6:2001:420:44c1:2579:c806:4d76:5b3c:eea9] ([IPv6:2001:420:44c1:2579:c806:4d76:5b3c:eea9])
        by smtp-cloud7.xs4all.net with ESMTPA
        id YTOrhkQi03qlsYTOuhfJ1w; Wed, 05 Jun 2019 12:44:13 +0200
Subject: Re: [PATCH v2 1/2] media: v4l2-ctrl: Initialize _BUTTON and
 _CTRL_CLASS
To:     Boris Brezillon <boris.brezillon@collabora.com>,
        Ezequiel Garcia <ezequiel@collabora.com>
Cc:     linux-media@vger.kernel.org, Hans Verkuil <hans.verkuil@cisco.com>,
        kernel@collabora.com,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>
References: <20190530171909.19018-1-ezequiel@collabora.com>
 <20190601110506.786c24cd@collabora.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <abc9da27-a215-f0f7-2a9e-637c47006e0f@xs4all.nl>
Date:   Wed, 5 Jun 2019 12:44:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <20190601110506.786c24cd@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfOWgEjgLhx4sSHzYXzfkcKbjWM0HBo/T5CmEjb+39CoywYminsodRqDLsMLc2Pti3YgKFbW47Txz23n+78JYs8TSc0/QB+oqWIxBZxgUzt3fN87ZXpoS
 BrppOiyPbE0rrZDSjUGOnjF0seZ97ABPAnKMLPTnLAvFLCbJ3ZyCXpm6uVwpQoOEXGYBfW9FjAXsnq5Nwb62X8GutbatJlRPtd3TTRn3oZhesbnnfq4iAlXX
 qWyZ3hD3R6kU0gurC6EKP4c047GDnUIiBt1trVq1BVPao7kH07ACBUJtfR5m40mMscDhNT4hlTGK1BVuptmZBN3+IVpmzKK2jmUqiCkWwwmILrA3Wu8GiZH/
 FU5Kd/MxYOxZ8JCPORLwtW/Bjkcf9Sye5wcn23Xm6RGAUv7X5rmhfy+hM8nmBGgP0SVlUgOdjW5nldc4BQQpuesPwrJGCORIcOhhLULC1hXoV1YTzX7Hnzdf
 b8SmvORpmQbzpAjz
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 6/1/19 11:05 AM, Boris Brezillon wrote:
> On Thu, 30 May 2019 14:19:08 -0300
> Ezequiel Garcia <ezequiel@collabora.com> wrote:
> 
>> These two control types don't really need a default value,
>> as they are not expected to carry any value.
>>
>> However, it's slightly clearer to initialize them explicitly
>> instead of falling back to the switch default.
> 
> If they don't carry any value, why not having a case that does nothing?
> I find it disturbing to assign a default to something that does not
> have a value attached to it.

I agree to a point. It is still good to initialize these,
if only to make sure that there is a sane value in the control.

How about this:

	case V4L2_CTRL_TYPE_BOOLEAN:
		ptr.p_s32[idx] = ctrl->default_value;
		break;
	case V4L2_CTRL_TYPE_BUTTON:
	case V4L2_CTRL_TYPE_CTRL_CLASS:
		ptr.p_s32[idx] = 0;
		break;

Regards,

	Hans

> 
>>
>> Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
>> ---
>>  drivers/media/v4l2-core/v4l2-ctrls.c | 2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/drivers/media/v4l2-core/v4l2-ctrls.c b/drivers/media/v4l2-core/v4l2-ctrls.c
>> index 1870cecad9ae..c7d5fdb8efb4 100644
>> --- a/drivers/media/v4l2-core/v4l2-ctrls.c
>> +++ b/drivers/media/v4l2-core/v4l2-ctrls.c
>> @@ -1530,6 +1530,8 @@ static void std_init(const struct v4l2_ctrl *ctrl, u32 idx,
>>  	case V4L2_CTRL_TYPE_MENU:
>>  	case V4L2_CTRL_TYPE_BITMASK:
>>  	case V4L2_CTRL_TYPE_BOOLEAN:
>> +	case V4L2_CTRL_TYPE_BUTTON:
>> +	case V4L2_CTRL_TYPE_CTRL_CLASS:
>>  		ptr.p_s32[idx] = ctrl->default_value;
>>  		break;
>>  	case V4L2_CTRL_TYPE_U8:
> 

