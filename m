Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9297D3AFFB
	for <lists+linux-media@lfdr.de>; Mon, 10 Jun 2019 09:51:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387950AbfFJHvZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 10 Jun 2019 03:51:25 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:22192 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S2387781AbfFJHvZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 10 Jun 2019 03:51:25 -0400
X-UUID: f4cdad59ad504604918513e54bbdad19-20190610
X-UUID: f4cdad59ad504604918513e54bbdad19-20190610
Received: from mtkcas06.mediatek.inc [(172.21.101.30)] by mailgw02.mediatek.com
        (envelope-from <ck.hu@mediatek.com>)
        (mhqrelay.mediatek.com ESMTP with TLS)
        with ESMTP id 247112446; Mon, 10 Jun 2019 15:51:15 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Mon, 10 Jun 2019 15:51:13 +0800
Received: from [172.21.77.4] (172.21.77.4) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Mon, 10 Jun 2019 15:51:13 +0800
Message-ID: <1560153073.31854.6.camel@mtksdaap41>
Subject: Re: [PATCH v4 01/14] dt-bindings: Add binding for MT2712 MIPI-CSI2
From:   CK Hu <ck.hu@mediatek.com>
To:     Tomasz Figa <tfiga@chromium.org>
CC:     Stu Hsieh <stu.hsieh@mediatek.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        "Linux Media Mailing List" <linux-media@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>, Joerg 
        Roedel <joro@8bytes.org>," <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        srv_heupstream <srv_heupstream@mediatek.com>
Date:   Mon, 10 Jun 2019 15:51:13 +0800
In-Reply-To: <CAHD77H=vuPi2Rj4Mw-CQ2=UYX7YnS8w8FpUk0QTVxNUVLWKbJg@mail.gmail.com>
References: <1559643115-15124-1-git-send-email-stu.hsieh@mediatek.com>
         <1559643115-15124-2-git-send-email-stu.hsieh@mediatek.com>
         <1560134057.28527.5.camel@mtksdaap41>
         <CAHD77H=vuPi2Rj4Mw-CQ2=UYX7YnS8w8FpUk0QTVxNUVLWKbJg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK:  N
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi, Tomasz:

On Mon, 2019-06-10 at 12:32 +0900, Tomasz Figa wrote:
> Hi CK, Stu,
> 
> On Mon, Jun 10, 2019 at 11:34 AM CK Hu <ck.hu@mediatek.com> wrote:
> >
> > Hi, Stu:
> >
> > "mediatek,mt2712-mipicsi" and "mediatek,mt2712-mipicsi-common" have many
> > common part with "mediatek,mt8183-seninf", and I've a discussion in [1],
> > so I would like these two to be merged together.
> >
> > [1] https://patchwork.kernel.org/patch/10979131/
> >
> 
> Thanks CK for spotting this.
> 
> I also noticed that the driver in fact handles two hardware blocks at
> the same time - SenInf and CamSV. Unless the architecture is very
> different from MT8183, I'd suggest splitting it.
> 
> On a general note, the MT8183 SenInf driver has received several
> rounds of review comments already, but I couldn't find any comments
> posted for this one.
> 
> Given the two aspects above and also based on my quick look at code
> added by this series, I'd recommend adding MT2712 support on top of
> the MT8183 series.

In [1], "mediatek,mt8183-seninf" use one device to control multiple csi
instance, so it duplicate many register definition. In [2], one
"mediatek,mt2712-mipicsi" device control one csi instance, so there are
multiple device and the register definition does not duplicate. You
recommend adding MT2712 support on top of the MT8183 series, do you mean
that "mediatek,mt2712-mipicsi" should use one device to control multiple
csi instance and duplicate the register setting?

[1] https://patchwork.kernel.org/patch/10979121/
[2] https://patchwork.kernel.org/patch/10974573/

Regards,
CK

> 
> Best regards,
> Tomasz


