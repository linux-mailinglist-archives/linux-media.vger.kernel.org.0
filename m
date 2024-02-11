Return-Path: <linux-media+bounces-4949-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FAB68509D1
	for <lists+linux-media@lfdr.de>; Sun, 11 Feb 2024 16:07:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A166C1C20E2B
	for <lists+linux-media@lfdr.de>; Sun, 11 Feb 2024 15:07:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4016B5B663;
	Sun, 11 Feb 2024 15:07:38 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-out.aladdin-rd.ru (mail-out.aladdin-rd.ru [91.199.251.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FB295A4C2;
	Sun, 11 Feb 2024 15:07:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.199.251.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707664057; cv=none; b=GSAjdmn7Vhjn72hGixJ/G4i/ofE7F4giw38UhF9cQZfn1nMA+III3jkZqYpjzvBC9axC1B2Wc1h7FOZ4amBn4YhvCUtC0jShA/XQKaio3zVMZBngj6FkFN2VkvNbpNzo3igclJZGha+6V4/PofVORFB/xlt4WRb+yRTUndLFa3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707664057; c=relaxed/simple;
	bh=S+ZcsTEYVGxi18jHqo41yCn7PEXa3hnMJnf6e88HqS0=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=KlkLFSXgRkq5GMqdMA0qhslThIiLtZB9d51Cv3xA/O5L7ylP8GPDMfl3Nm1hD4xFZMeDcGgS6RQwaGuuMwRj0BJF/jyNAlIL6U8QsyW5ZB+y0E53aRJTU056dPuY391yw0imic33qX29Fx5e9dwlm+U4p/ImE6ud8H637jlJjjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aladdin.ru; spf=pass smtp.mailfrom=aladdin.ru; arc=none smtp.client-ip=91.199.251.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aladdin.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aladdin.ru
From: Daniil Dulov <d.dulov@aladdin.ru>
To: Mike Isely <isely@pobox.com>
CC: Daniil Dulov <d.dulov@aladdin.ru>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, <linux-media@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <lvc-project@linuxtesting.org>
Subject: [PATCH] media: pvrusb2: remove redundant NULL check
Date: Sun, 11 Feb 2024 07:07:25 -0800
Message-ID: <20240211150725.3769-1-d.dulov@aladdin.ru>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: EXCH-2016-01.aladdin.ru (192.168.1.101) To
 EXCH-2016-01.aladdin.ru (192.168.1.101)

Pointer dip->stream cannot be NULL due to a shift, thus remove redundant NULL check.

Found by Linux Verification Center (linuxtesting.org) with SVACE.

Fixes: c74e0062684b ("V4L/DVB (5059): Pvrusb2: Be smarter about mode restoration")
Signed-off-by: Daniil Dulov <d.dulov@aladdin.ru>
---
 drivers/media/usb/pvrusb2/pvrusb2-v4l2.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/media/usb/pvrusb2/pvrusb2-v4l2.c b/drivers/media/usb/pvrusb2/pvrusb2-v4l2.c
index 9657c1883311..c872868becbd 100644
--- a/drivers/media/usb/pvrusb2/pvrusb2-v4l2.c
+++ b/drivers/media/usb/pvrusb2/pvrusb2-v4l2.c
@@ -1202,11 +1202,6 @@ static void pvr2_v4l2_dev_init(struct pvr2_v4l2_dev *dip,
 		dip->minor_type = pvr2_v4l_type_video;
 		nr_ptr = video_nr;
 		caps |= V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_AUDIO;
-		if (!dip->stream) {
-			pr_err(KBUILD_MODNAME
-				": Failed to set up pvrusb2 v4l video dev due to missing stream instance\n");
-			return;
-		}
 		break;
 	case VFL_TYPE_VBI:
 		dip->config = pvr2_config_vbi;
-- 
2.25.1


