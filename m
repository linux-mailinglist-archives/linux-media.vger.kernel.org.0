Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3E90A2483FD
	for <lists+linux-media@lfdr.de>; Tue, 18 Aug 2020 13:40:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726336AbgHRLkA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 18 Aug 2020 07:40:00 -0400
Received: from lb1-smtp-cloud9.xs4all.net ([194.109.24.22]:41739 "EHLO
        lb1-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726145AbgHRLj7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 18 Aug 2020 07:39:59 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id 7zy7kTwwVuuXO7zy8kbktO; Tue, 18 Aug 2020 13:39:56 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1597750796; bh=0gcpXGaurE/VXdSSNzBr+pJxSWpkIvAYUJEHO4Ybo80=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=dsU7DS4lHuKttpIApS2dCGHYuqhxMJB0/3lmfUKkZnyKWlktW5DvBmlrUgIZE/7vs
         AOzxkLFi5cBYj3mxx040xtWMiU4IFJUHnKTXO6bmvbXCHSTtlaXfDHa5wFlzT5vYe2
         Zv/UoMl6denYNvWojAjyBPHiwJGWRfAC3hCZ8b5/yWHFCtlomSIsX4YWG53DEUcGuF
         oLx/zQRmbofzsT0fU+ekanIQHGEOKDOCUXwks5V+Y4gDwK3t/+Ytb89bUANj61SKdD
         jui7Kh7ioXWu6RSadtZKpkdq2a0PH+LE5XSkIHXgxaDIYAjxWLD2WkkMoGbBAOXrk0
         XkjL6z9LFVVDA==
Subject: Re: [RFC PATCH 1/2] v4l2-ctrls.c: add v4l2_ctrl_request_create
To:     Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        linux-media@vger.kernel.org
Cc:     Yunfei Dong <yunfei.dong@mediatek.com>
References: <20200728094851.121933-1-hverkuil-cisco@xs4all.nl>
 <20200728094851.121933-2-hverkuil-cisco@xs4all.nl>
 <0e0d5188-7d88-e8e2-d4d0-32e117449b35@linaro.org>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <886f85d8-8ec7-8bdb-bfc1-0d106fe8dacc@xs4all.nl>
Date:   Tue, 18 Aug 2020 13:39:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <0e0d5188-7d88-e8e2-d4d0-32e117449b35@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfMTjc05Vg8ozn/hHuxq9XlJwoDgvTwA1s6tJcvDuPK+giHqVn+/8rTHqYVG3yO0e0s/QSXsJEoilyxHXbigwZY2XKZrJQVvxYzOqgLaUagJLXVbtW3jp
 XR9uoc+rAeHJW9TDAw8vFI2reOszpkcKaJ6rmzXk5auK3Rj9t8/qHoa+x1g+HL5T+xajdc4d8d4U7m996455NGyWH5zw9HrnXQB/C7uw8tFa7vULE/GD4zlE
 TCX8o4ATTHN5BK4zGdK8eX7B9Rwtu3zT/jBs7Hps2O5Q/7kSv5VTlOrmAYuuU5iA06GKgyB0Bb0Oieev0VGT0mGf4JhkaUr2IiIN0oIq4W09fbnl0IBP7Aea
 m9HmWfwE
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 18/08/2020 13:30, Stanimir Varbanov wrote:
> Hi Hans,
> 
> On 7/28/20 12:48 PM, Hans Verkuil wrote:
>> Add a new v4l2_ctrl_request_create() function that can be called in
>> req_validate() to create a control request object if needed.
>>
>> This is needed if the driver needs to set controls in the request,
>>
>> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
>> ---
>>  drivers/media/mc/mc-request.c        |  3 ++-
>>  drivers/media/v4l2-core/v4l2-ctrls.c | 35 ++++++++++++++++++++++++++++
>>  include/media/v4l2-ctrls.h           | 16 +++++++++++++
>>  3 files changed, 53 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/media/mc/mc-request.c b/drivers/media/mc/mc-request.c
>> index c0782fd96c59..64df83c6f5e5 100644
>> --- a/drivers/media/mc/mc-request.c
>> +++ b/drivers/media/mc/mc-request.c
>> @@ -414,7 +414,8 @@ int media_request_object_bind(struct media_request *req,
>>  
>>  	spin_lock_irqsave(&req->lock, flags);
>>  
>> -	if (WARN_ON(req->state != MEDIA_REQUEST_STATE_UPDATING))
>> +	if (WARN_ON(req->state != MEDIA_REQUEST_STATE_UPDATING &&
>> +		    req->state != MEDIA_REQUEST_STATE_VALIDATING))
>>  		goto unlock;
>>  
>>  	obj->req = req;
>> diff --git a/drivers/media/v4l2-core/v4l2-ctrls.c b/drivers/media/v4l2-core/v4l2-ctrls.c
>> index 3f3fbcd60cc6..0d4c8551ba2a 100644
>> --- a/drivers/media/v4l2-core/v4l2-ctrls.c
>> +++ b/drivers/media/v4l2-core/v4l2-ctrls.c
>> @@ -4345,6 +4345,41 @@ void v4l2_ctrl_request_complete(struct media_request *req,
>>  }
>>  EXPORT_SYMBOL(v4l2_ctrl_request_complete);
>>  
>> +int v4l2_ctrl_request_create(struct media_request *req,
>> +			     struct v4l2_ctrl_handler *main_hdl)
>> +{
>> +	struct media_request_object *obj;
>> +	struct v4l2_ctrl_handler *new_hdl;
>> +	int ret = 0;
>> +
>> +	if (!req || !main_hdl)
>> +		return 0;
>> +
>> +	if (WARN_ON(req->state != MEDIA_REQUEST_STATE_VALIDATING))
>> +		return -EBUSY;
>> +
>> +	/* If a request object is found, then do nothing. */
>> +	obj = media_request_object_find(req, &req_ops, main_hdl);
>> +	if (obj) {
>> +		media_request_object_put(obj);
>> +		return 0;
>> +	}
>> +
>> +	/* Create a new request so the driver can return controls */
>> +	new_hdl = kzalloc(sizeof(*new_hdl), GFP_KERNEL);
>> +	if (!new_hdl)
>> +		return -ENOMEM;
>> +
>> +	obj = &new_hdl->req_obj;
> 
> Why initialize 'obj' and then not use it? Did you forget something

Oops, spurious line, should be removed.

Thanks for noticing!

	Hans

> 
>> +	ret = v4l2_ctrl_handler_init(new_hdl, (main_hdl->nr_of_buckets - 1) * 8);
>> +	if (!ret)
>> +		ret = v4l2_ctrl_request_bind(req, new_hdl, main_hdl);
>> +	if (ret)
>> +		kfree(new_hdl);
>> +	return ret;
>> +}
>> +EXPORT_SYMBOL(v4l2_ctrl_request_create);
>> +
>>  int v4l2_ctrl_request_setup(struct media_request *req,
>>  			     struct v4l2_ctrl_handler *main_hdl)
>>  {
>> diff --git a/include/media/v4l2-ctrls.h b/include/media/v4l2-ctrls.h
>> index f40e2cbb21d3..2703baa170fa 100644
>> --- a/include/media/v4l2-ctrls.h
>> +++ b/include/media/v4l2-ctrls.h
>> @@ -1254,6 +1254,22 @@ int v4l2_ctrl_request_setup(struct media_request *req,
>>  void v4l2_ctrl_request_complete(struct media_request *req,
>>  				struct v4l2_ctrl_handler *parent);
>>  
>> +/**
>> + * v4l2_ctrl_request_create - Create a control handler request object
>> + *
>> + * @req: The request
>> + * @parent: The parent control handler ('priv' in media_request_object_find())
>> + *
>> + * If the user created a request without controls, but the driver wants to
>> + * set controls for the request, then this function can be called in the
>> + * request's req_validate function. If there is no control object in the
>> + * request, then this will create one. Now the driver can set controls
>> + * and when v4l2_ctrl_request_complete() is called they will be automatically
>> + * copied into the request.
>> + */
>> +int v4l2_ctrl_request_create(struct media_request *req,
>> +			     struct v4l2_ctrl_handler *parent);
>> +
>>  /**
>>   * v4l2_ctrl_request_hdl_find - Find the control handler in the request
>>   *
>>
> 

