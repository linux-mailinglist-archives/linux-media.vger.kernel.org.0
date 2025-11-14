Return-Path: <linux-media+bounces-47044-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id D4A97C5B237
	for <lists+linux-media@lfdr.de>; Fri, 14 Nov 2025 04:30:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id BE4134E2F2F
	for <lists+linux-media@lfdr.de>; Fri, 14 Nov 2025 03:30:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A8D91B0439;
	Fri, 14 Nov 2025 03:30:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Cfh3a9xA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="H9LBwNDE"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B151A26561E
	for <linux-media@vger.kernel.org>; Fri, 14 Nov 2025 03:30:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763091011; cv=none; b=EhAjyf3lTaAax8DRmZJtwXEKBFhI9zuixyL3siEb9EUn+AHYxtyOLhf6FW7PMkJ0arYrXpSep1Rqxlq02+RtKKX2KzeaYKbnbGRyZEFwfPrClJwLSXzr8kCi7wPcnyPPD24LfCqcJEGuznae4wNrDSBvYMAcgPAbTU72x+TGlaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763091011; c=relaxed/simple;
	bh=/VFxNDC/+4OXwxjw+fC1cxECcAHmPyYEYL69YEwsaDs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GL43mO786pSV/SFrtOobZKYOnxiNMNXl/gdEQIGLit3MDliZnkuFLH8h4A1YjGN7/WtcG90cJZIzeTGLlmNuw7zQvmMH2qHZjQxXL1s6igukCQakMzR7fTR3RrpfYQ2fvpGIVSoOIszca5mJF2jjyMleu8Bd5KzyBgPFLgsVGi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Cfh3a9xA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=H9LBwNDE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ADManBQ1484894
	for <linux-media@vger.kernel.org>; Fri, 14 Nov 2025 03:30:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	H9VzPj0s+32E8DN794i60/pMz7ADIqRLAIP3bBDi3+Y=; b=Cfh3a9xAPxSqIswG
	ot0QgTnSsl9QDhH+yFdP4JLzj6mNXrmFFG5YXpn0AGF5Arj1Wg1e5z161zo4g3Hq
	4c2LgmaqVSUsy2yPwfMHBBAKYlyzucKp3+ytu6tmHYXBIDtyB8XCiXDV/WbIWij3
	aYtQRbdej2nMUUvXVutITfHKrYq131bzNfnNa3ee0zqvRbJMWNc+YnT04nqaVnKO
	1fUVL/1pbFcHWPrgRNh82U3TlikdqGXvTebvr9FMBzNrBZXVgupNKPzpsQJ2dRlU
	GDLPPZPFCEmjWa0sickpuUJm51yENhIMtbTRKrkUgqWyMqG8jfZgaS7m8uhZsfqt
	Ce/G+Q==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4adr9cgps0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 14 Nov 2025 03:30:08 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b55735710f0so2604199a12.2
        for <linux-media@vger.kernel.org>; Thu, 13 Nov 2025 19:30:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763091008; x=1763695808; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H9VzPj0s+32E8DN794i60/pMz7ADIqRLAIP3bBDi3+Y=;
        b=H9LBwNDEXbrQIYeLs5SCM3gJwInjwpM0GWodlj/e1TOa9KRjns6AlRMDV2c2/+vf4s
         MjijwmkeocahEJjjAyiLyeb3RJVS+EQdLvdwuUAp45VAqFoYHkIrbYB9R5hz7MeStdDJ
         kNeQGJrTK+Qhb4KbljbZt+DtKca5KV/KmOjcfK9kCSEJLdcWnDQ9EviGcc5A2wdR4tNs
         EQwfKcNv9yNvsv/SovtsJ9MR+gwl/XmzyMabZkMBIqbN3azPW4hZ+EsOUvymPzlUx+QO
         I6CBoHiFj5JGaey9i/RSFgIZ2I4kzQPGQcCeNMVPqiKlD6de2W9d/8oxZZWunTpCSK0G
         BqjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763091008; x=1763695808;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=H9VzPj0s+32E8DN794i60/pMz7ADIqRLAIP3bBDi3+Y=;
        b=bDzD25oEAARhvVBvpk7r6PPdoNfA6s7Vm3+hWueqQ/tOWk4auLk8O5fdpneHfqJPDv
         yy8wB3IcdQKVW+eMNoYdEupYgOyqrpqNskiXWC47TIv8gzrAEmCiFu83LTgtiV9Z+X0q
         GnN9g8AEV1VruLBc/wfd691GBHkp1ox/jTAkWQJEJPMKWg8J4iNpIb2ELX75841RYii9
         zPo+t/glGkZ5uFj24B98YWvH/OW11sDWhGxltXLT9NiDssIpJxA9tE3RRi++LUiVUd2O
         BmrG5NSsoq7q4XIe0UdUsv+A1xg0DMhw+J9W3uOxpjmvRWuOjnwKscwlK6izgYTrAfZQ
         FiLQ==
