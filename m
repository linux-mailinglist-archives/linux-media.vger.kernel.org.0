Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 760A57845ED
	for <lists+linux-media@lfdr.de>; Tue, 22 Aug 2023 17:43:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237301AbjHVPnD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Aug 2023 11:43:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53094 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237296AbjHVPnC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Aug 2023 11:43:02 -0400
Received: from mail-vk1-xa35.google.com (mail-vk1-xa35.google.com [IPv6:2607:f8b0:4864:20::a35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 137DBE75
        for <linux-media@vger.kernel.org>; Tue, 22 Aug 2023 08:42:34 -0700 (PDT)
Received: by mail-vk1-xa35.google.com with SMTP id 71dfb90a1353d-48d165bd108so714672e0c.0
        for <linux-media@vger.kernel.org>; Tue, 22 Aug 2023 08:42:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1692718953; x=1693323753;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=LWI4x5zB1Vkygs3I4CY94P6ZrfVFVKXKGm+1LJ23y+c=;
        b=kk5oLE5qL54Tuk3Yit7Z2etRaluah/cXvrZtsnlHVu9qogAL2vJmHEhGEA+bU62PGM
         ElqaDTBlmQPc4FhOlZ3gzDsD5AZhoLhJSM/XQThYMxlKDzYVsqBSVFLMjc0ggwNiPhL2
         VmGXCShB0vGHQfHqR8+d6eXw8gbljpa2dlfw98eLw66Uj9brb/bw2UOX2mwxQTSAR2NH
         XOwp1/ZPRtxrk+WybDYahDER/JzqKQBTBtEWj6g3xC0lzWyVckXpOPAyd4YC60eJmfDo
         f2cj3X9QbuggTDV4Vo2FFYp+pwpPcFeVqmaPHQ15ZrCZhwUklBjH/yk3KlJXGFvlWgEr
         54Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692718953; x=1693323753;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LWI4x5zB1Vkygs3I4CY94P6ZrfVFVKXKGm+1LJ23y+c=;
        b=ZnF2Gtnltd3T8xw8H1Rsfjw1l3AmQ5S20Jt1kxlbFoSU/8eaiGVP6LKD2s5+2KH4K7
         cEvN/BlMPW63vj4G9lT6e/kQINTwV442FpNFaYo7kh5Tc0THuyfXp1zzhpQJQRJ0t9B6
         1fpkrQo4+j4kVH/M3LdsWwXKaQAth3hL9/zHBrQ2+WoPAdXGLFNpxTGRWihjAEcld6iR
         uRyjIDkXEmfijuE+99l0sNpu0Z1LYVOpZoBgMx+h5Tl6zE8t0QBpoBA+nx5Llpo32Clt
         vmrfBNyjFIZGTLF0Mjf/l6kJimmnvxFjTzfb2r/GbEvj2qA1NBs7puTk+ugB0xiP6KvO
         xhag==
X-Gm-Message-State: AOJu0YwgnvRnPrm8O8YWrMN9G+FyBKcVyBDsf5kULfd2oxxkL6DtqSU1
        MsiVYR3dhCMVhVTHwfTN0Avd48CF39CvacDC8WfcPg==
X-Google-Smtp-Source: AGHT+IHvsvZCpD7enJlPlk0tKT75rB8BEolQhDJo+pOQVCUG9yLlPXazXsElfko8LL8n7J6BZqtMIY6pmnDvfXk4Ltk=
X-Received: by 2002:a1f:eb83:0:b0:48d:2c51:8d45 with SMTP id
 j125-20020a1feb83000000b0048d2c518d45mr4193015vkh.14.1692718952799; Tue, 22
 Aug 2023 08:42:32 -0700 (PDT)
MIME-Version: 1.0
References: <20230821223001.28480-1-laurent.pinchart@ideasonboard.com> <20230821223001.28480-3-laurent.pinchart@ideasonboard.com>
In-Reply-To: <20230821223001.28480-3-laurent.pinchart@ideasonboard.com>
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
Date:   Tue, 22 Aug 2023 16:42:16 +0100
Message-ID: <CAPY8ntCGFmdN8k8Qp7LaB2uvWprcCT0w=hJPL9jX9x3JVLPd-w@mail.gmail.com>
Subject: Re: [PATCH v2 02/18] media: i2c: imx219: Drop unused macros
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, Sakari Ailus <sakari.ailus@iki.fi>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Hans de Goede <hdegoede@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent

Thanks for the patch.

On Mon, 21 Aug 2023 at 23:29, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Drop a handful of macros that are not used and don't provide any value.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

> ---
>  drivers/media/i2c/imx219.c | 10 ----------
>  1 file changed, 10 deletions(-)
>
> diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
> index c5aeec50b9e8..229dfe24304b 100644
> --- a/drivers/media/i2c/imx219.c
> +++ b/drivers/media/i2c/imx219.c
> @@ -72,12 +72,6 @@
>
>  #define IMX219_VBLANK_MIN              4
>
> -/*Frame Length Line*/
> -#define IMX219_FLL_MIN                 0x08a6
> -#define IMX219_FLL_MAX                 0xffff
> -#define IMX219_FLL_STEP                        1
> -#define IMX219_FLL_DEFAULT             0x0c98
> -
>  /* HBLANK control - read only */
>  #define IMX219_PPL_DEFAULT             3448
>
> @@ -105,10 +99,6 @@
>  #define IMX219_TESTP_COLOUR_MIN                0
>  #define IMX219_TESTP_COLOUR_MAX                0x03ff
>  #define IMX219_TESTP_COLOUR_STEP       1
> -#define IMX219_TESTP_RED_DEFAULT       IMX219_TESTP_COLOUR_MAX
> -#define IMX219_TESTP_GREENR_DEFAULT    0
> -#define IMX219_TESTP_BLUE_DEFAULT      0
> -#define IMX219_TESTP_GREENB_DEFAULT    0
>
>  /* External clock frequency is 24.0M */
>  #define IMX219_XCLK_FREQ               24000000
> --
> Regards,
>
> Laurent Pinchart
>
