Return-Path: <linux-media+bounces-52156-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IMukOMqagmkzWwMAu9opvQ
	(envelope-from <linux-media+bounces-52156-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 04 Feb 2026 02:03:06 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 86504E03AD
	for <lists+linux-media@lfdr.de>; Wed, 04 Feb 2026 02:03:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AF41930E3B47
	for <lists+linux-media@lfdr.de>; Wed,  4 Feb 2026 01:00:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8ACC156661;
	Wed,  4 Feb 2026 01:00:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SFsNTKZ1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZoM/15XE"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FE3423EA83
	for <linux-media@vger.kernel.org>; Wed,  4 Feb 2026 01:00:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770166810; cv=none; b=UyM33T22d3FJHZh+krKZJE5XIvd4SSKjnvcQ6fx2jRzbZXs9CO8PAsvghYvqnvcIGy+QXe5NZJitsSkQtiUHig1gjC1CmIqHESvN7PQ1vGTkK7V9vIRIpRD0gcCSBpqz26DqBspaJAcGvZm4MN7QWSF58qWJfGRxD1t+linzMsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770166810; c=relaxed/simple;
	bh=8xvpoZBcwaB5XEQ8fd9wbf7am8qskE/GNdqJO+VC6E4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Vldyag23YI8cLTAs4o28gJjXRvUcs1GVTG9eSUEGvviidXd1Dr3zu2exqQOGL4mls1SgiVVBIm/zj6brvHrjfIQLaMCPNmdEbcA/5xxMJ4aPPyFGWZniDZwwe2+zZMzGDq0apeJj9ZKhlvm0f6q0+EzatAPiHhHMgysEiSPC490=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SFsNTKZ1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZoM/15XE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 613Im0PM3337303
	for <linux-media@vger.kernel.org>; Wed, 4 Feb 2026 01:00:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ce+ofkwDb44AUy52OKXawE+oRbp/+IIXGPOlNxXAeT0=; b=SFsNTKZ1Sg0jUIYm
	ces9VYwnnTdfuJQxsso2STOuEIEG6eLIfZ2XxUtks4PDNrC9YAKhzgzT0alxdLzs
	8yA0kiflHcseX6Rc+NMMQr94Ji7/offHlcdIAM5ZunpXQciJAYpzB966lEx/3rk8
	3JvZLQ5szTZ9o6V7Ny3Uc39Pgp1ZeK0c4JFGjOQH7d4416/CZJ8wW4cxDYhQwPAm
	swh20HujtkT+JQbui6PRq23d3ycPemLbeUgEoJKid8r5NhY61QQ4rbo31+sMp0Fb
	ouXWkhPkxYIri3PMGyXwOR5oaX+CMGEFADjQhNowMBDbvJcOkE/ICgij/nETWCkX
	ezCTsw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c3gewaegc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 04 Feb 2026 01:00:07 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c71156fe09so560957285a.0
        for <linux-media@vger.kernel.org>; Tue, 03 Feb 2026 17:00:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770166807; x=1770771607; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ce+ofkwDb44AUy52OKXawE+oRbp/+IIXGPOlNxXAeT0=;
        b=ZoM/15XETkdhiwmkI5qvzA14cqs5089ZThH18Z0a5L7+MjrSEffnxEoQIEM95Hh/U1
         O0NteDUasbCjFVDH2/W1Nu4Xy2cf1p+MVJyVpCj6S2r6G+KWNIImyWkSLVC0lrGO6Phv
         yF4ygcAmvRSradBBOLSt/ssJDAZUakOnD7KJVHHlFw1sqGn7Uvp/Nwn3z0SPA1wVxgr/
         AUKQXco7eXL5v5g8QTQ6z1XDIXHYexVKAjn1nnzBqlAh3TqgbIWs3/oK17exztGmbj8F
         bQDD3gYfcDYvVwnMqe1CmMewXIkRggdu8YfsI8vk+7Lm+oLhigcaJSKW6R4+zSdr2j6N
         L+Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770166807; x=1770771607;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Ce+ofkwDb44AUy52OKXawE+oRbp/+IIXGPOlNxXAeT0=;
        b=e1p5U8w80S52+BABf6PfgmJ0ZDniD6HHigqdKubtkzHdZPE/SIVSj3Uecehc/9S1Nq
         XYaYQMt5EN42rL066wQC5/DXBudjuzFIM1zI+5N8KGYLMxbjotxI/rsjWA3iCzgs0qLJ
         Xq1SffuNdbYj5+324U2NWOI0qWHkO/mDkEh43L2ceFp3pWY1IfTe9hHdCma2fNqnuVH5
         jgST5B5e4TpaHstnEXzt15wLSBuSUt8YnA7YPI/ZCRAV1Od+PYKnTlVduioiSJa0zlmR
         f9NNzBSpPed//iKjltnhJVXmS7GYpRZy7VlxVOGREQP3i1Pzos8/o8ukOlCFceaJ7iXc
         lTAA==
X-Forwarded-Encrypted: i=1; AJvYcCX9lLzUIJlw/4i7gE+SM0WhMKeq0z1qf/DBhTBE9031sKh6IHm3ndjHy1MStEjgpd5lF8cc6FednmwabQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzNL1Vth3K1JewhHJ9dgcvpYjiez1LHazgtk/l1Jw5hQ7O/51cl
	GcuDz4nsDW1dEbxcbByuk8ftsM9xcH0RPJ4yz307O9v1APuB+RkCwzxoh/laowdeL2hoaRsJuWu
	DCnW9fk2GjfVWN371DMBkATddfkFkENKsI7ZMCZrsTHcgknt1GYCgTROcAR5tI22xDg==
X-Gm-Gg: AZuq6aKWOsLXZXKXOy5MonsEo20y+Tp508BoyZeCNlSsT3EbduSBEDHyhSgpBE1DY5Y
	YnETRjFhbz1P/Xn2vwRtj0ATmMu181MU4GFyEraetpXo7RmMiEyJ3qH/6I3XqYWVAigNkUBn9TD
	DwEAJC+dJKnGs0J4SYUPjG/FZe9riA71SZ8je1QL9nGT5Irre9fJqN3YJwuEoDqPnBUWBnbqFYo
	iYD/yJruWEnZgnOprg4/FfYCDAgRAPHzTroQH9Ll4ndOAapxbadlr02vWf/ddM8SYwkWYTYnS0M
	jOWpLTLkTgUApTjPeNuXF1Ow2T2VwbwvWtgEa0oT1b4hYJQWznk8m2nBf4C0n47Jc8HY/tk3S/i
	WdgE1Zpo0vt5k3sMnwsgtEWJ2IJ6Xq+BuA92uQa1N19pl3BjSCCEnztuViCGxSUlz+EuxuyPe4R
	NwQTP+sDiVfzsQZPIr5lxR+DU=
X-Received: by 2002:a05:620a:d84:b0:8c7:eb5:8528 with SMTP id af79cd13be357-8ca2f83a844mr199417085a.1.1770166806444;
        Tue, 03 Feb 2026 17:00:06 -0800 (PST)
X-Received: by 2002:a05:620a:d84:b0:8c7:eb5:8528 with SMTP id af79cd13be357-8ca2f83a844mr199411585a.1.1770166805883;
        Tue, 03 Feb 2026 17:00:05 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e386ff563sm253405e87.1.2026.02.03.17.00.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Feb 2026 17:00:03 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 04 Feb 2026 02:59:54 +0200
Subject: [PATCH v3 6/7] arm64: dts: qcom: sm8250: sort out Iris power
 domains
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260204-iris-venus-fix-sm8250-v3-6-70fa68e57f96@oss.qualcomm.com>
References: <20260204-iris-venus-fix-sm8250-v3-0-70fa68e57f96@oss.qualcomm.com>
In-Reply-To: <20260204-iris-venus-fix-sm8250-v3-0-70fa68e57f96@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>,
        Jonathan Marek <jonathan@marek.ca>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Dikshita Agarwal <dikshita@qti.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2281;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=8xvpoZBcwaB5XEQ8fd9wbf7am8qskE/GNdqJO+VC6E4=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpgpoIiliQCHBS41LWbVO46HJ+9YkHzvwGO0Ae+
 y2qqPQY3k2JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaYKaCAAKCRCLPIo+Aiko
 1dGIB/9P+DKxN07RhkSeeARLygGwsImpsDAmJNjA2+sl733FQDQbzPnFiHIz4y7qztaU+XY1D0X
 CDkPkOvQTMldVT0TEVjeta63QPY8pyDC9Dx1WXmQXlN84XLGqMlBEU5H69t8q5yisvKD+Y4Q19a
 a9cAyTA8+1S9+u2jnQMDG767zVJ1Em24d7zR+e+N2H3uhEX57nP4rvylviZ39ylCxtWnq77sGd9
 eyWODvJTQuTu+ehnbREiKqBfKCWGGig2lWrlrWAFg2Oq08nGSXioYx6peYAzi3elOgPsr4iN0Ve
 u9UcBJeoACWx9TVvv68mdhAWXgUP+zZ+wWgwHQnf8zG+AE+8
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: DQOe35LXsLjkL_pPwJaW7qO59RAY1CgY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA0MDAwNCBTYWx0ZWRfX/akxuPPFA8qd
 au8yZQWzKXWKtW6xTpuB8Yvmtj9u15I3SsCKNt1KOdE99hlhkvtZgIFWFYCVGOzGyxoDuySywzG
 2EaDQkOdWRDYBEZubpFEAap0ZlWtMukP0Z4ZFoURmpy7oquph+2rxws4PmhW+OcgUEDkD/N+ap6
 oZQOuFJzlZA036xFDHht9W5+kP4yJ6fh5tVLI2OxCn/KWKZzYh+tcWIkXuW99cVnXvI/CzIV90Y
 MdgBHvnq908GI1CjE6LN9LSt5lCHugf0BRmcptg6vC0kwY7zUESp4fcDE9LPzYh9YMYCkEHD6z3
 FhdUuBAJZRJiSDib6tkXV/ZCtYDhHOtWVn9CoTD4GJV/YAr3ZuhI+dXyeMQvBZUaSzbv6tR7ttZ
 RHmKvDjbnPqpC9J01hc+J1xvQtWSoL4UAOIyR5DW8jt057o/auZKGgO4UkYA9B6dn3k0U8WUcZG
 3M0OEBrEajPgKVXAvbw==
X-Authority-Analysis: v=2.4 cv=XI89iAhE c=1 sm=1 tr=0 ts=69829a17 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=tBOqMctlXquWO7Kigf0A:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: DQOe35LXsLjkL_pPwJaW7qO59RAY1CgY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-03_07,2026-02-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 suspectscore=0 phishscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 clxscore=1015 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602040004
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[29];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-52156-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,aa00000:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-media,dt,huawei];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 86504E03AD
X-Rspamd-Action: no action

