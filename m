Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A3249551464
	for <lists+linux-media@lfdr.de>; Mon, 20 Jun 2022 11:33:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240764AbiFTJ3C (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 20 Jun 2022 05:29:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38104 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240864AbiFTJ2s (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 20 Jun 2022 05:28:48 -0400
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com [IPv6:2607:f8b0:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4C1D11C26
        for <linux-media@vger.kernel.org>; Mon, 20 Jun 2022 02:28:46 -0700 (PDT)
Received: by mail-ot1-x329.google.com with SMTP id h15-20020a9d600f000000b0060c02d737ecso7949714otj.1
        for <linux-media@vger.kernel.org>; Mon, 20 Jun 2022 02:28:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+E3s3QkzcGFpv21zvwpnb65PL/N10eRE8HHqyGPUlDc=;
        b=DJ+WMLVyMwk8maVS9kj+U87ierbJivmOILpqH3I4hGvoc2Z9YfIw2VmzeT+Uuheqxv
         nPvWVaQSB3YN4TTTiQWhxCQuuYcir5Ex60T9T7HKonhAYy41SC93O31KDnNVe31cciL4
         AAxR6NsWDL6VfIlvS1pVm9ii3WUK3k4wRcVRjtokGdyVty9/xnQip4De6UptgBNIBp07
         3VvCIrKKP5X4gV5gW2SwoXawpX5TzEBTLQtmtbIZhaekKODLM/mMoMessleLAVEg1V33
         rHbkx+ZruDcbZGT06xaIMQuIMrszKhbGykUyEIUhEgEQaTjHd4ckIY4GJpuDdYeA3Mw2
         6oeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+E3s3QkzcGFpv21zvwpnb65PL/N10eRE8HHqyGPUlDc=;
        b=YjhxYM9HUM2Nj9vtkavhfFSX9m0ne4s4fKIC1Dd1ovSYiRM7KU9I0PZrjce1LMZ/Hd
         cspcT+46Rue4AgA/3EzDyJYlPzchB8BfN8B1OSR+ohssaacPm20xBU96ZO1GS+tQ8wh3
         70E5XK+tOO9Bl8vjSxWn+si3+PH50GeNhVBKgiZrQY/PdPvzPrW1B06hdWG2CK4w/nCz
         WMUJ6lcq1g8VpwlisdtU+eOTQ390wodtpbQylbTXj4wRbGEqdnvjPj4hRDNHTHn0CsDM
         CK4LGX2xSpsNLMox73rsZ2GS4ZaO6aw7onD310s9DGzt62iG4v0i/cn25I4vWNkbGPzw
         /bQQ==
X-Gm-Message-State: AJIora/rusbGKmrBwOJNbNobDYMU50MBCgWW5oCxeT6Mw9+ebPzQTchD
        wbdiUgYCGmoY6RnxpOaFlCpUNIVKsKGFTJcBlgtkuQ==
X-Google-Smtp-Source: AGRyM1u7wtq73sNYXuB85ckFWHp/sUaPQojdzAh+InCrMmV7DdteUrkzZjnIv3HX4ij2uk7XcCZ6MyDeHlvDKFC0AzA=
X-Received: by 2002:a05:6830:2b23:b0:60e:3067:e496 with SMTP id
 l35-20020a0568302b2300b0060e3067e496mr8585268otv.16.1655717325999; Mon, 20
 Jun 2022 02:28:45 -0700 (PDT)
MIME-Version: 1.0
References: <20220126014725.1511-1-jammy_huang@aspeedtech.com> <20220126014725.1511-3-jammy_huang@aspeedtech.com>
In-Reply-To: <20220126014725.1511-3-jammy_huang@aspeedtech.com>
From:   Lei Yu <yulei.sh@bytedance.com>
Date:   Mon, 20 Jun 2022 17:28:34 +0800
Message-ID: <CAGm54UHobZ7f9q7vB5F8fJDeyr_PSbRxJPg45etscxxSvRtFVA@mail.gmail.com>
Subject: Re: [PATCH v5 2/2] media: aspeed: Fix unstable timing detection
To:     Jammy Huang <jammy_huang@aspeedtech.com>
Cc:     Eddie James <eajames@linux.ibm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@aj.id.au>, linux-media@vger.kernel.org,
        openbmc <openbmc@lists.ozlabs.org>,
        "moderated list:ARM/ASPEED MACHINE SUPPORT" 
        <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/ASPEED MACHINE SUPPORT" 
        <linux-aspeed@lists.ozlabs.org>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

We hit an issue where the resolution is not detected correctly.
The issue could be fixed by this patch.

Tested-by: Lei YU <yulei.sh@bytedance.com>

On Wed, Jan 26, 2022 at 9:49 AM Jammy Huang <jammy_huang@aspeedtech.com> wrote:
>
> Using stable-signal in resolution detection, and try detection again
> if unstable.
>
> VE_MODE_DETECT_EXTSRC_ADC: 1 if video source is from ADC output.
> VE_MODE_DETECT_H_STABLE: 1 if horizontal signal detection is stable.
> VE_MODE_DETECT_V_STABLE: 1 if vertical signal detection is stable.
>
> Signed-off-by: Jammy Huang <jammy_huang@aspeedtech.com>
> ---
>  drivers/media/platform/aspeed-video.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>
> diff --git a/drivers/media/platform/aspeed-video.c b/drivers/media/platform/aspeed-video.c
> index 5d1ec3de50ad..eb9c17ac0e14 100644
> --- a/drivers/media/platform/aspeed-video.c
> +++ b/drivers/media/platform/aspeed-video.c
> @@ -153,9 +153,14 @@
>
>  #define VE_MODE_DETECT_STATUS          0x098
>  #define  VE_MODE_DETECT_H_PERIOD       GENMASK(11, 0)
> +#define  VE_MODE_DETECT_EXTSRC_ADC     BIT(12)
> +#define  VE_MODE_DETECT_H_STABLE       BIT(13)
> +#define  VE_MODE_DETECT_V_STABLE       BIT(14)
>  #define  VE_MODE_DETECT_V_LINES                GENMASK(27, 16)
>  #define  VE_MODE_DETECT_STATUS_VSYNC   BIT(28)
>  #define  VE_MODE_DETECT_STATUS_HSYNC   BIT(29)
> +#define  VE_MODE_DETECT_VSYNC_RDY      BIT(30)
> +#define  VE_MODE_DETECT_HSYNC_RDY      BIT(31)
>
>  #define VE_SYNC_STATUS                 0x09c
>  #define  VE_SYNC_STATUS_HSYNC          GENMASK(11, 0)
> @@ -909,6 +914,7 @@ static void aspeed_video_get_resolution(struct aspeed_video *video)
>         bool invalid_resolution = true;
>         int rc;
>         int tries = 0;
> +       u32 mds;
>         u32 src_lr_edge;
>         u32 src_tb_edge;
>         struct v4l2_bt_timings *det = &video->detected_timings;
> @@ -939,6 +945,13 @@ static void aspeed_video_get_resolution(struct aspeed_video *video)
>                         return;
>                 }
>
> +               mds = aspeed_video_read(video, VE_MODE_DETECT_STATUS);
> +               // try detection again if current signal isn't stable
> +               if (!(mds & VE_MODE_DETECT_H_STABLE) ||
> +                   !(mds & VE_MODE_DETECT_V_STABLE) ||
> +                   (mds & VE_MODE_DETECT_EXTSRC_ADC))
> +                       continue;
> +
>                 aspeed_video_check_and_set_polarity(video);
>
>                 aspeed_video_enable_mode_detect(video);
> --
> 2.25.1
>


-- 
BRs,
Lei YU
