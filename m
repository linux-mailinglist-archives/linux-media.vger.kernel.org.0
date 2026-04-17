Return-Path: <linux-media+bounces-58954-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2LsBC3PD4WmjxwAAu9opvQ
	(envelope-from <linux-media+bounces-58954-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 17 Apr 2026 07:21:55 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 975224170D8
	for <lists+linux-media@lfdr.de>; Fri, 17 Apr 2026 07:21:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 78E00306EFE6
	for <lists+linux-media@lfdr.de>; Fri, 17 Apr 2026 05:19:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6AA5631B830;
	Fri, 17 Apr 2026 05:19:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ZR4yCFh+"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EF631FBEA6
	for <linux-media@vger.kernel.org>; Fri, 17 Apr 2026 05:19:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776403176; cv=none; b=ptLzgq1ntoBPDtXpoP+j5Tsq0k9sxwy9XkbYnGL/JXOZev1qZ4WmbCdB9MiFsWyvuVEbqPrbJuQNdvT9X8E/emtVeDCbT71NPZgQFKs3SfLXkY1NyjTtpGekMUEttj46m/mB2ZVCW3uXeFcuq4qaTEjcfAX0i2UH8BBhEZhcziM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776403176; c=relaxed/simple;
	bh=A9ouftcOcWlIpBt749YpjCGUNMaoccIqQg7ZSreCOto=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=m2Qv4+y4TlUKMipAutO94ebTf8uOHK7tdWK+M6X/SoB1XMkzFKA3dhl7BM/LWKtne3qxmMizA8PfIdzmgkCo4M1XBEwjcavsVlMpHGfPBojQUW5ZshT5F8FEr5fmj0XlM3zVAgKh2EZJmSCtwA1MLW8IX9UJaY4Rz3Yjo5IzWNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ZR4yCFh+; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-38e800deae4so2345021fa.0
        for <linux-media@vger.kernel.org>; Thu, 16 Apr 2026 22:19:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1776403174; x=1777007974; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uM8pt8Lm69Z2u4ylLvmeZ86cZ2EUidpwN69FxiJirYQ=;
        b=ZR4yCFh+u2KeHE+4NXVKvYzxOXdc0UfADMb0wJvRJdR1XWTUh3rfdM3PbzNlso1W2V
         Sx3viNZ8TmH7D8J5FMergg8DKe+aVNylEiYqmNZkRNKKA64JUfd1S4JmHE6pG9nNddHg
         sDM6T991uo+Ncs+9B/sfsf59zaTwDbUK/R09A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776403174; x=1777007974;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uM8pt8Lm69Z2u4ylLvmeZ86cZ2EUidpwN69FxiJirYQ=;
        b=HQIh7gBl3eFiaXc9KSvU91UWn+OCTwG7qDyZ5i9POiHpiRchR0cwlpYfl0Ypv/vVAp
         MtS1cjzbTSO0EdNURtQkx6zhGssZgcn54fYmPZH1UYFH6zvK0JogQsaKBiygnfFW06GE
         XhyZQ0uOiMDuEKubmPJrJ9qLQg6CCHkGgQVboEgXFgP8dkQDziMZVo4ufuYtIO33ZxD+
         MnVPubFcE/fyCBOUVjdlvZSYEalrKbtYb3zWujZ69r9L+V0WPStn+6wg5QlICAzeuKko
         5ZuF+KGZTutMB/Aw7vNV+rJZVYURYKsHP5TLx9cZzYmM0TeLMs25Qc068oBIAQaQsEpA
         sgEw==
X-Gm-Message-State: AOJu0Yz/udBQC7GZo5CE8DytbULxDIXo2YJB4orjHXYeRl8kYEAIp6I1
	Ja4YDF0ETEKETsM8jOIyKHcrFJ0j+fsUwZOJdocT7xylx8IsHbvK8VDVpvdAoYgdcg==
X-Gm-Gg: AeBDieuiN8hQPEBZz6M/5nXcwiDTQNfZmQDyNoMb7givK6bSXmYQMHJH8MVTdAi9mVc
	cl4EpM8LFUFkt9asAUQqwqVnBMX0jUI2ddhpynd6dexqiE/++pixrJBUellKuF/FkupL+PVt0j2
	nCgFVE9nHBI9QefkifJ9h+MRwJ/wa90aq3/LSa0tVU/n0i+ivl4EN241crrVqiuJbwGRPbbN1eG
	2qs0fJIMODgA69aMI6eO1dO/Dm9ortmlzVZomRA3OFQZNiB7UKK9PIx0A24d0yE8+RUjVcCxr7i
	OCijFYs9vObgtl4hEZOr1SNEdnvMkqsmrFduaTw8RAFk6rBt78lihnewraO4iJBsDL4Fpl+SHUJ
	vVubWg1Y7OOmSRhKbpoB8sGmQJC9HEEckd2YDsvDp9A4iGOauTdj/WC3mDzs3W9nGPWGtT2TYW4
	5Ip2aCjnr8sirK8UW8Qy4UcQc5aVNUsHKzqV7UKtxh91DHazsYPrcdXqpqlkvRkpPOVzdcxc3zx
	hxZNNmrPUJweaxx6w==
X-Received: by 2002:a05:651c:1ca:b0:38e:896b:f26b with SMTP id 38308e7fff4ca-38ec7b4e462mr3331161fa.31.1776403173568;
        Thu, 16 Apr 2026 22:19:33 -0700 (PDT)
Received: from ribalda.c.googlers.com (52.163.228.35.bc.googleusercontent.com. [35.228.163.52])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38ecb4f5035sm1293491fa.4.2026.04.16.22.19.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 22:19:31 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH v2 0/2] media: uvcvideo: Avoid partial metadata buffers
Date: Fri, 17 Apr 2026 05:19:27 +0000
Message-Id: <20260417-uvc-meta-partial-v2-0-31d274af7d2d@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAN/C4WkC/32NQQ6CMBBFr0K6dsyAUtSV9zAsJmWESYSSaWk0h
 LtbOYDL95L//moCq3Awt2I1ykmC+ClDdSiMG2jqGaTLbCqsLJ7LGpbkYORIMJNGoRdQ3djmYm2
 HjCbPZuWnvPfko808SIheP/tDKn/2TyyVgEBIzjVXsifEuxvUj7KMR6+9abdt+wLZUg0qswAAA
 A==
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[chromium.org:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-58954-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ribalda@chromium.org,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,chromium.org:email,chromium.org:dkim,chromium.org:mid]
X-Rspamd-Queue-Id: 975224170D8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The current code can lead to partial metadata buffers when the metadata
queue transitions from empty to ready. Fix that.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
Changes in v2: (Thanks Laurent)
- Transition to UVC_BUF_STATE_ACTIVE with the data buffer
- Link to v1: https://lore.kernel.org/r/20260415-uvc-meta-partial-v1-0-a0acc79a6300@chromium.org

---
Ricardo Ribalda (2):
      media: uvcvideo: Do not open code uvc_queue_get_current_buffer
      media: uvcvideo: Avoid partial metadata buffers

 drivers/media/usb/uvc/uvc_video.c | 23 +++++++++++------------
 1 file changed, 11 insertions(+), 12 deletions(-)
---
base-commit: 2e9a8a967f836cf879f35c7434025de265826cc1
change-id: 20260415-uvc-meta-partial-a5767866d0e0

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>


