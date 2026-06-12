Return-Path: <linux-media+bounces-64669-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id nQSHKwDSK2rJFgQAu9opvQ
	(envelope-from <linux-media+bounces-64669-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 12 Jun 2026 11:31:44 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 348B5678501
	for <lists+linux-media@lfdr.de>; Fri, 12 Jun 2026 11:31:44 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=N0lp+KTQ;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="LSvceLR/";
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64669-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-64669-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4E00E34DCB44
	for <lists+linux-media@lfdr.de>; Fri, 12 Jun 2026 09:26:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B1A33A5433;
	Fri, 12 Jun 2026 09:26:07 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0077D36B076
	for <linux-media@vger.kernel.org>; Fri, 12 Jun 2026 09:26:02 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781256366; cv=none; b=j805+wPNLeAegwx7piZoPLOCH4Sknpck0mwC1xPnbr4XhlLabKnHyzWsLHuUucEexDmVANloUBjaSXo5+3cZcX7Jb46+5IY/6jvfloaavE390E9S0mYNaH6iL40KMV5Rh1xFoimxIrWloTKQHEsNLUh86tzWRWybiR/3BMh49Cg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781256366; c=relaxed/simple;
	bh=sUPB9VJRkRZ4see9KcmUKrC+0hNnHbRSIZoFexQREuo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Aw3S6HFhQV8uk+XOFyNzHoWCHeHsntCb9NQqophv2FwPWMK3RugaoiGU4LbjtAlV2oKOm8wrqOGeLmz52aLVIjXkEYntPODnpsoJiD9N725K15UFkFicQ9aD2ht2lMC8oDRO9smdjQk3rxp5YU2TeJvUMX0CyryjI9aYnawXPNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N0lp+KTQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LSvceLR/; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65C39RgG2475909
	for <linux-media@vger.kernel.org>; Fri, 12 Jun 2026 09:26:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	U0gyuvkccvtpcfH79fJjPBeyRgK2qdZ/uoYlWvMd7TM=; b=N0lp+KTQW6pkD7Si
	l7qUOvhY/D8RR1ZiLGw4IX7+TazNgOwuKHn0jntZPT9V5oMA3HzQx+yBRynFF0GK
	zGwHsD2PZA8wDctJYwKDGX2aWrWkbjvUfvDk6S2XL+i57sLid6FBrB0r1ekmCJJS
	kbDl9CpvcrJjQLLJisnitGecw3grRpqNQaWxgPF9YNO9TQpKhf8oKpRWIgfkznqP
	UchUbygKKKGyfX8hsVaMLnFu62eN1hK/UnZ8P1MaNwdM7jIQ1Kbfn4fO1aliki53
	LfURV0sbueZsrZOSr4ToGTrq6lw245YyWtYtFThh0Aq/8rD/PwyAdHFtKKXzMY1c
	VnVL9g==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4er2r5tch2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 12 Jun 2026 09:26:02 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-6c77c80d967so705565137.1
        for <linux-media@vger.kernel.org>; Fri, 12 Jun 2026 02:26:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781256361; x=1781861161; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U0gyuvkccvtpcfH79fJjPBeyRgK2qdZ/uoYlWvMd7TM=;
        b=LSvceLR/FLQ6T/Z/VF5JsSErqtktlkKTrG2l65ynn5sP4rxkffDTqVj4Mwz59/xJVt
         DGMXMBNIbgavitrhj2XmoWqJH5RCW4418JtwJ6nh27iFDDModundtB+3dawSc33VcrVB
         7qOu73IP4mD/CwSPuPqXlQxQpRycdxXp96syXz0AmGt/c4ERljxK0M1knCBHVLNzPSQc
         eszcpiq5IWVLqY4vP0037JIgjSmRPwWAAeNyAyCxjDWkPSHORPac36NiE/PY+eG2skvS
         o2TPEifZ5zXd79xUW0p+1nmzNpyxUOCsaG1GcY4IZBzZCorJpYsgXT/3VQbOohaAJd+/
         5e/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781256361; x=1781861161;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=U0gyuvkccvtpcfH79fJjPBeyRgK2qdZ/uoYlWvMd7TM=;
        b=YIju/4+Xf1pcLwRme9fska9tNxNKBrjz77o8AIWTPDx1WGm1ghGiQuOZsOA1zXAgnE
         eY7r6+J1Uz5irMhN6weguLUPgs2lvhlqPTd0b66559E1RrJEJXrEV/YPaheMm/64YSIZ
         WoBdROh3Fy95Rml7CmtPWheEe93r6HWjS5QFThiSnOvXSshp678MTgznZTm9yMzo+l6H
         p535m0rVLFhRaloW4ezs0qfp3sUHwXzuJgL1p9QgX8sEGPrRePX6NISKC56JgWwhXCdB
         kTG2tEYutcSUCg6E9YDz4kZDH9wcZDpNQDhDI/fvLHZ87EklHGlaVSbkO0lrk6KuQyPF
         7gMA==
X-Gm-Message-State: AOJu0YwRHGpV3SO3laAh/SZXVMhVuvYSgz42RKsU/+cu7NxBu53ttbC0
	UKsVtYiv4bm7OQqnTpJ+jP/Ee9zVvBvvn3+BYoMQnaFVkkjAi8klUoVdJSuQ8O421CIpgewx6a9
	r85BnGLBYkkkg5QsNkYluYK2NR2QNnECAw3PBkmgJ0oCGM4WwQqbsa3n8fMZEx/MYqQ==
X-Gm-Gg: Acq92OFaO3AZhnJ/cki9ukoQU+AF2Qn6ivy81ghmoYoY7H1E1x/yC/cHoxklIWYcrcC
	PG8WaeA88El5zYC5LsLe5QDS5GVfvFhi6apUivlFMnOfydb6lmRUBMzqY3aS3qEOHpOaNYR7kKH
	fnEQnc1YqwdcfDF39MWyDJ+NihMUYEWPNDXL6yFm6LGw8m0URsSbVaRkxiI2Dqi2ZfikvL1gJjT
	rBmCFPhuyHZw/FZEHK6ICaEtNn+TRn5o+egC6cLbs8eXpPIM5oPMkIZ7577MLQuZv/wcNCkeLgw
	ZIBo8mvR4Yqr4an0xxjmHxKFD8XMz5C7j1WI6jnkTFbf72Lg/5YLaJprfwmdLgAr0DcxKiX+baF
	Rx2ti899394yUaVXnxTWcWbgk2uRy3d+WY6mdnv+C8lpBmqmqIzm3U4PGLyJpOGfT/pIkIIN8ZD
	xqPgYZZrjQQVZ4znbNa1ABQFCGqFJ0rgp2fbM=
X-Received: by 2002:a05:6102:330d:b0:631:ff40:22b2 with SMTP id ada2fe7eead31-71e88aba506mr803591137.2.1781256361110;
        Fri, 12 Jun 2026 02:26:01 -0700 (PDT)
X-Received: by 2002:a05:6102:330d:b0:631:ff40:22b2 with SMTP id ada2fe7eead31-71e88aba506mr803574137.2.1781256360680;
        Fri, 12 Jun 2026 02:26:00 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39929f190ddsm4560191fa.19.2026.06.12.02.25.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 02:25:59 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 12 Jun 2026 12:25:40 +0300
Subject: [PATCH v4 08/16] media: iris: skip PIPE if it is not supported by
 the platform
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260612-iris-ar50lt-v4-8-0abfb74d5b3c@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1159;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=sUPB9VJRkRZ4see9KcmUKrC+0hNnHbRSIZoFexQREuo=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqK9CQzimk7CfvnnnQnvM5Hl1meJWWFSD8oLzR2
 KXbIgmwWBGJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaivQkAAKCRCLPIo+Aiko
 1WA9CACAN+xCfByVuOkvI4/VINKTW32xKp94696jqfK+4hKhstfWSAhkJgNPk5QORhUUlu4qbhT
 5trWiTjxwSN4H4/ccLmpmFOj9IWy8I5v2tnXCyzbnz+NPt9qFT50crT/JuFMpC7KBbh0bTVpJGO
 DY27k49aYB9nS7pnUCstiT5jERdV3j95swRHSIRgBiEv9SAGI32TL7xwREenVCRtZuVMhGOyPiE
 SX9MokSEXM/8ID5dPhhpmtKFJuKCQ6MAhOR3/sQfmDzqMEMC9aSngPemX+U/6fBbz4W02w3rtIa
 eJ3hxiMTHPtZvObl/TzHCGoiWYiPm+Y9jKjGfH+rUFHa6DZ4
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: 1mTO6kEARcDGQGaha6n5tuYEKci5tZUE
X-Proofpoint-GUID: 1mTO6kEARcDGQGaha6n5tuYEKci5tZUE
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjEyMDA4NCBTYWx0ZWRfX9t2U0UfWPfUR
 GC9zNLIEtTI0ILQmNFq1+nnw/QT7IA/C+G0fAwevJVgmU2Rs8L2i8ql5gILQkfcaIjA98cnXGOe
 p82m3YXCYDrWRGVvJG7tj2VtrY57L4o=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEyMDA4NCBTYWx0ZWRfXzn2VGIn6RF8N
 wM08mTmbmGO8IiScyyaCgWsNcp6hVmSUnW6N2QQYBsc5mYQhk1ig2QgrracGTm7Zk7kh8s+mIC0
 URWjtIf7JtOnJ03qsn7sYURDPz5X/FJoBW+yTTumP5fWqwaA3mUq4IlG/Ms4Vw1BbDPzWcrg+Zd
 BFkN+9FOnjzABwHIY71AodACVmAdhZmMhk6Pj0r3cS1xvGyodNFyqENJWlupQPcynVlcJD7Bf/n
 Q8vODvlznuxFFjZ8fEQdmnN8cP8SXn87ih2g6Q1a1b1xR58AFfN780+F7jKtk0xiatSO9uqOrfB
 OaMaRosJL+n+ydgZgyOIjtnzUv6NYhrq2BabRaBPo56ryMzDdgTUuxdECIQazQ444VF5c9TDSK9
 mvTPbyw7trGChweRPypjUHCIVwTDQ+62bSF7rKeZVdbgKa1qjbdAwYPu1j2iFA+TEnBkTfM9VIm
 QVxt0E7B7DEA74qKMyg==
X-Authority-Analysis: v=2.4 cv=M6p97Sws c=1 sm=1 tr=0 ts=6a2bd0aa cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=9TuWGWrZIemhly9L:21 a=xqWC_Br6kY4A:10
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=DRvvl89rPFtLv9ObwM0A:9 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-12_01,2026-06-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 suspectscore=0 bulkscore=0
 phishscore=0 clxscore=1015 malwarescore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606120084
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-64669-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:vikash.garodia@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:mchehab@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:busanna.reddy@oss.qualcomm.com,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:dikshita.agarwal@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 348B5678501

AR50Lt doesn't support HFI_PROPERTY_PARAM_WORK_ROUTE. Tables for AR50LT
won't have corresponding entry in the capability tables. Let
iris_set_pipe() silently skip propgramming the property if there is no
corresponding capability.

Reviewed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_ctrls.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.c b/drivers/media/platform/qcom/iris/iris_ctrls.c
index 10e33b8a73f6..33a34573391a 100644
--- a/drivers/media/platform/qcom/iris/iris_ctrls.c
+++ b/drivers/media/platform/qcom/iris/iris_ctrls.c
@@ -534,6 +534,9 @@ int iris_set_pipe(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
 	u32 work_route = inst->fw_caps[PIPE].value;
 	u32 hfi_id = inst->fw_caps[cap_id].hfi_id;
 
+	if (!hfi_id)
+		return 0;
+
 	return hfi_ops->session_set_property(inst, hfi_id,
 					     HFI_HOST_FLAGS_NONE,
 					     iris_get_port_info(inst, cap_id),

-- 
2.47.3


