Return-Path: <linux-media+bounces-60437-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WKh+MP/6+WmNFgMAu9opvQ
	(envelope-from <linux-media+bounces-60437-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 05 May 2026 16:13:19 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BD0184CF297
	for <lists+linux-media@lfdr.de>; Tue, 05 May 2026 16:13:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 85009300FC35
	for <lists+linux-media@lfdr.de>; Tue,  5 May 2026 14:12:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8F0147F2CF;
	Tue,  5 May 2026 14:12:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="r9fK/Usz"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E9E248032F;
	Tue,  5 May 2026 14:12:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777990368; cv=none; b=mDrjZFqiAd3HJYluZnwjCYhZZFvUobRseXonY/4uE+3+vC6o0bP8fOZhXgUPY9SzPRdQRpODfJXunyBuuqaavPK5e1XFAv/GW1rZt6ddNjxgMBZRjmeCGGwYvMH8rn4YqE9nngsyxloDESy5VSxm84qPIMcq+eEv/HhG71ChpwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777990368; c=relaxed/simple;
	bh=6cpwZlYBX25LxZlVKKxAzE8ienKp5EIXWJ0alPjFWO0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=q+hJwH5jwWvYQuG8cPDWQXNF/jhV6YZaMwx8BvSohWL29wbgSe3XKyMVQjuVI3lvRBuP5yOFsuVPE9r+wOCvBvdb0CpKUEMNzhF+85oaLUEyaC2Exq5z6nfLdrgEHIv13RJhupcFSby6C+dqCUFRK7kbpU5S8dVtSf+DPfb/mdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=r9fK/Usz; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.1.83] (unknown [IPv6:2001:b07:6462:5de2:520d:d7a3:63ca:99e8])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id DBE341121;
	Tue,  5 May 2026 16:12:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1777990356;
	bh=6cpwZlYBX25LxZlVKKxAzE8ienKp5EIXWJ0alPjFWO0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=r9fK/UszoDf5or5mcWna9IttkBeY/J9JrNUDgnvZgfhaOmQkRvl5ZQMcygME6q3+C
	 DThsxedbURTEZ4swqqrIA+VBOszSsca4tHFcGoWC7RtvfyjL757ZhGox0C5vxWl9i1
	 8cR8PvkB3PZ1e12w7X5cXTbEzCQnZc3g9oICu4Vc=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Tue, 05 May 2026 16:12:13 +0200
Subject: [PATCH 2/6] media: Documentation: uapi: Update V4L2 ISP for
 extensible stats
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260505-extensible-stats-v1-2-e16f326b8dad@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4275;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=FjWOxxtsPzgrK1twE+7vwZ0Gd7DpMY7KtdZmVJPZXUc=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBp+frTNWKRrAxUy6GsyyPfHamSHH2RZbEp9QVo5
 ByVHW6NkKWJAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCafn60wAKCRByNAaPFqFW
 PJncD/9EBmK1fSgSGP7/1mBXxYcTH837Dcw4KgGowxEHKlLAPKRNXrjDv5JmvdvQJ2apg1ew6c5
 9WXrqzCxjwA9JLXlWNZHTQbxiNgBZhwsLAmi0EodybmbMiqNl8E+rl70/ylfpUUTGbITmenY0bm
 Cf6dAEirBXt6P8mvCCtbFj/atoc8+f3h8jhvJugdqya7+fSpJTYwxnrBLo+JKrMhtEsyMw6w2nY
 GrkzcEtu9zRxR0bLcKpR7PRGnIRC8R81sMvs2jIJlB/sobJSIsavEzZXCwhJm80EGg/yAh5XKPU
 cd2I7i8/cGN0UEbikUTgtsaulN/i9IIPOfCWg9BTyAMYkUDURFkmto65EBI0JGvF+knhtSHTBgm
 L3tQbs+0LV8BE4D36E8mGrcyq06GNAc2XV35HTmVcepeHeGE+8wTZIKkVY10+st2yeEaet7H7Mp
 tUDbEHGWDVQtlz8P0JZSICfDpHyf3JN3Z+gF4okTkDd79w8NLQlZBH4IUQIRTUlv2tvpSCAsfEb
 qJasJSs7l1j5PyPjl63GJ/ZlWCqzYe6BEry2V4wDpBI2eSNbw9CPj4X/qhXfFTHkj/gkvdGN4Ok
 ukPgDRoRixcj8947SNh7s8u/fzW/tc2WHdEWAwbp006CsP3JRfPoH6NpHjhSBISBk64hg2CdhHm
 zQ9IYVT2gC57tVQ==
X-Developer-Key: i=jacopo.mondi@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B
X-Rspamd-Queue-Id: BD0184CF297
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-60437-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jacopo.mondi@ideasonboard.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,nxp.com:email]

From: Antoine Bouyer <antoine.bouyer@nxp.com>

Rework the userspace-api documentation of V4L2 ISP to support
statistics.

Update all occurences of 'v4l2_isp_param' types to match the uAPI
changes and add a section to document the statistics serialization
format.

Signed-off-by: Antoine Bouyer <antoine.bouyer@nxp.com>
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
2.53.0


