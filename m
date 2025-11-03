Return-Path: <linux-media+bounces-46201-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 9428FC2B3C1
	for <lists+linux-media@lfdr.de>; Mon, 03 Nov 2025 12:05:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id D23F34E5DD7
	for <lists+linux-media@lfdr.de>; Mon,  3 Nov 2025 11:05:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 626EE30149F;
	Mon,  3 Nov 2025 11:05:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ORAXuhGW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="f92z/70v"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2002130101B
	for <linux-media@vger.kernel.org>; Mon,  3 Nov 2025 11:05:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762167936; cv=none; b=a86tziLxMtkVTJK5lf1ZpUZh1d85dJaUrg2UgW6ehRvwTA0vGQp7sEmL0TZSSX7ursBOkC44Tb7XOKUAJnIhfuNOUjp5ZfNDtP/8ZIynkyDBJPWRbECCHH0Co4LMVvTAJN5dQa7wpEM8Xk43//KkfsfuB+P+cxtXMzwNawvN9Lw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762167936; c=relaxed/simple;
	bh=PbBYKOHljQv0hEquyz1u4VUhJlHsSAixsX5XEF3aXtg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=t1WUqLUb1on5L5Hh3II53oFQXGZ43eRi/fr4H6vOw/r/kYqceUljO3XQmZCOm9u4BSLwtPhQZISu9f44aQlG0Bqg5iX2rM0pF6dbRAXo1r9CNKNfKfzpW+dVi9MC4zSvxxYPixUKQQBWaHcOAqVt1njFGDKi1HeYZThWfxAVxEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ORAXuhGW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=f92z/70v; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A38olHP2730309
	for <linux-media@vger.kernel.org>; Mon, 3 Nov 2025 11:05:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=b9yQV3m8YeqlCN8IYeHs0/
	SbZ8IPaj5crI0jwyLgZOY=; b=ORAXuhGWmDvQWwQ9LRI8fG/f7dZOILjbOHc+8P
	IajcyrjuIfWWvmrHiSRCR/9GRJv4h3OGaV5wJQyUjb0CAQdo1VRK2qVoXQKz+Zzo
	nUWpdvjiNDsXODFoZRN6O64KTnURbZnEAyDFPEyC/Mj4aLAK08dBeg1K90bhmjUb
	2ohqcTf5R6Y9gqW3/E8EjYdRQW5pDuMOlO+mhA4drfGdc6sXBVrE9bzpAd7z/X20
	F81pU7W0F8ZPPqQgl13iLjfaDMe8BMRun3nF5+dz4VDJrucuMqqEH0X0gKlwOugz
	nBc3J04HlWNTuclb7zA6gSMZGVtzvvgT994+SAha9w9uSuuQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a6s86gcs1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 03 Nov 2025 11:05:33 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b9ceccbd7e8so689405a12.0
        for <linux-media@vger.kernel.org>; Mon, 03 Nov 2025 03:05:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762167933; x=1762772733; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=b9yQV3m8YeqlCN8IYeHs0/SbZ8IPaj5crI0jwyLgZOY=;
        b=f92z/70viNv2GXYWEz0GUyAa8oFQanhbE58NIogOx5pCIJ4RWHerp5hYRW5/QI36pD
         Yw5N1aIulnE6lJFm+lF1v48zvlsqkh3HK4MPLcF5EO8KT6/SnjX/usHhszHiJ9qD2FhU
         sN3NxLociz2/YuaOBDiIJS5+ladGHJ9bUno7l/oIbv6fbXAy4cJ4CetwZs8PcZ6BLYpQ
         KBQTVz8LARZbN0Y/Xlbi2OFHCbq69RDFYwdnAY3TNOU55DZlohlfOtZ0ntHUliWDTctm
         HPyu/kHqifkp5H2EDcHcGxRCcT/IXvqoUKSLs9dZEB3P+l+82VHhO9gf5WuIzTnqmwwF
         Hvsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762167933; x=1762772733;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b9yQV3m8YeqlCN8IYeHs0/SbZ8IPaj5crI0jwyLgZOY=;
        b=nacUG44NNlIFLRC+fQxcRfXqmWBpVNjrmY6SUI0AU4OlQJrjSW4WbQYYB1XTNEIu5u
         6FUrqBJyGaFE9BGhXvFbgkLjscN1s7ZTzPz9Sq9fNpI00R72jYEYVGdwb1oMoZkmWvQv
         gcQOzBa38LFBAHYxw8E4xcTwQFnX1ep6lKlGhaHBy1oRAduJ64QSVLYvYd6W1zYxMgYI
         bSjnfb/zROxy4LMN9e77XOp5ZwFuvJh0RXEL/G4T+2vs1IvnT8Q3LQo1GbqbusY+McRg
         h5Gz98xNGPwZg2xVZRy/QialAef42WBwsHs3OmbiZ4rvD3p/9pb7xrPrBi24sWAjcGQT
         3yig==
