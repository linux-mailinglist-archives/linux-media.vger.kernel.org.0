Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 048843DB83C
	for <lists+linux-media@lfdr.de>; Fri, 30 Jul 2021 14:07:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238792AbhG3MHP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 30 Jul 2021 08:07:15 -0400
Received: from mout.gmx.net ([212.227.17.21]:45619 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S238745AbhG3MHO (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 30 Jul 2021 08:07:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1627646799;
        bh=FOQ3kf7nC91N2pAcyJy+ukr7C27FR3nQ3DekDqj8uEI=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
        b=SlQlS2e/5cr5IQ2fa8QR7A4b+mf+myEnxGLmMZJMRsxc7C6QbaN6sxtPbeJ9DKjcQ
         KTKVbDH/GfqMcD9V/ooYsKa4KA0Vbhdx9noBM6+LD71cRA+6UXJPVBriHDvNN0DmKI
         yyEtUDQVHUJ5U48CFjKqPjhfuocD8p842IRX/jRs=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [217.61.152.200] ([217.61.152.200]) by web-mail.gmx.net
 (3c-app-gmx-bs05.server.lan [172.19.170.54]) (via HTTP); Fri, 30 Jul 2021
 14:06:39 +0200
MIME-Version: 1.0
Message-ID: <trinity-166e2707-ca11-4d84-803f-43732de72e2b-1627646799181@3c-app-gmx-bs05>
From:   Frank Wunderlich <frank-w@public-files.de>
To:     Yong Wu <yong.wu@mediatek.com>
Cc:     Matthias Brugger <matthias.bgg@gmail.com>,
        Joerg Roedel <joro@8bytes.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        David Airlie <airlied@linux.ie>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Evan Green <evgreen@chromium.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Will Deacon <will.deacon@arm.com>,
        linux-mediatek@lists.infradead.org, srv_heupstream@mediatek.com,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux-foundation.org, yong.wu@mediatek.com,
        youlin.pei@mediatek.com, Nicolas Boichat <drinkcat@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>, anan.sun@mediatek.com,
        ming-fan.chen@mediatek.com, yi.kuo@mediatek.com,
        acourbot@chromium.org, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
        Chun-Kuang Hu <chunkuang.hu@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Xia Jiang <xia.jiang@mediatek.com>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        Hsin-Yi Wang <hsinyi@chromium.org>,
        Eizan Miyamoto <eizan@chromium.org>, anthony.huang@mediatek.com
Subject: Aw: [PATCH v7 00/12] Clean up "mediatek,larb"
Content-Type: text/plain; charset=UTF-8
Date:   Fri, 30 Jul 2021 14:06:39 +0200
Importance: normal
Sensitivity: Normal
In-Reply-To: <20210730025238.22456-1-yong.wu@mediatek.com>
References: <20210730025238.22456-1-yong.wu@mediatek.com>
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:Ju8UvQ9aQQ211RZizAddcu/LK0Fbm40eWbtOgPOujam+ZiApQCh89ygqJKUfghzFx3Em+
 2gYhue+9Tw2MD6gxpnG7k1n49GwJ96zbYr1t0dKh0XNlowbze19Bdjyh25AQrFqjwwEBD5zmvd83
 mhgHUGlB8Ek/ujixS17y/tmLUcS6lj6J3JAEdYwCmEJOBtpSoiNFM3NNFkq6C1Kia0XV7mTPl8vn
 vIhfuilUuastgrBdB7uKylodyw+GkvQKNLmACZ0chLIvF4sg96dcRXaudTEuldb+NRZCXQ2lp6Fe
 X4=
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:A1JU1CJi+pQ=:iWEaNtvfYekBmQdj4p6NXW
 UCTDP5kHinGH0vNnqhIZRPdE39sbNxHrVO/p9Q24RiiXHAyeUJq8L+93SGGOg4tPCbdTxfiKV
 QNPWJF70uYhxy7mgbZlvInK5n6x9M1/K1gNBf3lccsTjt0t4n7WcI4NKCruv73h/djU0LVXne
 u+0SY70AaL3ley93WPeezkfjb8VSz88R2HcvX9McS6Od/X98F06af4B/GbOm1djPXU1SXfpKo
 KUIyySiyy6TRpyKROR56bXkdpixhsjixdqQCnx1NOPihzse8xL39ftyMRCoEojHVSiXTDrgV0
 wYLpEHQ3csdA1t3aEvcUXJrFC/iilayKyvXe9HrWP5LjD5hZlvX++dSXMC2bS+sjJ+eOU4CkG
 q5M0m7y1SLgWSah28VRg6keBpjwkiusGHwSeFrJBy9o+wBg7RZq2fwYkcq/79Mq9yixMZOoR6
 nhiymGdyIERrtxqU6M7A2syxtcjcXbLCmxadopF91xMgIPyRJLQmESawqxIuX/JKCRU8WnICX
 yaVOTYoq5ZT+yOg7fTBack7iK2KxkkNeuDn9dy/MhyU31tAOibr7pfGIyuHmU+MKjqOSn8sD2
 yJIhbYA42sZeUNd4oYzJMShnDHIkHHbMBy5uAgWrxznbOECqrG5/wUBFgzPZW93EAvMmi7d6r
 lk0vBXlmisYQWoMoO9WVZCx1Jf118gMwBc5emj7E35X/YicRI/KoVpTwSfgLVwFIUf/8E1yYK
 NxOYhTRYoQfJZSsRL/ySFrn1KZ2Wx9AntKI1JV3pQblcuhCCvu9yfmLU+oxe/6k6j32YmVzRy
 sVTI6932Tsaqfe0g/gNwzm3RroETnuenND43TwPhPdSsqPyflo=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Full Series tested on BPI-R2/MT7623

Tested-By: Frank Wunderlich <frank-w@public-files.de>

regards Frank
