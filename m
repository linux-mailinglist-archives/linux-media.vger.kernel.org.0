Return-Path: <linux-media+bounces-63695-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id dKlqIQu2IGos7AAAu9opvQ
	(envelope-from <linux-media+bounces-63695-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 04 Jun 2026 01:17:31 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A16D63BD25
	for <lists+linux-media@lfdr.de>; Thu, 04 Jun 2026 01:17:30 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=BY8FDJzB;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63695-lists+linux-media=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-media+bounces-63695-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A7EE43023C2B
	for <lists+linux-media@lfdr.de>; Wed,  3 Jun 2026 23:12:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74E6737F738;
	Wed,  3 Jun 2026 23:12:21 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-dy1-f193.google.com (mail-dy1-f193.google.com [74.125.82.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE32535E948
	for <linux-media@vger.kernel.org>; Wed,  3 Jun 2026 23:12:19 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780528340; cv=none; b=vAE1CCFET4NH/yo97H4FFgJ3E3/TRAjYrCH3L+AHVQtDw59hR0wh+wPgJUiQy/SviKgk+mKGkL9rQ/DlyJlw3tI8B1JrNDAHqWCA7pog9NT+wURBJdYSIyUt2UEESoMuTMMTKmjwAnBnvPeSk7N6L5LtVb2zAA4pwKMqcrZIoW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780528340; c=relaxed/simple;
	bh=56urM9owzVBr7SgwNvKD4dwc3Vjrr93bKnrQ9nWu1+Y=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=uGx5d72a9FNInpPMKrMfow4JJX2Hp43MYBSn2B4QNlUKVInP6wktkx/tKBMFYVVJd0Wc3IIZFtvL15/4Acz+5ezwKnWCJ/umiFihpTzGfGnC/yvIWMIjwBDH2rCeX7Sgk7ifiRx/dmrJ4pNlWK6kUkK4IjJF7K2ya6k6GVvGyUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BY8FDJzB; arc=none smtp.client-ip=74.125.82.193
Received: by mail-dy1-f193.google.com with SMTP id 5a478bee46e88-304ec41197bso45015eec.1
        for <linux-media@vger.kernel.org>; Wed, 03 Jun 2026 16:12:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780528339; x=1781133139; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=P6xR0LWYCueJ851tt5RP16XtHsKU69wAadguzLJ/l8s=;
        b=BY8FDJzBCYocBmgyC7RhfBac2rfho4kwOBX5s1W6S1swPE5JZ0UFG1Wb4IQnuMdCLb
         8RjD3tZouSsAahYaUAgLpql9KYQBAyOlCnc2ig11Um4B/Jjbed66DZ6VoK3rkNu1Kd59
         sIoHurHMuQ4UeB2Ho7KXI/MjSLvQiMvVk08ETeH+rZdqpA+II1+3v498/iL5p9zXYZFt
         6iHGpDUASb1AKvJ7YeHUxsxkx3LCHetBLPNsuPvngonzyuyWo3mcV0HT8B/18UR7n7AZ
         vzhSf9sjs/EwgfiZZUFIAB9kW6Nfc5qpTSREHRPUS0r4F0W4RfbACSQpu1aZgmHgeM9Q
         jXgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780528339; x=1781133139;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P6xR0LWYCueJ851tt5RP16XtHsKU69wAadguzLJ/l8s=;
        b=ATWRcDIj36PqNUlOMPbLpi58Zcrdcl0ZhwuR3U3oxOaMqxAdBaUnRORqawQvwVqDgj
         MuC+5O4NePK9y9Sa19dAR8cVH4J5ToqkWw7NCAgzxs5hwZGfkMgRAoBxumCN68Il+VOp
         oiDSi+KeAhG+q2r/5i1W5Gc++4BlNlT0kZYp/nzdLA/Gj0tnMp5L+JwCka+bfeUJK5TG
         mLO8lnVGE7k9+1rkRMBCDR4Y9dGW5ihFCUpTaSGPuCgzs7CpZcOIbQM9WcRKo+IXvQOd
         waZaVUOdJsLUOGByF/M0oGD7Z2FA/KiZOk4GbsD3NpPyGyqm57jcMaJ5/933G2HZKs3x
         UnXQ==
X-Forwarded-Encrypted: i=1; AFNElJ8ghnre8axwGvq7nxIoNrO8JdxEsw+5DNMHnHB2nVMz1ZFVP0ipvf97xil/PUw7B4lMgdhI0d0hAYTH7g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5T69lrNpeleyvv7EVWOpTTGXriVXoCmhed/MPGt+1eg8Q/nYT
	qxrjXqXBVaN2NdRsIBBZ4EMr5WiCVpOa8XaFy/zxFkn6eadRVsVJI8hit9Q/wcYo
X-Gm-Gg: Acq92OFgp8PiCFwsA+ULwc8OofiuECgVFJsdJThso4cJOHOAACCafMMytphyRW4ksYV
	zEMXxUC/BTRLh/dU99uyFM5bXhiQhLLzwjZRDNcKiVIdIVHm1RxBIV1YO/yVhUopnKSvf8O/GUb
	9xZ87KHnUvWclEP0pLikVPpwtd7YmCBKmDeOehRJUCaMwh7bN7tuAB0+35M4wQAMlE5/aJ6wRwv
	SNeS38/d/uWe5iQdTjOSKhcQexQg09ABchAmkk4B0b/0WhZbn/m+fbrNiOut+Cq1C1eksKVAcjj
	2F0hDkJe4bIPVHCYNIs7UUcjbbYgojH6k/wbLprzOh1f9AFsX280ujNa5ERQ6TZAlNvA33bV2ft
	aLgj6KccrZw1qQ12uQuV5lZRYiV6GIKcvR3jULovc1t8VjV+DLzJ4TooWUBq2elBpcYKm0UMEFD
	6g9QjUBavlmT5v1C66Ebvke5Cz9cG4g66NnX/GhZ1bfqhPmstdk1r8VyPqc8Gwswo8Gg==
X-Received: by 2002:a05:693c:2b04:b0:2e0:1f09:d924 with SMTP id 5a478bee46e88-3074fa3b818mr3683165eec.5.1780528338898;
        Wed, 03 Jun 2026 16:12:18 -0700 (PDT)
Received: from localhost.localdomain ([76.32.119.210])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3074dcb98aasm3368943eec.12.2026.06.03.16.12.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 16:12:18 -0700 (PDT)
From: Hungyu Lin <dennylin0707@gmail.com>
To: rfoss@kernel.org,
	todor.too@gmail.com,
	bryan.odonoghue@linaro.org,
	mchehab@kernel.org
Cc: vladimir.zapolskiy@linaro.org,
	linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hungyu Lin <dennylin0707@gmail.com>
Subject: [PATCH] media: qcom: camss: Rename unused macro parameter
Date: Wed,  3 Jun 2026 23:12:02 +0000
Message-Id: <20260603231202.6569-1-dennylin0707@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER(0.00)[dennylin0707@gmail.com,linux-media@vger.kernel.org];
	FREEMAIL_CC(0.00)[linaro.org,vger.kernel.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-63695-lists,linux-media=lfdr.de];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:rfoss@kernel.org,m:todor.too@gmail.com,m:bryan.odonoghue@linaro.org,m:mchehab@kernel.org,m:vladimir.zapolskiy@linaro.org,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:dennylin0707@gmail.com,m:todortoo@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,linaro.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dennylin0707@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6A16D63BD25

The ISPIF_VFE_m_RDI_INTF_n_PACK_CFG_0_CID_c_PLAIN() macro
declares a parameter named 'c' but uses 'cid' in the macro
body instead.

Rename the parameter to match the identifier used in the
macro body and silence the checkpatch warning:

  WARNING: Argument 'c' is not used in function-like macro

No functional change intended.

Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
 drivers/media/platform/qcom/camss/camss-ispif.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/camss/camss-ispif.c b/drivers/media/platform/qcom/camss/camss-ispif.c
index aaf3caa42d33..8b0753e606c1 100644
--- a/drivers/media/platform/qcom/camss/camss-ispif.c
+++ b/drivers/media/platform/qcom/camss/camss-ispif.c
@@ -83,7 +83,7 @@
 					(0x270 + 0x200 * (m) + 0x4 * (n))
 #define ISPIF_VFE_m_RDI_INTF_n_PACK_CFG_1(m, n)	\
 					(0x27c + 0x200 * (m) + 0x4 * (n))
-#define ISPIF_VFE_m_RDI_INTF_n_PACK_CFG_0_CID_c_PLAIN(c)	\
+#define ISPIF_VFE_m_RDI_INTF_n_PACK_CFG_0_CID_c_PLAIN(cid)	\
 					(1 << ((cid % 8) * 4))
 #define ISPIF_VFE_m_PIX_INTF_n_STATUS(m, n)	\
 					(0x2c0 + 0x200 * (m) + 0x4 * (n))
-- 
2.34.1