X-Gm-Message-State: AOJu0YwGq2m+/qSlcM0b8gbDAjy+OoIMrIab/a9/zunm/uc74d5u3oN/
	RR8XeoqOfanIUnuQzzOctSM2wF4oFUKajir1gAzOSuUaH+wZAYYwAs2XnOM5lqUoIzUrL6rycuq
	6LbnFJOEJuHBl8+Fnmtr8+wXtIaf+2frC9DilodgjQ4h/gQsaD08Ub/EQDW1yazs5Rw==
X-Gm-Gg: ASbGnctl/HJhpM8DEiDFnAcPYFJg+/6HM09ddgevHLNKassPF0mj1Zj1YaAd0z2SE5d
	1OO5vt6Q7M/1hsqJrzxzWh8FVwrRD4XoVLdcbXBgIyknguwPTFIkNx6NCAnXM2Tz0+txqg1H9uJ
	a01V3WprTL1vvGVp2GVCxXr/v4/Xt52nFVCfrocGWRfkxv4XnAVrro37Yj5yPP6QbjxfqRkVZMI
	yJg8LssE4bj1YS2A9rlcAjhu349emkrpQkprmGF43ZwM46xMxJ2AwBo8XNXhuvKzGmj9B7+u45l
	bAAtBirR1OUz5nYUPRWHNo5JfTNNCf9l1VxHAOEygvBvaU06kjtdmWiyKRKWEcCgSi5Ho5Bni41
	w0jUMOj4XyNSk1ZIfunPe+LPatlFiS67BLVu9
X-Received: by 2002:a05:6a00:9295:b0:7ab:8d8a:1006 with SMTP id d2e1a72fcca58-7ab8d8a12ecmr2438513b3a.2.1762167932608;
        Mon, 03 Nov 2025 03:05:32 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGOO2X3OCTIqFGdg+ksykjsr8Jsfhybzyh2B1RQ3QM+gdzBjae298OrS82qMQLYKfqudkH2UQ==
X-Received: by 2002:a05:6a00:9295:b0:7ab:8d8a:1006 with SMTP id d2e1a72fcca58-7ab8d8a12ecmr2438472b3a.2.1762167932082;
        Mon, 03 Nov 2025 03:05:32 -0800 (PST)
Received: from hu-dikshita-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a7db09f362sm10753700b3a.38.2025.11.03.03.05.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Nov 2025 03:05:31 -0800 (PST)
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Date: Mon, 03 Nov 2025 16:35:17 +0530
Subject: [PATCH] media: iris: Refine internal buffer reconfiguration logic
 for resolution change
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251103-iris-seek-fix-v1-1-6db5f5e17722@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAGyMCGkC/x2MQQqAMAzAvjJ6trBVhuBXxEPRToswZQURhn93e
 EwgqWBSVAxGV6HIraZnbhA6B8vOeRPUtTGQpxiC71GLGprIgUkfHJgiJ6LEkaA1V5Gm/980v+8
 HSJfEx18AAAA=
X-Change-ID: 20251103-iris-seek-fix-7a25af22fa52
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Val Packett <val@packett.cool>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762167928; l=2639;
 i=dikshita.agarwal@oss.qualcomm.com; s=20240917; h=from:subject:message-id;
 bh=PbBYKOHljQv0hEquyz1u4VUhJlHsSAixsX5XEF3aXtg=;
 b=WYIuLfzXNU08ovUHkWxdR29tQKAMXsBBvw47SlVLVxzDgjaiVw8PeJOwtXaV/G18pYuWmc9iW
 nMgXX0Jka0oDkEtyXq55bZXVQbNw4FIzZ9pUOCWBawkCehrzDcFDEYw
