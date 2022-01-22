Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E2BA1496C6B
	for <lists+linux-media@lfdr.de>; Sat, 22 Jan 2022 13:50:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232370AbiAVMuo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 22 Jan 2022 07:50:44 -0500
Received: from mailgw02.mediatek.com ([210.61.82.184]:57630 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S232327AbiAVMun (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 22 Jan 2022 07:50:43 -0500
X-UUID: 799e09cdeffc4cd9987808cd058acb05-20220122
X-UUID: 799e09cdeffc4cd9987808cd058acb05-20220122
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw02.mediatek.com
        (envelope-from <irui.wang@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 1715124488; Sat, 22 Jan 2022 20:50:40 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3;
 Sat, 22 Jan 2022 20:50:39 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sat, 22 Jan 2022 20:50:38 +0800
From:   Irui Wang <irui.wang@mediatek.com>
To:     <linux-firmware@kernel.org>
CC:     <linux-mediatek@lists.infradead.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-media@vger.kernel.org>, <tiffany.lin@mediatek.com>,
        <Maoguang.Meng@mediatek.com>, <Longfei.Wang@mediatek.com>,
        <Yunfei.Dong@mediatek.com>, <Andrew-CT.Chen@mediatek.com>,
        <erin.lo@mediatek.com>, <PoChun.Lin@mediatek.com>,
        <irui.wang@mediatek.com>, <srv_heupstream@mediatek.com>
Subject: [PATCH] linux-firmware: mediatek: Update MT8173 VPU firmware to v1.1.7
Date:   Sat, 22 Jan 2022 20:50:29 +0800
Message-ID: <20220122125029.22195-2-irui.wang@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220122125029.22195-1-irui.wang@mediatek.com>
References: <20220122125029.22195-1-irui.wang@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-MTK:  N
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

[encoder vp8]
set buffer pitch info by input format

Release Version: 1.1.7

Signed-off-by: Irui Wang <irui.wang@mediatek.com>
---
 mediatek/mt8173/vpu_d.bin | Bin 2977184 -> 2977184 bytes
 mediatek/mt8173/vpu_p.bin | Bin 131180 -> 131180 bytes
 2 files changed, 0 insertions(+), 0 deletions(-)

diff --git a/mediatek/mt8173/vpu_d.bin b/mediatek/mt8173/vpu_d.bin
index 45e214dd4aac4c54b8dc2778c7de3de69c6f41a6..e966b49bee57e8cfaa3536174830916cf35b184f 100644
GIT binary patch
delta 370
zcmXZWy-LGS7>DtHVv|OjRIOEO{j9C^tB44qlVB)LA}%^Ob#`)a$nM~3^aeWQ0s_Gb
zMG)*22yP+>-arON2cLikemv)Whr{W9JQ`iZj%B5>^!(si_3CjbRgj$v&ij?A^1bvG
zCZX52lbn0HYwRUwhcD(<{3<mDQVToSN1xpR_5bfj^aSUF#BcX%e&<uNc>9jpbo*P%
z(++jAJuT4oo8;1K>Sc2(6|*_zAD5+@D7cLR115%$g9RITI2gtV3UJ|}h*6AT93@Pk
pj7dyk8Wqf-idoEI9t&8+5^7jR9Sy9YiB+s&9UItuih|bf&mT1*fl&Ye

delta 370
zcmXZWJ4?e*7>DtHVow@vQnlV{jh9;QiksqU@dI=b#8I4_9J4z(r!I~i@&O7#1s9>S
zgF**U1W|DiQ3r7n@d^0CkLSE+IGo1aiPb>UHRiY}?H>82QmRE#fONK*_P(uRU3!j^
z$Uk?Ij8|K+R+G*33wwF1C0(M8TRdO~FL?bwzteC0wvy_`X}Rj&ONO`Cs6%far7U%y
zklxcAeY=u88eB_$x_?OdbpPZZdxe8IJd8sNHad`jfrBhubfOD6c<_-&H+s;E0{YO8
o0SsaYMGT{a5d;{;7{)PyGA2>M6s9qQS<GP`3s^jh!=<0EKXfvMYybcN

diff --git a/mediatek/mt8173/vpu_p.bin b/mediatek/mt8173/vpu_p.bin
index 96f1c632972cb068d0c1aacbc78b5cc0da07bf4a..55a49ec244539011213928bb66909a3564af703e 100644
GIT binary patch
delta 5437
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

delta 5601
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
WfA>NC>xisj8-bNH*VhT;XZ{cKCJoB~

-- 
2.25.1

