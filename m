Return-Path: <linux-media+bounces-65300-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id wBk1IX/ANWro3wYAu9opvQ
	(envelope-from <linux-media+bounces-65300-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 20 Jun 2026 00:19:43 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D93B06A7E7C
	for <lists+linux-media@lfdr.de>; Sat, 20 Jun 2026 00:19:42 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=ccG2eqZy;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65300-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-65300-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2C40D3077179
	for <lists+linux-media@lfdr.de>; Fri, 19 Jun 2026 22:19:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBCAB3BFE2F;
	Fri, 19 Jun 2026 22:19:04 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06216360EF0
	for <linux-media@vger.kernel.org>; Fri, 19 Jun 2026 22:19:01 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781907544; cv=none; b=VjOZvXXThfO6q2Wqer/rk9CCO78xgVlQvoUMU3zXTznFRiDe5B0wTZCBeV9eLotZJNZ45pdOIFhWFCWCUjfLJC58rKcDf3FeHUJ7T+AoMADRFkQ3xsrGZzDfDtGibEFcKjKTc9Z8twwFqjDq+xpq91Hd7hqngXonWEwxNjvErzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781907544; c=relaxed/simple;
	bh=/85CDGfidDI6K1PoGj1BYlKFBmTrcXVI5Gyew9JiBUE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=m27lNoyZmNQ6vo8FDLlc6MsTdvlkQO/pWykEzwqoCKTrGRntxIo4KxKieLYO9G0ZfZY8yRjzv75gRpqf0W+xPHMtqh6T8OBRqkmVr8Ec1UDOZDPrAviQ+z4YDXntWIioUXiWnXxu9+VG2xtTW7hDSc7+YnLDTG22Eu08iP8GuEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ccG2eqZy; arc=none smtp.client-ip=209.85.218.45
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-bebb72b845aso391948366b.3
        for <linux-media@vger.kernel.org>; Fri, 19 Jun 2026 15:19:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781907540; x=1782512340; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CTml6KE54IubDu1eTve92eFW0hAuwij384Tv4wiIHUk=;
        b=ccG2eqZykeSD4ZnxyZWNpASjVAdl7+S87jad3JBRfT0wEjJoR+IDwtRZYyVmJbIP3p
         zi1l7kGHO7onDbktJPbf9aHBdeauPDgUWkIteLEqh2nJudsTFI+kV/yjzF1l+/vsLnEo
         hUWyK6sJrd/+jP6OzV7uw2pdtThwOs6vpKuLMjyoxLTYkB/DRqx+9KXulrDVnFcYzRzs
         shls8J2j9pUrn/NkrF33bNQOHX4uaTQCYJg28f9/0oEkQgQ1CNDSEmBVRcAhMoLLZ09Y
         vuhFzN/xODytOhGUfwbuPaVbui00Lr9NzIabyZdptYvKjfi4+kP9CzhpjepJqiLxwgHA
         xf3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781907540; x=1782512340;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CTml6KE54IubDu1eTve92eFW0hAuwij384Tv4wiIHUk=;
        b=qcOU4g8FnqZNJR4lDFUQ7aWCbqFCIs4FNdbZhpU4Vv2FUQhMd7d0lsESnm4awARfdE
         d7odAfVCiR1hswPucsdo75sJuksJfcM8S3lBBWZa+YxNdHKiqMZdJFkrc5KWKyqNdbG4
         U5uI9vxqP8Da0hxXFDepbqISRFuJABPtHredoj79n8PdwSwDNObcDtGiYlYzsTr9Glvp
         OmfX44IyzN7eCnokHFpxqSwLRLWHTlA+VJzSfIlmGTFzn7Rwgx6eCtK3pNWkhB0HCN4d
         9G+TnlEXOj18cv1x4I/pcPALn66vsn5UFLFsaCwKmz7OQX8MIMGUz1S6bvcsLGJWCuQt
         N6tQ==
X-Gm-Message-State: AOJu0Ywz/ovNFC3GrTXuN8Uexc2tGhlBFZZp2Su6rYLxqNdy/MBiq8ub
	yIs78b69DntPnMLMJ1MxsvTmEvyQjS+uCq7RNYsx615jbpTTx2bfdZ+N/FpI4dzEEmBybMiJ
X-Gm-Gg: AfdE7clXWcIHhEgctJQSKcdQYiLFfyN+Bo+p+sG6+IlQbdCFpPPmdgd50A539Za4w8P
	o13tq6VAj0I/HGKdHZ+4vAZLeuC1AuMxkt1CHO16uV1zwlxT5YATniUegXdt9ToMXVkcWTztojF
	lsCZYTa6JCWH2tbhxdFj/KtDdMwp1Rp4YdVKDYHBVmEf7KE7iidKVmTAR2tcyjtSv+KMWLJF8BK
	G5rY4NM5rLcxSTsBsK3KdKYk9XpSAAldOtG1X845eOcnFAA0d58u0eKSYhLym5pZa8VDQO2mQLm
	px/r+FxEDiGvGdtR1UNIuSBwIr+FoOusmSLpULFvSxUkdg+HUQl9zSeQ6AYgIBnXhvs4SdXFGq4
	xzEhkNbH9XZi9a4nFRcT00OcBKzQ7AuBSiSJWDC19VT0ozNRg85/3D96LyB8AxyMx4Y+8AuInik
	zmEcTK7jl6CzfmgfNz0XyFVbsAjHxPou1oHYHJt0v69kBGCfaX+WC3vSzCqQ==
X-Received: by 2002:a17:907:97cf:b0:bea:f4e0:c7b9 with SMTP id a640c23a62f3a-c097b19844bmr300496366b.19.1781907540170;
        Fri, 19 Jun 2026 15:19:00 -0700 (PDT)
Received: from adr.. (212-8-253-73.hosted-by-worldstream.net. [212.8.253.73])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c0c5e49b77bsm28513066b.2.2026.06.19.15.18.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jun 2026 15:18:59 -0700 (PDT)
From: =?UTF-8?q?Andr=C3=A9=20Moreira?= <andrem.33333@gmail.com>
To: mchehab@kernel.org,
	gregkh@linuxfoundation.org
Cc: linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Andr=C3=A9=20Moreira?= <andrem.33333@gmail.com>
Subject: [PATCH 1/2] staging: media: av7110: replace msleep with usleep_range
Date: Fri, 19 Jun 2026 19:15:23 -0300
Message-ID: <20260619221524.51814-1-andrem.33333@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-65300-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:mchehab@kernel.org,m:gregkh@linuxfoundation.org,m:linux-media@vger.kernel.org,m:linux-staging@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:andrem.33333@gmail.com,m:andrem33333@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[andrem33333@gmail.com,linux-media@vger.kernel.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.linux.dev,gmail.com];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrem33333@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_FIVE(0.00)[6]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D93B06A7E7C

The msleep() function is not precise for short delays under 20ms.
Replace it with usleep_range() to provide more accurate timing
and avoid unnecessary scheduler overhead.

Signed-off-by: André Moreira <andrem.33333@gmail.com>
---
 drivers/staging/media/av7110/av7110.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/av7110/av7110.c b/drivers/staging/media/av7110/av7110.c
index 862aee993889..e77be16f442c 100644
--- a/drivers/staging/media/av7110/av7110.c
+++ b/drivers/staging/media/av7110/av7110.c
@@ -1818,7 +1818,7 @@ static int nexusca_stv0297_tuner_set_params(struct dvb_frontend *fe)
 		if (i2c_transfer(&av7110->i2c_adap, &readmsg, 1) == 1)
 			if (data[0] & 0x40)
 				break;
-		msleep(10);
+		usleep_range(10000, 11000);
 	}
 
 	return 0;
-- 
2.43.0


