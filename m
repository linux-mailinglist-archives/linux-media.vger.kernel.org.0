Return-Path: <linux-media+bounces-58827-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +LN9GWK232lVYQAAu9opvQ
	(envelope-from <linux-media+bounces-58827-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 15 Apr 2026 18:01:38 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id C75934062DA
	for <lists+linux-media@lfdr.de>; Wed, 15 Apr 2026 18:01:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 321943006914
	for <lists+linux-media@lfdr.de>; Wed, 15 Apr 2026 16:00:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 761CA3E3C7C;
	Wed, 15 Apr 2026 16:00:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="PHF2w1fk"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7040D3D9DBC
	for <linux-media@vger.kernel.org>; Wed, 15 Apr 2026 16:00:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776268803; cv=none; b=i2WvC0WC1AAxqZUNJYDinxkZypaLeL1mgcKnWiPT22qEjBIDo4KK0FQIi0S4WP7FpBGEsyZ+4y2vrz/s+NuyGN+vZfXWVnnsbynfVo817b/pGS7jUiWPq6eT41OCY7D32Pa01HW+SHipHolFo377AMkOqGxil2j/D33UtPNstg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776268803; c=relaxed/simple;
	bh=OV115X/Mc3URqWvOJobZyHG4pTxhzpWvRB+kFTac0GY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=VWpwlTQcFYY57zDV1hojOmw4fKiB+WySBHHqh4IGYWjEYwQtCOuq7PLU+Jq+J859BrtXyi2gz/Kfpkh8seOIlCoUm6fz9ok2q63urad6QnW+gt4ZSJZN9W7ikPc85nxoKjLyOAcOQkEgX58Twid1rxF2TntEQqMh6GrLdeHICvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=PHF2w1fk; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-38dd9f0fdc6so67864091fa.0
        for <linux-media@vger.kernel.org>; Wed, 15 Apr 2026 09:00:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1776268800; x=1776873600; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UEt9CFiGl62fh/+qv/QUuoxaU/s1ZY1GmVxvHk2EVZ0=;
        b=PHF2w1fkc1QCJ4+Ku+6qWo97dXXeCDpy4Tn62fGogrU8SEkqRFgzELcnSQ2QVsRhtb
         5s3M76uUS9LoSpXuU+zSeMVs7D/qyFd14KGEwF40OMfmeIBa/v+yg91B/Sypd7PVQd3q
         rthKA5xLdWIpQsteZMNncqh2rarDHavsbnT3A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776268800; x=1776873600;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UEt9CFiGl62fh/+qv/QUuoxaU/s1ZY1GmVxvHk2EVZ0=;
        b=P9xZf3JQI/6Tsm2BO5YzNHKoz4yniB9RO2y+c0LO9XihJx3N65OYspC2q88hlByPzP
         I6BSSX5vDEKyOKVSaacLWOfgnRpP/qInFoYy+JWSKlneGubQxxm8as8l5iPBq2KwrsfR
         OFHdD4usLuh6xb9+OadjzcrDig++K4IEMzQHGElU1CDZxL5PTYUjTkvLm923VLjUPtLb
         iNyVkc63pHL0ghgBXqecT704pIQ/E2TMDJGm6VPCjKCFd9WGKrHUCqaYvV4+gSCufS24
         yM4i1Al1Vc09Iqcntz+YhWkP5kjy/izDDfpfMlxoPno3OU8nvrFFDkHozk7pcqi9SgJq
         HSzw==
X-Gm-Message-State: AOJu0YwkJiEyX88p+J4sCmkWoh2ErrOg7r20nQdgTn8/usHLRNK3b3Ik
	04S0/Bzr2afWba99t1NW14nr50VvBuKMNXY03cCMtdmMm3iNcNsSsJlK72ApXA0f/xqlj+WGCqA
	V13A=
X-Gm-Gg: AeBDieuRWarZkw253YcwLFiu5uSbR638dg2jMYf2MzRNxdX3bmRAW44W1jkuliELWZc
	t8IIhc3fRoVHUhfXEFEsGxgNa3P82lJDubdJbzTrvu+gKCbKBlM+66vAdZMp9xnf/DY+4QCErMd
	dAPh1AiemOJWYoEjYf4vOhGcWkl7Z/EnryfnoFpFn4yO9ZIugynR8xqUIgXB3Tz8sutIUMY6B0U
	xBehLNNDKxQqfpVd6EmTAWk81B7nTSx/eyO/AKjzmKucjt5yC4+SU6plrTMehfAF+yXC6xmCoB9
	CDNljZ9XW/zsAEZugnITCB9iqeNYppfWMy6Q+hmQ6X/6j4WrtvktIBMi1+YhjCLlU6dEgQHVHy7
	4monYQ+xwAWQEN7hJRTniISfX5G61jdCmFz85vSh6u5q954t05lu3QaZNRUrGwk33yx+vn47lbM
	3nw+DyuZmz12XgSmKTyujAeq7Dy+I7FreOJO+yYkrveuoLXE2L6lj8pk9gtsOfWVA7/sHqW63nX
	zZloUs=
X-Received: by 2002:a2e:908a:0:b0:38e:94c6:b706 with SMTP id 38308e7fff4ca-38ea87a4e02mr264821fa.7.1776268800118;
        Wed, 15 Apr 2026 09:00:00 -0700 (PDT)
Received: from ribalda.c.googlers.com (52.163.228.35.bc.googleusercontent.com. [35.228.163.52])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38e9ea096desm4664531fa.18.2026.04.15.08.59.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 08:59:58 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH 0/2] media: uvcvideo: Avoid partial metadata buffers
Date: Wed, 15 Apr 2026 15:59:56 +0000
Message-Id: <20260415-uvc-meta-partial-v1-0-a0acc79a6300@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPy132kC/x3MQQqAIBBA0avErBswKYuuEi2GmmqgLLQkEO+et
 HyL/yN4dsIe+iKC4yBeTptRlQVMG9mVUeZs0EobVVcNPmHCg2/Ci9wttCM1rWk7Y2bFCnJ2OV7
 k/ZfDmNIHK4YhM2IAAAA=
X-Change-ID: 20260415-uvc-meta-partial-a5767866d0e0
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hansg@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.3
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[chromium.org,none];
	R_DKIM_ALLOW(-0.20)[chromium.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[chromium.org:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-58827-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ribalda@chromium.org,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,chromium.org:email,chromium.org:dkim,chromium.org:mid]
X-Rspamd-Queue-Id: C75934062DA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The current code can lead to partial metadata buffers when the metadata
queue transitions from empty to ready. Fix that.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
Ricardo Ribalda (2):
      media: uvcvideo: Do not open code uvc_queue_get_current_buffer
      media: uvcvideo: Avoid partial metadata buffers

 drivers/media/usb/uvc/uvc_video.c | 24 +++++++++++++++++-------
 1 file changed, 17 insertions(+), 7 deletions(-)
---
base-commit: 4fbeef21f5387234111b5d52924e77757626faa5
change-id: 20260415-uvc-meta-partial-a5767866d0e0

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>


