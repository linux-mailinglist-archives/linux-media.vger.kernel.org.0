Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7D8CF1CE68C
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2020 23:02:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732019AbgEKVC2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 11 May 2020 17:02:28 -0400
Received: from v6.sk ([167.172.42.174]:52574 "EHLO v6.sk"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732080AbgEKVBn (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 11 May 2020 17:01:43 -0400
Received: from localhost (v6.sk [IPv6:::1])
        by v6.sk (Postfix) with ESMTP id B093E610D1;
        Mon, 11 May 2020 21:01:41 +0000 (UTC)
From:   Lubomir Rintel <lkundrak@v3.sk>
To:     Liam Girdwood <lgirdwood@gmail.com>
Cc:     Mark Brown <broonie@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, Lubomir Rintel <lkundrak@v3.sk>
Subject: [PATCH 03/11] ASoC: mmp-sspa: A trivial typo fix
Date:   Mon, 11 May 2020 23:01:26 +0200
Message-Id: <20200511210134.1224532-4-lkundrak@v3.sk>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200511210134.1224532-1-lkundrak@v3.sk>
References: <20200511210134.1224532-1-lkundrak@v3.sk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

"Transmit", not "Tansmit".

Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
---
 sound/soc/pxa/mmp-sspa.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/pxa/mmp-sspa.h b/sound/soc/pxa/mmp-sspa.h
index 7d1b7c7325df..611063a7af68 100644
--- a/sound/soc/pxa/mmp-sspa.h
+++ b/sound/soc/pxa/mmp-sspa.h
@@ -38,7 +38,7 @@
 #define	SSPA_CTL_XFRLEN2(x)	((x) << 24)	/* Transmit Frame Length in Phase 2 */
 #define	SSPA_CTL_XWDLEN2_MASK	(7 << 21)
 #define	SSPA_CTL_XWDLEN2(x)	((x) << 21)	/* Transmit Word Length in Phase 2 */
-#define	SSPA_CTL_XDATDLY(x)	((x) << 19)	/* Tansmit Data Delay */
+#define	SSPA_CTL_XDATDLY(x)	((x) << 19)	/* Transmit Data Delay */
 #define	SSPA_CTL_XSSZ2_MASK	(7 << 16)
 #define	SSPA_CTL_XSSZ2(x)	((x) << 16)	/* Transmit Sample Audio Size */
 #define	SSPA_CTL_XFRLEN1_MASK	(7 << 8)
-- 
2.26.2

