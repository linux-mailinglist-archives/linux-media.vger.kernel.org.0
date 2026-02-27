Return-Path: <linux-media+bounces-53726-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aHJRBrCooWm1vQQAu9opvQ
	(envelope-from <linux-media+bounces-53726-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 27 Feb 2026 15:22:40 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C352D1B8CBD
	for <lists+linux-media@lfdr.de>; Fri, 27 Feb 2026 15:22:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A40A930AF3E4
	for <lists+linux-media@lfdr.de>; Fri, 27 Feb 2026 14:13:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 948C1421EF7;
	Fri, 27 Feb 2026 14:12:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MkMumLsz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OOMFVOP1"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D9383F074B
	for <linux-media@vger.kernel.org>; Fri, 27 Feb 2026 14:12:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772201544; cv=none; b=aT/qevaHxzGFR2nMpwzS/74uTEYAQ7rwhc+f+bnaihEaFc2ky16QY1aSxmaGyef3MZvjTdrOzrPsc7ZDhCm1B7s3JP0D9Tx5tNA8Qjo8uzOAk3OrfVzBJmTR7pJaprXzSESkdiwAs5w2SNXilyW0Gg6mNPhoablD9NgZAUKOntA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772201544; c=relaxed/simple;
	bh=A2cTJAJOWwmcNM7Cqy6HBYZsCSZ/Mfh5Hx8YHKW/P7o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=n4HjyEifCkyEYLaQ0CfoXPEeUa7pI8lHPVyoWLecZQ53YFR4EnpSVPP9Lus0P/l9CeB8G4aE2e8GkNq0ntHIoRPZRfC4g7r46blSjXOOY+4U9bW6oblksd6sMo6zIVwYGBw3DLh07oKIaZbhezLJHd3gxLEGbrNzR/Bcm7QGHG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MkMumLsz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OOMFVOP1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61RAC7Mw2402982
	for <linux-media@vger.kernel.org>; Fri, 27 Feb 2026 14:12:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	x2Ok7E/HN2Jc97AUA0H0IcP61qaQN5IUIHSr/AW55zI=; b=MkMumLszkOSyBNdk
	jm06T3LmGrizwYiTs7xfJ05l8OanXM64vIa2eFpvnsMvzHsUJGllnYf9wCnlPqxi
	DH+SCW9qpfLJElY7EpHZMpHx4Wk027GsVsBCPa0c2Qubk8IkN2RHs/6xqvNJfkvS
	8KWahDT2mgGDagmDTjvQGdeJUSdHTSb4xMKuCADcu1PUdvbFvAQXLYTFLpX9nhLK
	xv/hKGifUfWmVOCB3Mg/+KKgymoE+Ev/xinLdK7XsQdOxAZY2aYwFy1K36xDlK8X
	BuwDcf3L4nkS9ODwuaL2hlL3LZBIPsGePlWnguWitG+AwrUYcJ34U+RCYkkeFlzE
	f6A9Og==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cjw23b1r9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 27 Feb 2026 14:12:21 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2aadeb3dee4so119574755ad.2
        for <linux-media@vger.kernel.org>; Fri, 27 Feb 2026 06:12:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772201540; x=1772806340; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x2Ok7E/HN2Jc97AUA0H0IcP61qaQN5IUIHSr/AW55zI=;
        b=OOMFVOP1R9zZpitX7yUEx2nX03tEsb690Anf2AjtaxMYivjp0f/4x+Lq+vFG8WEX6h
         u6cUQSAogteYp9w4atPdyDPIV0Wv3aty0w478CbtWDf8UL5UYvgOzyEXXJ4W/J/R2R8d
         ilYdcoms398ImUuIOqfg5BG2OqaYNqgmE+VR0wV+3f0zLOeePmwOUiQPKOe9TtvD3Rya
         2Z/IC2rfJnmckul/ZE7crA2RwrY3eAgJSErjkVmiDMQTv45k6O07fKc2D1Fc3Bv8zlr+
         31G9JH13r2cYi3PbAmo8BYS72TJhDAfnfhA/rUITIlB+02gGeTBBTofiLQ0ZcEN+J9KC
         1PzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772201540; x=1772806340;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=x2Ok7E/HN2Jc97AUA0H0IcP61qaQN5IUIHSr/AW55zI=;
        b=fLEwzt8urA1FOTZwwC5nmeL+3oSKnm/0N1Mm0fYvj3JvIH+u75jijRy2cjKXW4KnLC
         nR1nsWEPzvKi7CYv4VygLthrkDM0Ow+lRyguHtl/ghdyf7a4CK7kmv2D7cDPdTZovYiN
         n9v9rZIbY+HF3nIyjR9QAjAhm7n0NwepRWDq5A0svmjOz9EYoMOSTPj9u+Y8YlZePlJn
         4qkQp14sAfFz8TnrbxcBKPY3yfsScxzBjNwKIDvF6XjPLz0B0iHxaJmLDgt1vtBWLK9L
         LBk9Fscc1wmc0ZNoWHXfOwL1ixPxjXtwTF/9FGyqmHAeSeR8OwX7JVBzZKZ+SPdhqPCO
         6rwQ==
X-Forwarded-Encrypted: i=1; AJvYcCX/mh3tD2TbPM2EJ3mNlsnhbwYfw4tq82mVzGW1mVdceXIYbr/RZvr6qEb6wuLoJ6WT9ixJX0qVba4l2w==@vger.kernel.org
X-Gm-Message-State: AOJu0YzyV4IHFmezpy9VyhBonP/JQ+JBpfjA4i9ipT7oPDal5fAqr8A8
	XB1Nc6xDz6LYE1uVVlkFBUWw/SPi60nuuF3i3NEgHspIgm+CX7eRbMgC+fJlLkaMv8jdiDTgKn+
	KcTmZk8s211bMNItyaM1m1PJ4u9h3cAAy9d1NXzuBewrP4I2gTKM8yLF5xyg93QFXSw==
X-Gm-Gg: ATEYQzwGRJFt+crPkD1BFRIi3YBjSyTDNmDai6IGFTBH48f6+ZYvDxS4YP58IzNkJ+F
	gcvOTDC1X6iI2xJBUxe4jHxyYM7UdOZ8nR5C5jFMn6zqQ+zwiXd+pUNDq0v8LILqXmbstvhWjcz
	rm64884qfKGWfWzZtFlVNZisPAK7qOvzhNLGe0w64sYn+pNfpRmY+z11RfA+VsVLWmtSWNeqAD/
	HaOIkGzvZDrnjngfsfXpyc/xNoHeoMNncwwzguY67zoy3v91S/j5eZV84tx0zqjtKWg07Xpx9OO
	UK4D1x44O7CjfuoMqSkqQ2isf7Ks996GMIgkTavW3QtcIvssD/Of8As8L58gpIptK3ciUiQSf7Y
	/0EX1V8/4qHW4zNLuCKA/09Ew2LiYnd3v7lKND9iH6tR1LbFyl9jzupuw
X-Received: by 2002:a17:903:2442:b0:2a7:d7dd:8812 with SMTP id d9443c01a7336-2ae2e4b55c6mr29452125ad.38.1772201540313;
        Fri, 27 Feb 2026 06:12:20 -0800 (PST)
X-Received: by 2002:a17:903:2442:b0:2a7:d7dd:8812 with SMTP id d9443c01a7336-2ae2e4b55c6mr29451535ad.38.1772201539671;
        Fri, 27 Feb 2026 06:12:19 -0800 (PST)
Received: from hu-vgarodia-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2adfb5c183bsm60960865ad.24.2026.02.27.06.12.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Feb 2026 06:12:19 -0800 (PST)
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Date: Fri, 27 Feb 2026 19:41:21 +0530
Subject: [PATCH v2 5/7] media: iris: add helper to select context bank
 device
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260227-kaanapali-iris-v2-5-850043ac3933@oss.qualcomm.com>
References: <20260227-kaanapali-iris-v2-0-850043ac3933@oss.qualcomm.com>
In-Reply-To: <20260227-kaanapali-iris-v2-0-850043ac3933@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772201499; l=10074;
 i=vikash.garodia@oss.qualcomm.com; s=20241104; h=from:subject:message-id;
 bh=A2cTJAJOWwmcNM7Cqy6HBYZsCSZ/Mfh5Hx8YHKW/P7o=;
 b=9EJndfJoHhaV5zDZ5jwwSdmz/3+MWwvfLnZXNhh90OKKv8IbHZaVvkhIUg2ybaF/HEDPl2rih
 Y85BKCEnffvBJI0xg5yqUazzZ+IOwaD/GbdVo0+JWfACMbn7b1nyMuF
X-Developer-Key: i=vikash.garodia@oss.qualcomm.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-Proofpoint-GUID: Eh08AAWOcItjLE9uXRYD6EThuSMjNDF-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI3MDEyNSBTYWx0ZWRfX3U784b+HPNbu
 ds3eXFM5gpERFNTS2LhhmuanvcDrUjNfVPi0ePqOvjagFsb3rbL48R/1Gv4Jz3+U1Yy/HHlpzKq
 jnrsXdpospmgVEllquB9cEejjvzjn2vsXh3XsIZthntPfUoWitvRUKAUDsWyIgzGsEEcWUr5O5m
 cZCCCWY9xsnPfEMviRykZ7EDCZtSUFPNiYm1rboso2qIsXLzL6RB1QXulxU/ThEaT7w2LGlcB5n
 i4l5CVLDRFbC8bZ2eLcOKGwSZeVnmJnzPG3idN0UchVKRRL7rHv9YJ4+VaEbR2BM1stm81RRi96
 9ifd/CPg3VqLy8wWW1Ke80ePuNtKHSFf72B4N5zvFoJIIdAZLx7ohgcaI+WbY8zheofinXaYsNl
 KwkGhSj6RyMzUXZGYD/C/FgUH3c8ICd2wh3dahR3Oeev64wZh5I8beW66moPRerM+stWTsKN+aB
 JuXON5wijbH1gpiCKFQ==
X-Authority-Analysis: v=2.4 cv=cJHtc1eN c=1 sm=1 tr=0 ts=69a1a645 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=yd2bZIjurNtSSvP6G-UA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: Eh08AAWOcItjLE9uXRYD6EThuSMjNDF-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-27_02,2026-02-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0 adultscore=0
 spamscore=0 clxscore=1015 priorityscore=1501 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602270125
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[23];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-53726-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vikash.garodia@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt,cisco];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C352D1B8CBD
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
 drivers/media/platform/qcom/iris/iris_hfi_queue.c | 16 +++---
 drivers/media/platform/qcom/iris/iris_resources.c | 60 +++++++++++++++++++++++
 drivers/media/platform/qcom/iris/iris_resources.h |  2 +
 drivers/media/platform/qcom/iris/iris_vidc.c      |  4 +-
 6 files changed, 79 insertions(+), 12 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_buffer.c b/drivers/media/platform/qcom/iris/iris_buffer.c
