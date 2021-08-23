Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 998BB3F45CE
	for <lists+linux-media@lfdr.de>; Mon, 23 Aug 2021 09:32:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234999AbhHWHcu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 Aug 2021 03:32:50 -0400
Received: from lb3-smtp-cloud7.xs4all.net ([194.109.24.31]:51105 "EHLO
        lb3-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234861AbhHWHcu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 Aug 2021 03:32:50 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id I4RBm7kuICu83I4RCmUaMI; Mon, 23 Aug 2021 09:32:06 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1629703926; bh=9fzCpvqGD0fIWVGA321fSTEPYe6xJp3+38qtnN7gXUY=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=j6XPIy9XEE31Lm76TzTkI7vUqPVEQF5FzAJvxQjPEKly5PDmd9DBuoPHhmyZ+yhQz
         vxqevk/WMNTHRcprMQVvbOB4xXRZQ/DcApuYnuMdrsZr4ElNzDg4vPxZLRdmzrwE0D
         xgHyoYjPLqOs9LLsD1TJi4teJWvbXj9HW8pAinOyvzW28G53zMJSrp38MUNSG8ppQM
         Mf3j8GfWu8MoIFn+GO3iC2SpkjvRkudMeFUzF9i+Z3Tg82xu1RGD/0m2O8dPmr8kMW
         VzIBzyC7yC4xkQLSB6k59upzgxDatjeuxblVyLCw2KusYFD+7KGDRDv/9CIazlCtNL
         o2TRvuKQe402w==
Subject: Re: [PATCH v10 19/21] uvcvideo: don't spam the log in
 uvc_ctrl_restore_values()
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Ricardo Ribalda <ribalda@chromium.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        tfiga@chromium.org, Hans Verkuil <hans.verkuil@cisco.com>
References: <20210618122923.385938-1-ribalda@chromium.org>
 <20210618122923.385938-20-ribalda@chromium.org>
 <YSLpBFLdeTzH0gmp@pendragon.ideasonboard.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <7be1f4fa-a573-feb8-58ae-a110181ab1d1@xs4all.nl>
Date:   Mon, 23 Aug 2021 09:32:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YSLpBFLdeTzH0gmp@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfOg8vuJmCSvVIeQi6dpgiCxpcnyGmzR7g8OfndWr4xs424nHmSCvlCz3b6Ix7dj4mmOYEUT+LgX2H6oA1881ZmH7nEK45+N8dqz6jVnu9UXYSqOWwxe3
 l6D1CMtQoGo9+2hBFsQTJxjYr6JhzxN85nJ9TkS+5ERdHKhJFF1URimCwHBGH6t2kf+9Pe/V4woNxG1D5utc8NqGGVhHqltZJerbfymE81Twg9pJckfHSSbb
 Gvnq/YuKRLv/btxLITGuiGdGU2+VKiCRTQkDjK21zkasBYjzDOr8mOfanwd3SX2C22bgDhR2IDyGQcbTdMEdFmwqwfMnssinX2vlMhsf/LYDgnZiLIRU8GU2
 rLlqeeEN/WsYJFW6zuN2rmv3mJkiN4AAxFdBmHR9VVwFt0VQrTHRySvme+KwL+82JamE94CCG/QNWhDsmV6p7EkBs7rIFCqtcGax2SzFHDHXbfBK6lR9yJVQ
 mjwknWR2My4qhCIBejt0+/p5fLbB8dSgjcCigPqJzCz1BQHj/jQBMq2ZlC8ttrC5xIgzs8zBhor/WyJrHHB25E4MX3ckAHvvbbQ5HQ==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 23/08/2021 02:17, Laurent Pinchart wrote:
> Hi Hans,
> 
> On Fri, Jun 18, 2021 at 02:29:21PM +0200, Ricardo Ribalda wrote:
>> From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
>>
>> Don't report the restored controls with dev_info, use dev_dbg instead.
>> This prevents a lot of noise in the kernel log.
>>
>> Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>
>> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>> Signed-off-by: Hans Verkuil <hans.verkuil@cisco.com>
> 
> The author and SoB line don't match. Which one should I update ?

SoB should use <hverkuil-cisco@xs4all.nl>

Regards,

	Hans

> 
>> ---
>>  drivers/media/usb/uvc/uvc_ctrl.c | 8 ++++----
>>  1 file changed, 4 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
>> index 11c25d4b5c20..da44d5c0b9ad 100644
>> --- a/drivers/media/usb/uvc/uvc_ctrl.c
>> +++ b/drivers/media/usb/uvc/uvc_ctrl.c
>> @@ -2153,10 +2153,10 @@ int uvc_ctrl_restore_values(struct uvc_device *dev)
>>  			if (!ctrl->initialized || !ctrl->modified ||
>>  			    (ctrl->info.flags & UVC_CTRL_FLAG_RESTORE) == 0)
>>  				continue;
>> -			dev_info(&dev->udev->dev,
>> -				 "restoring control %pUl/%u/%u\n",
>> -				 ctrl->info.entity, ctrl->info.index,
>> -				 ctrl->info.selector);
>> +			dev_dbg(&dev->udev->dev,
>> +				"restoring control %pUl/%u/%u\n",
>> +				ctrl->info.entity, ctrl->info.index,
>> +				ctrl->info.selector);
>>  			ctrl->dirty = 1;
>>  		}
>>  
> 

