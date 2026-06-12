Return-Path: <linux-media+bounces-64668-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id /gZFGRnRK2psFgQAu9opvQ
	(envelope-from <linux-media+bounces-64668-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 12 Jun 2026 11:27:53 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id CE21467841E
	for <lists+linux-media@lfdr.de>; Fri, 12 Jun 2026 11:27:52 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="TtFz/sja";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=FIoMUkGh;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64668-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-64668-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 09EFD318E64E
	for <lists+linux-media@lfdr.de>; Fri, 12 Jun 2026 09:26:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35E4D3A4267;
	Fri, 12 Jun 2026 09:26:01 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8F2439DBD0
	for <linux-media@vger.kernel.org>; Fri, 12 Jun 2026 09:25:58 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781256360; cv=none; b=TL/JFKphTvNM8eD1Ej8zyyvd6MRiPjidicEeAo24VVIy4Qj+bAYwrz3xLDkysKIjhABoAVR32U7+BP+wgDFC7uGrSkEpv0i0q6S7F7G2aP+1S3RJ/PXsqE22DdPlfyTLs3K5CJrfTSggZvLVI8CfB4TZXDKoAjz/6UdaBxciGvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781256360; c=relaxed/simple;
	bh=8QoTp3WESlHjz0HtjADLefp60LQ9X+szvJ8mIzieMHw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qjlN0iOWCt7vJNns3SLBliJBY+usxZ1Vq8KBT1T8reciUxyMVouH9Yc/fyyc8FB3FtWR1X+UV/qXKUe5sohDJU0kl3Maa3n9NvCmB5fULTnQvkxzujDHs9HOZaPT147NrywE4/RgZIaTG9pem9tpaeaF3v1ZYL8CU0YdTAIYjuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TtFz/sja; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FIoMUkGh; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65C39ZbI940563
	for <linux-media@vger.kernel.org>; Fri, 12 Jun 2026 09:25:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kHsj9KW0wACdSEHR+duy/C4FIe+uMWCS7zjU8xpxO8E=; b=TtFz/sjaRLim639B
	wxn1Xao0kJok9evbr2IrT6hWwQ8NDtY/korSWSGUZqFKpDHLVXD/55zcxWawqQ2B
	PhJqJ9u9vJM63pFq2mkfEkm+AuCaxDqvd8lzhmQhdg8aVWygIWKLbluuKrMo4t1t
	dm2frt0yWCgwtW+NCabHqEIvEhTlz6SPRmtg48FvrINS9Sf98Ol+WeeYS6+e5cRe
	PAhu4BG+P778/5knDIRdddIDboCV2JAmPXD7yEAVPL9Svy3VoGE+lE+KSKlNoDEK
	7LStQUzzprAFWe0S3Q6lMRapvEA9qOwMUa4ANEu8qp+ggugXl3pVI2mxVN+hBj50
	I7TriQ==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4er014kb6n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 12 Jun 2026 09:25:58 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-6cf9627010bso791450137.2
        for <linux-media@vger.kernel.org>; Fri, 12 Jun 2026 02:25:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781256357; x=1781861157; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kHsj9KW0wACdSEHR+duy/C4FIe+uMWCS7zjU8xpxO8E=;
        b=FIoMUkGhXbV2f2kFuIP1jWiZWnETQvC99W5jjBp/fT/HBbilrG9KiUp7GIxi8WSbWY
         nyB/BAQO2ujnFWXXOAfevqel8dqiiVbylDtFjTBdt5x8S+0e09nhloEJuqJvSTb1NZwc
         7vzaii4zwlgKK7F6h4RKGXSU1SBN2/q8CoGWbMR/ThKb+/KhhQfRiJcbeCUk3Mcl1xR6
         OGC9y1sRrSoJHdwZFdl5YXFypRRka1hFulSFNi35QMbRvio8lcioDJzM/BxBGt5+pVQK
         3DAFfJRF4nXxAQjWx0E/kpGgXqACONOHx8N5OoURFRJGMjJAagt3HUTfXJ0Rgho2dri0
         ZHxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781256357; x=1781861157;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kHsj9KW0wACdSEHR+duy/C4FIe+uMWCS7zjU8xpxO8E=;
        b=tJ+ctC5X8xqsKlyJVfl1oQ5yxXPLaO2NgsFKyLol4i2oPGjAANw8Uy+z1hoawO2XM3
         fEnRCOGvww/NqbLgNHPUjl1JGo3HPwNUTWRSbCOxsEko0do1js97xi2hqvrd67HEbkT4
         gFUa2y0ZTuWHCtg3tbblgxytW8J+71aTIvM9GXSGZA1iWQvx/THAZCz2X6JkrB+DliI7
         +C7K3teEJw3VHcC1nowT5YlBGvBZzsGk5wC5LBUkKjCMIaZEgrFpxBCl/BlCHLZylTSA
         EW367j8oEYS7me3sVZ4q27nOjGRMBTpQ09BtIretuUPX4Ssi/gt7tXW1fq1x/YHeqRms
         xe9Q==
X-Gm-Message-State: AOJu0YxbpxKEIOHTQCvD/pAsLo3bQphOqzbFpRsjaitKp8D8cl0LpNcZ
	MFEr4TNFXohDIpJxqwlFNMph2tlGdKkIH08jtAcjLVcOmEht5FDy8AbvssCpc+f+UQ80vCSWsaw
	rzmit1Fel8Y/4WgXsuGxac879x5+h17dTQkAR7NRM3XBexnG71R7VJmdr65z/sub97A==
X-Gm-Gg: Acq92OHafJYrPKMp1vBYPqXQtpGiyn7ZG7DkjZfO2ERz1mHPb7Esrxj5mc42tHjGCg2
	5M8TRlVM8kBQcYfnRnfPwvWSUMhTLWJr7dwOIz/z4BjQKT02JBVKBranlgkEW7XOnjN2RWQHk5i
	2fDDd3VJlgSjfEpAl18axeGZXW+yaSPhu4PZIup1Fs1Wf2qLU1TgnUeISToFKU1l2E815js7kjb
	rWl+pi6/UkWROhO0QH4eExUc+X+I8jQ2XRk00dKQsmgsMTiSwI6NPohyVjbTIzfPNO3BM/z0kDy
	GiMpkGkdFWXzDnNsIKnsJ8Ou53XwlhpEaNIU+sYc/QT6EPfukx1WNbUwQ8x4JOsJoteuJVdqhGA
	7xZx4AYfCuGQEm1KLf7IdCZbFrNFdRiamouR15bl9ftwwyOoeDk+G8qPu89S1judq7LcWgOrWe9
	1OE9zzaQSJ5R2s9HoZE/0Cyj+JLaN6k+bNaYs=
X-Received: by 2002:a05:6102:3582:b0:62f:2d6f:cc11 with SMTP id ada2fe7eead31-71e88ad70f7mr1009442137.2.1781256356862;
        Fri, 12 Jun 2026 02:25:56 -0700 (PDT)
X-Received: by 2002:a05:6102:3582:b0:62f:2d6f:cc11 with SMTP id ada2fe7eead31-71e88ad70f7mr1009423137.2.1781256356431;
        Fri, 12 Jun 2026 02:25:56 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39929f190ddsm4560191fa.19.2026.06.12.02.25.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 02:25:55 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 12 Jun 2026 12:25:38 +0300
Subject: [PATCH v4 06/16] media: iris: Add platform data field for watchdog
 interrupt mask
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260612-iris-ar50lt-v4-6-0abfb74d5b3c@oss.qualcomm.com>
References: <20260612-iris-ar50lt-v4-0-0abfb74d5b3c@oss.qualcomm.com>
In-Reply-To: <20260612-iris-ar50lt-v4-0-0abfb74d5b3c@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6463;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=HyLhNzDH8iJsyixGhN+Kz8MQMgeK/r9IohhV2Hc9QBQ=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqK9CPdiJbGDuZkFtSOHtqO/38H8WydEO5oTzYT
 7dft4b/f4GJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaivQjwAKCRCLPIo+Aiko
 1Q+DB/9jUdGAMVnY8RXQo31nk/YZKbOISV9ExV9pQXneN9ZIv5OU2dfK3NL08RW2orVz2KcWO3F
 xuqUCOSq5uX+JSa+12UBz48Vau69g6GnOIdGXahnxN+r3/1Mjc5ZWXX8zhTOp39IWV8zQZNSWjX
 s0bUQ7pX79TMEIbsml/Q3o7cSB7wapPqUSn8rd7i0i23ygKoagZH8VjePnM+gMGML1QGKgkm+8w
 13caPGXE0ustdF9kfJJk1GRo/Lwcu8r3p4jgYlJF6wC+sBmN6/9nRJJuCIqL20TxUnALi1ZtEhZ
 /3H1he4DOefV7DrkUo/P7WdGUxgz4pOOT08aBbE4owZJjjsm
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: 4Tl5pLPOhqvglLaM9WUiFMKXvd4Xb8KA
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjEyMDA4NCBTYWx0ZWRfXy+5SoKlOkC66
 Sz7SAm1phjApQ+RE4jwTG2ZYiM5aGAv1ZDBs4uSoT3q4OMOu5EJFJzYXimf14N2Ywr2AJJsGhrZ
 tzwxjZMjutEHcVUTDmjQq7zZvCwg0bc=
X-Authority-Analysis: v=2.4 cv=Qp9uG1yd c=1 sm=1 tr=0 ts=6a2bd0a6 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=kEHwHBA7O1j3tG1WbfwA:9 a=QEXdDO2ut3YA:10 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEyMDA4NCBTYWx0ZWRfX+ANszdr9eqgz
 eX/3PkZPxTln++S7KI4G+8ryY0B0fa+GWWAtR7RpWVLNQMwHQ5jqYsjJK0becksISBfvjcZ2RgT
 /EYaCfYVY9eQBVt1GqMKxo9lX8zehoPI/qLOIr+3/FnSLK9B2QOrJ+bHP5zBUNQEhNBCQ5sAsZa
 LmwBLcxDM3Y14qj2BIqV5qlgjhGzeqSGr2NdVyRmb9RfbGcRlrsW8Nl7w1mXWJheVj3YDAt9LEs
 Xzwl4npFw+oE89fc43ZJspNCgKIHtbYPeKQHugg2rmEYhOzsvQQJmlc+z/smrwV2HRORgJN6GpB
 Oxf9S0MwA0z5CasPLNSSWS/XgNIlgu0fLA4Vg6iY6kfudFlZkniLdsldMKfNNLXw+DYD/nqJt1R
 FUrtvlieY9RIuvd1yrVBkN+Z/JuGqah0IL73VCXUhOVoGTMjYOvS7ei2OIlPtOWiXwtirCTXgtl
 cFzahcXwYgccecBlLSQ==
X-Proofpoint-ORIG-GUID: 4Tl5pLPOhqvglLaM9WUiFMKXvd4Xb8KA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-12_01,2026-06-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0
 priorityscore=1501 phishscore=0 adultscore=0 bulkscore=0 clxscore=1015
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606120084
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-64668-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:vikash.garodia@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:mchehab@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:busanna.reddy@oss.qualcomm.com,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:dikshita.agarwal@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CE21467841E

From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>

For AR50LT core, the value of WRAPPER_INTR_STATUS_A2HWD_BMASK differs
from the currently supported VPUs. In preparation for adding AR50LT
support in subsequent patches, introduce a platform data field,
wd_intr_mask, to capture the watchdog interrupt bitmask per platform.

Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_platform_common.h      | 1 +
 drivers/media/platform/qcom/iris/iris_platform_vpu2.c        | 4 ++++
 drivers/media/platform/qcom/iris/iris_platform_vpu3x.c       | 6 ++++++
 drivers/media/platform/qcom/iris/iris_vpu_common.c           | 8 +++++---
 drivers/media/platform/qcom/iris/iris_vpu_register_defines.h | 1 -
 5 files changed, 16 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index 55a4fa356985..81fcb2854772 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -315,6 +315,7 @@ struct iris_platform_data {
 	u32 tz_cp_config_data_size;
 	u32 num_vpp_pipe;
 	bool no_aon;
+	u32 wd_intr_mask;
 	u32 max_session_count;
 	/* max number of macroblocks per frame supported */
 	u32 max_core_mbpf;
diff --git a/drivers/media/platform/qcom/iris/iris_platform_vpu2.c b/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
index 961dce2e6aa9..eeef453c583f 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
@@ -16,6 +16,8 @@
 #include "iris_platform_sc7280.h"
 #include "iris_platform_sm8250.h"
 
+#define WRAPPER_INTR_STATUS_A2HWD_BMSK		BIT(3)
+
 static const struct iris_firmware_desc iris_vpu20_p1_gen1_desc = {
 	.firmware_data = &iris_hfi_gen1_data,
 	.get_vpu_buffer_size = iris_vpu_buf_size,
@@ -94,6 +96,7 @@ const struct iris_platform_data sc7280_data = {
 	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_vpu2),
 	.num_vpp_pipe = 1,
 	.no_aon = true,
+	.wd_intr_mask = WRAPPER_INTR_STATUS_A2HWD_BMSK,
 	.max_session_count = 16,
 	.max_core_mbpf = 4096 * 2176 / 256 * 2 + 1920 * 1088 / 256,
 	/* max spec for SC7280 is 4096x2176@60fps */
@@ -124,6 +127,7 @@ const struct iris_platform_data sm8250_data = {
 	.tz_cp_config_data = tz_cp_config_vpu2,
 	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_vpu2),
 	.num_vpp_pipe = 4,
+	.wd_intr_mask = WRAPPER_INTR_STATUS_A2HWD_BMSK,
 	.max_session_count = 16,
 	.max_core_mbpf = NUM_MBS_8K,
 	.max_core_mbps = ((7680 * 4320) / 256) * 60,
diff --git a/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c b/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c
index 74626b35d9cb..261db38a013b 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c
@@ -18,6 +18,8 @@
 #include "iris_platform_sm8750.h"
 #include "iris_platform_x1p42100.h"
 
+#define WRAPPER_INTR_STATUS_A2HWD_BMSK		BIT(3)
+
 static const struct iris_firmware_desc iris_vpu30_p4_s6_gen2_desc = {
 	.firmware_data = &iris_hfi_gen2_data,
 	.get_vpu_buffer_size = iris_vpu_buf_size,
@@ -113,6 +115,7 @@ const struct iris_platform_data qcs8300_data = {
 	.tz_cp_config_data = tz_cp_config_vpu3,
 	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_vpu3),
 	.num_vpp_pipe = 2,
+	.wd_intr_mask = WRAPPER_INTR_STATUS_A2HWD_BMSK,
 	.max_session_count = 16,
 	.max_core_mbpf = ((4096 * 2176) / 256) * 4,
 	.max_core_mbps = (((3840 * 2176) / 256) * 120),
@@ -142,6 +145,7 @@ const struct iris_platform_data sm8550_data = {
 	.tz_cp_config_data = tz_cp_config_vpu3,
 	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_vpu3),
 	.num_vpp_pipe = 4,
+	.wd_intr_mask = WRAPPER_INTR_STATUS_A2HWD_BMSK,
 	.max_session_count = 16,
 	.max_core_mbpf = NUM_MBS_8K * 2,
 	.max_core_mbps = ((7680 * 4320) / 256) * 60,
@@ -179,6 +183,7 @@ const struct iris_platform_data sm8650_data = {
 	.tz_cp_config_data = tz_cp_config_vpu3,
 	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_vpu3),
 	.num_vpp_pipe = 4,
+	.wd_intr_mask = WRAPPER_INTR_STATUS_A2HWD_BMSK,
 	.max_session_count = 16,
 	.max_core_mbpf = NUM_MBS_8K * 2,
 	.max_core_mbps = ((7680 * 4320) / 256) * 60,
@@ -208,6 +213,7 @@ const struct iris_platform_data sm8750_data = {
 	.tz_cp_config_data = tz_cp_config_vpu3,
 	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_vpu3),
 	.num_vpp_pipe = 4,
+	.wd_intr_mask = WRAPPER_INTR_STATUS_A2HWD_BMSK,
 	.max_session_count = 16,
 	.max_core_mbpf = NUM_MBS_8K * 2,
 	.max_core_mbps = ((7680 * 4320) / 256) * 60,
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.c b/drivers/media/platform/qcom/iris/iris_vpu_common.c
index 375bcd923476..41498f94480e 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_common.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu_common.c
@@ -109,11 +109,11 @@ void iris_vpu_raise_interrupt(struct iris_core *core)
 
 void iris_vpu_clear_interrupt(struct iris_core *core)
 {
+	u32 wd_intr_mask = core->iris_platform_data->wd_intr_mask;
 	u32 intr_status, mask;
 
 	intr_status = readl(core->reg_base + WRAPPER_INTR_STATUS);
-	mask = (WRAPPER_INTR_STATUS_A2H_BMSK |
-		WRAPPER_INTR_STATUS_A2HWD_BMSK |
+	mask = (WRAPPER_INTR_STATUS_A2H_BMSK | wd_intr_mask |
 		CTRL_INIT_IDLE_MSG_BMSK);
 
 	if (intr_status & mask)
@@ -124,7 +124,9 @@ void iris_vpu_clear_interrupt(struct iris_core *core)
 
 int iris_vpu_watchdog(struct iris_core *core, u32 intr_status)
 {
-	if (intr_status & WRAPPER_INTR_STATUS_A2HWD_BMSK) {
+	u32 wd_intr_mask = core->iris_platform_data->wd_intr_mask;
+
+	if (intr_status & wd_intr_mask) {
 		dev_err(core->dev, "received watchdog interrupt\n");
 		return -ETIME;
 	}
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_register_defines.h b/drivers/media/platform/qcom/iris/iris_vpu_register_defines.h
index 72168b9ffa73..4fffa094c52f 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_register_defines.h
+++ b/drivers/media/platform/qcom/iris/iris_vpu_register_defines.h
@@ -41,7 +41,6 @@
 #define MSK_CORE_POWER_ON			BIT(1)
 
 #define WRAPPER_INTR_STATUS			(WRAPPER_BASE_OFFS + 0x0C)
-#define WRAPPER_INTR_STATUS_A2HWD_BMSK		BIT(3)
 #define WRAPPER_INTR_STATUS_A2H_BMSK		BIT(2)
 
 #define WRAPPER_INTR_MASK			(WRAPPER_BASE_OFFS + 0x10)

-- 
2.47.3


