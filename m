Return-Path: <linux-media+bounces-11528-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3776E8C75F9
	for <lists+linux-media@lfdr.de>; Thu, 16 May 2024 14:21:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 690931C21CD1
	for <lists+linux-media@lfdr.de>; Thu, 16 May 2024 12:21:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3A63146A9E;
	Thu, 16 May 2024 12:21:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="cZ2QUts7"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E4B614659E;
	Thu, 16 May 2024 12:21:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.61.82.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715862084; cv=none; b=oQteQGwB62MxwUE+yvrdneoTMDOYINqYDZ92g5QJAxO0JiZXutMc4vW0Ja5MS1Ci+XSRrNEjTaR/Czi2lUPj+9k/yHXtforhsIQF6vpY9sBndVN3FlM+J5MANSGOwJIhiKJZHLTcKVdGMWtbI5NBROEF3u6nEktQwI7aL4b+xZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715862084; c=relaxed/simple;
	bh=m3U8euoZMt4H9r5oczjhjVfeIdGb7f2UKfEwuwWQZMs=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qalllbBw1fI8hp5BTgJjG4CnJdOmv999Ow3FiCK3m4G/kIZOYwRgwd9QVy/xiGFjLi56dd/ui+nAt4Ahdh7NLUZL5zMn3rMLGPgOVJOEphBkPBWaqXiOX6Za7cg0dg5Xb2de8qdOXC/VzRw9T8oNn/sNW1+f3gF5QT8C71xttag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=cZ2QUts7; arc=none smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: c7db5e62137e11ef8065b7b53f7091ad-20240516
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=JcgzcwjR79GO/B9Bt02zMcJhSYP+1rHgGT3MDO93Xbk=;
	b=cZ2QUts7WTVlpVT+/scVmlr6rGBAuXvitjPqDBEd5Z4Qty8sQ8vSP9+C6WjJ4aP/0UPn6LXJe250ZVpZPSVEIOR15bc5C72gyw1W0tCm3tJIscsozSUldK0w+TtPx3b5FNuQG/6b36VnvbEmnFR807N+UDwG7m7FJvDH2a45COY=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.38,REQID:e7a3ad8b-8210-45c8-bf8b-2e2a91c0678b,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:82c5f88,CLOUDID:4f537087-8d4f-477b-89d2-1e3bdbef96d1,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: c7db5e62137e11ef8065b7b53f7091ad-20240516
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw02.mediatek.com
	(envelope-from <yunfei.dong@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2066720893; Thu, 16 May 2024 20:21:11 +0800
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 16 May 2024 20:21:09 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 16 May 2024 20:21:07 +0800
From: Yunfei Dong <yunfei.dong@mediatek.com>
To: Jeffrey Kardatzke <jkardatzke@google.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?=
	<nfraprado@collabora.com>, Nathan Hebert <nhebert@chromium.org>, "Nicolas
 Dufresne" <nicolas.dufresne@collabora.com>, Hans Verkuil
	<hverkuil-cisco@xs4all.nl>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Benjamin Gaignard
	<benjamin.gaignard@collabora.com>, Sebastian Fricke
	<sebastian.fricke@collabora.com>, Tomasz Figa <tfiga@chromium.org>, "Mauro
 Carvalho Chehab" <mchehab@kernel.org>, Marek Szyprowski
	<m.szyprowski@samsung.com>
CC: Chen-Yu Tsai <wenst@chromium.org>, Yong Wu <yong.wu@mediatek.com>,
	"Hsin-Yi Wang" <hsinyi@chromium.org>, Fritz Koenig <frkoenig@chromium.org>,
	"Daniel Vetter" <daniel@ffwll.ch>, Steve Cho <stevecho@chromium.org>, Yunfei
 Dong <yunfei.dong@mediatek.com>, Sumit Semwal <sumit.semwal@linaro.org>,
	"Brian Starkey" <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>, "T
 . J . Mercier" <tjmercier@google.com>, =?UTF-8?q?Christian=20K=C3=B6nig?=
	<christian.koenig@amd.com>, Matthias Brugger <matthias.bgg@gmail.com>,
	<linux-media@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v6,01/24] v4l2: add restricted memory flags
