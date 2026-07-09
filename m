Return-Path: <linux-media+bounces-67144-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id RJkfOIiWT2onkQIAu9opvQ
	(envelope-from <linux-media+bounces-67144-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 09 Jul 2026 14:39:36 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C65D731137
	for <lists+linux-media@lfdr.de>; Thu, 09 Jul 2026 14:39:36 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=I1lzeSfO;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=TNB4Mcup;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67144-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-media+bounces-67144-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D16553085C23
	for <lists+linux-media@lfdr.de>; Thu,  9 Jul 2026 12:37:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2751842B32E;
	Thu,  9 Jul 2026 12:36:39 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E993E42B307
	for <linux-media@vger.kernel.org>; Thu,  9 Jul 2026 12:36:36 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783600598; cv=none; b=ZIMrrUZP37oSNFdYyOjAvizY+9RS6H/KftgWtJz2NXLjV8yy8b+AwUvpxy3yyJBBBUHPptO5sp8+czCxjvcOdczEHe5rhmBPmrcLyVm4nXhJtgQ4Rdh2ZUJsN5flinPDLK+ixj0zioq1/jdqqChJU4MhYxBZWyIom5tYCte08fo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783600598; c=relaxed/simple;
	bh=5K2A89EZdTCGWEGzlw3xubyrF5oGhfeE+dcn9+oMIEU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dSro1vKEdn/kBpVLAvtoTcibS//OhB4MoPS3XkI4PoatlvwEO4nHuEswkz2cyaUX3naizvlrjO9ZFXjl65aLNHKWRcoth4Ctay/HwacRXtqZerglMIv7hqR24HaXF3i21o3bn2S57XTFRrZNt5rlBhCaw8Kr2MoI43uKbRKEFAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=I1lzeSfO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TNB4Mcup; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669BNNnO1669307
	for <linux-media@vger.kernel.org>; Thu, 9 Jul 2026 12:36:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	g0b4RA9D3fflP/dI3q6on88T2PxzGnFRbK3qXnXqGV8=; b=I1lzeSfOfhR9qQu0
	n5GbTW5icsicUo/xwElFCsAyY4yOxk3ZV9Z3/O7lPpmoFlyEpmQ2zOfE6NAOEWJR
	GUitcajhgnMO0d/bjIB0+dvm77uQbna8NEcV1sOjbAfX15wJYV0iCJeTxstKNOZN
	3VWXI5Se0T7FJIDeoKWTP3+ItXLCoB/dNJSDS5xP0YVJ7PuITWV3TtdE5DNXgOTW
	eVuG3uYnMHByZ4Z/k5khYq10plxCo3UFzQCEtwVAV59syMkFMDro/67fEOCwketD
	t7kzOxrX1ynG+eH/UrExdzOPBBAayLpDt1wSalWVgBvAc+kXFM87XsFUyzVDzaI4
	mvJi/g==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fa418j54y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 09 Jul 2026 12:36:36 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-380fe2a3fc7so1952564a91.2
        for <linux-media@vger.kernel.org>; Thu, 09 Jul 2026 05:36:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783600595; x=1784205395; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g0b4RA9D3fflP/dI3q6on88T2PxzGnFRbK3qXnXqGV8=;
        b=TNB4McupD8MID91pNQhTPV8HH31YGl+MLeCXyTyeanhH9BxzGXNKpe4nAes2jWcllm
         ncNxsnSISXft5qW7dWWv+9BUxa15T7WURzGAAtw+U1h8qCj8nNiACF4gv/AplBUU3F75
         t7z3jj5/PpE4iP53+jVgdhsYbVIhmZ7k+ebAOdm4C5C9121n675XeMnXkgUsqmjo6Hmw
         fod2hhR/eY8ElUcF/E6s4Uo8EDNpDc43AzoOecC53U/9kmBS2pc3T5VK5IcM8xZRTMwR
         FTmv4UPRLn3b3BC86eJyvPwtLveUPsOqqENfr03LPZrNQHrZixXJyq22hxg04lpWuhXW
         xgZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783600595; x=1784205395;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=g0b4RA9D3fflP/dI3q6on88T2PxzGnFRbK3qXnXqGV8=;
        b=np60oVB3fcFZtFnjfxScQ2xU+WMOws2kTom0rPFXWdC/bSrm1e9b0IdkzZWh3W+5ZY
         Srst+vqzghYD8DI7itvQRBWgyEIgEtzwlMDysKFPH1XLV7YN/eecR5uPBq9AD0ydZMKS
         AxMUNTm5fRlqlZqtDyPKIwJSYYwFOfZVgRAmhLPo0bQ85jA6Ar1Qf9Gy21P0ZgYuy73S
         8Y/z8P9QbZUoRXm1zAxyideaNPrUp611nwXtwdVzhI/WQ0pdbNxLouPYBHjaWkJIiPaU
         FTbaSdEhMuiVoTvR5FLaDW/YIVrEpubfvgCnvtRx4Sx+xrgIUuiyBu/UfvrhtjW24zR9
         bOlQ==
X-Gm-Message-State: AOJu0YyWkvbCbI3zRio+sasXQXTk2ZTzqI5SpRmDm29aX64Knpzf+G4j
	QiWqtIkIBUWlx0YHG6CG95mTX6JhCgElHXzfP0MMa6/thpYHkIcvPPtV5eyE/ZEJlgs+s4LUmra
	l8XW90MfPVgBZvsLroDibD13ZIQX9HNX30EyW+kbSnTNP6UbfzXVoNWw2nGt55uQ3Wg==
X-Gm-Gg: AfdE7clx6/igffBdFyvsGdDI/zpBa3YJCWwUB3rrJLYU94L9FgSMnKYVUTuqBmzRCOo
	E5TKRY28xuyTwyiFoaeffB7rYr1gobrbXXtUfNnH62KkOOCv9gs5F/aF6OdGJCvMNt0e/dnynSL
	yJVmh5wRPLHxrHFezH+1oGsTpyX1Q6DNSXOXXLOuDJF8b3ddL4I4cJXgPcIiAAVXBdupuf/bqA5
	OIyInVu/8Tz3ykVhcIhIk+h27nNn9cF+zPxrk/MTaH+s3uKm5lg/fIjXPBgHcRQi9eDvLcboYwg
	6tFH1fCvDZcCTBeZ4jAQHOQI+LEdw/4tfsemYQ8FLfqu197VXrCfih9DtJXwv5KWBZQUYnLPQf7
	audJgiKI96H76/z/d6I9Yb/K6gVXtLPaoZDKZs7BCqCLUvQ==
X-Received: by 2002:a17:90b:554b:b0:384:229e:1d1c with SMTP id 98e67ed59e1d1-389421acc9dmr6156655a91.31.1783600595404;
        Thu, 09 Jul 2026 05:36:35 -0700 (PDT)
X-Received: by 2002:a17:90b:554b:b0:384:229e:1d1c with SMTP id 98e67ed59e1d1-389421acc9dmr6156618a91.31.1783600594823;
        Thu, 09 Jul 2026 05:36:34 -0700 (PDT)
Received: from hu-vgarodia-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3117483941csm31456029eec.7.2026.07.09.05.36.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 05:36:34 -0700 (PDT)
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Date: Thu, 09 Jul 2026 18:05:50 +0530
Subject: [RFC PATCH 04/11] media: iris: Add helper to select relevant
 context bank device
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260709-vpu_iommu_iova_handling-v1-4-72bb62cb2dfd@oss.qualcomm.com>
References: <20260709-vpu_iommu_iova_handling-v1-0-72bb62cb2dfd@oss.qualcomm.com>
In-Reply-To: <20260709-vpu_iommu_iova_handling-v1-0-72bb62cb2dfd@oss.qualcomm.com>
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783600568; l=9514;
 i=vikash.garodia@oss.qualcomm.com; s=20241104; h=from:subject:message-id;
 bh=5K2A89EZdTCGWEGzlw3xubyrF5oGhfeE+dcn9+oMIEU=;
 b=QzQOIXdGcdsoT+4jg2SktAYl18nZu0XOUtCRQzhfhGQUXx8AP+bX5LLUJ7dEoLbk6WIZC/j9q
 6AUTtmqrRJzBGQ26P/4VyZkPXobLqORi+8FCPGVEzSKD1ZvTBvgdD/J
X-Developer-Key: i=vikash.garodia@oss.qualcomm.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-Authority-Analysis: v=2.4 cv=UI3t2ify c=1 sm=1 tr=0 ts=6a4f95d4 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=1mAbuoZ9JynoZkEgmloA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDEyMiBTYWx0ZWRfX/JHpV85q68qN
 ghsJTV6CNuS1/z9iIiSbJKmZaTqcNxP8jsPUvi6AY/R4u/Fez6CXnkJp1i1HWIMdeLlz+f7Csiy
 mJh2Rlwe3DdqSBxbKS1sp+Mb0fUMiy5iuDCrDNPIecCnTCEKje7BhxAGfTVdCX+A+PNsSKL23sj
 FXNLWTPzVnToP5K0sbj0v0wHdLiVsnumhw3kKRLbkp1N56wAuizjfDRO+y3TEKi2AqTj/iNRjZc
 Dr+bfrPjH1HzgphHA9FYocJ/O4ZXCBTzF1BfYz8frYWx0a8NI2JHRFzqvto+MUukTFkgih7ICzl
 Qi79OKX9SkmlpptyGvL1DvKCqfvgR9YyNqTd9KbclgPZt4EHXQTmi5q2YD5/HVrM/2DYrjCUxVr
 Ft5hFgPCuXEJe4AcbdEB8iDUCD2Nyi+upIWpsspRIerP0L4HXxjk67/xtB5fiuHvKHM9UP5Upft
 EnVtuoCVE/UrbiNv7yw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDEyMiBTYWx0ZWRfX15TS7hDz34Sk
 KUGomi/rndiEEioPZ4O0TSSXk5x2Buu/vtZGWBs3rJUomu/NXXhcJ63xqD2+5Pfml331EI2XRS2
 NW0pt1zx+U+9oI6lmI1NVXSBS7bS4B4=
X-Proofpoint-GUID: Qw9GLU9Ebuw6v4QULundp6fPstuqL1jw
X-Proofpoint-ORIG-GUID: Qw9GLU9Ebuw6v4QULundp6fPstuqL1jw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_02,2026-07-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 spamscore=0 malwarescore=0 bulkscore=0
 adultscore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090122
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-67144-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:dikshita.agarwal@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:vikash.garodia@oss.qualcomm.com,m:busanna.reddy@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[vikash.garodia@oss.qualcomm.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vikash.garodia@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6C65D731137

Associate the context bank device with the respective buffers. Fall back
to core->dev when the platform still describes the IOMMU on the parent
iris node instead of using subnodes. Those platforms would be migrated
gradually.

Co-developed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_buffer.c    |  8 ++---
 drivers/media/platform/qcom/iris/iris_core.h      |  4 +++
 drivers/media/platform/qcom/iris/iris_hfi_queue.c | 16 +++++----
 drivers/media/platform/qcom/iris/iris_resources.c | 41 +++++++++++++++++++++++
 drivers/media/platform/qcom/iris/iris_resources.h |  1 +
 drivers/media/platform/qcom/iris/iris_vidc.c      |  4 +--
 6 files changed, 61 insertions(+), 13 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_buffer.c b/drivers/media/platform/qcom/iris/iris_buffer.c
index 246ad0abbac3510113e1f760406c81b1461377a3..249c9f1d0d5dadb391f269e9aee5181fe408cd3b 100644
--- a/drivers/media/platform/qcom/iris/iris_buffer.c
+++ b/drivers/media/platform/qcom/iris/iris_buffer.c
@@ -529,7 +529,7 @@ static int iris_create_internal_buffer(struct iris_inst *inst,
 				       enum iris_buffer_type buffer_type, u32 index)
 {
 	struct iris_buffers *buffers = &inst->buffers[buffer_type];
-	struct iris_core *core = inst->core;
+	struct device *dev = iris_get_cb_dev(inst, buffer_type);
 	struct iris_buffer *buffer;
 
 	if (!buffers->size)
@@ -545,7 +545,7 @@ static int iris_create_internal_buffer(struct iris_inst *inst,
 	buffer->buffer_size = buffers->size;
 	buffer->dma_attrs = DMA_ATTR_WRITE_COMBINE | DMA_ATTR_NO_KERNEL_MAPPING;
 
-	buffer->kvaddr = dma_alloc_attrs(core->dev, buffer->buffer_size,
+	buffer->kvaddr = dma_alloc_attrs(dev, buffer->buffer_size,
 					 &buffer->device_addr, GFP_KERNEL, buffer->dma_attrs);
 	if (!buffer->kvaddr) {
 		kfree(buffer);
@@ -682,10 +682,10 @@ int iris_queue_internal_buffers(struct iris_inst *inst, u32 plane)
 
 int iris_destroy_internal_buffer(struct iris_inst *inst, struct iris_buffer *buffer)
 {
-	struct iris_core *core = inst->core;
+	struct device *dev = iris_get_cb_dev(inst, buffer->type);
 
 	list_del(&buffer->list);
-	dma_free_attrs(core->dev, buffer->buffer_size, buffer->kvaddr,
+	dma_free_attrs(dev, buffer->buffer_size, buffer->kvaddr,
 		       buffer->device_addr, buffer->dma_attrs);
 	kfree(buffer);
 
diff --git a/drivers/media/platform/qcom/iris/iris_core.h b/drivers/media/platform/qcom/iris/iris_core.h
index 24da60448cf24820af7947b85eb7208555ab7786..3c96f46cf567b2802148b2a7cedb8488b6b9468b 100644
--- a/drivers/media/platform/qcom/iris/iris_core.h
+++ b/drivers/media/platform/qcom/iris/iris_core.h
@@ -36,6 +36,8 @@ struct qcom_ubwc_cfg_data;
  * struct iris_core - holds core parameters valid for all instances
  *
  * @dev: reference to device structure
+ * @np_dev: reference to non-pixel device structure
+ * @p_dev: reference to pixel device structure
  * @reg_base: IO memory base address
  * @irq: iris irq
  * @v4l2_dev: a holder for v4l2 device structure
@@ -81,6 +83,8 @@ struct qcom_ubwc_cfg_data;
 
 struct iris_core {
 	struct device				*dev;
+	struct device				*np_dev;
+	struct device				*p_dev;
 	void __iomem				*reg_base;
 	int					irq;
 	struct v4l2_device			v4l2_dev;
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_queue.c b/drivers/media/platform/qcom/iris/iris_hfi_queue.c
index bf6db23b53e2106c08f2139b643f8626af8bc40a..ce6a682b0f9ada79f9fae26289db298855d777c2 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_queue.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_queue.c
@@ -245,25 +245,26 @@ static void iris_hfi_queue_deinit(struct iris_iface_q_info *iface_q)
 
 int iris_hfi_queues_init(struct iris_core *core)
 {
+	struct device *dev = core->np_dev ? core->np_dev : core->dev;
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
-		dma_free_attrs(core->dev, queue_size, core->iface_q_table_vaddr,
+		dev_err(dev, "sfr alloc and map failed\n");
+		dma_free_attrs(dev, queue_size, core->iface_q_table_vaddr,
 			       core->iface_q_table_daddr, DMA_ATTR_WRITE_COMBINE);
 		return -ENOMEM;
 	}
@@ -291,6 +292,7 @@ int iris_hfi_queues_init(struct iris_core *core)
 
 void iris_hfi_queues_deinit(struct iris_core *core)
 {
+	struct device *dev = core->np_dev ? core->np_dev : core->dev;
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
index f550d194edf58abf0687a4f5df6d06b2af35147d..884715c8c841623f6803ac3d493c9a20520d5087 100644
--- a/drivers/media/platform/qcom/iris/iris_resources.c
+++ b/drivers/media/platform/qcom/iris/iris_resources.c
@@ -12,6 +12,7 @@
 #include <linux/reset.h>
 
 #include "iris_core.h"
+#include "iris_instance.h"
 #include "iris_resources.h"
 
 #define BW_THRESHOLD 50000
@@ -164,3 +165,43 @@ struct device *iris_create_cb_dev(struct iris_core *core, const char *name)
 
 	return &pdev->dev;
 }
+
+struct device *iris_get_cb_dev(struct iris_inst *inst, enum iris_buffer_type buffer_type)
+{
+	struct iris_core *core = inst->core;
+	struct device *dev = NULL;
+
+	switch (buffer_type) {
+	case BUF_INPUT:
+		if (inst->domain == DECODER)
+			dev = core->np_dev;
+		else
+			dev = core->p_dev;
+		break;
+	case BUF_OUTPUT:
+		if (inst->domain == DECODER)
+			dev = core->p_dev;
+		else
+			dev = core->np_dev;
+		break;
+	case BUF_DPB:
+	case BUF_PARTIAL:
+	case BUF_SCRATCH_1:
+	case BUF_SCRATCH_2:
+	case BUF_VPSS:
+		dev = core->p_dev;
+		break;
+	case BUF_BIN:
+	case BUF_ARP:
+	case BUF_COMV:
+	case BUF_LINE:
+	case BUF_NON_COMV:
+	case BUF_PERSIST:
+		dev = core->np_dev;
+		break;
+	default:
+		dev_err(core->dev, "invalid buffer type: %d\n", buffer_type);
+	}
+
+	return dev ? dev : core->dev;
+}
diff --git a/drivers/media/platform/qcom/iris/iris_resources.h b/drivers/media/platform/qcom/iris/iris_resources.h
index ca53c01f60aef2040002f526b8f1b6a9094d1518..2eef0676a146f1836fc7445a715e43185c645099 100644
--- a/drivers/media/platform/qcom/iris/iris_resources.h
+++ b/drivers/media/platform/qcom/iris/iris_resources.h
@@ -16,5 +16,6 @@ int iris_set_icc_bw(struct iris_core *core, unsigned long icc_bw);
 int iris_disable_unprepare_clock(struct iris_core *core, enum platform_clk_type clk_type);
 int iris_prepare_enable_clock(struct iris_core *core, enum platform_clk_type clk_type);
 struct device *iris_create_cb_dev(struct iris_core *core, const char *name);
+struct device *iris_get_cb_dev(struct iris_inst *inst, enum iris_buffer_type buffer_type);
 
 #endif
diff --git a/drivers/media/platform/qcom/iris/iris_vidc.c b/drivers/media/platform/qcom/iris/iris_vidc.c
index 14d63dc76c9bacbed3533147cd5325410f9c94bd..26df872fb4fa1cc6b2aacebb7453256864b1462a 100644
--- a/drivers/media/platform/qcom/iris/iris_vidc.c
+++ b/drivers/media/platform/qcom/iris/iris_vidc.c
@@ -107,7 +107,7 @@ iris_m2m_queue_init(void *priv, struct vb2_queue *src_vq, struct vb2_queue *dst_
 	src_vq->drv_priv = inst;
 	src_vq->buf_struct_size = sizeof(struct iris_buffer);
 	src_vq->min_reqbufs_allocation = MIN_BUFFERS;
-	src_vq->dev = inst->core->dev;
+	src_vq->dev = iris_get_cb_dev(inst, BUF_INPUT);
 	src_vq->lock = &inst->ctx_q_lock;
 	ret = vb2_queue_init(src_vq);
 	if (ret)
@@ -121,7 +121,7 @@ iris_m2m_queue_init(void *priv, struct vb2_queue *src_vq, struct vb2_queue *dst_
 	dst_vq->drv_priv = inst;
 	dst_vq->buf_struct_size = sizeof(struct iris_buffer);
 	dst_vq->min_reqbufs_allocation = MIN_BUFFERS;
-	dst_vq->dev = inst->core->dev;
+	dst_vq->dev = iris_get_cb_dev(inst, BUF_OUTPUT);
 	dst_vq->lock = &inst->ctx_q_lock;
 
 	return vb2_queue_init(dst_vq);

-- 
2.34.1


