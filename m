Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B9A676828DE
	for <lists+linux-media@lfdr.de>; Tue, 31 Jan 2023 10:30:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230514AbjAaJap (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 31 Jan 2023 04:30:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59516 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230513AbjAaJan (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 31 Jan 2023 04:30:43 -0500
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41CBB2BED8
        for <linux-media@vger.kernel.org>; Tue, 31 Jan 2023 01:30:42 -0800 (PST)
Received: by mail-wm1-x32b.google.com with SMTP id o36so3826554wms.1
        for <linux-media@vger.kernel.org>; Tue, 31 Jan 2023 01:30:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=bRsrcpiBVEVo0bSH381dNABVjiz8fHvJngX2uBGger8=;
        b=OgoY6cn6W1rdYk0fq03f/cCi1t8BH/9a9VZJAASaWeHKH2dm97wj74KU4IsDhTqosq
         aJ9iGFEBGA+Fq+0daRFZba0kCOS6fbHXpOfpgnD9r3VUUUtB+A8WacSZ91nbVNiz9PxY
         0bSvkv+TOf9sV7yrSz3fAFFPIYcyZjaObhyjdFus2OtD8qt1sivx/3qE0tEgZ36bTfWN
         UYIXX7NXz/KQvtphhZDs9uSDvOf/dWUhAj00ryykvOomkIy3wmb2TEI1GLBGo2evmQLS
         tWiAp9OfH7CVGpz2er8hYJlkSjLmeGCAGYP2XfxhuMonGLx99L5mw7lrlj+BtLVFaYlo
         iVvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bRsrcpiBVEVo0bSH381dNABVjiz8fHvJngX2uBGger8=;
        b=WmrSI3t+2HAytUneY4HwQ8gTgEThkmxzjpgLqzpwQQCRAbJ+ReB29JQ75dm25nfaoY
         niIoECH3hjXh5KIIfd3XrRmhaP6KPPyCOcZuew23k0MziYJmFM1YlZq62Fuqp22cGkNB
         H0mD4yDKBRpUKHJsxr042+EHngtfbutHPwOjcm29E0sf+8pFzIvd6QfVxpD0cL1Ud/n7
         rhNHTEqRZCpiQMla06W5LhCtUGtXb1NNLxYdp8JJcBpp/dPopB6Sdm6Ajav45Hr43Wuv
         8s1d+XxspLLQv/gwcYMXahzpn1xLb+EsLmAJ8U/T33+TVh/nM7iS3qtG95AOhWN5LlHU
         R+wg==
X-Gm-Message-State: AO0yUKX5Mm74JWUU1Dk9858U5tsaRbSMNdh3LuUg5QCjUsGns5Cq0oxn
        DuXKz7yRj7xdOs0Tz9EAxhc=
X-Google-Smtp-Source: AK7set/MFPUB9jZNkAvggad2P16N6bgFxMgjs8RKbq6Mi+GmbZCIyl50QwUmM36S6vVJd6ovwf3ygg==
X-Received: by 2002:a1c:ed0f:0:b0:3dc:5deb:40a0 with SMTP id l15-20020a1ced0f000000b003dc5deb40a0mr5196609wmh.8.1675157440714;
        Tue, 31 Jan 2023 01:30:40 -0800 (PST)
Received: from localhost (a109-49-33-111.cpe.netcabo.pt. [109.49.33.111])
        by smtp.gmail.com with ESMTPSA id az19-20020adfe193000000b002bdc3f5945dsm1266541wrb.89.2023.01.31.01.30.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Jan 2023 01:30:40 -0800 (PST)
From:   Rui Miguel Silva <rmfrfs@gmail.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     Adam Ford <aford173@gmail.com>,
        Martin Kepplinger <martin.kepplinger@puri.sm>,
        Paul Elder <paul.elder@ideasonboard.com>,
        kernel@pengutronix.de, linux-imx@nxp.com
Subject: Re: [PATCH v2 0/8] media: nxp: imx7-media-csi: Move to subdev
 active state
In-Reply-To: <20230129023429.22467-1-laurent.pinchart@ideasonboard.com>
References: <20230129023429.22467-1-laurent.pinchart@ideasonboard.com>
Date:   Tue, 31 Jan 2023 09:30:39 +0000
Message-ID: <m3leljcaps.fsf@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,HK_RANDOM_ENVFROM,
        HK_RANDOM_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,
Also thanks for the work on updating this one.

Laurent Pinchart <laurent.pinchart@ideasonboard.com> writes:

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

LGTM, for the all series.

Acked-by: Rui Miguel Silva <rmfrfs@gmail.com>

Cheers,
  Rui

>
>  drivers/media/platform/nxp/imx7-media-csi.c | 235 ++++++--------------
>  1 file changed, 70 insertions(+), 165 deletions(-)
>
> -- 
> Regards,
>
> Laurent Pinchart