Date: Thu, 16 May 2024 20:20:39 +0800
Message-ID: <20240516122102.16379-2-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240516122102.16379-1-yunfei.dong@mediatek.com>
References: <20240516122102.16379-1-yunfei.dong@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--4.149800-8.000000
X-TMASE-MatchedRID: 5AYjULL74rYxaBEU4bKrV4SvKOGqLLPKK2i9pofGVStcU0dNErOD+mlF
	7OhYLlctcYKRVYWgduVAw/iJrysrSm+IsUfG75P2joyKzEmtrEeQoBr+SFneJJj9R7obtcgyH5L
	2GhBQtff4ei4a6fEfjpynPbWEKM6u8xjBEybW2by3HA8h5a0MOXnL427v8Q461gisw2JKo8lzN8
	/snsNYn/j1N4/6HNKlsGRzEHTW2nEfE8yM4pjsDwtuKBGekqUpOlxBO2IcOBaDB3ZqEXAYAIp/8
	8s6zH6CLMa1wLyvYEOVsCHg6a9VM9hNU8cP4jYh/G47AcAybTmwM6AJeCWlbm72iaFWNy7GB1UY
	UHkmE/jiw6uxviJP8r9tsSiUciBlQ5zsaM5qada/lr1yYih0SylGctXaTCsu
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--4.149800-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP:
	00C8DA871F738AAD29C7BF1F0BB062BED72FEA1C5C526C39E9A7696C95C2C6492000:8
X-MTK: N

From: Jeffrey Kardatzke <jkardatzke@google.com>

Adds a V4L2 flag which indicates that a queue is using restricted
dmabufs and the corresponding capability flag.

Signed-off-by: Jeffrey Kardatzke <jkardatzke@google.com>
Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
---
 include/media/videobuf2-core.h | 8 +++++++-
 include/uapi/linux/videodev2.h | 2 ++
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/include/media/videobuf2-core.h b/include/media/videobuf2-core.h
index 955237ac503d..afd497e93a37 100644
--- a/include/media/videobuf2-core.h
+++ b/include/media/videobuf2-core.h
@@ -517,6 +517,9 @@ struct vb2_buf_ops {
  *		->finish().
  * @non_coherent_mem: when set queue will attempt to allocate buffers using
  *		non-coherent memory.
+ * @allow_restricted_mem: when set user-space can pass the %V4L2_MEMORY_FLAG_RESTRICTED
+ *		flag to indicate the dma bufs are restricted.
+ * @restricted_mem: when set queue will verify that the dma bufs are restricted.
  * @lock:	pointer to a mutex that protects the &struct vb2_queue. The
  *		driver can set this to a mutex to let the v4l2 core serialize
  *		the queuing ioctls. If the driver wants to handle locking
@@ -621,6 +624,8 @@ struct vb2_queue {
 	unsigned int			uses_requests:1;
 	unsigned int			allow_cache_hints:1;
 	unsigned int			non_coherent_mem:1;
+	unsigned int			allow_restricted_mem:1;
+	unsigned int			restricted_mem:1;
 
 	struct mutex			*lock;
 	void				*owner;
@@ -792,7 +797,8 @@ void vb2_core_querybuf(struct vb2_queue *q, struct vb2_buffer *vb, void *pb);
  * @q:		pointer to &struct vb2_queue with videobuf2 queue.
  * @memory:	memory type, as defined by &enum vb2_memory.
  * @flags:	auxiliary queue/buffer management flags. Currently, the only
- *		used flag is %V4L2_MEMORY_FLAG_NON_COHERENT.
+ *		used flags are %V4L2_MEMORY_FLAG_NON_COHERENT and
+ *		%V4L2_MEMORY_FLAG_RESTRICTED.
  * @count:	requested buffer count.
  *
  * Videobuf2 core helper to implement VIDIOC_REQBUF() operation. It is called
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index fe6b67e83751..89eb1a3c6555 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -1043,6 +1043,7 @@ struct v4l2_requestbuffers {
 };
 
 #define V4L2_MEMORY_FLAG_NON_COHERENT			(1 << 0)
+#define V4L2_MEMORY_FLAG_RESTRICTED			(1 << 1)
 
 /* capabilities for struct v4l2_requestbuffers and v4l2_create_buffers */
 #define V4L2_BUF_CAP_SUPPORTS_MMAP			(1 << 0)
@@ -1054,6 +1055,7 @@ struct v4l2_requestbuffers {
 #define V4L2_BUF_CAP_SUPPORTS_MMAP_CACHE_HINTS		(1 << 6)
 #define V4L2_BUF_CAP_SUPPORTS_MAX_NUM_BUFFERS		(1 << 7)
 #define V4L2_BUF_CAP_SUPPORTS_REMOVE_BUFS		(1 << 8)
+#define V4L2_BUF_CAP_SUPPORTS_RESTRICTED_MEM		(1 << 9)
 
 /**
  * struct v4l2_plane - plane info for multi-planar buffers
-- 
2.25.1


