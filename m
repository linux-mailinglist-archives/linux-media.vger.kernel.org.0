Return-Path: <linux-media+bounces-60434-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 7vboOfD7+WkqFwMAu9opvQ
	(envelope-from <linux-media+bounces-60434-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 05 May 2026 16:17:20 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 388084CF3A6
	for <lists+linux-media@lfdr.de>; Tue, 05 May 2026 16:17:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3B985305B28B
	for <lists+linux-media@lfdr.de>; Tue,  5 May 2026 14:12:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 743A2480324;
	Tue,  5 May 2026 14:12:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="URKuDEgt"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D9813E51D7;
	Tue,  5 May 2026 14:12:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777990364; cv=none; b=lYNGyaQdW1KvZOZfdf+4wbCP2p3JuAmU6ILOeWuFgRvZXqgbnCxkOgGP7lWLMFHh3pg89rOVUxamNnnFx9dqoix0PlYyi63Z9CCk63lKPE9574cXYxzPpfBiJEBFPfzi22GIcNAt5tVAojW8EkMrz4erLukALNe6YON4byQms9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777990364; c=relaxed/simple;
	bh=tOoW7b4SR2J2gs5SlYUmZ19S/XBYFrWNq8eD/CkJvdk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=iN62qEt/m5ZIZ2wKX0lhsoE09VFue7cH0IacqSQtxQfAen9+d7RWMIQcgDvQy3zdP/btadt0NRzM4X/1/DerKrnzlZoLeITxFpthScIWIWE9/M7Ins1T1Pfc+a9ezaDdkLni+vmhIvL3Lp1wObrf6wqNc5Pgk9xr2PrGsFvlhOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=URKuDEgt; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.1.83] (unknown [IPv6:2001:b07:6462:5de2:520d:d7a3:63ca:99e8])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0E73EC71;
	Tue,  5 May 2026 16:12:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1777990354;
	bh=tOoW7b4SR2J2gs5SlYUmZ19S/XBYFrWNq8eD/CkJvdk=;
	h=From:Subject:Date:To:Cc:From;
	b=URKuDEgt1P0y18MTEMmQeKzxRKn9Q4N6lPGEtBNsem69XA9XZ7+Zsy+nlr5cswE83
	 Zy4As4PRMLjKgOfqIOzB7vdG68FKLH4KD8eoiJUcTefUQ56tcmRieIjvJwGKE/KQkf
	 dzttA+7DWoj3coPYoSz5MTHJZF+cOUe1qOqhZgPQ=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Subject: [PATCH 0/6] media: v4l2-isp: Add support for extensible statistics
Date: Tue, 05 May 2026 16:12:11 +0200
Message-Id: <20260505-extensible-stats-v1-0-e16f326b8dad@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALv6+WkC/x3MQQqAIBBG4avErBNUqkVXiRZpvzUQFo5EEN49a
 fkt3ntJkBhCY/NSws3CZ6wwbUN+X+IGxWs1WW0H3etO4cmIwu6AkrxkUcGug0Pw3nhQza6EwM+
 /nOZSPhW7xdFiAAAA
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
 linux-kernel@vger.kernel.org, Jacopo Mondi <jacopo.mondi@ideasonboard.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2147;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=tOoW7b4SR2J2gs5SlYUmZ19S/XBYFrWNq8eD/CkJvdk=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBp+frT3NcaWVAYRGy0L9E6H8Q2bC3xJbaGyv5s8
 GWExSouWs2JAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCafn60wAKCRByNAaPFqFW
 PH9/EACepwx6vQleymE7fKu6/CgnJrguhjOARZUgnLv9oLjLm86EuIkYui9rg1pyYm/m+m7DVAz
 I2s3XuVSANH5F0bOfC37QKMB8C4Sc7m36UFpbv7uugVlOxsYKog48ND64Jv1S9aZ3OwZz1BZ+5G
 Kntsy/y0ry1A8oCRe93CS4UjONOSoAZwm8BXqwb/0vwuhJiCG5I0N5x/JX1yFfx2C+ZYhSUt5ci
 HrOZ4Vz7jroDUJRqnIgVjrlFg0Mg4c24SuqCT/Yo8OxrG85BGL77OfiQGZd/bpMawTGfb2xmkJE
 gYTuudJMefrl5XQYhZdFnwRR2L4baqzlUq198pTizB0gbYa5elNE9r0b68DB80+iwPrEg0rtKet
 EvJmnAEWC4HIdrMFM5CKq80FkyvfaVD74K1tCJ3dexQnXHrbXLlRMWSeuLLuSXIRM70lCbUru3P
 XI7rSkCVV5CGm2+EOkZdvEiQ1WZ/KAgsykpRzwth052sXmuYQLvays9EVxfY9EJsD8vtLxaulPs
 2HKkgzczF7mR5vusei7jvpGZDeK/AhoASVF8YK0QyYpxe5pStOZBiKyZvYDYFhCo8s6XxMnqVRr
 y04GHFg3AB5THkK8SkxZ+m+aAEgiagUghwBhKxPkf08OJA3k7SSDoaFhWxe+2Ry6nXvKJrlPxgz
 pQnCDMQbwHwxN/Q==
X-Developer-Key: i=jacopo.mondi@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B
X-Rspamd-Queue-Id: 388084CF3A6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-60434-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jacopo.mondi@ideasonboard.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gitlab.freedesktop.org:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ideasonboard.com:email,ideasonboard.com:dkim,ideasonboard.com:mid]

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

Antonie: I took the liberty to fold in your patches changes to address
my comments on your v1. I pushed an un-squased version of the patches
here:
https://gitlab.freedesktop.org/linux-media/users/jmondi/-/tree/b4/extensible-stats-unsquashed
so you can easily get the diff from this and your version. Please feel
free to comment on these as you're the original author.

Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
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
 drivers/media/v4l2-core/v4l2-isp.c                 |  56 +++++++++
 include/media/v4l2-isp.h                           |  94 +++++++++++++---
 include/uapi/linux/media/v4l2-isp.h                | 125 +++++++++++++--------
 6 files changed, 294 insertions(+), 80 deletions(-)
---
base-commit: d9c8c4adf23d17549c0ec9c85b99d85a0ee6cf18
change-id: 20260504-extensible-stats-f2d6befcc1ce

Best regards,
-- 
Jacopo Mondi <jacopo.mondi@ideasonboard.com>


