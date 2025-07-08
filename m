Return-Path: <linux-media+bounces-37095-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 432F2AFC8B7
	for <lists+linux-media@lfdr.de>; Tue,  8 Jul 2025 12:45:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 63D2D3B04F6
	for <lists+linux-media@lfdr.de>; Tue,  8 Jul 2025 10:44:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9FE32DEA68;
	Tue,  8 Jul 2025 10:41:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="d3XtUyRT"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 978A62DCF7B;
	Tue,  8 Jul 2025 10:41:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751971291; cv=none; b=Ngkx6Rm5qVJiU92j2j9N3aBNIxM0kgaEgjZicLl0OLv3oocBFSLYqZm+DoZKMCF0skIrLXF2hwDb7MPtESPKmVkiPp6d++1VLcDXKrvvje9XkKqI6iMpV3r/AZP2Wll8rzpq3Gyxbd5EmZmQgkB2inJ9393Tm/tXsN+3a0waDmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751971291; c=relaxed/simple;
	bh=BFyCUyrT0Ujus6OGYnAmCl/GqNuIEDJQSk8MQCzrzmo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qXXQUozpsxp3QOGqzGtByh8rUytcmN4yVjsJCYmtBvU4EBNp/BkeoIAx8dhegcix/7pnEXXAbLj/FzuX69E6uwxC3aJI/Nc/2X4IIc+SkLFTfkQOTUeCHq0DNocytc8VWmM25eiN5KXRPTjdloIKRTJU/Ku/1WNxE8N4CLvW9fA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=d3XtUyRT; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.0.172] (mob-5-90-136-241.net.vodafone.it [5.90.136.241])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id AA1625514;
	Tue,  8 Jul 2025 12:40:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1751971248;
	bh=BFyCUyrT0Ujus6OGYnAmCl/GqNuIEDJQSk8MQCzrzmo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=d3XtUyRTSlBKWAyEZ9OacY8yb4d0nb/GR0r/dn4FJISgW805syFgLnohyEdJHgtXX
	 jlUsiqut9xE15NX35R+Zf5Vz8SGJaVRCpgk/MhfDwt5i1HpdyoO7dQR9DUVffljJhc
	 wHQ9Z6HI6oJzu3rZ9q3Ltlna7D8kJTFSoxtsHTEg=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Tue, 08 Jul 2025 12:40:55 +0200
Subject: [PATCH 8/8] media: Documentation: kapi: Add v4l2 extensible
 parameters
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250708-extensible-parameters-validation-v1-8-9fc27c9c728c@ideasonboard.com>
References: <20250708-extensible-parameters-validation-v1-0-9fc27c9c728c@ideasonboard.com>
In-Reply-To: <20250708-extensible-parameters-validation-v1-0-9fc27c9c728c@ideasonboard.com>
To: Dafna Hirschfeld <dafna@fastmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Keke Li <keke.li@amlogic.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, Dan Scally <dan.scally@ideasonboard.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1789;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=BFyCUyrT0Ujus6OGYnAmCl/GqNuIEDJQSk8MQCzrzmo=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBobPXAuvdLqG+nFbVdQsYLUYtlT4MhvtXvbD/G1
 q23FH7dlnyJAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCaGz1wAAKCRByNAaPFqFW
 PNa1EACWDCbdXUMrjjZ3dwSewW2dqOeAYL+/NTASuFxXjqj3O/wzLkc137vzxllzAQOK5ULUVMM
 DO9MIafzKqFzZz/9JKFFw9ASfu+XFeJItR8JvwCED6TZKBBlIlqrespYcbB8b3I7GNuZnkkTot2
 aRqwBe/bOaWMTT4xSxeBNkFfJy+e8aeymuK44B3fEDmSdNz1BGsXo3Dtu9AGSCBJLestNjs8+P4
 apT06q3Yd3enoWtZxPnAWhR3KB2dWrA9qnaMswAK5mImZCB1fYZWMRqiOGkR3gkOsWf76r5c3Po
 EIGWv/fx9jYDkA5ke5K6Tr+SwDwbAm2pbA3YAAdYyJaXD7Z51p3Lm5SndFnuipA3b9pmNDnP7oO
 yOkz+yrbKIdXAMtDvpf4SgvJBcBSB/3V8NEzYwe/fC4hlaRd8GCov0rHoLd3FFlEv0vrni8aGVV
 On/NLU5egtXOJzaXdvK7zNCUb4FcZg4sLFKyUHAtyPTj4XmD2hR2GSlySmQ2nV/2fOxiwnIKSfE
 IzkD+GvQ9bWqgxZFU8laNBYixXaUl+7HrjGNj4CW8j4EaeRfn8/iY/6Z+cAL5mdAWC9IMXOSWbQ
 IKsfxABSHl62egk0pZ7BjsFmO5XLnbi0qyAijE3ZLRGobRb4GdEXZfJMwX3zii34SRNO0HZrVkd
 MMS0qSER9ycIf8Q==
X-Developer-Key: i=jacopo.mondi@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B

Add to the driver-api documentation the v4l2-params.h types and
helpers documentation.

Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 Documentation/driver-api/media/v4l2-core.rst   | 1 +
 Documentation/driver-api/media/v4l2-params.rst | 5 +++++
 MAINTAINERS                                    | 1 +
 3 files changed, 7 insertions(+)

diff --git a/Documentation/driver-api/media/v4l2-core.rst b/Documentation/driver-api/media/v4l2-core.rst
index ad987c34ad2a8460bb95e97adc4d850d624e0b81..2d7793298c6a2046bdd59b185a411e092b659d52 100644
--- a/Documentation/driver-api/media/v4l2-core.rst
+++ b/Documentation/driver-api/media/v4l2-core.rst
@@ -27,3 +27,4 @@ Video4Linux devices
     v4l2-common
     v4l2-tveeprom
     v4l2-jpeg
+    v4l2-params
diff --git a/Documentation/driver-api/media/v4l2-params.rst b/Documentation/driver-api/media/v4l2-params.rst
new file mode 100644
index 0000000000000000000000000000000000000000..8d2a5f004d21dfc3a81255cabbc6b7cce588db71
--- /dev/null
+++ b/Documentation/driver-api/media/v4l2-params.rst
@@ -0,0 +1,5 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+V4L2 extensible parameters kAPI
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+.. kernel-doc:: include/media/v4l2-params.h
diff --git a/MAINTAINERS b/MAINTAINERS
index 3d9a8e06c59eb08360d1e8eea85e450a15ee95af..f03c10092a891a06052484b691409f0c459de87d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -25972,6 +25972,7 @@ V4L2 EXTENSIBLE PARAMETERS FORMAT
 M:	Jacopo Mondi <jacopo.mondi@ideasonboard.com>
 L:	linux-media@vger.kernel.org
 S:	Maintained
+F:	Documentation/driver-api/media/v4l2-params.rst
 F:	Documentation/userspace-api/media/v4l/extensible-parameters.rst
 F:	drivers/media/v4l2-core/v4l2-params.c
 F:	include/media/v4l2-params.h

-- 
2.49.0


