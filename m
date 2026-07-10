Return-Path: <linux-media+bounces-67221-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id J1thLfteUGp5xgIAu9opvQ
	(envelope-from <linux-media+bounces-67221-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 10 Jul 2026 04:54:51 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ECF0736CDF
	for <lists+linux-media@lfdr.de>; Fri, 10 Jul 2026 04:54:51 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=fZZvbias;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=QOIW6DBI;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67221-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-media+bounces-67221-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 02E793020003
	for <lists+linux-media@lfdr.de>; Fri, 10 Jul 2026 02:54:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00C79360ED8;
	Fri, 10 Jul 2026 02:54:38 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC6DA34F497
	for <linux-media@vger.kernel.org>; Fri, 10 Jul 2026 02:54:34 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783652077; cv=none; b=AYajdjyMpFfMyTGiUiqaY2dWlzDQh/OgQDUzJBSFofAezi4EBHtL0XL1Q5Vjb6jt3h8jgJrla31kbLqNDDbVWunzs9hsNwOkyOyh0WzpachjAkxQBsFOi/0GzUblXbRIb4bBwByMMPkj1GAYFBB3ptB1/n/t/R+SgzcnbZHutow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783652077; c=relaxed/simple;
	bh=MEBwGHh5shfMGiySRPHB4uwOmtUdd9tYsv727UkgF/c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PcU/n3zojiNAiUug+l30FN++eRX27ONukuMWSOilQFaXhZHWgh+JOJiR0SGEYXPJxHIYLIajb6c8MheVXyzfNErlSaT4xib+Zl92Jl+c4lkCM9/Uee8NIy3zblQgAJYyinlKpZ9yn4tToPG3uuGUVid45GktFylSc/LkyUj58Yw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fZZvbias; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QOIW6DBI; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66A06UcW3357461
	for <linux-media@vger.kernel.org>; Fri, 10 Jul 2026 02:54:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tvU0gLu5NtfYawM0d1Vc1oj+pO8tTgyMhhGwGgUwk0s=; b=fZZvbiasVsHNNfHh
	1f3RStuiqw2kkdQBMKq3KqjOKXqgpnm9btKLATJNo/3yHoy4E0uDRoOVKh5mfmJw
	3n6NmWMLb6APIXHWYdwcrxmo9MCynQ84vXzDT9dlrsszfMeRo95KGGRH+tVZ94iR
	rH8VKwKwg96y4WuTxW1EjTuWj8ysU0yA+Z+BIgYx0tPdE+gkaKyEZRDVakNl3k7y
	B7WbGk0DHjNUVzWOeUI1pVQeRj08XZOX2ASEjcU3RXCKoYvjR2CT24LmSRGWGukH
	4iJx6oQW7vdbtjvt6WJJNovn06HvmP/HEmPdAUHHNy3oY+F+2s8ooPThL6jQQUdN
	CGt1hA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fanwe8efb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 10 Jul 2026 02:54:33 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c9d5a5b63c5so672729a12.1
        for <linux-media@vger.kernel.org>; Thu, 09 Jul 2026 19:54:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783652073; x=1784256873; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tvU0gLu5NtfYawM0d1Vc1oj+pO8tTgyMhhGwGgUwk0s=;
        b=QOIW6DBI1v94fH/yt/Fnnzty+cxO8+fiu+dVMqoEQq4Zi5wNj0LLXLC3IAnCyoXJ9X
         B1wudNotXJBiAuDMVAjJ5uE9EyQ9D9ZUzOfWSmszbHeoDDR/Py/ve4G+Aej33GKE9ww1
         YwsA7sn9WYxqAwxAANnMAh4My+ccfm+ImfbKtLtlxTMe01Y4IF0Op0z7RQnYB65yxk6v
         ROjGcwtfHc0D+AjF6XlIiFizcGj65/ndY6A5fxdZqyVpYREsw8ovXcYoTUN2D3RzbGdx
         LtLgcIlOEFVr0s9S4unl6Ifn9aReKdaUW4KHSQgsAY3PnpLVSAnDLsDScZmhgryB/l6p
         R5bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783652073; x=1784256873;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tvU0gLu5NtfYawM0d1Vc1oj+pO8tTgyMhhGwGgUwk0s=;
        b=LcFV/7KKUCbaXQyaQ7w8a64NQ4uCtGDY9iwCXeQVRkp7nspn++Bk2qZF+HJTjbPuhE
         jtz9ZRNMm9dlF+Enq77LdUCeW/KULLdP8+0qsd4ifaDABKwaRxI2i4NMSEbIVvWn8l7U
         e5VXcz6jM2rU115n0zt0PjMctWXUXNy0B6OqiBqRjsdPfdRRAJubFLX1pWI2ZnXk4USm
         xeocHB/T5fNaTzdKpAbMSrTwctRhzzIuD/tpoyY1dIGAu07j+8Dv44qWE9j/to61BpY6
         /W4mUH3sBpe14hn2d7A6wBpE7FjD69MyRSr9W/gvDgHWbQYbfuL7dPIFEAvj0try8YD5
         4u6Q==
X-Forwarded-Encrypted: i=1; AHgh+RrPGi2wpafkQVUWbS2d+ioltxZWG7r3i+wnufPtCIIGi18za/9Na8SjcIRFkDa/DXL9QVXqKR7Zy/xbqQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/5gAD+Ph9uiuxMXDwOsEdkyaIFgix8EygPhCq7ybSSTMQKXZN
	CcWlb4Vo5idRbM06MJPVRfZVmv1fzQBmhz9KK2At4icbaa9riQB5Lj1/e5AdIRRWiZ5+pCGesZE
	jULmwMR+r6fShp4jQOeApyMzBioz6eAbOIvTXathdL0EGTzKE5YoNXjKvZiFizUX1mQ==
X-Gm-Gg: AfdE7cm2zILYenOvoDDlhpTDYtchWghUky99H1erT+gzB233VMXPIsLWBYtDdwkJkYC
	x1LcwYG/uo16qJTxWWkiEECO8LUZZZAApBV3+sbxIqohQK4nRhYi2ycALuyODv1wy6niBnuWKRH
	vJKlqJOSAZrLSYlDUy9G4iOR1BRmKSWznnmkXjtRGfazAmJaSjJRlEoYUPp6hHAxxaBx+AOenwB
	wOOM/aKG4NPpIwNmSkTuwtqwynLvQyZqY2vEJplEwYK0LZltWpf4tVHxSJadF7zQVwLI8L51UT7
	PaVBU8ErEuJKmBTr08BRquZb7nC7B59tPXsV6fdGP5eFah/xncrWaPI0iTJM5LCdyBfSRt7df+P
	nhKxXxpXTYuNDxL9xHRy6WAAoqkntxWXJVuS5UBUtnRPl
X-Received: by 2002:a05:6300:2213:b0:3bf:96c6:78c3 with SMTP id adf61e73a8af0-3c0bce12e48mr11372046637.8.1783652073282;
        Thu, 09 Jul 2026 19:54:33 -0700 (PDT)
X-Received: by 2002:a05:6300:2213:b0:3bf:96c6:78c3 with SMTP id adf61e73a8af0-3c0bce12e48mr11372014637.8.1783652072839;
        Thu, 09 Jul 2026 19:54:32 -0700 (PDT)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b6596681fsm41843220c88.8.2026.07.09.19.54.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 19:54:32 -0700 (PDT)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Fri, 10 Jul 2026 08:24:04 +0530
Subject: [PATCH v2 2/2] media: iris: disable time-delta-based rate control
 for VBR
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260710-qc10c_fix_and_disable_time_delta_based_rc-v2-2-701d6dfd1ac1@oss.qualcomm.com>
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
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Gourav Kumar <gouravk@qti.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783652057; l=5482;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=BMyHsCiT9ByjdqGA2vs2QiGF98DTl5t2krsngpviyHc=;
 b=kNZ2IYBzxGQSVCu23sWRnw0pUBWD5MYkOCD0bW7qkT510lp3GLwtR7Lwdn1q4PfGYLDPsUK29
 gQcWkLY154+D2+2KKkaGDDvrgYUVzlUZRPS9aMWkN7NP1ZlRJ+NsYvf
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Authority-Analysis: v=2.4 cv=LbIMLDfi c=1 sm=1 tr=0 ts=6a505ee9 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=hCni5AK2fHxqBZM7pzMA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDAyNCBTYWx0ZWRfXwblxAY17QEVj
 5tmqKhRx/wrIwWZmuHN+K46rqKuzyGTCQfvz0A/XPiGcGwIYPK0kmf6sfLye9NCVrQQDntUQxZ2
 2F3yBBRyAAtf31MeuAD0uRJ0mj123I3DWnmCPzqKmZyJVM8DyjfUtApi7CUvhVZL0tc9Md7VXxB
 BoD1jnA0ZsJtdhMEx/93KYEpopxD9eZEgdJnN6y8GeOlhXJHAs9vH3VdRSRlWT+xXrmJc2jnkl8
 GaEto0PV1gYZcO6czt8UCUP2DBGqWNpuY7Tn+jRdLnuVN6cM9DoYFP3CeogFEBAJOrwRwEsaAf1
 pyoqKXw5b7domE075wU/Ey8UJWSNwygn4tSSOoJACLzfCvbtDUU0KiPi7yDbIwI6/+uPf1zsEx2
 HEvw0SjnxzlUriK4oI356JYm2iHE1RwYsgbHaks3xvk5mlh6Y1jPRqgCe9h7CM9ScRNVW5vu1ya
 +x65a8bLTj19/sI6NDg==
X-Proofpoint-ORIG-GUID: 92vj6Nt3uUz8oi8Ppf8ZtMySkC1uFFD4
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDAyNCBTYWx0ZWRfX1sisMvlWUQmK
 dsjlRcSscQxvZmnYfW/G4LdXzJ4qtbxWmW0VMfGN8JZR7339sCGQOQMdByGmKxh0PP8z3B+0M9w
 fCqpIFzQ+WYhlWYusDaIAh+bH1cMjG0=
X-Proofpoint-GUID: 92vj6Nt3uUz8oi8Ppf8ZtMySkC1uFFD4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_04,2026-07-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0
 clxscore=1015 impostorscore=0 priorityscore=1501 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607100024
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-67221-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:vikash.garodia@oss.qualcomm.com,m:dikshita.agarwal@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:mchehab@kernel.org,m:dmitry.baryshkov@oss.qualcomm.com,m:neil.armstrong@linaro.org,m:bryan.odonoghue@linaro.org,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:busanna.reddy@oss.qualcomm.com,m:gouravk@qti.qualcomm.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[busanna.reddy@oss.qualcomm.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
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
X-Rspamd-Queue-Id: 5ECF0736CDF

From: Gourav Kumar <gouravk@qti.qualcomm.com>

The iris encoder driver was not sending
HFI_PROP_TIME_DELTA_BASED_RATE_CONTROL to the firmware during encoder
initialization. Without this property, the firmware defaults to
time-delta-based rate control (enabled), which calculates the output
bitrate from actual frame timing rather than following the configured
bitrate target.
This caused variable bitrate (VBR) encoding to produce ~5x configured
bitrate. For example, with video_bitrate=896000 (896 Kbps), the output
is ~4.4 Mbps instead of the expected ~896 Kbps.
Time-delta-based rate control is designed for variable frame rate (VFR)
scenarios where the encoder adapts to actual frame timing. However, when
an application explicitly configures a bitrate target, the firmware must
follow that target regardless of frame timing.
Fix this by adding the TIME_DELTA_BASED_RC capability with a default value
of 0 (disabled) and sending HFI_PROP_TIME_DELTA_BASED_RATE_CONTROL = 0 to
the firmware during stream-on, allowing the firmware to use the configured
bitrate as the target.

Signed-off-by: Gourav Kumar <gouravk@qti.qualcomm.com>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_ctrls.c         | 19 +++++++++++++++++++
 drivers/media/platform/qcom/iris/iris_ctrls.h         |  1 +
 drivers/media/platform/qcom/iris/iris_hfi_gen2.c      | 10 ++++++++++
 .../media/platform/qcom/iris/iris_hfi_gen2_defines.h  |  1 +
 .../media/platform/qcom/iris/iris_platform_common.h   |  1 +
 5 files changed, 32 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.c b/drivers/media/platform/qcom/iris/iris_ctrls.c
index 10e33b8a73f6..f6136e655b98 100644
--- a/drivers/media/platform/qcom/iris/iris_ctrls.c
+++ b/drivers/media/platform/qcom/iris/iris_ctrls.c
@@ -1477,6 +1477,25 @@ int iris_set_layer_bitrate(struct iris_inst *inst, enum platform_inst_fw_cap_typ
 					     &bitrate, sizeof(u32));
 }
 
+int iris_set_time_delta_based_rc(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
+{
+	const struct iris_hfi_session_ops *hfi_ops = inst->hfi_session_ops;
+	u32 hfi_id = inst->fw_caps[cap_id].hfi_id;
+	u32 value = inst->fw_caps[cap_id].value;
+
+	/*
+	 * Disable time-delta-based rate control (value = 0).
+	 * This overrides the firmware's default (enabled), ensuring the
+	 * firmware uses the configured bitrate target rather than calculating
+	 * bitrate from frame timing.
+	 */
+	return hfi_ops->session_set_property(inst, hfi_id,
+					     HFI_HOST_FLAGS_NONE,
+					     iris_get_port_info(inst, cap_id),
+					     HFI_PAYLOAD_U32,
+					     &value, sizeof(u32));
+}
+
 int iris_set_properties(struct iris_inst *inst, u32 plane)
 {
 	const struct iris_hfi_session_ops *hfi_ops = inst->hfi_session_ops;
diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.h b/drivers/media/platform/qcom/iris/iris_ctrls.h
index 3c462ec9190b..10e046722ad3 100644
--- a/drivers/media/platform/qcom/iris/iris_ctrls.h
+++ b/drivers/media/platform/qcom/iris/iris_ctrls.h
@@ -47,6 +47,7 @@ int iris_set_layer_type(struct iris_inst *inst, enum platform_inst_fw_cap_type c
 int iris_set_layer_count_gen1(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
 int iris_set_layer_count_gen2(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
 int iris_set_layer_bitrate(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
+int iris_set_time_delta_based_rc(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
 int iris_set_properties(struct iris_inst *inst, u32 plane);
 
 #endif
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2.c
index acc0ed8adda1..d119ad599c31 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2.c
@@ -416,6 +416,16 @@ static const struct platform_inst_fw_cap inst_fw_cap_sm8550_enc[] = {
 		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
 		.set = iris_set_bitrate_mode_gen2,
 	},
+	{
+		.cap_id = TIME_DELTA_BASED_RC,
+		.min = 0,
+		.max = 1,
+		.step_or_mask = 1,
+		.value = 0,
+		.hfi_id = HFI_PROP_TIME_DELTA_BASED_RATE_CONTROL,
+		.flags = CAP_FLAG_OUTPUT_PORT,
+		.set = iris_set_time_delta_based_rc,
+	},
 	{
 		.cap_id = FRAME_SKIP_MODE,
 		.min = V4L2_MPEG_VIDEO_FRAME_SKIP_MODE_DISABLED,
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h b/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
index 776b21cd11b2..8766d9e49611 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
@@ -67,6 +67,7 @@ enum hfi_rate_control {
 };
 
 #define HFI_PROP_RATE_CONTROL			0x0300012a
+#define HFI_PROP_TIME_DELTA_BASED_RATE_CONTROL	0x0300012b
 #define HFI_PROP_QP_PACKED			0x0300012e
 #define HFI_PROP_MIN_QP_PACKED			0x0300012f
 #define HFI_PROP_MAX_QP_PACKED			0x03000130
diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index c9256f2323dc..99dc6d5c72ba 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -183,6 +183,7 @@ enum platform_inst_fw_cap_type {
 	LAYER3_BITRATE_HEVC,
 	LAYER4_BITRATE_HEVC,
 	LAYER5_BITRATE_HEVC,
+	TIME_DELTA_BASED_RC,
 	INST_FW_CAP_MAX,
 };
 

-- 
2.34.1


