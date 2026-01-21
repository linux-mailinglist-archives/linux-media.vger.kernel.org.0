Return-Path: <linux-media+bounces-51191-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MGS+B1OKcGkEYQAAu9opvQ
	(envelope-from <linux-media+bounces-51191-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 21 Jan 2026 09:12:03 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id C540B534B1
	for <lists+linux-media@lfdr.de>; Wed, 21 Jan 2026 09:12:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id A4B6D7A1D6F
	for <lists+linux-media@lfdr.de>; Wed, 21 Jan 2026 08:07:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93DC8428821;
	Wed, 21 Jan 2026 08:06:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kTgQSGWN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Vdr6x9VB"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 502A726B2AD
	for <linux-media@vger.kernel.org>; Wed, 21 Jan 2026 08:06:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768982811; cv=none; b=TVap+90Ag8n25jEzJWcVgp9lXsbOl14pog19+b7OiMjHI6FHacnHTHGptvtTnbVcJ5/ct7DuYCS6ex/vH9I13hBgT1N+eAdCg3h6iSQQ/oUCjKjQcYR0Dbk4FMGlr5KhhNfD5BpjW7RrY4QAQqijO1BHxSEpGeQxK4bc4Tpkv3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768982811; c=relaxed/simple;
	bh=O3AFV4Nn75qxYOSZ8fhiivu+lxVATfmPZpa/iBeafE0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ARVLknL33KDYCY1UIBxv37j9eBtHn1sESg64Udn1XByHh8Zuz4V+9k9YNiMSt0SBNPE2TfhwBB5mRH15Ur1/TaF2dvj0qH3wTD67oqpgK26kxBfcM/Lo8azn65eon9KIF4nXzVKSHo+Tp3Tm68mCy7llel5P6wkn9StH82oOB1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kTgQSGWN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Vdr6x9VB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60L2g3jf824254
	for <linux-media@vger.kernel.org>; Wed, 21 Jan 2026 08:06:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UQeY/NRPZXEPxT2e6FeLHC+chfabLTfPGt+A9FN6JW4=; b=kTgQSGWNX7IzpFwJ
	P7rJ02Jyuonejn+cdZJY5f4LtFct8hNra4MWDc3NIvMklDTTbu7EkI0FMZnUdJn4
	MplGpBzrD88U/9ipU2kKuMzcQ2zJdXJAun+eftqQe9lh/y6YIgZAsHKT+eV1zvBL
	YfKQLYv91zevI9JNpeYz+8SXKnEi8NPnOKBsbvW0UZEOHxqfJ0EgSqoEjiE/Jyb/
	fgkM2x9rtpnAo38RvEuEDA3g2MLqlTdiDbPz3/5zrVX8I5TQiRZfixeS/q0ukrSE
	IHlAACFP/pvJw6qJji4MVQqbK67HKhT7MiDtmNCSo6QtN6t2X/+Fk6oIF0edmE0m
	jVsw0Q==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bte5e2tyb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 21 Jan 2026 08:06:41 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-88888397482so169756536d6.1
        for <linux-media@vger.kernel.org>; Wed, 21 Jan 2026 00:06:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768982800; x=1769587600; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UQeY/NRPZXEPxT2e6FeLHC+chfabLTfPGt+A9FN6JW4=;
        b=Vdr6x9VBm1HqiAhQ4Nw3Y5VmiaBVjJHfNolpBT/dEi8S6uHEmPcbFsoWsxiTPQA8gf
         B9V+7M3NHn/m9DghK5hw3v0FqXLRLC3qN29IiTYFPOcnMCjeGhAa28oPqBFG2Znz2qof
         6IpvZpfXBOQ0NfCSVMTiU5ZRN2iLd2v6sYxV/5eon3gdjd8IE2WnDUlikuDgFEbivONQ
         oaIVY+iC7oIilJNsUyDqF/+AP7mwkSAUTnmUNaKDowsWbVwH81STGhtb4fzxueNHE2Pj
         hYyMPRWmyVNq4j1/YqReCxOrrhJqD6TuPj/lD+RLLXou9dpOQL8c6PZ4A94lSFvgjw9+
         BgNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768982800; x=1769587600;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=UQeY/NRPZXEPxT2e6FeLHC+chfabLTfPGt+A9FN6JW4=;
        b=Qti6/SRN+Hi1s47ADKs8zo/drVEJ0FBpYDS1rKm3odZyA67CL0DCVN5gwa93lQSFFC
         j5fjs+kUTQE9tPc24yb0e/zbGWAJ0ZzTsm1eNcUzmxBr5eY+GcDvSTiLan4VHZGChYar
         3YEUBsBYkndVwWzEWnhunmiV2TrK2roDMNXNKCo8NqleowLMdjxGrDlIkBqaUFpIUWDp
         FzDOw1iOXq+bDMef+qx6+9+celeCjPdz2wY3veQUcMdthiD9cQ0Tjq+JcRPXwf8JFREU
         yECFF277cNqoD732X+9dG4vgIKxz64tH4nVe7JoSZ+y+5txl3IUyUqixh9+Sgpmdsp6r
         vGmA==
X-Gm-Message-State: AOJu0Yz4pV3iRt2UwLjJVSghKD5c3VIyRS65VrHIWvFGh+qB8d+MPpNn
	diH3rnq0NB/rzJn43Qg/x3XZXTr0CJS1ANqYigjp/DqxkLUVMDVDW9BsheeEku1CAsKZojgNHfl
	cH37t6hWCXTNQpoUwCUndaR14+La8i4ibtaTcHJ/TSaGAy6F+8UarY1Fu6YiomOR0dg==
X-Gm-Gg: AZuq6aKBm6QnlMFP2q3fEQdGJdbfXFrXNII6OJSDohwdqBToix76bfRQCTKPFm1GpAu
	VHwr79/5EtlarzJqYQue+kFP2/x75/sHhj23zb3deibSLM3cBSq7/lo2mMxgd3iKyCSiV0rsPUL
	h8uc1t99AT+ldpvRL4HBz+bI39XTN03/GRNg5log4fFibKMXuwi3yiUsFJKipJqoIdfB1IkfkiY
	ZgZal30ZD3E53vL1OtI87MmUVGjFsZWnmRDuimV/QtS/sz5gQwund3u9m0IfqWYzy2/QgUGH/hh
	rXfn18XLOVA2gTzt1YBe62D97SVWqYJ+KQdDjwAyyFPDoNv2hm6h7ESVKj6QET/dJPZP7/EUeke
	x+0Fz4QhjpG3lnTxktTYoZ3M7KE1gBDSU9XTXeZPynLIrbeKOS68bXIPqmWvk0AiZADDmHj402U
	AU
X-Received: by 2002:a05:6214:400c:b0:888:498e:5a3a with SMTP id 6a1803df08f44-89463d16ca5mr66290366d6.68.1768982800456;
        Wed, 21 Jan 2026 00:06:40 -0800 (PST)
X-Received: by 2002:a05:6214:400c:b0:888:498e:5a3a with SMTP id 6a1803df08f44-89463d16ca5mr66290226d6.68.1768982800039;
        Wed, 21 Jan 2026 00:06:40 -0800 (PST)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c6a71c14a9sm1203363485a.22.2026.01.21.00.06.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jan 2026 00:06:39 -0800 (PST)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Date: Wed, 21 Jan 2026 16:06:28 +0800
Subject: [PATCH v4 2/2] media: i2c: imx412: Extend the power-on waiting
 time
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260121-imx412-v4-2-f6bdf83f116b@oss.qualcomm.com>
References: <20260121-imx412-v4-0-f6bdf83f116b@oss.qualcomm.com>
In-Reply-To: <20260121-imx412-v4-0-f6bdf83f116b@oss.qualcomm.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768982789; l=761;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=O3AFV4Nn75qxYOSZ8fhiivu+lxVATfmPZpa/iBeafE0=;
 b=SkMVmwh7YS56JaZsT7G3vD48KJxVX1RGGHTIqsXyQdBBdRR+XDhrvNIZFuAn/uJjpdQu5HGX/
 Dpf5rutYZNZCHYggxgCYUw/n7h4EYscpUboYma5Zj3nTeKEjS8sxnee
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Authority-Analysis: v=2.4 cv=BKa+bVQG c=1 sm=1 tr=0 ts=69708911 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=fwpc4IpM0P9R8YQ-nboA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: cO_TiPXV_TMupCsU5nSg_u8208Prqvdo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIxMDA2NyBTYWx0ZWRfX9BNVH+qWZHau
 WS9ISMBci7DxuCjD43LlqnGEjQsdYs2+0zhan3g4m09JS7veitELyrNxOxe4GpnHsbOBTDpkU/1
 u3DqlNkbL4i4GWaCvaCop2YtBSUmbLJhWArh/iZ2FyCdtB1U6AEuybhB1coR7dGZZ5QPOaqazIL
 4Y1Te5XJYVKHw35wyHmQChT8uyav2LznUAnKY3eOTUJBKQkG9lEm8PEvxcvf1LCkKwz/sYFFsBS
 p1hEziaq3PW08UgDNAU1o9Tl93J88SAzE+AifR4K0zSOmGRwjsRdRVczymrgM4rXZQoX0ra6/dJ
 U6R+UJPuwoAU5MCY1rbhvkqV5c4CdUk8xNov01NHRGM825XWSAvPUQaKoQ9J5frJa4RVSA2CVHR
 jBRUnddaYk9vSoWI+pItiX0Fh2r/Smna62HiFi9OpnxnHtiCs6osroz1/Wh506NXXm+6UNZOpIE
 iHXon++BOlHgAQvjxiw==
X-Proofpoint-GUID: cO_TiPXV_TMupCsU5nSg_u8208Prqvdo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-21_01,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 suspectscore=0 impostorscore=0 phishscore=0
 lowpriorityscore=0 spamscore=0 bulkscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601210067
X-Spamd-Result: default: False [-1.96 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_POLICY_ALLOW(0.00)[qualcomm.com,reject];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-51191-lists,linux-media=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:7979, ipnet:142.0.200.0/24, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wenmeng.liu@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	TAGGED_RCPT(0.00)[linux-media];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C540B534B1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The Arducam IMX577 module requires a longer reset time than the 1000µs
configured in the current driver. Increase the wait time after power-on
to ensure proper initialization.

Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
---
 drivers/media/i2c/imx412.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/imx412.c b/drivers/media/i2c/imx412.c
index 5cb55deb125edb218779b076429f9fff93e11a08..38086b18743ae3b5d10c939b7f99c3e27e1f5d71 100644
--- a/drivers/media/i2c/imx412.c
+++ b/drivers/media/i2c/imx412.c
@@ -1037,7 +1037,7 @@ static int imx412_power_on(struct device *dev)
 		goto error_reset;
 	}
 
-	usleep_range(1000, 1200);
+	usleep_range(10000, 12000);
 
 	return 0;
 

-- 
2.34.1


