Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 901D973FBE4
	for <lists+linux-media@lfdr.de>; Tue, 27 Jun 2023 14:20:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230138AbjF0MUw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Jun 2023 08:20:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40228 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229790AbjF0MUv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Jun 2023 08:20:51 -0400
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50D981BE9;
        Tue, 27 Jun 2023 05:20:49 -0700 (PDT)
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-51cb40f13f6so5063392a12.2;
        Tue, 27 Jun 2023 05:20:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687868448; x=1690460448;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RLhIp/pKblYCq8Z/0RSAslFybt/LfZcoIPvdcGDoMpk=;
        b=flbm6TRoDVojlqN7l0s6LEYFKmxnei69l4l8GSC9Pq97k0ZQAb6WhFck8Xgl444r5W
         wyASCFd7fTNqKp/nDo2UARFPSa6yhyIvxzsD7VXMnfWtblSVUoZ3xDRmgHqS/pyTbeR+
         +Ki1QqZm8V68HkYZLSVMOEHaFN0QfX60EMMI6OaoFWON7eIO3i0uzXRm4t60vEeDNFNo
         4vD0ddBrfd0BhRMHRAHwFh7kaX9PVeSPpiyiLBD6LP/ip+62XkD0sEuFgdPEubktZPBn
         o7T02wfZH9oksc2h3afugrvFP9S/M2tKk4z+v2DSAoSA7mKPsLmzCh6Sisq7WXAd9Qs4
         mHPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687868448; x=1690460448;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RLhIp/pKblYCq8Z/0RSAslFybt/LfZcoIPvdcGDoMpk=;
        b=Dn20t7P1Za0LU83Y2fXnrqyBsjWjRv7132tIwYx+L2Ll7u4WVsd8eVas2P95bFSMzt
         JIN8sWyNqeL8jYEvS0pacnWIoSbuYimGKlVHCstvYz3i1a6ngpODzvO4khx+jjKRKYws
         0UBXqd5v/toEfw6yjpCU9U6FlwfSR6e+l/vIdKJwLjbdk/3p88WQAoZ5jEZKwLvuiCuz
         9Grs/bymvGBLd6ZeQYWmFAZyZNkv7qX/CrU5FxWLnViZ5QWeEKh5CfFPAc3T+JgWePUe
         T/VPZTFknxhqvEKlq0b3fe3j5Lec4fjgPuf1BkD9iEM6EgnFxddI/jioXy8Zcy0bz3aM
         8tfQ==
X-Gm-Message-State: AC+VfDww2QoC6UfuAG1uLqvJKLj3+qTOiNg5tOgW0fKHGuI3gci7UQps
        WtE4BV8faVmPw1bcLvdj8bs=
X-Google-Smtp-Source: ACHHUZ45BZed4mOgnT5dQMTL1q6n+B53W0ug6v4wsgkPi7kSuc99I6BO9tsvGSx+y2bzhFjEZrhrwg==
X-Received: by 2002:aa7:c558:0:b0:51d:955f:9e17 with SMTP id s24-20020aa7c558000000b0051d955f9e17mr5048296edr.16.1687868447446;
        Tue, 27 Jun 2023 05:20:47 -0700 (PDT)
Received: from tom-HP-ZBook-Fury-15-G7-Mobile-Workstation ([193.85.242.128])
        by smtp.gmail.com with ESMTPSA id s19-20020a056402165300b0051d9df5dd2fsm1621138edx.72.2023.06.27.05.20.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jun 2023 05:20:46 -0700 (PDT)
Date:   Tue, 27 Jun 2023 14:20:45 +0200
From:   Tommaso Merciai <tomm.merciai@gmail.com>
To:     "G.N. Zhou (OSS)" <guoniu.zhou@oss.nxp.com>
Cc:     "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "laurent.pinchart@ideasonboard.com" 
        <laurent.pinchart@ideasonboard.com>,
        "mchehab@kernel.org" <mchehab@kernel.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "krzysztof.kozlowski+dt@linaro.org" 
        <krzysztof.kozlowski+dt@linaro.org>,
        "conor+dt@kernel.org" <conor+dt@kernel.org>,
        "Xavier Roumegue (OSS)" <xavier.roumegue@oss.nxp.com>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "jacopo.mondi@ideasonboard.com" <jacopo.mondi@ideasonboard.com>,
        "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>
