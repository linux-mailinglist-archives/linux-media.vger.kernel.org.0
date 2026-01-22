Return-Path: <linux-media+bounces-51330-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cGOIA4/xcWlKZwAAu9opvQ
	(envelope-from <linux-media+bounces-51330-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 22 Jan 2026 10:44:47 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id C65D664B90
	for <lists+linux-media@lfdr.de>; Thu, 22 Jan 2026 10:44:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 2269838AF1E
	for <lists+linux-media@lfdr.de>; Thu, 22 Jan 2026 09:34:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A91753AE709;
	Thu, 22 Jan 2026 09:31:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bBg6/lJz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HVp9Z0eo"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C66A305048
	for <linux-media@vger.kernel.org>; Thu, 22 Jan 2026 09:31:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769074292; cv=none; b=KlRu9BipUNKcMnz4N3ICuuBsmE3LQgEK6RFn250sNtuRc6MQLfjIpM8mlkOD/0llpE9LNsB0GFdBhhWjvQJH6t9tWk9/l8yh0BGEV4zjY9c25xLdbMFoyh3ZfjzF7Zb0a2rZ79eLcsy+tlrBkTwawESMX3V7oQbeKmrqcHJzH0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769074292; c=relaxed/simple;
	bh=UXsIDnWDfSfsvhhMChzKv83qNe/yj0Xr2Up0EJt3LiE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PJO6ZCexlufmxLzxIIHqXj4DZGHiHYctGwWtmOoS3uS6dVzWtXBKsw3iufGh401M6monTUmehqlo4ioYMdBvuqs2jKiSFaM7mNNGsxXmQF9XMnsNSb6ZHptmADE5zvlPeq3nw1nZvG4Kpe+U1O5hisYcoFKGS/ioT9X1CXcPf7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bBg6/lJz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HVp9Z0eo; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60M6reXY724849
	for <linux-media@vger.kernel.org>; Thu, 22 Jan 2026 09:31:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	n5VXUzKWNosB7ZAg6xAAa2hvQYKV+02V5+d4WJS+3Sw=; b=bBg6/lJzGEfYzmoO
	gEzo1zDT+91PijhfuiqfaRNsGPheG52ujAfqzgOpvS+FfFBu0tXEkA5PpxpUUeSD
	wai+yI2AHU4rJbIfjOPTiy2yHtK0u0JRtMUVenEhSWg7J9fuGWrlAyNVqtyD0/oK
	5J3zkm70yEzwlYMnL7lNSP/pUmINuCphBz7eg5C+ctrKAKG6Mi9NQYKkx5K8d+i0
	Lp03Z8a03kGsFhaML4B6ic3KRWAaxJ3ByYrjPHP5DwJvikcqdFlezDTI1Ff79WCh
	0jFBXN+s0H1prXlk78Q3So5Alfa2PIjuG9+2w0n4v2s01AL7ImINT/QHpfvbO3hW
	EtvQqg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4buf1bgfq7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 22 Jan 2026 09:31:29 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50145d24ffcso22825731cf.0
        for <linux-media@vger.kernel.org>; Thu, 22 Jan 2026 01:31:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769074289; x=1769679089; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n5VXUzKWNosB7ZAg6xAAa2hvQYKV+02V5+d4WJS+3Sw=;
        b=HVp9Z0eo8Ko4VyG3dx4Vu+jP1/ZKcWi05LkAqe0Mil567o/r/i2YeC28bzP4BqcRx+
         YJD6wjKliQSS8J4bU3oVyIyqYC+YHBPyD3hVMNmecTADBH1a1ZLCsA16bj6egzA60+v2
         HK3j8bT8iXXHPx3N94Y9VnSyXA+Os69w87GnocqwV8F9sFwUHFtQ7tTuh+2cAoeZeFXF
         sZTmv/L6uuAeyycfxT9r64PAjxnRA+zCeI1X2YxcACNwMHwgUaAwQuuGX0AYO2rUBZNp
         Z2MFI73hPXz5AUUPam+1zQt7TUV1522G3+T/AAC2QW/fSDdOVu5ovfKCVfyXFUJAEHIp
         PD8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769074289; x=1769679089;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=n5VXUzKWNosB7ZAg6xAAa2hvQYKV+02V5+d4WJS+3Sw=;
        b=J/ct06jxcbW2FD0hK2+8CfscyY0/5eGL1/2fKNVB7dpKBaLem9DQVeJYoA3/8WWwlZ
         1XDXo85nlhcUYL4S+R11SrDsep5BuiD7xBuHxWegh+CZGS0emwdUmyVIOFqrjBULuA2+
         49ym/jl5AiNp6VN/vEBm18H5bH9nvOah/b3iWrBPM49gEn1/2jggKB/u3DUJf5YXJYty
         laYLaI+ygAFGsa2sCbynnxn0K2+2CjQ6FhlIdSH9f3IZ6L8F4ulaBTyBSDCC8MDp+XQX
         uU7m3U5MDfLaZZfGt5wnnMOBxKxPpyvVmBOQ1p8B6toiaNAHBbkmIlE32DRSf/F4SEm6
         4M+w==
X-Gm-Message-State: AOJu0YwY8mjmzvRG12br0YC0QVApprl9qDnDb6gv8f8lOH9ON/8J0OBH
	MZ/POwdKnuRXTaTneTZ4xwezXu2IrC/zrKli5tK9SNSP/uQXgy+/ypjfNbI1AkGhW16xsDAMDLa
	8kqzPsApziaEXeBD0sNDKoImS5D/JoZYaUgzp5MVpGbYj9mQ4eh4V2EI2lfjtmgXU1Q==
X-Gm-Gg: AZuq6aJeHrnDXJ3S09085kULxznNpTmQDauF0l/t/A1N0K9cwzULDyYjXUgRJEsunR9
	RhtxaXbI5sYsg1XiAV6zkAlWAT5XX7AZ7B45RXWyGHzj8nxeBbOasr/6zR/92mbxtKiQwz7AwX8
	uktizO22wmXslPCclCSMieZOdU3PQB1TamKYhZC52OpJScvj9iRwVGfCwaZCmPTWpi88yC+eJYM
	IG1l8ZHord7qq0aXTp8kcmayd978VQmpnvKcg7zZpgtffgnIeAIMge4WjD8Jibz4odYqFIxGBu0
	+lxsHgjrEPyw9uvjTaaHU0AXCObiiLUhNA5NdbhO0anSVltpROEo7cRqYHw9W26W4zRc0VWSndt
	Tn8+Hx2sNVjfx/pfzbnbjYIMsfaTbfqRIRI3SJjz5TdLNElsd5o9rR5bmfOlQpGIvnlcNWZRlbS
	ot
X-Received: by 2002:a05:622a:10b:b0:501:4a9b:66d3 with SMTP id d75a77b69052e-502eb53dc00mr31109821cf.13.1769074288951;
        Thu, 22 Jan 2026 01:31:28 -0800 (PST)
X-Received: by 2002:a05:622a:10b:b0:501:4a9b:66d3 with SMTP id d75a77b69052e-502eb53dc00mr31109661cf.13.1769074288558;
        Thu, 22 Jan 2026 01:31:28 -0800 (PST)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8942e6d87b1sm139601576d6.53.2026.01.22.01.31.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jan 2026 01:31:28 -0800 (PST)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Date: Thu, 22 Jan 2026 17:31:19 +0800
Subject: [PATCH v6 2/2] media: i2c: imx412: Extend the power-on waiting
 time
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260122-imx412-v6-2-2c0b54594c2a@oss.qualcomm.com>
References: <20260122-imx412-v6-0-2c0b54594c2a@oss.qualcomm.com>
In-Reply-To: <20260122-imx412-v6-0-2c0b54594c2a@oss.qualcomm.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769074280; l=912;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=UXsIDnWDfSfsvhhMChzKv83qNe/yj0Xr2Up0EJt3LiE=;
 b=x8t9fqjHkU4qesJdjSZAm7KqPgIIpVyIrNAF2n4BjzBNwq23r2+tfYJDzPBKV05VHViiOqJcP
 JBSamK8IKqtDYMrg0RM88v78f4zVtyTXBBQkWemJCNTN8CcjfQ4N4j/
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Proofpoint-ORIG-GUID: Q1c1N_hxB1d25kv9qD5LnXwGa3puWDQs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIyMDA2NSBTYWx0ZWRfX+9SOQmYNaCvh
 xwvRaLav/pxnOzmGyMHIcdFUDN4hanv4hbaPq4gB8mxBhDvy1HV6dJtOVMllsFphxiexDToDbIG
 fQf6gtiLJGiLzJtRnLq3Xf1mMVY1sjEsXKf0IjVebGWBP19KutE52yP6eWZxs42yW8hd6oHq9CF
 kFE+T/OWk2fbkiKQZaKv0SHO/Ac0bGCaox2ylN0WLLoSwIQivd/SYnQ5xh37/IFTB1S6Zd5Rg/2
 mhDvFbQwzTb3NX9U9qXNoM1P3JcPhyccrFVdmubqBRu9PjcrvFtIfOoMBKwATeCCYFe9OsWC3Dc
 zfOsZMh0w5fNx3eijh4al9lKJNt1VTj2+Sudw9canKzXf8V5536gTnfYcxt5swWylRw4jGVbXaC
 +vc0SYEMAN5ECiZvGZ++7ineCDcggLp2kaVliTh9s/10qEPdsJTqyWWPFHxwkg/w0XvgDT6b13g
 GdTmgzcCRqO8I2C5lRQ==
X-Authority-Analysis: v=2.4 cv=G+0R0tk5 c=1 sm=1 tr=0 ts=6971ee71 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=dXID522kZObDGRcwZQYA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: Q1c1N_hxB1d25kv9qD5LnXwGa3puWDQs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-21_04,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 malwarescore=0 phishscore=0 adultscore=0
 spamscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601220065
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.96 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_POLICY_ALLOW(0.00)[qualcomm.com,reject];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-51330-lists,linux-media=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,ams.mirrors.kernel.org:helo,ams.mirrors.kernel.org:rdns];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:7979, ipnet:213.196.21.0/24, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wenmeng.liu@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	TAGGED_RCPT(0.00)[linux-media];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C65D664B90
X-Rspamd-Action: no action

The Arducam IMX577 module requires a longer reset time than the 1000µs
configured in the current driver. Increase the wait time after power-on
to ensure proper initialization.

Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
---
 drivers/media/i2c/imx412.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/imx412.c b/drivers/media/i2c/imx412.c
index aa63dfc349181bf9c180ffd566b0317d05b410c1..9154c238949e4308755e757bd9c71f0b44f433ee 100644
--- a/drivers/media/i2c/imx412.c
+++ b/drivers/media/i2c/imx412.c
@@ -1037,7 +1037,11 @@ static int imx412_power_on(struct device *dev)
 		goto error_reset;
 	}
 
-	usleep_range(1000, 1200);
+	/*
+	 * Some IMX577 modules require a longer reset settle time.
+	 * Increasing the delay from 1ms to 10ms ensures reliable startup.
+	 */
+	usleep_range(10000, 12000);
 
 	return 0;
 

-- 
2.34.1


