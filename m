Return-Path: <linux-media+bounces-1710-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A240A806787
	for <lists+linux-media@lfdr.de>; Wed,  6 Dec 2023 07:37:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 34BAFB21256
	for <lists+linux-media@lfdr.de>; Wed,  6 Dec 2023 06:37:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E89810A28;
	Wed,  6 Dec 2023 06:37:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="FeUnwC6C"
X-Original-To: linux-media@vger.kernel.org
Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BEB9B1710
	for <linux-media@vger.kernel.org>; Tue,  5 Dec 2023 22:37:01 -0800 (PST)
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20231206063659epoutp0470f968457193a58e582c2b9877dfd98a~eKqojPz3E0409504095epoutp04e
	for <linux-media@vger.kernel.org>; Wed,  6 Dec 2023 06:36:59 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20231206063659epoutp0470f968457193a58e582c2b9877dfd98a~eKqojPz3E0409504095epoutp04e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1701844619;
	bh=H0dlVMB8lfzG2PSBUDWzbtcXzHeOenCU78MseZm6J/0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FeUnwC6CAg2STu7xsbkMEUd+vDWmp2CrYQxH8gAi4BaMgsUxbDNiqn2PezmrB+GO8
	 ZNXHAy/amUmN8VcMGdqErBsaW9Du8w2OORYG1twkE2Rr/Hz7YH3V/TOk6zG3zs4ZMd
	 +Vg8J9vqZgWGV/ioMyRRmdhgjmVKT5yR6lhtv2nA=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTP id
	20231206063658epcas5p26d4f9e47ed066c2403faec34a0a90ee8~eKqoDMNkv3140531405epcas5p2v;
	Wed,  6 Dec 2023 06:36:58 +0000 (GMT)
Received: from epsmges5p1new.samsung.com (unknown [182.195.38.178]) by
	epsnrtp1.localdomain (Postfix) with ESMTP id 4SlSP470ZRz4x9Pv; Wed,  6 Dec
	2023 06:36:56 +0000 (GMT)
Received: from epcas5p2.samsung.com ( [182.195.41.40]) by
	epsmges5p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	BB.96.09634.88610756; Wed,  6 Dec 2023 15:36:56 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
	20231206063128epcas5p3145907e75b404400a552b8bd66e1c175~eKl0R7hj-2503625036epcas5p3M;
	Wed,  6 Dec 2023 06:31:28 +0000 (GMT)
Received: from epsmgmcp1.samsung.com (unknown [182.195.42.82]) by
	epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20231206063128epsmtrp14d2b37d8ee32445092947cd9098c8f1a~eKl0Q8XLE1588615886epsmtrp1G;
	Wed,  6 Dec 2023 06:31:28 +0000 (GMT)
X-AuditID: b6c32a49-eebff700000025a2-d0-65701688a702
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
	epsmgmcp1.samsung.com (Symantec Messaging Gateway) with SMTP id
	05.A6.18939.04510756; Wed,  6 Dec 2023 15:31:28 +0900 (KST)
Received: from cheetah.sa.corp.samsungelectronics.net (unknown
	[107.109.115.53]) by epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20231206063125epsmtip2584dac41bd969d5962219a2998ebb95d~eKlxfURPF3211232112epsmtip2c;
	Wed,  6 Dec 2023 06:31:25 +0000 (GMT)
From: Aakarsh Jain <aakarsh.jain@samsung.com>
To: linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Cc: m.szyprowski@samsung.com, andrzej.hajda@intel.com, mchehab@kernel.org,
	hverkuil-cisco@xs4all.nl, krzysztof.kozlowski+dt@linaro.org,
	robh+dt@kernel.org, conor+dt@kernel.org, linux-samsung-soc@vger.kernel.org,
	andi@etezian.org, gost.dev@samsung.com, alim.akhtar@samsung.com,
	aswani.reddy@samsung.com, pankaj.dubey@samsung.com,
	ajaykumar.rs@samsung.com, aakarsh.jain@samsung.com, linux-fsd@tesla.com,
	Smitha T Murthy <smithatmurthy@gmail.com>
