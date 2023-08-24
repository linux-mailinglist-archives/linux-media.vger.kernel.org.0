Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9B01F786CF3
	for <lists+linux-media@lfdr.de>; Thu, 24 Aug 2023 12:40:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239979AbjHXKkY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 24 Aug 2023 06:40:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240834AbjHXKkE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 24 Aug 2023 06:40:04 -0400
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com [IPv6:2607:f8b0:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1A0119B6
        for <linux-media@vger.kernel.org>; Thu, 24 Aug 2023 03:40:00 -0700 (PDT)
Received: by mail-pg1-x531.google.com with SMTP id 41be03b00d2f7-54290603887so3921166a12.1
        for <linux-media@vger.kernel.org>; Thu, 24 Aug 2023 03:40:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692873600; x=1693478400;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FL6saOWnrHGU7ccUrEeEK4gz+z0u/G0uK6Gzeoe2wpo=;
        b=ZJ1tN69ADo4Asysbh24J6TFccfZLmEBC6o6vjhq+fb0xpSCXKubkQCuvafdPCF68K5
         HRjlkT+hDoj3zxorpcm4UVapagx2b2khb/dIlVxCAugGkeleng9epWNIL5ncMzcjZ1fa
         sj+CMaw+9m5v9dXGOx654JFIC8d3c0Nr6b3Z8qxWCBefvV1ZTB0n38XEOFZ1lmeWgXnZ
         ytEnpTm+KGk1aLcHYtouz01Zsc+fAm0iEl9yfa9KdXfBrm3gJNx+LFpQqPZVHsJJ3vfl
         nieNYyBQZYzNzqulRf3CKmr4JmNro96ea6KKKoUq2YXJP84UloPI24UYHpZ6xH2yd6X/
         r38g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692873600; x=1693478400;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FL6saOWnrHGU7ccUrEeEK4gz+z0u/G0uK6Gzeoe2wpo=;
        b=FC4XRF1T2dftQJTcERZ0EjE8ORo3yqGsdKZdVmkrvmGJhe2BzYWCZ5EYgkRcZYLkr+
         IA3JY99vu3ibFCkYg4jYQfnNk1V02r/CKK+/ku1F3fisJIe5CE96d3eTOYkuvR2mUgIO
         K/e2XSM9qzl7VhPh90bMqAJvvU56JYEG/eOFib51voYTbQN0mM9WTQ4tFu8MlwduF4au
         IN5BEwOWrYPj26DP0qRyhdNUexQkeVrnErgg/TQmesDcFEFZRNog9wuZnLb8OVsQwZmz
         fj6mRc6ad9Fma8O+hdwoACcH54NK+SvFyBvk0I7PHfXL2UScgKj8D1211YLAzQqn1yxp
         RdnA==
X-Gm-Message-State: AOJu0YzWGAT3Z1p102i0jMgP956/BMUGMljcVQbQPgPghfqjOlzsZIZu
        7wSdSMBs4fdd9g5hH45TwBkTzP/2JKe5StNUZHg=
X-Google-Smtp-Source: AGHT+IH79HbkmaIDqA8Y9uT8gm+LZ4g6D/0I4575q8jokqxj+FsVJv8m5gS/Pf4vebGqthYLskmb5BHfVWtIkz5DXWE=
X-Received: by 2002:a17:90b:124f:b0:26c:f6d2:2694 with SMTP id
 gx15-20020a17090b124f00b0026cf6d22694mr11650180pjb.12.1692873599976; Thu, 24
 Aug 2023 03:39:59 -0700 (PDT)
MIME-Version: 1.0
References: <20230824013858.303105-1-marex@denx.de>
In-Reply-To: <20230824013858.303105-1-marex@denx.de>
From:   Adam Ford <aford173@gmail.com>
Date:   Thu, 24 Aug 2023 05:39:48 -0500
Message-ID: <CAHCN7xLDmMv7T_fT7vY3iq+KMWuPM9tBP_2AJ-X04L7ZTRWPOw@mail.gmail.com>
Subject: Re: [PATCH] media: hantro: Check whether reset op is defined before use
To:     Marek Vasut <marex@denx.de>
Cc:     linux-media@vger.kernel.org,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>,
        Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-rockchip@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Aug 23, 2023 at 8:39=E2=80=AFPM Marek Vasut <marex@denx.de> wrote:
>
> The i.MX8MM/N/P does not define the .reset op since reset of the VPU is
> done by genpd. Check whether the .reset op is defined before calling it
> to avoid NULL pointer dereference.
>
> Note that the Fixes tag is set to the commit which removed the reset op
> from i.MX8M Hantro G2 implementation, this is because before this commit
> all the implementations did define the .reset op.

I am surprised I didn't have issues when I was testing the 8MQ and
8MM, but this makes sense.
>
> Fixes: 6971efb70ac3 ("media: hantro: Allow i.MX8MQ G1 and G2 to run indep=
endently")
> Signed-off-by: Marek Vasut <marex@denx.de>

Reviewed-by: Adam Ford <aford173@gmail.com>
> ---
> Cc: Adam Ford <aford173@gmail.com>
> Cc: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> Cc: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> Cc: Philipp Zabel <p.zabel@pengutronix.de>
> Cc: linux-media@vger.kernel.org
> Cc: linux-rockchip@lists.infradead.org
> ---
>  drivers/media/platform/verisilicon/hantro_drv.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/media/platform/verisilicon/hantro_drv.c b/drivers/me=
dia/platform/verisilicon/hantro_drv.c
> index 423fc85d79ee3..50ec24c753e9e 100644
> --- a/drivers/media/platform/verisilicon/hantro_drv.c
> +++ b/drivers/media/platform/verisilicon/hantro_drv.c
> @@ -125,7 +125,8 @@ void hantro_watchdog(struct work_struct *work)
>         ctx =3D v4l2_m2m_get_curr_priv(vpu->m2m_dev);
>         if (ctx) {
>                 vpu_err("frame processing timed out!\n");
> -               ctx->codec_ops->reset(ctx);
> +               if (ctx->codec_ops->reset)
> +                       ctx->codec_ops->reset(ctx);
>                 hantro_job_finish(vpu, ctx, VB2_BUF_STATE_ERROR);
>         }
>  }
> --
> 2.40.1
>
