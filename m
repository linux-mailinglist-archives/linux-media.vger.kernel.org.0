Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 98F796D08B3
	for <lists+linux-media@lfdr.de>; Thu, 30 Mar 2023 16:49:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231322AbjC3Otk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 30 Mar 2023 10:49:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231934AbjC3Otj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 30 Mar 2023 10:49:39 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 33D19A268
        for <linux-media@vger.kernel.org>; Thu, 30 Mar 2023 07:49:36 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id y15so24847406lfa.7
        for <linux-media@vger.kernel.org>; Thu, 30 Mar 2023 07:49:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20210112.gappssmtp.com; s=20210112; t=1680187774;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VU/9sR2Gn6BU0Gika4QeRGZssdzpgS/xpjDgT6yVGt8=;
        b=luOdiIo4Hx8rQKdQNf+nnvmIW9CweZ8RDJ5Jb++wUXig7hQudRu89S9OUo8FbwySda
         VBl+PZx4OiHHlLkQ0xBTfPJrGdqjznpx/U71d4EqI+QemMXlzX+hpDm70gMXIutJemBR
         NOJcFa8oE89KYB+oFrkuvf/oAObHivm6EJJSRvgeXVRY0lFJjzLo3j1QHW60QAnja08T
         jC6GKtX8NClEoulTUtcmEORMlgZWy4m0QUxOxr3sMbhx9FpAvEic1VlNU6Ojg35LW7W8
         KuHtaz2fWUpWXov0uAy2tA270HEoASEbwpGUE604JU8kPEy8ZpoF69VbFKsz0XezrPN+
         z6nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680187774;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VU/9sR2Gn6BU0Gika4QeRGZssdzpgS/xpjDgT6yVGt8=;
        b=TTjZrcCdIV7QT/e5Pqlm97jySfFAGByQu8dJ1AebHOnvVwbjClCnovkCC6Gd9vICpc
         SaApziQc7xyEZfruhpp+Cy0ONtyyTiB/Nl3cU3MIOkPP/MDLBZW7X9KF02G4TjrCFATH
         pRNX9XDyLQxaigUh/CFt1xHdK6BvfvtHJ4C7gBpK2nu3Hi/gwAK81V266RtJzWlD+sra
         pWRb/K0tWDr2THqdy6oWz2odyGuqBYtSjPY8063b0Drx5PlJfXH5kpBCENk9XVe/KaHn
         cUpKspHCWVkTVWsSF+uziaiRk+Pd4o4cU8bctueeCqWc7j57qEdC0zs8Mawkw6M4piQU
         V4pQ==
X-Gm-Message-State: AAQBX9elpb9KRGAuDsdOhmF6nBOtNj6swixcmIOOIMewAtvI+f3y6hTv
        ZdJyZmnF2s+AcxlOE5ar4Q6ulQ==
X-Google-Smtp-Source: AKy350YfuNaarH6edh1TVcm+uvVLdWvJ8mJR+9Ed3cqC+YFNN8IGmFsat1TRuB1TEHeVt0QaXZK0Rg==
X-Received: by 2002:a05:6512:486:b0:4d8:71dd:5c5e with SMTP id v6-20020a056512048600b004d871dd5c5emr6852197lfq.37.1680187774095;
        Thu, 30 Mar 2023 07:49:34 -0700 (PDT)
Received: from localhost (h-46-59-89-207.A463.priv.bahnhof.se. [46.59.89.207])
        by smtp.gmail.com with ESMTPSA id r28-20020ac252bc000000b004e9cad1cd7csm4835115lfm.229.2023.03.30.07.49.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Mar 2023 07:49:33 -0700 (PDT)
Date:   Thu, 30 Mar 2023 16:49:33 +0200
From:   Niklas =?utf-8?Q?S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] media: rcar-vin: Select correct interrupt mode for
 V4L2_FIELD_ALTERNATE
Message-ID: <ZCWhfYCUz2ISG+Ac@oden.dyn.berto.se>
References: <20230211205534.493789-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230211205534.493789-1-niklas.soderlund+renesas@ragnatech.se>
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

Gentle ping on this patch.

On 2023-02-11 21:55:34 +0100, Niklas Söderlund wrote:
> When adding proper support for V4L2_FIELD_ALTERNATE it was missed that
> this field format should trigger an interrupt for each field, not just
> for the whole frame. Fix this by marking it as progressive in the
> capture setup, which will then select the correct interrupt mode.
> 
> Tested on both Gen2 and Gen3 with the result of a doubling of the frame
> rate for V4L2_FIELD_ALTERNATE. From a PAL video source the frame rate is
> now 50, which is expected for alternate field capture.
> 
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> ---
>  drivers/media/platform/renesas/rcar-vin/rcar-dma.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-dma.c b/drivers/media/platform/renesas/rcar-vin/rcar-dma.c
> index 23598e22adc7..2a77353f10b5 100644
> --- a/drivers/media/platform/renesas/rcar-vin/rcar-dma.c
> +++ b/drivers/media/platform/renesas/rcar-vin/rcar-dma.c
> @@ -728,12 +728,10 @@ static int rvin_setup(struct rvin_dev *vin)
>  	case V4L2_FIELD_SEQ_TB:
>  	case V4L2_FIELD_SEQ_BT:
>  	case V4L2_FIELD_NONE:
> +	case V4L2_FIELD_ALTERNATE:
>  		vnmc = VNMC_IM_ODD_EVEN;
>  		progressive = true;
>  		break;
> -	case V4L2_FIELD_ALTERNATE:
> -		vnmc = VNMC_IM_ODD_EVEN;
> -		break;
>  	default:
>  		vnmc = VNMC_IM_ODD;
>  		break;
> -- 
> 2.39.1
> 

-- 
Kind Regards,
Niklas Söderlund
