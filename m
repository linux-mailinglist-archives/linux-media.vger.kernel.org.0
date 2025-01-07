Return-Path: <linux-media+bounces-24337-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B49DDA03D0D
	for <lists+linux-media@lfdr.de>; Tue,  7 Jan 2025 11:55:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 289AB3A2995
	for <lists+linux-media@lfdr.de>; Tue,  7 Jan 2025 10:55:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F1E01EF08D;
	Tue,  7 Jan 2025 10:54:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="YyyZYg/2"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E90D71E1C1F
	for <linux-media@vger.kernel.org>; Tue,  7 Jan 2025 10:54:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736247281; cv=none; b=RCsuOo5ONhc/Dg+8wEM8evHn1R7CZ96fHgGmrhJpIv0NV03XQFR5IECgelSoFQckLltQbjx5b7CXysPeCTLMOQqBMgH+gn2j5hK+kzBWenUtlQqwnlCzR7g9rUpQ5dN5b9119yzrbn+yygk/eiRan23l9lQqHwoEAPqPeikLVqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736247281; c=relaxed/simple;
	bh=hAlPOuL4YIiXg0HpbIYhah7+pVVbm4tj/0Q43k0VF20=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QbXhfUCuRvZLego4Edh5+EtOKqir7igl//gACjhkgOYKhqzD/mbY/m2wShoqeahF4YHOCgdQB8LjoHIVjVHDOZ4w21n5E/fqCdw30OJSB71TAwkVi8JgHirFn5DOqDk3Q1JYvDzu+bM0b4yhEV0uaveVZTVplgfuTM9Jg1Yq3bM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=YyyZYg/2; arc=none smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-7b6fc5bf609so1197515385a.1
        for <linux-media@vger.kernel.org>; Tue, 07 Jan 2025 02:54:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1736247279; x=1736852079; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x7AhuqiCmj982Ah3x3XQKiIUQdsA0iVwLzLzuPzwXZk=;
        b=YyyZYg/2LXoTHPab+Qn3ruxV+Qj39JIkpaDjyMXjtRQvxTsV8katWB4fkd/8Kgk9+P
         zBYuRYeJ/2VKW5jy9PFYSiDfvmvlzv+buDOlxrUVDVviYPktzINuMR+WQUf45VE8Q9Lc
         HbFRcIqnngzLTHfkwHtlcBUBegrxOJKPTbROI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736247279; x=1736852079;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x7AhuqiCmj982Ah3x3XQKiIUQdsA0iVwLzLzuPzwXZk=;
        b=ZKZCur8J4hO+zgQk9x+aetxD0xD8gVd+F1VkLvA1sJ12ggMKLgii6OwByRI8J9jDOk
         O4ZgncdUHoRChb6o9HNxTF2RGpbuzzsyEEA3/RDbyLzkDGOah6lWZFl1it4x6NsA3fIj
         rYLFfBZOFJBUuxp27u0gyCQOq4EOMPDUfKiWcBHhdSO8Z5Uh4czBY64n0mpxH55IK33/
         L62rDNwdBmfjl2ZbqbXlM78kPdDCjcQfGet5gV6/rTclYEsoMgsCAXUw2n+QcjbFaG1Y
         KLToqVBr4f/xY6SUwMrS7E/NAJmYsg7dS0ztkDnhtyEih1vml6ao+9dn+U6K3BOh/Eot
         Th2Q==
X-Gm-Message-State: AOJu0YxzsGkj1P8ATjBuaYSGQdpFUgLK48biCSH4L1CPHBRiUAdFDIkJ
	9YivUt2uaJN4yUzF0bwTZO7qHNmWr7bhMPrJfjnmsc/Jb4XkQpDe03oWz/+UWA==
X-Gm-Gg: ASbGncu5n5Qdzg1z9VXvfH4rbFxaqnfyM8EOnDvpKOw5vxeifeFaXC8iQPVhzTRvGZV
	JfVqNLOQ7geS+OtwFddrMOIItvz7wf+aMXIpoQoTnpiiujpMcD6ZTsiAwXuM5UePAfE2h4d3OFl
	K3WiE6+CQ8SAGY0pRQ56kpNVk0p1V9GDbxaXdGIEsIOeRpXh57W+R0oWDDPQH7xAaCkAmZOhnbH
	kFrpHpDpxzRdQaRtKabKQnfUZ/VYIzHbD5QMp3URypNv7SBooJafp+yKUWiuNFvVGMOxzlxAx6i
	iG7vWAYvKL6/O1wJBZEu5KZ3yeyOrcbTwEao
X-Google-Smtp-Source: AGHT+IEr1GIvCAibNT1Cus6y+TxBjy/ciNtZckuKb7ozOEXqw78URoC43V4anznqKm3gQW/t4bn6Xw==
X-Received: by 2002:a05:620a:2948:b0:7b6:cf48:ed5 with SMTP id af79cd13be357-7b9ba7168edmr9711278585a.7.1736247278981;
        Tue, 07 Jan 2025 02:54:38 -0800 (PST)
Received: from denia.c.googlers.com (172.174.245.35.bc.googleusercontent.com. [35.245.174.172])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-46a3eb30b97sm185094401cf.86.2025.01.07.02.54.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 02:54:38 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 07 Jan 2025 10:54:31 +0000
Subject: [PATCH v5 6/6] media: venus: vdec: Make the range of us_per_frame
 explicit
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250107-fix-cocci-v5-6-b26da641f730@chromium.org>
References: <20250107-fix-cocci-v5-0-b26da641f730@chromium.org>
In-Reply-To: <20250107-fix-cocci-v5-0-b26da641f730@chromium.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, 
 Vikash Garodia <quic_vgarodia@quicinc.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.13.0

Fps bigger than 0.000232829 fps, this fits in a 32 bit us_per_frame.
There is no need to do a 64 bit division here.
Also, the driver only works with whole fps.

Found by cocci:
drivers/media/platform/qcom/venus/vdec.c:488:1-7: WARNING: do_div() does a 64-by-32 division, please consider using div64_u64 instead.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/platform/qcom/venus/vdec.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/vdec.c b/drivers/media/platform/qcom/venus/vdec.c
index e160a5508154..aa9ba38186b8 100644
--- a/drivers/media/platform/qcom/venus/vdec.c
+++ b/drivers/media/platform/qcom/venus/vdec.c
@@ -484,8 +484,7 @@ static int vdec_s_parm(struct file *file, void *fh, struct v4l2_streamparm *a)
 	do_div(us_per_frame, timeperframe->denominator);
 
 	us_per_frame = max(USEC_PER_SEC, us_per_frame);
-	fps = (u64)USEC_PER_SEC;
-	do_div(fps, us_per_frame);
+	fps = USEC_PER_SEC / (u32)us_per_frame;
 	fps = min(VENUS_MAX_FPS, fps);
 
 	inst->fps = fps;

-- 
2.47.1.613.gc27f4b7a9f-goog


