Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5B8E16C95BD
	for <lists+linux-media@lfdr.de>; Sun, 26 Mar 2023 16:46:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230354AbjCZOqt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 26 Mar 2023 10:46:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46926 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229640AbjCZOqr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 26 Mar 2023 10:46:47 -0400
Received: from mail-yb1-xb36.google.com (mail-yb1-xb36.google.com [IPv6:2607:f8b0:4864:20::b36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E4FE469D
        for <linux-media@vger.kernel.org>; Sun, 26 Mar 2023 07:46:47 -0700 (PDT)
Received: by mail-yb1-xb36.google.com with SMTP id j7so7477440ybg.4
        for <linux-media@vger.kernel.org>; Sun, 26 Mar 2023 07:46:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112; t=1679842006;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PySFHEEcW5zg+C6SY/zvSXGclm6go1XlSQjQsJ6wGoE=;
        b=FotWfkCivrbu/cTrlTrpJt5cgpUklrJYkV1H0dQaf5lwqzZU5jFeAKHXSCMSQ8w7F3
         EelX9HSRs4ET5qCeYroHAiVkEZMFT3jGC74D2O+ZkHYkkBYBTVr69wPr2TDNNiN1HY6Z
         ZGp0Fk3FXpz/xQWJwIsw/HzgJVmmO+KroJc80R4h79VR/ERtcTuHuVJEIZOCJcaERGbK
         agbx/9iVYRRRVkYkgz5tvE+c9FuJ2QqD2qzM3TJOnQpXJLEBvgj3xEGlzB1aidQMW9ZN
         0NHB/et8ql72xjx291svCao93N9djOi9HEXrAhSuzLcSQwhOCC0UvXBHcQ5rOH8LWbal
         M6Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679842006;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PySFHEEcW5zg+C6SY/zvSXGclm6go1XlSQjQsJ6wGoE=;
        b=Nlf7kC9kkQ7jceWq3LsixrjbG/+J/DisfbLUxvrGt2JRGsnL6fAx9yxWL29sgt2mDY
         gt7mJnqqr2Hu12IXnH7ccRfEt9vmsLWPQAkwtVE/kZIY9JkTveOu2duPjM0yJY9eEHNI
         Ro4JuZsIwxVfLd5Tj+FTgHMbci5Gk1TNwP65LskBNuq2kgR2G3JbYfJLK2PhtLI6pKU9
         wcVh21KR67zlgn6bKJVJhJjrrIWiMP599eYQCKbd4sJOwZj/EnUTc1zmOO6uiqaIsAVE
         gQCpYD3eWiLuZotiQ0K5+ocVTBICyW5aqHLa4FW0K9cB0qnQc1b1l9TLqzDQk65SuxY3
         pvZg==
X-Gm-Message-State: AAQBX9fqXDlduICEClSAkY5OrSPz+sqQYXv1iNw4bznN9f33NwYOVRH+
        vgxYKOjJTo6V0TOd/xM1VA6QwH/3FYWY+aTxf/HF5w==
X-Google-Smtp-Source: AKy350aUc1+u41HF8wrsU+fIIFZIwgouek8fNO5l/gfYONaHYyPAZW6jEXI4yQ74cIvqAQrj6LSuw5zsc1wbURaDNvw=
X-Received: by 2002:a25:db91:0:b0:b75:8ac3:d5d9 with SMTP id
 g139-20020a25db91000000b00b758ac3d5d9mr5184206ybf.3.1679842006101; Sun, 26
 Mar 2023 07:46:46 -0700 (PDT)
MIME-Version: 1.0
References: <20230326143224.572654-1-u.kleine-koenig@pengutronix.de> <20230326143224.572654-6-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20230326143224.572654-6-u.kleine-koenig@pengutronix.de>
From:   Guenter Roeck <groeck@google.com>
Date:   Sun, 26 Mar 2023 07:46:35 -0700
Message-ID: <CABXOdTfBPE=6OewWAaAY50MFAH8h64WTy2yXHnn8gUnaFCU0Ew@mail.gmail.com>
Subject: Re: [PATCH 003/117] media: cros-ec-cec: Convert to platform remove
 callback returning void
To:     =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Benson Leung <bleung@chromium.org>,
        Scott Chao <scott_chao@wistron.corp-partner.google.com>,
        Rory Liu <hellojacky0226@hotmail.com>,
        Ajye Huang <ajye_huang@compal.corp-partner.google.com>,
        Guenter Roeck <groeck@chromium.org>,
        linux-media@vger.kernel.org, chrome-platform@lists.linux.dev,
        kernel@pengutronix.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-15.7 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,ENV_AND_HDR_SPF_MATCH,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL,
        USER_IN_DEF_SPF_WL autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sun, Mar 26, 2023 at 7:32=E2=80=AFAM Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@pengutronix.de> wrote:
>
> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is (mostly) ignored
> and this typically results in resource leaks. To improve here there is a
> quest to make the remove callback return void. In the first step of this
> quest all drivers are converted to .remove_new() which already returns
> void.
>
> Trivially convert this driver from always returning zero in the remove
> callback to the void returning variant.
>
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>

Reviewed-by: Guenter Roeck <groeck@chromium.org>

> ---
>  drivers/media/cec/platform/cros-ec/cros-ec-cec.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/media/cec/platform/cros-ec/cros-ec-cec.c b/drivers/m=
edia/cec/platform/cros-ec/cros-ec-cec.c
> index 960432230bbf..3d2600af9fc1 100644
> --- a/drivers/media/cec/platform/cros-ec/cros-ec-cec.c
> +++ b/drivers/media/cec/platform/cros-ec/cros-ec-cec.c
> @@ -326,7 +326,7 @@ static int cros_ec_cec_probe(struct platform_device *=
pdev)
>         return ret;
>  }
>
> -static int cros_ec_cec_remove(struct platform_device *pdev)
> +static void cros_ec_cec_remove(struct platform_device *pdev)
>  {
>         struct cros_ec_cec *cros_ec_cec =3D platform_get_drvdata(pdev);
>         struct device *dev =3D &pdev->dev;
> @@ -346,13 +346,11 @@ static int cros_ec_cec_remove(struct platform_devic=
e *pdev)
>         cec_notifier_cec_adap_unregister(cros_ec_cec->notify,
>                                          cros_ec_cec->adap);
>         cec_unregister_adapter(cros_ec_cec->adap);
> -
> -       return 0;
>  }
>
>  static struct platform_driver cros_ec_cec_driver =3D {
>         .probe =3D cros_ec_cec_probe,
> -       .remove  =3D cros_ec_cec_remove,
> +       .remove_new =3D cros_ec_cec_remove,
>         .driver =3D {
>                 .name =3D DRV_NAME,
>                 .pm =3D &cros_ec_cec_pm_ops,
> --
> 2.39.2
>
