Return-Path: <linux-media+bounces-64955-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id aWXkF92TMGqfUgUAu9opvQ
	(envelope-from <linux-media+bounces-64955-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 16 Jun 2026 02:07:57 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id F232568ACCD
	for <lists+linux-media@lfdr.de>; Tue, 16 Jun 2026 02:07:56 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=hbYRMHxY;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Dv7W3rby;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64955-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-media+bounces-64955-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 24310303B3E1
	for <lists+linux-media@lfdr.de>; Tue, 16 Jun 2026 00:06:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8F9513777E;
	Tue, 16 Jun 2026 00:05:42 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAB1223C512
	for <linux-media@vger.kernel.org>; Tue, 16 Jun 2026 00:05:40 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781568342; cv=none; b=oUd7TxsZUM0coM3lqfkdZ3Fq2tSAielrrnAj4EQxa9kytXvCI/EVPjif3tc9V6FMWqnMEi08YiCLFFcNzj/JNTvfOwkLz/HPe40FMzZEcJRYviGIpSK2EzsSk8xTUbwQtKl4yCNaoRbMdOCKAZrk6CnBxm8DOs/G9L7WAuJU55I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781568342; c=relaxed/simple;
	bh=bBMr05z3+hZKyiKnqtJur9lg4bNIQFaGUAfGEfPWSb0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fIa7K/WN6FLElsQITGU3Q7ArFgfC7fI/34zrUDT4ZFKpQUw2cbBGg64cAFl0bgpTaPxVGHgKaYXYrg5suACyToOnAib5H2kNKW8FPKy9eN5mcxJ2x/w3stsY9D6cXwHXBHd/A0T5SUTwN21eqJFPAYSkA/CefVESbjKi9vXWcv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hbYRMHxY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Dv7W3rby; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65FIx1dQ883806
	for <linux-media@vger.kernel.org>; Tue, 16 Jun 2026 00:05:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AWJObvt7y+kbPGRMk8Pkpq/KWzg0qp4Ve45uTUJVorU=; b=hbYRMHxYe02vlCT0
	X1snr0Mh87ob7zj/yEWy3In1nCSZpwCIeboJPPLhf4sGV4h3/Oa0IMbMrDaUAQWP
	jp9zSmbFz1PibTYAZaPh+1pTGQO4Y8jlYSfKNf0iBaDjQRACD4mKOCqgNJbJAw1G
	Vsb1Rso3nI8MAjDUV4x2xWl4pYAE2OkJ38l0VUnpHHeWpJNvd4n3Ykce6PLfUEA7
	sjQxuBpFBewvhsad5Y0KfNg5iavHT/RpjQVUjq4+JiLFsqrHgUBBpMaOW7txnQxS
	mfQgGp2YoM8R5pLSHNSv+J4zVcuue5VDuT1tvacYF7l//1jf9PKpCTfP0vO3Mw3b
	P3MgQA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4etfa73m6y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 16 Jun 2026 00:05:39 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-9157db42dd8so741407785a.2
        for <linux-media@vger.kernel.org>; Mon, 15 Jun 2026 17:05:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781568339; x=1782173139; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AWJObvt7y+kbPGRMk8Pkpq/KWzg0qp4Ve45uTUJVorU=;
        b=Dv7W3rbySsPoSONWjBsPhmVYXs0exN5NoUFnVjNzhI736GroNDAYLQojEvbm5H43No
         0G2ZopllZqdgSq+H0u648/O+53dAch2IMG7+bTBpqSd8Nxa3K7ySxjIZqAD2G+RAnUIN
         y99vTJKEMyj7viQTNwBQC3TFzktab2VmSxsN/Uc/Y3T/cIhuGVtVDD+Ake0PsJptbrxL
         usAR2QMgK/d0F6Dm/dVkkBeQM+VZPHPDVsnXV8CCRYDm1ij1HTgaOkaT3elaOQgcF8ix
         oSb/oYGPxaBjbYl9XNrCw77pThYafXQByyMYBxVuO1QnBGxz1qRQj0JTDxG24S5hVapg
         ZP0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781568339; x=1782173139;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=AWJObvt7y+kbPGRMk8Pkpq/KWzg0qp4Ve45uTUJVorU=;
        b=HXPSVb8FvGAGlJUnziek1csQzOm0Eqv6CaRmkFq/YgGBA28OeSMZ4ER6LHOexVYky2
         Kax+2d7aeo8BtwxKb6WeMUABATBP+2qxDYWQDsY31NzgRyb48v6wRrTvCa4A/K5wg+AC
         xGIG17aATbIsubtWaICWUCahcsEcOYprUmgDZuyOo5u/mIBIO/7V1BScgYpzJzCesbKN
         XXCp/itT1BYdcudIxK23qhidWh2pH/PnjXqtok+azrex5ziLtoL7DBpT6zXK28Cn2zXs
         +bkickh3uRJfsHAaaGWtq90ohEHsA2qdB6dQOyAflQE/AvEuLNvQSbS7MMDIqApoCjou
         tdtQ==
X-Gm-Message-State: AOJu0YxZAr1PF0bwfHaZ6UTRDo2PiUJTRQCnfaiApMoezBgLVaT0w5Qk
	n7vVtam4NmHm7wX97cnnQASBmphNBb1Rc06VrxO0UKyhij8p6/RFMI9rNHo563aN7WKniRcE6bm
	Noyx/T2mOK/QPE8oqPZ+hr9aTblfFq8+0sTALzOUzdyWHAwJhm7IPTWNh/Nc9IpEAGg==
X-Gm-Gg: Acq92OGX//2vEatvYaLk42SjPbxVHXgB/pozmu3S5hCjsUuhmMOGd0sXyez6IYnNzJc
	UDkK59kRoPdn8FJZqxEIooQ9OV5yoKl+77HH8dLCWGT6fwF6DmceVoKm0wURUWdzSbgp1oKgHAz
	22XLOdwdufiT7RKiSJBCBI+cSCYpm+NMn5PO1yKx+22TnpQWga+WvqhqZ1Se3cX/C+Ir0nSJ4kO
	4brjAVncjqbtoQeWzQnR42of2IzwBuy4IB+kDiDtdI9keKWUZR6rBnKCkfpy4C104gw6edfO/Lq
	+ZM1zQTsxPtJ6ZWQcQoxr/l1vcSvsAd5rFoolT/LeWNCbBolxKyiJMRX96KHzuyWgtnSYDXRrcP
	aftMKywcJ19D8+HrFbeywrxbCZxsbnIqJwvTVkl78PhtyV7TGVZ5arGEEmGcv0CRaV2r9sOuPM1
	51+PIjxAgK7KadhzoHLyrEni2E1KjLf4Jbx1o=
X-Received: by 2002:a05:620a:2992:b0:915:86a4:6691 with SMTP id af79cd13be357-917efbbd2d6mr2192262285a.4.1781568339026;
        Mon, 15 Jun 2026 17:05:39 -0700 (PDT)
X-Received: by 2002:a05:620a:2992:b0:915:86a4:6691 with SMTP id af79cd13be357-917efbbd2d6mr2192258785a.4.1781568338659;
        Mon, 15 Jun 2026 17:05:38 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad2e1a7092sm3015731e87.50.2026.06.15.17.05.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 17:05:36 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 16 Jun 2026 03:04:42 +0300
Subject: [PATCH v5 15/16] media: venus: skip QCM2290 if Iris driver is
 enabled
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260616-iris-ar50lt-v5-15-583b42770b6a@oss.qualcomm.com>
References: <20260616-iris-ar50lt-v5-0-583b42770b6a@oss.qualcomm.com>
In-Reply-To: <20260616-iris-ar50lt-v5-0-583b42770b6a@oss.qualcomm.com>
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
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqMJMQ9jyjI0xtGZm9mkeQcVIITP3V5I9BWIzP2
 B+zypqYjDCJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCajCTEAAKCRCLPIo+Aiko
 1ckNB/9gQAoQXZ9c6otmE0V8YpLudu7XUS3NIMxAZq5Vra5YVT7sFL3y94zeBvMGRjioKK5ssTy
 O3Ty2uYR1qpZnWqZnDR261US0PDhbZ0kZyOUvxhoM3FjqvdpM9SOLKimUsyPQvdt7EHnavWdd9v
 pAkFOweeYp4QzGwT6LGBE//jSLILvsDSltX3AVoR+g63mA3WkKCoFAr1RqkrCHlQ5h8uwgR4Rrv
 mGBHpbpQT0vb86PPXdvYYzB3mM29lxjD794q6EprPbEWqtCwYDrYY5Ic1M3akqdjY0kNlaFsx6q
 0gemNMP79cm8yuXiuSwwySiJcG1vjQM+iWbkwZoL8iAbci+r
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: r_b1HICYgRMdBBYSNWz-cRcpI64MFjBN
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDI1NCBTYWx0ZWRfXyePQiEuMC76Z
 y+usI6OBfx9e0/J8rawmRA2keSwuXfH+Oku0wUlI7KSPQLPid0+0PS2GchI7rZnmMdV7Vllwgy1
 g2eExiCirtdOh0ON2DwgxjWnLmrcYJs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDI1NCBTYWx0ZWRfX7X7ItYrOgUIK
 aw9pu/crAPt/YCtIO/fSFdcbC0GXQEZhgL/EAqK5Zfm8Vw4jhI1pH4DKcaCC+UbAUEYs/HKCDf9
 kUJY0mqXW9rdE8/BM82Kqcnse3WBS7PO9HZyajgY99P3KuC0/Quce9LIe/M2osMSfv3rB0+BnZb
 Rac3ibeugWgTkcq56bwWBbSQ1MQrPajRa71/R06bpiBbPmO6edsWDW0Z9uSP2klJiL+4HL2sONW
 YDPys+aVn/xG48IVRnfIo5Wf7zKwJdjti5TP7gCUxpPp+lWTF7727YqcPJDxPwjo3G7DoqPl6O+
 3sHQDmfpvWac0ThdXD8WzFSXpKPtoWQ1WXaS3wFgbP169MPNz4/K+et5MkzxCYDxNpQlsD9nLHR
 13+azgmXtTRopYw6jDTChBBwSjIsPNL1RIRRcO1uv/QJrQA8BqtrpvErZ9hOV0Ir+tW+US+ItKj
 WO9qBkYsE/gTXjEAoww==
X-Proofpoint-GUID: r_b1HICYgRMdBBYSNWz-cRcpI64MFjBN
X-Authority-Analysis: v=2.4 cv=AN2yTM5Z c=1 sm=1 tr=0 ts=6a309354 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=TAcc6fXARiqENDJ69lsA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_05,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 phishscore=0 adultscore=0 malwarescore=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606150254
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-64955-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:vikash.garodia@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:mchehab@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:busanna.reddy@oss.qualcomm.com,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:dikshita.agarwal@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F232568ACCD

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


