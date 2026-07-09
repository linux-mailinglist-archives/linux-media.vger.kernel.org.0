Return-Path: <linux-media+bounces-67167-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id QOqcDQOmT2rKlgIAu9opvQ
	(envelope-from <linux-media+bounces-67167-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 09 Jul 2026 15:45:39 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id CB62D731B99
	for <lists+linux-media@lfdr.de>; Thu, 09 Jul 2026 15:45:38 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=ESCveSmD;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=hIcmx78V;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67167-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-media+bounces-67167-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D1256307DBDC
	for <lists+linux-media@lfdr.de>; Thu,  9 Jul 2026 13:43:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4F6132FA2E;
	Thu,  9 Jul 2026 13:42:15 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC6DC32AAC6
	for <linux-media@vger.kernel.org>; Thu,  9 Jul 2026 13:42:13 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783604535; cv=none; b=TmuIE8f7lK299wSCqR4kzLSXQSxCgDP7ScYwnFLet1000r/kxjxfRjZbPdTm8/pYxMx0gwyech/fRgkP443nMmhfpaSKFFDRNyQd7+fuQlXaUlyKiAtBcWnKVw6iRitGx5HQL4VoDUa0SwJez4uEhRTYxKNAb473Z+xpkWIec0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783604535; c=relaxed/simple;
	bh=SUPr9326R8/I85NqmtSxzGXasITRZ38mBZxBYOCk/p0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aKEYModnaBOJyrmtv8VBJqdTuSMue//12fDi2h0z8kw/0a9GEBiS5TWYqEGRMkVfIbJPWAps3BtfU8UX0JjE1X0uJv9UT3roOQXKCsCIUIvmEDOIpxH4Xt4xLjsW7xP6xorAQfJGPscTErfElW1/7XXoKkeHsJ+4tewnoz/5mkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ESCveSmD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hIcmx78V; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669BO5qU1674731
	for <linux-media@vger.kernel.org>; Thu, 9 Jul 2026 13:42:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rZBfUegtVT46gf+3kV/ulvsSL+G4ssvBArwyOeiJ5Vw=; b=ESCveSmDD7kS6hwR
	I45kXnHodLGoxr+aTTQjbFv/xgGo0hrXEheMHq7d8Ugc3VrGjcsEL9YnI68khvQX
	HJrMB93i+Th3Opf8mZpORyJl83BSp8dsd8b1XAJIw+Mh9xnaYR8EzbPzzvWUZYIA
	Y9ug3CFnH3qKYtly4docwRLxH+QuqKamyRgyrGhtdMKqyNfQlRKwHj0prQjuxHjN
	gyI4Zggj2n+l/boSdbxwyRWUfJ1Zygyb9bbudEWZFa1bAovmtSFtYuXaXXxdev7j
	pL2Q6FE+w9ZSNaaTVWrLmtb9DE/yrdc3AwcYyNlSc05Ohd5U+p3svgyAY/8EO/GU
	CuI5Ww==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9sqschmp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 09 Jul 2026 13:42:12 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-6751db2792dso342673137.3
        for <linux-media@vger.kernel.org>; Thu, 09 Jul 2026 06:42:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783604532; x=1784209332; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rZBfUegtVT46gf+3kV/ulvsSL+G4ssvBArwyOeiJ5Vw=;
        b=hIcmx78VfN4inSFJkFVE95b+0+lkIQZoeAud/Ay2k+moIgt0u+fBTRnxZeYGdit2fA
         6uNXThN2mVqN1j2k+HDe68BaJzad+nvStSs2lNh2Kbd673A4WBGed0RiQgP7Q5XTApZM
         xwdPEo9gbdyrEtlnfPXJGaTcVaiPLJ7OT4wz4l6SF2622q9qJvA4jRnVGADTcO3IDYQn
         sTsFQd+izTHC3aI+eSP26o61NnbpzHpv5HvQOh9dYNQW7f7Nn8N0ZiLdt5GssC/lTUJ9
         1vjHpe86f2HPujmuQJz9E9aGQAmWgA0FETfo9o/lsDVeIrab0AxvpgSVETRAedJ5KX8r
         WWRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783604532; x=1784209332;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rZBfUegtVT46gf+3kV/ulvsSL+G4ssvBArwyOeiJ5Vw=;
        b=f2wrX0phKUJLh4EV4SJ9JprCIZVzHH8GQuSgrapa3wry3nPmfc84TEy3ldPkcBWL/i
         j3MltdBDI4grPGbRzY/PEcrlYK7YdjiUEJC+FUb1TZfnT2+NgagMFNOLSY+oCrU+5U9h
         1V29yMV5SIlXZWwPnMHuMtcDPwLpaii+cX/UO6Tb8W95xAsMTS4+wFBNc+t3AF9El0aF
         oazyKmbXziABOp8iDTELliNJOSSJgkZkfxXbM8gnmCq8PJlGXT30iGhZY4/jS06oymDp
         oBJLqTOGuiSpx2GX3IrpCr2lMqkNPwF515jMdunDffA17o5bXSjv2YDSTikeq/9jjEiy
         vCzA==
X-Gm-Message-State: AOJu0Yy2GCA6xTed7BV7MlbO2EKXzpm33uMCepejHDv3unEQPCCM0kRt
	Xx4OeD3IZqkZd8fTh4FZ/CcnIUCgr9khHB7dsZ+wtwzTZnZeIOVAAjrXu2ZDLk4AAqwEn/elnAc
	KX2g7z+rjEwo1Mm3KolLSZ9tMETXpWTXkCF0/kAF3UeuQ920t/ExSAVy8tEfxMT94Lg==
X-Gm-Gg: AfdE7clFSG3LrCB1O5gK2szv+gQ7dj5tAkKxa/Cp7Ps7RrZfEjtqczGzK+lqAs5Rbjy
	nzy/L4GxhwA18W0/bWXReAcn1MGqcGSluQ1SyZrYnM8v/l0P8gsdSZzpEMBzby4RSUvfQcQTPrd
	ftl7pC5qG/Z1vv/lO7Q/VNzySSwcKSxemPJZlt4MuUC1JU+1pzSg9Ppx83u7NMcE4uotqQmcp/5
	xCQB12s3fu/HJsalpD4QsIdLj6bRt8OmcD4hMR/Zm4IBg3g/53o6v01/NKoD/neetWBcjeLRk+y
	onW5oCpnm5E+oNKAU1wWcR3yDoK2maZ1zNnKCykGBddUSaprg/uBq2lpx73Rj+b+u5vn1UYTLI0
	NEtM+mbZ7MZvgpcttO5aD5fx2FfChGH08xMdO8Hj0SZOIVLBC9ARk00Z+pGEGqXU5m1lcnGWI8+
	qdt9N8nz2+CkR8LIyrqj1tJT9U
X-Received: by 2002:a05:6102:5815:b0:737:9edc:36f8 with SMTP id ada2fe7eead31-744dfc5848fmr3686446137.1.1783604531910;
        Thu, 09 Jul 2026 06:42:11 -0700 (PDT)
X-Received: by 2002:a05:6102:5815:b0:737:9edc:36f8 with SMTP id ada2fe7eead31-744dfc5848fmr3686423137.1.1783604531438;
        Thu, 09 Jul 2026 06:42:11 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39c849186e1sm3345151fa.9.2026.07.09.06.42.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 06:42:09 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 09 Jul 2026 16:41:56 +0300
Subject: [PATCH v7 05/18] media: iris: Introduce set_preset_register as a
 vpu_op
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260709-iris-ar50lt-v7-5-76af9dd4d1f6@oss.qualcomm.com>
References: <20260709-iris-ar50lt-v7-0-76af9dd4d1f6@oss.qualcomm.com>
In-Reply-To: <20260709-iris-ar50lt-v7-0-76af9dd4d1f6@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4447;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=vk2n05YaqyNL1lA1l7CdzDHPMAEMMeRGvxRtE9L+Mhs=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqT6UksKFRgIX9Lp+8E0Hywq+my3Nx4lnQEZ72s
 drlAdiRqgaJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCak+lJAAKCRCLPIo+Aiko
 1cMNB/9CYfpwvPpAQTZSLJYikhT5r9Xf2JcNfNqTPaoBCR4RYDhT5jdRW2YdM5QhLnGe5YLVTAL
 TuwcJSCZx6bcZX3Zjapk415QZfec3lG/VAyqjXry2uhWytNqCfOOzx4gd+i3P5EsPZBK802z8GE
 ADjnM8cVN4p2F93gNZRyWSPXYjDrBlc8lG+0MQYv48bFzYSC7p8jFjFld7hHA1fQWf4X48GPLGC
 FfDkSh9PJsgkX2XlRs2M7fTtVX6nzw7chpXDanr9Pc7JMqZDttGGzSNYtLWUogfecXLW2+F5vjQ
 bfayvt/OtjZMumNbLMpLKwE7TOsADbBMhG3ebhiWMURmNKes
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDEzNCBTYWx0ZWRfX8trPVvMVg3xB
 T4PNcEzzfrPCZWcM1nNJLYBaNQ9cG2QfA7tDS4Tunfn5x67MIQR78lLrrbDdw3sNieF970KS3j3
 3I+F8qecIY6YFNtVQrakJrhOaj4DD8w=
X-Proofpoint-GUID: NEyVy83cOrY_La4gCOXlyLHpkuVLi6Fw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDEzNCBTYWx0ZWRfX5jg6FF5N8lrg
 4NdcIrZFG5AeKMT/eUhLcPV/J/rpKiWWSCLnl8vl3Gh6ff5qmxcfxwuo/ew/s8EcXp7xlEKN8zm
 YYBppTI+uKue4l2V5531ZZt4gbeEIdnCn2cjajxEUJ0M7YtGrdeNT4EI/KMHyF8pOwbwDX6RyIL
 SpLGGNkzhVkvmf0wrFsLWE4qQ70Yqj1lUJMXBVomdnG3QHuPPNTBbyqRIUNEIM7tujdQiu90rae
 XIMx12ADg4058hdGL3zHSNgA6pIX71a3GZBJo2y/F4BDrnlFhmZsVnjH6tDouOWMVLP0jGthUPM
 rNOnl7eXBQaX43bvg1EI9YTWj55kJJ5dpQcOlXn/aLWxTxjhxIF37dRTX3JHAUNvQPK5DRKnh8T
 Kqpb/vIvA8b9va3dh/BQckHPRer5+HlOpy+K0UnzQ/UeykISQXsZjS+S4VTscqyYddOtLr8vWZ2
 k0M8qWyH+Km/ETOB5oA==
X-Authority-Analysis: v=2.4 cv=Sv2gLvO0 c=1 sm=1 tr=0 ts=6a4fa534 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=4Uh0hlRDs2lXuULb_e4A:9 a=QEXdDO2ut3YA:10 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-ORIG-GUID: NEyVy83cOrY_La4gCOXlyLHpkuVLi6Fw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_02,2026-07-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090134
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-67167-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:vikash.garodia@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:mchehab@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:busanna.reddy@oss.qualcomm.com,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:dikshita.agarwal@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CB62D731B99

From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>

The set_preset_registers sequence is currently shared across all
supported devices. Starting with Qualcomm QCM2290 (AR50LT), the register
programming would differ.

Move set_preset_register into a vpu_op to allow per-device
customization.

This change prepares the driver for upcoming hardware variants.
No functional change so far for existing devices.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Reviewed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_vpu2.c       | 1 +
 drivers/media/platform/qcom/iris/iris_vpu3x.c      | 3 +++
 drivers/media/platform/qcom/iris/iris_vpu4x.c      | 1 +
 drivers/media/platform/qcom/iris/iris_vpu_common.c | 2 +-
 drivers/media/platform/qcom/iris/iris_vpu_common.h | 1 +
 5 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/iris_vpu2.c b/drivers/media/platform/qcom/iris/iris_vpu2.c
index b8714dcbad10..2dc121a3f5e8 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu2.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu2.c
@@ -45,4 +45,5 @@ const struct vpu_ops iris_vpu2_ops = {
 	.power_on_controller = iris_vpu_power_on_controller,
 	.calc_freq = iris_vpu2_calc_freq,
 	.set_hwmode = iris_vpu_set_hwmode,
+	.set_preset_registers = iris_vpu_set_preset_registers,
 };
diff --git a/drivers/media/platform/qcom/iris/iris_vpu3x.c b/drivers/media/platform/qcom/iris/iris_vpu3x.c
index 3dad47be78b5..dc02ced1b931 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu3x.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu3x.c
@@ -261,6 +261,7 @@ const struct vpu_ops iris_vpu3_ops = {
 	.power_on_controller = iris_vpu_power_on_controller,
 	.calc_freq = iris_vpu3x_vpu4x_calculate_frequency,
 	.set_hwmode = iris_vpu_set_hwmode,
+	.set_preset_registers = iris_vpu_set_preset_registers,
 };
 
 const struct vpu_ops iris_vpu33_ops = {
@@ -270,6 +271,7 @@ const struct vpu_ops iris_vpu33_ops = {
 	.power_on_controller = iris_vpu_power_on_controller,
 	.calc_freq = iris_vpu3x_vpu4x_calculate_frequency,
 	.set_hwmode = iris_vpu_set_hwmode,
+	.set_preset_registers = iris_vpu_set_preset_registers,
 };
 
 const struct vpu_ops iris_vpu35_ops = {
@@ -280,4 +282,5 @@ const struct vpu_ops iris_vpu35_ops = {
 	.program_bootup_registers = iris_vpu35_vpu4x_program_bootup_registers,
 	.calc_freq = iris_vpu3x_vpu4x_calculate_frequency,
 	.set_hwmode = iris_vpu_set_hwmode,
+	.set_preset_registers = iris_vpu_set_preset_registers,
 };
diff --git a/drivers/media/platform/qcom/iris/iris_vpu4x.c b/drivers/media/platform/qcom/iris/iris_vpu4x.c
index 02e100a4045f..f608a297d4a3 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu4x.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu4x.c
@@ -368,4 +368,5 @@ const struct vpu_ops iris_vpu4x_ops = {
 	.program_bootup_registers = iris_vpu35_vpu4x_program_bootup_registers,
 	.calc_freq = iris_vpu3x_vpu4x_calculate_frequency,
 	.set_hwmode = iris_vpu4x_set_hwmode,
+	.set_preset_registers = iris_vpu_set_preset_registers,
 };
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.c b/drivers/media/platform/qcom/iris/iris_vpu_common.c
index ab41da1f47c8..a49113b0da23 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_common.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu_common.c
@@ -483,7 +483,7 @@ int iris_vpu_power_on(struct iris_core *core)
 
 	iris_opp_set_rate(core->dev, freq);
 
-	iris_vpu_set_preset_registers(core);
+	core->iris_platform_data->vpu_ops->set_preset_registers(core);
 
 	iris_vpu_interrupt_init(core);
 	core->intr_status = 0;
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.h b/drivers/media/platform/qcom/iris/iris_vpu_common.h
index 09799a375c14..21ed4c9bd5e3 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_common.h
+++ b/drivers/media/platform/qcom/iris/iris_vpu_common.h
@@ -22,6 +22,7 @@ struct vpu_ops {
 	void (*program_bootup_registers)(struct iris_core *core);
 	u64 (*calc_freq)(struct iris_inst *inst, size_t data_size);
 	int (*set_hwmode)(struct iris_core *core);
+	void (*set_preset_registers)(struct iris_core *core);
 };
 
 int iris_vpu_boot_firmware(struct iris_core *core);

-- 
2.47.3


