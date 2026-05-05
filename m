Return-Path: <linux-media+bounces-60438-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qKfhHgT7+WmNFgMAu9opvQ
	(envelope-from <linux-media+bounces-60438-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 05 May 2026 16:13:24 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 175804CF2A6
	for <lists+linux-media@lfdr.de>; Tue, 05 May 2026 16:13:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 517B5301E4A6
	for <lists+linux-media@lfdr.de>; Tue,  5 May 2026 14:13:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EACA347F2E5;
	Tue,  5 May 2026 14:12:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="NL6HMGll"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A44147F2E8;
	Tue,  5 May 2026 14:12:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777990378; cv=none; b=Gwdr2jvYpBPKKCJ0rFZDHGwIWXmSGHN+ccTPFT/mmqIRiLEvetIgzZX57G4d/xqZYD6nDetNUrAwOeeGhZBpZR6ZKxv0tk3FOHMNLU+QRfPIKBR9v/gMQ9w09H3SKTrhp3OOUHD+qbg4jlKQT940q6u4GsrXVAGDmpNg3ENZjGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777990378; c=relaxed/simple;
	bh=41S+ZeIQVev9eVoYtAcBbO2DN3BHJm0Mrl6dgk7LAJg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=L3RRbhptkapH/VpejrIasgL6VH9SHgofbdibdxGynHnhcDJFggtrdetfAxioaEKMoBfHnhHtc8krFHCeUJgCBBRfoDdnu/tTppeg7IR1PwqYISsSxDdmGr+clCAhUlNFIPMzm8UTjULlPzv9/5bEdFuN4Eymdrhqo8X3Y5ZG2jQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=NL6HMGll; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.1.83] (unknown [IPv6:2001:b07:6462:5de2:520d:d7a3:63ca:99e8])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id AEBC92451;
	Tue,  5 May 2026 16:12:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1777990358;
	bh=41S+ZeIQVev9eVoYtAcBbO2DN3BHJm0Mrl6dgk7LAJg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=NL6HMGllt+pQ4CHmqvNsRXnWhMwpmk32bBWPyvuzcS9J4171fBo+6uhsUAQBxb6aF
	 eRlh4afLvQJ1i6XT9Gek1mZWspiu2o6XLRprMLS2a4Hyq6mPISksSfFR87oVBWxyWi
	 wfKvSDvmPUM/qNayVUj1+lqJOPx7RJ+uT/mWAghE=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Tue, 05 May 2026 16:12:15 +0200
Subject: [PATCH 4/6] media: v4l2-isp: Add per-block validation callback
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260505-extensible-stats-v1-4-e16f326b8dad@ideasonboard.com>
References: <20260505-extensible-stats-v1-0-e16f326b8dad@ideasonboard.com>
In-Reply-To: <20260505-extensible-stats-v1-0-e16f326b8dad@ideasonboard.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Daniel Scally <dan.scally@ideasonboard.com>, Keke Li <keke.li@amlogic.com>, 
 Antoine Bouyer <antoine.bouyer@nxp.com>, 
 Jai Luthra <jai.luthra@ideasonboard.com>, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
 Ricardo Ribalda <ribalda@chromium.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Hans Verkuil <hverkuil+cisco@kernel.org>, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Jacopo Mondi <jacopo.mondi@ideasonboard.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2781;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=41S+ZeIQVev9eVoYtAcBbO2DN3BHJm0Mrl6dgk7LAJg=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBp+frTVSWF7yv4xDBcD0gjY4dugGG9XfOy++9yV
 VVorFkXOA+JAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCafn60wAKCRByNAaPFqFW
 PIz8EACj7V+zRXC4u5qfikTaL6FKwppx79pILp9nFP7AlqQTjG0kvz8AxwMO2P4Ttz6GGcJFrFY
 Heynk/Ml4WTxVH/XYjO0pFr87dQFWAdofepBDQP/mWBf9SnPGAxl/C7fOy+3SGqaX9RwFbXp2EK
 /zNZFPWfPOmvu7dKYFFgTs/DSlZplqeIBwWWwmCaI/eX7B/T06sJ2eynOBW5AU1VnwnMg+WPDuB
 PCCIBbhtMeojhD6wYXskV8Og34XHcrE+mWSd+oe/NXdpmZgibs/YV5WMYMkmaIrFK1/4jCmYxW+
 BM1MzeHbAGjLTa73eUxzIwLhtF6tef/Q/jSQX8/otFT+NBT/SH70iJxDzvf3z3TLjUIsxhXP5Dr
 25zkHLqJUbndWEN1jY+8DUgmq41Ag3+ZK2g3RPJ9B1sb/AeWAnw5AKogAzquPY/6eP0Cdxb6+Nm
 mGchhHWy0rZcQVkwjXkV2W2cEvX0usdWqojT5+ZZSFmkFbSw8uTBDAmhxfiHlwQCLHHgJ+lh4T7
 eMRIwFOKHDZK8T0ZMBttYvuyCnGQLWlAMV7Wkk45aaz0YnrJ2hYWjeDaZxwidZq04tGSyamw7VH
 pNF3gskzYgQyQNzPHESonll4oprEM3faSSLHS/PLFsG+OXAb/onE53JdwbCVV3unxxOVwKPP1LR
 1CgTUy7xNDrIrWA==
