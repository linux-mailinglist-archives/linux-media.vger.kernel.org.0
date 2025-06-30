Return-Path: <linux-media+bounces-36317-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 91961AEE1D0
	for <lists+linux-media@lfdr.de>; Mon, 30 Jun 2025 17:03:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AFB6116D469
	for <lists+linux-media@lfdr.de>; Mon, 30 Jun 2025 15:02:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3117F28DB74;
	Mon, 30 Jun 2025 15:02:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="EAFjklqA"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08CEC28D831
	for <linux-media@vger.kernel.org>; Mon, 30 Jun 2025 15:02:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751295742; cv=none; b=aXqbQN1uLOiA+fQYl4wYoqF6Y0hVdNXOwsIx+xcxm2w8W/ifm0O2WO8Gvj3gIEpnC7ygc6PqEtO9Fng/Mfteu3BZ0ePtK0Gyxt+jsT+QrbIef9nh5XNIhc1TNcoZLti7TLjeo77JTaV9m8T+ShxC1RgXyoFw3Q4UpXdlAHSh9N4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751295742; c=relaxed/simple;
	bh=CoeKecybjrCzdcmHMtsPZATjj/29WnTxZO6CcBjFoSo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=nAfhuXJYP7CTDKUY45i2ulwMjjCHxYU+PE4WqRXqruoS0/SOOsuMVfHsHHVwBcKFYnR6TKrJlDlgmuqruv19DByC5ifv+3dzHBQPH8WGM2UzlEpO/D6doruE76eG0kA4tWMkgZt/pZ7mh7CIARphC8NJyc23Gc6suih5hTN8xE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=EAFjklqA; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751295740;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=SqxjSFXYb2YZgyXnZn9uF3wsVkTKwLCeC7GkQeDHF7k=;
	b=EAFjklqAu2EigB82XUaSBd2y8JZpDEKslJyQxWvqlzsoPw56iHTYYUMWU+mnPD0mCWUbUC
	/2fmE4Ipj5uzsuzkQ5dDzAQgtltxdVW50Xw6b3W8i7SsbKyIsQWnYiwNkcGg4AxdvqLnMT
	ts+Qk6YrpsuF8DZ/oQpQZuduYWmidYk=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-336-lr-bNMVFMeCiUV4pVd9Xlw-1; Mon,
 30 Jun 2025 11:02:15 -0400
X-MC-Unique: lr-bNMVFMeCiUV4pVd9Xlw-1
X-Mimecast-MFC-AGG-ID: lr-bNMVFMeCiUV4pVd9Xlw_1751295731
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 89F001809C8C;
	Mon, 30 Jun 2025 15:02:11 +0000 (UTC)
Received: from desnesn-thinkpadp16vgen1.rmtbr.csb (unknown [10.96.134.103])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 72880180045C;
	Mon, 30 Jun 2025 15:02:09 +0000 (UTC)
From: Desnes Nunes <desnesn@redhat.com>
To: laurent.pinchart@ideasonboard.com,
	hansg@kernel.org
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Desnes Nunes <desnesn@redhat.com>,
	stable@vger.kernel.org
Subject: [PATCH] media: uvcvideo: fix build error in uvc_ctrl_cleanup_fh
Date: Mon, 30 Jun 2025 12:01:06 -0300
Message-ID: <20250630150107.23421-1-desnesn@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

This fixes the following compilation failure: "error: ‘for’ loop
initial declarations are only allowed in C99 or C11 mode"

Cc: stable@vger.kernel.org
Fixes: 221cd51efe45 ("media: uvcvideo: Remove dangling pointers")
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


