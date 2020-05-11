Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 618DF1CE68E
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2020 23:02:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732060AbgEKVCi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 11 May 2020 17:02:38 -0400
Received: from v6.sk ([167.172.42.174]:52562 "EHLO v6.sk"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729143AbgEKVBm (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 11 May 2020 17:01:42 -0400
Received: from localhost (v6.sk [IPv6:::1])
        by v6.sk (Postfix) with ESMTP id 48001610D0;
        Mon, 11 May 2020 21:01:40 +0000 (UTC)
From:   Lubomir Rintel <lkundrak@v3.sk>
To:     Liam Girdwood <lgirdwood@gmail.com>
Cc:     Mark Brown <broonie@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, Lubomir Rintel <lkundrak@v3.sk>
Subject: [PATCH 02/11] ASoC: mmp-sspa: Drop S20_3LE case
Date:   Mon, 11 May 2020 23:01:25 +0200
Message-Id: <20200511210134.1224532-3-lkundrak@v3.sk>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200511210134.1224532-1-lkundrak@v3.sk>
References: <20200511210134.1224532-1-lkundrak@v3.sk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

It does nothing, because the corresponding bit s not flipped on in .formats
and the audio SRAM DMA engine is not able to handle 20-bit transfers
anyway.

Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
---
 sound/soc/pxa/mmp-sspa.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/sound/soc/pxa/mmp-sspa.c b/sound/soc/pxa/mmp-sspa.c
index 1ca6afe464c4..90a9bc81be80 100644
--- a/sound/soc/pxa/mmp-sspa.c
+++ b/sound/soc/pxa/mmp-sspa.c
@@ -275,9 +275,6 @@ static int mmp_sspa_hw_params(struct snd_pcm_substream *substream,
 	case SNDRV_PCM_FORMAT_S16_LE:
 		sspa_ctrl |= SSPA_CTL_XSSZ1(SSPA_CTL_16_BITS);
 		break;
-	case SNDRV_PCM_FORMAT_S20_3LE:
-		sspa_ctrl |= SSPA_CTL_XSSZ1(SSPA_CTL_20_BITS);
-		break;
 	case SNDRV_PCM_FORMAT_S24_3LE:
 		sspa_ctrl |= SSPA_CTL_XSSZ1(SSPA_CTL_24_BITS);
 		break;
-- 
2.26.2

