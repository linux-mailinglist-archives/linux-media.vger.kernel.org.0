Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A7E5F76EB20
	for <lists+linux-media@lfdr.de>; Thu,  3 Aug 2023 15:49:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232097AbjHCNtW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Aug 2023 09:49:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37686 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235177AbjHCNtD (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 3 Aug 2023 09:49:03 -0400
Received: from mail-il1-x133.google.com (mail-il1-x133.google.com [IPv6:2607:f8b0:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3759128
        for <linux-media@vger.kernel.org>; Thu,  3 Aug 2023 06:48:43 -0700 (PDT)
Received: by mail-il1-x133.google.com with SMTP id e9e14a558f8ab-348ddac3a09so5449725ab.1
        for <linux-media@vger.kernel.org>; Thu, 03 Aug 2023 06:48:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691070523; x=1691675323;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OjPv6NeAztrmE8O+eVvEub4H1HrwyGtxAtjwiZVT5zU=;
        b=XQpkgxK7Au2lhbM1Ay4nayIMoZrNDfVymbOzHDG0sL2PQmd6PtqqMRR4l1sSU28wO8
         /hHN1pCFx3O+UBiu6QHhnbk5sgnX+ZVjLmTmR6jol1juLNkag1qBxseLcw7tvtzRzycw
         p4dIxHlS7zfnhXXgbPp8Z0Ka0DuICTqm1OnxCPSkeiZerK4QYZErzzFmZbVSG+7VAhl4
         S11HrdXQe83mpEWBAFotOH7lblNlcnJZvpbR84J5LaQE6Ie9PbXGmuZKcBSfUgObpz24
         Tdh9kamjE3CZ2zM1JtM+muqC24Jtd9DZaReGUvnjUTSLG8pO6AJj3STUFxMf/NYOaD/q
         T/Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691070523; x=1691675323;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OjPv6NeAztrmE8O+eVvEub4H1HrwyGtxAtjwiZVT5zU=;
        b=JlC8uMG5E/lNOSCl4MmtfkAtY4w4QV8T0TMYjuPmguQOGGwoY1I+ElhDtrvCowydHs
         0Vz9JF3gzrJpBk6wLy8bTblXHjKlfC8sdtwWiShPDPiUUbOoNf/EvPHZDEPy0vWX4z7u
         xFVN5MBzdROUkNX4QeBiGnKQVbOnVTHAtH3RLM0dAsPcyFUmW7mfI0JTvRzBCnsOOBOI
         SVKOx55bzcXIWTch94XPNHugkEviHLrrANBk8MLGAhNG/VnQD4clwnVtg1hLEil7x67D
         zgUQkMYqsOF5UJ7UigbmK9dRWK/+9O6PDg1kYCIxErtD+XO4Tii7Uyp/htFQU2m8l8wu
         M8pQ==
X-Gm-Message-State: ABy/qLZtcYmtOYA4SPDenvkm2ctKvc4sW+9DLqN0+wRUm4FHz09gvrvl
        37RPDiXBEk5dEVTyqn7Ah38okyb+N68knWoLGN1fl8AfmkJDDg==
X-Google-Smtp-Source: APBJJlGv5t0Epw3YK5/Ks4pStjxtjbTBFVgefSGT6nUiHELU151cQOiVix4p8++JxivjnQmuwLXouzEsmi5ceAnCsiw=
X-Received: by 2002:a05:6e02:1569:b0:346:390a:1ce6 with SMTP id
 k9-20020a056e02156900b00346390a1ce6mr17707318ilu.8.1691070522975; Thu, 03 Aug
 2023 06:48:42 -0700 (PDT)
MIME-Version: 1.0
References: <20230803021835.3740766-1-yangyingliang@huawei.com>
In-Reply-To: <20230803021835.3740766-1-yangyingliang@huawei.com>
From:   "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date:   Thu, 3 Aug 2023 14:47:40 +0100
Message-ID: <CA+V-a8tjO_Horua90Rq4HgZx880bn2RXa=K85S2tRE7+U6ukkA@mail.gmail.com>
Subject: Re: [PATCH -next] media: davinci: vpif_capture: fix error return code
 in vpif_probe()
To:     Yang Yingliang <yangyingliang@huawei.com>
Cc:     linux-media@vger.kernel.org, mchehab@kernel.org,
        sakari.ailus@linux.intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Aug 3, 2023 at 3:21=E2=80=AFAM Yang Yingliang <yangyingliang@huawei=
.com> wrote:
>
> Set error return code, when get platform data failed.
>
> Fixes: b4a4547371b9 ("media: davinci: Init async notifier after registeri=
ng V4L2 device")
> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
> ---
>  drivers/media/platform/ti/davinci/vpif_capture.c | 1 +
>  1 file changed, 1 insertion(+)
>
Reviewed-by: Lad Prabhakar <prabhakar.csengg@gmail.com>

Cheers,
Prabhakar

> diff --git a/drivers/media/platform/ti/davinci/vpif_capture.c b/drivers/m=
edia/platform/ti/davinci/vpif_capture.c
> index bf5330b6fcd5..99fae8830c41 100644
> --- a/drivers/media/platform/ti/davinci/vpif_capture.c
> +++ b/drivers/media/platform/ti/davinci/vpif_capture.c
> @@ -1644,6 +1644,7 @@ static __init int vpif_probe(struct platform_device=
 *pdev)
>         pdev->dev.platform_data =3D
>                 vpif_capture_get_pdata(pdev, &vpif_obj.v4l2_dev);
>         if (!pdev->dev.platform_data) {
> +               err =3D -EINVAL;
>                 dev_warn(&pdev->dev, "Missing platform data. Giving up.\n=
");
>                 goto vpif_unregister;
>         }
> --
> 2.25.1
>