X-Forwarded-Encrypted: i=1; AJvYcCV8iM2iYBm5Cqk5qcTC4bD1zq4UDurXJwP/2qUUhB1BV21H8ATGPd1AZbidT+XsOklyj9PlLCFS3PcDCQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3EBiO3u+cKwfcS7xSQ08isw5G70uwZeeAoUlnxICgjIFH6RgN
	HYh0cXpWbmbRMvvWrwrwgUeLlEAg4cBh59FUk4KjtY7rQ6NoUKqy6IfZG4LOH1AMcsCOo+LE7aX
	eQfxbM9oCLoHwSae9+R5NtkSBntRZV+UZRZ8NaiU3CI4JvAy7uqSpSdQ7NgXSZvRJRQ==
X-Gm-Gg: ASbGncuvTt2TYWq0erO1+bfXhqUzPMqmcV1cRng36myO2kILjTr2JSFx3L6LzmyWE3m
	nbakXVgpKiLY6udYn7R8ynYKCidsRm4GzMGBUnGUlFbRatz38p/FE6wM6/tjQvg5tBzaDVFKrID
	c3TpMO4ktnJKNLLwQtJ7rf92wAkczpdhL8C19WZsEo/MMvI01eHF57QziDe0Bx3RAtCeUrtmBFD
	vspc7ojkPgSCC7h1Qdw8Qah+7uLLt1ZBiPodJFSsPfuY6F00DWTzPHnB6grjxq3S0WfdkwuQulI
	6nTXVHfEgoRh/m8NO/88Z/4qyZyvi4+hHeJJaaEMdPlkKoEbTPOF4q/OXg2MaOthF24x9sjjmew
	9Z9+mGIyifsNZ2MfLdbo74wcGX7EaRLs9aVHHKUcFxzv2tkSewPn/qA==
X-Received: by 2002:a05:7301:e2e:b0:2a4:3644:4be3 with SMTP id 5a478bee46e88-2a4abd4a232mr525564eec.27.1763091007915;
        Thu, 13 Nov 2025 19:30:07 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFvCPLwDbSVvuncIldnA3OjJPk+fH0sy1tySgUwtdCPhjWZBj5dvl1Ewwa86rvC0Ne//xLOaw==
X-Received: by 2002:a05:7301:e2e:b0:2a4:3644:4be3 with SMTP id 5a478bee46e88-2a4abd4a232mr525553eec.27.1763091007250;
        Thu, 13 Nov 2025 19:30:07 -0800 (PST)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2a49db4a36asm4104108eec.5.2025.11.13.19.30.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Nov 2025 19:30:06 -0800 (PST)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Thu, 13 Nov 2025 19:29:20 -0800
