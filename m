Return-Path: <linux-media+bounces-10794-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 271438BC2DE
	for <lists+linux-media@lfdr.de>; Sun,  5 May 2024 19:40:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9CD7B1F213CE
	for <lists+linux-media@lfdr.de>; Sun,  5 May 2024 17:40:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30AC93FE2A;
	Sun,  5 May 2024 17:40:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="jNp/CuSI"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FE401E4A0
	for <linux-media@vger.kernel.org>; Sun,  5 May 2024 17:40:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714930851; cv=none; b=mVZ43T2HYy46tx7f2d1F6WNN8gAWAmRSi6tocfDp2d+NOGa6vcqX7+pn+b+XvK0ilKYRYYm8oPLA4nV46kgY3gJCAqM/gRf0OghzDxMTnTehGhhVFQmX7SvjBJgx9KTquOu609+CbxWlhC27vKPEZEehFEGXRW3J4wNW5bpbRLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714930851; c=relaxed/simple;
	bh=YtJ1ztdIAh78RNY/+KFQtrngAFHWoFz1LHToTsse9j8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uGukeN2i00/JwpBXBhP/HOjSB1BR/1zJN44dr7kXEV5wzbtFgrqsAS7Jzb/v20su6k5oWDws+2VS3OP1WEiqPiiZqH1D7OMu8pQ1jmBwbw0QbT5bO/cl+L9WHKv7YPlNdFM67pMn8LfNPw3iwFnwjt10F1iVvL1cc+A1cugFTkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=jNp/CuSI; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 981996AE;
	Sun,  5 May 2024 19:40:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1714930841;
	bh=YtJ1ztdIAh78RNY/+KFQtrngAFHWoFz1LHToTsse9j8=;
	h=From:To:Cc:Subject:Date:From;
	b=jNp/CuSIIteRGrgKfzA7SporVxMqdHR0UGySc+Tpo1l7+P/LGwGYc5mBvigtBFJ/5
	 WLsCn7Hz7QXl/SGU9BYmsLIegacLY9tkY7MkWBqq0OQ68YmBzaizXv1vG3f/lbxGPI
	 0SJRxP+BcpJsgoaQ8h+t/o7e3Gmr7HsARfwoAqz0=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Tomasz Figa <tfiga@chromium.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH] media: videobuf2: core: Drop unneeded forward declaration
Date: Sun,  5 May 2024 20:40:33 +0300
Message-ID: <20240505174033.9163-1-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.43.2
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The static __enqueue_in_driver() function is forward-declared
needlessly, as it isn't called before its definition. Drop the forward
declaration.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/media/common/videobuf2/videobuf2-core.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/media/common/videobuf2/videobuf2-core.c b/drivers/media/common/videobuf2/videobuf2-core.c
index 358f1fe42975..0217392fcc0d 100644
--- a/drivers/media/common/videobuf2/videobuf2-core.c
+++ b/drivers/media/common/videobuf2/videobuf2-core.c
@@ -199,7 +199,6 @@ module_param(debug, int, 0644);
 })
 
 static void __vb2_queue_cancel(struct vb2_queue *q);
-static void __enqueue_in_driver(struct vb2_buffer *vb);
 
 static const char *vb2_state_name(enum vb2_buffer_state s)
 {

base-commit: e695668af8523b059127dfa8b261c76e7c9cde10
-- 
Regards,

Laurent Pinchart


