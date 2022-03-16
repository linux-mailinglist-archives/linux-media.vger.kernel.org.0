Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 08DBA4DAC35
	for <lists+linux-media@lfdr.de>; Wed, 16 Mar 2022 09:04:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347637AbiCPIGA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 16 Mar 2022 04:06:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34772 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245632AbiCPIF7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 16 Mar 2022 04:05:59 -0400
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 802035E775
        for <linux-media@vger.kernel.org>; Wed, 16 Mar 2022 01:04:45 -0700 (PDT)
Received: by mail-ej1-x62c.google.com with SMTP id a8so2413344ejc.8
        for <linux-media@vger.kernel.org>; Wed, 16 Mar 2022 01:04:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=r+BKzQ5VcnkpXh3L9rfiU1fCPQ3+SKfhOrD6+TlJ+20=;
        b=Lh0RdbmqOYk+/5AzuCC/gQco8sqH0r4b19ByZI7ZEhBT4cqr6Xx8ziYIKgrV+eHYXa
         L48gvqzR5VGc6yxtdXVLiOHcwKD9LfXfs7MJyYwmJMZuMmFYV82GjwW98hdCJwFUlDWL
         VD8Q5hy9EP7P/eW2Kwx/aQgBWlfeYWGx7+Cqw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=r+BKzQ5VcnkpXh3L9rfiU1fCPQ3+SKfhOrD6+TlJ+20=;
        b=iK/9TLFftrDMPjGslGXNg8XNpy94zb6y+Ogi5X/NX2d1evHuzwV2P+MMRl1xpRjBLr
         vYQSiINTX1Qao7zkQo1XbF+f4ZPGz3HFCWDpNTa19AK+VLQq7/sUdFnpKk2y3qk9z87u
         MCX6tt88rCywroIjBvzpaa6+GAwLuDZIGALUvNRkj0YaupJPMpml/mhdMtGhWIzGUArU
         O/3O3J0+4QxNCnQQgQE2tdvrE6nLTQ8vmZcmAtoiF15oeZ3Ec/vHBbanmwM716TTd/1A
         VW+9lj0LsF6Za14Htgk1BcV7k+TPcJcvHtIXwR2rANuEght27/2uP/lNGUyrfs8M1MSC
         BpOA==
X-Gm-Message-State: AOAM532bE5w0b0sn+thPJnYG8/QroXJkPElXF499PTfs5s+65a9GpIhw
        FEYdfL56CsHJMei5qlR/8a3sIzye1RyKHQ==
X-Google-Smtp-Source: ABdhPJz80YBJQ3KqLpzQC0B8Nz1qO/A1f3NZsQ9gs29ZHsDwMU1V1yH1ttezxZZ/297lgiKgrqueFA==
X-Received: by 2002:a17:907:3f8d:b0:6d5:bb03:c4c6 with SMTP id hr13-20020a1709073f8d00b006d5bb03c4c6mr26220060ejc.680.1647417884008;
        Wed, 16 Mar 2022 01:04:44 -0700 (PDT)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com. [209.85.208.49])
        by smtp.gmail.com with ESMTPSA id sh42-20020a1709076eaa00b006df78692a9csm546992ejc.94.2022.03.16.01.04.42
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Mar 2022 01:04:43 -0700 (PDT)
Received: by mail-ed1-f49.google.com with SMTP id b15so1704592edn.4
        for <linux-media@vger.kernel.org>; Wed, 16 Mar 2022 01:04:42 -0700 (PDT)
X-Received: by 2002:a05:6402:278f:b0:416:a887:9853 with SMTP id
 b15-20020a056402278f00b00416a8879853mr28633767ede.44.1647417882462; Wed, 16
 Mar 2022 01:04:42 -0700 (PDT)
MIME-Version: 1.0
References: <20220315222146.1051303-1-j.neuschaefer@gmx.net>
In-Reply-To: <20220315222146.1051303-1-j.neuschaefer@gmx.net>
From:   Ricardo Ribalda <ribalda@chromium.org>
Date:   Wed, 16 Mar 2022 09:04:30 +0100
X-Gmail-Original-Message-ID: <CANiDSCumFwO3WX76BtS0gS3=CdDSJEFQ56yX7LqLOpJzGa9a9w@mail.gmail.com>
Message-ID: <CANiDSCumFwO3WX76BtS0gS3=CdDSJEFQ56yX7LqLOpJzGa9a9w@mail.gmail.com>
Subject: Re: [PATCH] media: uvcvideo: Send users to linux-media mailing list
 instead of linux-uvc-devel
To:     =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-3.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, 16 Mar 2022 at 03:47, Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.n=
et> wrote:
>
> The linux-uvc-devel mailing list has been deprecated in documentation
> and MAINTAINERS. Update this message printed by the driver, as well.
>
> Signed-off-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>
Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  drivers/media/usb/uvc/uvc_driver.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/u=
vc_driver.c
> index 5f394d4efc21c..6c6a82af07cee 100644
> --- a/drivers/media/usb/uvc/uvc_driver.c
> +++ b/drivers/media/usb/uvc/uvc_driver.c
> @@ -2443,7 +2443,7 @@ static int uvc_probe(struct usb_interface *intf,
>                          "Forcing device quirks to 0x%x by module paramet=
er for testing purpose.\n",
>                          dev->quirks);
>                 dev_info(&dev->udev->dev,
> -                        "Please report required quirks to the linux-uvc-=
devel mailing list.\n");
> +                        "Please report required quirks to the linux-medi=
a mailing list.\n");
>         }
>
>         if (dev->info->uvc_version) {
> --
> 2.35.1
>


--=20
Ricardo Ribalda
