Return-Path: <linux-media+bounces-65169-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 94HHIXTLM2qfGQYAu9opvQ
	(envelope-from <linux-media+bounces-65169-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 18 Jun 2026 12:41:56 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id ECCAB69F708
	for <lists+linux-media@lfdr.de>; Thu, 18 Jun 2026 12:41:55 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Ae27zTxH;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=POCzRdQI;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65169-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-65169-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E130E3023A63
	for <lists+linux-media@lfdr.de>; Thu, 18 Jun 2026 10:38:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 949343EDAD6;
	Thu, 18 Jun 2026 10:38:39 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0664938B14C
	for <linux-media@vger.kernel.org>; Thu, 18 Jun 2026 10:38:36 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781779119; cv=none; b=ie0xWVsTF5e0MEy0hSxi1no4+wboxnFl5F9wtZ1UVzk8mN6KIcyUTyHsJTZqfKfCJCxZNPSV8rzxMMH9DhW2NZsZwC2uLm4lc4S7XVm/nQK//vsqTHcx6WeHAjIgKsnn/F0XpCZft+mS8eY1O7XoPYsGglDDVcFlOV63hnGvesU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781779119; c=relaxed/simple;
	bh=jZcdLDcMBoMeHK6L8znskOO1tIf3S3qK3gB7HLiGLpg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uoDusYOPVJgLfn6hMH6yqbr0ZyhqFqIYop4kq4U/i5a5lOIXgvzi234kzDDihd7YCQIQoPI3UbUFK/Ybrz3pFwVpPxbfogGwj4nsXCLuz5/syOooJ6Hd2J4PnPdjxKIax92EQDSCCIsFJECpmwUAmjLJbzIuMwBA1qA81l0iGX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ae27zTxH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=POCzRdQI; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65I8FTsk975865
	for <linux-media@vger.kernel.org>; Thu, 18 Jun 2026 10:38:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oRNPmGYuOxXN7TsbkC6VYDgH6aGE+K415bY/88ffHDQ=; b=Ae27zTxHkZbKxGO5
	svrEVJD96/5TkkeNikVix6j/o6D6Dh5q097ta9a7YfBFrhxLI37qBa0Ty72QOGaQ
	DKbBXIsP1tsUoQ1s/0+GQh9OZ2Y3dVfXBSDKjWiy24dYLNhO7jsCQN6A8noCS1FO
	RKDs41CieDCdAsLA1SCTQuJFhekZ/gpCeg1TmgO5L9QDu5dN3kUHqAKnl8ZjkH1T
	JUqGM5Whe4DAVfclzcyOTm90AtDeMMD2mtDCfYQlBxv8ZV7EB8Ol7FvvLjkDKsKm
	MH3kGI7ZMbhuIhLQukfcNajj3jdvVf35zDm9UHcmxR9SSs+wAWmgjwEVTjlLEQOQ
	PNTO4g==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ev1wc2sr3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 18 Jun 2026 10:38:35 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-9181f3cc5ecso392872285a.1
        for <linux-media@vger.kernel.org>; Thu, 18 Jun 2026 03:38:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781779115; x=1782383915; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oRNPmGYuOxXN7TsbkC6VYDgH6aGE+K415bY/88ffHDQ=;
        b=POCzRdQISz8HSbkULdYgzNyG0aCmrcDhXDgYZWoHDyrjpGJ/0fV1RlL5EUnOEgGZai
         4Lw/ApHERMztJJu3rMHh8PxoosVKMLwoFPbnV34uyg/Qd3eu8fmBAjSY9hAKvMKgDkpk
         wBPlsxPqd5RDAz/sKTzt3yUzZ4nISDxDtCc8YmolwcCb5rgNz2+8n3xjFUi4EPHMQGzu
         EAVyhNPni/cLMADA5MI9FpbhAYn0yBJfdCP0XcoTpEsANhiXZxoTalPjQnfuYhBKHXN7
         aDPbOUA0qcNMbCC8m0pwYa6QR89n6o2MgD/6IHB5mSBsqOPMx2GAsSZt/Ayftq+14Hx+
         Ay9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781779115; x=1782383915;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=oRNPmGYuOxXN7TsbkC6VYDgH6aGE+K415bY/88ffHDQ=;
        b=nw2Npe3X6kV8GHDszEe214bvtM1RxWguOdtKyWrDhbG3vQR6NL/rY1l/dneDDBPrPe
         S9M7F7iiafbkeISlxNwtFYfRsJE7xbit9mlfhcPgtGG/dTkBfaGVSJRlKCKSshMvq1ar
         tu1/5YKDNiT1BSn9/Aj5QpGzPtU7P2WdUB+XMkezKD2PpCq9pt3y9AYZSlCp3m2iWudF
         LsGPy69VbzxGqn1G7EQ3xFvJX5BaEyXcxwcVGDoIl59zz+7HVvcNgK6mj+vRrh4PTQ3c
         FUGjQoCj4iF2WgC85EbrypLXUGXFvDA+Iy0AT6PXteXhPLBU/wsLXlal/dt0vAyh2r+C
         CmNg==
X-Gm-Message-State: AOJu0YxGxOBnPhmoQdDEnsgDTWFRuesqtohW6YVNYIxf1kzzbs72vjea
	HN0Bx9jr3dAwPKdrJgNODqSCP/I0mNeLS4lHmCH+00Gwv+OYyn9mf2rjI1UhHE/K1+DVqVetrzS
	OAFINgjsGMC4CuJC65ijrnoIEverdV1JaJE7sH4OLSTUjlmY5pZde+7tHaeUOEFQmWA==
X-Gm-Gg: AfdE7ckezxVZZ1hzbMLywT2Lb0PBW0ahBnRffJtkjZN4popS12aVQaUqSfL42EQN3h9
	Hf3P/rrVFQvQTMHYx+QQoddMErCwNzmxBc9VV7whTJJ7zcQdb/V0xe4yzpCS3qT8Tl3SONj9AL7
	M/XLPkyD8eQxVAMkAmm1RogW2E5EzQ0c5l/W1u69rJT2etjKGpoNMjeyu1qetOg3fBY2JJrjtvD
	bQOowVlP4JkwIeMBTiL6sTdanVD7q0ln6MxFBYVUwWnlKLh5pJAvloVRfL+bYcN3FZCpLGT00vD
	1Wb06pq48atHWSzvdfSrx2nQyRnWUgoMsCLg1xmhN8zkB/cNJprEGKOakVzLNLBdmOArQLUgC/c
	235OgO2XSKEoBQt0nZKEd0J8VJvZQNYg+kslJ/g5Q4hb0Tp7AF2SISLs6QjtvJa6VFHHTdtF5tc
	tpJs0=
X-Received: by 2002:a05:620a:691a:b0:91a:e8a9:5541 with SMTP id af79cd13be357-91f0a73d445mr438950585a.31.1781779114381;
        Thu, 18 Jun 2026 03:38:34 -0700 (PDT)
X-Received: by 2002:a05:620a:691a:b0:91a:e8a9:5541 with SMTP id af79cd13be357-91f0a73d445mr438945785a.31.1781779113657;
        Thu, 18 Jun 2026 03:38:33 -0700 (PDT)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9161a04b472sm2029316185a.37.2026.06.18.03.38.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 03:38:33 -0700 (PDT)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Date: Thu, 18 Jun 2026 18:37:44 +0800
Subject: [PATCH 2/2] media: i2c: og0va1b: Add OmniVision OG0VA1B camera
 sensor
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260618-og0va1b-v1-2-dda71bb83009@oss.qualcomm.com>
References: <20260618-og0va1b-v1-0-dda71bb83009@oss.qualcomm.com>
In-Reply-To: <20260618-og0va1b-v1-0-dda71bb83009@oss.qualcomm.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781779102; l=26983;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=jZcdLDcMBoMeHK6L8znskOO1tIf3S3qK3gB7HLiGLpg=;
 b=H+VwauRNDrA6FOTdtJlVzbxZk6/IXnOUccCnN7/QR2Y2XuPnu2kFGy5UmmS+7w8M4Y+M2D55K
 kuBb4CEk6sMDLNqiQiZD0HMVI5XfPK/Ah8kbTh+gYperWlRTJIbx4xj
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Authority-Analysis: v=2.4 cv=TMt1jVla c=1 sm=1 tr=0 ts=6a33caab cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=wZ-Bjplu5xHaSf7HBuoA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: a5j7zVLVZd2_XI4EFmxaQjlZRSe4Vtii
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE4MDA5OSBTYWx0ZWRfX66LyL4yW3FKd
 O6nAiMIUhsz5eKqpRkZG3vWbDyFYn4JwjF738ndEDV1Uv9P+3W6jqNrYpe2/F3xqvnqsyuyp/7p
 +0N9oUbtY7bUVsaUTi5yFUU3rpAu6fc=
X-Proofpoint-ORIG-GUID: a5j7zVLVZd2_XI4EFmxaQjlZRSe4Vtii
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE4MDA5OSBTYWx0ZWRfX81LyIYEV2Qf4
 APcpywdPRCdbEOGuMNzj3vf99osFkPAZA929Bi9f+T5F/9fnuS+euBvye5i0D6RuX9BHCAr5d6y
 sXmZbvJc1PJD81wXKCZexv6Tjr1MmfQjjHTdh02HVpY5XLQ5duV8J3dgSmPtaKsgqr4nxVoLJxz
 +NwKnrh0P7At+qHdPBT1X5cYEuWHGRS8Xy7gH/awv0PLQKKufk2V+8YSFDaduBaIThZJlAT83r2
 izH1Xz9kTz6/qy/+VqeULoPgtIyY65ECp8yRslzG+t/pkjtJ61azu1nBkVuIVPFRmlB7BK+ek7Z
 5rvLxNdlMJqjAo87v1q80MhTquWeA52CrArh49kGniAqQ4NwZkv8GC0q7diwxvkAIuwfnkZOBQT
 sIGoPmGgum4cXryytbKiCXd8CNCQmpFQBXKR6TFSOJEYe0d9ZVXXJtXTk4MiQMejl/+k8x1OEsl
 nom2qALrTzwtETY2kcQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-18_01,2026-06-17_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 adultscore=0 impostorscore=0 priorityscore=1501
 suspectscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606180099
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-65169-lists,linux-media=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email];
	FORGED_RECIPIENTS(0.00)[m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:sakari.ailus@linux.intel.com,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:wenmeng.liu@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[wenmeng.liu@oss.qualcomm.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wenmeng.liu@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: ECCAB69F708

Add V4L2 sub device driver for OmniVision OG0VA1B image sensor.
OmniVision OG0VA1B is an image sensor, which produces frames in 10-bit
raw output format (Y10) over a 1-lane MIPI CSI-2 interface and supports
the 640x480 (VGA) resolution.

Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
---
 MAINTAINERS                 |   1 +
 drivers/media/i2c/Kconfig   |  10 +
 drivers/media/i2c/Makefile  |   1 +
 drivers/media/i2c/og0va1b.c | 867 ++++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 879 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 5aa846c8479b20651291d5bd2e316308310f826c..85a06eb9eacc410a565b80d56979eaa565515d0e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19891,6 +19891,7 @@ M:	Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/media/i2c/ovti,og0va1b.yaml
+F:	drivers/media/i2c/og0va1b.c
 
 OMNIVISION OG0VE1B SENSOR DRIVER
 M:	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
index 5d173e0ecf424f2f204f8d426be818e44357f8e4..56680772f5f47b4629c4e17f5a5feba08b1d94fc 100644
--- a/drivers/media/i2c/Kconfig
+++ b/drivers/media/i2c/Kconfig
@@ -363,6 +363,16 @@ config VIDEO_OG01A1B
 	  To compile this driver as a module, choose M here: the
 	  module will be called og01a1b.
 
+config VIDEO_OG0VA1B
+	tristate "OmniVision OG0VA1B sensor support"
+	select V4L2_CCI_I2C
+	help
+	  This is a Video4Linux2 sensor driver for the OmniVision
+	  OG0VA1B camera.
+
+	  To compile this driver as a module, choose M here: the
+	  module will be called og0va1b.
+
 config VIDEO_OG0VE1B
 	tristate "OmniVision OG0VE1B sensor support"
 	select V4L2_CCI_I2C
diff --git a/drivers/media/i2c/Makefile b/drivers/media/i2c/Makefile
index e45359efe0e41e13e3c0869e5ead7d6cf4aca3a7..c60851c7fe07e3bdc511c5f482525ba7a044f48e 100644
--- a/drivers/media/i2c/Makefile
+++ b/drivers/media/i2c/Makefile
@@ -83,6 +83,7 @@ obj-$(CONFIG_VIDEO_MT9V011) += mt9v011.o
 obj-$(CONFIG_VIDEO_MT9V032) += mt9v032.o
 obj-$(CONFIG_VIDEO_MT9V111) += mt9v111.o
 obj-$(CONFIG_VIDEO_OG01A1B) += og01a1b.o
+obj-$(CONFIG_VIDEO_OG0VA1B) += og0va1b.o
 obj-$(CONFIG_VIDEO_OG0VE1B) += og0ve1b.o
 obj-$(CONFIG_VIDEO_OS05B10) += os05b10.o
 obj-$(CONFIG_VIDEO_OV01A10) += ov01a10.o
diff --git a/drivers/media/i2c/og0va1b.c b/drivers/media/i2c/og0va1b.c
new file mode 100644
index 0000000000000000000000000000000000000000..f0505b7ba7f329ad57ffafa8f90a24204f002d3c
--- /dev/null
+++ b/drivers/media/i2c/og0va1b.c
@@ -0,0 +1,867 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * OmniVision OG0VA1B Camera Sensor Driver
+ *
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries
+ */
+
+#include <linux/clk.h>
+#include <linux/delay.h>
+#include <linux/gpio/consumer.h>
+#include <linux/i2c.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/pm_runtime.h>
+#include <linux/regulator/consumer.h>
+
+#include <media/v4l2-cci.h>
+#include <media/v4l2-ctrls.h>
+#include <media/v4l2-device.h>
+#include <media/v4l2-fwnode.h>
+#include <media/v4l2-subdev.h>
+
+#define OG0VA1B_REG_CHIP_ID		CCI_REG16(0x300a)
+#define OG0VA1B_CHIP_ID			0xC756
+
+#define OG0VA1B_REG_SW_RESET		CCI_REG8(0x103)
+#define OG0VA1B_SW_RESET		BIT(0)
+
+#define OG0VA1B_REG_STREAMING		CCI_REG8(0x100)
+#define OG0VA1B_STREAMING_ON		BIT(0)
+
+/* Exposure: 16-bit coarse integration time at 0x3501/0x3502 */
+#define OG0VA1B_REG_EXPOSURE		CCI_REG16(0x3501)
+#define OG0VA1B_EXPOSURE_MIN		1
+#define OG0VA1B_EXPOSURE_STEP		1
+#define OG0VA1B_EXPOSURE_DEFAULT	0x100
+
+#define OG0VA1B_REG_GAIN_H		CCI_REG8(0x3508)
+#define OG0VA1B_REG_GAIN_L		CCI_REG8(0x3509)
+#define OG0VA1B_GAIN_MIN		0x10
+#define OG0VA1B_GAIN_MAX		0x1ff
+#define OG0VA1B_GAIN_STEP		1
+#define OG0VA1B_GAIN_DEFAULT		0x10
+
+#define OG0VA1B_REG_VTS			CCI_REG16(0x380e)
+
+/* Test pattern: register 0x5100, BIT(7) = enable, BIT[3:2] = bar style */
+#define OG0VA1B_REG_TEST_PATTERN	CCI_REG8(0x5100)
+#define OG0VA1B_TEST_PATTERN_EN		BIT(7)
+#define OG0VA1B_TEST_PATTERN_BAR_SHIFT	2
+
+#define OG0VA1B_EXPOSURE_MARGIN		14
+#define OG0VA1B_VBLANK_MIN		OG0VA1B_EXPOSURE_MARGIN
+
+#define OG0VA1B_XVCLK_RATE		19200000UL
+
+#define OG0VA1B_AUTOSUSPEND_DELAY_MS	1000
+
+static const s64 og0va1b_link_freqs[] = {
+	480000000,
+};
+
+#define OG0VA1B_PIXEL_RATE		48000000UL
+#define OG0VA1B_LINK_FREQ_INDEX		0
+
+#define OG0VA1B_DATA_LANES		1
+
+static const char * const og0va1b_supply_names[] = {
+	"avdd",		/* VANA */
+	"dovdd",	/* VIO  */
+	"dvdd",		/* VDIG */
+};
+
+#define OG0VA1B_NUM_SUPPLIES		ARRAY_SIZE(og0va1b_supply_names)
+
+struct og0va1b_mode {
+	u32 width;
+	u32 height;
+	u32 hts;
+	u32 vts;
+	u32 num_regs;
+	const struct cci_reg_sequence *regs;
+};
+
+/* VGA 640x480 @ 60 fps */
+static const struct cci_reg_sequence og0va1b_vga_60fps_regs[] = {
+	{ CCI_REG8(0x0302), 0x31 },
+	{ CCI_REG8(0x0303), 0x02 },
+	{ CCI_REG8(0x0304), 0x01 },
+	{ CCI_REG8(0x0305), 0x90 },
+	{ CCI_REG8(0x0306), 0x00 },
+	{ CCI_REG8(0x0323), 0x02 },
+	{ CCI_REG8(0x0325), 0x68 },
+	{ CCI_REG8(0x0326), 0xd8 },
+	{ CCI_REG8(0x3006), 0x0e },
+	{ CCI_REG8(0x300d), 0x08 },
+	{ CCI_REG8(0x3018), 0xf0 },
+	{ CCI_REG8(0x301c), 0xf0 },
+	{ CCI_REG8(0x3020), 0x20 },
+	{ CCI_REG8(0x3022), 0x01 },
+	{ CCI_REG8(0x3040), 0x0f },
+	{ CCI_REG8(0x3107), 0x40 },
+	{ CCI_REG8(0x3216), 0x01 },
+	{ CCI_REG8(0x3217), 0x00 },
+	{ CCI_REG8(0x3218), 0xc0 },
+	{ CCI_REG8(0x3219), 0x55 },
+	{ CCI_REG8(0x3500), 0x00 },
+	{ CCI_REG8(0x3501), 0x00 },
+	{ CCI_REG8(0x3502), 0x01 },
+	{ CCI_REG8(0x3506), 0x01 },
+	{ CCI_REG8(0x3507), 0x50 },
+	{ CCI_REG8(0x3508), 0x01 },
+	{ CCI_REG8(0x3509), 0x00 },
+	{ CCI_REG8(0x350a), 0x01 },
+	{ CCI_REG8(0x350b), 0x00 },
+	{ CCI_REG8(0x350c), 0x00 },
+	{ CCI_REG8(0x3541), 0x00 },
+	{ CCI_REG8(0x3542), 0x40 },
+	{ CCI_REG8(0x3605), 0x90 },
+	{ CCI_REG8(0x3606), 0x41 },
+	{ CCI_REG8(0x3612), 0x00 },
+	{ CCI_REG8(0x3620), 0x08 },
+	{ CCI_REG8(0x3630), 0x17 },
+	{ CCI_REG8(0x3631), 0x99 },
+	{ CCI_REG8(0x3639), 0x88 },
+	{ CCI_REG8(0x3668), 0x00 },
+	{ CCI_REG8(0x3674), 0x00 },
+	{ CCI_REG8(0x3677), 0x3f },
+	{ CCI_REG8(0x368f), 0x06 },
+	{ CCI_REG8(0x36a2), 0x19 },
+	{ CCI_REG8(0x36a4), 0xf1 },
+	{ CCI_REG8(0x36a5), 0x2d },
+	{ CCI_REG8(0x3706), 0x30 },
+	{ CCI_REG8(0x370d), 0x72 },
+	{ CCI_REG8(0x3713), 0x86 },
+	{ CCI_REG8(0x3715), 0x03 },
+	{ CCI_REG8(0x3716), 0x00 },
+	{ CCI_REG8(0x376d), 0x24 },
+	{ CCI_REG8(0x3770), 0x3a },
+	{ CCI_REG8(0x3778), 0x00 },
+	{ CCI_REG8(0x37a8), 0x03 },
+	{ CCI_REG8(0x37a9), 0x00 },
+	{ CCI_REG8(0x37df), 0x7d },
+	{ CCI_REG8(0x3800), 0x00 },
+	{ CCI_REG8(0x3801), 0x00 },
+	{ CCI_REG8(0x3802), 0x00 },
+	{ CCI_REG8(0x3803), 0x00 },
+	{ CCI_REG8(0x3804), 0x02 },
+	{ CCI_REG8(0x3805), 0x8f },
+	{ CCI_REG8(0x3806), 0x01 },
+	{ CCI_REG8(0x3807), 0xef },
+	{ CCI_REG8(0x3808), 0x02 },
+	{ CCI_REG8(0x3809), 0x80 },
+	{ CCI_REG8(0x380a), 0x01 },
+	{ CCI_REG8(0x380b), 0xe0 },
+	{ CCI_REG8(0x380c), 0x01 },
+	{ CCI_REG8(0x380d), 0x78 },
+	{ CCI_REG8(0x380e), 0x08 },
+	{ CCI_REG8(0x380f), 0x30 },
+	{ CCI_REG8(0x3810), 0x00 },
+	{ CCI_REG8(0x3811), 0x08 },
+	{ CCI_REG8(0x3812), 0x00 },
+	{ CCI_REG8(0x3813), 0x08 },
+	{ CCI_REG8(0x3814), 0x11 },
+	{ CCI_REG8(0x3815), 0x11 },
+	{ CCI_REG8(0x3816), 0x00 },
+	{ CCI_REG8(0x3817), 0x01 },
+	{ CCI_REG8(0x3818), 0x00 },
+	{ CCI_REG8(0x3819), 0x05 },
+	{ CCI_REG8(0x3820), 0x40 },
+	{ CCI_REG8(0x3821), 0x04 },
+	{ CCI_REG8(0x3823), 0x00 },
+	{ CCI_REG8(0x3826), 0x00 },
+	{ CCI_REG8(0x3827), 0x00 },
+	{ CCI_REG8(0x382b), 0x52 },
+	{ CCI_REG8(0x384a), 0xa2 },
+	{ CCI_REG8(0x3858), 0x00 },
+	{ CCI_REG8(0x3859), 0x00 },
+	{ CCI_REG8(0x3860), 0x00 },
+	{ CCI_REG8(0x3861), 0x00 },
+	{ CCI_REG8(0x3866), 0x0c },
+	{ CCI_REG8(0x3867), 0x07 },
+	{ CCI_REG8(0x3884), 0x00 },
+	{ CCI_REG8(0x3885), 0x08 },
+	{ CCI_REG8(0x3888), 0x50 },
+	{ CCI_REG8(0x3893), 0x6c },
+	{ CCI_REG8(0x3898), 0x00 },
+	{ CCI_REG8(0x389a), 0x04 },
+	{ CCI_REG8(0x389b), 0x01 },
+	{ CCI_REG8(0x389c), 0x0b },
+	{ CCI_REG8(0x389d), 0xdc },
+	{ CCI_REG8(0x389f), 0x08 },
+	{ CCI_REG8(0x38a0), 0x00 },
+	{ CCI_REG8(0x38a1), 0x00 },
+	{ CCI_REG8(0x38b1), 0x04 },
+	{ CCI_REG8(0x38b2), 0x00 },
+	{ CCI_REG8(0x38b3), 0x08 },
+	{ CCI_REG8(0x38c1), 0x46 },
+	{ CCI_REG8(0x38c9), 0x02 },
+	{ CCI_REG8(0x38d4), 0x06 },
+	{ CCI_REG8(0x38d5), 0x5a },
+	{ CCI_REG8(0x38d6), 0x08 },
+	{ CCI_REG8(0x38d7), 0x3a },
+	{ CCI_REG8(0x391e), 0x01 },
+	{ CCI_REG8(0x391f), 0x00 },
+	{ CCI_REG8(0x3920), 0xaa },
+	{ CCI_REG8(0x3921), 0x00 },
+	{ CCI_REG8(0x3922), 0x00 },
+	{ CCI_REG8(0x3923), 0x00 },
+	{ CCI_REG8(0x3924), 0x00 },
+	{ CCI_REG8(0x3925), 0x00 },
+	{ CCI_REG8(0x3926), 0x00 },
+	{ CCI_REG8(0x3927), 0x00 },
+	{ CCI_REG8(0x3928), 0x10 },
+	{ CCI_REG8(0x3929), 0x01 },
+	{ CCI_REG8(0x392a), 0xb4 },
+	{ CCI_REG8(0x392b), 0x00 },
+	{ CCI_REG8(0x392c), 0x10 },
+	{ CCI_REG8(0x392d), 0x01 },
+	{ CCI_REG8(0x392e), 0x78 },
+	{ CCI_REG8(0x392f), 0x4a },
+	{ CCI_REG8(0x3a06), 0x06 },
+	{ CCI_REG8(0x3a07), 0x78 },
+	{ CCI_REG8(0x3a08), 0x08 },
+	{ CCI_REG8(0x3a09), 0x80 },
+	{ CCI_REG8(0x3a52), 0x00 },
+	{ CCI_REG8(0x3a53), 0x01 },
+	{ CCI_REG8(0x3a54), 0x0c },
+	{ CCI_REG8(0x3a55), 0x04 },
+	{ CCI_REG8(0x3a58), 0x0c },
+	{ CCI_REG8(0x3a59), 0x04 },
+	{ CCI_REG8(0x4000), 0xcf },
+	{ CCI_REG8(0x4003), 0x40 },
+	{ CCI_REG8(0x4008), 0x04 },
+	{ CCI_REG8(0x4009), 0x13 },
+	{ CCI_REG8(0x400a), 0x02 },
+	{ CCI_REG8(0x400b), 0x34 },
+	{ CCI_REG8(0x4010), 0x71 },
+	{ CCI_REG8(0x4042), 0xc3 },
+	{ CCI_REG8(0x4306), 0x04 },
+	{ CCI_REG8(0x4307), 0x12 },
+	{ CCI_REG8(0x4500), 0x70 },
+	{ CCI_REG8(0x4509), 0x00 },
+	{ CCI_REG8(0x450b), 0x83 },
+	{ CCI_REG8(0x4604), 0x68 },
+	{ CCI_REG8(0x4f00), 0x04 },
+	{ CCI_REG8(0x4f10), 0x04 },
+	{ CCI_REG8(0x4f21), 0x01 },
+	{ CCI_REG8(0x4f22), 0x00 },
+	{ CCI_REG8(0x4f23), 0x54 },
+	{ CCI_REG8(0x4f24), 0x51 },
+	{ CCI_REG8(0x4f25), 0x41 },
+	{ CCI_REG8(0x5000), 0x3f },
+	{ CCI_REG8(0x5001), 0x80 },
+	{ CCI_REG8(0x500a), 0x00 },
+	{ CCI_REG8(0x5100), 0x00 },
+	{ CCI_REG8(0x5111), 0x20 },
+	{ CCI_REG8(0x481b), 0x44 },
+	{ CCI_REG8(0x481f), 0x30 },
+	{ CCI_REG8(0x4823), 0x44 },
+	{ CCI_REG8(0x4825), 0x35 },
+	{ CCI_REG8(0x4837), 0x11 },
+};
+
+static const struct og0va1b_mode og0va1b_modes[] = {
+	{
+		.width = 640,
+		.height = 480,
+		.hts = 376,
+		.vts = 2096,
+		.num_regs = ARRAY_SIZE(og0va1b_vga_60fps_regs),
+		.regs = og0va1b_vga_60fps_regs,
+	},
+};
+
+struct og0va1b {
+	struct v4l2_subdev sd;
+	struct media_pad pad;
+	struct regmap *regmap;
+	struct clk *inclk;
+	struct gpio_desc *reset_gpio;
+	struct regulator_bulk_data supplies[OG0VA1B_NUM_SUPPLIES];
+
+	struct v4l2_ctrl_handler ctrl_handler;
+	struct v4l2_ctrl *link_freq;
+	struct v4l2_ctrl *pixel_rate;
+	struct v4l2_ctrl *vblank;
+	struct v4l2_ctrl *hblank;
+	struct v4l2_ctrl *exposure;
+	struct v4l2_ctrl *gain;
+	struct v4l2_ctrl *test_pattern;
+};
+
+static inline struct og0va1b *sd_to_og0va1b(struct v4l2_subdev *sd)
+{
+	return container_of(sd, struct og0va1b, sd);
+}
+
+static int og0va1b_power_on(struct device *dev)
+{
+	struct v4l2_subdev *sd = dev_get_drvdata(dev);
+	struct og0va1b *og0va1b = sd_to_og0va1b(sd);
+	int ret;
+
+	ret = regulator_bulk_enable(OG0VA1B_NUM_SUPPLIES, og0va1b->supplies);
+	if (ret) {
+		dev_err(dev, "failed to enable regulators: %d\n", ret);
+		return ret;
+	}
+
+	ret = clk_prepare_enable(og0va1b->inclk);
+	if (ret) {
+		dev_err(dev, "failed to enable clock: %d\n", ret);
+		goto err_regulators;
+	}
+
+	gpiod_set_value_cansleep(og0va1b->reset_gpio, 0);
+
+	usleep_range(18000, 20000);
+
+	return 0;
+
+err_regulators:
+	regulator_bulk_disable(OG0VA1B_NUM_SUPPLIES, og0va1b->supplies);
+	return ret;
+}
+
+static int og0va1b_power_off(struct device *dev)
+{
+	struct v4l2_subdev *sd = dev_get_drvdata(dev);
+	struct og0va1b *og0va1b = sd_to_og0va1b(sd);
+
+	clk_disable_unprepare(og0va1b->inclk);
+	gpiod_set_value_cansleep(og0va1b->reset_gpio, 1);
+	regulator_bulk_disable(OG0VA1B_NUM_SUPPLIES, og0va1b->supplies);
+
+	return 0;
+}
+
+static int og0va1b_check_id(struct og0va1b *og0va1b)
+{
+	struct device *dev = og0va1b->sd.dev;
+	u64 chip_id;
+	int ret;
+
+	ret = cci_read(og0va1b->regmap, OG0VA1B_REG_CHIP_ID, &chip_id, NULL);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to read chip ID\n");
+
+	if (chip_id != OG0VA1B_CHIP_ID)
+		return dev_err_probe(dev, -ENODEV,
+				     "unexpected chip ID 0x%04llx (expected 0x%04x)\n",
+				     chip_id, OG0VA1B_CHIP_ID);
+
+	return 0;
+}
+
+static int og0va1b_check_hwcfg(struct device *dev)
+{
+	struct fwnode_handle *fwnode = dev_fwnode(dev);
+	struct v4l2_fwnode_endpoint bus_cfg = {
+		.bus_type = V4L2_MBUS_CSI2_DPHY,
+	};
+	struct fwnode_handle *ep;
+	unsigned int i;
+	int ret;
+
+	if (!fwnode)
+		return -ENXIO;
+
+	ep = fwnode_graph_get_next_endpoint(fwnode, NULL);
+	if (!ep)
+		return dev_err_probe(dev, -ENXIO, "no endpoint found\n");
+
+	ret = v4l2_fwnode_endpoint_alloc_parse(ep, &bus_cfg);
+	fwnode_handle_put(ep);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to parse endpoint\n");
+
+	if (bus_cfg.bus.mipi_csi2.num_data_lanes != OG0VA1B_DATA_LANES) {
+		ret = dev_err_probe(dev, -EINVAL,
+				    "unsupported number of CSI2 data lanes %u\n",
+				    bus_cfg.bus.mipi_csi2.num_data_lanes);
+		goto err_free;
+	}
+
+	if (!bus_cfg.nr_of_link_frequencies) {
+		ret = dev_err_probe(dev, -EINVAL,
+				    "no link frequencies defined\n");
+		goto err_free;
+	}
+
+	for (i = 0; i < bus_cfg.nr_of_link_frequencies; i++)
+		if (bus_cfg.link_frequencies[i] ==
+		    og0va1b_link_freqs[OG0VA1B_LINK_FREQ_INDEX])
+			break;
+
+	if (i == bus_cfg.nr_of_link_frequencies)
+		ret = dev_err_probe(dev, -EINVAL,
+				    "no supported link frequency %lld found\n",
+				    og0va1b_link_freqs[OG0VA1B_LINK_FREQ_INDEX]);
+
+err_free:
+	v4l2_fwnode_endpoint_free(&bus_cfg);
+
+	return ret;
+}
+
+static int og0va1b_init(struct og0va1b *og0va1b,
+			const struct og0va1b_mode *mode)
+{
+	int ret;
+
+	ret = cci_write(og0va1b->regmap, OG0VA1B_REG_SW_RESET,
+			OG0VA1B_SW_RESET, NULL);
+	if (ret)
+		return ret;
+
+	usleep_range(5000, 6000);
+
+	return cci_multi_reg_write(og0va1b->regmap, mode->regs, mode->num_regs,
+				   NULL);
+}
+
+static int og0va1b_s_ctrl(struct v4l2_ctrl *ctrl)
+{
+	struct og0va1b *og0va1b =
+		container_of(ctrl->handler, struct og0va1b, ctrl_handler);
+	const struct og0va1b_mode *mode = &og0va1b_modes[0];
+	int ret = 0;
+
+	if (ctrl->id == V4L2_CID_VBLANK) {
+		int exp_max = mode->height + ctrl->val - OG0VA1B_EXPOSURE_MARGIN;
+
+		ret = __v4l2_ctrl_modify_range(og0va1b->exposure,
+					       og0va1b->exposure->minimum,
+					       exp_max,
+					       og0va1b->exposure->step,
+					       min(og0va1b->exposure->val, exp_max));
+		if (ret)
+			return ret;
+	}
+
+	if (!pm_runtime_get_if_active(og0va1b->sd.dev))
+		return 0;
+
+	switch (ctrl->id) {
+	case V4L2_CID_EXPOSURE:
+		ret = cci_write(og0va1b->regmap, OG0VA1B_REG_EXPOSURE,
+				ctrl->val, NULL);
+		break;
+
+	case V4L2_CID_ANALOGUE_GAIN:
+		ret = cci_write(og0va1b->regmap, OG0VA1B_REG_GAIN_H,
+				(ctrl->val >> 4) & 0x1f, NULL);
+		if (!ret)
+			ret = cci_write(og0va1b->regmap, OG0VA1B_REG_GAIN_L,
+					(ctrl->val & 0xf) << 4, NULL);
+		break;
+
+	case V4L2_CID_VBLANK:
+		ret = cci_write(og0va1b->regmap, OG0VA1B_REG_VTS,
+				mode->height + ctrl->val, NULL);
+		break;
+
+	case V4L2_CID_TEST_PATTERN:
+		if (ctrl->val)
+			ret = cci_write(og0va1b->regmap,
+					OG0VA1B_REG_TEST_PATTERN,
+					(ctrl->val - 1) << OG0VA1B_TEST_PATTERN_BAR_SHIFT |
+					OG0VA1B_TEST_PATTERN_EN, NULL);
+		else
+			ret = cci_write(og0va1b->regmap,
+					OG0VA1B_REG_TEST_PATTERN, 0, NULL);
+		break;
+
+	default:
+		ret = -EINVAL;
+		break;
+	}
+
+	pm_runtime_put_autosuspend(og0va1b->sd.dev);
+	return ret;
+}
+
+static const struct v4l2_ctrl_ops og0va1b_ctrl_ops = {
+	.s_ctrl = og0va1b_s_ctrl,
+};
+
+static const char * const og0va1b_test_pattern_menu[] = {
+	"Disabled",
+	"Standard Color Bar",
+	"Top-Bottom Darker Color Bar",
+	"Right-Left Darker Color Bar",
+	"Bottom-Top Darker Color Bar",
+};
+
+static void og0va1b_fill_format(const struct og0va1b_mode *mode,
+				struct v4l2_mbus_framefmt *fmt)
+{
+	fmt->width = mode->width;
+	fmt->height = mode->height;
+	fmt->code = MEDIA_BUS_FMT_Y10_1X10;
+	fmt->field = V4L2_FIELD_NONE;
+	fmt->colorspace = V4L2_COLORSPACE_RAW;
+	fmt->ycbcr_enc = V4L2_YCBCR_ENC_DEFAULT;
+	fmt->quantization = V4L2_QUANTIZATION_DEFAULT;
+	fmt->xfer_func = V4L2_XFER_FUNC_NONE;
+}
+
+static int og0va1b_enum_mbus_code(struct v4l2_subdev *sd,
+				  struct v4l2_subdev_state *state,
+				  struct v4l2_subdev_mbus_code_enum *code)
+{
+	if (code->index != 0)
+		return -EINVAL;
+
+	code->code = MEDIA_BUS_FMT_Y10_1X10;
+	return 0;
+}
+
+static int og0va1b_enum_frame_size(struct v4l2_subdev *sd,
+				   struct v4l2_subdev_state *state,
+				   struct v4l2_subdev_frame_size_enum *fse)
+{
+	if (fse->code != MEDIA_BUS_FMT_Y10_1X10 ||
+	    fse->index >= ARRAY_SIZE(og0va1b_modes))
+		return -EINVAL;
+
+	fse->min_width  = og0va1b_modes[fse->index].width;
+	fse->max_width  = og0va1b_modes[fse->index].width;
+	fse->min_height = og0va1b_modes[fse->index].height;
+	fse->max_height = og0va1b_modes[fse->index].height;
+	return 0;
+}
+
+static int og0va1b_set_fmt(struct v4l2_subdev *sd,
+			   struct v4l2_subdev_state *state,
+			   struct v4l2_subdev_format *fmt)
+{
+	const struct og0va1b_mode *mode;
+	struct v4l2_mbus_framefmt *format;
+
+	mode = v4l2_find_nearest_size(og0va1b_modes,
+				      ARRAY_SIZE(og0va1b_modes),
+				      width, height,
+				      fmt->format.width, fmt->format.height);
+
+	og0va1b_fill_format(mode, &fmt->format);
+
+	format = v4l2_subdev_state_get_format(state, 0);
+	*format = fmt->format;
+
+	return 0;
+}
+
+static int og0va1b_init_state(struct v4l2_subdev *sd,
+			      struct v4l2_subdev_state *state)
+{
+	struct v4l2_mbus_framefmt *fmt =
+		v4l2_subdev_state_get_format(state, 0);
+
+	og0va1b_fill_format(&og0va1b_modes[0], fmt);
+	return 0;
+}
+
+static int og0va1b_enable_streams(struct v4l2_subdev *sd,
+				  struct v4l2_subdev_state *state,
+				  u32 pad, u64 streams_mask)
+{
+	struct og0va1b *og0va1b = sd_to_og0va1b(sd);
+	const struct og0va1b_mode *mode = &og0va1b_modes[0];
+	int ret;
+
+	ret = pm_runtime_resume_and_get(og0va1b->sd.dev);
+	if (ret < 0)
+		return ret;
+
+	ret = og0va1b_init(og0va1b, mode);
+	if (ret)
+		goto err_pm;
+
+	ret = __v4l2_ctrl_handler_setup(&og0va1b->ctrl_handler);
+	if (ret)
+		goto err_pm;
+
+	ret = cci_write(og0va1b->regmap, OG0VA1B_REG_STREAMING,
+			OG0VA1B_STREAMING_ON, NULL);
+	if (ret)
+		goto err_pm;
+
+	return 0;
+
+err_pm:
+	pm_runtime_put_autosuspend(og0va1b->sd.dev);
+	return ret;
+}
+
+static int og0va1b_disable_streams(struct v4l2_subdev *sd,
+				   struct v4l2_subdev_state *state,
+				   u32 pad, u64 streams_mask)
+{
+	struct og0va1b *og0va1b = sd_to_og0va1b(sd);
+	int ret;
+
+	ret = cci_write(og0va1b->regmap, OG0VA1B_REG_STREAMING, 0, NULL);
+	if (ret)
+		dev_warn(og0va1b->sd.dev,
+			 "failed to stop streaming: %d\n", ret);
+
+	usleep_range(5000, 6000);
+	pm_runtime_put_autosuspend(og0va1b->sd.dev);
+
+	return 0;
+}
+
+static const struct dev_pm_ops og0va1b_pm_ops = {
+	SET_RUNTIME_PM_OPS(og0va1b_power_off, og0va1b_power_on, NULL)
+};
+
+static const struct v4l2_subdev_video_ops og0va1b_video_ops = {
+	.s_stream	= v4l2_subdev_s_stream_helper,
+};
+
+static const struct v4l2_subdev_pad_ops og0va1b_pad_ops = {
+	.enum_mbus_code		= og0va1b_enum_mbus_code,
+	.enum_frame_size	= og0va1b_enum_frame_size,
+	.get_fmt		= v4l2_subdev_get_fmt,
+	.set_fmt		= og0va1b_set_fmt,
+	.enable_streams		= og0va1b_enable_streams,
+	.disable_streams	= og0va1b_disable_streams,
+};
+
+static const struct v4l2_subdev_ops og0va1b_subdev_ops = {
+	.video	= &og0va1b_video_ops,
+	.pad	= &og0va1b_pad_ops,
+};
+
+static const struct v4l2_subdev_internal_ops og0va1b_internal_ops = {
+	.init_state = og0va1b_init_state,
+};
+
+static const struct media_entity_operations og0va1b_entity_ops = {
+	.link_validate = v4l2_subdev_link_validate,
+};
+
+static int og0va1b_init_controls(struct og0va1b *og0va1b)
+{
+	struct v4l2_ctrl_handler *hdl = &og0va1b->ctrl_handler;
+	const struct og0va1b_mode *mode = &og0va1b_modes[0];
+	struct v4l2_fwnode_device_properties props;
+	int vblank_def = mode->vts - mode->height;
+	int vblank_max = 0xffff - mode->height;
+	int hblank_val = mode->hts - mode->width;
+	int ret;
+
+	v4l2_ctrl_handler_init(hdl, 9);
+
+	og0va1b->link_freq =
+		v4l2_ctrl_new_int_menu(hdl, NULL, V4L2_CID_LINK_FREQ,
+				       ARRAY_SIZE(og0va1b_link_freqs) - 1, 0,
+				       og0va1b_link_freqs);
+	if (og0va1b->link_freq)
+		og0va1b->link_freq->flags |= V4L2_CTRL_FLAG_READ_ONLY;
+
+	og0va1b->pixel_rate =
+		v4l2_ctrl_new_std(hdl, NULL, V4L2_CID_PIXEL_RATE,
+				  OG0VA1B_PIXEL_RATE, OG0VA1B_PIXEL_RATE, 1,
+				  OG0VA1B_PIXEL_RATE);
+
+	og0va1b->vblank =
+		v4l2_ctrl_new_std(hdl, &og0va1b_ctrl_ops, V4L2_CID_VBLANK,
+				  OG0VA1B_VBLANK_MIN, vblank_max, 1, vblank_def);
+
+	og0va1b->hblank =
+		v4l2_ctrl_new_std(hdl, NULL, V4L2_CID_HBLANK,
+				  hblank_val, hblank_val, 1, hblank_val);
+	if (og0va1b->hblank)
+		og0va1b->hblank->flags |= V4L2_CTRL_FLAG_READ_ONLY;
+
+	og0va1b->exposure =
+		v4l2_ctrl_new_std(hdl, &og0va1b_ctrl_ops, V4L2_CID_EXPOSURE,
+				  OG0VA1B_EXPOSURE_MIN,
+				  mode->vts - OG0VA1B_EXPOSURE_MARGIN,
+				  OG0VA1B_EXPOSURE_STEP,
+				  OG0VA1B_EXPOSURE_DEFAULT);
+
+	og0va1b->gain =
+		v4l2_ctrl_new_std(hdl, &og0va1b_ctrl_ops, V4L2_CID_ANALOGUE_GAIN,
+				  OG0VA1B_GAIN_MIN, OG0VA1B_GAIN_MAX,
+				  OG0VA1B_GAIN_STEP, OG0VA1B_GAIN_DEFAULT);
+
+	og0va1b->test_pattern =
+		v4l2_ctrl_new_std_menu_items(hdl, &og0va1b_ctrl_ops,
+					     V4L2_CID_TEST_PATTERN,
+					     ARRAY_SIZE(og0va1b_test_pattern_menu) - 1,
+					     0, 0, og0va1b_test_pattern_menu);
+
+	ret = v4l2_fwnode_device_parse(og0va1b->sd.dev, &props);
+	if (ret)
+		goto err_free;
+
+	ret = v4l2_ctrl_new_fwnode_properties(hdl, &og0va1b_ctrl_ops, &props);
+	if (ret)
+		goto err_free;
+
+	if (hdl->error) {
+		ret = hdl->error;
+		goto err_free;
+	}
+
+	og0va1b->sd.ctrl_handler = hdl;
+	return 0;
+
+err_free:
+	v4l2_ctrl_handler_free(hdl);
+	return ret;
+}
+
+static int og0va1b_probe(struct i2c_client *client)
+{
+	struct device *dev = &client->dev;
+	struct og0va1b *og0va1b;
+	unsigned long clk_rate;
+	unsigned int i;
+	int ret;
+
+	og0va1b = devm_kzalloc(dev, sizeof(*og0va1b), GFP_KERNEL);
+	if (!og0va1b)
+		return -ENOMEM;
+
+	v4l2_i2c_subdev_init(&og0va1b->sd, client, &og0va1b_subdev_ops);
+	og0va1b->sd.internal_ops = &og0va1b_internal_ops;
+	og0va1b->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
+
+	og0va1b->inclk = devm_v4l2_sensor_clk_get(dev, NULL);
+	if (IS_ERR(og0va1b->inclk))
+		return dev_err_probe(dev, PTR_ERR(og0va1b->inclk),
+				     "failed to get clock\n");
+
+	clk_rate = clk_get_rate(og0va1b->inclk);
+	if (clk_rate != OG0VA1B_XVCLK_RATE)
+		return dev_err_probe(dev, -EINVAL,
+				     "clock rate %lu Hz != required %lu Hz\n",
+				     clk_rate, OG0VA1B_XVCLK_RATE);
+
+	ret = og0va1b_check_hwcfg(dev);
+	if (ret)
+		return ret;
+
+	og0va1b->reset_gpio = devm_gpiod_get_optional(dev, "reset",
+						      GPIOD_OUT_HIGH);
+	if (IS_ERR(og0va1b->reset_gpio))
+		return dev_err_probe(dev, PTR_ERR(og0va1b->reset_gpio),
+				     "failed to get reset GPIO\n");
+
+	for (i = 0; i < OG0VA1B_NUM_SUPPLIES; i++)
+		og0va1b->supplies[i].supply = og0va1b_supply_names[i];
+
+	ret = devm_regulator_bulk_get(dev, OG0VA1B_NUM_SUPPLIES,
+				      og0va1b->supplies);
+	if (ret)
+		return dev_err_probe(dev, ret,
+				     "failed to get regulators\n");
+
+	og0va1b->regmap = devm_cci_regmap_init_i2c(client, 16);
+	if (IS_ERR(og0va1b->regmap))
+		return dev_err_probe(dev, PTR_ERR(og0va1b->regmap),
+				     "failed to init CCI regmap\n");
+
+	ret = og0va1b_power_on(dev);
+	if (ret)
+		return ret;
+
+	ret = og0va1b_check_id(og0va1b);
+	if (ret)
+		goto err_power_off;
+
+	ret = og0va1b_init_controls(og0va1b);
+	if (ret)
+		goto err_power_off;
+
+	og0va1b->sd.entity.ops = &og0va1b_entity_ops;
+	og0va1b->sd.entity.function = MEDIA_ENT_F_CAM_SENSOR;
+	og0va1b->pad.flags = MEDIA_PAD_FL_SOURCE;
+	ret = media_entity_pads_init(&og0va1b->sd.entity, 1, &og0va1b->pad);
+	if (ret)
+		goto err_controls;
+
+	og0va1b->sd.state_lock = og0va1b->ctrl_handler.lock;
+	ret = v4l2_subdev_init_finalize(&og0va1b->sd);
+	if (ret)
+		goto err_entity;
+
+	pm_runtime_set_active(dev);
+	pm_runtime_enable(dev);
+
+	ret = v4l2_async_register_subdev_sensor(&og0va1b->sd);
+	if (ret)
+		goto err_pm;
+
+	pm_runtime_set_autosuspend_delay(dev, OG0VA1B_AUTOSUSPEND_DELAY_MS);
+	pm_runtime_use_autosuspend(dev);
+	pm_runtime_idle(dev);
+
+	return 0;
+
+err_pm:
+	pm_runtime_disable(dev);
+	pm_runtime_set_suspended(dev);
+err_entity:
+	v4l2_subdev_cleanup(&og0va1b->sd);
+	media_entity_cleanup(&og0va1b->sd.entity);
+err_controls:
+	v4l2_ctrl_handler_free(&og0va1b->ctrl_handler);
+err_power_off:
+	og0va1b_power_off(dev);
+
+	return ret;
+}
+
+static void og0va1b_remove(struct i2c_client *client)
+{
+	struct v4l2_subdev *sd = i2c_get_clientdata(client);
+	struct device *dev = &client->dev;
+
+	v4l2_async_unregister_subdev(sd);
+	v4l2_subdev_cleanup(sd);
+	v4l2_ctrl_handler_free(sd->ctrl_handler);
+	media_entity_cleanup(&sd->entity);
+
+	pm_runtime_dont_use_autosuspend(dev);
+	pm_runtime_disable(dev);
+
+	if (!pm_runtime_status_suspended(dev))
+		og0va1b_power_off(dev);
+
+	pm_runtime_set_suspended(dev);
+}
+
+static const struct i2c_device_id og0va1b_id[] = {
+	{ "og0va1b" },
+	{ }
+};
+MODULE_DEVICE_TABLE(i2c, og0va1b_id);
+
+static const struct of_device_id og0va1b_of_match[] = {
+	{ .compatible = "ovti,og0va1b" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, og0va1b_of_match);
+
+static struct i2c_driver og0va1b_i2c_driver = {
+	.driver = {
+		.name		= "og0va1b",
+		.of_match_table	= og0va1b_of_match,
+		.pm		= pm_ptr(&og0va1b_pm_ops),
+	},
+	.probe		= og0va1b_probe,
+	.remove		= og0va1b_remove,
+	.id_table	= og0va1b_id,
+};
+module_i2c_driver(og0va1b_i2c_driver);
+
+MODULE_AUTHOR("Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>");
+MODULE_DESCRIPTION("OmniVision OG0VA1B sensor driver");
+MODULE_LICENSE("GPL");

-- 
2.34.1


