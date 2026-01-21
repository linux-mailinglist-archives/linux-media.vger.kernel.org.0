Return-Path: <linux-media+bounces-51204-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IDxIM9qbcGlyYgAAu9opvQ
	(envelope-from <linux-media+bounces-51204-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 21 Jan 2026 10:26:50 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B4B954581
	for <lists+linux-media@lfdr.de>; Wed, 21 Jan 2026 10:26:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 69AEC5049DF
	for <lists+linux-media@lfdr.de>; Wed, 21 Jan 2026 09:13:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32F5947AF5A;
	Wed, 21 Jan 2026 09:12:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aOroNlPp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fHR4xXb+"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CA9746AEEA
	for <linux-media@vger.kernel.org>; Wed, 21 Jan 2026 09:12:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768986752; cv=none; b=M+R99jddg3piC8I8m4fEvXYpPzyB7WNp6ME2ZdjhljuftnRW01ZJ196QXiPhy+7tacvm9TALwBPU8VY/FIZE1rvrkUMV2e6KBXCbhm1TZwnvSgiq1SpDtXvwQgdxrTtMb1Zb6cRWJUs+KpcIus8az8a4Yjp9cvorIOPEQ9tsvfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768986752; c=relaxed/simple;
	bh=RAqH5cWq9MKsJuw52QFy4WvFg6bXwrjh6GTUkQXEQQA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=F1W1RtTGiN9BvrwBB0yBgc0nUqn3dSBFvSua4ULjxiJprGORZg8UPH378C8Qdx8qXC50Us7LIJ7MohNgtoyYZLl3fQtk5ZwcZYIZ5f1rNs6PZArBtdwxZQoaYKS5z7MX+MU7Xd/Tp1r1vutvf2o3eztSlEcpoMXUnTICO30H2qU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aOroNlPp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fHR4xXb+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60L2iEMA824882
	for <linux-media@vger.kernel.org>; Wed, 21 Jan 2026 09:12:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UG71Zz/31NzgFZSAFU+LGElhqztcIFoPulMzHIK79MY=; b=aOroNlPpEmOyXhnu
	Ep3kmupEZyv5iaqGEJvyiu6Kdsxli/7BaUf20lZIyhf/ij8SpSfEWklDxyf8Gaqt
	ALF5wOwpUE2ns1fWicE+KlC2mrX1qB5LhV4ifM31bB7TjDEcZrEicce27IbR+Bzu
	O8u26nMwVybGCstrMb+Wk026vGdnLoUMbDRqtdKAa409bHdgipMgqH6D1KxNqXGd
	KHBTVUTJbEkbV9bGFk+Nq7q9bEEF/oTBSrDuRaNpzbKVx+4u9JDmsC9d3B1DLS9n
	bmfPVXwhqCjV0qYF7wMceeqGzDOmPfwUW77PeGVHBF7TcXCsn67A8YLzD4AJjSyC
	kh67xA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bte5e329x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 21 Jan 2026 09:12:29 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c52fd4cca2so1611435285a.3
        for <linux-media@vger.kernel.org>; Wed, 21 Jan 2026 01:12:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768986748; x=1769591548; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UG71Zz/31NzgFZSAFU+LGElhqztcIFoPulMzHIK79MY=;
        b=fHR4xXb+gzoVqdYvmZs1bNqeLjIpj3rx33sNnX604maoHTLJqpalE12rgLyaY9pbRE
         gcLTo2rQ+a53XJ6XmwFvVeHfnMw8Lq5WkfyfyLY2VDjTy5F0JSVYApXt49kLmRBK39Zo
         63AjpsS1p+yP1k2fk957zHUSPWEZVdsj8Vc1uOOEm7SK3VJ6O21X1bX9l+YC8HBydUzF
         TncgSRQJr125Wx3VhHlQKlDHM//NsNXJiJzuUHEKWP47MuBCuqYQtxJd54iG1wqcsnqd
         MJC7/Pfx34xMDCNp5+fCvy+dO3BGkEiU213XrCJAys24tszVXalciXR1/+ye/xMGIgUJ
         pguw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768986748; x=1769591548;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=UG71Zz/31NzgFZSAFU+LGElhqztcIFoPulMzHIK79MY=;
        b=VtvUE2rGVo5HDJYw49TWhAaMBbNKoFOmJui5LzJJa4718eeaaf0nblK12lWpoU7lgD
         bZf/YWYVsC9xZOilWnjMM7Pp4dldDdTZOSccdiYTSJIBHfMuZbP25T3CY9xplGU0QIaJ
         cR785DcTGfaOF7Z6V+BOVIVIn3qXd7SowO4j83Q/7gwVG4uR6s62KlC2PiVSZmGLiY0a
         5maXzSv/ypRvws8k0tbuey6nqB1VXET6VJUEKdkrSOWh/VpGRCMFqwdWf7/+nh7C1Dcv
         /DQI1f8q9ChRJN/H+OR5jxe1xYouHc9LuHYmbiaYYAAwYcquYJ3amLSOP87TQWtInMAA
         JRug==
X-Gm-Message-State: AOJu0Yy9TYvS1NvA6giVbrIOPSVw2jnKtYrfXAnP6LVi/6iKPAf23tXE
	55BIeyA+jfeLLPyTIgUEFHXuYTSkiJgsOTqK9V/sjkI/980UorBxJTeVVigOAzmY7RkLsluweVu
	JFXfeUJhkSkx036MXbUwrXAcX7bEJ/75AHALEPoFl57ApIjUfv6yQpljk452vqVwR7w==
X-Gm-Gg: AZuq6aLJ25k8z5lqzGE1uL3tLlGTM4QoNAAzRBvE7vLHGo3d+XNdib/CNXvtpbxiRlO
	uibvlFLmRKs/+12KVIiFUjuzmjMaf8EGzlAcAAvOb/VPk3tI+HNCapAY8DiptKbNwkdUjinAbud
	MQDOSbtNNHJl6nIrMsYabtVHwqq3jL6qRmo+B/I9wSy13wuB+JV/3980AcYXBCJsZiX3r4gtdib
	eAgGvk5J8XvnIF1QOeK+o+mLEA0fwvWHAg4fbmEAOM8YbHi1mCN+Y04YHHCN1d6jnqsahh3KXme
	w0WAcQTo6ojdQwMCrNqhebW54C4Zt9ePQpFjjhTVeKurQafAIo28nb4cv5nBgIUxnkK68AR99b5
	y1XbiarU54FbWOjtDRzHiYJaOx1cOo2Raq03+pP/H159toyAx1UDt8mvazLlrgc/IvGrGDkcuYp
	Pa
X-Received: by 2002:a05:620a:4003:b0:8b2:f090:b167 with SMTP id af79cd13be357-8c6ccdbf81fmr557641785a.24.1768986748664;
        Wed, 21 Jan 2026 01:12:28 -0800 (PST)
X-Received: by 2002:a05:620a:4003:b0:8b2:f090:b167 with SMTP id af79cd13be357-8c6ccdbf81fmr557639785a.24.1768986748294;
        Wed, 21 Jan 2026 01:12:28 -0800 (PST)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c6a72639fesm1221031885a.44.2026.01.21.01.12.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jan 2026 01:12:27 -0800 (PST)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Date: Wed, 21 Jan 2026 17:12:15 +0800
Subject: [PATCH v5 2/2] media: i2c: imx412: Extend the power-on waiting
 time
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260121-imx412-v5-2-be67654a4afe@oss.qualcomm.com>
References: <20260121-imx412-v5-0-be67654a4afe@oss.qualcomm.com>
In-Reply-To: <20260121-imx412-v5-0-be67654a4afe@oss.qualcomm.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768986738; l=761;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=RAqH5cWq9MKsJuw52QFy4WvFg6bXwrjh6GTUkQXEQQA=;
 b=zpKH1Y1/VYaPM8kzqBqY8vK5sco/e4uA50Qtx6Nakxw5ULx67Wtfh+NxzL/NBiawmn1uHJQkh
 hAt3Ucc0bXEDQmCk+Ec2SIOv+HbeuVzAn80g+2TKe2uvQm7IeCm4MKd
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Authority-Analysis: v=2.4 cv=BKa+bVQG c=1 sm=1 tr=0 ts=6970987d cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=fwpc4IpM0P9R8YQ-nboA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: X7hiMeGLCcCmbFSgiFlsWqsCTpgdaUR4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIxMDA3NiBTYWx0ZWRfXxsysv/4F+ynq
 5lhmTWLBKJtrBLkjIE5RKNjrtQwrJJ46A5quc5A+B+aqKbdjncur2BIyVn4QUfa7vLoXXu0TYpY
 2jBzsq07TmCXiRXiFasuZT+DeZoUZSdt/xOIrnvXKYTT6Hwdjp1HE+NngKAt1s/mwjlJD2WZUXx
 O/Pb7dNaa5zdHbJ8lRA1ecj1zqmwS1P7yEKr8Z1hzv9hBE034f4/1ioGFUfqX5IG+L2gWAL5APu
 OkOsfVFg6yoxfcpIt/w+KUadOZQBClpJepNEQIt7u+cmlKv39JD5KJrcY3C/GgFYboPqurI+Rw3
 OiZuCGu8enyZqq4kKa2Xm5b+UJaWi3/q4wjJxq+v/yHEwJi+Yjhy9p5B1U1IWLHYyhxp+J60N50
 KeQ5VWIUK/1RefFo93YeorsWFPSK9sWG3qJroO65RcYPeCLvQycb8cxgmc/VZk0JL0a4rn3oaCp
 Thn79YQB51vcC9tDNMQ==
X-Proofpoint-GUID: X7hiMeGLCcCmbFSgiFlsWqsCTpgdaUR4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-21_01,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 suspectscore=0 impostorscore=0 phishscore=0
 lowpriorityscore=0 spamscore=0 bulkscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601210076
X-Spamd-Result: default: False [-1.96 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_POLICY_ALLOW(0.00)[qualcomm.com,reject];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-51204-lists,linux-media=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:7979, ipnet:2605:f480::/32, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wenmeng.liu@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	TAGGED_RCPT(0.00)[linux-media];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 3B4B954581
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The Arducam IMX577 module requires a longer reset time than the 1000µs
configured in the current driver. Increase the wait time after power-on
to ensure proper initialization.

Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
---
 drivers/media/i2c/imx412.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/imx412.c b/drivers/media/i2c/imx412.c
index aa63dfc349181bf9c180ffd566b0317d05b410c1..b1c201b4c7d008aa70ac84205e4de119e776047b 100644
--- a/drivers/media/i2c/imx412.c
+++ b/drivers/media/i2c/imx412.c
@@ -1037,7 +1037,7 @@ static int imx412_power_on(struct device *dev)
 		goto error_reset;
 	}
 
-	usleep_range(1000, 1200);
+	usleep_range(10000, 12000);
 
 	return 0;
 

-- 
2.34.1


