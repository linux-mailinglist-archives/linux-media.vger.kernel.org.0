Return-Path: <linux-media+bounces-45933-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 36345C19A0C
	for <lists+linux-media@lfdr.de>; Wed, 29 Oct 2025 11:16:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6156A424E95
	for <lists+linux-media@lfdr.de>; Wed, 29 Oct 2025 10:15:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63ECB2EB859;
	Wed, 29 Oct 2025 10:15:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="luiQnrDd"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C17E72264D5
	for <linux-media@vger.kernel.org>; Wed, 29 Oct 2025 10:15:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761732953; cv=none; b=UM6q7GqCVhVRGKXg2VSjgkLLYtWDJc3pmwvsCIPcEpCt3B1bvSmhaLkT42CTPprOe1lizqRu3D3PBtioluh96YHlJC+h7MsS/RmYHDm+kVb0auudATOz0O+T+FYu0aKuiuPFd0YQ3FMwxIT2H/noBT8O3WbNgMg9vMLYu3kpbQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761732953; c=relaxed/simple;
	bh=R6cklo1Wz6bz7OLLbFe7PuN+R0zargIe1AV7OaYSZL8=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:Content-Type; b=VvRK5ymaUzR/VZ/rG7oJ1la1bAQD2lmxPZ9KRTZFjKw2xTvRyiASN4OzAlWcIGFMzAUkp96bp4nQkzhNu4G/wGjYumhGpQHLYAJhyynIU1HvOqHLQkCuN3wK/xakgd7v8NA2siMd3SpjPhqsP/oG9g+8QENo66uqz63u3Lfgzio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=luiQnrDd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7A23C4CEF7;
	Wed, 29 Oct 2025 10:15:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761732953;
	bh=R6cklo1Wz6bz7OLLbFe7PuN+R0zargIe1AV7OaYSZL8=;
	h=Date:From:Subject:To:Cc:From;
	b=luiQnrDdOhXTqrXFLLHbwClI7zj2KonRz2UeKz8ePKWxIAkJaw0g4VYnBVKhhuHtn
	 Fxrdnb4Cb4HFW3QrANnizyStV0LMRkn1ZY1Si5Usz3DRAU/6hKHDxY49mGL1m0iCqL
	 dAHunJSJ0l597/FwTj8/HsgIDgsvUWnzX7GW1a3Gzm8xUKn20I16fvIOWrZZaIlRPv
	 PArpnXv5BsiM0LuSnHezIJom9+cYFIE4i5/6nXSYcz8ehHk49annVKlUYHicG71jV9
	 2ik/ScGgvIykjA7vjOag5MX2LUEWiq+7ru3X8YeE9QFiParAg71bkb0ZU3DTXmaA7m
	 Kn+W9bixO868A==
Message-ID: <b960f0fc-36e9-46c3-b56f-a06f6525d5ad@kernel.org>
Date: Wed, 29 Oct 2025 11:15:51 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Content-Language: en-US, nl
Subject: [PATCH] v4l2-compliance: skip V4L2_CID_PRIVATE_BASE check for UVC
To: Linux Media Mailing List <linux-media@vger.kernel.org>
Cc: Ricardo Ribalda <ribalda@chromium.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

UVC doesn't support V4L2_CID_PRIVATE_BASE, so skip the check.

Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>
---
Ricardo, can you test this to verify that this solves the issue?
---
diff --git a/utils/v4l2-compliance/v4l2-test-controls.cpp b/utils/v4l2-compliance/v4l2-test-controls.cpp
index e4925ca3..73a6a3be 100644
--- a/utils/v4l2-compliance/v4l2-test-controls.cpp
+++ b/utils/v4l2-compliance/v4l2-test-controls.cpp
@@ -321,6 +321,9 @@ int testQueryExtControls(struct node *node)
 	if (user_controls != user_controls_check)
 		return fail("expected %d user controls, got %d\n",
 			user_controls_check, user_controls);
+	/* UVC doesn't support V4L2_CID_PRIVATE_BASE */
+	if (is_uvcvideo)
+		priv_user_controls_check = 0;
 	if (priv_user_controls != priv_user_controls_check)
 		return fail("expected %d private controls, got %d\n",
 			priv_user_controls_check, priv_user_controls);

