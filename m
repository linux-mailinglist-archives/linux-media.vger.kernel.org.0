Return-Path: <linux-media+bounces-61706-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ID8WHLUVB2rgrQIAu9opvQ
	(envelope-from <linux-media+bounces-61706-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 15 May 2026 14:46:45 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BC8C54FDEE
	for <lists+linux-media@lfdr.de>; Fri, 15 May 2026 14:46:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id CCA64331605A
	for <lists+linux-media@lfdr.de>; Fri, 15 May 2026 12:00:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC0D448032A;
	Fri, 15 May 2026 11:59:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IMMvEzMj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QdeLsFil"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3506480326
	for <linux-media@vger.kernel.org>; Fri, 15 May 2026 11:59:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778846379; cv=none; b=gDfsEFnXQr+lSDaGWPc+ItrBJ9XGjaHDfxDb+rrdZ/2vU6lSaFc6vjY9UivPjswEjekyDldxqXjMV6D1EXoA8zj94vyFeCKowTWs6u2aGG5ITiCPHL2gW7Aqx02r+YFb+oSzUaneaacrkTvac3oubbq2vAbxyWnXYIyVZ9aaTAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778846379; c=relaxed/simple;
	bh=iLV+7CutUKuWtPpoyy5AyNzXw226ZCT5toSuoYtk/sQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NAgH2KcKHVyot2HtUdT43L3AWixSFvSHFaowjdVFJJ3sJjyKLLlvvuqoOviZATOdMejTNvasJDTHbxIRyQ/Q/9WcXqER/m1MAJMzOA8EqaPWg/7FmwBYPZhjklJ4iLO8SdTbFnZ9tEU+JfaikkVfKfC59epcu/rMhLncI/xtffE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IMMvEzMj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QdeLsFil; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64FBP0Kh4008290
	for <linux-media@vger.kernel.org>; Fri, 15 May 2026 11:59:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	N/6uIop3gH9Mf1fZ10kgxc43Tn7ipn4hNkR9u0UA3tE=; b=IMMvEzMjnqdKnyTS
	KLh434zkgB/bYJ2Ip/o940gL6tCTC9pG3Fig1Yzoo9GAfw4tlavPEmUdrSI8rjFG
	MsgSDpIULqIEDIDCr+c17JbnyFSWSII8XESVeKl4MvWdBIJFIGa8lNsW9GVhgGIY
	i841rO2w0UeNbnj0zGDKXVQQl8DYEl3cmqdHitq/r2KgjRcjULr0QKbgxYkTrTxz
	DISQbMEGX3xRKT8gUZXDRZxGsYa+byyc5KrCKLJbJZoMTNqg8l7l9/ygJ2AFrM7R
	jPV70rcfV+rcMVeHszGYC9nfAmDUpA4CTnrTXIcDXY6zALTPnAGIKPm3kMzFKxWS
	J4JfuA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1su58r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 15 May 2026 11:59:36 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51494d74d4bso24156301cf.1
        for <linux-media@vger.kernel.org>; Fri, 15 May 2026 04:59:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778846376; x=1779451176; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N/6uIop3gH9Mf1fZ10kgxc43Tn7ipn4hNkR9u0UA3tE=;
        b=QdeLsFiljrO14tUCDMtk7xVAfV8eCUs5P1kRnqv/FPVU8Q090qEHGYFhOIy/Zdrfnp
         kDrk+J/nFiIQTD7Yfn7JUKYV7gnXfiRMy0535o2PDkJHHavfvitIyHw+PeODb86Kc7os
         cSagkf/jsgfU4mHtUDCTMNahXNpQX/l2zt5Fd0k0+a5B7s6VALVgFUI/vNcBMgwasYhD
         e7HzvkL4b+EuQoRVJ+ZJscWoB7WnUBblQrtmUcVXR/Wa62YqjcGu+si/kHl4+wxlCWHW
         MFJ/C/z51JTQwrBzluQewVYzMnyC2yqqPltq6UMtjPJyhv9s3sZaoFVmiVLxSbAW5vU5
         pDPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778846376; x=1779451176;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=N/6uIop3gH9Mf1fZ10kgxc43Tn7ipn4hNkR9u0UA3tE=;
        b=BZzPhFONtkBvY6yfJBXDW4sAvfOY8KXOHwVHWC1Y/TKVbvfbJbbouB68gKYmk378Nj
         SvzUu4ivO3n8QQcq2IK5NFz2ozjTpLz3hgE/g784w/UFVIWZmcr9ESpEThMAdevytMg/
         YeNUEOTL3D4wUANeQEUMm3Dpb+pbfSlVPEqw8xznAag4l9tZ6Hg4rORo2PTUBv6Cx7gq
         k8wK7sKdfNOO2uHU/r+FFbxrVkUprdKLYEWYLqbZ0LeNj7CW/w5SDqeWPfRcSe6CtoPk
         4Y+UR+uog2x2izasD5w0yQQsrmyKRgeVVQ/IqmJPVOGQvNCv/ro1FfM/D3flYRN9B+q1
         9FsQ==
X-Forwarded-Encrypted: i=1; AFNElJ9tc99qQQzM79SAciqQBCvXZDdeXUdmDgdrkMFv1vpjHGZvASF4+EvBZhKQ0+5hSUuudzufKDVC1bMcdg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwGoAqhmLkViWX5J0A3IGzZl5aMWs4HshXxC0jrg3ikZlcC6NM4
	QyIpJGNcVLsTM3Xu7IQFRia7+zLtlGsMNOQDnFeIqgCDr2XaSZtiOMqfQfL7JgslGwPs/QWtYwt
	4bY+fG6xFZZxX9QqDYQ3qKz/lJmPmlZ8J5KyCFkd6U6Bf+QwMAnc2g93+PuwzH8RO8g==
X-Gm-Gg: Acq92OEg+Wj1St3dy3bP5TuLUi3J8fvwy2fPN7K2FxglJilzBumC3SCWsCDpgWGo4Dv
	x4vaN5kIZCrJ8vScX/WuQ/OIBKeNwaqewXqX3Mi188JSY8GY1VDh1FhUbXL3pOXOEO7HwfgJm4D
	2GKnP3YllrxD2UCp1r0HjMzi0oPsflPbuLla+pOLwwQjUQY3a4ljihwKpYLGOY0fT8x7282bwgt
	1kWsetuKKKyi/wSde4aevvMAHQQ7ITOGFZ9qc3PsUIK4f4rtexMvckhaRCw2mniBALMAqbfE2Bh
	DuDfJAdSXGxVrOaThZEJBIAQxsE+LJkQon6i2aG9e1/Xlq6q6Y9EF23RQArjMDMA23LymPcN0OJ
	oTAkK9OBLeToXNHowpr90+D7OSLM+WXthu8McLVQ4vhjMeqBi+8Pt/cWETIlfD/KwkIF97H5ovC
	0Zpk6AANsBSFFYkUMvbveiJftnzhck6iDo3yw=
X-Received: by 2002:ac8:59c3:0:b0:50d:7632:ddb2 with SMTP id d75a77b69052e-5164159ee2dmr98758051cf.12.1778846376192;
        Fri, 15 May 2026 04:59:36 -0700 (PDT)
X-Received: by 2002:ac8:59c3:0:b0:50d:7632:ddb2 with SMTP id d75a77b69052e-5164159ee2dmr98757831cf.12.1778846375804;
        Fri, 15 May 2026 04:59:35 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a90f119ff4sm1295651e87.20.2026.05.15.04.59.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 04:59:32 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 15 May 2026 14:59:25 +0300
Subject: [PATCH v2 2/4] media: dt-bindings: qcom,qcm2290-venus: add Venus
 on SM6115
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260515-iris-sm6115-v2-2-2ab75229de61@oss.qualcomm.com>
References: <20260515-iris-sm6115-v2-0-2ab75229de61@oss.qualcomm.com>
In-Reply-To: <20260515-iris-sm6115-v2-0-2ab75229de61@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=996;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=iLV+7CutUKuWtPpoyy5AyNzXw226ZCT5toSuoYtk/sQ=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqBwqgYT1U2Tja1LE080p0N7zY5omHRGMduD/GI
 AHm5kryaCWJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCagcKoAAKCRCLPIo+Aiko
 1W9LCACQW26QBmj0u6Q4q4W9WvrarePhRYSAllIq7Pu07Gechv+Z49zok/+zN23nnFZv1Uf67X6
 ru6f51+w2jVJYSrIiyus3J4Fk+zJ33VO2kv15KetIbz42RGEq/Xo7C/t2l0rjLCsC6G+dK07GZo
 LWvpfVIFtPYAl4y01e3hFk0MEzy8G2gphox62aKEhi9QfTIm7x6t/EO1PKVQlgvJXq/mVMgOcwE
 FkPvz3dtXPTv5vssxcrgYz8veBbYSDuXhhzo0eDS6VSV6XPINwP8YXZlqoLRVrKhAZ/YOFYGGxv
 DQqDc947RbpUEieg1sLMeOoJaGbDoZWv/tei3nHGNTJsUjLO
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: foGfGdkJJZwggsf-dbP6eAc_vqcL9ozz
X-Proofpoint-GUID: foGfGdkJJZwggsf-dbP6eAc_vqcL9ozz
X-Authority-Analysis: v=2.4 cv=cZPiaHDM c=1 sm=1 tr=0 ts=6a070aa8 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=4JGtjPUTKruHVPAqO2MA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDEyMCBTYWx0ZWRfXzbPv5SSN+Wpi
 ZAWpcmbtTaIsdnjvTv8BR7xN6s0lHsq+pXDC8KwQ2JDkOfCYM4m+lcVwD+HgO6sVglqd+wIGiJg
 wTDCdGszWN9SHzJGIdEZtkCl56ikpL6mKA2CmrCoKhVJyEkq1njMDepTqjB6jqg+QnWzgXx7Ddd
 chNeA3F45q7wr7uzJ6DpM/r02WBNZcbbF6Ft7KFHJpo8cI5mtajbuzZQC3r5nPEK4neoL9jpIPN
 +bXgepbGKGbYB2SpyR6an9+YDwI73pJATGUiHl7gQqjFc+lw4OcM7eHWL7ixWFsr7kBkkYxF6mz
 cUxj2+ibfbAeJdANTQEXCllg0yqOUvv/wgpmD+8qt+KZ9bpaCJM731ePC91TR5PHsVNvKcRY8hF
 rr7yRRi8K53sp1wfD79mqYBA/qVJ7viobb0s0cZbNOjcUQ+nmjcI/kgY/IUlBifUA34mKQmVPRZ
 ewYVo1HGRb384ocoTIg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_03,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 adultscore=0 suspectscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605150120
X-Rspamd-Queue-Id: 6BC8C54FDEE
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-61706-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

The Qualcomm SM6115 platform contains the AR50_Lite core similar to the
one found on the QCM2290. Define new platform-specific compatible, while
using QCM2290 as a fallback.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml b/Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml
index 7e6dc410c2d2..ab4c56ee9182 100644
--- a/Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml
@@ -18,7 +18,11 @@ allOf:
 
 properties:
   compatible:
-    const: qcom,qcm2290-venus
+    oneOf:
+      - items:
+        - const: qcom,sm6115-venus
+        - const: qcom,qcm2290-venus
+      - const: qcom,qcm2290-venus
 
   power-domains:
     maxItems: 3

-- 
2.47.3


