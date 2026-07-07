Return-Path: <linux-media+bounces-66920-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id PAXwAOR/TWrO1AEAu9opvQ
	(envelope-from <linux-media+bounces-66920-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 08 Jul 2026 00:38:28 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 68339720286
	for <lists+linux-media@lfdr.de>; Wed, 08 Jul 2026 00:38:27 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="jUP/KIf8";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=cKiPvfA3;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66920-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-66920-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A7F9F305AB24
	for <lists+linux-media@lfdr.de>; Tue,  7 Jul 2026 22:31:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDCAE4C77A9;
	Tue,  7 Jul 2026 22:30:04 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CA8A4C6EF4
	for <linux-media@vger.kernel.org>; Tue,  7 Jul 2026 22:30:02 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783463404; cv=none; b=OGTZbNPjztk0s8usOWXfnekNkCoZs0OLzq9cm9W7cFoax5ZA9LbmcFGSWs4j4Jrtjv0OTG/7B+3k1HvaXlyVCzb1aE2hA0eZnxMZpA6rjIAmdeDIKdNXPHOby9dxt2eDOYyD8v3bW+Pq7vm38RlUzJ/S/DfMQKWfrh7YEW1q8Qs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783463404; c=relaxed/simple;
	bh=W2dVe0fVWb+LITn0jPBAVSZ9TKoQzF7ls/oQCbnHPuo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=U1ncgiyu4Q3YgYODnUM0+S0rc0XzHLEL4OABiy3H3HmSJZj/BRFeMHiJ054MbjW8q3EpK1DTMxr4BLQWKuy6o9p8gc/FIUxfV4NdU1YVPOXFBbku29mwwHpYA87RmJzGujD/8inqxgINTPaecTFBvpb7SvB2H8wWbky9CpgCBWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jUP/KIf8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cKiPvfA3; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 667J5Cju356731
	for <linux-media@vger.kernel.org>; Tue, 7 Jul 2026 22:30:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eI/ZKCPkYisPDodHq1wlbUBytByuKMbfYXXpJP3saUI=; b=jUP/KIf8MT2kAWP2
	Kadu3iSAU1JlZ8FgYQNNvZpX7mLpKKQnhfDEAEzKD+M0pLxZlcKTfCwU/TchrpL5
	4NM4XW+U66+bVlaFCTcaVGxpMgq/rrdKiuGHmQf6pz9MUYh3yAu5/A/ej7yiaHKX
	hwO6y4Rz2uk27K+76W18pQs9arLpud00Mgt0l4RplGqj4DMrefiVuqse3mxwiJA8
	ab+q4aK1SUiTu4bPSiFzneegyVMPyFZbfrgoBZiozkPpF0nXNTgCEuSX5ZElH8M4
	lT61fQ8plrOUijhWhIb2NzV5kmHVEv9mHWntbOBBAg/8QQz+P2WwiZx/YlSZDsYm
	0sljzw==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8sm8me5x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 07 Jul 2026 22:30:01 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-738d9935e23so4666137.2
        for <linux-media@vger.kernel.org>; Tue, 07 Jul 2026 15:30:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783463401; x=1784068201; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eI/ZKCPkYisPDodHq1wlbUBytByuKMbfYXXpJP3saUI=;
        b=cKiPvfA3HAuCjjWKm/oRxvPdrv04DR89XorW6LvFpzTUd7kyHSSlGCtrU4AHRpcQ26
         B0Fx2F9ghu70HnsGmxNkW2a6q+BP8ULRnEA0N+ZGoGlOhNYZ+HxrcgPRWsqBd2C2mKFk
         ICiVjPwOYyOi4smsAQktYIdVYZefUAMFAzM8hGLkhiAWwPuF+S8H1YrIxdd5UVx48ac0
         paYmsXkOksEN36nVyz9ZGeGZJGheb82rQRXVIZttppBi9SnLaT2iRqd34dh8wMNn8tek
         qe02qoslR9YHjRdqsl6O0QJ/rklCVzarliqC+MI37W/wREeV7axXIsAGUd09q7oftj+g
         iczw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783463401; x=1784068201;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eI/ZKCPkYisPDodHq1wlbUBytByuKMbfYXXpJP3saUI=;
        b=AAdX688Mb22r/V+SIquGy9A+x7KSdVh0/hLnym4TFfJ+UteybZv60uV/XcMTcP+VhB
         7RkcFP3rHj//pwIG33mD9jhws5vXy4WfI+2W7MfwdQcMjb4oDy4JdB9N6pprMy96/wPM
         v+faoXliZ3kbfvK9kUqAAfM9P+EGPUv4YbhB0axE8da+b+qFoXRa5KQeiVJh/lB3bRf6
         7ADEr6Lo1VjO7If1t0mAt/NylQZvjuOuT6nAtt+WPOYLvtZutlVdzFqGRp3Ns0jyAcdj
         F1mGNGUwR6w9zXhp0gTQvROnzG1T3a0jkDikAsP4UObzJb1Q1jca2Hc6WKwP9ugpdGwg
         B+3g==
X-Gm-Message-State: AOJu0YyvE2BqGa+ehzWa5fNVcVlkkl7iHMFWBbUPvIW30GUeiotrFEQ5
	7WlpEdLHUsH06iD6hpE8b7EIcmV+TLSATP+/t7BqJ8gF/UQ7gFcx0cWN37MEVNoiCnvmlS9zRGG
	sDhOwCYnWzvDVDgujbQEJECshqbVMHisBNg/zYwxbMLhHUecKZB8OIU1jaCc1ZLeA2ACxs+Ib8Q
	==
X-Gm-Gg: AfdE7cl621yGhC1dZkO8zIDdk/oi5V0ZbpVNFmsrDkZSlkUFTLP6b4HkxcUsc32EheL
	HbHzHD4Ad0Y6uRAOTY+Y86cBT1JvMX8+4BBfXOjYUwZwDi6NdbkRC6+GeoUwdnkfXiIgOKLwmLR
	hIl6Ib4boQLmcmGVYJsjFJ3vISKhZTs9qvHMxfAqzKJqzE4iEz9Pnjj9Ys1tLHgQjbSF7owNq41
	48XsHIGGtWBT8QXHKRGlFdO8Vbj4OqROuPfLVpxfR5J/CwJh/A7Sr1s350j/tEP53s6AEogK5Fz
	1JZGPiQru9AhsVfmPAwCqFnRSWjRxa7ABLuAuTW2LgkZjmx14L4p1nfET3sVfiFG9YcmhcRXr8Z
	Xa0Cf2tKS+hPgDZXyzifYN8oFp7GvFyDJazZ00AxeH80CMLRqWbbPgN4Ro0YdNUyeIdmZGog5bo
	Y813VW7L7xurLq7u8OuOEWZ9QY
X-Received: by 2002:a05:6102:560f:b0:739:71ef:d772 with SMTP id ada2fe7eead31-744b79c1c70mr3985618137.4.1783463400775;
        Tue, 07 Jul 2026 15:30:00 -0700 (PDT)
X-Received: by 2002:a05:6102:560f:b0:739:71ef:d772 with SMTP id ada2fe7eead31-744b79c1c70mr3985591137.4.1783463400216;
        Tue, 07 Jul 2026 15:30:00 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39c7312bc25sm1897231fa.40.2026.07.07.15.29.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 15:29:57 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 08 Jul 2026 01:28:56 +0300
Subject: [PATCH v6 13/18] media: iris: update buffer requirements based on
 received info
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-iris-ar50lt-v6-13-374f0a46c23b@oss.qualcomm.com>
References: <20260708-iris-ar50lt-v6-0-374f0a46c23b@oss.qualcomm.com>
In-Reply-To: <20260708-iris-ar50lt-v6-0-374f0a46c23b@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3501;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=W2dVe0fVWb+LITn0jPBAVSZ9TKoQzF7ls/oQCbnHPuo=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqTX2q7845qm/Uf8v165MKTXEeTINPIkA7vo57a
 dJHue9HeFyJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCak19qgAKCRCLPIo+Aiko
 1WNoB/wJ+1eWutbgXKoYqkq5JxJ39sfo0zDjQ96MHAyYPcc0rYrd/dXEmx3bLx9JG0lcsSCgNLY
 KcrOR+YoXd8PUYzgwJhhQ8g3rElxTpEXy7JnNstJrEGPcBvW+rtx0QXA6JMkiWhhfWDHd1dc5AI
 Rt68v4yEUcxZyZbQhYCGgB2qJsUXpZJc9l/mMWMUJ6jZ+Zd1vA2+VwQaNHPyFTdBMQHGHRxuBtm
 cYLOP4Cc7QWZSJ/lW3eFIXDR1/sGDgxPCCk8YHJsV0eC4nZ+GUiIv/dIfiW/eIEALz56yuJrdW0
 Ltpu2VJHn0e9qQtEI55ExoHlUWu2GXIL6YwHbEVxEaTMWuiR
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDIyMSBTYWx0ZWRfX5NfqIMUIPHQv
 +v1wk2Qvke1gE/5SPEaVXoxyhqMWd/3UgoHAE/JF88LzWxehsHG6O2CdadjI2/zAp9Q20yHYvnJ
 X1k/o1X8ZrXVbbOSa0sldN2qjGf7mDx6cofmy7IqMZChPLVd9GwnPxuw15tDw5Ekh6ZHc6X895K
 zp2hAKwpzMFj8+FcZtmaaiwV49fOFqVlHGvItzzwzcd9ZFLCoilzd7gdEVsC4mmrU93B5NjUIkw
 z3mTAigvAyNkopmlErix+oxnvp3nUT0+vuKrLOfnlvHbaon6/2Jgd0qyr2GQIb1UzS3azawpA+Q
 UiIQUIawztWYTRg93Y8tLQS00SAIWPNn4Oa/hbKCSb6WbRhuOXvvXJG4+o3oaN553pl9xCaY38d
 +aOH+Acbgr08ZpTpDWM8GyExkelqPo+IyllTOZK3JUtvCYXo4p4HrSzYYS7s1RMHTkzW9scOQLo
 IcORVX1o4JGloIsigtA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDIyMSBTYWx0ZWRfX+jOduyLb/l9q
 IrPBX5zDxOL2/ff4uaAWLGP1AkpzVgXbsANJx0I3xt7ViUZv/K7pMfAMju0kC2AeLe+VrStjBZe
 RTQMhzksAjMPbbKZysXT4OsoKRNfDa0=
X-Proofpoint-GUID: KPw36ttcYSVx2508WBK2k7cSQwcnAfSF
X-Authority-Analysis: v=2.4 cv=UvdT8ewB c=1 sm=1 tr=0 ts=6a4d7de9 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=_TRJU0tGboi39qq34nEA:9 a=QEXdDO2ut3YA:10 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-ORIG-GUID: KPw36ttcYSVx2508WBK2k7cSQwcnAfSF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_05,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 malwarescore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607070221
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-66920-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:vikash.garodia@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:mchehab@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:busanna.reddy@oss.qualcomm.com,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:dikshita.agarwal@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 68339720286

Upon receiving data for HFI_PROPERTY_CONFIG_BUFFER_REQUIREMENTS the
driver should update buffer sizes and counts from the received data.
Implement corresponding functionality updating buffers data. This will
be used for upcoming support of AR50Lt platforms with Gen1 firmware.

Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 .../platform/qcom/iris/iris_hfi_gen1_response.c    | 75 +++++++++++++++++++++-
 1 file changed, 74 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
index 23fc7194b1e3..896953ea62ea 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
@@ -533,6 +533,79 @@ static void iris_hfi_gen1_session_ftb_done(struct iris_inst *inst, void *packet)
 	dev_err(core->dev, "error in ftb done\n");
 }
 
