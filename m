Return-Path: <linux-media+bounces-61430-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4JWeCax1BGqdJwIAu9opvQ
	(envelope-from <linux-media+bounces-61430-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 14:59:24 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C341533790
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 14:59:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 78B5931E3C25
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 12:51:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E388145BD4E;
	Wed, 13 May 2026 12:49:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YkgrZ7k8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PyilkDpj"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 197C043D4FA
	for <linux-media@vger.kernel.org>; Wed, 13 May 2026 12:49:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778676561; cv=none; b=NLQ3hAB118mCL0UBxumMFYTdUMObKBXvSAOJMU7+4Xdu2uTVqgt16NFYwRF5ep/5YNwX4ESIqn2ePbZOm/FkSciSYyB9ldXWkuMHKIaNZ9bzCxEi5sbyZ37TtyutrAHy0dDxA2mAQAruyy3YIN6/Xke1kUv2FXM+Oa4m7iDhhsk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778676561; c=relaxed/simple;
	bh=9MMSW5/Ed7QpArLAviQFc6KStndAKsio49V65Hx+FaA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hLty3RwidzrRVydZ3gISpo1+mDJOwYcTVnSVwBBZqz/arUXhf0gpPBd5TbY2jQniioF0NToSwGIOLJQnXzSjAubcrpZ4K+X0/K8ypTIh10S+WMmDE0q1/IHDEAvI7JejbP+Q0spEDkmlcwCZQfee6zTwbWBXyBsmuGynjx+E+Bk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YkgrZ7k8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PyilkDpj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64D8nBsG2887841
	for <linux-media@vger.kernel.org>; Wed, 13 May 2026 12:49:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RNMcPvu0+FyJ/bhqguS0n95+1Sk/5HnVopj7l6K+ut8=; b=YkgrZ7k8Hz4DAeEE
	CLjsJgOhs/4ujwqz11UXV8rm/ICqMwveksPbdXQvq2sL/lwd8vTHdTsNLs7rCDRk
	OueDZPyWs2BzYF3/gRd8+si5ZHM+YjWoTA25Kjy/M+F0Z9OsV8zEzueNLVcbNi45
	5YpHQMWnqsTLRHjfcy0OITa+K28wn2EWJ0WC74mY6gXO1JSaDil+OEvqHePDKCML
	VMLV8SYHNFHnzz22GQ+exwyPUgowGd9LiXF27Oabm6umL+/sc2p/cSIcYYML/HVV
	plte4YEe9ESoVEmTRZIwm32axmOeZPH32jElMeuf8IO//lbDTsg9FrS2iFFVwid/
	8iKxeg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4p4ggv5n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 13 May 2026 12:49:18 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50fb3403e99so129925911cf.2
        for <linux-media@vger.kernel.org>; Wed, 13 May 2026 05:49:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778676557; x=1779281357; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RNMcPvu0+FyJ/bhqguS0n95+1Sk/5HnVopj7l6K+ut8=;
        b=PyilkDpjhQfcDayZ5PPROGD53cF8jclTb0DsKvzLFHvlZIyDsuKGhB5fkWXHMBjgIV
         ThHd/kwLdOgQFuyu5F0xDVz+3tN7u1TvY8lqHGqhAnfEEPrSAjrBoMnah6km9StvXEJ4
         Fw6yL6gPj6OQ3mY/ddER7g2+jgc2qPHu2V27WD/txFXN+6AAFmH/mcfh6IC0JINprM4a
         pLIOeHlqrDL9V+7AdTwQWVtwJoNYBS7bhesrLE8/TPTZtzvIJ+WGYqc63ddSauRkK2I+
         dAP0zadngAU5iJNzpjLoAnMy9CFBn2FqnCYtfKb4kRfAY1zXlR7mfBXTU4iDCJ2bFF31
         xk5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778676557; x=1779281357;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RNMcPvu0+FyJ/bhqguS0n95+1Sk/5HnVopj7l6K+ut8=;
        b=FBOtIGc3AmvSU/otw36G1J/B5rgMlW8jDQxMwzhcbAipvl0D5BV11N/1sqDlCcDykN
         2V2yfS0mqtURrICZsWRDW7i8odh3rcysjgoOjXNv4KlI5KIOWvIwnmQDhdtMvB4RQyvm
         M/yB/3KFozixAyUefw8Ww3uD01A+SnNSlS/tdTkUDk7oUKjYf4hdT8g0hsQD9LWz5rAw
         ZkJPoB14CdOEEzQ3AzVgeEillkznuZdzAs2aoTmw1BtK7O/dzBLZWcQEdZ/lWqBZVpgU
         8C/+oYExEUW2RB/kTGfTB68exUZlzBK2pof1VOQYC1+Pm28WCWgUIVDNdfxDk/USFX82
         1+LA==
X-Gm-Message-State: AOJu0YwilK3fWLiwJjkmRqv4g3bR3yRpYiSTiIImrrfAKHnw9Ir86Rev
	pgpIgFHFXvgx+3xXl1+tuuUcfvtG/DqXadhfCOJLf2C24Bv3BS6PUZTwiQ6qbDuny1O4WWPROKB
	XcJBGRlawwOXo+Z7hEWkg6eDQHFIpaC7uqWibOAh6uovwtodaB7AOuCmP8lNd1OQYXA==
X-Gm-Gg: Acq92OHhMkyyiG7tjd+ct2p6/vYoQLcb7yFZlGlw7RHt/aDWv47UGqH/cx3DDivtG+A
	mc1pNosF57stZDdyz+Z3NclSf4iO7NrulmkqDg57COmbJhpc2Tprhfi6kHBGyJouZG1phSv1xpT
	SRjkC50yzWVtnxRGI+EjKZ7W/j9NIyAc2xrT7fBha0cyYkfDs0Op1IB/svUFfPc+TYDn7sRq6JG
	fXER17XptafZPix2shSQOvLpD7j3PW68LbDs3bYIWMHh11pPe0sgWHsPZqwKzaMVzrFzVbsBydi
	PfSzd1ZDbyWiMtf6jWqIQw2Wop9KKYr2+BmQ8Kj/rsdGBlx48+70PwVOfUAElm28g3HrKSnZM6s
	YZ1PbzhouumdoQliEiNke8Xt5c4rNdGjd+EjXvFt+W0f0w+8Vl824Z3btt9MsC7UvxO35sRjlU1
	92SYIzmwa4mRxp710B37RxkeUtwuB36surwqw=
X-Received: by 2002:ac8:578f:0:b0:509:26f4:64f5 with SMTP id d75a77b69052e-5162f60846dmr40360311cf.48.1778676557413;
        Wed, 13 May 2026 05:49:17 -0700 (PDT)
X-Received: by 2002:ac8:578f:0:b0:509:26f4:64f5 with SMTP id d75a77b69052e-5162f60846dmr40359961cf.48.1778676556935;
        Wed, 13 May 2026 05:49:16 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-393f5f5f15asm41106841fa.17.2026.05.13.05.49.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 05:49:13 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 13 May 2026 15:45:38 +0300
Subject: [PATCH v2 04/16] media: iris: Introduce interrupt_init as a vpu_op
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260513-iris-ar50lt-v2-4-411e5f7bdc4c@oss.qualcomm.com>
References: <20260513-iris-ar50lt-v2-0-411e5f7bdc4c@oss.qualcomm.com>
In-Reply-To: <20260513-iris-ar50lt-v2-0-411e5f7bdc4c@oss.qualcomm.com>
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
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=4871;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=BLAFo17mDNzRt3RGOIKqa5vQlLgViburqFmg/i4bsbc=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQxZLsUPCzE3Zx8QCuksX+jzjdS3bvLQpvY3t6nvfZNnSW
 s5o0b5ORmMWBkYuBlkxRRafgpapMZuSwz7smFoPM4iVCWQKAxenAEzkrAEHw6awz3NmOHiyzrV+
 aupn9Ny2Y1X6CT51qUttL3ZenaTE/rOn3bx4x6ZHjlUH0t1zr1fyhcr7JdhcTElWfsr8TW1d2zL
 B3LythoFfHrYu31Hp63lvt7nNg/bCzf73z3vtT2sQuF/qqSHAqP329+PCQw5HG5vKNziUMWqp1O
 sIMu/gcjrDt4Bt3utdDiqMT+9m5Yi/Fr0zR97Za8VyvZIpPX/4Cst6bZaJLV057Yc4g41+TfvG6
 W1hot++aV4y85xpvadIg+36eUP5+QI7p6/7ZrnzlROj4EbX1SE3knrVW5a4WN4x78/k1Xn6Z9aF
 tDNff8j+kPscV3oyrdyz/wFT9/zeI2vP/Hz8xMi82XsNAA==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: WOEWjsjtpV5d9MlX-5XY7J3GnzvggAsY
X-Authority-Analysis: v=2.4 cv=DOS/JSNb c=1 sm=1 tr=0 ts=6a04734e cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=2EYiHOum3YQmkHKk0wkA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: WOEWjsjtpV5d9MlX-5XY7J3GnzvggAsY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDEzMiBTYWx0ZWRfX7Za1ZGAvEgMh
 ZGJx68ZqhvDmC2AJEeZJedMot9U+jG9diMXKcagrclSLBU5fUophIn/apVA3oEl3k/oz5TBA8Da
 l+Z+HLgXt8lwtmlSNvc2Od36lxZAhk69xOmTjIb8cntwRuT7tJdjTbD0LbJwU3dmRDUw0Ym0Aua
 bs1Ty85ChUR0J94horFM9TFGWWd8RmLkYX3RhwrIxKuOtUqWriz/aRcXUULzvqUU+MnG5CghXM9
 GozYlaIHRJleSuZ4K/4olAHViwIZlhMQ7oy9bO+QiqMlFXu4nW33sOXyv0DVlmbn+C1KO157/Zz
 tyaWRbPEhl1+vTW1mjv4JTENq2u+/qeu/j9TmPtK+BKkukNKCqziT4b0j4DFAUcSwOXTQN7c92w
 K1TIQrWmJkCV4/02ufjA6fGRIJYjMM+6VytIchWIndpuCC3kXByHsY4d6AemmD5wu/ivBM8Vm9C
 jDOm3yAX7lZ63TVA87g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_01,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 impostorscore=0 bulkscore=0 clxscore=1015
 priorityscore=1501 phishscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130132
X-Rspamd-Queue-Id: 8C341533790
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	TAGGED_FROM(0.00)[bounces-61430-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>

The interrupt_init sequence is currently shared across all supported
devices. Starting with Qualcomm QCM2290 (AR50LT), the register
programming would differ.

Move interrupt_init into a vpu_op to allow per-device customization.

This change prepares the driver for upcoming hardware variants.
No functional change so far for existing devices.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_vpu2.c       | 1 +
 drivers/media/platform/qcom/iris/iris_vpu3x.c      | 3 +++
 drivers/media/platform/qcom/iris/iris_vpu4x.c      | 1 +
 drivers/media/platform/qcom/iris/iris_vpu_common.c | 4 ++--
 drivers/media/platform/qcom/iris/iris_vpu_common.h | 2 ++
 5 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_vpu2.c b/drivers/media/platform/qcom/iris/iris_vpu2.c
index d61902c9a213..d49d22b14753 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu2.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu2.c
@@ -46,4 +46,5 @@ const struct vpu_ops iris_vpu2_ops = {
 	.calc_freq = iris_vpu2_calc_freq,
 	.set_hwmode = iris_vpu_set_hwmode,
 	.set_preset_registers = iris_vpu_set_preset_registers,
+	.interrupt_init = iris_vpu_interrupt_init,
 };
diff --git a/drivers/media/platform/qcom/iris/iris_vpu3x.c b/drivers/media/platform/qcom/iris/iris_vpu3x.c
index dc02ced1b931..c3b760730c98 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu3x.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu3x.c
@@ -262,6 +262,7 @@ const struct vpu_ops iris_vpu3_ops = {
 	.calc_freq = iris_vpu3x_vpu4x_calculate_frequency,
 	.set_hwmode = iris_vpu_set_hwmode,
 	.set_preset_registers = iris_vpu_set_preset_registers,
+	.interrupt_init = iris_vpu_interrupt_init,
 };
 
 const struct vpu_ops iris_vpu33_ops = {
@@ -272,6 +273,7 @@ const struct vpu_ops iris_vpu33_ops = {
 	.calc_freq = iris_vpu3x_vpu4x_calculate_frequency,
 	.set_hwmode = iris_vpu_set_hwmode,
 	.set_preset_registers = iris_vpu_set_preset_registers,
+	.interrupt_init = iris_vpu_interrupt_init,
 };
 
 const struct vpu_ops iris_vpu35_ops = {
@@ -283,4 +285,5 @@ const struct vpu_ops iris_vpu35_ops = {
 	.calc_freq = iris_vpu3x_vpu4x_calculate_frequency,
 	.set_hwmode = iris_vpu_set_hwmode,
 	.set_preset_registers = iris_vpu_set_preset_registers,
+	.interrupt_init = iris_vpu_interrupt_init,
 };
diff --git a/drivers/media/platform/qcom/iris/iris_vpu4x.c b/drivers/media/platform/qcom/iris/iris_vpu4x.c
index f608a297d4a3..90ccdc0d2a07 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu4x.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu4x.c
@@ -369,4 +369,5 @@ const struct vpu_ops iris_vpu4x_ops = {
 	.calc_freq = iris_vpu3x_vpu4x_calculate_frequency,
 	.set_hwmode = iris_vpu4x_set_hwmode,
 	.set_preset_registers = iris_vpu_set_preset_registers,
+	.interrupt_init = iris_vpu_interrupt_init,
 };
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.c b/drivers/media/platform/qcom/iris/iris_vpu_common.c
index ff0070c85ccf..59e4d68d042f 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_common.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu_common.c
@@ -31,7 +31,7 @@
 #define UC_REGION_ADDR				(CPU_CS_BASE_OFFS + 0x64)
 #define UC_REGION_SIZE				(CPU_CS_BASE_OFFS + 0x68)
 
-static void iris_vpu_interrupt_init(struct iris_core *core)
+void iris_vpu_interrupt_init(struct iris_core *core)
 {
 	u32 mask_val;
 
@@ -474,7 +474,7 @@ int iris_vpu_power_on(struct iris_core *core)
 
 	core->iris_platform_data->vpu_ops->set_preset_registers(core);
 
-	iris_vpu_interrupt_init(core);
+	core->iris_platform_data->vpu_ops->interrupt_init(core);
 	core->intr_status = 0;
 	enable_irq(core->irq);
 
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.h b/drivers/media/platform/qcom/iris/iris_vpu_common.h
index 21ed4c9bd5e3..9151545065cd 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_common.h
+++ b/drivers/media/platform/qcom/iris/iris_vpu_common.h
@@ -23,6 +23,7 @@ struct vpu_ops {
 	u64 (*calc_freq)(struct iris_inst *inst, size_t data_size);
 	int (*set_hwmode)(struct iris_core *core);
 	void (*set_preset_registers)(struct iris_core *core);
+	void (*interrupt_init)(struct iris_core *core);
 };
 
 int iris_vpu_boot_firmware(struct iris_core *core);
@@ -44,5 +45,6 @@ void iris_vpu35_vpu4x_program_bootup_registers(struct iris_core *core);
 u64 iris_vpu3x_vpu4x_calculate_frequency(struct iris_inst *inst, size_t data_size);
 
 void iris_vpu_set_preset_registers(struct iris_core *core);
+void iris_vpu_interrupt_init(struct iris_core *core);
 
 #endif

-- 
2.47.3


