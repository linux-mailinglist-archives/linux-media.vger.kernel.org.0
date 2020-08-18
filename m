Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 452942483CD
	for <lists+linux-media@lfdr.de>; Tue, 18 Aug 2020 13:30:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726682AbgHRLan (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 18 Aug 2020 07:30:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51692 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726569AbgHRLab (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 18 Aug 2020 07:30:31 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 901CAC061345
        for <linux-media@vger.kernel.org>; Tue, 18 Aug 2020 04:30:22 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id 184so16658751wmb.0
        for <linux-media@vger.kernel.org>; Tue, 18 Aug 2020 04:30:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=kmk2WzUlGF22ZB4gMALrAcgFRnr+k0X+z+JEY7eX+4A=;
        b=pvAM7/Jds1cQoFwWGFVdo1aju/h+edr4U1PqvVKt8BpjXjUwmGQ4mLnYZQa/nQZsiH
         UYYiTpYikyswNfHTdOmKzoI5AZ+kVT6jY728V78qIoJm937YU24hajjySF1ify/ZntTu
         mCaxo/vYrOJ0cNGXNk3zR/6wSv0c/wjBFQ7HDvqbzUxEuBqFmrpGzL1GN16zlypRY5oW
         5o2HG4gaO8rLyzBkUajHfrB0bTSBwslplyFrc9rxNzFX2trIWONLvAF+iiUW9qqlzv6Q
         DdRk1/h4+0XMwQTPS0wCUKh6lDqu3wGU6Pj6QD6ptQFNznmW3onAji5QfJA+3gEvWAYB
         NKQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=kmk2WzUlGF22ZB4gMALrAcgFRnr+k0X+z+JEY7eX+4A=;
        b=RykXpOtyNaNu4Ykca8Oc0hWWbJd7nRQMPb0IvQaSbuoIDBVH/b0RXd2n8Gb1BaLcn6
         mWximbWWyu+l4N2KbyY9y+ZN5FQQZ7m4ylWbns5i5v7RhnBZjppC5Ssu0pDu9Ychu690
         HN6inpYPmxickNohuARExcN+t6GCeCFmOC9E/PCbVmmHnfATQin+oOAy5qsIE0zVY1oc
         1Q7NNkNWbQ/l0k9d42tMKhLqWU1+L8Oa6t+ohPBwz7EvqUL/WkRt1eNwm/ZveLHXUhBG
         D9xLO18jVpMg7qsjRseiIMuALll69qhvrghffRWYZ+AQo0b17xyqJwih8vOd0br2ip9O
         32Pg==
X-Gm-Message-State: AOAM531NcKdZKIrhpifz2bwXJ7mEAzFzr7WxKSN/gMy3Kr3JSsLx325+
        JIYUcfzObYFW5uWS5GlWoSfW+Tvsqm1PMsBP
X-Google-Smtp-Source: ABdhPJwWTHapQvA6IORu6JPY3VXIbdoQvEVunE97E7PbZVAWXYpxpPfEYc8rp2U8Srg2s4jzbM+/Aw==
X-Received: by 2002:a1c:7e02:: with SMTP id z2mr19118891wmc.138.1597750221164;
        Tue, 18 Aug 2020 04:30:21 -0700 (PDT)
Received: from [192.168.1.10] ([195.24.90.54])
        by smtp.googlemail.com with ESMTPSA id c17sm35717457wrc.42.2020.08.18.04.30.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Aug 2020 04:30:20 -0700 (PDT)
Subject: Re: [RFC PATCH 1/2] v4l2-ctrls.c: add v4l2_ctrl_request_create
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org
Cc:     Yunfei Dong <yunfei.dong@mediatek.com>
References: <20200728094851.121933-1-hverkuil-cisco@xs4all.nl>
 <20200728094851.121933-2-hverkuil-cisco@xs4all.nl>
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
Message-ID: <0e0d5188-7d88-e8e2-d4d0-32e117449b35@linaro.org>
Date:   Tue, 18 Aug 2020 14:30:17 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200728094851.121933-2-hverkuil-cisco@xs4all.nl>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On 7/28/20 12:48 PM, Hans Verkuil wrote:
> Add a new v4l2_ctrl_request_create() function that can be called in
> req_validate() to create a control request object if needed.
> 
> This is needed if the driver needs to set controls in the request,
> 
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> ---
>  drivers/media/mc/mc-request.c        |  3 ++-
>  drivers/media/v4l2-core/v4l2-ctrls.c | 35 ++++++++++++++++++++++++++++
>  include/media/v4l2-ctrls.h           | 16 +++++++++++++
>  3 files changed, 53 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/mc/mc-request.c b/drivers/media/mc/mc-request.c
> index c0782fd96c59..64df83c6f5e5 100644
> --- a/drivers/media/mc/mc-request.c
> +++ b/drivers/media/mc/mc-request.c
> @@ -414,7 +414,8 @@ int media_request_object_bind(struct media_request *req,
>  
>  	spin_lock_irqsave(&req->lock, flags);
>  
> -	if (WARN_ON(req->state != MEDIA_REQUEST_STATE_UPDATING))
> +	if (WARN_ON(req->state != MEDIA_REQUEST_STATE_UPDATING &&
> +		    req->state != MEDIA_REQUEST_STATE_VALIDATING))
>  		goto unlock;
>  
>  	obj->req = req;
> diff --git a/drivers/media/v4l2-core/v4l2-ctrls.c b/drivers/media/v4l2-core/v4l2-ctrls.c
> index 3f3fbcd60cc6..0d4c8551ba2a 100644
> --- a/drivers/media/v4l2-core/v4l2-ctrls.c
> +++ b/drivers/media/v4l2-core/v4l2-ctrls.c
> @@ -4345,6 +4345,41 @@ void v4l2_ctrl_request_complete(struct media_request *req,
>  }
>  EXPORT_SYMBOL(v4l2_ctrl_request_complete);
>  
> +int v4l2_ctrl_request_create(struct media_request *req,
> +			     struct v4l2_ctrl_handler *main_hdl)
> +{
> +	struct media_request_object *obj;
> +	struct v4l2_ctrl_handler *new_hdl;
> +	int ret = 0;
> +
> +	if (!req || !main_hdl)
> +		return 0;
> +
> +	if (WARN_ON(req->state != MEDIA_REQUEST_STATE_VALIDATING))
> +		return -EBUSY;
> +
> +	/* If a request object is found, then do nothing. */
> +	obj = media_request_object_find(req, &req_ops, main_hdl);
> +	if (obj) {
> +		media_request_object_put(obj);
> +		return 0;
> +	}
> +
> +	/* Create a new request so the driver can return controls */
> +	new_hdl = kzalloc(sizeof(*new_hdl), GFP_KERNEL);
> +	if (!new_hdl)
> +		return -ENOMEM;
> +
> +	obj = &new_hdl->req_obj;

Why initialize 'obj' and then not use it? Did you forget something

> +	ret = v4l2_ctrl_handler_init(new_hdl, (main_hdl->nr_of_buckets - 1) * 8);
> +	if (!ret)
> +		ret = v4l2_ctrl_request_bind(req, new_hdl, main_hdl);
> +	if (ret)
> +		kfree(new_hdl);
> +	return ret;
> +}
> +EXPORT_SYMBOL(v4l2_ctrl_request_create);
> +
>  int v4l2_ctrl_request_setup(struct media_request *req,
>  			     struct v4l2_ctrl_handler *main_hdl)
>  {
> diff --git a/include/media/v4l2-ctrls.h b/include/media/v4l2-ctrls.h
> index f40e2cbb21d3..2703baa170fa 100644
> --- a/include/media/v4l2-ctrls.h
> +++ b/include/media/v4l2-ctrls.h
> @@ -1254,6 +1254,22 @@ int v4l2_ctrl_request_setup(struct media_request *req,
>  void v4l2_ctrl_request_complete(struct media_request *req,
>  				struct v4l2_ctrl_handler *parent);
>  
> +/**
> + * v4l2_ctrl_request_create - Create a control handler request object
> + *
> + * @req: The request
> + * @parent: The parent control handler ('priv' in media_request_object_find())
> + *
> + * If the user created a request without controls, but the driver wants to
> + * set controls for the request, then this function can be called in the
> + * request's req_validate function. If there is no control object in the
> + * request, then this will create one. Now the driver can set controls
> + * and when v4l2_ctrl_request_complete() is called they will be automatically
> + * copied into the request.
> + */
> +int v4l2_ctrl_request_create(struct media_request *req,
> +			     struct v4l2_ctrl_handler *parent);
> +
>  /**
>   * v4l2_ctrl_request_hdl_find - Find the control handler in the request
>   *
> 

-- 
regards,
Stan
