Return-Path: <linux-media+bounces-65799-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ++zOE2LTP2qUYgkAu9opvQ
	(envelope-from <linux-media+bounces-65799-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 27 Jun 2026 15:42:58 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FC4E6D2061
	for <lists+linux-media@lfdr.de>; Sat, 27 Jun 2026 15:42:57 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ideasonboard.com header.s=mail header.b=SainGk8t;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65799-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65799-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=ideasonboard.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 98BD7302352C
	for <lists+linux-media@lfdr.de>; Sat, 27 Jun 2026 13:42:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 487E93AEF27;
	Sat, 27 Jun 2026 13:42:28 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30D29358372;
	Sat, 27 Jun 2026 13:42:24 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782567747; cv=none; b=nrhche8G2PZlrZEBLBV1lhwxJIObpLOUJOB7Odg8YbfMAijntkvr6LDbq6TJWqnuepHdiboBANjxMNjcaqbIv2X/st3P84iWqW6ySuyRcI+qYoDIRZ8X0pmdRQYSf/zJ+YwOudgSr47/oy70s5+rJ/k/nXu7WgSU2Cm1oUKBKs4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782567747; c=relaxed/simple;
	bh=MrH+V7P7x8kaihzRdHvzm6mc/mblQsGdluqxNIeqc/I=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Dg0C35bc8vb6JxinJCGIxLKd78ADwx0FhigLhe5teHpvQJmZ8hMd7DqWRxjqrUEoqxaE3gLo9uOt45W5YTrXCCZD6UcOZmUsmifAaKshoLS9x7+vYVvvFshOolwNv8VuI/hQTotmeqZrM6BxzI0PFvDhUbpJrI4oU/8Zr3lBY7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=SainGk8t; arc=none smtp.client-ip=213.167.242.64
Received: from [192.168.1.106] (mob-5-90-49-163.net.vodafone.it [5.90.49.163])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id D7D50296;
	Sat, 27 Jun 2026 15:41:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1782567700;
	bh=MrH+V7P7x8kaihzRdHvzm6mc/mblQsGdluqxNIeqc/I=;
	h=From:Subject:Date:To:Cc:From;
	b=SainGk8tE6T3+9Ae4BgthCewsDlmgv0DjkPUWhyRJbC7cVMafkINAwQBVVKNpg40c
	 rxDspytpNAawBZdwl6WGonbg43VbqjLFLM7p1d7qqN05u9eFbUcKvswikFZUOAefrl
	 UnbIiBR9GHRbInSUnfqAu0Y488mAvh7dE1ZKuLno=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Subject: [PATCH v3 0/6] media: v4l2-isp: Add support for extensible
 statistics
Date: Sat, 27 Jun 2026 15:41:57 +0200
Message-Id: <20260627-extensible-stats-v3-0-3b600bb2db8b@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACbTP2oC/23NTQrCMBCG4auUrI0k0zYWV95DXORnYgOaSBJCp
 fTupgVxYZfvB/PMTBJGh4mcm5lELC654Gu0h4boUfo7UmdqE2AgWM86ilNGn5x6IE1Z5kQtGKH
 Qas01knr2imjdtJHXW+3RpRzie/tQ+Lp+sf4fK5wyilzYFoQajDQXZ1Cm4FWQ0Rx1eJLVLPBzB
 IgdB6rTcWtMr+0JBrXjLMvyARPbifn/AAAA
X-Change-ID: 20260504-extensible-stats-f2d6befcc1ce
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2416;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=MrH+V7P7x8kaihzRdHvzm6mc/mblQsGdluqxNIeqc/I=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBqP9M6jz1rI2sy6eaulbn2OcNdb7SNrTpMhlfQQ
 6sV1MQIBS2JAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCaj/TOgAKCRByNAaPFqFW
 POBiEACghV3T3tDkG2/7vhDyVwr+5Qhhc4PDqL2sbN/T6DVwpde5MGCQXurut4qrzajrcZJl1eM
 JsbvgEiUi0MM52SFh2YWafoDXtEt49Bk2X+4+DaVjAAcNGQX6LWr2dQasRcqsXQ9jLIuvpBESeI
 0p7m+nlFBVZIphfZc1KlmIgHhpG3eJbXZWsugDBwilclCeRdaHUkRfujk0S8NZP21WS78J6bXGx
 GP/X9k4RlaLdzvF1fOItTzRBiWuBTsVIiXM5jcY3Voy/6meUVcTOniiZrDfBzKx0cszFA2MoUyI
 pO7zJf1meezxmusq95brmwkHLtg5huA4NVOz0rFgJ3hwyzEQ/9LsLVaPxlK2ZHjxNK6++Yx2pEy
 PR/xmZNovcxoisd9d86GQJR2+WYkEospMJuE5NI8HX7nYzZv26b6IVCMl6zg6PRggvbirAR7Ff6
 9sZZpqt5btAAxOVGnBYWtTVuXg14eGkScdwSNWZFe8pJ/tFhlKThg/g6toUkB0ghfmUS0As/K58
 96mGqTwy7+QtF1qiQVcYlp5STdu/NosZnBmFhtbTXtGC8oHLWWAXyR7yCLwN4G8yikTC5cxR1ot
 pqmDvl80QO+diEDW5zSQom/+GMJC02Gb+fVI5dRMQba3E15gYit2G6c6w2sXqKK8OjSUZJwdWL/
 z4eyGoHx6cuScVw==
X-Developer-Key: i=jacopo.mondi@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-65799-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[jacopo.mondi@ideasonboard.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_RECIPIENTS(0.00)[m:mchehab@kernel.org,m:dan.scally@ideasonboard.com,m:keke.li@amlogic.com,m:antoine.bouyer@nxp.com,m:jai.luthra@ideasonboard.com,m:niklas.soderlund@ragnatech.se,m:ribalda@chromium.org,m:laurent.pinchart@ideasonboard.com,m:sakari.ailus@linux.intel.com,m:hverkuil+cisco@kernel.org,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:jacopo.mondi@ideasonboard.com,m:niklas.soderlund+renesas@ragnatech.se,m:hverkuil@kernel.org,s:lists@lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,linuxtv.org:url,ideasonboard.com:dkim,ideasonboard.com:email,ideasonboard.com:mid,ideasonboard.com:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9FC4E6D2061

This series breaks out from Antonie's
https://patchwork.linuxtv.org/project/linux-media/list/?series=24043
the extensible stats support and adds a few more patches on top to:

- add support for per-block validation as suggested during the review of
  Ricardo's
  https://patchwork.linuxtv.org/project/linux-media/patch/20260504-smatch-7-1-v3-6-fda125c30058@chromium.org/

- add two helper functions to v4l2-isp to ease handling of extensible
  statistics for drivers. An early user, based on a preliminary version
  of the patches is available here as a reference:
  https://patchwork.linuxtv.org/project/linux-media/list/?series=24703

After testing v2 on real hw, I realized I had a wrong check for the
validation callback, which is now fixed in v3.

   -          if (type_info->block_validate &&
   -              type_info->block_validate(dev, block))
   +          if (info->block_validate && info->block_validate(dev, block))

and validation is now actually performed :)

Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
Changes in v3:
- Fix block validation callback
- Link to v2: https://lore.kernel.org/r/20260626-extensible-stats-v2-0-41fdd5cf728b@ideasonboard.com

Changes in v2:
- Collect tags
- Link to v1: https://lore.kernel.org/r/20260505-extensible-stats-v1-0-e16f326b8dad@ideasonboard.com

---
Antoine Bouyer (2):
      media: uapi: v4l2-isp: Add extensible statistics
      media: Documentation: uapi: Update V4L2 ISP for extensible stats

Jacopo Mondi (4):
      media: v4l2-isp: Rename v4l2_isp_params_buffer_size
      media: v4l2-isp: Add per-block validation callback
      media: amlogic-c3: Implement per-block validation
      media: v4l2-isp: Add helpers for stats buffer

 Documentation/userspace-api/media/v4l/v4l2-isp.rst |  45 ++++++--
 .../media/platform/amlogic/c3/isp/c3-isp-params.c  |  42 ++++++-
 .../media/platform/arm/mali-c55/mali-c55-params.c  |  12 +-
 drivers/media/v4l2-core/v4l2-isp.c                 |  55 +++++++++
 include/media/v4l2-isp.h                           |  94 +++++++++++++---
 include/uapi/linux/media/v4l2-isp.h                | 125 +++++++++++++--------
 6 files changed, 293 insertions(+), 80 deletions(-)
---
base-commit: 06cb687a5132fcffe624c0070576ab852ac6b568
change-id: 20260504-extensible-stats-f2d6befcc1ce

Best regards,
-- 
Jacopo Mondi <jacopo.mondi@ideasonboard.com>


