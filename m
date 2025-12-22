Return-Path: <linux-media+bounces-49317-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E05B9CD53B8
	for <lists+linux-media@lfdr.de>; Mon, 22 Dec 2025 10:05:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9853E300F318
	for <lists+linux-media@lfdr.de>; Mon, 22 Dec 2025 09:04:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E87A2309EF4;
	Mon, 22 Dec 2025 09:04:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nDsUmtt1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OiKHODyw"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEE632874FE
	for <linux-media@vger.kernel.org>; Mon, 22 Dec 2025 09:04:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766394256; cv=none; b=lwwnSMshNemPM3RbfmD0Lm/SSQ7S0+x3IJI3cUAJz2yw84R6kndlCnkxzx0zpvIxV46/NF0+1xDX/cv6DzTvDQQCUQh5oPf9AgcbWNynaYM8yLiBV3bG/dT4U61vvVb2kuRe6dQfRqRCYpgV4tze6sBjZguyVdnw6Yiyx5eKAqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766394256; c=relaxed/simple;
	bh=QIsyotOwx6FMWkkuvBlOqv6tHs6ZRip7t8QMBUa2gLc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=ucmfCN1Z3zv5qkhYYPirYja4ZbBVPhx0YVLujT+bA0X5HyYhASALACNOvcw4gk9ARt6RX+xtfmU2HXZbnn0+qflsGBuOrLpN+SeYaPAeXiLWZamvAqv65kEM7lzrur9mS/OCowqWxqY4e+3tFZEJeKTB40hFlOatTZZIG4gfmWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nDsUmtt1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OiKHODyw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BM7Xf8o4015153
	for <linux-media@vger.kernel.org>; Mon, 22 Dec 2025 09:04:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=CEl4440EE678AUOOYPOCId
	/+8AQDcvET7YQjj7NLHe0=; b=nDsUmtt1VDG5ckYK0arkVc4lqGX6bpzTGsJZD/
	PIQfg2rVTqHkmhnDBKPdYddqsTtGHxG8KdSa4s6FnWQSc7IhvEq0W9fgqr04KFYA
	2t9/fuItbYnf3YWPv9HXwkbi6nF06CZgn9G2I3gcXR92pt9/SqtEuE3ixO7qNSok
	TlYOqx2defp0PehCMxLfyQaJwQOwnqTtsFzZH9sgSpAl9vPuJOsJMVHiEkDM40IK
	feOjLmgbYQwXpHCEePE2UuVf/g2sGzJxaNz+KwLtq6+A/29F3z4mOz6P/5n6Bkgh
	U5yR33J+bUKMLOnciurQlcmnO2MguuOSHp2OvPTna27jJsYg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b5mvfmcx9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 22 Dec 2025 09:04:13 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-88a360b8086so90633526d6.3
        for <linux-media@vger.kernel.org>; Mon, 22 Dec 2025 01:04:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766394253; x=1766999053; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CEl4440EE678AUOOYPOCId/+8AQDcvET7YQjj7NLHe0=;
        b=OiKHODywt45x5umlTKX9s6ChlHfnHaAtTlv9MlNdvj/N60mEwB0gesHtDx/TjjXpDW
         9eaIuai4kqhhPms3UdWLtXjhcWEXnYFEysz16I7A1TOSUlKfviOpB/jRRF0EFXADt7YA
         7MBc19zlkXuM3uk4iPdcfkEwUIhriVmUzIA9lCuPV/Xe7eCPeysuV6r05AF4tjDFIxtR
         iole+vtIVUZYWq6z7q0k542wy3kkO5x2WKH22doOXS4x5Xc42XsIf/BZBL/xjxXX6KAE
         YpBVr0zlESKmSIrehBPpDSyaMBdOCQD9+TwA/fEKBtQLnXBlXv3DlSWEcKPU0qLX4EVl
         kJSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766394253; x=1766999053;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CEl4440EE678AUOOYPOCId/+8AQDcvET7YQjj7NLHe0=;
        b=SxIZtG5KW+PKEfndM0rze/rlPLhhXDn9Mmy/a6HdOHJmkICNiJnQ+E5byZPDzoDwQw
         qrxMB75mjTuvYeVB5DAvobYMi9dYT43PBOFIKIlFXWMNdOU0Cn3Mm7Xt7xWgPh5GTbDV
         cvVVFWxC6HFQZHruDA2YUhQR6RIt6V+OkBEkp/xvsEu0q3v/gv1eMvgor7fhVkIa8VOD
         aB1tu4ehTNlTeMLFrR5GYAY+rThD+NQePE1zAfW+j3tWbQEtDs2S8UynMTx1MUKUe08L
         mGRvPSHDrcCjb+7JArxQ6CjUUETGZixd1+Hh85/n3X3IHGoo++a/aRMwcQwWSqm8Qryy
         6Arg==
X-Gm-Message-State: AOJu0YyII1TvfW6fAUQ9SCIxj0k1xTfsbkZKAIFLMrGBhiKc22TL8z+/
	/E4jPOb+Qx77ae810muOqTYt0GlMS1yN4m/y8Hu+U445B885kB6bOYP0I/JsGZnUKMbDNBdbgYW
	xA0pJyKU33CnSE5Yv8vk5l3obFLG477EqMLNS6r3xlG3MahPNPHhZ+apr9FvHHhQO4w==
