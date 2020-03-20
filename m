Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 13E5618D48C
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2020 17:34:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727593AbgCTQec (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 20 Mar 2020 12:34:32 -0400
Received: from mout.kundenserver.de ([212.227.17.24]:56999 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727530AbgCTQeb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 20 Mar 2020 12:34:31 -0400
Received: from mail.cetitecgmbh.com ([87.190.42.90]) by
 mrelayeu.kundenserver.de (mreue107 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1MtwpW-1jXpvO096q-00uJSB for <linux-media@vger.kernel.org>; Fri, 20 Mar
 2020 17:34:30 +0100
Received: from pflvmailgateway.corp.cetitec.com (unknown [127.0.0.1])
        by mail.cetitecgmbh.com (Postfix) with ESMTP id CE83B65007A
        for <linux-media@vger.kernel.org>; Fri, 20 Mar 2020 16:34:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at cetitec.com
Received: from mail.cetitecgmbh.com ([127.0.0.1])
        by pflvmailgateway.corp.cetitec.com (pflvmailgateway.corp.cetitec.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id pMtqCE5am2R4 for <linux-media@vger.kernel.org>;
        Fri, 20 Mar 2020 17:34:29 +0100 (CET)
Received: from pfwsexchange.corp.cetitec.com (unknown [10.10.1.99])
        by mail.cetitecgmbh.com (Postfix) with ESMTPS id 85FE564EFDB
        for <linux-media@vger.kernel.org>; Fri, 20 Mar 2020 17:34:29 +0100 (CET)
Received: from pflmari.corp.cetitec.com (10.8.5.41) by
 PFWSEXCHANGE.corp.cetitec.com (10.10.1.99) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Fri, 20 Mar 2020 17:34:29 +0100
Received: by pflmari.corp.cetitec.com (Postfix, from userid 1000)
        id 2CE8680503; Fri, 20 Mar 2020 17:12:02 +0100 (CET)
Date:   Fri, 20 Mar 2020 17:12:02 +0100
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
Subject: [PATCH v3 06/11] media: adv748x: prepare/enable mclk when the audio
 is used
Message-ID: <7ed1287d00da70de13627480b1601bfd2c6e570a.1584720678.git.alexander.riesen@cetitec.com>
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
References: <cover.1584720678.git.alexander.riesen@cetitec.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <cover.1584720678.git.alexander.riesen@cetitec.com>
X-Originating-IP: [10.8.5.41]
X-ClientProxiedBy: PFWSEXCHANGE.corp.cetitec.com (10.10.1.99) To
 PFWSEXCHANGE.corp.cetitec.com (10.10.1.99)
X-EsetResult: clean, is OK
X-EsetId: 37303A290D7F536A6D7660
X-Provags-ID: V03:K1:XFrmLvXQSG1UYe8P7iA3AHrA2zoM8iATkahHR5SCaKJIBwnVua1
 rG/ezHslFUVuillnIQ9PBE4jh+8CDInL4eSOvQ1qp9t/DwF4G+R7c+uRyvDSjib0h35o9ei
 sZD7SS6iMXLM3EpopnmoQLY9/G5+YUdZzNaUdTYb9aaMW/gdDwSWJvaDf4UD0/h73wH0xmE
 XaW9pJ2yBkKPmQw62RMDw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:sATbBTK90wc=:/RjROyNKVDP457LuOmFeZ9
 piRytjjHI6nMF1gO8WpWqlHiKE4fq1ZSMjWA0dn6o5rzE2KpY3Cq3kFuvA0DqrUlI1rf3hBhn
 EPmHZTDu450ke0akXzJMVlQZ8EwICZtIiWdK1+u3Gb7CJCcavxihvmzgvr0tn5DW8d8zguK/2
 OqmELDNbF/VmYbedWNSGRpRNV/nE7d0mKlDyoouGDSPbXYeJVEZNTrQq7nSB60A4zeUCwO8Kn
 3J48SVRAYU8Jv6gfK7ZHsiPGjE7DRhCBu9bAt8VGOiXxKtwogeVpw3+trNCLxFxXOWCg4zm6c
 d2UpOeXyKEfZx3RyR1EhrEa7j5NN2JjO9sG3rMJ4pejOzJgaAov9BGERWqwPBF8tC8dg0cW7Y
 eSvjzsv0MO1+AEOeEpq4qRMcSRQ1RJUyYUQ9jaqfsLmfWr8DWklf9qRR8FYKVxWuLlvinQU+0
 ar3sHyNK3yxQ56sCBbZzBMQ7vm/Rn7E5fD0d97J4WBVewGI/7YDneqQihkfkQ0E2HbZq1gJwb
 n26isYR0zZUuBBHuoFW/5GRp2fZt4BygRw1id9YuxVPhDl+enphw6+M1rCqHii8B/g1LOYxGK
 8LgILMJYY88mmPmGLVieGHHw8XWOWl8AJho6k2p/Zyg5Yy0lVYbXUr5CiJ68AsCqvwxYUFNC/
 83p+Sp/rpYwbugMWfD/gnxU9VDK7bpSi6mN1tZuGNFP361UGdDSf5zsxhm50Q9RcTGfQ6Ol54
 AATK+1E4yuqyNneBqdM5Y+RomOHFBwCvkXbJRLrObikQ2+VjHc7QTuXVpSMksqZOzyJ/EEl5V
 5QxwYXRbskVpyaAqGMLLXW+xlYpci6HMY+MbI5/Loljww6QYNBRFzjT6Dw8aO4vDe3mQP7s
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
index 6fce7d000423..1c673efd4745 100644
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
+	ret = clk_prepare_enable(state->dai.mclk);
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
 
+	clk_disable_unprepare(state->dai.mclk);
 	set_audio_pads_state(state, 0);
 }
 
-- 
2.25.1.25.g9ecbe7eb18


