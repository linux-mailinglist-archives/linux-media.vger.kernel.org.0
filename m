Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 24A313A4061
	for <lists+linux-media@lfdr.de>; Fri, 11 Jun 2021 12:46:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231217AbhFKKsX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 11 Jun 2021 06:48:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33022 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230365AbhFKKsW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 11 Jun 2021 06:48:22 -0400
Received: from theia.8bytes.org (8bytes.org [IPv6:2a01:238:4383:600:38bc:a715:4b6d:a889])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7377AC061574;
        Fri, 11 Jun 2021 03:46:24 -0700 (PDT)
Received: by theia.8bytes.org (Postfix, from userid 1000)
        id 376EC2FB; Fri, 11 Jun 2021 12:46:21 +0200 (CEST)
Date:   Fri, 11 Jun 2021 12:46:19 +0200
From:   Joerg Roedel <joro@8bytes.org>
To:     Matthias Brugger <matthias.bgg@gmail.com>
Cc:     Yong Wu <yong.wu@mediatek.com>, Hsin-Yi Wang <hsinyi@chromium.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Evan Green <evgreen@chromium.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Will Deacon <will.deacon@arm.com>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>, srv_heupstream@mediatek.com,
        Devicetree List <devicetree@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        iommu@lists.linux-foundation.org, youlin.pei@mediatek.com,
        Nicolas Boichat <drinkcat@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>, anan.sun@mediatek.com,
        chao.hao@mediatek.com, ming-fan.chen@mediatek.com,
        yi.kuo@mediatek.com, eizan@chromium.org,
        Alexandre Courbot <acourbot@chromium.org>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        Irui Wang <irui.wang@mediatek.com>, linux-media@vger.kernel.org
Subject: Re: [PATCH v5 13/16] media: mtk-vcodec: Get rid of
 mtk_smi_larb_get/put
Message-ID: <YMM++ySKo38OUMXQ@8bytes.org>
References: <20210410091128.31823-1-yong.wu@mediatek.com>
 <20210410091128.31823-14-yong.wu@mediatek.com>
 <CAJMQK-iTrQRDDm_=LNqSpvXFd431LYRxXMasJHUpN+K8rJ=Qpg@mail.gmail.com>
 <1620822547.2983.8.camel@mhfsdcap03>
 <c1422242-8d8c-9592-c22d-288c503cd8b1@gmail.com>
 <1623326528.23717.20.camel@mhfsdcap03>
 <e7269c80-5437-6ab9-c1db-df0b94eb97d8@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e7269c80-5437-6ab9-c1db-df0b94eb97d8@gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Jun 11, 2021 at 12:07:24PM +0200, Matthias Brugger wrote:
> That's a good question. I think the media tree would be a good
> candidate, as it has the biggest bunch of patches. But that would mean
> that Joerg is fine that.  The DTS part could still go through my tree.

IOMMU changes are only a minor part of this, so it should not go through
the IOMMU tree. When Matthias has reviewed the IOMMU changes, feel free
to add my

	Acked-by: Joerg Roedel <jroedel@suse.de>

to them.

Regards,

	Joerg
