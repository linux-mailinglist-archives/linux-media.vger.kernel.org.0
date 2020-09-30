Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 46E8327DE87
	for <lists+linux-media@lfdr.de>; Wed, 30 Sep 2020 04:30:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729479AbgI3Cai (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 29 Sep 2020 22:30:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729446AbgI3Cai (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 29 Sep 2020 22:30:38 -0400
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com [IPv6:2607:f8b0:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5EDDCC061755
        for <linux-media@vger.kernel.org>; Tue, 29 Sep 2020 19:30:38 -0700 (PDT)
Received: by mail-ot1-x344.google.com with SMTP id g96so324379otb.12
        for <linux-media@vger.kernel.org>; Tue, 29 Sep 2020 19:30:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1f/lrbb0HiYkHi8IO+r7Yj/jbR4AZoTh3kuVWlwjRLg=;
        b=PRc/j7zuLASTVqZ9PBBa4xpaobg0IvqdGlFtfonYPDGgC6pp6w4iRFNZnAH3jrDv1R
         HyDh6O65Nj9KZmBVQCnCz8/sgxBsrj0tLM2/ccipneFCNRDyFReU2p8XlXSgOqPQgHV9
         9VbwlY/UMNHsRn++hIp1QpnnrsQmACWwmGGkY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1f/lrbb0HiYkHi8IO+r7Yj/jbR4AZoTh3kuVWlwjRLg=;
        b=PVEZ4PpRen4AXJjEiJwuaOgHLLLUJnRiTBWsBSm+8zV/nnsax9RmjYtb8C6np1/pvB
         0BXM4zoieu4t9KE20p65z7f49xrXUMW+chvPoziU31jm9AvAX1HBGCHtNvuuKW+Q+RvD
         d/fRT1z0byylgC0pVI7sjXmL10WvGWp/btG97c0BlJxyOUAqNZCxZKezL0N7EtR5j+bN
         i/whkWh6Py38Kia7eWjZL+Xr+24Y/8uhxnxPAjN7IbmVs6Vxj2Kev3hHZZPtboV0Of0j
         Wuo/43OoPeDtP8POl4yTih4LDc5dm+eGehKRU8lC3IPEB6uZwvn4J9UCIVsNMm08TOjO
         DxtA==
X-Gm-Message-State: AOAM530LadVrNlsjHZMJ2vNn9YhKkL+d0wWXFjyd+Lhj+Rg7ZT9cc8Cy
        FI2+f30eBYlhJ5+Xmsr0FncPR2RLjeRQlA==
X-Google-Smtp-Source: ABdhPJz62iq6vYGHWouu9sfe9ybAcESJgrmnz1ALHgWO6kOXsb8biMcJAR98QtF2OnqCPUckIdMRmQ==
X-Received: by 2002:a9d:27a2:: with SMTP id c31mr127402otb.293.1601433037293;
        Tue, 29 Sep 2020 19:30:37 -0700 (PDT)
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com. [209.85.210.41])
        by smtp.gmail.com with ESMTPSA id j26sm39764oor.21.2020.09.29.19.30.36
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Sep 2020 19:30:36 -0700 (PDT)
Received: by mail-ot1-f41.google.com with SMTP id n61so332437ota.10
        for <linux-media@vger.kernel.org>; Tue, 29 Sep 2020 19:30:36 -0700 (PDT)
X-Received: by 2002:a05:6830:196:: with SMTP id q22mr125702ota.97.1601433035654;
 Tue, 29 Sep 2020 19:30:35 -0700 (PDT)
MIME-Version: 1.0
References: <202009301034.ZZqt249q-lkp@intel.com>
In-Reply-To: <202009301034.ZZqt249q-lkp@intel.com>
From:   Alexandre Courbot <acourbot@chromium.org>
Date:   Wed, 30 Sep 2020 11:30:24 +0900
X-Gmail-Original-Message-ID: <CAPBb6MUw9PTCpj-5txqUZHHDKBNnfGEJ_x9HnSvSBKstSabB4w@mail.gmail.com>
Message-ID: <CAPBb6MUw9PTCpj-5txqUZHHDKBNnfGEJ_x9HnSvSBKstSabB4w@mail.gmail.com>
Subject: Re: [linux-next:master 10741/11956] ERROR: modpost:
 "scp_get_venc_hw_capa" undefined!
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Yunfei Dong <yunfei.dong@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Sep 30, 2020 at 11:09 AM kernel test robot <lkp@intel.com> wrote:
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   49e7e3e905e437a02782019570f70997e2da9101
> commit: c7244811b1c951dca812079d16b17cb241882a80 [10741/11956] media: mtk-vcodec: add SCP firmware ops
> config: sh-allmodconfig (attached as .config)
> compiler: sh4-linux-gcc (GCC) 9.3.0
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=c7244811b1c951dca812079d16b17cb241882a80
>         git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
>         git fetch --no-tags linux-next master
>         git checkout c7244811b1c951dca812079d16b17cb241882a80
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

Mmm I don't quite understand this one. In the config.gz file both
VIDEO_MEDIATEK_VCODEC and MTK_SCP are compiled as modules, so the
symbols should be compiled and present?
