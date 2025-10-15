Return-Path: <linux-media+bounces-44490-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AB57BDC312
	for <lists+linux-media@lfdr.de>; Wed, 15 Oct 2025 04:44:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C51E64244A6
	for <lists+linux-media@lfdr.de>; Wed, 15 Oct 2025 02:43:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7492D30C636;
	Wed, 15 Oct 2025 02:43:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Rqpar8CB"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24CE130C35C
	for <linux-media@vger.kernel.org>; Wed, 15 Oct 2025 02:43:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760496207; cv=none; b=JP0LXkzIt3U0xe/WB3sBZTRjDqLH50BegxP9hGyoH5J1bBrBUSHYEFzizFeeu5431MUtZf4Lc3u9Htn+8UpNzTJ8uO8TG1Zh1b2Ws+glhRL1K7EGbJkurElbmfe9AHr/ZS/DV6KheZWYtly11VlGJ64m4jAWiWnqjlwJZch9jqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760496207; c=relaxed/simple;
	bh=0rVwPwb2voVzOHTKavO0nQGcp9y2IoeMgD6s71JHxRk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=QVZO5aPhrWPnNefQIM8Jc+weRPIGDCpeRDE9IRJdbSFPweDMazqLTxOCDDUHyjftcM8Ti28otDN3O3rTfQZaC3icacUdKBuiHVsPFky7tVKpFRQurGWPZ8VTc+x8BE7DSIZfiUaLyhXgTOQhiNNnONev2k5XW3yeNj9l9bvA7RU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Rqpar8CB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59F2dOV7008677
	for <linux-media@vger.kernel.org>; Wed, 15 Oct 2025 02:43:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=a8Qod7OOqEkFq+EpdIzWVZ
	NCKD/5SirXFq15HIYfIa0=; b=Rqpar8CBotbS2mYoRyKRjxjSXXOw69dFCHbDYK
	1Ag6n+cdgcKt1M4cX9Qq9yOnqfbUPeZ68WbA0CYxk35Pscz4yO1oIBTr5KEnAJ0R
	h1TR7kXPs7gUvCqs797FUfzhVVO58f2CHZ7MOSbtOM0cqPOgNFdzpTmXY6XXPMlL
	Cxou2uR3zUiLDRRJtgBrL8et5zA6Gmz2IJeuAZozxvE/Q1AX8sgURcmQcfVqPEjp
	ZDKxFk4JeMSKUzhit7yywQuEJCIHpFdgodoNbwtSng+AvnAmh4KRKSbddNfiKfOv
	gOjpJoRQmCJOfj6bxJ2pUWS1p1AXrlYLIO8Tfvwmbv228y6Q==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49rw1af37s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 15 Oct 2025 02:43:25 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3304def7909so9926129a91.3
        for <linux-media@vger.kernel.org>; Tue, 14 Oct 2025 19:43:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760496204; x=1761101004;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a8Qod7OOqEkFq+EpdIzWVZNCKD/5SirXFq15HIYfIa0=;
        b=hyflFP9dSk79mrrieKOQEYvCna8i90zWi2c1V+yWVbqfIjXrS3KZT7H7DZ7CXg7/iI
         WNreoP8sBfdSWBo5uF1nyVIX6Xh6zS8dIqiPZdsARxqe69fGk27Dw0/O6M4cfvkQqFzA
         ju61v1Q4NFy7jQEM9wpoVTN3K/kAEgqQyZd0SYQTauSyUvFT7iScNsBEBkST0pYvjf61
         vJNb9H2hJIXbwmVzw0lF5gQghD52jEpnS+bajFAKLht5EHNLw5UWG34vXJjToaYP782y
         2Csb+sOU1E2BkXeF2YCgwrCXsNzGzqaInsa+FeV/fZz5UbOfHlQUf2xOXT5ZYPAwSmT7
         rhag==
X-Forwarded-Encrypted: i=1; AJvYcCVTcE3LSJpLAkQroePOgxF66iQkg6CyIvbGaZubr1k7irm/iu9cX7OmbMUtANDogkJ5f060xKROQ1lxyg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxdh+hX8iJuaLmEJ/nkL+HgXDOHT47vizBlLEVsYIIeeR9U0OEV
	ORvzyUPXK/+cTgTGIZJLDhU2kBkYsneh8j3Xx6ehLnWuyvVzTWiRirkxGpH0XwH1sOhFVDbYNkq
	b04as5GIFHS/YBJ6d1S/pgDjkv4LdkSwFpOwyL+OU3PhAs0BxzaVBB0iQ6tkrnxV27g==
