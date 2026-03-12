Return-Path: <linux-media+bounces-55491-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8H/BMsSvsmlGOwAAu9opvQ
	(envelope-from <linux-media+bounces-55491-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 12 Mar 2026 13:21:24 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B58E2719C7
	for <lists+linux-media@lfdr.de>; Thu, 12 Mar 2026 13:21:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D2AD331D06C1
	for <lists+linux-media@lfdr.de>; Thu, 12 Mar 2026 12:16:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DA832C0299;
	Thu, 12 Mar 2026 12:16:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="n+vNjbQx"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 210AB16CD33;
	Thu, 12 Mar 2026 12:15:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773317764; cv=none; b=XDwn5vYFRYlD003yYr1+dqYQSltgwqWUdhoe8WuQ7xGOkpk77wXonXpkb4QOY39YgIm1ZGFYdSW/vP82uam4fbsoXHpDILiGOpW3Z7tycMNdoVmc37ybOXKGDbRcg9o/tcOfcgGEO7+wlC9rsGlvQWKJ/qkPtpZxOpQJXY87ga8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773317764; c=relaxed/simple;
	bh=KK4j7eTmpBM767DQxWNYW1TLph/iglawMOBMqWiY3jY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=p/7hMEmBbdTJuFL4e2H7IqmbUG80VkDTe8ZQK6Bsxk5xnRI3JLb+IcuArlmiAMGigK1iNCtMHWLA4BxQTHFefiy1KcgH/Mbr6EKr5yBOBbZ9ui9GtndcOFXrnG4jvGKBxex6RMNL4dvTaz14TTs/Eoim+Kbpv45SisCOLBw9+P8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=n+vNjbQx; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id E3EDC50A;
	Thu, 12 Mar 2026 13:14:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1773317689;
	bh=KK4j7eTmpBM767DQxWNYW1TLph/iglawMOBMqWiY3jY=;
	h=From:Subject:Date:To:Cc:From;
	b=n+vNjbQxKC5SLV+pPldm0HL4kSKmQAxhgCf0KMQcxvPLyIcCfsiTv95zuz4ya+K4C
	 NvdT0yz90omzzt2a5KJxCpeIecxxHq36DUvrfPrJObuVy70d8xVoG5qDMs2TJxtvVf
	 82+OuH6pNMYnAdFNIS7Uj6zTwsuikMT02bzVh9xU=
From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Subject: [PATCH 0/3] media: subdev: v4l2_subdev_get_frame_desc_passthrough
 improvements
Date: Thu, 12 Mar 2026 14:15:27 +0200
Message-Id: <20260312-frame-desc-passthrough-impro-v1-0-30f64d637a3a@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGCusmkC/x3MQQqEMAwAwK9IzhvQioJ+RfYQ22hz0JZkVwTx7
 xaPc5kLjFXYYKwuUD7EJO0FzacCH2lfGSUUg6tdX7eNw0VpYwxsHjOZ/aKm/xpRtqwJexq8n1s
 XBuqgFFl5kfPtp+99P/8hfRpuAAAA
X-Change-ID: 20260312-frame-desc-passthrough-impro-6a9ccb32d9a5
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jai Luthra <jai.luthra@ideasonboard.com>, 
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
X-Mailer: b4 0.15-dev-c25d1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1104;
 i=tomi.valkeinen+renesas@ideasonboard.com; h=from:subject:message-id;
 bh=KK4j7eTmpBM767DQxWNYW1TLph/iglawMOBMqWiY3jY=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBpsq5q3G/+n2l9eCaANTw+mbOcCZovM/JeqFVdw
 nOp9LT8YzeJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCabKuagAKCRD6PaqMvJYe
 9Ru6D/9ZtSYsl0uOZxrKjYAzG8qyHzNVL/cJdCpoBeCmTNyLb1oDusf0vTs2edG9unzVQ4IF4aa
 n8Bgaklo+VvHf/QjFrb23LBSr6Ir64HjNJL8R/krz4Fr6Oo7qLYewyEM9NTOUZKAkXvacQpl+YL
 obdm81k91+gGiLTeuGNHnxYsfwI3Ov7ShtR+Dw69CDr1KBUbEdaYx43OZS7J6+uOdIZyqXLgNbn
 sc89StH8o3NjdZaPqhhKgrs9cH6/N4wKrpEYA5tBiipaZJJgGkvhY2mEJFli4+MpFu8QsUnkWRc
 WFRjyq0uagV48DgP5PTiqi/sMAzUPfc3ifebQ6KzlKLEjhDPt5eQhuieFLz/+tDuXp1NwV9a+ok
 ZvYlLVH27ODXR8YPVup/W6Hx0RjmvDH3tgLB413xZSWUWPdeS6CuBGBp61Vd8PFn7PWm0NNldHt
 GIiJXneI6sy0PcaTHpP6AjmmO4u3KgsIW8wtxsdLF8qzyuBFnztQNNI/U2gWOBrBCEo0aFDfSWw
 E91hW2S1rEfvQHSTyfs+PVkYyWL7c5L5LzCG7S0CytBHl4u3fpTNtcdG1fWHFq4cvTg7a7/pX5a
 tsPb+WLt7t6yP0p1pZJMCnXPEuUp+3G0kIze0HIGUPU02UVyhfKjQHapkhah7noX/PpnF8Uwjza
 bXLPvFlXgQcSVmA==
X-Developer-Key: i=tomi.valkeinen+renesas@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-55491-lists,linux-media=lfdr.de,renesas];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tomi.valkeinen@ideasonboard.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,renesas];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ideasonboard.com:dkim,ideasonboard.com:email,ideasonboard.com:mid]
X-Rspamd-Queue-Id: 3B58E2719C7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Improve v4l2_subdev_get_frame_desc_passthrough() kernel doc, minor
cleanups, and a "locked" version.

The last patch can be left for later, if there's anything controversial
there, as my need for it (UB953 TPG) depends on internal pads which are
not in upstream.

Note: This is based on Sakari's 'for-7.1-1.1-signed' pull request.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
---
Tomi Valkeinen (3):
      media: subdev: Improve v4l2_subdev_get_frame_desc_passthrough() kdoc
      media: subdev: Minor v4l2_subdev_get_frame_desc_passthrough() cleanups
      media: subdev: Split v4l2_subdev_get_frame_desc_passthrough() into locked and unlocked

 drivers/media/v4l2-core/v4l2-subdev.c | 56 +++++++++++++++++++----------------
 include/media/v4l2-subdev.h           | 50 ++++++++++++++++++++++++++-----
 2 files changed, 72 insertions(+), 34 deletions(-)
---
base-commit: 621887bc7b9a6c37a5ed3b1f24dd446e3034253e
change-id: 20260312-frame-desc-passthrough-impro-6a9ccb32d9a5

Best regards,
-- 
Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>


