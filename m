Return-Path: <linux-media+bounces-54263-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WO8WLm6fpmk4SAAAu9opvQ
	(envelope-from <linux-media+bounces-54263-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 03 Mar 2026 09:44:30 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 65CBC1EAFC3
	for <lists+linux-media@lfdr.de>; Tue, 03 Mar 2026 09:44:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 262AF30B19CF
	for <lists+linux-media@lfdr.de>; Tue,  3 Mar 2026 08:43:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4AA1938C2B0;
	Tue,  3 Mar 2026 08:42:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fc/g0y3x"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8706388E50
	for <linux-media@vger.kernel.org>; Tue,  3 Mar 2026 08:42:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772527377; cv=none; b=ZaKFRav35e7WyG/1iLAoOMBm5kXP4X3dUIqhk/NBSsChgWEgSqB+fD5ERcsKrDPOCqKfY5FvSqayfKSKgPsGFnbGQmcws22wIt8ergZqUrB1x7Zo9/YKvAWZNgza/iEtew7fzJVnyvG9px3u/C0E06XJRsrgKUEIhBWzKVhaQpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772527377; c=relaxed/simple;
	bh=IzB8EsMSPw3QzBXaG2KwfOAPPaeXySttkLghuqSdNAs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gCbzm+Mpv+58UVBD2YZo4oG7jl7yR08sUenqrmsEr6vYUEc9OgB31knypcTiQvnldkqScAVS7kgcUpwqlt7+SQqv7+nEbwD7oOMz4+fDYQbEhttlg6S/pRqTJdDSC9anipgkQd6+3U4vV5XFHZe8MQ1FVS6hxbpczR6G+4fyPrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fc/g0y3x; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-389ebb0e885so102560351fa.1
        for <linux-media@vger.kernel.org>; Tue, 03 Mar 2026 00:42:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772527373; x=1773132173; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pid8l3oxr/AZHZz4pdBIzX1rDMW/6jLdB7pjgw7arVo=;
        b=fc/g0y3xFpyycAlk+OdVU8lkyJNTqGYwYHpnSi6QusmaAarrZEcU/4Tzd7nEosXujm
         eJa1nP6Z2U6lj79dL0rZKSwIK4Sjc35/kRMAC6Cfz7KnZns72eaUYWaNiw6sKjs4vAO1
         wTc0yFtrztfdp/6sjx8Yz4BrSLstmGjH2V1fe3G2W+Bq8V21TMNEIu+i/WuGzuFjmBlC
         b/aCWfS8nkZHDfZKC8naZBKJgQwqGkz+SbekRRUd3LZ8UJAsS8NPCpDt4uuQQKupqygJ
         RbRBYOYW2givMifxNR5cVgQeN5MFXIWJ3AXr2xBRtYnFTp8o73FnPwSPD+DMJ/BnvdJJ
         5zGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772527373; x=1773132173;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Pid8l3oxr/AZHZz4pdBIzX1rDMW/6jLdB7pjgw7arVo=;
        b=H9yycQoDwf/xXV6dvjfk/av8C5anAPC0y++XVDR6vPYEknTJuNs5MyqeUXuZZ2w1q5
         546YOsG8ZoL1TJhdb3ededFTRRN1HZdK+54VxScyAaygnQ9dD1PmF9up5Lg0psi76c2B
         4PAj3+S+v4mCqkPBvGBqimBIXlNkvvAxPmLp7enFIXzbfUZaEqFx6Xc7wVHx/MjZeoKA
         IMYIwMS1Dp3Cg6+mv0VZ3FxdSrppDotp+coyxJUsTRgFfSQ1kOmlKXRFkY7XLFICMXjs
         c1bjb3u7Rs+yj/hbj4p2Bv1uEj86K+SCTV5uYOtsUtJPmo0rMqA24yMpJUUZG9EW/Rew
         ArZg==
X-Forwarded-Encrypted: i=1; AJvYcCUBpWLUSYans8ueXXfo7yJh/UFk6B+hvOXXxn6tOEUXbb8wBeGb9TlWZK2Ff0EVZSXsUDf/w3uZgF4ZCA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5t3fyoBteH5Wkdu1QvP5s4kJ/rAGjtq6vsB3d3cCIycjX1HhL
	iRnqs7OVri84nGTZcU8jXGljekwjAiLTv9y0aoQS3kZ56EiAiqEDVlhU
X-Gm-Gg: ATEYQzyvLs0ke6Obuzs2wEj6knqsYYSVAxfT08+kE/w0lxXHhXNd9dJQ2dVs1EPwmqz
	0TlTduviM6AymsKMlVVZYyOpDV817YdlvvafrALRrJzoW3uLmxav2cQv60FNDBqd1c2jsKgaeVU
	TRs0O25GZ9hAzfU2iMewvdGRAG4OIpZvijmMFzkT2eva2vDDV7kOp3SgjGkXceGbICQn3llHuqK
	vEu2sJlgzsnzb2eIQoEd0fzDclHm/9a3QnzbThbKEvBpLo9n9zH9pEho7mrAR8HyX9ElVad2/9L
	UN8v3pTaA0U99W/qgbBzebfayF7r5sHO8CyWUCWA1h553xkuS4S+J/KHgBvzZmKSPj5U/0peh2j
	lFNY6peguxcibED1aSnNzg0+u4JGyQus7hO1iAmipNWovxDZ6x2ohu2m4wrXA5xdJytn97H8t3P
	8+3XV9SN19RohD
X-Received: by 2002:a2e:bc1d:0:b0:38a:957:a125 with SMTP id 38308e7fff4ca-38a0957a856mr72649181fa.18.1772527373025;
        Tue, 03 Mar 2026 00:42:53 -0800 (PST)
Received: from xeon ([188.163.112.72])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-389f30227a9sm32599471fa.42.2026.03.03.00.42.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 00:42:52 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
	Thierry Reding <treding@nvidia.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-tegra@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v7 02/15] staging: media: tegra-video: vi: adjust get_selection operation check
