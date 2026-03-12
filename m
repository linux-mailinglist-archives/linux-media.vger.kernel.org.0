Return-Path: <linux-media+bounces-55507-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wPSEDEvZsmlDQAAAu9opvQ
	(envelope-from <linux-media+bounces-55507-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 12 Mar 2026 16:18:35 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id ACA2E274286
	for <lists+linux-media@lfdr.de>; Thu, 12 Mar 2026 16:18:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5843F30476A3
	for <lists+linux-media@lfdr.de>; Thu, 12 Mar 2026 15:15:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 024E53C9EF8;
	Thu, 12 Mar 2026 15:14:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gSJfS3z1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Sw3AjJCC"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01CE43C7DF2
	for <linux-media@vger.kernel.org>; Thu, 12 Mar 2026 15:14:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773328476; cv=none; b=TVSrxoNi0f+FPt4V5YmNfvyZBLGU4OK1LAI29xQaEA3Viix0wbnUjFr28wvU/cY7cKKwv3u5C2TsXYixXY1znzc2PzSU9WOCgD7dEGmQOYbpro+FHVaRt5IFyt4BaYs4xufM2fLcYGUqKq3QBLMgxM9P8H0/iHS/9iml9cejlus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773328476; c=relaxed/simple;
	bh=Swbs7XO5sQKOErneWVOVJFU1dqwYu2TZtbrUnvr0Jbo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=n994JBdbJRRkVdPZqKCP64Mmh2/HyHnfvkKnNKMIanP1Xmppem8xywuZaDcfJjPA3oDednb+/PVbeXTv0XVP8P8i2PJnku2CnBowpiXWlk6Ar8jlQfAU9+MrqbrJhzNlTEBhiVvvVmgqyGN2YGEvgSQOd3+QFSLCOYf1wqfwtX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gSJfS3z1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Sw3AjJCC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62C9tY4v4132977
	for <linux-media@vger.kernel.org>; Thu, 12 Mar 2026 15:14:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	s9wtogtLTVQ+JC6+U/vhw/2QiP0OXfBjiSPwSkvqrpE=; b=gSJfS3z14C3MSbp4
	LZ46X2YwZ5S403gqWL9oosxdwCxKmClm2+f+hxU3xLvMr2XG6l4al0wyI2VR5H7K
	r3Y1aO2SVhnTZ9XEG58c2EC2ewc/ECU5MiW9IQLPtVNqiQ7gb4qFGR/+iPK0LXDn
	rXlxok8M7pFXBxSD2bMnH1k99k6dccAuVrtf1DEhm3ibdwgiTzZF/JSxChZzMgmu
	MefICBHiebWixAO2pSgE0xWjjwqHjkmu076qyFlIuYwfsWEQMjP7Qrll8LdQ+Ygx
	4I8wZ5Bo+El2aNqSfD/2BoB9HrrGmHvQ6Dw7MS2pYRaJRxutnc0ZQkqBOC4NnhgM
	3QtZFg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cuh4w2hgv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 12 Mar 2026 15:14:33 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cd858e8709so1255410585a.3
        for <linux-media@vger.kernel.org>; Thu, 12 Mar 2026 08:14:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773328473; x=1773933273; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s9wtogtLTVQ+JC6+U/vhw/2QiP0OXfBjiSPwSkvqrpE=;
        b=Sw3AjJCCoglQ58hQMnvyh/HWMdvanPmx+Behf15/6C5Qa8LPtUMTSGHHH2T5GxwYE5
         sDDszt+whgf6GlqmFQZKrScSjLrwBM0In9Cdl0divViPw+15cEhOALg83bqZgPyPaie0
         JGOxJdObMzmLcmwS4U/sKOSU8t5++s/iKekpQc4z9EZ/Sho+H7iyrHHFsFN//YE79Kdk
         ymlWWNGvflUenB3pSdUlEEWqF+Zo5Am/59xaC4Ol6QYFLWUu7C/mPwUQjdX3F/QIgodw
         dyvrch1mYZTg7ns3PlBkoUk7turg/hSWwsqPb5lEUpKTOz76MNQXiKJlqGGbyR3pQHX4
         fngg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773328473; x=1773933273;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=s9wtogtLTVQ+JC6+U/vhw/2QiP0OXfBjiSPwSkvqrpE=;
        b=m7uOOKrRhT6RvE/oheBNM0uLvE5DSQKWtFmbuVJy/hOuaklEKxf9esZ9Sfzx7I/Y0D
         PoAtJ+N39JohagsZSQryU1RKF2zBNZujDrOpWv/XBhAS1WyNi/qzyH3hC3S6rR+/3p32
         YwY+W8uvOzo9wfKF8TEh5HBkF2ejEk6zq1si3LpUsbU3aY0GY3tIh/MxJGA/hSkh7bBe
         C3Xeu0ZH0KQN5CjgIAhGgEm0YbSRak3adIsUnv5SCfnn5d3F9xFRfLU22UL7b5ieKrRf
         dXXbh3AMQilKHHBBGCVugCgKvp7N7nscRw/a9ni5TdV7gAeM1XzEbT/FmzMP0vfNMuIU
         XaRQ==
X-Gm-Message-State: AOJu0Yxqd3Z0OixU2b+0gfKPnuCn2OOVwm4/u87gKTUIp7eDJHuky/A/
	l2zFfuvg4Zg6CQI2tJEEiDZsVOooZ3mASPDNJm+YOvXpjFxKR+Mno2JtDcOB1pmQqmA9VWEdtJp
	SgmLHn5C+7mpWt7KUzaWVNMJAL6At342enwk4gaTNu18v4ETfAiykOFXAvec0vJsuSQ==
X-Gm-Gg: ATEYQzy5JRbd9OxSn7W470mlS0YYvzYWt8xwXa3imvlMd6p3RlrMqtKN5P4bor6mc4c
	HxB6XokSKVoVZ+N9XY/5UIMM+bcZIUJ/aNkuJi4vRNygN1UtXn2Q6YwzzctkWbNj4yWX8RDuGit
	j+lg6pBjTyDkR0kzvIC69wvl0HsOWfL3mNhMrc2NN6X4+wlsVyaLqLwvaCl4KuMX+RvxYCqZf4W
	f5CLxbdb96Iuihc7SjF2DH8w57efBdqOp22s0PFL2jhtDzI/f5n1/WNnRlyz5DG/7cJx0DA/jgr
	iYh9FTnmhB4Ry+c4BIRxQJGI5XPDOsF5opzEnvoGFwwnvbv+OLWMjJXZEO/3/Ax/Dph1iiCyzpt
	TT3teVI8DI9g9K2l7/CAdbYU1Qk/gN82yrmxhcIAaeMqIiP3S9C0gFfKI2ZODpwl+bCUYeHb42+
	SHb4iBeMfjUeQR8kGyhvkipfDAoqcGIBxWukg=
X-Received: by 2002:a05:620a:40c7:b0:8c7:1986:6b3e with SMTP id af79cd13be357-8cdb5a9e986mr9848485a.32.1773328472461;
        Thu, 12 Mar 2026 08:14:32 -0700 (PDT)
X-Received: by 2002:a05:620a:40c7:b0:8c7:1986:6b3e with SMTP id af79cd13be357-8cdb5a9e986mr9842785a.32.1773328471822;
        Thu, 12 Mar 2026 08:14:31 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a15635786bsm972822e87.61.2026.03.12.08.14.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 08:14:30 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 12 Mar 2026 17:14:24 +0200
Subject: [PATCH v4 3/6] arm64: dts: qcom: sc8280xp: Add Iris core
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260312-iris-sc8280xp-v4-3-a047ef1e3c7d@oss.qualcomm.com>
References: <20260312-iris-sc8280xp-v4-0-a047ef1e3c7d@oss.qualcomm.com>
In-Reply-To: <20260312-iris-sc8280xp-v4-0-a047ef1e3c7d@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bjorn Andersson <andersson@kernel.org>,
        David Heidelberg <david@ixit.cz>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Johan Hovold <johan+linaro@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=4694;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=ZvJMG8Z3WvBz05XHBSniabOrPMA7K0JLnPM7q5XpTGI=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpsthQsBU9FyJ7DJq7CVgXLD8MjKKlXPb8BExBn
 OySTGKTA/qJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCabLYUAAKCRCLPIo+Aiko
 1dHmB/wJAdM0B/p38JrfMglXwkVQtkmyBhIlCm4Ufv4UaYpByUFhBhT8y2bGsx3XVsrzGNqK9YI
 12YjVKm2aAeSH0iPN/vug1/1l/aTAW6eL1RWIWyjoY5+6e8AvQ46WdiqEakvbA9WnpdJaSyHfYS
 n4e+aeklAv+MvdqMcT8410ZDY133hZOlWyJe0Ljz8IK5lQsZeuz1e/a6Z/tuu2UguyVBFxYTZmf
 qdnMzBtVN4/vBfvc1UyDeudzsB+ZnvMzhFb0PE9AZcbiNbWAnOaVLrI6mcFUKnwnq7L7QJBkJff
 46LRW94uDNfPwXgWNw2FEGfzNIZQ8fFYSNseF3aX000l6zk+
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: uojPfnSGA1feY0k7-rwO-HRI0q1f5ouc
X-Authority-Analysis: v=2.4 cv=Cpays34D c=1 sm=1 tr=0 ts=69b2d859 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=Z5etVbCIt5GNeBr577cA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: uojPfnSGA1feY0k7-rwO-HRI0q1f5ouc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEyMDEyMSBTYWx0ZWRfX3ZX4nq/FHgPf
 XbLxpLbc0lq7lJH5/G+2F45fyKx5vhSOQRvsA7sjn9L/LvGZaTDSq8UhoL5pJL5k8yXnF73SGQk
 jmYNWkWEXduHRN/zMPOckE7NMaCJO//NfUvg07T9L7LR7POfhp0Dx9umwnYDPH95ncEbE1SSKqB
 ox8Twv93FeaiEr83qIDBN91UO91epvtaVBl6FauJsqDAeUczLxd3Sau2rs8Sope0B8EL2HwSHkS
 HKC7BgtP4c6RYaeYJ6Xz5ZmJBtPPrQP3W+aWe0kl5hZFFB03Bl4uXKmP6FCmQMaAaljVL8bvF1H
 wAlZqAHQAKf0poUDsuHWTlE6C4w/YFS82+B9lNCNySlTrK3e5KJBV3SdGozseEU/cfe3YFZ1gZY
 mgOw2CZn4y5J0R6skjTjAnihM5ecgJc3jWeb+w0fPu3yOB7WaEckgavR6W0I8ATYzKxt4RiaDrw
 mJpVBTy/s+gQ0A3yULw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-12_01,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 adultscore=0 clxscore=1015 lowpriorityscore=0
 malwarescore=0 suspectscore=0 spamscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603120121
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-55507-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,linaro.org:email,85b00000:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_PROHIBIT(0.00)[5.42.239.224:email];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt,linaro];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: ACA2E274286
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Konrad Dybcio <konradybcio@kernel.org>

