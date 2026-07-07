Return-Path: <linux-media+bounces-66914-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id rmbPCG1/TWq21AEAu9opvQ
	(envelope-from <linux-media+bounces-66914-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 08 Jul 2026 00:36:29 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8471A720242
	for <lists+linux-media@lfdr.de>; Wed, 08 Jul 2026 00:36:28 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=dn4R1xCv;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=CwrmC3JL;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66914-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-66914-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D008B311DD6A
	for <lists+linux-media@lfdr.de>; Tue,  7 Jul 2026 22:30:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3329A47D920;
	Tue,  7 Jul 2026 22:29:39 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5188A43F4DF
	for <linux-media@vger.kernel.org>; Tue,  7 Jul 2026 22:29:37 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783463378; cv=none; b=iPyICW0XZl8uLMutXYNrb3avue8J22e5Y8EL32VxtDBLzK+HYIfIA9ZfcmpdSR2LsaPiyaorGae82ufgUvK20lU6vqlB5qS+GJXIVYk9N0QleuZngOyjUQEu4GLjcb+Xast4JwB2cBzsRmiZxZy+yOioGfBW89fWb614vlJQaiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783463378; c=relaxed/simple;
	bh=H5gjTCkahlz2x03Clh/PysKqV1bvgbU9MHDzqSGjKm0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UvuqrH1fqtECYYkudaI+dREaJ+mbmooN9b37FL/EzQc6hP9GrCpV94JVTOlPeRzLV2wQC2w9NBbPTvXitWszi8ZS30RnBrE22KqsTiu2HKaAFdb0u926/JJpZB+PkW8EHdLRy2ElJ16KsSed5H11oATKQybuXFX+r26qvGSKZeo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dn4R1xCv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CwrmC3JL; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 667J5gPr505075
	for <linux-media@vger.kernel.org>; Tue, 7 Jul 2026 22:29:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7GXhlm42Lq8jhZpNQbWDnVnjUliqMt9PAaqnfp5/6jw=; b=dn4R1xCvA86S0kYd
	QO89iHTF4RJezjl2syqIVAQQE2v1TbURqV2znsXzNfjWsOsGCUb3VJNqpJraSXnA
	6j/YGS30trLlzXNivERmon6zE02aHyOsAyh+WhWTO4wW+4b55bXqbjQ4Og+BL0qe
	ApR4vTXo3Catp+EbMRwTVvnPDjQ3GFgaDxQ672a+FcdjZS2XalCS1sDv8h4nGV4E
	qCOz9E1y5l4oTFaj78MlBuT3TlIZasN6+OmPXcOoJgOtKReQVBbXTo4b8KT2hanU
	iTIVe+8OSVqKh58JMynH5I+b9herV3+x6Kxlg6q+YmAZZ26G29aiMR1g8YCT5mvc
	0p4auA==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8vdjc0s6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 07 Jul 2026 22:29:36 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-9693c6fe1e6so89517241.1
        for <linux-media@vger.kernel.org>; Tue, 07 Jul 2026 15:29:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783463375; x=1784068175; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7GXhlm42Lq8jhZpNQbWDnVnjUliqMt9PAaqnfp5/6jw=;
        b=CwrmC3JL9yEH2NhIKOw6fMfLxgGe+d5hADApA3dAYnrSS3ZX+8fvE8+QLpuFj0SDPI
         HZtWttoYgZnm1xhObQ0Fdy96TlrmK/Of90+rMztW9GvVaeoElQF3UyWktwAarLCAXqCX
         XvbuvpSq7a8A4UREeHHUToZAkiadF0uYNgyJW6ytTNXxMjz/TpNa52Bz4/LBOGYzPyBz
         /eV4V9Mj2Btf87hUWEyoGkisElJznfu1bXioGcWwQeQkgBCXnE9w304zpI3wy6X7p7Fs
         XjDO24cBhnkFFg9CBTIohiJi4LePTxM/0zqdXPqgEDPkKtkFku0CZpZtG7dv1VaYpOlC
         8yGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783463375; x=1784068175;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7GXhlm42Lq8jhZpNQbWDnVnjUliqMt9PAaqnfp5/6jw=;
        b=csKk9ji7s69yOVLxIjTGbgOIA27kKb3xTlxtl/iqTnOCqAGOtR9F7pgLjN+J58VT9w
         yJViSKCOLA1B4U78l5Tukw+/E/l53zEWovC/rCSCNRrlNRfTVl76/0Se0RzkH4nl6g5E
         YkiWTr3vV6KHgagLTtQ0AbsVPS4bTGWGpIknRHB2E4hXOlkfLUopXuqIAtDZ1IPreLK+
         NPvGmzSaOJNlMyEwKrGCiD9a6f/hE4eW+2rhDRDMV6t8+Ue4A058zI+Yw1cHyjZ9x3GL
         OZwc/OwvXnzNAw4ETUGslIYF1RSb29sK0BTQcyzbfxl7zduVt29FJJKOmMnIZ7E/tbPw
         WxBQ==
X-Gm-Message-State: AOJu0YxgCT/bg63qv/AZb8tVD6ClEnUPcAniNyuX7FKLzSU0QOvzW6AZ
	GjOR6qEBRmGHrcCE1ctpZzzPyaSKnmVkP7VAxUuSYpxYCGZ9z+g3MS6I/i7RpFG4YJFqqANZREh
	4/1xh0UjSYE2VAxgH1OjoHdBP1XJ8Q6cRjwfBwb69Ttvbskj77yG4KPIT0a4JGS27jlzwNkfJsA
	==
X-Gm-Gg: AfdE7cn7kmxHhzZBvOrL5A9jjCCDjr6T0Oq7YZdaF71K6ja+ucu2XuCFUQOgcN0RhmA
	LHJ52i2nrxfthwjS/8jsHxhEmYI4/gEsDv3aJV7xkS5Aq/LRy8WXYFNoR0OlUSWFh4I/oCRssPd
	9sS7C4HjmOnpCOqpz9uq8n+/cE/OfyR3FDm4YvKn7g04DUsTFaqBxQts10RqoQXn6AqqbFcFchg
	8cVieAFNaieHlhWkJBfY7WMewbmgsHFIRvLYF07dSshsPQ4ZQH3oT6B3toPQLFEYMSplgTE39oj
	T/0BMrcQTxweOhqGU7vbk/6q6+VEnztF8kBEuj5t4QYJJHDhTkosVkkCprNIf4n8Z5h/5tUpj0b
	zIM03mNLEZzd+IQi6qjI1QIB71whxK7JrZ8UXtxj8kS7BMBcEJVBe4M77rVJcZmWgwS723+fk0b
	jXlJ95c0esga9yGQnSMAjYrTKM
X-Received: by 2002:a05:6102:c47:b0:739:4fa1:50aa with SMTP id ada2fe7eead31-744b7d87ab2mr4381292137.14.1783463375426;
        Tue, 07 Jul 2026 15:29:35 -0700 (PDT)
X-Received: by 2002:a05:6102:c47:b0:739:4fa1:50aa with SMTP id ada2fe7eead31-744b7d87ab2mr4381283137.14.1783463375013;
        Tue, 07 Jul 2026 15:29:35 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39c7312bc25sm1897231fa.40.2026.07.07.15.29.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 15:29:32 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 08 Jul 2026 01:28:50 +0300
Subject: [PATCH v6 07/18] media: iris: add vpu op hook to disable ARP
 buffer
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-iris-ar50lt-v6-7-374f0a46c23b@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3064;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=1XoxNMQkIKQIwreQUtjXXBpaKx8sVaEKHYTsCNEF0Ak=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqTX2ptdCVTmfF9vVeMsk4iC14OmMlo3P6jA7dO
 hHKOHCUV4GJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCak19qQAKCRCLPIo+Aiko
 1UK1B/9Ev7P1cZmEMcpmcBFdZgBZUroJg+m4v8Lb99EkrTDQPusbbbSxQqnj+Tavd+SYTTDOmnY
 dOxAC340ndJmIKwwyJn1eUFqU4tjG00zml/CTFWiQQbG9nNvuciUqKFoKvfUZwKlcgOtxp2FHaF
 TgxxFeeZGDN2hc+PFyNDzqKxmE8BsDVnpGY4tkzRBhDjQxlymkGYgQqzUTDOUKIc0OhyEFHL1UN
 DBnzgDLJJ1h6ceR6qoPkAG1rD7Nu8D2BjtawDy/9pKtv3L+rmpD34FZL6IP1jcPy0cF7TwzC1lL
 B/mxXkJgrBWIgJrLJdofTp/VNlzGa+sb452tnG5ulP04uwkg
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=R7cz39RX c=1 sm=1 tr=0 ts=6a4d7dd0 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=vdBeo_PM3xCM7oyOFJQA:9 a=QEXdDO2ut3YA:10 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-GUID: ZW5qOIujOhQY62MUjXKJjdECv4zbdRx5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDIyMSBTYWx0ZWRfX4fNgYeX9O4A2
 cg2wir5gReW+kuNG/xj8qaUqn0EzvkV4fyZP0e/nKL77b3kmVOBpHv6Cwq3LefJvZ0tGCAqrKQ9
 N35PCdBD81sZ3MOcDhsKZsiTEk9eLk+ZnP35WyK4AWi3Cc9zU/7Xe0kelWvLTR7X9vIcYWCe37r
 zHgSGT9cserwQxatv7iGNmLcg+xoX130qtzUha5WXMSVEw8dqktcWb5oH3ZAQ7hnoBtH+cfngd5
 raubzsAUu1tEUP3l9l2XT2d8miMEkjjpXjepxE1Gb8E9pCwlBNQj1OquitCvjkIpuK+IIeMHEmK
 DouJIZBYH6jGKG0nWw+1epNds+jdQAuvUQ4TVxDWfmaTepgDLo/tx6HcW6rfsnjsDSICXhki6iF
 KEpRaQqCgwLN7b7W6DWNFZcDNmcnJBgtazVpvojK+8e95eHNSybO+vKd91Vh0fDi7Al9LDydpFd
 Gzy9ln2iOdMB3MMgKUw==
X-Proofpoint-ORIG-GUID: ZW5qOIujOhQY62MUjXKJjdECv4zbdRx5
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDIyMSBTYWx0ZWRfX7ES5GfLU00l/
 uzBA64o/qFfzRoJXD63nNByur5N/f1TKrl4+7YAKXjFsOnc3n5ixoiwzoqdRJqGhHS9JiG0SCx/
 FYKS9EMHI90lawAnIVK+PgqMKbAFogA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_05,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015 malwarescore=0
 bulkscore=0 spamscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070221
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-66914-lists,linux-media=lfdr.de];
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
X-Rspamd-Queue-Id: 8471A720242

