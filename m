Return-Path: <linux-media+bounces-54456-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iHesJo4NqGk8ngAAu9opvQ
	(envelope-from <linux-media+bounces-54456-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 04 Mar 2026 11:46:38 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 13F971FE86B
	for <lists+linux-media@lfdr.de>; Wed, 04 Mar 2026 11:46:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 30BDD3090D31
	for <lists+linux-media@lfdr.de>; Wed,  4 Mar 2026 10:45:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2944382F16;
	Wed,  4 Mar 2026 10:45:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UlPbCUBA"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D7B5283FCF
	for <linux-media@vger.kernel.org>; Wed,  4 Mar 2026 10:45:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772621144; cv=none; b=HA6EQ4idcAjDTHJFjaI0Tr66pXtPrXNdIbQsAXC1IhnOElZjz0LqZ9pLCSlIKK5BzTdb/DZPhK3wAiCNnRRCR5C9b2MK+vh0A1LpwfeYF/6nuugz3WFm5V+mRdFH/CcC59XEUY3V6Jd6iCs0C1qYTxUX9GDiaXKF0UMsxiMeRRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772621144; c=relaxed/simple;
	bh=SsGuto8yJkPG0DYbaQpL/SuujE+DEYu+cfNNyFvziIs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=f4USn7BSNghsiovFfLGSwbXHii/825ewJB1SDi5okwRITlPDcEqlcQWr0fhgmQUx5orBD8G7PSiDVTv7Q2hEIOH26FPwsvLlplxKLIcbZxlxwUoLax0cqoobb0CZggLVlpXsCEFDeppgs7u5+LVx8NRblB7Vi+Fp5PTegQecDw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UlPbCUBA; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-439b873a54bso330648f8f.2
        for <linux-media@vger.kernel.org>; Wed, 04 Mar 2026 02:45:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772621141; x=1773225941; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sPm7m9zp86N9ephLPNUzwVLOIxxpQJ735TcWub5eC2k=;
        b=UlPbCUBAXNd/UNPQYgZbhY/OH9rl4BU94F/prPVhsyBHiHtdmitVKD+FrGPouHP+Kh
         R1JH/p42NvL7CdMuipGHCaqunCbkhA2nNwqoW04YYCTkFmjbudttuP3iEVML4Rt+Jc2L
         /XTGcBJBwRQwxQf5YC/4GTIdVHc7fHIY/NyrZ8TyOe2jUzWNvUj+1YHemFBRPTbT+fQl
         gUmZa3QKVuDtRZj1Tjcsjt/0cG54QB80dBNG94nIeLxfG9YqDwTyNNmhQE9BoD3oIMuj
         ww0ei9BtY9cexwgYHrQBAmU6+nq1V7H3AyDEnMhbT5O1gOHWv9s+Lx8Now2vonLM7t8G
         rurA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772621141; x=1773225941;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sPm7m9zp86N9ephLPNUzwVLOIxxpQJ735TcWub5eC2k=;
        b=D6GQ35QkG7JI7IsynB2h+zPSmvCix70sVOzdzo68dcVoXw65tpYLLX53TrxCvAQ2/P
         CY2EC9Eo51x/Z/sOJFUu5KorXlMELNo4nVxqnwucnXZBCCi49Qt0bhZfL9Tjrd+PHbeS
         Nj6RVDIJOW309J1GiKZo+SdjuhGc+zA0+Htnw9+uzKl9l8mjDXhQ1KfWzv1NWeFMziab
         1ld3hh17sScTZ1Vz+lbcbihb0B8mOF7cNL0SZYpz9vVGwEF4nkpq+pqYs5TdJCCF7z96
         ZTcOhMOAM8x2uya655DG6ddeh+OhyJnkh3CSOfBQHfXcPf+OaL6ACHY+g35zATQWwdN4
         IAYw==
X-Gm-Message-State: AOJu0YyshKa0fGwocaPBGKS/RUAyc76v1aR9qL+t7jzAOF86mIO0KXUc
	ij+S2vMjMxqA5Vmo2BL8HU9HFQFMWObffMHz/kZoKEAq+Lz+MC1/i2BssA+dEyRN
X-Gm-Gg: ATEYQzxhNux5Zzs0yq8OSilU7xGnBTMCZGlgP6U7+NyfworS+oaeiBYKOjhFMD+sCAd
	0UcgUWConaOK05fPfIjTBD2RmCRV+qs8lquU3ZuUgXBd/vQfrZOmAeVe2PVN4lXGrCH+ww/LyWs
	1DN4aZhDx2CAtryymbaETK/Y9kwtMqmeyUgCb/OzFrhq78MIka4NYM/LBEyGGWKRECdGbBDrlNY
	CC9MQVdQXq7RjUTM2+Qal757VMvf/LD8YHtiIL2bideOKiJas5G8/lLUFDOyxIXhJWhQk2PgWO6
	bIM8pYzKKy70nmZPB43TV7mIBZRTB8eLaO1XcRajPuV5m0P/r8gj8W/vMOlBUBHvFQFvlG7LWqU
	M/Kl4AN8oG3sAiNA6maE9DVnu6fO2NGEs7UXjR8QacuSUkJzgmDyXAu+EB152fVvkwWE4gcZx/s
	+Bl8em6yyU3nb28r0HWd4QjSL5xnWFvwdF0HlVjvjVGr6IJisxYZaGml8SlxweVTnT4Mj8eB7TK
	VtjZx9/lQ==
X-Received: by 2002:a05:6000:4027:b0:436:23a2:5e38 with SMTP id ffacd0b85a97d-439c7f6651fmr1669816f8f.2.1772621140598;
        Wed, 04 Mar 2026 02:45:40 -0800 (PST)
Received: from rivka-VirtualBox.. ([213.137.65.196])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439af926c53sm32297765f8f.8.2026.03.04.02.45.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 02:45:39 -0800 (PST)
From: Rivka S <s0533160580@gmail.com>
To: linux-media@vger.kernel.org
Cc: Rivka S <s0533160580@gmail.com>
Subject: [PATCH] v4l2-utils: libv4l2: Remove unconditional sleep after STREAMOFF and enable REQBUFS(count=0)
Date: Wed,  4 Mar 2026 12:44:23 +0200
Message-ID: <20260304104421.19237-4-s0533160580@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 13F971FE86B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-54456-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[s0533160580@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Action: no action

Remove the unconditional sleep(1) after VIDIOC_STREAMOFF and
enable the REQBUFS(count=0) call when freeing buffers.

The current implementation calls sleep(1) after STREAMOFF
with a FIXME comment suggesting a need to ensure that
all buffers have stopped. However, the videobuf2
implementation documents that vb2_core_streamoff()
cancels the queue and removes all buffers from the driver
and vb2, returning control to userspace as part of the
stream stop procedure.

Since STREAMOFF already performs queue cancellation,
remove the additional sleep delay as is it unnecessary and does
not provide deterministic synchronization.

Re-enable the REQBUFS(count=0) call, which was previously disabled due to
historical limitations in the old video-buf implementation. Modern buffer
frameworks expect this ioctl to release all buffers as defined by the
V4L2 API.

Signed-off-by: Rivka S <s0533160580@gmail.com>
---
 utils/libv4l2util/v4l2_driver.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/utils/libv4l2util/v4l2_driver.c b/utils/libv4l2util/v4l2_driver.c
index c9560326..28fc1bcf 100644
--- a/utils/libv4l2util/v4l2_driver.c
+++ b/utils/libv4l2util/v4l2_driver.c
@@ -569,17 +569,11 @@ int v4l2_free_bufs(struct v4l2_driver *drv)
 	if (xioctl(drv->fd,VIDIOC_STREAMOFF,&drv->reqbuf.type)<0)
 		return errno;
 
-	sleep (1);	// FIXME: Should check if all buffers are stopped
 
-/* V4L2 API says REQBUFS with count=0 should be used to release buffer.
-   However, video-buf.c doesn't implement it.
- */
-#if 0
 	if (xioctl(drv->fd,VIDIOC_REQBUFS,&drv->reqbuf)<0) {
 		perror("reqbufs while freeing buffers");
 		return errno;
 	}
-#endif
 
 	if (drv->reqbuf.count != 0) {
 		fprintf(stderr,"REQBUFS returned %d buffers while asking for freeing it!\n",
-- 
2.43.0


