Return-Path: <linux-media+bounces-52051-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oIhALRjkgGleCAMAu9opvQ
	(envelope-from <linux-media+bounces-52051-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 02 Feb 2026 18:51:20 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DEF7CFC6E
	for <lists+linux-media@lfdr.de>; Mon, 02 Feb 2026 18:51:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 25E6130224FE
	for <lists+linux-media@lfdr.de>; Mon,  2 Feb 2026 17:51:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 942B2389DFF;
	Mon,  2 Feb 2026 17:50:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JzkZFCoI"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 619D138887E
	for <linux-media@vger.kernel.org>; Mon,  2 Feb 2026 17:50:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770054644; cv=none; b=We3PPIaZap4Pdk3DxwYHGwHpYAgJH3ZrpCCvvpyY3sRFD3PgqTlmSExoe0No/Mbk4H1qMB4cBNIxKiBFjSNteTZiZdpaZ+5U4+YVPdQ5hOEngAfDiDPVgQ8LXzcaKy+/9xXp4swy5khn3dlZYX2mZVOzsueWI2pb5sJQNNfyJcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770054644; c=relaxed/simple;
	bh=kBE6uNEucl6NId/+/XI8l6n5LWwc1K1YqjtdDJtweRk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UGlXeGa1DGDBZ6vtrT+v+wGeOdG+LmAyCQTxuMEnF02DodYASiP48h6dXuXf49roGxnhR8h1Iqxrk8nMpgR9rSwgufyDRzC4sNzJ+MuL5rR0JEqcXczL9RIkEAcGlwlfQC3TmEzt0CTe6Xcbai31Xd4pCsDmXiqexlADTFEiKqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JzkZFCoI; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-432d2670932so4374655f8f.2
        for <linux-media@vger.kernel.org>; Mon, 02 Feb 2026 09:50:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770054640; x=1770659440; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I5c8Sl+AZyQTjldUH561qMBazYom86+XOMxFsK7gB20=;
        b=JzkZFCoISuFrq5jk4rSu4PMohau4fOFB+u428g9Xp9/UjpleHt70m3gQJYU3goq0Uy
         pcVb/ixWeCFSxv7/7WJ7wtZCxLNv6kcKJA5cva1/zmPmpnehl2cWOQY3qjTVbS+JB/EV
         1KMzwvjpglmDWLFFRBUGZEme8hmpaZ0eJBCO/IuVp8HtFIzYneuGBg7aDhIedTJH4Zcp
         fsNZEvXmywi4GID22zGH6rGPPeQsCeWPHQRg6n55Q0FO8inr7qSsCrDBc8vmuWiydN5P
         XS0k0Dghfx5XOmzn7FTZpEy1552BqeYhnVuMn3OZ1EZ00NcLtK+cnMP5g3P3B2tebuc4
         bzkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770054640; x=1770659440;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=I5c8Sl+AZyQTjldUH561qMBazYom86+XOMxFsK7gB20=;
        b=xJxBWQ6gPjxzonjDB4mmpSiUTPx4nvPKBeVpOPGelowYEmif6rQ5onsemNPsmywEqz
         KcgoYKs5Pg74OFXj4aQe10Ua+Tc6WxPRVHCtN+7pXHsm5OL1vir2X6TODdPNYtXK5vZa
         QziPtAohA1Un6eSv2eNpwbvBfHLK9+VJvGo0JKqC05+6GkimLBB/ytkFQts5n8+b1lfU
         8uuAoSfWrMW7RgiYUDm5G5O4t9T3icjlBkG6Hv9lsyulq6tckGBIrgVb+tO6OZRM5Bg0
         DrgNSonCE4Ql+86fwebqel0oaYubuDU+YXneTNVpWQ0CdQIwc3rDwES3Bq+cmLj68R6K
         ptWw==
X-Forwarded-Encrypted: i=1; AJvYcCUZxOYtadFRyibkDQAUL5webK64phAwkbwlkCo0JeuwNd/eWJs8Ao0QvpBf8k9zP1JyDDFOtod2NEoHsw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxAMEnBdPiRRAKGOuNJcfkaV1slrDrVyjCARsUt9X+9VhjcriIG
	mUbGCuHorwbFLKMqjpKKX4+oNqwZGqZqi16ZuHL88NrcHrMv20+044p+
X-Gm-Gg: AZuq6aKxshvTNhyrRSrruL1V8LQqCA7B9uaL1rzT5SffgaaXBj89bKNKaA7IfyGTQHM
	byiP7ZC2dfbxYAX8hBTPB+44kgesQsDQVyvmzpqDy65kUSurvheYYbjxNSQz+Itn9N0L2Pt9E/V
	QyISFNC9n/EGL7V2P4qVah6ASkcX/IzYpcvejx+ppChAigqmb29NgzG1iuO4Lk2gAkpFKq8jSZi
	IyZ4tpwInh1geaDFXj4lrP1ODUJc4/i8czWhkkGQiWPVv42gR9MNMHGPhx6YGgzU38oKq4w234F
	FTSDCVimg5n6vMUgZzIvnhiyNVSrl6yf7NUhUiorjBrhTNCzVZ5SVTrEQsWDen6iOzGiY0NIWAA
	QnQgqSEtr3Gx98uVT4cHQQV7LxNVIR6BkVOtEIJ8RaJzYqePUuddRx+z4QpHOCZVu4dO3Tfci7p
	vM8OVSB9SaIqY6uoKK1iGpF88jxUtIrDHnNfwS3Rc9O/yYjAEU
X-Received: by 2002:a05:6000:144a:b0:432:84ef:7160 with SMTP id ffacd0b85a97d-435f3a6bf2fmr19931292f8f.12.1770054639555;
        Mon, 02 Feb 2026 09:50:39 -0800 (PST)
Received: from DESKTOP-VOVUFNJ.localdomain ([5.14.81.135])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e131ce70sm47011359f8f.27.2026.02.02.09.50.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 09:50:39 -0800 (PST)
From: Bogdan Sandu <bogdanelsandu2011@gmail.com>
To: gregkh@linuxfoundation.org
Cc: bingbu.cao@intel.com,
	bogdanelsandu2011@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	tian.shu.qiu@intel.com
Subject: [PATCH v2 2/4] media: ipu3: use tabs
Date: Mon,  2 Feb 2026 19:50:31 +0200
Message-ID: <20260202175033.8640-3-bogdanelsandu2011@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260202175033.8640-1-bogdanelsandu2011@gmail.com>
References: <2026020258-very-numbly-b36b@gregkh>
 <20260202175033.8640-1-bogdanelsandu2011@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_FROM(0.00)[bounces-52051-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[intel.com,gmail.com,vger.kernel.org,lists.linux.dev,kernel.org,linux.intel.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bogdanelsandu2011@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[9];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 7DEF7CFC6E
X-Rspamd-Action: no action

Use tabs instead of spaces.

Signed-off-by: Bogdan Sandu <bogdanelsandu2011@gmail.com>
---
 drivers/staging/media/ipu3/ipu3-css.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/ipu3/ipu3-css.c b/drivers/staging/media/ipu3/ipu3-css.c
index 145501e90..e990eb5b3 100644
--- a/drivers/staging/media/ipu3/ipu3-css.c
+++ b/drivers/staging/media/ipu3/ipu3-css.c
@@ -1034,8 +1034,8 @@ static int imgu_css_pipeline_init(struct imgu_css *css, unsigned int pipe)
 			       3 * cfg_dvs->num_horizontal_blocks / 2 *
 			       cfg_dvs->num_vertical_blocks) ||
 	    imgu_css_pool_init(imgu, &css_pipe->pool.obgrid,
-			       imgu_css_fw_obgrid_size(
-			       &css->fwp->binary_header[css_pipe->bindex])))
+			       imgu_css_fw_obgrid_size
+			       (&css->fwp->binary_header[css_pipe->bindex])))
 		goto out_of_memory;
 
 	for (i = 0; i < IMGU_ABI_NUM_MEMORIES; i++)
-- 
2.51.0


