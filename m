Return-Path: <linux-media+bounces-17425-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C60FC9691AB
	for <lists+linux-media@lfdr.de>; Tue,  3 Sep 2024 05:12:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 653541F238CC
	for <lists+linux-media@lfdr.de>; Tue,  3 Sep 2024 03:12:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65AB71CDFA2;
	Tue,  3 Sep 2024 03:12:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="Y2ngOWZq"
X-Original-To: linux-media@vger.kernel.org
Received: from out203-205-221-235.mail.qq.com (out203-205-221-235.mail.qq.com [203.205.221.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A3342AD02;
	Tue,  3 Sep 2024 03:12:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.205.221.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725333153; cv=none; b=Jk/HMXO3UH1UoWQYge6bw4FMxVltNbCPGNSKIIb7JZVWygEyT3h5dekVXF/OFt/i2fg2cGD5W6vnyxQUAhq7g5T/jUuo78rk1U7rRSRmeRjQIufusLVBpViI4PrfasX4Vy0RkhJ1O9tNeFtXSeCvrIAvaIypIFEB+eq1ti1KTdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725333153; c=relaxed/simple;
	bh=JN4xCIYWqCrW27aHVxaSlhs/SR/H2NsShgkdnlQ7tXc=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=qVDiDQpLeFn5oRtCrPeUfWKlT9HG8W9LQ6kak38lJAredi+vSOQ0N2oAEzRwFZ7MDke2SKRv2fcKsjmruQILHN6Hm4xE2M6n7/oqOm2tajQvBQIViICQAMsdogLK7Yf7q/5rJJS6G7NmBE8nweeVl8sUgcQlHBqU2763/oYuXKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=Y2ngOWZq; arc=none smtp.client-ip=203.205.221.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1725333141; bh=uZqm3iEyuq8TW/5t+qeOn/UykjDV51xvQQ9Do/NAEJs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Y2ngOWZqbqXD3nKGDfdGOx0sCv549w05lL84hWZ0CIXVVvyHFVeHUH4DfAOO5N7Ro
	 mIRHKGmHEJiKhnllNGPhItrwj83Wboug6lFvWGTnJYUecATAsgL2GcZ58K6MOWm5Jy
	 GpkoCLccq4I+yNe18sbJrXnIhZkDLCRvW6iBjLHM=
Received: from pek-lxu-l1.wrs.com ([111.198.224.50])
	by newxmesmtplogicsvrszc5-2.qq.com (NewEsmtp) with SMTP
	id E769E825; Tue, 03 Sep 2024 10:57:54 +0800
X-QQ-mid: xmsmtpt1725332274tnnqhaskn
Message-ID: <tencent_A536BA4B40741D769567D23CF5373096CA09@qq.com>
X-QQ-XMAILINFO: OaubouGXmhNzVWihWTcGI6bRyv3jNlZmhbr8JUse5Uz1lYAPoULq2hmFyjwOXm
	 jGH5axCKO4BDE+ud6azczPZgdiNKHoC7bYDfD2fgQRjOyoPsMDtO078d/ByTXnq61bqQuD8yYkh/
	 GK3nv03PCHm5/C/44NDK5M5xoQZiIZVDLLou+ZXpcniIPD784r00leVJBRFVonIqza9LE1u6Wf+U
	 cMIwAvUPhaHJF3WyZkN3Y8HfXoibXe1GQXWFqUyi7Uw2M7LyFNb3tyRI+lNvHvQHLv3iOhz4XOp+
	 jIliCDtK9VlO2iUZjOq8pbeerF+mpVlH8X4CUq21JZUsxIM+Wv8vg3srjv0Rnw+hBK30pHwjWwCJ
	 Fg2z5Et+id1AHi/D8jJvsOF24O0AbP/QiX8kpS4gga4o9rBVIYu6w1KstSv27xuR5h884RL2SnGh
	 1922F658VKohQwwaQ9qTpanxOvolYV8Kw9S5THmGo8KPa/Ub/9qzpnRkmmDBMY+faFYpa0VKw/SH
	 QlyVxYdwyXwZFAI4Z4/WCOaBn9qKfXdJLhc66kcVt7Zgkm2DrBsjeG/u264SseQDaFh5hTzj3mk7
	 fwQgYC9DQDI7QSzE7F25IWCh8FesD/5MME3m5PPRoepgDoWmW1I21fm+DGngxW9ShD/VgLiu0XDD
	 5fZEQReVAabc58eK/MKg/S+6MC+RRmY5FCZyyjwnwS3IFTLyMbGdnX0vMpOZCKMl1/L7HSSkXE7r
	 +liZ5AzgyQ0FZq+bguNy6KAHmgAEz6lU964XbkU3sNnus4Tl4E3R+LQWqOHoocFgL/cTq00Hg/vr
	 Vo+05/8H2d6NRgncldL9dbM/lfR3FipmwJhtd85eUzjslKg103Hfgp1Fonjrt4It1MxKqCfIO64t
	 638iEjLdizKyMuHb5MribYfRdjpOuFN9tz0J2mmEHHftFp/5VX0Pwe7QsZ5Y2RaA==
X-QQ-XMRINFO: OWPUhxQsoeAVDbp3OJHYyFg=
From: Edward Adam Davis <eadavis@qq.com>
To: syzbot+a828133770f62293563e@syzkaller.appspotmail.com
Cc: linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	mchehab@kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [media?] WARNING in __v4l2_ctrl_modify_dimensions
Date: Tue,  3 Sep 2024 10:57:55 +0800
X-OQ-MSGID: <20240903025754.2661766-2-eadavis@qq.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <000000000000013050062127830a@google.com>
References: <000000000000013050062127830a@google.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The warning appears because the size passed to kvzalloc is larger than INT_MAX.

Add parameter size check before calling kvzalloc in __v4l2_ctrl_modify_dimensions.

#syz test

diff --git a/drivers/media/v4l2-core/v4l2-ctrls-api.c b/drivers/media/v4l2-core/v4l2-ctrls-api.c
index e5a364efd5e6..0b008cc94901 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls-api.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls-api.c
@@ -986,6 +986,7 @@ int __v4l2_ctrl_modify_dimensions(struct v4l2_ctrl *ctrl,
 	unsigned int elems = 1;
 	unsigned int i;
 	void *p_array;
+	unsigned int bytes;
 
 	lockdep_assert_held(ctrl->handler->lock);
 
@@ -996,7 +997,12 @@ int __v4l2_ctrl_modify_dimensions(struct v4l2_ctrl *ctrl,
 		elems *= dims[i];
 	if (elems == 0)
 		return -EINVAL;
-	p_array = kvzalloc(2 * elems * ctrl->elem_size, GFP_KERNEL);
+
+	bytes = 2 * elems * ctrl->elem_size;
+	if (unlikely(bytes > INT_MAX))
+		return -EINVAL;
+
+	p_array = kvzalloc(bytes, GFP_KERNEL);
 	if (!p_array)
 		return -ENOMEM;
 	kvfree(ctrl->p_array);


