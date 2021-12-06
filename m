Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CCE3F46963F
	for <lists+linux-media@lfdr.de>; Mon,  6 Dec 2021 14:04:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243804AbhLFNII (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Dec 2021 08:08:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52996 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243743AbhLFNIG (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Dec 2021 08:08:06 -0500
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65502C061354
        for <linux-media@vger.kernel.org>; Mon,  6 Dec 2021 05:04:37 -0800 (PST)
Received: by mail-pj1-x1031.google.com with SMTP id f18-20020a17090aa79200b001ad9cb23022so6090514pjq.4
        for <linux-media@vger.kernel.org>; Mon, 06 Dec 2021 05:04:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=EZNxS2Er2+TWPCvjwKrCutia6d+RziQ5eq8Nih9Wpag=;
        b=NwQdgeQkNdIYvLlsCYBFOR7AArMeA4ocHnxglBH96EmJ72XZY4K6lP0WXCMPZC5MRd
         e+xFSAfy3OIMsGoCjnF1s7RECqJpn+ibnWq/3RijwIqsS0/GA1OD6qEdDWL9wxC28o7F
         QlNXB+IfCpWa0uCAhBQoxLGfF26k79BLgWYFM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=EZNxS2Er2+TWPCvjwKrCutia6d+RziQ5eq8Nih9Wpag=;
        b=3m1fRjUPn87f3MZMJfk2SAoyQ/SChYZxH4z4p0iobMsVyaetHfDJmj/Ba/S+l5Sbxw
         q5wvmcfqtBK5ab3j6MLV1zQUwSM54qzKkv51eGpAa3OyJ+0/OkmyN1Octg7I7Nhamfrs
         u1W38OjsyR/pWJXQKp7LEZpOX0KFGAUToPFr5ewXDYMnhW649bFaEjIj4VtOnNiRzFXu
         8x6XwvI5b2e79HS0IBkH5Rzs1S/5n5i5iT1sp74vdaezWEfyMNHkiI3lDBXyWiqQTH1e
         XFlNN73DmJAo+W5YzcSK317ti3V1c4Zy+Akre0f6pO+0p6C5zeCc7p0yPy7VmmA/pGkI
         OrUQ==
X-Gm-Message-State: AOAM531XI87G/lI85C/+YXDor/+E9hDkGq7mVKe79QfD8PT7FJIcK2tp
        dlr10FkGIXoDX0IUPZeVA08sA/Y0htD5yg==
X-Google-Smtp-Source: ABdhPJxzHx6MmM0wI6OVhtmYu60irjAp+3SFk9nmVn9Dxj4qPjt0SsnUvMGMavc7yAJJu47x0/ncFg==
X-Received: by 2002:a17:902:b110:b0:142:7621:aecb with SMTP id q16-20020a170902b11000b001427621aecbmr43580422plr.55.1638795876908;
        Mon, 06 Dec 2021 05:04:36 -0800 (PST)
Received: from hsinyi-z840.tpe.corp.google.com ([2401:fa00:1:10:5044:6464:4ad7:572c])
        by smtp.gmail.com with ESMTPSA id v25sm12402292pfg.175.2021.12.06.05.04.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Dec 2021 05:04:36 -0800 (PST)
From:   Hsin-Yi Wang <hsinyi@chromium.org>
To:     Matthias Brugger <matthias.bgg@gmail.com>,
        Rob Herring <robh+dt@kernel.org>, linux-media@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        yong.wu@mediatek.com
Subject: [v6 3/3] arm64: dts: mt8183: add jpeg enc node for mt8183
Date:   Mon,  6 Dec 2021 21:04:25 +0800
Message-Id: <20211206130425.184420-3-hsinyi@chromium.org>
X-Mailer: git-send-email 2.34.1.400.ga245620fadb-goog
In-Reply-To: <20211206130425.184420-1-hsinyi@chromium.org>
References: <20211206130425.184420-1-hsinyi@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Maoguang Meng <maoguang.meng@mediatek.com>

Add jpeg encoder device tree node.

Signed-off-by: Maoguang Meng <maoguang.meng@mediatek.com>
Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
---
v5->v6: no change, rebase to latest linux-next
---
 arch/arm64/boot/dts/mediatek/mt8183.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
index ba4584faca5aea..ac6b0c12d3b339 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
@@ -1530,6 +1530,18 @@ larb4: larb@17010000 {
 			power-domains = <&spm MT8183_POWER_DOMAIN_VENC>;
 		};
 
+		venc_jpg: venc_jpg@17030000 {
+			compatible = "mediatek,mt8183-jpgenc", "mediatek,mtk-jpgenc";
+			reg = <0 0x17030000 0 0x1000>;
+			interrupts = <GIC_SPI 249 IRQ_TYPE_LEVEL_LOW>;
+			mediatek,larb = <&larb4>;
+			iommus = <&iommu M4U_PORT_JPGENC_RDMA>,
+				 <&iommu M4U_PORT_JPGENC_BSDMA>;
+			power-domains = <&spm MT8183_POWER_DOMAIN_VENC>;
+			clocks = <&vencsys CLK_VENC_JPGENC>;
+			clock-names = "jpgenc";
+		};
+
 		ipu_conn: syscon@19000000 {
 			compatible = "mediatek,mt8183-ipu_conn", "syscon";
 			reg = <0 0x19000000 0 0x1000>;
-- 
2.34.1.400.ga245620fadb-goog

