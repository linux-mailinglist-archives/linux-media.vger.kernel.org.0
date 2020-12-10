Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 199252D50AF
	for <lists+linux-media@lfdr.de>; Thu, 10 Dec 2020 03:13:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728044AbgLJCNm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 9 Dec 2020 21:13:42 -0500
Received: from mailgw01.mediatek.com ([210.61.82.183]:54393 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1728040AbgLJCNm (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 9 Dec 2020 21:13:42 -0500
X-UUID: 218d533b9366481e9e0dfa640a4f36bf-20201210
X-UUID: 218d533b9366481e9e0dfa640a4f36bf-20201210
Received: from mtkexhb02.mediatek.inc [(172.21.101.103)] by mailgw01.mediatek.com
        (envelope-from <irui.wang@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.14 Build 0819 with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 468575324; Thu, 10 Dec 2020 10:07:47 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 10 Dec 2020 10:07:45 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 10 Dec 2020 10:07:45 +0800
From:   Irui Wang <irui.wang@mediatek.com>
To:     <linux-firmware@kernel.org>
CC:     <linux-mediatek@lists.infradead.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-media@vger.kernel.org>, <tiffany.lin@mediatek.com>,
        <Maoguang.Meng@mediatek.com>, <Longfei.Wang@mediatek.com>,
        <Yunfei.Dong@mediatek.com>, <Andrew-CT.Chen@mediatek.com>,
        <erin.lo@mediatek.com>, <PoChun.Lin@mediatek.com>,
        <irui.wang@mediatek.com>, <srv_heupstream@mediatek.com>
Subject: [PATCH] mediatek: update MT8173 VPU firmware to v1.1.6
Date:   Thu, 10 Dec 2020 10:07:40 +0800
Message-ID: <20201210020740.21467-2-irui.wang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20201210020740.21467-1-irui.wang@mediatek.com>
References: <20201210020740.21467-1-irui.wang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

[encoder h264]
set buffer pitch to encoder hardware

Release Version: 1.1.6

Signed-off-by: Irui Wang <irui.wang@mediatek.com>
---
 mediatek/mt8173/vpu_d.bin | Bin 2977184 -> 2977184 bytes
 mediatek/mt8173/vpu_p.bin | Bin 131180 -> 131180 bytes
 2 files changed, 0 insertions(+), 0 deletions(-)

diff --git a/mediatek/mt8173/vpu_d.bin b/mediatek/mt8173/vpu_d.bin
index 00d9c47d19a1dfa10244a5b030d171982333bbb8..45e214dd4aac4c54b8dc2778c7de3de69c6f41a6 100644
GIT binary patch
delta 198
zcmWN=w++HT002OloO8}OnwI`+T09X2YcK*0Vi=a;PP*6c6TN)jLv(#4;hBWUlxZ_&
z&6&4g(UN5=R;^jLVbhjvJ9h2aci_;GV<%3XId|dGm1{R{-MRPR(UWK6ZxSxI_z!i>
BJ;MM1

delta 198
zcmWN=w++HT002OloO8}Onvwy&ro|Icum&U0AckQX?xcJDKGDnfJw(?>5}rwjOqn)g
z)|`0@7A;w}V%3^;8#Zm(wqw_xeFqL5Id<aInR6E|UAcDS)}4C~9zA(B{wCpai~n^K
BJ;DG0

diff --git a/mediatek/mt8173/vpu_p.bin b/mediatek/mt8173/vpu_p.bin
index c3a6678ec4eabbdacd9504988f01fb3dbaf6c1de..96f1c632972cb068d0c1aacbc78b5cc0da07bf4a 100644
GIT binary patch
delta 20
ccmaFU!11PmV}tZm#x2b<Q@6`ZWems$0AGv<RsaA1

delta 20
ccmaFU!11PmV}tZm#ud#nQ@6`ZWems$0ACacN&o-=

-- 
2.18.0