Subject: [PATCH v6 3/5] media: qcom: camss: csiphy: Add support for v2.4.0
 two-phase CSIPHY
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251113-add-support-for-camss-on-kaanapali-v6-3-1e6038785a8e@oss.qualcomm.com>
References: <20251113-add-support-for-camss-on-kaanapali-v6-0-1e6038785a8e@oss.qualcomm.com>
In-Reply-To: <20251113-add-support-for-camss-on-kaanapali-v6-0-1e6038785a8e@oss.qualcomm.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Atiya Kailany <atiya.kailany@oss.qualcomm.com>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: r_wy4HqdXkOMTERQTcqD28398S3Hn6wx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE0MDAyNSBTYWx0ZWRfXxwczE7koL4Wn
 E0G1OkE4TQcMfC2m+eC02G/5K1fHLIKprBQidtLkZmOXwcl5MgTJ2tC8dJMDhJF9vR3z+KjqTqY
 hgW9IM+E8ri2X4zIVYg+KBeF0Xp9Os3PKmfF139B725wRKgGTbKA9n4z5ZLvog32HgQXV3eMxXZ
 k+zit0bFBL5MgPqesBPPtllsuDXHhBasnXiI4q3W3m7bU/33dKMw4/oUzYZ3UT0SrAE62V+Q6kw
 MrAnNJhDmX1yBcopkZaYq0AxlwzupEnHCzu3GFNirKpmUd3iiL4lxLfOrkPw5pWXo+7vQL3/SYD
 EakR8ADbvThcPUzuETCe5UGtNIysJ4fS/MBmw46fZfgD9HBrNQIfMH101lnyvyoNOtgvxCxbXJC
 MKa1pDik+bU/iKjxrGdIaOTpiu4xAw==
X-Authority-Analysis: v=2.4 cv=MNdtWcZl c=1 sm=1 tr=0 ts=6916a240 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=fxCOb-bM6HI3QnfcwHgA:9
 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: r_wy4HqdXkOMTERQTcqD28398S3Hn6wx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-13_07,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 priorityscore=1501 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511140025

Add more detailed resource information for CSIPHY devices in the camss
driver along with the support for v2.4.0 in the 2 phase CSIPHY driver
that is responsible for the PHY lane register configuration, module
reset and interrupt handling.

Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
 .../platform/qcom/camss/camss-csiphy-3ph-1-0.c     | 124 +++++++++++++++++++++
 drivers/media/platform/qcom/camss/camss.c          | 107 ++++++++++++++++++
 2 files changed, 231 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
index 9b6a0535cdf8..5499f4141294 100644
--- a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
+++ b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
@@ -588,6 +588,123 @@ csiphy_lane_regs lane_regs_sm8550[] = {
 	{0x0C64, 0x7F, 0x00, CSIPHY_DEFAULT_PARAMS},
 };
 
