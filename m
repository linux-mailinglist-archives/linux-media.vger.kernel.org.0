Return-Path: <linux-media+bounces-58614-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GBbRFLjV22kzHQkAu9opvQ
	(envelope-from <linux-media+bounces-58614-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 12 Apr 2026 19:26:16 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A14A23E5148
	for <lists+linux-media@lfdr.de>; Sun, 12 Apr 2026 19:26:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8C4F83014678
	for <lists+linux-media@lfdr.de>; Sun, 12 Apr 2026 17:24:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69F59351C11;
	Sun, 12 Apr 2026 17:24:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XswwVaKB"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-dy1-f194.google.com (mail-dy1-f194.google.com [74.125.82.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4684332919
	for <linux-media@vger.kernel.org>; Sun, 12 Apr 2026 17:24:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776014686; cv=none; b=k0abUU+VV11uBZMXEeNah3uDO0sbXDuqwddTsPWr9qwd1dgKuk00l/yNIc/bxhbPfSjcUE/VKNLYJUy6bc6gcfr8U2wXfx5OCflFINB33Q3PPdF1BcTQ7IOXksdyG4Ebj1fCQMqvtYbUQrZ6IhHuwRtej1wSAzcXrn6kUKCMgnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776014686; c=relaxed/simple;
	bh=LnP9ZkhnHG1MxUGh8a2gUL2fys5g5ptWYukCv+33FPM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=f5zbhSl/eSChli6Yi3tf4yQtGnpIxmrVsVfhIK4YT+Y/P4Jr5fNit6HCEDlUXatZwzrw6npSGXgT2q1uP38pjWOrmezg4SIRRQ5ALrLOOJPCoWFadeW/Tjc+khePJtBsdMYq3m8MapC6UyLnHj/A1wjwAjeLEzmXhd0wwMwsHVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XswwVaKB; arc=none smtp.client-ip=74.125.82.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f194.google.com with SMTP id 5a478bee46e88-2c15849aa2cso4333369eec.0
        for <linux-media@vger.kernel.org>; Sun, 12 Apr 2026 10:24:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776014685; x=1776619485; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IqDxjqHmcb6xKt99g2eKfC+2hdNdKPlT4sR9OKTs9UI=;
        b=XswwVaKBF5ikLN8U177gdxeyf2cBRToDzgzNNvzCdkJMIdncP8ba3xJAdvLmLSVmYY
         eyViX+1iC9YwTe4pEsC+t5Ud5FlQz2NS1l+/O9MSHV1vGqsBfWHXN8dQJc+fxc24k4xR
         y4O4q3pO9SD8rSwsVU7Aw2jPZdZEZVZHnVCVNGLSB8jWWSo3csMZDqiT+DMikF6vEYAc
         DvjsbEFveussxqL0KPqEbySI/wpw0jAcE+fwNmPmoNiktCpY0VIKU4ZXdmDpEZrhg+xs
         H6n4REOXqhcJFj8Ga1YQ7LCvIQzPngLEBC2tcQgyugmPM8t5CouPf2du+6ucsmeCbCTo
         2mWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776014685; x=1776619485;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IqDxjqHmcb6xKt99g2eKfC+2hdNdKPlT4sR9OKTs9UI=;
        b=ioh5h5yprnyOqyXjHLS4mynvniPEuSkzpRj6VBlVkSF3NsrgGM/LzT7PSw06522AeM
         dm8j2f6SCHm/jZFXG/TxzSEcUGwOEqEpmWQ5ehAFNQptSXBEFs6Ww7Raio+GezvZlNfG
         Y30ItVgzIlRdR3AOOTjXtpQbJzdzEPnWrkADPIXMSWP/ATBRyjGflxCHdfNO1EfXDbZ2
         Q3EsEEAkCwTWePpY8GBS1IOpVbUq0WkxwG1mlJsOljLBssOy3VnNvNwtg9TrQ1Q/4ZUD
         NmsLxh+r9R1QHmsAfNhl5RjD8ikKvdy2RnYoVqrZhHAnNL9e50DDzTPek2KR72J0/lGQ
         Sr6Q==
X-Forwarded-Encrypted: i=1; AFNElJ9nLJ5a7XMBBW7gdaiVP9lcqxrRStpOOiDrRVpDpnRjUidUsUBk9uaf0sPWgpDJlwyPkgxIg7tHrfwX9Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8fhH1zey6usUykqUftGL1ocUac3vVQywVlfLCGrVRBUJyf6vn
	/R6tUmAAyXADc+0sUiLxNSoRuD0+bluQFtbQkLyBAP6LP87OZu0yyetc
X-Gm-Gg: AeBDievi3VI/w8Q6F/fdSk2r2YUayAyUQE+R3HQRdOwc6tcd7hGOSEaGXJMXlmhBkEI
	OVpbToRnJqGv+0TbbqvSpj9zgILa9/pz8ZFh/JbTNCYayD6ZLzVgKyYJ69Nyn2QVJxdUkJEg5lf
	euIK+kqBAlEDBplf6QGKIMhwggGuyjuepmrAnGBai/puihX3fPQNksWXlvJRcTS1uIekDC/V+dq
	rlpIKnxiuCcSdvpZkPrSPJT9x25/B/KiMQnF92mmqjopQ0EQQOcpaaV8CptlOAN8cDdqI5f31ve
	INTjGRnZvTWUqhdKa2HPKbFfzzlAfun5S1D8VDfUM27JDNBCxKzgmU6dWpoLN4kXRNDRK3KhBBD
	lgbGzqCYlXQPyXpt1Tt0F9oAXlpqarNhM6ybZihJABcr9BvWrY2BFiAiAQSWVDuUXQrG8KVuUTi
	tDmw8qS9V7+ikuEY9+0nhSCrdnSgl7G3x710mT+ekGyGxVxzxpJiJ2ABs=
X-Received: by 2002:a05:7300:dc88:b0:2d8:c484:6b6c with SMTP id 5a478bee46e88-2d8c4846f3cmr799968eec.25.1776014684774;
        Sun, 12 Apr 2026 10:24:44 -0700 (PDT)
Received: from localhost.localdomain ([76.32.119.210])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2d80acca4c5sm5618864eec.19.2026.04.12.10.24.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Apr 2026 10:24:44 -0700 (PDT)
From: Hungyu Lin <dennylin0707@gmail.com>
To: thierry.reding@gmail.com,
	jonathanh@nvidia.com,
	skomatineni@nvidia.com,
	luca.ceresoli@bootlin.com
Cc: mchehab@kernel.org,
	gregkh@linuxfoundation.org,
	linux-media@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Hungyu Lin <dennylin0707@gmail.com>
Subject: [PATCH] media: tegra-video: tegra210: remove redundant NULL check in dequeue_buf_done
Date: Sun, 12 Apr 2026 17:24:16 +0000
Message-Id: <20260412172416.33052-1-dennylin0707@gmail.com>
X-Mailer: git-send-email 2.34.1
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
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,linuxfoundation.org,vger.kernel.org,lists.linux.dev,gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-58614-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,nvidia.com,bootlin.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dennylin0707@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: A14A23E5148
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

list_first_entry() does not returns NULL when the list is known to be
non-empty. The NULL check before list_del_init() is therefore
redundant.

Remove the unnecessary check.

Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
 drivers/staging/media/tegra-video/tegra210.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/media/tegra-video/tegra210.c b/drivers/staging/media/tegra-video/tegra210.c
index da99f19a39e7..a6606768fa03 100644
--- a/drivers/staging/media/tegra-video/tegra210.c
+++ b/drivers/staging/media/tegra-video/tegra210.c
@@ -362,8 +362,7 @@ dequeue_buf_done(struct tegra_vi_channel *chan)
 
 	buf = list_first_entry(&chan->done,
 			       struct tegra_channel_buffer, queue);
-	if (buf)
-		list_del_init(&buf->queue);
+	list_del_init(&buf->queue);
 	spin_unlock(&chan->done_lock);
 
 	return buf;
-- 
2.34.1


