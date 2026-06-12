Return-Path: <linux-media+bounces-64663-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id MX+vJgbRK2pfFgQAu9opvQ
	(envelope-from <linux-media+bounces-64663-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 12 Jun 2026 11:27:34 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 008BC67840C
	for <lists+linux-media@lfdr.de>; Fri, 12 Jun 2026 11:27:33 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=CaJ22dBD;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=kPVfbzsK;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64663-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-64663-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 06EDE32A21B6
	for <lists+linux-media@lfdr.de>; Fri, 12 Jun 2026 09:25:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 696393A4F51;
	Fri, 12 Jun 2026 09:25:46 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F87136F427
	for <linux-media@vger.kernel.org>; Fri, 12 Jun 2026 09:25:44 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781256345; cv=none; b=ZuxYhh4BnlvXCm1IBKO+xjKqSmuHLcu6AJYj1g/2DEVJDV3pkm6WMdzZQMJwGA9js5pGsnJz1H7yZzq2ql40Buo8f+fgctSzVqGJODIHzdiMrGJ+WJLZzHoeXsHUCMqRUYFbsJsvDGUNu8JAhZt8IGavcd9mjcdArJ8A6qQ6RSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781256345; c=relaxed/simple;
	bh=aFCxwN+s0nObB9dYmcqshZUCs9EjeMcuhwbHJaldKhc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YOO09+mEhou5hYsSet2/O9rdVuilDy1/gsrqt3Qq+ZuJlbRV5F1iByAq4AdeV4Gizqa5LWJqMwmp8/6ubRTWaqJtNL58yV7uKWxrbHsGCGd4zhW90F7EJYAcJi/auSF1uhZP9RfIUYkTP+h8izJA5pBiTz6+SX4PxUT4FIBYpGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CaJ22dBD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kPVfbzsK; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65C39K5q2502019
	for <linux-media@vger.kernel.org>; Fri, 12 Jun 2026 09:25:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CUFPN10YozDbbYt5j7NhH44x2aT4ZP340z/Eg0bq1Jk=; b=CaJ22dBDnOAlakLu
	rSvzu319rVXYBhf/HrEA78o/j9xUjL2Yqn6f0bgVjv20y12oppysceI+fBpjVCAM
	u/PKPj37Z5TFo6+l/JlBZ4J+XiaBtNnx2VPo3lHPRNwiHkeBHhE6m00yJUf5wMQh
	C4l1Zs8WHuqF1XFkLTNdwbGy4wKk1IruCuP8UbEuPYQSkfYL/W+d/fQ5VkLIrCL4
	LXv5F/g2kcB6w3lCfZFPHbW6+CLD0KO73n9k21YtwPfDaWTuxR0VCjaKEEwZUr3I
	FNOyIpnWr72nwE9QNAACHIlUW28BDMzs72d+FrPQIDG5qsTX0bhD/QiXQvsPjEaW
	A2qdTg==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4er0xd30n1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 12 Jun 2026 09:25:43 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-963d9b6b92dso242911241.2
        for <linux-media@vger.kernel.org>; Fri, 12 Jun 2026 02:25:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781256343; x=1781861143; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CUFPN10YozDbbYt5j7NhH44x2aT4ZP340z/Eg0bq1Jk=;
        b=kPVfbzsKVYWUKoYPTX+uH8yqviOmQlawn/zUTmwm0KIuOFH7F5CZvVT6zK21rMQt5x
         7UCaNoGZ9hf6xJYoBpE7rb1helNlwqblcgDshVWYHhW9h9/XZ0iMtQ+YFY6cSV85KM5a
         X6lV8jI1F1t/HJMw37UumVel+i7ZGJioVPd3/Ar9MbxPB0g/uFJ7SLJ2ND33GbDAHm2U
         gB67PEn6XLTH8Fhx6VTFQRydTMAS40c22TOhiS7ILsJgSvAiUI7HDaHO+cAPR+4DuuYe
         W3/mTvG6MRIHUf4LfuUfTtowBfMd3MAn+uhnte4OIONVNODEami9IzV+qyaWxHB7unxj
         SUlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781256343; x=1781861143;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CUFPN10YozDbbYt5j7NhH44x2aT4ZP340z/Eg0bq1Jk=;
        b=WLMW2DADJzhEm4kUhUaAMzRgOGI75KjvpVRwUBfaglGUQ/e0kKqUjfpFYkIh6A+mL8
         4DWpDkcEQuUw64EE+zjQruhjLoiG2fljLHwYdh02BbFnNDCq68kzAiFvZrH+UQDVpXFM
         1RpBG+Cace3SvigfWGxxZZlNa+KJcLQQIQofTpN3dZggTJIw08aWMOf6IQMRdLXPID53
         MbERp3JGRW59avPjkLy/a50pZxBZVJEZKsmfjgY63F7ySjucVUteFp+OBko5ZVJBgl31
         MdPYu/J5drTNdxbCnH/NgXXgICpNFp82pe9JCfsMLmeYCGy1h8ZMg0MqO1b66aHB8g8H
         5emw==
X-Gm-Message-State: AOJu0Ywu8C35+7/GcfLpmPZYBh8u6Zb2bemL4z+s/en7v3DE3+Sfknvl
	RmHmedPWN2uLtXX1rxDD3oYZynv0MdFm6JEmwQ+cVUH0TxGstopk1T40V2DgfYUOfO3yWmS83gW
	TvNhbPmZQqk0H5cJy0ivWjS/pTucdNGIvYtT7cMHKJ1KrSDsACjspPcX8erQ63rBGdQ==
X-Gm-Gg: Acq92OFQ4/HjAQVFOOWbfy4Z7yKnH53dhRgoBpYO6ZEsps0vN66j03LaMYRZ8C+j6B5
	f1vpv99GE+rgatct7TvZUyz6GqH5I6UnM/e0gZysUYHE7tnPIdO1NQBGZKyyaMg5h5rSnAUHSCC
	LF5Fn/18R/g924o0/K97UO2SsAuhWzOY/TPlQL2u6/iQyAyLK2cifVeyO3aDjKiVzqHI1Behfm5
	zngEnPw+wGLuAx5GyZJfkvHAHXK8Vop2+/eMGSEZDaJS/YPZcp5EmUk1SNLKPLCWLLhA1+Tpxdy
	qCNRFf/20CJgFNjBFdp1iBi4/sAvbBN5b5JGDn3JIigtGqTh9z7D67T5Xo4tEfAmrtL42RsuD3l
	poVJ3YbEmOA6gYpWUwRqL9UIeWAVGTe4RBlZYngtQScKdFox1QYtMN8F4sc6OMKC6oQVZJehgQb
	/QUyS821mCs78YGgVQNU0wKT8GpZ4CT/S9npg=
X-Received: by 2002:a05:6102:2b98:b0:6a2:cf9a:a5f3 with SMTP id ada2fe7eead31-71e888c088amr738019137.0.1781256342819;
        Fri, 12 Jun 2026 02:25:42 -0700 (PDT)
X-Received: by 2002:a05:6102:2b98:b0:6a2:cf9a:a5f3 with SMTP id ada2fe7eead31-71e888c088amr738011137.0.1781256342448;
        Fri, 12 Jun 2026 02:25:42 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39929f190ddsm4560191fa.19.2026.06.12.02.25.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 02:25:39 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 12 Jun 2026 12:25:33 +0300
Subject: [PATCH v4 01/16] media: iris: Skip UBWC configuration when not
 supported
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260612-iris-ar50lt-v4-1-0abfb74d5b3c@oss.qualcomm.com>
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
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1263;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=SkhEj21efbGwh1OhN+7NneptPnsqOcydi7iGjY56ptE=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqK9CPwZPO0cN0OQb8rKNsKDy2TPAKrkP/B2msY
 7r4j+VGLtOJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaivQjwAKCRCLPIo+Aiko
 1b1rCACp504C40HruoVsq8k3/NZr3gQVKQigLmI44owZM/nGTYSGUmJisKxVkzKDlW9Wb25qa6A
 eMg81mELF0+bqqYnA/U1EtzLKzyxsXRbDntfUk1zGP1/D9W5xyPDopvmUh3peAb0oiRc4bfYPvn
 mPxCU4e/poV7QLQZAvcmTbw0rBqAEY0r5UC9Z0O0WVkA8vpxM+tUyXENbbOdONYJ6HDYMfx3tpk
 oG4ZJVRThQraaLfSWlRmjRF8Wlb+uPgCWgV8HYZXkS7VT62ZmcE7sntzkM+xHz0+4o0qie1yp17
 EOx1QYcVwYtuZeZxKLdtMJo7UUVkvifjW5jIBtaJOux5Kqc7
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: qi6Haept4esgStYOsKNIx5F0n2yel5aN
X-Proofpoint-GUID: qi6Haept4esgStYOsKNIx5F0n2yel5aN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEyMDA4NCBTYWx0ZWRfX7cBDSEQGNh5D
 6OoJoilWnblUlm+BcLdQoWB1bOXl45/Xj+ST/cu6P5gkeOJovQERVDNfm7vVtAlYd6TLMeoQZGC
 ULYdRaB5gTd4cd8L4uTU/SPcyTQ2o2/xpiB0A29cLiIdYQcFqzCDY5VShX0qfx3H5Xu48kTT+qy
 irg0B8uSExVUydzIBPF8sPtqsjh+JxpQDggQ6McQ9f30ZN9pRGxFg0hHsq4urgFsj9NtquFBptP
 /ckIE0LBi+IcFVDjwdgE4b97CZ2xXKNedZyutV4QZx4KsRTukquyWArG9XMeRtuMmyxxXzc26h1
 cxTZg2cA/vyviNkW6OHK88xrbunRJ5gD+jGpvy/e7qJlfaHyMtUT+QR98L3ZXBr5epPN79f9SXD
 J4ZLbNhzhqDXo8qWBoXpmni+Zbk4i6p4kTHpBuLUqj9mSyyVVIdzXacDxDdQwsZ1YRNRj8G32aR
 mpsEexSnH5/R15inweA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjEyMDA4NCBTYWx0ZWRfXxHgoiZEhN8ZC
 3sPIFDOaNRJmb26Cno0WoA2wo3bk4aMLmA5g739UTaikPtFdkzy0pIrkEd+iQnALWfXK6HM3qh3
 NxL3jSlZ7M71i12sN4vlF2AiVg/hBXc=
X-Authority-Analysis: v=2.4 cv=O6UJeh9W c=1 sm=1 tr=0 ts=6a2bd097 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=wrkyJH6U6m0Jdbs6q_kA:9 a=QEXdDO2ut3YA:10 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-12_01,2026-06-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 phishscore=0 priorityscore=1501 spamscore=0
 suspectscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606120084
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-64663-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:vikash.garodia@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:mchehab@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:busanna.reddy@oss.qualcomm.com,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:dikshita.agarwal@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
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
X-Rspamd-Queue-Id: 008BC67840C

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


