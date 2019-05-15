Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 21F161F4F6
	for <lists+linux-media@lfdr.de>; Wed, 15 May 2019 15:03:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727253AbfEONDD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 May 2019 09:03:03 -0400
Received: from mailgw01.mediatek.com ([210.61.82.183]:41095 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1727079AbfEONDD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 May 2019 09:03:03 -0400
X-UUID: 6b9a6efe68de46f59b7101830d0bfa55-20190515
X-UUID: 6b9a6efe68de46f59b7101830d0bfa55-20190515
Received: from mtkcas06.mediatek.inc [(172.21.101.30)] by mailgw01.mediatek.com
        (envelope-from <jungo.lin@mediatek.com>)
        (mhqrelay.mediatek.com ESMTP with TLS)
        with ESMTP id 892327141; Wed, 15 May 2019 21:02:57 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 15 May 2019 21:02:55 +0800
Received: from [172.21.84.99] (172.21.84.99) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Wed, 15 May 2019 21:02:55 +0800
Message-ID: <1557925375.5721.7.camel@mtksdccf07>
Subject: Re: [RFC,V2,01/11] dt-bindings: mt8183: Add binding for ISP Pass 1
 reserved memory
From:   Jungo Lin <jungo.lin@mediatek.com>
To:     Rob Herring <robh@kernel.org>
CC:     <tfiga@chromium.org>, <hans.verkuil@cisco.com>,
        <laurent.pinchart+renesas@ideasonboard.com>,
        <matthias.bgg@gmail.com>, <mchehab@kernel.org>,
        <linux-mediatek@lists.infradead.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <srv_heupstream@mediatek.com>, <Sean.Cheng@mediatek.com>,
        <sj.huang@mediatek.com>, <christie.yu@mediatek.com>,
        <frederic.chen@mediatek.com>, <Jerry-ch.Chen@mediatek.com>,
        <frankie.chiu@mediatek.com>, <seraph.huang@mediatek.com>,
        <ryan.yu@mediatek.com>, <Rynn.Wu@mediatek.com>,
        <yuzhao@chromium.org>, <zwisler@chromium.org>, <shik@chromium.org>,
        <suleiman@chromium.org>
Date:   Wed, 15 May 2019 21:02:55 +0800
In-Reply-To: <20190514195052.GA3314@bogus>
References: <jungo.lin@mediatek.com>
         <20190510015755.51495-2-jungo.lin@mediatek.com>
         <20190514195052.GA3314@bogus>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.2.3-0ubuntu6 
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
X-MTK:  N
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Rob:

Thanks for your comments.

On Tue, 2019-05-14 at 14:50 -0500, Rob Herring wrote:
> On Fri, May 10, 2019 at 09:57:47AM +0800, Jungo Lin wrote:
> > This patch adds the binding for describing the reserved
> > shared memory used to exchange ISP configuration and tuning
> > data between the co-processor and Pass 1 (P1) unit of the
> > camera ISP system on Mediatek SoCs.
> > 
> > Signed-off-by: Jungo Lin <jungo.lin@mediatek.com>
> > ---
> >  .../mediatek,reserve-memory-cam-smem.txt      | 42 +++++++++++++++++++
> >  1 file changed, 42 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/reserved-memory/mediatek,reserve-memory-cam-smem.txt
> 
> See my comments on the other 2 camera related reserved-memory bindings.
> 

Ok, we will align DIP & FD drivers's implementation.

Best regards,

Jungo

> Rob


