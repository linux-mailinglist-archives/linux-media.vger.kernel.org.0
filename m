Return-Path: <linux-media+bounces-53823-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MDjLDdKnomkK4wQAu9opvQ
	(envelope-from <linux-media+bounces-53823-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 28 Feb 2026 09:31:14 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B87421C1653
	for <lists+linux-media@lfdr.de>; Sat, 28 Feb 2026 09:31:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BBDE730CAA72
	for <lists+linux-media@lfdr.de>; Sat, 28 Feb 2026 08:29:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AAE913E95B6;
	Sat, 28 Feb 2026 08:29:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="e1+3G9DX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FXGEBhQL"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68ABC3E8C54
	for <linux-media@vger.kernel.org>; Sat, 28 Feb 2026 08:29:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772267361; cv=none; b=eQXz6+z47dit694DA+HAa1rc0dxpWtCO77zD9XfsZoGPVEnV2O0vW2CmGxeKGJr8Zeqn2rarc3s77PT/Xnlp1YT7YK/oe6TpK6BY/dQ0QWwTU36hqitrNGrphEpJHeo+bYY1qDz+0OPXJRsqxHcuqtrQ4VAilmNa4Dq9CSzx0pI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772267361; c=relaxed/simple;
	bh=vetv6j3Y1I2cL0djztzZDTSzVMASyS0g/vyZ9H7QWqk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EZ5GOLKCr1ITlV0kmAbiqnEDXYgHfFylLhItkpvv042lBWd5bgtw5jZ/SlUXobu0x9CblplP3/BcJIAvXycgKQqdKb5oQNfi0+6TF3Zw41ubgn2plff+ZP2iRtX5+UCgP27l+/VNSyDjV/XXVc2orLr9E6AKQSBmIE7i3nXnf5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=e1+3G9DX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FXGEBhQL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61S6Np5s1820895
	for <linux-media@vger.kernel.org>; Sat, 28 Feb 2026 08:29:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vZc90H64t6GdyBScKTuOlxaZrvvmLddh/a5MbeqIweE=; b=e1+3G9DX7AcbDL8N
	KqRpcWg72QJoZsBEIDA2sR4sMtzLUPiBNKhXINGMMe2Q7Ghwy5ga53dGkrT7cb+k
	ml7Q7tOf55TKb6rLG01tjYrDmYzSfhhEbYqDVk/H5+0Zb18jQ4Tp3ckeIZQeDFU0
	aefxWKu2NQlBtwdcjA7lr8+x70aEhn//SexhjOLMXlFQ+qAtkXcCOibXj9rosOVV
	pn4pE2GGCQeMfnS4+sIVOKajoVqF2HFIHgFu9Xw5p61fc79wyV6PJEy2NOday4nT
	U7TIcFoE0XlqXK+vSLLlFYDwyNMCYkU28ZdKcZj0flYvwW9xlgzTKQDfd06ZN8I1
	lnfgSw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cksgq0je7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sat, 28 Feb 2026 08:29:16 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c70ef98116so2701485085a.1
        for <linux-media@vger.kernel.org>; Sat, 28 Feb 2026 00:29:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772267355; x=1772872155; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vZc90H64t6GdyBScKTuOlxaZrvvmLddh/a5MbeqIweE=;
        b=FXGEBhQLDMfu7Zx1+34Vb4yKS+B+NKHgbjcvD7E1I3HrunAbACO74oTnMH5NBsV9KV
         kWX4eYuGk7rFa9IHhSs0rJtYTA6gn7nmO5E1tM5pJUmCJmueK98K3SX9QnDAx7vl6dl3
         v4BD7ZdvUARxLQLm8jmKLfBwr6C7Z3h6S3GWX7hJAg8S9e0Icvkkc2tg19INwF9IBGx9
         TFGP8iG3FXSN0nayrC1ir1hre+1WaasQACAgNrtWxt0YzmRhT3iETvkOvQc4wjMy++cT
         ua5mn1ZBiHXK/ywo7GO6J8wMfExw+KhGzh744TsBB/F//PPIP/QexZNR4RsAccH+G8i9
         JYHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772267355; x=1772872155;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vZc90H64t6GdyBScKTuOlxaZrvvmLddh/a5MbeqIweE=;
        b=FRC4QVwFTkioBRtq1kghFT5en9b4tyAdDEPvOmQbf9jSUmLliryHXZM6QJZFjG9zYM
         Na/bQqjdsc3AU+AHt512rVSVFOsT/0CSpl8m8+qqb4tJNmTe8/jmz1zTXEu8dF5KE2TM
         QQv6bMe8kAIKzLA7qZt7WrxL+shyHbtoa/lWyJmGVt2/SDazrhQ87ac94Bc/gO6vnTx2
         h984S+9moEJNhtqzOHDOBEY4fV17Dwv1CNCrdzFLz2nQ1oNtC3arAOZuIdYj1tqICXhA
         Plr9NtYpltTFJVzS8OI+H1NOU0TICfa6hZpVNXGofpaLImDkVAH3jmOlsy43Xm/sucl4
         RU0g==
X-Gm-Message-State: AOJu0Yz8zTaIdCOx6XiCl/jKf/WF7v21JfFFJ18+XrlGjeLSBZWBGyb3
	KKIJNjtruk+GPccT22rcVy513PPsNxgCjwndY7N1GGUT9z3V/Je7TPdlPOS8Y7zbgRF/VYTQVhc
	90vQE8jtFrXNNvK29G1vivgdA00Iyk+komjL/zsj4vK1Vk+ut4wdW19nMwnJgcM4vdA==
X-Gm-Gg: ATEYQzyH2hkolkolFEHoXdps+82rX/JnGA3JCKPfPTMX0eNi84OP1HHOujK7gzhH4Gn
	D69lVBiIZi9i5814fvzTi2bgrPett8MMIXTibP0vmmDoEFG+8zjSoWnoHMQvn4uY93KpT/P30W5
	9N7fYrwKZDlqiCEdRK/fqYbzTzwTrVvHE+c5LybK0BVRbTsN4GgLkhnhbHw7gLCG0SsUmEFroYa
	qeGzakH50CNBw9XCidfR8ffdTDrhys3iCl1KTGPtOw4hGC21/74kttkUAj6iuBu+QeJe+JVSmk5
	+1YmlnXVpWsLgF282dH3V5/wxen8lZ81zC00cgfICd1D+BiVcDXEZ/PgVF69UKnZGxOy4c1QUDy
	osH9ZAoR+8G9KrMnLH7+9OvgLSZAZBjWuM477FJ22nSONkV4GyNP1Oi6fRrxO7Qy2HnLeBxagzi
	mD7/5SJDn8BLNZiKQ+jpu4io9M5J7JvSj5I78=
X-Received: by 2002:a05:620a:1a28:b0:8ca:123e:8196 with SMTP id af79cd13be357-8cbc8de8546mr745101085a.53.1772267355259;
        Sat, 28 Feb 2026 00:29:15 -0800 (PST)
X-Received: by 2002:a05:620a:1a28:b0:8ca:123e:8196 with SMTP id af79cd13be357-8cbc8de8546mr745099285a.53.1772267354742;
        Sat, 28 Feb 2026 00:29:14 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-389f2f4b158sm17970711fa.6.2026.02.28.00.29.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Feb 2026 00:29:14 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 28 Feb 2026 10:28:55 +0200
Subject: [PATCH 10/11] media: qcom: iris: split firmware_data from raw
 platform data
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260228-iris-platform-data-v1-10-c2c53539f948@oss.qualcomm.com>
References: <20260228-iris-platform-data-v1-0-c2c53539f948@oss.qualcomm.com>
In-Reply-To: <20260228-iris-platform-data-v1-0-c2c53539f948@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=29717;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=vetv6j3Y1I2cL0djztzZDTSzVMASyS0g/vyZ9H7QWqk=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpoqdBmrIABp/C7QDzi0WzpH7iOuXHCgez5I20F
 v0a0LgmgleJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaaKnQQAKCRCLPIo+Aiko
 1fwAB/90/5ZLzFDFygxf1comquIWi6yi8tKaJiNJdvmITyOacVjWWvc6VpnBjdo6Ing1I0WSoF/
 QKdRsO5h+1ukeOSWCfbg6yBOEh6U/KLJ3s5l9IIEf6Im/1cJehzsUYIeeBk2KcI2Zb6H0/HwOl2
 yNtZVcwAudTYrDCIw7+UX+62b1nB7VfHL1EaAYnzA2mpCsYX22lPCDjMJk8+Tj/m6Bgdpps7eD9
 pEY1pGDwRenUyGLcOtDEn8l+Bs9pbCM6Y59lsXS0FYwmJnWZNAZarGuVGLv4ZPg7ituZUPh+18/
 3q0f/x/vUjeUh6ef832wgErDFQHMw6Vbz86RsbBO3e7gQRhn
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: CgHk7DU1XMYUZcOLmCXcAZAgR3MyM3bq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI4MDA3NyBTYWx0ZWRfX17LE3q+7jgiB
 2JbqS2Z5Lnke5t4E3ZZCIuzYW/yoPdu+WMZkl8nyfp7f3Un5hDb39ZSv9ncHm7tcWz/i01k5J20
 gEe0F+BPRuqrOnJ1n4qPbqVze3vj6VY46xKZDQ46kaX5JWxeSrA4tBqcH/04uHBpqX18oUF5igO
 wH2Xl1FySb4j6zf9YJIVPPtOMlBTn2IFoQMN4bsm3YKLsA0Rr3Kb3oY+ZbhKJVxICkqSTTBa1WM
 jzIKlxm2rpTCStHKE5HlLqPnKkKyfJfH/c5Hl8hlM13wTvxLc7wO8UzzZ1bXbh5HdsruQkKaomV
 RfrZBxzvOwFuXR+UalLY3/SQ7rDrqSeWdSkBoKVRaRPNDyIJei9tbZhio9+WlP/zp5N1voQtL7x
 473w7LmA7nJ85SJ03kPthCSFNnO4Vh6LEe243i81g3mO0EfBPW3mBy94hIOaCOT8Rom8YrnHFUC
 jY4VCSCs8j6gqQ9nUfQ==
X-Authority-Analysis: v=2.4 cv=bdRmkePB c=1 sm=1 tr=0 ts=69a2a75c cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=H-15yB1S3qbtgeSRvWYA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: CgHk7DU1XMYUZcOLmCXcAZAgR3MyM3bq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-28_02,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 clxscore=1015
 malwarescore=0 impostorscore=0 suspectscore=0 adultscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602280077
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,60fps:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-53823-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B87421C1653
X-Rspamd-Action: no action

Having firmware-related fields in platform data results in the tying
platform data to the HFI firmware data rather than the actual hardware.
For example, SM8450 uses Gen2 firmware, so currently its platform data
should be placed next to the other gen2 platforms, although it has the
VPU2.0 core, similar to the one found on SM8250 and SC7280 and so the
hardware-specific platform data is also close to those devices.

Split firmware data to a separate struct, separating hardware-related
data from the firmware interfaces.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_buffer.c     |  84 ++++++++--------
 drivers/media/platform/qcom/iris/iris_core.h       |   1 +
 drivers/media/platform/qcom/iris/iris_ctrls.c      |   8 +-
 .../platform/qcom/iris/iris_hfi_gen1_command.c     |   2 +-
 .../platform/qcom/iris/iris_platform_common.h      |  37 ++++---
 .../media/platform/qcom/iris/iris_platform_gen1.c  |  46 ++++-----
 .../media/platform/qcom/iris/iris_platform_gen2.c  | 106 +++++++++------------
 drivers/media/platform/qcom/iris/iris_probe.c      |   3 +-
 drivers/media/platform/qcom/iris/iris_vidc.c       |  10 +-
 9 files changed, 141 insertions(+), 156 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_buffer.c b/drivers/media/platform/qcom/iris/iris_buffer.c
index 915096b21279..96ad6f5af23f 100644
--- a/drivers/media/platform/qcom/iris/iris_buffer.c
+++ b/drivers/media/platform/qcom/iris/iris_buffer.c
@@ -295,37 +295,37 @@ static void iris_fill_internal_buf_info(struct iris_inst *inst,
 {
 	struct iris_buffers *buffers = &inst->buffers[buffer_type];
 
-	buffers->size = inst->core->iris_platform_data->get_vpu_buffer_size(inst, buffer_type);
+	buffers->size = inst->core->iris_firmware_data->get_vpu_buffer_size(inst, buffer_type);
 	buffers->min_count = iris_vpu_buf_count(inst, buffer_type);
 }
 
 void iris_get_internal_buffers(struct iris_inst *inst, u32 plane)
 {
-	const struct iris_platform_data *platform_data = inst->core->iris_platform_data;
+	const struct iris_firmware_data *firmware_data = inst->core->iris_firmware_data;
 	const u32 *internal_buf_type;
 	u32 internal_buffer_count, i;
 
 	if (inst->domain == DECODER) {
 		if (V4L2_TYPE_IS_OUTPUT(plane)) {
-			internal_buf_type = platform_data->dec_ip_int_buf_tbl;
-			internal_buffer_count = platform_data->dec_ip_int_buf_tbl_size;
+			internal_buf_type = firmware_data->dec_ip_int_buf_tbl;
+			internal_buffer_count = firmware_data->dec_ip_int_buf_tbl_size;
 			for (i = 0; i < internal_buffer_count; i++)
 				iris_fill_internal_buf_info(inst, internal_buf_type[i]);
 		} else {
-			internal_buf_type = platform_data->dec_op_int_buf_tbl;
-			internal_buffer_count = platform_data->dec_op_int_buf_tbl_size;
+			internal_buf_type = firmware_data->dec_op_int_buf_tbl;
+			internal_buffer_count = firmware_data->dec_op_int_buf_tbl_size;
 			for (i = 0; i < internal_buffer_count; i++)
 				iris_fill_internal_buf_info(inst, internal_buf_type[i]);
 		}
 	} else {
 		if (V4L2_TYPE_IS_OUTPUT(plane)) {
-			internal_buf_type = platform_data->enc_ip_int_buf_tbl;
-			internal_buffer_count = platform_data->enc_ip_int_buf_tbl_size;
+			internal_buf_type = firmware_data->enc_ip_int_buf_tbl;
+			internal_buffer_count = firmware_data->enc_ip_int_buf_tbl_size;
 			for (i = 0; i < internal_buffer_count; i++)
 				iris_fill_internal_buf_info(inst, internal_buf_type[i]);
 		} else {
-			internal_buf_type = platform_data->enc_op_int_buf_tbl;
-			internal_buffer_count = platform_data->enc_op_int_buf_tbl_size;
+			internal_buf_type = firmware_data->enc_op_int_buf_tbl;
+			internal_buffer_count = firmware_data->enc_op_int_buf_tbl_size;
 			for (i = 0; i < internal_buffer_count; i++)
 				iris_fill_internal_buf_info(inst, internal_buf_type[i]);
 		}
@@ -366,7 +366,7 @@ static int iris_create_internal_buffer(struct iris_inst *inst,
 
 int iris_create_internal_buffers(struct iris_inst *inst, u32 plane)
 {
-	const struct iris_platform_data *platform_data = inst->core->iris_platform_data;
+	const struct iris_firmware_data *firmware_data = inst->core->iris_firmware_data;
 	u32 internal_buffer_count, i, j;
 	struct iris_buffers *buffers;
 	const u32 *internal_buf_type;
@@ -374,19 +374,19 @@ int iris_create_internal_buffers(struct iris_inst *inst, u32 plane)
 
 	if (inst->domain == DECODER) {
 		if (V4L2_TYPE_IS_OUTPUT(plane)) {
-			internal_buf_type = platform_data->dec_ip_int_buf_tbl;
-			internal_buffer_count = platform_data->dec_ip_int_buf_tbl_size;
+			internal_buf_type = firmware_data->dec_ip_int_buf_tbl;
+			internal_buffer_count = firmware_data->dec_ip_int_buf_tbl_size;
 		} else {
-			internal_buf_type = platform_data->dec_op_int_buf_tbl;
-			internal_buffer_count = platform_data->dec_op_int_buf_tbl_size;
+			internal_buf_type = firmware_data->dec_op_int_buf_tbl;
+			internal_buffer_count = firmware_data->dec_op_int_buf_tbl_size;
 		}
 	} else {
 		if (V4L2_TYPE_IS_OUTPUT(plane)) {
-			internal_buf_type = platform_data->enc_ip_int_buf_tbl;
-			internal_buffer_count = platform_data->enc_ip_int_buf_tbl_size;
+			internal_buf_type = firmware_data->enc_ip_int_buf_tbl;
+			internal_buffer_count = firmware_data->enc_ip_int_buf_tbl_size;
 		} else {
-			internal_buf_type = platform_data->enc_op_int_buf_tbl;
-			internal_buffer_count = platform_data->enc_op_int_buf_tbl_size;
+			internal_buf_type = firmware_data->enc_op_int_buf_tbl;
+			internal_buffer_count = firmware_data->enc_op_int_buf_tbl_size;
 		}
 	}
 
@@ -442,7 +442,7 @@ int iris_queue_internal_deferred_buffers(struct iris_inst *inst, enum iris_buffe
 
 int iris_queue_internal_buffers(struct iris_inst *inst, u32 plane)
 {
-	const struct iris_platform_data *platform_data = inst->core->iris_platform_data;
+	const struct iris_firmware_data *firmware_data = inst->core->iris_firmware_data;
 	struct iris_buffer *buffer, *next;
 	struct iris_buffers *buffers;
 	const u32 *internal_buf_type;
@@ -451,19 +451,19 @@ int iris_queue_internal_buffers(struct iris_inst *inst, u32 plane)
 
 	if (inst->domain == DECODER) {
 		if (V4L2_TYPE_IS_OUTPUT(plane)) {
-			internal_buf_type = platform_data->dec_ip_int_buf_tbl;
-			internal_buffer_count = platform_data->dec_ip_int_buf_tbl_size;
+			internal_buf_type = firmware_data->dec_ip_int_buf_tbl;
+			internal_buffer_count = firmware_data->dec_ip_int_buf_tbl_size;
 		} else {
-			internal_buf_type = platform_data->dec_op_int_buf_tbl;
-			internal_buffer_count = platform_data->dec_op_int_buf_tbl_size;
+			internal_buf_type = firmware_data->dec_op_int_buf_tbl;
+			internal_buffer_count = firmware_data->dec_op_int_buf_tbl_size;
 		}
 	} else {
 		if (V4L2_TYPE_IS_OUTPUT(plane)) {
-			internal_buf_type = platform_data->enc_ip_int_buf_tbl;
-			internal_buffer_count = platform_data->enc_ip_int_buf_tbl_size;
+			internal_buf_type = firmware_data->enc_ip_int_buf_tbl;
+			internal_buffer_count = firmware_data->enc_ip_int_buf_tbl_size;
 		} else {
-			internal_buf_type = platform_data->enc_op_int_buf_tbl;
-			internal_buffer_count = platform_data->enc_op_int_buf_tbl_size;
+			internal_buf_type = firmware_data->enc_op_int_buf_tbl;
+			internal_buffer_count = firmware_data->enc_op_int_buf_tbl_size;
 		}
 	}
 
@@ -501,7 +501,7 @@ int iris_destroy_internal_buffer(struct iris_inst *inst, struct iris_buffer *buf
 
 static int iris_destroy_internal_buffers(struct iris_inst *inst, u32 plane, bool force)
 {
-	const struct iris_platform_data *platform_data = inst->core->iris_platform_data;
+	const struct iris_firmware_data *firmware_data = inst->core->iris_firmware_data;
 	struct iris_buffer *buf, *next;
 	struct iris_buffers *buffers;
 	const u32 *internal_buf_type;
@@ -510,19 +510,19 @@ static int iris_destroy_internal_buffers(struct iris_inst *inst, u32 plane, bool
 
 	if (inst->domain == DECODER) {
 		if (V4L2_TYPE_IS_OUTPUT(plane)) {
-			internal_buf_type = platform_data->dec_ip_int_buf_tbl;
-			len = platform_data->dec_ip_int_buf_tbl_size;
+			internal_buf_type = firmware_data->dec_ip_int_buf_tbl;
+			len = firmware_data->dec_ip_int_buf_tbl_size;
 		} else {
-			internal_buf_type = platform_data->dec_op_int_buf_tbl;
-			len = platform_data->dec_op_int_buf_tbl_size;
+			internal_buf_type = firmware_data->dec_op_int_buf_tbl;
+			len = firmware_data->dec_op_int_buf_tbl_size;
 		}
 	} else {
 		if (V4L2_TYPE_IS_OUTPUT(plane)) {
-			internal_buf_type = platform_data->enc_ip_int_buf_tbl;
-			len = platform_data->enc_ip_int_buf_tbl_size;
+			internal_buf_type = firmware_data->enc_ip_int_buf_tbl;
+			len = firmware_data->enc_ip_int_buf_tbl_size;
 		} else {
-			internal_buf_type = platform_data->enc_op_int_buf_tbl;
-			len = platform_data->enc_op_int_buf_tbl_size;
+			internal_buf_type = firmware_data->enc_op_int_buf_tbl;
+			len = firmware_data->enc_op_int_buf_tbl_size;
 		}
 	}
 
@@ -593,17 +593,17 @@ static int iris_release_internal_buffers(struct iris_inst *inst,
 
 static int iris_release_input_internal_buffers(struct iris_inst *inst)
 {
-	const struct iris_platform_data *platform_data = inst->core->iris_platform_data;
+	const struct iris_firmware_data *firmware_data = inst->core->iris_firmware_data;
 	const u32 *internal_buf_type;
 	u32 internal_buffer_count, i;
 	int ret;
 
 	if (inst->domain == DECODER) {
-		internal_buf_type = platform_data->dec_ip_int_buf_tbl;
-		internal_buffer_count = platform_data->dec_ip_int_buf_tbl_size;
+		internal_buf_type = firmware_data->dec_ip_int_buf_tbl;
+		internal_buffer_count = firmware_data->dec_ip_int_buf_tbl_size;
 	} else {
-		internal_buf_type = platform_data->enc_ip_int_buf_tbl;
-		internal_buffer_count = platform_data->enc_ip_int_buf_tbl_size;
+		internal_buf_type = firmware_data->enc_ip_int_buf_tbl;
+		internal_buffer_count = firmware_data->enc_ip_int_buf_tbl_size;
 	}
 
 	for (i = 0; i < internal_buffer_count; i++) {
diff --git a/drivers/media/platform/qcom/iris/iris_core.h b/drivers/media/platform/qcom/iris/iris_core.h
index d919c7c16106..a3caeb2c1d7a 100644
--- a/drivers/media/platform/qcom/iris/iris_core.h
+++ b/drivers/media/platform/qcom/iris/iris_core.h
@@ -98,6 +98,7 @@ struct iris_core {
 	struct reset_control_bulk_data		*resets;
 	struct reset_control_bulk_data		*controller_resets;
 	const struct iris_platform_data		*iris_platform_data;
+	const struct iris_firmware_data		*iris_firmware_data;
 	const struct qcom_ubwc_cfg_data		*ubwc_cfg;
 	enum iris_core_state			state;
 	dma_addr_t				iface_q_table_daddr;
diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.c b/drivers/media/platform/qcom/iris/iris_ctrls.c
index f5032c5eb5a5..782fc3da224e 100644
--- a/drivers/media/platform/qcom/iris/iris_ctrls.c
+++ b/drivers/media/platform/qcom/iris/iris_ctrls.c
@@ -332,8 +332,8 @@ void iris_session_init_caps(struct iris_core *core)
 	const struct platform_inst_fw_cap *caps;
 	u32 i, num_cap, cap_id;
 
-	caps = core->iris_platform_data->inst_fw_caps_dec;
-	num_cap = core->iris_platform_data->inst_fw_caps_dec_size;
+	caps = core->iris_firmware_data->inst_fw_caps_dec;
+	num_cap = core->iris_firmware_data->inst_fw_caps_dec_size;
 
 	for (i = 0; i < num_cap; i++) {
 		cap_id = caps[i].cap_id;
@@ -360,8 +360,8 @@ void iris_session_init_caps(struct iris_core *core)
 		}
 	}
 
-	caps = core->iris_platform_data->inst_fw_caps_enc;
-	num_cap = core->iris_platform_data->inst_fw_caps_enc_size;
+	caps = core->iris_firmware_data->inst_fw_caps_enc;
+	num_cap = core->iris_firmware_data->inst_fw_caps_enc_size;
 
 	for (i = 0; i < num_cap; i++) {
 		cap_id = caps[i].cap_id;
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
index 253edf2f62bb..2cda05f7d52a 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
@@ -918,7 +918,7 @@ static int iris_hfi_gen1_set_bufsize(struct iris_inst *inst, u32 plane)
 
 	if (iris_split_mode_enabled(inst)) {
 		bufsz.type = HFI_BUFFER_OUTPUT;
-		bufsz.size = inst->core->iris_platform_data->get_vpu_buffer_size(inst, BUF_DPB);
+		bufsz.size = inst->core->iris_firmware_data->get_vpu_buffer_size(inst, BUF_DPB);
 
 		ret = hfi_gen1_set_property(inst, ptype, &bufsz, sizeof(bufsz));
 		if (ret)
diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index a936ab2aedaf..be3449861993 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -201,9 +201,32 @@ enum platform_pm_domain_type {
 	IRIS_APV_HW_POWER_DOMAIN,
 };
 
-struct iris_platform_data {
+struct iris_firmware_data {
 	void (*init_hfi_ops)(struct iris_core *core);
+
 	u32 (*get_vpu_buffer_size)(struct iris_inst *inst, enum iris_buffer_type buffer_type);
+
+	const struct platform_inst_fw_cap *inst_fw_caps_dec;
+	u32 inst_fw_caps_dec_size;
+	const struct platform_inst_fw_cap *inst_fw_caps_enc;
+	u32 inst_fw_caps_enc_size;
+
+	const u32 *dec_ip_int_buf_tbl;
+	unsigned int dec_ip_int_buf_tbl_size;
+	const u32 *dec_op_int_buf_tbl;
+	unsigned int dec_op_int_buf_tbl_size;
+	const u32 *enc_ip_int_buf_tbl;
+	unsigned int enc_ip_int_buf_tbl_size;
+	const u32 *enc_op_int_buf_tbl;
+	unsigned int enc_op_int_buf_tbl_size;
+};
+
+struct iris_platform_data {
+	/*
+	 * XXX: remove firmware_data pointer once we have platforms supporting
+	 * both firmware kinds.
+	 */
+	const struct iris_firmware_data *firmware_data;
 	const struct vpu_ops *vpu_ops;
 	void (*set_preset_registers)(struct iris_core *core);
 	const struct icc_info *icc_tbl;
@@ -226,10 +249,6 @@ struct iris_platform_data {
 	struct iris_fmt *inst_iris_fmts;
 	u32 inst_iris_fmts_size;
 	struct platform_inst_caps *inst_caps;
-	const struct platform_inst_fw_cap *inst_fw_caps_dec;
-	u32 inst_fw_caps_dec_size;
-	const struct platform_inst_fw_cap *inst_fw_caps_enc;
-	u32 inst_fw_caps_enc_size;
 	const struct tz_cp_config *tz_cp_config_data;
 	u32 tz_cp_config_data_size;
 	u32 core_arch;
@@ -241,14 +260,6 @@ struct iris_platform_data {
 	u32 max_core_mbpf;
 	/* max number of macroblocks per second supported */
 	u32 max_core_mbps;
-	const u32 *dec_ip_int_buf_tbl;
-	unsigned int dec_ip_int_buf_tbl_size;
-	const u32 *dec_op_int_buf_tbl;
-	unsigned int dec_op_int_buf_tbl_size;
-	const u32 *enc_ip_int_buf_tbl;
-	unsigned int enc_ip_int_buf_tbl_size;
-	const u32 *enc_op_int_buf_tbl;
-	unsigned int enc_op_int_buf_tbl_size;
 };
 
 #endif
diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen1.c b/drivers/media/platform/qcom/iris/iris_platform_gen1.c
index 622164ca9c65..961a78729306 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_gen1.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_gen1.c
@@ -313,9 +313,26 @@ static const u32 sm8250_enc_ip_int_buf_tbl[] = {
 	BUF_SCRATCH_2,
 };
 
-const struct iris_platform_data sm8250_data = {
+const struct iris_firmware_data iris_hfi_gen1_data = {
 	.init_hfi_ops = &iris_hfi_gen1_ops_init,
 	.get_vpu_buffer_size = iris_vpu_buf_size,
+
+	.inst_fw_caps_dec = inst_fw_cap_sm8250_dec,
+	.inst_fw_caps_dec_size = ARRAY_SIZE(inst_fw_cap_sm8250_dec),
+	.inst_fw_caps_enc = inst_fw_cap_sm8250_enc,
+	.inst_fw_caps_enc_size = ARRAY_SIZE(inst_fw_cap_sm8250_enc),
+
+	.dec_ip_int_buf_tbl = sm8250_dec_ip_int_buf_tbl,
+	.dec_ip_int_buf_tbl_size = ARRAY_SIZE(sm8250_dec_ip_int_buf_tbl),
+	.dec_op_int_buf_tbl = sm8250_dec_op_int_buf_tbl,
+	.dec_op_int_buf_tbl_size = ARRAY_SIZE(sm8250_dec_op_int_buf_tbl),
+
+	.enc_ip_int_buf_tbl = sm8250_enc_ip_int_buf_tbl,
+	.enc_ip_int_buf_tbl_size = ARRAY_SIZE(sm8250_enc_ip_int_buf_tbl),
+};
+
+const struct iris_platform_data sm8250_data = {
+	.firmware_data = &iris_hfi_gen1_data,
 	.vpu_ops = &iris_vpu2_ops,
 	.set_preset_registers = iris_vpu_set_preset_registers,
 	.icc_tbl = sm8250_icc_table,
@@ -337,10 +354,6 @@ const struct iris_platform_data sm8250_data = {
 	.inst_iris_fmts = platform_fmts_sm8250_dec,
 	.inst_iris_fmts_size = ARRAY_SIZE(platform_fmts_sm8250_dec),
 	.inst_caps = &platform_inst_cap_sm8250,
-	.inst_fw_caps_dec = inst_fw_cap_sm8250_dec,
-	.inst_fw_caps_dec_size = ARRAY_SIZE(inst_fw_cap_sm8250_dec),
-	.inst_fw_caps_enc = inst_fw_cap_sm8250_enc,
-	.inst_fw_caps_enc_size = ARRAY_SIZE(inst_fw_cap_sm8250_enc),
 	.tz_cp_config_data = tz_cp_config_sm8250,
 	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_sm8250),
 	.hw_response_timeout = HW_RESPONSE_TIMEOUT_VALUE,
@@ -348,19 +361,10 @@ const struct iris_platform_data sm8250_data = {
 	.max_session_count = 16,
 	.max_core_mbpf = NUM_MBS_8K,
 	.max_core_mbps = ((7680 * 4320) / 256) * 60,
-
-	.dec_ip_int_buf_tbl = sm8250_dec_ip_int_buf_tbl,
-	.dec_ip_int_buf_tbl_size = ARRAY_SIZE(sm8250_dec_ip_int_buf_tbl),
-	.dec_op_int_buf_tbl = sm8250_dec_op_int_buf_tbl,
-	.dec_op_int_buf_tbl_size = ARRAY_SIZE(sm8250_dec_op_int_buf_tbl),
-
-	.enc_ip_int_buf_tbl = sm8250_enc_ip_int_buf_tbl,
-	.enc_ip_int_buf_tbl_size = ARRAY_SIZE(sm8250_enc_ip_int_buf_tbl),
 };
 
 const struct iris_platform_data sc7280_data = {
-	.init_hfi_ops = &iris_hfi_gen1_ops_init,
-	.get_vpu_buffer_size = iris_vpu_buf_size,
+	.firmware_data = &iris_hfi_gen1_data,
 	.vpu_ops = &iris_vpu2_ops,
 	.set_preset_registers = iris_vpu_set_preset_registers,
 	.icc_tbl = sm8250_icc_table,
@@ -380,10 +384,6 @@ const struct iris_platform_data sc7280_data = {
 	.inst_iris_fmts = platform_fmts_sm8250_dec,
 	.inst_iris_fmts_size = ARRAY_SIZE(platform_fmts_sm8250_dec),
 	.inst_caps = &platform_inst_cap_sm8250,
-	.inst_fw_caps_dec = inst_fw_cap_sm8250_dec,
-	.inst_fw_caps_dec_size = ARRAY_SIZE(inst_fw_cap_sm8250_dec),
-	.inst_fw_caps_enc = inst_fw_cap_sm8250_enc,
-	.inst_fw_caps_enc_size = ARRAY_SIZE(inst_fw_cap_sm8250_enc),
 	.tz_cp_config_data = tz_cp_config_sm8250,
 	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_sm8250),
 	.hw_response_timeout = HW_RESPONSE_TIMEOUT_VALUE,
@@ -393,12 +393,4 @@ const struct iris_platform_data sc7280_data = {
 	.max_core_mbpf = 4096 * 2176 / 256 * 2 + 1920 * 1088 / 256,
 	/* max spec for SC7280 is 4096x2176@60fps */
 	.max_core_mbps = 4096 * 2176 / 256 * 60,
-
-	.dec_ip_int_buf_tbl = sm8250_dec_ip_int_buf_tbl,
-	.dec_ip_int_buf_tbl_size = ARRAY_SIZE(sm8250_dec_ip_int_buf_tbl),
-	.dec_op_int_buf_tbl = sm8250_dec_op_int_buf_tbl,
-	.dec_op_int_buf_tbl_size = ARRAY_SIZE(sm8250_dec_op_int_buf_tbl),
-
-	.enc_ip_int_buf_tbl = sm8250_enc_ip_int_buf_tbl,
-	.enc_ip_int_buf_tbl_size = ARRAY_SIZE(sm8250_enc_ip_int_buf_tbl),
 };
diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
index 7745a3481f6c..92e9c7812e0f 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
@@ -818,9 +818,48 @@ static const u32 sm8550_enc_op_int_buf_tbl[] = {
 	BUF_SCRATCH_2,
 };
 
-const struct iris_platform_data sm8550_data = {
+const struct iris_firmware_data iris_hfi_gen2_data = {
 	.init_hfi_ops = iris_hfi_gen2_ops_init,
 	.get_vpu_buffer_size = iris_vpu_buf_size,
+
+	.inst_fw_caps_dec = inst_fw_cap_sm8550_dec,
+	.inst_fw_caps_dec_size = ARRAY_SIZE(inst_fw_cap_sm8550_dec),
+	.inst_fw_caps_enc = inst_fw_cap_sm8550_enc,
+	.inst_fw_caps_enc_size = ARRAY_SIZE(inst_fw_cap_sm8550_enc),
+
+	.dec_ip_int_buf_tbl = sm8550_dec_ip_int_buf_tbl,
+	.dec_ip_int_buf_tbl_size = ARRAY_SIZE(sm8550_dec_ip_int_buf_tbl),
+	.dec_op_int_buf_tbl = sm8550_dec_op_int_buf_tbl,
+	.dec_op_int_buf_tbl_size = ARRAY_SIZE(sm8550_dec_op_int_buf_tbl),
+
+	.enc_ip_int_buf_tbl = sm8550_enc_ip_int_buf_tbl,
+	.enc_ip_int_buf_tbl_size = ARRAY_SIZE(sm8550_enc_ip_int_buf_tbl),
+	.enc_op_int_buf_tbl = sm8550_enc_op_int_buf_tbl,
+	.enc_op_int_buf_tbl_size = ARRAY_SIZE(sm8550_enc_op_int_buf_tbl),
+};
+
+const struct iris_firmware_data iris_hfi_gen2_vpu33_data = {
+	.init_hfi_ops = iris_hfi_gen2_ops_init,
+	.get_vpu_buffer_size = iris_vpu33_buf_size,
+
+	.inst_fw_caps_dec = inst_fw_cap_sm8550_dec,
+	.inst_fw_caps_dec_size = ARRAY_SIZE(inst_fw_cap_sm8550_dec),
+	.inst_fw_caps_enc = inst_fw_cap_sm8550_enc,
+	.inst_fw_caps_enc_size = ARRAY_SIZE(inst_fw_cap_sm8550_enc),
+
+	.dec_ip_int_buf_tbl = sm8550_dec_ip_int_buf_tbl,
+	.dec_ip_int_buf_tbl_size = ARRAY_SIZE(sm8550_dec_ip_int_buf_tbl),
+	.dec_op_int_buf_tbl = sm8550_dec_op_int_buf_tbl,
+	.dec_op_int_buf_tbl_size = ARRAY_SIZE(sm8550_dec_op_int_buf_tbl),
+
+	.enc_ip_int_buf_tbl = sm8550_enc_ip_int_buf_tbl,
+	.enc_ip_int_buf_tbl_size = ARRAY_SIZE(sm8550_enc_ip_int_buf_tbl),
+	.enc_op_int_buf_tbl = sm8550_enc_op_int_buf_tbl,
+	.enc_op_int_buf_tbl_size = ARRAY_SIZE(sm8550_enc_op_int_buf_tbl),
+};
+
+const struct iris_platform_data sm8550_data = {
+	.firmware_data = &iris_hfi_gen2_data,
 	.vpu_ops = &iris_vpu3_ops,
 	.set_preset_registers = iris_vpu_set_preset_registers,
 	.icc_tbl = sm8550_icc_table,
@@ -842,10 +881,6 @@ const struct iris_platform_data sm8550_data = {
 	.inst_iris_fmts = platform_fmts_sm8550_dec,
 	.inst_iris_fmts_size = ARRAY_SIZE(platform_fmts_sm8550_dec),
 	.inst_caps = &platform_inst_cap_sm8550,
-	.inst_fw_caps_dec = inst_fw_cap_sm8550_dec,
-	.inst_fw_caps_dec_size = ARRAY_SIZE(inst_fw_cap_sm8550_dec),
-	.inst_fw_caps_enc = inst_fw_cap_sm8550_enc,
-	.inst_fw_caps_enc_size = ARRAY_SIZE(inst_fw_cap_sm8550_enc),
 	.tz_cp_config_data = tz_cp_config_sm8550,
 	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_sm8550),
 	.core_arch = VIDEO_ARCH_LX,
@@ -854,16 +889,6 @@ const struct iris_platform_data sm8550_data = {
 	.max_session_count = 16,
 	.max_core_mbpf = NUM_MBS_8K * 2,
 	.max_core_mbps = ((7680 * 4320) / 256) * 60,
-
-	.dec_ip_int_buf_tbl = sm8550_dec_ip_int_buf_tbl,
-	.dec_ip_int_buf_tbl_size = ARRAY_SIZE(sm8550_dec_ip_int_buf_tbl),
-	.dec_op_int_buf_tbl = sm8550_dec_op_int_buf_tbl,
-	.dec_op_int_buf_tbl_size = ARRAY_SIZE(sm8550_dec_op_int_buf_tbl),
-
-	.enc_ip_int_buf_tbl = sm8550_enc_ip_int_buf_tbl,
-	.enc_ip_int_buf_tbl_size = ARRAY_SIZE(sm8550_enc_ip_int_buf_tbl),
-	.enc_op_int_buf_tbl = sm8550_enc_op_int_buf_tbl,
-	.enc_op_int_buf_tbl_size = ARRAY_SIZE(sm8550_enc_op_int_buf_tbl),
 };
 
 /*
@@ -874,8 +899,7 @@ const struct iris_platform_data sm8550_data = {
  * - fwname to "qcom/vpu/vpu33_p4.mbn"
  */
 const struct iris_platform_data sm8650_data = {
-	.init_hfi_ops = iris_hfi_gen2_ops_init,
-	.get_vpu_buffer_size = iris_vpu33_buf_size,
+	.firmware_data = &iris_hfi_gen2_vpu33_data,
 	.vpu_ops = &iris_vpu33_ops,
 	.set_preset_registers = iris_vpu_set_preset_registers,
 	.icc_tbl = sm8550_icc_table,
@@ -899,10 +923,6 @@ const struct iris_platform_data sm8650_data = {
 	.inst_iris_fmts = platform_fmts_sm8550_dec,
 	.inst_iris_fmts_size = ARRAY_SIZE(platform_fmts_sm8550_dec),
 	.inst_caps = &platform_inst_cap_sm8550,
-	.inst_fw_caps_dec = inst_fw_cap_sm8550_dec,
-	.inst_fw_caps_dec_size = ARRAY_SIZE(inst_fw_cap_sm8550_dec),
-	.inst_fw_caps_enc = inst_fw_cap_sm8550_enc,
-	.inst_fw_caps_enc_size = ARRAY_SIZE(inst_fw_cap_sm8550_enc),
 	.tz_cp_config_data = tz_cp_config_sm8550,
 	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_sm8550),
 	.core_arch = VIDEO_ARCH_LX,
@@ -911,21 +931,10 @@ const struct iris_platform_data sm8650_data = {
 	.max_session_count = 16,
 	.max_core_mbpf = NUM_MBS_8K * 2,
 	.max_core_mbps = ((7680 * 4320) / 256) * 60,
-
-	.dec_ip_int_buf_tbl = sm8550_dec_ip_int_buf_tbl,
-	.dec_ip_int_buf_tbl_size = ARRAY_SIZE(sm8550_dec_ip_int_buf_tbl),
-	.dec_op_int_buf_tbl = sm8550_dec_op_int_buf_tbl,
-	.dec_op_int_buf_tbl_size = ARRAY_SIZE(sm8550_dec_op_int_buf_tbl),
-
-	.enc_ip_int_buf_tbl = sm8550_enc_ip_int_buf_tbl,
-	.enc_ip_int_buf_tbl_size = ARRAY_SIZE(sm8550_enc_ip_int_buf_tbl),
-	.enc_op_int_buf_tbl = sm8550_enc_op_int_buf_tbl,
-	.enc_op_int_buf_tbl_size = ARRAY_SIZE(sm8550_enc_op_int_buf_tbl),
 };
 
 const struct iris_platform_data sm8750_data = {
-	.init_hfi_ops = iris_hfi_gen2_ops_init,
-	.get_vpu_buffer_size = iris_vpu33_buf_size,
+	.firmware_data = &iris_hfi_gen2_vpu33_data,
 	.vpu_ops = &iris_vpu35_ops,
 	.set_preset_registers = iris_vpu_set_preset_registers,
 	.icc_tbl = sm8550_icc_table,
@@ -947,10 +956,6 @@ const struct iris_platform_data sm8750_data = {
 	.inst_iris_fmts = platform_fmts_sm8550_dec,
 	.inst_iris_fmts_size = ARRAY_SIZE(platform_fmts_sm8550_dec),
 	.inst_caps = &platform_inst_cap_sm8550,
-	.inst_fw_caps_dec = inst_fw_cap_sm8550_dec,
-	.inst_fw_caps_dec_size = ARRAY_SIZE(inst_fw_cap_sm8550_dec),
-	.inst_fw_caps_enc = inst_fw_cap_sm8550_enc,
-	.inst_fw_caps_enc_size = ARRAY_SIZE(inst_fw_cap_sm8550_enc),
 	.tz_cp_config_data = tz_cp_config_sm8550,
 	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_sm8550),
 	.core_arch = VIDEO_ARCH_LX,
@@ -959,16 +964,6 @@ const struct iris_platform_data sm8750_data = {
 	.max_session_count = 16,
 	.max_core_mbpf = NUM_MBS_8K * 2,
 	.max_core_mbps = ((7680 * 4320) / 256) * 60,
-
-	.dec_ip_int_buf_tbl = sm8550_dec_ip_int_buf_tbl,
-	.dec_ip_int_buf_tbl_size = ARRAY_SIZE(sm8550_dec_ip_int_buf_tbl),
-	.dec_op_int_buf_tbl = sm8550_dec_op_int_buf_tbl,
-	.dec_op_int_buf_tbl_size = ARRAY_SIZE(sm8550_dec_op_int_buf_tbl),
-
-	.enc_ip_int_buf_tbl = sm8550_enc_ip_int_buf_tbl,
-	.enc_ip_int_buf_tbl_size = ARRAY_SIZE(sm8550_enc_ip_int_buf_tbl),
-	.enc_op_int_buf_tbl = sm8550_enc_op_int_buf_tbl,
-	.enc_op_int_buf_tbl_size = ARRAY_SIZE(sm8550_enc_op_int_buf_tbl),
 };
 
 /*
@@ -976,8 +971,7 @@ const struct iris_platform_data sm8750_data = {
  * - inst_caps to platform_inst_cap_qcs8300
  */
 const struct iris_platform_data qcs8300_data = {
-	.init_hfi_ops = iris_hfi_gen2_ops_init,
-	.get_vpu_buffer_size = iris_vpu_buf_size,
+	.firmware_data = &iris_hfi_gen2_data,
 	.vpu_ops = &iris_vpu3_ops,
 	.set_preset_registers = iris_vpu_set_preset_registers,
 	.icc_tbl = sm8550_icc_table,
@@ -999,10 +993,6 @@ const struct iris_platform_data qcs8300_data = {
 	.inst_iris_fmts = platform_fmts_sm8550_dec,
 	.inst_iris_fmts_size = ARRAY_SIZE(platform_fmts_sm8550_dec),
 	.inst_caps = &platform_inst_cap_qcs8300,
-	.inst_fw_caps_dec = inst_fw_cap_sm8550_dec,
-	.inst_fw_caps_dec_size = ARRAY_SIZE(inst_fw_cap_sm8550_dec),
-	.inst_fw_caps_enc = inst_fw_cap_sm8550_enc,
-	.inst_fw_caps_enc_size = ARRAY_SIZE(inst_fw_cap_sm8550_enc),
 	.tz_cp_config_data = tz_cp_config_sm8550,
 	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_sm8550),
 	.core_arch = VIDEO_ARCH_LX,
@@ -1011,14 +1001,4 @@ const struct iris_platform_data qcs8300_data = {
 	.max_session_count = 16,
 	.max_core_mbpf = ((4096 * 2176) / 256) * 4,
 	.max_core_mbps = (((3840 * 2176) / 256) * 120),
-
-	.dec_ip_int_buf_tbl = sm8550_dec_ip_int_buf_tbl,
-	.dec_ip_int_buf_tbl_size = ARRAY_SIZE(sm8550_dec_ip_int_buf_tbl),
-	.dec_op_int_buf_tbl = sm8550_dec_op_int_buf_tbl,
-	.dec_op_int_buf_tbl_size = ARRAY_SIZE(sm8550_dec_op_int_buf_tbl),
-
-	.enc_ip_int_buf_tbl = sm8550_enc_ip_int_buf_tbl,
-	.enc_ip_int_buf_tbl_size = ARRAY_SIZE(sm8550_enc_ip_int_buf_tbl),
-	.enc_op_int_buf_tbl = sm8550_enc_op_int_buf_tbl,
-	.enc_op_int_buf_tbl_size = ARRAY_SIZE(sm8550_enc_op_int_buf_tbl),
 };
diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
index c2d174a6e160..009aaa6d82e7 100644
--- a/drivers/media/platform/qcom/iris/iris_probe.c
+++ b/drivers/media/platform/qcom/iris/iris_probe.c
@@ -244,6 +244,7 @@ static int iris_probe(struct platform_device *pdev)
 		return core->irq;
 
 	core->iris_platform_data = of_device_get_match_data(core->dev);
+	core->iris_firmware_data = core->iris_platform_data->firmware_data;
 
 	core->ubwc_cfg = qcom_ubwc_config_get_data();
 	if (IS_ERR(core->ubwc_cfg))
@@ -257,7 +258,7 @@ static int iris_probe(struct platform_device *pdev)
 	disable_irq_nosync(core->irq);
 
 	iris_init_ops(core);
-	core->iris_platform_data->init_hfi_ops(core);
+	core->iris_firmware_data->init_hfi_ops(core);
 
 	ret = iris_init_resources(core);
 	if (ret)
diff --git a/drivers/media/platform/qcom/iris/iris_vidc.c b/drivers/media/platform/qcom/iris/iris_vidc.c
index d4608ae756fc..fd49177d9594 100644
--- a/drivers/media/platform/qcom/iris/iris_vidc.c
+++ b/drivers/media/platform/qcom/iris/iris_vidc.c
@@ -243,7 +243,7 @@ static void iris_session_close(struct iris_inst *inst)
 
 static void iris_check_num_queued_internal_buffers(struct iris_inst *inst, u32 plane)
 {
-	const struct iris_platform_data *platform_data = inst->core->iris_platform_data;
+	const struct iris_firmware_data *firmware_data = inst->core->iris_firmware_data;
 	struct iris_buffer *buf, *next;
 	struct iris_buffers *buffers;
 	const u32 *internal_buf_type;
@@ -251,11 +251,11 @@ static void iris_check_num_queued_internal_buffers(struct iris_inst *inst, u32 p
 	u32 count = 0;
 
 	if (V4L2_TYPE_IS_OUTPUT(plane)) {
-		internal_buf_type = platform_data->dec_ip_int_buf_tbl;
-		internal_buffer_count = platform_data->dec_ip_int_buf_tbl_size;
+		internal_buf_type = firmware_data->dec_ip_int_buf_tbl;
+		internal_buffer_count = firmware_data->dec_ip_int_buf_tbl_size;
 	} else {
-		internal_buf_type = platform_data->dec_op_int_buf_tbl;
-		internal_buffer_count = platform_data->dec_op_int_buf_tbl_size;
+		internal_buf_type = firmware_data->dec_op_int_buf_tbl;
+		internal_buffer_count = firmware_data->dec_op_int_buf_tbl_size;
 	}
 
 	for (i = 0; i < internal_buffer_count; i++) {

-- 
2.47.3


