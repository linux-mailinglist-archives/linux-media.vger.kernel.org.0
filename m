Return-Path: <linux-media+bounces-53911-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EN3hDR+Wo2l7HQUAu9opvQ
	(envelope-from <linux-media+bounces-53911-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 01 Mar 2026 02:27:59 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 864EB1CAAC5
	for <lists+linux-media@lfdr.de>; Sun, 01 Mar 2026 02:27:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 474CC305C491
	for <lists+linux-media@lfdr.de>; Sun,  1 Mar 2026 01:21:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08C24278161;
	Sun,  1 Mar 2026 01:21:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ft7ja9aT"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72DB713B7AE;
	Sun,  1 Mar 2026 01:21:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772328090; cv=none; b=WwMEifBnbYmvEdAprFW24E9EOP1q9flEO01jnbDkCvEEPNIki55uQZ81SaQUaCl9IHsmy1bS6rPV3HcJWeV9+uQlcRvp3CMqeVJMUL9QkLRwMYE281D0Q8wBdT1zmFjqLxk2bpgsscBORAQSMChNIHHG1Emp0F8jb6Xv7Q+GCIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772328090; c=relaxed/simple;
	bh=ipmykbxOi4Ap+/fqtwmyMXkO/5SdBy+tybYcoG3buOk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=amtVgcY9yWZhhhatLefye5e8zGuF7ANYkm1LvuyDCdDg0IH80zG81mV0NM3oLBliB72yiexsN+aoQnHp0nC85tWZBYC+ksFXjTXrJmJtbWUMdB6LRVy0aKxzLLPrEmZ/+wATc9ZUa02BzPAa4xQTuWlg+6NsGRUJukxskHtFAyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ft7ja9aT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9FDBAC19421;
	Sun,  1 Mar 2026 01:21:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772328090;
	bh=ipmykbxOi4Ap+/fqtwmyMXkO/5SdBy+tybYcoG3buOk=;
	h=From:To:Cc:Subject:Date:From;
	b=Ft7ja9aTe+69gwxpo3wtLpo9ZO1krpndyshNvtYKfr6WCRYOyXyc8EibPOJ8J6V1T
	 t5P104gtRqdZaLdcQoPtHTVN96EHxaJ0G+jatK8QwgOIRaxgHSnDwcyaRuwaYpTZ8j
	 d3Si+8jMUQsQ28ZwILqDmzI/nyavOtJYiYsEeWSzq5zVtdSuvO8XrRL7+e0IQsMKEi
	 WnUefYVOl3cXVZudkl+DQJXm50M52qGvYO+AvGv1oDvkJYuzm4XleoJ/fNJHQ5sm9t
	 Y2sG5ifd6yzTskTEGBO1+CQXBhW8Ki4ij1CS/3OnFXdZ2IHgNHrh66ESK2LhgeRy60
	 SKjkd+tG2kmyQ==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org,
	mehdi.djait@linux.intel.com
Cc: Hans de Goede <johannes.goede@oss.qualcomm.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	linux-media@vger.kernel.org
Subject: FAILED: Patch "media: i2c: ov01a10: Fix digital gain range" failed to apply to 6.12-stable tree
Date: Sat, 28 Feb 2026 20:21:28 -0500
Message-ID: <20260301012128.1677397-1-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Patchwork-Hint: ignore
X-stable: review
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-53911-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashal@kernel.org,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,intel.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 864EB1CAAC5
X-Rspamd-Action: no action

The patch below does not apply to the 6.12-stable tree.
If someone wants it applied there, or to any other stable or longterm
tree, then please email the backport, including the original git commit
id to <stable@vger.kernel.org>.

Thanks,
Sasha

------------------ original commit in Linus's tree ------------------

From 91848c99ed6a98daf77f4cb7d44cf3f13bc6998f Mon Sep 17 00:00:00 2001
From: Mehdi Djait <mehdi.djait@linux.intel.com>
Date: Thu, 8 Jan 2026 14:57:38 +0100
Subject: [PATCH] media: i2c: ov01a10: Fix digital gain range

Digital gain wraps-around at the maximum of 16838 / 0x3fff.
Fix the maximum digital gain by setting it to 0x3fff.

Signed-off-by: Mehdi Djait <mehdi.djait@linux.intel.com>
Reviewed-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
Fixes: 0827b58dabff ("media: i2c: add ov01a10 image sensor driver")
Cc: stable@vger.kernel.org
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
---
 drivers/media/i2c/ov01a10.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ov01a10.c b/drivers/media/i2c/ov01a10.c
index 1aeba3df4cbfc..8a29e5b4b6ba0 100644
--- a/drivers/media/i2c/ov01a10.c
+++ b/drivers/media/i2c/ov01a10.c
@@ -63,7 +63,7 @@
 #define OV01A10_REG_DIGITAL_GAIN_GR	CCI_REG24(0x3513)
 #define OV01A10_REG_DIGITAL_GAIN_R	CCI_REG24(0x3516)
 #define OV01A10_DGTL_GAIN_MIN		0
-#define OV01A10_DGTL_GAIN_MAX		0x3ffff
+#define OV01A10_DGTL_GAIN_MAX		0x3fff
 #define OV01A10_DGTL_GAIN_STEP		1
 #define OV01A10_DGTL_GAIN_DEFAULT	1024
 
-- 
2.51.0