From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>

On AR50LT platforms AbsolutelyPerfectRouting (ARP) needs to be disabled
so firmware can configure the ARP internal buffer as non-secure for
encoder usage. In preparation of adding support for AR50LT platforms,
add an optional disable_arp callback to the VPU ops and invoke it from
core init and resume paths.

No functional change for existing platforms.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Reviewed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_core.c       | 4 ++++
 drivers/media/platform/qcom/iris/iris_hfi_common.c | 4 ++++
 drivers/media/platform/qcom/iris/iris_vpu_common.h | 1 +
 3 files changed, 9 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/iris_core.c b/drivers/media/platform/qcom/iris/iris_core.c
index 52bf56e517f9..bd22076f3557 100644
--- a/drivers/media/platform/qcom/iris/iris_core.c
+++ b/drivers/media/platform/qcom/iris/iris_core.c
@@ -45,6 +45,7 @@ static int iris_wait_for_system_response(struct iris_core *core)
 
 int iris_core_init(struct iris_core *core)
 {
+	const struct vpu_ops *vpu_ops = core->iris_platform_data->vpu_ops;
 	int ret;
 
 	mutex_lock(&core->lock);
@@ -78,6 +79,9 @@ int iris_core_init(struct iris_core *core)
 	if (ret)
 		goto error_unload_fw;
 
+	if (vpu_ops->disable_arp)
+		vpu_ops->disable_arp(core);
+
 	core->iris_firmware_data->init_hfi_ops(core);
 
 	ret = iris_hfi_core_init(core);
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_common.c b/drivers/media/platform/qcom/iris/iris_hfi_common.c
index 8769ec61f117..8f04f3793d9a 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_common.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_common.c
@@ -144,6 +144,7 @@ int iris_hfi_pm_suspend(struct iris_core *core)
 
 int iris_hfi_pm_resume(struct iris_core *core)
 {
+	const struct vpu_ops *vpu_ops = core->iris_platform_data->vpu_ops;
 	const struct iris_hfi_sys_ops *ops = core->hfi_sys_ops;
 	int ret;
 
@@ -163,6 +164,9 @@ int iris_hfi_pm_resume(struct iris_core *core)
 	if (ret)
 		goto err_suspend_hw;
 
+	if (vpu_ops->disable_arp)
+		vpu_ops->disable_arp(core);
+
 	ret = ops->sys_interframe_powercollapse(core);
 	if (ret)
 		goto err_suspend_hw;
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.h b/drivers/media/platform/qcom/iris/iris_vpu_common.h
index 9151545065cd..71d96921ed37 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_common.h
+++ b/drivers/media/platform/qcom/iris/iris_vpu_common.h
@@ -24,6 +24,7 @@ struct vpu_ops {
 	int (*set_hwmode)(struct iris_core *core);
 	void (*set_preset_registers)(struct iris_core *core);
 	void (*interrupt_init)(struct iris_core *core);
+	void (*disable_arp)(struct iris_core *core);
 };
 
 int iris_vpu_boot_firmware(struct iris_core *core);

-- 
2.47.3


