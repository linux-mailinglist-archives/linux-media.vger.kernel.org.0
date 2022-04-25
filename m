Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0D23950DB38
	for <lists+linux-media@lfdr.de>; Mon, 25 Apr 2022 10:31:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235232AbiDYIeH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 25 Apr 2022 04:34:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49648 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231496AbiDYId5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 25 Apr 2022 04:33:57 -0400
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7FA7D1D309
        for <linux-media@vger.kernel.org>; Mon, 25 Apr 2022 01:30:52 -0700 (PDT)
Received: by mail-ej1-x62a.google.com with SMTP id bv19so28145274ejb.6
        for <linux-media@vger.kernel.org>; Mon, 25 Apr 2022 01:30:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=gnEdxr9X8NJjJNHgkQBJ5Veaftqebxp4EvxRefbL6GM=;
        b=X+Yg3/qKc5x6pHewyS523tJIwP98titiTvYPWJxIa+eCetW9DessPSWPBESUDBRbDY
         1SJ+BKbQjcm+JyCNH+QfQ5GVD52KK6L5FOXikG626ut8mWopj0wN4w4tn4WTXV8k+QAM
         Qe3K2J3jMB6wKuJPvX66DNSWoR+HXNL5BlFGU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=gnEdxr9X8NJjJNHgkQBJ5Veaftqebxp4EvxRefbL6GM=;
        b=UlrmRWag2F/jrk8sNHDB7JENkY9kApQn8phOj6+aOM9N+K1jtVrzwx8ULtDAdhaoS/
         VCl7rQ8FZZDMg0oeRMUzFeCaaifHzpvJcpkiDgLdCexJq8bZHOKBRy83dE5bqY/ZaCDA
         cRKZYMyCGDuLmmRYb59G2mkwnGxo/X7izjrF0CSzg2wQUBYX3lxclbBScNZEOPyq70jL
         MmVNSwEzXavUanoyaEkgrH6yF5dapXSOtVQyQ/c0c4iAppSI4tXi6exB7bDQsUFza3Bz
         UVetul7KyWAvoWAHb5s3tL11eAcKMdseKimU8eDTszRw5htEQ/OzCqpJO9zBfTLAItxT
         38bA==
X-Gm-Message-State: AOAM532RRFBPjKo1XD2muagofkC5CkqsclQw3GorooHYjlrVgj9Lvskc
        lxz04JYiHHLP13haVTKdWZy8nA==
X-Google-Smtp-Source: ABdhPJxyYu+Z3n2rkMqDJY6jjyOmctct8egEfLGvmptcyIAdeUw3oQopaI1mgY+e2RfD4Wqg6GxFOg==
X-Received: by 2002:a17:906:824a:b0:6f3:a07b:2568 with SMTP id f10-20020a170906824a00b006f3a07b2568mr1070812ejx.84.1650875450972;
        Mon, 25 Apr 2022 01:30:50 -0700 (PDT)
Received: from gmail.com ([100.104.168.197])
        by smtp.gmail.com with ESMTPSA id jl7-20020a17090775c700b006f38e51ec81sm1230637ejc.129.2022.04.25.01.30.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Apr 2022 01:30:50 -0700 (PDT)
Date:   Mon, 25 Apr 2022 10:30:33 +0200
From:   Ricardo Ribalda <ribalda@chromium.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, Dafna Hirschfeld <dafna@fastmail.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Paul Elder <paul.elder@ideasonboard.com>,
        Tomasz Figa <tfiga@google.com>,
        linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v4 21/21] media: rkisp1: Drop parentheses and fix
 indentation in rkisp1_probe()
Message-ID: <YmZcKTa1oqRT1bMU@gmail.com>
References: <20220421234240.1694-1-laurent.pinchart@ideasonboard.com>
 <20220421234240.1694-22-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220421234240.1694-22-laurent.pinchart@ideasonboard.com>
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Laurent Pinchart wrote:

> Fix a small indentation issue to increase code readability, and drop
> unneeded parentheses.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
> index c7ad1986e67b..97d569968285 100644
> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
> @@ -486,9 +486,9 @@ static int rkisp1_probe(struct platform_device *pdev)
>  		return PTR_ERR(rkisp1->base_addr);
>  
>  	for (i = 0; i < match_data->isr_size; i++) {
> -		irq = (match_data->isrs[i].name) ?
> -				platform_get_irq_byname(pdev, match_data->isrs[i].name) :
> -				platform_get_irq(pdev, i);
> +		irq = match_data->isrs[i].name
Shouldn't the question mark be in the previous line?, not complaining,
just asking :)
> +		    ? platform_get_irq_byname(pdev, match_data->isrs[i].name)
> +		    : platform_get_irq(pdev, i);
>  		if (irq < 0)
>  			return irq;
>  
> -- 
> Regards,
> 
> Laurent Pinchart
> 
> 
