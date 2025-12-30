Return-Path: <linux-media+bounces-49744-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BA84ECEA3F1
	for <lists+linux-media@lfdr.de>; Tue, 30 Dec 2025 18:03:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 115BE300E7B5
	for <lists+linux-media@lfdr.de>; Tue, 30 Dec 2025 17:03:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7C1732B98E;
	Tue, 30 Dec 2025 17:03:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XREN7K9s";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZiyDfXdF"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F0192459E5
	for <linux-media@vger.kernel.org>; Tue, 30 Dec 2025 17:03:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767114198; cv=none; b=hmo+f06kNQi8KVia0Se17HpSmc70ynvzwTLl95mYGcr1pCHEc4vPuzqorLpn5MPoaz8AClPp8NY7yuizUf6amek//kTTh/atRjd7bhkrrwXMhZz0XzAOrvqYN2cFLl7F2rYBdLlTCGGKI9a/qIpNTlRIYvfbcZ+4JiCMfzizpeg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767114198; c=relaxed/simple;
	bh=QUXpcxV1k5QMZf+QaO2uJlP0NmXwPLJrLAyJVowOkB0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UTzi++ZyCKblFqkiiTf90S+yGmgTJ9tQl1ZcMH2CZoqcX6xycFaeDAyEyvGHQNzR6UFwPkymgspFHjNE2FdzwodpDNQMS7ySlKDDGsCz0xddY8FOKMqvkZoTfyPotPZ+VVa6SBLfh6vJ2MDR5NghxvZyqQ661DrbkWrDV4NhUdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XREN7K9s; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZiyDfXdF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BUEcOFL3539627
	for <linux-media@vger.kernel.org>; Tue, 30 Dec 2025 17:03:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PxeWmtW8IdrQ7Qfko3faPMcvx1IgxirxWZVDR5z3bR0=; b=XREN7K9s2o1Sdb+7
	fnI5wPIIgG8GJN/nC83G2ulqn5YX6Nf268Vk7QCZSK9v6rhbUv1GasoLvGhavWQz
	OfsJxOpDK4tX7nfbTAVXeNrTPMDTry9FmKeuIedYOJELX/XoL23U9pQ271GTCBes
	DO2hIBiFqPhOvhc8Rf/g5jqcTDKKenJN89Yc6aixmMdloxDyEclj/0T4DUXTLjdP
	MRF8lFZwVU02diIYth7Ctlp67Vf5omoVqC41/y0UDEulaVS/x0MKv4A+XjieIWcP
	JP6To4sPPym7U7hu3ty3xZY/kpCBnzxJgF89VStMvhgaHl9TczsNuLCH+IVN47nd
	aZ2+dQ==
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com [209.85.128.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bc88yhn91-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 30 Dec 2025 17:03:15 +0000 (GMT)
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-78fa4ffdf74so127781277b3.1
        for <linux-media@vger.kernel.org>; Tue, 30 Dec 2025 09:03:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767114195; x=1767718995; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PxeWmtW8IdrQ7Qfko3faPMcvx1IgxirxWZVDR5z3bR0=;
        b=ZiyDfXdFNXXkf8VaJz/4JQt7xv1czyyUIHTqHJYHDE0DLtQOCf/74OEoYkc71irzs9
         rwVRy1RfNAmD/vH/l/zZjRHIzOdwvn3a8lVSxU1rLO4PXbYzfYWNLeh4L30J126yxfjy
         fbkwV9gZNbkBufrvYW/oXHFIcQkfHq5C02kwVeMQzehElUHGP4HwgXFPTT5tzgmhAL6V
         L8JnClFmzAaySZZ2DIOn/yatk/5IUwN5FTWqHM/zpUApciEMcrc2DfuRfo+lJg9Mn5E7
         EwKgsA1zj992HiPBXM2KOCE4Z0P6FIhSA3mjAiAcDcJgMuqfDqX7ccb4o4QJVtGx0VyM
         phTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767114195; x=1767718995;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PxeWmtW8IdrQ7Qfko3faPMcvx1IgxirxWZVDR5z3bR0=;
        b=AsqcBWRCAk5RnHR+pj/Mg+sDBHP5O9buSsPhOmP2+IMLbNTaGR8pUROulw0ZcZR4i1
         Bc1FpgbapjrRlMNSPqHk1PRtnlDass82M9+8shabfYJf0UddfbUNJ3S1MNS0cM4Xwxhw
         Nrx9j6ODoAMDBqw1qcbL139OI1GgQA/ftUnvlFLCx88xunE03usdREoNeAR7+Z1qGeDI
         0pyPUiQYwGZcFpJcl7QeiiAWITlmefq0j5mc3BCOdwdDzS1EHTv0BfQRwCUmUtUQg1OD
         sVqJThGndHx/whRRnWqKixsO0LmbIUW1JXBGacnvwMIm/aEm9sOGnO43mwZAwpGQtgqc
         9a1g==
X-Gm-Message-State: AOJu0YxBQgsGC1m8JfXxEuEq7yzVh2IetNBPLOadwM4chiDyQeaAE6hH
	vSz8vw0ZHpcuzmLAEgtATJpoZaDwRW4QXT/eUJpK+13zOEV1MfvtJEsrevWFGGZRPNutiaRnm6L
	zR8zWrvQmYxpXWlR4dSBpAsTVZTXGM33BzIoyx1vGYGYlXpMHtAYhpcEwhCukANkRbmp+QLI5Aw
	==
X-Gm-Gg: AY/fxX7OxWGPyq/WBzUSOJLum+fY+cKEuqUGjutBguySvNMDUxrzD20ujUjp1gdgCbo
	Vy9RTElKOVzLk7mL3SNBBcLoO0gYnqbWfPPdWk6Wctl2nQXDf0RvXg2Y1Droqgk9Yq/wYIIK+R6
	qw5NUyql+TnKiuO/PPqGaucEBI9uVcR+0R6UdeOMciH+OT7P57aJLVsoHMzxluYxtjztHxPdsuR
	RjMT3g6BllMJF6rO0wEu/RPWVhCMataanoJWEJOOBDQRCtneX6lbDu6Elw6Hinp0FXHYIivDnD7
	3bXMrOIRp06Vmymzbi/0EuTf3pBVBzE/tVvncUYpZKt0TH3dS/P1A2kkX4Gn2q9skekAR4voNvo
	9TUcezH/A8+j8SF9e6d0qVJ3kdSviKUWL43wY2Ky6tSd7V7jzl/quSwWZpZTJiwMmB67C3Rr5nS
	fH3pXf385D4Fq0QnJIKKWFqlTvHjT+I2+f9be5WNqZ
X-Received: by 2002:a05:690c:490a:b0:78f:8f4c:884e with SMTP id 00721157ae682-78fb3f26fdcmr308336777b3.21.1767114194470;
        Tue, 30 Dec 2025 09:03:14 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFJOLGR/FcqbE3k8GQnJpV5BepiEsz7+t1cMmeduT+rWr5bvJmYR8yxj4fKD6Nm9yTcQsjuvQ==
X-Received: by 2002:a05:690c:490a:b0:78f:8f4c:884e with SMTP id 00721157ae682-78fb3f26fdcmr308336437b3.21.1767114193976;
        Tue, 30 Dec 2025 09:03:13 -0800 (PST)
Received: from shalem.localdomain (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037a5bdb9sm3776086266b.7.2025.12.30.09.03.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Dec 2025 09:03:13 -0800 (PST)
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
Date: Tue, 30 Dec 2025 18:02:58 +0100
Subject: [PATCH v5 01/14] media: aptina-pll: Debug log p1 min and max
 values
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251230-mt9m114-atomisp-v5-1-763539e76094@oss.qualcomm.com>
References: <20251230-mt9m114-atomisp-v5-0-763539e76094@oss.qualcomm.com>
In-Reply-To: <20251230-mt9m114-atomisp-v5-0-763539e76094@oss.qualcomm.com>
To: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Hans de Goede <johannes.goede@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=POcCOPqC c=1 sm=1 tr=0 ts=695405d3 cx=c_pps
 a=g1v0Z557R90hA0UpD/5Yag==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=P1BnusSwAAAA:8 a=EUspDBNiAAAA:8 a=ZdSappWxmhQcxru2t40A:9 a=QEXdDO2ut3YA:10
 a=MFSWADHSvvjO3QEy5MdX:22 a=D0XLA9XvdZm18NrgonBM:22
X-Proofpoint-ORIG-GUID: L9Bl0uD0Wprm2OoHuNCtF-8fyMGH1WSE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjMwMDE1MyBTYWx0ZWRfX3W/Bmzv+tdof
 UL7d/2ksr/tshWV3GAgDL/TNKJn2k18+0dP4z8zem/u3pixD6js6CpPV+9LK+fKwdxE40QaHPVv
 woJ1tUG2qMS1eoHiXZSR4vV3uTI86PcYmSGoB4Dg+jS542cR0kgDrvjB3qxCtyOjRlormQiV0Q5
 QifGEeo1b1HLUQOTuYJjcGkVXudWyUpI1OryZCvVjW/vIFzQeBRp+pHyJsGQ3D9U+vrtx/Ghgd/
 utqXBeSz5pdlV1VgFc7jtnPwivyaXyub92AjDHXx5KakRX9E7gwYnTVM27wPxUFFREcNOd8wh0F
 UtXtiVALRPLCxL36+C52C9FvycexrvYSjBtIFDvtUALSeIYoovDeBi99R3nPjenaIh6wO7fm0SW
 xcZMW+gRaeZXIqfidjhQmCFzncxy4mutfrxjuyUUZM4uLlAPcskmzj+K0UUXs0Z69VYhlFBDcVT
 O1lRZ1hiusndIg/4Y7g==
X-Proofpoint-GUID: L9Bl0uD0Wprm2OoHuNCtF-8fyMGH1WSE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-30_02,2025-12-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0
 bulkscore=0 phishscore=0 clxscore=1015 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512300153

Make aptina_pll_calculate() debug log the calculated p1 min and max values,
this makes it easier to see how the m, n and p1 values were chosen.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
---
 drivers/media/i2c/aptina-pll.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/i2c/aptina-pll.c b/drivers/media/i2c/aptina-pll.c
index b1f89bbf9d473f6ef00ebb8250405018d07e668b..cd2ed4583c97ec87e516acfd249fdccf2f9efbb8 100644
--- a/drivers/media/i2c/aptina-pll.c
+++ b/drivers/media/i2c/aptina-pll.c
@@ -129,6 +129,8 @@ int aptina_pll_calculate(struct device *dev,
 	p1_max = min(limits->p1_max, limits->out_clock_max * div /
 		     (pll->ext_clock * pll->m));
 
+	dev_dbg(dev, "pll: p1 min %u max %u\n", p1_min, p1_max);
+
 	for (p1 = p1_max & ~1; p1 >= p1_min; p1 -= 2) {
 		unsigned int mf_inc = p1 / gcd(div, p1);
 		unsigned int mf_high;

-- 
2.52.0


