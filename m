Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1E3F565BE89
	for <lists+linux-media@lfdr.de>; Tue,  3 Jan 2023 12:02:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237459AbjACLCL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 3 Jan 2023 06:02:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45622 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237326AbjACLCB (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 3 Jan 2023 06:02:01 -0500
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0E57EE3D
        for <linux-media@vger.kernel.org>; Tue,  3 Jan 2023 03:01:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1672743720; x=1704279720;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=sUZDoqJt8TyM8cEnEFPbm9QNRUAhYObNTONQFkRo8bk=;
  b=pYrdMAueS0vUMrV6BcAoYGmfWC81i18oXRw4+z3MtXYuxa20ltHJp6FX
   jzpIffqh/XyKyOII+HxbCZCxAE5WnqFzesoWRtLfbbgvTpL38F7ATUImf
   FIBiMaZ+IYOey0hqxcfO30yVmyaexLKu9CcCoCtiR15lgfXS605w+dc7W
   lMjcGs27s+KVSl7/2nIRkjYw7wqDSBYDrd4RKt+N8tbQ3jjXVfqSvmbqC
   N8fJQSJShXqJ3q/Z+J9OunNkPv1fbYXnPNMlef/f4lHvhrlahR5aJUujG
   47AJ3DYSjs9cauUsFy1ybmPsAZRWmYRtDbj9dRi5tWdqWbMEp9JoIwonT
   Q==;
X-IronPort-AV: E=Sophos;i="5.96,296,1665439200"; 
   d="scan'208";a="28219671"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 03 Jan 2023 12:01:58 +0100
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Tue, 03 Jan 2023 12:01:58 +0100
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Tue, 03 Jan 2023 12:01:58 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1672743718; x=1704279718;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=sUZDoqJt8TyM8cEnEFPbm9QNRUAhYObNTONQFkRo8bk=;
  b=ALSvS06VJgjVhpKK3FE0Cf6Tf5bnmrgHWSHTFsq1UazgOuu40y4u2Z1E
   jhbZ1rndkhG3e1gd56t8H+YLYhn4Bhspuh5Z9kaisoCclSfL0DvKNF88F
   JNesk4rSWBgEvn8a1OUZBbkfHr8AGi9csjF1+FohCfKKODEahXn3wuZhF
   +aOIP2sqcgmWCxUndHFoJFbLD9+uAR0nhcUwES9opY/1vFx3Xxx2O7QFs
   vVUwLcy4JKU/4bikIbvEeYVLwIS/Ud/khauQY8OSjVhGK0JHY/fuIZhza
   Emdizy+oZffeZiBaZ9ElTF4jhzK/lhQOjWSMEGJ+CuIkCwtXWdAl4EdZd
   g==;
X-IronPort-AV: E=Sophos;i="5.96,296,1665439200"; 
   d="scan'208";a="28219670"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 03 Jan 2023 12:01:58 +0100
Received: from steina-w.localnet (unknown [10.123.53.21])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 1961B280056;
        Tue,  3 Jan 2023 12:01:58 +0100 (CET)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     mchehab@kernel.org, ezequiel@vanguardiasur.com.ar,
        hverkuil@xs4all.nl, laurent.pinchart@ideasonboard.com,
        "Xavier Roumegue (OSS)" <xavier.roumegue@oss.nxp.com>
Cc:     Xavier Roumegue <xavier.roumegue@oss.nxp.com>,
        linux-media@vger.kernel.org, kernel test robot <lkp@intel.com>,
        Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH] media: dw100: Add a missing unwind goto in dw100_probe()
Date:   Tue, 03 Jan 2023 12:01:55 +0100
Message-ID: <1962839.8hb0ThOEGa@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20230103105534.3018257-1-xavier.roumegue@oss.nxp.com>
References: <20230103105534.3018257-1-xavier.roumegue@oss.nxp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

Am Dienstag, 3. Januar 2023, 11:55:34 CET schrieb Xavier Roumegue (OSS):
> From: Xavier Roumegue <xavier.roumegue@oss.nxp.com>
> 
> In case the IRQ allocation returns an error in dw100_probe(), the pm
> runtime is not disabled before to return.
> 
> Add the missing unwind goto on the error handling path of the IRQ
> allocation request.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Reported-by: Dan Carpenter <error27@gmail.com>
> Signed-off-by: Xavier Roumegue <xavier.roumegue@oss.nxp.com>
> ---
>  drivers/media/platform/nxp/dw100/dw100.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/nxp/dw100/dw100.c
> b/drivers/media/platform/nxp/dw100/dw100.c index f6d48c36f386..189d60cd5ed1
> 100644
> --- a/drivers/media/platform/nxp/dw100/dw100.c
> +++ b/drivers/media/platform/nxp/dw100/dw100.c
> @@ -1571,7 +1571,7 @@ static int dw100_probe(struct platform_device *pdev)
>  			       dev_name(&pdev->dev), dw_dev);
>  	if (ret < 0) {
>  		dev_err(&pdev->dev, "Failed to request irq: %d\n", ret);
> -		return ret;
> +		goto err_pm;
>  	}
> 
>  	ret = v4l2_device_register(&pdev->dev, &dw_dev->v4l2_dev);

Doesn't it make more sense to request/allocate the IRQ (and other resources) 
before enabling runtime PM?

Best regards,
Alexander



