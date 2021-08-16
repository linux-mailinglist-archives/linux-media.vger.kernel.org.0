Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1E08B3ECC24
	for <lists+linux-media@lfdr.de>; Mon, 16 Aug 2021 02:47:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231916AbhHPAri (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 15 Aug 2021 20:47:38 -0400
Received: from mailgw02.mediatek.com ([1.203.163.81]:50787 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S230124AbhHPAri (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 15 Aug 2021 20:47:38 -0400
X-UUID: b2cb48f51b024fc0b2a7cf67518566ef-20210816
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=sAaOLYBjvsYR1Acs6Grr3F+AAV0ocb/raZ96GUdQ1qo=;
        b=g6yAQxcxAt6eC1KytujmwOeqKEKazfwVP/3eU/sJbGnQoh1mo9550PEthzWT1uzEcUFLfG1Tj4kMXctbW7l1zudTgI5F0iv2qfx5SzlLxP0gcgZKQvxnYInZNFZe1hoXUl0V3z1elMEMSHSwpCrTjuYpOjH6YGb1VglYgWm68LY=;
X-UUID: b2cb48f51b024fc0b2a7cf67518566ef-20210816
Received: from mtkcas35.mediatek.inc [(172.27.4.253)] by mailgw02.mediatek.com
        (envelope-from <houlong.wei@mediatek.com>)
        (mailgw01.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 2002767682; Mon, 16 Aug 2021 08:47:03 +0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS32N1.mediatek.inc
 (172.27.4.71) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 16 Aug
 2021 08:46:56 +0800
Received: from mhfsdcap04 (10.17.3.154) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 16 Aug 2021 08:46:56 +0800
Message-ID: <8324f3197f20dfec3e0d7ea8f32bac75b739eea5.camel@mediatek.com>
Subject: Re: [PATCH v6 1/9] mtk-mdp: propagate errors from clock_on
From:   houlong wei <houlong.wei@mediatek.com>
To:     Eizan Miyamoto <eizan@chromium.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
CC:     "wenst@chromium.org" <wenst@chromium.org>,
        "Yong Wu =?UTF-8?Q?=28=E5=90=B4=E5=8B=87=29?=" <Yong.Wu@mediatek.com>,
        "enric.balletbo@collabora.com" <enric.balletbo@collabora.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
        "Andrew-CT Chen =?UTF-8?Q?=28=E9=99=B3=E6=99=BA=E8=BF=AA=29?=" 
        <Andrew-CT.Chen@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "Minghsiu Tsai =?UTF-8?Q?=28=E8=94=A1=E6=98=8E=E4=BF=AE=29?=" 
        <Minghsiu.Tsai@mediatek.com>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-mediatek@lists.infradead.org" 
        <linux-mediatek@lists.infradead.org>, <houlong.wei@mediatek.com>
Date:   Mon, 16 Aug 2021 08:46:57 +0800
In-Reply-To: <20210802220943.v6.1.I9db0d408ef79d300672ec0311a6bee9556801631@changeid>
References: <20210802121215.703023-1-eizan@chromium.org>
         <20210802220943.v6.1.I9db0d408ef79d300672ec0311a6bee9556801631@changeid>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: CE6BE3BDA54DFB4013AD420CB44134AF67E90702D765D0A01BFC378D53FE42952000:8
X-MTK:  N
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

T24gTW9uLCAyMDIxLTA4LTAyIGF0IDIwOjEyICswODAwLCBFaXphbiBNaXlhbW90byB3cm90ZToN
Cj4gVXAgdW50aWwgdGhpcyBjaGFuZ2UsIG1hbnkgZXJyb3JzIHdlcmUgbG9nZ2VkIGJ1dCBpZ25v
cmVkIHdoZW4NCj4gcG93ZXJpbmcNCj4gb24gY2xvY2tzIGluc2lkZSBtdGtfbWRwX2NvcmUuIFRo
aXMgY2hhbmdlIHRyaWVzIHRvIGRvIGEgYmV0dGVyIGpvYg0KPiBhdA0KPiBwcm9wYWdhdGluZyBl
cnJvcnMgYmFjayB0byB0aGUgcG93ZXIgbWFuYWdlbWVudCBmcmFtZXdvcmsuDQo+IA0KPiBTaWdu
ZWQtb2ZmLWJ5OiBFaXphbiBNaXlhbW90byA8ZWl6YW5AY2hyb21pdW0ub3JnPg0KPiAtLS0NCg0K
UmV2aWV3ZWQtYnk6IEhvdWxvbmcgV2VpIDxob3Vsb25nLndlaUBtZWRpYXRlay5jb20+DQoNCj4g
KG5vIGNoYW5nZXMgc2luY2UgdjEpDQpbLi4uXQ0K

