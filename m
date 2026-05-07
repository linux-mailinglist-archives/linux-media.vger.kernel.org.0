Return-Path: <linux-media+bounces-60729-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CK8LBqU0/GmNMgAAu9opvQ
	(envelope-from <linux-media+bounces-60729-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 07 May 2026 08:43:49 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 173CA4E39D6
	for <lists+linux-media@lfdr.de>; Thu, 07 May 2026 08:43:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 65179300938F
	for <lists+linux-media@lfdr.de>; Thu,  7 May 2026 06:42:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3827734EEE3;
	Thu,  7 May 2026 06:42:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KkcSCxZU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dWOH34C1"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCBED34405C
	for <linux-media@vger.kernel.org>; Thu,  7 May 2026 06:42:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778136153; cv=none; b=b5+RIEDK3YFFOUa5Qb0KpvunE0jMXzeS8pPcDNk+u9WrokXNXQoQwcaljL9wUSuhV0vvJ5zIMGr/9Z8b8RcYG6vP1eUu8qR3iWQvyvp608HQ2y5jNTsFk04sMxJmmlg2s17NoECb8d+zuYLlTRftn/9ldnsyXbYkO6/m8XTZ3t0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778136153; c=relaxed/simple;
	bh=9oShd0lxeYZuc1TmMkA1ib+fm0aaxdo95GxItjv0DYo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jd0WR+pstQL8kB+CGd4tD+6wiLH/y/DwO0qlpnETx+ee7AL4ntNCXFN4EqGiwrvzv/B5DOGDr10jAHR0GLS4zLgG/ekcWUvq+xVTRr/aEP2Y+9ISp2WAwSQNGZn5YiqP6JvBKELRs/qDdeC0iqXj9dFvu2dUo1BTkrzMHAhwvm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KkcSCxZU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dWOH34C1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6473eAHF1669567
	for <linux-media@vger.kernel.org>; Thu, 7 May 2026 06:42:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	300UemiTb6OIGpMleRcRM+4rK//nXn1aRMrTuOv8PbU=; b=KkcSCxZUnVfAEb8F
	4yhIz0Ll8ZSyBAVTJC6cvHJY/d8lAwoyPFppva65GZcZYZEZoi2tv3nnfZMLvDX0
	iJC1x0XF+a2T1RzHiNEP9nNEj4tdPppnWfYDRjnGJb7Ol9sYMESCG/bPbtLYjzHy
	tp5uIhO6SSggUetMmFSG0TDiqQuPAN0zTolDsFi+CD2JVglOO2JPwhfx9txrbF2v
	/gjaG38hn04KDySmUHOHc3kjHBzWjq8AsNIcV/JCKQZDypTSavxNR2N6zzTI4pzN
	TLjj4E5wqUpLPnf88WL8FNT9ESpntMeHz6brnp01kZK+Gb2hl5iYyse6knJyNz7G
	wedihQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0k1p0j8w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 07 May 2026 06:42:28 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5102a9671c8so11371621cf.1
        for <linux-media@vger.kernel.org>; Wed, 06 May 2026 23:42:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778136148; x=1778740948; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=300UemiTb6OIGpMleRcRM+4rK//nXn1aRMrTuOv8PbU=;
        b=dWOH34C1GtakmbbpEqGNC2jhsfCoiBZmF3TEsF5WHZNft7wHjFnfcp9EAd2kRUotvP
         bFVB2Stjj6zkSBiRcQm8hioE6fexfQhAH4ZL0SH2bxoPkxvdzxn6ngFr2+DzAfjZqGb/
         4s96i7bCGZx40m7end135+Y2PkfoqKKObAfzyp2HTeuDo3Kw8hMrSumviW+nS0qwiNzX
         PCwYa3KNDRTzLlMNaaw9gszHymousujegrvN4Lp7qIgZ/dICNlRORAFDmF9eZX2gpwzC
         Krsb8huW5ZfuMFKQ6vPATI9sYJ1W7yZ3Mw7XJ0XkoLbBJbQHRBJ0yhExZJE7FnO2FlBo
         xC6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778136148; x=1778740948;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=300UemiTb6OIGpMleRcRM+4rK//nXn1aRMrTuOv8PbU=;
        b=SI09wokBUcashXPHt2WuvLudd+I5Bb0xiTfHOKFoIGw361k0XQ/8dXthKZcQQg+bNi
         FjGN9NwrxlfqoPhIbH9KbLFe9FaWNK1aOfY0SpGeRtBbXfmFD3hxrlPSxiUg8fpgEZpT
         6eYK74q1ro+UQd8ITZsxxldXfGRVZgsXK6cAVt+bsRWT+JL1bl11mCULRExINAiHdQVQ
         g3ShyGHyocEk9Jp/cauCGIJYmsiDAIeWFJ994r5Ny9xW7Ete+ctTqubXByN2tZpUqvZp
         gzf7EbHH+Enr2/YApjoEbtpb8lAtiqVW4bumPuafj6df11St9Pyejqy7ht9GEe1SHVwK
         2Tjg==
X-Gm-Message-State: AOJu0YzM+jRd26mkEjtNRpev5QtIZ1T318hhlimOGki3eBwcG6n/lGUM
	ukNqqZl9Ir3Cn7fgRkXYSF31mJS5miHLwZZmCmnGEYOc/6+2GwGCFIiTAn7L8VdC6v4XqyUzqRP
	PhkT/2pvOmFSMPAbD1txuavC/enJmQoUtAFqI31bcqA+2IlL3tHCIWQRFPuBH7i0IEw==
X-Gm-Gg: AeBDietT1TD8L/2bTfqFK3J2gUpBPWlWKf97ovulpkBfd13d2Y/QTj42ZAy6G8/M0XW
	ma1tN6JDB90Ss3A2DRdRGbZP/LwgtIvgGB5sdQ25ABuOv48a3q3RiSdrt34dN9p+YI3gm8iF+Wj
	x943TlSg6Epjz8wGVry3Dk6J7j5bc5pSPiTy5t8xUMAZXO9Nd29GUiuTCxnoYpHRCbEszQA1OVk
	hMyDyf4pom9+ksiapIEnH+u97pF1UoC+0MDA+on3qkQFbyr4VR8HOBifvt2pQ7IMZ4II2+XqnNg
	ahY/2ZkJ8MyV6Rgs1AR/wtCOERKkIxzX/oYqG6178cGN8fsz3O6HDeO2lDIGtJs5eidTjcALyXU
	3ltxhM77HmPvt4DG+5Vyt3blVgB7p049RLITV0NWORiFYEBbBZQVrOYQTWWQqIonyaCSrT4RIwG
	rWnAnFFYhOwdmXcA9R+e8Y9M2Chmm4I/bOO5GqIOdmkeLMFg==
X-Received: by 2002:a05:622a:6204:b0:50e:5fe2:83aa with SMTP id d75a77b69052e-51461befdc1mr94388001cf.12.1778136147944;
        Wed, 06 May 2026 23:42:27 -0700 (PDT)
X-Received: by 2002:a05:622a:6204:b0:50e:5fe2:83aa with SMTP id d75a77b69052e-51461befdc1mr94387721cf.12.1778136147520;
        Wed, 06 May 2026 23:42:27 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a8722c2d43sm3334694e87.40.2026.05.06.23.42.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 23:42:26 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 07 May 2026 09:42:08 +0300
Subject: [PATCH 08/16] media: iris: skip PIPE if it is not supported by the
 platform
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260507-iris-ar50lt-v1-8-d22cccedc3e2@oss.qualcomm.com>
References: <20260507-iris-ar50lt-v1-0-d22cccedc3e2@oss.qualcomm.com>
In-Reply-To: <20260507-iris-ar50lt-v1-0-d22cccedc3e2@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1036;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=9oShd0lxeYZuc1TmMkA1ib+fm0aaxdo95GxItjv0DYo=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBp/DQ+E88fbCRiyGMK955bjuiw2fsdCyCEHHF7R
 7aLwQwisJGJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCafw0PgAKCRCLPIo+Aiko
 1Y1zB/0ZN5oWIvaZjrlCAvAy5ojTx15Q+TzPU8LD5zkRYk1c85Qmp3OE+n5wDxfZPFil8CSLkms
 aIYy3SSN+VmlIPyDf/uCqD4imPZ/2sX0LcAjiT5C17B+N0j/PAjtFVBj0/n8VfOSoxzoiDuYnNq
 JejszHPwbMTTiDqlhmhGs7k4t6cXhj+wiVduxOynDywurFylGrSmNxF7Edhe38/WZ2MJZ2EVErH
 fVdlh+d6aqWG8Vo1qoGQPnpqNSdtokuyfPtGzdxaF0X1HfQx8OgSSdL0OHTUaELg4ddFhxNnJmT
 6ijazendjw8O5HlWo2aPrAoGAjbdaHCf3a1UXROO54PFFOBj
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDA2MyBTYWx0ZWRfX9zlduoBjU4X/
 23xXccKIN2Gdc+eGIv+oCKs1sfZujPM0fuO7tsq8xZNUNHXQqrAlFHf20pf0Xlf192bBAyVqeuG
 4BMAjkQT/5bLmOMTk6leRLaE63rA412WgE7CBZV/35puCjlLRnZDVK/IiJ+F+/cJxP130HHW5VH
 KdBmV9QrybFI/AGjdaFA5QkJAXJqa/W8n4/vkgGzRdGnuM/k+AzJJMOVQmP/G9xbwq+iJbK2/8L
 4bLZpU1zX3Ea9/Z8jExwfT50Xf9y2gVExay2cN2AdsXzoQuGpSRvOBii1CPsShj2ZKM5wYzPDMY
 aKVt9zhvRzzdji75D9GxvKZrl21XPWgTWpi+OfYu8lfNtEky8mYKQnl9sf+yYc5R2kuyXVsV6lq
 eMSxAwNzCan6ylgRhnM9gX97ejhjElzpUcpipv+AWCp5PcFDhHALfd+XD99BeWLOPewbUsG4L8T
 QtgQvD+cBc0U8nMI0kw==
X-Proofpoint-GUID: fTppbewe8s9TlIo25hVnQYutO4E0C7cC
X-Proofpoint-ORIG-GUID: fTppbewe8s9TlIo25hVnQYutO4E0C7cC
X-Authority-Analysis: v=2.4 cv=K4IS2SWI c=1 sm=1 tr=0 ts=69fc3454 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=9TuWGWrZIemhly9L:21 a=xqWC_Br6kY4A:10
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=DRvvl89rPFtLv9ObwM0A:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-06_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0
 impostorscore=0 phishscore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605070063
X-Rspamd-Queue-Id: 173CA4E39D6
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	TAGGED_FROM(0.00)[bounces-60729-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

AR50Lt doesn't support HFI_PROPERTY_PARAM_WORK_ROUTE. Tables for AR50LT
won't have corresponding entry in the capability tables. Let
iris_set_pipe() silently skip propgramming the property if there is no
corresponding capability.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_ctrls.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.c b/drivers/media/platform/qcom/iris/iris_ctrls.c
index ef7adac3764d..f438dddc19ba 100644
--- a/drivers/media/platform/qcom/iris/iris_ctrls.c
+++ b/drivers/media/platform/qcom/iris/iris_ctrls.c
@@ -450,6 +450,9 @@ int iris_set_pipe(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
 	u32 work_route = inst->fw_caps[PIPE].value;
 	u32 hfi_id = inst->fw_caps[cap_id].hfi_id;
 
+	if (!hfi_id)
+		return 0;
+
 	return hfi_ops->session_set_property(inst, hfi_id,
 					     HFI_HOST_FLAGS_NONE,
 					     iris_get_port_info(inst, cap_id),

-- 
2.47.3


