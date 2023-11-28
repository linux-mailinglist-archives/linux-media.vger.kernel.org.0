Return-Path: <linux-media+bounces-1298-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FECF7FC52E
	for <lists+linux-media@lfdr.de>; Tue, 28 Nov 2023 21:20:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E000E281A28
	for <lists+linux-media@lfdr.de>; Tue, 28 Nov 2023 20:20:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEA874E1CA;
	Tue, 28 Nov 2023 20:20:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="q5OiIzWl"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D3C783
	for <linux-media@vger.kernel.org>; Tue, 28 Nov 2023 12:20:20 -0800 (PST)
Received: from umang.jain (unknown [103.238.109.11])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 45631158A;
	Tue, 28 Nov 2023 21:19:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1701202784;
	bh=wkKoLQqcNpQyUihe4/du08ibvxXUylUKuvuP3TR35/o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=q5OiIzWli8CCUMsatd/uBZo33Y82CJoqPuRC4rjE6/uEp7xWijdlr1aLnG8X99JQp
	 3Zm9091lSes7xBfv7wYM7+5sBTTxVcsBIelsjb8Ivm7zWek1GIVO78QpyL1ykfxPnP
	 k+9JTZzN0E41CdKcmq7id2mzHVSn1/cNX5XkjE40=
From: Umang Jain <umang.jain@ideasonboard.com>
To: linux-staging@lists.linux.dev,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-media@vger.kernel.org
Cc: Stefan Wahren <stefan.wahren@i2se.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dan Carpenter <error27@gmail.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	"Ricardo B . Marliere" <ricardo@marliere.net>,
	Umang Jain <umang.jain@ideasonboard.com>
Subject: [PATCH v2 1/2] staging: vc04_services: Use %p to log pointer address
Date: Wed, 29 Nov 2023 01:50:06 +0530
Message-ID: <20231128202007.489294-2-umang.jain@ideasonboard.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231128202007.489294-1-umang.jain@ideasonboard.com>
References: <20231128202007.489294-1-umang.jain@ideasonboard.com>
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
index 0db5541e42cb..600beea50453 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
@@ -1087,10 +1087,9 @@ service_callback(struct vchiq_instance *instance, enum vchiq_reason reason,
 	rcu_read_unlock();
 
 	dev_dbg(service->state->dev,
-		"arm: trace: service %lx(%d,%p), reason %d, header %lx, instance %lx, bulk_userdata %lx\n",
-		(unsigned long)user_service, service->localport,
-		user_service->userdata, reason, (unsigned long)header,
-		(unsigned long)instance, (unsigned long)bulk_userdata);
+		"arm: trace: service %p(%d,%p), reason %d, header %p, instance %p, bulk_userdata %p\n",
+		user_service, service->localport, user_service->userdata,
+		reason, header, instance, bulk_userdata);
 
 	if (header && user_service->is_vchi) {
 		spin_lock(&msg_queue_spinlock);
-- 
2.41.0


