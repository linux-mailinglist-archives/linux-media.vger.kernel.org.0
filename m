Return-Path: <linux-media+bounces-45342-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2861FC00072
	for <lists+linux-media@lfdr.de>; Thu, 23 Oct 2025 10:53:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 211BF18869F7
	for <lists+linux-media@lfdr.de>; Thu, 23 Oct 2025 08:53:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5AB6C303CB6;
	Thu, 23 Oct 2025 08:53:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g8QEnhro"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B771B246795
	for <linux-media@vger.kernel.org>; Thu, 23 Oct 2025 08:53:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761209595; cv=none; b=f5YOQxqhxXilvTCgli+0TTyUt50Dz4pYiQQvhF1cIFqtm6JFCJ1tDEprM8FuHlkiwFORD13c3OXl0kwYY90NKqeseF02CBl6mUNGPo/+qPbgD9FMO/1Hqu2eD7pjTIzogxeDd8QybKiESleD7mvBYDWCeI1xFYUIw4UFiKXdNVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761209595; c=relaxed/simple;
	bh=YRCmPBKSZLTi9QZRwFYQNLKIgqs2KGJWya8HivNUSBQ=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Content-Type; b=oNANlOjzzWRki+hvko9yNtCJzGoCzPjSg2Tbp96JBHX0r1xlEPhXKRzGw0KVtIIz3ZgyVA5AKgM2VYNBpOVXeyAsmbnWa8j1v3iNdXPdIjGMFnKqcnhAA90EYkvlmRlQWpJoU/AKShCiA/Fu4HzYDLd4HFNBtKCUqWU9v++5/lw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g8QEnhro; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0122EC4CEE7
	for <linux-media@vger.kernel.org>; Thu, 23 Oct 2025 08:53:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761209595;
	bh=YRCmPBKSZLTi9QZRwFYQNLKIgqs2KGJWya8HivNUSBQ=;
	h=Date:From:Subject:To:From;
	b=g8QEnhroT4r4Hpa0eMCfRA1sc7NBtkTGkH5LcZw1HTpY/QOYMBUd7xYu3lCJHYJ9t
	 ACEJ1QXpFLOalrCGdJp/GVW9XkR+k+Yb2T1HZnir4Hl91P9nLpjKBWu52BU3pdzQDq
	 /NxTSqZ+/b98AJoBPTS6zz/wl50ILIZZe4KTUKx6h518mOjTQoMKj3x9JSpODd5O7u
	 pLKep28GZX/w61mGa2nrmt6HRZZ0kgCnxwDUZ6R28SAXdzJ7bO5CxUGpFJgxazdqxO
	 ZVgQ0fk7UNlkjhiH+UZt7HIGoCS3K/a9rQAzsPn5K5fovz83AtUSndeo2wkvFUQSQ2
	 iQvM/EUtj0B/g==
Message-ID: <597b75b9-3973-4e89-af1a-ce0d5c676efc@kernel.org>
Date: Thu, 23 Oct 2025 10:53:13 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Content-Language: en-US, nl
Subject: [PATCH] Documentation: media: fix VIDIOC_REMOVE_BUFS typo
To: Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Add missing `. The missing backtick messed up the documentation output.

Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
---
diff --git a/Documentation/userspace-api/media/v4l/vidioc-remove-bufs.rst b/Documentation/userspace-api/media/v4l/vidioc-remove-bufs.rst
index 1995b39af9ba..b498d60752d7 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-remove-bufs.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-remove-bufs.rst
@@ -54,7 +54,7 @@ are invoked.
       - ``count``
       - The number of buffers to be removed with indices 'index' until 'index + count - 1'.
         All buffers in this range must be valid and in DEQUEUED state.
-        :ref:`VIDIOC_REMOVE_BUFS` will always check the validity of ``type`, if it is
+        :ref:`VIDIOC_REMOVE_BUFS` will always check the validity of ``type``, if it is
         invalid it returns ``EINVAL`` error code.
         If count is set to 0 :ref:`VIDIOC_REMOVE_BUFS` will do nothing and return 0.
     * - __u32

