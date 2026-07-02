Return-Path: <linux-media+bounces-66337-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id TxDkHxdERmq7NAsAu9opvQ
	(envelope-from <linux-media+bounces-66337-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 02 Jul 2026 12:57:27 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E4256F64B6
	for <lists+linux-media@lfdr.de>; Thu, 02 Jul 2026 12:57:27 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=I3J033CV;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=GiMYjv55;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66337-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-media+bounces-66337-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B455F304459E
	for <lists+linux-media@lfdr.de>; Thu,  2 Jul 2026 10:52:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B66A3D410D;
	Thu,  2 Jul 2026 10:52:27 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D9A23C872C
	for <linux-media@vger.kernel.org>; Thu,  2 Jul 2026 10:52:25 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782989546; cv=none; b=FyOUoK8Y1rOADqFnIc25NTy0VvnYuwpdhDzLOu2tXegW6+e36qqQAbvPe9GccuyM66t5a8xAjP3IS2RV7FjBZw274AsA2x+a5yyyYNN4aU6J5SYn48mjeTbJiYZu9P9GycQ1vxZPDlbQL6VUn0KPVIP6XYY3hGFWiYSOTGgvdrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782989546; c=relaxed/simple;
	bh=lTzm+RHkW9j177LvbtPEKP5emH9PUg+jTyZyRS3hmUs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=UHtRYbb39gb8Tg1tl75ySFKSxxOHHqiWiArdhA6e8Fm28wvPplPE+Gqx5c4Vapk/rj73iqvH9teJiBtmCXM25pVgIPXetYU5jhri+1fRuJ+6o/S9IO2ZlHqNidMJUuKZkXcZAGZtt9PLJSU3r8rg4+GyGEy83nvSzPxTtz0uEEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=I3J033CV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GiMYjv55; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6624lmd33485918
	for <linux-media@vger.kernel.org>; Thu, 2 Jul 2026 10:52:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=ZgKTpRlFAg6nA6UXLmxi6T
	8YEFQ0w9nVSTQgPrPz3Zw=; b=I3J033CV93bLmkY1qKWANIpHPZVOOrGFaCp6+G
	aI1YhdeV7HsbDGmW2wj23cMta0jYOFP/tzpvRntfBTf7gTEGOV2elhsdlSYzJbO4
	F7u4iRNulPizWvyFNxgYOtaLfhGxbvHanuK80BStXmHqjZmYOvoS+fPZyEb/zRWO
	6/i+vAZCWC4QE3md0fpEM7/v/V8uW+julHSAlnobH6938mDymfuNbwG0KsOc9tMV
	ay2sr1VWgej29l5Ne9SqEpIaEOh6Xc2b83XBW/edqwIofaMl1FdQHZHtBzfRaA3I
	ZkL9EKvwbpIB7S56fFApB5hkhJbPRFmjF4t3kPiNYJU/RqCw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5h98h9r9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 02 Jul 2026 10:52:24 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e59b0e0f4so131203085a.1
        for <linux-media@vger.kernel.org>; Thu, 02 Jul 2026 03:52:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782989544; x=1783594344; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZgKTpRlFAg6nA6UXLmxi6T8YEFQ0w9nVSTQgPrPz3Zw=;
        b=GiMYjv55ggLHOPU1s5sxvLsNJGwnCVKqSvAwbVcUH8U9/gfVuNPS5CRXIhzEqws6NK
         H5KO1ufVd7ViO9dqkFG9F2hN1YrLpGKqM/eNMcrEBDCft5tSCt9oZSDzWZhVTI89PF6N
         uc5FoAQ2UC00kj/cR+BfBfLb1zy3ywvxdTYywfVVOhBSgp6u+yhXInqCg8n9wFVJqG27
         ftuLVjE2TtxUwb9TrM9Fl8miW6ll26xdrY/pDNUPevbvxxoktdEo1giJQRwUTN2J4kGA
         mp7bz+dRUFVdsDos8Be2Ldzj+SfQW1oWMHH7Y3bbxwc+hybB8MmX0JoPQiR8zID1InRO
         /puw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782989544; x=1783594344;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZgKTpRlFAg6nA6UXLmxi6T8YEFQ0w9nVSTQgPrPz3Zw=;
        b=m08ooaGs4wF7ywSXD/aw4bmLTc+aMwh0YMLAZPwtfJvPLZfLfn5Ns1IlZR6Z1b386Y
         sAL8W0PbHVxub824iM9RpwEP9E4ML8SfEnKUfSTtettawnH/5AaUBkw5cmRCznHndfIN
         sDy6WUTBWMhBac7K/7qvpJkIwyXXCpIIEvaErbtbefeQvIe7hz/lln9Wz1YsXTuS9Bw8
         kM+pTpVTbcUBIbKhGqaRjsTTm5byh1zl6LPacXWsUZs3fytufCYN196IuVvoyGkQj4TZ
         hSWBtECy4GBSRSRyKXScXW+I54deU3EIF0i+miOPYPREU/ZXoOQ1uKoPZ90uKTknYKqV
         1aEw==
X-Gm-Message-State: AOJu0YzQuWAqLl3MY7MQwSL1pOcV946m6JqyGABkwmlhNXmdACNtss+H
	YvFvzG6ZKnf3NVd1hFA//pslTIcu6cF1zMtcCq+xzwTiba1bM+2D3OB9TkhBAGz7ZG/QXZLoMDB
	GoB61cC0LkewHm7hOKuC0vmSOYAOzgrAXrRMrwOEPigqTJO20pU2dfMzzG2uMs4I+wQ==
X-Gm-Gg: AfdE7cldV54+5s73pratx9nLjCYTzelSEdbTL+5MHV+HFBE2z6LcwuL2w+K1pUhGBkO
	/+FderhHwNg3WYANQowY3iZHKOg6NVRTYhu+FRApwq4hII7HDppBpzIgYL94E5/M++kiudxfwRm
	Gjv5sXCIKx1wn1PMW5rq4EP2xW7VZdIhqIXzBZiu38LxR2NaHyyLYmbibKJfGMI0X2jffSjvhGr
	TGEm28eFbpOkHjNMWv5topIGNWQKicwdSO3S2//eyf1mmFmxCa1raqes5Z/CWWYCS2/yWb+/wgW
	B2Zgk0VO7cTBC4Ziy1b0zOXnpCXkSMNZ0NetAA4s75xYOoWwqjE8ubOQSyzpAdk/5w/wjnc6mIQ
	3vP01UJMCzpL3XiC9O8uh6C/OYKcs/COZ9xUu6DzHlAymrrH8T6+Cstu5FX0aDeZ0KnEXkHix3B
	S8u0E=
X-Received: by 2002:a05:620a:46ab:b0:928:f440:2dc7 with SMTP id af79cd13be357-92e7b3e8706mr613628085a.35.1782989543614;
        Thu, 02 Jul 2026 03:52:23 -0700 (PDT)
X-Received: by 2002:a05:620a:46ab:b0:928:f440:2dc7 with SMTP id af79cd13be357-92e7b3e8706mr613625185a.35.1782989543084;
        Thu, 02 Jul 2026 03:52:23 -0700 (PDT)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-92e80025696sm193565185a.19.2026.07.02.03.52.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 03:52:22 -0700 (PDT)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Subject: [PATCH v2 0/3] media: i2c: Add OmniVision OG0VA1B camera sensor
 driver
Date: Thu, 02 Jul 2026 18:52:05 +0800
Message-Id: <20260702-og0va1b-v2-0-0071442caa2a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANVCRmoC/2WMQQ6CMBBFr0Jmbcm0BERX3sOw6LQFJhGqrTYa0
 rtb2br5yft5eRtEF9hFOFcbBJc4sl8LqEMFZtbr5ATbwqBQddjJXvgJk5Yk2pZobIwmQgfFvgc
 38nsvXYfCM8enD589nOTv/W8kKVBYq4+SqG8QTxcfY/146Zvxy1KXgSHn/AUKqvjQpQAAAA==
X-Change-ID: 20260618-og0va1b-55bbf3cabb0e
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782989539; l=1179;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=lTzm+RHkW9j177LvbtPEKP5emH9PUg+jTyZyRS3hmUs=;
 b=3x2O8GvcvVPCfOnIVSOPLJxugXBxm9ekz2Cxj4c9ogQNIuJ3jDs7gEQ3lLpkOmXDuUF5zbm1N
 +U1Loz8hpGvC4HYPqWace2Eajx/0ZvzSZQ7jChcL18KOHKJToo5BJzz
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Proofpoint-ORIG-GUID: ZMRGKA-FXe7hiQhH-hKwSJKUU8HJpQYr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDExMiBTYWx0ZWRfX+h3PUkxTZydM
 HObY535Nd/wa07BQj7AQGxWzQhKUV/4B7u1xQIQ3R+cKDYCQeYdyDWKZbDuYTb0wqDwYvs0ntn6
 LGXoCO4+/tp3Ji+Xwb8GfbBLBtNE9ql4oSfpvDFJWbXr7UCiPYU3VObUJ9c/VhHrj61ntQUf7rT
 zp7pMJvv/7Glt9M9m6SZGaLrsaF0UR7jQPtOCLOwMTSdkRWBphM9IketFbBbRX1rORQXE9+6tGg
 o0g959GXb58ymb+JmPcu2e2pSkCWyYC5a6GIIxW8+RwTVtLGc6e5sdluL4cH783yt72h4rR1F75
 gbe4CONJYEBZ7XInJDy8XGXusV72jWjCC2Ai9+P2Vkgbc0kvdG5+xESACCb1w1fdwd7xFz8ZCjc
 THaz9F0Fr1s8pHYiwLNYh2RqEXI4X5W4SVE4CCj1IgL62OTxFMfa6uUzgNMS+xHPqB8QmFnW3k+
 i+0WLE+9qyfFBhESpgw==
X-Proofpoint-GUID: ZMRGKA-FXe7hiQhH-hKwSJKUU8HJpQYr
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDExMiBTYWx0ZWRfX/rfxyy8Tb3mP
 +n+JbEcXKjEdvqHPCjaapZbjWWWA7VgPzn4UpOw2Vzg9TKoOmMqCeHDsVo3SW6TUa/5ib9a2pP/
 DBJk7/6Rc3YU2olKxLTY6d/Uh8cOm2A=
X-Authority-Analysis: v=2.4 cv=bdFbluPB c=1 sm=1 tr=0 ts=6a4642e8 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=ah3Ldef652LsWuxVMjIA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0
 priorityscore=1501 malwarescore=0 impostorscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020112
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-66337-lists,linux-media=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email];
	FORGED_RECIPIENTS(0.00)[m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:sakari.ailus@linux.intel.com,m:vladimir.zapolskiy@linaro.org,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:wenmeng.liu@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[wenmeng.liu@oss.qualcomm.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wenmeng.liu@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2E4256F64B6

Add OmniVision OG0VA1B driver support. The OmniVision OG0VA1B is a
1/10-inch monochrome CMOS VGA image sensor. It outputs 10-bit raw (Y10)
frames at up to 640x480 resolution over a single-lane MIPI CSI-2
interface and is controlled via an I2C-compatible SCCB bus.

This driver has been verified on the Purwa EVK.

Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
---
Changes in v2:
- Integrate OG0VA1B into the existing og0ve1b driver and binding
instead. -- Vladimir
- Link to v1: https://lore.kernel.org/r/20260618-og0va1b-v1-0-dda71bb83009@oss.qualcomm.com

---
Wenmeng Liu (3):
      dt-bindings: media: i2c: og0ve1b: Add OmniVision OG0VA1B camera sensor
      media: i2c: og0ve1b: Introduce per-sensor data structure
      media: i2c: og0ve1b: Add support for OmniVision OG0VA1B

 .../bindings/media/i2c/ovti,og0ve1b.yaml           |   4 +-
 drivers/media/i2c/og0ve1b.c                        | 333 ++++++++++++++++++---
 2 files changed, 299 insertions(+), 38 deletions(-)
---
base-commit: 4f441960e691d37c880d2cc004de06bb5b6bd5e4
change-id: 20260618-og0va1b-55bbf3cabb0e

Best regards,
-- 
Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>


