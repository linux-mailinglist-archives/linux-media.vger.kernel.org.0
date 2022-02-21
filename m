Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 696CE4BE2CD
	for <lists+linux-media@lfdr.de>; Mon, 21 Feb 2022 18:56:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1359252AbiBUNi4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 21 Feb 2022 08:38:56 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:54530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1359240AbiBUNiz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 21 Feb 2022 08:38:55 -0500
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84BB713E22
        for <linux-media@vger.kernel.org>; Mon, 21 Feb 2022 05:38:31 -0800 (PST)
Received: by mail-ed1-x52d.google.com with SMTP id i11so27770694eda.9
        for <linux-media@vger.kernel.org>; Mon, 21 Feb 2022 05:38:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=AE4XeU44vSd/sL9aIQeJuEB4bjJequuMaol59LSY2i8=;
        b=omx75ZG52xD7qa4+gn02NpqXOKFppuraxVJR3CYtZFjTMg8pnPuku0CsU5QRaobe+/
         aWkVVSRSC9cbMM1j5MXp21tNHzXnzYhjay8Oqtxb2jNaBH8KP2VzprVGevbWEeny/CBF
         y1p4xqsTNQ9SLNnQyEfI5VmsVeIkJpAGuz85QtfnKiqc5onfW09FaftiOPRPKaqVUhUA
         pfhEYb0mRKxL7w2WCPUcH1eQttfbMX9JtG18SLNxup6YyPvxDKkVagiZiaQb3bMARQHj
         Lk3SgjPmnhVfBWJMG5wDYcNWhQx2eMbYudZFXC/BZCfItyFu8inA/GWKKSifY8LcUSd4
         9tfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AE4XeU44vSd/sL9aIQeJuEB4bjJequuMaol59LSY2i8=;
        b=bc+ddUBLuHWLyV0m68WAic/fpMD768PSDhcDzFcZ9iT28zTJbeJyWYEM+bqzTOwtuE
         jSgER0cJIc2yt1////8LSnQtMQhzGZo0BIZtGVQ5tIfJDHZ1ML0BW+mrRqwAUKJbc4QL
         wo+lBA9QiRQFi/moSMqLIGxM0JPH9MyFFvfgRnz04NTIKCWlBQpuA+u90jcFRIp3NI43
         znXdhhbxF+5/Olx4XvTScVCKKZdRtLggOc7r0Mn9rbduiUd6L27eiAsfX9920BHV6DfL
         mz+3vpGYVN34SCByrM0IyMT29Dy/zT5LnjMOJvYWQ+QxPNvJ5k1uAS0v5YXph1zI3At8
         R4TA==
X-Gm-Message-State: AOAM530GBs3UN3P6sW+G3MIBo1YsRIebQPj95LQEShlbM74mkh7VkabN
        JnXGFpxz9QwNzShs8f6F+snp3WP9ZCqQKiRvJ6g=
X-Google-Smtp-Source: ABdhPJwlLJBBrqnX5dqmFG7mqUg5FOgbJgj2Hc5s8ttunkrBfSsomSPWj8ldQBb8h4VaXxRmcVCrmpJxYsOHCDcu4Ho=
X-Received: by 2002:a50:aa9d:0:b0:40f:d653:ff0f with SMTP id
 q29-20020a50aa9d000000b0040fd653ff0fmr21633157edc.114.1645450709889; Mon, 21
 Feb 2022 05:38:29 -0800 (PST)
MIME-Version: 1.0
References: <20220221111611.52905-1-jacopo@jmondi.org>
In-Reply-To: <20220221111611.52905-1-jacopo@jmondi.org>
From:   Adam Ford <aford173@gmail.com>
Date:   Mon, 21 Feb 2022 07:38:18 -0600
Message-ID: <CAHCN7xKgsuMMHcL0BQDDMojoghLb+T88ptV7KTmjOBRpK=z51w@mail.gmail.com>
Subject: Re: [PATCH] media: imx: imx8mp-mipi-csi2: Remove YUV422 2X8
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        martin.kepplinger@puri.sm, rmfrfs@gmail.com,
        xavier.roumegue@oss.nxp.com,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        dorota.czaplejewicz@puri.sm, Sascha Hauer <kernel@pengutronix.de>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-media <linux-media@vger.kernel.org>,
        "open list:STAGING SUBSYSTEM" <linux-staging@lists.linux.dev>,
        arm-soc <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Feb 21, 2022 at 5:17 AM Jacopo Mondi <jacopo@jmondi.org> wrote:
>
> The 2X8 variants of MEDIA_BUS_FMT_YUYV8_2X8 does not apply to serial
> busses.
>
> Drop it and while at it beautify the formats declaration list a little
> by putting the opening curly brace after the comment.
>
> Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> ---
>  drivers/staging/media/imx/imx8mq-mipi-csi2.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/staging/media/imx/imx8mq-mipi-csi2.c b/drivers/staging/media/imx/imx8mq-mipi-csi2.c
> index 56ef3b3b2906..a3e33ce83c1f 100644
> --- a/drivers/staging/media/imx/imx8mq-mipi-csi2.c
> +++ b/drivers/staging/media/imx/imx8mq-mipi-csi2.c

The subject says imx8mp but the file modified is imx8mq.  I assume the
subject is a typo.

To my knowledge, the 8mp uses the same csis as the 8mm.

adam
> @@ -200,11 +200,9 @@ static const struct csi2_pix_format imx8mq_mipi_csi_formats[] = {
>         }, {
>                 .code = MEDIA_BUS_FMT_SRGGB14_1X14,
>                 .width = 14,
> -       }, {
> +       },
>         /* YUV formats */
> -               .code = MEDIA_BUS_FMT_YUYV8_2X8,
> -               .width = 16,
> -       }, {
> +       {
>                 .code = MEDIA_BUS_FMT_YUYV8_1X16,
>                 .width = 16,
>         }
> --
> 2.35.0
>