On SM8250 Iris core requires two power rails to function, MX (for PLLs)
and MMCX (for everything else). The commit fa245b3f06cd ("arm64: dts:
qcom: sm8250: Add venus DT node") added only MX power rail, but,
strangely enough, using MMCX voltage levels.

Add MMCX domain together with the (more correct) MX OPP levels.

Fixes: fa245b3f06cd ("arm64: dts: qcom: sm8250: Add venus DT node")
Reported-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 20 ++++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index 980d6e894b9d..d8be5c1add1b 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -4321,8 +4321,12 @@ venus: video-codec@aa00000 {
 			interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
 			power-domains = <&videocc MVS0C_GDSC>,
 					<&videocc MVS0_GDSC>,
-					<&rpmhpd RPMHPD_MX>;
-			power-domain-names = "venus", "vcodec0", "mx";
+					<&rpmhpd RPMHPD_MX>,
+					<&rpmhpd RPMHPD_MMCX>;
+			power-domain-names = "venus",
+					     "vcodec0",
+					     "mx",
+					     "mmcx";
 			operating-points-v2 = <&venus_opp_table>;
 
 			clocks = <&gcc GCC_VIDEO_AXI0_CLK>,
@@ -4348,22 +4352,26 @@ venus_opp_table: opp-table {
 
 				opp-720000000 {
 					opp-hz = /bits/ 64 <720000000>;
-					required-opps = <&rpmhpd_opp_low_svs>;
+					required-opps = <&rpmhpd_opp_svs>,
+							<&rpmhpd_opp_low_svs>;
 				};
 
 				opp-1014000000 {
 					opp-hz = /bits/ 64 <1014000000>;
-					required-opps = <&rpmhpd_opp_svs>;
+					required-opps = <&rpmhpd_opp_svs>,
+							<&rpmhpd_opp_svs>;
 				};
 
 				opp-1098000000 {
 					opp-hz = /bits/ 64 <1098000000>;
-					required-opps = <&rpmhpd_opp_svs_l1>;
+					required-opps = <&rpmhpd_opp_svs_l1>,
+							<&rpmhpd_opp_svs_l1>;
 				};
 
 				opp-1332000000 {
 					opp-hz = /bits/ 64 <1332000000>;
-					required-opps = <&rpmhpd_opp_nom>;
+					required-opps = <&rpmhpd_opp_svs_l1>,
+							<&rpmhpd_opp_nom>;
 				};
 			};
 		};

-- 
2.47.3


