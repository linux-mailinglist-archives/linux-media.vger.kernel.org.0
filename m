Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A57C87ACA19
	for <lists+linux-media@lfdr.de>; Sun, 24 Sep 2023 16:47:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229837AbjIXOrt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 24 Sep 2023 10:47:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39824 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230134AbjIXOrs (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 24 Sep 2023 10:47:48 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C22F10D
        for <linux-media@vger.kernel.org>; Sun, 24 Sep 2023 07:47:40 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 52300475;
        Sun, 24 Sep 2023 16:45:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1695566758;
        bh=Yrl8kPSW3bOcnYGTk7E/BiEvYeaqo6jpzRGsrRDdZjQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=dWsZaGQ8j8cYK4Yg81kMWxBmPcRNXBcZw9IosK6t04AIXAknr4x8Vo94H9SKx4jDQ
         AOyjNs+FpaQiKyFauriAtPBo3G5OC0lRSAJUTrGYkc4tIsWKHQtNBl5Zsp8Xzp2nG5
         /w6dhmHqhdAK51R9HSeX22NIjzyOMWsxm3gKWf7s=
Date:   Sun, 24 Sep 2023 17:47:49 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     linux-media@vger.kernel.org,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@iki.fi>, Kate Hsuan <hpa@redhat.com>
Subject: Re: [PATCH v4 0/2] media: Add onsemi MT9M114 camera sensor driver
Message-ID: <20230924144749.GA8357@pendragon.ideasonboard.com>
References: <20230920171155.7648-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230920171155.7648-1-laurent.pinchart@ideasonboard.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

FYI, as the atomisp driver has an mt9m114 driver. There's certainly no
urgency to replace it, but if you have a machine on which you could test
this driver, it could be nice at some point in the future. Any issue you
encounter can be fixed on top of this series (in particular, dynamically
computing the PLL configuration would be very nice).

On Wed, Sep 20, 2023 at 08:11:52PM +0300, Laurent Pinchart wrote:
> Hello,
> 
> This series adds a driver for the onsemi MT9M114 camera sensor. It's all
> a pretty standard story, DT bindings are in 1/2, and the driver in 2/2.
> Review comments from v3 have all been taken into account as far as I can
> tell.
> 
> The driver has been tested with an i.MX8MM in CSI-2 mode. Jacopo tested
> v2 in parallel mode, but given the number of changes in v3, I haven't
> kept the Tested-by tag.
> 
> Laurent Pinchart (2):
>   media: dt-bindings: media: i2c: Add MT9M114 camera sensor binding
>   media: i2c: Add driver for onsemi MT9M114 camera sensor
> 
>  .../bindings/media/i2c/onnn,mt9m114.yaml      |  114 +
>  MAINTAINERS                                   |    8 +
>  drivers/media/i2c/Kconfig                     |   10 +
>  drivers/media/i2c/Makefile                    |    1 +
>  drivers/media/i2c/mt9m114.c                   | 2481 +++++++++++++++++
>  5 files changed, 2614 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/onnn,mt9m114.yaml
>  create mode 100644 drivers/media/i2c/mt9m114.c
> 
> 
> base-commit: 0bb80ecc33a8fb5a682236443c1e740d5c917d1d

-- 
Regards,

Laurent Pinchart