Add the required nodes to enable Iris core on SC8280XP.

[ bod: added interconnect tags ]

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
[ johan: use sm8350 videocc defines ]
Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
[ bod: dropped video encoder/decoder declarations ]
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
[ db: dropped llcc icc, switched to sc8280xp compat, corrected OPP table ]
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi | 99 ++++++++++++++++++++++++++++++++++
 1 file changed, 99 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
index 41c57e7dc433..d950816a9a9e 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
@@ -10,13 +10,16 @@
 #include <dt-bindings/clock/qcom,rpmh.h>
 #include <dt-bindings/clock/qcom,sc8280xp-camcc.h>
 #include <dt-bindings/clock/qcom,sc8280xp-lpasscc.h>
+#include <dt-bindings/clock/qcom,sm8350-videocc.h>
 #include <dt-bindings/dma/qcom-gpi.h>
+#include <dt-bindings/interconnect/qcom,icc.h>
 #include <dt-bindings/interconnect/qcom,osm-l3.h>
 #include <dt-bindings/interconnect/qcom,sc8280xp.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/mailbox/qcom-ipcc.h>
 #include <dt-bindings/phy/phy-qcom-qmp.h>
 #include <dt-bindings/power/qcom-rpmpd.h>
+#include <dt-bindings/reset/qcom,sm8350-videocc.h>
 #include <dt-bindings/soc/qcom,gpr.h>
 #include <dt-bindings/soc/qcom,rpmh-rsc.h>
 #include <dt-bindings/sound/qcom,q6afe.h>
