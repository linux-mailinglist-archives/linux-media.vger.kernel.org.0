Return-Path: <linux-media+bounces-61259-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QDWXAmQoA2rP1AEAu9opvQ
	(envelope-from <linux-media+bounces-61259-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2026 15:17:24 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id A5A2E520F4D
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2026 15:17:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id AC56D3036470
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2026 13:16:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4224D39EB67;
	Tue, 12 May 2026 13:09:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ctLwxXzc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="g049FlUT"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A25C039D3C8
	for <linux-media@vger.kernel.org>; Tue, 12 May 2026 13:09:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778591392; cv=none; b=HXz3LCbC4vdaYXSY8MymDQCaIks9LsWn1r/mYOCJY0HnRgLzJsdSzp//agYl5EWiqKH1ESjjrlgr/8kkRXvKBotPs9ihe3G68XX+I4iC2Jo7NCWQKYpLAFl1uxOHNDudSaMfou3fBsghOiKNNUIVjqooDCKdrztR7LxFdL7wlWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778591392; c=relaxed/simple;
	bh=nCzaPtOgAzOu6WMMaUkEsvKLphsm8vVsM68gBNmWkoA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fz89crKXPxO0TGoK0CILM5CvzcFiQX/CqjXF2QUn6NnoA/qNHnRifXD9Xa3HTTBWe/eTdvLMi2xzn9oN7qwXBh2yjczFYq44DBh8refIcV8DYwHB7xtqHQhQEuL7Iax53+8+LFGMOnjhnsf9Rk8qGozu8MHaZUgrXA9ZSwVwS6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ctLwxXzc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=g049FlUT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64CB3rxa3444178
	for <linux-media@vger.kernel.org>; Tue, 12 May 2026 13:09:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Xc0LIbJK2UYdiRG8GdteAjSaAc/1cnapMZKivOv4BUQ=; b=ctLwxXzcIEWxAdTB
	dX3A8s1CUoofPBgIIcM7LOAcPQvwHFgT/jktNG/9W34OMPsDXAaYK50S2CqAezWp
	CuEoBIJcnx3I+QkNqhv2/Hs7M3MpOXoyH6niC4HEakuk92Lze5iHii03RguU47AS
	7JGzjWIOvE3QdVH0IH5lmsZIt6u3umYMNYiKBGkO+lSyN6Ae7a0JtKb2Dso4jtgQ
	HrMzSBSeZwjGJmTG9KkVyqW6cpiY1rUU1cL3tL8HuLvDN0j9dlUCT83R1tp/xACm
	fhgCLktRMau0CgoTn+SLE0fdYdNl60DSQ/Bf4OKHjYHB3ZSnopARELDQfr0F79qG
	tqSu1Q==
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com [209.85.161.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e3nv0kc9c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 12 May 2026 13:09:50 +0000 (GMT)
Received: by mail-oo1-f69.google.com with SMTP id 006d021491bc7-696307c7f2eso9455786eaf.0
        for <linux-media@vger.kernel.org>; Tue, 12 May 2026 06:09:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778591389; x=1779196189; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Xc0LIbJK2UYdiRG8GdteAjSaAc/1cnapMZKivOv4BUQ=;
        b=g049FlUTIoTfbDRJ0i5bXZOgc/KxXIVA9TDTmKmeJ0w4uaeQVElnF1xnj8gEAc2NIb
         RE5R2sx+dTz0NK55gfxBPMdrDQhqsWQ95XOjsB0kbiKa2+VJ+bbfcYCUoDt32vuyC2hu
         Rc49N+p4tpy05Wh3r6NtdPstXD07GeMPO/Tvdkpus+1xcBz92Bey2WLnElVuId9OzZHY
         2tejGiEnjAUk8gQorzi0rmNjmXV/hfBv3EXAfYw7J4GhwloJOqLWbpF4EuTw0WmpuCml
         /E/dEOMaM0gZaXI9Wf6Zn8cp3Bz8HsxDAXvNZwT5j2G46AE8vGSIHbdqXEEe2AJEzqzU
         GffA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778591389; x=1779196189;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Xc0LIbJK2UYdiRG8GdteAjSaAc/1cnapMZKivOv4BUQ=;
        b=CPSY0rzkers9jFx6Y3u5eOdSfidTW9AMi4cJ2JjG+KFenwzGTNQwjSQzJsBYRv8PuI
         AWYTBg3I7t1xO5Pw+u7b0DMrXWVUMhhGuuurEg6tFdS86XqABX+ljJqlokj9xcomwalX
         UIMmuH95A7o7nYpp4Og02VXa6nxi4KIU/uPWDTYTycJ2nwf1Fp1ct9H86v5isiJte1bg
         VIcNjFYoZN/OP5G6EWQG0vjUMQ8s00un7Ys33fvR4CoBf0qa/PM4K3Dfwuh+5bgpEbWq
         FgXilKmy1sDmc4Eym21Ymyx5mL86UHrpGVPIuX/LGdrUywcUV3VonpSh8L1fa81rqSWj
         wEgg==
X-Gm-Message-State: AOJu0YwTDBIjQ06s01bunm2ag38OmLwNW0ak0UP6TD5c1zMY4G5w6vp8
	W+/LsBzU4jARtU73/dYuP91WkdtPDJyfxCa4ThuE/je6VgGP8NLYUogErAAJkuCVdtYQJrOfsVA
	G6VAEOITQyosCZ+IHIxh86km/imlydQ41ZwYX/83NVpIb4Io+uVDJ3MlNpH+Ep+26WA==
X-Gm-Gg: Acq92OF54q2kl1/Ze8oENHK3Gu1W7CVMldnYAvyg9d0YBnF6o01D7777A9+Z8qEstIw
	Pph26v2sk1e0zaiP4ZirTYVsfEerZ3Qqffu6JrXDdKfpNWN36h7Nk9nhNB/vo2rnZ6ZkccLP5Gh
	EALxhPOpw4mJEHL9XkliFvqHqSKxh6DaD6pyZk9e9kpgjbDJlkQlAtka9AniSWiPyw7UxQOfcWc
	RhESSLeHD5Zel3ohp5zEDszB64Hk7kpWoQXD7v9BfNvi+cIm33D72Z7XSZDyuELUwnrK8brvs/y
	MHlFkFqO/ATFz7kgqge1SUGea/WboFlslhBG9dCWVtKE3aO0PqbF5a+/hkQdPHEolLYXvIw15cP
	1IX/gCjEpMt16xzTN/6hY24RSUOoiUubOfPN8t9zCnVVTWSa6Hy9UaoOlN8vbq7AoTH5qcj57MK
	2bI0h9T6ncttja685uQ2seRxAu7F3ntMaYjnM=
X-Received: by 2002:a05:6820:1a0e:b0:696:15ed:6a09 with SMTP id 006d021491bc7-69b36a92bedmr7372670eaf.24.1778591389221;
        Tue, 12 May 2026 06:09:49 -0700 (PDT)
X-Received: by 2002:a05:6820:1a0e:b0:696:15ed:6a09 with SMTP id 006d021491bc7-69b36a92bedmr7372641eaf.24.1778591388728;
        Tue, 12 May 2026 06:09:48 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-393f5f3a8e1sm33739451fa.15.2026.05.12.06.09.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 06:09:47 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 12 May 2026 16:09:32 +0300
Subject: [PATCH v5 4/6] arm64: dts: qcom: sc8280xp-x13s: Enable Iris
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260512-iris-sc8280xp-v5-4-8cc251e83b58@oss.qualcomm.com>
References: <20260512-iris-sc8280xp-v5-0-8cc251e83b58@oss.qualcomm.com>
In-Reply-To: <20260512-iris-sc8280xp-v5-0-8cc251e83b58@oss.qualcomm.com>
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
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1067;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=leB8+LKvE7kUH/wvPz6CoXenJFqROgu4EIFsX585OSg=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqAyaUJThxkMm9CqBAf7q4ry5/VCwjdOHKgtWu2
 9R1ztNZS7OJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCagMmlAAKCRCLPIo+Aiko
 1Z78CACWqa3gELKDbwO2PsumwIg3uHEh9RigHqaLePEIZJM6Fnyb2CY5NJzcxtFKSoJYc9s8mMF
 iKUfaJS22GCYct8j6wk03KJit5/1gYBLceSq02OcoQCA+FQ9zZN2tKhTNowAHG29/BS2LvI5sTT
 VixTMN5fFUdUj2ebuQa7/+6oZ/Zz9E329KzzaCCh+RjtnfyablC7smctocTyZ0qX3vU2HxrdP8j
 C7Zx28h3c6eAXOJyeqW/hjbx/7gleC/m3OfX77gULjwha0AAXo0pIzrSJ58/4vvJtVJPcW8i5Ei
 CW3JeMG3ktbRYER6seYdUvvqC0eKBlGtRpJ51qjgcaCncw5w
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=V+xNF+ni c=1 sm=1 tr=0 ts=6a03269e cx=c_pps
 a=lVi5GcDxkcJcfCmEjVJoaw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=Ie9TG8L8bN-JZtJQupEA:9 a=QEXdDO2ut3YA:10
 a=rBiNkAWo9uy_4UTK5NWh:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: rHYDCXPwVwrD-3o2BjT0aKwAMJyz1IAG
X-Proofpoint-ORIG-GUID: rHYDCXPwVwrD-3o2BjT0aKwAMJyz1IAG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDEzNiBTYWx0ZWRfX5WDxyysDFZEB
 4m3gUWwBYw3cj57zj8CCMfBh/3jz2FMSlNm6+ukLRS+OC4Oc/wIF1Ws+ZL4ZtTKmRvk34dSWQHq
 KT2787JMNhnYdUnVgqnywSXNgVbiEt9VBAsbENYdtg/GDmfwogGXh7UgFxFF5ICCr5ccSLClvT9
 NAriFTbzf4hQi/cIDhc7NeNPF2GfIy3kG+pLMP9zwUPUhiZ8cUWPhzwvz/VZUuBH2QVUMm/den1
 SS7CaC3AniMznJG2SHIoFwDYklofv+0z0BnXLLPtZjuZAuO4ISFHqUn3JCNezcplNGn7m28VqwW
 tOGAbBbnTzH4f1BHN4nK/npxKoonlfaRSQY9lBh1GF7dOZa0CDFQyeCwWp8cGAPBeNDbA+rcy4P
 vwSLWb4AftUljklJ9SWQC9QQoNLEOksbXMoHMkd+dMDcrKY6DIK3UHcUTePyCIxRXZz9An2d3d6
 +4aphiFmhkKK9RPVonA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 impostorscore=0 clxscore=1015 bulkscore=0
 malwarescore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605120136
X-Rspamd-Queue-Id: A5A2E520F4D
X-Rspamd-Server: lfdr
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
	TAGGED_FROM(0.00)[bounces-61259-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,0.0.0.68:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt,linaro];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

From: Konrad Dybcio <konradybcio@kernel.org>

Enable Iris and point the driver to the correct firmware file.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
index d84ca010ab9d..0eab03495b8a 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
+++ b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
@@ -932,6 +932,12 @@ keyboard@68 {
 	};
 };
 
+&iris {
+	firmware-name = "qcom/sc8280xp/LENOVO/21BX/qcvss8280.mbn";
+
+	status = "okay";
+};
+
 &pcie2a {
 	perst-gpios = <&tlmm 143 GPIO_ACTIVE_LOW>;
 	wake-gpios = <&tlmm 145 GPIO_ACTIVE_LOW>;

-- 
2.47.3


