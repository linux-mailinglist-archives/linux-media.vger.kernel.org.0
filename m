Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 56CCC2529E8
	for <lists+linux-media@lfdr.de>; Wed, 26 Aug 2020 11:25:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727966AbgHZJZ2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 26 Aug 2020 05:25:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39578 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727793AbgHZJZ1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 26 Aug 2020 05:25:27 -0400
Received: from mail-ot1-x341.google.com (mail-ot1-x341.google.com [IPv6:2607:f8b0:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 250E4C061574
        for <linux-media@vger.kernel.org>; Wed, 26 Aug 2020 02:25:26 -0700 (PDT)
Received: by mail-ot1-x341.google.com with SMTP id f42so930394otf.13
        for <linux-media@vger.kernel.org>; Wed, 26 Aug 2020 02:25:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lZhkQxNLw77frpz6ZMdHyemforQJCP3lk4DGDC08wQk=;
        b=SQFo15B+++qeSPzHZf2QXnMtumb0EW49HHCk4BopK4PnC5U07MD1/tISq37ka7/WrU
         d0eQqlPHSmALWhupGDYFc80znGHBtRopb7r9iCO41v1ug9FPvzWfeIyaVbj35wY1WXe6
         PcOc3mMXNt1FuByQMrYJh89OMZA1uiRBQRFF0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lZhkQxNLw77frpz6ZMdHyemforQJCP3lk4DGDC08wQk=;
        b=JnKn9hvjk3WqjTX1Mfm7xNLxG7QLM5DGZ+qvLTueAoGfkfkhkan6qUngai9OtXZSu9
         TuHsUQgtwnzMZgvie0F97qt/gTa4k6FfFCJsmNULfznETBs5rUdlqsCUX1mQdQuwc25P
         YYls2FVvtM4J7WwqLQqa1q2kDQQoc2CzQP3tfen0O6XTQdfjJFNNU4dHrcobJwnakMFC
         SXGQtNj+iqNijrHB1WsM052VdYjexFTHjWJUDskYIbPqoNV/sh+BWlXSkz84m82aH88N
         CDWwysdamTtpDSG1hCQQMwFsqCrY9RdajXHLDcUFEYiiKqZHgahHy7sv3M/LTD53vegn
         rlhQ==
X-Gm-Message-State: AOAM532fWdyPHchZCvtSmD9sZaLGI7WUjS8xBbcTIlC6zNhJCwiVkq1X
        eVgPDDPN+LFr7oDJgIxQmSH/bCfkneTyhg==
X-Google-Smtp-Source: ABdhPJyDExPABA0PhW05A8CgZqyU0vKthyny7mxwcgCquq3RXQSwsLmGAE094nMK8JseHLNjQHZu8g==
X-Received: by 2002:a05:6830:1c1:: with SMTP id r1mr10100498ota.100.1598433925629;
        Wed, 26 Aug 2020 02:25:25 -0700 (PDT)
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com. [209.85.167.178])
        by smtp.gmail.com with ESMTPSA id x22sm376344oix.55.2020.08.26.02.25.25
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Aug 2020 02:25:25 -0700 (PDT)
Received: by mail-oi1-f178.google.com with SMTP id 2so932518ois.8
        for <linux-media@vger.kernel.org>; Wed, 26 Aug 2020 02:25:25 -0700 (PDT)
X-Received: by 2002:a05:6808:482:: with SMTP id z2mr3200722oid.94.1598433579877;
 Wed, 26 Aug 2020 02:19:39 -0700 (PDT)
MIME-Version: 1.0
References: <20200821103608.2310097-4-acourbot@chromium.org> <202008212314.jscpXSEF%lkp@intel.com>
In-Reply-To: <202008212314.jscpXSEF%lkp@intel.com>
From:   Alexandre Courbot <acourbot@chromium.org>
Date:   Wed, 26 Aug 2020 18:19:29 +0900
X-Gmail-Original-Message-ID: <CAPBb6MXD1RpGGCOb+7=cUUNOymbtgiDGvG_+S4DtsTU49-ORKA@mail.gmail.com>
Message-ID: <CAPBb6MXD1RpGGCOb+7=cUUNOymbtgiDGvG_+S4DtsTU49-ORKA@mail.gmail.com>
Subject: Re: [PATCH v4 03/17] media: mtk-vcodec: add SCP firmware ops
To:     kernel test robot <lkp@intel.com>
Cc:     Ohad Ben-Cohen <ohad@wizery.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Yunfei Dong <yunfei.dong@mediatek.com>,
        Maoguang Meng <maoguang.meng@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        kbuild-all@lists.01.org,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        devicetree <devicetree@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sat, Aug 22, 2020 at 12:14 AM kernel test robot <lkp@intel.com> wrote:
>
> Hi Alexandre,
>
> Thank you for the patch! Yet something to improve:
>
> [auto build test ERROR on linuxtv-media/master]
> [also build test ERROR on robh/for-next v5.9-rc1 next-20200821]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch]
>
> url:    https://github.com/0day-ci/linux/commits/Alexandre-Courbot/media-mtk-vcodec-venc-support-for-MT8183/20200821-184118
> base:   git://linuxtv.org/media_tree.git master
> config: sh-allmodconfig (attached as .config)
> compiler: sh4-linux-gcc (GCC) 9.3.0
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # save the attached .config to linux build tree
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-9.3.0 make.cross ARCH=sh
>
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
>
> All errors (new ones prefixed by >>, old ones prefixed by <<):
>
> >> ERROR: modpost: "scp_get_venc_hw_capa" [drivers/media/platform/mtk-vcodec/mtk-vcodec-common.ko] undefined!
> >> ERROR: modpost: "scp_ipi_send" [drivers/media/platform/mtk-vcodec/mtk-vcodec-common.ko] undefined!
> >> ERROR: modpost: "scp_put" [drivers/media/platform/mtk-vcodec/mtk-vcodec-common.ko] undefined!
> >> ERROR: modpost: "scp_get" [drivers/media/platform/mtk-vcodec/mtk-vcodec-common.ko] undefined!
> >> ERROR: modpost: "scp_get_vdec_hw_capa" [drivers/media/platform/mtk-vcodec/mtk-vcodec-common.ko] undefined!
> >> ERROR: modpost: "scp_ipi_register" [drivers/media/platform/mtk-vcodec/mtk-vcodec-common.ko] undefined!
> >> ERROR: modpost: "scp_mapping_dm_addr" [drivers/media/platform/mtk-vcodec/mtk-vcodec-common.ko] undefined!
> >> ERROR: modpost: "scp_get_rproc" [drivers/media/platform/mtk-vcodec/mtk-vcodec-common.ko] undefined!
> >> ERROR: modpost: "rproc_boot" [drivers/media/platform/mtk-vcodec/mtk-vcodec-common.ko] undefined!
> ERROR: modpost: "__delay" [drivers/net/phy/mdio-cavium.ko] undefined!

This issue should be fixed by the following patch, sent to the
remoteproc tree:

https://lkml.org/lkml/2020/8/21/489
