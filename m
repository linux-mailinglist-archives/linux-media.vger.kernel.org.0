Return-Path: <linux-media+bounces-64563-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id bB/qCht+Kmp7rAMAu9opvQ
	(envelope-from <linux-media+bounces-64563-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 11 Jun 2026 11:21:31 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 76075670594
	for <lists+linux-media@lfdr.de>; Thu, 11 Jun 2026 11:21:30 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ideasonboard.com header.s=mail header.b=bnhdh+0B;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64563-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64563-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=ideasonboard.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2559632A0EF4
	for <lists+linux-media@lfdr.de>; Thu, 11 Jun 2026 09:16:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A08B63905EF;
	Thu, 11 Jun 2026 09:16:05 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C732B86334;
	Thu, 11 Jun 2026 09:16:03 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781169365; cv=none; b=P7+i/xBZss6s2XWLWDM0plQ4s3WLGwmu5IO0pdCn/I3KFt0mZWmz5zFZHvn4HeggD2UBr67tfcK0/g7k+qaXwCJdr/MVOrEcu8+3qLELGOIR+AZeBXhybinggOo8XcLOpEBQ7Ii516C1gFHXAALDcsAY1olnM5zkeO/ekOq1kcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781169365; c=relaxed/simple;
	bh=N8Jbk6/tj90Ici8QsaVaffj17YRtmS90xotcF4Ftoto=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=nrjXEhsmnx667URm7N2MB8rfluTMD2Z21TGqONp3gwE5rCTpPyn+n1sxwtJaf+LkldEDkXJetd1/+q7ZBYAK+SAPr+k1yn1YZT+C48TpseloaQ5HnIRsn7mtmfgm6iGXor5iEzlQFFK/EfMcUgFkEXy5lADfWeITdfPafowUExU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=bnhdh+0B; arc=none smtp.client-ip=213.167.242.64
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 79C44673;
	Thu, 11 Jun 2026 11:15:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1781169332;
	bh=N8Jbk6/tj90Ici8QsaVaffj17YRtmS90xotcF4Ftoto=;
	h=From:Date:Subject:To:Cc:From;
	b=bnhdh+0Bf8qZ9+1O8zp0xQU3b0ToSBq/6IhoA11m/H4Yob6mPC88X0tETqlZ6mFb4
	 mAXDpsLxzymxUOes+JV9F/wb/l710NJuqnQsf49nLgKE43+hJW1mxC3DqGVbKiEu/m
	 8UKXI3wCJgji7ZZ8OnDlBRlg7J6SLhJtXUPvFKVs=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Thu, 11 Jun 2026 12:15:44 +0300
Subject: [PATCH] media: raspberrypi: cfe: Enable video capture on CSI2_CH1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260611-cfe-ch1-video-v1-1-f819577a0333@ideasonboard.com>
X-B4-Tracking: v=1; b=H4sIAL98KmoC/yXMQQ5AMBBA0avIrE3SkajEVcRCa8pYtNIiEnF3x
 fIt/r8gcRRO0BYXRD4kSfAZVBZg58FPjDJmQ6UqrTQRWsdoZ8JDRg6oiLQzDdVkBsjNGtnJ+f2
 6/nfazcJ2eydw3w+edllLcQAAAA==
X-Change-ID: 20260611-cfe-ch1-video-0116fb7151ba
To: Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Naushir Patuck <naush@raspberrypi.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 linux-media@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1549;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=N8Jbk6/tj90Ici8QsaVaffj17YRtmS90xotcF4Ftoto=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBqKnzQdfPCINNerBjlFNMkb7EMAT4yRPjJpIWG8
 IXKf4ule9OJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCaip80AAKCRD6PaqMvJYe
 9Zz4D/9dpLnhZYGs78vTttR2yQSUPmCJCDNVR36oKxjLFvy6Q4C0vfvdVs8w4zS3m696+qC9so+
 /r5bmBRKvd7WesjAv7dvw5oRpfwnFv5SeANCz5fQHEQKSsxYeUWp4g652SO4KkxfrWD0OPy6Wfb
 OFDh+OqiUHe5VLq5mdPKz9yBiWUOCmFn5sqCSnNTDGa30kb9p/0zd8+orU3ZOejMIpB5P3QiBMh
 VMrPIdvLNzARDRrNKsPISuFAmppMChhEsUYf+6//mHX+sF/NaeqnQBNrfstOod76oNiCPyK28fx
 63jwd7NYN36FdsApDmwe/PusGYMQwpSZxPc+QYWsK+eA0jz/z13vKbDb5vcgiprDhkkGtEkQFi8
 DC/zCNL7fV1ncV4Og+79YrA4Cf7N8ILIkRWy87toY5Ky/V6Z82kHJqRwC1eAjTKa/ae2+Xu9oGv
 bCoPv6437fGxjjxKJGbwjhJmZ2OVAQJINgrDeMmxA6Qxql14ZJXRvRGRNCKz6aa0j7sMBKa9xFJ
 tEvVRct9xAb1a4oBJF1cj5avSatHe2oafZSrASp3B4FPMQnBie7A97G/qI7q+3o67owXZfh2NGd
 xhi2idQq3T+h6jcHLaW1Qxdbg6G7mbJEqgsw1lngpc1ZKbE7nQb+ezdINRrJliGkRdVl8+Ke/Rd
 IeVFFi76UMSYqvw==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:kernel-list@raspberrypi.com,m:mchehab@kernel.org,m:florian.fainelli@broadcom.com,m:bcm-kernel-feedback-list@broadcom.com,m:dave.stevenson@raspberrypi.com,m:naush@raspberrypi.com,m:sakari.ailus@linux.intel.com,m:linux-media@vger.kernel.org,m:linux-rpi-kernel@lists.infradead.org,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:tomi.valkeinen@ideasonboard.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[tomi.valkeinen@ideasonboard.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-64563-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tomi.valkeinen@ideasonboard.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ideasonboard.com:dkim,ideasonboard.com:email,ideasonboard.com:mid,ideasonboard.com:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 76075670594

The upstreamed CFE driver did not enable video capture on the second
DMA channel, only metadata capture, to imitate the downstream
Raspberry Pi kernel.

Let's drop this limitation and also support video streams.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/media/platform/raspberrypi/rp1-cfe/cfe.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/media/platform/raspberrypi/rp1-cfe/cfe.c b/drivers/media/platform/raspberrypi/rp1-cfe/cfe.c
index 8375ed3e97b9..40eef608504d 100644
--- a/drivers/media/platform/raspberrypi/rp1-cfe/cfe.c
+++ b/drivers/media/platform/raspberrypi/rp1-cfe/cfe.c
@@ -130,15 +130,9 @@ static const struct node_description node_desc[NUM_NODES] = {
 		.pad_flags = MEDIA_PAD_FL_SINK | MEDIA_PAD_FL_MUST_CONNECT,
 		.link_pad = CSI2_PAD_FIRST_SOURCE + 0
 	},
-	/*
-	 * At the moment the main userspace component (libcamera) doesn't
-	 * support metadata with video nodes that support both video and
-	 * metadata. So for the time being this node is set to only support
-	 * V4L2_CAP_META_CAPTURE.
-	 */
 	[CSI2_CH1] = {
 		.name = "csi2-ch1",
-		.caps = V4L2_CAP_META_CAPTURE,
+		.caps = V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_META_CAPTURE,
 		.pad_flags = MEDIA_PAD_FL_SINK | MEDIA_PAD_FL_MUST_CONNECT,
 		.link_pad = CSI2_PAD_FIRST_SOURCE + 1
 	},

---
base-commit: 06cb687a5132fcffe624c0070576ab852ac6b568
change-id: 20260611-cfe-ch1-video-0116fb7151ba

Best regards,
--  
Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>


