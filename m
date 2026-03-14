Return-Path: <linux-media+bounces-55795-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ivfMGuHPtGnmtAAAu9opvQ
	(envelope-from <linux-media+bounces-55795-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 14 Mar 2026 04:02:57 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 01A4128B74E
	for <lists+linux-media@lfdr.de>; Sat, 14 Mar 2026 04:02:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D8017301DD62
	for <lists+linux-media@lfdr.de>; Sat, 14 Mar 2026 03:02:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB34C30EF84;
	Sat, 14 Mar 2026 03:02:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EfhGSE+J"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yx1-f44.google.com (mail-yx1-f44.google.com [74.125.224.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19F771B424F
	for <linux-media@vger.kernel.org>; Sat, 14 Mar 2026 03:02:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773457372; cv=none; b=GrhVDeOjCuaHnbQj3lYQjdCYl9fpZ3fowQ9Mx8a7lFjtWEVJfRVi0jz7j5xOmUYciw4W1CoPWK1BqxciCAteiGenZkV5kTkhs5PhF0Msp80LC0nicnRGkfe2aShCw0/xZeLpCj0Xen5NYgiQQEJtswkfiAAFRQDATl1v0L7ga3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773457372; c=relaxed/simple;
	bh=GQtnGMG+iwGnUDXIJP36UuAxoWcpNjtRkTYriXn/Q9M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GVQsEuEhNnKzr/0G65SROozqh46Ep05qHzrAlae/SSGaUMgOT0/zZCvbW9+9sDrxnRpQTJ9PQMi2IliMd0CMeAxyIcUkBKxbrySv4jRSSIQbHeTLinGYqfv1LuOLOQMtTA1/Of+JHdHYF3esgaGIl2r/hE/qcnhAQhgKXKIsDhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EfhGSE+J; arc=none smtp.client-ip=74.125.224.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yx1-f44.google.com with SMTP id 956f58d0204a3-649278a69c5so2612623d50.3
        for <linux-media@vger.kernel.org>; Fri, 13 Mar 2026 20:02:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773457370; x=1774062170; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Oc7FLdNxwtcVIDYDLuOycp4ocAPA1/t0REGOIAdfe5E=;
        b=EfhGSE+JW4Qaa3ZKzR31fMw9fWe+Q9+sgBtLqYhGQs78M7tcn9SQYK920jU7P7Ebs0
         QIyJcWPkNY6j+7gQf7ipeVlDhZfps1Y4jGThnS34AvAPHXmto8BpqaALVjfZ9HY9Xlhd
         05uocGqxpux+EvFzPD/lJc9uZGrMtNvIuF7LTyVRDWJl5GnrUzeul55W7VKlfFkHlDIX
         pP+26XIw5wPnEtaTgumbhnwsvQQc/GAaiKDEUpYDHkm0b1neyEmjluMLUIl5pppxF4Lx
         i/pVEa+kp5LhXhZC1TzM2HDZiP4ch1nZV1AQkmNQL71aCr0Zpt3FbeglTNMaGK9yR9Xo
         5P2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773457370; x=1774062170;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Oc7FLdNxwtcVIDYDLuOycp4ocAPA1/t0REGOIAdfe5E=;
        b=O01pctnw+s24Zk25NGkcZZT/bkxElEsJLLAOQsedEBRpsyx0qUKn0vQE07sVvj3m53
         6aeGgT6ikQUri22UPoiaM5AVGfaRGSUTj/gfsIfcLLjDkLMhJbAeZFjoyb90ehezz2aZ
         ZjTsGfBlp6Kh3tyMyDv0AuNTX0BybISUfMzvh0KPJ49h+qg5Fpfv7rQwf4Qyu6T7M+KN
         IpfcYITakEE4wlbWC7zuvLjbAy/TzbsmNSU6afz3m9qag+w0RyPjZIswJSQFFYW3v7zn
         05pbXz1hV4ARPVvd93DR3I4kfCzvonWCPeGi8ixy4tA8NbUE25kMChHUABxyxH+Gf4mi
         iiPA==
X-Gm-Message-State: AOJu0YwXoqIXK7X7jebvabwA8kGBzoAEs4ixKMlgxr2k4wgvftQ1sMlp
	L+cWGyHBuh7pLUic6mHw++qb90LvMH8tNaNxDnMFVjog85BEfjFsooOb
X-Gm-Gg: ATEYQzyoXZnHdhn4/woKZl4B3rn/tJMu+MOeGedXmo4MbsArk2dahRC5IBLm8irPK6R
	ZegmADeoNj+7QKfJGhplAiQvk0wgpdi12Qp3/FFdwqb2uYLfp/rysQrld2MC87nSi9jUjFa5Phb
	3lrqov5v8LFWUCeeUVFgGdmwfKfRkLGrtwT8+O9ZiKxhU7yTf44MMN96QwXSaHIZYDNb+lDhHyH
	8yqahSx/t59veE79RAQDTPErB+XSNTqRG3GAO+tZ9LcYgrVxNbJQ5yHu7h78wFDXsqfaAPSQ3Yy
	F0r844Gf4Ur2PXQfhkraOZmwJXXq/PIgrnNxuiE1DqRuBxCiWLvEUpBvG2vru7j0hK8Eh+9rT9p
	VfylvV7EZ+7C35HaxL24JZn4T1/zwpK4v7jpcEJKoOter29jPSQwNR3BEErHNF/1AeRSqQRKfFh
	3gELFdOsQnmQ89Whb0jUFUcPyqHfH83xzVoy9PGo051ifMADBTOT889leQWybyHlUnVkudw5jKz
	gwkh//g2XtT38V7wIirxRjk
X-Received: by 2002:a05:690c:2702:b0:798:3efa:601e with SMTP id 00721157ae682-79a1c18dc3dmr56962457b3.35.1773457370097;
        Fri, 13 Mar 2026 20:02:50 -0700 (PDT)
Received: from tux ([2601:7c0:c37c:4c00::5585])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-79a231a54d2sm15338547b3.42.2026.03.13.20.02.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 20:02:49 -0700 (PDT)
From: Ethan Tidmore <ethantidmore06@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	Kees Cook <kees@kernel.org>,
	Ethan Tidmore <ethantidmore06@gmail.com>
Subject: [PATCH] media: subdev: Fix error pointer dereference
Date: Fri, 13 Mar 2026 22:02:28 -0500
Message-ID: <20260314030228.1133429-1-ethantidmore06@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,ideasonboard.com,linux.intel.com,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-55795-lists,linux-media=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ethantidmore06@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 01A4128B74E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The function media_pad_remote_pad_unique() returns an error pointer upon
failure, not null.

Add check for error pointer and extract the error code with PTR_ERR().

Fixes: a564839e630c1 ("media: subdev: Add v4l2_subdev_get_frame_desc_passthrough helper")
Signed-off-by: Ethan Tidmore <ethantidmore06@gmail.com>
---
 drivers/media/v4l2-core/v4l2-subdev.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index 9efd14d4026f..7cb17e0a5617 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -2585,10 +2585,10 @@ int v4l2_subdev_get_frame_desc_passthrough(struct v4l2_subdev *sd,
 
 			if (!have_source_fd) {
 				remote_source_pad = media_pad_remote_pad_unique(local_sink_pad);
-				if (!remote_source_pad) {
+				if (IS_ERR(remote_source_pad)) {
 					dev_dbg(dev, "Failed to find remote pad for sink pad %u\n",
 						local_sink_pad->index);
-					ret = -EINVAL;
+					ret = PTR_ERR(remote_source_pad);
 					goto out_unlock;
 				}
 
-- 
2.53.0


