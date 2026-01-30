Return-Path: <linux-media+bounces-51797-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gMklMSYYfGk/KgIAu9opvQ
	(envelope-from <linux-media+bounces-51797-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 30 Jan 2026 03:32:06 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id E39EBB6795
	for <lists+linux-media@lfdr.de>; Fri, 30 Jan 2026 03:32:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 107663006B6B
	for <lists+linux-media@lfdr.de>; Fri, 30 Jan 2026 02:32:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B3003328ED;
	Fri, 30 Jan 2026 02:32:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=u-northwestern-edu.20230601.gappssmtp.com header.i=@u-northwestern-edu.20230601.gappssmtp.com header.b="FPRLMATv"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com [209.85.161.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83D8E1E5B94
	for <linux-media@vger.kernel.org>; Fri, 30 Jan 2026 02:31:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769740321; cv=none; b=nv8S7utU+z1iqXVhPAjJr9BbGRrQwh5dhQLXSFoE6met0uWHG5gQ/HMDtFLC2wNKL0OX4p/CSMUHP4qy0yJc9/wDEcr9CMgbkyLcvVVjVsI4niJEPCuhyMrhM1OoiOD66XSiY4vO7CkdWYgmImHMoPorYwy3mPFZue2hInl0Byo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769740321; c=relaxed/simple;
	bh=RlewUzsQnqRK/BfOkyEUTMO9ubuuVXujIi0e82Y7LD0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=NtslhsBgsXlxwUvgUBFRe90K7bTg5fb+NVX8JCXMkflX0/05LuUSmSLdUhl71EEB1TcAk1a/MClOfE/pLT8SkPcROhP+XRKSM1lXp3b7FsUQGdkgDaHdPFwBTSerK8SJGbN1yQ886p1vzkI6mGKQOkekCfZCseRoYCkD5fv6TGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=u.northwestern.edu; spf=pass smtp.mailfrom=u.northwestern.edu; dkim=pass (2048-bit key) header.d=u-northwestern-edu.20230601.gappssmtp.com header.i=@u-northwestern-edu.20230601.gappssmtp.com header.b=FPRLMATv; arc=none smtp.client-ip=209.85.161.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=u.northwestern.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=u.northwestern.edu
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-66106a2f8d1so1124558eaf.1
        for <linux-media@vger.kernel.org>; Thu, 29 Jan 2026 18:31:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=u-northwestern-edu.20230601.gappssmtp.com; s=20230601; t=1769740317; x=1770345117; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IZWRdRvUX/4o8E93YsgshqpXcbRbI3BTynBv7Avb9o8=;
        b=FPRLMATv41bfu2vqzaL5lG8Q4A2eI7KE/UVd6EiueeEgSDPEwPj5Hwwh2RQdSogU0j
         baV93tlX4v04vHj7pe0PUyMswdGkULlitpMD6lpJO80dqG7VhD0oMQlFcwHPN3m5nInF
         aK3Y7Y8mo6y8DiFs6JpWXNUfm/wGV5+3mXu79PauqG8l0FuYqMjPVzphNSkUKQZHtGlx
         Qg9pF1aL+Wul9eSJRU5/Q9hB6TJ3UpO3M6/hjXx8SLepHAkMMfcL70dYhD9tWLWci4Zh
         mIL5OpHE4MYi9+uemGczFGcgPvRF/Jtzn5DdfDOHyjlJm4OEpNvJ+KRfk6K4tTSn6RVM
         HugQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769740317; x=1770345117;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IZWRdRvUX/4o8E93YsgshqpXcbRbI3BTynBv7Avb9o8=;
        b=cCmFA0x2/YpS7/X4Q5fb5uXiEFHLGi84ajnsT0a5i8PIVSG4SPNZ1KCe0fWrpxCrSP
         9YDmDwtyll7Ut40oAAQgcyfmxvhUKdEnetbn3leFG4Sm7mYFG/m1qq5UyATLbucllqGF
         +EjOJgm0H1rsgoTpWH+wpu0e4HMxm3kRZgwf7pzNBOX6T938wKqgZ4uBlhDXiPvfMk/d
         k4WwjUlViMv+obM8dg33Y9Gnn/YFXpPp8GaOIpG1Fj9AX8j4vwWUOa/3uDtx9Gyhx4W/
         mzlKnsWN/qw4K/yVM0KDH1MHXOMC9Vo/vVCf2ekMnb2uK5ucws//Zn4lom1JCnARDmcd
         eivg==
X-Gm-Message-State: AOJu0YwetNN5A7mWQ3lEsSfxPA2vsRkRI6q0hmSlvfZxEyP/Bd9PkJL/
	PYYMUfvvJnvkIU3fq3JyVIluhcEsWdkyHPAbgk9GRLe/8gLbzGMJ0O/9eLocSxWguqvmeif/NPx
	2mgT2
X-Gm-Gg: AZuq6aIph4mQYLmqQfPu8z3B739bmVMEfgEk3CZs7YJH6IBhRADyaKuq+jOcVMu5jGG
	l6t/OzaN0sQ853A7jyIoyd7XCXtWCykKZV2hKYU26dUMEaGy0uQW9lC5gVo+ALW3IdkpRs5ovVO
	BOLZ7wrkaTgW7uviWHio66naTG7bQAgn3eM3LruNqq3SteHbBdSTnichGSTWJKdinq9gUgMHim/
	0tzcZBWSzbIomZzaHTEQjGfXoIVsUhngjuQcEQsWLVo5nm5T66Nvg0X7CuFMcjCcMF8s7bPGyPF
	3Trb3sRwgjqaxw7BFVZ0k1NbyV4ht7N+lhsYqG8r3KFjj35ZNXFOMSWUVzwYFVYak0Ct90SYwTd
	rR7AariWjrpGf3urqso9LjptSGw4eiddPNX53D2/DPMIZI6NaqmUjB9cTZKRH5LnkaPLDp3tFk/
	kQd9XTlL7PXA1DvdE9nOTztyUVHpYXhExnXHgH/z3X61B4hdff/OOzb3eXb3hYAbXbmdN+6I4ps
	75JmuxarsJE22sw3j1UdVMmbmU8QdmbAueaa3ohMA==
X-Received: by 2002:a05:6820:1528:b0:662:c161:206e with SMTP id 006d021491bc7-6630f3cdb13mr633553eaf.82.1769740317409;
        Thu, 29 Jan 2026 18:31:57 -0800 (PST)
Received: from security.cs.northwestern.edu (security.cs.northwestern.edu. [165.124.184.136])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-409570f1273sm5029874fac.5.2026.01.29.18.31.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jan 2026 18:31:57 -0800 (PST)
From: Ziyi Guo <n7l8m4@u.northwestern.edu>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ziyi Guo <n7l8m4@u.northwestern.edu>
Subject: [PATCH] media: i2c: imx258: add missing mutex protection for format code access
Date: Fri, 30 Jan 2026 02:31:54 +0000
Message-Id: <20260130023154.116038-1-n7l8m4@u.northwestern.edu>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.06 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[u-northwestern-edu.20230601.gappssmtp.com:s=20230601];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[northwestern.edu : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-51797-lists,linux-media=lfdr.de];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[n7l8m4@u.northwestern.edu,linux-media@vger.kernel.org];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	DKIM_TRACE(0.00)[u-northwestern-edu.20230601.gappssmtp.com:+];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[northwestern.edu:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,u-northwestern-edu.20230601.gappssmtp.com:dkim]
X-Rspamd-Queue-Id: E39EBB6795
X-Rspamd-Action: no action

imx258_open(), imx258_enum_mbus_code(), and imx258_enum_frame_size()
call imx258_get_format_code() without holding imx258->mutex. However,
imx258_get_format_code() has lockdep_assert_held(&imx258->mutex)
indicating that callers must hold this lock.

All other callers of imx258_get_format_code() properly acquire the mutex:
- imx258_set_pad_format() acquires mutex at imx258.c:918
- imx258_get_pad_format() acquires mutex at imx258.c:896

The mutex is needed to protect access to imx258->vflip->val and
imx258->hflip->val which are used to calculate the bayer format code.

Add mutex_lock()/mutex_unlock() around the imx258_get_format_code()
calls in the affected functions to fix the missing lock protection.

Signed-off-by: Ziyi Guo <n7l8m4@u.northwestern.edu>
---
 drivers/media/i2c/imx258.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/imx258.c b/drivers/media/i2c/imx258.c
index e50dcfd830f5..bc9ee449a87c 100644
--- a/drivers/media/i2c/imx258.c
+++ b/drivers/media/i2c/imx258.c
@@ -709,12 +709,16 @@ static int imx258_open(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
 		v4l2_subdev_state_get_format(fh->state, 0);
 	struct v4l2_rect *try_crop;
 
+	mutex_lock(&imx258->mutex);
+
 	/* Initialize try_fmt */
 	try_fmt->width = supported_modes[0].width;
 	try_fmt->height = supported_modes[0].height;
 	try_fmt->code = imx258_get_format_code(imx258);
 	try_fmt->field = V4L2_FIELD_NONE;
 
+	mutex_unlock(&imx258->mutex);
+
 	/* Initialize try_crop */
 	try_crop = v4l2_subdev_state_get_crop(fh->state, 0);
 	try_crop->left = IMX258_PIXEL_ARRAY_LEFT;
@@ -839,7 +843,9 @@ static int imx258_enum_mbus_code(struct v4l2_subdev *sd,
 	if (code->index > 0)
 		return -EINVAL;
 
+	mutex_lock(&imx258->mutex);
 	code->code = imx258_get_format_code(imx258);
+	mutex_unlock(&imx258->mutex);
 
 	return 0;
 }
@@ -849,10 +855,16 @@ static int imx258_enum_frame_size(struct v4l2_subdev *sd,
 				  struct v4l2_subdev_frame_size_enum *fse)
 {
 	struct imx258 *imx258 = to_imx258(sd);
+	u32 code;
+
 	if (fse->index >= ARRAY_SIZE(supported_modes))
 		return -EINVAL;
 
-	if (fse->code != imx258_get_format_code(imx258))
+	mutex_lock(&imx258->mutex);
+	code = imx258_get_format_code(imx258);
+	mutex_unlock(&imx258->mutex);
+
+	if (fse->code != code)
 		return -EINVAL;
 
 	fse->min_width = supported_modes[fse->index].width;
-- 
2.34.1


