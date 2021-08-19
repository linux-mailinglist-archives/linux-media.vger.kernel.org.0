Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4CCA43F2108
	for <lists+linux-media@lfdr.de>; Thu, 19 Aug 2021 21:47:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234371AbhHSTsM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 19 Aug 2021 15:48:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33466 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229677AbhHSTsL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 19 Aug 2021 15:48:11 -0400
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 39803C061575
        for <linux-media@vger.kernel.org>; Thu, 19 Aug 2021 12:47:35 -0700 (PDT)
Received: by mail-pj1-x1035.google.com with SMTP id oc2-20020a17090b1c0200b00179e56772d6so2230678pjb.4
        for <linux-media@vger.kernel.org>; Thu, 19 Aug 2021 12:47:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gateworks-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=9wRf0H/Mk6zv9ZQCyH3D4CBk23+bCNnpHeIGIR1SkCI=;
        b=Xass+cgZzwEue9FnwpigGHkVPgLPym+DTR1np+EYOl1KeMbDbFQYFE8xO4S5N8MrJk
         /lBOLEdB+nYlPNlByaVDOFszexWxy2BRHtxKSQAKf0YTKrvfS5J9qdctJ6o6zcEXdFFx
         ERGlktBMF+bZM4fjg0OaRJQrWzVKEUxSBx7SG7Kx3eZdCMJH5kr5zpzbRdsxkeDjHUbb
         jxdpwGAZ2zQ4fs/o3Ph/zwlWeJqJQw42RZq0t/opMNL4qaFwfw4mtSZilSiNKxnRvFNK
         myvewWzEWKbjCDhbItlBBcKAEH2wWfv0atJqao2nIKrEvk98Yz6njWRNKQB60V/u2gO0
         91QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=9wRf0H/Mk6zv9ZQCyH3D4CBk23+bCNnpHeIGIR1SkCI=;
        b=GSODj7tAGSbanRLicQ5wg+1NrQa3d4dWLt/on7+9fwHiQ89450Zat0FKF1FnKBj9+W
         FuvHfu9ZODwvgyQFhwlv3pr+zpIzkml5Dq/S7W4tiq86Aq2kC31+wMUugS+kwR1xlT79
         WcG5RP+WiYIQg4ATQX0G8oetUXtsg6fW1+f1uc7ymqWZUNEZr51LmdDOnqAQZ1cq1Tiv
         t9ByY83rvjQTOom9Q+cV6xbi93nrdUjUHEr7Xk6HMmlPeOS3Mr2SJYcMV/cLsenzaKaH
         05oRhET0Xqa0PsXmdoUiWqL5CG6QzbKm4gKQ0c8AtMyvoEtMZgZh43lbqUELh2CYXltf
         Cd+Q==
X-Gm-Message-State: AOAM530q0rHmnc5OdLxl2rv7iwCgHVdviL8JzfCZwwesfp+OEZ9Y//Zf
        taC4MlnuYWFmu5WEfXUaT7S4gAYHSuF5LLrbjpk2BQ==
X-Google-Smtp-Source: ABdhPJwKkxDnTVDZn3E4miLSvxtclJ3/SHt5vFSk9Ae9hfgDKQxPTmG6cuZsD9ESsHIo5Op/x15uezQ8+Z86jgDPfsc=
X-Received: by 2002:a17:90a:598e:: with SMTP id l14mr444259pji.28.1629402454651;
 Thu, 19 Aug 2021 12:47:34 -0700 (PDT)
MIME-Version: 1.0
References: <m3wnpdbb9h.fsf@t19.piap.pl>
In-Reply-To: <m3wnpdbb9h.fsf@t19.piap.pl>
From:   Tim Harvey <tharvey@gateworks.com>
Date:   Thu, 19 Aug 2021 12:47:23 -0700
Message-ID: <CAJ+vNU2r0SgJODHpqDmKzaQkRVXn+SJugoZ45aG0+U-Tbpm5Sw@mail.gmail.com>
Subject: Re: [PATCH] TDA1997x: report -ENOLINK after disconnecting HDMI source
To:     =?UTF-8?Q?Krzysztof_Ha=C5=82asa?= <khalasa@piap.pl>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media <linux-media@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Jul 26, 2021 at 3:49 AM Krzysztof Ha=C5=82asa <khalasa@piap.pl> wro=
te:
>
> The TD1997x chip retains vper, hper and hsper register values when the
> HDMI source is disconnected. Use a different means of checking if the
> link is still valid.
>
> Signed-off-by: Krzysztof Ha=C5=82asa <khalasa@piap.pl>
>
> diff --git a/drivers/media/i2c/tda1997x.c b/drivers/media/i2c/tda1997x.c
> index 0b516a45a135..36a7b89afb08 100644
> --- a/drivers/media/i2c/tda1997x.c
> +++ b/drivers/media/i2c/tda1997x.c
> @@ -1107,7 +1107,8 @@ tda1997x_detect_std(struct tda1997x_state *state,
>         hper =3D io_read16(sd, REG_H_PER) & MASK_HPER;
>         hsper =3D io_read16(sd, REG_HS_WIDTH) & MASK_HSWIDTH;
>         v4l2_dbg(1, debug, sd, "Signal Timings: %u/%u/%u\n", vper, hper, =
hsper);
> -       if (!vper || !hper || !hsper)
> +
> +       if (!state->input_detect[0] && !state->input_detect[1])
>                 return -ENOLINK;
>
>         for (i =3D 0; v4l2_dv_timings_presets[i].bt.width; i++) {

Acked-By: Tim Harvey <tharvey@gateworks.com>

Best regards,

Tim
