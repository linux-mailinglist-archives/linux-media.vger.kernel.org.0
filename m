Return-Path: <linux-media+bounces-56128-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8PebNbe+uWnJMQIAu9opvQ
	(envelope-from <linux-media+bounces-56128-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 21:51:03 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 977562B26A2
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 21:51:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CFCBB3073D98
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 20:50:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 961C538A736;
	Tue, 17 Mar 2026 20:50:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nextdimension.cc header.i=@nextdimension.cc header.b="aPKxmjEb"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 856AD38B7BB
	for <linux-media@vger.kernel.org>; Tue, 17 Mar 2026 20:50:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773780658; cv=none; b=AoJqzFfFfQJDZJpRRcGJ/SYin5aw9DMsEtpaIG6oDKbFkE0qN6JmIw/Rf9NlRW6l+wUV2x+48w2Z222sjRB6oFJyhpjUZqWATgh+rIYPkEuHAUagu9eG4pfaWFY+NwOJCuYOX4hju4zxXO6mxE5GfQ7xMBGpMKS/sFZn/v2II2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773780658; c=relaxed/simple;
	bh=O/bGq9WZUtHwg1ZtVLYsXtvWg08wBdQs1JdWhkxkioA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=IURAVjEoxfKEnGpx/gRO5HBnWB+D8pWhKWREaHZA5on1opwDZ1yEU50RZgI70YmodMTaU1AHaWVoHqp0qXYW9uokw1HgUaT7HT4GW0osO60HDad+ZQU2Kz+UYAdsm6CpJ0PmQ4smCgGYxd308DjzM7iTGJMnuiO4VKq94mlMD/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nextdimension.cc; spf=pass smtp.mailfrom=nextdimension.cc; dkim=pass (2048-bit key) header.d=nextdimension.cc header.i=@nextdimension.cc header.b=aPKxmjEb; arc=none smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nextdimension.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nextdimension.cc
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-7986e0553bdso52914827b3.2
        for <linux-media@vger.kernel.org>; Tue, 17 Mar 2026 13:50:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nextdimension.cc; s=google; t=1773780655; x=1774385455; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9EnpctN0GPlihUqN+zJiYi+yNg4vifMGdt8VmDNj1pU=;
        b=aPKxmjEbZwzn8nHEjkDr1xMFKKh3nLURO/KYnIZyv9kg6TdA9/PB4CKt8B3PWT1xkC
         mTsh0J1TIxkT0ORgw2AT5L32/CfZVVxxkuMCuS3OGOa8b27q6swZo1YnskkkH+D9h1p0
         aR23GhYuj5n1DHbmqcESzW4Q+dgARXOhL3KbDnQlWIZYgp3aA5f2IF636EwTp7Mj0mcV
         gTF/y8TP2O6FvvY1BmZgE0KL09Bi4JtXPhgfo0PQTkM3xM0u1CR64GenA1xbUU+yndx9
         OrNTvvTDOIamMT7F2uFwyjuHb2SkXF8M+r2DTvzePgr6flVWOxW9/zfPjRdgkByGqXti
         GrdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773780655; x=1774385455;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9EnpctN0GPlihUqN+zJiYi+yNg4vifMGdt8VmDNj1pU=;
        b=WwGWZbMbLjpIsWemDaqGNPh2ur4WiOOaBYHyYhnjzODzi+hQhmIDyXRpA76qNrbaZb
         GyEQOKHTVLmPZm+M9EUPlu+YMQ5tZSQK/SgeyYRfmLvKU+XBjOPaJGNZzdGgtZXBGSJu
         G8tN74wbGcBPlgeLh+MdDhKR1lZHNqmB6Y69h77V96+Cj8FBnvKgQDv/Ie+xIOLlJ+9O
         K0gDM3idpbMA6Doik2KHyzT87NRjh0WlY6nCAvjNsG4vcSiAOuIY2d27bra95iTi7isi
         HjwEieg7PqIuiwNNdl2M+gSbZLbNpaOvovXAR+F/ZSLi7JJs67CsL532oQ8SLy5wawld
         iFGg==
X-Gm-Message-State: AOJu0Yzrzpyk4z4EFg7FKDsFagz3tMnw3/5zw2BHTaarj4Z10d9u1y/u
	e/m1P2+O3MSNZ3ynypwzlpwEKQaLxT1SEyWAzyMbv9lbvwUt4751/KyjIM0NePHGBIcNjVSRO5F
	p1YD0JPk=
X-Gm-Gg: ATEYQzy6pQtC09CoBbm/xRZQNxad70nKlfp+BSix+wCqa7PLsEKodjBqWcKn5EcxJzB
	nMmTtMOaqyOJkENO/Qgg5LYmliAgUCdlLsOaDOPYZECJA2DnurlfOO4Ux4sX1CY28+nrQ8hDVD/
	TrWdtzafKkus4zGzPek57CFpRaseigJFVP43exov92x6+V2ChI9vCXKPEyDHzmLZvh6SH80hFky
	049AQjqTcnTL7fP6X56trAllBMLumaVRJANYrmrq/UWdIQAvDZ4KMtvFiuOWwV8djiBUhF8KwrD
	NwIoqZ6Ks/rhrCECwABzEy9sOzcPsPXzgIHekHBwD2uZfxlsOzqvcCK3TGPBSQDWsKUYOwQoYjq
	RezjUV0rnvVIWVpJON0b5cFBFPk43yK0/P2USsKTL09UXvRREB7vdanmENv7rMD8NG62U4GwIw/
	XxU2hTUjVfDwH9EZDgQ6BX9UrqwJZlOyPg+U545cfwJHlcAyik+/Tg03Ku03gPcscqDJjqbOA4z
	5I1OpzuBHhwrGPv6yhFPHP3I5TQ+Q==
X-Received: by 2002:a05:690c:13:b0:79a:53b8:820d with SMTP id 00721157ae682-79a71acb389mr9356757b3.35.1773780655243;
        Tue, 17 Mar 2026 13:50:55 -0700 (PDT)
Received: from localhost.localdomain (108-207-243-35.lightspeed.austtx.sbcglobal.net. [108.207.243.35])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-79a713df100sm5031267b3.11.2026.03.17.13.50.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 13:50:54 -0700 (PDT)
From: Bradford Love <brad@nextdimension.cc>
To: linux-media@vger.kernel.org
Cc: Bradford Love <brad@nextdimension.cc>
Subject: [PATCH 2/3] media: si2157: Include support for si2177 chip
Date: Tue, 17 Mar 2026 15:50:41 -0500
Message-Id: <20260317205042.3365469-3-brad@nextdimension.cc>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20260317205042.3365469-1-brad@nextdimension.cc>
References: <20260317205042.3365469-1-brad@nextdimension.cc>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[nextdimension.cc:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWO(0.00)[2];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	DMARC_NA(0.00)[nextdimension.cc];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-56128-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brad@nextdimension.cc,linux-media@vger.kernel.org];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	DKIM_TRACE(0.00)[nextdimension.cc:+];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,nextdimension.cc:dkim,nextdimension.cc:email,nextdimension.cc:mid]
X-Rspamd-Queue-Id: 977562B26A2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The si2177 is very closely related to si2157, with slight differences
when doing analog operations. Digital is left as is, but analog needs
to be configured specially because the signal is internally demodulated
and CVBS video is output directly from the tuner.

Verified locked and working with all supported standards.

Signed-off-by: Bradford Love <brad@nextdimension.cc>
---
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
+		ret = si2157_cmd_execute(client, &cmd);		/* NEW BRL */
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


