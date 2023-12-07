Return-Path: <linux-media+bounces-1797-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id AD54880834A
	for <lists+linux-media@lfdr.de>; Thu,  7 Dec 2023 09:38:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4D146B21D7F
	for <lists+linux-media@lfdr.de>; Thu,  7 Dec 2023 08:38:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1905328B6;
	Thu,  7 Dec 2023 08:38:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="IzW5iYKB"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6ACA310C3
	for <linux-media@vger.kernel.org>; Thu,  7 Dec 2023 00:38:48 -0800 (PST)
Received: from umang.jain (unknown [103.251.226.79])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id E3A7CB90;
	Thu,  7 Dec 2023 09:38:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1701938285;
	bh=GuGw+LT7WjP9W1RXq84kTQWeC0YJnXrkQxHOAgp1UF0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=IzW5iYKB+18Ayv59v7KMgX4dmzXmB56MQnzIcXtJdKBKt+39cl7HysP8nBynNU/wh
	 RmG9Z74ukJpa3Y6Ebftl0HwrGguhoAiSx/iSLLNqI9S7wOcwLSJOv/ieWDVhnbibUz
	 /oR3CDV/Qt811a8OriSz9bqpT69fOyn+uPI1A+5c=
From: Umang Jain <umang.jain@ideasonboard.com>
To: linux-staging@lists.linux.dev,
	linux-rpi-kernel@lists.infradead.org,
	linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Stefan Wahren <stefan.wahren@i2se.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dan Carpenter <error27@gmail.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	"Ricardo B . Marliere" <ricardo@marliere.net>,
	Umang Jain <umang.jain@ideasonboard.com>
Subject: [PATCH v3 1/2] staging: vc04_services: vchiq_arm: Use %p to log pointer address
Date: Thu,  7 Dec 2023 14:08:36 +0530
Message-ID: <20231207083837.153843-2-umang.jain@ideasonboard.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231207083837.153843-1-umang.jain@ideasonboard.com>
References: <20231207083837.153843-1-umang.jain@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Solves the following Smatch warnings:
service_callback() warn: argument 7 to %lx specifier is cast from pointer
service_callback() warn: argument 11 to %lx specifier is cast from pointer
service_callback() warn: argument 12 to %lx specifier is cast from pointer
service_callback() warn: argument 13 to %lx specifier is cast from pointer

%p will print the hashed pointer to dynamic debug.
In order to print the unmodified pointer address, one can use the
`no_hash_pointers` via kernel parameters.

Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
---
 .../staging/vc04_services/interface/vchiq_arm/vchiq_arm.c  | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
index 4b4ff469d3a3..1579bd4e5263 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
@@ -1088,10 +1088,9 @@ service_callback(struct vchiq_instance *instance, enum vchiq_reason reason,
 	rcu_read_unlock();
 
 	dev_dbg(service->state->dev,
-		"arm: service %lx(%d,%p), reason %d, header %lx, instance %lx, bulk_userdata %lx\n",
-		(unsigned long)user_service, service->localport,
-		user_service->userdata, reason, (unsigned long)header,
-		(unsigned long)instance, (unsigned long)bulk_userdata);
+		"arm: service %p(%d,%p), reason %d, header %p, instance %p, bulk_userdata %p\n",
+		user_service, service->localport, user_service->userdata,
+		reason, header, instance, bulk_userdata);
 
 	if (header && user_service->is_vchi) {
 		spin_lock(&msg_queue_spinlock);
-- 
2.41.0


