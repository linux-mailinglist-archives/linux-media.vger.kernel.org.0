Return-Path: <linux-media+bounces-61256-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aCjGOugrA2oR1QEAu9opvQ
	(envelope-from <linux-media+bounces-61256-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2026 15:32:24 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 51EE25213C9
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2026 15:32:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B54D4312E3F2
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2026 13:15:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1168E38D416;
	Tue, 12 May 2026 13:09:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LkBziiN2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CsJfNKal"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D63B738D409
	for <linux-media@vger.kernel.org>; Tue, 12 May 2026 13:09:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778591387; cv=none; b=LHg6nf2gcx33DEgRVG0RLYFFKRCPjReFZnCag2anv7hZSpRt75c/D6P4a9Fsx1Q+N0/3PD/5yq1zISkftAkZCeNSh5U05yS64kn9hahHZc3UV2zNofE8AXr7gMqD7ZNUEyORtETOL3FmR3/4SeKUuH4f5pUXi5PM+TeF8M3EG7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778591387; c=relaxed/simple;
	bh=4OKybM59XPsuv/9WXUzXsJ4EBfsWcCDj0GF+r38seOY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=A2no4WxeUFQr3O5GxYn5v7kwDGZFrM4JhMwtFgr1kyM2T8yAmYpW3nGIEoL/8cOyCQYc7OrX53ZOIGwIAc+s/FDtHknF8p9Bl7MhcPEN1oGf/r89T2XdTVVjplUMA7c70AwT5gvfBpFsh4NFHmb6r7KHjhbDPcdoad5WDbhHDgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LkBziiN2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CsJfNKal; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64CB3rxY3444178
	for <linux-media@vger.kernel.org>; Tue, 12 May 2026 13:09:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZwZ3jfJs+6xeTMtYxnw6Lo1u+XTpiWUc2zboWuuAt9g=; b=LkBziiN2V7hJn8Fb
	L+MZkGKN4OP7Ed5EwzOExs0Ye1XjDq0ac9VF9BR50Ey8mCx4Px31CcUzhKHhnpic
	xDc1+Him7Fl3iBmft7Nax+cajgThtC64VcQPluPO0z6pnD8D7uu5PIcQMn7PKDoB
	XdTIg+Nom37J162uVyGcK2bGj6HTdTDYltYICHNaor3Nk3YPRL5tNTZZs1ETm1rI
	EpuvwXv025OhiBSJM6SmBI4diuURkLap/Ck1o9017p/ZLYyeyuxUZkGSyhdFikC5
	h3cO0mVZ/pXeuODrzb2ezdae17qjbpwiljQ7L6IfI0ScDGLsmem/oFhh4AU+km0r
	/Z063Q==
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com [209.85.161.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e3nv0kc8r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 12 May 2026 13:09:45 +0000 (GMT)
Received: by mail-oo1-f71.google.com with SMTP id 006d021491bc7-69649771a5aso10051648eaf.2
        for <linux-media@vger.kernel.org>; Tue, 12 May 2026 06:09:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778591384; x=1779196184; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZwZ3jfJs+6xeTMtYxnw6Lo1u+XTpiWUc2zboWuuAt9g=;
        b=CsJfNKalr3wxKXm0p+8KFGjm5S77RdLDAUdnS+yQf76oKkNai+ROkl4+GNalFp5bJ3
         jVguSx/3VZ4CtsOAt9uQulpEGzl/oxMMK2H6fgdGpZuyB/qqRumXrpZu07SY06JAM0wQ
         ZfGvpnwbXZCXLMhZMN+xNN6b+5kLCp0vgFbJd/UxpQG5CQTOx271kCnyRXbjhviZ1Mpj
         su1eElJRx5RxKUU2SWe7yQFQBptiiTW8Ow5ml+5JLAdoPb30jE/JwKdCqK8J+DdlrrT2
         hKlBn35H9XCZK0fVxSEn9RnRhTl+94t+khejIRI88AYllMgU2cRXtPe7qiqUkKlEEvKP
         37vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778591384; x=1779196184;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZwZ3jfJs+6xeTMtYxnw6Lo1u+XTpiWUc2zboWuuAt9g=;
        b=EKuzRgPYvkH1DW7xiOImq45t0EF8M1BFupLg9OVvz5MZKpP4UWmuIGsa3pQgBx+6e7
         04vqRFoY+tsLX3w5AHBpGIosN6QUpy6ZQjUJJT0PXOhyObmnKgry73rJBB1fgCipVA6s
         IK8rCE2JlfrIh0KBOKllClz/WhtkBvZuZ0fpGy7+m+1gKw4edYG19Eu1BR85GzWmZuzm
         9Y3PRxTUn5oKdryduxLn6yT7jcyQ/9XvWFNLEGUT0kB+MmoWzPablrxxgAtYrcMUGAYk
         RQSDlbKRAXwGToFJnR8fHWxDlfLmu4WH+FeZom5hgyYRbI/IzF3gzRR2iv2AMS8b3Cus
         rUdg==
X-Gm-Message-State: AOJu0Yy5pg0hSpU0UW3LBJMZ1d+3J9LaeSPMRSKJqpKBD31p0gFtM+RD
	GLm6PgIx0UsObK+rHc8nFKIyjMKUtNamL5+WUi97onfnE7EIF7tQJ6JHZGv9WLLaDMQ8yXa94Wb
	Z2N5F6kXB+mvDEexl3ZzLIThVNEiSrYv5ulz22IT6gX+jdvU8HGhMaeFhc0OCWcjw7A==
X-Gm-Gg: Acq92OEag3jfmNGaDavLPhcKI94CSLh0VeNF3STDnNDnOyZ4t16a3KDloawtUUk0Nmk
	5itNL6b8AgccProdWa57sKiRH/Ql8kRxVITo5W6zKAYIFpmJMv3ZoCYqbweuuRY8RvmdJgCSY4u
	OFDJ7JaXsj5+xSn9uSVttiG8RR+VwoT3mS8sgOGs2mUxIZuJxM+WYVQF2HsLIp8i4XjzxJ+ACoB
	4qaqXivnI6TOjsjhlUX6FQO5zzZsnet9lJi83RM+NQBJcQ9DVCnAaequo27xNjlJWkJU5qkNt3R
	Kz4Ve8KCmKtPpHYJ/4HM47bOd7lh7syOjNqcQ8DWwnTgY7YnDDa1j37AhloCrV0VMgWTLa44/86
	WodT0YjHetHaeK9Fzir8TouL4+6LLxImdc0fnntJeExpQ1+Gko/LMSINewZkZl6VOVSfrI+IlJw
	aW+wkRrDfjQy6joLarUZwbN89NDlLX8zFlnzI=
X-Received: by 2002:a05:6820:16a6:b0:696:7780:477a with SMTP id 006d021491bc7-69998d22e20mr15563316eaf.46.1778591384380;
        Tue, 12 May 2026 06:09:44 -0700 (PDT)
X-Received: by 2002:a05:6820:16a6:b0:696:7780:477a with SMTP id 006d021491bc7-69998d22e20mr15563299eaf.46.1778591383961;
        Tue, 12 May 2026 06:09:43 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-393f5f3a8e1sm33739451fa.15.2026.05.12.06.09.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 06:09:42 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 12 May 2026 16:09:29 +0300
Subject: [PATCH v5 1/6] media: dt-bindings: Document SC8280XP/SM8350 Iris
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260512-iris-sc8280xp-v5-1-8cc251e83b58@oss.qualcomm.com>
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
        Johan Hovold <johan+linaro@kernel.org>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1431;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=4OKybM59XPsuv/9WXUzXsJ4EBfsWcCDj0GF+r38seOY=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqAyaTaVgaR+8zRVqMMzeUJcbV16/TOLkjg2GEd
 V8Vdv+vMSmJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCagMmkwAKCRCLPIo+Aiko
 1YbxB/0cLBR425ZFemwizwewJ1p0MnZusvFejKh9tfC0f6DS1CniG3eSw5EZKrmtjW8MlRA+SL9
 ABmspuBEoBshnAsDGkopdXmraNMLml0gXoGAwM1EkQkHZe4We7hzyKyFV2TcLZ6xaw2XOz9m5l9
 10LaaMm3Df0QWhN8eese5w+gm+1P+QXulC2tKgTZ23ndcdkqs3r+QTGg3M9xdTKynaN3XmOU50f
 fU71GNv+aVng3jY7Ngp8PjnCBcDGFLkweF5oq8hC7diwUC+0DjLudTzZg81aBrlE67QMSn6FNgG
 hmBdvah4qUIo0wFnUjvpw9XYrt4V4fUJ85kK2xFTeQj0UC8A
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=V+xNF+ni c=1 sm=1 tr=0 ts=6a032699 cx=c_pps
 a=V4L7fE8DliODT/OoDI2WOg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=KKAkSRfTAAAA:8 a=DuJnIZi-_EB7d9bgGRcA:9 a=QEXdDO2ut3YA:10
 a=WZGXeFmKUf7gPmL3hEjn:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: xMjss2plIaRaUJCwtX_wemwwUMNJjR3f
X-Proofpoint-ORIG-GUID: xMjss2plIaRaUJCwtX_wemwwUMNJjR3f
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDEzNiBTYWx0ZWRfXzyU/ctjklRWP
 anB5eEolVLmOsZje2rSkZP/0PPfky/sZvsh4mYCW0i4qUQs2PQD1HGQh4jAlvh+QTPWysOVQPnu
 pLXLWcKOUiaTZj8HWunx4BRck1T8ACkmwqYRDmUNROCr42u2DpoCnvY82qHWshfoZilzQATYIjF
 6d9U0PIKK3/JUARTqygdU+O3cyPAlWcpcdeRHM/gTd5+2zYJOgNL3NFEck+Fw3juyLzF7Zdy+9U
 GaSsRwTf8+to312U7vjDOlEaZHLfNGgIJEeSlCY8y6a831Mo6FnR9wwboi10CeVTzHL3mmjc23o
 Xn0IdiJbINl52oyJe74kVmDH9hqHxKneHjZpq712Cf08BY4/LiAvmUU0qttFpZ2xlBSA8Q3paix
 BER1B9EdUK/nO7bRXgK//K6aROSgZjIpn64c3CHMrdiL+1h0F2yRwnoMBjhS0XcAufJ5GdItjZO
 zuVOp4zUDsXOIULChVQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 impostorscore=0 clxscore=1015 bulkscore=0
 malwarescore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605120136
X-Rspamd-Queue-Id: 51EE25213C9
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
	TAGGED_FROM(0.00)[bounces-61256-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
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

The Iris block on SM8350 and SC8280XP is compatible with the Iris
(Venus) on SM8250. Describing in the bindings that the block is Iris v2
and not Venus. Document SM8350 and SC8280XP IP cores, using
qcom,sm8250-venus as a fallback compatible.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 .../devicetree/bindings/media/qcom,sm8250-venus.yaml         | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,sm8250-venus.yaml b/Documentation/devicetree/bindings/media/qcom,sm8250-venus.yaml
index 43a10d9f664e..1d337275c9f7 100644
--- a/Documentation/devicetree/bindings/media/qcom,sm8250-venus.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,sm8250-venus.yaml
@@ -10,15 +10,21 @@ maintainers:
   - Stanimir Varbanov <stanimir.varbanov@linaro.org>
 
 description: |
-  The Venus IP is a video encode and decode accelerator present
-  on Qualcomm platforms
+  The Iris v2.xx IP is a video encode and decode accelerator present on
+  Qualcomm platforms
 
 allOf:
   - $ref: qcom,venus-common.yaml#
 
 properties:
   compatible:
-    const: qcom,sm8250-venus
+    oneOf:
+      - const: qcom,sm8250-venus
+      - items:
+        - enum:
+            - qcom,sc8280xp-iris
+            - qcom,sm8350-iris
+        - const: qcom,sm8250-venus
 
   power-domains:
     minItems: 2

-- 
2.47.3


