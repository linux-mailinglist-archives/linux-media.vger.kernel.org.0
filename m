Return-Path: <linux-media+bounces-60730-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GMh4EOI1/GmNMgAAu9opvQ
	(envelope-from <linux-media+bounces-60730-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 07 May 2026 08:49:06 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 908774E3B0B
	for <lists+linux-media@lfdr.de>; Thu, 07 May 2026 08:49:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AEF4830891A5
	for <lists+linux-media@lfdr.de>; Thu,  7 May 2026 06:43:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 436BA34A794;
	Thu,  7 May 2026 06:42:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lgRj7Rgx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CqJMI+UW"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0879C34E75E
	for <linux-media@vger.kernel.org>; Thu,  7 May 2026 06:42:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778136156; cv=none; b=ETfgglODzcULsMj+7qGNhOHOc6XqF4wxpD0EJWD+b0tJxuFG/Wv6Vt5XsWWGRipxvThUtvZrWpSOvgc3obVRrTLYHwTnaYqSAv8jn2+FskxETtnsisc4Lsq6HAX1ZJP2VVh0JuPqYO1T85xKmqrE8mxr6XqZ1JB4SI7gx5S5tPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778136156; c=relaxed/simple;
	bh=3LZBjFNjSvRhMK03ekSlXkVYlg7os/XFnLwP9MO6T5M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hPyQnfkVgV/qoRJCiQUfuq3/QMTN2jF8XzNUKQ7cWnf0BKCdHDoa7ZpPK7efvU2tPOWmEKZ9P9GBCsxfN2u7xbDWCAkjWGi/UPL+pMwENNYev1bTkOq1YhijQ8ymEUrEJ1ymXcdT+gDiQqvIOD306GUp5LvzW9tyQwIui/RhnXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lgRj7Rgx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CqJMI+UW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 647442dT150997
	for <linux-media@vger.kernel.org>; Thu, 7 May 2026 06:42:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kIs5lUio7E7YMx2NkuaANRPWVQRplvNz2SIkISpJQxI=; b=lgRj7RgxdAzUfk1J
	+BW9Ld/7zInlOOQd0xaxWnB8qfDaSNZWnhI+84B8hJ8O99kTXABUBZOZytNBw0cr
	Ay83KV060XZ6y0KY3wi6EiFmZnn4KmoSpUWASeVUv8aoa3mYhrDfrnFUjpJjY809
	XIT4I5GJhKKow/huC6WWmf5QOMoK4Oni9Tzu/eRgOhjBYhxulfa4TULdfjMDZimG
	Ymt5+IxnMk6LaibVjlK3C50PGBOJoX1nbMkjngCSJHy2vyTYz5Ehf0knr8lMSz5A
	kBqEMJ6VpjbbZJfW8VM9PCIbOGwn4TNPGA/O4BfRP1B+4qKm907fdGeIBTuq8zeU
	/hue0g==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0kctrgew-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 07 May 2026 06:42:32 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50fbc70cfbdso11441181cf.2
        for <linux-media@vger.kernel.org>; Wed, 06 May 2026 23:42:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778136152; x=1778740952; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kIs5lUio7E7YMx2NkuaANRPWVQRplvNz2SIkISpJQxI=;
        b=CqJMI+UWerh+WbgzXHdDjFMDL1NODL/njX5c8EwOYAgzSbt9MdzUBwX5ICGXOfmBCQ
         NyfOWYfALjX2XKSpuwX68cv6FHJSpE1SFCY3GD8w1jN5QDH3Xry2+ubKuFvNra7RO9Dh
         5n/sJeW0tvezg9wTzgsq/m2RFl0420RGifFvsae9do379cwCWQzLjXWGUqN5XlwwEr3C
         K6DKxFk3nK6nl0M3Nb5orzG2VXmVWdkSbBh9o1Teh7+dE1iYJNa8/b8YR1arkTk/KQtp
         jEmJVu6FBKlrjoeio21HfOqfdh6BfxDWAVS12C4LSeRJYv7UdOSjjkXzeLnIz8gIToPz
         +gwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778136152; x=1778740952;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kIs5lUio7E7YMx2NkuaANRPWVQRplvNz2SIkISpJQxI=;
        b=FRvEEbfOgmm6s46NvaNGRM1wltaQTBsjeT1Jrt7No0baIYM2OMMb7zB1mRuhAYZMBv
         KC+VHpCBbf0Y6H8e6CCUu1xALQ6lrTqUY0P2+Wrvbefo+21H/5sqZNdGbHXjAjcusjc0
         8EMO2uk/z6NEQCBFj09uVEfEDK4UUAx74LgiisB8C9EPQi4W6G9GlHtlMkSOhVaqLAHK
         M/juKq2vCCpOSO3y2k8mLnUnBWU4CpYxTJycbveHP5y0d8lgxwnVf8hXd+sulNUXoKoK
         6KRbdVTZtXra64PA7cmaIHZrK4Niu+zM4Frgg+e1inJNsPhdcw+bl7VFyITkPc2/u5OE
         4fhA==
X-Gm-Message-State: AOJu0YxkofrTm7pKD4XShiPCk99IZUBoV0w5/hD4gUqSX8nQ/8Ug55P+
	BJiJPEbPxqT5XVdNzpJHPMEl4F6X70IT7dxUrajhKfa6Q0oe6V628VKMNAtqKKk8gDYlEAEtZYp
	us5bKKmQBf5oAZHA9xmf4D/ElsI+7BAWKDc6sI6/aUNoJUdF7AEman7iwrtVnCsS0hQ==
X-Gm-Gg: AeBDiesJU8mb0pukMcCxChb4JE53dwaDNqDLqYByKaGP5ciOiUQa9RH2m7Z4tFve2SD
	GzgJ7v6BEwjAPPwBerVBBPELBQAb0md1yI7HYvDvwPxREe5N6uHlEqBkWzfAVwjq/QPc9TwBG0b
	iBWMG8bc4yw0ILM0vsCf/JDDePHiEv02yipC4MFtSgUBihM3qxwlukacw+pyVb3nqfxp3TlfQLM
	G1U9+MzNASff5Ik2iGgEtOf2Ad0RzVHvedKyV4zwbGMQQK/vrFD41Lp9fHHcZbQm0btfUnffhq/
	0jYik8qjOP+yz/cJFdfRvFtOq4lK9kO9X2jqig5r9MxhQ9GXoP+COAi7Osi7g78SUVngHBwyqqE
	0l9ijBk+qK+6tE5DfiuY0T0KBJwd8mLlkSEZguYg24VjXOw03BhgPXjS4l7+5iupixjeOphT0G4
	5FEkcN9r4jFmWiCMRJABiHewjiBY5v/YoUVWdJSK5ywoh5iQ==
X-Received: by 2002:a05:622a:1181:b0:4f0:131f:66fe with SMTP id d75a77b69052e-514621f49f3mr91799801cf.59.1778136152155;
        Wed, 06 May 2026 23:42:32 -0700 (PDT)
X-Received: by 2002:a05:622a:1181:b0:4f0:131f:66fe with SMTP id d75a77b69052e-514621f49f3mr91799581cf.59.1778136151720;
        Wed, 06 May 2026 23:42:31 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a8722c2d43sm3334694e87.40.2026.05.06.23.42.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 23:42:30 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 07 May 2026 09:42:10 +0300
Subject: [PATCH 10/16] media: iris: add minimal GET_PROPERTY implementation
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260507-iris-ar50lt-v1-10-d22cccedc3e2@oss.qualcomm.com>
References: <20260507-iris-ar50lt-v1-0-d22cccedc3e2@oss.qualcomm.com>
In-Reply-To: <20260507-iris-ar50lt-v1-0-d22cccedc3e2@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=5660;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=3LZBjFNjSvRhMK03ekSlXkVYlg7os/XFnLwP9MO6T5M=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBp/DQ+z5sEOUgtHL80c7YAFQiJ9xqfQZ1SbISqN
 eXFDrYwvbmJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCafw0PgAKCRCLPIo+Aiko
 1YzSCACWCW6ngGwZlGy5EaXz9WiYjjQ91VKR/i6bdllpMVWYm4Hddfk06NvoDVdlQ+x15Czwthz
 XTF43orRNU00n4dwg+Jbk5vAIXQ3QyRPkNRWowch3cvqL5UryKHECzSC0qP7CQkzrBo5mqJjfFS
 5tiJEF/WUMixONxSWXvkYdgg36/hiIy1+TxglV6aXZjdeYCeJnJJj3OqyCwYZs21JV0oBVS+4QE
 HNDw/BO2ZLjs9bD6/RKw7+M2PmxsWDz/lb1kQpRAHr4kW5HvpH8uSwYnihDuLwpNUSYqiStBQZM
 YAFW4TR1zGO4MxUP9q+jSFKHd5jxXBFpKtdKuztzjyec43Db
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=XsPK/1F9 c=1 sm=1 tr=0 ts=69fc3458 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=4y4YWC2vBVg0P_IM3hEA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: UuB_MebFsOMuY_SAesNeZubOjDl0PVrZ
X-Proofpoint-ORIG-GUID: UuB_MebFsOMuY_SAesNeZubOjDl0PVrZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDA2MyBTYWx0ZWRfXwN84mQTdotdu
 mHsuo47pKSBAVoGFi8h7q1FnmI880herKyHeQ76bAnDEW4EMoosHfc4/dbwIBhwp5tKNWxwsZGX
 PQ+r8SmH8UkgJNaZI0AXy8QCmhGEyJCHAbc7GA8Xt0MZoXlLy1gOJgif26ixvosqF4HWLa6OFDZ
 grbizZp81FgXyq6Y3o9SpoiQtQjY1NNeOBrffkw/sicmjERk+wE2Qau7bZDoQ6Duc4m14HbdWIx
 ywlvVktO22di4hTz4r3yeCoZO/zLtyUadqrmQDOxcF/LPFlIILXYqWgg7A8sSpQ6NNDYa2sur/i
 iMmPKgMGmFeJsRzX/ITL/xMX2nyX8UbYtQEvSvOQ/Cq1qryo7wQhYBfkVAL/sFpZbze4cQJ9qr2
 Pyor6s0jNrENmJxc91SEJKLjJuKoi4Y411+DRBZn+zmeePMsGTjubO90jkerkRKZHNZaKE7AC9G
 rEIYqvA0dJsVDkumx5Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-06_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 adultscore=0 suspectscore=0 phishscore=0
 priorityscore=1501 malwarescore=0 bulkscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605070063
X-Rspamd-Queue-Id: 908774E3B0B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	TAGGED_FROM(0.00)[bounces-60730-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[pkt.data:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

AR50Lt with the Gen1 firmware requires host to read
HFI_PROPERTY_CONFIG_BUFFER_REQUIREMENTS property, otherwie it doesn't
update internal data and fails the HFI_CMD_SESSION_LOAD_RESOURCES
command. Implement minimal support for querying the properties from the
firmware.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_hfi_common.h  |  1 +
 .../platform/qcom/iris/iris_hfi_gen1_command.c      | 21 +++++++++++++++++++++
 .../platform/qcom/iris/iris_hfi_gen1_defines.h      | 15 +++++++++++++++
 .../platform/qcom/iris/iris_hfi_gen1_response.c     |  6 ++++++
 4 files changed, 43 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_common.h b/drivers/media/platform/qcom/iris/iris_hfi_common.h
index a27447eb2519..16099f9a25b6 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_common.h
+++ b/drivers/media/platform/qcom/iris/iris_hfi_common.h
@@ -121,6 +121,7 @@ struct iris_hfi_session_ops {
 	int (*session_set_property)(struct iris_inst *inst,
 				    u32 packet_type, u32 flag, u32 plane, u32 payload_type,
 				    void *payload, u32 payload_size);
+	int (*session_get_property)(struct iris_inst *inst, u32 packet_type);
 	int (*session_open)(struct iris_inst *inst);
 	int (*session_start)(struct iris_inst *inst, u32 plane);
 	int (*session_queue_buf)(struct iris_inst *inst, struct iris_buffer *buffer);
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
index 83373862655f..4e17fa3c602f 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
@@ -1063,10 +1063,31 @@ static int iris_hfi_gen1_session_set_config_params(struct iris_inst *inst, u32 p
 	return 0;
 }
 
+static int iris_hfi_gen1_session_get_property(struct iris_inst *inst, u32 packet_type)
+{
+	struct hfi_session_get_property_pkt pkt;
+	int ret;
+
+	pkt.shdr.hdr.size = sizeof(pkt);
+	pkt.shdr.hdr.pkt_type = HFI_CMD_SESSION_GET_PROPERTY;
+	pkt.shdr.session_id = inst->session_id;
+	pkt.num_properties = 1;
+	pkt.data = packet_type;
+
+	reinit_completion(&inst->completion);
+
+	ret = iris_hfi_queue_cmd_write(inst->core, &pkt, pkt.shdr.hdr.size);
+	if (ret)
+		return ret;
+
+	return iris_wait_for_session_response(inst, false);
+}
+
 static const struct iris_hfi_session_ops iris_hfi_gen1_session_ops = {
 	.session_open = iris_hfi_gen1_session_open,
 	.session_set_config_params = iris_hfi_gen1_session_set_config_params,
 	.session_set_property = iris_hfi_gen1_session_set_property,
+	.session_get_property = iris_hfi_gen1_session_get_property,
 	.session_start = iris_hfi_gen1_session_start,
 	.session_queue_buf = iris_hfi_gen1_session_queue_buffer,
 	.session_release_buf = iris_hfi_gen1_session_unset_buffers,
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h b/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h
index 42226ccee3d9..1b770e830c58 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h
@@ -35,6 +35,7 @@
 #define HFI_CMD_SESSION_EMPTY_BUFFER			0x211004
 #define HFI_CMD_SESSION_FILL_BUFFER			0x211005
 #define HFI_CMD_SESSION_FLUSH				0x211008
+#define HFI_CMD_SESSION_GET_PROPERTY			0x211009
 #define HFI_CMD_SESSION_RELEASE_BUFFERS			0x21100b
 #define HFI_CMD_SESSION_RELEASE_RESOURCES		0x21100c
 #define HFI_CMD_SESSION_CONTINUE			0x21100d
@@ -113,6 +114,7 @@
 #define HFI_MSG_SESSION_FLUSH				0x221006
 #define HFI_MSG_SESSION_EMPTY_BUFFER			0x221007
 #define HFI_MSG_SESSION_FILL_BUFFER			0x221008
+#define HFI_MSG_SESSION_PROPERTY_INFO			0x221009
 #define HFI_MSG_SESSION_RELEASE_RESOURCES		0x22100a
 #define HFI_MSG_SESSION_RELEASE_BUFFERS			0x22100c
 
@@ -186,6 +188,12 @@ struct hfi_session_set_property_pkt {
 	u32 data[];
 };
 
+struct hfi_session_get_property_pkt {
+	struct hfi_session_hdr_pkt shdr;
+	u32 num_properties;
+	u32 data;
+};
+
 struct hfi_sys_pc_prep_pkt {
 	struct hfi_pkt_hdr hdr;
 };
@@ -525,6 +533,13 @@ struct hfi_msg_session_fbd_uncompressed_plane0_pkt {
 	u32 data[];
 };
 
+struct hfi_msg_session_property_info_pkt {
+	struct hfi_session_hdr_pkt shdr;
+	u32 num_properties;
+	u32 property;
+	u8 data[];
+};
+
 struct hfi_msg_session_release_buffers_done_pkt {
 	struct hfi_msg_session_hdr_pkt shdr;
 	u32 num_buffers;
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
index bfd7495bf44f..23fc7194b1e3 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
@@ -591,6 +591,10 @@ static const struct iris_hfi_gen1_response_pkt_info pkt_infos[] = {
 	 .pkt = HFI_MSG_SESSION_RELEASE_BUFFERS,
 	 .pkt_sz = sizeof(struct hfi_msg_session_release_buffers_done_pkt),
 	},
+	{
+	 .pkt = HFI_MSG_SESSION_PROPERTY_INFO,
+	 .pkt_sz = sizeof(struct hfi_msg_session_property_info_pkt),
+	},
 };
 
 static void iris_hfi_gen1_handle_response(struct iris_core *core, void *response)
@@ -652,6 +656,8 @@ static void iris_hfi_gen1_handle_response(struct iris_core *core, void *response
 			iris_hfi_gen1_session_etb_done(inst, hdr);
 		} else if (hdr->pkt_type == HFI_MSG_SESSION_FILL_BUFFER) {
 			iris_hfi_gen1_session_ftb_done(inst, hdr);
+		} else if (hdr->pkt_type == HFI_MSG_SESSION_PROPERTY_INFO) {
+			complete(&inst->completion);
 		} else {
 			struct hfi_msg_session_hdr_pkt *shdr;
 

-- 
2.47.3


