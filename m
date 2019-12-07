Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 39174115EFA
	for <lists+linux-media@lfdr.de>; Sat,  7 Dec 2019 23:24:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725847AbfLGWYj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 7 Dec 2019 17:24:39 -0500
Received: from mail.kernel.org ([198.145.29.99]:36052 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726811AbfLGWYi (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 7 Dec 2019 17:24:38 -0500
Received: from ziggy.de (unknown [95.169.229.25])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 0A99D2467A;
        Sat,  7 Dec 2019 22:24:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1575757477;
        bh=fQiHeTSkXa+q0MUHJbEeA+eMFm4vY8RORCB2PwtjnWI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=i+jFxMOVR/Le+CyeFYT+Ny2XxmxO2U0qaZL/Aoa39NcnJnz9E7CyJ//4HpjjngsG5
         ap3WFeB76HRfSis+IWf8QafhdlI8yFQU7wR4svAj3i5wwSSEdKDqPHZbdYNofPFZKK
         GCJlxe7j4QUFU2uYTDOKCSHnT1WFT7ADNsL68wE8=
From:   matthias.bgg@kernel.org
To:     robh+dt@kernel.org, mark.rutland@arm.com, ck.hu@mediatek.com,
        p.zabel@pengutronix.de, airlied@linux.ie, mturquette@baylibre.com,
        sboyd@codeaurora.org, ulrich.hecht+renesas@gmail.com,
        laurent.pinchart@ideasonboard.com, enric.balletbo@collabora.com
Cc:     sean.wang@mediatek.com, sean.wang@kernel.org,
        rdunlap@infradead.org, wens@csie.org, hsinyi@chromium.org,
        frank-w@public-files.de, drinkcat@chromium.org,
        linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, mbrugger@suse.com
Subject: [PATCH v6 02/12] dt-bindings: mediatek: Add compatible for mt7623
Date:   Sat,  7 Dec 2019 23:23:39 +0100
Message-Id: <20191207222349.23161-3-matthias.bgg@kernel.org>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191207222349.23161-1-matthias.bgg@kernel.org>
References: <20191207222349.23161-1-matthias.bgg@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Matthias Brugger <mbrugger@suse.com>

MediaTek mt7623 uses the mt2701 binings as fallback.
Document this in the binding description.

Signed-off-by: Matthias Brugger <mbrugger@suse.com>
---
 .../devicetree/bindings/display/mediatek/mediatek,disp.txt      | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt b/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt
index c71c8a4b73ff..a747895574f1 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt
@@ -42,6 +42,8 @@ Required properties (all function blocks):
 	"mediatek,<chip>-disp-od"		- overdrive
 	"mediatek,<chip>-mmsys", "syscon"	- provide clocks and components management
   the supported chips are mt2701, mt2712 and mt8173.
+  For mt7623, compatible must be:
+        "mediatek,mt7623-<component>" , "mediatek,mt2701-<component>"
 
 - reg: Physical base address and length of the function block register space
 - interrupts: The interrupt signal from the function block (required, except for
-- 
2.24.0

