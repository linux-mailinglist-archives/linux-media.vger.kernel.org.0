Return-Path: <linux-media+bounces-59669-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eHevGtFa72llAgEAu9opvQ
	(envelope-from <linux-media+bounces-59669-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 27 Apr 2026 14:47:13 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E40B0472B5C
	for <lists+linux-media@lfdr.de>; Mon, 27 Apr 2026 14:47:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9853D30166C6
	for <lists+linux-media@lfdr.de>; Mon, 27 Apr 2026 12:46:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65B063542F8;
	Mon, 27 Apr 2026 12:46:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dOvuZIMR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="G+6r4IgR"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F021302140
	for <linux-media@vger.kernel.org>; Mon, 27 Apr 2026 12:46:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777294000; cv=none; b=CjhW868Ie8Z+rUg2xkshewq6+j73Sg5G+73YIxUFTp8RTHrCkZ7JD2OaMY1I6pNWtUYMwJz9GLNHFlp1uYyTWe4/b2yk7HBEi/Mx7ls/m8jEV/cWDExcIfCGrGNnV2n8+VG9CgcF6HR6MKXk6X3TnytuTYDsPKNQjAY9nqHfUsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777294000; c=relaxed/simple;
	bh=8W5y78VKUavviXikxj7dAYRekuTy1qq9Xl81Z8IQtNw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Vtp0nmaVzXkd+6/86U1ynQprYOzpYeYAFExC5zamUWtYymwGmskflQh6SOcvak7KCTFdQ54hjFeHRTz4/uxdMsytHQUt59LEPNfpyGlWWkO/NgJWU6l2mSPBpuH1NRzSgrh/CRQxyNQ10FZEJs0DGHNZeelFsj5AV4QajsKYLsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dOvuZIMR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=G+6r4IgR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63R8T7nr3639599
	for <linux-media@vger.kernel.org>; Mon, 27 Apr 2026 12:46:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lCJ9j9cXMZuO871EpV/2lp8v7oOXkTCu0ysZH6cE8Us=; b=dOvuZIMRDKj2fsPO
	rey3TLa65b68eWZrdBiA3kmksbE2ZUzz7/xMoOBH/YtCghhCPQyHO+GJsA7ektCr
	TJpgi4cTerxyjmPDs5gtz3LsNSgN6EMbX3+vKB9xCEB9d8Kd69g9G03iCkdVJuo8
	K9I3LhBxl2hp0GRyUEc8akNzqzaaCtfN1iV90PS9QfdMoh0SZ3bCGQdHvDJNDFBC
	z3kzrOz9yONT0JW95F2awgIaZDHATPlmgSmmH1S7Z6u7dIfBBS4RM9ZKetlCVCuv
	+Voa0ibEC2Ky3SvcxxyN8FjHVR5Hx7DBrcGyqzYy58pg7SwaPGMnJNAX58VcDlxY
	TUA3Dw==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dsya023am-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 27 Apr 2026 12:46:37 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-620f5085c37so4746141137.0
        for <linux-media@vger.kernel.org>; Mon, 27 Apr 2026 05:46:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777293997; x=1777898797; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lCJ9j9cXMZuO871EpV/2lp8v7oOXkTCu0ysZH6cE8Us=;
        b=G+6r4IgROX4alcWPUNrzlQ+vIlheTjWOTFZ0sDtKeas/mRDwZ0VHuBC531QcVbn/zn
         oIQokG6VerEAvYVGdo0VFZMzWOvAogfKnSr+c6ZhhEXOjNFF+jUqqHO4LPefiC2yH2BJ
         nVYopGf1zuBDvioQlipsX4loYqw/k+CLFKCwnhOa4YcyURqrJGkTGx/DDpHnsMcjZkN5
         54AJN6HYH8hR6KO4OIXuxYCafFHwxNp11cncMHx1Ib3CO4OtzJ2K+NwPT8LOY8f7oaUm
         18C997GPVkqalfuSZyOjigLX0LN6dg5SKC2OOTNwKww5Ot5pm2s+cMWtTmn26s9OFE+o
         nhvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777293997; x=1777898797;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lCJ9j9cXMZuO871EpV/2lp8v7oOXkTCu0ysZH6cE8Us=;
        b=mkG3nsuf5p7ViNMH9mdGyOGQRbLU6g6z5y3tSlRU0yeEZg7Dd93tHQ/DTENmAb1at6
         bYtF3z/t9z7oluJcx7w3pW2igClP8ViTq2n5PWAu17g2tRqdfWXBDeRc2BFog72CohsX
         8lqQaiFfHrpw0yrM3Ckl1zng4lRzFsaR46jkzEws80hKh6GHOyOoP6eP+4lAMtZ9vJ7r
         LuJau0Di/oI0Cut87NnrygdM/G8UPXlNs8F9MLhSDK10jX05EpF4rqmHoWBtmtyCUEYD
         CQsy3roJRU/daSxZPZ/fLpAXaGf6IQf3NYznVhWJSK8gnOt/Pq76cVzY2KlYH5Z4Sc6D
         zSdg==
X-Gm-Message-State: AOJu0YyxcbcYx8X5i1cjZgRxfamYhuxMEZWXGIOd1g3B3OxwxQx8GV7g
	O37MMTrdNKgLtJGxpGGv3ET4t6jzbF5sUSmF7JeMXQUEcXhSr9qpAl+hF7FY0aSfJZV1hPktuPj
	H9bN/o1QmpWuHMJqUrhAQPsHA3msjvbA7pBwDGGiJT1EUIcXL7aPLyfGx9g1zV+j4Cg==
X-Gm-Gg: AeBDietElT0NciJzpZ9UZLag+gRYMHcTwaqXFP15xId/xPvKeky6TABfvWV4ffqawBC
	We+d8cg+Jiu6WAGOK08Pu8NUBDpOBYDPKcEFHtH4HwQSXpubxQP9iYKaI8N5PtxX20EJ91zTd0J
	KRMMzWFgHWm04yojAfNwRHpMVnkeOg76OM7u0RS4VIZzZafz/tVlxSMeM3Fe0FxoD8/5pNTfthn
	L1h8ZqVWfD3UslJgfHzoKCCRitpJ2O70Y9ACrFWvaVM3/elaV/tmutCMd2wNHCYpLTHLjtdS1/X
	Eh767ylem12zgJi9S38QpXAckjcoCL7VJILZf3it2dIxE9E4xMK3/XCtudfNbUpYeLa7pK9gEVK
	L8vKKRONbVLlJXk+5tPl9dOvl2axZSgxRs0VKaLShOfLtpdpZHX7Q/CyNg8LnqH3fH2H+0PW+gx
	PnW5EGtU2UUaCjNCy+VuPNj0fhTks=
X-Received: by 2002:a05:6102:2d09:b0:605:17b8:16dc with SMTP id ada2fe7eead31-616f6ef7d62mr22668423137.20.1777293997365;
        Mon, 27 Apr 2026 05:46:37 -0700 (PDT)
X-Received: by 2002:a05:6102:2d09:b0:605:17b8:16dc with SMTP id ada2fe7eead31-616f6ef7d62mr22668384137.20.1777293996955;
        Mon, 27 Apr 2026 05:46:36 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:653f:4d28:6a78:a6ca])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba454d1bd19sm1091496866b.37.2026.04.27.05.46.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 05:46:36 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 27 Apr 2026 14:43:28 +0200
