Return-Path: <linux-media+bounces-58596-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GGujARe52mkO5wgAu9opvQ
	(envelope-from <linux-media+bounces-58596-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 11 Apr 2026 23:11:51 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D5883E1B63
	for <lists+linux-media@lfdr.de>; Sat, 11 Apr 2026 23:11:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7052F3031AEA
	for <lists+linux-media@lfdr.de>; Sat, 11 Apr 2026 21:11:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBB9A3BF68E;
	Sat, 11 Apr 2026 21:11:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ixj8ZSCf"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21F391EB1AA
	for <linux-media@vger.kernel.org>; Sat, 11 Apr 2026 21:11:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775941897; cv=none; b=J+mDrCW+d1MrT4JqYapFmLyn5AcTjtwYD+SopNJATE/pyBmeei7ln4EPJSnYyCo48OwtwGBwaAwsCj06RlksF0wSWLub1HCfDUb1YCu+jFaR/6V+9WIytOu3JlpdSsibHIIIUZ1HxwoMMDwFapksxGA1E6TbSE7CkV9qasy4+qY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775941897; c=relaxed/simple;
	bh=gi15hcyqfgdadvIhdvu5Qn7qP7o4w4fImY4nXxFjqQc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DgHNohPZw7y1TcHrlwl+VTWVQpZqxijr5VLKpBj0S9N1WxS7WdX/O7/tW9UwJc7/EkYHukMGq6WRJoIUWa2agK2U/ScTvdQinmMeH3Xvtf5fg1XmSAFJlJl6YfjhS1ff6fWtQgI7jc1znsE4Urva2eqifCzzTZCwqJC7NSkn/w4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ixj8ZSCf; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6634bb959a2so4495109a12.1
        for <linux-media@vger.kernel.org>; Sat, 11 Apr 2026 14:11:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775941893; x=1776546693; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7sJmPJWyRpJ6XpOWhqHf2lRa3H2nAMFw7nJfxUU+y3o=;
        b=Ixj8ZSCfh9qoyLBz05ac4nnJJeza7KmqAD8wV816BmzFZN5hwn0CqobIIF3Z98nPJQ
         d1mFxY/boyPEG3/fpS0fr7OP7ltIrnVm5S/rVPX5MuYVZs+97JXkES534wjObAWrxSln
         Edh3zs2miqDRGa0YcYp6EwEbP3d8dtRAzrtUtiGDbInT9xqR1NrcQ9DKgCJdYY4SNjfe
         woVUlpP6RCizXf0wRfvel6Aa2MKCl+SekvcNN8ujiz+UUjqlUGiO+s2Y7bZbFrURi9ds
         9141oz4vBiZoAJt7h7PATVjpKTijn+//SmhG5UOkkfxv0grMEEaOtcYFamnGcM4fgfJA
         Jyiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775941893; x=1776546693;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7sJmPJWyRpJ6XpOWhqHf2lRa3H2nAMFw7nJfxUU+y3o=;
        b=N2JJmm7R/mlXpE72v7JMUrYJOmBY0wCt7e4U3NAGDdEKinPIHVlr9cJupL5B49/WCn
         UQyp0lYB9P0V4kgrAcAMOdJ6txVZMmzl4Xt9CyVOuPvXegDLT8Gm1igWTY3zFczbYCUv
         d/1AXOsLPdTl3c5ceNwmE9c7L3pteTpyzUDpnkRXUgf4ZVMGB67Ou4q4fEoVvQ2zPp70
         jvwosl6svChsXTReMjx+uGlaBqsrsCruqXKBn+Zb+NlyFKH8bbAyb0Ej+4WTf6lR3hPo
         jJcgRfFm9blVZ+GQ2ZV/+ld6MMNspHtd0Kk5Mj20o8lME3ygMKZhRxLroq7lktczI41G
         sc/Q==
X-Forwarded-Encrypted: i=1; AJvYcCW0dM2BkZLfMVuDIfKYEUUbfxigxK81y4Sw6ciy0+YqGJX3PZ2N6HC8sSLIvhOMF/r2ZSMwbZpdQMoJlQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzBbQnsH+1rBKwabQHjYFuq64djw/7Vbnrx162nFjfhgBwZ1uAe
	jK4bB/n95zJw6BVfuKVlDOr9+sp3pP/CtNjF2sAu9aVJYs1jJF5JCG0B
X-Gm-Gg: AeBDievXXoGboDgy368puGSlyNdID/zcsLc0mra06wP8nemWBTBFKv67GDPeCGfWD6O
	BELtvt8ldTX92x1hsW+WgGnNXUqJPJ2pz9TLA+yjgNM5LxLvKPx8y0ZPnKYqDPGL8v9aw0ksxQ5
	PxKVJOgy8PNAZa67Z2wDYYzZPyqABNzFuc5SujReR6Hj8iimvDB3qAtqhaMTwb/Eux8neROfkgy
	O8LfPUMVJ2T8MmWgFonoJ39jEUMBrDIdYmqotPDxMdU4P/vpKimi86UKMVuDdeYkLcxBuOmaOnW
	PF1jhzjidfkUskLO28RGpXsTUDYTI/eGciFIr2t3jlxd/O+jZOpML9LZb8TVtcfcKytYXObrstd
	kfjqDXjfi1OZ1Pe0jOMU76xC9ebgiODfDsOdo2LzZIcE5H2mzrZqywMvh3//CrUE+3ugsS1Kc0W
	dQeXeqK28spiEPGkRuewprx/Ty3w95kNDBEskWDd/E1/fcq3ODVX/FcU2SN28yymtT9EntgrcG+
	9Jax74ChiWzjUHNtF+UPpkELJXjl7hUUtjlASHT3oK35cYr9tAH8Eci4BQS3kgfCT6O15rbz9fd
	S5H5LA==
X-Received: by 2002:a05:6402:280c:b0:670:64fd:2301 with SMTP id 4fb4d7f45d1cf-670795162d8mr3722324a12.15.1775941893193;
        Sat, 11 Apr 2026 14:11:33 -0700 (PDT)
Received: from ahossu.residents.sin.openfiber.nl ([88.202.160.248])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-670702eec8asm1511110a12.2.2026.04.11.14.11.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Apr 2026 14:11:31 -0700 (PDT)
From: Alexandru Hossu <hossu.alexandru@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>
Cc: Jonathan Hunter <jonathanh@nvidia.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Alexandru Hossu <hossu.alexandru@gmail.com>
Subject: [PATCH 1/2] staging: media: tegra-video: fix wrong return type in tegra_get_format_fourcc_by_idx()
Date: Sat, 11 Apr 2026 23:10:04 +0200
Message-ID: <20260411211006.150782-1-hossu.alexandru@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-58596-lists,linux-media=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FREEMAIL_TO(0.00)[gmail.com,nvidia.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[nvidia.com,bootlin.com,kernel.org,linuxfoundation.org,vger.kernel.org,lists.linux.dev,gmail.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[hossualexandru@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-media];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 6D5883E1B63
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The function is declared to return u32, but returns -EINVAL on the error
path. Due to implicit conversion, -EINVAL (-22) becomes 0xFFFFFFEA as u32,
which is an invalid V4L2 pixel format value.

The caller tegra_channel_enum_format() assigns this garbage value directly
to f->pixelformat and returns 0 (success) to userspace via VIDIOC_ENUM_FMT,
giving applications a silently wrong format descriptor instead of an error.

Fix this by changing the return type to int and propagating the error
correctly in the caller.

Signed-off-by: Alexandru Hossu <hossu.alexandru@gmail.com>
---
 drivers/staging/media/tegra-video/vi.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/media/tegra-video/vi.c b/drivers/staging/media/tegra-video/vi.c
index 9c0b38585d63..afc7327ef318 100644
--- a/drivers/staging/media/tegra-video/vi.c
+++ b/drivers/staging/media/tegra-video/vi.c
@@ -77,13 +77,13 @@ static int tegra_get_format_idx_by_code(struct tegra_vi *vi,
 	return -1;
 }
 
-static u32 tegra_get_format_fourcc_by_idx(struct tegra_vi *vi,
+static int tegra_get_format_fourcc_by_idx(struct tegra_vi *vi,
 					  unsigned int index)
 {
 	if (index >= vi->soc->nformats)
 		return -EINVAL;
 
-	return vi->soc->video_formats[index].fourcc;
+	return (int)vi->soc->video_formats[index].fourcc;
 }
 
 static const struct tegra_video_format *
@@ -395,6 +395,7 @@ static int tegra_channel_enum_format(struct file *file, void *fh,
 	struct tegra_vi_channel *chan = video_drvdata(file);
 	unsigned int index = 0, i;
 	unsigned long *fmts_bitmap = chan->tpg_fmts_bitmap;
+	int ret;
 
 	if (!IS_ENABLED(CONFIG_VIDEO_TEGRA_TPG))
 		fmts_bitmap = chan->fmts_bitmap;
@@ -405,7 +406,11 @@ static int tegra_channel_enum_format(struct file *file, void *fh,
 	for (i = 0; i < f->index + 1; i++, index++)
 		index = find_next_bit(fmts_bitmap, MAX_FORMAT_NUM, index);
 
-	f->pixelformat = tegra_get_format_fourcc_by_idx(chan->vi, index - 1);
+	ret = tegra_get_format_fourcc_by_idx(chan->vi, index - 1);
+	if (ret < 0)
+		return ret;
+
+	f->pixelformat = ret;
 
 	return 0;
 }
-- 
2.53.0


