Return-Path: <linux-media+bounces-49466-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 018AACDC349
	for <lists+linux-media@lfdr.de>; Wed, 24 Dec 2025 13:31:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7C48C303830A
	for <lists+linux-media@lfdr.de>; Wed, 24 Dec 2025 12:31:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8AEBE319618;
	Wed, 24 Dec 2025 12:31:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="I3VwW3a+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KOLWY4aF"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8558625524C
	for <linux-media@vger.kernel.org>; Wed, 24 Dec 2025 12:31:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766579477; cv=none; b=nEZZV9egAw776qaD83utIw+RJIQvVIrqI4B1IeOMdaThXbFbSZYwgOYFUra8zW2WJY1KHfn8DYwK5ECeXyopQmfHog/bHy+xzKMtKe2QX0rRDPQU/J/BNDmREuh8H+qPipgSEjhUnFPephXEM2NCmMOxbkuJG05UGN5VZBWrL+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766579477; c=relaxed/simple;
	bh=QUXpcxV1k5QMZf+QaO2uJlP0NmXwPLJrLAyJVowOkB0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gHC4UrKLHGe+oiMjtzyv/FUHKSoTtkZ3Km1ucptNbUXq+NzpVjrdVjZf2MTewIPtjESJkkNWIBJpYSpL+j/var6NpdCA6ugesKgnBH1czXpIpj80PI0rx3XbymzYQE74US3RgIhB0xKCEb0XZZtPlsal2nf7RMicjf96T2PPYkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=I3VwW3a+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KOLWY4aF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BO6HEoq678470
	for <linux-media@vger.kernel.org>; Wed, 24 Dec 2025 12:31:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PxeWmtW8IdrQ7Qfko3faPMcvx1IgxirxWZVDR5z3bR0=; b=I3VwW3a+re1+EgNI
	d/Bc3rsqDSLebs+X6r/6B4iyUVymL0fKEASUVnG13hZ5Twt+7vgUBK20WuSOZH9B
	QG4YVBdkNScY2osFINN6Mg/EJkoPEShsrgUm/hNfj5iR62QllKQZ1bmPNbmcIr6T
	HZTLpSLVTkDdmZuVDTuQWk+X7jTzSh8U3OemQpc1Go7gqOt/liWWNTmbC32w7rwB
	KoJYVJjWSbonB+2UhnzIOoS0BhJYKn/UjE484XK3IIwf2nIKP6xQGVPrHK5Si6SG
	epjw8dDS7o/seMh6PEEMBBEcpNiPhE/TpbpRQ6930Uton/UAc9t43VYW7za/fWwa
	uQ+xyw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7yvq2kga-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 24 Dec 2025 12:31:15 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4ed6ff3de05so163792731cf.3
        for <linux-media@vger.kernel.org>; Wed, 24 Dec 2025 04:31:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766579475; x=1767184275; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PxeWmtW8IdrQ7Qfko3faPMcvx1IgxirxWZVDR5z3bR0=;
        b=KOLWY4aFOAUvmjS9xlnd6D20NKLWjyn99VVdMIOGr3kRhV2MXD/aZgyMWuEtx+ELbx
         Ubz0wme3F0WiAJsQe5MSd0arAf7eaGnUJo1ZsaTfYZsbxk3igtVt1GHTJeXHG266XNkB
         JX8laFGKssKZFewvFnNSFoMmyAIvmJ2h9CqtBpKz+kxxZ2iE98VYrzkUF0OG308A5NwD
         AGSWt5T+b0Uq0M9oIcUGW/efygV821TTFYeg1az1x+0RCOdZySJmSJM52sWUUXbzxx5a
         gKnUM8BtxkPXdebmCHKlqW5mtYhgtKSEtz+AEu+bTkDjlX0blznc4SaECzGbzEGrHbBy
         JgYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766579475; x=1767184275;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PxeWmtW8IdrQ7Qfko3faPMcvx1IgxirxWZVDR5z3bR0=;
        b=MHg1FCDV/wAzCgV0JanoeWmpUJ3jVWfw8o4/9jjFOGPFFWiIrkhyem3AFYczWdfjUa
         IIKADqNHUyRTeKZmXwBMQPBp4Y0Wvq4g6ZfEPNw9qT5KjU/GdfbB4ClFI/aP+WPiqxdL
         axuzwu17nThC26bBeCMVk83U4JJ2AswLNpoX2n6srM3rYxyZ+h1ODW1YGEgiOxWZ8GnB
         Y+p9Tn0ZVhzpgQK/BOCxfsLhUIyVee1vuvH25wm92HBWMNTQe+tOFOyW1RkGxh2BofRb
         Pxq13BoHTOyQZGAjG7IudRq38E5x3mh0XRyvHowGhgmU76ztFog+HkeMKbiPNwnp72nx
         Z/+A==
