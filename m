Return-Path: <linux-media+bounces-61423-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OF0bNl1wBGprIQIAu9opvQ
	(envelope-from <linux-media+bounces-61423-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 14:36:45 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 05A085331CE
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 14:36:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B79A4304E7DE
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 12:35:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E723D429818;
	Wed, 13 May 2026 12:35:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ffp4M66e";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eKa0hw16"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85686423165
	for <linux-media@vger.kernel.org>; Wed, 13 May 2026 12:34:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778675700; cv=none; b=Gqf5T6K4kWv6eeLRdWpOHyZX3HzjpE91InUpH8ssqdr99vzl3fBl+yykcWidWZreMDaqWwouOqwMDk3bfu0CrlKKzCv1zkYUKFwbbGaUc+iRrEi2jXnGEXtFhrJxin7/+1KHasaHEUAzmy8r4p0CC1AEcbosJm9hy0AZu78O/FA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778675700; c=relaxed/simple;
	bh=isfBhfEp6QevbEHukDTBoydJGn4P48zEXe+HfbEpA30=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VtX2u2wr+iBXwgtZr0ITOR1xF/uWeEcOr1HpZz0ZmhTUxeR59BpSvWJ0Qu+L2Ada3XS9ib7MGORjKt4tBaZC3wj4xF4qX8MMpVEb9z4QdkjSec97MPtjk4ic1h3MWdtHM72YuRvWIr2eEV36Vu5EczZYMV53FzIcmBsbCXa/msI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ffp4M66e; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eKa0hw16; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DC9OTN3324677
	for <linux-media@vger.kernel.org>; Wed, 13 May 2026 12:34:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KegRFBGT1pBt1ApHiSqwgKsmJTlvvqZbW7UqK2j89mc=; b=Ffp4M66euD2PVufa
	LUxyPe+h5CIabXvAR9+Npv/meUAzu9EiCzarNZFDqeSbdgUHVFTyoSQCme2DOR+1
	sfk6iKr6ehDqLRSPPAkOn3rqdcfigzxqPCzRnDmQZP3KrudIOB0RYQJhoIbroQaR
	66RcTnPfJ9WX5bCdYlmmDhFgYpONg+lT+cYRgY2xw5Cmgh1K67QCpQXdO7Apj4aL
	SX+CZoT6hzvP9iCPlMLcd4VNNB7u851IzJo1CkMjIRLKElutbRw3rJ7fJBu4WsnX
	poKff914vOZfqocmCQJU1/cQ+eGKbpvbi4YS0kCEX3FRMR+umRCQYEQvKPOST2+E
	T8vKLw==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4kvd9dun-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 13 May 2026 12:34:57 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-95d1ea17d09so3311528241.2
        for <linux-media@vger.kernel.org>; Wed, 13 May 2026 05:34:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778675697; x=1779280497; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KegRFBGT1pBt1ApHiSqwgKsmJTlvvqZbW7UqK2j89mc=;
        b=eKa0hw16q6EpLwEM0oxqDkzqUB4PwQhtezTFBr+PzHuxdRHRQjLGcsIVtisb9r05DL
         zXtQGeoGgNn+fv6+FKZZVsJAdySr36bgCXHH/bbd5YoSwmTVmKm/gOOX1vq3Mp/9NZaD
         Z//36pZr0y/pPvb1BGq/BVO84lKX/j2iKFyjB7ZipuXE4OCstQkW8+M3sDeU/k7tTclN
         fWcngHO5u65Kg49WzW+dSslf3IRw3qSQR3J3BrWJvPW1FbFQuTz07jpjEAc6WpxxYaVd
         X43aGRqxRHmnRAlnui6eOCqelMPQPDM4Yp/2uyJV+rPPXGXULuI26XOGF6dk7mYRpemG
         fEHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778675697; x=1779280497;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KegRFBGT1pBt1ApHiSqwgKsmJTlvvqZbW7UqK2j89mc=;
        b=iBgqE92o2jgsxaBFIL8GrlF/IRVJwrCBd8HP80arPMdiatyUh/fTfJTGOnEN1vumaU
         p6Gfetoo8j/Aq2sMfi4xEs8rf+bFpcMj77dqpUW58cD5y6SQiaPWjxMlK013bffgoGsq
         yvd3q1aObjgz9va1lYUt2zBxzX3N7qAYJPPzL+mUJdxaH1qFyMECHIu7jJfYJLwVFHGK
         QFaReJJR62bdIfF/fNYOoh0DkPtMlQxAP5eZI1zh1omJ5l2Vhc1vA26JnphuYhyUqScu
         MEGdu2p0fLU4o7C5d5yGdgjQCyDGC3Y25LF10u/kLgJC9P2yMYcMg0dbiwdrtGzDF36p
         6bJg==
X-Gm-Message-State: AOJu0YxclHBz5s3TToktLwDUOrtkGX+lHZcG9ttojQt60XWdNHocMZZ3
	ys7yolk+jmRjSNntInCZvwTkspylkwWko9EBoLLUvcaB19wvpe6Pqo1uKQEHPfNmosJKCPIn7Di
	pozEIdB7gMp0wY5mkugiSeJs46FnN+Uz0iDjqQbUZ+9HqhQQJn3xdqvRZvWx5Z89Tjg==
X-Gm-Gg: Acq92OGzs3sCRvjxzNwzCwJ8L/VegOaLW7TPDgSTs63qIoSN/apmYf/Pnh9C2X067uz
	6hxybKVejAP9nBAJwlT2XWWLYMzUdH5v2jc1fc9tdmn0QqenrdqmSc9VBRRojwoBk7vMmxAjhb3
	NnN16x7u3icDA5TvcuSre9clqiW9Amy8C660FBVmpzVVNFffi6nC8GmFJ5u68bp5t/SVeprlS4l
	ge23WWbtnf2uRvql82hSJsDl2838+RMFV/2MgDP/S0cF42I9AvWq8iKWXrxsPrz9H5LFnDlYhHw
	LKBjaWfaRrkU1DkqEdp21FZ33sEI0OJG/45z2d1mS/1PXgfKSYPmGMzZpLUHcXqlIZtpUAETb9O
	ZYfWgREnJz/WwpT0OqAViEEpr+GSG1dNdXEJ0ZfoHmKWkmS7PM9TwneIqXtVacbSCP/W92kcEwM
	I4km6qYVJioArZPeZnlo0cdEHyyVu9eLTZ5dw=
X-Received: by 2002:a67:e104:0:b0:632:3bb5:95f1 with SMTP id ada2fe7eead31-637aa02e3dfmr698363137.27.1778675696555;
        Wed, 13 May 2026 05:34:56 -0700 (PDT)
X-Received: by 2002:a67:e104:0:b0:632:3bb5:95f1 with SMTP id ada2fe7eead31-637aa02e3dfmr698340137.27.1778675696040;
        Wed, 13 May 2026 05:34:56 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a8a95660c1sm4132610e87.66.2026.05.13.05.34.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 05:34:54 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 13 May 2026 15:34:47 +0300
Subject: [PATCH v6 5/6] arm64: dts: qcom: sm8350: add Iris device
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260513-iris-sc8280xp-v6-5-0d11d90d3e26@oss.qualcomm.com>
References: <20260513-iris-sc8280xp-v6-0-0d11d90d3e26@oss.qualcomm.com>
In-Reply-To: <20260513-iris-sc8280xp-v6-0-0d11d90d3e26@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3708;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=isfBhfEp6QevbEHukDTBoydJGn4P48zEXe+HfbEpA30=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqBG/muZnSqJQibNPhblefU+BfWpGcURMXoOATt
 UufF8ZBT0qJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCagRv5gAKCRCLPIo+Aiko
 1QOMB/4/0LfFK22oHOqZ5MPyiIWzAi63ilTMN2z0FtlNo/WgHrXtnp3yRrGpj6JbwsiR44iuIVJ
 p3jlL+ma04ZTO3ZaP0Y3JQn9eny0BBun1unexAcqGJlLb+jskh709lDUF3sKJypLTI0tx4bMUq8
 tHjuAr18OwvQfwfuh1boR9xqVs4rChmX7x9ryIYZKZJDLmgABHBA6PeMc9Kii0FUq+9YgjEKX7u
 dvfeuVS8PUuYEQcnss3Y+GD74xpAQqntdj/yHwkl0nJOUUhQ0tK66JgZhjPZX84YwQguE010+ob
 zZsnjkNgkLfDpOwaXhUEQj8zm13af6D/ViYVOJHPwA8U/OZq
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: Uz5yXUBaLl1dIdud8dQ92DIWrgTw75bj
X-Proofpoint-ORIG-GUID: Uz5yXUBaLl1dIdud8dQ92DIWrgTw75bj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDEzMSBTYWx0ZWRfX30kxxfWbq1Oo
 d2nmLMB4ubp9YGcpMjJIMofexM3tbO3eRzcGCfyidBxsQQick0CUNGwB6z/5IE8E/HQXY2MatUo
 H0vDtoRtlAP4nhQB0XmIlsh/p9xCSP7UoBYAQvb+/kdIVs0ZojwA1A1tcqe9N1AhbIiFPyKqBal
 4ggNKS2e1ZWrgRjcSsht9s9oBB3AyLdt1R3PU4H18YsGmK6gZnGDQijBBiY4XIkN3MpKhrouwSB
 Dh/D3VJvoQ8GCXI/UdssFbocEM7wED8x3bRhK+AIi0c3o95BsENRYOIQScvLL0lFORYzwmjxbBf
 5mVWb35nqC09+KjBv8P5BHeB0CzIo4sL1jlo5EnA2ydr0VkytJXe/cpeTVW9ZCzBGlq8+MtEkJz
 l9V+iBHrU0wooDxmKBodSAfI7iVSowd5geZHf5f8YRqmS0FcQMElJ8kodAJ/5u80GamGrQxmU1n
 c9mkage8S9QpXdzyLXg==
X-Authority-Analysis: v=2.4 cv=Iu0utr/g c=1 sm=1 tr=0 ts=6a046ff1 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=zXEy-fkF16KV5FEPuqEA:9 a=kSuwpvhy9FmzT4U0:21 a=QEXdDO2ut3YA:10
 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_01,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 spamscore=0 adultscore=0 impostorscore=0
 bulkscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130131
X-Rspamd-Queue-Id: 05A085331CE
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-61423-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,abf0000:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,aa00000:email,qualcomm.com:email,qualcomm.com:dkim,ae00000:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt,linaro];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Add Iris and video clock controller devices, describing the Iris2 core
present on this platform.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8350.dtsi | 81 ++++++++++++++++++++++++++++++++++++
 1 file changed, 81 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8350.dtsi b/arch/arm64/boot/dts/qcom/sm8350.dtsi