+static enum iris_buffer_type iris_hfi_gen1_buf_type(struct iris_inst *inst, u32 type)
+{
+	switch (type) {
+	case HFI_BUFFER_INPUT:
+		return BUF_INPUT;
+	case HFI_BUFFER_OUTPUT:
+		if (iris_split_mode_enabled(inst))
+			return BUF_DPB;
+		return BUF_OUTPUT;
+	case HFI_BUFFER_OUTPUT2:
+		if (iris_split_mode_enabled(inst))
+			return BUF_OUTPUT;
+		return BUF_DPB;
+	case HFI_BUFFER_INTERNAL_PERSIST_1:
+		return BUF_PERSIST;
+	case HFI_BUFFER_INTERNAL_SCRATCH:
+		return BUF_BIN;
+	case HFI_BUFFER_INTERNAL_SCRATCH_1:
+		return BUF_SCRATCH_1;
+	case HFI_BUFFER_INTERNAL_SCRATCH_2:
+		return BUF_SCRATCH_2;
+	case HFI_BUFFER_INTERNAL_PERSIST:
+		return BUF_ARP;
+	default:
+		return -EINVAL;
+	}
+}
+
+static void iris_hfi_gen1_session_buffer_requirements(struct iris_inst *inst,
+						      void *data, size_t size)
+{
+	struct hfi_buffer_requirements *req;
+
+	if (!size || size % sizeof(*req))
+		return;
+
+	for (req = data; size; size -= sizeof(*req), req++) {
+		enum iris_buffer_type type = iris_hfi_gen1_buf_type(inst, req->type);
+
+		if (type == -EINVAL)
+			continue;
+
+		/* on relevant platforms hold_count and min_count are swapped */
+		inst->buffers[type].min_count = req->hold_count;
+		inst->buffers[type].size = req->size;
+
+		if (type == BUF_OUTPUT)
+			inst->fw_min_count = req->count_actual;
+	}
+}
+
+static void iris_hfi_gen1_session_property_info(struct iris_inst *inst, void *packet)
+{
+	struct hfi_msg_session_property_info_pkt *pkt = packet;
+
+	if (!pkt->num_properties) {
+		dev_err(inst->core->dev, "error, no properties\n");
+		goto out;
+	}
+
+	switch (pkt->property) {
+	case HFI_PROPERTY_CONFIG_BUFFER_REQUIREMENTS:
+		iris_hfi_gen1_session_buffer_requirements(inst, pkt->data,
+							  pkt->shdr.hdr.size - sizeof(*pkt));
+		break;
+	default:
+		dev_warn(inst->core->dev, "unknown property id: %x\n", pkt->property);
+	}
+
+out:
+	complete(&inst->completion);
+}
+
 struct iris_hfi_gen1_response_pkt_info {
 	u32 pkt;
 	u32 pkt_sz;
@@ -657,7 +730,7 @@ static void iris_hfi_gen1_handle_response(struct iris_core *core, void *response
 		} else if (hdr->pkt_type == HFI_MSG_SESSION_FILL_BUFFER) {
 			iris_hfi_gen1_session_ftb_done(inst, hdr);
 		} else if (hdr->pkt_type == HFI_MSG_SESSION_PROPERTY_INFO) {
-			complete(&inst->completion);
+			iris_hfi_gen1_session_property_info(inst, hdr);
 		} else {
 			struct hfi_msg_session_hdr_pkt *shdr;
 

-- 
2.47.3


