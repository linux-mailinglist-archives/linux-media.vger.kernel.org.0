Return-Path: <linux-media+bounces-65757-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id IyK0GO+YPmofIwkAu9opvQ
	(envelope-from <linux-media+bounces-65757-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 26 Jun 2026 17:21:19 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CE9676CE6DF
	for <lists+linux-media@lfdr.de>; Fri, 26 Jun 2026 17:21:18 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ideasonboard.com header.s=mail header.b=FNd9JmRo;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65757-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65757-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=ideasonboard.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id AA8A631086D9
	for <lists+linux-media@lfdr.de>; Fri, 26 Jun 2026 15:14:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3C6E37E2FB;
	Fri, 26 Jun 2026 15:14:07 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66B4B37F755;
	Fri, 26 Jun 2026 15:13:58 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782486845; cv=none; b=X99IHWnGBwJKra0jWPKMp7AaeP8KW/wQNJzrNk5udyDDzAC+ns6vAzCuGWjpWaIQwZSKJ8z0zAKv9upRI8jItl6hLipluk8CW5FMLAk5f19TUQB1QOWV0NXewoIuw5OiyuhoOm+qt1Ah6Knpj5SWxnmAEJTAvGOHyrA0RsYnPto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782486845; c=relaxed/simple;
	bh=iboKAz4TCrq9+HXW03fhGtEwykXDig5N1ZtGZqLg1Ps=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=O/dYjsj3mp4XkpfN1ZX9XSOK3QHq4RhQ36qnawVhCIZj3wm1MoBMdoShHAGCN9OlsevDDYpVfdJGUojc6a9E7DYXcW/ot6ENaoMqVpdpDaw7mGTCFdeuh86/rv0dsVYP9s91OpGynW7BPts0wfHRr2HCbki0fbm9cx1vGIZPiOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=FNd9JmRo; arc=none smtp.client-ip=213.167.242.64
Received: from [10.1.1.1] (net-93-65-100-155.cust.vodafonedsl.it [93.65.100.155])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 989161ADF;
	Fri, 26 Jun 2026 17:12:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1782486778;
	bh=iboKAz4TCrq9+HXW03fhGtEwykXDig5N1ZtGZqLg1Ps=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=FNd9JmRo8407U1hqcR5XSACleY6d9/7fCCeCXc8xAvwioQXxckOfGT7RPGITLScI3
	 IuJxL7mHrCfocAFWiGJZSuwNbPHVlYjiz8vQ3H3Tx8DBBOwghkiCPEELQLRankPnNd
	 smeW6aJLWciSVIt5tieTH8sExT+AlhaVilPuZUwE=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Fri, 26 Jun 2026 17:13:23 +0200
Subject: [PATCH v2 4/6] media: v4l2-isp: Add per-block validation callback
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260626-extensible-stats-v2-4-41fdd5cf728b@ideasonboard.com>
References: <20260626-extensible-stats-v2-0-41fdd5cf728b@ideasonboard.com>
In-Reply-To: <20260626-extensible-stats-v2-0-41fdd5cf728b@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2853;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=iboKAz4TCrq9+HXW03fhGtEwykXDig5N1ZtGZqLg1Ps=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBqPpceXzDud9h1kuTe9WOPtpiNAAy8ywomEI1Ia
 mCQ/a15wT6JAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCaj6XHgAKCRByNAaPFqFW
 PLntEAC0zY2na9Qfn6Et6k+CNNwVTPy5LY9Y6Q7VY/JVFSFPaHOC2voZhJGelSk63fFp5DqzHzr
 qf3AuV8FQ4YENPzNBg98QqHJVov8fQGoEJaF+zJen0YXBAvMJQUCa6J524TslxekvIOPu11UgAd
 P6Ud48u+xKqzj2zdyaYU/Wugv54wsU/YBeLc/2vOaL3hD120ttCp9ZfGCnoIdmz5pdNuQ+6TgTr
 oOgDgoW99xaEbyUhVKoCfQeAzhMbeYguq1d7mWJyvhWsZLsaZk/1eVSuXYO3aeJUiVFRVHJKu4Y
 Ynb0KnVyUdO5QRfeiSK7MuR2u5RVrozivr0E2k7Rsi6C7NxMcbnBNrFuKfq5p6fT9fxRPGwQIHz
 tYsJzm7gmw08CKDeqiWmU7H7Cos0C22NkDiCr5AZu967GUP7r0UbOEXoB87Gb9cLuSlSbx8a/6T
 jHjV2hTkaZWX5FmGOhtR39Nclub0Lq9Z0jlNe4Zg3mybHxkvO43v0moFm2Qc+jL26BwYrqK4XEn
 DR0DbOuJtyYTBY0KtVzVuQSNjOSp0TGdV9r7mMExoFyuvweGsW6RoGUnGBHf/fB+88ys9pkpxzh
 rKcDs6+qU5albMJHF0bIx0sbqoLz3JDSSRLCkYUvkJt1QJgL8i9X/wiHfJjL1Vy8abuAJSGMDiE
 +7aOim5SPTYVfCA==
X-Developer-Key: i=jacopo.mondi@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-65757-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,ragnatech.se:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,ideasonboard.com:dkim,ideasonboard.com:email,ideasonboard.com:mid,ideasonboard.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CE9676CE6DF

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
2.54.0


