Return-Path: <linux-media+bounces-36460-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 312B8AF01BA
	for <lists+linux-media@lfdr.de>; Tue,  1 Jul 2025 19:27:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1A97244847A
	for <lists+linux-media@lfdr.de>; Tue,  1 Jul 2025 17:27:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E701927F166;
	Tue,  1 Jul 2025 17:27:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VXZOKrE+"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE03419AD89
	for <linux-media@vger.kernel.org>; Tue,  1 Jul 2025 17:27:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751390850; cv=none; b=MDWWAwlknnoYLHw45pv1DaB6D2i5Q7ACEdgodAUi5tBU2jBulvqfszNbKJtAfHgbXZbeun/vDHgt1Y1Jur++HFOHqQSgcx9xW+3ux1oiZqBeSjd1KFIjpVQYGS2uL2xhfZI/wJVNQlqax5Uhw1UI9ZW8cvxF99WSiMNIWPF6xTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751390850; c=relaxed/simple;
	bh=hCQyShvOpRw5lxwsZbE3F4nxUON5xrMzrTJ6bOYAHTI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NG1l/uHVlcenIZ0rGfMTXifrh/tZWUFVN/xzbRjSHG9guLD0cDsGqszGfOA8r5SQPNqCl/InWxLlwUEe85rucRwtAb1B0FP0SULyhHKHIxU6S3+IZ506U43Fskw8Wi5fnuBTKMXIBeCWoEiSb48Y3HzOBzBl5B25l/rK4m2vn3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=VXZOKrE+; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751390847;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=lLcLNVGFCtTCwwH5Vuz0JRd2+UgjBFKMxo5m9TEWhz8=;
	b=VXZOKrE+iyk4k1ix7yEw8zPpuAB3tuUw/q0UjOXUU6bK5k4S7pLRqoXjHvecazCfYgguTa
	uk9b1la6QFN3SwNGq0DiBBhjnZW/FjyYr+hG1TqjO4dMJyqyM0mXV8pHy4seP9rbLV6njK
	tvTM11XA5mRM9G4BiTV4uwkYcN59ljg=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-117-2WSNerf1NXKFNMHmuIUwzA-1; Tue,
 01 Jul 2025 13:27:24 -0400
X-MC-Unique: 2WSNerf1NXKFNMHmuIUwzA-1
X-Mimecast-MFC-AGG-ID: 2WSNerf1NXKFNMHmuIUwzA_1751390843
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id DEB8B192E8DB;
	Tue,  1 Jul 2025 17:27:02 +0000 (UTC)
Received: from desnesn-thinkpadp16vgen1.rmtbr.csb (unknown [10.96.134.31])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id C67F31956066;
	Tue,  1 Jul 2025 17:27:00 +0000 (UTC)
From: Desnes Nunes <desnesn@redhat.com>
To: laurent.pinchart@ideasonboard.com,
	hansg@kernel.org
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Desnes Nunes <desnesn@redhat.com>,
	stable@kernel.org
Subject: [PATCH v2] media: uvcvideo: avoid variable shadowing in uvc_ctrl_cleanup_fh
Date: Tue,  1 Jul 2025 14:25:56 -0300
Message-ID: <20250701172556.117872-1-desnesn@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40

This avoids a variable loop shadowing occurring between the local loop
iterating through the uvc_entity's controls and the global one going
through the pending async controls of the file handle

Cc: stable@kernel.org
Fixes: 10acb9101355 ("media: uvcvideo: Increase/decrease the PM counter per IOCTL")
Signed-off-by: Desnes Nunes <desnesn@redhat.com>
---
 drivers/media/usb/uvc/uvc_ctrl.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
index 44b6513c5264..532615d8484b 100644
--- a/drivers/media/usb/uvc/uvc_ctrl.c
+++ b/drivers/media/usb/uvc/uvc_ctrl.c
@@ -3260,7 +3260,7 @@ int uvc_ctrl_init_device(struct uvc_device *dev)
 void uvc_ctrl_cleanup_fh(struct uvc_fh *handle)
 {
 	struct uvc_entity *entity;
-	int i;
+	unsigned int i;
 
 	guard(mutex)(&handle->chain->ctrl_mutex);
 
@@ -3268,7 +3268,7 @@ void uvc_ctrl_cleanup_fh(struct uvc_fh *handle)
 		return;
 
 	list_for_each_entry(entity, &handle->chain->dev->entities, list) {
-		for (unsigned int i = 0; i < entity->ncontrols; ++i) {
+		for (i = 0; i < entity->ncontrols; ++i) {
 			if (entity->controls[i].handle != handle)
 				continue;
 			uvc_ctrl_set_handle(handle, &entity->controls[i], NULL);
-- 
2.49.0


