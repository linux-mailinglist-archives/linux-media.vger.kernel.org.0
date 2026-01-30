Return-Path: <linux-media+bounces-51827-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cA2sMAqpfGnuOAIAu9opvQ
	(envelope-from <linux-media+bounces-51827-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 30 Jan 2026 13:50:18 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id C9269BAAB2
	for <lists+linux-media@lfdr.de>; Fri, 30 Jan 2026 13:50:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D0C15300681E
	for <lists+linux-media@lfdr.de>; Fri, 30 Jan 2026 12:50:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E40737F0F2;
	Fri, 30 Jan 2026 12:50:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QIf2q0LT"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D92A37F0FD
	for <linux-media@vger.kernel.org>; Fri, 30 Jan 2026 12:49:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769777400; cv=none; b=jwakJp5DRCnBD7hrRWoF0kwJINEu0OA8RD4MDEjwUQivFZBcVwY5YBQUevmE9aGTcR8iIQ2XVJymSaAzbl6KO8kVQRsUGw1b23IYHxcnvAp2JnALs8mnTDc++SlT0gFR7DbfO4g/fo5xFLlVvtai7oTKmGTWbuPgZ+FXjxjqj8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769777400; c=relaxed/simple;
	bh=/SlcgcoXh6qESEbxV+NcpVqvXpkWkqApdJg+bzGWNTg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OxvKMBzFpJ78Sk8Pz9eL3J88Rnjh4+FGVhUrYiySvwjgCkh6aoV411QxFpdjkF/psxMLX+z2sMvXcO61sTNDG5gAPYGnq6yyK2bGHh1TdvR9bOCXYt4yXrbiNzs2q7PvjJ7NJ+tRM9q4e5FZKZe3P0/zZ3xfp40+Y03Q1hpPFDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QIf2q0LT; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4801bc32725so15787485e9.0
        for <linux-media@vger.kernel.org>; Fri, 30 Jan 2026 04:49:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769777397; x=1770382197; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FDyuTxJQ2wPWDIlHnScBHP39ldpO6z/HRmLWZsSUiWM=;
        b=QIf2q0LTJikh21uLKDT1MMoq0ewo3Fi0t2yjMv+M1Yj/t+pNu7VGQK61Bfd2GH1+s9
         bHKEF0NzMYHX7kmjWnWHy62tYfBEFvbVofvRS+9mgkI+0kY2JoLslZf9TgrXwGfI9szY
         w+bxkBWihfkTUtrYqAtchcCEdA78cbi+05fLyPYkxYTDcWA47uBWmXuGg5TgXeNaxxGz
         Lbih4T8X9fDIm+dSkFHKhvo0G1/04KOeusmcF2kPoZcVnd+hd3F2ratVsuOV7AyD9Z51
         OoEZLClTc3KOr9d/LOCEYOi57k0MWfRAt8XWc1FVUPTJQm6T/uSnM4d4vx8FxIhc/l5H
         C4zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769777397; x=1770382197;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FDyuTxJQ2wPWDIlHnScBHP39ldpO6z/HRmLWZsSUiWM=;
        b=N+X12h9AxuGrzjUs5TKdiEzW+peqTVtUYxJrhkdm2ftrbCPzzo0FryuTxi+mf+E1f4
         S79XVzmNaKSeUpeUlIlJnI6tBskYWNMYNRM2iaAz/5Ob8DjALhLYabaQ/eBd0JDG9r65
         VMELBAcAgS8d2X1YCReO5xaCnqMERIWsDg+MJXiVhYnYLAFZ9eqQ1uLd7vR83Um3q+Nb
         Qtyew6kOM3oiXN7D5bqpQPtrdXAgK/VlixrTEwUlsO38kzfUgiHjSpE3czv6QVU+MvE5
         wR151hpIqT266GHbP5VGtvWsNHy9eCCWEYXfhV7R+GpOPnogwMHl/Dtwss3hxpHFaJMy
         myww==
X-Forwarded-Encrypted: i=1; AJvYcCVUZvHMWPfIV3zJrzyGdfgGQWEnWZkXVqfK8p2jUgplBQFGSWeDdVSBZtqNCHHwhCGC72C4dc8E5VK7og==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6mhVXpvcL7C61KK/NHDd5/MBL7OzuVPYDu5oThWI1pSU5f11o
	LrwBN5HbXIvWG75o/5NxMtBQSvNNmT1j81wRFcYXsbI29SHh0oKwIEpn
X-Gm-Gg: AZuq6aJYafxHHtOyg5C6HL3r0q+XNIilFL5q2KUM+VfYg2EcF1pAz+87V/dkBZz1PS8
	ZAdfyLytuSl140omG7i4yeEf6Pip8ef/QvY/5fuJV9/asATpfQ55vRtSoyQDn5h8M3nSfuUWKcs
	0DnYh5jnbznnG7uT1Ch4hEC0qIKBAcTBzgiFRtbIoKYMntGn2pa8CSFAyrm/EBAtSXb3ZhPXOaV
	GP+tNB9k9mKTCK42z6bZ0udQ81Pfx1OR3tARG1T0Ru4OFfCGbJnQOythnmSLOQMB7FX+1R77p8B
	+Y0BJ09Yx2FTnAQLSkseHpWCYmaX35w0JmFPre6sNqhn6QRujx254t1lh42n//Dr2JLOK2QAG2g
	RoVyviuk5SZtPZSL7O1P7VSvXMRu7RClTvWeA3hrktBrYAfkwmh6K4rvCRIwudk9LV3xrOTBNy0
	LSPDAKVl2qCl0=
X-Received: by 2002:a05:600c:a00e:b0:477:63db:c718 with SMTP id 5b1f17b1804b1-482db4bda8dmr37743845e9.16.1769777396741;
        Fri, 30 Jan 2026 04:49:56 -0800 (PST)
Received: from xeon ([188.163.112.49])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e10e4757sm22738783f8f.5.2026.01.30.04.49.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jan 2026 04:49:56 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
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
Subject: [PATCH v6 02/15] staging: media: tegra-video: vi: adjust get_selection operation check
Date: Fri, 30 Jan 2026 14:49:19 +0200
Message-ID: <20260130124932.351328-3-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260130124932.351328-1-clamor95@gmail.com>
References: <20260130124932.351328-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-51827-lists,linux-media=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,nvidia.com,ffwll.ch,bootlin.com,kernel.org,linuxfoundation.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[16];
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
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:email]
X-Rspamd-Queue-Id: C9269BAAB2
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
index 4b80086f8c05..70a84158b589 100644
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


