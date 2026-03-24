Return-Path: <linux-media+bounces-56904-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qP8aGg/XwmllmgQAu9opvQ
	(envelope-from <linux-media+bounces-56904-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 19:25:19 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id BB5FC31AC73
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 19:25:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B2A793020235
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 18:25:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 135CA3A0B20;
	Tue, 24 Mar 2026 18:25:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nextdimension.cc header.i=@nextdimension.cc header.b="Jwhc9BwU"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D62F389445
	for <linux-media@vger.kernel.org>; Tue, 24 Mar 2026 18:25:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774376713; cv=none; b=S5zwtsC627fMzXQypNGpAIUa9cwcu038W/cPNyqVuX9VIGjyrwxRUW6Yhp/i0zpDjvwCm5EKmokP0c/r313xTVmsbLwHl8kfbIGpliK5Ip9go75wfsB45zqwYVYjHz8K0LGWmpcL98mra6YFweAf4GhixGh7uoyTmte3HJywAqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774376713; c=relaxed/simple;
	bh=y8io8PxMG8MwXdqdVbxMcnYLzv3xWvUgd1iqtoyflKY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=HLHptFFlvz1zft2TotHv8hfOc/maIA6rP1qipq08aqg0y5OOvnvTuiBLctpTWGcma5lL1GGVZNftBdovcDvL3FY69wi7phiBxv/OBREiRWM7vpC7ATmLbsQ2c7fCG8jTs1o7vlZOGPDeYDtufnWbK0bNDACwCBYX0VuLH/9zRaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nextdimension.cc; spf=pass smtp.mailfrom=nextdimension.cc; dkim=pass (2048-bit key) header.d=nextdimension.cc header.i=@nextdimension.cc header.b=Jwhc9BwU; arc=none smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nextdimension.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nextdimension.cc
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-79a46ebe2beso52576037b3.2
        for <linux-media@vger.kernel.org>; Tue, 24 Mar 2026 11:25:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nextdimension.cc; s=google; t=1774376711; x=1774981511; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WrmRgfIcrDWKthi/yT1zMwcggeMATVAvNxqOZqBUWCw=;
        b=Jwhc9BwUtMghCHZEruSSrEpRo1JamT0m5GFvljJ8e3Jc7N2NJLB0y4iKFKVWdMG5ks
         kKZ11merxhYkB7RZlT0/gdkCo5ok558gLMWvZCxxO+Rl4vmpdVccoebaF9ocdYoXknj8
         vvS5IjPa4vk58hAzFdCl9ehPdWvSG3U7u88bK0pX7FwjpobMqoqz5OEG1jze6ZPgFX2c
         Dpz4Mf3VsKvPKddBiuEYwMvPVbheNsdQHPh5HFJmphvd79WVKA+Q+D0xrivn8/NYnMco
         9jG5oqHHXjTHgnFxPoUD0JGjPECOnzT79om7O7Uf8NFySCrxrBmXkWnTeaoQ+zj35LUa
         Svmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774376711; x=1774981511;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WrmRgfIcrDWKthi/yT1zMwcggeMATVAvNxqOZqBUWCw=;
        b=Hc3D7WI6THI2Ax6/ulawzkKUuMe4MYawsZUbV2FZY9HUeuz8DJ2zx+edlyH+wa9tuT
         B9wM5YKLJNotd6rQ5BgM/UogkArvke0s0vdwnupg+MR4c2TDLDg80gdWhmKQH1xOfpBH
         /Y/2CJZCWOHl6DNUX5KaTq8ALK9OLiKBMyag1aeqW+aY/ZOA5iex8zgoJKX14hOui8YX
         3tB89E23ELXEuCxuNF5VUn89PR9W0OJ0uoiErG/pHZ8oAxBAhFKoAgGz2GO4Y8z/NA8f
         Rgz85q31A3QtwQLTAg/wa4yOa2/A0WFFFPu/lbaL5laI/FYsXd9RS+uuYuzyyNHnVYlk
         of6w==
X-Gm-Message-State: AOJu0Yw8VwRm+P/rzQarXZbcbY+Yjx/n0UYlWXZuZUow0mRpE4RFbHIR
	uUZcvdNWbj/58KrxN5mS9NdDD+sIMegK/WeuBh3CmGH7/aHBEIgov3HdsJONuvH4+E9FSYc6pvF
	W5Guh4hA=
X-Gm-Gg: ATEYQzzIfPTNEIyQuh8RQIdB1/tKfRhqjWE9y5eCpqajJ710jaOf63Ki8vLYlHQVFnU
	8BaAQ3vWM/Cer0ZiqvxXvWDXNIFNuLMmSUkoXM0a6leLEfhrv5u75PVdlbD+xFASCiYqnBN5qrF
	yRhox0nCg3AT5ZE04eT5HtVCw3bWFfcHUKPSfoeMVvwuzwLsk8JE2ytcmrwTcReZUdlBqQ0HUG+
	Z+qXbEYRNivd4/bmy0BDF79YNkVvNA1OgstLkbfkoFDQ8UgKo6TnAwSJLadB3srjeWLGr/Ou4IJ
	PkTZCn+uLKb7TtxbBQXj3ZuLSx0MhtMsJ1zAbcL7iPFMq/RpvcMZ9N7FiwqgOz7FwwwXwN0M2d8
	GsoTzYhmXQR5DwBNoFw0qX4bbq7R3LTaP3Zn/ZVRQp/bv4y+ASDq+DuGFMYRzK4Co2uvC7SwDOR
	POy65QwDY+B4auNSyQAoiprEQg9pMw0g1x3SMo78v+CMyYyqTlhUMYdOJK0grPHJPuhpmvC5/TX
	JZmqgmC7dxCGvMMzoE=
X-Received: by 2002:a05:690c:389:b0:798:7879:1ab4 with SMTP id 00721157ae682-79acf646534mr7572737b3.37.1774376710848;
        Tue, 24 Mar 2026 11:25:10 -0700 (PDT)
Received: from localhost.localdomain (108-207-243-35.lightspeed.austtx.sbcglobal.net. [108.207.243.35])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-79a903f82e6sm78982957b3.17.2026.03.24.11.25.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 11:25:10 -0700 (PDT)
From: Bradford Love <brad@nextdimension.cc>
To: linux-media@vger.kernel.org,
	hverkuil+cisco@kernel.org
Cc: Bradford Love <brad@nextdimension.cc>
Subject: [PATCH v2 2/3] media: si2157: Include support for si2177 chip
Date: Tue, 24 Mar 2026 13:25:02 -0500
Message-Id: <20260324182502.3396917-1-brad@nextdimension.cc>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20260317205042.3365469-3-brad@nextdimension.cc>
References: <20260317205042.3365469-3-brad@nextdimension.cc>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[nextdimension.cc:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-56904-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	DMARC_NA(0.00)[nextdimension.cc];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	FROM_NEQ_ENVFROM(0.00)[brad@nextdimension.cc,linux-media@vger.kernel.org];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	DKIM_TRACE(0.00)[nextdimension.cc:+];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,nextdimension.cc:dkim,nextdimension.cc:email,nextdimension.cc:mid]
X-Rspamd-Queue-Id: BB5FC31AC73
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The si2177 is very closely related to si2157, with slight differences
when doing analog operations. Digital is left as is, but analog needs
to be configured specially because the signal is internally demodulated
and CVBS video is output directly from the tuner.

Verified locked and working with all supported standards.

Signed-off-by: Bradford Love <brad@nextdimension.cc>
---
Changes since v1:
- Removed debug comment

 drivers/media/tuners/si2157.c      | 208 ++++++++++++++++++++++-------
 drivers/media/tuners/si2157_priv.h |   3 +-
 2 files changed, 163 insertions(+), 48 deletions(-)

diff --git a/drivers/media/tuners/si2157.c b/drivers/media/tuners/si2157.c
index b041cd854732..93ab8e0014ee 100644
--- a/drivers/media/tuners/si2157.c
+++ b/drivers/media/tuners/si2157.c
@@ -687,60 +687,104 @@ static int si2157_set_analog_params(struct dvb_frontend *fe,
 		params->mode, system, std, params->frequency,
 		freq, if_frequency, bandwidth);
 
-	/* set analog IF port */
-	memcpy(cmd.args, "\x14\x00\x03\x06\x08\x02", 6);
-	/* in using dev->if_port, we assume analog and digital IF's */
-	/*   are always on different ports */
-	/* assumes if_port definition is 0 or 1 for digital out */
-	cmd.args[4] = (dev->if_port == 1) ? 8 : 10;
-	/* Analog AGC assumed external */
-	cmd.args[5] = (dev->if_port == 1) ? 2 : 1;
-	cmd.wlen = 6;
-	cmd.rlen = 4;
-	ret = si2157_cmd_execute(client, &cmd);
-	if (ret)
-		goto err;
+	if (dev->part_id != SI2177) {
+		/* AGC speed */
+		memcpy(cmd.args, "\x14\x00\x11\x06\x00\x00", 6);
+		cmd.wlen = 6;
+		cmd.rlen = 4;
+		ret = si2157_cmd_execute(client, &cmd);
+		if (ret)
+			goto err;
 
-	/* set analog IF output config */
-	memcpy(cmd.args, "\x14\x00\x0d\x06\x94\x64", 6);
-	cmd.wlen = 6;
-	cmd.rlen = 4;
-	ret = si2157_cmd_execute(client, &cmd);
-	if (ret)
-		goto err;
+		/* set analog IF port */
+		memcpy(cmd.args, "\x14\x00\x03\x06\x08\x02", 6);
+		/* in using dev->if_port, we assume analog and digital IF's */
+		/*   are always on different ports */
+		/* assumes if_port definition is 0 or 1 for digital out */
+		cmd.args[4] = (dev->if_port == 1) ? 8 : 10;
+		/* Analog AGC assumed external */
+		cmd.args[5] = (dev->if_port == 1) ? 2 : 1;
+		cmd.wlen = 6;
+		cmd.rlen = 4;
+		ret = si2157_cmd_execute(client, &cmd);
+		if (ret)
+			goto err;
 
-	/* make this distinct from a digital IF */
-	dev->if_frequency = if_frequency | 1;
+		/* set analog IF output config */
+		memcpy(cmd.args, "\x14\x00\x0d\x06\x94\x64", 6);
+		cmd.wlen = 6;
+		cmd.rlen = 4;
+		ret = si2157_cmd_execute(client, &cmd);
+		if (ret)
+			goto err;
 
-	/* calc and set tuner analog if center frequency */
-	if_frequency = if_frequency + 1250000 - (bandwidth / 2);
-	dev_dbg(&client->dev, "IF Ctr freq=%d\n", if_frequency);
 
-	memcpy(cmd.args, "\x14\x00\x0C\x06", 4);
-	cmd.args[4] = (if_frequency / 1000) & 0xff;
-	cmd.args[5] = ((if_frequency / 1000) >> 8) & 0xff;
-	cmd.wlen = 6;
-	cmd.rlen = 4;
-	ret = si2157_cmd_execute(client, &cmd);
-	if (ret)
-		goto err;
+		/* make this distinct from a digital IF */
+		dev->if_frequency = if_frequency | 1;
 
-	/* set analog AGC config */
-	memcpy(cmd.args, "\x14\x00\x07\x06\x32\xc8", 6);
-	cmd.wlen = 6;
-	cmd.rlen = 4;
-	ret = si2157_cmd_execute(client, &cmd);
-	if (ret)
-		goto err;
+		/* calc and set tuner analog if center frequency */
+		if_frequency = if_frequency + 1250000 - (bandwidth / 2);
+		dev_dbg(&client->dev, "IF Ctr freq=%d\n", if_frequency);
+
+		memcpy(cmd.args, "\x14\x00\x0C\x06", 4);
+		cmd.args[4] = (if_frequency / 1000) & 0xff;
+		cmd.args[5] = ((if_frequency / 1000) >> 8) & 0xff;
+		cmd.wlen = 6;
+		cmd.rlen = 4;
+		ret = si2157_cmd_execute(client, &cmd);
+		if (ret)
+			goto err;
+
+		/* set analog AGC config */
+		memcpy(cmd.args, "\x14\x00\x07\x06\x32\xc8", 6);
+		cmd.wlen = 6;
+		cmd.rlen = 4;
+		ret = si2157_cmd_execute(client, &cmd);
+		if (ret)
+			goto err;
+
+		/* set analog video mode */
+		memcpy(cmd.args, "\x14\x00\x04\x06\x00\x00", 6);
+		cmd.args[4] = system | color;
+		/* can use dev->inversion if assumed applies to both digital/analog */
+		if (invert_analog)
+			cmd.args[5] |= 0x02;
+		cmd.wlen = 6;
+		cmd.rlen = 1;
+		ret = si2157_cmd_execute(client, &cmd);
+		if (ret)
+			goto err;
+	} else {
+		/* analog video equalizer - Si2177_ATV_VIDEO_EQUALIZER_PROP */
+		memcpy(cmd.args, "\x14\x00\x08\x06\xf8\x00", 6);
+		cmd.wlen = 6;
+		cmd.rlen = 4;
+		ret = si2157_cmd_execute(client, &cmd);
+		if (ret)
+			goto err;
+
+		/* analog CVBS output properties - Si2177_ATV_CVBS_OUT_FINE_PROP */
+		memcpy(cmd.args, "\x14\x00\x14\x06\x00\x64", 6);
+		cmd.wlen = 6;
+		cmd.rlen = 4;
+		ret = si2157_cmd_execute(client, &cmd);
+		if (ret)
+			goto err;
 
-	/* set analog video mode */
-	memcpy(cmd.args, "\x14\x00\x04\x06\x00\x00", 6);
-	cmd.args[4] = system | color;
-	/* can use dev->inversion if assumed applies to both digital/analog */
-	if (invert_analog)
-		cmd.args[5] |= 0x02;
+		dev_err(&client->dev, "%s() Settings HSYNC\n", __func__);
+		/* HSYNC output - Si2177_ATV_HSYNC_OUT_PROP */
+		memcpy(cmd.args, "\x14\x00\x27\x06\xa8\x00", 6);
+		cmd.wlen = 6;
+		cmd.rlen = 4;
+		ret = si2157_cmd_execute(client, &cmd);
+		if (ret)
+			goto err;
+	}
+
+	/* AFC qcuisition range 1.5MHz */
+	memcpy(cmd.args, "\x14\x00\x10\x06\xdc\x05", 6);
 	cmd.wlen = 6;
-	cmd.rlen = 1;
+	cmd.rlen = 4;
 	ret = si2157_cmd_execute(client, &cmd);
 	if (ret)
 		goto err;
@@ -757,6 +801,76 @@ static int si2157_set_analog_params(struct dvb_frontend *fe,
 	if (ret)
 		goto err;
 
+	if (dev->part_id == SI2177) {
+		/* Ref driver tunes, resets registers, then retunes, leaving steps as is */
+		/* set analog video mode - Si2158_ATV_VIDEO_MODE_PROP */
+		memcpy(cmd.args, "\x14\x00\x04\x06\x00\x00", 6);
+		cmd.args[4] = system | color;
+		/* can use dev->inversion if assumed applies to both digital/analog */
+		if (invert_analog)
+			cmd.args[5] |= 0x02;
+
+		cmd.wlen = 6;
+		cmd.rlen = 1;
+		ret = si2157_cmd_execute(client, &cmd);
+		if (ret)
+			goto err;
+
+		/* Si2177_ATV_AUDIO_MODE_PROP */
+		memcpy(cmd.args, "\x14\x00\x02\x06\x20\x0f", 6);
+		cmd.wlen = 6;
+		cmd.rlen = 4;
+		ret = si2157_cmd_execute(client, &cmd);
+		if (ret)
+			goto err;
+
+		/* af out - Si2177_ATV_AF_OUT_PROP */			/* BRL */
+		memcpy(cmd.args, "\x14\x00\x0b\x06\x30\x00", 6);
+		cmd.wlen = 6;
+		cmd.rlen = 4;
+		ret = si2157_cmd_execute(client, &cmd);
+		if (ret)
+			goto err;
+
+		/* analog CVBS output enable - Si2177_ATV_CVBS_OUT_PROP */
+		memcpy(cmd.args, "\x14\x00\x09\x06\x19\x99", 6);
+		cmd.wlen = 6;
+		cmd.rlen = 4;
+		ret = si2157_cmd_execute(client, &cmd);
+		if (ret)
+			goto err;
+
+		/* analog video equalizer - Si2177_ATV_VIDEO_EQUALIZER_PROP */
+		memcpy(cmd.args, "\x14\x00\x08\x06\xf8\x00", 6);
+		cmd.wlen = 6;
+		cmd.rlen = 4;
+		ret = si2157_cmd_execute(client, &cmd);
+		if (ret)
+			goto err;
+
+		/* ATV restart */
+		memcpy(cmd.args, "\x51\x00", 2);
+		cmd.wlen = 2;
+		cmd.rlen = 1;
+		ret = si2157_cmd_execute(client, &cmd);
+		if (ret)
+			goto err;
+
+		usleep_range(10000, 11000);
+
+		/* set analog frequency */
+		memcpy(cmd.args, "\x41\x01\x00\x00\x00\x00\x00\x00", 8);
+		cmd.args[4] = (freq >>  0) & 0xff;
+		cmd.args[5] = (freq >>  8) & 0xff;
+		cmd.args[6] = (freq >> 16) & 0xff;
+		cmd.args[7] = (freq >> 24) & 0xff;
+		cmd.wlen = 8;
+		cmd.rlen = 1;
+		ret = si2157_cmd_execute(client, &cmd);
+		if (ret)
+			goto err;
+	}
+
 	dev->bandwidth = bandwidth;
 
 	si2157_tune_wait(client, 0); /* wait to complete, ignore any errors */
diff --git a/drivers/media/tuners/si2157_priv.h b/drivers/media/tuners/si2157_priv.h
index 8579e80f7af7..aaada2bb0f21 100644
--- a/drivers/media/tuners/si2157_priv.h
+++ b/drivers/media/tuners/si2157_priv.h
@@ -72,7 +72,8 @@ struct si2157_cmd {
 			       ((dev)->part_id == SI2177))
 
 #define SUPPORTS_ATV_IF(dev) (((dev)->part_id == SI2157) || \
-			      ((dev)->part_id == SI2158))
+			      ((dev)->part_id == SI2158) || \
+			      ((dev)->part_id == SI2177))
 
 /* Old firmware namespace */
 #define SI2158_A20_FIRMWARE "dvb-tuner-si2158-a20-01.fw"
-- 
2.35.1


