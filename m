Return-Path: <linux-media+bounces-64678-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id urWoIzDSK2raFgQAu9opvQ
	(envelope-from <linux-media+bounces-64678-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 12 Jun 2026 11:32:32 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0995D678524
	for <lists+linux-media@lfdr.de>; Fri, 12 Jun 2026 11:32:32 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=GpWJqQWX;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=koVoYiSq;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64678-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64678-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 10B61326F2E9
	for <lists+linux-media@lfdr.de>; Fri, 12 Jun 2026 09:27:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D920A3D649F;
	Fri, 12 Jun 2026 09:26:29 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36A063A9DB5
	for <linux-media@vger.kernel.org>; Fri, 12 Jun 2026 09:26:28 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781256389; cv=none; b=Osln4B0nr40GW0uu34d7Tz1g/nQMM44vOyOwZv1/QuK0TPbZ/NacWkR0lKaQ8ByohDCAOGEPh34EPjw6c/XlVxZ3x4qY4WzMvsI8TXvIj5rMRfODATfr4Gz1pKPzsERhBJXdwUE5+iBXBt3PbxnRREMRw425MAp/jC6B+d0l80w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781256389; c=relaxed/simple;
	bh=RfGmISJ4Tg+rlJIDtM2rxs9yeQZR7HuRyIw8EI1Vrgc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pIohADeZMKbC/+P6pnG8AgDJ0nKoMULUuL6mvSKFYY3WYyMFeOlQMUc4EK+zJgxJC7xUoMqtEa2fsTC60+1/KJwTeorgFo/RRpYNMrm727EmjbZrC0+sX7k9xe/x4+HXmoHym/3rZw6SkvDl3pWNlwK/R5ZuUfnAtN1zkB22Kv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GpWJqQWX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=koVoYiSq; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65C39mGJ2497233
	for <linux-media@vger.kernel.org>; Fri, 12 Jun 2026 09:26:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+lsgrKk9p/S2kXHtUz8qoicwfhLPPm3xQs1fSPkm5/g=; b=GpWJqQWXfweDwNmj
	6xqtwlX9roDmCLyyowmW242yENQ/um8sW0UEfooqoTFZdcpLnPZszyJjh/7ae/sd
	pQfcpTgowSTpGTJvWMdNk64VJhZU3K5gICyfdculiAHN/a4qrf+9O9M/1scIjFyn
	v9pRU+6BgOvmpHDCNvtbakyXVmO6MyLwJ3nlaPxtvsRdgpIzIuD2cPMQe9Y2E2Xo
	jsHugN1yRivPXZFa6yExAR9v57zNWoL39JOss8YpEKHR+3RYHWy+65Vx429dd+la
	Nc2lrDRjp4ZA6F+GEXZapVKM1wYlAn2onFfLm6mEZjI752G1HT1xFFtCPqO65aaC
	nNmJ9w==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4er0x7jxrp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 12 Jun 2026 09:26:27 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-963a96abbb3so829992241.0
        for <linux-media@vger.kernel.org>; Fri, 12 Jun 2026 02:26:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781256386; x=1781861186; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+lsgrKk9p/S2kXHtUz8qoicwfhLPPm3xQs1fSPkm5/g=;
        b=koVoYiSquy4AW32/E1upwluz1iZu81ljNmZrKP7JYpJEcku4zUyGAHrGq3asgQ/33b
         1MMW8PelbbFZjLkXdWZWrHtdlNap+YRDsDcr1MisQaTYO6NSZrj/gDZc30us3Ba7JSFC
         TKM7ZJk9K+dRX22YmorAf4TwmSzA8r18eTY9OmalYpHyMufc3VdkgQoHSkanMsMvSSZQ
         ewhx8MuCHbVu1lwgKkcgBfoBaL6+ePCs+3z0sdqHdt4PgHp2Jf0FoDon8YZ8xdS6BR8z
         cetn423KAzvJNxK9YZeN6TDcU8+RKAE2WhtKXqOPUyOB3Z9+tPl2fV5zv0TbrjefdqUL
         n+Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781256386; x=1781861186;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+lsgrKk9p/S2kXHtUz8qoicwfhLPPm3xQs1fSPkm5/g=;
        b=qycrD1EpxbtGYYrJDB8E1i3I0TsDPdKCwLp3/iwbV4HjpP89+CqNxVe4jb8VkQlbav
         s8BQi/gfrtqH02JFxy0ExS6EJ9D4ZuBTXVEDTHEuR7gccT3Q8BHBVKrzPwNh7NRTB2PF
         +f80Z7QnAQ5ndMi09+1DV9pIZNkcI9QNsxGF4lSNxZkymJiREZrL7ZnLLBydN0Zuu6GE
         pCpBQlJt7gKnew7RilT+B60CX1buwCZgJLaxPzdrauQ2HSD6Czkud2C6FAIVj/Y1T+yt
         r57hvXD7Jh0wRex6VHbnunO1JkezD7/YS9Z3yWXXAZiUE3a5IjeHZ4d/OcS4mkKsSuXX
         RtjA==
X-Gm-Message-State: AOJu0YzfXyWcyIrIYdLwcMErvpaUMSuTLJaaUSAEERx4rEqYTttyzoHG
	rA0eVsKuGwg+BnH3wwW9BMkMHsaBeznkVtONPbdJtBgjqAxdTeu+fYPrcHX8QSU7QscuH/YbW/a
	w4/fH0NLX/4vk/q7ZWaH5pxskW2f0ytjld0iPVkPrvDvKPKncTpV1xiMP1JQKxSvSdg==
X-Gm-Gg: Acq92OHW9Wh8Y1CItBJanRYc8DYDXl91eAP5tCZ0SNHlBpkADFi1ZVEt2dtxr5iGnCz
	es4yrPs4F4pvTgv5EZOj5aGONFUNWmoddI9wIxTrNH1/vh3c+QhMOaqyY23Bl6dfi+sEvEtsWfO
	gECN0rrmdEk7iHuhFWb66zd+flwNVm1a2egsdyLwmXrAY/wzJ5JLdaonpxbYkuUJNpOixsjsHuF
	75hg+O00XrfpypnZ+Ug4v7uTx2O1NZf0nZgb+OHv3VSH8OuB2DsEmjbAwyyWLkfKLbYNi+sp0cF
	aHOK1wFcemoO57o80YGcSIvoP1UmVdP0Iv55JPIuM37XjyUj1eNjIdEECTG7wQpNAztkAy+TXTX
	RNtB4jwyCx1jAE0kEOPXOWy5lhQdJRkK5xXS1nFQyEcNiZuJ/4NXYJD28kYk3q58+dnt7HON0ek
	bXGS89veZH13j0K6zvlEyHqNtA7rjQN+PxEo8=
X-Received: by 2002:a05:6102:5e8b:b0:631:2624:e5e7 with SMTP id ada2fe7eead31-71e88c3d34cmr796754137.14.1781256386609;
        Fri, 12 Jun 2026 02:26:26 -0700 (PDT)
X-Received: by 2002:a05:6102:5e8b:b0:631:2624:e5e7 with SMTP id ada2fe7eead31-71e88c3d34cmr796737137.14.1781256386209;
        Fri, 12 Jun 2026 02:26:26 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39929f190ddsm4560191fa.19.2026.06.12.02.26.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 02:26:19 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 12 Jun 2026 12:25:48 +0300
Subject: [PATCH v4 16/16] media: iris: constify inst_fw_cap_sm8250_dec
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260612-iris-ar50lt-v4-16-0abfb74d5b3c@oss.qualcomm.com>
References: <20260612-iris-ar50lt-v4-0-0abfb74d5b3c@oss.qualcomm.com>
In-Reply-To: <20260612-iris-ar50lt-v4-0-0abfb74d5b3c@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=901;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=RfGmISJ4Tg+rlJIDtM2rxs9yeQZR7HuRyIw8EI1Vrgc=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqK9CRDFsqLGDWYoOyOaCpvBHq/7rzgZWJ/wHIO
 WZ50XFUH+mJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaivQkQAKCRCLPIo+Aiko
 1VpRB/96OpmATW+x0xCVpCVxqXtI4/D7EodX72lSX7Tlb2+zEjDX/V7TNre3/9TSkWmegtuL9Mp
 m/4HCTfCQ+btfddAnZDgBztbUhjIarIQzWH6wHnC5FsUHNCPeoUEP1Qdsoup6YMeYgVuZH8q33c
 8jiqc66tOSghzn+S7jXRMSVFwqJW5v1E30FSzZyI6MH4GK8gQhZoypj/gn9wRW3MenPl58UX+w3
 F31p8sHvLEvhh8376Fxd0z/Q2WFPwrdnGWsgKnACt6RrKuMH6bAJ+ZALiiuq0hJukNKZsYyz0lH
 1MbHGMLuKu6uq1Y5f35BUQ03pE5kk0ndlIrZpIKJ/asjsLUu
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: 1wss0tbvvOygIQ78nV2n6AP2lRnLqDkB
X-Authority-Analysis: v=2.4 cv=c4abhx9l c=1 sm=1 tr=0 ts=6a2bd0c3 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=aSZcYj2XgHFsS6ESuJkA:9 a=QEXdDO2ut3YA:10 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEyMDA4NCBTYWx0ZWRfXwvRqq7lobY/P
 QIpShxgeyR2S4KS1/KANDdOvAB1FXAAsKT99Zp1Km90XbIRgaMgnbxBt8yiOWfmlhGIT3W4LQ82
 +sgKLuZPI7IVg5UXx5oZc/FPj92Q9smGJwIn5kDsahMxdUyoLSRTe3v+NFbiO9SrQZ8EEUhV1F/
 M1HezU8Y8iu1k8DfEilQfX4qnM89Enme8BeihQ1215XaMKo3AdIXXlE5yVilBrRYOcmXOf73xlk
 Bi6VgTSJIeN7fPpZlJNs6/oLr1ZIyW9SDUyq0XWtVjdkDF+8jFJEB6CVp7sNQ3dlXO2IMFH7qXP
 nhtwMxCj2GKK42PrIVV73ul+OP/Y/O798qy35xsijYKJpjfpJHxlO09XBT4+ZwwRuuNiHKMjoxY
 DFDg/1X6QVHb4lFQBFB1fT75QCr6+Fad/QwEvgvWUbrxSjGF8peLEY6VcXCgPtRIass3n1haN1Q
 28G1vm6fExjMvYTNJ5g==
X-Proofpoint-ORIG-GUID: 1wss0tbvvOygIQ78nV2n6AP2lRnLqDkB
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjEyMDA4NCBTYWx0ZWRfX3fBDO/utS2oE
 KSwwNkFA7EMl16eszpmxVmDebefKWuT1qXis5QNtCJG1fTvd0+ky1tzPT3J1//cxgDGFjHZl13E
 CUM6RUMfueJEjYNzaT7pHy1qMPwoyU4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-12_01,2026-06-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 phishscore=0 priorityscore=1501
 malwarescore=0 bulkscore=0 suspectscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606120084
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-64678-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:vikash.garodia@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:mchehab@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:busanna.reddy@oss.qualcomm.com,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:dikshita.agarwal@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0995D678524

Mark inst_fw_cap_sm8250_dec as a const array, the data is read-only.

Suggested-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_hfi_gen1.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1.c
index f57af31dbd9f..a8819470f703 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1.c
@@ -13,7 +13,7 @@
 #define BITRATE_MAX		160000000
 #define BITRATE_STEP		100
 
-static struct platform_inst_fw_cap inst_fw_cap_sm8250_dec[] = {
+static const struct platform_inst_fw_cap inst_fw_cap_sm8250_dec[] = {
 	{
 		.cap_id = PIPE,
 		/* .max, .min and .value are set via platform data */

-- 
2.47.3


