Return-Path: <linux-media+bounces-53972-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MA+HFuWco2l2IQUAu9opvQ
	(envelope-from <linux-media+bounces-53972-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 01 Mar 2026 02:56:53 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E96D71CC54D
	for <lists+linux-media@lfdr.de>; Sun, 01 Mar 2026 02:56:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5983730BF87D
	for <lists+linux-media@lfdr.de>; Sun,  1 Mar 2026 01:51:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24C9E2E7657;
	Sun,  1 Mar 2026 01:49:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DXvUuUp+"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ABBB2F546D;
	Sun,  1 Mar 2026 01:49:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772329771; cv=none; b=Mt+auuDKyWaHly2cggVxRm/W62qvtFRgXmVpyqOXO+N7lyTQh+EaYQ4lqyKaV/TeN+jFZrrPLr6bZRTgPz440iSShAagqJsFqlldmatcgNtnYXPuhNbSBgy/iR5pbVvEtFrMknJmKGk7s1mQbZaD4LYMU5tliN/WK9N1vTovsYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772329771; c=relaxed/simple;
	bh=C3hC+5gSI1mjnu1NL+XNUtCOjr/KInTEbkisA7ssOJg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tTCl0adyEwdxOq5NkcDDeHhgwcAGaBa8OCGUliKCjDUK27bM45CdI/CruvsA5NEF5xDgH2XQ4odyoOaaFqHQHl00XuufoI7IXhb+NII1G70vmYNN8d3CgURnNGxqzRbCwhwcEbaQDMWwoUWyZaSwu91hfJ0uRSbbclbNRlcGPAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DXvUuUp+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2628C2BCAF;
	Sun,  1 Mar 2026 01:49:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772329771;
	bh=C3hC+5gSI1mjnu1NL+XNUtCOjr/KInTEbkisA7ssOJg=;
	h=From:To:Cc:Subject:Date:From;
	b=DXvUuUp+Bxglptp9kHgkNuXxuFRWXc+0Lt6N0V9RDEmPc5HoYkIRewk389AFdhWOh
	 XQ5iAiP91qmgjLwqHa5RfWRYIy+WRXPFk0v8J49nYmaBdUCXUOFn7+lHo2KGbMYTER
	 5q+9Lhnv9rxzAINIfHPEYJKmaMielOHHQJwKhCDYG3JQrKUa4bTNRuC46ZJRhes64g
	 11MwQEQkh3L5Ohmt1y9BL7a8YjnQZ49dqukBR/AaY4uM6p2EHjl3mNpHPu/0ReVuhF
	 CtZA/eCo6LVcW6Ym7JFJ0iCZEmEemsaelbxLUVzk/uIrmQsX/1k2KKkur6KAMjgtFB
	 Q8ldDSzpDu5ug==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org,
	zilin@seu.edu.cn
Cc: Hans Verkuil <hverkuil+cisco@kernel.org>,
	linux-media@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: FAILED: Patch "media: tegra-video: Fix memory leak in __tegra_channel_try_format()" failed to apply to 5.15-stable tree
Date: Sat, 28 Feb 2026 20:49:29 -0500
Message-ID: <20260301014929.1714007-1-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Patchwork-Hint: ignore
X-stable: review
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-53972-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashal@kernel.org,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-0.998];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,seu.edu.cn:email]
X-Rspamd-Queue-Id: E96D71CC54D
X-Rspamd-Action: no action

The patch below does not apply to the 5.15-stable tree.
If someone wants it applied there, or to any other stable or longterm
tree, then please email the backport, including the original git commit
id to <stable@vger.kernel.org>.

Thanks,
Sasha

------------------ original commit in Linus's tree ------------------

From 43e5302d22334f1183dec3e0d5d8007eefe2817c Mon Sep 17 00:00:00 2001
From: Zilin Guan <zilin@seu.edu.cn>
Date: Fri, 14 Nov 2025 09:12:57 +0000
Subject: [PATCH] media: tegra-video: Fix memory leak in
 __tegra_channel_try_format()

The state object allocated by __v4l2_subdev_state_alloc() must be freed
with __v4l2_subdev_state_free() when it is no longer needed.

In __tegra_channel_try_format(), two error paths return directly after
v4l2_subdev_call() fails, without freeing the allocated 'sd_state'
object. This violates the requirement and causes a memory leak.

Fix this by introducing a cleanup label and using goto statements in the
error paths to ensure that __v4l2_subdev_state_free() is always called
before the function returns.

Fixes: 56f64b82356b7 ("media: tegra-video: Use zero crop settings if subdev has no get_selection")
Fixes: 1ebaeb09830f3 ("media: tegra-video: Add support for external sensor capture")
Cc: stable@vger.kernel.org
Signed-off-by: Zilin Guan <zilin@seu.edu.cn>
Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
---
 drivers/staging/media/tegra-video/vi.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/media/tegra-video/vi.c b/drivers/staging/media/tegra-video/vi.c
index c9276ff76157f..14b327afe045e 100644
--- a/drivers/staging/media/tegra-video/vi.c
+++ b/drivers/staging/media/tegra-video/vi.c
@@ -438,7 +438,7 @@ static int __tegra_channel_try_format(struct tegra_vi_channel *chan,
 		.target = V4L2_SEL_TGT_CROP_BOUNDS,
 	};
 	struct v4l2_rect *try_crop;
-	int ret;
+	int ret = 0;
 
 	subdev = tegra_channel_get_remote_source_subdev(chan);
 	if (!subdev)
@@ -482,8 +482,10 @@ static int __tegra_channel_try_format(struct tegra_vi_channel *chan,
 		} else {
 			ret = v4l2_subdev_call(subdev, pad, get_selection,
 					       NULL, &sdsel);
-			if (ret)
-				return -EINVAL;
+			if (ret) {
+				ret = -EINVAL;
+				goto out_free;
+			}
 
 			try_crop->width = sdsel.r.width;
 			try_crop->height = sdsel.r.height;
@@ -495,14 +497,15 @@ static int __tegra_channel_try_format(struct tegra_vi_channel *chan,
 
 	ret = v4l2_subdev_call(subdev, pad, set_fmt, sd_state, &fmt);
 	if (ret < 0)
-		return ret;
+		goto out_free;
 
 	v4l2_fill_pix_format(pix, &fmt.format);
 	chan->vi->ops->vi_fmt_align(pix, fmtinfo->bpp);
 
+out_free:
 	__v4l2_subdev_state_free(sd_state);
 
-	return 0;
+	return ret;
 }
 
 static int tegra_channel_try_format(struct file *file, void *fh,
-- 
2.51.0