Subject: [Patch v5 07/11] media: s5p-mfc: Add support for DMABUF for encoder
Date: Wed,  6 Dec 2023 12:00:41 +0530
Message-Id: <20231206063045.97234-8-aakarsh.jain@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20231206063045.97234-1-aakarsh.jain@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrDJsWRmVeSWpSXmKPExsWy7bCmhm6HWEGqwY8vxhZPd8xktTjw/iCL
	xYN529gsFv94zmRxf/FnFotDm7eyW6zZe47JYv6Rc6wWNw/sZLK4OPMui0Xfi4fMFpseX2O1
	ePgq3OLyrjlsFj0btrJazDi/j8li7ZG77BbLNv1hsli09Qu7ReveI+wWLY1LWB1EPa4v+cTs
	sXPWXXaPxXteMnlsWtXJ5nHn2h42j81L6j36tqxi9PjXNJfd4/MmOY9TXz+zB3BFZdtkpCam
	pBYppOYl56dk5qXbKnkHxzvHm5oZGOoaWlqYKynkJeam2iq5+AToumXmAP2opFCWmFMKFApI
	LC5W0rezKcovLUlVyMgvLrFVSi1IySkwKdArTswtLs1L18tLLbEyNDAwMgUqTMjO+LGtn6mg
	WbLi5uLrzA2MJ0W6GDk5JARMJFrXPGHtYuTiEBLYzSjxatEyRgjnE6PEjI1fWOCcU883MXUx
	coC1zNkvCxHfySix6sVrZginlUni0PtFbCBFbAK6Eme354CsEBFoZJR43FECUsMscJxZYsGE
	mSwgCWEBH4kz82ewg9gsAqoSz5vXsoHYvAK2EntOrWCBuE9eYvWGA8wgNqeAncSUNQvAbpUQ
	uMAhceDXPxaIi1wknl3SgagXlnh1fAs7hC0l8bK/DcpOlni86CUzhJ0jsX7PFKj59hIHrswB
	G8MsoCmxfpc+RFhWYuqpdUwgNrMAn0Tv7ydMEHFeiR3zYGw1iTl3frBC2DISh1cvZYSwPSQm
	f1nIBgmTiYwSV1tuME5glJuFsGIBI+MqRsnUguLc9NRi0wLDvNRyeKQl5+duYgQnYy3PHYx3
	H3zQO8TIxMF4iFGCg1lJhDfnfH6qEG9KYmVValF+fFFpTmrxIUZTYPhNZJYSTc4H5oO8knhD
	E0sDEzMzMxNLYzNDJXHe161zU4QE0hNLUrNTUwtSi2D6mDg4pRqYosRFZ65m0fv/pqm5KVbh
	2/2DoqGMxw60RN+fo7n32jUetoU111+YWZ4ufXDz3yUp9v3+TJYPpfXC1j9erck/+1vNgy2Z
	q6tU2I52hsVt/6Z74vkknTlqakrGXbmK9hvmLOdR+VWj9ezDvjZTXv2TOz5Pz5gv1mRrv3ze
	i7rDJfe2OrGm8vD+Kbt7zjbz/8IPDyZ91l7t8PIyf5Ni3Ym3Ux+ofBfaJKi16mHG/kOCqxjn
	yRjfPe1y/eHKanXnwwdFYpPUG7jWSCRcl3Kz970v//x5x9fue142vUwVKpGfY94c0dA9cWL2
	k6Z9nkZdFS/l/6e9emZlvzJnyeuUrInXNqXc3zxPpoRHWnSr3IKUJ0osxRmJhlrMRcWJABbX
	cqZPBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrPLMWRmVeSWpSXmKPExsWy7bCSvK6DaEGqwa3t/BZPd8xktTjw/iCL
	xYN529gsFv94zmRxf/FnFotDm7eyW6zZe47JYv6Rc6wWNw/sZLK4OPMui0Xfi4fMFpseX2O1
	ePgq3OLyrjlsFj0btrJazDi/j8li7ZG77BbLNv1hsli09Qu7ReveI+wWLY1LWB1EPa4v+cTs
	sXPWXXaPxXteMnlsWtXJ5nHn2h42j81L6j36tqxi9PjXNJfd4/MmOY9TXz+zB3BFcdmkpOZk
	lqUW6dslcGX82NbPVNAsWXFz8XXmBsaTIl2MHBwSAiYSc/bLdjFycQgJbGeUeLhgJXMXIydQ
	XEbif9sxdghbWGLlv+fsEEXNTBIvj3xkBmlmE9CVOLs9ByQuItDKKHF9ZScTiMMscJtZYtOE
	h2DdwgI+EmfmzwCzWQRUJZ43r2UDsXkFbCX2nFrBArFBXmL1hgNgmzkF7CSmrFnACrJACKhm
	5UnHCYx8CxgZVjGKphYU56bnJhcY6hUn5haX5qXrJefnbmIEx4lW0A7GZev/6h1iZOJgPMQo
	wcGsJMKbcz4/VYg3JbGyKrUoP76oNCe1+BCjNAeLkjivck5nipBAemJJanZqakFqEUyWiYNT
	qoHJeBWv7w2jifP6OZ/f1gzr7I/Oj35k9NZ50uZPq9ut3ZfbatZXTZDaqjwvWnrfUtElIfuV
	cwMWqM5tKfgl4rVQ323qzo8ldyoMNh+5M2tz6oPczN+VT+wOsZ6cm3pi8Xoz5mwGZqEtf/al
	VSfdm3Jl0nLH6a1n/7028169rdVhqySD8to5Svu9rafo5W/IDvu29rwaw0lJpY38T+WNDW5O
	P3HAZ7XNHutPm89vmnbFRrZPkGVeceBWFa7g9Oci2n27rn0vmvqmXoLD8MpcDwNLh+/yxhoy
	et9lfzWFf63Ly24Q3bfTzjxvcv7vyfnhD2tkHt2oPTzP9YTmG7eT4VbsAQz3LhZxrHH7GLF0
	9rIOJZbijERDLeai4kQANJYsMQIDAAA=
