Return-Path: <linux-media+bounces-67164-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id sWvXAf+nT2pqlwIAu9opvQ
	(envelope-from <linux-media+bounces-67164-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 09 Jul 2026 15:54:07 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 00810731D10
	for <lists+linux-media@lfdr.de>; Thu, 09 Jul 2026 15:54:05 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=DVBOweLn;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=KrqcAauz;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67164-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-67164-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C8F3B305AF94
	for <lists+linux-media@lfdr.de>; Thu,  9 Jul 2026 13:42:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FD382FE066;
	Thu,  9 Jul 2026 13:42:08 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97EF62F7462
	for <linux-media@vger.kernel.org>; Thu,  9 Jul 2026 13:42:06 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783604528; cv=none; b=i6tTfRznst6SERHquYi+4hdW9HK831HNwsjmq4WZLe36nVyeGHjrlmSUFv6ByX8HrGMLDuLeeGnaFpGZIzibyztGgjHo5caLM5kNg+rhi5MgbjdROLaDrC+24BH8lmjAgKuVvxQOs2fQXQOUcTR0jWFalmIrMXzXioBFGC4O5WQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783604528; c=relaxed/simple;
	bh=aFCxwN+s0nObB9dYmcqshZUCs9EjeMcuhwbHJaldKhc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WHGXUq9rhjFF9nLH+lgHh23rzFPd2Kh069T8UAdk3VfvJzx2CjX6ri1MgaXbXW8WO6QutFPaQojjYtkpSudnnp8xq7nU27f/KDYD6BBnMjXgn8Ysy8BevqnsQBcDlcEBPLSISYNdKjoy19i/nevUHi0iQ8doKEXuyPFinO9fTn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DVBOweLn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KrqcAauz; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669BNUFH1672682
	for <linux-media@vger.kernel.org>; Thu, 9 Jul 2026 13:42:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CUFPN10YozDbbYt5j7NhH44x2aT4ZP340z/Eg0bq1Jk=; b=DVBOweLncCEeuBQp
	aJn6atifK7NkVSTcYRiVTQ13lJlSI2gmjv0vWXDHXSzcINvH+vOMBXZ+RmW0NqcM
	w4b/DyqYNWPHOXUsoQj0zWJoA1sZTpxiPRXD3cphnw/sVjr2kbDa4KNOyM+hmAuz
	gig5LvdXjvoJe+tZQde/6cZYdaUjl+fSwF6IvcR/8GZOtYMirHwd/kMhqwESLWsn
	iXs1mMBvqyOD+BYuFWKieETYus3jFc/Vh4s/FJnqxZcQPUMITasdNkGGsWGb+UgI
	WcyKCpwtYm+AxyyrradSbc5vkDPrgJzqYToqUH34zPcQWG+VWQIUQUykhEAxARVO
	Mhf05w==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9sqschm3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 09 Jul 2026 13:42:05 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-738105fa48fso991691137.1
        for <linux-media@vger.kernel.org>; Thu, 09 Jul 2026 06:42:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783604525; x=1784209325; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CUFPN10YozDbbYt5j7NhH44x2aT4ZP340z/Eg0bq1Jk=;
        b=KrqcAauzIl2Kb428LBZm/HnENWqzsncN/WZ6j/zfBLdwYCPWDDgifyVkwtZSSIwDsB
         c6LV//6JA1Uer3J+8JWXXp228lRTvPrb8K+I+hL7PR4mdWLFqIe8i5YC7I4acIAX8oxB
         xe21vckOsBCuZ/F75KwTC2BRgDLko+Y7kw7ex/HU5JErl3JW1oeJ+fhEYy9PW5MANq9y
         uLoEAvYdi5CDF1JFA5jkVXfb6wMZqRIGfipt9LGxDlY3j9N0An1U1oSXngTySJtrBqBt
         PzPpWldepgXKsIFQIpQfhqnKtbuwxkuDQQ1pui3Bni7mgwvY2+JFxEbphhOrO/4vKQkC
         7b9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783604525; x=1784209325;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CUFPN10YozDbbYt5j7NhH44x2aT4ZP340z/Eg0bq1Jk=;
        b=mkEszLjVfpndmVvQffr+z57hQCC4OxWMCDMp84jtWW8gAklb5AZs2eXs42Eu2ewFxL
         8D26OqC+hKhUaVhz8P+Qnq3WWYm0myRgU9L0bfdUQc5vVsZK76wIzG7aCT4FK/4/2DbB
         FAYD4zd5d+dJ8ctgpYSL09u2juKiFHzfD5bnIK7v0wQSbEcetS3bgWXB+u/cmH1/SeNN
         nixjBF28FqzhGwTtmrkx2j3qtGHNWc/N4jKFkyVoSaYjTcYMOjZCUMd4UGiLskLVyb/E
         dj6q7rt+jyTsAuq0TGDmI9aDMiQqxe6iJleyhxmoVjU084EasXN1at/EuonaiugyujUq
         +HPg==
X-Gm-Message-State: AOJu0YzaG8VHs317i1Fnw3J7i1W+O5cK7f2DIqNf5t6YAcbruLOUJYPG
	ORL0a+aF9V/PxUDasFL0D0ujYBIW/uYenCBIYJLp3jDyDVhEMz5PxfKUOaAh2tgoSAjFnRhkSp9
	2TTYNtatFjRXuvqWJzdcaXnOQ1R7SziiY+8J2ZAWeo+QaWlTxlx32sRXp2MHrQIW1aQ==
X-Gm-Gg: AfdE7clyZXi40h70NRncEY0qErYJ+WZIIHFnOgi2DVdOyEkHzed8HYWheeO3LiUVmZW
	RRSOyGDr1e6u3In9TTJUEF+VUblvZE/4SqRN9WF5znO+TAgYpgfI4YnkOZ3eUcs4SmkPlrBYxNK
	fNeVpOA33wAdshP3745kR6oIbXIkPvudjIeTB39/G2hjGPX3B1CPGNviL6xKphru+hJe7sbvNQs
	E+IO/sn0jM/Jqw+KtjEyQIZk1qhO0dfQ0Af8iMybafn7GMA4X35pCtDdqSj/Ur6jk+MU+Xi+ou5
	D5h1Ai5KkNn8hO3/w4UXSulKS4a3La9G6u1fOhEk9a6oXYMXVKbIjWTxK85FtVFAw8BhjTqw3Ua
	ZsW+P+v8XWWkJOxv97qppEuITE0zuwUlzhWFrgjtBUa/KEGhXN34Z3UQdBP7lwI6WKtvsX6bv+y
	8FmgWuApLWVEFU4XFNUYaqYsNG
X-Received: by 2002:a05:6102:a1c7:10b0:6cc:e6b1:7f84 with SMTP id ada2fe7eead31-744f67bda98mr964029137.17.1783604524949;
        Thu, 09 Jul 2026 06:42:04 -0700 (PDT)
X-Received: by 2002:a05:6102:a1c7:10b0:6cc:e6b1:7f84 with SMTP id ada2fe7eead31-744f67bda98mr964017137.17.1783604524468;
        Thu, 09 Jul 2026 06:42:04 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39c849186e1sm3345151fa.9.2026.07.09.06.42.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 06:42:03 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 09 Jul 2026 16:41:53 +0300
Subject: [PATCH v7 02/18] media: iris: Skip UBWC configuration when not
 supported
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260709-iris-ar50lt-v7-2-76af9dd4d1f6@oss.qualcomm.com>
References: <20260709-iris-ar50lt-v7-0-76af9dd4d1f6@oss.qualcomm.com>
In-Reply-To: <20260709-iris-ar50lt-v7-0-76af9dd4d1f6@oss.qualcomm.com>
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
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1263;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=SkhEj21efbGwh1OhN+7NneptPnsqOcydi7iGjY56ptE=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqT6UkTyltGm6klk6UVSEKXHvenw/SwzjIU97dy
 buovZCU3WGJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCak+lJAAKCRCLPIo+Aiko
 1ajjB/9eEgHNKl+uxgKqYjT7r1nLgFLRKkiwjoiDtq8fhPz7YxiolvrPgmBDy0MOSldgFB/Abez
 Y4heJx0O0QUGlSbqFm0E5SOkNdGZPH0n/gBHSw0odJO4IlJfVCT5geAxu+OQjvY4Hl4M83oU+1g
 SHRGiX5a5uvPYdU//Umfj2sdNaqfxgeF5RZ3KXXttMJaXgVMdZFOEbMRe/hV7z1p9ORVLE903YG
 bUv7bHqBa2qO78Us//3sMcDrSQ2lCkOu6QBI9Y+Zp6OABzdPXCao6j8ZhQeR2SOtyUb9PYId+rR
 aJLU6FW77WWSGAf3mG+FGgXvInXZTPitZaCwuP9hWgA+2uTM
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDEzNCBTYWx0ZWRfX9lFfIehANpW1
 FyKDrwtYImMeKai+zbIZfB+r4Ln8sXlepLTFQQaJ5SUI6zoQujkXzvDzRR1L1uezkac7rN56PLf
 qW+YAj0yV/ksajEJwxEPSe4ROr2NQ14=
X-Proofpoint-GUID: HGfbA1mIH3JPrIDIhBwYZZwOlHHYDEyN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDEzNCBTYWx0ZWRfX7egrvVVlNEzl
 8CBgjJrpgFCWyff4kYWeK+jjJt8Js1zM2ya4MrOwXdTipOLDarXmgb3oGsIYPZW1D90cY9171nh
 iz9C3/tBroCjeEOiFVwexIap76uebmrGDCHU9fTknnCwrLQfo/3+Ba3oMQkTyVB/av1MkgM/P69
 CcB/AGJId4j7KuQfzOY81hV68bRX3S4nzuUSX/c1x4POf/MmxJG8tZY03Fd5S/GVRl8fMpus8Js
 3cuU8TVE+y5A0anrvDC1kxvSwjFQ7t6UfBm4yBF1WeUA5hXAtQsSp3ZIxScStMLymKKT3Lkhn1g
 r5eqm4GS5JKWHIE1h4gQ9bNTr1Elh+L1wvcAXTqP2bCqb+4Iay+z2lr3NWx7YWeg4QHmAW/hHR6
 1p7hboBCEgzCGeZsq8kqamkAU2qU99QX8rE31F0i1Hu//QHn6o769xdc9H4z7y2AFnfraUqh5NN
 LhnW0FlT7tqq2+emXqg==
X-Authority-Analysis: v=2.4 cv=Sv2gLvO0 c=1 sm=1 tr=0 ts=6a4fa52d cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=wrkyJH6U6m0Jdbs6q_kA:9 a=QEXdDO2ut3YA:10 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-ORIG-GUID: HGfbA1mIH3JPrIDIhBwYZZwOlHHYDEyN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_02,2026-07-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090134
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-67164-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:vikash.garodia@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:mchehab@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:busanna.reddy@oss.qualcomm.com,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:dikshita.agarwal@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:email,qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 00810731D10

From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>

UBWC configuration is not applicable to all SoCs. Add a check to avoid
configuring UBWC during sys init on unsupported platforms.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Reviewed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
index 0d05dd2afc07..6e04175eb904 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
@@ -140,6 +140,9 @@ void iris_hfi_gen2_packet_sys_init(struct iris_core *core, struct iris_hfi_heade
 				    &payload,
 				    sizeof(u32));
 
+	if (!ubwc->ubwc_enc_version)
+		return;
+
 	payload = qcom_ubwc_macrotile_mode(ubwc) ? 8 : 4;
 	iris_hfi_gen2_create_packet(hdr,
 				    HFI_PROP_UBWC_MAX_CHANNELS,

-- 
2.47.3