Subject: Re: [PATCH v2 2/2] media: nxp: imx-isi: add ISI support for i.MX93
Message-ID: <ZJrUHUucp2lRZ7Rv@tom-HP-ZBook-Fury-15-G7-Mobile-Workstation>
References: <20230626032735.49500-1-guoniu.zhou@oss.nxp.com>
 <20230626032735.49500-3-guoniu.zhou@oss.nxp.com>
 <ZJqdGeMCMzWJcQv/@tom-HP-ZBook-Fury-15-G7-Mobile-Workstation>
 <AS8PR04MB9080A3CB605161966A7898B0FA27A@AS8PR04MB9080.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <AS8PR04MB9080A3CB605161966A7898B0FA27A@AS8PR04MB9080.eurprd04.prod.outlook.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Guoniu,

On Tue, Jun 27, 2023 at 08:39:37AM +0000, G.N. Zhou (OSS) wrote:
> Hi Tommaso,
> 
> Thanks for your comments. I have updated version 3 and your comments have been handled in the new version patches

Thanks for let me know.
I'll check v3 :)

Regards,
Tommaso


> 
> > -----Original Message-----
> > From: Tommaso Merciai <tomm.merciai@gmail.com>
> > Sent: 2023年6月27日 16:26
> > To: G.N. Zhou (OSS) <guoniu.zhou@oss.nxp.com>
> > Cc: linux-media@vger.kernel.org; dl-linux-imx <linux-imx@nxp.com>;
> > devicetree@vger.kernel.org; laurent.pinchart@ideasonboard.com;
> > mchehab@kernel.org; robh+dt@kernel.org; krzysztof.kozlowski+dt@linaro.org;
> > conor+dt@kernel.org; Xavier Roumegue (OSS)
> > <xavier.roumegue@oss.nxp.com>; kernel@pengutronix.de;
> > jacopo.mondi@ideasonboard.com; sakari.ailus@linux.intel.com
> > Subject: Re: [PATCH v2 2/2] media: nxp: imx-isi: add ISI support for i.MX93
> > 
> > Caution: This is an external email. Please take care when clicking links or opening
> > attachments. When in doubt, report the message using the 'Report this email'
> > button
> > 
> > 
> > Hi Guoniu,
> > 
> > On Mon, Jun 26, 2023 at 11:27:35AM +0800, guoniu.zhou@oss.nxp.com wrote:
> > > From: "Guoniu.zhou" <guoniu.zhou@nxp.com>
> > >
> > > Abstract gasket operation and driver should implement them for SoC
> > > which support gasket.
> > >
> > > i.MX93 use a different gasket which has different register definition
> > > compared with i.MX8. Hence implement the gasket callbacks in order to
> > > add ISI support for i.MX93.
> > >
> > > Signed-off-by: Guoniu.zhou <guoniu.zhou@nxp.com>
> > > ---
> > >  .../platform/nxp/imx8-isi/imx8-isi-core.c     | 110 ++++++++++++++++++
> > >  .../platform/nxp/imx8-isi/imx8-isi-core.h     |  33 ++++++
> > >  .../platform/nxp/imx8-isi/imx8-isi-crossbar.c |  51 ++++----
> > >  3 files changed, 169 insertions(+), 25 deletions(-)
> > >
> > > diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> > > b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> > > index 253e77189b69..d37145fb7f14 100644
> > > --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> > > +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> > > @@ -14,6 +14,7 @@
> > >  #include <linux/pm.h>
> > >  #include <linux/pm_runtime.h>
> > >  #include <linux/property.h>
> > > +#include <linux/regmap.h>
> > >  #include <linux/slab.h>
> > >  #include <linux/string.h>
> > >  #include <linux/types.h>
> > > @@ -279,6 +280,54 @@ static const struct clk_bulk_data mxc_imx8mn_clks[]
> > = {
> > >       { .id = "apb" },
> > >  };
> > >
> > > +static int mxc_imx8_gasket_config(struct mxc_isi_dev *isi,
> > > +                               const struct v4l2_mbus_frame_desc *fd,
> > > +                               const struct v4l2_mbus_framefmt *fmt,
> > > +                               const unsigned int port) {
> > > +     u32 val;
> > > +
> > > +     regmap_write(isi->gasket, GASKET_BASE(port) + GASKET_HSIZE,
> > fmt->width);
> > > +     regmap_write(isi->gasket, GASKET_BASE(port) + GASKET_VSIZE,
> > > + fmt->height);
> > > +
> > > +     val = GASKET_CTRL_DATA_TYPE(fd->entry[0].bus.csi2.dt);
> > > +     if (fd->entry[0].bus.csi2.dt == MIPI_CSI2_DT_YUV422_8B)
> > > +             val |= GASKET_CTRL_DUAL_COMP_ENABLE;
> > > +
> > > +     regmap_write(isi->gasket, GASKET_BASE(port) + GASKET_CTRL, val);
> > > +
> > > +     dev_dbg(isi->dev, "w/h=(%d, %d), data type=0x%x\n",
> > > +                       fmt->width, fmt->height,
> > > +                       fd->entry[0].bus.csi2.dt);
> > 
> > Receive warning from checkpatch.pl:
> 
> Drop the debug message in v3
> 
> > 
> > CHECK: Alignment should match open parenthesis
> > #49: FILE: drivers/media/platform/nx
> p/imx8-isi/imx8-isi-core.c:300:
> > +       dev_dbg(isi->dev, "w/h=(%d, %d), data type=0x%x\n",
> > +                         fmt->width, fmt->height,
> > 
> > > +
> > > +     return 0;
> > > +}
> > > +
> > > +static int mxc_imx8_gasket_enable(struct mxc_isi_dev *isi,
> > > +                               const unsigned int port) {
> > > +     u32 val;
> > > +
> > > +     regmap_read(isi->gasket, GASKET_BASE(port), &val);
> > > +     val |= GASKET_CTRL_ENABLE;
> > > +
> > > +     regmap_write(isi->gasket, GASKET_BASE(port) + GASKET_CTRL, val);
> > > +
> > > +     return 0;
> > > +}
> > > +
> > > +static void mxc_imx8_gasket_disable(struct mxc_isi_dev *isi,
> > > +                                 const unsigned int port) {
> > > +     regmap_write(isi->gasket, GASKET_BASE(port) + GASKET_CTRL, 0); }
> > > +
> > > +static const struct mxc_gasket_ops mxc_imx8_gasket_ops = {
> > > +     .config = mxc_imx8_gasket_config,
> > > +     .enable = mxc_imx8_gasket_enable,
> > > +     .disable = mxc_imx8_gasket_disable, };
> > > +
> > >  static const struct mxc_isi_plat_data mxc_imx8mn_data = {
> > >       .model                  = MXC_ISI_IMX8MN,
> > >       .num_ports              = 1,
> > > @@ -290,6 +339,7 @@ static const struct mxc_isi_plat_data
> > mxc_imx8mn_data = {
> > >       .num_clks               = ARRAY_SIZE(mxc_imx8mn_clks),
> > >       .buf_active_reverse     = false,
> > >       .has_gasket             = true,
> > > +     .gasket_ops             = &mxc_imx8_gasket_ops,
> > >       .has_36bit_dma          = false,
> > >  };
> > >
> > > @@ -304,6 +354,65 @@ static const struct mxc_isi_plat_data
> > mxc_imx8mp_data = {
> > >       .num_clks               = ARRAY_SIZE(mxc_imx8mn_clks),
> > >       .buf_active_reverse     = true,
> > >       .has_gasket             = true,
> > > +     .gasket_ops             = &mxc_imx8_gasket_ops,
> > > +     .has_36bit_dma          = true,
> > > +};
> > > +
> > > +static int mxc_imx93_gasket_config(struct mxc_isi_dev *isi,
> > > +                                const struct v4l2_mbus_frame_desc
> > *fd,
> > > +                                const struct v4l2_mbus_framefmt
> > *fmt,
> > > +                                const unsigned int port) {
> > > +     u32 val;
> > > +
> > > +     val = DISP_MIX_CAMERA_MUX_DATA_TYPE(fd->entry[0].bus.csi2.dt);
> > > +     regmap_write(isi->gasket, DISP_MIX_CAMERA_MUX, val);
> > > +
> > > +     dev_dbg(isi->dev, "data type=0x%x\n", fd->entry[0].bus.csi2.dt);
> > > +
> > > +     return 0;
> > > +}
> > > +
> > > +static int mxc_imx93_gasket_enable(struct mxc_isi_dev *isi,
> > > +                                const unsigned int port) {
> > > +     u32 val;
> > > +
> > > +     regmap_read(isi->gasket, DISP_MIX_CAMERA_MUX, &val);
> > > +     val |= DISP_MIX_CAMERA_MUX_GASKET_ENABLE;
> > > +     regmap_write(isi->gasket, DISP_MIX_CAMERA_MUX, val);
> > > +
> > > +     return 0;
> > > +}
> > > +
> > > +static void mxc_imx93_gasket_disable(struct mxc_isi_dev *isi,
> > > +                                  unsigned int port) {
> > > +     u32 val;
> > > +
> > > +     regmap_read(isi->gasket, DISP_MIX_CAMERA_MUX, &val);
> > > +     val &= ~DISP_MIX_CAMERA_MUX_GASKET_ENABLE;
> > > +     regmap_write(isi->gasket, DISP_MIX_CAMERA_MUX, val); }
> > > +
> > > +static const struct mxc_gasket_ops mxc_imx93_gasket_ops = {
> > > +     .config = mxc_imx93_gasket_config,
> > > +     .enable = mxc_imx93_gasket_enable,
> > > +     .disable = mxc_imx93_gasket_disable, };
> > > +
> > > +static const struct mxc_isi_plat_data mxc_imx93_data = {
> > > +     .model                  = MXC_ISI_IMX93,
> > > +     .num_ports              = 1,
> > > +     .num_channels           = 1,
> > > +     .reg_offset             = 0,
> > > +     .ier_reg                = &mxc_imx8_isi_ier_v2,
> > > +     .set_thd                = &mxc_imx8_isi_thd_v1,
> > > +     .clks                   = mxc_imx8mn_clks,
> > > +     .num_clks               = ARRAY_SIZE(mxc_imx8mn_clks),
> > > +     .buf_active_reverse     = true,
> > > +     .has_gasket             = true,
> > > +     .gasket_ops             = &mxc_imx93_gasket_ops,
> > >       .has_36bit_dma          = true,
> > >  };
> > >
> > > @@ -518,6 +627,7 @@ static int mxc_isi_remove(struct platform_device
> > > *pdev)  static const struct of_device_id mxc_isi_of_match[] = {
> > >       { .compatible = "fsl,imx8mn-isi", .data = &mxc_imx8mn_data },
> > >       { .compatible = "fsl,imx8mp-isi", .data = &mxc_imx8mp_data },
> > > +     { .compatible = "fsl,imx93-isi", .data = &mxc_imx93_data },
> > >       { /* sentinel */ },
> > >  };
> > >  MODULE_DEVICE_TABLE(of, mxc_isi_of_match); diff --git
> > > a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
> > > b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
> > > index e469788a9e6c..c425edb6fbea 100644
> > > --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
> > > +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
> > > @@ -18,6 +18,7 @@
> > >
> > >  #include <media/media-device.h>
> > >  #include <media/media-entity.h>
> > > +#include <media/mipi-csi2.h>
> > >  #include <media/v4l2-async.h>
> > >  #include <media/v4l2-ctrls.h>
> > >  #include <media/v4l2-dev.h>
> > > @@ -59,6 +60,27 @@ struct v4l2_m2m_dev;
> > >  #define MXC_ISI_M2M                  "mxc-isi-m2m"
> > >  #define MXC_MAX_PLANES                       3
> > >
> > > +/* GASKET (i.MX8MN and i.MX8MP only) */
> > > +#define GASKET_BASE(n)                               (0x0060 + (n) *
> > 0x30)
> > > +
> > > +#define GASKET_CTRL                          0x0000
> > > +#define GASKET_CTRL_DATA_TYPE(dt)            ((dt) << 8)
> > > +#define GASKET_CTRL_DATA_TYPE_MASK           (0x3f << 8)
> > > +#define GASKET_CTRL_DUAL_COMP_ENABLE         BIT(1)
> > > +#define GASKET_CTRL_ENABLE                   BIT(0)
> > > +
> > > +#define GASKET_HSIZE                         0x0004
> > > +#define GASKET_VSIZE                         0x0008
> > > +
> > > +/* dispmix_GPR register (i.MX93 only) */
> > > +#define DISP_MIX_CAMERA_MUX                     0x30
> > > +#define DISP_MIX_CAMERA_MUX_DATA_TYPE(x)        (((x) & 0x3f) << 3)
> > > +#define DISP_MIX_CAMERA_MUX_GASKET_ENABLE       BIT(16)
> > > +
> > > +#define DISP_MIX_CSI_REG                        0x48
> > > +#define DISP_MIX_CSI_REG_CFGFREQRANGE(x)        ((x)  & 0x3f)
> > > +#define DISP_MIX_CSI_REG_HSFREQRANGE(x)         (((x) & 0x7f) << 8)
> > > +
> > 
> > ^Can you use tabs instead of space here?
> 
> Done in v3
> 
> > 
> > 
> > >  struct mxc_isi_dev;
> > >  struct mxc_isi_m2m_ctx;
> > >
> > > @@ -147,9 +169,19 @@ struct mxc_isi_set_thd {
> > >       struct mxc_isi_panic_thd panic_set_thd_v;  };
> > >
> > > +struct mxc_gasket_ops {
> > > +     int (*enable)(struct mxc_isi_dev *isi, const unsigned int port);
> > > +     int (*config)(struct mxc_isi_dev *isi,
> > > +                   const struct v4l2_mbus_frame_desc *fd,
> > > +                   const struct v4l2_mbus_framefmt *fmt,
> > > +                   const unsigned int port);
> > > +     void (*disable)(struct mxc_isi_dev *isi, const unsigned int
> > > +port); };
> > > +
> > >  enum model {
> > >       MXC_ISI_IMX8MN,
> > >       MXC_ISI_IMX8MP,
> > > +     MXC_ISI_IMX93,
> > >  };
> > >
> > >  struct mxc_isi_plat_data {
> > > @@ -160,6 +192,7 @@ struct mxc_isi_plat_data {
> > >       const struct mxc_isi_ier_reg  *ier_reg;
> > >       const struct mxc_isi_set_thd *set_thd;
> > >       const struct clk_bulk_data *clks;
> > > +     const struct mxc_gasket_ops *gasket_ops;
> > >       unsigned int num_clks;
> > >       bool buf_active_reverse;
> > >       bool has_gasket;
> > > diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
> > > b/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
> > > index f7447b2f4d77..855b31e3dade 100644
> > > --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
> > > +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
> > > @@ -25,20 +25,6 @@ static inline struct mxc_isi_crossbar
> > *to_isi_crossbar(struct v4l2_subdev *sd)
> > >       return container_of(sd, struct mxc_isi_crossbar, sd);  }
> > >
> > > -/*
> > > ----------------------------------------------------------------------
> > > -------
> > > - * Media block control (i.MX8MN and i.MX8MP only)
> > > - */
> > > -#define GASKET_BASE(n)                               (0x0060 + (n) *
> > 0x30)
> > > -
> > > -#define GASKET_CTRL                          0x0000
> > > -#define GASKET_CTRL_DATA_TYPE(dt)            ((dt) << 8)
> > > -#define GASKET_CTRL_DATA_TYPE_MASK           (0x3f << 8)
> > > -#define GASKET_CTRL_DUAL_COMP_ENABLE         BIT(1)
> > > -#define GASKET_CTRL_ENABLE                   BIT(0)
> > > -
> > > -#define GASKET_HSIZE                         0x0004
> > > -#define GASKET_VSIZE                         0x0008
> > > -
> > >  static int mxc_isi_crossbar_gasket_enable(struct mxc_isi_crossbar *xbar,
> > >                                         struct v4l2_subdev_state
> > *state,
> > >                                         struct v4l2_subdev
> > *remote_sd,
> > > @@ -46,13 +32,16 @@ static int mxc_isi_crossbar_gasket_enable(struct
> > > mxc_isi_crossbar *xbar,  {
> > >       struct mxc_isi_dev *isi = xbar->isi;
> > >       const struct v4l2_mbus_framefmt *fmt;
> > > +     const struct mxc_gasket_ops *gasket_ops = NULL;
> > >       struct v4l2_mbus_frame_desc fd;
> > > -     u32 val;
> > >       int ret;
> > >
> > >       if (!isi->pdata->has_gasket)
> > >               return 0;
> > >
> > > +     if (isi->pdata->gasket_ops)
> > > +             gasket_ops = isi->pdata->gasket_ops;
> > > +
> > >       /*
> > >        * Configure and enable the gasket with the frame size and CSI-2 data
> > >        * type. For YUV422 8-bit, enable dual component mode
> > > unconditionally, @@ -77,16 +66,23 @@ static int
> > mxc_isi_crossbar_gasket_enable(struct mxc_isi_crossbar *xbar,
> > >       if (!fmt)
> > >               return -EINVAL;
> > >
> > > -     regmap_write(isi->gasket, GASKET_BASE(port) + GASKET_HSIZE,
> > fmt->width);
> > > -     regmap_write(isi->gasket, GASKET_BASE(port) + GASKET_VSIZE,
> > fmt->height);
> > > -
> > > -     val = GASKET_CTRL_DATA_TYPE(fd.entry[0].bus.csi2.dt)
> > > -         | GASKET_CTRL_ENABLE;
> > > -
> > > -     if (fd.entry[0].bus.csi2.dt == MIPI_CSI2_DT_YUV422_8B)
> > > -             val |= GASKET_CTRL_DUAL_COMP_ENABLE;
> > > +     if (gasket_ops && gasket_ops->config) {
> > > +             ret = gasket_ops->config(isi, &fd, fmt, port);
> > > +             if (ret) {
> > > +                     dev_err(isi->dev,
> > > +                             "failed to configure gasket%d\n", port);
> > 
> > What about keep this print on the same line?
> 
> Ok, I will update when handle comments in v3 if have. If no, I will send a new version if it's necessary.
> 
> > 
> > > +                     return ret;
> > > +             }
> > > +     }
> > >
> > > -     regmap_write(isi->gasket, GASKET_BASE(port) + GASKET_CTRL, val);
> > > +     if (gasket_ops && gasket_ops->enable) {
> > > +             ret = gasket_ops->enable(isi, port);
> > > +             if (ret) {
> > > +                     dev_err(isi->dev,
> > > +                             "failed to enable gasket%d\n", port);
> > 
> > Same here :)
> > 
> > > +                     return ret;
> > > +             }
> > > +     }
> > >
> > >       return 0;
> > >  }
> > > @@ -95,11 +91,16 @@ static void mxc_isi_crossbar_gasket_disable(struct
> > mxc_isi_crossbar *xbar,
> > >                                           unsigned int port)  {
> > >       struct mxc_isi_dev *isi = xbar->isi;
> > > +     const struct mxc_gasket_ops *gasket_ops = NULL;
> > >
> > >       if (!isi->pdata->has_gasket)
> > >               return;
> > >
> > > -     regmap_write(isi->gasket, GASKET_BASE(port) + GASKET_CTRL, 0);
> > > +     if (isi->pdata->gasket_ops)
> > > +             gasket_ops = isi->pdata->gasket_ops;
> > > +
> > > +     if (gasket_ops && gasket_ops->disable)
> > > +             gasket_ops->disable(isi, port);
> > >  }
> > 
> > 
> > Thanks & Regards,
> > Tommaso
> > 
> > >
> > >  /* -----------------------------------------------------------------------------
> > > --
> > > 2.37.1
> > >
