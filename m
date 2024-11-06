Return-Path: <linux-media+bounces-21023-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 15D2F9BF834
	for <lists+linux-media@lfdr.de>; Wed,  6 Nov 2024 21:51:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 32C7A1C225DD
	for <lists+linux-media@lfdr.de>; Wed,  6 Nov 2024 20:51:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3221E20C308;
	Wed,  6 Nov 2024 20:51:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T1PTDQaC"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BD4F14F9D9;
	Wed,  6 Nov 2024 20:51:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730926270; cv=none; b=SdmsnwZtgoxvX4WNLCfgMSYAaMaGRoNyIOjtJarp/rByy7sVkOdul7sJ3ikfzRU+/ugdY+dCXz9E7htqxNGzmY5lwSbhIr4iOImdb9a+p7GV0NfOywqPfMCpnsM5cQN8MVqv3RXBykThWqcemKUb3Al1l+VQGqSI5VDVsGSZh9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730926270; c=relaxed/simple;
	bh=3icivavPqzjUtXmffIVTz6m0RmdGyiaZWnhkP8mFoXk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MI0VcTOjiouxUTYMqZuc4bPQmLAS+BLWTqU61UzBfFCxWRhSHzSncNImba+VnuUtqLg2uEZRhn3wKLS9od8cwSrIXH9aAPiSVI2a7ATrm58xb+oY4fECUKChtxMYd48ykqs1ZRJiBiJPfl5wM+YGW8j6J/azbic5Tr9fV/M33l4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T1PTDQaC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2AA90C4CEC6;
	Wed,  6 Nov 2024 20:51:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730926270;
	bh=3icivavPqzjUtXmffIVTz6m0RmdGyiaZWnhkP8mFoXk=;
	h=From:To:Cc:Subject:Date:From;
	b=T1PTDQaCpQR2TLYe9X+V/shxSWvY5owtCBt8greaRvtM1Zjqpn33QLWNmydIaj7sN
	 t6jwTtCnE+qbd+A9lWFXFcz8Y3JwQTfqNQ9A+y7iYeGZJJTBoXLuWl4vz/HRkmLpAD
	 xTg1orqobPIJH6md3u54HXsGwmGAxTm3q/rfDrwzxw/BU23SDZf+OYkn5gdBG8uV+1
	 dUkPzKYTo6SyZM+cgwAbfLXSfIBgbwG1XsGti3JCNLF7xDMqZc0hqN+Io6loSM0wA1
	 mms3CCsesn1X9wp/eINLwCj8IMC5WVMZYPNk80qPWSgeIH+07gquk6/FxN6wNOR9Ej
	 BF9sBkuwivmTw==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1t8mzb-00000002JGi-1ql2;
	Wed, 06 Nov 2024 21:51:07 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: 
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Ricardo Ribalda <ribalda@chromium.org>,
	Zhipeng Lu <alexious@zju.edu.cn>,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	kernel test robot <lkp@intel.com>
Subject: [PATCH] dvbdev: fix the logic when DVB_DYNAMIC_MINORS is not set
Date: Wed,  6 Nov 2024 21:50:55 +0100
Message-ID: <9e067488d8935b8cf00959764a1fa5de85d65725.1730926254.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.47.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

When CONFIG_DVB_DYNAMIC_MINORS, ret is not initialized, and a
semaphore is left at the wrong state, in case of errors.

Make the code simpler and avoid mistakes by having just one error
check logic used weather DVB_DYNAMIC_MINORS is used or not.

Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Closes: https://lore.kernel.org/r/202410201717.ULWWdJv8-lkp@intel.com/
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/media/dvb-core/dvbdev.c | 25 +++++++++----------------
 1 file changed, 9 insertions(+), 16 deletions(-)

diff --git a/drivers/media/dvb-core/dvbdev.c b/drivers/media/dvb-core/dvbdev.c
index 14f323fbada7..9df7c213716a 100644
--- a/drivers/media/dvb-core/dvbdev.c
+++ b/drivers/media/dvb-core/dvbdev.c
@@ -530,30 +530,23 @@ int dvb_register_device(struct dvb_adapter *adap, struct dvb_device **pdvbdev,
 	for (minor = 0; minor < MAX_DVB_MINORS; minor++)
 		if (!dvb_minors[minor])
 			break;
-	if (minor >= MAX_DVB_MINORS) {
-		if (new_node) {
-			list_del(&new_node->list_head);
-			kfree(dvbdevfops);
-			kfree(new_node);
-		}
-		list_del(&dvbdev->list_head);
-		kfree(dvbdev);
-		*pdvbdev = NULL;
-		up_write(&minor_rwsem);
-		mutex_unlock(&dvbdev_register_lock);
-		return -EINVAL;
-	}
 #else
 	minor = nums2minor(adap->num, type, id);
+#endif
 	if (minor >= MAX_DVB_MINORS) {
-		dvb_media_device_free(dvbdev);
+		if (new_node) {
+			list_del(&new_node->list_head);
+			kfree(dvbdevfops);
+			kfree(new_node);
+		}
 		list_del(&dvbdev->list_head);
 		kfree(dvbdev);
 		*pdvbdev = NULL;
+		up_write(&minor_rwsem);
 		mutex_unlock(&dvbdev_register_lock);
-		return ret;
+		return -EINVAL;
 	}
-#endif
+
 	dvbdev->minor = minor;
 	dvb_minors[minor] = dvb_device_get(dvbdev);
 	up_write(&minor_rwsem);
-- 
2.47.0


