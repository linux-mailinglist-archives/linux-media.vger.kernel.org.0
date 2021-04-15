Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DD2133605A4
	for <lists+linux-media@lfdr.de>; Thu, 15 Apr 2021 11:28:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231415AbhDOJ2W (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 15 Apr 2021 05:28:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56574 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230056AbhDOJ2V (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 15 Apr 2021 05:28:21 -0400
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A25B6C061574;
        Thu, 15 Apr 2021 02:27:58 -0700 (PDT)
Received: by mail-wr1-x42c.google.com with SMTP id m9so9862391wrx.3;
        Thu, 15 Apr 2021 02:27:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=OzaAb1xzbKHG+f2zGIgAHnGkdZkzSpeH4/Qmqh90Svk=;
        b=bImQPXhqOcQzb8Sa2H7+bP8UxFXPnDJhIEFZt0Y/sLCBtDnytaUzo8BAjMorvDLjkx
         iMeuhivVnV6GOM3W2W06LsPnkKpUizOMtM4nFMZKvW/VUQkapX96PUGF/1dPOzFV3H0m
         wp08uSoNqblXHKHfThDKvUe4i24bkX+gjfILuZT1Gmc5j8qZtoxM56I4JdRXUc65gwVE
         b96ZjTPR0ECvo5Q9K9FJsI4knm+65uonSD9e/E0g0aaLfWCkN9k1PJ1isYizGKPPjYTn
         EFMS2hqF3i9p1Yvtkew2MTf5TXOYSMoPFbi+w4kHVN9uqzis4qNMJUOxf04NhryJBLOp
         DWJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=OzaAb1xzbKHG+f2zGIgAHnGkdZkzSpeH4/Qmqh90Svk=;
        b=pRKWLdZwdF60Dw27hsHtC+VjEvb4WTkI+kjEy7jaPBAFXLKEikB5VabRRP9Qhe+k+T
         gZH4dMkcADAAKzFy4w1R9og3hjs+/dZsop2/gmVS+cbAzsCwLlvsd9dzFN0PwMfVDmZU
         llZS/kvZipDxl9vDjFlaaNFQqObdjX4IuVQpXDio2IX4vGyChTkcpEhiVf9pzf4TneNk
         3SbpxdQ2aptp394NUgejddXr+NcZ9FkyZYS20L/4ZMwm+R3diFE0rcqPhSSseyEXue72
         sk118uQBqQNrLe58rqn0WuINMjC1Z5Xss1nMUkV7LrtocgnSv37c+EbI+X1oGInbPoKB
         h1Wg==
X-Gm-Message-State: AOAM532mEZkHQ3eq7y3mYBV9PlbhLjZblBCd2FQii1u/bOpPvGTyhViW
        Ytq+Ve+yZJ1+b5pQ2cbWGD/bp2MdU5xJjg==
X-Google-Smtp-Source: ABdhPJwA6mqe9tqZgKSMrNyXI501zD/PxzmtBZCceYm1IfTMWIzqfowsMAjPwU9sT7Hd4QEBICC+mw==
X-Received: by 2002:adf:e650:: with SMTP id b16mr2355713wrn.273.1618478877442;
        Thu, 15 Apr 2021 02:27:57 -0700 (PDT)
Received: from arch-thunder.localdomain (a109-49-46-234.cpe.netcabo.pt. [109.49.46.234])
        by smtp.gmail.com with ESMTPSA id l7sm2209804wrb.35.2021.04.15.02.27.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Apr 2021 02:27:57 -0700 (PDT)
Date:   Thu, 15 Apr 2021 10:27:55 +0100
From:   Rui Miguel Silva <rmfrfs@gmail.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, kernel@pengutronix.de,
        Fabio Estevam <festevam@gmail.com>, linux-imx@nxp.com,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Marek Vasut <marex@denx.de>, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 00/23] media: imx: imx7-mipi-csis: Add i.MX8MM support
Message-ID: <20210415092755.oev3s3kzetgap452@arch-thunder.localdomain>
References: <20210413023014.28797-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210413023014.28797-1-laurent.pinchart@ideasonboard.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hey Laurent,
On Tue, Apr 13, 2021 at 05:29:51AM +0300, Laurent Pinchart wrote:
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

Thanks a lot for this series, looks all very good to me.

Will only ask you, as we already talked, to add your name in
the bindings file as maintainer and extend also the MAINTAINERS file
entry with your details.

You have a lot more hw/code working with this driver and also
time/expertise.

It can be in a follow patch no need to spin a new series for this.

For all patches in this series:
Acked-by: Rui Miguel Silva <rmfrfs@gmail.com>

Thanks,
------
Cheers,
     Rui

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
