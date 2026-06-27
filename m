Return-Path: <linux-media+bounces-65804-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id GD7yK/TTP2qzYgkAu9opvQ
	(envelope-from <linux-media+bounces-65804-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 27 Jun 2026 15:45:24 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B6746D2081
	for <lists+linux-media@lfdr.de>; Sat, 27 Jun 2026 15:45:24 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ideasonboard.com header.s=mail header.b="jfqjm/Bt";
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65804-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-65804-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=ideasonboard.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CF7C0302F25A
	for <lists+linux-media@lfdr.de>; Sat, 27 Jun 2026 13:42:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D091A3B14A0;
	Sat, 27 Jun 2026 13:42:39 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B000F3A6411;
	Sat, 27 Jun 2026 13:42:34 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782567759; cv=none; b=J3lXjiNwx/HudzVWQDLuH2K5GFsanPdulf3QsOxAlRNWuFLJNxDky2OIoLl036+aFKVQNEETLAXxqCBqPOGRnfnoXs3/3BN9tcbHpahwHzxT92ZzhZQG2sP6bok6vIMrKtqv08itBDiKvaBvVL/yNcfudFd/zSUIarv80DYnXAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782567759; c=relaxed/simple;
	bh=86vVQrTW4p2ts1Q7I1i4FABDB2XwaCgdfarPByGHNzM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MirhSv14LiNleldhEfYcRuC2QdtTk6FDgrGSkTsCcDn1uJlbw9uXQIlICQBLL8gdNQOXJt2DZj5SIeldeK2Dm6UmwMYbLe1jJg1jR6C0xs04Nzi0jzm9FspU/7LmJpTFKdDHNYUZR+1mvtUVXgyw/aE7aw0MCbYiy30c+WtmMt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=jfqjm/Bt; arc=none smtp.client-ip=213.167.242.64
Received: from [192.168.1.106] (mob-5-90-49-163.net.vodafone.it [5.90.49.163])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id D2B2A1CFE;
	Sat, 27 Jun 2026 15:41:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1782567705;
	bh=86vVQrTW4p2ts1Q7I1i4FABDB2XwaCgdfarPByGHNzM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=jfqjm/BtOlzePnhrM+qVloxRt7qAmXCrvfAjbwtc1RawXB7krt4xK3eMh/xqMX+48
	 lmunFKDwC27VeKQxrQ743gBpez6qqhZwGIKD58CwTBygVVGj5YnRQW0zzdt2T18FiE
	 +1kDyOSUV6OCMWf6yw06MPmDVChh8MXqqee4gg8s=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Sat, 27 Jun 2026 15:42:01 +0200
Subject: [PATCH v3 4/6] media: v4l2-isp: Add per-block validation callback
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260627-extensible-stats-v3-4-3b600bb2db8b@ideasonboard.com>
References: <20260627-extensible-stats-v3-0-3b600bb2db8b@ideasonboard.com>
In-Reply-To: <20260627-extensible-stats-v3-0-3b600bb2db8b@ideasonboard.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Daniel Scally <dan.scally@ideasonboard.com>, Keke Li <keke.li@amlogic.com>, 
 Antoine Bouyer <antoine.bouyer@nxp.com>, 
 Jai Luthra <jai.luthra@ideasonboard.com>, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
 Ricardo Ribalda <ribalda@chromium.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Hans Verkuil <hverkuil+cisco@kernel.org>, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2833;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=86vVQrTW4p2ts1Q7I1i4FABDB2XwaCgdfarPByGHNzM=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBqP9M6Dwvai2rDdgNcAIAzLmNhvJ8Xt4FLWb8Oi
 aait3Oj0eCJAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCaj/TOgAKCRByNAaPFqFW
 PI/QEACth7LbfsmF4P1JExSu2OTtHOW0pfA5vOvAPOBZqq331EZ1ADNKdepVu4gFZCa4Y5+cHUv
 Yp2H/1Oxb9DKU+dgZlgM3dKR5i0KAiGePat6E6MweoT71QssGmSMyh3UYVLOuYT11v+zt6+px1w
 OCFfokUCjXPPx9//NOOPISbhrkoReU7x6yle13oiQczVABjOmMo/A0phV7DIhLQ5vBcQpcmClWM
 K+///bd6OMYWHikjseNA1B451vSOWB3NJt1i91V4w7ycbJy8tJvyNP7pfQNrADnAFmxrVtNqEff
 Fy+GgnEifERZtBW1LYIUaVfU9fPi6dtrofKajox7cBzEQJDAWcVo48kj5nIutVmXMKeAnET4u/1
 XGKIPdSPu+nt6Bei6QZhPv49wc9WJ8RMA/7eFc6WNSFWK4h9sPuV6jninTlqvcc088GrL88cvbJ
 GXxWM0TCTZvjuk7zm+uAPsMliPDHboGfG6GCsnu/eA0QJIXUtxmxbebXBzEyrilgvIKTzKtgW+H
 6vtuYko5ZdoB/3lgNWRJ3XVWaM5+2mBQ6L/HDDwU84rFPkkFgCwII0b4gJAYYQaXD1zLgmGPCIk
 52Es65dKM1YHmaWAbw6suR2oQP4JJTcVOFBF+/RsTCUvAfDXeqzus+7j+af53/P9hqBWGCEkNve
 W70eR4mjdqxei8Q==
X-Developer-Key: i=jacopo.mondi@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-65804-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:mchehab@kernel.org,m:dan.scally@ideasonboard.com,m:keke.li@amlogic.com,m:antoine.bouyer@nxp.com,m:jai.luthra@ideasonboard.com,m:niklas.soderlund@ragnatech.se,m:ribalda@chromium.org,m:laurent.pinchart@ideasonboard.com,m:sakari.ailus@linux.intel.com,m:hverkuil+cisco@kernel.org,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:jacopo.mondi@ideasonboard.com,m:niklas.soderlund+renesas@ragnatech.se,m:hverkuil@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jacopo.mondi@ideasonboard.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jacopo.mondi@ideasonboard.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco,renesas];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,ragnatech.se:email,ideasonboard.com:dkim,ideasonboard.com:email,ideasonboard.com:mid,ideasonboard.com:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1B6746D2081

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

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 drivers/media/v4l2-core/v4l2-isp.c |  3 +++
 include/media/v4l2-isp.h           | 11 ++++++++---
 2 files changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-isp.c b/drivers/media/v4l2-core/v4l2-isp.c
index 29831f7032e9..f497471e9f18 100644
--- a/drivers/media/v4l2-core/v4l2-isp.c
+++ b/drivers/media/v4l2-core/v4l2-isp.c
@@ -114,6 +114,9 @@ int v4l2_isp_params_validate_buffer(struct device *dev, struct vb2_buffer *vb,
 			return -EINVAL;
 		}
 
+		if (info->block_validate && info->block_validate(dev, block))
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
2.54.0


