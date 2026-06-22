Return-Path: <linux-media+bounces-65387-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id gCNCFwVyOWpgtAcAu9opvQ
	(envelope-from <linux-media+bounces-65387-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 22 Jun 2026 19:33:57 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A9CA86B17DC
	for <lists+linux-media@lfdr.de>; Mon, 22 Jun 2026 19:33:56 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=YcYgbN3D;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65387-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65387-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 38D1A3024958
	for <lists+linux-media@lfdr.de>; Mon, 22 Jun 2026 17:33:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E8C034028B;
	Mon, 22 Jun 2026 17:33:51 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6788279DAF
	for <linux-media@vger.kernel.org>; Mon, 22 Jun 2026 17:33:49 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782149631; cv=none; b=NJEAr8geL8cQzBEQnDq2KXweW6ay/N84iX5ZQYOH1pW1OHhLW7wEjdrF/M63+GAYviG4ikByixIYcUx7cyUqhE+kH1GU1NTh/LelO9k1UMw5B+M6w8dggVpTD55cMfmsLXM6jaryQl9NFBiE+I4sizC/6rA4BKhX44+4Ni4SM0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782149631; c=relaxed/simple;
	bh=vIqwXAqU1HsYBJlcwii1d7KCHucu+av7KUnX+u4usSw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=R0JuokB9HPzMdATDYe3JEcGCqvc9xyZF1BhoPpOrVVVNbMd1n3vwvaLiX4jlG+O155IC+lXOi5cQ6pitzoF8PqKBdT5ZeGelzfomaNmpkcpY7p3eCQmVLFyeWpQYcq2woIryMBn+Pwk6ixeDWMRVIkP6Dy5OZ20sXT4kutRifGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YcYgbN3D; arc=none smtp.client-ip=209.85.210.175
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-84232e83ca9so1958937b3a.2
        for <linux-media@vger.kernel.org>; Mon, 22 Jun 2026 10:33:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782149629; x=1782754429; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ba6sP+0COuG6/GPgP0Uhk+kq1740BlSFeDZq6i6dVkc=;
        b=YcYgbN3DO6iZZTYAghyNPlWtMs4tqx/iuDCEEkKQ0JvdxVtOI1NYR1cAR3WTOUI5aZ
         eDAoeyPlzH/tJv3cjySPQOgHa4c0YjslFZ8wQHi6wMtkYOQTIodL4BXYHp4ofnEfniLS
         MsvmUbkYaj3xrYqMsg+spBDv+WbW7sqnJZmb5cwZ+WvxMMIr3PwBAPu1QwEfHuuX8B7j
         qSH18qQtJXx66oO4EUGZDD9m9wd8MHIkMq7wBEdokjPkWQsA0yZ0Qz41AEqLrZFnCdgX
         9s8lmeEXYbU1FBnID8qtcd/8TL41EHPbMGZxPl1dPq2j2Rr5p1l2iyfs9MoEJ6gFzP7U
         xnDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782149629; x=1782754429;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ba6sP+0COuG6/GPgP0Uhk+kq1740BlSFeDZq6i6dVkc=;
        b=XJmZtQQ1Ya4AWRGVjR4A+vikr3JrVN+eiYC/hk0XqIeu2CefTELkft5JspwYkLwwVY
         LS/OPfvpVCM0+Pmh3wcjbxVFAtO1MwWdP1zcJiIjwRjhpKDY8sV6e5hBV8kEsmvzm85q
         JvzynJlMcoGu8v9CyjHkAHlkUfJXhehZ9uzEmiDZIFQ/Qbz9ZzB9FceG+NjlNrPWrcJV
         uuM957lqhmIAYs+jAEQPBjf6v0+ZnGS9lbmJOtD3H8+uSsQzUY0+c/AbAFiweTT8u//o
         /p1jy/qkxom26YY7CMoyInrbGAxRlHyIkrO4Rge9aqtXZxv7rSdiPSdIPjWV9ZgQoJiV
         E5Nw==
X-Gm-Message-State: AOJu0Yye6dRahrtb/xH+m3NasaTM5aJGv42RhFVLXDsqA/pm7rf68nJs
	+EabP8GbiLB66DVrlU7s/IlZv6NAftbB4tIe3WTNhkQvFeqWyeFbCDYR3elU+Rkq
X-Gm-Gg: AfdE7cmxirtw42cLhvafj3v7qmrb1Bs4CY6aH3fSb8U9Y1AkAH+vueeh/jhvEgiz9kJ
	ei/6AtoFILmm/E1trQb6skVBBN4mxfagAIJrJctChQDQ4aZdHdOfmL4J0Jvq2foudbmeea2T4vN
	dXrNm0hxIjWmcmSeG426/hYwGT3t4KMnCjStB6WsI/+v7rglqY9aA21Gs/V7CtQ/Ebcn9yWtpeX
	DbDUjTygmh5f5qfiN0nllqvUVo9kD8jGEyf6eMiOw+nEeCCwel5iSB8jC7s+bynjpdpgaZlBhMR
	zQ1d/0XVIGpIcQiMNyj88PqYvDPzy9/ikG5xsn+o2YyzuWSA0sFTB9NcqKoBn4QrYgJtJjqXRbz
	FjmgyVDSjcKkkQLXohuVWtZq0Syab6yiiMOiqzBSTsignyBL1OwiYT3SQfZJCmTjOrZK6JGipfK
	UIxOLUVJM7uQ4WBX0zPoEeL34p98yaPLX9wjmAxAiALw==
X-Received: by 2002:a05:6a00:3499:b0:845:32c8:e77d with SMTP id d2e1a72fcca58-8455615862cmr15752950b3a.34.1782149629087;
        Mon, 22 Jun 2026 10:33:49 -0700 (PDT)
Received: from localhost.localdomain ([49.207.234.96])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84564ebd123sm7670753b3a.47.2026.06.22.10.33.46
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 22 Jun 2026 10:33:48 -0700 (PDT)
From: Biren Pandya <birenpandya@gmail.com>
To: linux-media@vger.kernel.org
Cc: jacopo.mondi@ideasonboard.com,
	laurent.pinchart@ideasonboard.com,
	kieran.bingham+renesas@ideasonboard.com,
	mchehab@kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Biren Pandya <birenpandya@gmail.com>
Subject: [PATCH v3 0/4] media: renesas: Fix missing media_entity_cleanup()
Date: Mon, 22 Jun 2026 23:03:35 +0530
Message-ID: <20260622173334.60491-6-birenpandya@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[ideasonboard.com,kernel.org,vger.kernel.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-65387-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[birenpandya@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:linux-media@vger.kernel.org,m:jacopo.mondi@ideasonboard.com,m:laurent.pinchart@ideasonboard.com,m:kieran.bingham+renesas@ideasonboard.com,m:mchehab@kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:birenpandya@gmail.com,m:kieran.bingham@ideasonboard.com,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[birenpandya@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,renesas];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A9CA86B17DC

*** BLURB HERE ***

Biren Pandya (4):
  media: renesas: rcar-csi2: Add missing media_entity_cleanup()
  media: renesas: csisp: Add missing media_entity_cleanup()
  media: renesas: rcar-core: Add missing media_entity_cleanup()
  media: renesas: rzg2l-core: Add missing media_entity_cleanup()

 drivers/media/platform/renesas/rcar-csi2.c            | 2 ++
 drivers/media/platform/renesas/rcar-isp/csisp.c       | 5 ++++-
 drivers/media/platform/renesas/rcar-vin/rcar-core.c   | 5 ++++-
 drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c | 1 +
 4 files changed, 11 insertions(+), 2 deletions(-)

-- 
2.50.1 (Apple Git-155)