X-Gm-Message-State: AOJu0YygQ6oJqATCAS9e0T98tqbkznvEXcHJiNCNvv2YUgq318s4lG1n
	b5PM8WpFemKfvLCIUfBtIRgcp39Aedw1owNefNlKx0/eUzqTHylCalvukXGxhIAK8CIM/0mtp6U
	BNWkKgNC1espGt+YJTJPlK8Zz5ZyRzqZLeN2hNZL3Z/rCvldkXvYMWZ609jvgxO/9+w==
X-Gm-Gg: AY/fxX7O432IH79sULZn2+D6G7VNQD6YdqsA+dOBS1FVmp+vN0wfD03odLDZEhxcASw
	UkieKXaixYnFUQ25mfx0rDB76BowEWUvwD+iFPCJ2lQx2mMqW2mT0DVLsE3oHrEohHzzgi5tB9O
	dcJp45XDJFm3DX5lNjYLBgP5RaT1Lf6QLg/2sGe0vQ28dejWZdqrn6UseMIYfylwnuzw8Pa/r10
	pmXytWs3xjTDZiUxp5PVr2VduEL0w62HUuNyjD2z3ofOAt0kh3WijOoKpXdwACF9kqoo8nMb0re
	NwKcSKv65cRJU26hc6NPBUPj2yFLqvN3C9XVr58cZaUZ2hyK1AR8uSF954qMuC0DGwz722EDo8v
	foOFSaPnM07trr2Km88g3nIzxHZNr0jjWLMDZ87R7vfnTH7/Wg1DPn4/rcHJGMCUPMHV3fm1Y3I
	tjolO6K3yQrAciD1sDMMea9MobJqga3MKZ3oZSLPau
X-Received: by 2002:ac8:5742:0:b0:4ed:66df:8023 with SMTP id d75a77b69052e-4f4abd06713mr256478881cf.30.1766579474624;
        Wed, 24 Dec 2025 04:31:14 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG10MJnqbcNG2NynXrTi/3a8LLEiBdYSfOlbkKa1Enm743lN9701kxP4hriFYJGThDpB55cdg==
X-Received: by 2002:ac8:5742:0:b0:4ed:66df:8023 with SMTP id d75a77b69052e-4f4abd06713mr256478451cf.30.1766579474195;
        Wed, 24 Dec 2025 04:31:14 -0800 (PST)
Received: from shalem.localdomain (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037f0b12dsm1750304066b.48.2025.12.24.04.31.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Dec 2025 04:31:13 -0800 (PST)
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
Date: Wed, 24 Dec 2025 13:31:10 +0100
Subject: [PATCH v4 01/15] media: aptina-pll: Debug log p1 min and max
 values
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251224-mt9m114-atomisp-v4-1-60b25da7a1bc@oss.qualcomm.com>
References: <20251224-mt9m114-atomisp-v4-0-60b25da7a1bc@oss.qualcomm.com>
In-Reply-To: <20251224-mt9m114-atomisp-v4-0-60b25da7a1bc@oss.qualcomm.com>
To: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Hans de Goede <johannes.goede@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: SOml_gD92fkr2Wux-VvsRYhfTkymRozG
X-Authority-Analysis: v=2.4 cv=abZsXBot c=1 sm=1 tr=0 ts=694bdd13 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=P1BnusSwAAAA:8 a=EUspDBNiAAAA:8 a=ZdSappWxmhQcxru2t40A:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=D0XLA9XvdZm18NrgonBM:22
X-Proofpoint-GUID: SOml_gD92fkr2Wux-VvsRYhfTkymRozG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDEwOSBTYWx0ZWRfXxoS2VQzX28Bv
 5Z5T3xvqmHeXc8ZZR2h8wapEYbJS2dD43Y4nxShM45Gc+bVyTJ8k/Wkf1KGcou5xl0S0KNZb8R/
 E2fJEwecWl6ga57DM7rICxIM99GtRgO6WwMKPcDWOrUxlEYgRcJfsTUjnE4/D9I4GAcx2q5+ofJ
 SDr5uRQOmqECZzmguZDSTmk2cUMKh2E16l+AmEBGVHujuY2L4yGDkO+PmffZvongp800wXO64PO
 s9xsXtuGZ7D8GvWPre95O00jE2y2CK6FzRkasMHWUyLuQ9Fz2WUlAwV/zMR/mmAoJ5ORBdmT4mt
 efW77aUxmFKfyOS4lxH/t5NWjpFXLqBMy3gVHSIAVZ+1MBVdq7Mhz09idW5luVQkOQpCuirq5/s
 jgkx7yZwx7e3KWvpSbMI9wWMubjQOgRY8YSaqxWyb+EzeEDbNeV02oDTKU3SHyzqILTTguuehkn
 ZOsk1/eFlfvgrFhDbPw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-24_03,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0 spamscore=0
 clxscore=1015 malwarescore=0 phishscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512240109

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


