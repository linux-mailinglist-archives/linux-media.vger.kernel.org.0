Return-Path: <linux-media+bounces-4599-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2283C846BCA
	for <lists+linux-media@lfdr.de>; Fri,  2 Feb 2024 10:22:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A0B0C1F21AE4
	for <lists+linux-media@lfdr.de>; Fri,  2 Feb 2024 09:22:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE97B77F29;
	Fri,  2 Feb 2024 09:21:56 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ECA977F16
	for <linux-media@vger.kernel.org>; Fri,  2 Feb 2024 09:21:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706865716; cv=none; b=OvVXEAlqeZflNWyTaGKsEAqNay9GhVy41bhDrMrj1JCaaas37SJwIXP06MsHz4dq7CHSjprSeynsmJFIuQeiyDvTRmlujS5G0f55621dwRkDpvdMG1QQtvhoG7eHHXXMUWcNhlath9SyO57XlLDm9cClbmAtR5ugXBSDPn9gwq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706865716; c=relaxed/simple;
	bh=XG3niVjd1bzTtJ618XnidxW9urJQ1OUodvz1MQhWH9w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=o6w7AGA5zRFFCitP37XBXeSU2WGJzclXu2yTaVFbP3+Bu7oXp498NwQ3rRqnYda3ahR/FuroLsKllKPFmpIDbREF0zDmaKmlt/n1FwwDYu+ZvBkUdR2WnahC7DFaV0fD23mPtjkmHWOR0L4yn5IgasnZhO51Ox0JgZ4+Q84dP18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0BBFFC43390;
	Fri,  2 Feb 2024 09:21:54 +0000 (UTC)
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
To: linux-media@vger.kernel.org
Cc: Hans de Goede <hdegoede@redhat.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH 2/2] media: atomisp: don't use sizeof(NULL)
Date: Fri,  2 Feb 2024 10:21:21 +0100
Message-ID: <d33c9271ed30997eb1774d1a6af997f538ecd888.1706865681.git.hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1706865681.git.hverkuil-cisco@xs4all.nl>
References: <cover.1706865681.git.hverkuil-cisco@xs4all.nl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Check the size of another pointer instead of NULL. This fixes this
smatch warning:

drivers/staging/media/atomisp/pci/sh_css.c:3609 ia_css_pipe_enqueue_buffer() warn: sizeof(NUMBER)?

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/staging/media/atomisp/pci/sh_css.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/pci/sh_css.c b/drivers/staging/media/atomisp/pci/sh_css.c
index 1d1fbda75da1..0d2ef96fabce 100644
--- a/drivers/staging/media/atomisp/pci/sh_css.c
+++ b/drivers/staging/media/atomisp/pci/sh_css.c
@@ -3606,7 +3606,7 @@ ia_css_pipe_enqueue_buffer(struct ia_css_pipe *pipe,
 
 	assert(pipeline || pipe_id == IA_CSS_PIPE_ID_COPY);
 
-	assert(sizeof(NULL) <= sizeof(ddr_buffer.kernel_ptr));
+	assert(sizeof(pipe) <= sizeof(ddr_buffer.kernel_ptr));
 	ddr_buffer.kernel_ptr = HOST_ADDRESS(NULL);
 	ddr_buffer.cookie_ptr = buffer->driver_cookie;
 	ddr_buffer.timing_data = buffer->timing_data;
-- 
2.43.0


