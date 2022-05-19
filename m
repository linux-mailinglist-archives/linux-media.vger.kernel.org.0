Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3280F52CCAD
	for <lists+linux-media@lfdr.de>; Thu, 19 May 2022 09:17:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233898AbiESHQr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 19 May 2022 03:16:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54798 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232053AbiESHQo (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 19 May 2022 03:16:44 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 563303584A;
        Thu, 19 May 2022 00:16:42 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id D7B73B80DFD;
        Thu, 19 May 2022 07:16:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24D06C34100;
        Thu, 19 May 2022 07:16:37 +0000 (UTC)
Message-ID: <2a813aab-424d-bc88-fb69-e9bbe9104736@xs4all.nl>
Date:   Thu, 19 May 2022 09:16:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH v2] media: camss: Allocate camss struct as a managed
 device resource
Content-Language: en-US
To:     Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Robert Foss <robert.foss@linaro.org>,
        Todor Tomov <todor.too@gmail.com>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20220519051415.1198248-1-vladimir.zapolskiy@linaro.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
In-Reply-To: <20220519051415.1198248-1-vladimir.zapolskiy@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-8.8 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Robert, Vladimir,

On 5/19/22 07:14, Vladimir Zapolskiy wrote:
> The change simplifies driver's probe and remove functions, no functional
> change is intended.
> 
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> ---
> Changes from v1 to v2:
> * rebased on top of media/master
> 
>  drivers/media/platform/qcom/camss/camss.c | 33 +++++++----------------
>  1 file changed, 10 insertions(+), 23 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
> index 79ad82e233cb..2055233af101 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -1529,7 +1529,7 @@ static int camss_probe(struct platform_device *pdev)
>  	struct camss *camss;
>  	int num_subdevs, ret;
>  
> -	camss = kzalloc(sizeof(*camss), GFP_KERNEL);
> +	camss = devm_kzalloc(dev, sizeof(*camss), GFP_KERNEL);

In general it is not a good idea to use devm_*alloc. The problem is that if a
device instance is forcibly unbound, then all the memory allocated with devm_
is immediately freed. But if an application still has a file handle to a device
open, then it can still use that memory.

Now in this case the driver is already using devm_kcalloc, so it doesn't matter,
but it is something to keep in mind. In general, hotpluggable devices cannot use
devm_*alloc.

In general, my recommendation is to not use devm_*alloc for this, but since it
is already in use in this driver, it's better to use devm_*alloc consistently.
Or, alternatively, not use it all. That's up to Robert.

This is just as background information.

Regards,

	Hans

>  	if (!camss)
>  		return -ENOMEM;
>  
> @@ -1567,39 +1567,30 @@ static int camss_probe(struct platform_device *pdev)
>  		camss->csid_num = 4;
>  		camss->vfe_num = 4;
>  	} else {
> -		ret = -EINVAL;
> -		goto err_free;
> +		return -EINVAL;
>  	}
>  
>  	camss->csiphy = devm_kcalloc(dev, camss->csiphy_num,
>  				     sizeof(*camss->csiphy), GFP_KERNEL);
> -	if (!camss->csiphy) {
> -		ret = -ENOMEM;
> -		goto err_free;
> -	}
> +	if (!camss->csiphy)
> +		return -ENOMEM;
>  
>  	camss->csid = devm_kcalloc(dev, camss->csid_num, sizeof(*camss->csid),
>  				   GFP_KERNEL);
> -	if (!camss->csid) {
> -		ret = -ENOMEM;
> -		goto err_free;
> -	}
> +	if (!camss->csid)
> +		return -ENOMEM;
>  
>  	if (camss->version == CAMSS_8x16 ||
>  	    camss->version == CAMSS_8x96) {
>  		camss->ispif = devm_kcalloc(dev, 1, sizeof(*camss->ispif), GFP_KERNEL);
> -		if (!camss->ispif) {
> -			ret = -ENOMEM;
> -			goto err_free;
> -		}
> +		if (!camss->ispif)
> +			return -ENOMEM;
>  	}
>  
>  	camss->vfe = devm_kcalloc(dev, camss->vfe_num, sizeof(*camss->vfe),
>  				  GFP_KERNEL);
> -	if (!camss->vfe) {
> -		ret = -ENOMEM;
> -		goto err_free;
> -	}
> +	if (!camss->vfe)
> +		return -ENOMEM;
>  
>  	v4l2_async_nf_init(&camss->notifier);
>  
> @@ -1681,8 +1672,6 @@ static int camss_probe(struct platform_device *pdev)
>  	v4l2_device_unregister(&camss->v4l2_dev);
>  err_cleanup:
>  	v4l2_async_nf_cleanup(&camss->notifier);
> -err_free:
> -	kfree(camss);
>  
>  	return ret;
>  }
> @@ -1709,8 +1698,6 @@ void camss_delete(struct camss *camss)
>  		device_link_del(camss->genpd_link[i]);
>  		dev_pm_domain_detach(camss->genpd[i], true);
>  	}
> -
> -	kfree(camss);
>  }
>  
>  /*
