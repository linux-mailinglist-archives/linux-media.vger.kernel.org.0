Return-Path: <linux-media+bounces-57450-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4NdFFo/xx2lMfQUAu9opvQ
	(envelope-from <linux-media+bounces-57450-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 28 Mar 2026 16:19:43 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E9D134ED88
	for <lists+linux-media@lfdr.de>; Sat, 28 Mar 2026 16:19:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8A3D4301CF90
	for <lists+linux-media@lfdr.de>; Sat, 28 Mar 2026 15:17:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D513733556E;
	Sat, 28 Mar 2026 15:17:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cI7FWZNw"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB608334688
	for <linux-media@vger.kernel.org>; Sat, 28 Mar 2026 15:17:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774711058; cv=none; b=NgEVweiVIpjV5rDQvm1Vt5y3KlXs0k3OiLbx270cwuMQGRvZ5Y9hE4JFWwaTauqzu1kmvFQOSb7cLD7+5lZV+LcJqW6uSVZ9az5P4JziTyyp7tY/GurgbY9XwkwVrPCRsY3xXYKrvf8GhPUv7hWqZpKc8kburutzecyrwyzxLwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774711058; c=relaxed/simple;
	bh=ZWJg7QYWRQbgXcojyR4TKyqPIue1T7QETHoFjcx4hlA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=j3t7iveQAowkpw6qt36R2xyrJsgnTVbTzhcABZJeYOfsSt4QbD4mi/RVF0P+oF83qazjNCoVj5lil4nk64Rv3tplEoobxPY3jRyaaE55we/xETQ9UfpYnCaOiG381etBddFSldSu9iNN8hrHs+SP7mNQLAGybEizoKGasEl0h84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cI7FWZNw; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-65c0891f4e9so5724383a12.1
        for <linux-media@vger.kernel.org>; Sat, 28 Mar 2026 08:17:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774711055; x=1775315855; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rprbcKOKh6LbVDBtx1L6evH/A6xyQAWdrHbB0AMy/jA=;
        b=cI7FWZNwBScF9XKZC+vlp8IvBWkEUyoc1gtyQaf8ZyVAFEBEpW+RehKE0KXPh1vocs
         RJj6LiKQacX2Tu/vg4BK/X1wzH8ekPiL3tU2wwsEZ18NN49bjqBqALan0w1Xq1O8ZHQq
         KCDvfPGevAsdZOJMXnwlugNC5XlpUIKs5QRIU03Xp3JvHXBKsCIHr7QH0dtSOmBy+heg
         NDoF4TVanJ+cJSPChH/sPg9FQGIWaQFj/m+OrxlPPack4sOyv/pH8Xd4Y1qsE0CRYpQ2
         VN3sZNX3cq8K0AFWdTsMrHohv5No2/+2D8wK1Kk+cQzBHAyNDQc/sddSXAsfRN/7urmd
         mSdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774711055; x=1775315855;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rprbcKOKh6LbVDBtx1L6evH/A6xyQAWdrHbB0AMy/jA=;
        b=oOextKikROkegEHFSWuFgVakLPsxXY1ldszZkuBSAdhXsfG2iyr7g2LZ2yoM5CkrIZ
         CKFX+Kl18rvf7Irub+deWcsVq/mQ5QaOltIEC9FfVeUkhfIbp9xw8s9tfk3QOHDWJKAZ
         27uVqNQqtIfFV+qeegErpt1zGIr+oLYh2MbVxs9RuYpT02RaoukYqB3KGzEgTacDXrXP
         oUJgRCrD2hi5ye/QkAA2Mv61JfKqYNMFHN/htMo6lq4ssqaJQ/n/tCOosPBczMAkIhhi
         k9cmuicfzm7hNKRUDhEKhl744Tf/WfDfPYEgYFJ7O5ldDwyF1cos1L6KbbQgOvPL1pri
         Z6jw==
X-Gm-Message-State: AOJu0YxYyIOszzwUjAaHsoXY0dPcahgJZrMpuile7ZwbgI5vt8Ktz/ET
	+uzVGXxRYLJgpHEka/yaiRPwt8MBnE0ljJ0F0ksStNC4E0pICAS2pTyyEtbsILglo6Y=
X-Gm-Gg: ATEYQzyUkfmTIq3RJ6sBqISB/hgH0uv51liqXqf6GSbsMGTubLae+1QJ7BnWnOw2G6X
	2sd0qRMgxLNMnnDHd59KOsZ2rEwYDW71VEZ9ZAvohL6/LP+vQDbaWFRIQxV1gWY7XUCLKGTBpKc
	SelJdxf8IdvE8rcg7nMwEC2yoirnGWaYKTcgDKOYVomKFjBXmzE9ySs9yCx3bur/O0udklCs3zr
	lFbtd+pAVxxeNz4+e6YB+rQLfjGxPb62ei8vzZGl17niRlir4BIzDgI377o1cmvf/ijxDNOfJXa
	3nVh1YP2TqgJf6XVi2QyGkKifCKDz7juU8/scBPnLXh281GOrXNfpxELjm2WEcWWvcU5SQ6Mcek
	mNQaw7wLYZXA3B0tmVDbQBlffabYQVb0qIOiPuhgivH5As5MGg8XK0MstQpGGY0rKlK3kypIEiN
	zk6UezGTGzhmGHtMaVOKdTTV0qGP522JTsNbbMffV3KM36HDqicXBFLIpiorWpG2mvqATLHOIgp
	sgfNGlFaG0jMjzTS6Ql+pQ=
X-Received: by 2002:a05:600c:1d86:b0:483:7783:537b with SMTP id 5b1f17b1804b1-4872807470fmr103447895e9.24.1774709207384;
        Sat, 28 Mar 2026 07:46:47 -0700 (PDT)
Received: from dohko.chello.ie (188-141-5-72.dynamic.upc.ie. [188.141.5.72])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48727bfc5ecsm91577275e9.1.2026.03.28.07.46.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Mar 2026 07:46:46 -0700 (PDT)
From: David Carlier <devnexen@gmail.com>
To: kwliu@nuvoton.com,
	kflin@nuvoton.com,
	mchehab@kernel.org
Cc: linux-media@vger.kernel.org,
	openbmc@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	David Carlier <devnexen@gmail.com>
Subject: [PATCH v2 1/2] media: nuvoton: npcm-video: fix error handling in npcm_video_init()
Date: Sat, 28 Mar 2026 14:46:44 +0000
Message-ID: <20260328144644.67556-1-devnexen@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260327221905.267410-1-devnexen@gmail.com>
References: <20260327221905.267410-1-devnexen@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.ozlabs.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-57450-lists,linux-media=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnexen@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-media];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 9E9D134ED88
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

