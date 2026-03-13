Return-Path: <linux-media+bounces-55787-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2DbjK/B0tGmUoQAAu9opvQ
	(envelope-from <linux-media+bounces-55787-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 21:34:56 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 28DA3289CC0
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 21:34:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 445C231FAB61
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 20:32:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D552374743;
	Fri, 13 Mar 2026 20:32:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dYWXhWuE"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E603375F8A
	for <linux-media@vger.kernel.org>; Fri, 13 Mar 2026 20:32:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773433954; cv=none; b=aIihcvuVw6oHb+IR6Ph9NioJDuupciNQVxLDiJDTc0sbVu9T+gaqpMJYw+k/jAG9Db5u3cHoGukhxZghl9OJtjQ4uAbbymN+D4Cgb1899kWqfY6FQNgeZMheUBAN+v/SnhZ/U8dkIkUwx2KXCji7QZE+0xImSf9qJe4SLrj9AJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773433954; c=relaxed/simple;
	bh=uoaHvZKkfNu2LNQesj1Cl6lvOh4xwZB9B8GYojIHpk4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=OH7P7vDM3n+ml4DEYZKu0IIUM+l5ct9GXBGfUPhqPMtMDMzmCzdQNN4eTpvCmNCHev2qhsNVgjyk69O1YihH9mQEKmiXFG/KYMBdt3uSuc8rpZ0jML3jiVddtw3YT6HYZcE3mmWNaahuRPIWWzuPXaIoj3WuFpn5aPTXvjqc8wM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dYWXhWuE; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2aae146b604so17138375ad.3
        for <linux-media@vger.kernel.org>; Fri, 13 Mar 2026 13:32:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773433949; x=1774038749; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NPG56TbKEmejJK8LT3umjM7yEprzdCYPGQv6JUjm/M0=;
        b=dYWXhWuEFMdGoBqiQLjDM5XraRSUnOouwc/SquwOP2JzqHlRGaRP7+pE4UaYVPOEbY
         GuoejLvd7HHxTkAIW0ADcowZLujdnFtAiwIMdvVSilXHYb2P1qI/7BvgBkxrKD1EZl3L
         gCSbLMtt77Y0IjpDJ4JGb+KEpz2RfMclQ8CXdPFKwjC8FyJBOHyH96c/sCDsXxX7Xy1p
         sdomcrYlN5LTIQ05fyDkKZW8qGNnKw5wcYWch8b1Mnd2vC3wEjPe4L4oqmFHOF7dn8kS
         waw0iKCk1155rBV+DpI7qScB6DP6/hQUQBBCkEVk4sU+vks1rwbvyUW+V/PYTar58t0X
         8yuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773433949; x=1774038749;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NPG56TbKEmejJK8LT3umjM7yEprzdCYPGQv6JUjm/M0=;
        b=MbOLuGc0ZQjcZsTGI5BEzfYYv0tAuh4KNddEIFdDgNn6ZhbMO1vGug3Z1UCNKr517v
         PZF8wpQ60hRDgUrzaz4xUytuUkF8GDthXBJyOqHv0UJ4kLofzv2d5UmbOIx+4HqAtHYM
         8+/dmzVJbQaTrF+AoEy6odky+SUUMITBgNoO0RO8fTSsw8AfxTZkfp1Kp+sMP2R+CDBq
         VKva83N+P8rtjeaX7SrCQ4O8B3mQL/SPE7+qI/a4A04dxLeOZhjdls/Taruapf2ZqssS
         nP+NCzrjHtNJ1r4mPBMcyFMtlFF5B3RHzi0nSCN6/kSx4Ei2vBCcGCPz3ankgScYcATV
         3ydg==
X-Gm-Message-State: AOJu0YyGZ1Ov8CoRGPd+H/PYtYySa4aGgfop5V5vDn7ezdqzjs4rCsc1
	8zRor0Jf8S0rkTdIfvISmLQhT12cYH1HLh8cDDZVoqbpTPJFBiLkQscI
X-Gm-Gg: ATEYQzxpco5tKeaDTneeJW264g0E2/2HBQUz7B8DrJnHYyhRJgUMqFfuBaDWIwB9/D3
	DYehM0MV8o0oRYwvhZqLdXIKi7fkCpO/SMIhtjEcV64N2BLL+HLEiuwyrQAxknW+sJkXBNgpRjl
	EnBMEAE039mkeaG6JKVrsjJfOENIimkLN+aoAsPuFxpUG0cWGfKSHhAOK5A55SEqqsh9RSijO1E
	A/Jk8E8WE8uiZSMq/R/Ag5s1N59cc4hr9fCbVZh5x8I7sKYG5d7aQTAFhHPEzqFeCANQcWjR37e
	ibbxi/bd0dnKI+LFUcK6ZVeK0DMmB7A9PwYxjww+p0iznm03kwcXnHdRHeN/3/Px20U2/SAv8Qf
	BaYOK3OQvjSnrT9Wcx7e7Al1i3TTzZ0g8WXOQVwo9NMknmhoCT+U7tXltvJUl3gK6uRXYna6l18
	kG8ohLEEWBAGafGPU++JBojHRe7g==
X-Received: by 2002:a17:902:f708:b0:2ae:cd2c:8f34 with SMTP id d9443c01a7336-2aecd2c9460mr38640385ad.23.1773433949160;
        Fri, 13 Mar 2026 13:32:29 -0700 (PDT)
Received: from [127.0.1.1] ([103.216.213.160])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2aece630b8asm30476735ad.40.2026.03.13.13.32.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 13:32:28 -0700 (PDT)
From: Atharv Dubey <atharvd440@gmail.com>
Date: Sat, 14 Mar 2026 02:02:22 +0530
Subject: [PATCH] media: cx25821-alsa: replace BUG_ON() with WARN_ON()
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260314-media-v1-1-fc6235c57d04@gmail.com>
X-B4-Tracking: v=1; b=H4sIAFZ0tGkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDY0MT3dzUlMxEXVOj5MTUVMMkwzTzNCWg2oKi1LTMCrA50bG1tQAQOJ8
 7VwAAAA==
X-Change-ID: 20260314-media-52caee1b1f7f
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Atharv Dubey <atharvd440@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773433946; l=1410;
 i=atharvd440@gmail.com; s=20260314; h=from:subject:message-id;
 bh=uoaHvZKkfNu2LNQesj1Cl6lvOh4xwZB9B8GYojIHpk4=;
 b=Mo1H9udHRA3lyKkORtNJkwU+hf4M7oV3dPIqFvY6XdiQ80nWBeqkJoPMVp2AEMy95KoudvQuD
 G45WcqDkwREDPN1cgLWma8wCoQ6z0CfdcLoIU0HMWQeKPN1X/3jTitB
X-Developer-Key: i=atharvd440@gmail.com; a=ed25519;
 pk=T6i1xWOKT/RUSDYATSgyVG/4X7ac8jPjRSG1mMAcqVk=
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-55787-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[atharvd440@gmail.com,linux-media@vger.kernel.org];
	RCPT_COUNT_THREE(0.00)[4];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 28DA3289CC0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

media: cx25821-alsa: replace BUG_ON() with WARN_ON()

Avoid crashing the kernel for a recoverable condition
by replacing BUG_ON() with WARN_ON().

Signed-off-by: Atharv Dubey <atharvd440@gmail.com>
---
 drivers/media/pci/cx25821/cx25821-alsa.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/pci/cx25821/cx25821-alsa.c b/drivers/media/pci/cx25821/cx25821-alsa.c
index 3f73391f9098..4fdc59aaed8e 100644
--- a/drivers/media/pci/cx25821/cx25821-alsa.c
+++ b/drivers/media/pci/cx25821/cx25821-alsa.c
@@ -397,7 +397,7 @@ static int dsp_buffer_free(struct cx25821_audio_dev *chip)
 {
 	struct cx25821_riscmem *risc = &chip->buf->risc;
 
-	BUG_ON(!chip->dma_size);
+	WARN_ON(!chip->dma_size);
 
 	dprintk(2, "Freeing buffer\n");
 	cx25821_alsa_dma_unmap(chip);
@@ -509,8 +509,8 @@ static int snd_cx25821_hw_params(struct snd_pcm_substream *substream,
 	chip->num_periods = params_periods(hw_params);
 	chip->dma_size = chip->period_size * params_periods(hw_params);
 
-	BUG_ON(!chip->dma_size);
-	BUG_ON(chip->num_periods & (chip->num_periods - 1));
+	WARN_ON(!chip->dma_size);
+	WARN_ON(chip->num_periods & (chip->num_periods - 1));
 
 	buf = kzalloc_obj(*buf);
 	if (NULL == buf)

---
base-commit: 0257f64bdac7fdca30fa3cae0df8b9ecbec7733a
change-id: 20260314-media-52caee1b1f7f

Best regards,
-- 
Atharv Dubey <atharvd440@gmail.com>


