Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 186554CAE70
	for <lists+linux-media@lfdr.de>; Wed,  2 Mar 2022 20:16:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244759AbiCBTQz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Mar 2022 14:16:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42718 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244976AbiCBTQy (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 2 Mar 2022 14:16:54 -0500
X-Greylist: delayed 201 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Wed, 02 Mar 2022 11:16:10 PST
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com [64.147.123.25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F058527C2
        for <linux-media@vger.kernel.org>; Wed,  2 Mar 2022 11:16:10 -0800 (PST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.west.internal (Postfix) with ESMTP id 54DF03200564;
        Wed,  2 Mar 2022 14:16:09 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Wed, 02 Mar 2022 14:16:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.com; h=
        cc:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to; s=fm2; bh=7JH0ctkqxqSaagxX5bMNGlv2Xkd3uaCNCqeXmG
        zg93g=; b=fNVomhADktS4IfVYxMgpknvXfjU9sIOiAXTujq13pVssEl0MhMqe9I
        24PKiGmA30USgvknCQP37T+50ilUvJisJ+gOpzhJXxnHN5x24GNA4G16FxGpJgsq
        RcVZzk41h2VD3+49iWt6/n4CzSkHan514kP9lyXpAcPmPzCYG7dr8MKYThT55uS9
        xRL9mu4HNLOOsRXHWo2VBAA5ECc48xZUq3Ng7AgT09kT3ZRcTmraAHC+0Ee5oYie
        9t7VPWdqf1qrt0Hl1LUhR8fzjbNPs2NqU/OJV+x9koHefByIGfcksrNb+Y4lUwQR
        Y6aJiQfaPjjfXwJJ+ZAbimWzlaKXCJXw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:date:date:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=7JH0ctkqxqSaagxX5
        bMNGlv2Xkd3uaCNCqeXmGzg93g=; b=S9vjpAGuSpJzkgq/R/B4xvIVm5uKJswXL
        QUCHdvyAUcZ0niLSK7z5Yhv3c4B2lGXhOkGOWMDWFxghYRUZBEiaGaKSXqRoFvos
        0ufmPhbc9HJe+YQQHQfrq0Xop51XussWsiWfJKY2i6qqk7q5MTTFdiTi2WLzTaCu
        fGeBV5nrYZWeXptL9IdBF4wRLeSyz8lJMiDyE8cEVz0cHd+zqQehl8zFpSwKJa/G
        WkzZITxlySq+aXNMrv90FzNQAvsnLk1wVnFW5A803PJLleryVhxzNxKgYah4b5+3
        3IOLiIjHTw1NIAmP0BMjX8QLhb6B71ojN+/bnRt30Me86xCKLWSmw==
X-ME-Sender: <xms:eMIfYtVVz3QfWFt2zbh-N5MgmLjognrnxOuvnujjhX6QfUFiRnI3VA>
    <xme:eMIfYtkFtyH7tMERlsWNmbrypMPg4qFWIqK2d9nFOiv69egC_Db3pjOM1pJCFRbmf
    LTfuPEZp8N3NgP78rs>
X-ME-Received: <xmr:eMIfYpbLmlP4jWNH7ONDUztlhsJOOXuvOTIQG3euttM0IwtceTmawXL-ilRehAgQZoLZkbrAsSdl4KB-jGF7Hntz>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddruddtgedguddujecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvuffkfhggtggujgesthdtredttddtjeenucfhrhhomhepffgrfhhn
    rgcujfhirhhstghhfhgvlhguuceouggrfhhnrgesfhgrshhtmhgrihhlrdgtohhmqeenuc
    ggtffrrghtthgvrhhnpeffledvudejgfeitedvleevteduueekkedtjedvgedvgfduleet
    ffeujedvveekieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfh
    hrohhmpegurghfnhgrsehfrghsthhmrghilhdrtghomh
X-ME-Proxy: <xmx:eMIfYgXf_LKJQNeagbc41-v-E4RbR-fI1t-7yzvmeb0kcb5Qzco-PA>
    <xmx:eMIfYnk36ZCWYI1ZAQgTQCzE0_nozyNV0JMci0MdGyRVBem6WQo38Q>
    <xmx:eMIfYtfwlc201DIuqiuDFztjG0AQ44uQdDHf6BAhKlDQDxFl7MpKag>
    <xmx:eMIfYgBH3faQm65RAtdE9eodIIhfAsnA5vVSApS-zdKGoruXe3ntoQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 2 Mar 2022 14:16:06 -0500 (EST)
Date:   Wed, 2 Mar 2022 21:16:01 +0200
From:   Dafna Hirschfeld <dafna@fastmail.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, Heiko Stuebner <heiko@sntech.de>,
        Paul Elder <paul.elder@ideasonboard.com>,
        Tomasz Figa <tfiga@google.com>,
        linux-rockchip@lists.infradead.org
Subject: Re: [PATCH 07/16] media: rkisp1: Simplify rkisp1_entities_register()
 error path
Message-ID: <20220302191601.gqnwk2wr3ffuqcor@guri>
References: <20220227160116.18556-1-laurent.pinchart@ideasonboard.com>
 <20220227160116.18556-8-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220227160116.18556-8-laurent.pinchart@ideasonboard.com>
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 27.02.2022 18:01, Laurent Pinchart wrote:
> Now that all the unregistration functions are safe to call on
> non-registered entities, the error path in rkisp1_entities_register()
> can be simplified. Factor out the unregistration to a separate function
> to share code with rkisp1_remove().
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Reviewed-by: Dafna Hirschfeld <dafna@fastmail.com>

> ---
>  .../platform/rockchip/rkisp1/rkisp1-dev.c     | 40 +++++++++----------
>  1 file changed, 19 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
> index 3f5cfa7eb937..f8b2573aa9da 100644
> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
> @@ -346,48 +346,50 @@ static const struct dev_pm_ops rkisp1_pm_ops = {
>   * Core
>   */
>  
> +static void rkisp1_entities_unregister(struct rkisp1_device *rkisp1)
> +{
> +	rkisp1_params_unregister(rkisp1);
> +	rkisp1_stats_unregister(rkisp1);
> +	rkisp1_capture_devs_unregister(rkisp1);
> +	rkisp1_resizer_devs_unregister(rkisp1);
> +	rkisp1_isp_unregister(rkisp1);
> +}
> +
>  static int rkisp1_entities_register(struct rkisp1_device *rkisp1)
>  {
>  	int ret;
>  
>  	ret = rkisp1_isp_register(rkisp1);
>  	if (ret)
> -		return ret;
> +		goto error;
>  
>  	ret = rkisp1_resizer_devs_register(rkisp1);
>  	if (ret)
> -		goto err_unreg_isp_subdev;
> +		goto error;
>  
>  	ret = rkisp1_capture_devs_register(rkisp1);
>  	if (ret)
> -		goto err_unreg_resizer_devs;
> +		goto error;
>  
>  	ret = rkisp1_stats_register(rkisp1);
>  	if (ret)
> -		goto err_unreg_capture_devs;
> +		goto error;
>  
>  	ret = rkisp1_params_register(rkisp1);
>  	if (ret)
> -		goto err_unreg_stats;
> +		goto error;
>  
>  	ret = rkisp1_subdev_notifier(rkisp1);
>  	if (ret) {
>  		dev_err(rkisp1->dev,
>  			"Failed to register subdev notifier(%d)\n", ret);
> -		goto err_unreg_params;
> +		goto error;
>  	}
>  
>  	return 0;
> -err_unreg_params:
> -	rkisp1_params_unregister(rkisp1);
> -err_unreg_stats:
> -	rkisp1_stats_unregister(rkisp1);
> -err_unreg_capture_devs:
> -	rkisp1_capture_devs_unregister(rkisp1);
> -err_unreg_resizer_devs:
> -	rkisp1_resizer_devs_unregister(rkisp1);
> -err_unreg_isp_subdev:
> -	rkisp1_isp_unregister(rkisp1);
> +
> +error:
> +	rkisp1_entities_unregister(rkisp1);
>  	return ret;
>  }
>  
> @@ -583,11 +585,7 @@ static int rkisp1_remove(struct platform_device *pdev)
>  	v4l2_async_nf_unregister(&rkisp1->notifier);
>  	v4l2_async_nf_cleanup(&rkisp1->notifier);
>  
> -	rkisp1_params_unregister(rkisp1);
> -	rkisp1_stats_unregister(rkisp1);
> -	rkisp1_capture_devs_unregister(rkisp1);
> -	rkisp1_resizer_devs_unregister(rkisp1);
> -	rkisp1_isp_unregister(rkisp1);
> +	rkisp1_entities_unregister(rkisp1);
>  
>  	media_device_unregister(&rkisp1->media_dev);
>  	v4l2_device_unregister(&rkisp1->v4l2_dev);
> -- 
> Regards,
> 
> Laurent Pinchart
> 
