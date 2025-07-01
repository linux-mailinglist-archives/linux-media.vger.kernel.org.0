Return-Path: <linux-media+bounces-36442-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B3BCBAEFD6F
	for <lists+linux-media@lfdr.de>; Tue,  1 Jul 2025 17:00:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7778616554D
	for <lists+linux-media@lfdr.de>; Tue,  1 Jul 2025 14:58:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A29F280025;
	Tue,  1 Jul 2025 14:54:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="DBwtPMZt"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06A1527FB38
	for <linux-media@vger.kernel.org>; Tue,  1 Jul 2025 14:54:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751381682; cv=none; b=djNWGvitnyx2Y4Id0up0KKCpdHLgxsfwr8n79ei06z8m7dVIhMlFt/FuaCPF5fdfpxVru3smBZnsDYYc1hiUQ0sEzSnx7qLLCBIV4ZDKv5AL5asZRW5z658uCIoYuoj/W0CuZBot2NvO4Zb7qYlQN8oviCfjc2YghUt9DomzzsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751381682; c=relaxed/simple;
	bh=x6tJXHV4fk1EVQw4K1J3xGyEuEu2hZK7D0Ti0UAtj1Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Cf0OhMVq9IcPEPTCzzfU+Bq7s/YAf3f7wmLoOoiWMZpl7NZJpBV41tJrE9dcCS1SHRmV0cSwnabMtSk6ktpe60nDtdLdkJf68yGubUhSsTXdFFYEJNVDcuQ1VuP0S/Rg6oIOFGGrXMe2z9kLa4l9L3ciepcUHjTh5ql8gNzmZi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=DBwtPMZt; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751381679;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=0zQvDsQLPoeUA3QBNmaBPCh3oUPwT2tmL8BD3RO1RuA=;
	b=DBwtPMZtl2qojQ7oQIKGzXwjKDSRFmkHGS/VOGuJBcZW8cw7FM+HgxGXVpoZ7Db+HpX0BB
	lBmuekjS1mKNc1iUBGjicj3H2hI9IyQ91ARmOb/aA6A0H7I73vlZSzaajT3xdpWKnOIw3+
	uBw0iGmHnFZqBo8X4vPb3zA09HnDNvU=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-147-ORK0-R59OeWEBmJaOUU-sw-1; Tue,
 01 Jul 2025 10:54:36 -0400
X-MC-Unique: ORK0-R59OeWEBmJaOUU-sw-1
X-Mimecast-MFC-AGG-ID: ORK0-R59OeWEBmJaOUU-sw_1751381675
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 76BD61955ECF;
	Tue,  1 Jul 2025 14:54:35 +0000 (UTC)
Received: from desnesn-thinkpadp16vgen1.rmtbr.csb (unknown [10.96.134.31])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id AAC6F30001B1;
	Tue,  1 Jul 2025 14:54:33 +0000 (UTC)
From: Desnes Nunes <desnesn@redhat.com>
To: laurent.pinchart@ideasonboard.com,
	hansg@kernel.org
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Desnes Nunes <desnesn@redhat.com>
Subject: [PATCH] media: uvcvideo: avoid variable shadowing in uvc_ctrl_cleanup_fh
Date: Tue,  1 Jul 2025 11:52:40 -0300
Message-ID: <20250701145240.105959-1-desnesn@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4

This avoids a variable loop shadowing occurring between the local loop
iterating through the uvc_entity's controls and the global one going
through the pending async controls of the file handle

Fixes: 10acb9101355 ("media: uvcvideo: Increase/decrease the PM counter per IOCTL")
Signed-off-by: Desnes Nunes <desnesn@redhat.com>
---
 drivers/media/usb/uvc/uvc_ctrl.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
index 44b6513c5264..91cc874da798 100644
--- a/drivers/media/usb/uvc/uvc_ctrl.c
+++ b/drivers/media/usb/uvc/uvc_ctrl.c
@@ -3260,7 +3260,6 @@ int uvc_ctrl_init_device(struct uvc_device *dev)
 void uvc_ctrl_cleanup_fh(struct uvc_fh *handle)
 {
 	struct uvc_entity *entity;
-	int i;
 
 	guard(mutex)(&handle->chain->ctrl_mutex);
 
@@ -3278,7 +3277,7 @@ void uvc_ctrl_cleanup_fh(struct uvc_fh *handle)
 	if (!WARN_ON(handle->pending_async_ctrls))
 		return;
 
-	for (i = 0; i < handle->pending_async_ctrls; i++)
+	for (unsigned int j = 0; j < handle->pending_async_ctrls; j++)
 		uvc_pm_put(handle->stream->dev);
 }
 
-- 
2.49.0


