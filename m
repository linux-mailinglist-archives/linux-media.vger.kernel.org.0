Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C3C3D63519F
	for <lists+linux-media@lfdr.de>; Wed, 23 Nov 2022 08:56:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236364AbiKWH4L (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 23 Nov 2022 02:56:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33710 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236362AbiKWHz4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 23 Nov 2022 02:55:56 -0500
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B6021FDD89
        for <linux-media@vger.kernel.org>; Tue, 22 Nov 2022 23:53:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1669190026; x=1700726026;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=YuooqEMCTQPSAbUuCrL22s0z/ylKa3hOz8fIkCJiOfM=;
  b=HhuEZC22Vi/IUUBiNBypDyjeEiYshRQCv88CFV9YoIpuXOQ8Lc8VTmn8
   wwQLUqwC5OPKz/2bpO4jT0qE8WhYcmgae/mxx3jq55YmULVCZrRiilEpA
   sqgF3tI58F5g1kyyc0sCNSPod3xtM2Ngoq09x5/UGlUhDGr/0W0DuG002
   Rb1yM/cBBeUG/VYlEvOygGVRFKX/a4ZHEi2UhakfYPHXcpA4Ghq0wTbQx
   kZjieDA743a7QyUGfEmTOU4iTWZLQD24ajaEduBwB3TevJ14SrNXVgARG
   hVHlzWWXGKpJ1Zum7mOMrrUgxSJ2RrfY5YqEbHF5TTaLdlXEIaB5JEZIc
   Q==;
X-IronPort-AV: E=Sophos;i="5.96,186,1665439200"; 
   d="scan'208";a="27525654"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 23 Nov 2022 08:53:43 +0100
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Wed, 23 Nov 2022 08:53:43 +0100
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Wed, 23 Nov 2022 08:53:43 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1669190023; x=1700726023;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=YuooqEMCTQPSAbUuCrL22s0z/ylKa3hOz8fIkCJiOfM=;
  b=NIVNKeGIeTcx/Bt2fegj4FDswJqJc3/BnKSN2wWH6/FEFHo/Lnnzs/si
   AP+NUC4+sdj0IBRwRnIf8q8dQ5DxJpPjbBOxP4brLDA1nbwYR6Mc+cX5e
   3490M20tOExoS94t1tutbVyonQtVH/dt0XAWKRec+bS02FFgyOR4Et5WB
   rsqz72MTrX2VFwlijImZZvfTrIDi84LDmNwuiu0HDAymj3mwFV8D+JTjG
   OFENZqhkUXyt+CGhUUePzZcTurBhH8uCLFCIfNXg4a9F8yKdh/SyAZGjn
   488B3kNj/QQmaamNuDZzAeAt1nA6KcMLGghYq685OzsB+VsNvcHYMDvtY
   Q==;
X-IronPort-AV: E=Sophos;i="5.96,186,1665439200"; 
   d="scan'208";a="27525648"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 23 Nov 2022 08:53:43 +0100
Received: from steina-w.localnet (unknown [10.123.53.21])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id EBFB7280056;
        Wed, 23 Nov 2022 08:53:27 +0100 (CET)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, Sakari Ailus <sakari.ailus@iki.fi>,
        Manivannan Sadhasivam <mani@kernel.org>
Subject: Re: [PATCH v1 04/15] media: i2c: imx290: Access link_freq_index directly
Date:   Wed, 23 Nov 2022 08:53:27 +0100
Message-ID: <2128665.irdbgypaU6@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20221122223250.21233-5-laurent.pinchart@ideasonboard.com>
References: <20221122223250.21233-1-laurent.pinchart@ideasonboard.com> <20221122223250.21233-5-laurent.pinchart@ideasonboard.com>
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

Hello Laurent,

thanks for working on this.

Am Dienstag, 22. November 2022, 23:32:39 CET schrieb Laurent Pinchart:
> The imx290_get_link_freq_index() function hides the fact that it relies
> on the imx290 current_mode field, which obfuscates the code instead of
> making it more readable. Inline it in the callers, and use the mode
> pointer we already have in imx290_ctrl_update() instead of using the
> current_mode field.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  drivers/media/i2c/imx290.c | 10 ++--------
>  1 file changed, 2 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
> index eb295502d0c3..2d198b167853 100644
> --- a/drivers/media/i2c/imx290.c
> +++ b/drivers/media/i2c/imx290.c
> @@ -547,14 +547,9 @@ static int imx290_write_current_format(struct imx290
> *imx290) return 0;
>  }
> 
> -static inline u8 imx290_get_link_freq_index(struct imx290 *imx290)
> -{
> -	return imx290->current_mode->link_freq_index;
> -}
> -
>  static s64 imx290_get_link_freq(struct imx290 *imx290)
>  {
> -	u8 index = imx290_get_link_freq_index(imx290);
> +	u8 index = imx290->current_mode->link_freq_index;
> 
>  	return *(imx290_link_freqs_ptr(imx290) + index);
>  }
> @@ -645,8 +640,7 @@ static void imx290_ctrl_update(struct imx290 *imx290,
>  	unsigned int hblank = mode->hmax - mode->width;
>  	unsigned int vblank = IMX290_VMAX_DEFAULT - mode->height;
> 
> -	__v4l2_ctrl_s_ctrl(imx290->link_freq,
> -			   imx290_get_link_freq_index(imx290));
> +	__v4l2_ctrl_s_ctrl(imx290->link_freq, mode->link_freq_index);
>  	__v4l2_ctrl_s_ctrl_int64(imx290->pixel_rate,
>  				 imx290_calc_pixel_rate(imx290));

Reviewed-by: Alexander Stein <alexander.stein@ew.tq-group.com>



