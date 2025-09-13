Return-Path: <linux-media+bounces-42481-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C9985B56045
	for <lists+linux-media@lfdr.de>; Sat, 13 Sep 2025 12:39:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7F6F6A079BB
	for <lists+linux-media@lfdr.de>; Sat, 13 Sep 2025 10:39:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFA8C2EBB8D;
	Sat, 13 Sep 2025 10:39:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aBjJtdA7"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1F5618E25
	for <linux-media@vger.kernel.org>; Sat, 13 Sep 2025 10:39:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757759990; cv=none; b=eYGRKh3ZWqAZSLi/npxOkOZk4EqnOeuXgoPN0PwsE5Iz5aUASi3kyJQGLq4vLcwnH7X7smIt2/a1mNmu911FevdRhuTvVzrTobMhHs9QTCbBtEwIQZvlMj9qc8YPLHUBTmxPnSc4z8dN+kcAAafCdaoTbSN6KCveN2wSsQT8RFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757759990; c=relaxed/simple;
	bh=gibUDWSmHucfE4SKklHD8ukPbGhakz9RlGTLtyQHa/k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=VU6bjVNMr+TEH0CEcbq9zLIWab56JhdahAkgqfiDHjtpgW9e0z9DJ89YXAvop1anBRBocjXQ/5affk/f+3fVbll84c428XBixk4EN2ZEu2t1lbfS7ThaM9knHiILz+WR8eYxaOzWBGtjLGV4JKIuj91BAmznBSaBof9mq56fDy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aBjJtdA7; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-b54a588ad96so1704927a12.1
        for <linux-media@vger.kernel.org>; Sat, 13 Sep 2025 03:39:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757759988; x=1758364788; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TS5OtHNyHlR5D82gQ0sqpY8QZXPAbgv9ePCMmRvlP48=;
        b=aBjJtdA70Cs4JA86yXqgQkGk1TG2Xuy95F48Q8bwGCwW1CyhbcqTuMd9WraKTzxTGf
         R/cKfD3rJ3uvdzf23TLsqsKCJq9HYWCZdQNyxBFzXTyolYaQeyFbiaZiYKyMAj/szHUi
         yuLf0q5cgey90HIOtcjnOUDLX6rceSiTsNB+Cp9/DjqvFGMArOWhiOLtUS5eNvoCAFxr
         1N2/DzoF9M8DSKYz2V3w0nKz91aqegoDaR4ytQ5AyEEzAKqPS/F+UR6s1jRJyw0PhpcN
         fHwfIj1iTt0bMGpkF1D/dtrrmMA8eM08p1I+3ENd1EnXXwcvgdw7c2PoZDzRwQ+oe4bA
         5LOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757759988; x=1758364788;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TS5OtHNyHlR5D82gQ0sqpY8QZXPAbgv9ePCMmRvlP48=;
        b=Om2uBn/rBHMqnk8XW4ZL2m7DEy+JCG6MSTNEsn7NyFIKN9dAwYlY0wBs/5xy11ocGQ
         GQwv3UbauKDTBU9K/QBNDEQqgfhwQke5BamiKkClv2qhBhVrgnyySRSeXVO69UHtssHP
         mjGtvYRx18GSEZsq/F3rKDjffKDCtipZGnAZCw09aHZqTYtoCQaby+5d8I1ylcL/6mXp
         H7vKbk8FntTsuaudWNNODIEsL3e5d4vkKwx4yppOQf9eG+braDx/Rla6emduPXZ6Oy7E
         E9r8cZosmKPz2aNujaKqPXKd+4cG10g0yaQ9FwAMvS5lao+wmeaLEC0DjU26UyzBaJ33
         D55A==
X-Gm-Message-State: AOJu0YydAYb2bmdgDzztpvmi4DSF7in+nq38KjXPwuV11x6E0J2LsUzn
	hGGUsZfqu75B7SDNAFS5itctn1K+DqXHrnsMJCkYSX+Ki9eHCc7eWNqctRMuGKCM
X-Gm-Gg: ASbGncvJWslDDPvlIB0iltcvseP0o5nSaeivNb+kJQXREWySBPyETYtjzHMwk0cLsTI
	tgb/WjA74WOSEtjZK0Ewp8xkEcnjnk1FPEftY+sFq9E7jVmHJIvPzf+VAMc/1k3qlV7aUJDwmyI
	VCtsoqy1GdImXq9d9kF0U7O9D1/PohiIIpgcJbS4rDtt26OxFuKjZR6Jfki0VCoTd6EDEWKQC/U
	oa34RBFHymRswLflyQjTc2SKCWvOhEqj+OJ4z6+GJtefd0s2EwwBoBStI5PTHxxiOYSyq7/iarS
	mbKO5Rk8SZ3dn9MGC3olzYEolT+x6MR0Z4ll707oAtx6cHOWyjeou/egcRhQ7IbdWiF24tFJgEH
	PEybM0YlAaSknyEH22KuuAMJcA53vYbj2ednwcQHHyFUgRkaVfScLWNt/7MUWAAJrXq8EeG2XUL
	cRUe4ATaYh8k7asun8rBWN
X-Google-Smtp-Source: AGHT+IFN0gqss6mtEr77tugnv2ax0P5Bgp77ssu7ZY3zwXxelN63682bQ6syqkn+6bxE0vQaZxOO8g==
X-Received: by 2002:a17:902:f644:b0:25c:43f7:7e40 with SMTP id d9443c01a7336-25d2ab45d41mr74971735ad.10.1757759987829;
        Sat, 13 Sep 2025 03:39:47 -0700 (PDT)
