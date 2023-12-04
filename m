Return-Path: <linux-media+bounces-1588-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 83DEE8034B2
	for <lists+linux-media@lfdr.de>; Mon,  4 Dec 2023 14:26:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 17515280A0C
	for <lists+linux-media@lfdr.de>; Mon,  4 Dec 2023 13:26:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 952E528DC5;
	Mon,  4 Dec 2023 13:24:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="hmPpJnHV"
X-Original-To: linux-media@vger.kernel.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C71B19BD;
	Mon,  4 Dec 2023 05:24:26 -0800 (PST)
Received: from benjamin-XPS-13-9310.. (ec2-34-240-57-77.eu-west-1.compute.amazonaws.com [34.240.57.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id C56AC6605835;
	Mon,  4 Dec 2023 13:24:24 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1701696265;
	bh=yTw2OYKem5rJF2Nwf34/Wc4CllCCaoPD56PNsk9nNiI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hmPpJnHV44ms7R4ZV/QZy3iR1p65Sk+Wr8py03hZzLr3LOKclMSekhZhlscj2wTsZ
	 EbePD6eaCkrj1bGGTdegy4le6jLK+qdfJcYfajKg4rDs9N2NaUWOwJkbqP0fQ7eq53
	 KITflsKQnst6zAVdDortp3a0PSJBjcAwv4P06V+fPHiJevozdvvZ8XVbewacPKVYDG
	 U42X1q5747Yn2ebL77qmvZxFnnPfOpK0mQmx+W1O96UWJOSRt6in4kccd1gOZLVlm0
	 27hYlEcxjD3Dbp17ksBlQO4VgsFVqbPa6OlIQLf3Giqi+Tb6Lw/9aXl7OkHuAipZyn
	 NYfVB72UlPlxw==
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
	Jack Zhu <jack.zhu@starfivetech.com>,
	Changhuang Liang <changhuang.liang@starfivetech.com>
Subject: [PATCH v2 31/36] media: starfive: Fix misuse of min_buffers_needed field
Date: Mon,  4 Dec 2023 14:23:18 +0100
Message-Id: <20231204132323.22811-32-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231204132323.22811-1-benjamin.gaignard@collabora.com>
References: <20231204132323.22811-1-benjamin.gaignard@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

'min_buffers_needed' is suppose to be used to indicate the number
of buffers needed by DMA engine to start streaming.
starfive driver doesn't use DMA engine and just want to specify
the minimum number of buffers to allocate when calling VIDIOC_REQBUFS.
That 'min_reqbufs_allocation' field purpose so use it.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
CC: Jack Zhu <jack.zhu@starfivetech.com>
CC: Changhuang Liang <changhuang.liang@starfivetech.com>
---
 drivers/staging/media/starfive/camss/stf-video.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/starfive/camss/stf-video.c b/drivers/staging/media/starfive/camss/stf-video.c
index 0b305f21eb53..25038e37e8a6 100644
--- a/drivers/staging/media/starfive/camss/stf-video.c
+++ b/drivers/staging/media/starfive/camss/stf-video.c
@@ -513,7 +513,7 @@ int stf_video_register(struct stfcamss_video *video,
 	q->buf_struct_size = sizeof(struct stfcamss_buffer);
 	q->dev = video->stfcamss->dev;
 	q->lock = &video->q_lock;
-	q->min_buffers_needed = STFCAMSS_MIN_BUFFERS;
+	q->min_reqbufs_allocation = STFCAMSS_MIN_BUFFERS;
 	ret = vb2_queue_init(q);
 	if (ret < 0) {
 		dev_err(video->stfcamss->dev,
-- 
2.39.2


