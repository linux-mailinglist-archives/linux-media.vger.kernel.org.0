Return-Path: <linux-media+bounces-65755-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id dH02DsmYPmoUIwkAu9opvQ
	(envelope-from <linux-media+bounces-65755-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 26 Jun 2026 17:20:41 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AD8B6CE6C1
	for <lists+linux-media@lfdr.de>; Fri, 26 Jun 2026 17:20:40 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ideasonboard.com header.s=mail header.b=VlRDUYT7;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65755-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-65755-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=ideasonboard.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8317630FA040
	for <lists+linux-media@lfdr.de>; Fri, 26 Jun 2026 15:14:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3627C37BE75;
	Fri, 26 Jun 2026 15:13:58 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39DDF37E2FB;
	Fri, 26 Jun 2026 15:13:48 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782486836; cv=none; b=XwLV3JE+DKsfzGXhTv7U3VVEeDwu9tzfFNYEaPU9lMs1GTCdcV8XwrYv4dAnlJGgjO+DYZJi+5IIbKOVjSrzStg0e81fa9xeM6yNqTMyqv5btZomhbuwtHFAXJ6o8LlVlzKZyq4nFLZbL4+vdi76I4VA4HNoJ8jqlMC/6KHG+g8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782486836; c=relaxed/simple;
	bh=fXxVX6AsyVWSdrB6h403AXMAfpXNRMI5hHFX8br0iuA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uF1shSfVecaQFtogadK93ImrpRGKKUJLYWt/ZaDsdFxxpeDyQanizm82z9CdkUBMJHWkrQkuaq9G/eZyaw6lgGzs+tFUuxBSLFEdThFrnw4uumPQjw3DOc/iBmKAcp9iHNs+jI69yPqTXcmxcH0XYdhDvIZh+F9WFXJDoKV9MpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=VlRDUYT7; arc=none smtp.client-ip=213.167.242.64
Received: from [10.1.1.1] (net-93-65-100-155.cust.vodafonedsl.it [93.65.100.155])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 30AF11438;
	Fri, 26 Jun 2026 17:12:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1782486776;
	bh=fXxVX6AsyVWSdrB6h403AXMAfpXNRMI5hHFX8br0iuA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=VlRDUYT7bJgU2Xsqz7vqfRNrW0HkiR9SvrVwpFuYxrZW9FBSGgtRwsL919g7vihFN
	 Qca3iFxkgaeRxNEf03G2VsfhwNK05YNPz9sWZv2Jxk/tFXZWul7qD60jfB4WqLkaJ6
	 y3XvCLAnoeOqmj+gcsprvkkPoClJ1qnF66x57MtI=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Fri, 26 Jun 2026 17:13:21 +0200
Subject: [PATCH v2 2/6] media: Documentation: uapi: Update V4L2 ISP for
 extensible stats
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260626-extensible-stats-v2-2-41fdd5cf728b@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4347;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=0CKdaLCGSLMPL6ZjUb712zfuhL0l6LagAUBeeMTtH98=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBqPpcd21wlv1npPf6tG48KharzrzKv5iKAn7WiS
 4c/Ab0iM9yJAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCaj6XHQAKCRByNAaPFqFW
 POyZD/9DgiBcyeklzsPef6JvYIPlPGGfwmxFNeYxbUOjtz5pCpy/yIbNEgaeBJO3UuSlg9XSSmM
 qAgiR2/B/GUyHn2h6tM41FzdrJ3fC6HJnGzFBhz9/ozkP09Vzw0CJ3kpoC8Oh7Wmx7CYfUK51tw
 Fc1E+uP/G5K/Oiwbney7zN29RdePON51KUUKtF1rY0+MICllggmKTpJX56GApguhuDi+snI6NRZ
 oFdl/p8RnkAS8vg4gGg0Xqda3WHbws0dcfltZR1iVMQpQCLiATVt0a7B+RnN3q1oczahV9eLJHj
 40TzVGSoUo1mlEfPEgNsYL8WTpY7MfbGjp5cGWghd08e5pCbltsqb2JAqgwZ6n2Hxcfz4wxk43i
 iZHKtZJM2y4VZvLIeEn77NXb2BQ0Tt8sY2T0gzkTVelBCeaDztNm9L7v4DYnY3eJ2eCnewGIMxh
 P4JPdlIXlAcMpwMNkORkQvdzWOCdmovqQ8BKi+e5GDkkXUEcmEusG2uGnQrwOjrJxo7uD94S16W
 pLoTgmbBg+Xhzg1r/ClGWX7cC0uecUWsUrfdSugAidlcRamBo/2urX1GPv6cabKI/apulG+8RnC
 nnAsKUa2dIKzii9frS0iA3bc2+vch/KvS9xzuUiDKceXNYic2NFlZi+nj4rHElaIvgx82PklV3Y
 pyE7myGlKhUsUUQ==
X-Developer-Key: i=jacopo.mondi@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-65755-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,ideasonboard.com:dkim,ideasonboard.com:email,ideasonboard.com:mid,ideasonboard.com:from_mime,ragnatech.se:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9AD8B6CE6C1

From: Antoine Bouyer <antoine.bouyer@nxp.com>

Rework the userspace-api documentation of V4L2 ISP to support
statistics.

Update all occurences of 'v4l2_isp_param' types to match the uAPI
changes and add a section to document the statistics serialization
format.

Signed-off-by: Antoine Bouyer <antoine.bouyer@nxp.com>
Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
[Update on uAPI changes]
Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 Documentation/userspace-api/media/v4l/v4l2-isp.rst | 45 ++++++++++++++++------
 1 file changed, 34 insertions(+), 11 deletions(-)

diff --git a/Documentation/userspace-api/media/v4l/v4l2-isp.rst b/Documentation/userspace-api/media/v4l/v4l2-isp.rst
index facf6dba1ca7..8a3f05b5e85f 100644
--- a/Documentation/userspace-api/media/v4l/v4l2-isp.rst
+++ b/Documentation/userspace-api/media/v4l/v4l2-isp.rst
@@ -18,22 +18,22 @@ single C structure that contains a header, followed by a binary buffer where
 userspace programs a variable number of ISP configuration data block, one for
 each supported ISP feature.
 
-The :c:type:`v4l2_isp_params_buffer` structure defines the buffer header which
-is followed by a binary buffer of ISP configuration data. Userspace shall
-correctly populate the buffer header with the generic parameters format version
-and with the size (in bytes) of the binary data buffer where it will store the
-ISP blocks configuration.
-
-Each *ISP configuration block* is preceded by an header implemented by the
-:c:type:`v4l2_isp_params_block_header` structure, followed by the configuration
+The :c:type:`v4l2_isp_buffer` structure defines the buffer header which is
+followed by a binary buffer of ISP configuration data. Userspace shall correctly
+populate the buffer header with the serialization format version and with the
+size (in bytes) of the binary data buffer where it will store the ISP blocks
+configuration.
+
+Each *ISP configuration block* is preceded by a header implemented by the
+:c:type:`v4l2_isp_block_header` structure, followed by the configuration
 parameters for that specific block, defined by the ISP driver specific data
 types.
 
 Userspace applications are responsible for correctly populating each block's
 header fields (type, flags and size) and the block-specific parameters.
 
-ISP block enabling, disabling and configuration
------------------------------------------------
+ISP parameters block enabling, disabling and configuration
+----------------------------------------------------------
 
 When userspace wants to configure and enable an ISP block it shall fully
 populate the block configuration and set the V4L2_ISP_PARAMS_FL_BLOCK_ENABLE
@@ -59,7 +59,30 @@ definition without invalidating the existing ones.
 ISP statistics
 ==============
 
-Support for generic statistics format is not yet implemented in Video4Linux2.
+The generic ISP statistics format is identical to the generic ISP configuration
+parameters format. It is realized by defining a C structure that contains a
+header, followed by binary buffer where the ISP driver copies a variable number
+of ISP statistics blocks.
+
+Extensible statistics buffers have :c:type:`v4l2_isp_buffer` header followed by
+a binary buffer of ISP statistics data. ISP drivers populate the buffer header
+with the serialization format version and with the size (in bytes) of the binary
+data buffer where ISP statistics data are serialized. Applications shall
+validate that the serialization format version matches the expected one and that
+the buffer size doesn't exceed the maximum size for a statistics buffer as
+declared by the driver's uAPI header.
+
+Each *ISP statistics block* is preceded by a header implemented by the
+:c:type:`v4l2_isp_block_header` structure, followed by the statistics data for
+that specific block. The driver might optionally report platform-specific flags
+associated with each statistics block.
+
+Applications inspect the statistics block type as reported in the header and
+validates the reported size matches the block's expected size before accessing
+the ISP statistics data.
+
+Extension to the statistics format can be implemented by adding new blocks
+definition without invalidating the existing ones.
 
 V4L2 ISP uAPI data types
 ========================

-- 
2.54.0


