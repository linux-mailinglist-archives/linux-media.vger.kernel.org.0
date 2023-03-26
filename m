Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8AE066C95BB
	for <lists+linux-media@lfdr.de>; Sun, 26 Mar 2023 16:46:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230227AbjCZOqA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 26 Mar 2023 10:46:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229640AbjCZOp7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 26 Mar 2023 10:45:59 -0400
Received: from mail-yw1-x1131.google.com (mail-yw1-x1131.google.com [IPv6:2607:f8b0:4864:20::1131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F30DF4682
        for <linux-media@vger.kernel.org>; Sun, 26 Mar 2023 07:45:57 -0700 (PDT)
Received: by mail-yw1-x1131.google.com with SMTP id 00721157ae682-5445009c26bso124538877b3.8
        for <linux-media@vger.kernel.org>; Sun, 26 Mar 2023 07:45:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112; t=1679841957;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=34KWfrJk1OWOYjGE50V1KXP7G0F1OpvWfeUVk+h/cZQ=;
        b=sCpSUSSWfaPQD6yYox/cUzSKZz16BT68QLNHQzeeZbUZBprpHQHMQIGmvp46O5LMqk
         WdIR4ZS/FpyYQOI2PMi0tTvjZWX31yTbbPHZ+JJcn4s0MxxiDLV6+kniu+otGQV70oqC
         qoW53+UeTsR61zyEhhLnhA/op5qMuQuLTkX+wXczMXFxDS1/qCa4qK+Z/rtyw5bJn2or
         v4gPiax94MUQXZkJUfeZt4L/ISP3MM0+9P4qitPc4xjyhCBnoDZUT5JU/A/Nx/7Rmn+h
         VDdZNvxRQCHSLmnWlI+JFNTvU0X7IBEeqyn6nZjEx21xpCDVDlFMk7KVWoIs8oP/t5Kx
         LqaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679841957;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=34KWfrJk1OWOYjGE50V1KXP7G0F1OpvWfeUVk+h/cZQ=;
        b=WMa8NI0tZAfY3nlpPZh7YGgICMkuqtCryoQo/oNxPSpuKq9D5Fp3u5GwKA6/xx/f4V
         1Je8/iR6Tv9urJuvlZNmjaaIS5yY/yCbF0uorqvNO/L39L6b2a95zXUz5L2bWHP4CzP+
         UWlKbVl5BEEKi8SkoIyLEfjxUFKNKnIqlrh2F33QCUMl2pnybZM7AzoCSDpg9NsC1B3a
         wYvz+wuU5wvBYEV3CqEnPvm5afKNgt1Lq6fUyqesI0UYARqQDU8iIokbdQ4cYofCm8oC
         bemuovrc7Eq75XrTpTPVdiWvZMJDd7VQ6c2KcQuVMPEG7GsjAzX6cwtaeBIEIAoajOBb
         +zrQ==
X-Gm-Message-State: AAQBX9eCkNLabHgjLw3UR1nXE0mfy9TWLA4ASlqKK6oLryB74wQhAjm4
        DC3ytinToi8IhaA6o6EHDkuADZG6KN6F+PjJgJicYA==
X-Google-Smtp-Source: AKy350Y/JOwuKrNZKUyA3hhsFUn8vWbBoVETOy/PlETziuW1TPuvqv8tr6qpbmIvWMFIjBqeaLT7w7nUMYGqo+ooxkA=
X-Received: by 2002:a81:4426:0:b0:544:5aa0:e212 with SMTP id
 r38-20020a814426000000b005445aa0e212mr3611263ywa.6.1679841957067; Sun, 26 Mar
 2023 07:45:57 -0700 (PDT)
MIME-Version: 1.0
References: <20230326143224.572654-1-u.kleine-koenig@pengutronix.de> <20230326143224.572654-5-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20230326143224.572654-5-u.kleine-koenig@pengutronix.de>
From:   Guenter Roeck <groeck@google.com>
Date:   Sun, 26 Mar 2023 07:45:46 -0700
Message-ID: <CABXOdTeAJaDuXP22omaxMBo6OpF6act8L6jZgUfj+busk-mesQ@mail.gmail.com>
Subject: Re: [PATCH 002/117] media: cros-ec-cec: Don't exit early in .remove() callback
To:     =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Benson Leung <bleung@chromium.org>,
        Ajye Huang <ajye_huang@compal.corp-partner.google.com>,
        Scott Chao <scott_chao@wistron.corp-partner.google.com>,
        Rory Liu <hellojacky0226@hotmail.com>,
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
> Exiting early in remove without releasing all acquired resources yields
> leaks. Note that e.g. memory allocated with devm_zalloc() is freed after
> .remove() returns, even if the return code was negative.
>
> While blocking_notifier_chain_unregister() won't fail and so the
> change is somewhat cosmetic, platform driver's .remove callbacks are
> about to be converted to return void. To prepare that, keep the error
> message but don't return early.
>
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>

Reviewed-by: Guenter Roeck <groeck@chromium.org>

> ---
>  drivers/media/cec/platform/cros-ec/cros-ec-cec.c | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/media/cec/platform/cros-ec/cros-ec-cec.c b/drivers/m=
edia/cec/platform/cros-ec/cros-ec-cec.c
> index 6ebedc71d67d..960432230bbf 100644
> --- a/drivers/media/cec/platform/cros-ec/cros-ec-cec.c
> +++ b/drivers/media/cec/platform/cros-ec/cros-ec-cec.c
> @@ -332,14 +332,16 @@ static int cros_ec_cec_remove(struct platform_devic=
e *pdev)
>         struct device *dev =3D &pdev->dev;
>         int ret;
>
> +       /*
> +        * blocking_notifier_chain_unregister() only fails if the notifie=
r isn't
> +        * in the list. We know it was added to it by .probe(), so there =
should
> +        * be no need for error checking. Be cautious and still check.
> +        */
>         ret =3D blocking_notifier_chain_unregister(
>                         &cros_ec_cec->cros_ec->event_notifier,
>                         &cros_ec_cec->notifier);
> -
> -       if (ret) {
> +       if (ret)
>                 dev_err(dev, "failed to unregister notifier\n");
> -               return ret;
> -       }
>
>         cec_notifier_cec_adap_unregister(cros_ec_cec->notify,
>                                          cros_ec_cec->adap);
> --
> 2.39.2
>
