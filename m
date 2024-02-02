Return-Path: <linux-media+bounces-4601-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 59B18846DC2
	for <lists+linux-media@lfdr.de>; Fri,  2 Feb 2024 11:20:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6C6741C2408A
	for <lists+linux-media@lfdr.de>; Fri,  2 Feb 2024 10:20:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 831B578695;
	Fri,  2 Feb 2024 10:17:33 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D2657C0A7
	for <linux-media@vger.kernel.org>; Fri,  2 Feb 2024 10:17:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706869053; cv=none; b=D4hGOdFtMvWJnDS1NQFkgrVWWNW/yB+OyEAG/DCj5y8HhFTJG5hYQEVi5m5wekMwKbdAGJY1y0oFJeUXN7tiYm4xuYDuzI3pL/hhZ8V+0zPtruS4EgN6exHK2g+JQXIMUNyZciMHF8YvHcDMxFs1S2wRyrEzjQ6wEh4T9lppgk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706869053; c=relaxed/simple;
	bh=HfO27XYPykeaDcAn2pez1/TzWgf9vtfSKn7KRLFXs6M=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=M/B0Fd8gSLo3atRjpx2Q9zlLXzdKk8G2OIDQJo4hMOnWmfSkE0/kxboalOCvnqEe98gVmzJjal+AaU1u+FLr+zTPCaTturztW0SA57xbLh2DuQ283mFx82uMGJDIkRCIk1sNRnoqECT2H41aSjbGlsMyexG011DXMtbmEA/t8sk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2EBA4C433F1;
	Fri,  2 Feb 2024 10:17:31 +0000 (UTC)
Message-ID: <30f42c75-5a36-4ed0-90af-77764308f267@xs4all.nl>
Date: Fri, 2 Feb 2024 11:17:30 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US, nl
To: Linux Media Mailing List <linux-media@vger.kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCHv2 2/2] media: atomisp: don't use sizeof(NULL)
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Check the size of another pointer instead of NULL. This fixes this
smatch warning:

drivers/staging/media/atomisp/pci/sh_css.c:3609 ia_css_pipe_enqueue_buffer() warn: sizeof(NUMBER)?

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Fixes: ad85094b293e ("Revert "media: staging: atomisp: Remove driver"")
---
Changes since v1: replace NULL by void *, that's better than using a pointer variable.
---
 drivers/staging/media/atomisp/pci/sh_css.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/pci/sh_css.c b/drivers/staging/media/atomisp/pci/sh_css.c
index 1d1fbda75da1..938a4ea89c59 100644
--- a/drivers/staging/media/atomisp/pci/sh_css.c
+++ b/drivers/staging/media/atomisp/pci/sh_css.c
@@ -3606,7 +3606,7 @@ ia_css_pipe_enqueue_buffer(struct ia_css_pipe *pipe,

 	assert(pipeline || pipe_id == IA_CSS_PIPE_ID_COPY);

-	assert(sizeof(NULL) <= sizeof(ddr_buffer.kernel_ptr));
+	assert(sizeof(void *) <= sizeof(ddr_buffer.kernel_ptr));
 	ddr_buffer.kernel_ptr = HOST_ADDRESS(NULL);
 	ddr_buffer.cookie_ptr = buffer->driver_cookie;
 	ddr_buffer.timing_data = buffer->timing_data;
-- 
2.43.0