Date: Tue,  3 Mar 2026 10:42:25 +0200
Message-ID: <20260303084239.15007-3-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260303084239.15007-1-clamor95@gmail.com>
References: <20260303084239.15007-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 65CBC1EAFC3
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-54263-lists,linux-media=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,nvidia.com,ffwll.ch,bootlin.com,kernel.org,linuxfoundation.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[17];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,bootlin.com:email]
X-Rspamd-Action: no action

During __tegra_channel_try_format, the VI (Video Input) checks if the
camera sensor driver provides a get_selection operation. If this operation
is unavailable, the crop is set to 0. However, if the operation is
available but returns an error, the VI currently fails.

While this works for simple cameras with a single pad, it creates a corner
case for sensors like the mt9m114. This sensor provides the same operation
set for both IFP pads, but returns an error when get_selection is called
on an unsupported pad (such as the source pad), causing the aforementioned
behavior.

To resolve this, if get_selection is implemented but returns an error,
try_crop is now set to 0 — treating it as if the operation was not
implemented — instead of returning a failure.

Tested-by: Luca Ceresoli <luca.ceresoli@bootlin.com> # tegra20, parallel camera
Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/staging/media/tegra-video/vi.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/media/tegra-video/vi.c b/drivers/staging/media/tegra-video/vi.c
index a7892036f29e..e0961bc0a017 100644
--- a/drivers/staging/media/tegra-video/vi.c
+++ b/drivers/staging/media/tegra-video/vi.c
@@ -476,17 +476,11 @@ static int __tegra_channel_try_format(struct tegra_vi_channel *chan,
 	fse.code = fmtinfo->code;
 	ret = v4l2_subdev_call(subdev, pad, enum_frame_size, sd_state, &fse);
 	if (ret) {
-		if (!v4l2_subdev_has_op(subdev, pad, get_selection)) {
+		if (!v4l2_subdev_has_op(subdev, pad, get_selection) ||
+		    v4l2_subdev_call(subdev, pad, get_selection, NULL, &sdsel)) {
 			try_crop->width = 0;
 			try_crop->height = 0;
 		} else {
-			ret = v4l2_subdev_call(subdev, pad, get_selection,
-					       NULL, &sdsel);
-			if (ret) {
-				ret = -EINVAL;
-				goto out_free;
-			}
-
 			try_crop->width = sdsel.r.width;
 			try_crop->height = sdsel.r.height;
 		}
-- 
2.51.0


