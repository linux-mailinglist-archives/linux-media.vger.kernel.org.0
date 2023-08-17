Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7B3F07800FD
	for <lists+linux-media@lfdr.de>; Fri, 18 Aug 2023 00:25:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355706AbjHQWY6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Aug 2023 18:24:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1355789AbjHQWYz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Aug 2023 18:24:55 -0400
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5286C30DA
        for <linux-media@vger.kernel.org>; Thu, 17 Aug 2023 15:24:46 -0700 (PDT)
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-99bdcade7fbso29204066b.1
        for <linux-media@vger.kernel.org>; Thu, 17 Aug 2023 15:24:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gateworks-com.20221208.gappssmtp.com; s=20221208; t=1692311085; x=1692915885;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9lsyMGW6tqpJph3uPPGGuH1vGdHoqvw9c84nyXJ6aZs=;
        b=5r1zkQRmJTz1LduSqfQxn1UnPUwpIurF3OLWGRLTSAEL7EyqTxK5rccM8iZKMmW5W9
         /5Ax2IzteNCeM53Y3jBY4ZG7Rd2m53+wBPyb9pWWO8XfCBPzo78OEw/mDsTenEmdVNuc
         GSi5Q+m/rzx/y7TbCQ/mI3A/RJT9eXRDtqwLFxRx2mZC04o3jlKZbnroK9hm+n80DGeG
         waxkXFL94H6iI32Ndfcij2TOdIG6NCnCbewdbsKreOZyGWqyvsl5av0fX6ppth+nfMY9
         27WfvPuwV5G7/BD1oFqLnV29m5zUQwgWT0zRPT9XHQPDE+1bULNwnn+XTlfEmplatJly
         1e9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692311085; x=1692915885;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9lsyMGW6tqpJph3uPPGGuH1vGdHoqvw9c84nyXJ6aZs=;
        b=SE23GhoIjz0vckkWwlmNLSg/pD7XwkbjCy+DAOba3THo0Eocve7dRAPxVtJPzRYb5D
         lbqJTghoeZNvxBFm/1EeKECsUwYZ46dkzTUaVhHwMcUtbBuaVsDLMHj9LHhOWom6eXcI
         HtteJqoRPrLNSFZ232gTf3/WRbeysk9SPWqfwCJCRBFX3POc7Pv1jornZFRiyIrilcFV
         BJ2rJGvSwKogoHshRw7BT8ThNG7yidpJkO0pp2I8V9Q0aJ1KzZVFHYlQ2Jvu5zZDT3m3
         nruHairTO/8pIK9oUpU1O1Kf/hUU47yenpe1R5lzz+UDi/hPntW8K0Lgcniu/tZblGyQ
         4yIw==
X-Gm-Message-State: AOJu0YxGstf1ZuZbVxOZ6mgxrD/eEiyBSnWJbCKNvJNSaNPbR4VQeX8X
        TnDNkwDSEWDe7Lyel+AzJZZKPT5QVkpnZN9guAl/qg==
X-Google-Smtp-Source: AGHT+IHUeJ6je7ddyA0ABiqzPYd75gIlq/LRmvSV8XV57f4fskjlqxdEUcEQ8pgTXT9QhzJTfOHVPRYAh5R38+I2s4A=
X-Received: by 2002:a17:906:318a:b0:99e:7a8:74cf with SMTP id
 10-20020a170906318a00b0099e07a874cfmr590633ejy.66.1692311084842; Thu, 17 Aug
 2023 15:24:44 -0700 (PDT)
MIME-Version: 1.0
References: <20230725200249.15447-1-laurent.pinchart@ideasonboard.com>
In-Reply-To: <20230725200249.15447-1-laurent.pinchart@ideasonboard.com>
From:   Tim Harvey <tharvey@gateworks.com>
Date:   Thu, 17 Aug 2023 15:24:33 -0700
Message-ID: <CAJ+vNU3FUAjGh0mzgL8avU3TMYjE3X8eevnBfgsxkjZUVy8J6g@mail.gmail.com>
Subject: Re: [PATCH v3 0/3] media: imx: imx7-media-csi: Fix width alignment
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, Rui Miguel Silva <rmfrfs@gmail.com>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Fabio Estevam <festevam@denx.de>,
        NXP Linux Team <linux-imx@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Martin Kepplinger <martink@posteo.de>,
        Purism Kernel Team <kernel@puri.sm>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Jul 25, 2023 at 1:02=E2=80=AFPM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hello,
>
> This patch series is an attempt to fix the issue reported by Tim Harvey
> in [1].
>
> Both Alexander Stein and Fabio Estevam gave this a try in [2] and [3]
> respectively, with Alexander's self-nacking his patches and Fabio's
> solution receiving requests for changes during review.
>
> Compared to those attempts, this version implements a simpler fix for
> the issue (in patch 1/3), before addressing a TODO item (patch 2/3) and
> cleaning up includes as a drive-by improvement (patch 3/3).
>
> The series doesn't need to be merged in one go. Patch 1/3 can get merged
> as a fix for v6.5, while patches 2/3 and 3/3 can wait until v6.6.
>
> Tim, would you be able to test this ?
>
> [1] https://lore.kernel.org/linux-media/CAJ+vNU0BOVLTL17ofgHwtexbpuMYwH_a=
GUC=3D=3DEXABUtHHiv_ag@mail.gmail.com/
> [2] https://lore.kernel.org/linux-media/20230720074129.3680269-1-alexande=
r.stein@ew.tq-group.com
> [3] https://lore.kernel.org/linux-media/20230720222543.1740198-1-festevam=
@gmail.com
>
> Fabio Estevam (1):
>   media: imx: imx7-media-csi: Fix applying format constraints
>
> Laurent Pinchart (2):
>   media: imx: imx7-media-csi: Fix frame sizes enumeration
>   media: imx: imx7-media-csi: Include headers explicitly
>
>  drivers/media/platform/nxp/imx7-media-csi.c | 48 +++++++++++++++------
>  1 file changed, 34 insertions(+), 14 deletions(-)
>
> --
> Regards,
>
> Laurent Pinchart
>

Laurent,

Thanks for working on this. This series does not apply directly on
v6.5-rc6 which is where the regression is that 'media: imx:
imx7-media-csi: Fix applying format constraints' fixes. Regardless
I've manually applied the series on top of v5.6-rc6 and it does
resolve the regression. Note that Fabio's v2 fix applies fine on top
of v6.5-rc6 and resolves the regression in v6.5.

Tested-by: Tim Harvey <tharvey@gateworks.com> # imx8mm-gw72xx-0x with
imx219 image sensor

I'm not clear how to go about getting the first patch in the series
properly applied to v5.6 to resolve the regression.

Best regards,

Tim
