Return-Path: <linux-media+bounces-60854-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UD0zF8n9/GmxVwAAu9opvQ
	(envelope-from <linux-media+bounces-60854-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 07 May 2026 23:02:01 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 085494EF16A
	for <lists+linux-media@lfdr.de>; Thu, 07 May 2026 23:02:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 21F563079095
	for <lists+linux-media@lfdr.de>; Thu,  7 May 2026 20:58:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72422340286;
	Thu,  7 May 2026 20:58:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="DLTF2boo"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 427ED33F5AA
	for <linux-media@vger.kernel.org>; Thu,  7 May 2026 20:58:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778187495; cv=none; b=FYU8+Q0TB0JYXWI+WNHGK7lMFXGgTmoKK9v8E6vGB0w28+pNhbYmpfaS9R6zyMNZX9f+YiEUuTtlJY8EQKE0sRhD3+R+fGbExVZfCjGLoTc3JQDJ2xJjFzHXQyvJyFIOTE8es0IehthPqrg7FT/aSrOUKUP8nsiVSiT43ETPhdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778187495; c=relaxed/simple;
	bh=o1JBoNSnmeENnVyJCFBJK54WhchLIrjvMvIxsKS/SXc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eSLPPrckQHIoiD0h50osbEsT9asf6L/GvpnysfH3LbGoJ1efnU3K5Zz8MVUSWSN/mIItWNG4x0n96k5rmTNpwBerEyKFTi1ZLZvJ+FB3NuKDzujAt3bZrkBQBWPqyay3brGhsBKNdf0KiRjwnhNuoi3c7GGYU2N0wP0KdhyGsBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=DLTF2boo; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-38e7b0903cdso11902981fa.3
        for <linux-media@vger.kernel.org>; Thu, 07 May 2026 13:58:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1778187492; x=1778792292; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cK+Nktca7F+6iN68JEbLhEZKpbc6Uv2OrCKSJ0NIVg8=;
        b=DLTF2booHQxiOylxu1wdqSJbHWDN8qX8MtjuaWwV8OopM/pBRNAhJU0clXm+NNfFKi
         aq77bVfKQu2lnCOzYskWa+n8+EEJ9thddp+YwnZejg2dtckwSJUPSONx1rjBqdzSpzg0
         hpBGxVIcIUecj4mAqvU6PQxvDWCpyX+tuNLn4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778187492; x=1778792292;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cK+Nktca7F+6iN68JEbLhEZKpbc6Uv2OrCKSJ0NIVg8=;
        b=pT6m58VS2WOw6OJGFK8t0x7Ci9qpyIfKvVUWMH/2FvfyNXf8rqbTUTuoMypWw3XHp4
         +CWCzAvyYIqvnQT4OpBe/g9cm+eSzZQiXHtEEXneemJ/IiIXhJ4+x4RM2x6vfxClPTH3
         Ig92EkW6wXuJfelINxv21PQ12nJm2txZn2V5NzEFugb4SPvZCMr0IvLmWEgm2Qus5BsP
         nkKVhRdZXJfeZD4gVTGAKwEgcPFUmm6TARNP71gB/vtK6g4+EnmwjvmlgEX0wsHZ0wKj
         kIOqwQiXVPAty3dU9uzR4NVaTSxF0+fSosoChsMbQ8bpQYuojoH5lYL8Zv8wGtX7gSDI
         GGgA==
X-Gm-Message-State: AOJu0YydGPsOVSkJfmxLEcnwgIlmzMQcNtcnqWRuvZBzLD57HxUxu9f3
	c/KAKPqhU+W8RN7sQnD6HrIOuO9pedGgn/c7YyM5ffbf5eL962ksLkeFMIW9KXIDpw==
X-Gm-Gg: AeBDievL5zlWZeAvckWPl5LZ15mS+C591LeIVBClimWhiEtxJmmewcH+KPk759mVbgU
	vyj9DVnZpPF/Qda9MF5f5uIuOmpAGzT/j1jOKQwzwR9Wm7ypppEVh0Yrj/N3UGBSZ5v4HayiljV
	VC0eptspBKQERNaf8y04khMlO3I5fIMiHDLg2wXOUJ7goavS7XlK+ShoJqaQl94v/FsDcng/K6p
	7h1jhzSYrNIA6b65RXpXm4U4WV8+mQlg9wWr+RiJngPNiUb/EgE84BqZKShRTZXndnBclt87tph
	UvjZ3TYFNhYHfhPkA6AjoSurbLM2Xz66qd6wp6FNfUk/5pR6QUJ81Ool/8TaVUf0vox0Tzlkw9+
	0dviwHlRpZfrYsAuzG8zeUd1s/GIgOJpMEr7jwqoJPNNtLQcDpmVa4BeS2TwXGUeje9lVRkOW3X
	azfcgq3JrlsLywP3XDdq/nMT+Nzuh1Cb0OsG+imaAk6xcvJp12whKtlXLP6cyngasptBzXUtaMI
	uR/yiRPXuQL3JVa0A==
X-Received: by 2002:a2e:a273:0:b0:38c:de21:3e14 with SMTP id 38308e7fff4ca-393c41c97demr25930941fa.19.1778187492474;
        Thu, 07 May 2026 13:58:12 -0700 (PDT)
Received: from ribalda.c.googlers.com (52.163.228.35.bc.googleusercontent.com. [35.228.163.52])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-393eee53655sm2325571fa.0.2026.05.07.13.58.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 13:58:10 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Thu, 07 May 2026 20:58:06 +0000
Subject: [PATCH v4 1/6] media: v4l2-dev: Add range check for vdev->minor
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260507-smatch-7-1-v4-1-cc195f142167@chromium.org>
References: <20260507-smatch-7-1-v4-0-cc195f142167@chromium.org>
In-Reply-To: <20260507-smatch-7-1-v4-0-cc195f142167@chromium.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Hans Verkuil <hverkuil@kernel.org>, Nas Chung <nas.chung@chipsnmedia.com>, 
 Jackson Lee <jackson.lee@chipsnmedia.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Keke Li <keke.li@amlogic.com>, Yong Zhi <yong.zhi@intel.com>, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-staging@lists.linux.dev, 
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, 
 Ricardo Ribalda <ribalda@chromium.org>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: b4 0.14.3
X-Rspamd-Queue-Id: 085494EF16A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[chromium.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[chromium.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	TAGGED_FROM(0.00)[bounces-60854-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[chromium.org:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ribalda@chromium.org,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,samsung,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action

If the fixed minor ranges are not properly set we could end up in a
situation where the calculated minor is invalid. Add a check for this in
the code to make it more robust.

This check also fixes the following false positive smatch warning:

drivers/media/v4l2-core/v4l2-dev.c:1036 __video_register_device() error: buffer overflow 'video_devices' 256 <= 288
drivers/media/v4l2-core/v4l2-dev.c:1043 __video_register_device() error: buffer overflow 'video_devices' 256 <= 288
drivers/media/v4l2-core/v4l2-dev.c:1101 __video_register_device() error: buffer overflow 'video_devices' 256 <= 288

Reviewed-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/v4l2-core/v4l2-dev.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-dev.c b/drivers/media/v4l2-core/v4l2-dev.c
index 6ce623a1245a..5516b2bbb08f 100644
--- a/drivers/media/v4l2-core/v4l2-dev.c
+++ b/drivers/media/v4l2-core/v4l2-dev.c
@@ -1032,6 +1032,11 @@ int __video_register_device(struct video_device *vdev,
 	vdev->minor = i + minor_offset;
 	vdev->num = nr;
 
+	if (WARN_ON(vdev->minor >= VIDEO_NUM_DEVICES)) {
+		mutex_unlock(&videodev_lock);
+		return -EINVAL;
+	}
+
 	/* Should not happen since we thought this minor was free */
 	if (WARN_ON(video_devices[vdev->minor])) {
 		mutex_unlock(&videodev_lock);

-- 
2.54.0.563.g4f69b47b94-goog


