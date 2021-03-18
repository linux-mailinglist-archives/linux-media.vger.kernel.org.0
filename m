Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 234C334017F
	for <lists+linux-media@lfdr.de>; Thu, 18 Mar 2021 10:10:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229807AbhCRJKQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 18 Mar 2021 05:10:16 -0400
Received: from lb1-smtp-cloud7.xs4all.net ([194.109.24.24]:52533 "EHLO
        lb1-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229743AbhCRJJr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 18 Mar 2021 05:09:47 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id Mof0lIT39DUxpMof3liF7f; Thu, 18 Mar 2021 10:09:46 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1616058586; bh=IL0jeklnWv0HGUtqz0op5bjnuJsZ4lSv1MWXvOurIWo=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=PTb+hvLyfQUp2unip3+vdZkHNKBTz7JIuhHtygJ8ITFVMqOhOrgxZbBS9Hp2M15+G
         tuAcFcQapkR+BA6NEyyyQWy5oZoCsN3j/yOHC0xrXB+cUHAhF/BZk51RDoSorrdfCv
         /k8XRKzmPSJd1a3ayk9jLjH7APzhmUHJABBmif+Hmi2YSI4nSUKPlrHerP66+8Bf+3
         X4AEjKKyyVf39N3n6HMoBO2/94ZU7ID3WmAnumXNLlRIH/JqV9rMctMbEjxBGL0/E6
         eBt07Ae6vJkFC7Z2lqPc+9OZvBmjmLndef8jJlzQhNF9z8AVfrYhbjlm84SzYdKukk
         TibIEAQIfN1SQ==
Subject: Re: [PATCH v6 16/17] media: uvcvideo: Return -EACCES to inactive
 controls
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Ricardo Ribalda <ribalda@chromium.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        tfiga@chromium.org
References: <20210317164511.39967-1-ribalda@chromium.org>
 <20210317164511.39967-17-ribalda@chromium.org>
 <f2dfd4b9-6573-fe08-1ba5-5c10c5980cb8@xs4all.nl>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <5adeeda1-cf4c-be37-0077-a32aef12c61f@xs4all.nl>
Date:   Thu, 18 Mar 2021 10:09:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <f2dfd4b9-6573-fe08-1ba5-5c10c5980cb8@xs4all.nl>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfIo4NqssAEs/qdwLo/6XfaPEzDwG2cGqJGEgY2OneiaQPJ9AwwgdU6q2D9Q4AwLQjFxK/sdEmyFVI1mb6omZRUVs2ncZcuI5g4f+Vyq1LS/4QEK2QmRQ
 Exr0fb4jqCLKW7hsEOqqSrsQTUCzq8F3liVJQ0UkN8bDc3UYhTfGHE2Sk1k/+C8lK4k5tpNgNtZlxCNY1F/dgCCIW5nA77L+3nW3SJ+g5Cod/6MC1zd2T1XA
 5oI3NF9r2lZZzW6Uek7W1YVae665x9EDff36++MIqFT/MEVGpDNE0hugVYputBbW7kBoEksUc8u3JY6+Fk3JSCIaGcSwesoaLJ+sauqc3O+58M12mdf0OC8b
 LruvmVWtIRB+sRy/+EE26iAuqzYamaV6eUveHSpmSwDQx0HFbEbcpdLUmJthyWFZ8/f4B7Aza6LUdPl4gFByJmTU1gtNJAN6ImwzcYwHX154iGVj37E=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 18/03/2021 08:39, Hans Verkuil wrote:
> Hi Ricardo,
> 
> On 17/03/2021 17:45, Ricardo Ribalda wrote:
>> If a control is inactive return -EACCES to let the userspace know that
>> the value will not be applied automatically when the control is active
>> again.

Note that this needs to be documented in vidioc-g-ext-ctrls.rst and
vidioc-g-ctrl.rst as well. Currently setting inactive controls shouldn't
return EACCES, but this has now changed.

Regards,

	Hans

>>
>> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
>> Suggested-by: Hans Verkuil <hverkuil@xs4all.nl>
> 
> In several of the patches in this series you added 'Suggested-by' or 'Credit-to'.
> Please use <hverkuil-cisco@xs4all.nl> so Cisco gets the credit as well :-)
> 
>> ---
>>  drivers/media/usb/uvc/uvc_ctrl.c | 73 +++++++++++++++++++++++++-------
>>  drivers/media/usb/uvc/uvc_v4l2.c | 11 ++++-
>>  drivers/media/usb/uvc/uvcvideo.h |  3 +-
>>  3 files changed, 69 insertions(+), 18 deletions(-)
>>
>> diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
>> index af1d4d9b8afb..26d3494b401b 100644
>> --- a/drivers/media/usb/uvc/uvc_ctrl.c
>> +++ b/drivers/media/usb/uvc/uvc_ctrl.c
>> @@ -1046,10 +1046,62 @@ static int uvc_query_v4l2_class(struct uvc_video_chain *chain, u32 req_id,
>>  	return 0;
>>  }
>>  
>> -int uvc_ctrl_is_accesible(struct uvc_video_chain *chain, u32 v4l2_id, bool read)
>> +static bool uvc_ctrl_is_inactive(struct uvc_video_chain *chain,
>> +				 struct uvc_control *ctrl,
>> +				 struct uvc_control_mapping *mapping)
>> +{
>> +	struct uvc_control_mapping *master_map = NULL;
>> +	struct uvc_control *master_ctrl = NULL;
>> +	s32 val;
>> +	int ret;
>> +
>> +	if (!mapping->master_id)
>> +		return false;
>> +
>> +	__uvc_find_control(ctrl->entity, mapping->master_id, &master_map,
>> +			   &master_ctrl, 0);
>> +
>> +	if (!master_ctrl || !(master_ctrl->info.flags & UVC_CTRL_FLAG_GET_CUR))
>> +		return false;
>> +
>> +	ret = __uvc_ctrl_get(chain, master_ctrl, master_map, &val);
>> +	if (ret < 0 || val == mapping->master_manual)
>> +		return false;
>> +
>> +	return true;
>> +}
>> +
>> +int uvc_ctrl_is_accesible(struct uvc_video_chain *chain, u32 v4l2_id,
> 
> Same typo: accesible -> accessible
> 
>> +			  unsigned long ioctl)
>>  {
>>  	struct uvc_control_mapping *mapping;
>>  	struct uvc_control *ctrl;
>> +	bool read, try;
>> +
>> +	switch (ioctl) {
>> +	case VIDIOC_G_EXT_CTRLS:
>> +		read = true;
>> +		try = false;
>> +		break;
>> +	case VIDIOC_S_EXT_CTRLS:
>> +		read = false;
>> +		try = false;
>> +		break;
>> +	case VIDIOC_TRY_EXT_CTRLS:
>> +		read = false;
>> +		try = true;
>> +		break;
>> +	case VIDIOC_G_CTRL:
>> +		read = true;
>> +		try = false;
>> +		break;
>> +	case VIDIOC_S_CTRL:
>> +		read = false;
>> +		try = false;
>> +		break;
>> +	default:
>> +		return -EINVAL;
>> +	}
> 
> That's ugly. Just remove the bools and switch and just check the ioctl below...
> 
>>  
>>  	if (__uvc_query_v4l2_class(chain, v4l2_id, 0) >= 0)
>>  		return -EACCES;
>> @@ -1064,6 +1116,9 @@ int uvc_ctrl_is_accesible(struct uvc_video_chain *chain, u32 v4l2_id, bool read)
>>  	if (!(ctrl->info.flags & UVC_CTRL_FLAG_SET_CUR) && !read)
>>  		return -EACCES;
>>  
>> +	if (!read && !try && uvc_ctrl_is_inactive(chain, ctrl, mapping))
> 
> and this becomes:
> 
> 	if ((ioctl == VIDIOC_S_EXT_CTRLS || ioctl == VIDIOC_S_CTRL) &&
> 	    uvc_ctrl_is_inactive(chain, ctrl, mapping))
> 
> Much, much simpler!
> 
>> +		return -EACCES;
>> +
>>  	return 0;
>>  }
>>  
>> @@ -1086,8 +1141,6 @@ static int __uvc_query_v4l2_ctrl(struct uvc_video_chain *chain,
>>  	struct uvc_control_mapping *mapping,
>>  	struct v4l2_queryctrl *v4l2_ctrl)
>>  {
>> -	struct uvc_control_mapping *master_map = NULL;
>> -	struct uvc_control *master_ctrl = NULL;
>>  	const struct uvc_menu_info *menu;
>>  	unsigned int i;
>>  
>> @@ -1103,18 +1156,8 @@ static int __uvc_query_v4l2_ctrl(struct uvc_video_chain *chain,
>>  	if (!(ctrl->info.flags & UVC_CTRL_FLAG_SET_CUR))
>>  		v4l2_ctrl->flags |= V4L2_CTRL_FLAG_READ_ONLY;
>>  
>> -	if (mapping->master_id)
>> -		__uvc_find_control(ctrl->entity, mapping->master_id,
>> -				   &master_map, &master_ctrl, 0);
>> -	if (master_ctrl && (master_ctrl->info.flags & UVC_CTRL_FLAG_GET_CUR)) {
>> -		s32 val;
>> -		int ret = __uvc_ctrl_get(chain, master_ctrl, master_map, &val);
>> -		if (ret < 0)
>> -			return ret;
>> -
>> -		if (val != mapping->master_manual)
>> -				v4l2_ctrl->flags |= V4L2_CTRL_FLAG_INACTIVE;
>> -	}
>> +	if (uvc_ctrl_is_inactive(chain, ctrl, mapping))
>> +		v4l2_ctrl->flags |= V4L2_CTRL_FLAG_INACTIVE;
>>  
>>  	if (!ctrl->cached) {
>>  		int ret = uvc_ctrl_populate_cache(chain, ctrl);
>> diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
>> index ce55b4bff687..8e9051a245c7 100644
>> --- a/drivers/media/usb/uvc/uvc_v4l2.c
>> +++ b/drivers/media/usb/uvc/uvc_v4l2.c
>> @@ -999,6 +999,10 @@ static int uvc_ioctl_g_ctrl(struct file *file, void *fh,
>>  	struct v4l2_ext_control xctrl;
>>  	int ret;
>>  
>> +	ret = uvc_ctrl_is_accesible(chain, ctrl->id, VIDIOC_G_CTRL);
>> +	if (ret)
>> +		return ret;
>> +
>>  	memset(&xctrl, 0, sizeof(xctrl));
>>  	xctrl.id = ctrl->id;
>>  
>> @@ -1023,6 +1027,10 @@ static int uvc_ioctl_s_ctrl(struct file *file, void *fh,
>>  	struct v4l2_ext_control xctrl;
>>  	int ret;
>>  
>> +	ret = uvc_ctrl_is_accesible(chain, ctrl->id, VIDIOC_S_CTRL);
>> +	if (ret)
>> +		return ret;
>> +
>>  	memset(&xctrl, 0, sizeof(xctrl));
>>  	xctrl.id = ctrl->id;
>>  	xctrl.value = ctrl->value;
>> @@ -1054,8 +1062,7 @@ static int uvc_ctrl_check_access(struct uvc_video_chain *chain,
>>  	int ret = 0;
>>  
>>  	for (i = 0; i < ctrls->count; ++ctrl, ++i) {
>> -		ret = uvc_ctrl_is_accesible(chain, ctrl->id,
>> -					    ioctl == VIDIOC_G_EXT_CTRLS);
>> +		ret = uvc_ctrl_is_accesible(chain, ctrl->id, ioctl);
>>  		if (ret)
>>  			break;
>>  	}
>> diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
>> index 3288b118264e..4e86d0983d58 100644
>> --- a/drivers/media/usb/uvc/uvcvideo.h
>> +++ b/drivers/media/usb/uvc/uvcvideo.h
>> @@ -902,7 +902,8 @@ static inline int uvc_ctrl_rollback(struct uvc_fh *handle)
>>  
>>  int uvc_ctrl_get(struct uvc_video_chain *chain, struct v4l2_ext_control *xctrl);
>>  int uvc_ctrl_set(struct uvc_fh *handle, struct v4l2_ext_control *xctrl);
>> -int uvc_ctrl_is_accesible(struct uvc_video_chain *chain, u32 v4l2_id, bool read);
>> +int uvc_ctrl_is_accesible(struct uvc_video_chain *chain, u32 v4l2_id,
>> +			  unsigned long ioctl);
>>  
>>  int uvc_xu_ctrl_query(struct uvc_video_chain *chain,
>>  		      struct uvc_xu_control_query *xqry);
>>
> 
> Regards,
> 
> 	Hans
> 

