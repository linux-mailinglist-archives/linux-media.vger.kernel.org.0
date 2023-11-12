Return-Path: <linux-media+bounces-137-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 754847E904C
	for <lists+linux-media@lfdr.de>; Sun, 12 Nov 2023 14:28:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0590BB20BFE
	for <lists+linux-media@lfdr.de>; Sun, 12 Nov 2023 13:28:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3782D14294;
	Sun, 12 Nov 2023 13:28:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bAGoHB7X"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C518C12B97
	for <linux-media@vger.kernel.org>; Sun, 12 Nov 2023 13:28:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F070C433C7;
	Sun, 12 Nov 2023 13:28:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699795697;
	bh=rJeXy8nq+IYTVdj99U/CT6dlPvMPglGs0y3dXPKYaXM=;
	h=From:To:Cc:Subject:Date:From;
	b=bAGoHB7XPE0F48IMk9vIq9OkdkLKxie7+b8LV2phX87zLkazMODZJ04EFu9hhlyrE
	 DH9iR3vW72/inwfkxQKgku5hna8s/8DGWVBjsyk/kRmln+i9CL9RaRpQiaJP2FnwDd
	 EZWJ7L8L3PK/RXbFXVjm+SSnfyiDmL80v2YhYVQfCMSOCIo2zsJz1UAg08ocDo1rdE
	 G0Ia6w1hAx6d9tmjU3diHuxGGK3CuS3IpQj70IKuZPNnflltCPg7zfKwRCHh5LIreM
	 26dD9R8B8X0rhkk6sgjClxbBvdLM1YOTOb3MF7TYeKy9zzIYyHyjbRyyVAsqcupN0e
	 ct6vhQ2YbDtZQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Rajeshwar R Shinde <coolrrsh@gmail.com>,
	syzbot+e27f3dbdab04e43b9f73@syzkaller.appspotmail.com,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Sasha Levin <sashal@kernel.org>,
	hverkuil@xs4all.nl,
	linux-media@vger.kernel.org
Subject: [PATCH AUTOSEL 6.1 1/9] media: gspca: cpia1: shift-out-of-bounds in set_flicker
Date: Sun, 12 Nov 2023 08:28:04 -0500
Message-ID: <20231112132814.176005-1-sashal@kernel.org>
X-Mailer: git-send-email 2.42.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.1.62
Content-Transfer-Encoding: 8bit

From: Rajeshwar R Shinde <coolrrsh@gmail.com>

[ Upstream commit 099be1822d1f095433f4b08af9cc9d6308ec1953 ]

Syzkaller reported the following issue:
UBSAN: shift-out-of-bounds in drivers/media/usb/gspca/cpia1.c:1031:27
shift exponent 245 is too large for 32-bit type 'int'

When the value of the variable "sd->params.exposure.gain" exceeds the
number of bits in an integer, a shift-out-of-bounds error is reported. It
is triggered because the variable "currentexp" cannot be left-shifted by
more than the number of bits in an integer. In order to avoid invalid
range during left-shift, the conditional expression is added.

Reported-by: syzbot+e27f3dbdab04e43b9f73@syzkaller.appspotmail.com
Closes: https://lore.kernel.org/all/20230818164522.12806-1-coolrrsh@gmail.com
Link: https://syzkaller.appspot.com/bug?extid=e27f3dbdab04e43b9f73
Signed-off-by: Rajeshwar R Shinde <coolrrsh@gmail.com>
Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/media/usb/gspca/cpia1.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/media/usb/gspca/cpia1.c b/drivers/media/usb/gspca/cpia1.c
index 46ed95483e222..5f5fa851ca640 100644
--- a/drivers/media/usb/gspca/cpia1.c
+++ b/drivers/media/usb/gspca/cpia1.c
@@ -18,6 +18,7 @@
 
 #include <linux/input.h>
 #include <linux/sched/signal.h>
+#include <linux/bitops.h>
 
 #include "gspca.h"
 
@@ -1028,6 +1029,8 @@ static int set_flicker(struct gspca_dev *gspca_dev, int on, int apply)
 			sd->params.exposure.expMode = 2;
 			sd->exposure_status = EXPOSURE_NORMAL;
 		}
+		if (sd->params.exposure.gain >= BITS_PER_TYPE(currentexp))
+			return -EINVAL;
 		currentexp = currentexp << sd->params.exposure.gain;
 		sd->params.exposure.gain = 0;
 		/* round down current exposure to nearest value */
-- 
2.42.0


