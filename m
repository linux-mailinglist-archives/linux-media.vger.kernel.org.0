Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A3E453829B2
	for <lists+linux-media@lfdr.de>; Mon, 17 May 2021 12:20:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236249AbhEQKWH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 17 May 2021 06:22:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230248AbhEQKWG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 17 May 2021 06:22:06 -0400
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 915B3C061573;
        Mon, 17 May 2021 03:20:50 -0700 (PDT)
Received: by mail-wr1-x429.google.com with SMTP id n2so5844026wrm.0;
        Mon, 17 May 2021 03:20:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:content-transfer-encoding:date:message-id:cc:subject
         :from:to:references:in-reply-to;
        bh=p5B0LfPWxukMwc2CWTpCHetVCW9lclGiGdiXVNhvVxQ=;
        b=UXI3dPpznRJ7eMcG4L0qr8aRXYY08vnQk7O02lg//IekINR/WJQneiKMUptqAes8bC
         jK6BOd8nUAUKPboX2l6SlFJIbA8q8JaV2/I/3UIAEpowd++Va9hVmWyWG5eihiXLmPp1
         JG5g+BDFv2Q1w/fb6hCDkzFGqezLzuvKbeRCYfuPNBRzrqFdxIA71o0/ymIHc0+Gd1EQ
         xKaqjXINsJZq7dcks4Lsujq/CHNzteeaMxA7BgqqblaOi3hzwQddeZg9+IEshszSrLps
         nyDM2p8+MeHPMZnqqP+Dcjq/tvfXd7CbpElemG4o78ekcLuv5SiBRRddfUnsVmO1w1D1
         1ZJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding:date
         :message-id:cc:subject:from:to:references:in-reply-to;
        bh=p5B0LfPWxukMwc2CWTpCHetVCW9lclGiGdiXVNhvVxQ=;
        b=RdJn/N3guPG0LYCqTOC7RgOmBATxPFqucJLqaHXCA1FCwqGdtzvqioAgNZz5bo7fqc
         YPidXvFsFcl9bBWTuo/pS0txtgYz/qKcIkmtbtdYM1GEdyNaLa21nc4/WP7hPEoZO0wt
         rABqEaHlE2OFPdrGi7SEXbjAVABYaKcRUOlbMNIPSnBcFYS1HLFnwLJXbqW0lLPd3Act
         7EwJrjgzJfNcC/UaZY/tkZxErEMX5USQpsSUA7OEZlTVEjmA8Uu7z4b3AsbWBKXYZauS
         /MZobGgdRG+LRBFIXCMqWMhaSNaZ4FettvDHKKOOcgAb73V5w9t4bgUcWfA8xwaSbFw3
         aiLA==
X-Gm-Message-State: AOAM532bULcRgg3dyrDRUh8/85gUATbnn3rVyNWiqalmCNHPKygkuXha
        EMnMnIFZO3PXVeNH/Qk9YLQ=
X-Google-Smtp-Source: ABdhPJypNrPG7VMem7/+BkEvqjU3vFa7r9JPQ9iWNu97p0dQiSAkeTuDDcyZayoiVaU3CMRMFJrcDQ==
X-Received: by 2002:a05:6000:1c1:: with SMTP id t1mr72596535wrx.421.1621246849174;
        Mon, 17 May 2021 03:20:49 -0700 (PDT)
Received: from localhost (a109-49-46-234.cpe.netcabo.pt. [109.49.46.234])
        by smtp.gmail.com with ESMTPSA id g5sm4132675wmi.8.2021.05.17.03.20.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 May 2021 03:20:48 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date:   Mon, 17 May 2021 11:20:48 +0100
Message-Id: <CBFG1K0T4F4N.2TVMNM7DIWEVZ@arch-thunder>
Cc:     <kernel@pengutronix.de>, "Fabio Estevam" <festevam@gmail.com>,
        <linux-imx@nxp.com>, "Steve Longerbeam" <slongerbeam@gmail.com>,
        "Philipp Zabel" <p.zabel@pengutronix.de>,
        "Marek Vasut" <marex@denx.de>,
        "Marco Felsch" <m.felsch@pengutronix.de>,
        "Martin Kepplinger" <martin.kepplinger@puri.sm>,
        "Dorota Czaplejewicz" <dorota.czaplejewicz@puri.sm>,
        "Rob Herring" <robh+dt@kernel.org>, <devicetree@vger.kernel.org>
Subject: Re: [RFC PATCH 0/3] media: imx: imx7-media-csi: i.MX8MM support
From:   "Rui Miguel Silva" <rmfrfs@gmail.com>
To:     "Laurent Pinchart" <laurent.pinchart@ideasonboard.com>,
        <linux-media@vger.kernel.org>
References: <20210516024216.4576-1-laurent.pinchart@ideasonboard.com>
In-Reply-To: <20210516024216.4576-1-laurent.pinchart@ideasonboard.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,
Thanks for extending support for imx8.

On Sun May 16, 2021 at 3:42 AM WEST, Laurent Pinchart wrote:
> Hello,
>
> This small patch series updates the imx7-media-csi driver to work on the
> i.MX8MM with an OV5640 sensor.
>
> Patch 1/3 extends the nxp,imx7-csi DT bindings with a compatible string
> for the i.MX8MM. While the CSI bridge in that SoC doesn't seem to differ
> from the one in the i.MX7 according to the reference manual, experience
> shows that NXP reference manuals are not always reliable. To be on the
> safe side, a new fsl,imx8mm-csi compatible string, with a fallback on
> fsl,imx7-csi, will avoid future backward-compatibility problems.
>
> Patches 2/3 and 3/3 fix issues with RAW8 and RAW10 capture from an
> OV5640 sensor. The fixes are the result of experimentation and study of
> NXP BSP drivers, as the reference manual doesn't provide much
> information in this area. I'm not very happy with this, as understanding
> the exact effect of the register fields modified by those two patches
> would be better. Still, without support from NXP (which I would really,
> really appreciate - anyone from NXP reading this ?), I can't do better.
>
> Given those concerns, I would also appreciate if this series could be
> tested widely for possible regressions. There should be no change for
> YUV formats, so only raw formats (RAW8, RAW10, RAW12 and RAW14) need to
> be tested.

I've tested with my setup in imx7 which is RAW10 only, and everything
looks fine.

I only have a small suggestion in 2/3.

------
Cheers,
     Rui

>
> Laurent Pinchart (3):
>   dt-bindings: media: nxp,imx7-csi: Add i.MX8MM support
>   media: imx: imx7-media-csi: Set TWO_8BIT_SENSOR for >=3D 10-bit formats
>   media: imx: imx7-media-csi: Don't set PIXEL_BIT in CSICR1
>
>  .../bindings/media/nxp,imx7-csi.yaml          | 12 +++++++----
>  drivers/staging/media/imx/imx7-media-csi.c    | 21 +++++--------------
>  2 files changed, 13 insertions(+), 20 deletions(-)
>
> --=20
> Regards,
>
> Laurent Pinchart



