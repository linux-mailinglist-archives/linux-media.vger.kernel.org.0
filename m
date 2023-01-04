Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B01B165D977
	for <lists+linux-media@lfdr.de>; Wed,  4 Jan 2023 17:26:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239372AbjADQZ4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 4 Jan 2023 11:25:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47896 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240017AbjADQZU (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 4 Jan 2023 11:25:20 -0500
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E5A4033D45
        for <linux-media@vger.kernel.org>; Wed,  4 Jan 2023 08:25:07 -0800 (PST)
Received: by mail-wr1-x430.google.com with SMTP id z16so17064752wrw.1
        for <linux-media@vger.kernel.org>; Wed, 04 Jan 2023 08:25:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=XusVUStcHo92UWiSLjP43hJBRtXlalbLxg52gNvthvo=;
        b=V+fWPjB2Mi+YhDnWvNnjdcugxaX4yQiOrkIlotKbsUj1o7QVWpnsNLoqOKCyufvATq
         N8aZ4ECFfLJW10J5xvxnV3G2J51QahuLUOZPR2SzUPO6JRGUJAgmX6OVebejD0Gr6woo
         yvPjA5YIC9VuS3mVPknAqctiIwD5Lv6Cyoz7tqXXGk2eUaEeE/G3p5DoK/hyHkGkL1Df
         yeUlxwg0SyxPZiZdURbOQNCtfI2GZ0l6s3dBKj90cZeQAESl03vwBaQQ5BbM9m0p3Hgp
         aCLtc7WhNvPceTw4qn1CB1axW2SX4zPNCYYCWROY2dIPN8cTTONYB/nGbT/o/AZtE/4k
         H5IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XusVUStcHo92UWiSLjP43hJBRtXlalbLxg52gNvthvo=;
        b=gffzyh95nuin5h9yqGDCiLlZtX+GazVcQQqJfgvaSBE+0gM0dkw18cZ3yiWT4zhN8f
         uCvfkPuCJFyrYIvfhxcvzOFCRJB3x+WzgKNlfRViUgm1FAaNxi7Z+r25C/K/aQcAjXY6
         L32sZZbllTp8GA3D5Q5VkGZNyovbWqtYOKgSOf0pAPjPVXmJgQQQVZXZ1xKQ21Dy5RXU
         5Wls5y2fksb1gzKAum1h7/HE+94WNLBJEnZPResxhN61RsxsBJNdnf5lbvlVCKuJRvoA
         e/w4R7aiygXYpq+G4WjOT7kNdBW0j9LVRgcqAA4SwO09M3gePpGX4/dB5fqzPpD44146
         KfZg==
X-Gm-Message-State: AFqh2koqHz7HmCxKgoBzlEFcBrgBFeLPqx2ymKfg/Ft078ZV63//mBfP
        cXuEW1RVrvt4/UB4CwzFguCLH986hzE=
X-Google-Smtp-Source: AMrXdXsxB9x4gANNZ59ujN40vFAWoJUO//8KJR6/6AlSN/VrhKBtAq811qT7GtzGpYD+UhsPrKu7qA==
X-Received: by 2002:a05:6000:242:b0:27f:aa94:a9fc with SMTP id m2-20020a056000024200b0027faa94a9fcmr19923545wrz.44.1672849506363;
        Wed, 04 Jan 2023 08:25:06 -0800 (PST)
Received: from localhost (a109-49-33-111.cpe.netcabo.pt. [109.49.33.111])
        by smtp.gmail.com with ESMTPSA id bj11-20020a0560001e0b00b002a6f329203esm1563364wrb.61.2023.01.04.08.25.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jan 2023 08:25:05 -0800 (PST)
From:   Rui Miguel Silva <rmfrfs@gmail.com>
To:     Yang Yingliang <yangyingliang@huawei.com>,
        linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com, hverkuil-cisco@xs4all.nl,
        mchehab@kernel.org, yangyingliang@huawei.com
Subject: Re: [PATCH] media: imx: imx7-media-csi: fix missing
 clk_disable_unprepare() in imx7_csi_init()
In-Reply-To: <20230104093921.2570431-1-yangyingliang@huawei.com>
References: <20230104093921.2570431-1-yangyingliang@huawei.com>
Date:   Wed, 04 Jan 2023 16:25:05 +0000
Message-ID: <m3bkne468u.fsf@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,HK_RANDOM_ENVFROM,
        HK_RANDOM_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hey Yingliang,

Yang Yingliang <yangyingliang@huawei.com> writes:

> Add missing clk_disable_unprepare(), if imx7_csi_dma_setup() fails
> in imx7_csi_init().
>
> Fixes: ff43ca911978 ("media: imx: imx7-media-csi: Move CSI configuration before source start")
> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>

LGTM, Many thanks.

Reviewed-by: Rui Miguel Silva <rmfrfs@gmail.com>

Cheers,
   Rui
   
> ---
>  drivers/media/platform/nxp/imx7-media-csi.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/media/platform/nxp/imx7-media-csi.c b/drivers/media/platform/nxp/imx7-media-csi.c
> index 886374d3a6ff..1ef92c8c0098 100644
> --- a/drivers/media/platform/nxp/imx7-media-csi.c
> +++ b/drivers/media/platform/nxp/imx7-media-csi.c
> @@ -638,8 +638,10 @@ static int imx7_csi_init(struct imx7_csi *csi)
>  	imx7_csi_configure(csi);
>  
>  	ret = imx7_csi_dma_setup(csi);
> -	if (ret < 0)
> +	if (ret < 0) {
> +		clk_disable_unprepare(csi->mclk);
>  		return ret;
> +	}
>  
>  	return 0;
>  }
> -- 
> 2.25.1
