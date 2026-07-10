Return-Path: <linux-media+bounces-67253-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id XEigBGC2UGpw3wIAu9opvQ
	(envelope-from <linux-media+bounces-67253-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 10 Jul 2026 11:07:44 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B2F19738D5C
	for <lists+linux-media@lfdr.de>; Fri, 10 Jul 2026 11:07:43 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Cawtc6ER;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Lyq80u5K;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67253-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-67253-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5F5E23053704
	for <lists+linux-media@lfdr.de>; Fri, 10 Jul 2026 09:05:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2E333D8133;
	Fri, 10 Jul 2026 09:05:04 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ABD13D6CB0
	for <linux-media@vger.kernel.org>; Fri, 10 Jul 2026 09:05:01 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783674303; cv=none; b=lBA9YuLspUEsiIOMcJEpMPGRIE5yE6js2d9tAMARxpYOWFT5cO8hX8fdV7E2grCv1nkFD8JVclI6HxlZDhAzDLMOS0HGbJys8GPLyl0yUJaW5RP761ls02a0ZIWwPYj1IXbw3VM4Yy2AI4TPVqyh/V2eYNlGSGlcYXXXpiOgOlc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783674303; c=relaxed/simple;
	bh=njrkKm3aiN5Zc7CJQtaFlW6IU/Xu6yimySfqW99zRic=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZYwBO5JYzYPG53RTiJxImYxn5pS5DBdZLt9ej1cUwHahhx+6/zJoGZA0bqPFEC7Zp8emX5hFo3MuvhjN0TW6+TMAs+hhts72d3gQ91ZhZM4o2H2V1BrbLqCzQN90/l55q/ii1ZBOCyq2Y5cttYueLrAZgIBsj5iCruUWCvZqZiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Cawtc6ER; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Lyq80u5K; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66A7dW67056455
	for <linux-media@vger.kernel.org>; Fri, 10 Jul 2026 09:05:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hGScOXxHIxlcFY4BY/Y1OfU858ahh8r8M2ytmxZhzuY=; b=Cawtc6ERus/ZEH6Z
	crkdPCDD7Sf9Inkuuwb+pM/J+Ahd7qgTlt9mv6SPtS+PiIYRjfkJK4DKb85G8Yqj
	DQ5NUQBdBMaZFzBMRZtKy3BUKYbj2y/OcSD3XlqtshVQJgnC3GqeSHMRChw9lIzN
	M3rRaQPM0j7K4tO70Jv3HG1JMCJ4BLVw4KeIrlwOb1QsJD46ithUCnEiCduP9ydM
	kC9pjlJgDQg5J8doFCzJI+HL7SnUsjreGlAjEKj1fhyUI0oL3lcnT3RmjSd+c9JH
	5QOViw6yhoxIwjZpeEDsF5e2FzpDO7DZOL9DuaYdCEhYMWrA6Ykd9VWm+kluXYqd
	/dsbXQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fajwta929-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 10 Jul 2026 09:05:00 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8e3ae05d649so9400966d6.0
        for <linux-media@vger.kernel.org>; Fri, 10 Jul 2026 02:05:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783674300; x=1784279100; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hGScOXxHIxlcFY4BY/Y1OfU858ahh8r8M2ytmxZhzuY=;
        b=Lyq80u5KnKFWh6QAVgFsML8rolGPzuivTf0gEqjI3XPf8uBTvE+DskKCs4niKQeSSI
         jMNmnNzw+osWelcYaGVuWETuJ1EUFTrqVhrZCVrTG9NTlJgvLePxITnu52ESDafk/rW2
         YvffJ/ffTeZx0/kOlJjBkqCjyBlhPTIsf6An+hd7rGPSTMUFi3kdnt8712EWt6m17k4m
         XEEm/zvcMInQ3DAfF5Mub2o+A9NXFngGt2GZIfTwOkCztRatJudOuYxkI0wCnQtyVCqq
         8LdmimtoQgFhHWzcwb1XItBCDBpY+hPhXocAGdm7Y2ygmUSJyMHYRxSmLA/8avk3fnzR
         TbvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783674300; x=1784279100;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hGScOXxHIxlcFY4BY/Y1OfU858ahh8r8M2ytmxZhzuY=;
        b=W5Kh3nbsb8FDVDdx/FA22pv7DMKeSFQMFitH+O2QwBuR5WLXKKIN9zZrenZhQfN7eT
         DB8mMYe+XUXnY3d3gk8dEKCgfSquJ0OhEysR3RrZFDetAEASz5J4qD74yPwIKQoXplGC
         2Tw8EWKdNLBQ5mmeWsUhRXgVWFSCzcZ1nawQaW5dX36hI2U4PimdZ/Ahk/kWjR6F9SAc
         n4Z6+lWCKSGkOeq0MrvFpo8/VVaFiho+1vVPJ4z6JaJcSoE3KdBrDGSin9nA843k4xF+
         uKkIjpS/JCayD14KW2HSWXGXnfmWHfnzLRNNfAXFRcgE8OMEOCLg3kUFIHVtLKwg5b0P
         dAxw==
X-Forwarded-Encrypted: i=1; AHgh+Rqcythn9sa1Tsir/CkEMX2DuaxvI1Ty8yDYHLnsqsw3jWx5MQTqax/3kCg+ygFHWQmSyjOD+YcIe/Ky4g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4CzAm7ZtYtGOVd2KH62CIm/nuYVD2s4HyFCCzf1iy70IrgEEN
	1ilHyHB3gULnOktrqMJw3wyqvDa8QoUeVbqUqqSG4FzxsNXvSS1KFR6ktU1J8ovZYNlFbe876+S
	NiO7ObBGc7oniS/S69n9a75WXMgtcgpSga63m6eaa474UrkGzNoczwZCWWvK0jPrjDQ==
X-Gm-Gg: AfdE7cm80yitu85CqSLhO9dQ6TImueCL0JOI2pAzwMxUSwqOzV/qJbC6H5Pup8XZ6Ej
	CO2fwd08QTUM/P2PPHNyIblCChEZ9sbK/rkmn1aIsibnHIeWrrrgBj5lwVlIZfm9ivTgzAJHzau
	fwxCR/sIKZ/dxpjjYcxUh4q1sRJlCf0jWY/v3pr4loIMFIfRp6aHPpZjGc4J0dHnqL5N5iPShYH
	XVcUFft3mXQcHnivvHZB4YhOsW5a63DqsuBQrSfBrlyOp4Tk6+sff8kEKKcKhENBdaUSeGvCgq0
	BuJMlF0Lr71YV9nTd7WOA9pIXMO6NiAxx24NgpdBsa8jSLo4A/WJ62kfyKzIAw4/FogNUnpiC9Y
	VeUWfGUuSGNKkU7y1sDjiIudjl5logB/WNgrBgeuQPdeVvSkE7NgXr1vwbe97en2OrrY2aB0m4j
	IboIhxRPICPzAqT3N/AtmWnn/6kT0GEBXrVj/SnukBy6NjVqcIbB7sDGMg6f+w2A==
X-Received: by 2002:ac8:5ccb:0:b0:51a:8d31:9a06 with SMTP id d75a77b69052e-51c8b403b76mr120422781cf.16.1783674299604;
        Fri, 10 Jul 2026 02:04:59 -0700 (PDT)
X-Received: by 2002:ac8:5ccb:0:b0:51a:8d31:9a06 with SMTP id d75a77b69052e-51c8b403b76mr120422501cf.16.1783674299240;
        Fri, 10 Jul 2026 02:04:59 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([82.64.236.198])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15dfda815dsm259932266b.36.2026.07.10.02.04.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 02:04:58 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 10 Jul 2026 11:04:49 +0200
Subject: [PATCH v4 3/7] media: qcom: camss: Add V4L2 meta format for CAMSS
 ISP parameters
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260710-camss-isp-ope-v4-3-51207a0319d8@oss.qualcomm.com>
References: <20260710-camss-isp-ope-v4-0-51207a0319d8@oss.qualcomm.com>
In-Reply-To: <20260710-camss-isp-ope-v4-0-51207a0319d8@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-hardening@vger.kernel.org,
        devicetree@vger.kernel.org
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=XOYAjwhE c=1 sm=1 tr=0 ts=6a50b5bc cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=MDeckJw97qnk8wCBExTehA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=NHZ7RztTnFrf7oJu4FoA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: PtWrFQHQPhOviAOOASW2jWrKhNohJrEO
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDA4OCBTYWx0ZWRfX23dGIM6g6YZh
 DVYmQ3OM8Jh6R2X1XS6hPASk/lBl5GEVnj6oK5qGES713wYclrCm+qXROsP4GQ0dkVef/BCn710
 Kn3bwal7yWDg7ZH4gt3JdF6UcCxE/RE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDA4OCBTYWx0ZWRfX7BVR5XOHwukF
 B0bD0CfRpAHVOTOYPuloxmrFuW6HBjxtW5umIYAuCGMV40tAng4GsBunspJBVPWbGieTBJ+J9rs
 YizcjbAoKjNehOtaw6JttgNHlFMLJQZ9vO6+l3mGRpo3Tk0TPfBt+TwDn+PB1Y/At9I+89nTfhu
 a90utgYUSDhDku99WedI/JG+bgEvYJwSCSig+Vn1G7ovRseK2rw2WqNzsqK90V8W23AlYA2KO6g
 JLREikPZbZkmN0tuygu13NVglEp5MnLkGocLBROZ0W6ks+39xvkk9/ZpJYq/C7dDQOfSAbzLlA6
 GqpdXpkgfKFTNg27UIJk5x0OfM/+Rawcd9fcykyQJjRMfj0Pg1lpFEtuyZb345p68184B/B8pAq
 2fjiGUoFNXBJeNGSKWX4i5RBXrYK5/07CtO/g3qn97OdHNubJ7MaS4p9bxIffmYUoPYD87RAUyU
 Zar3vERCdkmJM02CR5A==
X-Proofpoint-ORIG-GUID: PtWrFQHQPhOviAOOASW2jWrKhNohJrEO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_02,2026-07-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 adultscore=0 bulkscore=0
 spamscore=0 priorityscore=1501 clxscore=1015 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607100088
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-67253-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:bryan.odonoghue@linaro.org,m:vladimir.zapolskiy@linaro.org,m:loic.poulain@oss.qualcomm.com,m:mchehab@kernel.org,m:kees@kernel.org,m:gustavoars@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-hardening@vger.kernel.org,m:devicetree@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[loic.poulain@oss.qualcomm.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B2F19738D5C

Add a V4L2 meta format code (V4L2_META_FMT_QCOM_ISP_PARAMS) for the
Qualcomm CAMSS ISP parameter buffer. This format is used by the params
video node exposed by CAMSS offline ISP drivers (e.g. OPE) to carry
per-frame ISP tuning data such as white balance, color correction and
chroma enhancement settings.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/media/v4l2-core/v4l2-ioctl.c | 3 +++
 include/uapi/linux/videodev2.h       | 3 +++
 2 files changed, 6 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index 98512ea4cc5b9d725e1851af2ed38df85bb4fa8c..01593493dff63491a36cfebe404d26df34c95838 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -1471,6 +1471,9 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
 	case V4L2_META_FMT_C3ISP_STATS:		descr = "Amlogic C3 ISP Statistics"; break;
 	case V4L2_META_FMT_MALI_C55_PARAMS:	descr = "ARM Mali-C55 ISP Parameters"; break;
 	case V4L2_META_FMT_MALI_C55_STATS:	descr = "ARM Mali-C55 ISP 3A Statistics"; break;
+	case V4L2_META_FMT_QCOM_ISP_PARAMS:
+		descr = "Qualcomm CAMSS ISP Parameters";
+		break;
 	case V4L2_PIX_FMT_NV12_8L128:	descr = "NV12 (8x128 Linear)"; break;
 	case V4L2_PIX_FMT_NV12M_8L128:	descr = "NV12M (8x128 Linear)"; break;
 	case V4L2_PIX_FMT_NV12_10BE_8L128:	descr = "10-bit NV12 (8x128 Linear, BE)"; break;
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index add08188f06890182a5c399a223c1ab0a546cae1..011026194a20cde22a374e6fb2570cbc6bced230 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -888,6 +888,9 @@ struct v4l2_pix_format {
 #define V4L2_META_FMT_MALI_C55_PARAMS	v4l2_fourcc('C', '5', '5', 'P') /* ARM Mali-C55 Parameters */
 #define V4L2_META_FMT_MALI_C55_STATS	v4l2_fourcc('C', '5', '5', 'S') /* ARM Mali-C55 3A Statistics */
 
+/* Vendor specific - used for Qualcomm CAMSS offline ISP */
+#define V4L2_META_FMT_QCOM_ISP_PARAMS	v4l2_fourcc('Q', 'C', 'I', 'P') /* Qualcomm CAMSS ISP */
+
 #ifdef __KERNEL__
 /*
  * Line-based metadata formats. Remember to update v4l_fill_fmtdesc() when

-- 
2.34.1