X-Developer-Key: i=dikshita.agarwal@oss.qualcomm.com; a=ed25519;
 pk=EEvKY6Ar1OI5SWf44FJ1Ebo1KuQEVbbf5UNPO+UHVhM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTAzMDEwMSBTYWx0ZWRfX5TKDOTe5b3WN
 vMc4whHiTwugLH/SdFga3hlba4qpm+zORVA8hjV5lj4a/SL3kiT+zX6uffp7l22WZ0R8/O8K6Ds
 xj4CfTAZIWx0ROPNb+o7HLdjJPFepQrgeGDqZKRV/yOsgPDoG6Z9+wBWOV9Q+BSMbJo+rLCznHt
 mZZkqFz7TOpX0K+Sdn4dGhvGtwGVVYpwpAFkx1/HD45VKsSo+rx9lpOdr0x/MfCGaoFlYn6tJjR
 3XRjQpugAfjkG0qn868s9ahW3DwpDHa4LzTc9Fmib/67QWk1dB4WYfgTkFJ+dfsxrbL62pkrOCW
 4TINIl6TUICgz+/JkGFqs2fBPFD4nGH1IPDu80yl5oiMUDr0hjlXa4aTttopq0+DWg0lFa2lpU2
 znl22BcCadkDIst1WLc9qSPsgYvxiw==
X-Authority-Analysis: v=2.4 cv=Tq/rRTXh c=1 sm=1 tr=0 ts=69088c7d cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8
 a=mRoNVkTk4HY_DrcNXJoA:9 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: 3JRL8_wfLO_99-VdinGuxys86oTz9j4S
X-Proofpoint-ORIG-GUID: 3JRL8_wfLO_99-VdinGuxys86oTz9j4S
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-03_01,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0 spamscore=0
 adultscore=0 suspectscore=0 bulkscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511030101

Improve the condition used to determine when input internal buffers need
to be reconfigured during streamon on the capture port. Previously, the
check relied on the INPUT_PAUSE sub-state, which was also being set
during seek operations. This led to input buffers being queued multiple
times to the firmware, causing session errors due to duplicate buffer
submissions.

This change introduces a more accurate check using the FIRST_IPSC and
DRC sub-states to ensure that input buffer reconfiguration is triggered
only during resolution change scenarios, such as streamoff/on on the
capture port. This avoids duplicate buffer queuing during seek
operations.

Fixes: c1f8b2cc72ec ("media: iris: handle streamoff/on from client in dynamic resolution change")
Reported-by: Val Packett <val@packett.cool>
Closes: https://gitlab.freedesktop.org/gstreamer/gstreamer/-/issues/4700
Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_common.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_common.c b/drivers/media/platform/qcom/iris/iris_common.c
index 9fc663bdaf3fc989fe1273b4d4280a87f68de85d..21e176ce49ac2d2d26cf4fc25c1e5bca0abe501f 100644
--- a/drivers/media/platform/qcom/iris/iris_common.c
+++ b/drivers/media/platform/qcom/iris/iris_common.c
@@ -90,13 +90,15 @@ int iris_process_streamon_input(struct iris_inst *inst)
 
 int iris_process_streamon_output(struct iris_inst *inst)
 {
+	bool drain_active = false, drc_active = false, first_ipsc = false;
 	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
-	bool drain_active = false, drc_active = false;
 	enum iris_inst_sub_state clear_sub_state = 0;
 	int ret = 0;
 
 	iris_scale_power(inst);
 
+	first_ipsc = inst->sub_state & IRIS_INST_SUB_FIRST_IPSC;
+
 	drain_active = inst->sub_state & IRIS_INST_SUB_DRAIN &&
 		inst->sub_state & IRIS_INST_SUB_DRAIN_LAST;
 
@@ -108,7 +110,8 @@ int iris_process_streamon_output(struct iris_inst *inst)
 	else if (drain_active)
 		clear_sub_state = IRIS_INST_SUB_DRAIN | IRIS_INST_SUB_DRAIN_LAST;
 
-	if (inst->domain == DECODER && inst->sub_state & IRIS_INST_SUB_INPUT_PAUSE) {
+	 /* Input internal buffer reconfiguration required incase of resolution change */
+	if (first_ipsc || drc_active) {
 		ret = iris_alloc_and_queue_input_int_bufs(inst);
 		if (ret)
 			return ret;

---
base-commit: 163917839c0eea3bdfe3620f27f617a55fd76302
change-id: 20251103-iris-seek-fix-7a25af22fa52

Best regards,
-- 
Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>


