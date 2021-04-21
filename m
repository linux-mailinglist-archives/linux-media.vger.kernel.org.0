Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 39500366F21
	for <lists+linux-media@lfdr.de>; Wed, 21 Apr 2021 17:27:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244005AbhDUP2C (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 21 Apr 2021 11:28:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42506 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243996AbhDUP2B (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 21 Apr 2021 11:28:01 -0400
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com [IPv6:2607:f8b0:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38750C06174A
        for <linux-media@vger.kernel.org>; Wed, 21 Apr 2021 08:27:28 -0700 (PDT)
Received: by mail-pg1-x532.google.com with SMTP id t22so30223855pgu.0
        for <linux-media@vger.kernel.org>; Wed, 21 Apr 2021 08:27:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gateworks-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=mFb+ckbAGYD+H2juq/+J+FbQx9rWZFkMXDw0jxLuV1I=;
        b=zFO8YgqNBI8miB1U/nr0bfbagGSyMnqO7k1r+sVvpCZAhSXLcCu5zdhxL+84BmLp6E
         3kO0BaJgkY0n4umuOml0/maXhuLxqCUgNp7V6KTVeCD4woJrzuJBodzmlXHCQCnHDzFS
         6NkxajgOflI+YgbNmKCUeh+2cH6rYTILDtUQwR/mmiF64kCmlS19Rj1N+3Q6+JzkO9jn
         rTw3hzHg95oP9bjSXgLS9I84dzNu0ptot2NZXYQEmfsP7uj5ft+fDOY8AG02fbsvqDxM
         o4mkG2cVQmzuROeqd8CZmjQh2ELxsh2WEPQo8Ap4xP8PTn1bPS4P1tkAiuDNHA36ln+i
         0MwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mFb+ckbAGYD+H2juq/+J+FbQx9rWZFkMXDw0jxLuV1I=;
        b=XXlqa+7XEvGLl5mIeveV8FwMbG6bLk5Te9T4juAeGtBymKXw2QdOanXYdVedxtt/QM
         VN7bNli8gQB4TWrtpHb95cjHxvQje+1GsZRuKQY7cjILeHZGbUKNrTDvytoWEF6+X5El
         ewnJ44DxCIxxIvRa46chXCsh7RPBlOaWs7sNh2EXvkTxv+N5HtrhXg6rMTwhH6DCUJHT
         9win8G97OuRXwvXB3lp65hpybc+g7a+inx82za/Ulqob9mCYJBETougJODldkTJKAgeJ
         wjj7vKiJaRH74ibDqBX2+4Wsi9/EbTi+H+/BJwhTemFP9vb530as/Wvm22nCwKfoDRqq
         KE0A==
X-Gm-Message-State: AOAM532Q8AdU61RskRiHW3fCjsVDlI8f6K3hcQQlW3cqEOxBAPvMEZbB
        2XXADgkjsEEG7C6NQl0ToS8e2L2wy2Nr1XBYxy6HS8WkA4Vo5/J2
X-Google-Smtp-Source: ABdhPJwmmGQxWjj9eomSe6AfAEC4wDbf7Pfmu9GRlZZn8+saMdBdYQvxpEaU7L058l81v89reEK9S911TaNhfBRWfJQ=
X-Received: by 2002:a62:33c6:0:b029:225:5266:28df with SMTP id
 z189-20020a6233c60000b0290225526628dfmr29996329pfz.7.1619018847549; Wed, 21
 Apr 2021 08:27:27 -0700 (PDT)
MIME-Version: 1.0
References: <20210413023014.28797-1-laurent.pinchart@ideasonboard.com>
In-Reply-To: <20210413023014.28797-1-laurent.pinchart@ideasonboard.com>
From:   Tim Harvey <tharvey@gateworks.com>
Date:   Wed, 21 Apr 2021 08:27:15 -0700
Message-ID: <CAJ+vNU1bnR+L-QkHAN_Yar0MUTjF+QoxgTHV9ZxQW+VWpM6cpg@mail.gmail.com>
Subject: Re: [PATCH 00/23] media: imx: imx7-mipi-csis: Add i.MX8MM support
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media <linux-media@vger.kernel.org>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Sascha Hauer <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Marek Vasut <marex@denx.de>, Rob Herring <robh+dt@kernel.org>,
        Device Tree Mailing List <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Apr 12, 2021 at 7:31 PM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hello,
>
> This patch series adds support for the CSIS found in the NXP i.MX8MM SoC
> to the imx7-mipi-csis driver.
>
> The CSIS is an IP core from Samsung, integrated in different NXP SoCs.
> The driver currently supports v3.3 of the CSIS, found in SoCs from the
> i.MX6 and i.MX7 families. This series extends the driver to support
> v3.6.3 of the IP, found in i.MX8MM and other members of the i.MX8
> family.
>
> The first 21 patches are miscellaneous cleanups and improvements. Please
> see individual patches for details.
>
> Patch 22/23 extends the imx7-mipi-csis DT bindings with i.MX8MM support.
> Support for other members of the i.MX8 family will come later, and for
> SoCs including an ISI IP core (such as the i.MX8MP) this will require
> more work to handle additional glue logic.
>
> Patch 23/23 finaly extends the imx7-mipi-csis driver accordingly.
>
> The changes in the integration of the CSIS between i.MX7 and i.MX8, as
> described in the DT bindings, have been found through reading of
> reference manuals and BSP source code, with different sources of
> information contradicting each other. A confirmation from NXP would be
> nice (in particular regarding the clocks).
>
> Laurent Pinchart (23):
>   media: imx: imx7_mipi_csis: Fix logging of only error event counters
>   media: imx: imx7_mipi_csis: Count the CSI-2 debug interrupts
>   media: imx: imx7_mipi_csis: Update ISP_CONFIG macros for quad pixel
>     mode
>   media: imx: imx7_mipi_csis: Move static data to top of
>     mipi_csis_dump_regs()
>   media: imx: imx7_mipi_csis: Minimize locking in get/set format
>   media: imx: imx7_mipi_csis: Don't set subdev data
>   media: imx: imx7-mipi-csis: Reorganize code in sections
>   media: imx: imx7_mipi_csis: Set the CLKSETTLE register field
>   media: imx: imx7_mipi_csis: Drop unused csis_hw_reset structure
>   media: imx: imx7_mipi_csis: Store CSI-2 data type in format structure
>   media: imx: imx7_mipi_csis: Drop csi_state phy field
>   media: imx: imx7_mipi_csis: Rename mipi_sd to sd
>   media: imx: imx7_mipi_csis: Rename csi_state flag field to state
>   media: imx: imx7_mipi_csis: Turn csi_state irq field into local
>     variable
>   media: imx: imx7_mipi_csis: Don't pass pdev to mipi_csis_parse_dt()
>   media: imx: imx7_mipi_csis: Pass csi_state to mipi_csis_subdev_init()
>   media: imx: imx7_mipi_csis: Drop csi_state pdev field
>   media: imx: imx7_mipi_csis: Make csi_state num_clocks field unsigned
>   media: imx: imx7_mipi_csis: Reorganize csi_state structure
>   media: imx: imx7_mipi_csis: Reorganize mipi_csis_probe()
>   media: imx: imx7_mipi_csis: Reject invalid data-lanes settings
>   dt-bindings: media: nxp,imx7-mipi-csi2: Add i.MX8MM support
>   media: imx: imx7_mipi_csis: Add i.MX8MM support
>
>  .../bindings/media/nxp,imx7-mipi-csi2.yaml    | 108 +-
>  drivers/staging/media/imx/imx7-mipi-csis.c    | 943 ++++++++++--------
>  2 files changed, 622 insertions(+), 429 deletions(-)
>
> --
> Regards,
>
> Laurent Pinchart
>

Laurent,

Thank you for your work on this!

I have an IMX8MM board supporting CSI and a couple of devices to test with:
- Sony IMX477 12.3MP sensor (do not see any mainline support but there
are some hits on the net as this is a RPi camera)
- Sony IMX219 8MP sensor (should be supported by drivers/media/i2c/imx219.c)
- Auvidea B10x HDMI to CSI-2 bridge (Toshiba TC358743XBG HDMI to CSI-2
(MIPI)- 2D+C) (should be supported by drivers/media/i2c/tc358743.c)

Can you summarize the state of IMX8MM CSI capture in mainline? I
suppose the MIPI power domain is still an issue? Anything else that
would keep me from testing the above devices?

Best regards,

Tim
