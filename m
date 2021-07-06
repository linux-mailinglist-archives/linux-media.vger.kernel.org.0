Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AC7BD3BCB41
	for <lists+linux-media@lfdr.de>; Tue,  6 Jul 2021 13:02:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231602AbhGFLDZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 6 Jul 2021 07:03:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39860 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231543AbhGFLDY (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 6 Jul 2021 07:03:24 -0400
Received: from mail-il1-x130.google.com (mail-il1-x130.google.com [IPv6:2607:f8b0:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B8EEC061574
        for <linux-media@vger.kernel.org>; Tue,  6 Jul 2021 04:00:45 -0700 (PDT)
Received: by mail-il1-x130.google.com with SMTP id e13so3744057ilc.1
        for <linux-media@vger.kernel.org>; Tue, 06 Jul 2021 04:00:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=P2F0q5cZ9T+aDZo1I+E0xv2Xq6Jm2e2tnmFxq3cllbI=;
        b=tCQM7yBc/bQ13X5waUlFbZymap0CF6b6FUaiEV7Gq8d2wIyBm4a7rI0s/XybyekfEO
         qga43qmEuv9trvJi/Ti6iFVmocWx2eINCikZOweZ1cJ2RLQSWi4OGXQLwxLSpYZWeybE
         AEJo8+NzojUauT3afjB0gfSsVK/NH9SdwZy2Z48R8ELAFrK86ycUo/RQ4t4tFscY8FYM
         RN304eIOMjMENMfhw0zzcnLanc12KMt2V3jAVbSiSDlqQpSTo5G2dj9GzXDHES46Fz7K
         ZuJfJb5ranuW2mMC+SBAmlwQLfx42Ax410mijiXeBkv3wEx9/mwLnUarqg0WNFUTlEB0
         nt7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=P2F0q5cZ9T+aDZo1I+E0xv2Xq6Jm2e2tnmFxq3cllbI=;
        b=evhe1NsAN4g20Vy4vQtNvNN5QQ6+hCACBpXGwtUPT1ODP7j1QBfddOiJmTbEYTVaTS
         MGhwCD3tkmgeLR2/cic5zQAcUl7j17QIkGWd1+/OekxD2hfvDucaqxUohB/jlV2cN8KI
         /oB7ZUiqPhHhcCm663/Pvtu5dtcSFs0vPvQB1llfL/XZXp2ihEUHfQmI+/+NQo2lcSLj
         roZzieOKS0yi7q/gaayHWyVGxuruRsBK/mqlJSkCKi5qY25gUTefzBhQKPaUjg7/iO2o
         TDefsYOZAIiDfLB8SajSLF9Mqj+XFZZ+vR36pie7lSkzPfTovwFb6U7W1lXOw7tWsNYe
         nDQA==
X-Gm-Message-State: AOAM532lJVIYL2f1DPlTeG82y12p2wWQr6hs7THKcSGp31D1GALEHWR+
        ZBzYzXNIrSoS74V/YIuYnStkXdiZj4Wg97vSGKgqjw==
X-Google-Smtp-Source: ABdhPJxrPo4pvRFB799x153C5Tr+j48o7WaiBw2A0cw/K3H5RqT0t6YjU2ISyDzqXLYFdafdRoUc/AEvCMTHyEXE5bI=
X-Received: by 2002:a92:c952:: with SMTP id i18mr14007199ilq.218.1625569244459;
 Tue, 06 Jul 2021 04:00:44 -0700 (PDT)
MIME-Version: 1.0
References: <1625038079-25815-1-git-send-email-kyrie.wu@mediatek.com> <1625038079-25815-4-git-send-email-kyrie.wu@mediatek.com>
In-Reply-To: <1625038079-25815-4-git-send-email-kyrie.wu@mediatek.com>
From:   Tzung-Bi Shih <tzungbi@google.com>
Date:   Tue, 6 Jul 2021 19:00:33 +0800
Message-ID: <CA+Px+wUPX0My5+7gBBo5N0Qf4VbpK96=vS8_F6xrRt+-T9O-3g@mail.gmail.com>
Subject: Re: [PATCH v2,3/9] media: mtk-jpegenc: remove redundant code of irq
To:     "kyrie.wu" <kyrie.wu@mediatek.com>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Bin Liu <bin.liu@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Tzung-Bi Shih <tzungbi@chromium.org>,
        Project_Global_Chrome_Upstream_Group@mediatek.com,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org,
        Tomasz Figa <tfiga@chromium.org>, xia.jiang@mediatek.com,
        maoguang.meng@mediatek.com, srv_heupstream@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Jun 30, 2021 at 3:28 PM kyrie.wu <kyrie.wu@mediatek.com> wrote:
> the func of jpgenc irq handler would not compatible, remove those
> code.
Need more explanation about why as I believe it is non-backward compatible.
