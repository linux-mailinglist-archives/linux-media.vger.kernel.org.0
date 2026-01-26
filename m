Return-Path: <linux-media+bounces-51566-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KHqNLx5fd2n8eQEAu9opvQ
	(envelope-from <linux-media+bounces-51566-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 26 Jan 2026 13:33:34 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 17651884D3
	for <lists+linux-media@lfdr.de>; Mon, 26 Jan 2026 13:33:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 39947303CC20
	for <lists+linux-media@lfdr.de>; Mon, 26 Jan 2026 12:27:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 863B63382CB;
	Mon, 26 Jan 2026 12:27:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q3xT4jvQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ab9rA3C0"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E318C337BB3
	for <linux-media@vger.kernel.org>; Mon, 26 Jan 2026 12:27:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769430429; cv=none; b=I4Bu9mJ5k+EbCIE/UVxuQsIvCxOMZWX/s0lD50aiHU1t8dcZWAGxMFIWQ6SU1BsJB0fg+22jVKWOQiZDlTz1W+gLvNwwjGPgTyLf1jcbmXqQ3c2rUrePcpEViSuh1WRlpaVTKoZbX4r2IsywWhx27jnG65VAvciiKbS/MCXIEjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769430429; c=relaxed/simple;
	bh=jypWocz00V2WMwEe0yOxFTVRs3XTJhj0AoUp2Rzu1p4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YAvZGsJub89sXVIVgRz6CIYc+8ejXWMF+K6jroq43TiPrOQ48uYtC+18LbVmyJxwJ7SJjv9Nlp7uwgSFgHiMTkRizstVZKteSbsDNFR8uWImD1sYzu1On4UeKdeHcZVrf3vmXpKR60OYnF3xl7iLas8eNHKIKaYKSxI7irP2afA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q3xT4jvQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ab9rA3C0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60Q8skQr4087969
	for <linux-media@vger.kernel.org>; Mon, 26 Jan 2026 12:27:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zEvepj2lKdlKPB9E6l5Bhh6hXxY+WPd/RydFUG6VfIQ=; b=Q3xT4jvQ8mpabgiT
	Y96t54eix7uf42gOatXsjmByCu9MSDyu3miTl0WpFud9ujEn80VfN3ttNgNpio1c
	rAiPoKLxuUxiVGOrnlLRFcztP+ronp5TbejG0BWSaZbcJLgp6SxRSsd9MpEATu97
	slVmJSk0xWLVzqMCI4zym6nBVaUtPiqgA2Vas6q+yjG3Pu0I0mRvNCdDnNX6xjAZ
	vaGrTgTMxc/0SJ6iMPFAnCz+yxPWtGlOOckPXGyn82dAXgOeIIb2HwRUBOOoxdNw
	FwYz2bacSd/YlDQ+9dfu7xAqoG+y/kbcoeX7dSR7Ro3toBmSv6VaXvPnkYEPWxjm
	pfTV6w==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bvq6xvf9c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 26 Jan 2026 12:27:05 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c6124a9fb86so6902755a12.3
        for <linux-media@vger.kernel.org>; Mon, 26 Jan 2026 04:27:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769430425; x=1770035225; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zEvepj2lKdlKPB9E6l5Bhh6hXxY+WPd/RydFUG6VfIQ=;
        b=Ab9rA3C0UvOmZiqxQDjHPJAU1DG9DPrhhBK+BUvPhANKPzXtGvjeKzCG4maWdgk1Rn
         DFPlpTMo6OXBpbD6fgtkvJiPwPbeIalNZN308X8cxKtRls7pkx3UUK8Zdzx48EIJ+njz
         e36oIxBz3WG5VCRrRiHs0neXNKjXBaW10PZTRcE4u2fNBoHeBbIqsQYmWwlrgxUWlWSO
         5k0ezRcxF8kM7T0B8rtphKTBPdgJJhGRRab088T1qQqe58Oq5uDtL5yIA7DAc3wB6tdG
         jixNtV8ggbc6DoYe0XiiRwS7vMBYoK2MBMkYZaXg74MxDilngjSczj99F0QeQIqFDGsD
         jKTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769430425; x=1770035225;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zEvepj2lKdlKPB9E6l5Bhh6hXxY+WPd/RydFUG6VfIQ=;
        b=mmTcECCrdfc7Gt4jGtrqDy3LJ3NTVb9Y8EKHPECn3XYp7dL0/C4EeNAFAm24YtWg10
         xborHqwN5xrp+WMD6VjHzjP7niuxcdeMCtnK5fQ0f2WRD5mrSQ7P+YODv8+WHTov5bLU
         3B+D1OdAZ/YIMQFYVPCyCuxJQsiztCS470WVVRgddk5ItwXODE9nGXsiDvAdLFFfbCUp
         y3zbR1FL0VbeNG1jgro+0+mrngheDzr5kGLGIl6eWoVxTT2spwrYQw/gqAGFjo8FAtbI
         uHpCLvgPLtjBoGWKlkH3UlzjVwIjrE6Hh362RqIS1D8QIz5iWo67FXrXOprvGc3Uo7Xv
         fD+Q==
X-Forwarded-Encrypted: i=1; AJvYcCUaRtxk5zomChr4clbvaxbEpm9PpZeMWtzsHtvSRRz0iWxB4oTky3NjNn87Y5rM9TTMR8xnsW/Y7WZd/Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YwSM68pkEFel9Z25GIOXQbQKTmM/GORoc/3BAcVNf8uWUptI73Z
	mMs/NNE/XUlySi1NPB600aqJ6jxjg1BuXF7qJWeEAe3I81cShbU4H8vbX2T5U4o/7nBdc92baCE
	DLQ9EKdYiEVA6/M1U5S1QsH4oZqyNics1fCSTGf5djcwk2JG9aH/vdItHlDUqa2ckoQ==
X-Gm-Gg: AZuq6aJgaansoFHCUnRqcKkgA0RInbK1DNfXMBZxTAmY5uDRTbJlQkaYHWzYI5Y6XCJ
	fqwU8jsMT8suXhy+9ccrqqmBW2YlhpFQ7lkQ22WTQyLGvpQta2KNk7YhIdn93rKxPBvNzV3neV+
	Vs7jkk4Mnwju/cOeYx0TN4wjVpamotLoX7NWkI4cPM8AsE5lvKMMgdw8s7BcLC56aNKFou8ROAt
	AxsnFCpPGvFXwjOzokul1OCY4Fy2Y/LSkS64zReCmo7aMrhFPp/yDAt6HYnkfaOahMApIGT+0C0
	M/1bAENWyZoQA7W4Ehp81Z8NKG8xPtS6mR3Idykv1PhpY47UD0E9QIOlTkVErlv6DDULooRF39f
	RQs/e1lPBjSgAW7dPATehqiw/VjgV+DQLwU3AonjTYeV7
X-Received: by 2002:a05:6a21:164a:b0:38b:ea2a:2845 with SMTP id adf61e73a8af0-38e9f25698amr4065797637.74.1769430424595;
        Mon, 26 Jan 2026 04:27:04 -0800 (PST)
X-Received: by 2002:a05:6a21:164a:b0:38b:ea2a:2845 with SMTP id adf61e73a8af0-38e9f25698amr4065776637.74.1769430424090;
        Mon, 26 Jan 2026 04:27:04 -0800 (PST)
Received: from hu-vgarodia-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c6366644379sm6076022a12.33.2026.01.26.04.26.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 04:27:03 -0800 (PST)
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Date: Mon, 26 Jan 2026 17:55:49 +0530
Subject: [PATCH 6/7] media: iris: add helper to select context bank device
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260126-kaanapali-iris-v1-6-e2646246bfc1@oss.qualcomm.com>
References: <20260126-kaanapali-iris-v1-0-e2646246bfc1@oss.qualcomm.com>
In-Reply-To: <20260126-kaanapali-iris-v1-0-e2646246bfc1@oss.qualcomm.com>
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        iommu@lists.linux.dev, Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769430381; l=10046;
 i=vikash.garodia@oss.qualcomm.com; s=20241104; h=from:subject:message-id;
 bh=jypWocz00V2WMwEe0yOxFTVRs3XTJhj0AoUp2Rzu1p4=;
 b=8y7+JR/7hdNgAe0di8Umo9s7peY7LQERrKhFStZrEeO3hlL7MFQgrOoHgiltoOr+H8nE0CArK
 2g6A7RWpS8WA+zSUDVnxbc6Kl5ZuVVgQMyGg4L85lIbWR7ByQYNXPnm
X-Developer-Key: i=vikash.garodia@oss.qualcomm.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-Proofpoint-GUID: BfZj-Bke7f9yQoTsllBrD9jurhWCLcdQ
X-Proofpoint-ORIG-GUID: BfZj-Bke7f9yQoTsllBrD9jurhWCLcdQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI2MDEwNSBTYWx0ZWRfX7lF60q7EuX2T
 2ZsJ9+eTlNYadLIUY1zMrh8IkYzZaCdd+yrIASWzMn5OLQseC8p3lryVc+nvo14rb69avWqMOVi
 ct+DmST4V3/M+QF3g34XvBNlx57oR59cEOMFT1N9eHwoD5lSUxVm4meAj0KEH3lEju6IuDOfRHW
 mE6SFElSp7CMBd5sVV5RD0a0qf70xqr70xmnmZrCxU/X48QXGbNq5ABu+/aRxNzY8VW8R064Oz8
 qU0UFYCe9xqvOQtHopI4jROrPCSHLXldasZhfYjkzRMRv6DgGB2+s1YKrvu6VAxNFLhUkF6nH/Z
 MukSYLe7DAxQC9WLRTLFMuupURWjHp5Aeoaxq6uSjugaEJfbPqNtRXjuAwPBbE8w65PMbthtWGq
 EZdF1a4HIxxK4RfDqs/YaPgzub/6BLLKO7tOMBMSPNcHHRNHcCl7hjiJrHaSIivRqsXyspzgncY
 qWi64vSTjgEnr26U/Vw==
X-Authority-Analysis: v=2.4 cv=Htd72kTS c=1 sm=1 tr=0 ts=69775d99 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=yd2bZIjurNtSSvP6G-UA:9
 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-26_02,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 suspectscore=0 priorityscore=1501 spamscore=0
 phishscore=0 clxscore=1015 adultscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601260105
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[23];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-51566-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vikash.garodia@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt,cisco];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 17651884D3
X-Rspamd-Action: no action

