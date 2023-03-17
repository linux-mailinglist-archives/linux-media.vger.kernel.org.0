Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9BA7F6BF196
	for <lists+linux-media@lfdr.de>; Fri, 17 Mar 2023 20:20:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230025AbjCQTUi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 17 Mar 2023 15:20:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229900AbjCQTUi (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 17 Mar 2023 15:20:38 -0400
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40E5F1CAED
        for <linux-media@vger.kernel.org>; Fri, 17 Mar 2023 12:20:36 -0700 (PDT)
Received: by mail-wr1-x430.google.com with SMTP id r18so5387831wrx.1
        for <linux-media@vger.kernel.org>; Fri, 17 Mar 2023 12:20:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679080835;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=VZPO8aBTlJHVS9njvkKVQX0h/R3CG+VBrMyrjKHcMto=;
        b=UfzcS5aXDjB5KERFzNi+7c4WlBgFuyX5CFE+DY6puPgK527V3NnNVVH0ObFVH2LiUC
         HAITz6b+LiSMhPKjnghl2AWYJHlaD7VpDvdQGxkmzh8qH3Mfl1vVwfqnHpCUrAn1jJKt
         i9lLJgXC5D88bsbFlfT9+haF6n+W81VXB8mMS3RjFKYoff1mbBRS8DrDXdNMVl2gamKY
         HqOJX2DqLIq+W8dLg72urbjd+4bLeWQcz6kW2vQ7ohY5l8enNw/QmVhrgnKjKkMVOz0A
         sEQV0PWc9BV/uVDCfWxjxkW2GcQXJNoZu6ruyy4yrz0J2mmFytLf3SQh7KLCpk6EjTWE
         5EfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679080835;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VZPO8aBTlJHVS9njvkKVQX0h/R3CG+VBrMyrjKHcMto=;
        b=MG+h0z0Txk6OOgJYAZPHFpIP9iYpWu2ao6byZgKzmb+a2xKeIpnKBOFHRS3AYlnD19
         ekPGjP12w2SFRg/vIL2RboTtIImB55etEe7+QTKBi6kxiQ+ef6GaYyvP6BOiQOzX/eON
         agZmFNK7irVpnuwVSKbUdut5fvSnnppcr9UqGkmflEd0kRbKZ9B5oTfIfuSyJ0P4yHgD
         tQH3k5XNc3vO5kSQ8e9ouO4ee4iIWFHgAOUuZM6FGVTc8w3rqTIJdtWyuRiEkefehPCz
         6ruLTa7oGfe/9nVW6Zsnw5BZKTl7jSQ9OWv9W9KmaYDPWIoIe7cfI6Sl7vGCASTPZsGp
         sooA==
X-Gm-Message-State: AO0yUKWeIsrx3uItEmbwqfx1gfjm85SdcY2SVLagOQW4U+h4osXGtW9M
        EICFSn/qLCBwVjVixprz85s=
X-Google-Smtp-Source: AK7set/OiYi1APEP0EYXtQT+LQWfCu+7KmNReUhn0gAWMWGOnxRdcTfDafu5hLQHhlm45jW+T042Dg==
X-Received: by 2002:adf:dd83:0:b0:2cf:e517:c138 with SMTP id x3-20020adfdd83000000b002cfe517c138mr8080429wrl.66.1679080834601;
        Fri, 17 Mar 2023 12:20:34 -0700 (PDT)
Received: from localhost (a109-49-33-111.cpe.netcabo.pt. [109.49.33.111])
        by smtp.gmail.com with ESMTPSA id h10-20020adffa8a000000b002ce3d3d17e5sm2654689wrr.79.2023.03.17.12.20.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Mar 2023 12:20:33 -0700 (PDT)
From:   Rui Miguel Silva <rmfrfs@gmail.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/3] media: imx: imx7-media-csi: Fix mbus framefmt field
 init
In-Reply-To: <20230317182858.GB28322@pendragon.ideasonboard.com>
References: <20230316143829.499039-1-alexander.stein@ew.tq-group.com>
 <20230316143829.499039-2-alexander.stein@ew.tq-group.com>
 <m3r0tn47m0.fsf@gmail.com>
 <20230317182858.GB28322@pendragon.ideasonboard.com>
Date:   Fri, 17 Mar 2023 19:20:32 +0000
Message-ID: <m3h6ujgp6n.fsf@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Status: No, score=-0.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,HK_RANDOM_ENVFROM,
        HK_RANDOM_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent.

Laurent Pinchart <laurent.pinchart@ideasonboard.com> writes:

> Hello,
>
> On Fri, Mar 17, 2023 at 05:20:55PM +0000, Rui Miguel Silva wrote:
>> Hi Alexander,
>> Thanks for the patch.
>> 
>> Alexander Stein <alexander.stein@ew.tq-group.com> writes:
>> 
>> > Default to non-interleaving.
>> 
>> Why?
>
> Otherwise it is implicitly set to V4L2_FIELD_ANY as the structure is
> zero-initialized, and that's not a valid value for drivers to return to
> userspace. This should be explained in the commit message.

Yes, that was my intention, to have the why in the commit message.

Cheers,
  Rui

>
>> > Fixes: bc0d3df31ffe ("media: imx: imx7-media-csi: Simplify imx7_csi_video_init_format()")
>> 
>> It was never init to FIELD_NONE even before this patch, do you think it
>> is really a fix?
>
> Commit bc0d3df31ffe does indeed not seem relevant.
>
> The problem predates the destaging of the driver, it's a bit difficult
> to trace. I'd drop the Fixes: tag.
>
>> > Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
>> > ---
>> >  drivers/media/platform/nxp/imx7-media-csi.c | 1 +
>> >  1 file changed, 1 insertion(+)
>> >
>> > diff --git a/drivers/media/platform/nxp/imx7-media-csi.c b/drivers/media/platform/nxp/imx7-media-csi.c
>> > index c22bf5c827e7..3e97b9f2ff69 100644
>> > --- a/drivers/media/platform/nxp/imx7-media-csi.c
>> > +++ b/drivers/media/platform/nxp/imx7-media-csi.c
>> > @@ -1610,6 +1610,7 @@ static int imx7_csi_video_init_format(struct imx7_csi *csi)
>> >  	format.code = IMX7_CSI_DEF_MBUS_CODE;
>> >  	format.width = IMX7_CSI_DEF_PIX_WIDTH;
>> >  	format.height = IMX7_CSI_DEF_PIX_HEIGHT;
>> > +	format.field = V4L2_FIELD_NONE;
>> >  
>> >  	imx7_csi_mbus_fmt_to_pix_fmt(&csi->vdev_fmt, &format, NULL);
>> >  	csi->vdev_compose.width = format.width;
>
> -- 
> Regards,
>
> Laurent Pinchart
