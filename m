Return-Path: <linux-media+bounces-5749-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5624D860DBA
	for <lists+linux-media@lfdr.de>; Fri, 23 Feb 2024 10:15:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 11052282BA3
	for <lists+linux-media@lfdr.de>; Fri, 23 Feb 2024 09:15:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B516B2E41C;
	Fri, 23 Feb 2024 09:15:22 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6052C19473
	for <linux-media@vger.kernel.org>; Fri, 23 Feb 2024 09:15:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708679722; cv=none; b=N04ryBrpWyHz7MaWz5h14+tGEkmFo6G8oMPspQb/uKJCum3Cr/DLpJscFrAEkRWUmVASu8410x1/wJ4bdVcG2yAk2jdm5E3TyLO9x2Vc8FTzTOmyXCTElQYKrBQvus7S4sYCGw00zcwfifCl3WUHiUrFPPr4x82EwNM5O6ipklM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708679722; c=relaxed/simple;
	bh=5S+PT3ehxCQuf2SQhEVqJmQsXiM64gJwA556shQUEJ8=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=rOp0O37ig9WRwSv2208Z7cQ2Iq1GFPrF+gsUVT8j1pB2i6QqmjRsxoJ6ysUt+GiZr3fqj4N2OiKvrgpo0t/Sxj9+nlkFD0pv+Vf+otpuPS0u4+BB5I+s3wOW72/5qKUG/XmKxqM3U3veugBH9Hd+heQYjjNr+P1pITHMRD/VTfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A87F9C433F1
	for <linux-media@vger.kernel.org>; Fri, 23 Feb 2024 09:15:21 +0000 (UTC)
Message-ID: <50346832-e726-4bb4-9f9b-375713afa5d5@xs4all.nl>
Date: Fri, 23 Feb 2024 10:15:20 +0100
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
Subject: [PATCH] doc: media: v4l/func-open.rst: ENXIO should be ENODEV
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

The error that V4L2 returns when an attempt is made to open an
unregisted device node is ENODEV, no ENXIO. Update the documentation.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 Documentation/userspace-api/media/v4l/func-open.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/userspace-api/media/v4l/func-open.rst b/Documentation/userspace-api/media/v4l/func-open.rst
index ba23ff1e45dd..be3808cbf876 100644
--- a/Documentation/userspace-api/media/v4l/func-open.rst
+++ b/Documentation/userspace-api/media/v4l/func-open.rst
@@ -65,8 +65,8 @@ EBUSY
     The driver does not support multiple opens and the device is already
     in use.

-ENXIO
-    No device corresponding to this device special file exists.
+ENODEV
+    Device not found or was removed.

 ENOMEM
     Not enough kernel memory was available to complete the request.
-- 
2.43.0


