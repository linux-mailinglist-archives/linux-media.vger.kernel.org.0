Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 41EE954D581
	for <lists+linux-media@lfdr.de>; Thu, 16 Jun 2022 01:50:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349199AbiFOXuO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 Jun 2022 19:50:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60212 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233984AbiFOXuN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 Jun 2022 19:50:13 -0400
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 763283C732
        for <linux-media@vger.kernel.org>; Wed, 15 Jun 2022 16:50:12 -0700 (PDT)
Received: by mail-wr1-x42f.google.com with SMTP id g4so691144wrh.11
        for <linux-media@vger.kernel.org>; Wed, 15 Jun 2022 16:50:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=zQ639pDlCKDPv9KigQwi0ZLEgWgPMwcZ5fRsrb01EsY=;
        b=iWpHsRw3oA7OOUVNZt1GZ9YKQ28Rv54xSk56BsdxS2wknrZi+8pWpC/xGSOpI2pV3R
         TFEa01YGB4OGE37kDUVKHEVRU1cvWvk4T4woErwt8McmP2gawqYAZ7as2/w9zG+VGOUC
         w0INPTi5H0HXn9q4mQGkpo6qCEdtJzNHcTDPE/OnGmp3XCuz7G/Dz36pNhqq1CzcdVc8
         YHj9uQ3XrAPiyeAbUXf4tRqFLOKbrqknWQSkyat6g+vVEYtBCUYzqTpTo5SFeoAViqJL
         zdIU8scsXbaRdMFNYGvtyHK9h0O2y59D5J7OLTuOsuE0/r0pb04VidHK82A9EbbGI54j
         FRjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=zQ639pDlCKDPv9KigQwi0ZLEgWgPMwcZ5fRsrb01EsY=;
        b=sS4GCfb9QGwpoZqU6zbsbe6EpLXGgx8Qj6JS9BVLvFpXkPIfNoKEKQXaazu6UCsMNz
         ZbNyXGR3xwqxo5no4+Xesw/6COHUdIZrH5KvBBYbT9Cbu9AZyxnx2iFKgPeOf3kKg4w5
         flaJ0STyx0pu7/c2cJ0v1dNTlYAnND55mlzsN1/qLiTDBgExEpW0UB46Ue5cxihy5zvd
         N5iZtqFO8qyUrYlM7qnLuY9us+9EW6OOCikaE8ntkqRXWm0oKkRTHLexuM2SVg0B7f2P
         o5dg/pJ+hP4Bod3SLqQLG2EPLgSA8XP8YGR3UwwyDUkUUyku8HPHo2GWEGdaLEmI3CyF
         r5lg==
X-Gm-Message-State: AJIora9GYQrqHojPEh6RO13KPFcZrISYWuks6pN4kyuu2SFjOdKvwxAN
        jjfjshBDdPfxe1tLdrs0+ns=
X-Google-Smtp-Source: AGRyM1uAsc3dtMIyybKyeayzn1uUx4C7gU+fE6D6wIJslyZOeBZ5aegM0jLTjxVaQf+LeMFP/rXxkw==
X-Received: by 2002:adf:f110:0:b0:21a:716:12e3 with SMTP id r16-20020adff110000000b0021a071612e3mr2029184wro.614.1655337010906;
        Wed, 15 Jun 2022 16:50:10 -0700 (PDT)
Received: from arch-thunder (a109-49-33-111.cpe.netcabo.pt. [109.49.33.111])
        by smtp.gmail.com with ESMTPSA id p3-20020a1c5443000000b0039c362311d2sm4723081wmi.9.2022.06.15.16.50.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jun 2022 16:50:10 -0700 (PDT)
Date:   Thu, 16 Jun 2022 00:50:08 +0100
From:   Rui Miguel Silva <rmfrfs@gmail.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, Jacopo Mondi <jacopo@jmondi.org>,
        Paul Elder <paul.elder@ideasonboard.com>,
        kernel@pengutronix.de, linux-imx@nxp.com
Subject: Re: [PATCH 1/4] media: imx: imx-mipi-csis: Set the subdev fwnode for
 endpoint matching
Message-ID: <20220615235008.htfebbrntq7thp2z@arch-thunder>
References: <20220615192602.25472-1-laurent.pinchart@ideasonboard.com>
 <20220615192602.25472-2-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220615192602.25472-2-laurent.pinchart@ideasonboard.com>
X-Spam-Status: No, score=-0.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,HK_RANDOM_ENVFROM,
        HK_RANDOM_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hey Laurent,

On Wed, Jun 15, 2022 at 10:25:59PM +0300, Laurent Pinchart wrote:
> Endpoint matching is preferred over device matching with the async
> notifier framework. Set the fwnode in the v4l2_subdev for the CSIS to
> the endpoint connected to the next device.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

LGTM,
Reviewed-by: Rui Miguel Silva <rmfrfs@gmail.com>

Cheers,
   Rui
> ---
>  drivers/media/platform/nxp/imx-mipi-csis.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/drivers/media/platform/nxp/imx-mipi-csis.c b/drivers/media/platform/nxp/imx-mipi-csis.c
> index 80b1c021d14a..09a220c1bfe8 100644
> --- a/drivers/media/platform/nxp/imx-mipi-csis.c
> +++ b/drivers/media/platform/nxp/imx-mipi-csis.c
> @@ -1378,6 +1378,13 @@ static int mipi_csis_subdev_init(struct mipi_csis_device *csis)
>  
>  	sd->dev = csis->dev;
>  
> +	sd->fwnode = fwnode_graph_get_endpoint_by_id(dev_fwnode(csis->dev),
> +						     1, 0, 0);
> +	if (!sd->fwnode) {
> +		dev_err(csis->dev, "Unable to retrieve endpoint for port@1\n");
> +		return -ENOENT;
> +	}
> +
>  	csis->csis_fmt = &mipi_csis_formats[0];
>  	mipi_csis_init_cfg(sd, NULL);
>  
> @@ -1498,6 +1505,7 @@ static int mipi_csis_probe(struct platform_device *pdev)
>  	v4l2_async_unregister_subdev(&csis->sd);
>  disable_clock:
>  	mipi_csis_clk_disable(csis);
> +	fwnode_handle_put(csis->sd.fwnode);
>  	mutex_destroy(&csis->lock);
>  
>  	return ret;
> @@ -1517,6 +1525,7 @@ static int mipi_csis_remove(struct platform_device *pdev)
>  	mipi_csis_runtime_suspend(&pdev->dev);
>  	mipi_csis_clk_disable(csis);
>  	media_entity_cleanup(&csis->sd.entity);
> +	fwnode_handle_put(csis->sd.fwnode);
>  	mutex_destroy(&csis->lock);
>  	pm_runtime_set_suspended(&pdev->dev);
>  
> -- 
> Regards,
> 
> Laurent Pinchart
>
> 
