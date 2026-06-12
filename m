Return-Path: <linux-media+bounces-64677-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Bo49ExfSK2rOFgQAu9opvQ
	(envelope-from <linux-media+bounces-64677-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 12 Jun 2026 11:32:07 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B1CE7678519
	for <lists+linux-media@lfdr.de>; Fri, 12 Jun 2026 11:32:06 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=jEoyOJDH;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=IP+8aaos;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64677-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-64677-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 36DAD3252D65
	for <lists+linux-media@lfdr.de>; Fri, 12 Jun 2026 09:26:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5164A3D16E7;
	Fri, 12 Jun 2026 09:26:24 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 270313B6C11
	for <linux-media@vger.kernel.org>; Fri, 12 Jun 2026 09:26:21 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781256383; cv=none; b=U1XDyxel23zF6IaA6iBrYurSevCW8MdQJQw3UJyLLppBAFq5sFMqSfEitvucG9hM8yJ+lYe9lPP9UNHnK0RtQruJTL1xN8NuSa+Bqm4d2EcIaNHXcAfmqD07nGCJWha00W6Itw4ebVrWf6rYqMwPNrmaq9VC73Mj+y5aVJ9aWZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781256383; c=relaxed/simple;
	bh=bBMr05z3+hZKyiKnqtJur9lg4bNIQFaGUAfGEfPWSb0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MVs+jZKCetgu1qGTwd+TRiUN2IvGM17lPTjAMrXi1O5HsMuncEWeevxUKv0megD8bBEVz6NvKh3CTL0NaZae5GVrCaqXd6HgatS6gtB4fq1iulBW96PTqN8Go8A3PNzEdt/SGL8bqm3MCo8aYdDIcrIjpUxsOuD254Su5/3OxVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jEoyOJDH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IP+8aaos; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65C39w6l2497311
	for <linux-media@vger.kernel.org>; Fri, 12 Jun 2026 09:26:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AWJObvt7y+kbPGRMk8Pkpq/KWzg0qp4Ve45uTUJVorU=; b=jEoyOJDHN0EO8/hx
	w6E148r0dqO6Bb+rCiSxsZsaepidMz/us/AekapUeyX1i7jGbxLU0/yuheZeZxnR
	R2ALixxmBiw0mMbnf+jaDKLbsm/FI1Jti+LEKhA8TssZmVYAcsAEtCRLpGcFilxT
	Un5S3IbptSUny83tWmI9e+NHmlk67Fhw9PksB3IbBd6lOmuF5Gjq9D5UHDEyfK5A
	VgKnOd49wgLIo9cNA1LpqpP7IICVvZ+msGBOujwuTIB8ReQK3vim0yUST0c/HvPr
	JKcg5TzyyBM0K09MijSqfL23tFd7XMYjjkpjWg/68n+QgqkM4kXIQL0ttDWuA+fc
	aEYJcA==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4er0x7jxrc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 12 Jun 2026 09:26:20 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-964172af027so678562241.3
        for <linux-media@vger.kernel.org>; Fri, 12 Jun 2026 02:26:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781256380; x=1781861180; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AWJObvt7y+kbPGRMk8Pkpq/KWzg0qp4Ve45uTUJVorU=;
        b=IP+8aaosM8B+F9+Suk4xKRNUuIMEgyMOy059CmyMota4jMVXNTmSZQq/cQXN1+WK/5
         quMtQAtAWtF0wNsu61ZDZQxpZ1X86xySlAdNR6Ta9d5wee4I2vult2oy65YSautlMqzu
         YL3FNsVnXlgKct8FOLtKNFNg2GpvvQ7ILg7QaAud4H7T+8tED5auuW59XPgTMzoGJsa/
         3fOU3PWSJ3zaCd3yb+xKQLsZKSgojbHjlWZbHGkBLDSOKSDIdoNqs0c7DbckVDw3pU3c
         l20yMd0WqlpOv+0JFrPRp00rnjeJY9dHl6fWKBz0VW9tuFMbJ5nAFoErTpcgu1Hj9VX+
         ydhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781256380; x=1781861180;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=AWJObvt7y+kbPGRMk8Pkpq/KWzg0qp4Ve45uTUJVorU=;
        b=Q2ZGndPf3UOXgzo+taEttXVX0JvcgY03KhDrmprXH14oX5JEXjxd+BM5JXHodmne4+
         gHbeiLP8yKts2xLLYJtuQNhNFI4XDDYw8tizQ8LEEh+ICr2epbXI8nhDQEeLPSxZt8fY
         D0foc6SASAix/Ik5TJ43dSWdhJdzzodtVYj5Zpd6Id6I60vl4Hhl7olXbhriOJ61sWz2
         558zyAaIcMyKNCQ1tyoRLhPsg0G2py/sihPwrxIYWH+29br/pezROeMPXxbfYqA5xGPD
         7EpPaFiesqwFeim3GGK33e34sU1+59QTc27a5GJqla53kmf6KSgNdwpN7HN/ONqplopZ
         NSgw==
X-Gm-Message-State: AOJu0Yw7ar28W2wxzxXq9r/ftY7uzB3fRxx7L7+b4uvGLh0aPvM26W9z
	VFsvE9/0Py0QHac6HEUxsmEQLvdRBYQjpLCTT09RQkCVeZjkzcSMUxU8QSiuPVOlm5RTlBoVZBM
	zSnISthHjdCxujZG+z0UatT6Ahgp9Tuq7o2dduJ4EJYNcrS9XxiwuIGt6Xut2EJR4jw==
X-Gm-Gg: Acq92OGxbntr0j98OPcVVDxBTed+kmRuvpfwe/dr6qOG4Krhfb+HiE1epzhBy02nIVz
	zp2PCIZhSklyp6xKeygrt/RbH3tFHJfOdts7Eh2z3CW2L14Kk3Vk+xPKKqZFWzDSZ2455ZIKCaY
	OIg60FokKp78gGArODbtrIzp+/OPO2As9yFcgNEUzeIgHOAVUn/jb5lu5p77F2y4n+Wk4gOLwPZ
	Znhf1QjNQg7rGG9CX6cKTuWC10tlD8/HuMX8Cx4aTpD1vfrbzGcgOQM47Q9hyHjzOyzozb6MOPO
	f/uVoQU1Yl8AWL5VEfC4KYmiViRbE2m1upcMwOIMB3MAM0HvATidGiOrlDXPErtbgWlI7ubOdnM
	/pQwFDRtUOLn4vvvBQ+eiRWKdZUspX1FVAGu/mumokoLLXv5jg/qxAQ2puBE2GONqGxosNLp22c
	R7pI9Z2VhxgZtsFTCLwM8eBX+tYVZGTqJqxKI=
X-Received: by 2002:a05:6102:4411:b0:606:49d:1861 with SMTP id ada2fe7eead31-71e88defa04mr800928137.27.1781256379449;
        Fri, 12 Jun 2026 02:26:19 -0700 (PDT)
X-Received: by 2002:a05:6102:4411:b0:606:49d:1861 with SMTP id ada2fe7eead31-71e88defa04mr800914137.27.1781256379062;
        Fri, 12 Jun 2026 02:26:19 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39929f190ddsm4560191fa.19.2026.06.12.02.26.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 02:26:17 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 12 Jun 2026 12:25:47 +0300
Subject: [PATCH v4 15/16] media: venus: skip QCM2290 if Iris driver is
 enabled
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260612-iris-ar50lt-v4-15-0abfb74d5b3c@oss.qualcomm.com>
References: <20260612-iris-ar50lt-v4-0-0abfb74d5b3c@oss.qualcomm.com>
In-Reply-To: <20260612-iris-ar50lt-v4-0-0abfb74d5b3c@oss.qualcomm.com>
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
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1810;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=bBMr05z3+hZKyiKnqtJur9lg4bNIQFaGUAfGEfPWSb0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqK9CRp+CyWaKMZ8ieN+tWwPl8UwjQQ+oM9UB8J
 Nfn9Mlty3eJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaivQkQAKCRCLPIo+Aiko
 1Zk3CACEsFPEBtMKsMHfoihEHxXN+8cDUYdN16iK/PcAiGmnYum0B3GhT3MpQDTzelkDKmRgVgZ
 bdqp4UedegHV3yyPAaq3QrrACfs4uS1rMYJjjIYhixDk4K1HkzSvew0Fl0OB4UfLhcASYuFvMVv
 yw3LXf3TOyLoraaCk6Qa3fZ/SNds7/c6AsnQevKeAD8Uo3/n0RZt+owytCMj1gZ0NDFePzYw6c/
 X22mMSebEAvnYzKfAbMK8VkpCr+MJYmU0Q/YD8dxl8/CD1ufWPNY323VzBTLpuYkBL3+V1Lkf0u
 tSOcv9uv+RmP8A6hAHSs4WP+rb61qfJq7zs+ex3MIcmBawYg
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: row6cxQx5Wq1t7n_JbbW8QD78p3BfIve
X-Authority-Analysis: v=2.4 cv=c4abhx9l c=1 sm=1 tr=0 ts=6a2bd0bc cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=TAcc6fXARiqENDJ69lsA:9 a=QEXdDO2ut3YA:10 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEyMDA4NCBTYWx0ZWRfXxdFQTotVYZLE
 VQ9IxdE3b7geQVd5bpIlMtJDfTlHm/GIBfq1cfotK30blfhoFmTrE1t2t9y0DDXiNQyvI7Pj2I0
 Mrwkcdzd48QwKC/54toordVdq71YtOXgaT1+irtpNOU8VG0HvGjLy9Hc4yOi++wIY7umcJliEAY
 R2LNxlaez2Y5MUnEK0Gh5RKxAgSGR0CWJDRk0RFUDUKTlUvYXTY2f0crgXkOPAhvZbYgjsrp8iA
 UlcpczKBJmq1ptIkx6joy3BnMdIZFZ11XWtlni+CD1fQXEqBnGmEtlh0IMl3dFpb4ffLP/No5Iq
 eSY6M1GApPr7PNZe6hRgZy5zZ2G5cIJ23WTZk7Q+o15pzzNskGyOZdXh1V5rbKbnc+VkWzGkxuj
 KmA4VuvGb4g+VHk/pjuBVQj41RZvmKMUA4kCeUVhMoSHaMA52KDD2hmNTtZ7IT5ijtVxAETh882
 tDxF4V9Lz6vnPZrKyaw==
X-Proofpoint-ORIG-GUID: row6cxQx5Wq1t7n_JbbW8QD78p3BfIve
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjEyMDA4NCBTYWx0ZWRfX+b2TEWtsvs2A
 mZtF842Aw9uEciAh58bTLH1MAHbrHnIRa7fz6Tzmbch9dRGn4cuI35P5BXFdCNqrnco6LC9lQl/
 gSFtLr7029VNbo+TuKBorG4KXndyq3E=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-12_01,2026-06-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 phishscore=0 priorityscore=1501
 malwarescore=0 bulkscore=0 suspectscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606120084
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-64677-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:vikash.garodia@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:mchehab@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:busanna.reddy@oss.qualcomm.com,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:dikshita.agarwal@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B1CE7678519

As the Iris driver now supports the QCM2290 hardware too, there is a
race between Venus and Iris drivers on binding to the corresponding
device. Follow the approach used by other platforms and skip QCM2290 in
the Venus driver if Iris is enabled.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
---
 drivers/media/platform/qcom/venus/core.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
index 243e342b0ae7..3c88594eb1d0 100644
--- a/drivers/media/platform/qcom/venus/core.c
+++ b/drivers/media/platform/qcom/venus/core.c
@@ -1118,7 +1118,6 @@ static const struct venus_resources sc7280_res = {
 	.dec_nodename = "video-decoder",
 	.enc_nodename = "video-encoder",
 };
-#endif
 
 static const struct bw_tbl qcm2290_bw_table_dec[] = {
 	{ 352800, 597000, 0, 746000, 0 }, /* 1080p@30 + 720p@30 */
@@ -1169,13 +1168,16 @@ static const struct venus_resources qcm2290_res = {
 	.enc_nodename = "video-encoder",
 	.min_fw = &min_fw,
 };
+#endif
 
 static const struct of_device_id venus_dt_match[] = {
 	{ .compatible = "qcom,msm8916-venus", .data = &msm8916_res, },
 	{ .compatible = "qcom,msm8939-venus", .data = &msm8939_res, },
 	{ .compatible = "qcom,msm8996-venus", .data = &msm8996_res, },
 	{ .compatible = "qcom,msm8998-venus", .data = &msm8998_res, },
+#if (!IS_ENABLED(CONFIG_VIDEO_QCOM_IRIS))
 	{ .compatible = "qcom,qcm2290-venus", .data = &qcm2290_res, },
+#endif
 	{ .compatible = "qcom,sc7180-venus", .data = &sc7180_res, },
 	{ .compatible = "qcom,sdm660-venus", .data = &sdm660_res, },
 	{ .compatible = "qcom,sdm845-venus", .data = &sdm845_res, },

-- 
2.47.3


