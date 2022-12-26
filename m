Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 45BA265607A
	for <lists+linux-media@lfdr.de>; Mon, 26 Dec 2022 07:41:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231557AbiLZGlS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 26 Dec 2022 01:41:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46030 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229458AbiLZGlP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 26 Dec 2022 01:41:15 -0500
Received: from mail-ua1-x932.google.com (mail-ua1-x932.google.com [IPv6:2607:f8b0:4864:20::932])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF0D4DCA
        for <linux-media@vger.kernel.org>; Sun, 25 Dec 2022 22:41:14 -0800 (PST)
Received: by mail-ua1-x932.google.com with SMTP id f25so2208688uaa.3
        for <linux-media@vger.kernel.org>; Sun, 25 Dec 2022 22:41:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=pIFJvpkO7mmQ+cyz+DICxCYAUcnhXk54K2D6tr7hNmA=;
        b=BYmghKmwaLqWgV1R5z53x4FUhMOzvIgRO9ihAgSXUmHX4vbdh5vTQOTkDCYMeEW/BJ
         9uXmqxp7uPywqNtiAFPIAI3Q7cFo4sYuumlx7IqSQV9U4Kgn8n3ppLZVzusgwlHoxsT0
         uRNyYw6PVm2Nl9gh+ZtQcQtAWpOaEhe3Rtg28=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pIFJvpkO7mmQ+cyz+DICxCYAUcnhXk54K2D6tr7hNmA=;
        b=M3//uy+0gvfbZ7/9OlhmF+uf8v+bvWmJ95V2BI2pzRYyeNDNY544HZihTwkqLDMkXs
         dughahueXLtwHZAK3qI9TuEVeE3TZExu6TOrRMWwMP4GqZTfeI4qaPVYUNC6g/qnHuC8
         kCKtcNHpfoyvN3Ocacx+yJaf44B4rz4JHHnPwOe/t2xiECdw+W1vGm1wD+/nYPoUvsIK
         QdYdZcdYPa49WJbeivLN0vQaFTy3dRvMTvPBERDqQDkvb9vW5uvE6nslGoFgbjOnmeGk
         KOLvbmhzBQrfp8bz4T+MsgvL/0BC3W1qKpJgooh/5l6c12FaoHmA4IPbEJqorYZXECa5
         bYXQ==
X-Gm-Message-State: AFqh2krrUaVbx0klLj++GaHH1LHBjg0S8TB7ssWlkcua/K376vnlOwjB
        Wm/G7heoUTpO0/pjQgfdZHLyvDngtReOrfcEkWJiIQ==
X-Google-Smtp-Source: AMrXdXtocbgpBPb70sNQS0nN5Qje72F2peRA9iLUAtVoyaKwtwgnm3WCoQ4AVmRPpjMRkUISpECBKKr1mzk1nSgdIqw=
X-Received: by 2002:ab0:7411:0:b0:418:b849:8187 with SMTP id
 r17-20020ab07411000000b00418b8498187mr1580687uap.43.1672036796827; Sun, 25
 Dec 2022 22:39:56 -0800 (PST)
MIME-Version: 1.0
References: <20221226061711.3988-1-chuanjian@nfschina.com>
In-Reply-To: <20221226061711.3988-1-chuanjian@nfschina.com>
From:   Chen-Yu Tsai <wenst@chromium.org>
Date:   Mon, 26 Dec 2022 14:39:45 +0800
Message-ID: <CAGXv+5HT4CD5eRYCuAdwrdAPRbNcd9SPEdDCnPfLpAAQbooBYQ@mail.gmail.com>
Subject: Re: [PATCH] drivers/media/v4l2-core/v4l2-h264.c : add detection of
 null pointers
To:     Dong Chuanjian <chuanjian@nfschina.com>
Cc:     mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        nicolas.dufresne@collabora.com, sebastian.fricke@collabora.com,
        ezequiel@vanguardiasur.com.ar, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Dec 26, 2022 at 2:17 PM Dong Chuanjian <chuanjian@nfschina.com> wrote:
>
> Continue the program when the pointer assignment is successful.
>
> Signed-off-by: Dong Chuanjian <chuanjian@nfschina.com>
>
> diff --git a/drivers/media/v4l2-core/v4l2-h264.c b/drivers/media/v4l2-core/v4l2-h264.c
> index 72bd64f65198..1163cd48ff33 100644
> --- a/drivers/media/v4l2-core/v4l2-h264.c
> +++ b/drivers/media/v4l2-core/v4l2-h264.c
> @@ -343,18 +343,19 @@ static const char *format_ref_list_b(const struct v4l2_h264_reflist_builder *bui
>         int n = 0, i;
>
>         *out_str = kmalloc(tmp_str_size, GFP_KERNEL);
> -
> -       n += snprintf(*out_str + n, tmp_str_size - n, "|");
> -
> -       for (i = 0; i < builder->num_valid; i++) {
> -               int frame_num = builder->refs[reflist[i].index].frame_num;
> -               u32 poc = v4l2_h264_get_poc(builder, reflist + i);
> -               bool longterm = builder->refs[reflist[i].index].longterm;
> -
> -               n += scnprintf(*out_str + n, tmp_str_size - n, "%i%c%c|",
> -                              longterm ? frame_num : poc,
> -                              longterm ? 'l' : 's',
> -                              ref_type_to_char(reflist[i].fields));
> +       if (*out_str != NULL) {

I would suggest returning early if it's NULL. The change would be cleaner
as you wouldn't need to reindent the whole code block.

ChenYu

> +               n += snprintf(*out_str + n, tmp_str_size - n, "|");
> +
> +               for (i = 0; i < builder->num_valid; i++) {
> +                       int frame_num = builder->refs[reflist[i].index].frame_num;
> +                       u32 poc = v4l2_h264_get_poc(builder, reflist + i);
> +                       bool longterm = builder->refs[reflist[i].index].longterm;
> +
> +                       n += scnprintf(*out_str + n, tmp_str_size - n, "%i%c%c|",
> +                                      longterm ? frame_num : poc,
> +                                      longterm ? 'l' : 's',
> +                                      ref_type_to_char(reflist[i].fields));
> +               }
>         }
>
>         return *out_str;
> --
> 2.18.2
>