X-CMS-MailID: 20231206063128epcas5p3145907e75b404400a552b8bd66e1c175
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20231206063128epcas5p3145907e75b404400a552b8bd66e1c175
References: <20231206063045.97234-1-aakarsh.jain@samsung.com>
	<CGME20231206063128epcas5p3145907e75b404400a552b8bd66e1c175@epcas5p3.samsung.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

Add dmabuf support for mfc encoder

Cc: linux-fsd@tesla.com
Signed-off-by: Smitha T Murthy <smithatmurthy@gmail.com>
Signed-off-by: Aakarsh Jain <aakarsh.jain@samsung.com>
---
 .../media/platform/samsung/s5p-mfc/s5p_mfc.c  |  4 ++--
 .../platform/samsung/s5p-mfc/s5p_mfc_enc.c    | 20 ++++++++++---------
 2 files changed, 13 insertions(+), 11 deletions(-)

diff --git a/drivers/media/platform/samsung/s5p-mfc/s5p_mfc.c b/drivers/media/platform/samsung/s5p-mfc/s5p_mfc.c
index dee9ef017997..bd055dea827e 100644
--- a/drivers/media/platform/samsung/s5p-mfc/s5p_mfc.c
+++ b/drivers/media/platform/samsung/s5p-mfc/s5p_mfc.c
@@ -865,7 +865,7 @@ static int s5p_mfc_open(struct file *file)
 		q->io_modes = VB2_MMAP;
 		q->ops = get_dec_queue_ops();
 	} else if (vdev == dev->vfd_enc) {
-		q->io_modes = VB2_MMAP | VB2_USERPTR;
+		q->io_modes = VB2_MMAP | VB2_USERPTR | VB2_DMABUF;
 		q->ops = get_enc_queue_ops();
 	} else {
 		ret = -ENOENT;
@@ -892,7 +892,7 @@ static int s5p_mfc_open(struct file *file)
 		q->io_modes = VB2_MMAP;
 		q->ops = get_dec_queue_ops();
 	} else if (vdev == dev->vfd_enc) {
-		q->io_modes = VB2_MMAP | VB2_USERPTR;
+		q->io_modes = VB2_MMAP | VB2_USERPTR | VB2_DMABUF;
 		q->ops = get_enc_queue_ops();
 	} else {
 		ret = -ENOENT;
diff --git a/drivers/media/platform/samsung/s5p-mfc/s5p_mfc_enc.c b/drivers/media/platform/samsung/s5p-mfc/s5p_mfc_enc.c
index b01b9511e50c..a5df0759ccf0 100644
--- a/drivers/media/platform/samsung/s5p-mfc/s5p_mfc_enc.c
+++ b/drivers/media/platform/samsung/s5p-mfc/s5p_mfc_enc.c
@@ -1538,9 +1538,10 @@ static int vidioc_reqbufs(struct file *file, void *priv,
 	struct s5p_mfc_ctx *ctx = fh_to_ctx(priv);
 	int ret = 0;
 
-	/* if memory is not mmp or userptr return error */
+	/* if memory is not mmp or userptr or dmabuf return error */
 	if ((reqbufs->memory != V4L2_MEMORY_MMAP) &&
-		(reqbufs->memory != V4L2_MEMORY_USERPTR))
+		(reqbufs->memory != V4L2_MEMORY_USERPTR) &&
+		(reqbufs->memory != V4L2_MEMORY_DMABUF))
 		return -EINVAL;
 	if (reqbufs->type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE) {
 		if (reqbufs->count == 0) {
@@ -1617,9 +1618,10 @@ static int vidioc_querybuf(struct file *file, void *priv,
 	struct s5p_mfc_ctx *ctx = fh_to_ctx(priv);
 	int ret = 0;
 
-	/* if memory is not mmp or userptr return error */
+	/* if memory is not mmp or userptr or dmabuf return error */
 	if ((buf->memory != V4L2_MEMORY_MMAP) &&
-		(buf->memory != V4L2_MEMORY_USERPTR))
+		(buf->memory != V4L2_MEMORY_USERPTR) &&
+		(buf->memory != V4L2_MEMORY_DMABUF))
 		return -EINVAL;
 	if (buf->type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE) {
 		if (ctx->state != MFCINST_GOT_INST) {
@@ -2580,11 +2582,11 @@ static int s5p_mfc_start_streaming(struct vb2_queue *q, unsigned int count)
 						S5P_MFC_R2H_CMD_SEQ_DONE_RET,
 						0);
 		}
-
-		if (ctx->src_bufs_cnt < ctx->pb_count) {
-			mfc_err("Need minimum %d OUTPUT buffers\n",
-					ctx->pb_count);
-			return -ENOBUFS;
+		if (q->memory != V4L2_MEMORY_DMABUF) {
+			if (ctx->src_bufs_cnt < ctx->pb_count) {
+				mfc_err("Need minimum %d OUTPUT buffers\n", ctx->pb_count);
+				return -ENOBUFS;
+			}
 		}
 	}
 
-- 
2.17.1


