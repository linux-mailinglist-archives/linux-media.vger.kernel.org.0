Return-Path: <linux-media+bounces-1153-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1018A7FA74D
	for <lists+linux-media@lfdr.de>; Mon, 27 Nov 2023 17:58:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 42B3D1C20BE7
	for <lists+linux-media@lfdr.de>; Mon, 27 Nov 2023 16:58:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 737F036AEB;
	Mon, 27 Nov 2023 16:56:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="lrj3kg6h"
X-Original-To: linux-media@vger.kernel.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 545A72729;
	Mon, 27 Nov 2023 08:55:44 -0800 (PST)
Received: from benjamin-XPS-13-9310.. (ec2-34-240-57-77.eu-west-1.compute.amazonaws.com [34.240.57.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 451956607415;
	Mon, 27 Nov 2023 16:55:42 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1701104142;
	bh=UHmN7DYDyoab4vSZsrfP/xW1VruJJjAHjGYWzN7yozk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lrj3kg6hVhrAmuJSFfTjyf/6lDbNyCtkyhgOXIk6j/FkIK8Zy0IHpn8WXuTNM14KB
	 P05UGZihh9NRifbhDiEiybUbgDx9I7d3stjIqY6pT2oZy3YLQdlMORzYAw4FSTxupT
	 Ll9Ho2XdIuhHW/p46IcBIXdhEtlds52vOtgt3HSzQ0mEsDXuQaDGwtbgFPHK+6tGn0
	 ukHY+x0HELnnBBOQ94GhhvO5iPk5YGQb6jOefzF+Gc2bJFXwGhA2TkskLxm75isZ9Q
	 fTgROk3eaPwKLcpJsMLyvnyjS87YrpjE9EgeQqAldgzhCeROl4gYQJephIk3Zlnwyv
	 WFIiXzmPPXV2A==
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
To: hverkuil@xs4all.nl,
	mchehab@kernel.org,
	tfiga@chromium.org,
	m.szyprowski@samsung.com,
	matt.ranostay@konsulko.com
Cc: linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	kernel@collabora.com,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Bluecherry Maintainers <maintainers@bluecherrydvr.com>,
	Anton Sviridenko <anton@corp.bluecherry.net>,
	Andrey Utkin <andrey.utkin@corp.bluecherry.net>
Subject: [PATCH 48/55] media: pci: tw5864: Use min_dma_buffers_needed field
Date: Mon, 27 Nov 2023 17:54:47 +0100
Message-Id: <20231127165454.166373-49-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231127165454.166373-1-benjamin.gaignard@collabora.com>
References: <20231127165454.166373-1-benjamin.gaignard@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

tw5864 driver use a dma engine and needs a minimum number of
buffers to be present before start streaming.
That is 'min_dma_buffers_needed' purpose so use it instead
of 'min_buffers_needed' field.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
CC: Bluecherry Maintainers <maintainers@bluecherrydvr.com>
CC: Anton Sviridenko <anton@corp.bluecherry.net>
CC: Andrey Utkin <andrey.utkin@corp.bluecherry.net>
---
 drivers/media/pci/tw5864/tw5864-video.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/pci/tw5864/tw5864-video.c b/drivers/media/pci/tw5864/tw5864-video.c
index 197ed8978102..647a57552d4c 100644
--- a/drivers/media/pci/tw5864/tw5864-video.c
+++ b/drivers/media/pci/tw5864/tw5864-video.c
@@ -1114,7 +1114,7 @@ static int tw5864_video_input_init(struct tw5864_input *input, int video_nr)
 	input->vidq.gfp_flags = 0;
 	input->vidq.buf_struct_size = sizeof(struct tw5864_buf);
 	input->vidq.lock = &input->lock;
-	input->vidq.min_buffers_needed = 2;
+	input->vidq.min_dma_buffers_needed = 2;
 	input->vidq.dev = &input->root->pci->dev;
 	ret = vb2_queue_init(&input->vidq);
 	if (ret)
-- 
2.39.2


