Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 67E2E2A3C8C
	for <lists+linux-media@lfdr.de>; Tue,  3 Nov 2020 07:04:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727308AbgKCGEg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 3 Nov 2020 01:04:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53170 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725997AbgKCGEf (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 3 Nov 2020 01:04:35 -0500
Received: from mail-oo1-xc2b.google.com (mail-oo1-xc2b.google.com [IPv6:2607:f8b0:4864:20::c2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE915C061A47
        for <linux-media@vger.kernel.org>; Mon,  2 Nov 2020 22:04:34 -0800 (PST)
Received: by mail-oo1-xc2b.google.com with SMTP id u5so3948183oot.0
        for <linux-media@vger.kernel.org>; Mon, 02 Nov 2020 22:04:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=TGr6Ue3Q/f3v1WA1VcYTzlj6YwajAFv8DiSEdgDrXHM=;
        b=Jw0YWgr3GhikBEs1sQcs/G5z9pO/2vXdo7YntrGJsUja0brYNxaNds96/MWIo49BYO
         INMqFTqBJFZCZWVrhkSEGA79mtrdwYNBrWJmyp/hnn0IKX7lyI/AYGPuvJxZDMlp4L+4
         VBJVtpNFYusWJ/mf6Vk4/vznKmAWrlXeLsiho=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=TGr6Ue3Q/f3v1WA1VcYTzlj6YwajAFv8DiSEdgDrXHM=;
        b=BZ/Dbl5dnH769u/eSJVsViH+yBg9YC7SjD0jG46u7PB+19NdqTr2aoZFwihq2jrbFu
         h/Q0ZZh9/yhJhcuUhN6E2riIsIcRBTR9T4+STBeiPLKg06vnUEzi3UoPwY1aqKG5Qz7D
         67KRw1xF5jJJNcpsRuEHpe8HE9HtH4IJXB/qkRQrV2JZ2UShGBj9H8XB2qGLft1YSjXY
         /ty5zQTcMJVsrA3oPEN1audHvZ+KqjTYbKRxvRxaX7UDhOlnrTsI353nB1C8uAU2emB9
         hep1PxaEO3y78IRTRaoOcqyM7o8ut2BRJU388pfJCZyyykVoMVz+cfsZO6iAWmZ/eREr
         gaAg==
X-Gm-Message-State: AOAM532A6F4wCqjXt7sw3NqQ1ruNkMzNCbOnZM3S3gJiXc4jyr0/TTKJ
        5raCGKteFGvIY3ZrpOpvJstoZ/s3Ug+BRuf6
X-Google-Smtp-Source: ABdhPJzD+7idDt7fgkhb5zNpslF6ufnNFLWTJTMClnRLsfXK0f6qseMdm9ziZl6P9kbuFLhqjIH4Yg==
X-Received: by 2002:a4a:ea3c:: with SMTP id y28mr161421ood.49.1604383474003;
        Mon, 02 Nov 2020 22:04:34 -0800 (PST)
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com. [209.85.210.45])
        by smtp.gmail.com with ESMTPSA id b8sm3917646oov.29.2020.11.02.22.04.33
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2020 22:04:33 -0800 (PST)
Received: by mail-ot1-f45.google.com with SMTP id y22so4482589oti.10
        for <linux-media@vger.kernel.org>; Mon, 02 Nov 2020 22:04:33 -0800 (PST)
X-Received: by 2002:a9d:4504:: with SMTP id w4mr14195011ote.36.1604383472531;
 Mon, 02 Nov 2020 22:04:32 -0800 (PST)
MIME-Version: 1.0
References: <202011031152.lRCvwj31-lkp@intel.com>
In-Reply-To: <202011031152.lRCvwj31-lkp@intel.com>
From:   Alexandre Courbot <acourbot@chromium.org>
Date:   Tue, 3 Nov 2020 15:04:21 +0900
X-Gmail-Original-Message-ID: <CAPBb6MX66CfUbaha0bnEhib519tOig7k2EYmNPOodLrOXtGFSw@mail.gmail.com>
Message-ID: <CAPBb6MX66CfUbaha0bnEhib519tOig7k2EYmNPOodLrOXtGFSw@mail.gmail.com>
Subject: Re: ERROR: modpost: "scp_get" undefined!
To:     kernel test robot <lkp@intel.com>
Cc:     Yunfei Dong <yunfei.dong@mediatek.com>, kbuild-all@lists.01.org,
        LKML <linux-kernel@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Nov 3, 2020 at 12:48 PM kernel test robot <lkp@intel.com> wrote:
>
> Hi Yunfei,
>
> FYI, the error/warning still remains.
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   b7cbaf59f62f8ab8f157698f9e31642bff525bd0
> commit: c7244811b1c951dca812079d16b17cb241882a80 media: mtk-vcodec: add SCP firmware ops
> date:   5 weeks ago
> config: sh-allmodconfig (attached as .config)
> compiler: sh4-linux-gcc (GCC) 9.3.0
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=c7244811b1c951dca812079d16b17cb241882a80
>         git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
>         git fetch --no-tags linus master
>         git checkout c7244811b1c951dca812079d16b17cb241882a80
>         # save the attached .config to linux build tree
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-9.3.0 make.cross ARCH=sh
>
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
>
> All errors (new ones prefixed by >>, old ones prefixed by <<):
>
> ERROR: modpost: "scp_get_venc_hw_capa" [drivers/media/platform/mtk-vcodec/mtk-vcodec-common.ko] undefined!
> ERROR: modpost: "scp_ipi_send" [drivers/media/platform/mtk-vcodec/mtk-vcodec-common.ko] undefined!
> ERROR: modpost: "scp_put" [drivers/media/platform/mtk-vcodec/mtk-vcodec-common.ko] undefined!
> >> ERROR: modpost: "scp_get" [drivers/media/platform/mtk-vcodec/mtk-vcodec-common.ko] undefined!
> >> ERROR: modpost: "scp_get_vdec_hw_capa" [drivers/media/platform/mtk-vcodec/mtk-vcodec-common.ko] undefined!
> >> ERROR: modpost: "scp_ipi_register" [drivers/media/platform/mtk-vcodec/mtk-vcodec-common.ko] undefined!
> >> ERROR: modpost: "scp_mapping_dm_addr" [drivers/media/platform/mtk-vcodec/mtk-vcodec-common.ko] undefined!
> >> ERROR: modpost: "scp_get_rproc" [drivers/media/platform/mtk-vcodec/mtk-vcodec-common.ko] undefined!
> ERROR: modpost: "rproc_boot" [drivers/media/platform/mtk-vcodec/mtk-vcodec-common.ko] undefined!
> ERROR: modpost: "__delay" [drivers/net/phy/mdio-cavium.ko] undefined!

This should be taken care of by https://lkml.org/lkml/2020/10/13/425.
