Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A22BD24A0D8
	for <lists+linux-media@lfdr.de>; Wed, 19 Aug 2020 15:58:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728259AbgHSN6T (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 19 Aug 2020 09:58:19 -0400
Received: from lb3-smtp-cloud9.xs4all.net ([194.109.24.30]:40685 "EHLO
        lb3-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728124AbgHSN6N (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 19 Aug 2020 09:58:13 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id 8ObRkd9mWuuXO8ObSkhPNe; Wed, 19 Aug 2020 15:58:10 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1597845490; bh=Uuz/6jIZhRnBQON+pYw05hF4KeeuyR1OEYEF2gwxc9w=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=ccDKimB72qe9cU6OtkwG9nhN1BLfqjjUBfY8rsETMomk4Xo7eOmVP3P12K+wM49Hk
         xcmvDkKvLfS/5dHBlRCCypY+N1PT/8oJir2VCovMndsavLn3kjvLqJ7Kx7vGuTsTYd
         2aWqd03W5gcf4wZrRdDO+VOOjYsFp+p9eaqbpG4oro8Yoj5gQsU6pDpm0HlIq0+Yr7
         nVWOBcemGRsPQMvQ6drIWXLGfL2/XciM+7QfcxB72E007rXqpFnGxN439+QVJm778X
         Y+Tu2tTezxdeboEI/uieNVMmC1WL9VGtovJtwr0oOYETlNE51fiVxeYrVMx7bp3OIz
         Y4tw+v7nfL7dg==
Subject: Re: [PATCH 2/2] media: stm32-dcmi: fix probe error path & module
 remove
To:     Alain Volmat <alain.volmat@st.com>, hugues.fruchet@st.com,
        mchehab@kernel.org
Cc:     mcoquelin.stm32@gmail.com, alexandre.torgue@st.com,
        yannick.fertre@st.com, hans.verkuil@cisco.com,
        linux-media@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <1595918278-9724-1-git-send-email-alain.volmat@st.com>
 <1595918278-9724-3-git-send-email-alain.volmat@st.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <aa93abb9-964a-a9d8-770f-5673142d0d72@xs4all.nl>
Date:   Wed, 19 Aug 2020 15:58:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1595918278-9724-3-git-send-email-alain.volmat@st.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfNKjxnVk0gRgu+dHVYskSGtcoIzBVImXGMRrMHCIOlPRrP8TwY2wj7R3lxN+EqyNoefJDNqC+Qme8Q13W9+dzxHkQCE3fuhcKJF88aQqRtE173Tc2GPJ
 90bfUxuThq2XAPbugKSous4RLWereIy6H6Ken8cn++TUEcoio9C97VoAIFCnWkbK1fieFE1O07abUk6ZO/ehqaT5kjeVtQ/bRwaLpJ4+eEVO1JRz7Njvy/tv
 o8CxQBeUTTg+UuvQW+jELWvW2abjnDQfXsgr42aGaz5PFOHUVU5DHZ9DwmmXKCFRQUMD9tJr3fp+lhH/aNVXTAutTInKUIJ/pZuzMB9hbQX2zslmE9sDY3qM
 UAbVrpcb3R83Qt8SZhFjZI+Kfg3W/zS4Su7TqbNvJEQKrqS5rNbde8qy0CeX+hFmNO/3rcuxKX6bqAvRg4643f90lulFVMoHlbT00dGnUbJ8q8Op4x1S7RDp
 330DfX4mKnpYqPXYY5BJI0tXby5VgdJofKg0zRHy7/Ot07/qBnYUnQVyOv9db/TencJVS/W5P9NG3RJrrxlhLKu47unDj+18LqzcVpyiH48xsMsTcJYBbIjd
 /z7Y8gWezj5F21QHJbTzmoWU93MXOpdUH6poZrUINRpyKnXm4rUIqK9RRyzeveqAQ7lkIYme0d9ZpSbaKMJJ3PRY
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 28/07/2020 08:37, Alain Volmat wrote:
> This commit add missing vb2_queue_release calls with the
> probe error path and module remove.

No, vb2_queue_release() should not be called.

See this series for more information:

https://patchwork.linuxtv.org/project/linux-media/cover/20200713113048.1150542-1-hverkuil-cisco@xs4all.nl/

I'm made a PR for that patch series, so hopefully it will be merged soon.

From what I can tell you don't need this patch at all for this driver.

Regards,

	Hans

> Missing v4l2_async_notifier_unregister is also added within
> the probe error path
> 
> Fixes: 37404f91ef8b ("[media] stm32-dcmi: STM32 DCMI camera interface driver")
> Signed-off-by: Alain Volmat <alain.volmat@st.com>
> ---
>  drivers/media/platform/stm32/stm32-dcmi.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/stm32/stm32-dcmi.c b/drivers/media/platform/stm32/stm32-dcmi.c
> index 5e60d4c6eeeb..57830ee691be 100644
> --- a/drivers/media/platform/stm32/stm32-dcmi.c
> +++ b/drivers/media/platform/stm32/stm32-dcmi.c
> @@ -2004,7 +2004,7 @@ static int dcmi_probe(struct platform_device *pdev)
>  
>  	ret = dcmi_graph_init(dcmi);
>  	if (ret < 0)
> -		goto err_media_entity_cleanup;
> +		goto err_vb2_queue_release;
>  
>  	/* Reset device */
>  	ret = reset_control_assert(dcmi->rstc);
> @@ -2030,7 +2030,10 @@ static int dcmi_probe(struct platform_device *pdev)
>  	return 0;
>  
>  err_cleanup:
> +	v4l2_async_notifier_unregister(&dcmi->notifier);
>  	v4l2_async_notifier_cleanup(&dcmi->notifier);
> +err_vb2_queue_release:
> +	vb2_queue_release(q);
>  err_media_entity_cleanup:
>  	media_entity_cleanup(&dcmi->vdev->entity);
>  err_device_release:
> @@ -2052,6 +2055,7 @@ static int dcmi_remove(struct platform_device *pdev)
>  
>  	v4l2_async_notifier_unregister(&dcmi->notifier);
>  	v4l2_async_notifier_cleanup(&dcmi->notifier);
> +	vb2_queue_release(&dcmi->queue);
>  	media_entity_cleanup(&dcmi->vdev->entity);
>  	v4l2_device_unregister(&dcmi->v4l2_dev);
>  	media_device_cleanup(&dcmi->mdev);
> 

