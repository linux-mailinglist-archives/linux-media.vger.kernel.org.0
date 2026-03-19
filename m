Return-Path: <linux-media+bounces-56288-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cKRDJUiRu2mYlgIAu9opvQ
	(envelope-from <linux-media+bounces-56288-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2026 07:01:44 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id ED75A2C677F
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2026 07:01:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D6B5C31682C0
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2026 06:00:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5136E39DBC0;
	Thu, 19 Mar 2026 06:00:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cAOMVGTP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VQNk7fd3"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5113B399011
	for <linux-media@vger.kernel.org>; Thu, 19 Mar 2026 06:00:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773900002; cv=none; b=trBSCv/D1JUPn62mCAiOBLZkMF4gHxC3MLHI4V46GY70hfUScoXldb+XyONBrOg5FaSiZG1l2dtEc864+3ietjW7Xvr9krb+0EXV/9AQFzq1A4s1z3dQfAtsVj/vSXPNj6ZtgTJ7KXhGSS3bnh70QmPgdolAPUFFU0tTPZR8reo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773900002; c=relaxed/simple;
	bh=phlz7lNAhvXN0hEIT6ClaBZaJ7P5qlMteCFYP4WlGM8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rUIDZrYnRxwa6MlZFORj0+chvFwMO3+5rL1T0C5xpSE+iGl0QI4VQvh3hH2gLNlzgLc7dT+EB2kFumItImXGRbTNzDiBfEpVl6/2eMnP8M9fTW7Si03HRlIjkr/B1lmrA4+8bWagAchlEQ0x0UWVn4YJSm8hoYL1Tdd0kLb7z3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cAOMVGTP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VQNk7fd3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62J5XPbC3574155
	for <linux-media@vger.kernel.org>; Thu, 19 Mar 2026 05:59:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OflPgbJUeB9MU802D7Qb7B2sM8brxEZYSrbm3iiUBSI=; b=cAOMVGTPIR4NqfhR
	FV6kHFAd5YS7Pg3Q7vlDM9HvJrnNj08R/OjinKdmsUbFk4h66wSY3QL3KE2DDazw
	nBSwUA51LVGI9ltdFvlbMAwuB90uJ5JvB3mPSUazT5Y3+M5BYWg7DHtouiNsWApC
	e2nO+8z8P6PAKf1jEGMtuZFIakgRwmqp0yxPHCEFfjy9LdSWCOEEHizfgBzrEjd6
	x8y9/km89Ims92ViaQ4LU0gD2KaGyiqgn25ywTzQUznNwzNVvG47ahIdOM98oiLc
	n1EnlvKK8bM8ddYXsP7Aevj3X2Oy96HAfOJQ5zzl43juYV+Cuu71dqxU1itRwnhq
	bo7Xdw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d083r8jcc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 19 Mar 2026 05:59:59 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5093a985e21so28065301cf.3
        for <linux-media@vger.kernel.org>; Wed, 18 Mar 2026 22:59:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773899998; x=1774504798; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OflPgbJUeB9MU802D7Qb7B2sM8brxEZYSrbm3iiUBSI=;
        b=VQNk7fd3wS0E3iTP7EyfMGeEkVs75KpixXq4mNnJ9VDHMJyviduWB5HZnnzcjcXUTA
         tDZv/eIOa3ZAZncJB8DlezMtsMo11YhfyTT0wOidW9HNgZavIKTg/eC2g70qPN6T8F5G
         DocQZ5lxY5JMlFEfoJJc9wDbRebUjOT7L82LO+6wXePQIaUG6ti9W5JMqDXojp7B31Kz
         KE5IRKjNDreDBF5y6HFNvaLg0y0B/hBsglr6fnu33svZMcRDKe/f/m8YpZKPhzxCnuEb
         5vfPsAUrEBc6Kq0s6jqfCrtsyQn4FqsLwI9bUnBhaFCHqswOtm7rOD2Fvom87mUWREMD
         lrTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773899998; x=1774504798;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=OflPgbJUeB9MU802D7Qb7B2sM8brxEZYSrbm3iiUBSI=;
        b=RzePTXVMAkr4wZuASixgyQFj2cKuvPEuOHkINoDxH3hjM3hwoqklWzShmDiCXMwFkS
         c6g9Z9C0h2+8sNDx7F5V2rsY3yaV+lZP3BENIZx6OOEI0LSdJ0bx3Eze03+Rrqclg+hx
         CMWIGGs6gfyaVktfIwRGOkFvkahm+iqaeXpgGwNgnUQ7LqRJo3GsfMBRgpGUuR6fOSB6
         YKe577TS0aenG3CVv2mvKy4e+Mgs3IvY3+aLlrOWgFVrGhirGpFIkSa/Gj7E7Re817Uu
         GpIe65hWzyqUX8I0TLSXHpmD0c5OS+tct/H1b45I5/7rgiu2JbgawxA4hFTcsc7dXu+X
         Ofbg==
X-Gm-Message-State: AOJu0YyIO2vu32ve0h5MJkG2v+1MGOokBD3fHC8Rh2/RUS2WiHeRcXQZ
	NbdiEOSNYs9186mtf6oXk8V4JKjjXNdBopSzOvBn1tf4iqkAJ1JGenk9bBb2qNwDkM+6sz2T+mx
	4lN5Kqz12e09zDZvr3H5zzjkMBPZyWjZ8HCNIsp+YNcNHtmMfsPkIwmmoX3wvlGSWJgmulxAx7Q
	==
X-Gm-Gg: ATEYQzwhtdLgFHSfsdxmJPzFQl+Xd4bANL0p+5DlcOAzLGqt4eY6kiImVwgotSSET92
	6rx6ZfWmlnDe+E8ehGArnTXcCYDp1cKbdmytZ1FS3aR1bjYxbJNZecN0hy2z7oHhr8RPszkkUUa
	S+Njypl+g+ipjShVFA7iJv8gk4w8K/Fyur56Mxhan0tjDzo0RF4dD5KWmsSlTse9ymVjnsGld+B
	ip1v0s6iCHIAnTJV59/uYty961ILj8G9AEcul8jhjx0vYSC/3cQkMnlXhswwttboFvdxG/SOHO5
	v+ATDwA5LxCMLLARIeQpRExv2bTFJ9zfqywo7Oo+VwCEhk+zFRxoe+k0l01tWMi+Mv+J9/gX1pA
	Okau1OtIZUCxclvXiDb4M0wCvB/zfwpXDnKXwIne9ppB3XN3TUgkpiwjDmRA4BSAR2PBOoVw6c0
	GvaV5jy3y4DY5KasZR1x6aQLn0Eonfq9BrXbk=
X-Received: by 2002:ac8:5910:0:b0:509:23ee:b9a5 with SMTP id d75a77b69052e-50b147634e3mr82832621cf.5.1773899998241;
        Wed, 18 Mar 2026 22:59:58 -0700 (PDT)
X-Received: by 2002:ac8:5910:0:b0:509:23ee:b9a5 with SMTP id d75a77b69052e-50b147634e3mr82832451cf.5.1773899997747;
        Wed, 18 Mar 2026 22:59:57 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a279c7415asm993174e87.56.2026.03.18.22.59.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 22:59:56 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 19 Mar 2026 07:59:46 +0200
Subject: [PATCH v8 02/11] media: qcom: iris: use common
 set_preset_registers function
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260319-iris-platform-data-v8-2-55a9566ebf60@oss.qualcomm.com>
References: <20260319-iris-platform-data-v8-0-55a9566ebf60@oss.qualcomm.com>
In-Reply-To: <20260319-iris-platform-data-v8-0-55a9566ebf60@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=6499;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=phlz7lNAhvXN0hEIT6ClaBZaJ7P5qlMteCFYP4WlGM8=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpu5DUtSw5t2hTXdCFOOdNBu7SxipEMDYH+JdXZ
 1pL4rqwZGeJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCabuQ1AAKCRCLPIo+Aiko
 1RnpB/9YuRCSk32hAC3u51ngdzdH8UJUy3yHJ4tUcXYyu2rgQhpZexpAEHZ9+HdPFD1MTySzIqS
 x5Jx0x80KgMRlh9anAsqbVD8W2EXexJuPUogialQoLeaEYNIgAp5GHNkTlPlLofnq+YdOlOR5IG
 XfpsK42pCh+3ommPLT6tra/6+GNv/tJOeJMCem0NQWBGm18UENyVXe5gt4BviPTeCWDgce7QiKZ
 bzc7n6AAFnma3sQDPbOZweZOOWxddapWGJKjBAyg+JzixJpZ+5NQcnXNP6bdnJfbaaMaHqKIUFA
 cKTK0VN2y6Wh1UoScIhT/gTjscYHJnV81+QZq9bS2xwIJS5w
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: q43ve3DBZ1huJYx9_RtRd0Kg1cThPJ8D
X-Proofpoint-ORIG-GUID: q43ve3DBZ1huJYx9_RtRd0Kg1cThPJ8D
X-Authority-Analysis: v=2.4 cv=ApTjHe9P c=1 sm=1 tr=0 ts=69bb90df cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=LmgrmXmU8fDMlo1BKrQA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE5MDA0NCBTYWx0ZWRfX/zRbYrDpvNsG
 52l3HOril8Uhvmt8C6Ogq6VcJDjv8pEccvaTrED0+XmMfKrmAYujj5qT15CrVUgTI0YLeMWHdHE
 jexlo6gJbW+XHtLNVVtPAlf5DK2PqIK8iYz5ODxEC7uY3/lU+bMVU17eRwczDZDVEvi6oA9fN0l
 TkCxwm2Lu8+zILUBwoMiE1KXHyNSyb3sYl8IXnWVy+R5373FQkCxOUPKf6IFB1xkOfXR3XDr6u6
 N6UV04rngVyRUrgOxKQR0KrW6kZ0NCySA1me444lYTsnurwsRjpC8Bzij6IXhHl/u+ncQtCFoWC
 T0EDDs+EUDGuCSIrJjwTUAYSro7E+b3OdmXMP5MFj9HuCCVGzDm9abQsiqU22Xo/QdqJiU5IIYE
 z7BqYooB2jLO9eynf8tEg06lTRkGHmPFRYVz1YR6i/LFk3fNl8QRNiTIczAPV7h7dkysPJ1DCDR
 jrZdL9/fIvoQqvjdvFw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-19_01,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0 suspectscore=0
 clxscore=1015 impostorscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603190044
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-56288-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: ED75A2C677F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The set_preset_registers is (currently) common to all supported devices.
Extract it to a iris_vpu_common.c and call it directly from
iris_vpu_power_on(). Later, if any of the devices requires special
handling, it can be sorted out separately.

Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_platform_common.h | 1 -
 drivers/media/platform/qcom/iris/iris_platform_gen1.c   | 7 -------
 drivers/media/platform/qcom/iris/iris_platform_gen2.c   | 9 ---------
 drivers/media/platform/qcom/iris/iris_vpu_common.c      | 7 ++++++-
 drivers/media/platform/qcom/iris/iris_vpu_common.h      | 2 ++
 5 files changed, 8 insertions(+), 18 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index e4eefc646c7f..d7106902698c 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -207,7 +207,6 @@ struct iris_platform_data {
 	struct iris_inst *(*get_instance)(void);
 	u32 (*get_vpu_buffer_size)(struct iris_inst *inst, enum iris_buffer_type buffer_type);
 	const struct vpu_ops *vpu_ops;
-	void (*set_preset_registers)(struct iris_core *core);
 	const struct icc_info *icc_tbl;
 	unsigned int icc_tbl_size;
 	const struct bw_info *bw_tbl_dec;
diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen1.c b/drivers/media/platform/qcom/iris/iris_platform_gen1.c
index 07ed572e895b..ed07d1b00e43 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_gen1.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_gen1.c
@@ -260,11 +260,6 @@ static struct platform_inst_caps platform_inst_cap_sm8250 = {
 	.max_operating_rate = MAXIMUM_FPS,
 };
 
-static void iris_set_sm8250_preset_registers(struct iris_core *core)
-{
-	writel(0x0, core->reg_base + 0xB0088);
-}
-
 static const struct icc_info sm8250_icc_table[] = {
 	{ "cpu-cfg",    1000, 1000     },
 	{ "video-mem",  1000, 15000000 },
@@ -343,7 +338,6 @@ const struct iris_platform_data sm8250_data = {
 	.init_hfi_response_ops = iris_hfi_gen1_response_ops_init,
 	.get_vpu_buffer_size = iris_vpu_buf_size,
 	.vpu_ops = &iris_vpu2_ops,
-	.set_preset_registers = iris_set_sm8250_preset_registers,
 	.icc_tbl = sm8250_icc_table,
 	.icc_tbl_size = ARRAY_SIZE(sm8250_icc_table),
 	.clk_rst_tbl = sm8250_clk_reset_table,
@@ -397,7 +391,6 @@ const struct iris_platform_data sc7280_data = {
 	.init_hfi_response_ops = iris_hfi_gen1_response_ops_init,
 	.get_vpu_buffer_size = iris_vpu_buf_size,
 	.vpu_ops = &iris_vpu2_ops,
-	.set_preset_registers = iris_set_sm8250_preset_registers,
 	.icc_tbl = sm8250_icc_table,
 	.icc_tbl_size = ARRAY_SIZE(sm8250_icc_table),
 	.bw_tbl_dec = sc7280_bw_table_dec,
diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
index 1f23ddb972f0..c84d4399f84d 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
@@ -756,11 +756,6 @@ static struct platform_inst_caps platform_inst_cap_sm8550 = {
 	.max_operating_rate = MAXIMUM_FPS,
 };
 
-static void iris_set_sm8550_preset_registers(struct iris_core *core)
-{
-	writel(0x0, core->reg_base + 0xB0088);
-}
-
 static const struct icc_info sm8550_icc_table[] = {
 	{ "cpu-cfg",    1000, 1000     },
 	{ "video-mem",  1000, 15000000 },
@@ -917,7 +912,6 @@ const struct iris_platform_data sm8550_data = {
 	.init_hfi_response_ops = iris_hfi_gen2_response_ops_init,
 	.get_vpu_buffer_size = iris_vpu_buf_size,
 	.vpu_ops = &iris_vpu3_ops,
-	.set_preset_registers = iris_set_sm8550_preset_registers,
 	.icc_tbl = sm8550_icc_table,
 	.icc_tbl_size = ARRAY_SIZE(sm8550_icc_table),
 	.clk_rst_tbl = sm8550_clk_reset_table,
@@ -1018,7 +1012,6 @@ const struct iris_platform_data sm8650_data = {
 	.init_hfi_response_ops = iris_hfi_gen2_response_ops_init,
 	.get_vpu_buffer_size = iris_vpu33_buf_size,
 	.vpu_ops = &iris_vpu33_ops,
-	.set_preset_registers = iris_set_sm8550_preset_registers,
 	.icc_tbl = sm8550_icc_table,
 	.icc_tbl_size = ARRAY_SIZE(sm8550_icc_table),
 	.clk_rst_tbl = sm8650_clk_reset_table,
@@ -1114,7 +1107,6 @@ const struct iris_platform_data sm8750_data = {
 	.init_hfi_response_ops = iris_hfi_gen2_response_ops_init,
 	.get_vpu_buffer_size = iris_vpu33_buf_size,
 	.vpu_ops = &iris_vpu35_ops,
-	.set_preset_registers = iris_set_sm8550_preset_registers,
 	.icc_tbl = sm8550_icc_table,
 	.icc_tbl_size = ARRAY_SIZE(sm8550_icc_table),
 	.clk_rst_tbl = sm8750_clk_reset_table,
@@ -1212,7 +1204,6 @@ const struct iris_platform_data qcs8300_data = {
 	.init_hfi_response_ops = iris_hfi_gen2_response_ops_init,
 	.get_vpu_buffer_size = iris_vpu_buf_size,
 	.vpu_ops = &iris_vpu3_ops,
-	.set_preset_registers = iris_set_sm8550_preset_registers,
 	.icc_tbl = sm8550_icc_table,
 	.icc_tbl_size = ARRAY_SIZE(sm8550_icc_table),
 	.clk_rst_tbl = sm8550_clk_reset_table,
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.c b/drivers/media/platform/qcom/iris/iris_vpu_common.c
index 548e5f1727fd..faabf53126f3 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_common.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu_common.c
@@ -468,7 +468,7 @@ int iris_vpu_power_on(struct iris_core *core)
 
 	iris_opp_set_rate(core->dev, freq);
 
-	core->iris_platform_data->set_preset_registers(core);
+	iris_vpu_set_preset_registers(core);
 
 	iris_vpu_interrupt_init(core);
 	core->intr_status = 0;
@@ -485,3 +485,8 @@ int iris_vpu_power_on(struct iris_core *core)
 
 	return ret;
 }
+
+void iris_vpu_set_preset_registers(struct iris_core *core)
+{
+	writel(0x0, core->reg_base + 0xb0088);
+}
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.h b/drivers/media/platform/qcom/iris/iris_vpu_common.h
index f6dffc613b82..07728c4c72b6 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_common.h
+++ b/drivers/media/platform/qcom/iris/iris_vpu_common.h
@@ -39,4 +39,6 @@ int iris_vpu35_vpu4x_power_on_controller(struct iris_core *core);
 void iris_vpu35_vpu4x_program_bootup_registers(struct iris_core *core);
 u64 iris_vpu3x_vpu4x_calculate_frequency(struct iris_inst *inst, size_t data_size);
 
+void iris_vpu_set_preset_registers(struct iris_core *core);
+
 #endif

-- 
2.47.3