@@ -691,6 +694,11 @@ reserved-region@85b00000 {
 			no-map;
 		};
 
+		pil_video_mem: pil_video_region@86700000 {
+			reg = <0 0x86700000 0 0x500000>;
+			no-map;
+		};
+
 		pil_adsp_mem: adsp-region@86c00000 {
 			reg = <0 0x86c00000 0 0x2000000>;
 			no-map;
@@ -4181,6 +4189,97 @@ usb_1_dwc3_ss: endpoint {
 			};
 		};
 
+		iris: video-codec@aa00000 {
+			compatible = "qcom,sc8280xp-iris", "qcom,sm8250-venus";
+			reg = <0x0 0x0aa00000 0x0 0x100000>;
+			interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
+
+			clocks = <&gcc GCC_VIDEO_AXI0_CLK>,
+				 <&videocc VIDEO_CC_MVS0C_CLK>,
+				 <&videocc VIDEO_CC_MVS0_CLK>;
+			clock-names = "iface",
+				      "core",
+				      "vcodec0_core";
+			power-domains = <&videocc MVS0C_GDSC>,
+					<&videocc MVS0_GDSC>,
+					<&rpmhpd SC8280XP_MX>,
+					<&rpmhpd SC8280XP_MMCX>;
+			power-domain-names = "venus",
+					     "vcodec0",
+					     "mx",
+					     "mmcx";
+
+			resets = <&gcc GCC_VIDEO_AXI0_CLK_ARES>,
+				 <&videocc VIDEO_CC_MVS0C_CLK_ARES>;
+			reset-names = "bus", "core";
+
+			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
+					<&mmss_noc MASTER_VIDEO_P0 QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+			interconnect-names = "cpu-cfg",
+					     "video-mem";
+
+			operating-points-v2 = <&iris_opp_table>;
+			iommus = <&apps_smmu 0x2a00 0x400>;
+			memory-region = <&pil_video_mem>;
+
+			status = "disabled";
+
+			iris_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				opp-240000000 {
+					opp-hz = /bits/ 64 <240000000>;
+					required-opps = <&rpmhpd_opp_svs>,
+							<&rpmhpd_opp_low_svs>;
+				};
+
+				opp-338000000 {
+					opp-hz = /bits/ 64 <338000000>;
+					required-opps = <&rpmhpd_opp_svs>,
+							<&rpmhpd_opp_svs>;
+				};
+
+				opp-366000000 {
+					opp-hz = /bits/ 64 <366000000>;
+					required-opps = <&rpmhpd_opp_svs_l1>,
+							<&rpmhpd_opp_svs_l1>;
+				};
+
+				opp-444000000 {
+					opp-hz = /bits/ 64 <444000000>;
+					required-opps = <&rpmhpd_opp_svs_l1>,
+							<&rpmhpd_opp_nom>;
+				};
+
+				opp-533000000 {
+					opp-hz = /bits/ 64 <533000000>;
+					required-opps = <&rpmhpd_opp_nom>,
+							<&rpmhpd_opp_turbo>;
+				};
+
+				opp-560000000 {
+					opp-hz = /bits/ 64 <560000000>;
+					required-opps = <&rpmhpd_opp_nom>,
+							<&rpmhpd_opp_turbo_l1>;
+				};
+			};
+		};
+
+		videocc: clock-controller@abf0000 {
+			compatible = "qcom,sc8280xp-videocc";
+			reg = <0 0x0abf0000 0 0x10000>;
+			clocks = <&rpmhcc RPMH_CXO_CLK>,
+				 <&rpmhcc RPMH_CXO_CLK_A>,
+				 <&sleep_clk>;
+			power-domains = <&rpmhpd SC8280XP_MMCX>;
+			required-opps = <&rpmhpd_opp_low_svs>;
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+		};
+
 		cci0: cci@ac4a000 {
 			compatible = "qcom,sc8280xp-cci", "qcom,msm8996-cci";
 			reg = <0 0x0ac4a000 0 0x1000>;

-- 
2.47.3


