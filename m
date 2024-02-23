Return-Path: <linux-media+bounces-5746-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B37D860D97
	for <lists+linux-media@lfdr.de>; Fri, 23 Feb 2024 10:08:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9E709B26014
	for <lists+linux-media@lfdr.de>; Fri, 23 Feb 2024 09:08:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95A401B598;
	Fri, 23 Feb 2024 09:08:49 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EE6E1A28C
	for <linux-media@vger.kernel.org>; Fri, 23 Feb 2024 09:08:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708679329; cv=none; b=VJmYdaSXgDBY6rgaIhMejiTZI/Bvuszw1G+w96V+VarXokb+JmObjmWW2mwemC35L1aVYE+7GRjoMpPI3pppwldlDaSMiK0q6qQ+gyRb6ZHcDyPyoxyvbH6br1W19Gl+j0TmVUtmdrpFc1sAsVn7Xlsy/1drJxQVsEpcWpEl7wE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708679329; c=relaxed/simple;
	bh=cvBbN/KwxTcbv81utLeDZNZxlti6Rqdldo4hQ30KpQY=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=OC3SnCCYlZyLtbMfAQrWVajQQ59TrW4OYAtATwf67u0aZXB3KoO8sVcL4SzOepFPCyrwGa+dvdt/mLCWfskqsyriAEM180htYrF9+vp+uXMzkgHgL98zGPku0wp53BEvGqLg/XOkV6OntKBii8QZe66uoYJ0A2fG6zmAdDWKeu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90405C433F1
	for <linux-media@vger.kernel.org>; Fri, 23 Feb 2024 09:08:48 +0000 (UTC)
Message-ID: <97eeae1f-a8e4-4feb-98f3-80113de3e6d6@xs4all.nl>
Date: Fri, 23 Feb 2024 10:08:47 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US, nl
To: Linux Media Mailing List <linux-media@vger.kernel.org>
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH] media: cec: return -ENODEV instead of -ENXIO if unregistered
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

If the CEC device is unregistered, then an attempt to open
the device node should result in an -ENODEV error instead of
-ENXIO.

Document this as well in cec-func-open.rst.

This is consistent with the error code returned by other
file operations such as ioctl.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 Documentation/userspace-api/media/cec/cec-func-open.rst | 4 ++--
 drivers/media/cec/core/cec-core.c                       | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/Documentation/userspace-api/media/cec/cec-func-open.rst b/Documentation/userspace-api/media/cec/cec-func-open.rst
index d86563a34b9e..125c8ac6680b 100644
--- a/Documentation/userspace-api/media/cec/cec-func-open.rst
+++ b/Documentation/userspace-api/media/cec/cec-func-open.rst
@@ -70,5 +70,5 @@ include:
 ``ENOMEM``
     Insufficient kernel memory was available.

-``ENXIO``
-    No device corresponding to this device special file exists.
+``ENODEV``
+    Device not found or was removed.
diff --git a/drivers/media/cec/core/cec-core.c b/drivers/media/cec/core/cec-core.c
index 5a54db839e5d..6f940df0230c 100644
--- a/drivers/media/cec/core/cec-core.c
+++ b/drivers/media/cec/core/cec-core.c
@@ -62,12 +62,12 @@ int cec_get_device(struct cec_devnode *devnode)
 	 */
 	mutex_lock(&devnode->lock);
 	/*
-	 * return ENXIO if the cec device has been removed
+	 * return ENODEV if the cec device has been removed
 	 * already or if it is not registered anymore.
 	 */
 	if (!devnode->registered) {
 		mutex_unlock(&devnode->lock);
-		return -ENXIO;
+		return -ENODEV;
 	}
 	/* and increase the device refcount */
 	get_device(&devnode->dev);
-- 
2.43.0