Depending on the buffer type (input, output, internal and interface
queues), associated context bank is selected, if available. Fallback to
parent device for backward compatibility.

Co-developed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_buffer.c    |  7 +--
 drivers/media/platform/qcom/iris/iris_buffer.h    |  2 +
 drivers/media/platform/qcom/iris/iris_hfi_queue.c | 16 ++++---
 drivers/media/platform/qcom/iris/iris_resources.c | 58 +++++++++++++++++++++++
 drivers/media/platform/qcom/iris/iris_resources.h |  2 +
 drivers/media/platform/qcom/iris/iris_vidc.c      |  4 +-
 6 files changed, 77 insertions(+), 12 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_buffer.c b/drivers/media/platform/qcom/iris/iris_buffer.c
index f1f003a787bf22db6f048c9e682ba8ed2f39bc21..060b12525a63b9dbffa19f23c63f1dc50429069b 100644
--- a/drivers/media/platform/qcom/iris/iris_buffer.c
+++ b/drivers/media/platform/qcom/iris/iris_buffer.c
@@ -335,8 +335,8 @@ void iris_get_internal_buffers(struct iris_inst *inst, u32 plane)
 static int iris_create_internal_buffer(struct iris_inst *inst,
 				       enum iris_buffer_type buffer_type, u32 index)
 {
+	struct device *dev = iris_get_cb_dev(inst->core, inst, buffer_type);
 	struct iris_buffers *buffers = &inst->buffers[buffer_type];
-	struct iris_core *core = inst->core;
 	struct iris_buffer *buffer;
 
 	if (!buffers->size)
@@ -352,7 +352,7 @@ static int iris_create_internal_buffer(struct iris_inst *inst,
 	buffer->buffer_size = buffers->size;
 	buffer->dma_attrs = DMA_ATTR_WRITE_COMBINE | DMA_ATTR_NO_KERNEL_MAPPING;
 
-	buffer->kvaddr = dma_alloc_attrs(core->dev, buffer->buffer_size,
+	buffer->kvaddr = dma_alloc_attrs(dev, buffer->buffer_size,
 					 &buffer->device_addr, GFP_KERNEL, buffer->dma_attrs);
 	if (!buffer->kvaddr) {
 		kfree(buffer);
@@ -490,9 +490,10 @@ int iris_queue_internal_buffers(struct iris_inst *inst, u32 plane)
 int iris_destroy_internal_buffer(struct iris_inst *inst, struct iris_buffer *buffer)
 {
 	struct iris_core *core = inst->core;
+	struct device *dev = iris_get_cb_dev(core, inst, buffer->type);
 
 	list_del(&buffer->list);
-	dma_free_attrs(core->dev, buffer->buffer_size, buffer->kvaddr,
+	dma_free_attrs(dev, buffer->buffer_size, buffer->kvaddr,
 		       buffer->device_addr, buffer->dma_attrs);
 	kfree(buffer);
 
diff --git a/drivers/media/platform/qcom/iris/iris_buffer.h b/drivers/media/platform/qcom/iris/iris_buffer.h
index 75bb767761824c4c02e0df9b765896cc093be333..9520aa290b44f06ed2004ad89940c19d1c08a3d2 100644
--- a/drivers/media/platform/qcom/iris/iris_buffer.h
+++ b/drivers/media/platform/qcom/iris/iris_buffer.h
@@ -28,6 +28,7 @@ struct iris_inst;
  * @BUF_SCRATCH_2: buffer to store encoding context data for HW
  * @BUF_VPSS: buffer to store VPSS context data for HW
  * @BUF_PARTIAL: buffer for AV1 IBC data
+ * @BUF_HFI_QUEUE: buffer for hardware firmware interface queue
  * @BUF_TYPE_MAX: max buffer types
  */
 enum iris_buffer_type {
@@ -44,6 +45,7 @@ enum iris_buffer_type {
 	BUF_SCRATCH_2,
 	BUF_VPSS,
 	BUF_PARTIAL,
+	BUF_HFI_QUEUE,
 	BUF_TYPE_MAX,
 };
 
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_queue.c b/drivers/media/platform/qcom/iris/iris_hfi_queue.c
index b3ed06297953b902d5ea6c452385a88d5431ac66..c1241fb8dc6519020a063cbba87aed665701d7ae 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_queue.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_queue.c
@@ -245,25 +245,26 @@ static void iris_hfi_queue_deinit(struct iris_iface_q_info *iface_q)
 
 int iris_hfi_queues_init(struct iris_core *core)
 {
+	struct device *dev = iris_get_cb_dev(core, NULL, BUF_HFI_QUEUE);
 	struct iris_hfi_queue_table_header *q_tbl_hdr;
 	u32 queue_size;
 
 	/* Iris hardware requires 4K queue alignment */
 	queue_size = ALIGN((sizeof(*q_tbl_hdr) + (IFACEQ_QUEUE_SIZE * IFACEQ_NUMQ)), SZ_4K);
-	core->iface_q_table_vaddr = dma_alloc_attrs(core->dev, queue_size,
+	core->iface_q_table_vaddr = dma_alloc_attrs(dev, queue_size,
 						    &core->iface_q_table_daddr,
 						    GFP_KERNEL, DMA_ATTR_WRITE_COMBINE);
 	if (!core->iface_q_table_vaddr) {
-		dev_err(core->dev, "queues alloc and map failed\n");
+		dev_err(dev, "queues alloc and map failed\n");
 		return -ENOMEM;
 	}
 
-	core->sfr_vaddr = dma_alloc_attrs(core->dev, SFR_SIZE,
+	core->sfr_vaddr = dma_alloc_attrs(dev, SFR_SIZE,
 					  &core->sfr_daddr,
 					  GFP_KERNEL, DMA_ATTR_WRITE_COMBINE);
 	if (!core->sfr_vaddr) {
-		dev_err(core->dev, "sfr alloc and map failed\n");
-		dma_free_attrs(core->dev, sizeof(*q_tbl_hdr), core->iface_q_table_vaddr,
+		dev_err(dev, "sfr alloc and map failed\n");
+		dma_free_attrs(dev, sizeof(*q_tbl_hdr), core->iface_q_table_vaddr,
 			       core->iface_q_table_daddr, DMA_ATTR_WRITE_COMBINE);
 		return -ENOMEM;
 	}
@@ -291,6 +292,7 @@ int iris_hfi_queues_init(struct iris_core *core)
 
 void iris_hfi_queues_deinit(struct iris_core *core)
 {
+	struct device *dev = iris_get_cb_dev(core, NULL, BUF_HFI_QUEUE);
 	u32 queue_size;
 
 	if (!core->iface_q_table_vaddr)
@@ -300,7 +302,7 @@ void iris_hfi_queues_deinit(struct iris_core *core)
 	iris_hfi_queue_deinit(&core->message_queue);
 	iris_hfi_queue_deinit(&core->command_queue);
 
-	dma_free_attrs(core->dev, SFR_SIZE, core->sfr_vaddr,
+	dma_free_attrs(dev, SFR_SIZE, core->sfr_vaddr,
 		       core->sfr_daddr, DMA_ATTR_WRITE_COMBINE);
 
 	core->sfr_vaddr = NULL;
@@ -309,7 +311,7 @@ void iris_hfi_queues_deinit(struct iris_core *core)
 	queue_size = ALIGN(sizeof(struct iris_hfi_queue_table_header) +
 		(IFACEQ_QUEUE_SIZE * IFACEQ_NUMQ), SZ_4K);
 
-	dma_free_attrs(core->dev, queue_size, core->iface_q_table_vaddr,
+	dma_free_attrs(dev, queue_size, core->iface_q_table_vaddr,
 		       core->iface_q_table_daddr, DMA_ATTR_WRITE_COMBINE);
 
 	core->iface_q_table_vaddr = NULL;
diff --git a/drivers/media/platform/qcom/iris/iris_resources.c b/drivers/media/platform/qcom/iris/iris_resources.c
index 647f6760f2b7a6bab8a585a13eb03cf60a9c047e..dd3577cf485ac238015f919f663198a575e78dde 100644
--- a/drivers/media/platform/qcom/iris/iris_resources.c
+++ b/drivers/media/platform/qcom/iris/iris_resources.c
@@ -13,6 +13,7 @@
 #include <linux/reset.h>
 
 #include "iris_core.h"
+#include "iris_instance.h"
 #include "iris_resources.h"
 
 #define BW_THRESHOLD 50000
@@ -176,3 +177,60 @@ int iris_create_child_device_and_map(struct iris_core *core, struct iris_context
 
 	return ret;
 }
+
+static enum iris_buffer_region iris_get_region(struct iris_inst *inst,
+					       enum iris_buffer_type buffer_type)
+{
+	switch (buffer_type) {
+	case BUF_INPUT:
+		if (inst && inst->domain == ENCODER)
+			return IRIS_NON_SECURE_PIXEL;
+		else if (inst && inst->domain == DECODER)
+			return IRIS_NON_SECURE_BITSTREAM;
+		break;
+	case BUF_OUTPUT:
+		if (inst && inst->domain == ENCODER)
+			return IRIS_NON_SECURE_BITSTREAM;
+		else if (inst && inst->domain == DECODER)
+			return IRIS_NON_SECURE_PIXEL;
+		break;
+	case BUF_DPB:
+	case BUF_VPSS:
+	case BUF_SCRATCH_2:
+		return IRIS_NON_SECURE_PIXEL;
+	case BUF_BIN:
+	case BUF_COMV:
+	case BUF_NON_COMV:
+	case BUF_LINE:
+	case BUF_PERSIST:
+	case BUF_ARP:
+	case BUF_HFI_QUEUE:
+		return IRIS_NON_SECURE_NON_PIXEL;
+	default:
+		return 0;
+	}
+
+	return 0;
+}
+
+struct device *iris_get_cb_dev(struct iris_core *core, struct iris_inst *inst,
+			       enum iris_buffer_type buffer_type)
+{
+	enum iris_buffer_region region;
+	struct device *dev = NULL;
+	int i;
+
+	region = iris_get_region(inst, buffer_type);
+
+	for (i = 0; i < core->iris_platform_data->cb_data_size; i++) {
+		if (core->iris_platform_data->cb_data[i].region & region) {
+			dev = core->iris_platform_data->cb_data[i].dev;
+			break;
+		}
+	}
+
+	if (!dev)
+		dev = core->dev;
+
+	return dev;
+}
diff --git a/drivers/media/platform/qcom/iris/iris_resources.h b/drivers/media/platform/qcom/iris/iris_resources.h
index b7efe15facb203eea9ae13d5f0abdcc2ea718b4d..ea31726f1789130fccf6b24540a62b86cb3c36ac 100644
--- a/drivers/media/platform/qcom/iris/iris_resources.h
+++ b/drivers/media/platform/qcom/iris/iris_resources.h
@@ -16,5 +16,7 @@ int iris_set_icc_bw(struct iris_core *core, unsigned long icc_bw);
 int iris_disable_unprepare_clock(struct iris_core *core, enum platform_clk_type clk_type);
 int iris_prepare_enable_clock(struct iris_core *core, enum platform_clk_type clk_type);
 int iris_create_child_device_and_map(struct iris_core *core, struct iris_context_bank *cb);
+struct device *iris_get_cb_dev(struct iris_core *core, struct iris_inst *inst,
+			       enum iris_buffer_type buffer_type);
 
 #endif
diff --git a/drivers/media/platform/qcom/iris/iris_vidc.c b/drivers/media/platform/qcom/iris/iris_vidc.c
index bd38d84c9cc79d15585ed5dd5f905a37521cb6dc..b61d7941d88662f34a9d2ab3b6c5bd9acf4b5df5 100644
--- a/drivers/media/platform/qcom/iris/iris_vidc.c
+++ b/drivers/media/platform/qcom/iris/iris_vidc.c
@@ -107,7 +107,7 @@ iris_m2m_queue_init(void *priv, struct vb2_queue *src_vq, struct vb2_queue *dst_
 	src_vq->drv_priv = inst;
 	src_vq->buf_struct_size = sizeof(struct iris_buffer);
 	src_vq->min_reqbufs_allocation = MIN_BUFFERS;
-	src_vq->dev = inst->core->dev;
+	src_vq->dev = iris_get_cb_dev(inst->core, inst, BUF_INPUT);
 	src_vq->lock = &inst->ctx_q_lock;
 	ret = vb2_queue_init(src_vq);
 	if (ret)
@@ -121,7 +121,7 @@ iris_m2m_queue_init(void *priv, struct vb2_queue *src_vq, struct vb2_queue *dst_
 	dst_vq->drv_priv = inst;
 	dst_vq->buf_struct_size = sizeof(struct iris_buffer);
 	dst_vq->min_reqbufs_allocation = MIN_BUFFERS;
-	dst_vq->dev = inst->core->dev;
+	dst_vq->dev = iris_get_cb_dev(inst->core, inst, BUF_OUTPUT);
 	dst_vq->lock = &inst->ctx_q_lock;
 
 	return vb2_queue_init(dst_vq);

-- 
2.34.1


