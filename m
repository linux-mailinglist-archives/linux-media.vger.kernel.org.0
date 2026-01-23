Return-Path: <linux-media+bounces-51427-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cIksNHWQc2l0xAAAu9opvQ
	(envelope-from <linux-media+bounces-51427-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 23 Jan 2026 16:15:01 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 47B24779CB
	for <lists+linux-media@lfdr.de>; Fri, 23 Jan 2026 16:15:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8F7703048BDF
	for <lists+linux-media@lfdr.de>; Fri, 23 Jan 2026 15:08:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DEF01ADC83;
	Fri, 23 Jan 2026 15:08:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NZmHXfsb"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D21DC265CA8
	for <linux-media@vger.kernel.org>; Fri, 23 Jan 2026 15:08:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769180929; cv=none; b=XmV0SUy5ORlqqB560O3zqcEL6ha/bSbMuEh3PadLf48tQWdWAW+JWDG2B0JybZfbifaDsLuc5kqgPdLpIZuRXM7khi+MQw+A1keyxd6mtSUp5UFG5BODtZDkz0dB94RwcjBPjngqrsb6+iC43mn0KB7yBAMb0t10BOGzBtLKVcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769180929; c=relaxed/simple;
	bh=09QbHNmS/T4BzfyfvRfb26gCgbYR5VjH0MG/VK7w17Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mAndBMQvOOnFhjrb2jbRDMXLbqcJ6cf0fSKYe7nGqWS2q6dWVJcGB9H422FFk+xeRiV/ZQa9pBTPv8ZJo7Ol6wxuh1jUN0l3VdMQftMJSC/AYZ0a0NV+G9go/U3K6rHx65DwpDPMn9BshXM5MTzvL51WvpDcn4CtMgW8MRV0zng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NZmHXfsb; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-81dbc0a99d2so1198601b3a.1
        for <linux-media@vger.kernel.org>; Fri, 23 Jan 2026 07:08:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769180926; x=1769785726; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YyeOR5cSDI1vn1EJE7YZ4jqQKxKnIqaBmIJqtxqHi+k=;
        b=NZmHXfsbX3ixjbv+88oOqeSWekgsnebIz/dccILeiYrAbTJ3wtZTnZB/cHOR2/HTT3
         F9iDNR+BEQ6bsRgziwc+1a3CXwQmDWrbGs/1JpsIE6PRHmNsmUAWg0pNj6DaV5nTmgqP
         KuG+MAqt0t8Tvo8Eq5EbJKQw9mQYxu+Dp57d3ARQU3E+0CYPoGkPd9WagM+tHfl7ljJi
         TFPv7bifol5grK26e2jGmIZY0l/JuKM73UTaK4rYD2jDCcV3TlkkvDNaFl+4JDWwWr7B
         1P6SuKXJ5xW+kHxA+J0GAoJfpXb6GLFNw/PxlkeUsVtAS3pMRercr6lip8APUiXz1XTp
         DTHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769180926; x=1769785726;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YyeOR5cSDI1vn1EJE7YZ4jqQKxKnIqaBmIJqtxqHi+k=;
        b=ucFaWdqHB1paymnAPB9KBOaw0/40Xoy9atyAok1LEbGhZsi/wtSYVzPMbiVPQUEM8V
         45o8yS/MMQY4Bwn5gi4yo7dDAdFQNutC3d8oV+t6MZFhfHQklSOviMwGpNqridZuQrl7
         mtoUDIe3bCT4Q0Ry6aghofYTSnwwCp2RLgsBHy9mqdqglayfWTjGVm1jdOqbZ/KEXNP0
         e6ORyO/RFwwA/2z0BbdGQnhU/tg370OxevTRoudkC3LkTTy6dot8hF7HGpaVqI1TbvGg
         rq0NcA4QwGONemDD/E9RTtrJoh2Iuqe/jmalvu78z7yWYsL+CFqYI3/m00ay3wWuwppq
         uCjA==
X-Gm-Message-State: AOJu0YzFYOMJR08XjgYzKxrkhdmK3uJYr9LpfafSmnWDymxpQBPXnrxP
	VbWr6rxp3y9Rcq0KL9PcAVVy2uYh+Yo2aPFNgHA/E0r74or8Dz29HoG9
X-Gm-Gg: AZuq6aKBe56yj+38IqtG0txsIB/qxRZEsDgJPVhlVn9vLjLIxE18H6j85RsLBd3eRGt
	aWxsekDrdzVih9qSgCrJFYleJvQfjOOzNotRaDdMMKr74R9OEWelWmJgpNr4zNKuQThkyejhHmn
	iuv4xbCDxEvUFr1+dUH4IcDdeKYHgLZ0gqviiDYq+wkIhufMAz7uwVK9H6TnVv5fIYYEuda5kQO
	n02lOIWFh1SoJ+u0WaELM4nJA1IU5bEVL5NoX/FxTFflCE8AbnQGziIyLcwT/2xNvW0i8OlgAau
	pF5PLQVF8pQDRtUc552W5Nd45gaeQp3A7QDOcnTMEO5Go858uIjehmiNLCmUT77AwqRDfuZWTZJ
	fWvP0oyxZxSloy/qxbdWgVbCXxkQboHaFzT/2HbHeBLNW88113lZDgMzYj+/7PLcKZwMT42vocC
	YZ9MLIja4j0gd2CWft9X1nsw5kEbpE7qwEXkGXhtSU5ns4FzEAxB1E6/ajCfK96dIKctog8DIPf
	8ydab8pNshC
X-Received: by 2002:a05:6a20:6a06:b0:37e:8eab:c05f with SMTP id adf61e73a8af0-38e6f7f56bcmr3719090637.59.1769180925480;
        Fri, 23 Jan 2026 07:08:45 -0800 (PST)
Received: from johnson-VirtualBox.. (211-22-107-155.hinet-ip.hinet.net. [211.22.107.155])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c635a157a4asm2301490a12.13.2026.01.23.07.08.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jan 2026 07:08:45 -0800 (PST)
From: Johnson Huang <kusogame68@gmail.com>
To: mchehab@kernel.org
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	zilin@seu.edu.cn,
	sef1548@gmail.com,
	Johnson Huang <kusogame68@gmail.com>
Subject: [PATCH] media: drx39xyj: fix typos in comments
Date: Fri, 23 Jan 2026 23:08:39 +0800
Message-ID: <20260123150839.23840-1-kusogame68@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,seu.edu.cn,gmail.com];
	TAGGED_FROM(0.00)[bounces-51427-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kusogame68@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 47B24779CB
X-Rspamd-Action: no action

Fix several spelling and grammar issues in comments,
including coderate descriptions and Doxygen annotations.
No functional changes.

Signed-off-by: Johnson Huang <kusogame68@gmail.com>
---
 drivers/media/dvb-frontends/drx39xyj/drx_driver.h | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/media/dvb-frontends/drx39xyj/drx_driver.h b/drivers/media/dvb-frontends/drx39xyj/drx_driver.h
index 2c2fd4bf7..873a6bcf8 100644
--- a/drivers/media/dvb-frontends/drx39xyj/drx_driver.h
+++ b/drivers/media/dvb-frontends/drx39xyj/drx_driver.h
@@ -588,10 +588,10 @@ enum drx_priority {
 */
 enum drx_coderate {
 		DRX_CODERATE_1DIV2 = 0,	/*< Code rate 1/2nd.      */
-		DRX_CODERATE_2DIV3,	/*< Code rate 2/3nd.      */
-		DRX_CODERATE_3DIV4,	/*< Code rate 3/4nd.      */
-		DRX_CODERATE_5DIV6,	/*< Code rate 5/6nd.      */
-		DRX_CODERATE_7DIV8,	/*< Code rate 7/8nd.      */
+		DRX_CODERATE_2DIV3,	/*< Code rate 2/3rd.      */
+		DRX_CODERATE_3DIV4,	/*< Code rate 3/4th.      */
+		DRX_CODERATE_5DIV6,	/*< Code rate 5/6th.      */
+		DRX_CODERATE_7DIV8,	/*< Code rate 7/8th.      */
 		DRX_CODERATE_UNKNOWN = DRX_UNKNOWN,
 					/*< Code rate unknown.    */
 		DRX_CODERATE_AUTO = DRX_AUTO
@@ -924,7 +924,7 @@ STRUCTS
 /*============================================================================*/
 
 /*
- * struct drxu_code_info	Parameters for microcode upload and verfiy.
+ * struct drxu_code_info	Parameters for microcode upload and verify.
  *
  * @mc_file:	microcode file name
  *
@@ -1220,7 +1220,7 @@ struct drx_version_list {
 /*========================================*/
 
 /*
-* \brief Parameters needed to confiugure a UIO.
+* \brief Parameters needed to configure a UIO.
 *
 * Used by DRX_CTRL_UIO_CFG.
 */
-- 
2.43.0


