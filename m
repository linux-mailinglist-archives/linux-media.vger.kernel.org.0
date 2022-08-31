Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 18CE75A79EB
	for <lists+linux-media@lfdr.de>; Wed, 31 Aug 2022 11:17:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230512AbiHaJRB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 31 Aug 2022 05:17:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58802 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231684AbiHaJQ7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 31 Aug 2022 05:16:59 -0400
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 93AABC04C0
        for <linux-media@vger.kernel.org>; Wed, 31 Aug 2022 02:16:55 -0700 (PDT)
X-UUID: db897235446f46878af4700e8c52362e-20220831
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=bm21fT/sbTdF5dDgtB2rLhTyPokApvLPFI3a0O3dXJU=;
        b=gqY09qnoz3sS1GX9jJsSR7k618oKGaiSzEqo/jmnlVOUldB/I7Vbu2sXs7CKiZyJSTFeMLUsctYhCCICBaTBUyh1SmshgG2B4d48RVpORgRCV91XYx288rqAaSKyUrHElrMpuF2Fz1Q/Al5bi4NSgFfgvXEl6ZEO6QGUhV3RWhg=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.10,REQID:3afa9f9a-7e0e-443e-a87f-ec087d8ba01c,OB:0,L
        OB:0,IP:0,URL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release
        _Ham,ACTION:release,TS:-5
