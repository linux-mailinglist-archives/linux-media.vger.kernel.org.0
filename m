Return-Path: <linux-media+bounces-61437-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gLesGyB2BGpOKAIAu9opvQ
	(envelope-from <linux-media+bounces-61437-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 15:01:20 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A1A75533837
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 15:01:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 033D130E4727
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 12:52:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1A10481664;
	Wed, 13 May 2026 12:49:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Vm7QQiiX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OySlUnTi"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81589477E20
	for <linux-media@vger.kernel.org>; Wed, 13 May 2026 12:49:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778676578; cv=none; b=U4ytfn+tdzGNZB1ELcAKUyrbjQy8t1OiG6UKU3EE98+vUZK+pGYNRRX5QeBEti/ZzlLaO4GUa8G04dUA0nodzPdvOPqPx9vrozK6cTp/lwpQRbvFbkBWoZGsSTrgEC9GnICa7B3OOfefd0RbGsaYyMYXTXCbadAbjiodxQ/X/l0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778676578; c=relaxed/simple;
	bh=3LZBjFNjSvRhMK03ekSlXkVYlg7os/XFnLwP9MO6T5M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SugFXMC3zDIA1H7hpNV/g2y0Cw6olhcvEYmjQQ4VV8tgPi0TtMIWLPwEBPN2E1HCxgE6nZSxpVKbfaAxeorq5Cn9/WkKLv0Ef4/mAwvjeakrC8FDV2MgnYvRsEnwq1RvBtGdvy2jwJEXcXrT5oJEjpGQe8JL2E/Ry5pffom+e24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Vm7QQiiX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OySlUnTi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DANuoo2321230
	for <linux-media@vger.kernel.org>; Wed, 13 May 2026 12:49:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kIs5lUio7E7YMx2NkuaANRPWVQRplvNz2SIkISpJQxI=; b=Vm7QQiiX5N3oSaHs
	dgaGKExjarUjzySPt1XLSJps7LANZvTlOrlqHcB9Zp2hO+A0psunwOh7OC4/XAGS
	wwGSjV7/39828FL+mH98EArXGlH3CA9To33TbdNmyUaH0aQcnITb/jBV01hEKlre
	vbBLIiJ8RzIeJrzP5/aZ3U2td98gyZsIOn3LsnISvbIkV+KHV9IhWIeSljOVAwDL
	AO4SOsjAKwE4/UTmoAMkm3M27yjwXC8Twk03dFopiWNmmxQArpHF4awxnXVKukvE
	HfhNdXNpflpTMxPlAhQVMHYZy6Kh33LiUeJGHGHbCTCqWLdG58Daphjn/PdCLQyi
	HabQ5Q==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4hgu9y2k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 13 May 2026 12:49:31 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51494d74d4bso106591541cf.1
        for <linux-media@vger.kernel.org>; Wed, 13 May 2026 05:49:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778676570; x=1779281370; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kIs5lUio7E7YMx2NkuaANRPWVQRplvNz2SIkISpJQxI=;
        b=OySlUnTiQ8B5WRjdapavu93OESqrtwDnk1Dyf8Jv/563FecPSrdwjhaWe3m0/iIj21
         DldpYpvSHUxOEsCGaWN8xZiITpYIo20z5BC7oHJtAzJxeeS8rqMe3anvWOUeXD230hxq
         Skw1U/cfLfJZIlJzpuksqk5uRBlghQqYemUfc6SxLJdbYZj/iYDPFPxx4jYCyZzi5Pab
         pFNQD3dQu/SCy7MrRLPun18HKdBaW2Rfa7+RwEmDhxA4Bl1QJ/1IC77uTpS6hkeXrKlX
         gevYuLWweCpEyI321AAMyQN3ic/bpemlydJs3oIeK3kAzs7uHtLIV+NAXyZvXDnNVALg
         muJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778676570; x=1779281370;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kIs5lUio7E7YMx2NkuaANRPWVQRplvNz2SIkISpJQxI=;
        b=iJAUpdSe3rLQHTER9w7/lzYeXgklQSyUktUvNn9WbvM5Z+WWR8fWofy1t0evRVhDrD
         Xbek81raFB8kuBgKu7STp732tRonD7/WwAodhmf6sw/sVf7SGeDgxInZ8ZThljg5qXqB
         rp8/PPLgSa6GBhi6c0ef8Cy/PixH5N5yRc2lgtl0AkDeWidT4LmVB45t4XfGtQ7iwXof
         p96ntsmudLpRdV9lu4pRvMpOXTUnEapwCxW0giF201iUxT7EFRBqJjK+KZV5f0iGS9o/
         EcvrM4frQ3AA9m5B2lALPVrhaQkf5UsMkgjGh8xpuBU+ZMySGVhpUmUUklVzNaeYYvtq
         396g==
X-Gm-Message-State: AOJu0YyaT+L/tJ1R92mLws+z/datUGsAx254CUa8UAxDQJQmLRzvh9i/
	hbT899qOL+bAIlUInKF6Qcg58dgkucWu1ZpLId+zRhE+Nn/DNZHdXIDbU4ias5z9PRb1AbKVgQO
	KkV+wUWm7fNP7c2ofPJyGVw5L1osBew2CCe/oowqMJLHpPfVaAHTCP0t5aE20s/OIBw==
X-Gm-Gg: Acq92OEUCUHZ0eyspcHl40hXU1TZlCbih5V9exNLBLWhX75WDYsCpFsq1k6dSUOGhca
	qcCNBmy+WLe3/d8ytLN4G6ubMtQS50Mbw7YJk1vKQuqlY/7UbLlvAU0fb3xN1gLNSK9BAtcyAcw
	Rcezo/IXtHUteBKzpZeVl9cc3AFw1+fs0foDkEUd7j2g6HabmOu6IZPRXOR61XdkmtAq4BozB9v
	cRTcNiK5nxu/WQroV/QLjfGv4btahbaECYmRsw0s3b3A9VC0b9mSS00kRpDGf6VOuIz1H1/KMaf
	gEvBD/NqXGnm4uvA/n9DebiIkUVyH29Fyg3UflrxrBtHMJyXJnRt01BrAdLK4TUJvIgaMBy2ilo
	4Y+pcFV0KteKejVH+wwOneVWk0qcgW1SvV560Yx47noKGDTZHx1YSW3sExlOeMiVQVGR/w3dvz3
	ci5cqwO+PBpw+ul8fkeYwS9TtfPJOLuzlG/Ig=
X-Received: by 2002:a05:622a:110:b0:50f:b181:6ae7 with SMTP id d75a77b69052e-514cef74db9mr94037641cf.17.1778676570009;
        Wed, 13 May 2026 05:49:30 -0700 (PDT)
X-Received: by 2002:a05:622a:110:b0:50f:b181:6ae7 with SMTP id d75a77b69052e-514cef74db9mr94037331cf.17.1778676569519;
        Wed, 13 May 2026 05:49:29 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-393f5f5f15asm41106841fa.17.2026.05.13.05.49.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 05:49:28 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 13 May 2026 15:45:44 +0300
Subject: [PATCH v2 10/16] media: iris: add minimal GET_PROPERTY
 implementation
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260513-iris-ar50lt-v2-10-411e5f7bdc4c@oss.qualcomm.com>
References: <20260513-iris-ar50lt-v2-0-411e5f7bdc4c@oss.qualcomm.com>
In-Reply-To: <20260513-iris-ar50lt-v2-0-411e5f7bdc4c@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=5660;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=3LZBjFNjSvRhMK03ekSlXkVYlg7os/XFnLwP9MO6T5M=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqBHNB+REIn+2grh+sTO7eRs3rdPldZghwhL8oz
 7nlhozBvYiJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCagRzQQAKCRCLPIo+Aiko
 1acyB/9dhAfCYuxvZDe/GtAk/58mH/Cs88dkZ/SRYJNfeYU5tUvNZhsLUEtekh+I4EPqW/2YbiV
 1QHYbVWDPSd4u3gEhocvP3hmULI1D6H6IAGkWGrwvdHoDXu5LXgyEH0BdQfe5V8KEBc6Pl9n69z
 vmy6padNk95g2ACQmFWn3EvPOl5WNmlB2kVqHIvokMI5SZYRhnPzX6swztXTJ8YPyTYcjeyWV2Q
 tsGlGpOHv2WsOzz0YYzoHO69qpCAXAaFLmMg1aVjKSrz8UDviABVAIwJZ7GpaG4saECvz3VHsLB
 6mRpOylwSed5KhwkO1SFlhC0twRbA96ujK8W/KYmb837kwpO
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=X4di7mTe c=1 sm=1 tr=0 ts=6a04735b cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=4y4YWC2vBVg0P_IM3hEA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: NpJngRh98lWPjPxe-xRW9gG5vtzX5unA
X-Proofpoint-ORIG-GUID: NpJngRh98lWPjPxe-xRW9gG5vtzX5unA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDEzMiBTYWx0ZWRfXwVZCvTSuzH00
 pbSAdHVOxQxZGEpjUyjEmQ3JSlqr1LHnb5jUDjqWBwJNdPulF3JMp2GdyVUi34ZUozkgU6lhYfM
 UxCYyjpSiIy+PGiP+83thjRTSwVZzoKk0MbmHAMXHUtf6MtbT1/+6wQx+1ypMnynSvpceUPsFFS
 mjVafI8V1ihskcMP3o8UGjTtD6fXLBRyoQObAm/iPSvp5A1zSZ9/Binl9dvghk35mIhmS8btDOu
 poU3entn6IDnc8y4T2qtESp/SgrNQwS2a3DhpMumc0ADqs+9POR+1T+1BemQ7usw6X9nh2Fp/bB
 5IDL746tNfDW5pDQPxksXuSZx6np9q1Gyt4rPi0oKdvrcLGx1fgEXAYJuBzzA0v27kPXnKMUphl
 UNgLt99gc3OS+2DhI0XlDwCFgOjy+Mpe+LrUitk1E87T7MEXCI3mpCi8NJV3MXaBQjE2p4kVyXa
 81TcMDV6ocM/wDX/cqA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_01,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0
 phishscore=0 malwarescore=0 suspectscore=0 spamscore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605130132
X-Rspamd-Queue-Id: A1A75533837
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	TAGGED_FROM(0.00)[bounces-61437-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,pkt.data:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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


