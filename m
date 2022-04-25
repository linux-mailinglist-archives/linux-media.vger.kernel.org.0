Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 290F950DF5E
	for <lists+linux-media@lfdr.de>; Mon, 25 Apr 2022 13:50:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232664AbiDYLxc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 25 Apr 2022 07:53:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46284 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233251AbiDYLxW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 25 Apr 2022 07:53:22 -0400
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA0777666
        for <linux-media@vger.kernel.org>; Mon, 25 Apr 2022 04:50:16 -0700 (PDT)
Received: by mail-ej1-x632.google.com with SMTP id kq17so5941405ejb.4
        for <linux-media@vger.kernel.org>; Mon, 25 Apr 2022 04:50:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=j8svVughDOBZ2P/XjS6mK4PtOs0lB8r9YN3eWypl6aM=;
        b=lA9lstVnDtxLAlJcYCNGVAbIGwlziHLahMIi9xl0o9+llGUjMl1GZQ1B3Dwl2/uNIk
         BtbM8AMdlMhe1qBPW/46NrvIM3mGdCU3As0nsJP4eb4QKeXvzQuyFgJ9ctZZJgR3iSS1
         tB3haFobvxFjdn4Aq2RKaBKshPlYmg+HCaSaI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=j8svVughDOBZ2P/XjS6mK4PtOs0lB8r9YN3eWypl6aM=;
        b=aTNMBYHl73XTV2kkU2QtjjgwRWP7HHXfvmr+7DiIh8FB7EwqTFvFzlbEURcuY22itO
         PmBkR3B7LhyOvuO8RmKGSH3xWxhNB1qtCFM0+Nz+aocXoPcprrZtsiIYQ5jeKd7dUsFX
         BY4h3B1GZQXk0k5LtO7PEduc0JQ2MkPRxhirZ77aY9LxdzugpPu87fycu7iYUjRp7wW6
         svQd84A8lqHDTNSKvlPlSQQbtTPEpoR+j2UTZFdXmpnvDse8rXMEAlzx72HTTiL7SoYN
         6CKViyPRo5vh4jhClTQBEojYHEzf+KFlK2svou0zwtRSWSiDeo+EguGWz2FUeVFk6I80
         2G6Q==
X-Gm-Message-State: AOAM531q9ycHMSQhouBtuhUwv3HBs6tcbynsz5g74EQggteIYtU7pJ7p
        cn/8qA8/X8wVgOXrhVkomLQdJA==
X-Google-Smtp-Source: ABdhPJxLLgmy040UtHw1/VP91Ezr2FKxY1a+d/nSD3B0WbAK+qyjikLqJmuKsR/SOellcC0BVo/5Lg==
X-Received: by 2002:a17:907:2d1e:b0:6f3:6717:5f38 with SMTP id gs30-20020a1709072d1e00b006f367175f38mr12462910ejc.732.1650887414779;
        Mon, 25 Apr 2022 04:50:14 -0700 (PDT)
Received: from gmail.com ([100.104.168.197])
        by smtp.gmail.com with ESMTPSA id u26-20020a17090626da00b006e7cb663277sm3545470ejc.90.2022.04.25.04.50.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Apr 2022 04:50:14 -0700 (PDT)
Date:   Mon, 25 Apr 2022 13:49:57 +0200
From:   Ricardo Ribalda <ribalda@chromium.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, Dafna Hirschfeld <dafna@fastmail.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Paul Elder <paul.elder@ideasonboard.com>,
        Tomasz Figa <tfiga@google.com>,
        linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v4 18/21] media: rkisp1: debug: Compute max register
 length name dynamically
Message-ID: <YmaK5XHQbKkfH6uR@gmail.com>
References: <20220421234240.1694-1-laurent.pinchart@ideasonboard.com>
 <20220421234240.1694-19-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220421234240.1694-19-laurent.pinchart@ideasonboard.com>
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Laurent Pinchart wrote:

> Don't hardcode the register name maximum length (used for alignment
> purposes) to 14, but compute it dynamically. The small performance
> impact isn't an issue as this is debugging code.

Not sure if we want this. Different files will have different alignment,
which will look ugly if we cat them.

Besides that, the code looks correct.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  .../platform/rockchip/rkisp1/rkisp1-debug.c   | 21 +++++++++++++------
>  1 file changed, 15 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-debug.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-debug.c
> index 2c226f20f525..28a69323cb38 100644
> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-debug.c
> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-debug.c
> @@ -11,8 +11,10 @@
>  #include <linux/debugfs.h>
>  #include <linux/delay.h>
>  #include <linux/device.h>
> +#include <linux/minmax.h>
>  #include <linux/pm_runtime.h>
>  #include <linux/seq_file.h>
> +#include <linux/string.h>
>  
>  #include "rkisp1-common.h"
>  #include "rkisp1-regs.h"
> @@ -32,22 +34,29 @@ static int rkisp1_debug_dump_regs(struct rkisp1_device *rkisp1,
>  				  struct seq_file *m, unsigned int offset,
>  				  const struct rkisp1_debug_register *regs)
>  {
> +	const struct rkisp1_debug_register *reg;
> +	int width = 0;
>  	u32 val, shd;
>  	int ret;
>  
> +	for (reg = regs; reg->name; ++reg)
> +		width = max_t(int, width, strlen(reg->name));
> +
> +	width += 1;
> +
>  	ret = pm_runtime_get_if_in_use(rkisp1->dev);
>  	if (ret <= 0)
>  		return ret ? : -ENODATA;
>  
> -	for ( ; regs->name; ++regs) {
> -		val = rkisp1_read(rkisp1, offset + regs->reg);
> +	for (reg = regs; reg->name; ++reg) {
> +		val = rkisp1_read(rkisp1, offset + reg->reg);
>  
> -		if (regs->shd) {
> -			shd = rkisp1_read(rkisp1, offset + regs->shd);
> -			seq_printf(m, "%14s: 0x%08x/0x%08x\n", regs->name,
> +		if (reg->shd) {
> +			shd = rkisp1_read(rkisp1, offset + reg->shd);
> +			seq_printf(m, "%*s: 0x%08x/0x%08x\n", width, reg->name,
>  				   val, shd);
>  		} else {
> -			seq_printf(m, "%14s: 0x%08x\n", regs->name, val);
> +			seq_printf(m, "%*s: 0x%08x\n", width, reg->name, val);
>  		}
>  	}
>  
> -- 
> Regards,
> 
> Laurent Pinchart
> 
> 
