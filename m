Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CEF4919C940
	for <lists+linux-media@lfdr.de>; Thu,  2 Apr 2020 20:56:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389747AbgDBS4q (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 2 Apr 2020 14:56:46 -0400
Received: from mout.kundenserver.de ([212.227.126.133]:53179 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388658AbgDBS4q (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 2 Apr 2020 14:56:46 -0400
Received: from mail.cetitecgmbh.com ([87.190.42.90]) by
 mrelayeu.kundenserver.de (mreue011 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MWAjC-1jqYUx1IPi-00Xfun for <linux-media@vger.kernel.org>; Thu, 02 Apr
 2020 20:56:45 +0200
Received: from pflvmailgateway.corp.cetitec.com (unknown [127.0.0.1])
        by mail.cetitecgmbh.com (Postfix) with ESMTP id 165AB65073A
        for <linux-media@vger.kernel.org>; Thu,  2 Apr 2020 18:56:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at cetitec.com
Received: from mail.cetitecgmbh.com ([127.0.0.1])
        by pflvmailgateway.corp.cetitec.com (pflvmailgateway.corp.cetitec.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id 5OhCidiLQcDj for <linux-media@vger.kernel.org>;
        Thu,  2 Apr 2020 20:56:44 +0200 (CEST)
Received: from pfwsexchange.corp.cetitec.com (unknown [10.10.1.99])
        by mail.cetitecgmbh.com (Postfix) with ESMTPS id C3B2564E883
        for <linux-media@vger.kernel.org>; Thu,  2 Apr 2020 20:56:44 +0200 (CEST)
Received: from pflmari.corp.cetitec.com (10.8.5.12) by
 PFWSEXCHANGE.corp.cetitec.com (10.10.1.99) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Thu, 2 Apr 2020 20:56:44 +0200
Received: by pflmari.corp.cetitec.com (Postfix, from userid 1000)
        id E692280503; Thu,  2 Apr 2020 20:34:48 +0200 (CEST)
Date:   Thu, 2 Apr 2020 20:34:48 +0200
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
Subject: [PATCH v5 6/9] media: adv748x: prepare/enable mclk when the audio is
 used
Message-ID: <d9b7a7290e3d95b484a7a760484f827c3ed7651e.1585852001.git.alexander.riesen@cetitec.com>
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
References: <cover.1585852001.git.alexander.riesen@cetitec.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <cover.1585852001.git.alexander.riesen@cetitec.com>
X-Originating-IP: [10.8.5.12]
X-ClientProxiedBy: PFWSEXCHANGE.corp.cetitec.com (10.10.1.99) To
 PFWSEXCHANGE.corp.cetitec.com (10.10.1.99)
X-EsetResult: clean, is OK
X-EsetId: 37303A290D7F536A6C7266
X-Provags-ID: V03:K1:dYsccxcvogiUSMqnt94Ivd5rgQ7aEWnPO1/lXKXz6nts+OCHx/k
 vEUnD7LNUXu0pCLcJIQGLx9mU5Ut4gG373IIWHcgiYRo6TuJrqENKN2QPmi540G3sn/iaLo
 2Qp/dMVOdihcHU2ZCIg48T5/ysvWE9gk7/dtOastA3QrNxmYVEV9aKW+iK7wIvM4BIdQGQ5
 hjpXB5z7adacqa0GPEmoA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:rQOD1S/rrTc=:DuUpmpevglS2PPHFnobeuD
 gz3mAA86DdPLtqtoNUtexTUVLMA0ZXla5elhpFuPEE2JmqzTcwQrsg+bSt7oX4Tni+day/SVg
 k9H0XuwZFjFVbQ8C7vrLV3q8GnYU5SiZ55K0wU9wIjTOQf3aamxURd+XKtP0Mj4APAsGnJ8ot
 jM1rP+JJXDF+HlFT9tAy59WgW9i+owZcriHfp1w2GHIfmU/V9FTUuVDF59R66QFraEB2HNzNg
 w6f5kdqXjKYJjbDkqbdJWggrqKXaIM1a3JcA02YsZFhytYcEZvFOhgfrEi2NCCInKDhNeiXx2
 u8aCE2ln0PPlwpL1e9d79XaOiBbbvYk7aX+FdbEuKfsds1WSQ5EiNmzYPalzSPUoXB1JuxRnd
 U6sT1CbiiszbK7dkmygJsg2unzn29gCWl9xKYJHsc+pPrjFphtAvJyxMVZcUKWW/gJv5ct209
 /Nte7OzmqQ9symsJHgqd9uRKHP06ZaM27xT3xYRBSKnaNOEsvuUvDVEnCgeQYDTtuvNLN/8oA
 B4qL+hRaCjr1v77lvYXNPbQ8IsSJ0NyYHAkot/1VOoD9h7BzvBU5/8mWrN7gCIt+zU16pplNA
 kUD6Vajmf4LXXKgYeaWmOs2WR+qEpgWosRxLgWI9ffs4rlobvplfSmLmRLlMv/SQe0Zs0r4No
 aF9ansYgqeWCtl6eVf8LuysXgS3Wj1nkX5mIx5nMDJHJ5v/9980athdIhiwpPNguRIhIMqmrC
 c37XBvva4OV7FZv4Jk1UW/+KApiJod670lZLtdbiL7lcQG/pdleTTZBGIYWCXKsvty2zaDgV1
 QZYvz1urQvXycs4y/xoysCF7CV+K2+SOElA6cYLb7XyykGy636uFhgCcZ++0ssNI6PJSuUw
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


