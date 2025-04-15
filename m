Return-Path: <linux-media+bounces-30221-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E584CA8969A
	for <lists+linux-media@lfdr.de>; Tue, 15 Apr 2025 10:30:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 251B73B9500
	for <lists+linux-media@lfdr.de>; Tue, 15 Apr 2025 08:30:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EEE83289356;
	Tue, 15 Apr 2025 08:27:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=swemel.ru header.i=@swemel.ru header.b="kWlRrhmT"
X-Original-To: linux-media@vger.kernel.org
Received: from mx.swemel.ru (mx.swemel.ru [95.143.211.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA63E279913;
	Tue, 15 Apr 2025 08:27:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.143.211.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744705657; cv=none; b=gQWTcmgTblkuQafyMgzptFkZ5AAfb54GFNDAXWVpHoT+ChKK7Hao04ghsP/wWPW8anTTUWPdQjE+/SZZ0GAq8eLLiOhYsONSgMWLqw2K/1Meex9FJKt9MYOQ2PSzCdGIV65C4sbnMK/VKy6x0I6Vm3/UG7OW+uYOCkgbFDDTtQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744705657; c=relaxed/simple;
	bh=/YTIOL4HC+RV4Q8BA5tWZBttbOx9E192dFHIl2r7BUA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FthaYytlWdWouZl73pDnRtrWhQCCylC1Ie6ReC7fTRbWSt6sK3SDW2O91jBnc04muxYrJRbII37/jjKqQ6f95XeNWPm6H5iGgbSR1QFqLSTRIH0sZ/hNe9trf+kGoKuynPSrYN+Kw/HXrEgGyXPz56UdCIE2m0QQqDrfNLpH89s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=swemel.ru; spf=pass smtp.mailfrom=swemel.ru; dkim=pass (1024-bit key) header.d=swemel.ru header.i=@swemel.ru header.b=kWlRrhmT; arc=none smtp.client-ip=95.143.211.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=swemel.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=swemel.ru
From: Denis Arefev <arefev@swemel.ru>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=swemel.ru; s=mail;
	t=1744705643;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=qcj60WxuwxsCiblOzqs/zQo+ybf28ZZc3VeFKLoGV8o=;
	b=kWlRrhmTdidWZqcxNP17QkSx6dOBMXurK0Wq0U61FzTR9abGfMfKTQlAyaHn7JWKKZ4Kkb
	fOdAo9wn9+vRrve0W9vpGZ7kymDoKWnD1bVzfjFnKq04wqCvT9GiE5qR2IFVnO1qotzkKq
	afZLevazB7GVQlPCW/6zF3oM0GszP9c=
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Liu Shixin <liushixin2@huawei.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	lvc-project@linuxtesting.org,
	stable@vger.kernel.org,
	syzbot+365005005522b70a36f2@syzkaller.appspotmail.com
Subject: [PATCH] media: vivid: Change the siize of the composing
Date: Tue, 15 Apr 2025 11:27:21 +0300
Message-ID: <20250415082722.18022-1-arefev@swemel.ru>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

syzkaller found a bug:

BUG: KASAN: vmalloc-out-of-bounds in tpg_fill_plane_pattern drivers/media/common/v4l2-tpg/v4l2-tpg-core.c:2608 [inline]
BUG: KASAN: vmalloc-out-of-bounds in tpg_fill_plane_buffer+0x1a9c/0x5af0 drivers/media/common/v4l2-tpg/v4l2-tpg-core.c:2705
Write of size 1440 at addr ffffc9000d0ffda0 by task vivid-000-vid-c/5304

CPU: 0 UID: 0 PID: 5304 Comm: vivid-000-vid-c Not tainted 6.14.0-rc2-syzkaller-00039-g09fbf3d50205 #0
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2~bpo12+1 04/01/2014

Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:94 [inline]
 dump_stack_lvl+0x241/0x360 lib/dump_stack.c:120
 print_address_description mm/kasan/report.c:378 [inline]
 print_report+0x169/0x550 mm/kasan/report.c:489
 kasan_report+0x143/0x180 mm/kasan/report.c:602
 kasan_check_range+0x282/0x290 mm/kasan/generic.c:189
 __asan_memcpy+0x40/0x70 mm/kasan/shadow.c:106
 tpg_fill_plane_pattern drivers/media/common/v4l2-tpg/v4l2-tpg-core.c:2608 [inline]
 tpg_fill_plane_buffer+0x1a9c/0x5af0 drivers/media/common/v4l2-tpg/v4l2-tpg-core.c:2705
 vivid_fillbuff drivers/media/test-drivers/vivid/vivid-kthread-cap.c:470 [inline]
 vivid_thread_vid_cap_tick+0xf8e/0x60d0 drivers/media/test-drivers/vivid/vivid-kthread-cap.c:629
 vivid_thread_vid_cap+0x8aa/0xf30 drivers/media/test-drivers/vivid/vivid-kthread-cap.c:767
 kthread+0x7a9/0x920 kernel/kthread.c:464
 ret_from_fork+0x4b/0x80 arch/x86/kernel/process.c:148
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:244
 </TASK>

The composition size cannot be larger than the size of fmt_cap_rect.
So execute v4l2_rect_map_inside() even if has_compose_cap == 0.

Fixes: 94a7ad928346 ("media: vivid: fix compose size exceed boundary")
Cc: stable@vger.kernel.org
Reported-by: syzbot+365005005522b70a36f2@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?id=8ed8e8cc30cbe0d86c9a25bd1d6a5775129b8ea3
Signed-off-by: Denis Arefev <arefev@swemel.ru>
---
 drivers/media/test-drivers/vivid/vivid-vid-cap.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/test-drivers/vivid/vivid-vid-cap.c b/drivers/media/test-drivers/vivid/vivid-vid-cap.c
index b166d90177c6..df5d1c2a42ef 100644
--- a/drivers/media/test-drivers/vivid/vivid-vid-cap.c
+++ b/drivers/media/test-drivers/vivid/vivid-vid-cap.c
@@ -946,8 +946,8 @@ int vivid_vid_cap_s_selection(struct file *file, void *fh, struct v4l2_selection
 			if (dev->has_compose_cap) {
 				v4l2_rect_set_min_size(compose, &min_rect);
 				v4l2_rect_set_max_size(compose, &max_rect);
-				v4l2_rect_map_inside(compose, &fmt);
 			}
+			v4l2_rect_map_inside(compose, &fmt);
 			dev->fmt_cap_rect = fmt;
 			tpg_s_buf_height(&dev->tpg, fmt.height);
 		} else if (dev->has_compose_cap) {
-- 
2.43.0


