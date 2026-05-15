Return-Path: <linux-media+bounces-61664-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +CD1D+r/BmqVqgIAu9opvQ
	(envelope-from <linux-media+bounces-61664-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 15 May 2026 13:13:46 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E33854E339
	for <lists+linux-media@lfdr.de>; Fri, 15 May 2026 13:13:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 584BA31B179E
	for <lists+linux-media@lfdr.de>; Fri, 15 May 2026 10:58:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3793E47DF81;
	Fri, 15 May 2026 10:57:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AZ2H+8oo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HoORg9hr"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22AEA47D93B
	for <linux-media@vger.kernel.org>; Fri, 15 May 2026 10:57:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778842623; cv=none; b=ip1D+IpQUjunIBHYVQU1XuMWVlDAB6f1Dq/Xver8EUEBZqA6mJwV7fOy78fdWiAZehRnksYSVjpJPk8AAKdUDP22gXeBNQniPOJrYnj8TjoLQFTiQ6Ja+VKcafyXQ5T/cC9wE1ITxSgwJ4GORX/VKGpW80AoeIQ+kHm2OhpmmIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778842623; c=relaxed/simple;
	bh=dicEJZtLq6zW0VUaiQ1W5EgO1yN4WYL6q5FtmZ8EKdM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NJaFAN5rIGJNeBKVaz5ICp7Bdqxi87HlYWcQXZVIYCmEbmkaVcHS6tNngvesQSCTGxKaHFGso9PZEvFufZndZg7GxB+FcK12mMe+G5V6evcfLNLuKUc0bc9IJOFylbZkzS+dsewEKcuyHCxYb3aBqszXOVp6JB+VoBO9s9Z43t0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AZ2H+8oo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HoORg9hr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64F5bGQa1847994
	for <linux-media@vger.kernel.org>; Fri, 15 May 2026 10:57:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hyGb0UCYPIrtzlYMMFqHwR0AZmvnwPLK/gKxBVnW7aQ=; b=AZ2H+8ooF05v7y0H
	xIgCR5NIb4kQCvqRm6FSHP9F5S6SwrUKUG4eG0aLrrhhDVnUQgnh2S8u87N9nqvM
	5/LSusG5va5ZHP4KxJSl9SqopZOFX5nWAW7U+wQ2y0VXXDdpuledHSVvhXdz9ije
	00uEZLmceNL9dWg5Xrqx0iGUNDUEjyafba2R+0muoWfEq6bhnkehM3tiojGsKx53
	1HcZWV0/2QMh/iRNwHZUqGu6ohzSBodZZS7dl+9qf0AIOHJQhdodMRiar6x/VHUT
	FskwZ2DUqbyJhEmxWUb+S7YxUsPAhAgii634IunxvkUQ1kOBq3vTizmH1h+iyhoh
	OFVcIw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1t2w4d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 15 May 2026 10:57:01 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5162ee45a77so62340311cf.1
        for <linux-media@vger.kernel.org>; Fri, 15 May 2026 03:57:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778842621; x=1779447421; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hyGb0UCYPIrtzlYMMFqHwR0AZmvnwPLK/gKxBVnW7aQ=;
        b=HoORg9hrbOgIKho/a0RUMyw3Ip4CcqSYl/TXHKeXQZjHx4AzczYYl/68Pb+RFyAbAX
         3sL0Cp5WkibBRpY19+3/GY8TzkD8bk9SaC9fpD/pJWJtU8PUX5U+3qCl1gFgSrcYiLo8
         jVrOrRaNDj3sHUpsSzow0HzXigQv0plEzzo2OO3skQcx+xuhvcIbzTAfBKvz9/Bn6EWy
         jOw1Eqt1XmSY1QWSGXuHuz4Z1w9IUZadlM82bIE2kluJKQzYTc3Y5gmfw2HYFUBMFkzW
         IUdVbzkw1JfwWl9kmcOmz6J9PlYXFM4LEj4FNgCUhOEbBkPF0tOUr5A4Lsxj5nTAseld
         HAbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778842621; x=1779447421;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hyGb0UCYPIrtzlYMMFqHwR0AZmvnwPLK/gKxBVnW7aQ=;
        b=cfvURA9uBv1JwollxV0eHfcgmwGx1sKyDlOksJgMPgIZ56QfwxsSEciZcERy16sv7Y
         fn70MDmshyrJU6k2mShD5wo56HOjisQmOV/H8riTnR2GPWfjHG/OounqNYDBHcyVgx8r
         5HPOtRVtL5JR/04fDaIldcWghXjEZ0/HIo6jFCuu83oOKnccZkjapD6+kbunZhzRBkWo
         0E9E3lu5dkLclFSakzIV8xb3IXcTO6ycZKzLl+nvP/4dJ5iBPSjIlG0vqqISbTnHcFfH
         sl28kTOqNKEAR2AJl9XJcL1Jk1B88ZnYTvaoECiamTBtqlGRFM0aFj9OxyAdfxvC5R34
         f/5Q==
X-Gm-Message-State: AOJu0YytfPxrSPisCDqnwbwBfE1owmrW34e59ii7M8GRjG16oUx26QfM
	/Bi390bkUB5k5WC1OXlqNlEmCUSdED3v88aKMmsGQVgupgM1MVCOpeq2XleEXAw5k7q/bDPkSYP
	P9SKWzUwzKfNOo/u8FmoK2Oup81MykieZMe/pPK8cADEH1fC/xEHcMhVMLppG2aje5Q==
X-Gm-Gg: Acq92OGVZ0aAc/FvZxBCN137gmCnzo9NPEPvYVGsO88YCA2N8xbE7VHFTBzggAN/T92
	BgYtOO4i7sjdPyR835PSHjvXj9CFV1lrYkVmtjGKmXKukKvkBLbNymw6FqC/Dz/iMaLMz49PtU0
	K7GlolrTJqIANu73HEVJ99KG6NHiN3JYMzUTxod3woaNN5gmy0Oy9OLheFStdS+f3+1ZMG4lXkd
	l+g/wbQV+vZdFpt/dozVIBgOkSJGlA6pPwkdVYVBYC8toySMqIqU1aD7sVjk1mtOfsoFVj5Jzcf
	Eo1ZRLOlxcNMHBdhYX52XsC67XloAo9uJsv2Fm1Vjx13T217/udQExsBtOH7bqrIC3B6sqaZlqm
	v99GsQfDzSrkGlUsmBXaiY3ueGIEL9F4VwoSULiFgVBL89Qv6OA0+tyt8JUUR+t1qJclhThMSpd
	MO2KOkeYP1LqaQ9XLW/fomiBBu1RYoL82yLA4=
X-Received: by 2002:a05:622a:a1b:b0:50f:c109:b78 with SMTP id d75a77b69052e-5165a27f690mr40192341cf.60.1778842620600;
        Fri, 15 May 2026 03:57:00 -0700 (PDT)
X-Received: by 2002:a05:622a:a1b:b0:50f:c109:b78 with SMTP id d75a77b69052e-5165a27f690mr40191891cf.60.1778842620122;
        Fri, 15 May 2026 03:57:00 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a91e2b6db9sm1240195e87.84.2026.05.15.03.56.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 03:56:59 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 15 May 2026 13:56:40 +0300
Subject: [PATCH v7 6/6] arm64: dts: qcom: sm8350-hdk: enable Iris core
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260515-iris-sc8280xp-v7-6-2e21f6db1897@oss.qualcomm.com>
References: <20260515-iris-sc8280xp-v7-0-2e21f6db1897@oss.qualcomm.com>
In-Reply-To: <20260515-iris-sc8280xp-v7-0-2e21f6db1897@oss.qualcomm.com>
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
        Johan Hovold <johan+linaro@kernel.org>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=806;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=dicEJZtLq6zW0VUaiQ1W5EgO1yN4WYL6q5FtmZ8EKdM=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqBvvx20ibhcyXL3eZcWWuS862Er2vFjwSodOzw
 Rahz938nNiJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCagb78QAKCRCLPIo+Aiko
 1SQFB/9tiL/qrkhwOb3ggfuT+YKCjJTR1YzIN9iYUzD7LPZ+DsO3kc+bifc4Ors5cDpUp45NIRh
 vjkFA81yG/FB391tPyGcF+blLaquDo6yfXm5c6b+Tc7kZ2O9DIxXlGELpebZK77/N11zNSHXgz9
 ygizgljwa7w6hxMQp9btwKcrxjb2FbZoOWHWJ8olX+XVJPEigsbstgKpbAKfmrLhFnIMTg0S6tv
 kyefLEzu/K3CWG0V+vwic/3askgMcHfqHMqe+C+ko3Visxx8kW0WSrjyHaPO6RElKcVBUAi0KYz
 9imM2Ipok2t2mai5FARi8SjOFNU7cl25nOuufJua1fLH6ejA
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=D7Z37PRj c=1 sm=1 tr=0 ts=6a06fbfd cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=6kKVESMuOeKZ7y-A11oA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDExMCBTYWx0ZWRfX1qaUywLDNH8W
 Y+Bhde8+sfWAesFCb0G4I/Ui5mDAnodX2lQzFfVbzmTv0/8c/+yewBi8J+Fvzc1eeXvYMVv41WF
 bQePSyf95gMvkipZzfOvsLv2rs4WieQ1aVqnzmp8L7+iexaIc0ogzdiei8ftCq13dWi0S/UXqfw
 74J+45hddhnyTxpBgDTZUDC9fz0YzzY0RY7e8uPACvdQu/HMJjdLbjKMd3pJBqYLs4jfX8fiAIg
 JSTuDXTCiApKNvRfTiUiO+YHCHoxNLpI1/N0ERn5At1IJ59JZEcpBxXwIsBrxKoHkqRy2O7dboM
 D3CPNdWoDafOl3IIZITWopYaDD7DJVD6oMP98UiaOoCsPSqGCvo8BcXr8SmM6C3JdttWA6elgdp
 JIb4hcG1aRBC9mHKnJpHFzkDm+EN1Yi6wO+vTa97fa4NFAlg5S+Xj+uTBV5rwpkNve2Gsq88gHu
 2RDkrVEaOreiCGCpcSw==
X-Proofpoint-ORIG-GUID: epKO8wEiMgbJjlNso4RGb5qEWR3vsygR
X-Proofpoint-GUID: epKO8wEiMgbJjlNso4RGb5qEWR3vsygR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 adultscore=0 phishscore=0 clxscore=1015 bulkscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605150110
X-Rspamd-Queue-Id: 8E33854E339
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-61664-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt,linaro];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Enable video en/decoder on the SM8350 HDK board. The firmware is not
(yet) a part of linux-firmware and needs to be extracted from Android
data.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8350-hdk.dts | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8350-hdk.dts b/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
index 5f975d009465..055fc8ade85a 100644
--- a/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
@@ -472,6 +472,12 @@ lt9611_out: endpoint {
 	};
 };
 
+&iris {
+	firmware-name = "qcom/vpu/vpu20_p4_sm8350.mbn";
+
+	status = "okay";
+};
+
 &mdss {
 	status = "okay";
 };

-- 
2.47.3


