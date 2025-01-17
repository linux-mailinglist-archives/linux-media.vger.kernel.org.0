Return-Path: <linux-media+bounces-24873-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F936A14C9D
	for <lists+linux-media@lfdr.de>; Fri, 17 Jan 2025 10:56:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8264D1882945
	for <lists+linux-media@lfdr.de>; Fri, 17 Jan 2025 09:56:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 366331FC7EA;
	Fri, 17 Jan 2025 09:55:43 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53C661FC7C4;
	Fri, 17 Jan 2025 09:55:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737107742; cv=none; b=H0yfoeHitYtdM38wPG/B8NpY7q6HEMrFgVg95wrMwXdCjtn3kOHfPX+3dvAUpMMQinbA+hrgnsToBWz8PIn8uxqGvvArSs9xENczGp8uN+CmoW8PCt27Wo1+HgrWg9Ry7GVbIEMNCxF99QHFQIuyStEdN8Vcxal0WunOeem8cao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737107742; c=relaxed/simple;
	bh=v3xyECUrUCkbS6uPteZCsVvLDbOaYHQksZF67am3hEQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=D1q8zwHdOxCaqL0W7Bdp/rZYssKTS9/qU8EJ6WDoulwfKjLXtgPcodmynjxzhkuqPxIyC1IJ+rldARdEHMVULae5DZcpz3jgH4fbL6geIY8ThQq3fyHA2k8Nr2kPWRGZOlfJeeBzqIuc1H0QKLgD7rSJG+SsJx9xdML6HkgEAVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 31f5a7acd4b911efa216b1d71e6e1362-20250117
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.45,REQID:f63353ef-1cd4-4f4f-af23-1aebfc7e2e52,IP:0,U
	RL:0,TC:0,Content:0,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:25
X-CID-META: VersionHash:6493067,CLOUDID:3285e49d4ea2522a3d6aed9243522d5a,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|50,EDM:5,IP:nil,URL
	:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SP
	R:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 31f5a7acd4b911efa216b1d71e6e1362-20250117
Received: from mail.kylinos.cn [(10.44.16.175)] by mailgw.kylinos.cn
	(envelope-from <zhangheng@kylinos.cn>)
	(Generic MTA)
	with ESMTP id 698949766; Fri, 17 Jan 2025 17:55:34 +0800
Received: from mail.kylinos.cn (localhost [127.0.0.1])
	by mail.kylinos.cn (NSMail) with SMTP id 3A145E0080FF;
	Fri, 17 Jan 2025 17:55:34 +0800 (CST)
X-ns-mid: postfix-678A2915-9982401618
Received: from kylin-pc.. (unknown [172.25.130.133])
	by mail.kylinos.cn (NSMail) with ESMTPA id 02DD6E0080FF;
	Fri, 17 Jan 2025 17:55:32 +0800 (CST)
From: Zhang Heng <zhangheng@kylinos.cn>
To: hverkuil@xs4all.nl,
	mchehab@kernel.org,
	laurent.pinchart+renesas@ideasonboard.com
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Zhang Heng <zhangheng@kylinos.cn>
Subject: [PATCH] media: pwc: remove useless header files
Date: Fri, 17 Jan 2025 17:55:30 +0800
Message-ID: <20250117095530.3988154-1-zhangheng@kylinos.cn>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

It was originally intended to introduce simple_strtol,
but since commit a081c3400ff2 ("[media] pwc: Remove dev_hint
module parameter"), that simple_strtol has been removed,
so in orderto prevent disputes,the header file should be removed.

Signed-off-by: Zhang Heng <zhangheng@kylinos.cn>
---
 drivers/media/usb/pwc/pwc-if.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/media/usb/pwc/pwc-if.c b/drivers/media/usb/pwc/pwc-i=
f.c
index 3ec9eb5956ed..c6e5d031f068 100644
--- a/drivers/media/usb/pwc/pwc-if.c
+++ b/drivers/media/usb/pwc/pwc-if.c
@@ -56,7 +56,6 @@
 #endif
 #include <linux/vmalloc.h>
 #include <asm/io.h>
-#include <linux/kernel.h>		/* simple_strtol() */
=20
 #include "pwc.h"
 #include "pwc-kiara.h"
--=20
2.47.1