Subject: [PATCH v2 01/14] media: qcom: camss: Add support to populate
 sub-devices
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260427-camss-isp-ope-v2-1-f430e7485009@oss.qualcomm.com>
References: <20260427-camss-isp-ope-v2-0-f430e7485009@oss.qualcomm.com>
In-Reply-To: <20260427-camss-isp-ope-v2-0-f430e7485009@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Bryan O'Donoghue <bod@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
        devicetree@vger.kernel.org, laurent.pinchart@ideasonboard.com,
        kieran.bingham@ideasonboard.com
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: aBsvXYIq1DOe1BxYloW6XijmtafNMKDp
X-Proofpoint-ORIG-GUID: aBsvXYIq1DOe1BxYloW6XijmtafNMKDp
X-Authority-Analysis: v=2.4 cv=DZEnbPtW c=1 sm=1 tr=0 ts=69ef5aad cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=5bRy6lfvdnCUHtv4pvsA:9 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDEzMyBTYWx0ZWRfX38PaOVKJNhlz
 hWbLop12cSRbyo1vNeq0+DXXS9fnKLSzpzOTBtMFlXj3J0RgEZnNg3xtYOxMINDd7ZOzNgYc78L
 9Af3/im4Xg4W+8sLVhLQ2gR91rdNLb5gMA0S+wg9UHtqzmMIpQ5fmHXcPXQgmSIOvllIRPdLwsW
 iaok5TvxKnKG+lMekeXkZh/Y+qwzYs+lEEUucmJJA4SMr+R6dBKlFB50CntlQs3ImUJrEG2uRYL
 tCAluqGsaxizmf5BZXgLYS71ODp//YroFBZLqK3t9pYhjCg9bMqicE9lgSSjS5HZQY1mid/s1B5
 w2Mhrxw40bQzlOilq8Tl0bMxc6kNVOkO42Y8Zk7H2S/kzlZpuhLuyHx2tn57SXS9pwJ93lNI0q1
 Jxd/w0IEmeK2d933TJqBfpyFA+DPGTwJ9m30CU6tJWYs8YHV349sV/ztfwrDMAt9urJKu3a8D6y
 E1b8MDHvNJE1vCStcbw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 spamscore=0 adultscore=0 bulkscore=0
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604270133
X-Rspamd-Queue-Id: E40B0472B5C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	TAGGED_FROM(0.00)[bounces-59669-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,linaro.org:email,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

Use devm_of_platform_populate() to populate subs in the tree.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 36c601c595053ddad8d327b1416d7ff587920174..8f2b1d3cd9f289895aa439443d2a18bb036fccde 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -16,6 +16,7 @@
 #include <linux/of.h>
 #include <linux/of_device.h>
 #include <linux/of_graph.h>
+#include <linux/of_platform.h>
 #include <linux/pm_runtime.h>
 #include <linux/pm_domain.h>
 #include <linux/slab.h>
@@ -4608,6 +4609,8 @@ static int camss_probe(struct platform_device *pdev)
 	if (!camss)
 		return -ENOMEM;
 
+	devm_of_platform_populate(dev);
+
 	camss->res = of_device_get_match_data(dev);
 
 	atomic_set(&camss->ref_count, 0);

-- 
2.34.1


