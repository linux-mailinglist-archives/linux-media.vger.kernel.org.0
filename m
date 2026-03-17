Return-Path: <linux-media+bounces-56053-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AP0OCEFGuWmK+QEAu9opvQ
	(envelope-from <linux-media+bounces-56053-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 13:17:05 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id ADAC92A9AF0
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 13:17:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7A39330DFCFB
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 12:10:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9BE33BA253;
	Tue, 17 Mar 2026 12:09:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="peB8TZIU"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 972553B8BD0;
	Tue, 17 Mar 2026 12:09:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773749398; cv=none; b=VNHoFglAh6NGsYezfH1WfH4CY1OT979BuSJvhWXi31E1ZqtN5UZeHd/Y3GiYH/qaF1mwMG+j2psd1rfAEe2XFk7Ux34qlScqeTKaHXnY4PmFPYZuACNjJ3MD7GFOMj4H/xls0LxFX/urWK6q7pvF4aqsGQGTKVYkJ0QhEPnnN5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773749398; c=relaxed/simple;
	bh=fqroT/MRvkDR648N9ZkwaOSjeMvizj7kbUe/Ud2FRPY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=CSyjLBoPQou04XPqEacd5OcIaXEZtmnLkNlltgFB6xAg4n6nYjnEzalrJYCx7j0SMP7SaTOU6wSo7tA9WHRt95p83UrrR+7ndsnWyC4f+K/3iLBTDJeowkG31Yjr1HCMfqUaT2vIMA2mr4P3yhAiJidWKCyUWF69ZxsCiQHwkBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=peB8TZIU; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5E2088CC;
	Tue, 17 Mar 2026 13:08:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1773749322;
	bh=fqroT/MRvkDR648N9ZkwaOSjeMvizj7kbUe/Ud2FRPY=;
	h=From:Subject:Date:To:Cc:From;
	b=peB8TZIUerpEScDjkgeljR2z97tN6Yn0oLzKyPQR4ZVBvHy/jyuSLBn5gJq31AliY
	 sxU44Va++AxuPHBJcw1jE0BU7qfIB7JASzgT05VcwlEsWnwZl8oa07mreCfyDCu5+b
	 EYln5MmOOE3zYlI0CbKvqLqUI3Sgk5YOE1wOSO1w=
From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Subject: [PATCH v2 0/3] media: subdev:
 v4l2_subdev_get_frame_desc_passthrough improvements
Date: Tue, 17 Mar 2026 14:09:39 +0200
Message-Id: <20260317-frame-desc-passthrough-impro-v2-0-0c93b437d85d@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAINEuWkC/43NQQ6CMBCF4auQrh1TWq3BlfcwLIZ2oF1AyQwSD
 eHuVk7g8nuL/21KiBOJulebYlqTpDwVmFOlfMRpIEihWBltnLa1gZ5xJAgkHmYUWSLn1xAhjTN
 ncNh431kTGryqkpiZ+vQ+8s+2OCZZMn+Ot7X+rX+G1xo0WN27S3D2hhYfKRBKnrqMHM4+j6rd9
 /0Lxg+b+s8AAAA=
X-Change-ID: 20260312-frame-desc-passthrough-impro-6a9ccb32d9a5
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jai Luthra <jai.luthra@ideasonboard.com>, 
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
X-Mailer: b4 0.15-dev-c25d1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1342;
 i=tomi.valkeinen+renesas@ideasonboard.com; h=from:subject:message-id;
 bh=fqroT/MRvkDR648N9ZkwaOSjeMvizj7kbUe/Ud2FRPY=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBpuUSNxGw9R8ENAFp6HjA+e95tlquT+qWGc938y
 ae30RQJO3SJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCablEjQAKCRD6PaqMvJYe
 9QrRD/0deco3KLVJw/tsNAvfwFbMMJjm2EygbY0cE0xE9/QDqYhxdqX4x3hI2rDc/UQDAPMSeeJ
 zet58cRw9NIiblP4rxRYgXAlNfwbWJT3clImiGAG/M8hys9TUA5m1kZhw3/WU3aaILPYFCKqZ5L
 dH4wpQ1qKxtvMfMmlGjLF+2jPGgBGNMQCHkZYj3BVmTKOzlpI4fA1mSjh7fVFrejRJ+xj0NzaAZ
 hn3sHlRaVznB+bHoUR3VicgnEa1PRhvuo6OV504aAu2ifZPBLZM1hm6UseH0xt8jP9XWTfhgqU1
 V6CTl4bRZyi92M6ZQ6WEbAC9LOMH8ZY0Ljg4eSczxndr8zXjrnSdXMxOcb7iM9W1j8nsKcQrlEa
 aNbjD1o41jsI7P/TIREjzIYAsng7vR0zVG+gz4wk8yScfS8+TDNY4Lp1AG0DY0iWg9pzeu7NMsH
 bSsA5uGRlMFn+qO5XKnqOlqZoccdlqceHnz2conB/pbqadZDZG4QEZYHU9iZPVuAD5HFjp8wTxn
 WDzf5IRjVQylKtrApGiNcEErSrSCX44oGFfmV4FmQe7N2te4BSEgGbnjkztj7jl7Ls/PZPRiqyf
 7ezpsONOeD3rihnuCaFn8LZTpBzIKOiYLmuNHj+ENkxVDALpHxWkHTrehvC9yqJPXBivZ2A1uC9
 hjZQSxRb71AiHPw==
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
	TAGGED_FROM(0.00)[bounces-56053-lists,linux-media=lfdr.de,renesas];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[ideasonboard.com:dkim,ideasonboard.com:email,ideasonboard.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: ADAC92A9AF0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Improve v4l2_subdev_get_frame_desc_passthrough() kernel doc, minor
cleanups, and add locked and unlocked versions.

The last patch can be left for later, if there's anything controversial
there, as my need for it (UB953 TPG) depends on internal pads which are
not in upstream.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
---
Changes in v2:
- Add lockdep assert
- Rename the v4l2_subdev_get_frame_desc_passthrough_locked() to
  __v4l2_subdev_get_frame_desc_passthrough()
- Rebase on linux-media
- Link to v1: https://lore.kernel.org/r/20260312-frame-desc-passthrough-impro-v1-0-30f64d637a3a@ideasonboard.com

---
Tomi Valkeinen (3):
      media: subdev: Improve v4l2_subdev_get_frame_desc_passthrough() kdoc
      media: subdev: Minor v4l2_subdev_get_frame_desc_passthrough() cleanups
      media: subdev: Split v4l2_subdev_get_frame_desc_passthrough() into locked and unlocked

 drivers/media/v4l2-core/v4l2-subdev.c | 58 +++++++++++++++++++----------------
 include/media/v4l2-subdev.h           | 50 +++++++++++++++++++++++++-----
 2 files changed, 74 insertions(+), 34 deletions(-)
---
base-commit: f6390408a846aacc2171c17d88b062e202d84e86
change-id: 20260312-frame-desc-passthrough-impro-6a9ccb32d9a5

Best regards,
-- 
Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>


