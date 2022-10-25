Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 28BDB60C6CB
	for <lists+linux-media@lfdr.de>; Tue, 25 Oct 2022 10:46:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230187AbiJYIp6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 25 Oct 2022 04:45:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46734 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229678AbiJYIpz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 25 Oct 2022 04:45:55 -0400
Received: from mail-io1-xd2f.google.com (mail-io1-xd2f.google.com [IPv6:2607:f8b0:4864:20::d2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7A4FD03B6
        for <linux-media@vger.kernel.org>; Tue, 25 Oct 2022 01:45:53 -0700 (PDT)
Received: by mail-io1-xd2f.google.com with SMTP id r142so9709999iod.11
        for <linux-media@vger.kernel.org>; Tue, 25 Oct 2022 01:45:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=r7Y5khI94/D2ljSZhlC1O6a2PmmY16yoIwTovHKDb3o=;
        b=a1vITaQWC9wX5kZL0LSKI6aBsiRjCc4Sv++aaVxhu7tmXDZWlAkT4hTB/LO2SU8kei
         OpaIiKyH8rO75wdLEY76es+7cGVc6FI9hNpKUIISNQkOwERw7tYB8wCyKB0EzPYw+9ko
         ASdRb7Pp8VU6GGx4cDhDRamITFOdGk8+vIPjI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r7Y5khI94/D2ljSZhlC1O6a2PmmY16yoIwTovHKDb3o=;
        b=JtTe6GwpusArPq5haHV65B6sNzYvFCIv0btNejy6gj5i0Sw2zhr/gT8Nerlmk5wLKA
         TVc74sl/Ahn8R+fAdAB1gbhVVBnv/OG5DExUOdjPpGV7UkqiFWV/9Jongs6/Bvyv1uW7
         6WK296ooNZjbeN6kBeGWQqrCicpvXBWL8uhTeTweWx2OSxRyM73zlRpS36k+ZBCIL1Ld
         M2DQrtF5Y9Z8nf5b+BA+k67x7GK/z8IGR5emir6B4hD8i3VdB08Qk0atArFFKuDcnIqX
         gtnwkhbyFYfb6o+zprWT/koLRRNJCJxP+DP//IxEfLqlCMwE9NMJ+SLecG3oSTqFKMqi
         Eyfg==
X-Gm-Message-State: ACrzQf3e4TMWbBZkLDs2AfKLwWinwUMEAr92TY/iKZ+/yAji3QP5uVKk
        qzW+WdTmVjHmANpo3uDMFCOzCEdMkZWhQexf
X-Google-Smtp-Source: AMsMyM6DqtNHNCfINXpS8Va2OhRr+DC52pENDALHEr4ZB6aUlB3/Be6JP3ZeREVma+C9fXASO4Fc+A==
X-Received: by 2002:a02:a08d:0:b0:374:ad42:31ec with SMTP id g13-20020a02a08d000000b00374ad4231ecmr4229677jah.8.1666687552927;
        Tue, 25 Oct 2022 01:45:52 -0700 (PDT)
Received: from mail-io1-f47.google.com (mail-io1-f47.google.com. [209.85.166.47])
        by smtp.gmail.com with ESMTPSA id j17-20020a056e02125100b002f139ba4135sm799710ilq.86.2022.10.25.01.45.51
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Oct 2022 01:45:52 -0700 (PDT)
Received: by mail-io1-f47.google.com with SMTP id e15so9759997iof.2
        for <linux-media@vger.kernel.org>; Tue, 25 Oct 2022 01:45:51 -0700 (PDT)
X-Received: by 2002:a02:cc51:0:b0:36d:df36:fcb1 with SMTP id
 i17-20020a02cc51000000b0036ddf36fcb1mr8743541jaq.51.1666687551449; Tue, 25
 Oct 2022 01:45:51 -0700 (PDT)
MIME-Version: 1.0
References: <20221025050450.1743072-1-pedro.guilherme@espectro.eng.br> <20221025050450.1743072-2-pedro.guilherme@espectro.eng.br>
In-Reply-To: <20221025050450.1743072-2-pedro.guilherme@espectro.eng.br>
From:   Ricardo Ribalda <ribalda@chromium.org>
Date:   Tue, 25 Oct 2022 10:45:40 +0200
X-Gmail-Original-Message-ID: <CANiDSCs1pQEq73=vuNR9gymLMZFDkS3acDXRPNT=hc=eEvLzSA@mail.gmail.com>
Message-ID: <CANiDSCs1pQEq73=vuNR9gymLMZFDkS3acDXRPNT=hc=eEvLzSA@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] media: uvc_driver: fix assignment inside if condition
To:     Pedro Guilherme Siqueira Moreira <pedro.guilherme@espectro.eng.br>
Cc:     laurent.pinchart@ideasonboard.com, mchehab@kernel.org,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, 25 Oct 2022 at 07:08, Pedro Guilherme Siqueira Moreira
<pedro.guilherme@espectro.eng.br> wrote:
>
> Fixes 'do not use assignment in if condition' errors issued by
> scripts/checkpatch.pl on drivers/media/usb/uvc/uvc_driver.c
>
> Signed-off-by: Pedro Guilherme Siqueira Moreira <pedro.guilherme@espectro.eng.br>
Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  drivers/media/usb/uvc/uvc_driver.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> index b591ad823c66..7b6c97ad3a41 100644
> --- a/drivers/media/usb/uvc/uvc_driver.c
> +++ b/drivers/media/usb/uvc/uvc_driver.c
> @@ -1174,7 +1174,8 @@ static int uvc_parse_control(struct uvc_device *dev)
>                     buffer[1] != USB_DT_CS_INTERFACE)
>                         goto next_descriptor;
>
> -               if ((ret = uvc_parse_standard_control(dev, buffer, buflen)) < 0)
> +               ret = uvc_parse_standard_control(dev, buffer, buflen);
> +               if (ret < 0)
>                         return ret;
>
>  next_descriptor:
> @@ -2213,7 +2214,8 @@ static int uvc_probe(struct usb_interface *intf,
>         usb_set_intfdata(intf, dev);
>
>         /* Initialize the interrupt URB. */
> -       if ((ret = uvc_status_init(dev)) < 0) {
> +       ret = uvc_status_init(dev);
> +       if (ret < 0) {
>                 dev_info(&dev->udev->dev,
>                          "Unable to initialize the status endpoint (%d), status interrupt will not be supported.\n",
>                          ret);
> --
> 2.38.1
>


-- 
Ricardo Ribalda
