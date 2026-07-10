Return-Path: <linux-media+bounces-67220-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 5Lf+GvFeUGpvxgIAu9opvQ
	(envelope-from <linux-media+bounces-67220-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 10 Jul 2026 04:54:41 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C406736CD7
	for <lists+linux-media@lfdr.de>; Fri, 10 Jul 2026 04:54:41 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=GnWYbhuX;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Hdp22n5G;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67220-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-media+bounces-67220-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A01C9301B834
	for <lists+linux-media@lfdr.de>; Fri, 10 Jul 2026 02:54:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 207DC35E1D9;
	Fri, 10 Jul 2026 02:54:32 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA120356A12
	for <linux-media@vger.kernel.org>; Fri, 10 Jul 2026 02:54:28 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783652071; cv=none; b=rflIvB6MPHP6wpANAuAqtN+SEdGVBW+3rJf/nwN85OmgebKtlTeqOp63q9Y8cDaZ67XPomzX6FPqWNyuBSZxASZhR0wEOUrAjuWNucFwqR1nnGsEnObhsNdLibSORcMTBSi5fuu3VryUgiWnKB+1qw+p9nIF3nPvf11EVemAcEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783652071; c=relaxed/simple;
	bh=ZRQ0rtnnQB0Oq2dtTeQphk53sePamjzWEWuDue98Mlk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=j7+2zkN8FWDcp6T8E4Om44bnKfYDT8dMVG1/+Nbm1v08nZREUfNPbYofy/k5qbIoG1HAWAU0WZGek5bPg+w0+P7kMrSJIcyvXsiR/5udi5Snhxywyh/4x23tqc8d0y8btb0/5M32SDF0iGWLHqp0wESEQoklf5Y+24aTKyBYa2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GnWYbhuX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Hdp22n5G; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669KZ81n2917252
	for <linux-media@vger.kernel.org>; Fri, 10 Jul 2026 02:54:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8srnsUWvtGuuuukabgqd6mjKla54hcWqMvwIgpbUTnI=; b=GnWYbhuXMgrgxBbG
	kJ2uEbofdKwgT0U/ixGKBhVZX5C3pyvYLtXuty7G2FQiL0VW5eet3RWp1rHzWUtg
	RC7Q2ON3TLDE2wExRm0s9EVQD39ksPMEq6eGSwc1eRrvM5oRaL+i6EzAXpig5KsH
	VxZ04CzldOOQgMGWC6BbH4pPxz9RhEG3rt1fx6QIqpzNSl4+LHniwzGqxC9/7bGe
	jpzNsoN27XhsxawFTyfJY4v8x92iyMOFHQUk12vs0j7JI9DPFsn2XPQ0Ytxhmfc5
	nwPFH1+3LqWRHw5d8OPSQLQnYFhy2fJkR2wemy/+q99+LSXerKl78orL4gICnUdB
	YDvN/w==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fajte11aw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 10 Jul 2026 02:54:27 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c8895156101so822241a12.1
        for <linux-media@vger.kernel.org>; Thu, 09 Jul 2026 19:54:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783652067; x=1784256867; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8srnsUWvtGuuuukabgqd6mjKla54hcWqMvwIgpbUTnI=;
        b=Hdp22n5GJdkupe1PjFq5Jl4/I9pfktiAZPLH9CvPKNwzYj2CecJ6Zc5DOXrfWVbDcM
         qOJvV/d2u4BJQ2W6x4wNAz5pfQqh+0dW/5LQLe2zalkfbrZpWVaEHWV5fT4YYMSfN029
         wva72pyl+6WAYU7/Y+pCdDTJGOqBxcnYFbUcOLW/Rp10p5YGFzhfUnhz1o5XRUPypZpN
         9AWjXFR+J7VkvR+W89Z74ozpXFbM/gdxDJA+4wQfithQTnMKCUONYPWUCbXNrRAkbwzN
         +aa7leuMMmpCEUQ0ZcyNHIUm0E0uVdW5q4Nw+INFoiEGNGvnT5R+kjrDo0paKqHGSVUR
         lV0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783652067; x=1784256867;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8srnsUWvtGuuuukabgqd6mjKla54hcWqMvwIgpbUTnI=;
        b=ZSJ2wzHnp3FnUiHi9YMb0z0MNX+rIjHPEzmKajq9kZM5EQISEEux0MvsngunTZwpKw
         n8ADY4BS4CDufNeW+1SwlNWY07NN1M9le6guFDGFoLuT2IPujLCIa5SP0uquP9rmQ9Qx
         8cbHMPTz7A1kq1j5PbTyBHfJ/lhOm7aKjCrikC58EDqH3gHWcFuu00etEQvW39xekoUb
         gnMJScd5uqPkAKhmSrta2IVUGRHs1k/pPjDcdrqT+F1iLhmwFIAA1kObU2h05Rfa9otC
         W9I5ehcRgUEmS8LneWOuYZ+ig8S6qA9eCEolCMhM4ULykhFAxJMhdsTG6k035h+1p7/b
         9UYw==
X-Forwarded-Encrypted: i=1; AHgh+RpYQ0z4vmO0Bcej86HgMOftyfXCJXmFLEzJZOAhg+1G5Mv8SwELgh1abHcsYb3OsXnlbFq5wnbBR904OQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0YD0DTeYFvp87l2dzMO2Qhe6xwDhv3GMHa7ad4w+ublXKZB70
	sg6gPCbVrVDpR0Pu7LWhypyXMbNGGt7v25IsLfY2FiCYT43yEOQ7D5wskROdemRqNmxAdy7blpb
	VCzyZngV/0F4jzlDtxG7hb4cEHthjDLq4NUImFKLsowy46P512h9+2eehDGciFo/PkQ==
X-Gm-Gg: AfdE7ckmis6VXa0TO8yOpbtE57IP9fWWZ5/l04YdsVlrdbdPal+nBm9zaFIpRvZYE1b
	WIJp8pxA2aPAMALgHT9Mak/kmd2CVXwuh39yNaYJLG2gcQyZDalw9li4M6Nq/LONDc9THJ1d3nt
	7KCnF9fXGMZNy2kEsPVwA5v+JwFaws8mklh2ct0V9RFcsylo0pLc3oZyUVGvon3QqI/knrpwlWd
	9xHcGSsllnf0mFi/2NmyUWih2/Nw2vv8+UUyh7UAuo/RwFFKHQqizZRN036IyglWopPpuFwdp+q
	D2tTW7yfiTG+JJlPWBYyJMuSvzkXOVR0nDkPONcGntB5Lcaq4QCTGfc1dJ2CGAdA66a3kondSk8
	jpRKu1un6LqtJzO1txP7HZhVBuTvuWow4Ug408Mu/DnOd
X-Received: by 2002:a05:6a21:10e:b0:3c0:9c19:65b1 with SMTP id adf61e73a8af0-3c0bd3acfb6mr11104564637.73.1783652067234;
        Thu, 09 Jul 2026 19:54:27 -0700 (PDT)
X-Received: by 2002:a05:6a21:10e:b0:3c0:9c19:65b1 with SMTP id adf61e73a8af0-3c0bd3acfb6mr11104540637.73.1783652066768;
        Thu, 09 Jul 2026 19:54:26 -0700 (PDT)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b6596681fsm41843220c88.8.2026.07.09.19.54.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 19:54:26 -0700 (PDT)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Fri, 10 Jul 2026 08:24:03 +0530
Subject: [PATCH v2 1/2] media: iris: avoid bit depth validation for capture
 formats
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260710-qc10c_fix_and_disable_time_delta_based_rc-v2-1-701d6dfd1ac1@oss.qualcomm.com>
References: <20260710-qc10c_fix_and_disable_time_delta_based_rc-v2-0-701d6dfd1ac1@oss.qualcomm.com>
In-Reply-To: <20260710-qc10c_fix_and_disable_time_delta_based_rc-v2-0-701d6dfd1ac1@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>, stable@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783652057; l=2168;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=ZRQ0rtnnQB0Oq2dtTeQphk53sePamjzWEWuDue98Mlk=;
 b=15LLH6rKDf939RdkOMJKOw8UWOxgXGNM5upSQQzewjZB15bas81M3g0OgGdZLgTWxxN2+9OVm
 I+MoJDYRt3wDX0yx5mt73PstfhI/x/CW/Vv366LqmKLKIuKH20eFs0+
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Proofpoint-GUID: MZc3G7e70RChCTCPWPoraTMFFXmFAWLs
X-Proofpoint-ORIG-GUID: MZc3G7e70RChCTCPWPoraTMFFXmFAWLs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDAyNSBTYWx0ZWRfX3BVUYtJrN+Nt
 qb2YXxfSEsnIed1S/i2HMGSrxhuq88/ocRHscwn02cIi7ea1IYhIKNNBY67uYvdHB17IsPxOyyv
 wy8i/WRwTohE5aN9yHExP/1oGQmsDzytU6OWJxjqqkb8HD88bZnmwNz2JXfu/sVIVJekNrs0bst
 L9Ip9hsEmn9nc9MVUCbn7KEI+SdDcW0IOBkqKFva+v/xhQmymzynJ02v1n9mYwS1Ys0bWFxqrP0
 Ei6Xj1RsEOEhEER2jmHAKDzJqEusceEO4++bBa0KMI/WSLbHOmna12VLhcwyVZih2Xkd+JoOvHF
 xQrB9lk2QiYGH8QgHIV3Zf3DIKqlU9FpXDD+HQsxdmVj+0eXkbfh3QHBaDjMHmvKxEXNGAH/7mE
 vROMBcXrXqiHEMuxTrL2rHmPbPp4YXnUp+O3a0VVwTwhDnYtKsBV6wC4bNRZFG863MJ29fKDcTS
 JdGevJPkWYLgTlQnkGg==
X-Authority-Analysis: v=2.4 cv=N7MZ0W9B c=1 sm=1 tr=0 ts=6a505ee4 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=vL0Q6q4W2X9FnyRf_zQA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDAyNSBTYWx0ZWRfX+FLqUsc9piua
 O8zcbSKGk7ASX9IH4lPJS7MJLuSiYHS9x7wNj6V+WXYF0CnB1I0J9VkOabEvFqLLr9pFutM9Wlm
 Q6pOo1820M7zdzljwNzxenPtn3bZtoM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_04,2026-07-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 impostorscore=0 suspectscore=0 adultscore=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607100025
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-67220-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:vikash.garodia@oss.qualcomm.com,m:dikshita.agarwal@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:mchehab@kernel.org,m:dmitry.baryshkov@oss.qualcomm.com,m:neil.armstrong@linaro.org,m:bryan.odonoghue@linaro.org,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:busanna.reddy@oss.qualcomm.com,m:stable@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[busanna.reddy@oss.qualcomm.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[busanna.reddy@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2C406736CD7

When validating a capture format, check_format() compares the requested
pixel format against inst->fw_caps[BIT_DEPTH]. However, the bit depth
capability is not available at this stage and it contains the default
value of BIT_DEPTH_8. The actual bit depth is updated later after the
firmware reports stream capabilities through read_input_subcr_params().
Because of this, a valid client request of QC10C format request is
rejected during the initial format negotiation. The driver then falls
back to the default capture format (NV12) and stores it as capture format.
Later, when the firmware reports that the stream is 10-bit, the driver
sees NV12 as the selected capture format and switches to the default
10-bit format (P010). As a result, the original QC10C format requested
by userspace is lost and QC10C decoding cannot work correctly.
The bit depth information is not reliable during the initial format
setup, so it should not be used to validate capture formats. Remove
the bit-depth checks from check_format() and only verify that the
requested pixel format is supported. This allows the format requested
by userspace is handled correctly.

Fixes: 20c3ef4c7cae ("media: qcom: iris: vdec: update find_format to handle 8bit and 10bit formats")
Cc: stable@vger.kernel.org
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_vdec.c | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_vdec.c b/drivers/media/platform/qcom/iris/iris_vdec.c
index 9e228b70420e..7f89e745a4b1 100644
--- a/drivers/media/platform/qcom/iris/iris_vdec.c
+++ b/drivers/media/platform/qcom/iris/iris_vdec.c
@@ -95,16 +95,6 @@ static bool check_format(struct iris_inst *inst, u32 pixfmt, u32 type)
 	if (i == size)
 		return false;
 
-	if (type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE) {
-		if (iris_fmt_is_8bit(pixfmt) &&
-		    inst->fw_caps[BIT_DEPTH].value == BIT_DEPTH_10)
-			return false;
-
-		if (iris_fmt_is_10bit(pixfmt) &&
-		    inst->fw_caps[BIT_DEPTH].value != BIT_DEPTH_10)
-			return false;
-	}
-
 	return true;
 }
 

-- 
2.34.1


