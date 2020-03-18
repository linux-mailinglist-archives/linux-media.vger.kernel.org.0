Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 80B6B18A22D
	for <lists+linux-media@lfdr.de>; Wed, 18 Mar 2020 19:15:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726984AbgCRSPZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 18 Mar 2020 14:15:25 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:33722 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726733AbgCRSPZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 18 Mar 2020 14:15:25 -0400
Received: by mail-ot1-f68.google.com with SMTP id x26so9531941otk.0;
        Wed, 18 Mar 2020 11:15:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=zH2xSEw0UeDcOPH0g6JF6ZJUmfMT78Ha+NBEa9P16fM=;
        b=rvB9nJ8fzHcVKJ0ZUvacVPpQTBcJgb/0TR9IPt+22dNHMMt5ikAjszYXMXuFTfW+/v
         +Mre8BOWCtkZLGP3IaAh7xc6ocFjm3Tk5fhMEcYTe4r1oYQbArPHkeoYQuPLndZorWne
         QC6jhn1H2rS58z9WWfHDYcllJVIhIK5On4mfimEpaPMnHzJaAhKI+8sUsUqane1vgil0
         ysKBrUitfjCTBZzq8IUxH8MJC3iw41EuCCuWvR3bmKQN51MvCEZ4M253HIQLnWzfcIUA
         8RbVRtBe2m2NzMheIr0aohjCfmtRcq+oly/J8bnRBwMsf+CsYCoovuNDh3bZYCyZKAdy
         Rsqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=zH2xSEw0UeDcOPH0g6JF6ZJUmfMT78Ha+NBEa9P16fM=;
        b=oiPK+7uLF5VHJI7Lz1LYR5wKuhahQ4KToEbC78HOh0RjwZ3mvszB7XCBn9AIt7mSCK
         XqK1X3Nt010MwczhF9Ggj7tLMldGH1RAvpvLijNDqWBIf3OIDCtHLKMyDAW7h09OwVLJ
         nkYFbXgf6ItkfPD21bkEOOWzBIJr/KqXSGNTxpVky0zdGWKS3jAbS59dqBc286gBs56v
         4Znrwl3/y5QUZMb6dQDsdCi7U5AK+6VpwtXzXPP8DPHRrNPtwrli0L8c4PRWUXoRV7FA
         wpa6hO//JNmIoURkanS/ErLKz0xuRlXA15R0/fVGhmCUiY2HQqp4aqJhQS77XTWR+3Gs
         hJ/w==
X-Gm-Message-State: ANhLgQ0lJ7LZKQvI/bxYnASKzviLNXVoJhUmhMm4QAyDh8CYqZsHlwz6
        9CGHyXBrmtD+VqJQuq/TSoJHpWnSKssc5YsS8vI=
X-Google-Smtp-Source: ADFU+vtz9XxeMdAeAaXdIJGIpPNzmsHKXpChYjW9nVgxD3Zd2FNMSPRl3YeUpBVMj0QuCyhZJgJjLH5/0t3p3ncxjyw=
X-Received: by 2002:a9d:6ac6:: with SMTP id m6mr5197146otq.198.1584555323797;
 Wed, 18 Mar 2020 11:15:23 -0700 (PDT)
MIME-Version: 1.0
References: <20200318170638.18562-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20200318170638.18562-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20200318170638.18562-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date:   Wed, 18 Mar 2020 18:14:57 +0000
Message-ID: <CA+V-a8u_zovBDO91OXCLkdngKcbpGs3x9tS0xbtGK98OeWpZYw@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] media: rcar-vin: Add support for
 MEDIA_BUS_FMT_SRGGB8_1X8 format
To:     Niklas <niklas.soderlund@ragnatech.se>
Cc:     linux-media <linux-media@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        =?UTF-8?Q?Niklas_S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Mar 18, 2020 at 5:06 PM Lad Prabhakar
<prabhakar.csengg@gmail.com> wrote:
>
> This patch adds support for MEDIA_BUS_FMT_SRGGB8_1X8 format for CSI2
> input.
>
Argh! missed to update the subject line to rcar-csi2

Cheers,
--Prabhakar

> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.se=
>
> ---
>  drivers/media/platform/rcar-vin/rcar-csi2.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/media/platform/rcar-vin/rcar-csi2.c b/drivers/media/=
platform/rcar-vin/rcar-csi2.c
> index faa9fb23a2e9..3d1945d7996c 100644
> --- a/drivers/media/platform/rcar-vin/rcar-csi2.c
> +++ b/drivers/media/platform/rcar-vin/rcar-csi2.c
> @@ -320,6 +320,7 @@ static const struct rcar_csi2_format rcar_csi2_format=
s[] =3D {
>         { .code =3D MEDIA_BUS_FMT_YUYV8_1X16,     .datatype =3D 0x1e, .bp=
p =3D 16 },
>         { .code =3D MEDIA_BUS_FMT_UYVY8_2X8,      .datatype =3D 0x1e, .bp=
p =3D 16 },
>         { .code =3D MEDIA_BUS_FMT_YUYV10_2X10,    .datatype =3D 0x1e, .bp=
p =3D 20 },
> +       { .code =3D MEDIA_BUS_FMT_SRGGB8_1X8,     .datatype =3D 0x2a, .bp=
p =3D 8 },
>  };
>
>  static const struct rcar_csi2_format *rcsi2_code_to_fmt(unsigned int cod=
e)
> --
> 2.20.1
>
