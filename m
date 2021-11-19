Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C95CF45687B
	for <lists+linux-media@lfdr.de>; Fri, 19 Nov 2021 04:15:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231620AbhKSDSX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 18 Nov 2021 22:18:23 -0500
Received: from wnew2-smtp.messagingengine.com ([64.147.123.27]:59257 "EHLO
        wnew2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231129AbhKSDSX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 18 Nov 2021 22:18:23 -0500
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailnew.west.internal (Postfix) with ESMTP id 2396F2B00BDB;
        Thu, 18 Nov 2021 22:15:21 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Thu, 18 Nov 2021 22:15:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
        from:to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=fm1; bh=ZKw8cbPJcQFgW+5fi8hG151sar
        +/M6ln0z0DF4Hg8O4=; b=U42fL80KZu+LedDkGjrU/xvCB3gfmgD0l62nJ5L/+W
        JxUKaAPIEKm5FIPK69/+kom4KQtYCkyFGl+Tds3Q40EAzEmnefV5dcmPXzR+Lr2d
        ygsFPNTStSE/TkLq4Z77RiC5lHI6ATHNIoiL8PTa4/koWVLLbc9+AJGbyAv24rNC
        s2nHWnHSyk4mxxc69STAQNYxwQgWH7IXncYT2qRvYoXaV1TbRbpr6afPdwFydk09
        AqQMRDfhn8g/7I7XS2N9WO3CXoT7nhrHg8rDrSKwdJmKrTvLPMn2PbZwBw5Vybtz
        IEEaxeRz6quwIu4XtdHLZNEYeOrX0mpacxcBe0c++wSg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=ZKw8cbPJcQFgW+5fi
        8hG151sar+/M6ln0z0DF4Hg8O4=; b=eDQskkHxpCOKhpusoisrEWcxp8TnKaj7m
        GzmOHKTGOmf/767rqFVZX+g+X/qNp5d2fJIR+yU3dITC6JGvYinDtomhZX0HdVm9
        SxznLqHWvEtuo4trtuzMYD4c/EXEEfsKu+3Z/CVJsQbaAeOvrhF/lkoSH06tiWaz
        V8WZYz8aOSfyr+ApvYBxQg0x18Efe6Fl+uRybpl9W+1jhzJ4KwVoIp2Z9pLQK20P
        GqpQYtPEpBatefUN/SUjYXlU08pjsiz6FRrPo8YCjBrBBN6fw3giLK1/O8sQUwKr
        c6HwZYM1YbG47r33NV1kmpsWDCnYGD5b2aUGr8TgWgHm+ld1IV5tg==
X-ME-Sender: <xms:yBaXYQnC9o7TiRjifvW8juBpKwLagZ55w0QsbSdj9PQjsnOqJ355Lg>
    <xme:yBaXYf3PpofX9tweoj0OOz3orac9SVT8xvDCiA8cgYBhl0mXfAyNC1UcXmFIvgcDA
    R148d4YKhzNTUaszw>
X-ME-Received: <xmr:yBaXYeo0gLv0uZ0-LdxEGO9-cxoSJR8R5F0JRBfOAwO8H9J3SpKjE-31z2Ct6ygg_NRUprM8zITz6re9gSUnoh5CHjQsxdRobcOIBD71HwD1ukSBOY2PCjoRS_EScl02Mffnag>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrfeejgdehiecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvffufffkofgggfestdekredtredttdenucfhrhhomhepufgrmhhuvghlucfj
    ohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqnecuggftrfgrth
    htvghrnhepieetkefhheduudfgledtudefjeejfeegveehkeeufffhhfejkeehiefftdev
    tdevnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepsh
    grmhhuvghlsehshhholhhlrghnugdrohhrgh
X-ME-Proxy: <xmx:yBaXYckvvP2n9M6bOL_5SxH1Yuttr1Y3YYO25HiKf0F9qmM_b5vnEg>
    <xmx:yBaXYe2ynrN7f8T5L04-j3HQoCeoJ8hAFQLY1-IGVSczBQ7eNZG0WQ>
    <xmx:yBaXYTu5tQip01H0r9YU-erqBwUHMgOYGBc1tNL4qvVKBCSJf9_UKg>
    <xmx:yBaXYXvae1zAOmiGD1XoMGbQl3sGzt1X65OJEQKuT5TdQ6oN-EiJ-my8EDU>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 18 Nov 2021 22:15:19 -0500 (EST)
From:   Samuel Holland <samuel@sholland.org>
To:     Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
Cc:     Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        linux-sunxi@lists.linux.dev, Samuel Holland <samuel@sholland.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: media: Add compatible for D1
Date:   Thu, 18 Nov 2021 21:15:17 -0600
Message-Id: <20211119031519.23430-1-samuel@sholland.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

D1 contains a video engine similar to the one in other sunxi SoCs.
Add a compatible for it.

Signed-off-by: Samuel Holland <samuel@sholland.org>
---

 .../bindings/media/allwinner,sun4i-a10-video-engine.yaml         | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-video-engine.yaml b/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-video-engine.yaml
index c34303b87a5b..c3de96d10396 100644
--- a/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-video-engine.yaml
+++ b/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-video-engine.yaml
@@ -20,6 +20,7 @@ properties:
       - allwinner,sun8i-h3-video-engine
       - allwinner,sun8i-v3s-video-engine
       - allwinner,sun8i-r40-video-engine
+      - allwinner,sun20i-d1-video-engine
       - allwinner,sun50i-a64-video-engine
       - allwinner,sun50i-h5-video-engine
       - allwinner,sun50i-h6-video-engine
-- 
2.32.0