index c830953156ec..2148a140f162 100644
--- a/arch/arm64/boot/dts/qcom/sm8350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8350.dtsi
@@ -10,6 +10,7 @@
 #include <dt-bindings/clock/qcom,gcc-sm8350.h>
 #include <dt-bindings/clock/qcom,gpucc-sm8350.h>
 #include <dt-bindings/clock/qcom,rpmh.h>
+#include <dt-bindings/clock/qcom,sm8350-videocc.h>
 #include <dt-bindings/dma/qcom-gpi.h>
 #include <dt-bindings/firmware/qcom,scm.h>
 #include <dt-bindings/gpio/gpio.h>
@@ -19,6 +20,7 @@
 #include <dt-bindings/phy/phy-qcom-qmp.h>
 #include <dt-bindings/power/qcom-rpmpd.h>
 #include <dt-bindings/power/qcom,rpmhpd.h>
+#include <dt-bindings/reset/qcom,sm8350-videocc.h>
 #include <dt-bindings/soc/qcom,apr.h>
 #include <dt-bindings/soc/qcom,rpmh-rsc.h>
 #include <dt-bindings/sound/qcom,q6afe.h>
@@ -2747,6 +2749,85 @@ usb_2_dwc3: usb@a800000 {
 			};
 		};
 
+		iris: video-codec@aa00000 {
+			compatible = "qcom,sm8350-iris", "qcom,sm8250-venus";
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
+					<&rpmhpd RPMHPD_MX>,
+					<&rpmhpd RPMHPD_MMCX>;
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
+			iommus = <&apps_smmu 0x2100 0x400>;
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
+			};
+		};
+
+		videocc: clock-controller@abf0000 {
+			compatible = "qcom,sm8350-videocc";
+			reg = <0 0x0abf0000 0 0x10000>;
+			clocks = <&rpmhcc RPMH_CXO_CLK>,
+				 <&rpmhcc RPMH_CXO_CLK_A>,
+				 <&sleep_clk>;
+			power-domains = <&rpmhpd RPMHPD_MMCX>;
+			required-opps = <&rpmhpd_opp_low_svs>;
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+		};
+
 		mdss: display-subsystem@ae00000 {
 			compatible = "qcom,sm8350-mdss";
 			reg = <0 0x0ae00000 0 0x1000>;

-- 
2.47.3


