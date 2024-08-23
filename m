Return-Path: <linux-media+bounces-16641-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F35F95C9A8
	for <lists+linux-media@lfdr.de>; Fri, 23 Aug 2024 11:51:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C1E0C1C23220
	for <lists+linux-media@lfdr.de>; Fri, 23 Aug 2024 09:51:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 369EE156C6A;
	Fri, 23 Aug 2024 09:51:37 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4261D14F9F5;
	Fri, 23 Aug 2024 09:51:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.191
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724406696; cv=none; b=ke5WGvKBtszYNacVe99PAru9w5lQsxVqWQruUL/ZOywYd/3BLFIS2w4ORFECJE8lQww5ewrCkg9HgZVhp+WV2XycvhjQ2jmvzo9wA+RDJmLqwC1Kb+AauY5MakV18TOqyVPBG34Dyu+elJ9FLuLgDQxI8I9BlreR1gOV9WSUsXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724406696; c=relaxed/simple;
	bh=jA23xu3bDLo+bBj64DlSv0HYlodGE5sSYIl7/XT6dcI=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Ijm1wnXiHT99gTWQeewN+nZsDkVK0aWh1fNJr8B+ce6bxuZOFizMXJ8szikmkLXWakjJgsk/nZS0BjpSkoYEocI4NGmx6OwpDMnkvhujKtq1rtxwTqKTdXVuRwC2T+5P0Ziyg0beggD1tmcntPW0TEi+cxAR2FWfj9yd6Y6lSwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.191
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.163.17])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4WqwM20dc2z1j70y;
	Fri, 23 Aug 2024 17:51:26 +0800 (CST)
Received: from dggpemf500002.china.huawei.com (unknown [7.185.36.57])
	by mail.maildlp.com (Postfix) with ESMTPS id B89DF1A0188;
	Fri, 23 Aug 2024 17:51:30 +0800 (CST)
Received: from huawei.com (10.175.101.6) by dggpemf500002.china.huawei.com
 (7.185.36.57) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Fri, 23 Aug
 2024 17:51:30 +0800
From: Yue Haibing <yuehaibing@huawei.com>
To: <mchehab@kernel.org>, <ribalda@chromium.org>, <hverkuil-cisco@xs4all.nl>
CC: <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<yuehaibing@huawei.com>
Subject: [PATCH -next] media: siano: Remove unused declarations
Date: Fri, 23 Aug 2024 17:48:39 +0800
Message-ID: <20240823094839.3142472-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggpemf500002.china.huawei.com (7.185.36.57)

There is no caller and implementation in tree, so can remove them.

Signed-off-by: Yue Haibing <yuehaibing@huawei.com>
---
 drivers/media/common/siano/smscoreapi.h | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/media/common/siano/smscoreapi.h b/drivers/media/common/siano/smscoreapi.h
index 3c15082ce0e3..d945a2d6d624 100644
--- a/drivers/media/common/siano/smscoreapi.h
+++ b/drivers/media/common/siano/smscoreapi.h
@@ -1115,12 +1115,6 @@ extern int smsclient_sendrequest(struct smscore_client_t *client,
 extern void smscore_onresponse(struct smscore_device_t *coredev,
 			       struct smscore_buffer_t *cb);
 
-extern int smscore_get_common_buffer_size(struct smscore_device_t *coredev);
-extern int smscore_map_common_buffer(struct smscore_device_t *coredev,
-				      struct vm_area_struct *vma);
-extern int smscore_send_fw_file(struct smscore_device_t *coredev,
-				u8 *ufwbuf, int size);
-
 extern
 struct smscore_buffer_t *smscore_getbuffer(struct smscore_device_t *coredev);
 extern void smscore_putbuffer(struct smscore_device_t *coredev,
-- 
2.34.1


