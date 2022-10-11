Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0DA9F5FB4CA
	for <lists+linux-media@lfdr.de>; Tue, 11 Oct 2022 16:43:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229734AbiJKOnG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 11 Oct 2022 10:43:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47108 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229517AbiJKOnF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 11 Oct 2022 10:43:05 -0400
Received: from mail-vs1-xe29.google.com (mail-vs1-xe29.google.com [IPv6:2607:f8b0:4864:20::e29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4F845141C
        for <linux-media@vger.kernel.org>; Tue, 11 Oct 2022 07:43:04 -0700 (PDT)
Received: by mail-vs1-xe29.google.com with SMTP id 126so14478032vsi.10
        for <linux-media@vger.kernel.org>; Tue, 11 Oct 2022 07:43:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=snQBN4uLHS6g/2mZEbV3nmJWLKPBzs3PH5k6rbcDXAc=;
        b=WBcVh6+p305sT87FKdIU6AAdpi+V4PQD/V4TjRY/CAitG1FYkNmQa/ek85unHEnAXa
         OBVU/eQUpPHFZlqbDMaqAp5gLmyWIRbr4hDhBc19gC6FJrScN6qhJM3xDRDnRG2Cc9Yd
         3cF54iVQFHo2oMwN33y0gq77lh/XdTUp2q8Ha7v9CTb2YKg73y3PNgIBizySmVafoBl1
         rxaxHk6c243cKRNXUQ24WDbNhf4t4dAz+LGKCa5tCB1LJKSaaBCV4fgX5Eu3pji6K7Qi
         8G8+JL8Lkhz/J3z+o/bkpB4sgQrvAX+RQX5FOXlbs6/LoQ8R+kQoaHeUlfKIR79/YWrx
         1MSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=snQBN4uLHS6g/2mZEbV3nmJWLKPBzs3PH5k6rbcDXAc=;
        b=A2L9bUIs16ePq3e1x4u4izB0eXWpjjh1C6PgrTl4z8Fngp3TOT89sP2nA7vEdAXrjF
         6UfJngRU5IkE86TT2RlS/Vqb63rhJWGWJscvm6yVIcPtvGOjPI9jxHTZF5DNuQH872CX
         eQNAQK9ex7VWqsw1arkFOKfSbXFl8sdSioKjZViHef3vR3h25vxaDIhMMXKM6MDXSn/e
         4qLhNZpfAUzOk0MHNwjVxnP23dUauEdK6sfToIBBGtqePC50mdHaAEkdzvz0skp9J6FW
         I+p1qOdwhl7H5VvM842TQGR6THmoJRtz1dI6zE2cvP8oOhgTtYTeyIoc/j9mM40WsS2M
         qWYw==
X-Gm-Message-State: ACrzQf12rao/CEljzHsZqYwNDN3gIiDrUhSQApBnGnYzvsMgH9S5Ey9W
        YiJ5j2lmjJ5if94aAUJaIO/19w/nxDw2WZye8OY=
X-Google-Smtp-Source: AMsMyM5/g/okYGvdT/HtwBCw5LwzLeH1IKtAl2nnypwGSoYoFQuv+FZHLn2L4vFM78pBCXvFJn14P0MzwT6Pa8MQoAc=
X-Received: by 2002:a05:6102:3d9c:b0:3a7:16a0:104f with SMTP id
 h28-20020a0561023d9c00b003a716a0104fmr11357043vsv.23.1665499383762; Tue, 11
 Oct 2022 07:43:03 -0700 (PDT)
MIME-Version: 1.0
References: <20220712000251.13607-1-laurent.pinchart@ideasonboard.com> <20220712000251.13607-8-laurent.pinchart@ideasonboard.com>
In-Reply-To: <20220712000251.13607-8-laurent.pinchart@ideasonboard.com>
From:   Adam Ford <aford173@gmail.com>
Date:   Tue, 11 Oct 2022 09:42:52 -0500
Message-ID: <CAHCN7xL7a8SPe9pYY_Me-d9BLqMTXZ_WLLAyzKGFsqFnE9h1Sg@mail.gmail.com>
Subject: Re: [PATCH v2 7/7] media: nxp: Add i.MX8 ISI driver
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, Sakari Ailus <sakari.ailus@iki.fi>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Xavier Roumegue <xavier.roumegue@oss.nxp.com>,
        linux-imx@nxp.com, kernel@pengutronix.de
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

On Mon, Jul 11, 2022 at 7:06 PM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> The Image Sensing Interface (ISI) combines image processing pipelines
> with DMA engines to process and capture frames originating from a
> variety of sources. The inputs to the ISI go through Pixel Link
> interfaces, and their number and nature is SoC-dependent. They cover
> both capture interfaces (MIPI CSI-2 RX, HDMI RX) and memory inputs.
>

Tested-by: Adam Ford <aford173@gmail.com> #imx8mn-beacon

> Signed-off-by: Christian Hemp <c.hemp@phytec.de>
> Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
> Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
> Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Stefan Riedmueller <s.riedmueller@phytec.de>
> ---
>  MAINTAINERS                                   |    7 +
>  drivers/media/platform/nxp/Kconfig            |    2 +
>  drivers/media/platform/nxp/Makefile           |    1 +
>  drivers/media/platform/nxp/imx8-isi/Kconfig   |   22 +
>  drivers/media/platform/nxp/imx8-isi/Makefile  |    9 +
>  .../platform/nxp/imx8-isi/imx8-isi-core.c     |  646 +++++++
>  .../platform/nxp/imx8-isi/imx8-isi-core.h     |  394 +++++
>  .../platform/nxp/imx8-isi/imx8-isi-crossbar.c |  529 ++++++
>  .../platform/nxp/imx8-isi/imx8-isi-debug.c    |  109 ++
>  .../media/platform/nxp/imx8-isi/imx8-isi-hw.c |  651 +++++++
>  .../platform/nxp/imx8-isi/imx8-isi-m2m.c      |  858 ++++++++++
>  .../platform/nxp/imx8-isi/imx8-isi-pipe.c     |  867 ++++++++++
>  .../platform/nxp/imx8-isi/imx8-isi-regs.h     |  418 +++++
>  .../platform/nxp/imx8-isi/imx8-isi-video.c    | 1513 +++++++++++++++++
>  14 files changed, 6026 insertions(+)
>  create mode 100644 drivers/media/platform/nxp/imx8-isi/Kconfig
>  create mode 100644 drivers/media/platform/nxp/imx8-isi/Makefile
>  create mode 100644 drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
>  create mode 100644 drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
>  create mode 100644 drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
>  create mode 100644 drivers/media/platform/nxp/imx8-isi/imx8-isi-debug.c
>  create mode 100644 drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c
>  create mode 100644 drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c
>  create mode 100644 drivers/media/platform/nxp/imx8-isi/imx8-isi-pipe.c
>  create mode 100644 drivers/media/platform/nxp/imx8-isi/imx8-isi-regs.h
>  create mode 100644 drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
>
<snip>

> +}

> --
> Regards,
>
> Laurent Pinchart
>
