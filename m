Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0438B7A19F3
	for <lists+linux-media@lfdr.de>; Fri, 15 Sep 2023 11:07:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232435AbjIOJHy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 15 Sep 2023 05:07:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35742 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232003AbjIOJHx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 15 Sep 2023 05:07:53 -0400
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com [IPv6:2607:f8b0:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BAF2349F3
        for <linux-media@vger.kernel.org>; Fri, 15 Sep 2023 02:05:22 -0700 (PDT)
Received: by mail-ot1-x32f.google.com with SMTP id 46e09a7af769-6c09f50ae00so154439a34.0
        for <linux-media@vger.kernel.org>; Fri, 15 Sep 2023 02:05:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vanguardiasur-com-ar.20230601.gappssmtp.com; s=20230601; t=1694768712; x=1695373512; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Hh5TOPI/HhnIdtullXY4j7ld3pDUYM1OrpNZGBcpK+c=;
        b=1CbbeA4r0p1ECqCdgkXV0gc/OvtXDULXDgGFqqFQL/sczdwTNIinaSK7egiYeeqi6U
         GM0mFfdcyz5merxa5GCL/NfTWPgfhz99I2oOW4F7rtFwRCANko5M5zkz9r1bSCOnewIq
         HA5lbYUBXgCzVxzrDXgpgUzx6cKrf4nvXd65dexizt4/JdFv3aGSxsyzpvtgDQ1R2p5f
         Tr9snj8r1kaaklSUAX8pA2BCGxMjShVE1kQI3B04YELVHbMKTe6Hv415XqV2IOXl0yyx
         /DjI+IHZruaPygXFmL+PXzNeygSA1LizL1fi3GH3bpzMr9RZUuvDlHTUSBZBIeWlgA+3
         1kUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694768712; x=1695373512;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Hh5TOPI/HhnIdtullXY4j7ld3pDUYM1OrpNZGBcpK+c=;
        b=tSb779hSUWGtJ4eGDwpIpTJ5V5M3j9ESevBWJr/IQY7iS+SCUJ1S7jsfl28Ace37qC
         JYPJWjvqZhM3hHirQvg8utfm8kNF67NQ8cWZGUehNaFu6HTfLjKPjxBnsJUSlytDKsNX
         CwUVDB1POL2GRoCarszvBmp18YhR5N5vy/vKfSFCT7bI8DMtU85CJfUwGAT06N6Omzq7
         j4pv4hv01wDprfjK5MDZI3NuId58cKjQR/hGACI3zhkXfSUlTFllUKQHx5UN4kc1lI6N
         3uE8xcz23U6blOO2Ai4EcFkuJxKHhftD/dU45vTqz9eiTPrFShOIXHVvVaBP7unG4Xx/
         yD1g==
X-Gm-Message-State: AOJu0YyASVtaZ/3ik7smVeA0VudSoeRmwXcnNf1GQPmMrisYAVPltRkq
        RN4VUYq6/6Qt52jB141UYd4qjYP7PL+xpSJ9l2H7qA==
X-Google-Smtp-Source: AGHT+IE8u8fe94YCsJqYiGK6ZwicLPocu6NLl7huZjprcs8JWoLZrKk+EcweaUeqR5UJgGCMm6KIc2d1lfmqacBh0SA=
X-Received: by 2002:a05:6820:2081:b0:573:3a3b:594b with SMTP id
 bz1-20020a056820208100b005733a3b594bmr1377984oob.1.1694768711683; Fri, 15 Sep
 2023 02:05:11 -0700 (PDT)
MIME-Version: 1.0
References: <20230915065043.3401840-1-make_ruc2021@163.com>
In-Reply-To: <20230915065043.3401840-1-make_ruc2021@163.com>
From:   Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date:   Fri, 15 Sep 2023 11:05:00 +0200
Message-ID: <CAAEAJfANY07RE4Dw1LwDuCpv_qj_RQoLyXpLsC6r=rnfiN3QHw@mail.gmail.com>
Subject: Re: [PATCH] media: verisilicon: fix use after free bug in
 hantro_remove due to race condition
To:     Ma Ke <make_ruc2021@163.com>
Cc:     p.zabel@pengutronix.de, mchehab@kernel.org,
        linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Ma,

This was already discussed:

https://patchwork.kernel.org/project/linux-media/patch/20230313154132.36841=
81-1-zyytlz.wz@163.com/

Thanks,
Ezequiel

On Fri, Sep 15, 2023 at 8:51=E2=80=AFAM Ma Ke <make_ruc2021@163.com> wrote:
>
> In hantro_probe, vpu->watchdog_work is bound with hantro_watchdog functio=
n. In
> hantro_end_prepare_run, it will started by schedule_delayed_work. If ther=
e is an
> unfinished work in hantro_remove, there may be a race condition and trigg=
er UAF
> bug.
>
> Signed-off-by: Ma Ke <make_ruc2021@163.com>
> ---
>  drivers/media/platform/verisilicon/hantro_drv.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/media/platform/verisilicon/hantro_drv.c b/drivers/me=
dia/platform/verisilicon/hantro_drv.c
> index 423fc85d79ee..1a5b3a85c520 100644
> --- a/drivers/media/platform/verisilicon/hantro_drv.c
> +++ b/drivers/media/platform/verisilicon/hantro_drv.c
> @@ -1187,6 +1187,7 @@ static void hantro_remove(struct platform_device *p=
dev)
>
>         v4l2_info(&vpu->v4l2_dev, "Removing %s\n", pdev->name);
>
> +       cancel_delayed_work_sync(&vpu->watchdog_work);
>         media_device_unregister(&vpu->mdev);
>         hantro_remove_dec_func(vpu);
>         hantro_remove_enc_func(vpu);
> --
> 2.37.2
>
