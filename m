Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2BFF45B2179
	for <lists+linux-media@lfdr.de>; Thu,  8 Sep 2022 17:02:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232767AbiIHPCu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 8 Sep 2022 11:02:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232766AbiIHPCs (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 8 Sep 2022 11:02:48 -0400
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EDFF4ED9B0
        for <linux-media@vger.kernel.org>; Thu,  8 Sep 2022 08:02:45 -0700 (PDT)
Received: by mail-wm1-x333.google.com with SMTP id d12-20020a05600c34cc00b003a83d20812fso1994434wmq.1
        for <linux-media@vger.kernel.org>; Thu, 08 Sep 2022 08:02:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=iJFQYZPoM1HArSx+oO+mteeG1KRJreaYgb8uzgZjMWE=;
        b=UrI6jy6lu9owZWs9ikmlWdgSolpZYfkYaNYeOtGrl4F6/q8hMeTl5yuwuzQuPYp0sQ
         r45xqDTxGQ3sKFMn0ofMMGXQwgE9UodPFIb4I4296cOYZzPdQf2w18rMkR/DcnDgyMCZ
         IUb6oHu2RLE4rabJcRHxUpog5Xgg7B/ywKhcBr+iDwuR3c43Ch9vl3ngpMra+GJHdZ9k
         8WbdLGLhvlRvBSFAyOD+aJUrw6NRoH2smxRmVG5sGdRSZhGdVA43RnM7ZYahIS/QC3NF
         OAZG0ZtuyWpSQP7srNVW6SG278i6ey9uLGu1EsKVwdBoADtpAvtjYTRgobwPE6Ot60LM
         FyfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=iJFQYZPoM1HArSx+oO+mteeG1KRJreaYgb8uzgZjMWE=;
        b=HJeyuQkrAD6a6qbHHTGk0NU/SYfh7u7erzyROm3gwy4GcX36FGCdCX/xyUzE+1PnoT
         V54T444FQuEUCylfb1inJd23Z0hOMOz+E9o79RIosEVUhMpDOcprjTVzV6hDKcmVp3FA
         yeCm+S3gMhEd+cL+wh5FKbhU+XWLLH9v6ySFc82Gqr3VoH6HvTm/HzZuTMBu29VGsP8G
         yRPAcwyx02e2eCr0Cwrdf6KosK7a9/wyc8XEnf5oSXHmkK759w/ZlM/IbPGDcDm4WhFE
         f1fg2RI/AYQ3jBJ+wutFhiGB447ncw0BEtyCbZyyed5UeFFpOyNeYto70PBiU+ZWhXnS
         rKdw==
X-Gm-Message-State: ACgBeo2g+4enirSZoVIiHpPg/T/vaU7oEynnsYqjqzyKjhyg+dCY8h//
        dy0MdY0bZyRF4yrSJEqHZcwpeUg12+/zYw==
X-Google-Smtp-Source: AA6agR5xeQK9JzlagXc9Li5lvlFy74Vt1cRU+xtMmzCQEwDJWyuoDnefGgGtDRQjgQB8rY0wZhTTYA==
X-Received: by 2002:a05:600c:5106:b0:3a8:411c:7366 with SMTP id o6-20020a05600c510600b003a8411c7366mr2547869wms.204.1662649364409;
        Thu, 08 Sep 2022 08:02:44 -0700 (PDT)
Received: from arch-thunder (a109-49-33-111.cpe.netcabo.pt. [109.49.33.111])
        by smtp.gmail.com with ESMTPSA id p21-20020a1c7415000000b003b2878b9e0dsm2859501wmc.20.2022.09.08.08.02.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Sep 2022 08:02:43 -0700 (PDT)
Date:   Thu, 8 Sep 2022 16:02:40 +0100
From:   Rui Miguel Silva <rmfrfs@gmail.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Paul Elder <paul.elder@ideasonboard.com>,
        Jacopo Mondi <jacopo@jmondi.org>, kernel@pengutronix.de,
        linux-imx@nxp.com
Subject: Re: [PATCH 0/3] media: imx: imx7-media-csi: Small fix and cleanups
Message-ID: <20220908150240.wnannfkigtyotffv@arch-thunder>
References: <20220907191547.19255-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220907191547.19255-1-laurent.pinchart@ideasonboard.com>
X-Spam-Status: No, score=-0.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,HK_RANDOM_ENVFROM,
        HK_RANDOM_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,
On Wed, Sep 07, 2022 at 10:15:44PM +0300, Laurent Pinchart wrote:
> Hello,
> 
> This small series builds on top of [1]. It performs two small cleanups
> (1/3 and 2/3) and fixes a, issue (in 3/3) in the imx7-media-csi driver.
> 
> Please see individual patches for details.

All look good to me. Thanks for this.
For the all series:

Acked-by: Rui Miguel Silva <rmfrfs@gmail.com>

Cheers,
  Rui
> 
> [1] https://lore.kernel.org/linux-media/20220907114737.1127612-1-paul.elder@ideasonboard.com
> 
> Laurent Pinchart (3):
>   media: imx: imx7-media-csi: Move variable to loop scope
>   media: imx: imx7-media-csi: Rename phys variables to dma_addr
>   media: imx: imx7-media-csi: Clear BIT_MIPI_DOUBLE_CMPNT for <16b
>     formats
> 
>  drivers/staging/media/imx/imx7-media-csi.c | 43 +++++++++++-----------
>  1 file changed, 22 insertions(+), 21 deletions(-)
> 
> -- 
> Regards,
> 
> Laurent Pinchart
> 
