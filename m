Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3B0C549874E
	for <lists+linux-media@lfdr.de>; Mon, 24 Jan 2022 18:55:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244463AbiAXRzV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 24 Jan 2022 12:55:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57916 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244406AbiAXRzU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 24 Jan 2022 12:55:20 -0500
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com [IPv6:2607:f8b0:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07AF6C06173B
        for <linux-media@vger.kernel.org>; Mon, 24 Jan 2022 09:55:20 -0800 (PST)
Received: by mail-ot1-x332.google.com with SMTP id y11-20020a0568302a0b00b0059a54d66106so23343353otu.0
        for <linux-media@vger.kernel.org>; Mon, 24 Jan 2022 09:55:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vanguardiasur-com-ar.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=GxuYWgMXvgJ3X54SfxOrJsc7Ogo3Qmu4UkeyMNZu/+c=;
        b=XdluvKP860FJds3KLljWnBKOOp7eq94xQfPOiT1FMx5tRDmeSSW2Y3wfGCuqjz8H9n
         b69U4aL3g49nP35mpA7mYiEmpGNfvFaG1f4Zq3kv4aXtlmPWr8n8nNmCyecbLJ4Z2bLS
         OuVJ0Z+FTG7whAilwC01dTcrrbwv0RLGO9XoaCk7mA1VtF1FIdhl5qa1r5PIyAjTkWIi
         ZXzT4zkCBHpwp2I2ayDiCTXSJySKoQZybSTF98yYiI/6nb+q7R+97wSyO6KuKuIar1pY
         TSvczejGX2zWf+xrob9DcII3nFllapPrZei2yOL7noXQ+UXFtz+YVUVlzBTA+E4OPYr5
         OPBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=GxuYWgMXvgJ3X54SfxOrJsc7Ogo3Qmu4UkeyMNZu/+c=;
        b=rAQlhlMjcz0DO5M5/tQ3czD0rCHzusoNlFwpJJErUyuWOgRMQVAFuDKBULEv2d6Z7K
         LpCz6aGK1k3Dg8Cj8BCFC0LdRbUOk7LeQOQSYkq8+Qp2r39Pm9Ikw9KEZOp0xqiTNnrG
         vqEuqOiRemjv8Ntqb3mAf1dO+m0XiUwjK5xNgfaSRnTogWJ1an4b9jw1EhtVfOgJ8HDo
         948oyysJPN1MpFjOKk78Qi8bIFBQ9NKS5a/PD3JTMJpgYSQOkCmFT6doa9lnKiDXiUqL
         1F1evc5VJfBK0FdMY4jq5dgF3RxdIKebvFjsUgUbyakFAi/LHvsEqE0gaoBGXaKABqp2
         84Ng==
X-Gm-Message-State: AOAM531KJIjd+yb9iFMX6ZlBZr9V/5JCTSFFBYww3jPRBMuc60zo3q1O
        tKJUvucf5drH1Pt7rw3Lq7GqNCin3B4lOg==
X-Google-Smtp-Source: ABdhPJy3H9al/dcM69Hb7IBK01me3+YrVWP3HT46V4FpINRYz22Z75RWK5JynHegE88nns/HVQStEg==
X-Received: by 2002:a9d:36d:: with SMTP id 100mr7329619otv.240.1643046919156;
        Mon, 24 Jan 2022 09:55:19 -0800 (PST)
Received: from eze-laptop ([190.194.87.200])
        by smtp.gmail.com with ESMTPSA id i81sm3483302oih.22.2022.01.24.09.55.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jan 2022 09:55:17 -0800 (PST)
Date:   Mon, 24 Jan 2022 14:55:12 -0300
From:   Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
To:     kernel test robot <lkp@intel.com>
Cc:     Adam Ford <aford173@gmail.com>, linux-media@vger.kernel.org,
        kbuild-all@lists.01.org, linux-arm-kernel@lists.infradead.org,
        shawnguo@kernel.org, aford@beaconembedded.com,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>
Subject: Re: [PATCH V3 06/10] arm64: dts: imx8mq: Enable both G1 and G2 VPU's
 with vpu-blk-ctrl
Message-ID: <Ye7oACMEBrGm+3E0@eze-laptop>
References: <20220124023125.414794-7-aford173@gmail.com>
 <202201242024.Xqet4cvg-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202201242024.Xqet4cvg-lkp@intel.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Adam,

On Mon, Jan 24, 2022 at 09:08:14PM +0800, kernel test robot wrote:
> Hi Adam,
> 
> Thank you for the patch! Yet something to improve:
> 
> [auto build test ERROR on e783362eb54cd99b2cac8b3a9aeac942e6f6ac07]
> 
> url:    https://github.com/0day-ci/linux/commits/Adam-Ford/media-hantro-imx8mq-imx8mm-Let-VPU-decoders-get-controlled-by-vpu-blk-ctrl/20220124-103340
> base:   e783362eb54cd99b2cac8b3a9aeac942e6f6ac07
> config: arm64-buildonly-randconfig-r001-20220124 (https://download.01.org/0day-ci/archive/20220124/202201242024.Xqet4cvg-lkp@intel.com/config)
> compiler: aarch64-linux-gcc (GCC) 11.2.0
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://github.com/0day-ci/linux/commit/a74e6df1159d70d74f2a6988748f8e9648478d86
>         git remote add linux-review https://github.com/0day-ci/linux
>         git fetch --no-tags linux-review Adam-Ford/media-hantro-imx8mq-imx8mm-Let-VPU-decoders-get-controlled-by-vpu-blk-ctrl/20220124-103340
>         git checkout a74e6df1159d70d74f2a6988748f8e9648478d86
>         # save the config file to linux build tree
>         mkdir build_dir
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.2.0 make.cross O=build_dir ARCH=arm64 SHELL=/bin/bash
> 
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> 
> All errors (new ones prefixed by >>):
> 
> >> Error: arch/arm64/boot/dts/freescale/imx8mq-tqma8mq.dtsi:275.1-5 Label or path vpu not found

Would you mind including a patch that removes the vpu reference from arch/arm64/boot/dts/freescale/imx8mq-tqma8mq.dtsi ?
Namely, removing:

&vpu {
	status = "okay";
};

Memory-to-memory devices are meant to be enabled by default at the top dtsi level.
This will then fix this issue, when you change the node labels to vpu_g1 and
vpu_g2.

Thanks!
Ezequiel

>    FATAL ERROR: Syntax error parsing input tree
> 
> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
