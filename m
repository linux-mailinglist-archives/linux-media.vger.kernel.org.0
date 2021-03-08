Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1FCCE3315FF
	for <lists+linux-media@lfdr.de>; Mon,  8 Mar 2021 19:27:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231149AbhCHS1U (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 8 Mar 2021 13:27:20 -0500
Received: from mail-io1-f52.google.com ([209.85.166.52]:39907 "EHLO
        mail-io1-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230510AbhCHS04 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 8 Mar 2021 13:26:56 -0500
Received: by mail-io1-f52.google.com with SMTP id o9so11006665iow.6;
        Mon, 08 Mar 2021 10:26:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=QuSkewPTpe0085TNG2W2Oa8CDkZlQPGzs8cqLJpUUBA=;
        b=p00fVvD2anE+xbaLoOkeLi2dATY24Agoyly4vVf4ghi3HDamDjP4rpzaUkXbUW536X
         t60Bsdji9Q9p2d8pgVUi2j011TPAvvWYdr2PTbGUkvoy2tMI9hp0MfHRu4fl5kSAFB3E
         htXAMCoTKEVsFKGe7dLZUiwwiXzUX/Pf3JCL4hZFkxysExpCAK69qouEUAk1IaTF+Wq8
         RdOG489mKRyesbXbLwdWqDlKeJOPA7xiv78T/eGXwbH+I9czGv+Zq09wfzoz8jBUswEa
         pVmBF/xYjK7g9zKYOuuJQ/aVX+AZNYCGgQw4Rm9GiJlc1uq2p1zqTSFbtPnJRrPqOigO
         FA2w==
X-Gm-Message-State: AOAM533Chf5DoIG2VV78xb8eqP2Yv2oidhJl70Hcin4/5qJ6wDCo0LNo
        Ky9mKaLl+BDRubU05ikS9+2GDn96/A==
X-Google-Smtp-Source: ABdhPJzjTtDhSDB3XWXDb5ygvtpGkDlzRkFu6tzU5LP8yUrH3ZVysbAhFaWWZoDnzHDhQvS2pjs7Gw==
X-Received: by 2002:a02:cad9:: with SMTP id f25mr24409763jap.26.1615228015582;
        Mon, 08 Mar 2021 10:26:55 -0800 (PST)
Received: from robh.at.kernel.org ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id h193sm6546637iof.9.2021.03.08.10.26.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Mar 2021 10:26:55 -0800 (PST)
Received: (nullmailer pid 2744943 invoked by uid 1000);
        Mon, 08 Mar 2021 18:26:51 -0000
Date:   Mon, 8 Mar 2021 11:26:51 -0700
From:   Rob Herring <robh@kernel.org>
To:     Benjamin Gaignard <benjamin.gaignard@collabora.com>
Cc:     p.zabel@pengutronix.de, shawnguo@kernel.org,
        s.hauer@pengutronix.de, festevam@gmail.com, ezequiel@collabora.com,
        mchehab@kernel.org, gregkh@linuxfoundation.org,
        kernel@pengutronix.de, linux-imx@nxp.com,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-rockchip@lists.infradead.org, devel@driverdev.osuosl.org,
        kernel@collabora.com
Subject: Re: [PATCH v3 0/5] Reset driver for IMX8MQ VPU hardware block
Message-ID: <20210308182651.GA2741282@robh.at.kernel.org>
References: <20210301151754.104749-1-benjamin.gaignard@collabora.com>
 <20210308182217.GA2735443@robh.at.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210308182217.GA2735443@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Mar 08, 2021 at 11:22:17AM -0700, Rob Herring wrote:
> On Mon, Mar 01, 2021 at 04:17:49PM +0100, Benjamin Gaignard wrote:
> > The two VPUs inside IMX8MQ share the same control block which can be see
> > as a reset hardware block.
> > In order to be able to add the second VPU (for HECV decoding) it will be
> > more handy if the both VPU drivers instance don't have to share the
> > control block registers. This lead to implement it as an independ reset 
> > driver and to change the VPU driver to use it.
> > 
> > Please note that this series break the compatibility between the DTB and
> > kernel. This break is limited to IMX8MQ SoC and is done when the driver
> > is still in staging directory.
> 
> As this information will be lost, please put in the binding and dts 
> patch.

Actually, the adding the VPU reset binding doesn't break compatibility, 
so just the dts file changes needs it.

> 
> > 
> > version 3:
> > - Fix error in VPU example node
> > 
> > version 2:
> > - Document the change in VPU bindings
> >  
> > Benjamin Gaignard (5):
> >   dt-bindings: reset: IMX8MQ VPU reset
> >   dt-bindings: media: IMX8MQ VPU: document reset usage
> >   reset: Add reset driver for IMX8MQ VPU block
> >   media: hantro: Use reset driver
> >   arm64: dts: imx8mq: Use reset driver for VPU hardware block
> > 
> >  .../bindings/media/nxp,imx8mq-vpu.yaml        |  14 +-
> >  .../bindings/reset/fsl,imx8mq-vpu-reset.yaml  |  54 ++++++
> >  arch/arm64/boot/dts/freescale/imx8mq.dtsi     |  31 +++-
> >  drivers/reset/Kconfig                         |   8 +
> >  drivers/reset/Makefile                        |   1 +
> >  drivers/reset/reset-imx8mq-vpu.c              | 169 ++++++++++++++++++
> >  drivers/staging/media/hantro/Kconfig          |   1 +
> >  drivers/staging/media/hantro/imx8m_vpu_hw.c   |  61 ++-----
> >  include/dt-bindings/reset/imx8mq-vpu-reset.h  |  16 ++
> >  9 files changed, 294 insertions(+), 61 deletions(-)
> >  create mode 100644 Documentation/devicetree/bindings/reset/fsl,imx8mq-vpu-reset.yaml
> >  create mode 100644 drivers/reset/reset-imx8mq-vpu.c
> >  create mode 100644 include/dt-bindings/reset/imx8mq-vpu-reset.h
> > 
> > -- 
> > 2.25.1
> > 
