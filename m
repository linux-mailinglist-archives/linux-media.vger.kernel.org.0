Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 57202193D54
	for <lists+linux-media@lfdr.de>; Thu, 26 Mar 2020 11:53:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727983AbgCZKxk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 26 Mar 2020 06:53:40 -0400
Received: from mout.kundenserver.de ([212.227.126.135]:57917 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727928AbgCZKxk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 26 Mar 2020 06:53:40 -0400
Received: from mail.cetitecgmbh.com ([87.190.42.90]) by
 mrelayeu.kundenserver.de (mreue009 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MZCSn-1in16p3DM1-00VA03 for <linux-media@vger.kernel.org>; Thu, 26 Mar
 2020 11:53:38 +0100
Received: from pflvmailgateway.corp.cetitec.com (unknown [127.0.0.1])
        by mail.cetitecgmbh.com (Postfix) with ESMTP id 8AFCB64FB32
        for <linux-media@vger.kernel.org>; Thu, 26 Mar 2020 10:53:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at cetitec.com
Received: from mail.cetitecgmbh.com ([127.0.0.1])
        by pflvmailgateway.corp.cetitec.com (pflvmailgateway.corp.cetitec.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id veahkMvJb04w for <linux-media@vger.kernel.org>;
        Thu, 26 Mar 2020 11:53:38 +0100 (CET)
Received: from pfwsexchange.corp.cetitec.com (unknown [10.10.1.99])
        by mail.cetitecgmbh.com (Postfix) with ESMTPS id 49D4264D5D2
        for <linux-media@vger.kernel.org>; Thu, 26 Mar 2020 11:53:38 +0100 (CET)
Received: from pflmari.corp.cetitec.com (10.8.5.79) by
 PFWSEXCHANGE.corp.cetitec.com (10.10.1.99) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Thu, 26 Mar 2020 11:53:38 +0100
Received: by pflmari.corp.cetitec.com (Postfix, from userid 1000)
        id 220CD80503; Thu, 26 Mar 2020 11:35:42 +0100 (CET)
Date:   Thu, 26 Mar 2020 11:35:42 +0100
From:   Alex Riesen <alexander.riesen@cetitec.com>
To:     Kieran Bingham <kieran.bingham@ideasonboard.com>
CC:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        "Laurent Pinchart" <laurent.pinchart@ideasonboard.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        <devel@driverdev.osuosl.org>, <linux-media@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-renesas-soc@vger.kernel.org>
Subject: [PATCH v4 6/9] media: adv748x: prepare/enable mclk when the audio is
 used
Message-ID: <c4469e5897f0974c3e6eaba7cd1d4be983cf84a9.1585218857.git.alexander.riesen@cetitec.com>
Mail-Followup-To: Alex Riesen <alexander.riesen@cetitec.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        devel@driverdev.osuosl.org, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
References: <cover.1585218857.git.alexander.riesen@cetitec.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <cover.1585218857.git.alexander.riesen@cetitec.com>
X-Originating-IP: [10.8.5.79]
X-ClientProxiedBy: PFWSEXCHANGE.corp.cetitec.com (10.10.1.99) To
 PFWSEXCHANGE.corp.cetitec.com (10.10.1.99)
X-EsetResult: clean, is OK
X-EsetId: 37303A290D7F536A6D7C67
X-Provags-ID: V03:K1:N0wEtCKxltQcD1SNnPBgnATBdwCuHSFHkb7kjfeo6faBuL6Uu+N
 XpCtjWM206vpO/cQFGDSMiHEcYv6r119PjJi/ISwCSNQ25OHM79ktzUwfGo4zJdRZGhN4R5
 gPVKydl6NfDVkMn/7An6M62FUnE3vtqj0yCnRKUywEN7vZLBqXF86Qz95OLHnK1WxClBkjw
 pNGIZ1KL6TjSk0MdACy4g==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:jl73t5e+VAo=:9YhLAqtjh1+BnRuisLCZKr
 f54CO/xuDsP8d7pvDnC+2FajEh1WoF9o2Pd/tlq3AgCN+x6dqoSTcFc1UIZ0LhzQI7WViFTQG
 T5U6bBxTViifMN65JlEjoIZKiCMOR+CMCMDbygr5pLvgsECxwhwGpm15SV6YT3rRd6mSWi0be
 O/eOv2TJ+7vH0j0Hj/HOWTqAse4UNUPAaQGRnUWPS9/+M3sUXaXxcX5tzqOfECXcUIuKTu4si
 gwxshCyNloyTRAimKduFr11kwMEogaheZRhC7zVDviFeTGYhBY2CKr/6HcojvS3SKC/o6iumh
 mjwRkNJcQCeMzyzOVxYBJ8dpmQPv9pc0XG37qg+ypPFimY6wl/pwlqlctM4wujk6H1MNvMVnm
 rxilj4Iuz08TZEE/qsiPa7AGrwisNUch4eA3jGq5ClPjyQH4RiComwDIkDjNjq/k/pHpYCFgN
 JG9ZsI/xL8AHQ3Zh+o8hRV+r88MSGbttNBT7lgPNuPWEXqGsyAasKfePRtxQZRdycuT5YGa8z
 26DVdPbw5xPh8913UhbJfF34OQCDNwCSwYT9MIeZBdtdFHogyYHQQ0C6kCFBLIUMggI4aAGD5
 OOxreJkRduTjuljHcoFoGZLu4zNaihhGUhfhhkIv2NB5yfXdxHsOUARBsfzF16eku6Hg8kJCt
 SHVCIHyHwBTSSYkjmygmi7thzbDoM0bNVdY6Xxygfg7bWRvlLtV/BmtlBQHME2OdCgjswO8ZH
 N9ZoTEL0SlZMQ+C+98H92kPuU4nbmTYudYE9tiigx1Cm1/+3BGrcI8LMliOktsPawDCTwdnhO
 2IxMLC8TsnJDyE2GuaJWE+YaqhL7EEmhrHVQVuyBFNITdiSK4Ov0CfdMPTMOt/D5/gfXlIf
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

As there is nothing else (the consumers are supposed to do that) which
enables the clock, do it in the driver.

Signed-off-by: Alexander Riesen <alexander.riesen@cetitec.com>
--

v3: added
---
 drivers/media/i2c/adv748x/adv748x-dai.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/adv748x/adv748x-dai.c b/drivers/media/i2c/adv748x/adv748x-dai.c
index c9191f8f1ca8..185f78023e91 100644
--- a/drivers/media/i2c/adv748x/adv748x-dai.c
+++ b/drivers/media/i2c/adv748x/adv748x-dai.c
@@ -117,11 +117,22 @@ static int adv748x_dai_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 
 static int adv748x_dai_startup(struct snd_pcm_substream *sub, struct snd_soc_dai *dai)
 {
+	int ret;
 	struct adv748x_state *state = state_of(dai);
 
 	if (sub->stream != SNDRV_PCM_STREAM_CAPTURE)
 		return -EINVAL;
-	return set_audio_pads_state(state, 1);
+	ret = set_audio_pads_state(state, 1);
+	if (ret)
+		goto fail;
+	ret = clk_prepare_enable(mclk_of(state));
+	if (ret)
+		goto fail_pwdn;
+	return 0;
+fail_pwdn:
+	set_audio_pads_state(state, 0);
+fail:
+	return ret;
 }
 
 static int adv748x_dai_hw_params(struct snd_pcm_substream *sub,
@@ -174,6 +185,7 @@ static void adv748x_dai_shutdown(struct snd_pcm_substream *sub, struct snd_soc_d
 {
 	struct adv748x_state *state = state_of(dai);
 
+	clk_disable_unprepare(mclk_of(state));
 	set_audio_pads_state(state, 0);
 }
 
-- 
2.25.1.25.g9ecbe7eb18


