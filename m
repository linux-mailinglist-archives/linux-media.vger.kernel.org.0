Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9C0364BBAFD
	for <lists+linux-media@lfdr.de>; Fri, 18 Feb 2022 15:54:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236166AbiBROyS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 18 Feb 2022 09:54:18 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:44452 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235974AbiBROyR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 18 Feb 2022 09:54:17 -0500
Received: from mail-qv1-xf2f.google.com (mail-qv1-xf2f.google.com [IPv6:2607:f8b0:4864:20::f2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 481EB53E11
        for <linux-media@vger.kernel.org>; Fri, 18 Feb 2022 06:54:00 -0800 (PST)
Received: by mail-qv1-xf2f.google.com with SMTP id d7so15177413qvk.2
        for <linux-media@vger.kernel.org>; Fri, 18 Feb 2022 06:54:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20210112.gappssmtp.com; s=20210112;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=AMxb1/snu2ldA/ubJJEAYt1WVb3/09SyAfGJTEa/UKQ=;
        b=Fgz90lidrUWx8l9/L+dip/BnxqYGQh6NwgzlB66sPD48dp7ZS+wyGTykM1quRiiwCK
         Q3ZYwz1Z+E/dKHgKgkNkOw0THEQ70be8BD6HxmlwRbAQlf/Onle4QuK2Q1X2YjYScZb1
         Rw+h/B+ErAD0GMCl5cJJyNZSzInCV/TPEJh+2OF6EcmPGOAH0+D/XJrnjLwiFuqvI+AT
         ajOSwwvowFnB2e96OcEIECaDhyGL1UKz4wywrx6dF4/u9aDNUvMTOsfycj5W9XEs5k27
         +C525sy9IXwMGSiYSUKd2oll0mJXowpW7I1TzH1F+KEDgv9OX9e3VzgU0PktJjfavLI9
         fS1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=AMxb1/snu2ldA/ubJJEAYt1WVb3/09SyAfGJTEa/UKQ=;
        b=5dLOgipNBVvhYc+rOCJ00PwglzQQCoQxH+GCfkwoHJZblKErevQTJia6Da4FBhASvE
         cQYJPr9Dgmarxn90PS8W3VAIGariDwaO6W4V/W6rhLSTAiULSV0h1lLrdtHM+dOhRxwk
         hRmLNPQAlMk5Wsim91OvMlEETiYHd/hBZb6Nzu6E0E2Wg1wDmXqOs5X3lzXvmpJzqyWM
         hCOsxWsD7uX/O2TNWbkzod7ntWN8tbE/8AcetH10BJ09zLcUatoLz4uaP2hjDfphJwJO
         +AxqNX0p682SuCLfv69ypcmqD7kDO4gXMFn+iy/AcnVwe9d5+bf4kxa9E7WC0nKmhYwe
         e8Kw==
X-Gm-Message-State: AOAM530+6HQ+tHGg2tnpkKHFFjaHxxVLONJdVx7RWbRuQxxooe/GmaGE
        zjIicrx0uVw6hDV0SaxRXez4DQ==
X-Google-Smtp-Source: ABdhPJwhFNB8fLdh0ym9XWrA9EZ9+ejd6mCNse+81XslSzMhPYs9F3LauZqXUMfLhfpDArU2+f7pUA==
X-Received: by 2002:a05:6214:d03:b0:42c:ce43:9f8b with SMTP id 3-20020a0562140d0300b0042cce439f8bmr5926290qvh.102.1645196039402;
        Fri, 18 Feb 2022 06:53:59 -0800 (PST)
Received: from nicolas-tpx395.localdomain (173-246-12-168.qc.cable.ebox.net. [173.246.12.168])
        by smtp.gmail.com with ESMTPSA id a188sm876860qkf.27.2022.02.18.06.53.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Feb 2022 06:53:59 -0800 (PST)
Message-ID: <419d47d2dfac0b31d48e2ce3b4128c421f808038.camel@ndufresne.ca>
Subject: Re: [PATCH] media: cedrus: h264: Fix neighbour info buffer size
From:   Nicolas Dufresne <nicolas@ndufresne.ca>
To:     Jernej Skrabec <jernej.skrabec@gmail.com>, mripard@kernel.org,
        paul.kocialkowski@bootlin.com
Cc:     mchehab@kernel.org, wens@csie.org, gregkh@linuxfoundation.org,
        hverkuil-cisco@xs4all.nl, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
        linux-kernel@vger.kernel.org
Date:   Fri, 18 Feb 2022 09:53:57 -0500
In-Reply-To: <20220214190839.707889-1-jernej.skrabec@gmail.com>
References: <20220214190839.707889-1-jernej.skrabec@gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.3 (3.42.3-1.fc35) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Le lundi 14 février 2022 à 20:08 +0100, Jernej Skrabec a écrit :
> According to BSP library source, H264 neighbour info buffer size needs
> to be 32 kiB for H6. This is similar to H265 decoding, which also needs
> double buffer size in comparison to older Cedrus core generations.
> 
> Increase buffer size to cover H6 needs. Since increase is not that big
> in absolute numbers, it doesn't make sense to complicate logic for older
> generations.
> 
> Issue was discovered using iommu and cross checked with BSP library
> source.
> 
> Fixes: 6eb9b758e307 ("media: cedrus: Add H264 decoding support")
> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Acked-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> ---
>  drivers/staging/media/sunxi/cedrus/cedrus_h264.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_h264.c b/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
> index b4173a8926d6..d8fb93035470 100644
> --- a/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
> +++ b/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
> @@ -38,7 +38,7 @@ struct cedrus_h264_sram_ref_pic {
>  
>  #define CEDRUS_H264_FRAME_NUM		18
>  
> -#define CEDRUS_NEIGHBOR_INFO_BUF_SIZE	(16 * SZ_1K)
> +#define CEDRUS_NEIGHBOR_INFO_BUF_SIZE	(32 * SZ_1K)
>  #define CEDRUS_MIN_PIC_INFO_BUF_SIZE       (130 * SZ_1K)
>  
>  static void cedrus_h264_write_sram(struct cedrus_dev *dev,

