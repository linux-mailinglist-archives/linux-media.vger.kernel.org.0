Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 236071CE66C
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2020 23:02:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732380AbgEKVBy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 11 May 2020 17:01:54 -0400
Received: from v6.sk ([167.172.42.174]:52638 "EHLO v6.sk"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732371AbgEKVBw (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 11 May 2020 17:01:52 -0400
Received: from localhost (v6.sk [IPv6:::1])
        by v6.sk (Postfix) with ESMTP id 1ACDF610D5;
        Mon, 11 May 2020 21:01:51 +0000 (UTC)
From:   Lubomir Rintel <lkundrak@v3.sk>
To:     Liam Girdwood <lgirdwood@gmail.com>
Cc:     Mark Brown <broonie@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, Lubomir Rintel <lkundrak@v3.sk>
Subject: [PATCH 09/11] ASoC: mmp-sspa: Set appropriate bus format for given bit width
Date:   Mon, 11 May 2020 23:01:32 +0200
Message-Id: <20200511210134.1224532-10-lkundrak@v3.sk>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200511210134.1224532-1-lkundrak@v3.sk>
References: <20200511210134.1224532-1-lkundrak@v3.sk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The values set by set_dai_fmt() and hw_params() seem to be tailored only
for 32-bit formats. Negotiate the correct ones in hw_params() callback
instead.

This was essentially copied from the OLPC kernel driver and tested to
fix wrong audio output for non-32bit formats. The documentation is not
available.

Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
---
 sound/soc/pxa/mmp-sspa.c | 40 ++++++++++++++++++++++++++++------------
 sound/soc/pxa/mmp-sspa.h |  2 ++
 2 files changed, 30 insertions(+), 12 deletions(-)

diff --git a/sound/soc/pxa/mmp-sspa.c b/sound/soc/pxa/mmp-sspa.c
index 9cb17c4fb0c8..86277471974a 100644
--- a/sound/soc/pxa/mmp-sspa.c
+++ b/sound/soc/pxa/mmp-sspa.c
@@ -191,8 +191,6 @@ static int mmp_sspa_set_dai_fmt(struct snd_soc_dai *cpu_dai,
 
 	switch (fmt & SND_SOC_DAIFMT_FORMAT_MASK) {
 	case SND_SOC_DAIFMT_I2S:
-		sspa->sp |= SSPA_TXSP_FPER(63);
-		sspa->sp |= SSPA_SP_FWID(31);
 		sspa->ctrl |= SSPA_CTL_XDATDLY(1);
 		break;
 	default:
@@ -216,30 +214,48 @@ static int mmp_sspa_hw_params(struct snd_pcm_substream *substream,
 {
 	struct sspa_priv *sspa = snd_soc_dai_get_drvdata(dai);
 	u32 sspa_ctrl = sspa->ctrl;
-
-	sspa_ctrl &= ~SSPA_CTL_XFRLEN1_MASK;
-	sspa_ctrl |= SSPA_CTL_XFRLEN1(params_channels(params) - 1);
-	sspa_ctrl &= ~SSPA_CTL_XWDLEN1_MASK;
-	sspa_ctrl |= SSPA_CTL_XWDLEN1(SSPA_CTL_32_BITS);
-	sspa_ctrl &= ~SSPA_CTL_XSSZ1_MASK;
+	int bits;
+	int bitval;
 
 	switch (params_format(params)) {
 	case SNDRV_PCM_FORMAT_S8:
-		sspa_ctrl |= SSPA_CTL_XSSZ1(SSPA_CTL_8_BITS);
+		bits = 8;
+		bitval = SSPA_CTL_8_BITS;
 		break;
 	case SNDRV_PCM_FORMAT_S16_LE:
-		sspa_ctrl |= SSPA_CTL_XSSZ1(SSPA_CTL_16_BITS);
+		bits = 16;
+		bitval = SSPA_CTL_16_BITS;
 		break;
 	case SNDRV_PCM_FORMAT_S24_3LE:
-		sspa_ctrl |= SSPA_CTL_XSSZ1(SSPA_CTL_24_BITS);
+		bits = 24;
+		bitval = SSPA_CTL_24_BITS;
 		break;
 	case SNDRV_PCM_FORMAT_S32_LE:
-		sspa_ctrl |= SSPA_CTL_XSSZ1(SSPA_CTL_32_BITS);
+		bits = 32;
+		bitval = SSPA_CTL_32_BITS;
 		break;
 	default:
 		return -EINVAL;
 	}
 
+	if (params_channels(params) == 2)
+		sspa_ctrl |= SSPA_CTL_XPH;
+
+	sspa_ctrl &= ~SSPA_CTL_XWDLEN1_MASK;
+	sspa_ctrl |= SSPA_CTL_XWDLEN1(bitval);
+
+	sspa_ctrl &= ~SSPA_CTL_XSSZ1_MASK;
+	sspa_ctrl |= SSPA_CTL_XSSZ1(bitval);
+
+	sspa_ctrl &= ~SSPA_CTL_XSSZ2_MASK;
+	sspa_ctrl |= SSPA_CTL_XSSZ2(bitval);
+
+	sspa->sp &= ~SSPA_SP_FWID_MASK;
+	sspa->sp |= SSPA_SP_FWID(bits - 1);
+
+	sspa->sp &= ~SSPA_TXSP_FPER_MASK;
+	sspa->sp |= SSPA_TXSP_FPER(bits * 2 - 1);
+
 	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
 		mmp_sspa_write_reg(sspa, SSPA_TXCTL, sspa_ctrl);
 		mmp_sspa_write_reg(sspa, SSPA_TXFIFO_LL, 0x1);
diff --git a/sound/soc/pxa/mmp-sspa.h b/sound/soc/pxa/mmp-sspa.h
index 611063a7af68..328969b57ad1 100644
--- a/sound/soc/pxa/mmp-sspa.h
+++ b/sound/soc/pxa/mmp-sspa.h
@@ -63,7 +63,9 @@
 #define	SSPA_SP_FFLUSH		(1 << 2)	/* FIFO Flush */
 #define	SSPA_SP_S_RST		(1 << 1)	/* Active High Reset Signal */
 #define	SSPA_SP_S_EN		(1 << 0)	/* Serial Clock Domain Enable */
+#define	SSPA_SP_FWID_MASK	(0x3f << 20)
 #define	SSPA_SP_FWID(x)		((x) << 20)	/* Frame-Sync Width */
+#define	SSPA_TXSP_FPER_MASK	(0x3f << 4)
 #define	SSPA_TXSP_FPER(x)	((x) << 4)	/* Frame-Sync Active */
 
 /* sspa clock sources */
-- 
2.26.2