X-CID-META: VersionHash:84eae18,CLOUDID:05eb2356-e800-47dc-8adf-0c936acf4f1b,C
        OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
        ,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: db897235446f46878af4700e8c52362e-20220831
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
        (envelope-from <moudy.ho@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
        with ESMTP id 1006238728; Wed, 31 Aug 2022 17:16:48 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3;
 Wed, 31 Aug 2022 17:16:46 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 31 Aug 2022 17:16:46 +0800
Message-ID: <e63f208f547ed57448aa591ddfcd8908452bd1d3.camel@mediatek.com>
Subject: Re: [GIT PULL FOR v6.1] Add MediaTek MDP3 driver
From:   moudy ho <moudy.ho@mediatek.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>
CC:     "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Date:   Wed, 31 Aug 2022 17:16:46 +0800
In-Reply-To: <0fe9a798-4dfe-8f19-96fa-65051c307011@xs4all.nl>
References: <5e3b154a-5075-62fd-2eea-3ff3d147010c@xs4all.nl>
         <0fe9a798-4dfe-8f19-96fa-65051c307011@xs4all.nl>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK:  N
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_MSPIKE_H2,RDNS_NONE,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY,
        URIBL_CSS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

Thanks for your kind reminder, I've sent a fixed patch to deal with
these three errors and warning.
Sorry, due to environmental issues, I can't build the smatch version
you mentioned (with gcc-12.2) currently.
I'll work on this issue as soon as possible, and please let me know if
you find other errors

Thanks & Regards,
Moudy

On Tue, 2022-08-30 at 18:02 +0200, Hans Verkuil wrote:
> Hi Moudy,
> 
> This series has now been merged in our tree, but I am getting new
> smatch
> errors, most likely due to the fact that I upgraded the gcc version I
> use from gcc-11.2 to gcc-12.2. I'm pretty sure that's the reason I
> didn't
> see these before.
> 
> Can you take a look at this and post a follow-up patch?
> 
> smatch: ERRORS
> drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c:292 mdp_probe()
> error: we previously assumed 'mdp' could be null (see line 188)
> drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.c:872
> mdp_comp_create() warn: passing devm_ allocated variable to kfree.
> 'comp'
> drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c:460
> mdp_cmdq_send() error: we previously assumed 'cmd' could be null (see
> line 369)
> 
> Regards,
> 
> 	Hans
> 
> On 8/29/22 09:13, Hans Verkuil wrote:
> > 
> > 
> > The following changes since commit
> > 1ff8334f0a4e0be693066aafba195d25629d77aa:
> > 
> >   media: MAINTAINERS: add entry for i.MX8MP DW100 v4l2 mem2mem
> > driver (2022-08-21 08:42:26 +0200)
> > 
> > are available in the Git repository at:
> > 
> >   git://linuxtv.org/hverkuil/media_tree.git tags/br-v6.1c
> > 
> > for you to fetch changes up to
> > 56ef9c1c2a40f25e184712fbda5ae5b6900a3de1:
> > 
> >   media: platform: mtk-mdp3: add MediaTek MDP3 driver (2022-08-24
> > 10:36:22 +0200)
> > 
> > ----------------------------------------------------------------
> > Tag branch
> > 
> > ----------------------------------------------------------------
> > Moudy Ho (3):
> >       dt-binding: mediatek: add bindings for MediaTek MDP3
> > components
> >       dt-binding: mediatek: add bindings for MediaTek CCORR and
> > WDMA
> >       media: platform: mtk-mdp3: add MediaTek MDP3 driver
> > 
> >  Documentation/devicetree/bindings/media/mediatek,mdp3-
> > rdma.yaml    |   95 ++++++
> >  Documentation/devicetree/bindings/media/mediatek,mdp3-
> > rsz.yaml     |   77 +++++
> >  Documentation/devicetree/bindings/media/mediatek,mdp3-
> > wrot.yaml    |   80 ++++++
> >  Documentation/devicetree/bindings/soc/mediatek/mediatek,ccorr.yaml
> > |   68 +++++
> >  Documentation/devicetree/bindings/soc/mediatek/mediatek,wdma.yaml 
> >  |   81 ++++++
> >  drivers/media/platform/mediatek/Kconfig                           
> >  |    1 +
> >  drivers/media/platform/mediatek/Makefile                          
> >  |    1 +
> >  drivers/media/platform/mediatek/mdp3/Kconfig                      
> >  |   21 ++
> >  drivers/media/platform/mediatek/mdp3/Makefile                     
> >  |    6 +
> >  drivers/media/platform/mediatek/mdp3/mdp_reg_ccorr.h              
> >  |   19 ++
> >  drivers/media/platform/mediatek/mdp3/mdp_reg_rdma.h               
> >  |   65 +++++
> >  drivers/media/platform/mediatek/mdp3/mdp_reg_rsz.h                
> >  |   39 +++
> >  drivers/media/platform/mediatek/mdp3/mdp_reg_wdma.h               
> >  |   47 +++
> >  drivers/media/platform/mediatek/mdp3/mdp_reg_wrot.h               
> >  |   55 ++++
> >  drivers/media/platform/mediatek/mdp3/mtk-img-
> > ipi.h                 |  290 +++++++++++++++++++
> >  drivers/media/platform/mediatek/mdp3/mtk-mdp3-
> > cmdq.c               |  466 ++++++++++++++++++++++++++++++
> >  drivers/media/platform/mediatek/mdp3/mtk-mdp3-
> > cmdq.h               |   43 +++
> >  drivers/media/platform/mediatek/mdp3/mtk-mdp3-
> > comp.c               | 1033
> > ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
> >  drivers/media/platform/mediatek/mdp3/mtk-mdp3-
> > comp.h               |  186 ++++++++++++
> >  drivers/media/platform/mediatek/mdp3/mtk-mdp3-
> > core.c               |  357 +++++++++++++++++++++++
> >  drivers/media/platform/mediatek/mdp3/mtk-mdp3-
> > core.h               |   94 ++++++
> >  drivers/media/platform/mediatek/mdp3/mtk-mdp3-
> > m2m.c                |  724
> > ++++++++++++++++++++++++++++++++++++++++++++++
> >  drivers/media/platform/mediatek/mdp3/mtk-mdp3-
> > m2m.h                |   48 ++++
> >  drivers/media/platform/mediatek/mdp3/mtk-mdp3-
> > regs.c               |  735
> > +++++++++++++++++++++++++++++++++++++++++++++++
> >  drivers/media/platform/mediatek/mdp3/mtk-mdp3-
> > regs.h               |  373 ++++++++++++++++++++++++
> >  drivers/media/platform/mediatek/mdp3/mtk-mdp3-
> > vpu.c                |  313 ++++++++++++++++++++
> >  drivers/media/platform/mediatek/mdp3/mtk-mdp3-
> > vpu.h                |   78 +++++
> >  27 files changed, 5395 insertions(+)
> >  create mode 100644
> > Documentation/devicetree/bindings/media/mediatek,mdp3-rdma.yaml
> >  create mode 100644
> > Documentation/devicetree/bindings/media/mediatek,mdp3-rsz.yaml
> >  create mode 100644
> > Documentation/devicetree/bindings/media/mediatek,mdp3-wrot.yaml
> >  create mode 100644
> > Documentation/devicetree/bindings/soc/mediatek/mediatek,ccorr.yaml
> >  create mode 100644
> > Documentation/devicetree/bindings/soc/mediatek/mediatek,wdma.yaml
> >  create mode 100644 drivers/media/platform/mediatek/mdp3/Kconfig
> >  create mode 100644 drivers/media/platform/mediatek/mdp3/Makefile
> >  create mode 100644
> > drivers/media/platform/mediatek/mdp3/mdp_reg_ccorr.h
> >  create mode 100644
> > drivers/media/platform/mediatek/mdp3/mdp_reg_rdma.h
> >  create mode 100644
> > drivers/media/platform/mediatek/mdp3/mdp_reg_rsz.h
> >  create mode 100644
> > drivers/media/platform/mediatek/mdp3/mdp_reg_wdma.h
> >  create mode 100644
> > drivers/media/platform/mediatek/mdp3/mdp_reg_wrot.h
> >  create mode 100644 drivers/media/platform/mediatek/mdp3/mtk-img-
> > ipi.h
> >  create mode 100644 drivers/media/platform/mediatek/mdp3/mtk-mdp3-
> > cmdq.c
> >  create mode 100644 drivers/media/platform/mediatek/mdp3/mtk-mdp3-
> > cmdq.h
> >  create mode 100644 drivers/media/platform/mediatek/mdp3/mtk-mdp3-
> > comp.c
> >  create mode 100644 drivers/media/platform/mediatek/mdp3/mtk-mdp3-
> > comp.h
> >  create mode 100644 drivers/media/platform/mediatek/mdp3/mtk-mdp3-
> > core.c
> >  create mode 100644 drivers/media/platform/mediatek/mdp3/mtk-mdp3-
> > core.h
> >  create mode 100644 drivers/media/platform/mediatek/mdp3/mtk-mdp3-
> > m2m.c
> >  create mode 100644 drivers/media/platform/mediatek/mdp3/mtk-mdp3-
> > m2m.h
> >  create mode 100644 drivers/media/platform/mediatek/mdp3/mtk-mdp3-
> > regs.c
> >  create mode 100644 drivers/media/platform/mediatek/mdp3/mtk-mdp3-
> > regs.h
> >  create mode 100644 drivers/media/platform/mediatek/mdp3/mtk-mdp3-
> > vpu.c
> >  create mode 100644 drivers/media/platform/mediatek/mdp3/mtk-mdp3-
> > vpu.h

