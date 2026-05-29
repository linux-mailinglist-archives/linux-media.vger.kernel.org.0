Return-Path: <linux-media+bounces-63035-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KL9uE/mkGWptyAgAu9opvQ
	(envelope-from <linux-media+bounces-63035-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 29 May 2026 16:38:49 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E0A6603BAC
	for <lists+linux-media@lfdr.de>; Fri, 29 May 2026 16:38:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 83811329D6B1
	for <lists+linux-media@lfdr.de>; Fri, 29 May 2026 14:26:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5F753EA957;
	Fri, 29 May 2026 14:26:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fcfEZPZA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PNJZY4uC"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2770233DEE5
	for <linux-media@vger.kernel.org>; Fri, 29 May 2026 14:26:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780064780; cv=none; b=PnmNaze3PGQSsfk3wN11s7bw0LoKzU42B31mNFZTw+BoeS5eSHphPuf7uKk+e0cMhCw4qqux7o1um9M+aYBgK9lMZ/KP7FjPCV19XahhSoEqsn6tTp9HP6MZw74B3CqLu/Fx+fkprH/BtQlAFd45u1K3gxdOxD1Ts5XPyy4jNXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780064780; c=relaxed/simple;
	bh=KUxCyFLwxpiqUlho6ILAtO9rD6Sxu4LZsggc6KDtVws=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=WsFw7YFzaZfF58zQOeXBv8P62wc4cH7bErbdRzBBY1mTStn4Ajq+/EA70IkkrLk7BYui+wcjfc2Q4Hdb5QicOQ8OvsAmm3IVrkA+jQQGXOENHetzHiUw0DU0SeAOUVMZFmt289GosCpXqLtbu34bfUbcxm9AQPDHI2k37FBy8Xc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fcfEZPZA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PNJZY4uC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64TDKrP83845249
	for <linux-media@vger.kernel.org>; Fri, 29 May 2026 14:26:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=tyjO8bpcivel8QxC8pyFpK
	Ak55fczHbnOqXf4pxmoac=; b=fcfEZPZA0ZRrhuBDJ3KNZucqHDgUrsrzk59oIm
	sy/j9xooBnTPvKE7EzkYIky1J/hOccvR0XxzP13giWtL75urRtRye5dvLTK3VngJ
	ysTDDx3bB3PnGbwEZKFdeoOxAG0Ibjwhliu1UbACRwtDnfhix6vvtCxoIAqF1irQ
	MfSU5/e2Wo7b0FWxSlimtZeso+g9PBSsh/+bf4Fcrb0xPpLu8djJ5OynpmofSnho
	GVtYcpnzY00dd38Yb+q+Z885xbvz/nIwMFjJ/eR2+5RewiX27Y4cH4Clxx1CmpK4
	QEjgjGaKHMZczaw+/yENeFtd0auQc898/Fbkp6eqgTeiiU7Q==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eex6m3pue-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 29 May 2026 14:26:15 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-963aef8124fso71397241.1
        for <linux-media@vger.kernel.org>; Fri, 29 May 2026 07:26:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780064775; x=1780669575; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tyjO8bpcivel8QxC8pyFpKAk55fczHbnOqXf4pxmoac=;
        b=PNJZY4uCb8KLDyJr+5J/E3dnkKMybTQl/lGTXyiVdnDuNP8qUQ8b1xE69OcjH6ON4U
         gOkY1kRqRl5WLiuZ/fjIF5k9nggpIS6DOSDMCTvGvko4hgJ4oqZNfqnjMfVIpYYCDvdg
         4M/EfxFio4t94IXlxzNfLpSZlua1G0WaSkwOm/892KK4Rd+k2rh7uEYzuCtq1rkB6eE4
         Y+zqGcXF7g3nQGfQmTN1Hd83GRazczmoqURcWx+jfNPf34N/h9jgfKMPqMX7JafS4JMI
         kZZHKjpFRMtjayL+41gL2v+QyCuXHvmfnykqfnP4YninyPJ/l7EIb1WBF123JwqX1tGG
         5eaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780064775; x=1780669575;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tyjO8bpcivel8QxC8pyFpKAk55fczHbnOqXf4pxmoac=;
        b=odKo98p+6atxY1FmbG0b04NxndwZiqswSgNt3X9qjB/+ziImQ0CRgJbbAQpGa8qdfA
         ZZ75fhkZlCa1LOchksFhm4OZ2grp+y0OErXCWkjeZzd0YvK35tfCCUCP3aDajgsy+G1j
         kh+nXBwoiRmAZLkPWj5mOgPAVB2GEemWLiog5345QuxSnVcrRwchhlxhQzDC28rFx/hF
         icyddf+RJzwkk99mU0MSeQ01AaO1y8uN+HmUfKVyr5FWVF9t2p4EIOekmnacEMNw6f4r
         cD1tt5jw0hCj+5dMWomxIlDpngpiAYCc893bZUALZJHEve1ZoROCSjmeJpNlbYIAkBAN
         4gvQ==
X-Gm-Message-State: AOJu0YyGLEUPipchOg/z60Nq7U8/Vxutd2o8ICrPwcsXIhOUGnFfF5b7
	t8hHzmhlE07Ph7uGY1fYZlL/9dYVDcCwpWLSFqBsLkAMblJFvJJs7iMgEqf2DUc8MQsUzotLXjw
	hs+g1TP0m4qTg82o422Yj5ksxjSOxGC13Lhdih/MUK0ndFsB42lqFJWyX7bFotwhQIQ==
X-Gm-Gg: Acq92OHCyFUrJLOdAx0PXarjyNO5ZNQIfkWH6+MnjjXHvSmR8v1E2lMDZkvbDgvUe72
	tUx7IusT/VvAAUbPbGKJKw6ZUFsE3CKs/Ryd2i6wVQDc/jOQgViFIJar/ZS0Cw/9+L6O4ZPmrK5
	IZFq7qvHWPmz7G4lQtVvw508T8RuQPBOMv0vWefI90ZfewR2hIPR/97FVv2u4JNyPWX3FtRQCTC
	6cez/Es+xfBa9E32LZqoGhx5/vfBjzdkS8bVpwH0uqKGbPjLhxF5Bbi2DWll3GHwgTw5Da5bNlF
	oZ8WMa4ce+QCOzse45Jun7jTDvauF5NhJS2v4/ztBe68nWmb/s0Rqk6+7sAZzcs9U1/PRGRLqm7
	W39aXqL4N4mzsZyz4jwax8YBhBRw/MUU+8txVf14ev7OC7SPd5f9oRrCh8O425qddJJG1x9Akoc
	tvLJ1SQQqW6UNugvLnLt60+TQDrGA947m8y+bVnzwNUloAQA==
X-Received: by 2002:a05:6122:e183:b0:588:33d2:9249 with SMTP id 71dfb90a1353d-599f6abd415mr1171494e0c.8.1780064775192;
        Fri, 29 May 2026 07:26:15 -0700 (PDT)
X-Received: by 2002:a05:6122:e183:b0:588:33d2:9249 with SMTP id 71dfb90a1353d-599f6abd415mr1171428e0c.8.1780064774067;
        Fri, 29 May 2026 07:26:14 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa5fa14d3bsm21445e87.70.2026.05.29.07.26.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 07:26:12 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 29 May 2026 17:26:11 +0300
Subject: [PATCH v7] media: iris: drop struct iris_fmt
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260529-iris-remote-fmts-v7-1-a8bd57ac8b5a@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAAKiGWoC/33SS27DIBAG4KtYrEvKm5BV71F1Afa4QartBLCVK
 srdO3ak1gu7G6QfMR8jhjvJkCJkcqruJMEUcxx6DPalIvXZ959AY4OZCCYMk5zTmGKmCbqhAG2
 7kqmWUppahKPzjGDZJUEbbwv5/oH5HHMZ0vdyw8Tn3X+wiVNOG2BMKaVlMMe3IefDdfRf9dB1B
 1zIbE5i7cgNR6ADTeDcOhm4MzuOXDmSbTgSHS+MDw4c44zvOOrP0cxuOAodK1rvQPhWOLbj6JU
 jtvrRcz/Kca2sqZkVO45ZO27DMego72WLT+2DbDacx3OYCa4jfovynCgJPgOdD8Vyqha3h1t5n
 aAfM/3NWP34AWY7zuZcAgAA
X-Change-ID: 20260311-iris-remote-fmts-53336c2b89a0
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=17547;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=KUxCyFLwxpiqUlho6ILAtO9rD6Sxu4LZsggc6KDtVws=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqGaIE74WDGJaeyrJJjsmpTWeocfbig2BhAJu4t
 eXGtmyHfpmJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCahmiBAAKCRCLPIo+Aiko
 1fYaB/0fnXNr3u4LX+XCXq4mTwp5ta1T43o3/uAeli4QXNCorQbUGnJg2AArndWMPfjUZzZbxOl
 RMagABhV80JGSitDEM04H8I+p7EY9RUnkfED5QnUCq23mH2taZ3PWsc3W8M2ygWf4RYsHP0uhRc
 X/mEmZrCxwowXwrigdAS2Y8OZJPWE0q+fsurP91YzywQ34LkEIsATQvh7qp0L7lyPEx98mjP+/a
 X1fKTHZbTWRjeBBQ8Qlg6do7B0aip5sWVLB6AGZMIUC1RzXdAVyoqQ1ezxxJhv+Ysj7TvcKZqkG
 siZTm2w84qnudbCe0qPmyOFjYqkqhXuyYnQIql/TjPadavLf
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI5MDE0NCBTYWx0ZWRfX/tsSzztwssCU
 OGLf7OTPy7sGgs5p+xFP1A+bdQfHcv3zwzLT/ZsTsyyOLTNnkGjJfYjvcq9YN0zz75Gwq+tzgRx
 uOiYhf3r+abREAyi4mpVZF3UUMeC2HcCdgLlQ9V8xpMTRVhDFphVJG8wx0NhwztrlFLu9q563iN
 EU5DhENBVYDG+X04vc4Y669Ns5rRTW4HJbN5MUGGBx+6JSyHnxCIeJHDBG4wRRxBfDMC4QVrObJ
 UUnrxfYTZ2zrupe7n1Jh0b+PL7uuy62+C5dlBJoCqb9Z1A8To3iRLx6B3HZ4R3QvYWp71fZojKj
 ogZ2X/5Th1g2efDnVesan02NsDltPke/rxrC1qLYSoScRszRM5vSfvT1nPL08jubw2I1RzLjKI7
 qpTHKokqarnavExmoXxqE8gaC3bRq+qP+u5EHAiJKR+tfgjOUlBUcFpeTJSIAw5c4QC/kWbhT46
 hb+ZODZARcyS+ANlolw==
X-Authority-Analysis: v=2.4 cv=frnsol4f c=1 sm=1 tr=0 ts=6a19a207 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=GGcHrp4e3dvwrM2hqOMA:9 a=QEXdDO2ut3YA:10
 a=TD8TdBvy0hsOASGTdmB-:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-GUID: vx6kh4_T3c3AwH12JL19M-UX2yVqQOGW
X-Proofpoint-ORIG-GUID: vx6kh4_T3c3AwH12JL19M-UX2yVqQOGW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-29_04,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0 clxscore=1015
 malwarescore=0 impostorscore=0 phishscore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605290144
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.dev:email,qualcomm.com:email,qualcomm.com:dkim,msgid.link:url,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-63035-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 9E0A6603BAC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The struct iris_fmt unites pixfmt with the plane type, however the type
from the struct is not actually used. Drop the struct completely and use
u32 pixfmt in all the callsites.

Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Changes in v7:
- ... and fix the build failure
- Link to v6: https://patch.msgid.link/20260529-iris-remote-fmts-v6-1-4aa3f004ab3d@oss.qualcomm.com

Changes in v6:
- Another rebase, now on Bryan's -next tree, again
- Link to v5: https://patch.msgid.link/20260520-iris-remote-fmts-v5-1-a4915476c072@oss.qualcomm.com

Changes in v5:
- Rebased on linux-next tree, dropping the dependencies.
- Link to v4: https://patch.msgid.link/20260507-iris-remote-fmts-v4-1-72fa9e2af290@oss.qualcomm.com

Changes in v4:
- Rebased on top of Bryan's -next tree, fixing the conflicts.
- Link to v3: https://patch.msgid.link/20260330-iris-remote-fmts-v3-1-a26ab9e90101@oss.qualcomm.com

Changes in v3:
- Rebased on top of the 20260227-iris-platform-data-c5c80e84d1a7:v11
  (Dikshita)
- Link to v2: https://lore.kernel.org/r/20260313-iris-remote-fmts-v2-1-edb11793b196@oss.qualcomm.com

Changes in v2:
- Made platform_fmts_sm8250_dec const (Dikshita)
- Sorted entries in find_format_by_index (Dikshita)
- Link to v1: https://lore.kernel.org/r/20260311-iris-remote-fmts-v1-1-de0044453b68@oss.qualcomm.com

To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
To: Abhinav Kumar <abhinav.kumar@linux.dev>
To: Bryan O'Donoghue <bod@kernel.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
---
 drivers/media/platform/qcom/iris/iris_instance.h   |  5 --
 .../platform/qcom/iris/iris_platform_common.h      |  2 +-
 .../media/platform/qcom/iris/iris_platform_vpu2.c  | 17 +---
 .../media/platform/qcom/iris/iris_platform_vpu3x.c | 22 ++---
 drivers/media/platform/qcom/iris/iris_vdec.c       | 78 ++++++++----------
 drivers/media/platform/qcom/iris/iris_venc.c       | 96 +++++++++-------------
 6 files changed, 80 insertions(+), 140 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_instance.h b/drivers/media/platform/qcom/iris/iris_instance.h
index 1d8a22ea4809..c54d8ec8562a 100644
--- a/drivers/media/platform/qcom/iris/iris_instance.h
+++ b/drivers/media/platform/qcom/iris/iris_instance.h
@@ -29,11 +29,6 @@ enum iris_fmt_type_cap {
 	IRIS_FMT_QC08C,
 };
 
-struct iris_fmt {
-	u32 pixfmt;
-	u32 type;
-};
-
 /**
  * struct iris_inst - holds per video instance parameters
  *
diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index 982767faa51c..6d69a1e3dcd3 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -311,7 +311,7 @@ struct iris_platform_data {
 	const char * const *controller_rst_tbl;
 	unsigned int controller_rst_tbl_size;
 	u64 dma_mask;
-	struct iris_fmt *inst_iris_fmts;
+	const u32 *inst_iris_fmts;
 	u32 inst_iris_fmts_size;
 	struct platform_inst_caps *inst_caps;
 	const struct tz_cp_config *tz_cp_config_data;
diff --git a/drivers/media/platform/qcom/iris/iris_platform_vpu2.c b/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
index 41986af8313b..6e06a32822bb 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
@@ -28,19 +28,10 @@ static const struct iris_firmware_desc iris_vpu20_p4_gen1_desc = {
 	.fwname = "qcom/vpu/vpu20_p4.mbn",
 };
 
-static struct iris_fmt iris_fmts_vpu2_dec[] = {
-	[IRIS_FMT_H264] = {
-		.pixfmt = V4L2_PIX_FMT_H264,
-		.type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
-	},
-	[IRIS_FMT_HEVC] = {
-		.pixfmt = V4L2_PIX_FMT_HEVC,
-		.type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
-	},
-	[IRIS_FMT_VP9] = {
-		.pixfmt = V4L2_PIX_FMT_VP9,
-		.type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
-	},
+static const u32 iris_fmts_vpu2_dec[] = {
+	[IRIS_FMT_H264] = V4L2_PIX_FMT_H264,
+	[IRIS_FMT_HEVC] = V4L2_PIX_FMT_HEVC,
+	[IRIS_FMT_VP9] = V4L2_PIX_FMT_VP9,
 };
 
 static struct platform_inst_caps platform_inst_cap_vpu2 = {
diff --git a/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c b/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c
index 541ddc40e3ae..2c63adbc5579 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c
@@ -48,23 +48,11 @@ static const struct iris_firmware_desc iris_vpu35_p4_gen2_desc = {
 	.fwname = "qcom/vpu/vpu35_p4.mbn",
 };
 
-static struct iris_fmt iris_fmts_vpu3x_dec[] = {
-	[IRIS_FMT_H264] = {
-		.pixfmt = V4L2_PIX_FMT_H264,
-		.type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
-	},
-	[IRIS_FMT_HEVC] = {
-		.pixfmt = V4L2_PIX_FMT_HEVC,
-		.type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
-	},
-	[IRIS_FMT_VP9] = {
-		.pixfmt = V4L2_PIX_FMT_VP9,
-		.type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
-	},
-	[IRIS_FMT_AV1] = {
-		.pixfmt = V4L2_PIX_FMT_AV1,
-		.type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
-	},
+static const u32 iris_fmts_vpu3x_dec[] = {
+	[IRIS_FMT_H264] = V4L2_PIX_FMT_H264,
+	[IRIS_FMT_HEVC] = V4L2_PIX_FMT_HEVC,
+	[IRIS_FMT_VP9] = V4L2_PIX_FMT_VP9,
+	[IRIS_FMT_AV1] = V4L2_PIX_FMT_AV1,
 };
 
 static const struct icc_info iris_icc_info_vpu3x[] = {
diff --git a/drivers/media/platform/qcom/iris/iris_vdec.c b/drivers/media/platform/qcom/iris/iris_vdec.c
index dc7b051f2d01..b65832042dc8 100644
--- a/drivers/media/platform/qcom/iris/iris_vdec.c
+++ b/drivers/media/platform/qcom/iris/iris_vdec.c
@@ -68,23 +68,16 @@ void iris_vdec_inst_deinit(struct iris_inst *inst)
 	kfree(inst->fmt_src);
 }
 
-static const struct iris_fmt iris_vdec_formats_cap[] = {
-	[IRIS_FMT_NV12] = {
-		.pixfmt = V4L2_PIX_FMT_NV12,
-		.type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE,
-	},
-	[IRIS_FMT_QC08C] = {
-		.pixfmt = V4L2_PIX_FMT_QC08C,
-		.type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE,
-	},
+static const u32 iris_vdec_formats_cap[] = {
+	[IRIS_FMT_NV12] = V4L2_PIX_FMT_NV12,
+	[IRIS_FMT_QC08C] = V4L2_PIX_FMT_QC08C,
 };
 
-static const struct iris_fmt *
-find_format(struct iris_inst *inst, u32 pixfmt, u32 type)
+static bool check_format(struct iris_inst *inst, u32 pixfmt, u32 type)
 {
-	const struct iris_fmt *fmt = NULL;
-	unsigned int size = 0;
-	unsigned int i;
+	unsigned int size, i;
+	const u32 *fmt;
+
 	switch (type) {
 	case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
 		fmt = inst->core->iris_platform_data->inst_iris_fmts;
@@ -95,25 +88,21 @@ find_format(struct iris_inst *inst, u32 pixfmt, u32 type)
 		size = ARRAY_SIZE(iris_vdec_formats_cap);
 		break;
 	default:
-		return NULL;
+		return false;
 	}
 
 	for (i = 0; i < size; i++) {
-		if (fmt[i].pixfmt == pixfmt)
-			break;
+		if (fmt[i] == pixfmt)
+			return true;
 	}
 
-	if (i == size || fmt[i].type != type)
-		return NULL;
-
-	return &fmt[i];
+	return false;
 }
 
-static const struct iris_fmt *
-find_format_by_index(struct iris_inst *inst, u32 index, u32 type)
+static u32 find_format_by_index(struct iris_inst *inst, u32 index, u32 type)
 {
-	const struct iris_fmt *fmt = NULL;
-	unsigned int size = 0;
+	unsigned int size;
+	const u32 *fmt;
 
 	switch (type) {
 	case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
@@ -125,18 +114,18 @@ find_format_by_index(struct iris_inst *inst, u32 index, u32 type)
 		size = ARRAY_SIZE(iris_vdec_formats_cap);
 		break;
 	default:
-		return NULL;
+		return 0;
 	}
 
-	if (index >= size || fmt[index].type != type)
-		return NULL;
+	if (index >= size)
+		return 0;
 
-	return &fmt[index];
+	return fmt[index];
 }
 
 int iris_vdec_enum_fmt(struct iris_inst *inst, struct v4l2_fmtdesc *f)
 {
-	const struct iris_fmt *fmt;
+	u32 fmt;
 
 	switch (f->type) {
 	case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
@@ -144,14 +133,14 @@ int iris_vdec_enum_fmt(struct iris_inst *inst, struct v4l2_fmtdesc *f)
 		if (!fmt)
 			return -EINVAL;
 
-		f->pixelformat = fmt->pixfmt;
+		f->pixelformat = fmt;
 		f->flags = V4L2_FMT_FLAG_COMPRESSED | V4L2_FMT_FLAG_DYN_RESOLUTION;
 		break;
 	case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
 		fmt = find_format_by_index(inst, f->index, f->type);
 		if (!fmt)
 			return -EINVAL;
-		f->pixelformat = fmt->pixfmt;
+		f->pixelformat = fmt;
 		break;
 	default:
 		return -EINVAL;
@@ -164,15 +153,15 @@ int iris_vdec_try_fmt(struct iris_inst *inst, struct v4l2_format *f)
 {
 	struct v4l2_pix_format_mplane *pixmp = &f->fmt.pix_mp;
 	struct v4l2_m2m_ctx *m2m_ctx = inst->m2m_ctx;
-	const struct iris_fmt *fmt;
 	struct v4l2_format *f_inst;
 	struct vb2_queue *src_q;
+	bool supported;
 
 	memset(pixmp->reserved, 0, sizeof(pixmp->reserved));
-	fmt = find_format(inst, pixmp->pixelformat, f->type);
+	supported = check_format(inst, pixmp->pixelformat, f->type);
 	switch (f->type) {
 	case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
-		if (!fmt) {
+		if (!supported) {
 			f_inst = inst->fmt_src;
 			f->fmt.pix_mp.width = f_inst->fmt.pix_mp.width;
 			f->fmt.pix_mp.height = f_inst->fmt.pix_mp.height;
@@ -180,7 +169,7 @@ int iris_vdec_try_fmt(struct iris_inst *inst, struct v4l2_format *f)
 		}
 		break;
 	case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
-		if (!fmt) {
+		if (!supported) {
 			f_inst = inst->fmt_dst;
 			f->fmt.pix_mp.pixelformat = f_inst->fmt.pix_mp.pixelformat;
 			f->fmt.pix_mp.width = f_inst->fmt.pix_mp.width;
@@ -229,7 +218,7 @@ int iris_vdec_s_fmt(struct iris_inst *inst, struct v4l2_format *f)
 
 	switch (f->type) {
 	case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
-		if (!(find_format(inst, f->fmt.pix_mp.pixelformat, f->type)))
+		if (!check_format(inst, f->fmt.pix_mp.pixelformat, f->type))
 			return -EINVAL;
 
 		fmt = inst->fmt_src;
@@ -268,7 +257,7 @@ int iris_vdec_s_fmt(struct iris_inst *inst, struct v4l2_format *f)
 		inst->crop.height = f->fmt.pix_mp.height;
 		break;
 	case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
-		if (!(find_format(inst, f->fmt.pix_mp.pixelformat, f->type)))
+		if (!check_format(inst, f->fmt.pix_mp.pixelformat, f->type))
 			return -EINVAL;
 
 		fmt = inst->fmt_dst;
@@ -297,16 +286,13 @@ int iris_vdec_s_fmt(struct iris_inst *inst, struct v4l2_format *f)
 
 int iris_vdec_validate_format(struct iris_inst *inst, u32 pixelformat)
 {
-	const struct iris_fmt *fmt = NULL;
+	bool supported;
 
-	fmt = find_format(inst, pixelformat, V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
-	if (!fmt) {
-		fmt = find_format(inst, pixelformat, V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
-		if (!fmt)
-			return -EINVAL;
-	}
+	supported = check_format(inst, pixelformat, V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
+	if (!supported)
+		supported = check_format(inst, pixelformat, V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
 
-	return 0;
+	return supported ? 0 : -EINVAL;
 }
 
 int iris_vdec_subscribe_event(struct iris_inst *inst, const struct v4l2_event_subscription *sub)
diff --git a/drivers/media/platform/qcom/iris/iris_venc.c b/drivers/media/platform/qcom/iris/iris_venc.c
index aeed756ee9ca..2398992d0596 100644
--- a/drivers/media/platform/qcom/iris/iris_venc.c
+++ b/drivers/media/platform/qcom/iris/iris_venc.c
@@ -85,34 +85,21 @@ void iris_venc_inst_deinit(struct iris_inst *inst)
 	kfree(inst->fmt_src);
 }
 
-static const struct iris_fmt iris_venc_formats_cap[] = {
-	[IRIS_FMT_H264] = {
-		.pixfmt = V4L2_PIX_FMT_H264,
-		.type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE,
-	},
-	[IRIS_FMT_HEVC] = {
-		.pixfmt = V4L2_PIX_FMT_HEVC,
-		.type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE,
-	},
+static const u32 iris_venc_formats_cap[] = {
+	[IRIS_FMT_H264] = V4L2_PIX_FMT_H264,
+	[IRIS_FMT_HEVC] = V4L2_PIX_FMT_HEVC,
 };
 
-static const struct iris_fmt iris_venc_formats_out[] = {
-	[IRIS_FMT_NV12] = {
-		.pixfmt = V4L2_PIX_FMT_NV12,
-		.type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
-	},
-	[IRIS_FMT_QC08C] = {
-		.pixfmt = V4L2_PIX_FMT_QC08C,
-		.type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
-	},
+static const u32 iris_venc_formats_out[] = {
+	[IRIS_FMT_NV12] = V4L2_PIX_FMT_NV12,
+	[IRIS_FMT_QC08C] = V4L2_PIX_FMT_QC08C,
 };
 
-static const struct iris_fmt *
-find_format(struct iris_inst *inst, u32 pixfmt, u32 type)
+static bool check_format(struct iris_inst *inst, u32 pixfmt, u32 type)
 {
-	const struct iris_fmt *fmt = NULL;
-	unsigned int size = 0;
-	unsigned int i;
+	unsigned int size, i;
+	const u32 *fmt;
+
 	switch (type) {
 	case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
 		fmt = iris_venc_formats_out;
@@ -123,25 +110,21 @@ find_format(struct iris_inst *inst, u32 pixfmt, u32 type)
 		size = ARRAY_SIZE(iris_venc_formats_cap);
 		break;
 	default:
-		return NULL;
+		return false;
 	}
 
 	for (i = 0; i < size; i++) {
-		if (fmt[i].pixfmt == pixfmt)
-			break;
+		if (fmt[i] == pixfmt)
+			return true;
 	}
 
-	if (i == size || fmt[i].type != type)
-		return NULL;
-
-	return &fmt[i];
+	return false;
 }
 
-static const struct iris_fmt *
-find_format_by_index(struct iris_inst *inst, u32 index, u32 type)
+static u32 find_format_by_index(struct iris_inst *inst, u32 index, u32 type)
 {
-	const struct iris_fmt *fmt = NULL;
-	unsigned int size = 0;
+	unsigned int size;
+	const u32 *fmt;
 
 	switch (type) {
 	case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
@@ -153,18 +136,18 @@ find_format_by_index(struct iris_inst *inst, u32 index, u32 type)
 		size = ARRAY_SIZE(iris_venc_formats_cap);
 		break;
 	default:
-		return NULL;
+		return 0;
 	}
 
-	if (index >= size || fmt[index].type != type)
-		return NULL;
+	if (index >= size)
+		return 0;
 
-	return &fmt[index];
+	return fmt[index];
 }
 
 int iris_venc_enum_fmt(struct iris_inst *inst, struct v4l2_fmtdesc *f)
 {
-	const struct iris_fmt *fmt;
+	u32 fmt;
 
 	switch (f->type) {
 	case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
@@ -172,14 +155,14 @@ int iris_venc_enum_fmt(struct iris_inst *inst, struct v4l2_fmtdesc *f)
 		if (!fmt)
 			return -EINVAL;
 
-		f->pixelformat = fmt->pixfmt;
+		f->pixelformat = fmt;
 		break;
 	case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
 		fmt = find_format_by_index(inst, f->index, f->type);
 		if (!fmt)
 			return -EINVAL;
 
-		f->pixelformat = fmt->pixfmt;
+		f->pixelformat = fmt;
 		f->flags = V4L2_FMT_FLAG_COMPRESSED | V4L2_FMT_FLAG_ENC_CAP_FRAME_INTERVAL;
 		break;
 	default:
@@ -192,14 +175,14 @@ int iris_venc_enum_fmt(struct iris_inst *inst, struct v4l2_fmtdesc *f)
 int iris_venc_try_fmt(struct iris_inst *inst, struct v4l2_format *f)
 {
 	struct v4l2_pix_format_mplane *pixmp = &f->fmt.pix_mp;
-	const struct iris_fmt *fmt;
 	struct v4l2_format *f_inst;
+	bool supported;
 
 	memset(pixmp->reserved, 0, sizeof(pixmp->reserved));
-	fmt = find_format(inst, pixmp->pixelformat, f->type);
+	supported = check_format(inst, pixmp->pixelformat, f->type);
 	switch (f->type) {
 	case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
-		if (!fmt) {
+		if (!supported) {
 			f_inst = inst->fmt_src;
 			f->fmt.pix_mp.width = f_inst->fmt.pix_mp.width;
 			f->fmt.pix_mp.height = f_inst->fmt.pix_mp.height;
@@ -207,7 +190,7 @@ int iris_venc_try_fmt(struct iris_inst *inst, struct v4l2_format *f)
 		}
 		break;
 	case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
-		if (!fmt) {
+		if (!supported) {
 			f_inst = inst->fmt_dst;
 			f->fmt.pix_mp.width = f_inst->fmt.pix_mp.width;
 			f->fmt.pix_mp.height = f_inst->fmt.pix_mp.height;
@@ -228,17 +211,17 @@ int iris_venc_try_fmt(struct iris_inst *inst, struct v4l2_format *f)
 
 static int iris_venc_s_fmt_output(struct iris_inst *inst, struct v4l2_format *f)
 {
-	const struct iris_fmt *venc_fmt;
 	struct v4l2_format *fmt;
 	u32 codec_align;
+	bool supported;
 
 	iris_venc_try_fmt(inst, f);
 
-	venc_fmt = find_format(inst, f->fmt.pix_mp.pixelformat, f->type);
-	if (!venc_fmt)
+	supported = check_format(inst, f->fmt.pix_mp.pixelformat, f->type);
+	if (!supported)
 		return -EINVAL;
 
-	codec_align = venc_fmt->pixfmt == V4L2_PIX_FMT_HEVC ? 32 : 16;
+	codec_align = (f->fmt.pix_mp.pixelformat == V4L2_PIX_FMT_HEVC) ? 32 : 16;
 
 	fmt = inst->fmt_dst;
 	fmt->type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
@@ -281,7 +264,7 @@ static int iris_venc_s_fmt_input(struct iris_inst *inst, struct v4l2_format *f)
 
 	iris_venc_try_fmt(inst, f);
 
-	if (!(find_format(inst, f->fmt.pix_mp.pixelformat, f->type)))
+	if (!check_format(inst, f->fmt.pix_mp.pixelformat, f->type))
 		return -EINVAL;
 
 	fmt = inst->fmt_src;
@@ -350,16 +333,13 @@ int iris_venc_s_fmt(struct iris_inst *inst, struct v4l2_format *f)
 
 int iris_venc_validate_format(struct iris_inst *inst, u32 pixelformat)
 {
-	const struct iris_fmt *fmt = NULL;
+	bool supported;
 
-	fmt = find_format(inst, pixelformat, V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
-	if (!fmt) {
-		fmt = find_format(inst, pixelformat, V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
-		if (!fmt)
-			return -EINVAL;
-	}
+	supported = check_format(inst, pixelformat, V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
+	if (!supported)
+		supported = check_format(inst, pixelformat, V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
 
-	return 0;
+	return supported ? 0 : -EINVAL;
 }
 
 int iris_venc_subscribe_event(struct iris_inst *inst,

---
base-commit: c92057a181e8df8fd47426bb904c3253693cfced
change-id: 20260311-iris-remote-fmts-53336c2b89a0

Best regards,
--  
With best wishes
Dmitry