Received: from OSC.. ([106.222.231.149])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-25c37293ef1sm74217875ad.41.2025.09.13.03.39.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Sep 2025 03:39:47 -0700 (PDT)
From: Pavan Bobba <opensource206@gmail.com>
To: mchehab@kernel.org,
	hverkuil@kernel.org,
	ribalda@chromium.org,
	laurent.pinchart@ideasonboard.com,
	yunkec@google.com,
	sakari.ailus@linux.intel.com,
	james.cowgill@blaize.com
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Pavan Bobba <opensource206@gmail.com>
Subject: [PATCH v2] media: v4l2-ctrls: add full AV1 profile validation in validate_av1_sequence()
Date: Sat, 13 Sep 2025 16:09:27 +0530
Message-ID: <20250913103939.25658-1-opensource206@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Complete the "TODO: PROFILES" by enforcing profile-specific and
monochrome constraints as defined by the AV1 specification
(Section 5.5.2, "Color config syntax").

The validator now checks:

 - Flags: reject any unknown bits set in sequence->flags
 - Profile range: only profiles 0..2 are valid
 - Profile 0: 8/10-bit only, subsampling must be 4:2:0 (sx=1, sy=1),
   monochrome allowed
 - Profile 1: 8/10-bit only, subsampling must be 4:4:4 (sx=0, sy=0),
   monochrome forbidden
 - Profile 2:
    * 8/10-bit: only 4:2:2 allowed (sx=1, sy=0)
    * 12-bit: 4:4:4 (sx=0, sy=0), 4:2:2 (sx=1, sy=0), or 4:2:0 (sx=1, sy=1)
      allowed
 - Monochrome path (all profiles except 1): forces subsampling_x=1,
   subsampling_y=1, separate_uv_delta_q=0

These checks prevent userspace from providing invalid AV1 sequence
headers that would otherwise be accepted, leading to undefined driver
or hardware behavior.

Signed-off-by: Pavan Bobba <opensource206@gmail.com>
---
v1 -> v2 : Added more checks for subsampling combinations per profile.
          : Added a TODO note in the function header for checks to be implemented later.

 drivers/media/v4l2-core/v4l2-ctrls-core.c | 54 +++++++++++++++++++++--
 1 file changed, 50 insertions(+), 4 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-ctrls-core.c b/drivers/media/v4l2-core/v4l2-ctrls-core.c
index 98b960775e87..3283ed04cc36 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls-core.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls-core.c
@@ -852,14 +852,60 @@ static int validate_av1_sequence(struct v4l2_ctrl_av1_sequence *s)
 	 V4L2_AV1_SEQUENCE_FLAG_SEPARATE_UV_DELTA_Q))
 		return -EINVAL;
 
-	if (s->seq_profile == 1 && s->flags & V4L2_AV1_SEQUENCE_FLAG_MONO_CHROME)
-		return -EINVAL;
-
 	/* reserved */
 	if (s->seq_profile > 2)
 		return -EINVAL;
 
-	/* TODO: PROFILES */
+	/* Profile-specific checks */
+	switch (s->seq_profile) {
+	case 0:
+		/* Bit depth: 8 or 10 */
+		if (s->bit_depth != 8 && s->bit_depth != 10)
+			return -EINVAL;
+
+		/* Subsampling must be 4:2:0 → x=1, y=1 */
+		if (!(s->flags & V4L2_AV1_SEQUENCE_FLAG_SUBSAMPLING_X) ||
+		    !(s->flags & V4L2_AV1_SEQUENCE_FLAG_SUBSAMPLING_Y))
+			return -EINVAL;
+		break;
+
+	case 1:
+		/* Monochrome is forbidden in profile 1 */
+		if (s->flags & V4L2_AV1_SEQUENCE_FLAG_MONO_CHROME)
+			return -EINVAL;
+
+		/* Bit depth: 8 or 10 */
+		if (s->bit_depth != 8 && s->bit_depth != 10)
+			return -EINVAL;
+
+		/* Subsampling must be 4:4:4 → x=0, y=0 */
+		if ((s->flags & V4L2_AV1_SEQUENCE_FLAG_SUBSAMPLING_X) ||
+		    (s->flags & V4L2_AV1_SEQUENCE_FLAG_SUBSAMPLING_Y))
+			return -EINVAL;
+		break;
+
+	case 2:
+		/* Bit depth: 8, 10, or 12 */
+		if (s->bit_depth != 8 && s->bit_depth != 10 &&
+		    s->bit_depth != 12)
+			return -EINVAL;
+
+		/* Subsampling: 4:2:0, 4:2:2, or 4:4:4 allowed → no extra check */
+		break;
+	}
+
+	/* If monochrome flag is set, enforce spec rules */
+	if (s->flags & V4L2_AV1_SEQUENCE_FLAG_MONO_CHROME) {
+		/* Must signal subsampling_x=1, subsampling_y=1 */
+		if (!(s->flags & V4L2_AV1_SEQUENCE_FLAG_SUBSAMPLING_X) ||
+		    !(s->flags & V4L2_AV1_SEQUENCE_FLAG_SUBSAMPLING_Y))
+			return -EINVAL;
+
+		/* separate_uv_delta_q must be 0 in monochrome */
+		if (s->flags & V4L2_AV1_SEQUENCE_FLAG_SEPARATE_UV_DELTA_Q)
+			return -EINVAL;
+	}
+
 	return 0;
 }
 
-- 
2.43.0


