Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E554E5F9CCE
	for <lists+linux-media@lfdr.de>; Mon, 10 Oct 2022 12:31:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231853AbiJJKbw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 10 Oct 2022 06:31:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231835AbiJJKbv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 10 Oct 2022 06:31:51 -0400
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D42D63FA33
        for <linux-media@vger.kernel.org>; Mon, 10 Oct 2022 03:31:49 -0700 (PDT)
Received: by mail-ej1-x62e.google.com with SMTP id d26so16794681eje.10
        for <linux-media@vger.kernel.org>; Mon, 10 Oct 2022 03:31:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1YtWsAF9bw/EH1jjkSpnmov+JJYiSARLVH6VNgqLddY=;
        b=O1sdqpHwRRVNg8vkVVwqVWzgeMgZLghqPPcSg8qM8A4eX6XorKEbZn32BExQQNHxQo
         EgapTKFHs8feKyzk9ZfSNo/yQHOYwbaGHHv6jN2BWws2eLmBUaheTbG0+10zHszwvXHm
         JtGBOV3rC/vfD/Zsm3V70mWUjfKC+IzR2yrd7BlNMtxiiKSfTrHg4nWgvFQTYLeMNypK
         dUIZXo6mhtFjPP2u7kE5VO+/WA7Lzt8A47PG7oqemvUCI3zbq1psFqz/hLWTPhMvk35S
         PKk6vAkI5719ZTHctmn2vngRIAx5cEpvP9doOku+HbthvvfZ4C0DyoP9GOf0gu+qdeKP
         pSJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1YtWsAF9bw/EH1jjkSpnmov+JJYiSARLVH6VNgqLddY=;
        b=FKZ/nGFYOcSLgsx+RcpivsZLe+ZzVna0xmdgkh7jvbxqKQPJ4g4wd+jibMS651HU3v
         xpc2BUfIXgXq1uzGDl6fDebetmlGoKBherzm0/CzxDVuev2USdD9Fvu3NwWxJB/0YHUN
         JsN5HkDc8ud6+xyJPFJuoGdB/utulpr9zI9OipkFxYEekKrLlPz6K3eejYRsel5HNyyk
         Z1JeoJtro6ZEuunBbWZzmAGd8+85gOW7cyetSZcaSogH2hXWK55l+eNgu3ZRAdgKfEBM
         g/Jw5FxcNp0PbjJEWXsMgnMlUqHlFShr6hF6chqQUpiGH8fHZRn+ZsNHu/ZS0Vy8N5QI
         z06w==
X-Gm-Message-State: ACrzQf3+6/HEbgC61kdBix2FhVmMaSCc5d9urbCADSWQy19vj0eajg1Q
        w4xSocvWcLiV1qjm2Iokuw9zF1+CWmnSFH48PHUAlbudahI=
X-Google-Smtp-Source: AMsMyM4mTe3zXK6VCCR10ByJDxL1Fz4SFh6pMyhiIxY2bKaYozjVCdQK6Dn6L94mnCcu4+RG2uaUnusYWGC2yiEhfiQ=
X-Received: by 2002:a17:907:1c98:b0:78d:3b08:33ef with SMTP id
 nb24-20020a1709071c9800b0078d3b0833efmr14342483ejc.175.1665397908376; Mon, 10
 Oct 2022 03:31:48 -0700 (PDT)
MIME-Version: 1.0
References: <20220721083540.1525-1-laurent.pinchart@ideasonboard.com> <YwQpT5JpyfXBEIVE@pendragon.ideasonboard.com>
In-Reply-To: <YwQpT5JpyfXBEIVE@pendragon.ideasonboard.com>
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
Date:   Mon, 10 Oct 2022 11:31:33 +0100
Message-ID: <CAPY8ntAsJNOAJ2te2vQSK6AeXj8LyB6Krepc88FL=6U6O9zb2g@mail.gmail.com>
Subject: Re: [PATCH 00/19] media: i2c: imx290: Miscellaneous improvements
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Sakari Ailus <sakari.ailus@iki.fi>, linux-media@vger.kernel.org,
        Manivannan Sadhasivam <mani@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent

Do you have plans for a v2 on this patch set? I also have a number of
patches for imx290 and there's little point in causing grief to each
other with conflicts.
Or I could take the non-controversial patches from your set and send a
combined patch set?

Thanks
  Dave

On Tue, 23 Aug 2022 at 02:12, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Sakari,
>
> Could you already pick up patches 01/19, 02/19, 04/19, 05/19 and 06/19
> in your tree ? Your opinion on 03/19 woud be appreciated too, I think
> it's a candidate for merge as well.
>
> On Thu, Jul 21, 2022 at 11:35:21AM +0300, Laurent Pinchart wrote:
> > Hello,
> >
> > This patch series gathers miscellaneous improvements for the imx290
> > driver. The most notable changes on the kernel side is patch 07/19 that
> > simplifies register access, and on the userspace API side patches 14/19,
> > 15/19 and 18/19 that extend the driver with controls and selection
> > rectangles required by libcamera.
> >
> > Laurent Pinchart (19):
> >   media: i2c: imx290: Use device lock for the control handler
> >   media: i2c: imx290: Print error code when I2C transfer fails
> >   media: i2c: imx290: Specify HMAX values in decimal
> >   media: i2c: imx290: Replace macro with explicit ARRAY_SIZE()
> >   media: i2c: imx290: Drop imx290_write_buffered_reg()
> >   media: i2c: imx290: Drop regmap cache
> >   media: i2c: imx290: Support variable-sized registers
> >   media: i2c: imx290: Correct register sizes
> >   media: i2c: imx290: Simplify error handling when writing registers
> >   media: i2c: imx290: Define more register macros
> >   media: i2c: imx290: Add exposure time control
> >   media: i2c: imx290: Fix max gain value
> >   media: i2c: imx290: Split control initialization to separate function
> >   media: i2c: imx290: Implement HBLANK and VBLANK controls
> >   media: i2c: imx290: Create controls for fwnode properties
> >   media: i2c: imx290: Move registers with fixed value to init array
> >   media: i2c: imx290: Factor out format retrieval to separate function
> >   media: i2c: imx290: Add crop selection targets support
> >   media: i2c: imx290: Replace GAIN control with ANALOGUE_GAIN
> >
> >  drivers/media/i2c/imx290.c | 781 ++++++++++++++++++++++---------------
> >  1 file changed, 458 insertions(+), 323 deletions(-)
>
> --
> Regards,
>
> Laurent Pinchart
