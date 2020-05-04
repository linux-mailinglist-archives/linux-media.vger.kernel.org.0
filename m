Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BA9061C3556
	for <lists+linux-media@lfdr.de>; Mon,  4 May 2020 11:14:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728209AbgEDJOG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 4 May 2020 05:14:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59436 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728098AbgEDJOG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 4 May 2020 05:14:06 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D44D2C061A0E
        for <linux-media@vger.kernel.org>; Mon,  4 May 2020 02:14:04 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id h9so9678514wrt.0
        for <linux-media@vger.kernel.org>; Mon, 04 May 2020 02:14:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=v3LMTElPrzf2leuaMuQ8jcUHC33PokwMJ8GZIc9OQu0=;
        b=exXEZmjyJ9LG5xrVkgxAWwiUWdtc3jLS8s2PBOzZzDIMiUNOupbpoc8naSrRrlLd7t
         94QpJlYA1IPEpPPgu5VX6yETphcH3CNfnMUYj4qhd6WwQPX8waMhHSXbHDbQrtlU/BLO
         v8kFHYDOCPCEAgJZcMUy4VoDIzObwBULcBwikfbuJ8eiVWCJgEIkavrXeifATf1gBx2l
         Es5y7Nxyj8+ZI1PWbbqM8slgrA6i2QpqsdfwI1Y3DcGT9odZANluobPKBVou/xTrNakL
         VF1yjCZ7QnLn34PzSXdhOLm593eGMfdggya9hpuEAjLOF3ExgBNk1Jnrur+oK4j+gZ24
         q9wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=v3LMTElPrzf2leuaMuQ8jcUHC33PokwMJ8GZIc9OQu0=;
        b=TdM2rAUgXqZIJviDxkuaM8O+0IbOVL/S3Mdr9IyuWcLrZaJ9If0lyd4jMgVYyxmA3v
         LaUnIc8AOAHtyfERWWwcNLmtdZHI4Ua3ZRFDmtNbBzlf3VPRKHBeNbbPGok/A76viRcR
         rfHjisKX+Kpu2DUulvFm8fp7ZrciUI/fWMphocut85vau61jYO2mMbEf/4aFlM/Wm7+V
         v5wq9DFe8OGfcUlxWMl+kcqkdP7ouIHj+xxnfRJnUQIJHZ0op3XqKCPYzcOQvCy1GTvE
         +/4OUKx2kI+BNTtV75w6ylZznYlrjeTincCodlG8F5fl1+9Dw7qtkrPYjbSv9FdjfemB
         3+iA==
X-Gm-Message-State: AGi0PubzLgw81/0NOEIM5Kqw6JUsr7J/nKN9iSdS8vRxSW4uaUntHU8O
        H4Qah7f8NgWeHViNrqADtCc=
X-Google-Smtp-Source: APiQypLdaUofZhJHVZ9HxbMR+dbbZvp/H85gvWYaO+Q0qybdJcQNIWVmEnWASzoH7dniLbvN97iS4A==
X-Received: by 2002:a5d:68c5:: with SMTP id p5mr10790237wrw.234.1588583643604;
        Mon, 04 May 2020 02:14:03 -0700 (PDT)
Received: from arch-thunder.localdomain (a109-49-46-234.cpe.netcabo.pt. [109.49.46.234])
        by smtp.gmail.com with ESMTPSA id q187sm12163761wma.41.2020.05.04.02.14.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2020 02:14:02 -0700 (PDT)
Date:   Mon, 4 May 2020 10:14:00 +0100
From:   Rui Miguel Silva <rmfrfs@gmail.com>
To:     Steve Longerbeam <slongerbeam@gmail.com>
Cc:     linux-media@vger.kernel.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH v6 10/22] media: imx: imx7-mipi-csis: Implement
 get_fwnode_pad op
Message-ID: <20200504091400.w2nrnb4rrhf3dizd@arch-thunder.localdomain>
References: <20200501171556.14731-1-slongerbeam@gmail.com>
 <20200501171556.14731-11-slongerbeam@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200501171556.14731-11-slongerbeam@gmail.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Steve,
On Fri, May 01, 2020 at 10:15:44AM -0700, Steve Longerbeam wrote:
> Use v4l2_subdev_get_fwnode_pad_1_to_1() as the get_fwnode_pad operation.
> The imx7-mipi-csis maps port numbers and pad indexes 1:1.
> 
> Signed-off-by: Steve Longerbeam <slongerbeam@gmail.com>

Acked-by: Rui Miguel Silva <rmfrfs@gmail.com>

------
Cheers,
     Rui

> ---
>  drivers/staging/media/imx/imx7-mipi-csis.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/staging/media/imx/imx7-mipi-csis.c b/drivers/staging/media/imx/imx7-mipi-csis.c
> index b66299c1136d..7b5c3e662d0d 100644
> --- a/drivers/staging/media/imx/imx7-mipi-csis.c
> +++ b/drivers/staging/media/imx/imx7-mipi-csis.c
> @@ -906,6 +906,7 @@ static const struct v4l2_subdev_core_ops mipi_csis_core_ops = {
>  static const struct media_entity_operations mipi_csis_entity_ops = {
>  	.link_setup	= mipi_csis_link_setup,
>  	.link_validate	= v4l2_subdev_link_validate,
> +	.get_fwnode_pad = v4l2_subdev_get_fwnode_pad_1_to_1,
>  };
>  
>  static const struct v4l2_subdev_video_ops mipi_csis_video_ops = {
> -- 
> 2.17.1
> 