X-Gm-Gg: ASbGncsxA+r93jla2+HayiozHlf38GvF08xjTZSAautiiuLfrwisl1t3Fa2Fd2q4bsH
	9ihOQc+/hVfdX8aVHOAiql5l0Id55wa+Cm6VIiKuVrLZbu26UPgyDhBE0d8V6xLYMprdZsn9FO/
	b6Uv99H61i3yHVpcgni+8+DvA9fC3uygWWZY/B6tpg+cUvf3fCwCZyCKchciKNWJ0HF/p3TbFyz
	ee1lfXM/7IqeicWPsBKIlmOsDPPn5KvwSOxyfUJxF6Dcw/WZoCGmaLfkRVV7rjP6C8cWyjr9eO0
	Z5qtpvVF28N/NcxhrmZxWk2MGdjRTvV3qz2yI9awZtrbkTec40ec7NZpL3MgC96ciDY7JhRoqYt
	uf/3CgftC3SNdRg87fAo=
X-Received: by 2002:a17:903:244c:b0:27e:dc53:d222 with SMTP id d9443c01a7336-290273713c8mr317468645ad.44.1760496204332;
        Tue, 14 Oct 2025 19:43:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE42hE6or4x2HxX7l7lKxe4Bot0TYcL2n/exI1bwf9/Tnqk7dDhc/fzZnCyrUZVLqkIz2RJDQ==
X-Received: by 2002:a17:903:244c:b0:27e:dc53:d222 with SMTP id d9443c01a7336-290273713c8mr317468295ad.44.1760496203842;
        Tue, 14 Oct 2025 19:43:23 -0700 (PDT)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29034f366c0sm179219505ad.94.2025.10.14.19.43.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 19:43:23 -0700 (PDT)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Tue, 14 Oct 2025 19:43:15 -0700
Subject: [PATCH] media: qcom: camss: Enable setting the rate to
 camnoc_rt_axi clock
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251014-add-new-clock-in-vfe-matching-list-v1-1-0d965ccc8a3a@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAEIK72gC/x3Nyw6CMBBG4Vchs/ZPaJV4eRXDok6nMBEH0xI0I
 by7jctvc85GRbJKoVuzUZZVi85W4Q4N8RhsEGisJt/6zrXOI8QIkw94mvkJNaxJ8AoLj2oDJi0
 LfJceTo7nC5+uVEPvLEm//8m93/cflrJxg3QAAAA=
X-Change-ID: 20251012-add-new-clock-in-vfe-matching-list-25fb1e378c49
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=K88v3iWI c=1 sm=1 tr=0 ts=68ef0a4d cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=F0hiWKNqIihWguCrtJ8A:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: L96jrzhE7wrLoOp8DQ_FFs3koS4VP_9o
X-Proofpoint-ORIG-GUID: L96jrzhE7wrLoOp8DQ_FFs3koS4VP_9o
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDEzMDAzNSBTYWx0ZWRfXwUuqfp8bi0Et
 K9OP22zJZCYs1IEVLXJZtu86Ev3P8coBt6IMFtmkQ4CgP0YYDH9mi1fUT1EKacE6irhvsV3F03Z
 DAedteh9397TFQMxGZRn/0WCLPU5kcAcM0hTpEATzijwsR+8B64RDnozVXA/VZa5u+M3h9GMbs/
 PMr214dteeeQtiJYJ1pSPOIaw/88dJbpM0PDcuunlc1e25y/pAq1eI4RpWysQnXn2RBCHaaPaEW
 deeygay195odHx6TP0SIvKTEwSnOCZESm+vei4hsiRYBuc8826u+QwETF/ION8ywdLtSK1aQT4+
 prGzb+affhr2JZdySJNwpD+cI1Y7JdbWTyF7Jr6+xf7ZHKDfdhX6qJT7YW5M7AYmb9sFpzONRZP
 4/9rGaa7PFZmPmw70m85gAcBjywgqw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-15_01,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 impostorscore=0 priorityscore=1501 phishscore=0
 adultscore=0 clxscore=1011 bulkscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510130035

On hardware architectures where a single CAMNOC module is split into
two, one for each of the real time (RT) and non real time (NRT) modules
within camera sub system, processing VFE output over the AXI bus
requires enabling and setting the appropriate clock rate for the RT
CAMNOC. This change lays the groundwork for supporting such
configurations.

Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
This change lays the groundwork for supporting configurations for
hardware architectures that split a single CAMNOC module into real time
(RT) and non real time (NRT).
---
 drivers/media/platform/qcom/camss/camss-vfe.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
index ee08dbbddf88..09b29ba383f1 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe.c
@@ -914,7 +914,8 @@ static int vfe_match_clock_names(struct vfe_device *vfe,
 	return (!strcmp(clock->name, vfe_name) ||
 		!strcmp(clock->name, vfe_lite_name) ||
 		!strcmp(clock->name, "vfe_lite") ||
-		!strcmp(clock->name, "camnoc_axi"));
+		!strcmp(clock->name, "camnoc_axi") ||
+		!strcmp(clock->name, "camnoc_rt_axi"));
 }
 
 /*

---
base-commit: 69a67cb382f428c6dd8ba63e44cd2c59cb84f736
change-id: 20251012-add-new-clock-in-vfe-matching-list-25fb1e378c49

Best regards,
-- 
Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>


