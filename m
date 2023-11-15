Return-Path: <linux-media+bounces-104-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F9337E8A96
	for <lists+linux-media@lfdr.de>; Sat, 11 Nov 2023 12:17:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2584A280F5D
	for <lists+linux-media@lfdr.de>; Sat, 11 Nov 2023 11:17:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8739C13AD9;
	Sat, 11 Nov 2023 11:17:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="LXW7OYXS"
X-Original-To: linux-media@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 909F712B9E;
	Sat, 11 Nov 2023 11:17:24 +0000 (UTC)
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF49A46B1;
	Sat, 11 Nov 2023 03:17:15 -0800 (PST)
X-UUID: dba1a6a6808311ee8051498923ad61e6-20231111
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=5VceEHrWW4xF0qWAxq1lZVUm8zHVqfc1sG68VwumEXs=;
	b=LXW7OYXShHLR3/j3iX2WWRINwoN3rkQx/OXCkNP34l/r61vzXI+eCqSxOBqgwdSrdNMGABZXT9wBg+v5SQrX1gEgBFbmlqGP8rUEWw9ip4xPFebtwouAA4A3OvJjuXLCslxLT4FDOdiJ6jz80YgFf3f36nkFNRqgsPksefQ0P8E=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.33,REQID:a8444074-65ac-47e0-abae-b64387e65fe6,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:364b77b,CLOUDID:e36669fc-4a48-46e2-b946-12f04f20af8c,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: dba1a6a6808311ee8051498923ad61e6-20231111
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw02.mediatek.com
	(envelope-from <yong.wu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1409411873; Sat, 11 Nov 2023 19:17:10 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Sat, 11 Nov 2023 19:17:09 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Sat, 11 Nov 2023 19:17:08 +0800
From: Yong Wu <yong.wu@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>,
	<christian.koenig@amd.com>, Matthias Brugger <matthias.bgg@gmail.com>
CC: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
	<conor+dt@kernel.org>, Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>,
	<tjmercier@google.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Yong Wu <yong.wu@mediatek.com>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-media@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
	<linaro-mm-sig@lists.linaro.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <jianjiao.zeng@mediatek.com>,
	<kuohong.wang@mediatek.com>, Vijayanand Jitta <quic_vjitta@quicinc.com>,
	Joakim Bech <joakim.bech@linaro.org>, Jeffrey Kardatzke
	<jkardatzke@google.com>, Nicolas Dufresne <nicolas@ndufresne.ca>,
	<ckoenig.leichtzumerken@gmail.com>
Subject: [PATCH v2 4/8] dma-buf: heaps: secure_heap: Add tee memory service call
Date: Sat, 11 Nov 2023 19:15:55 +0800
Message-ID: <20231111111559.8218-5-yong.wu@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231111111559.8218-1-yong.wu@mediatek.com>
References: <20231111111559.8218-1-yong.wu@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--5.577000-8.000000
X-TMASE-MatchedRID: KsUleRp513GtGUuyWCB/Khes/RxhysDbKVrLOZD1BXT3bBqxmjinTZof
	RcYVW70wHe8TeWB2elHPSWjlIpmzz+sY/baZcXtauIwLnB3Aqp1MkOX0UoduuXFH8OB0gvDrXRA
	pulKqWOoxSr1crztQZqd+CRua4GWATO484ojiGzezI1v7J4hECrbs3LV+r2cPmyiLZetSf8mfop
	0ytGwvXiq2rl3dzGQ1DBbGvtcMofzzJQ3QZM2AXdTUUwxNqpWapu5UIlqFDjxTG/UYQVOcoRH9P
	sM259V/QwymtxuJ6y0=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--5.577000-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP:
	8F6BE4C4383201E0A49BA3C18587545943F4DDC800A1C38C7286CE5F1C651A4F2000:8
X-MTK: N

Add TEE service call. In the case of MediaTek, secure memory management is
located within the TEE. The kernel just needs to tell TEE what size it
needs and the TEE will return a "security handle" to kernel.

To be consistent with the cma heap later, we put the tee ops into the ops
of secure_the_memory.

It seems that secure_heap_tee_service_call could be a more general
interface, but it could be a new topic.

Signed-off-by: Yong Wu <yong.wu@mediatek.com>
---
 drivers/dma-buf/heaps/secure_heap.c | 97 +++++++++++++++++++++++++++++
 1 file changed, 97 insertions(+)

diff --git a/drivers/dma-buf/heaps/secure_heap.c b/drivers/dma-buf/heaps/secure_heap.c
index 2a037fc54004..05062c14e7c7 100644
--- a/drivers/dma-buf/heaps/secure_heap.c
+++ b/drivers/dma-buf/heaps/secure_heap.c
@@ -17,6 +17,27 @@
 
 #define TEE_PARAM_NUM			4
 
+enum secure_buffer_tee_cmd { /* PARAM NUM always is 4. */
+	/*
+	 * TZCMD_SECMEM_ZALLOC: Allocate the zeroed secure memory from TEE.
+	 *
+	 * [in]  value[0].a: The buffer size.
+	 *       value[0].b: alignment.
+	 * [in]  value[1].a: enum secure_memory_type.
+	 * [out] value[3].a: The secure handle.
+	 */
+	TZCMD_SECMEM_ZALLOC = 0,
+
+	/*
+	 * TZCMD_SECMEM_FREE: Free secure memory.
+	 *
+	 * [in]  value[0].a: The secure handle of this buffer, It's value[3].a of
+	 *                   TZCMD_SECMEM_ZALLOC.
+	 * [out] value[1].a: return value, 0 means successful, otherwise fail.
+	 */
+	TZCMD_SECMEM_FREE = 1,
+};
+
 enum secure_memory_type {
 	/*
 	 * MediaTek static chunk memory carved out for TrustZone. The memory
@@ -28,13 +49,25 @@ enum secure_memory_type {
 struct secure_buffer {
 	struct dma_heap			*heap;
 	size_t				size;
+	/*
+	 * The secure handle is a reference to a buffer within the TEE, this is
+	 * a value got from TEE.
+	 */
+	u32				sec_handle;
 };
 
+#define TEE_MEM_COMMAND_ID_BASE_MTK	0x10000
+
 struct secure_heap;
 
 struct secure_heap_prv_data {
 	const char			*uuid;
 	const int			tee_impl_id;
+	/*
+	 * Different TEEs may implement different commands, and this provides an opportunity
+	 * for TEEs to use the same enum secure_buffer_tee_cmd.
+	 */
+	const int			tee_command_id_base;
 
 	int	(*memory_alloc)(struct secure_heap *sec_heap, struct secure_buffer *sec_buf);
 	void	(*memory_free)(struct secure_heap *sec_heap, struct secure_buffer *sec_buf);
@@ -98,10 +131,74 @@ static int secure_heap_tee_session_init(struct secure_heap *sec_heap)
 	return ret;
 }
 
+static int
+secure_heap_tee_service_call(struct tee_context *tee_ctx, u32 session,
+			     unsigned int command, struct tee_param *params)
+{
+	struct tee_ioctl_invoke_arg arg = {0};
+	int ret;
+
+	arg.num_params = TEE_PARAM_NUM;
+	arg.session = session;
+	arg.func = command;
+
+	ret = tee_client_invoke_func(tee_ctx, &arg, params);
+	if (ret < 0 || arg.ret) {
+		pr_err("%s: cmd %d ret %d:%x.\n", __func__, command, ret, arg.ret);
+		ret = -EOPNOTSUPP;
+	}
+	return ret;
+}
+
+static int secure_heap_tee_secure_memory(struct secure_heap *sec_heap,
+					 struct secure_buffer *sec_buf)
+{
+	const struct secure_heap_prv_data *data = sec_heap->data;
+	struct tee_param params[TEE_PARAM_NUM] = {0};
+	int ret;
+
+	params[0].attr = TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INPUT;
+	params[0].u.value.a = sec_buf->size;
+	params[0].u.value.b = PAGE_SIZE;
+	params[1].attr = TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INPUT;
+	params[1].u.value.a = sec_heap->mem_type;
+	params[2].attr = TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INPUT;
+
+	params[3].attr = TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_OUTPUT;
+	ret = secure_heap_tee_service_call(sec_heap->tee_ctx, sec_heap->tee_session,
+					   data->tee_command_id_base + TZCMD_SECMEM_ZALLOC,
+					   params);
+	if (ret)
+		return -ENOMEM;
+
+	sec_buf->sec_handle = params[3].u.value.a;
+	return 0;
+}
+
+static void secure_heap_tee_unsecure_memory(struct secure_heap *sec_heap,
+					    struct secure_buffer *sec_buf)
+{
+	struct tee_param params[TEE_PARAM_NUM] = {0};
+
+	params[0].attr = TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INPUT;
+	params[0].u.value.a = sec_buf->sec_handle;
+	params[1].attr = TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_OUTPUT;
+
+	secure_heap_tee_service_call(sec_heap->tee_ctx, sec_heap->tee_session,
+				     sec_heap->data->tee_command_id_base + TZCMD_SECMEM_FREE,
+				     params);
+	if (params[1].u.value.a)
+		pr_err("%s, free buffer(0x%x) return fail(%lld) from TEE.\n",
+		       sec_heap->name, sec_buf->sec_handle, params[1].u.value.a);
+}
+
 /* The memory allocating is within the TEE. */
 const struct secure_heap_prv_data mtk_sec_mem_data = {
 	.uuid			= TZ_TA_MEM_UUID_MTK,
 	.tee_impl_id		= TEE_IMPL_ID_OPTEE,
+	.tee_command_id_base	= TEE_MEM_COMMAND_ID_BASE_MTK,
+	.secure_the_memory	= secure_heap_tee_secure_memory,
+	.unsecure_the_memory	= secure_heap_tee_unsecure_memory,
 };
 
 static int secure_heap_secure_memory_allocate(struct secure_heap *sec_heap,
-- 
2.25.1


