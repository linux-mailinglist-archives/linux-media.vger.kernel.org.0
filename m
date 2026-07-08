Return-Path: <linux-media+bounces-67040-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id gUVlOPxsTmr+MQIAu9opvQ
	(envelope-from <linux-media+bounces-67040-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 08 Jul 2026 17:30:04 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F7697280A6
	for <lists+linux-media@lfdr.de>; Wed, 08 Jul 2026 17:30:04 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=mvH4OmPP;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67040-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-media+bounces-67040-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B976F301BBAF
	for <lists+linux-media@lfdr.de>; Wed,  8 Jul 2026 15:29:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D66893B42DE;
	Wed,  8 Jul 2026 15:29:40 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64A0E3F12CB
	for <linux-media@vger.kernel.org>; Wed,  8 Jul 2026 15:29:38 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783524580; cv=none; b=M1G9Mv5Gx6x1qm3B2OkOU/yEwXleH8ixz4iEwXswORw+0W+dub/N5m6soAeDSN67HIGqjwH3dczmAt/DxLdR7MTsTXgvDyNts0RcZgBEp3ydd3dGiOSBbRCfPY9sL4SVic+9Vqb8dqGZKeqrDg9dIddqEUSq0D5n4asHJ14XScU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783524580; c=relaxed/simple;
	bh=IjflyL3zVyUblwei+sfA2PZGw6L5MMKAZfPBy3T/plo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gCGRTeBsxh/AsfLwfVXWd6i9Hye++gXeGNA8nVhbKybXbU+BNmf9zgOUctwz55zUhkjQwiTIDj8W2nW52YI8Uqzk0G20kNgrn2yJQm7p7oD7YQ8VjR51ZHDCnwhIvsVCjrnhxFhUtmVGXeGDBfU5xtoig92NO8y+iAHD/VLYAZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mvH4OmPP; arc=none smtp.client-ip=209.85.214.175
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2c9b1edf2bdso12263325ad.1
        for <linux-media@vger.kernel.org>; Wed, 08 Jul 2026 08:29:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783524577; x=1784129377; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=y8VL5wx8BrEfM1fCHB+ytQGlVDcPFKqcOjt+LVCCLH8=;
        b=mvH4OmPP/lC/+vUeSgUWJDeFZEOoG5OUFYm8XhfGs0blTgdkHjCxpXhktnBOACkguO
         KKKQILkLIsoWSvdMWqtpNXIuaePUG6gUJI9DmuXoXhPx3bBCIXsoLOcGUypcEp/EF5GX
         JgcAOXNWxpX9gotaq6jP0oxMqxO3H+bDhAyw3YuNHCB1xMzQobjnV+a8LPXhBS7/bHsw
         sg3b7G3l5G85dv9h68C4poqLC2lnn2/Lun3TAGoxU5Vk11iLkarhzGFmw2zt6TMuUs1E
         dCbg/sZ54OmZtnmUPpxDMplMz7SuWLz8g1/PFWUooVjDaknuKVZkhEBaBaB2jbOaRQC6
         RBJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783524577; x=1784129377;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=y8VL5wx8BrEfM1fCHB+ytQGlVDcPFKqcOjt+LVCCLH8=;
        b=mVXeGfIEQj3UsWs5J7UYzLFca9d9rOkknw4LXdBx0u8rlMjkUfVy7zIb9qtbXkWAyE
         w7eBW/EaOt6h9Nvkg0TGm9mPtqd9XzgZQ+uhM4sdB2EK6qcYf4Uh7UzdIRtbcIG4v7MT
         ta5LaK0+Req4jeTBSAX4gLaeqhT5fZ1pypLeA/ZzKc4aV0rHyEqfDWYr1rE4yfvQiBD1
         o5fAIVJFFQX9K+OlLn8iP5bSffAd6Rx3eR2xEGMIim2qElickcPWfhu+doUZdp8/f/Om
         jsJJy8RA9OLhN05OCDkFf7PDUzy1a9ltf+O1/DvBfnTtyi0al3P4OudWtfujIOqaWCdg
         zY4A==
X-Forwarded-Encrypted: i=1; AHgh+RquFAOYliMkkOHuS4owvhXPfJ+mjX2U753FDTH+TICHt10A3lIGQTyxH2Ut0dTOyQurdExduBmvRa0Ljw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3dB8XaE44WMQBu0ia/NZsrDUiEQKgmZ7zEd2ye8KyRTRQBMrL
	mPHodmniUO40rrAbUY/vSUhe05bnaleOVjYsAWNfLO2NUFQTf6r9w87h
X-Gm-Gg: AfdE7clWGhRH9bF91FlIKWYVaOKc7ZH8acLlmCIf27gVg+htdhpnjjJupPOSujxsp6H
	KM86JgCl9ey6HTj+89gLbt3Bwcd+sUY2q6G1vQZBYeyzg8f/eR4SXHIpfZxpV5QzBqZ23f6Nfb2
	hY9mna89Ob8A8xgZozC6HhZqWZ1fmJFBfR0oDNeIpZXXfJDOdlmdcXniiglJIoRT1Q84EJzt1n8
	/0SUFR0IxE9NqMl1zcY119RrKriMAXFa/bKutlBhkE77jtNzfnV/5YEtCde4gbWJ7xYRKC/Y5wI
	xB/VOvVp17hx15hNxYFqDRnLO3rhSfaUz5DGeNQSi481dN+R5MdnN8S4E5vcN2cLUOKZ9Z7TRC3
	kl+O8gfvKhmiCrkBL3Z53pTJXDHJTKGLgdIPjHrKIadW3Ofv20kUlvRVjOMovu5r6ZoTx7SMubr
	cNSzz3KKWG2jlSx0fB/O3wTcYdvKP1qfg1D9/yetCFcz8=
X-Received: by 2002:a05:6a20:9c9b:b0:3b3:1c7b:ffb with SMTP id adf61e73a8af0-3c0bca8e5femr4018132637.34.1783524577540;
        Wed, 08 Jul 2026 08:29:37 -0700 (PDT)
Received: from localhost.localdomain ([49.207.223.101])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31174892711sm22334438eec.13.2026.07.08.08.29.33
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 08 Jul 2026 08:29:37 -0700 (PDT)
From: Biren Pandya <birenpandya@gmail.com>
To: jacopo+renesas@jmondi.org,
	kieran.bingham+renesas@ideasonboard.com,
	laurent.pinchart+renesas@ideasonboard.com,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Biren Pandya <birenpandya@gmail.com>
Subject: [PATCH v3] media: i2c: rdacm21: Fix missing media_entity_cleanup()
Date: Wed,  8 Jul 2026 20:59:28 +0530
Message-ID: <20260708152929.50074-2-birenpandya@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260704201627.82584-2-birenpandya@gmail.com>
References: <20260704201627.82584-2-birenpandya@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-67040-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:jacopo+renesas@jmondi.org,m:kieran.bingham+renesas@ideasonboard.com,m:laurent.pinchart+renesas@ideasonboard.com,m:niklas.soderlund+renesas@ragnatech.se,m:mchehab@kernel.org,m:sakari.ailus@linux.intel.com,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:birenpandya@gmail.com,m:jacopo@jmondi.org,m:kieran.bingham@ideasonboard.com,m:laurent.pinchart@ideasonboard.com,m:niklas.soderlund@ragnatech.se,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[birenpandya@gmail.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[birenpandya@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7F7697280A6

If an error occurs after media_entity_pads_init() is called, the media
entity is left uncleaned, potentially leaking resources or leaving it
in an invalid state. Similarly, the remove path misses the cleanup.

Add a dedicated error_entity_cleanup label so that media_entity_cleanup()
is only invoked on the error path when media_entity_pads_init() has
actually succeeded. Also add media_entity_cleanup() to rdacm21_remove()
to ensure proper resource release on driver unload.

Fixes: a59f853b3b4b ("media: i2c: Add driver for RDACM21 camera module")
Signed-off-by: Biren Pandya <birenpandya@gmail.com>
---
Changes in v3:
- Added a blank line after media_entity_cleanup() in the error path (Sakari).

Changes in v2:
- Fixed a bug in v1's probe error handling where media_entity_cleanup()
  could be called on an uninitialized entity.
- Added Signed-off-by tag which was missing in v1.
---
 drivers/media/i2c/rdacm21.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/rdacm21.c b/drivers/media/i2c/rdacm21.c
index 41d4242a9b583..ece8a410e7ced 100644
--- a/drivers/media/i2c/rdacm21.c
+++ b/drivers/media/i2c/rdacm21.c
@@ -588,13 +588,14 @@ static int rdacm21_probe(struct i2c_client *client)
 
 	ret = v4l2_async_register_subdev(&dev->sd);
 	if (ret)
-		goto error_free_ctrls;
+		goto error_entity_cleanup;
 
 	return 0;
 
+error_entity_cleanup:
+	media_entity_cleanup(&dev->sd.entity);
 error_free_ctrls:
 	v4l2_ctrl_handler_free(&dev->ctrls);
-	media_entity_cleanup(&dev->sd.entity);
 error:
 	i2c_unregister_device(dev->isp);
 
-- 
2.50.1 (Apple Git-155)


