Return-Path: <linux-media+bounces-67702-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 8turF8eWV2o8XgAAu9opvQ
	(envelope-from <linux-media+bounces-67702-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 15 Jul 2026 16:18:47 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3706B75F477
	for <lists+linux-media@lfdr.de>; Wed, 15 Jul 2026 16:18:47 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=dCXW4hbx;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=b0kopuXM;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67702-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-67702-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3F5FC3092EB0
	for <lists+linux-media@lfdr.de>; Wed, 15 Jul 2026 14:14:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3597345BD78;
	Wed, 15 Jul 2026 14:11:47 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F99F367F45
	for <linux-media@vger.kernel.org>; Wed, 15 Jul 2026 14:11:45 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784124706; cv=none; b=IS2u+YhLSAFU9QYb0QDSQTo7j9w5aiNeulc2g52wQ/oYCeL3vHJbQxjvprIoi+NwoinD1HfFU8Lc6ZmKcVAbqrMuDbluATHIp/Ku6ez5WzXcJdtpOe8SnGlpFFGns9qBxWHwCEh/7Dtqw0fGrzIYjwWaXRLoKsqXq4J6R/tix70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784124706; c=relaxed/simple;
	bh=HKovxLVfXVSwQAXngyNlJki7rLoRBolhkZVsnfCS6gI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=L+AvhPqDFSp65pw7IMGd2arGrI1kUzfv9h8ci1K5DIFmq7bXK7pz4a/TEXOP0vGb5TZ/a4Ur5g5Q2bnceR1h2XQKvBr3H3NGi+Ap+y+9K0KKHJ5KStFHxjMd+gj/VT/GKguiUYA1nVXi4VdHcKhFafurWjHVlgXXZup5BB9DlD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dCXW4hbx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=b0kopuXM; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66FE3eSX3806424
	for <linux-media@vger.kernel.org>; Wed, 15 Jul 2026 14:11:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DQ47DDAfNPWgexHv1Ma19CgalnyaHgiZ1WcVnWQbsZw=; b=dCXW4hbxx4hC4ym3
	o2dppgNycVguLGhSpLiu8d4Th1o8MDTqko7B46IsiaQ2v3VxJj6p0Otj2oRbOZdt
	rYTKS0ZlbU9hOebV5QF49IlVgQBqKFIwio4vEgd7bg+QdkyvUBw51RlL83jAHfVC
	l6lOUhrivXTA2aqv2Nh2gj1B8/Jthmfk1w5lw/++zRwQtuZZsYioITf1piBBhKhN
	Op8sMZOrT2UfJwDD/82VMT/kYTSfFu5TnNihEGK6fQZmB6ATqPcZDjzdXRzJTv86
	InRyoyKnrkDE/cxtXd4SShaUqk2Ykae9LCwZmc8RYfoYXW0XX6KQ72XLgCq+1f3i
	sm6Dvg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fe56h9q0d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 15 Jul 2026 14:11:44 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ccd1958e8fso30542915ad.2
        for <linux-media@vger.kernel.org>; Wed, 15 Jul 2026 07:11:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784124704; x=1784729504; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DQ47DDAfNPWgexHv1Ma19CgalnyaHgiZ1WcVnWQbsZw=;
        b=b0kopuXMWh/qqcvsBMjkB94x4dGvZn8lYLxeT1Hqp/QeO+exz2K/Oczps2KwyE+C9v
         42Ert5wk9ZHDsYhr6bbZXfwGGtDlNgC1XiC0pzQyz56MokYgrZP9ucNQ1T5V41rNLIxL
         IQ82uVWXATwkcI9EZHs6gudxJdwHBjwniDf273J7tHdGLWqWiDKBafppovjh9Lj/W+4m
         uEMTT5TShkTEXtsDbhV2oVnMuDzHuvqhrXntpI0qf3jDKHKFtcXFZDSZ7RBuJt8dEzUB
         Iou5S9BFAjD9t0I+fYnHFz7GpXfTOqSLBeSMPNMa0vnsNJmkOHRGNU6I+rPoajylleCC
         1xPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784124704; x=1784729504;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DQ47DDAfNPWgexHv1Ma19CgalnyaHgiZ1WcVnWQbsZw=;
        b=TWAaoyOa2jAtplrtFGLHEkor5YeulVW2tdGYT1k3UsR0bmhvo2aIvMtJblA+1EIv7o
         ESe5czxw2vUyEZ5yrAzMngGHf0HqbpGT1aMEx9ZqOrzN9YV2LnnEBbNUlHDWtKeI8OG4
         H6oCxlfzMA1134PLoIKuAZjI8LylUcnNZ0yf+GJtlyNe2rrOM4VViL8JxjAEKKxAppYW
         FIc89B5bugeusK0/wxB251BBOxNZZDp5KOE4yJCBH5C8QJ58zeLLBL3Jc1a+6x2IFAte
         RPJtY/DkhjtOho/d7adC4wU5Z7a7s0T3emU8D96A8ONY6MaVpAWWMZ4NX5R57w7yguTL
         DcbQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp7rBYIzZCxYq0BkkDA06e0CIoqFUmgBePDegUgXbQ8Rw+O0n0b1g8xsyyi6cIEUR0uUvAVX8i5dlQ9ww==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9ZQ6ELHe4e1Sf6AYD7mCpeZQre89+ADjkgpLBapruCEw6uI9P
	wLtZiplhOrl/xWFKymnHbvwbDORpn/zexTU044ZwvVXeBkUHqyTXacJTQLhl9qLJJrU3nMRgEba
	Arxhe12KKRkJNIo7BMGt0ax4rQjss6m0MlpP5gca1sLq6KgpK3hrgz/m5NhPk5tVGhQ==
X-Gm-Gg: AfdE7ck6DkyaKeNFqeMsL1FqsEGZra1LKBsP7u9nLoIBHWZ8ei9cZ+IE4lidNGl650Q
	+jA0yuHA7L4s30nO2KnWwhe4Y4pcx+j4Ki0LHpHS9RE1ZNYjsOaqp29Om2xpvcodI6kW/30tIZ+
	hByX81ZH3EXLKggRqMhVru3sh4BcGdkTZm57Tl2JPKXjKs4F5OEoemxfHHuYxvm1v3/Z7y0fIaA
	av4bl6lmb44F1RXGPRImEyt4kwFRLP4HhLOZxQYMVYR4+gFMU2gnnBZ5oSBiZyXOUSmCGGrYf4Z
	zHiGoMPyTLR1XCD/ZsbLS8yyoh/0duk+xaSKKxQ/DXDHX2Ck4cATdNeiC63z7q83Ck96KsuoiFt
	8vu3xTwBzE8SgtrCluXK/GK5xWvguLp6EPAM15SIk6pdI
X-Received: by 2002:a17:902:db0b:b0:2cc:6b7a:dfcb with SMTP id d9443c01a7336-2ce9f028b80mr162598895ad.33.1784124703950;
        Wed, 15 Jul 2026 07:11:43 -0700 (PDT)
X-Received: by 2002:a17:902:db0b:b0:2cc:6b7a:dfcb with SMTP id d9443c01a7336-2ce9f028b80mr162598645ad.33.1784124703496;
        Wed, 15 Jul 2026 07:11:43 -0700 (PDT)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf1070b68dsm2913215ad.79.2026.07.15.07.11.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 07:11:43 -0700 (PDT)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Wed, 15 Jul 2026 19:40:08 +0530
Subject: [PATCH v9 14/14] arm64: dts: qcom: glymur-crd: Enable iris video
 codec node
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260715-glymur-v9-14-8cf2cbe12a07@oss.qualcomm.com>
References: <20260715-glymur-v9-0-8cf2cbe12a07@oss.qualcomm.com>
In-Reply-To: <20260715-glymur-v9-0-8cf2cbe12a07@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784124602; l=1011;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=HKovxLVfXVSwQAXngyNlJki7rLoRBolhkZVsnfCS6gI=;
 b=Yj06tNo9W4Sz5F9Y8NffrAmj+GAbIKN79t2NNC+0Y4uOLP55xyUcSy6bwfJTvc7P1yLclr8us
 u1O80vjjnzBAU1bFxQc8ueCpHZwWR0/+xWybbd3MF9B/1V6E7Pb58UY
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE1MDE0MSBTYWx0ZWRfX05yh67lac0sI
 i44iRiKB77LAs/GIxQsvNPlpcVoNjpvaSrO0yem4YKF09vSB7KJlqpTPLOo0R432d0HbJxT3BHd
 Dj7a2DCJ6u9w+Th0wYVVT8dB2XUyIFQ=
X-Proofpoint-ORIG-GUID: xKaR_JIV3g0KaXd6iaHK8J-ZcDO9wBNy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE1MDE0MSBTYWx0ZWRfXyqa/3lYYlUly
 Z4Qg1ZzyIdVXG7i5FY3vNgKorNMMrjJ/UzodmnOwLVbU51oVUJjdK1+Z5CCsJ86+d2Y3Mub7h5w
 8kuuCvBvtJmzNiXxDXLMtrARvQArCO48GEZST3b9ynzQTKKvRHD0LwsddljCM5+FUBI4mHcQ6Q4
 B55sv84ZazwDIsyjeJTg6jcZ9O8ncFE9cQQijyD+oVzsOs1eP8d4dG+/xAtxFa1zom32iL2s/4e
 Uweu7Jrwvau+MCREb9LAIbGoqn3GfwKUnClV6Ec6WV8F6ZgUMzaWA24cmg/1eMzmAfZuDoCUioO
 mqY/HwMVQRgytyu2y+utOPM6YbIY1dF0zM8lPQ+dXSqRLHc17jDbvVHn776I4zvPRsKdQ+unsW0
 qIOb6x5EATNWQhpY4CGIY9CvZ69OacgJ3gHxgJAtAAzLNT3SAcXxzdr8sUBVVXmyFGVG2i1xUrI
 kNkjLMpGfkaWyaFxaNw==
X-Authority-Analysis: v=2.4 cv=LpKiDHdc c=1 sm=1 tr=0 ts=6a579520 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=Dn0IJEph4XI5J7oltBAA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: xKaR_JIV3g0KaXd6iaHK8J-ZcDO9wBNy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-15_03,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 adultscore=0 bulkscore=0 clxscore=1015
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607150141
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-67702-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,linux.dev,kernel.org,8bytes.org,arm.com,gmail.com];
	FORGED_RECIPIENTS(0.00)[m:vikash.garodia@oss.qualcomm.com,m:dikshita.agarwal@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:dmitry.baryshkov@oss.qualcomm.com,m:mchehab@kernel.org,m:joro@8bytes.org,m:will@kernel.org,m:robin.murphy@arm.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:stanimir.k.varbanov@gmail.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:iommu@lists.linux.dev,m:devicetree@vger.kernel.org,m:busanna.reddy@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,m:stanimirkvarbanov@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[busanna.reddy@oss.qualcomm.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[busanna.reddy@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3706B75F477
X-Rspamd-Action: no action

The iris hardware block is described in the glymur SoC DTSI, and enabling
it here allows the media iris driver to probe and use the video codec
functionality.

Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur-crd.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
index b314c6dd423c..3ade94220667 100644
--- a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
@@ -695,6 +695,16 @@ touchscreen@38 {
 	};
 };
 
+&iris {
+	firmware-name = "qcom/vpu/vpu36_p4_s7.mbn";
+
+	status = "okay";
+
+	firmware {
+		iommus = <&apps_smmu 0x19e2 0x0>;
+	};
+};
+
 &lpass_vamacro {
 	pinctrl-0 = <&dmic01_default>, <&dmic23_default>;
 	pinctrl-names = "default";

-- 
2.34.1