+/* 3nm 2PH v 2.4.0 2p5Gbps 4 lane DPHY mode */
+static const struct
+csiphy_lane_regs lane_regs_kaanapali[] = {
+	/* LN 0 */
+	{0x0094, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x00A0, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0090, 0x0F, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0098, 0x08, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0094, 0x07, 0xd1, CSIPHY_DEFAULT_PARAMS},
+	{0x0030, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0000, 0x8C, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0038, 0xFE, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x002C, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0034, 0x0F, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x001C, 0x0A, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0014, 0x60, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x003C, 0xB8, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0004, 0x0C, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0020, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0008, 0x19, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
+	{0x0010, 0x52, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0094, 0xD7, 0x00, CSIPHY_SKEW_CAL},
+	{0x005C, 0x54, 0x00, CSIPHY_SKEW_CAL},
+	{0x0060, 0xFD, 0x00, CSIPHY_SKEW_CAL},
+	{0x0064, 0x7F, 0x00, CSIPHY_SKEW_CAL},
+
+	/* LN 2 */
+	{0x0494, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x04A0, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0490, 0x0F, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0498, 0x08, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0494, 0x07, 0xd1, CSIPHY_DEFAULT_PARAMS},
+	{0x0430, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0400, 0x8C, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0438, 0xFE, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x042C, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0434, 0x0F, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x041C, 0x0A, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0414, 0x60, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x043C, 0xB8, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0404, 0x0C, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0420, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0408, 0x19, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
+	{0x0410, 0x52, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0494, 0xD7, 0x00, CSIPHY_SKEW_CAL},
+	{0x045C, 0x54, 0x00, CSIPHY_SKEW_CAL},
+	{0x0460, 0xFD, 0x00, CSIPHY_SKEW_CAL},
+	{0x0464, 0x7F, 0x00, CSIPHY_SKEW_CAL},
+
+	/* LN 4 */
+	{0x0894, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x08A0, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0890, 0x0F, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0898, 0x08, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0894, 0x07, 0xd1, CSIPHY_DEFAULT_PARAMS},
+	{0x0830, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0800, 0x8C, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0838, 0xFE, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x082C, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0834, 0x0F, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x081C, 0x0A, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0814, 0x60, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x083C, 0xB8, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0804, 0x0C, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0820, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0808, 0x19, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
+	{0x0810, 0x52, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0894, 0xD7, 0x00, CSIPHY_SKEW_CAL},
+	{0x085C, 0x54, 0x00, CSIPHY_SKEW_CAL},
+	{0x0860, 0xFD, 0x00, CSIPHY_SKEW_CAL},
+	{0x0864, 0x7F, 0x00, CSIPHY_SKEW_CAL},
+
+	/* LN 6 */
+	{0x0C94, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0CA0, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0C90, 0x0F, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0C98, 0x08, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0C94, 0x07, 0xd1, CSIPHY_DEFAULT_PARAMS},
+	{0x0C30, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0C00, 0x8C, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0C38, 0xFE, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0C2C, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0C34, 0x0F, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0C1C, 0x0A, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0C14, 0x60, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0C3C, 0xB8, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0C04, 0x0C, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0C20, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0C08, 0x19, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
+	{0x0C10, 0x52, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0C94, 0xD7, 0x00, CSIPHY_SKEW_CAL},
+	{0x0C5C, 0x54, 0x00, CSIPHY_SKEW_CAL},
+	{0x0C60, 0xFD, 0x00, CSIPHY_SKEW_CAL},
+	{0x0C64, 0x7F, 0x00, CSIPHY_SKEW_CAL},
+
+	/* LN CLK */
+	{0x0E94, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0EA0, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0E90, 0x0F, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0E98, 0x08, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0E94, 0x07, 0xd1, CSIPHY_DEFAULT_PARAMS},
+	{0x0E30, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0E28, 0x04, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0E00, 0x80, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0E0C, 0xFF, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0E38, 0x1F, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0E2C, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0E34, 0x0F, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0E1C, 0x0A, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0E14, 0x60, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0E3C, 0xB8, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0E04, 0x0C, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0E20, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0E08, 0x19, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
+	{0x0E10, 0x52, 0x00, CSIPHY_DEFAULT_PARAMS},
+};
+
 /* 4nm 2PH v 2.1.2 2p5Gbps 4 lane DPHY mode */
 static const struct
 csiphy_lane_regs lane_regs_x1e80100[] = {
@@ -921,6 +1038,7 @@ static bool csiphy_is_gen2(u32 version)
 	case CAMSS_845:
 	case CAMSS_8550:
 	case CAMSS_8775P:
+	case CAMSS_KAANAPALI:
 	case CAMSS_X1E80100:
 		ret = true;
 		break;
@@ -1030,6 +1148,12 @@ static int csiphy_init(struct csiphy_device *csiphy)
 		regs->lane_regs = &lane_regs_sa8775p[0];
 		regs->lane_array_size = ARRAY_SIZE(lane_regs_sa8775p);
 		break;
+	case CAMSS_KAANAPALI:
+		regs->lane_regs = &lane_regs_kaanapali[0];
+		regs->lane_array_size = ARRAY_SIZE(lane_regs_kaanapali);
+		regs->offset = 0x1000;
+		regs->common_status_offset = 0x138;
+		break;
 	default:
 		break;
 	}
diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 658d9c9183d4..b12e79e40e97 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -34,6 +34,111 @@
 
 static const struct parent_dev_ops vfe_parent_dev_ops;
 
+static const struct camss_subdev_resources csiphy_res_kaanapali[] = {
+	/* CSIPHY0 */
+	{
+		.regulators = { "vdd-csiphy0-0p8", "vdd-csiphy0-1p2" },
+		.clock = { "csiphy0", "csiphy0_timer",
+			   "cam_top_ahb", "cam_top_fast_ahb" },
+		.clock_rate = { { 400000000, 480000000 },
+				{ 400000000 },
+				{ 0 },
+				{ 0 } },
+		.reg = { "csiphy0" },
+		.interrupt = { "csiphy0" },
+		.csiphy = {
+			.id = 0,
+			.hw_ops = &csiphy_ops_3ph_1_0,
+			.formats = &csiphy_formats_sdm845
+		}
+	},
+	/* CSIPHY1 */
+	{
+		.regulators = { "vdd-csiphy1-0p8", "vdd-csiphy1-1p2" },
+		.clock = { "csiphy1", "csiphy1_timer",
+			   "cam_top_ahb", "cam_top_fast_ahb" },
+		.clock_rate = { { 400000000, 480000000 },
+				{ 400000000 },
+				{ 0 },
+				{ 0 } },
+		.reg = { "csiphy1" },
+		.interrupt = { "csiphy1" },
+		.csiphy = {
+			.id = 1,
+			.hw_ops = &csiphy_ops_3ph_1_0,
+			.formats = &csiphy_formats_sdm845
+		}
+	},
+	/* CSIPHY2 */
+	{
+		.regulators = { "vdd-csiphy2-0p8", "vdd-csiphy2-1p2" },
+		.clock = { "csiphy2", "csiphy2_timer",
+			   "cam_top_ahb", "cam_top_fast_ahb" },
+		.clock_rate = { { 400000000, 480000000 },
+				{ 400000000 },
+				{ 0 },
+				{ 0 } },
+		.reg = { "csiphy2" },
+		.interrupt = { "csiphy2" },
+		.csiphy = {
+			.id = 2,
+			.hw_ops = &csiphy_ops_3ph_1_0,
+			.formats = &csiphy_formats_sdm845
+		}
+	},
+	/* CSIPHY3 */
+	{
+		.regulators = { "vdd-csiphy3-0p8", "vdd-csiphy3-1p2" },
+		.clock = { "csiphy3", "csiphy3_timer",
+			   "cam_top_ahb", "cam_top_fast_ahb" },
+		.clock_rate = { { 400000000, 480000000 },
+				{ 400000000 },
+				{ 0 },
+				{ 0 } },
+		.reg = { "csiphy3" },
+		.interrupt = { "csiphy3" },
+		.csiphy = {
+			.id = 3,
+			.hw_ops = &csiphy_ops_3ph_1_0,
+			.formats = &csiphy_formats_sdm845
+		}
+	},
+	/* CSIPHY4 */
+	{
+		.regulators = { "vdd-csiphy4-0p8", "vdd-csiphy4-1p2" },
+		.clock = { "csiphy4", "csiphy4_timer",
+			   "cam_top_ahb", "cam_top_fast_ahb" },
+		.clock_rate = { { 400000000, 480000000 },
+				{ 400000000 },
+				{ 0 },
+				{ 0 } },
+		.reg = { "csiphy4" },
+		.interrupt = { "csiphy4" },
+		.csiphy = {
+			.id = 4,
+			.hw_ops = &csiphy_ops_3ph_1_0,
+			.formats = &csiphy_formats_sdm845
+		}
+	},
+	/* CSIPHY5 */
+	{
+		.regulators = { "vdd-csiphy5-0p8", "vdd-csiphy5-1p2" },
+		.clock = { "csiphy5", "csiphy5_timer",
+			   "cam_top_ahb", "cam_top_fast_ahb" },
+		.clock_rate = { { 400000000, 480000000 },
+				{ 400000000 },
+				{ 0 },
+				{ 0 } },
+		.reg = { "csiphy5" },
+		.interrupt = { "csiphy5" },
+		.csiphy = {
+			.id = 5,
+			.hw_ops = &csiphy_ops_3ph_1_0,
+			.formats = &csiphy_formats_sdm845
+		}
+	},
+};
+
 static const struct resources_icc icc_res_kaanapali[] = {
 	{
 		.name = "ahb",
@@ -4308,8 +4413,10 @@ static void camss_remove(struct platform_device *pdev)
 static const struct camss_resources kaanapali_resources = {
 	.version = CAMSS_KAANAPALI,
 	.pd_name = "top",
+	.csiphy_res = csiphy_res_kaanapali,
 	.icc_res = icc_res_kaanapali,
 	.icc_path_num = ARRAY_SIZE(icc_res_kaanapali),
+	.csiphy_num = ARRAY_SIZE(csiphy_res_kaanapali),
 };
 
 static const struct camss_resources msm8916_resources = {

-- 
2.34.1


