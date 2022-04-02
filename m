Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2B4854F0124
	for <lists+linux-media@lfdr.de>; Sat,  2 Apr 2022 13:35:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241262AbiDBLfy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 2 Apr 2022 07:35:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36356 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241396AbiDBLfx (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 2 Apr 2022 07:35:53 -0400
Received: from mail-oa1-x32.google.com (mail-oa1-x32.google.com [IPv6:2001:4860:4864:20::32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2EB2965DB
        for <linux-media@vger.kernel.org>; Sat,  2 Apr 2022 04:34:01 -0700 (PDT)
Received: by mail-oa1-x32.google.com with SMTP id 586e51a60fabf-d6ca46da48so5380113fac.12
        for <linux-media@vger.kernel.org>; Sat, 02 Apr 2022 04:34:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vanguardiasur-com-ar.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=V3U+5UMiJybq7zY98DwsaSNVhzwSmjvGiJkV3X+RFBM=;
        b=24BPX8VpvHlBMEx6hIWdtAG/9S/+iyZLlr/QAmp0Z+5yWJiGHzFhq/uIQdxSKyVYCP
         enPRmYoZkbFQcW1HpQH8zrb3IRM4d0hYNTbwxbVgEBdL6AG2jt0/HSVAt9robgILFabJ
         hPkLvUch+hB8OPL87o/mqnhm3QiZhrMUfdzGNvgyVWrVhnz/AJhfBVlruRn8eWEQNGCu
         c4w8zQ0s4CUgcN34kZe+uGnqzOnVLeqA0YDWuGn26R8g+72dBvLyMw/s+cjtb5JCtN0k
         NvTn7x2fWQ5Jv/xStKL7yXif078NOV/iO9/fHaI5S9fhUpkKVvCwnsGEVqWwzqQuIz4I
         iIPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=V3U+5UMiJybq7zY98DwsaSNVhzwSmjvGiJkV3X+RFBM=;
        b=ouof+161wiXm417pYo/wCSqt3wLzKZfWgviJp948Ggssu/0Ohw/b9L5uNcsX3A0jJr
         PT/mKqQhzbV0vXPssrwU1rBsvJUpmejWCno7SlTtl82R/7fs25HaarW/9exAaF8ep7Lw
         adabhp18zTn/X3PK6Q3FDdJKBU8NJ8GruJHqNAFXysJ5dftyNIIh9Q90B6dR61q3aLqu
         xK2Str5/UwsIeQCWjlAkYrTV41P8J+gFeyybuE+yUkEIHHVCj6HjcxYZ3g9Nwodu050T
         5Q+/qVzSB+A+yVu5Puv5+LpCtvwXrMExlbL40y56eThkz8tNs3k8ZGgf6nHrjnGyXjn1
         n5tA==
X-Gm-Message-State: AOAM530zfrHfKxXNGmbMknAlc9aRnCnqBwu1dAkguL6KKcbIg7fD9M53
        NuFesxXxcQakH7lvLzLUB/PJlQ==
X-Google-Smtp-Source: ABdhPJy3rMJldwi8Tb/ncmzg6WyZ80EFa7bQd46QO9bii8Cw9gw35Jy6JhWEPjRky3sVVbphVckt4w==
X-Received: by 2002:a05:6870:3488:b0:de:eaa5:260b with SMTP id n8-20020a056870348800b000deeaa5260bmr6754153oah.281.1648899240576;
        Sat, 02 Apr 2022 04:34:00 -0700 (PDT)
Received: from eze-laptop ([2803:9800:98c2:8470:9f4:8e2a:88e5:ec01])
        by smtp.gmail.com with ESMTPSA id p16-20020a05680811d000b002d72ec3a921sm2098566oiv.21.2022.04.02.04.33.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Apr 2022 04:34:00 -0700 (PDT)
Date:   Sat, 2 Apr 2022 08:33:54 -0300
From:   Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
To:     Nicolas Dufresne <nicolas.dufresne@collabora.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        kernel@collabora.com, Jonas Karlman <jonas@kwiboo.se>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Sebastian Fricke <sebastian.fricke@collabora.com>,
        linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 16/23] media: rkvdec: h264: Fix reference frame_num
 wrap for second field
Message-ID: <Ykg0oqJOb/ExafB3@eze-laptop>
References: <20220331193726.289559-1-nicolas.dufresne@collabora.com>
 <20220331193726.289559-17-nicolas.dufresne@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220331193726.289559-17-nicolas.dufresne@collabora.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Nicolas,

On Thu, Mar 31, 2022 at 03:37:18PM -0400, Nicolas Dufresne wrote:
> From: Jonas Karlman <jonas@kwiboo.se>
> 
> When decoding the second field in a complementary field pair the second
> field is sharing the same frame_num with the first field.
> 
> Currently the frame_num for the first field is wrapped when it matches the
> field being decoded, this cause issues to decode the second field in a
> complementary field pair.
> 
> Fix this by using inclusive comparison, less than or equal.
> 
> Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
> Reviewed-by: Ezequiel Garcia <ezequiel@collabora.com>
> Reviewed-by: Sebastian Fricke <sebastian.fricke@collabora.com>

To complete the Signed-off-by chain, can you add your Signed-off-by: at
the bottom?

Thanks,
Ezequiel

> ---
>  drivers/staging/media/rkvdec/rkvdec-h264.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/media/rkvdec/rkvdec-h264.c b/drivers/staging/media/rkvdec/rkvdec-h264.c
> index a42cf19bcc6d..730f8ebf7f58 100644
> --- a/drivers/staging/media/rkvdec/rkvdec-h264.c
> +++ b/drivers/staging/media/rkvdec/rkvdec-h264.c
> @@ -773,7 +773,7 @@ static void assemble_hw_rps(struct rkvdec_ctx *ctx,
>  			continue;
>  
>  		if (dpb[i].flags & V4L2_H264_DPB_ENTRY_FLAG_LONG_TERM ||
> -		    dpb[i].frame_num < dec_params->frame_num) {
> +		    dpb[i].frame_num <= dec_params->frame_num) {
>  			p[i] = dpb[i].frame_num;
>  			continue;
>  		}
> -- 
> 2.34.1
> 
