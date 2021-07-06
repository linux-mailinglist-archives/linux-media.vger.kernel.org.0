Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4EFDA3BC76F
	for <lists+linux-media@lfdr.de>; Tue,  6 Jul 2021 09:47:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230304AbhGFHuS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 6 Jul 2021 03:50:18 -0400
Received: from lb1-smtp-cloud8.xs4all.net ([194.109.24.21]:52211 "EHLO
        lb1-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230223AbhGFHuR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 6 Jul 2021 03:50:17 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id 0fnqmeJGo48Zv0fnumXPIj; Tue, 06 Jul 2021 09:47:38 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1625557658; bh=dXHGyMoWBMu3R40tU6vOO+4SM+7Apxh7LxvT2/NpVzs=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=m2OYq4MdsLN+GGzgyLIItsc74vN40/thcOk8U1QQx/00D2m8XsqY5B/5EqXbtMmsa
         ZjyccTjQCKUh7ehYx54/P3wlEXAzfAjrmECzvCdzbKZTKInPyVVXtQXlapoT+D57NS
         ZjHadSvTj0c0Sy4QFvU/XMr6C9Gg/IWZ1661Pw22NWJYfygKs906f+kzSas3/6tGwC
         iif0s8l/dEOPoXxfiBsCY9MPmGL4hAplbVgo/l+rimxGAsacdydzNhh2kHrrvXiqh6
         8oblAin7T7VYnbsj0NGTVkRyDPYuejUKGmRoppWyIzsoTNAIKjNDMpIblaWfCOJT9s
         8yYWJzaMp8E3w==
Subject: Re: [RFC 2/4] media: v4l2-async: Add notifier flags
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc:     linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <20210617171611.80542-1-jacopo+renesas@jmondi.org>
 <20210617171611.80542-3-jacopo+renesas@jmondi.org>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <1a8bcd93-bb03-45f5-dd57-9732463584dd@xs4all.nl>
Date:   Tue, 6 Jul 2021 09:47:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210617171611.80542-3-jacopo+renesas@jmondi.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfH8EHXsJQ9LIWI1bx+rhzxJ2XrxYZmqr7OEIU7RO52vjA2cXuxOH6xhwVV5C0rYFPyUDdPalq9yKPVVt9AG7rIIjTDA61yISb1t3JFTVHOiNHXtrs81j
 03VtfYt6LuafOn7/+7PJQIz3+Rq6rm+cEew7VtTr3QpBX9OCXUpzQRLZgmxyy1nJztNaRBtWLsiUA2NRN27igp91zB85+Gk1LFsJPPI4dxODtkYxPFLqSsmL
 m/ZPqu2xzr202Cl9J1WP68pbbCojoDq1fPsI+QCnmSsFGlP2H++BKPO1jF/sh++K
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 17/06/2021 19:16, Jacopo Mondi wrote:
> Add a 'flags' field to the async notifier structure and define the
> V4L2_ASYNC_NOTIFIER_SKIP_POST_REGISTER flag.
> 
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> ---
>  drivers/media/v4l2-core/v4l2-async.c |  1 +
>  include/media/v4l2-async.h           | 10 ++++++++++
>  2 files changed, 11 insertions(+)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-async.c b/drivers/media/v4l2-core/v4l2-async.c
> index cd9e78c63791..0836e01e59ca 100644
> --- a/drivers/media/v4l2-core/v4l2-async.c
> +++ b/drivers/media/v4l2-core/v4l2-async.c
> @@ -472,6 +472,7 @@ static int v4l2_async_notifier_asd_valid(struct v4l2_async_notifier *notifier,
>  void v4l2_async_notifier_init(struct v4l2_async_notifier *notifier)
>  {
>  	INIT_LIST_HEAD(&notifier->asd_list);
> +	notifier->flags = 0;
>  }
>  EXPORT_SYMBOL(v4l2_async_notifier_init);
>  
> diff --git a/include/media/v4l2-async.h b/include/media/v4l2-async.h
> index 5b275a845c20..3f0627bf8894 100644
> --- a/include/media/v4l2-async.h
> +++ b/include/media/v4l2-async.h
> @@ -92,6 +92,13 @@ struct v4l2_async_notifier_operations {
>  		       struct v4l2_async_subdev *asd);
>  };
>  
> +/*
> + * Set this flag to instruct the core framework not to call the post_register()
> + * core operation. The driver that registered the notifier will take care to
> + * do so eventually.
> + */
> +#define V4L2_ASYNC_NOTIFIER_SKIP_POST_REGISTER		(1U << 0)

How about: V4L2_ASYNC_NOTIFIER_DEFER_POST_REGISTER

I think that's a better name: it is not skipped, it is just called later.

Regards,

	Hans

> +
>  /**
>   * struct v4l2_async_notifier - v4l2_device notifier data
>   *
> @@ -103,6 +110,8 @@ struct v4l2_async_notifier_operations {
>   * @waiting:	list of struct v4l2_async_subdev, waiting for their drivers
>   * @done:	list of struct v4l2_subdev, already probed
>   * @list:	member in a global list of notifiers
> + * @flags:	notifier's flags. Can be:
> + * 	%V4L2_ASYNC_NOTIFIER_SKIP_POST_REGISTER
>   */
>  struct v4l2_async_notifier {
>  	const struct v4l2_async_notifier_operations *ops;
> @@ -113,6 +122,7 @@ struct v4l2_async_notifier {
>  	struct list_head waiting;
>  	struct list_head done;
>  	struct list_head list;
> +	u32 flags;
>  };
>  
>  /**
> 

