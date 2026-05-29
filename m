Return-Path: <linux-media+bounces-63045-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QHCyKdymGWptyAgAu9opvQ
	(envelope-from <linux-media+bounces-63045-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 29 May 2026 16:46:52 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DA9A603E07
	for <lists+linux-media@lfdr.de>; Fri, 29 May 2026 16:46:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B57813127AC1
	for <lists+linux-media@lfdr.de>; Fri, 29 May 2026 14:39:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBB833F0A98;
	Fri, 29 May 2026 14:38:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KZfrr961";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ERqOVPWr"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 125D13EF66A
	for <linux-media@vger.kernel.org>; Fri, 29 May 2026 14:38:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780065507; cv=none; b=PIbCi8rdQaw6ljGLh3ah2FUpKN2+8rrxCZTxUuN+Hb5uLu4tU+jK82S31Pv6jVuWMnIPdnl3LcF9WBEp4aO8H3mWN+Sj1eQnx0POIQ2hnEcSuovz9v2rIjzxRI+Hq+PNKXrIUzpJFPjIo83XOT78tW2KueT/3arsl1ozUdOdqR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780065507; c=relaxed/simple;
	bh=2l7ASUVYGl+MTHZQX1kdxBx7D4NE1H4xPHCxp/OAHqY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=modIic73W+j8F59NhrsZZE3Uzd8wvgjEl6ouUDyYxrfW/O2BxodIQDywCvtI7cSYKyYLIE5hU+8DcymnMG396s4gCoACFLfMdD3uDvENIPHAWFMrlEd+fucW4KCTOFB4C9E1VklHXn1p86CPWYHWiAndnFpQt6NUJNKYcGSelQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KZfrr961; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ERqOVPWr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64TDL1kR2335081
	for <linux-media@vger.kernel.org>; Fri, 29 May 2026 14:38:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pEPcxjulbQi4xYK18d6nSKAQis+Z1kXngU/yn5ZXG88=; b=KZfrr961hmLBrKT9
	XiTWDl1D1ZNymTD9ynXZ2wsPMxqsUEdrMwPyim1m8QKsz3i3seGeerTit/8d1Kt2
	2yAKhlEVaW7BveEhaQJYlq6y7XM3soaiPiGhSN2bEk0E5due9vKd1FlEZrkgDBYc
	jlRDc2GWOyTDSuKKLoll4/FlyfEqgj5J6tME6WbEkvOSNobTy3nGbWWjVtq27V2C
	0cpccSLA8p5MBvCC83sreqnvHPlE5uz54LtDpoZL4Rngh41rMd144hYhXtPC1mZO
	Y2QqCElPykRdZid8aQFgqKTQG2FHYDVOmvX+hFF7VoszyajyspZ/C+al1ikIG51p
	EvdENQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ef4jj2786-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 29 May 2026 14:38:25 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-365fd467cf6so11596346a91.0
        for <linux-media@vger.kernel.org>; Fri, 29 May 2026 07:38:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780065504; x=1780670304; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pEPcxjulbQi4xYK18d6nSKAQis+Z1kXngU/yn5ZXG88=;
        b=ERqOVPWryyh/XgTcyw8ItZzQFLhHDkMF4OkkKRBPRU4DPFXqYMh3Y0JrEF9qJX6XLh
         0PubI+A3rdS/PxObtvtq1WvUk0P6jjzxvzDpBrbYHwE7kfoTF62ZVOAqbXceOAEhzrAG
         S8lr8VO3GGYa1RAIxaxtA6vxJZHb+If6xL+GXha6Tbbgr6zOWo5LBGDBTr3ceSlWY+1N
         iCMLzLNgDFT5do+vy2KDC1l/0lJ9oGviawuXzBNQzSAK//a9wgFT5cOODNhPqW4vIJEp
         g6+A89n6ybmGr+jn/N+tT2+xgJH02QwDHfuTlhNpz40Duu0OIAMwIIKN0GYQmxVZx/Bi
         WZ5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780065504; x=1780670304;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pEPcxjulbQi4xYK18d6nSKAQis+Z1kXngU/yn5ZXG88=;
        b=WW9rm6mygGQRIfynUQ1FzHXZmgAi2NW3RPCsDtnMFW1KVwLL1oWjoJk4q9sGtW8ctQ
         QrroPZlw4zIz4YzerA9JgXqAre6MQa8f1LcSbfmMZtJevdpqFkcSEkxOcFEeatomJyKy
         +EEZAm0fjXEzhQzg675vxhzdoMkt+OHC8KkD+mbY511ZNoxDxYShMoXDU3hlj0lPkTQb
         dGZdmY1ze1YZrc4YqBeRFRBEm6bX4A+4NifU+nyu0wmOPKd58PrwvKlpmmCx/v8ouzI4
         Dr+E5yyxbErlYDhDCcHBAqvRsc/ddaQbrfPnjUypYZ9KUmYgmlJFO2rIBcDmgkAZ3LZ2
         Cg2g==
X-Forwarded-Encrypted: i=1; AFNElJ8o9l21b3WGObEKsQxL452ofkmjTaXz9zwl0UC18P1wKlhN/qrSl2+sisiwraf2j+FJaKItG7AKN+nW1A==@vger.kernel.org
X-Gm-Message-State: AOJu0YznQ69KXOW9ngabgB2aSQxbE6u2QwNBlHVqocOyUM/brphPJymS
	Jhjnd/7+YrndDVQr8Tjz6Gj1BDPU7mApTx//IdlWT9GoXcU+g8JpPmxAzs1QSrlu1np+DYtPNHp
	f/SvEjzIWxOG9H4sj21mZA4Rldnpp8f0Ser53GbiyzWLZ3pZxzzYKiDeD88Ce/8yOdg==
X-Gm-Gg: Acq92OG28ZxmPRoVr/LQc8yyM0xipBcIvirMS0SXbWx2jeZXRJBIKrbQwCx23OZ+Rxw
	XzZ+i8unxdg5ILk9Nq8UWPg+jnwPFRIoN8T4uLZyX2kOqmZ8wyOy8Mm8x0qd9BRg4wJnn++KSIn
	6+YwVtZ5Fx+HJQGRqzDsOLDXLsAazusrOhyK2AeMIZ3/CFXHFiGlh4uiXA8NftGzI+JYoHw8qvA
	PwufV9vvn9lC8vD8nguPAms/cX2/rqcd1gcEby/lX5t58XirzdvwAh3Jqo/WU0lpMd1KExgpQ6o
	c9cIEZoNYgHzmosesSlvcVbNcQhRqyPpvlf6Skn9zuxBasuaOCQCo6bPy8yVRZLo9keQZxve66k
	nqM1GiJzF2jghZ7V8iwk4fY9CliXNQ4P70QdaHY9DpLxvBoNie127/pi/upmgp0jaLQ==
X-Received: by 2002:a17:90b:4cc9:b0:36a:3176:ad08 with SMTP id 98e67ed59e1d1-36bbcff7b2dmr3693039a91.25.1780065503610;
        Fri, 29 May 2026 07:38:23 -0700 (PDT)
X-Received: by 2002:a17:90b:4cc9:b0:36a:3176:ad08 with SMTP id 98e67ed59e1d1-36bbcff7b2dmr3692997a91.25.1780065503106;
        Fri, 29 May 2026 07:38:23 -0700 (PDT)
Received: from hu-vikramsa-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c85772993c9sm2469394a12.15.2026.05.29.07.38.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 07:38:22 -0700 (PDT)
From: Vikram Sharma <vikram.sharma@oss.qualcomm.com>
Date: Fri, 29 May 2026 20:07:26 +0530
Subject: [PATCH 6/6] media: qcom: camss: Enumerate resources for Glymur
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260529-glymur_camss-v1-6-bee535396d22@oss.qualcomm.com>
References: <20260529-glymur_camss-v1-0-bee535396d22@oss.qualcomm.com>
In-Reply-To: <20260529-glymur_camss-v1-0-bee535396d22@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Prashant Shrotriya <pshrotri@qti.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780065463; l=1246;
 i=vikram.sharma@oss.qualcomm.com; s=20240628; h=from:subject:message-id;
 bh=cjRbYS3MDx7sjTRWCdrbRmdl5hn7CXbudx8PwfgWcG4=;
 b=Y+9dlGWNrAcbBsDrknHM1Mie43lV9Z4E356FDUowae3qBsowgbcnLblt/w2+TPEFBvqN7iz2Y
 /EP3L149QFcBpoqzk+zGxdSant8Ug9v6mny0vsvig07ourJidmQq/Ez
X-Developer-Key: i=vikram.sharma@oss.qualcomm.com; a=ed25519;
 pk=vQBkwZr1Hv+VXogAyTAu7AEx8/6bvkOmgrzYFbNGCDI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI5MDE0NCBTYWx0ZWRfX9420BVTlTPAM
 g1x1ZmXY5zECMtbka9Hm9SWa4baOE/DCvh2j3Nh+B0pZoSdkE/dcyuw5BFIDiz52X5qC9OcVjI0
 zLiCJTVYNrCOB7ngYz1qY8YXSGF+C+dv6TiZ0ouJmhMDINKY5L0bbA2CLiU0/1mYEXy1Cet5d5H
 QJCInd5CRLRdxBEMwWoGorhusAndeX8NR2O9wAWYAJsmuahpRfZhAS7q4WiSn035r1kLPem6Mlq
 JvKzUKNg0NpT64LtpOHhMsEoz/W4Ddt+Ni94HHTMhg33S8TvhUil2kbv+OW7zMmkCvMKMSFbPFI
 AFZsihYpYN5uPhyPRrnVei2P4HX1M7sznHHZa2ynCwwaHCzZpl54I1m6MsamNbprHM8aYhF+Ecf
 4Xl1ZF/LIztFh6z4HRJBB3Z5hr+tsY0Tf/W9D1AecHOdmDbW83ktSfOpxIVGfe73damQHQODumP
 lxckSO/98w5AGuEoOeg==
X-Proofpoint-ORIG-GUID: hX-GAFU54AzTlMbBkdvdUXyuGXlX_Ng-
X-Authority-Analysis: v=2.4 cv=Tt7WQjXh c=1 sm=1 tr=0 ts=6a19a4e1 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=mRZuhVVaaiH9Hk074e4A:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: hX-GAFU54AzTlMbBkdvdUXyuGXlX_Ng-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-29_04,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0 bulkscore=0
 adultscore=0 malwarescore=0 phishscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605290144
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[18];
	TAGGED_FROM(0.00)[bounces-63045-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vikram.sharma@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 1DA9A603E07
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Prashant Shrotriya <pshrotri@qti.qualcomm.com>

Enumerate csiphy, csid vfe and tpg resources for Glymur.

Signed-off-by: Prashant Shrotriya <pshrotri@qti.qualcomm.com>
Signed-off-by: Vikram Sharma <vikram.sharma@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 864e16e999e3..004df8fdf08c 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -5564,6 +5564,17 @@ static void camss_remove(struct platform_device *pdev)
 static const struct camss_resources glymur_resources = {
 	.version = CAMSS_GLYMUR,
 	.pd_name = "top",
+	.csiphy_res = csiphy_res_glymur,
+	.tpg_res = tpg_res_x1e80100,
+	.csid_res = csid_res_x1e80100,
+	.vfe_res = vfe_res_x1e80100,
+	.csid_wrapper_res = &csid_wrapper_res_x1e80100,
+	.icc_res = icc_res_x1e80100,
+	.icc_path_num = ARRAY_SIZE(icc_res_x1e80100),
+	.csiphy_num = ARRAY_SIZE(csiphy_res_glymur),
+	.tpg_num = ARRAY_SIZE(tpg_res_x1e80100),
+	.csid_num = ARRAY_SIZE(csid_res_x1e80100),
+	.vfe_num = ARRAY_SIZE(vfe_res_x1e80100),
 };
 
 static const struct camss_resources msm8916_resources = {

-- 
2.43.0


