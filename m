Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 455AB131DE2
	for <lists+linux-media@lfdr.de>; Tue,  7 Jan 2020 04:15:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727416AbgAGDPj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Jan 2020 22:15:39 -0500
Received: from mail-qk1-f194.google.com ([209.85.222.194]:37552 "EHLO
        mail-qk1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727295AbgAGDPj (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Jan 2020 22:15:39 -0500
Received: by mail-qk1-f194.google.com with SMTP id 21so41515253qky.4;
        Mon, 06 Jan 2020 19:15:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=AtlpYaLLMTE+8NWj8eY7Oj/Fx28nhIerkc8u9tEkgfs=;
        b=EaEf9e/uQygjuM+AEzZUvq8zZj4XTSn8eBSZxJ2kdECMeMr2xsLtNwLrM8H1zWadMR
         vhcxHHa1FQugOhTE6EOcR3Cagp5qN1zXyVY6TQM1TMoE0yAIds5qKhHWXdZQjwxNYwAa
         8LNL3Mgs3mEIDhXSZcI/JY3GiTiP1rFayNVIc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AtlpYaLLMTE+8NWj8eY7Oj/Fx28nhIerkc8u9tEkgfs=;
        b=H+8fI2704f1cxekGdDIdwOUFhd2q5jZpnO60lC1vbf60k15aVEzpTHh6JVGAhgwkSt
         yb2qguctP28E1SEe7Uw/i9HWZAHNly7oDXD4pNFan/PfTCuLIlD+xuFbiejrmOc/keSy
         K0iOB1TnWUOxrOxJVQPpoVvCqL9/9ooKiKkJq/MURCYB9i4O4eZbhPl6g9r7Qr6yL1zm
         nAWSmA4GRIo7suc82saW0z4zyYNDFgVBqBo5eqZRYUqmu2rWNyCoKE1zHtk8buGaY23M
         q6y2E9mXzTiSyj/+FOnQWWFVoGpda+2gr3GlLiPztSHyIn0YyWzLxUSBj/UXgpmjWKQ1
         FHsQ==
X-Gm-Message-State: APjAAAX/HxPKSo1C1+Ov4jegtIJJuihqZNznTpB7QTd+zEN5T3DO/c6v
        2Mcfo5aLq5PgoJg5XF9MFV61QzaKJxCIaIn1eA0=
X-Google-Smtp-Source: APXvYqzHsbqA4VEOnhaS6z/+XeB6SwzNXtgr4zi0SMOslB8kLr9/KAIzZeRbEKo3csmaVlW7PqquRa2yw1FsJCWhzuU=
X-Received: by 2002:ae9:e702:: with SMTP id m2mr85124606qka.208.1578366938200;
 Mon, 06 Jan 2020 19:15:38 -0800 (PST)
MIME-Version: 1.0
References: <20200107011503.17435-1-jae.hyun.yoo@linux.intel.com> <20200107011503.17435-4-jae.hyun.yoo@linux.intel.com>
In-Reply-To: <20200107011503.17435-4-jae.hyun.yoo@linux.intel.com>
From:   Joel Stanley <joel@jms.id.au>
Date:   Tue, 7 Jan 2020 03:15:26 +0000
Message-ID: <CACPK8XejA6emrboLzfwEpmn=dn1JcyHKJVud_cBXVNRiZixgTA@mail.gmail.com>
Subject: Re: [PATCH 3/3] media: aspeed: add AST2600 support
To:     Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Cc:     Eddie James <eajames@linux.ibm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Andrew Jeffery <andrew@aj.id.au>,
        linux-aspeed <linux-aspeed@lists.ozlabs.org>,
        linux-media@vger.kernel.org,
        devicetree <devicetree@vger.kernel.org>,
        OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, 7 Jan 2020 at 01:14, Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com> wrote:
>
> Video engine in AST2600 has the exactly same register set with
> AST2500 except VR084 register which provides more precise JPEG
> size read back. This commit adds support for the difference and
> adds 'aspeed,ast2600-video-engine' compatible OF string.
>
> Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
> ---
>  drivers/media/platform/aspeed-video.c | 15 +++++++++++----
>  1 file changed, 11 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/media/platform/aspeed-video.c b/drivers/media/platform/aspeed-video.c
> index d8593cb2ae84..0dbe72672338 100644
> --- a/drivers/media/platform/aspeed-video.c
> +++ b/drivers/media/platform/aspeed-video.c
> @@ -72,10 +72,10 @@
>  #define  VE_SEQ_CTRL_CAP_BUSY          BIT(16)
>  #define  VE_SEQ_CTRL_COMP_BUSY         BIT(18)
>
> -#ifdef CONFIG_MACH_ASPEED_G5
> -#define  VE_SEQ_CTRL_JPEG_MODE         BIT(13) /* AST2500 */
> -#else
> +#ifdef CONFIG_MACH_ASPEED_G4
>  #define  VE_SEQ_CTRL_JPEG_MODE         BIT(8)  /* AST2400 */
> +#else
> +#define  VE_SEQ_CTRL_JPEG_MODE         BIT(13) /* AST2500/2600 */
>  #endif /* CONFIG_MACH_ASPEED_G5 */

Yeah, nah. This should have never been done this way. I will send some
patches to fix it up, and you can add ast2600 support on top of them,
if that works for you.

Cheers,

Joel

>
>  #define VE_CTRL                                0x008
> @@ -135,6 +135,12 @@
>
>  #define VE_OFFSET_COMP_STREAM          0x078
>
> +#ifdef CONFIG_MACH_ASPEED_G6
> +#define VE_JPEG_COMP_SIZE_READ_BACK    0x084   /* AST2600 */
> +#else
> +#define VE_JPEG_COMP_SIZE_READ_BACK    VE_OFFSET_COMP_STREAM
> +#endif
> +
>  #define VE_SRC_LR_EDGE_DET             0x090
>  #define  VE_SRC_LR_EDGE_DET_LEFT       GENMASK(11, 0)
>  #define  VE_SRC_LR_EDGE_DET_NO_V       BIT(12)
> @@ -572,7 +578,7 @@ static irqreturn_t aspeed_video_irq(int irq, void *arg)
>         if (sts & VE_INTERRUPT_COMP_COMPLETE) {
>                 struct aspeed_video_buffer *buf;
>                 u32 frame_size = aspeed_video_read(video,
> -                                                  VE_OFFSET_COMP_STREAM);
> +                                                  VE_JPEG_COMP_SIZE_READ_BACK);
>
>                 spin_lock(&video->lock);
>                 clear_bit(VIDEO_FRAME_INPRG, &video->flags);
> @@ -1719,6 +1725,7 @@ static int aspeed_video_remove(struct platform_device *pdev)
>  static const struct of_device_id aspeed_video_of_match[] = {
>         { .compatible = "aspeed,ast2400-video-engine" },
>         { .compatible = "aspeed,ast2500-video-engine" },
> +       { .compatible = "aspeed,ast2600-video-engine" },
>         {}
>  };
>  MODULE_DEVICE_TABLE(of, aspeed_video_of_match);
> --
> 2.17.1
>
