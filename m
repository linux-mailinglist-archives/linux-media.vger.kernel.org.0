Return-Path: <linux-media+bounces-51189-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oCJNBLWJcGkEYQAAu9opvQ
	(envelope-from <linux-media+bounces-51189-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 21 Jan 2026 09:09:25 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id E757D5342C
	for <lists+linux-media@lfdr.de>; Wed, 21 Jan 2026 09:09:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id C17104A9A66
	for <lists+linux-media@lfdr.de>; Wed, 21 Jan 2026 08:06:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E544E44D686;
	Wed, 21 Jan 2026 08:06:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="n5R1lNeC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AEsFkJEL"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24F8F345CC9
	for <linux-media@vger.kernel.org>; Wed, 21 Jan 2026 08:06:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768982799; cv=none; b=GsOdhSgDO4nUEC1+Jmf6ZchxxevVFDWn4cTiLUE6XFFdU3KiCQM8af1sQBXm0/xddfkiFZv2omZbliZ69s6065whtHyadQHUE0SbytYZTX6DAbFq1ZIXpMWZ0ZJKuoZvw970LGYZ9Af8j26PV2rdkmeUn5nJZiSQM7bZJAHOA9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768982799; c=relaxed/simple;
	bh=lkjsaVbZ9Xau9Vc2wJU0leLgN1tAzMLCkUhdf/v/C50=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=EE0LLGrK8ffLPUU/JS7en0kn8hFMlMqaA1cKe7jnMMx0UH7Db/3hJVu0ZJ5CJ91IlYo2O9cpVFM2du2i3PLUVvAZcL0lLTj8vFYJ9DrBzz5kTw2D8qDdQf+Ksi1fCmuz/zOFeXGLIRiRSQCzmQmZIc0xnzSq7u605RSikUv9T7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=n5R1lNeC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AEsFkJEL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60L5lUWc798784
	for <linux-media@vger.kernel.org>; Wed, 21 Jan 2026 08:06:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=9o+7CmyoHVlMscL0c68xjV
	9nqHYKcyKx5NNBDztVt14=; b=n5R1lNeCrfNXFl8J05yI08jdHcbfif19V5gMhs
	pCnRrNe2SmUoqYKlsldW6BLnICETQDGoMkSyj0De5a/Ibyl2XBH3dEgUUSwqENe4
	dGPL5WxH1EpgNaUuSEKHiUQGqVEU9Je7Kpb+LYywXImA52GtRve8P+tRruwaCuDz
	KXnFpw0x+LqJQ3pWgNtT0YsdwPpd+XZ9za2/mShPerDqwHzLP5Va33EyqYng/ceX
	vJzM5C8TQJ0si96tcpYPNUqAMVCTRarwPKu0OMP+m1HtvU3GBS6KHxwCqa2s9vyx
	FhnhknrtHYJ0cJIeqLxx4J3YFLvvZev9u5iqyIEZoe0Q/l5A==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bta6q3mff-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 21 Jan 2026 08:06:34 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c6a4c50fe5so419033585a.3
        for <linux-media@vger.kernel.org>; Wed, 21 Jan 2026 00:06:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768982793; x=1769587593; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9o+7CmyoHVlMscL0c68xjV9nqHYKcyKx5NNBDztVt14=;
        b=AEsFkJEL6iLlxCHRsQbapBFPG0cMa5Rfm5EIEcvlDaGe+KZgoYl1XUOYA4sx/gTEEB
         uRj6YOP/4nIanNV31dYYm251X5XMcZjNblkONi3NEHZWWC62tD7fcTlokLfpfJCTDTzL
         VhtHeUL7lImgoPAguoEK5yD8qJlo5BB7JmtlJBhxzU5ll6JB9Cw6N+l0wkv69onvA4v5
         ZlkNA+n5oS/gOH6QgJ+VJUy0i4JCP5M+IvSkjU+PbiRmxc+VSXaXfmFRZJWZZ4Mps54w
         +rEJltUGy5GmpjOgtvlPhDQ0/XX/j8xImtvJpif0/0j03NsnUfym2Mwxif+XVyFltHqJ
         JqPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768982793; x=1769587593;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9o+7CmyoHVlMscL0c68xjV9nqHYKcyKx5NNBDztVt14=;
        b=MbebGok+4BqhJJ1iTgJh+ScdWiepvvvGmDTDbc0l0jh/ExYIXbobnlkxA4ePlDcHk5
         ewlF4L/eWpVWRdDld8tpMF0vJp4gYcxne58RTClzCNClBOiiVIfYGX7HtXcO7peKEK7/
         Kdx6QOx/p/uKGA7CNlgKfvXdvbDT3hNs9MLpkwOEVqGbXQYYYDx2iPNU3/qUihn6P13r
         9rJTrwMJ5zN2uMtFbwnMC/MUcHiVjX55F2TSQgs5coZ+oFsBqP9Hc+OYhXCnyDXgwz0V
         moTBQyLVwh2DhSQnFmhFAd6T9yzg3AaIX89CjCozGih2L+daa9qt9TLawdUaAvjul+zh
         4Dzw==
X-Gm-Message-State: AOJu0Yz2y2fQC2QB/5ThWfQM1V9h4Xbwcisz0ghpJH9QnClRLu4EPuzn
	Daq2+LFdHd1HyRuPBjKTZoZuTBvpMSrK1X9+gOs9He80BC8kjPutu1Nz8NCFVB+tNmSYcVQCnD/
	79s9eDWybDcJaw3h/eaXYR2JUqvjwx5zX/9aDTNlSwKArLdB51MrQ3Oj8+FLEX6oMsA==
X-Gm-Gg: AZuq6aJnr2U7feaoYL9t3H8BVO22Ysp7qTI761l5QAksGG7wgB3BdQ84jyX4REVQW19
	V+OYUDXu1K/LU/k1g2XTyu36r/EU+ygaN1M7E81zAqOYQ2I4hcR5pewgbRthSoZdHsv37WGiUxN
	MEQZgIQBbr1W1clFpNi4e4fME0xjatWtzZqF4JSBgt6ZXJErrkjF8OkWctjjm1JJkCXwWSaE8+Y
	5H2vgmyaQamxmw9Gl/NvXa4UyC2liugb0PrhNZ4ibNGCtc/8ObEpEjjM+DGQRkB3BTwKq4yscRa
	LKvHvSnNRqvt216cj/szk0COO1WT0Zg+oYUx+X3S+iRDseyWh1CG1Y7FnuXLUu25fdR8RLVGL6y
	3PSbzENpvs8UniusFWJrHFJlT+Ytefvbpwr03O2jk9Vf4pxMr4luMvBcvD/ZwkqblpjsSLVLcX4
	Yg
X-Received: by 2002:a05:620a:2996:b0:8b3:aa:f61d with SMTP id af79cd13be357-8c6a6944d95mr2178158285a.49.1768982793531;
        Wed, 21 Jan 2026 00:06:33 -0800 (PST)
X-Received: by 2002:a05:620a:2996:b0:8b3:aa:f61d with SMTP id af79cd13be357-8c6a6944d95mr2178156785a.49.1768982793170;
        Wed, 21 Jan 2026 00:06:33 -0800 (PST)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c6a71c14a9sm1203363485a.22.2026.01.21.00.06.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jan 2026 00:06:32 -0800 (PST)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Subject: [PATCH v4 0/2] media: i2c: imx412: power on timing adjust
Date: Wed, 21 Jan 2026 16:06:26 +0800
Message-Id: <20260121-imx412-v4-0-f6bdf83f116b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAKJcGkC/22Oyw7CIBBFf6VhLYQBQsWV/2Fc9EFbkgIKFmua/
 ru0MdGFm0nOzb0ns6Cog9ERnYoFBZ1MNN5lEIcCNUPleo1NmxkxyiQFUNjYWQDDrSyB1qpreSN
 RLt+C7sy8iy7XzIOJDx9euzfBln4UVFEhFHDCOVAM+Kmd1a4no5nOPkZyn6qx8daSfNBmSvxn/
 X0gcUzxsRZSMVV1Zcn/rNd1fQPMl0+D4QAAAA==
X-Change-ID: 20260119-imx412-d6710b9fd3c6
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768982789; l=1486;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=lkjsaVbZ9Xau9Vc2wJU0leLgN1tAzMLCkUhdf/v/C50=;
 b=DTib7VjGG2J+v65H5VbwYjRAG+EAr/ABmnq5YJqHFMI2iM9a4Xbf1N4g2uyqCOpoUNcIQjQ9O
 Xd1TuZhLmBeBu8kib3UGWfpKHo4vU9SLLOjdFrnhokOyU5+IvlqEuqY
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Authority-Analysis: v=2.4 cv=QohTHFyd c=1 sm=1 tr=0 ts=6970890a cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=Rz3T_L-m2ZCUWiLNYVcA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIxMDA2NyBTYWx0ZWRfX5ZOsfYMuTtQ3
 iCZK5YifRkMPQkxnR/Rv9nY2dYyuEsjXIe/4hr5VmcOHljtiWGbsQBqpZ4jrr0kvF1NyT9eQY6K
 fEsB4Sky9lRHwP3YDnK1L4GlqZbzxQNzcLVpRgnm7T1Ke/jDNXsILZh+YRDihI1pq1lPyWH9+Xw
 HikNe9wGY/kxUWQKNw6KUY0zV3W38khDG6eW44WpD0pYSODTkwV3UUm0LAnXR5YDxbNWcHX4DZn
 rgt9+jc4eI3zcXk57aXKYyrDS3kuU7q3h71DLFYTqLDoV3gc+vCjFMIIMtSMKSaQC8G5YQj723W
 P7SzH0PqlakiSccrmEcoUsab7P/cGjxA0NmP4G4ls9YrHbnvb/rnu5cuqzpQ5iFgcHSL9LrDraa
 AGQ3bRunEJSppYK2Mn07V1CpOy+nNR/xZOpwDIgFhBqtiVQtamv89jfNpUQczvk/J+6bqVlqDwD
 MW0s6Im6yLOVgFR9q+A==
X-Proofpoint-GUID: bMxB63lOe967BJgSBm6AZf1Ve5CN4vMz
X-Proofpoint-ORIG-GUID: bMxB63lOe967BJgSBm6AZf1Ve5CN4vMz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-21_01,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 priorityscore=1501 adultscore=0 clxscore=1015
 impostorscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601210067
X-Spamd-Result: default: False [-1.96 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_POLICY_ALLOW(0.00)[qualcomm.com,reject];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-51189-lists,linux-media=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,ams.mirrors.kernel.org:rdns,ams.mirrors.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:7979, ipnet:2a01:60a::/32, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wenmeng.liu@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	TAGGED_RCPT(0.00)[linux-media];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: E757D5342C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This series of patches mainly addresses two issues:
1. Fix potential timing issues that may occur during the first and second power on.
If the reset GPIO happens to default to the deasserted state at the very
first power-up, the previous sequence could let the sensor run before
supplies/clock are fully stable, while subsequent power cycles would
differ because the driver explicitly toggles reset. This results in
inconsistent power on sequences between the first and later power on.

2. The Arducam IMX577 sensor requires a longer reset time.

Changes in v4:
- Add assert reset in probe. -- Sakari
- Link to v3: https://lore.kernel.org/r/20260119-imx412-v3-0-8b46929af773@oss.qualcomm.com
Changes in v3:
- Fix power on timing. -- Bryan.
- Add reset delay time for Arducam Imx577.
- Link to v2: https://lore.kernel.org/all/20260109044913.3310-1-wenmeng.liu@oss.qualcomm.com/

Changes in v2:
- Move the 7.4–8 ms delay before mode-register programming to satisfy T7 (NVM read).
- Link to v1: https://lore.kernel.org/all/20251222-imx412-v1-1-51c7e724b376@oss.qualcomm.com/

---
Wenmeng Liu (2):
      media: i2c: imx412: fix sensor power-on timing
      media: i2c: imx412: Extend the power-on waiting time

 drivers/media/i2c/imx412.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)
---
base-commit: 053966c344dbd346e71305f530e91ea77916189f
change-id: 20260119-imx412-d6710b9fd3c6

Best regards,
-- 
Wenmeng <wenmeng.liu@oss.qualcomm.com>