index 9151f43bc6b9c2c34c803de4231d1e6de0bec6c4..95962c19c334f08a74c5b7e8ba978ab631a65e9c 100644
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
index be58e8620086d0f82c2c2bda29247483f5c56d79..65544cb0fa8fc4b250b0a0be1bb900d74b999d35 100644
--- a/drivers/media/platform/qcom/iris/iris_resources.c
+++ b/drivers/media/platform/qcom/iris/iris_resources.c
@@ -13,6 +13,7 @@
 #include <linux/reset.h>
 
 #include "iris_core.h"
+#include "iris_instance.h"
 #include "iris_resources.h"
 
 #define BW_THRESHOLD 50000
@@ -177,3 +178,62 @@ int iris_create_child_device_and_map(struct iris_core *core, struct iris_context
 
 	return 0;
 }
+
+static enum iris_buffer_region iris_get_region(struct iris_inst *inst,
+					       enum iris_buffer_type buffer_type)
+{
+	switch (buffer_type) {
+	case BUF_INPUT:
+		if (inst && inst->domain == ENCODER)
+			return IRIS_PIXEL_REGION;
+		else if (inst && inst->domain == DECODER)
+			return IRIS_BITSTREAM_REGION;
+		break;
+	case BUF_OUTPUT:
+		if (inst && inst->domain == ENCODER)
+			return IRIS_BITSTREAM_REGION;
+		else if (inst && inst->domain == DECODER)
+			return IRIS_PIXEL_REGION;
+		break;
+	case BUF_BIN:
+		return IRIS_BITSTREAM_REGION;
+	case BUF_DPB:
+	case BUF_PARTIAL:
+	case BUF_SCRATCH_2:
+	case BUF_VPSS:
+		return IRIS_PIXEL_REGION;
+	case BUF_ARP:
+	case BUF_COMV:
+	case BUF_HFI_QUEUE:
+	case BUF_LINE:
+	case BUF_NON_COMV:
+	case BUF_PERSIST:
+		return IRIS_NON_PIXEL_REGION;
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


