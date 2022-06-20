Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8D8BA551054
	for <lists+linux-media@lfdr.de>; Mon, 20 Jun 2022 08:31:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238419AbiFTGbi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 20 Jun 2022 02:31:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54270 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230121AbiFTGbi (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 20 Jun 2022 02:31:38 -0400
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 733F963FE;
        Sun, 19 Jun 2022 23:31:36 -0700 (PDT)
X-UUID: 3e37489b9576495eb89653281161de40-20220620
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.6,REQID:e245270b-27b5-4318-8799-9759d819e80e,OB:0,LO
        B:0,IP:0,URL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACT
        ION:release,TS:-5
X-CID-META: VersionHash:b14ad71,CLOUDID:b341fae9-f7af-4e69-92ee-0fd74a0c286c,C
        OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
        ,QS:nil,BEC:nil,COL:0
X-UUID: 3e37489b9576495eb89653281161de40-20220620
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
        (envelope-from <yunfei.dong@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
        with ESMTP id 1640627295; Mon, 20 Jun 2022 14:31:31 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Mon, 20 Jun 2022 14:31:29 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Mon, 20 Jun 2022 14:31:27 +0800
Message-ID: <1b01b9a12d8ffe19aa37e23c644204203ff2db25.camel@mediatek.com>
Subject: Re: [PATCH] media: mediatek: vcodec: Initialize decoder parameters
 after getting dec_capability
From:   "yunfei.dong@mediatek.com" <yunfei.dong@mediatek.com>
To:     Chen-Yu Tsai <wenst@chromium.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
CC:     Nicolas Dufresne <nicolas@ndufresne.ca>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Tomasz Figa <tfiga@google.com>,
        George Sun <george.sun@mediatek.com>,
        Xiaoyong Lu <xiaoyong.lu@mediatek.com>,
        "Hsin-Yi Wang" <hsinyi@chromium.org>,
        Fritz Koenig <frkoenig@chromium.org>,
        "Daniel Vetter" <daniel@ffwll.ch>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        "Irui Wang" <irui.wang@mediatek.com>,
        Steve Cho <stevecho@chromium.org>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>,
        <Project_Global_Chrome_Upstream_Group@mediatek.com>
Date:   Mon, 20 Jun 2022 14:31:27 +0800
In-Reply-To: <CAGXv+5E2wULkB7_u_H7jFAi6Jk2AvUcfOJdzOp_5m2b4n3shww@mail.gmail.com>
References: <20220618072929.28783-1-yunfei.dong@mediatek.com>
         <CAGXv+5EFkZ6-bvu68dV4hr795+N3tAwbXYg5WCJp+Zd+pf1Aqw@mail.gmail.com>
         <CAGXv+5E2wULkB7_u_H7jFAi6Jk2AvUcfOJdzOp_5m2b4n3shww@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK:  N
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Chen-Yu,

Thanks for your suggestion.
On Mon, 2022-06-20 at 13:25 +0800, Chen-Yu Tsai wrote:
> On Mon, Jun 20, 2022 at 12:54 PM Chen-Yu Tsai <wenst@chromium.org>
> wrote:
> > 
> > On Sat, Jun 18, 2022 at 3:29 PM Yunfei Dong <
> > yunfei.dong@mediatek.com> wrote:
> > > 
> > > Need to get dec_capability from scp first, then initialize
> > > decoder
> > > supported format and other parameters according to dec_capability
> > > value.
> > > 
> > > Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> > 
> > Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
> > Tested-by: Chen-Yu Tsai <wenst@chromium.org>
> > 
> > Tested on MT8183 on mainline 20220617-next with the vcodec-dec DT
> > node
> > copied from the ChromeOS v5.10 kernel.
> > 
> > This fixes an issue where the first attempt to enumerate formats on
> > the
> > device right after boot returns an empty list.
> 
> BTW, this should have a Fixes tag.
> 
> Either
> 
> Fixes: 7a7ae26fd458 ("media: mediatek: vcodec: support stateless VP8
> decoding")
> 
> which looks like the first instance of when firmware capability
> really is
> considered, or
> 
> Fixes: fd00d90330d1 ("media: mtk-vcodec: vdec: move stateful ops into
> their own file")
> 
> which matches when ctx->dev->vdec_pdata->init_vdec_params(ctx) was
> first added.
> 
> 
> ChenYu

I will fix the patch in v2.

Best Regards,
Yunfei Dong

