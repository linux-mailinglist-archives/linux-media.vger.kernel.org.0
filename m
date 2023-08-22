Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 240DA784699
	for <lists+linux-media@lfdr.de>; Tue, 22 Aug 2023 18:11:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237505AbjHVQLU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Aug 2023 12:11:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48948 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229592AbjHVQLT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Aug 2023 12:11:19 -0400
Received: from mail-ua1-x92c.google.com (mail-ua1-x92c.google.com [IPv6:2607:f8b0:4864:20::92c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22CF4CDA
        for <linux-media@vger.kernel.org>; Tue, 22 Aug 2023 09:11:18 -0700 (PDT)
Received: by mail-ua1-x92c.google.com with SMTP id a1e0cc1a2514c-79df12ff0f0so1548583241.3
        for <linux-media@vger.kernel.org>; Tue, 22 Aug 2023 09:11:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1692720677; x=1693325477;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=APJz9z5nm/eNpTRFBeIaO1xJ4ELH6WZ5wsjXonDCopw=;
        b=dYYBDQ1d240tp/Ux3LMO0tw16nCmF1Q1tQm8a7WIL6kJOYA+riXwoHyqdV3Ga8SV22
         Lx3i0lUkqMPl0JJOLkUHQIMF5FNiDgGClxUb9+vHCxuGCfRjwISUg/tx79kHTMjtZpkN
         uaAWnTtG97uZ1RiXyPYhsb9iuPyXMooa6K0weVFPrVADWKUmZNoADsc4CJv51UPAEn5i
         7i+cOeyI/nPDXDNEYW+6XxTzCNUDTmHqjxMWO9kDKqG3t8bJ6ziNxIXPsJYNq7Hv8PBr
         fFNILodEEiy4V34/cSKGaX/P5krmOqyUbfVYG+AKo0Zle9pVoRO/WA1YIHlx7VWiDtx4
         sT/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692720677; x=1693325477;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=APJz9z5nm/eNpTRFBeIaO1xJ4ELH6WZ5wsjXonDCopw=;
        b=Fyw3bD8D6vkLbzDNoZWtOPWD8JAyZXUnlA1aflg4f5IHWTbU3PXEEDScPRbZCLi73k
         7mADI/0EPdcMR+P4cIYQHnJRDoX6KDSzITzRvG2sEXkHGljdZ8zDaJOowzFovPyGEesg
         lCykqbeR4TFQW5SWS0SPTnhHMgc2hsQesKTeMUr16FNOB3jjo4TJPv9wRrpIkWcrWN98
         RfScpF7Sec0aYX60vSPyqkZV2I56xfybZe6S0Wnyl3SYjyTy5SKyCkRNfmfEQM+D/hlz
         wvOzyRusdMFVEr05MkdN6111FAjowcoL7jIc4lsQ48p1+U5CUQw885+zXfeh8l63sfOs
         nPpg==
X-Gm-Message-State: AOJu0YzR+ZzehFji7mW+OShMh3jYbpCHL+JBWub7k9sUXc+Lahww24Pl
        Vc/LeQmdwt5lgYZNPm/INZy74Eod83PlQ6oE+tvDAA==
X-Google-Smtp-Source: AGHT+IG0o7H4Qpl7utg8QCJ0DfZxpahgLNMfCNAU6/ToFsxof8F41viGC5EpFiIGImyDjLbPWq7Bi0RVfkFM0XvjDkE=
X-Received: by 2002:a1f:e743:0:b0:48d:3434:fe1a with SMTP id
 e64-20020a1fe743000000b0048d3434fe1amr5737960vkh.3.1692720677232; Tue, 22 Aug
 2023 09:11:17 -0700 (PDT)
MIME-Version: 1.0
References: <20230821223001.28480-1-laurent.pinchart@ideasonboard.com> <20230821223001.28480-5-laurent.pinchart@ideasonboard.com>
In-Reply-To: <20230821223001.28480-5-laurent.pinchart@ideasonboard.com>
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
Date:   Tue, 22 Aug 2023 17:11:01 +0100
Message-ID: <CAPY8ntDpzbVsJwU8jxRiAT1tc8JviNTJzFTCJboxX9mdBdi4Ww@mail.gmail.com>
Subject: Re: [PATCH v2 04/18] media: i2c: imx219: Fix test pattern window for
 640x480 mode
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, Sakari Ailus <sakari.ailus@iki.fi>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Hans de Goede <hdegoede@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, 21 Aug 2023 at 23:30, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> The 640x480 mode specifies incorrect values for the TP_WINDOW_WIDTH and
> TP_WINDOW_HEIGHT registers, which likely got copied from the 1640x1232
> mode. They should be identical to the X_OUTPUT_SIZE and Y_OUTPUT_SIZE
> registers as for all the other modes, to avoid cropping the test
> pattern. Fix them.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

> ---
>  drivers/media/i2c/imx219.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
> index 8cab0251bd6a..08011192daa6 100644
> --- a/drivers/media/i2c/imx219.c
> +++ b/drivers/media/i2c/imx219.c
> @@ -264,8 +264,8 @@ static const struct cci_reg_sequence mode_640_480_regs[] = {
>         { IMX219_REG_Y_ADD_END_A, 1711 },
>         { IMX219_REG_X_OUTPUT_SIZE, 640 },
>         { IMX219_REG_Y_OUTPUT_SIZE, 480 },
> -       { IMX219_REG_TP_WINDOW_WIDTH, 1640 },
> -       { IMX219_REG_TP_WINDOW_HEIGHT, 1232 },
> +       { IMX219_REG_TP_WINDOW_WIDTH, 640 },
> +       { IMX219_REG_TP_WINDOW_HEIGHT, 480 },
>  };
>
>  static const struct cci_reg_sequence raw8_framefmt_regs[] = {
> --
> Regards,
>
> Laurent Pinchart
>