X-Developer-Key: i=jacopo.mondi@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B
X-Rspamd-Queue-Id: 175804CF2A6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-60438-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jacopo.mondi@ideasonboard.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]

Drivers are expected to provide to the helper function
v4l2_isp_params_validate_buffer() a list of 'struct
v4l2_isp_params_block_type_info' entries, one for each supported ISP block.

The type 'struct v4l2_isp_params_block_type_info' so far only contained the
expected block size for the core framework to validate the declared block
size against the expected one.

For some blocks, drivers might want to implement more precise per-block
validations. Add a function pointer member to 'struct
v4l2_isp_params_block_type_info' to allow drivers to register a callback
and call it from the core framework during validation.

Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 drivers/media/v4l2-core/v4l2-isp.c |  4 ++++
 include/media/v4l2-isp.h           | 11 ++++++++---
 2 files changed, 12 insertions(+), 3 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-isp.c b/drivers/media/v4l2-core/v4l2-isp.c
index 29831f7032e9..10760659f8a3 100644
--- a/drivers/media/v4l2-core/v4l2-isp.c
+++ b/drivers/media/v4l2-core/v4l2-isp.c
@@ -114,6 +114,10 @@ int v4l2_isp_params_validate_buffer(struct device *dev, struct vb2_buffer *vb,
 			return -EINVAL;
 		}
 
+		if (type_info->block_validate &&
+		    type_info->block_validate(dev, block))
+			return -EINVAL;
+
 		block_offset += block->size;
 		buffer_size -= block->size;
 	}
diff --git a/include/media/v4l2-isp.h b/include/media/v4l2-isp.h
index d70ed6b431e7..1f35a52f978a 100644
--- a/include/media/v4l2-isp.h
+++ b/include/media/v4l2-isp.h
@@ -55,17 +55,22 @@ int v4l2_isp_params_validate_buffer_size(struct device *dev,
 /**
  * struct v4l2_isp_params_block_type_info - V4L2 ISP per-block-type info
  * @size: the block type expected size
+ * @block_validate: driver's callback to implement per-block validation
  *
  * The v4l2_isp_params_block_type_info collects information of the ISP
- * configuration block types for validation purposes. It currently only contains
- * the expected block type size.
+ * configuration block types for validation purposes. It contains the expected
+ * block type size and a function pointer where drivers can register a callback
+ * for additional per-block validation purposes. The validation function is
+ * expected to return 0 on success or a negative error number for errors.
  *
  * Drivers shall prepare a list of block type info, indexed by block type, one
  * for each supported ISP block type and correctly populate them with the
- * expected block type size.
+ * expected block type size and the optional callback.
  */
 struct v4l2_isp_params_block_type_info {
 	size_t size;
+	int (*block_validate)(struct device *dev,
+			      const struct v4l2_isp_block_header *block);
 };
 
 /**

-- 
2.53.0