X-Gm-Gg: AY/fxX7OTgWKpADyoHueZS/k42s5hlS/Qd1GWcATLJ+Zr58sBg5a1IPsPky4Ezhi1ua
	AK4wfMNzcCLeIE2J7B+t5QQvoHoolVJhXkcSDgTbt29+Za4xLcvLpDPmhYMPg433GYy1gWoKlXi
	rZh2c3K/2FDIvNZZt4mCrleyoVCKF4XsFya4gM6hKjN92upfzCD9XwZGzztZT24jFF0vx/nLsaI
	ZT+eBtSAfhJfvzGV94mBEMI4PF0TX4M8xo+LwfHAng4EAh7hjFW5+nxQdeFRbSB8fBxg63qj2UI
	2H8L4Q34jcf/MfMB5ZTg22PF/g5QB/+shNUYblHXT4m9pwaWwp8NXzz0n9uC7i8hihq1P3XTehS
	DIzqLurg180DgSyVTCDdwqTUFMJruhybpJvgkMi0DHEzAcnwFv+3Psn2pjvfGrSKYz0mY1LFrrG
	R3
X-Received: by 2002:a05:6214:5707:b0:888:80be:5104 with SMTP id 6a1803df08f44-88d819558cfmr162602116d6.16.1766394252829;
        Mon, 22 Dec 2025 01:04:12 -0800 (PST)
X-Google-Smtp-Source: AGHT+IETErzq/Wraf9NqpB6XgvGnXwgy2jbcsK221dSIkugWDSbjw6ltxi3qREOKyD9zCUb/iHw3HQ==
X-Received: by 2002:a05:6214:5707:b0:888:80be:5104 with SMTP id 6a1803df08f44-88d819558cfmr162601656d6.16.1766394252262;
        Mon, 22 Dec 2025 01:04:12 -0800 (PST)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-88d9a741365sm77299786d6.53.2025.12.22.01.04.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 01:04:11 -0800 (PST)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Date: Mon, 22 Dec 2025 17:04:07 +0800
Subject: [PATCH] media: i2c: imx412: Extend the power-on waiting time
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251222-imx412-v1-1-51c7e724b376@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAIYJSWkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1NDIyMj3czcChNDI13DJAOj1GSLpBSjJFMloOKCotS0zAqwQdGxtbUA8ze
 LCFgAAAA=
X-Change-ID: 20251222-imx412-1b02ec8bd2b5
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wenmeng Liu <quic_wenmliu@quicinc.com>,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>,
        Wenmeng <wenmeng.liu@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766394249; l=971;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=6bbHavJ9fVApiUS3A1Or41Ppk7ASp/dqsODWewWy/F0=;
 b=R+SXz7zLbK+poh+ApKYy4ywXIv+l4nTDfvfpVeBhOy/RMCxn1k6q767LTzgmP9Cp0mVwTxWEH
 NZgj/VeQiHjCzcwVdpSFNj1sPBUjm4/6nnALfVXuHLk3Hn6udcT+nbz
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Authority-Analysis: v=2.4 cv=H8rWAuYi c=1 sm=1 tr=0 ts=6949098d cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=fwpc4IpM0P9R8YQ-nboA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: de8QbkLxTUvb9pfYQ7c0lqW3qBUK1o7C
X-Proofpoint-GUID: de8QbkLxTUvb9pfYQ7c0lqW3qBUK1o7C
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIyMDA4MSBTYWx0ZWRfX4Y1fTMTPuPs+
 CsDkWT0ikWMvLCaIureLnVTSWMPdMp0NPx6DbBexLS2q8Aq5kAykKx9V7+3CPUSkY2CtZfbUPdg
 dKLa/aASh6Tv1RZmK/1W4/E0DpdTpeSAU2qOhb91bmqziEAF5t1JSYq6IIxcqzU2/4RcMp8ll4/
 /XQLg2veX9Aphhr/wo0yJ40VkodCajwGNyvbYcQMfjUVg150+Hd05D/9wVhHp9nOvipXKs56KLU
 JuNLWomwCy1ia5ApsSwE53y9n/eWjJj03sGxUPBkm65sAVxRKMRLhGKLFEPEW7r8Cdf9v64PxKD
 hObXhrXd5jnDNvkj9mweCtmMX6pL4vKS9mp/XQDxUC6SFcPnIOSYdXytdm2A2Q5dhQFiI2/6bBk
 rBRHKUVLDW+QawcjkR/IIEZM9GNdviMfTd8hMo4VqszmGzGRim6vR2kHVWk2K4ra5RK4uEVvtrC
 zaj9ihVTuQ9IT3Ytd7w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-21_05,2025-12-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 bulkscore=0 spamscore=0 adultscore=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512220081

From: Wenmeng Liu <quic_wenmliu@quicinc.com>

The Arducam IMX577 module requires a longer reset time than the 1000µs
configured in the current driver. Increase the wait time after power-on
to ensure proper initialization.

Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
---
Signed-off-by: Wenmeng <wenmeng.liu@oss.qualcomm.com>
---
 drivers/media/i2c/imx412.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/imx412.c b/drivers/media/i2c/imx412.c
index b3826f80354703b17b416dc233854da3f5736e38..e444c48c11b171b421c535beb23211bf0b600d3a 100644
--- a/drivers/media/i2c/imx412.c
+++ b/drivers/media/i2c/imx412.c
@@ -1037,7 +1037,7 @@ static int imx412_power_on(struct device *dev)
 		goto error_reset;
 	}
 
-	usleep_range(1000, 1200);
+	usleep_range(10000, 12000);
 
 	return 0;
 

---
base-commit: cc3aa43b44bdb43dfbac0fcb51c56594a11338a8
change-id: 20251222-imx412-1b02ec8bd2b5

Best regards,
-- 
Wenmeng <wenmeng.liu@oss.qualcomm.com>


