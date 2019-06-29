Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1D71A5AAAB
	for <lists+linux-media@lfdr.de>; Sat, 29 Jun 2019 14:14:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727025AbfF2MOc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 29 Jun 2019 08:14:32 -0400
Received: from mout.gmx.net ([212.227.17.21]:39173 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726906AbfF2MOc (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 29 Jun 2019 08:14:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1561810445;
        bh=fL2+AI98j8bIYBwN2CiIF9PN7Bc2vnixmlYqMuIDlao=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
        b=A4ErE7VB5/vRVwUyDfddYINa+liW3u5mZfMjL+JzWNgBQuSW+yj9ScgmDz6LVOADS
         UKT+Fonv/CR3DINhObNHhqA5MUTU/F0FeIF5EaEnvYf1LqyjEAdLufzdjE+zLa2wda
         QMhGVTCG5B09TEVN68rAA+MbfiegnDklXW2Ysb5g=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.localdomain ([37.4.249.111]) by mail.gmx.com
 (mrgmx103 [212.227.17.168]) with ESMTPSA (Nemesis) id
 0Mb8HX-1i06pq1FwB-00KiTJ; Sat, 29 Jun 2019 14:14:05 +0200
From:   Stefan Wahren <wahrenst@gmx.net>
To:     Eric Anholt <eric@anholt.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Dave Stevenson <dave.stevenson@raspberrypi.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, devel@driverdev.osuosl.org,
        linux-media@vger.kernel.org, Stefan Wahren <wahrenst@gmx.net>
Subject: [PATCH V2 02/29] staging: bcm2835-camera: Replace spinlock protecting context_map with mutex
Date:   Sat, 29 Jun 2019 14:13:17 +0200
Message-Id: <1561810410-8829-3-git-send-email-wahrenst@gmx.net>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1561810410-8829-1-git-send-email-wahrenst@gmx.net>
References: <1561810410-8829-1-git-send-email-wahrenst@gmx.net>
X-Provags-ID: V03:K1:BqPhO65rcNnqQtgYuhpJKHix52bqJyO4dyUafgpRYICvlwQuxw5
 oKUAAST17Z2Xq28lb8OIDSpRKKloIbfqiNcGkN7v5wGB6Ztb7kyzBoUy/PK9gTbfCEOYYhE
 xj6mzji8vPjxJJP11KspOlmTI22GjctRUcjmW2209H9h05c7n2dDlhVY+ldisMTZLtnQMRO
 g75rZ4Yf0bD4rX0QQtq2A==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:P9Ad1yr2X78=:ZdQxY67sLVi9AnBy6PbcGQ
 6nsc9UydiYzpzYIgGi6HO+euckaAGS+/1mIrYUNhRial7uPZTXfliUT94FC60aImsV1WMc8lh
 jstzRlm2XSRafrMRsVCgQh2QWgar2VwoKjnjyuXGiZ8mur1emnl4rs4tDbxg3GQwTJI6eLkiW
 px3TmJynMH6h4Y7E/Qz3W1gNWdQG8qs3/h7VBuT6+vWqjJfgeuh10lJZ/v7Bn0fTQ2gYZu2Jr
 FYdD+JbV/jwRX/EdySNJg7pTWrBjU0GTXw5STz/9iQlLfFnKuYl49ilvknSGGDZpoSA/jVtld
 rCH5oXUGBZTc1dl1HzUvWqFvRDTGIOEJSZBcpxjitTnfXW1QKOx6kFXRqX3BMm/8WPoZZCdcl
 bfU5F+MdckGHNLq6+HQ9/sqq7//uhS4yUXYLzofiK8eArrsxpaWsk43Wbh2PrUDQhSpQFb/AH
 sUAqiD+OuH2KLVW4VYAtSXIDxQQm/jm4f0iMS6V5t/iX4eisMVcxpmbPl4FznqMDFjvAwmFsf
 VVO1OL2ZOXftATO4N0nXW4IRPLNBqBCHJDsKajf5xe3P97ERR4FD2y6+CQCMSSsURtYgIW/HM
 zSbGUT+bp4i3vmwRfvkfGPlBb7dAtQY3FKcY8Q4p+fsVQHjYg94PMPdakGLRAz3x0MFcYkW/9
 MaX6YGJqnzuD+9L6odUBoPqegqvNHAclkz5aEbF3gkKBJbxvhSlZre4EoWLqV8t0ldeWidg2t
 srT38TflRmIt0fUPSBmZ094byrImCl6J3qU9aWfNVP2jKOxvrGhdE4rZwsWQa8tERiRbSspdJ
 fbauY0eEySUh+ka+T/4hy7SwutgI+AInZ78pJjdahK+UAxnq5PyaJypRUKoceElInhvqfWCKr
 8ll1U7H1dU/un1aNK/K3ON2ExrStBldRRXFPm8Ry6rWk4Qid7psyyPa79lB2nUaHtfhk/WN/R
 s1xxsdJAJ9ZmRl+M1tap17JM+96gdVjm7VdXINPoQptnNRTu8UfYDMK3duJ0I12XoTbfKANrN
 RhaTRAMHtiVlo4ZJ0afCPoi1SD0zpaTEGm74KfKnvGZBu4f4ZJIxJl6MVSy3r8mjqtjFnaHBV
 o7/J2iHCDPisIo=
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Dave Stevenson <dave.stevenson@raspberrypi.org>

The commit "staging: bcm2835-camera: Replace open-coded idr with a struct =
idr."
replaced an internal implementation of an idr with the standard functions
and a spinlock. idr_alloc(GFP_KERNEL) can sleep whilst calling kmem_cache_=
alloc
to allocate the new node, but this is not valid whilst in an atomic contex=
t
due to the spinlock.

There is no need for this to be a spinlock as a standard mutex is
sufficient.

Fixes: 950fd867c635 ("staging: bcm2835-camera: Replace open-coded idr with=
 a struct idr.")
Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.org>
Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
Acked-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Acked-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
=2D--
 drivers/staging/vc04_services/bcm2835-camera/mmal-vchiq.c | 13 +++++++---=
---
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/vc04_services/bcm2835-camera/mmal-vchiq.c b/d=
rivers/staging/vc04_services/bcm2835-camera/mmal-vchiq.c
index 16af735..f1bb900 100644
=2D-- a/drivers/staging/vc04_services/bcm2835-camera/mmal-vchiq.c
+++ b/drivers/staging/vc04_services/bcm2835-camera/mmal-vchiq.c
@@ -161,7 +161,8 @@ struct vchiq_mmal_instance {
 	void *bulk_scratch;

 	struct idr context_map;
-	spinlock_t context_map_lock;
+	/* protect accesses to context_map */
+	struct mutex context_map_lock;

 	/* component to use next */
 	int component_idx;
@@ -184,10 +185,10 @@ get_msg_context(struct vchiq_mmal_instance *instance=
)
 	 * that when we service the VCHI reply, we can look up what
 	 * message is being replied to.
 	 */
-	spin_lock(&instance->context_map_lock);
+	mutex_lock(&instance->context_map_lock);
 	handle =3D idr_alloc(&instance->context_map, msg_context,
 			   0, 0, GFP_KERNEL);
-	spin_unlock(&instance->context_map_lock);
+	mutex_unlock(&instance->context_map_lock);

 	if (handle < 0) {
 		kfree(msg_context);
@@ -211,9 +212,9 @@ release_msg_context(struct mmal_msg_context *msg_conte=
xt)
 {
 	struct vchiq_mmal_instance *instance =3D msg_context->instance;

-	spin_lock(&instance->context_map_lock);
+	mutex_lock(&instance->context_map_lock);
 	idr_remove(&instance->context_map, msg_context->handle);
-	spin_unlock(&instance->context_map_lock);
+	mutex_unlock(&instance->context_map_lock);
 	kfree(msg_context);
 }

@@ -1849,7 +1850,7 @@ int vchiq_mmal_init(struct vchiq_mmal_instance **out=
_instance)

 	instance->bulk_scratch =3D vmalloc(PAGE_SIZE);

-	spin_lock_init(&instance->context_map_lock);
+	mutex_init(&instance->context_map_lock);
 	idr_init_base(&instance->context_map, 1);

 	params.callback_param =3D instance;
=2D-
2.7.4

