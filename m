Return-Path: <linux-media+bounces-37115-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 96D47AFCE27
	for <lists+linux-media@lfdr.de>; Tue,  8 Jul 2025 16:49:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D0D1442054C
	for <lists+linux-media@lfdr.de>; Tue,  8 Jul 2025 14:48:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6EF9A217722;
	Tue,  8 Jul 2025 14:48:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fvFET4ZK"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B98D2DECD4
	for <linux-media@vger.kernel.org>; Tue,  8 Jul 2025 14:48:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751986101; cv=none; b=pKm4zcQHyGs5OlxuWLVRBq6+HxzkGsv4ENMGG3AG3zx+B1CYbPV+KgluKDTePKHWiIVLTMsZPc0de9+x814wM+/P8+3I32JMaVJprbGrF19p+ysVbZJqwFzitOeO29w7wf7k8JBZOLu/MEG/x6HJV7Ula99EEn5pXdmCHvZ9ufE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751986101; c=relaxed/simple;
	bh=Lu+dqbRssdLelEhUsOnvzmIzrzsEQZ2lVBnlTcuy/7s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rJp0PI7mAPsCpMUQ9Q8CGSXamBdSzZ8xv2Kf9KNB+UV5R1w4MFFTr1kfHxLqlPV2fOYkR+zSDcTVnEVhKCvjNgJcJainR5ZwfUjpevwG/HarqhMNDXGjxlAgODVdq6PHVsATe8VsDZQeFtkIBwCbnukI1I2f4Zp3suKStneQXqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fvFET4ZK; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751986098;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=CD0Blo9hsBo+ShaKGEv8DmxldgP6HPhrWHWO7//oza4=;
	b=fvFET4ZKI3wtp06R4RdglMeDnz5t7a6qBCDmxKhoP13f6p4DmfKt4PUJKVxX8ykb3ufCOr
	P2sDHG06bhxBR8dtEpcsDpu/VVd/kcUCmN9uvUN5xT6bqcQqeC3NHElkGYui/mPVefbRBd
	d5V7c+CxGEBWekDsQNxldp/jEsWjuGo=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-300-u1ldjB6jMzijgRaZkf9dug-1; Tue,
 08 Jul 2025 10:48:15 -0400
X-MC-Unique: u1ldjB6jMzijgRaZkf9dug-1
X-Mimecast-MFC-AGG-ID: u1ldjB6jMzijgRaZkf9dug_1751986094
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 3E6611800289;
	Tue,  8 Jul 2025 14:48:14 +0000 (UTC)
Received: from desnesn-thinkpadp16vgen1.rmtbr.csb (unknown [10.96.134.60])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 3E11219560AB;
	Tue,  8 Jul 2025 14:48:11 +0000 (UTC)
From: Desnes Nunes <desnesn@redhat.com>
To: laurent.pinchart@ideasonboard.com,
	hansg@kernel.org
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Desnes Nunes <desnesn@redhat.com>,
	stable@kernel.org
Subject: [PATCH v3] media: uvcvideo: avoid variable shadowing in uvc_ctrl_cleanup_fh
Date: Tue,  8 Jul 2025 11:46:28 -0300
Message-ID: <20250708144628.273384-1-desnesn@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

This avoids a variable loop shadowing occurring between the local loop
iterating through the uvc_entity's controls and the global one going
through the pending async controls of the file handle

Cc: stable@kernel.org
Fixes: 10acb9101355 ("media: uvcvideo: Increase/decrease the PM counter per IOCTL")
Signed-off-by: Desnes Nunes <desnesn@redhat.com>
---
 drivers/media/usb/uvc/uvc_ctrl.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
index 303b7509ec47..6b9486749c3f 100644
--- a/drivers/media/usb/uvc/uvc_ctrl.c
+++ b/drivers/media/usb/uvc/uvc_ctrl.c
@@ -3299,7 +3299,6 @@ int uvc_ctrl_init_device(struct uvc_device *dev)
 void uvc_ctrl_cleanup_fh(struct uvc_fh *handle)
 {
 	struct uvc_entity *entity;
-	int i;
 
 	guard(mutex)(&handle->chain->ctrl_mutex);
 
@@ -3317,7 +3316,7 @@ void uvc_ctrl_cleanup_fh(struct uvc_fh *handle)
 	if (!WARN_ON(handle->pending_async_ctrls))
 		return;
 
-	for (i = 0; i < handle->pending_async_ctrls; i++)
+	for (unsigned int i = 0; i < handle->pending_async_ctrls; i++)
 		uvc_pm_put(handle->stream->dev);
 }
 
-- 
2.50.0


