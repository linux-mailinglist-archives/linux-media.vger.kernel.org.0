Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8274D681FD2
	for <lists+linux-media@lfdr.de>; Tue, 31 Jan 2023 00:45:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229736AbjA3Xpd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 30 Jan 2023 18:45:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59614 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229460AbjA3Xpc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 30 Jan 2023 18:45:32 -0500
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A5A92B610
        for <linux-media@vger.kernel.org>; Mon, 30 Jan 2023 15:45:31 -0800 (PST)
Received: by mail-pf1-x42b.google.com with SMTP id cr11so7337684pfb.1
        for <linux-media@vger.kernel.org>; Mon, 30 Jan 2023 15:45:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=w2V4Uag+7LpQ7csSTGo095grGeQFTu+WFr0tRRczN10=;
        b=lV9OP3oZlpMsz3W3VyxABhfMUhbIQgrqcyqpDn/4gLIFctOZsLPDQCYKtBMh6WGJoJ
         xcUQh/SuIxqGePFpHmddlJ19jY4rea9VFBQRmIbZ56NY52mF/E28zQS+wlID/TmSnK4Q
         dMZKDp4+Imn2ohUmomw7YuTLLJ4KMK4/8WvopzIodUKPnZ65eqTWAJErOGRfqvRFm9NL
         tr1FI+hiCeyh/4byaguMPkHFLuJM+F4trVBBrMzECc9IoIDnbFJMWse9PVloGQcT5T8L
         MozMhsW26BNkAoLGW7cDumSsMeZuwJY5zmD2ylHc9N666aW9eUDS/F6wjrx3iQBq16Xz
         6A5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w2V4Uag+7LpQ7csSTGo095grGeQFTu+WFr0tRRczN10=;
        b=K93XEnBl4fs0DT6YOqTVZ5Ic8Xt36j5S4Y/KSJL1CfLDRwINrFVftAvUaCgS1EjQ2U
         tJxcc4M6s9iWAQVLr9vsvZDVZ3yvjHOfX1s1RClX937sP4K/NeBTksfP8saknrSNG9Ml
         KOd+/nryS4WEiqEKcI6DNdtsnDn7UxdltFu+yq1tNQGlnboiIAu7A9zJ3yMYJp6PzqSA
         eyw53+6/VDqXFuXqZYzPc87SarQwAet0CPLcUmLgW+6A2juyY4PxEadxqaPRF63Qvydi
         HMZUYnoBSxuvPMEU7drtMVsx1j0icXGczPPerQRjB5u7Vv82UsJ1yAVSvdZuSobflw+p
         B1Ng==
X-Gm-Message-State: AFqh2kqniOUSnA9gMlefL4nWaPYOHF3eL43t2tKKyykAI2KKnSyAoyxW
        CiKTRhfoT88kmsoZ13H/aFoBo8uf5vg/PVlj69E=
X-Google-Smtp-Source: AMrXdXt7GY113HABdO2dbFp78UfWUXow6BOtPoOb/s0unzyZ0ps7KaB5baOJeYXgxhlZMTn7/3pJMCvsXH5cDCUlXpk=
X-Received: by 2002:a63:f048:0:b0:4cf:3b5f:d64d with SMTP id
 s8-20020a63f048000000b004cf3b5fd64dmr5386105pgj.53.1675122330614; Mon, 30 Jan
 2023 15:45:30 -0800 (PST)
MIME-Version: 1.0
References: <20230129023429.22467-1-laurent.pinchart@ideasonboard.com>
In-Reply-To: <20230129023429.22467-1-laurent.pinchart@ideasonboard.com>
From:   Adam Ford <aford173@gmail.com>
Date:   Mon, 30 Jan 2023 17:45:19 -0600
Message-ID: <CAHCN7xL8DhXOtMk=F+RZto-mNOhApm25vvTvzk-yzyvPK37NqQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/8] media: nxp: imx7-media-csi: Move to subdev active state
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org,
        Martin Kepplinger <martin.kepplinger@puri.sm>,
        Paul Elder <paul.elder@ideasonboard.com>,
        Rui Miguel Silva <rmfrfs@gmail.com>, kernel@pengutronix.de,
        linux-imx@nxp.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sat, Jan 28, 2023 at 8:34 PM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hello,
>
> This small series moves the imx7-mipi-csi driver to use the subdev
> active state. Patches 1/8 to 7/8 are small preparatory cleanups, with
> the main change in 8/8.
>
> Compared to v1, I've now successfully tested the series on an i.MX8MM.
> The issues reported by Adam have been resolved by adding patch 7/8 and
> fixing a problem in 8/8.
>
> Laurent Pinchart (8):
>   media: imx: imx7-media-csi: Drop imx7_csi.cc field
>   media: imx: imx7-media-csi: Simplify imx7_csi_video_init_format()
>   media: imx: imx7-media-csi: Drop unneeded check when starting
>     streaming
>   media: imx: imx7-media-csi: Drop unneeded src_sd check
>   media: imx: imx7-media-csi: Drop unneeded pad checks
>   media: imx: imx7-media-csi: Cleanup errors in
>     imx7_csi_async_register()
>   media: imx: imx7-media-csi: Zero format struct before calling
>     .get_fmt()
>   media: imx: imx7-media-csi: Use V4L2 subdev active state
>

Thanks for the V2!  It works nicely along with the CSIS updates you
posted before.

For the series,

Tested-by: Adam Ford <aford173@gmail.com> #imx8mm-beacon-kit

>  drivers/media/platform/nxp/imx7-media-csi.c | 235 ++++++--------------
>  1 file changed, 70 insertions(+), 165 deletions(-)
>
> --
> Regards,
>
> Laurent Pinchart
>
