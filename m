Return-Path: <linux-media+bounces-64341-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id UVQXDpCgKGq9GwMAu9opvQ
	(envelope-from <linux-media+bounces-64341-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 01:24:00 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CA703664C51
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 01:23:59 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=mqZH4DNI;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64341-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64341-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E4DEE303F1D8
	for <lists+linux-media@lfdr.de>; Tue,  9 Jun 2026 23:23:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFC453AC0E4;
	Tue,  9 Jun 2026 23:23:02 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AB612E9729
	for <linux-media@vger.kernel.org>; Tue,  9 Jun 2026 23:23:01 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781047382; cv=none; b=lhka5qG1Qj7g0OBawq50fWHhufCUjHWbdLUaU9ZJifr5hlsiRRp2hPGloVEhQWOsls7G7VdQC9rwuSp2cxq+tGAFPwQLywTsqRqGzQA34LlkRRYz23ufwnzEzcUKfkMpVvHT5p9VYPDUoEZnge1pNjeHG4WVJpXfKUkJPdMHfG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781047382; c=relaxed/simple;
	bh=JTBiL7yW58TwWN0fT2HYnWqUpYRrqVoYRFOznAXfkR4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HOwCbpCZEgY0PKDeocGSsx43DOpNYuhwPEtI5OVxMo3LyyFSOMF7FOfF7v/vBPf1vWUBNVhVrHWOdk+i9CgFBwpdofARzY7vN+7PyHMd6F91cMpOy4Blyf2shI44BUR/0a9SSCWdBXCIoG2AjSnMgkkM4ntSVeW8/8G/18vi4Po=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mqZH4DNI; arc=none smtp.client-ip=209.85.221.46
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-45ef189aa1cso4395315f8f.0
        for <linux-media@vger.kernel.org>; Tue, 09 Jun 2026 16:23:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781047380; x=1781652180; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2f+nd//ws4OlD5QskBmJ1j6z8Njs/3objpJlMHNbX00=;
        b=mqZH4DNI33a5bMT+CbtB5MeDErWDxAgTB1C3lNcK1CMsB1+d0q14nOMRUldgd27cnD
         kxCNjxeoN1aBfX0nHd5iMoA9mtQGRGqSN/NrgTJxEUbeay2XvVIcO/27r1JUrsNWUL9F
         Kyp70Ry4wcC4+ftDdEguIrfGcYMCc3KKw2kTc8+AJ2Qb5NS7s5UZVq8/c3HYGUHxjeBp
         C7HpYPGLeHcvoKGOK0qBtSDwjaZzUUuyKpwhf0Nqzk1/YoChrFKWfH9TMQf1HL8fX5eI
         g9nbZ2qs/ay8PRoSON/UrJ1LHVRsB3/3PHGQEvPP2yBOO9wzBk24BCs+MzFpfYK5Ju9n
         8Cng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781047380; x=1781652180;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2f+nd//ws4OlD5QskBmJ1j6z8Njs/3objpJlMHNbX00=;
        b=qWx2sug5qP7qifx4s0ZrLjnccFbG3ePo0CwRb7TF34SZbFJEA0n29d3i4sYGcUmoMY
         84dtctp95FtOfA/35N2QXWfDfbAoMAzX1WTyLIJXfsVZk44CLTMoc4rbQ4uew2EKGMFK
         FYtShbSKXe5CGEsxekG3T4zLrlw26vocFR0UFwVcg6lOZwPmhXU2jzIWgL7zkhLCzgcZ
         1jYTTpYLJKPYJODr8MFhNxtFSD5eyxM33VDuxdi840lbhpNbne+7E1bDBUffK02HN4vT
         YmdlV8MUHCeDn603inWJ94ODjApqURZkBR77wiGblYw04A7HNopff8nKlhAh1TcGiKjL
         78Mw==
X-Forwarded-Encrypted: i=1; AFNElJ95+tWrjnV1/Xp75CYNHwhV8Haw9tuPskfaBuaJQZcXsyUdkY9kOE3XsjnH3nTBr5dZsWmzhvktn4nyYg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwFryPPfpiOjEsSX5aTXCsb6Eaw2/bgxf5fm2ejx3W5GNVdnGd+
	qo+hzo35npEmAKBNIL9HQD0UoBhE3KmL1b5oYTbi8jbV0IcFgG/LIg3r
X-Gm-Gg: Acq92OESBEHru6YWzXT5UD5AMyiDeot7kWRd8qUUyDq5AhdIlVRG6TMyl23mtZeQF66
	az3dkRr57L6RjWlK7dXlYosoJpYerDmy+CQh6xeI1852jUDZfunGlQJjVTrUWLOm++8woo/0OUq
	vFLw9VVa84xvy4l0rQE5kwQvB5s0/ycb681/IhRnVBFpHwc5qOkNOwV0R9GgR1peJ9J2N7TZ/J0
	Q/zmEGRUA2j22AjaHKqZVnOz2eOceRj5dRFbpzd5uvKCDNmQ00LnBkN/N9b6rVHFfnSw7/S5eF/
	XGeWKkhdE/x6UGBU8/6iAcrrf+8R4/YD2ANsFnnYmY8hWhIUi4x29ZoZwoENpmRCBdR3l0QZuMY
	37//sSUWyjGBNPbvWvnYC0rMmGlrxFjE8S6Q8qTbhTXMVurq9rufX6jERHWKZ3UOZVTlpPpFDn4
	f6XNh0qeC95xAC00UB0kjV6BKS3tVt2IBUWj2k4IpmbtYr8oHfMzqAsTnMz6foYQB5qY6/8QbjN
	Mh8khRK2C5qCeE=
X-Received: by 2002:adf:f88c:0:b0:45a:e3dd:586b with SMTP id ffacd0b85a97d-4603063a9e2mr26087528f8f.18.1781047379680;
        Tue, 09 Jun 2026 16:22:59 -0700 (PDT)
Received: from garuda ([79.106.123.139])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f2f2710sm51994747f8f.14.2026.06.09.16.22.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 16:22:59 -0700 (PDT)
From: Jurison Murati <eng.juri@gmail.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Daniel Scally <dan.scally@ideasonboard.com>,
	Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org
Subject: [PATCH 2/2] media: i2c: ov8865: Drop PM runtime reference if stream start fails
Date: Wed, 10 Jun 2026 01:22:55 +0200
Message-ID: <20260609232255.13559-2-eng.juri@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260609232255.13559-1-eng.juri@gmail.com>
References: <20260609232255.13559-1-eng.juri@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:sakari.ailus@linux.intel.com,m:dan.scally@ideasonboard.com,m:hansg@kernel.org,m:mchehab@kernel.org,m:linux-media@vger.kernel.org,s:lists@lfdr.de];
	PRECEDENCE_BULK(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[engjuri@gmail.com,linux-media@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-64341-lists,linux-media=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[engjuri@gmail.com,linux-media@vger.kernel.org];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CA703664C51

ov8865_s_stream() takes a runtime PM reference when enabling the
stream, but returns without releasing it if ov8865_sw_standby()
fails, leaving the reference unbalanced and the sensor powered
indefinitely.

Signed-off-by: Jurison Murati <eng.juri@gmail.com>
---
--- a/drivers/media/i2c/ov8865.c
+++ b/drivers/media/i2c/ov8865.c
@@ -2647,8 +2647,11 @@
 	ret = ov8865_sw_standby(sensor, !enable);
 	mutex_unlock(&sensor->mutex);
 
-	if (ret)
+	if (ret) {
+		if (enable)
+			pm_runtime_put(sensor->dev);
 		return ret;
+	}
 
 	state->streaming = !!enable;
 
-- 
2.49.0