npcm_video_init() has two error handling issues after
of_reserved_mem_device_init() is called:

When dma_set_mask_and_coherent() fails, the function releases the
reserved memory but does not return, allowing execution to fall through
into npcm_video_ece_init() with a failed DMA configuration.

When npcm_video_ece_init() fails, the function returns an error without
calling of_reserved_mem_device_release(), leaking the reserved memory
association.

Fix both by adding the missing return after the DMA mask failure and
adding the missing of_reserved_mem_device_release() call on the ECE init
error path.

Fixes: 46c15a4ff1f4 ("media: nuvoton: Add driver for NPCM video capture and encoding engine")
Signed-off-by: David Carlier <devnexen@gmail.com>
---
 drivers/media/platform/nuvoton/npcm-video.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/platform/nuvoton/npcm-video.c b/drivers/media/platform/nuvoton/npcm-video.c
index b2a562e1ee1c..5c6bddfe8073 100644
--- a/drivers/media/platform/nuvoton/npcm-video.c
+++ b/drivers/media/platform/nuvoton/npcm-video.c
@@ -1720,10 +1720,12 @@ static int npcm_video_init(struct npcm_video *video)
 	if (rc) {
 		dev_err(dev, "Failed to set DMA mask\n");
 		of_reserved_mem_device_release(dev);
+		return rc;
 	}
 
 	rc = npcm_video_ece_init(video);
 	if (rc) {
+		of_reserved_mem_device_release(dev);
 		dev_err(dev, "Failed to initialize ECE\n");
 		return rc;
 	}
-- 
2.53.0


