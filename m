Return-Path: <linux-media+bounces-64674-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id s5U6DrXRK2qsFgQAu9opvQ
	(envelope-from <linux-media+bounces-64674-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 12 Jun 2026 11:30:29 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EE0A6784D1
	for <lists+linux-media@lfdr.de>; Fri, 12 Jun 2026 11:30:28 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=DJcllXGv;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=V97xLKxh;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64674-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-64674-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 64FB932056B4
	for <lists+linux-media@lfdr.de>; Fri, 12 Jun 2026 09:26:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E67E39E6D4;
	Fri, 12 Jun 2026 09:26:16 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 690033AA517
	for <linux-media@vger.kernel.org>; Fri, 12 Jun 2026 09:26:13 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781256375; cv=none; b=tZ3dHk6olDb64tgx26TLeGQObOcW5ypyYeQy7a00OMGKZZ7EKwx2SvW9b7xkbD6IGJl31RMLzpnMfNUQHRaM+Olv9/7XSIlT4NIUwAMlJDm7ju91j24rEZZ+ZfzcQa0BLB5qzELoMvJR4kc0DniCHsRD3ahimu7Mbn1dKQCBzo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781256375; c=relaxed/simple;
	bh=9UNxbtDOKcqj/XRj767wK8XZ/LIeAPPIVLk9YZhcHWE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=r4XqSIk1dwMSsFdW7/+3Q6yDDP4wLEdIJEW7RSupie/aAa3Z05ILp4T9hnkd6ipUUiocmjc9BiSHA8GPk19HckQ+gLfTnTCMKh/o5fHNYSAefJOQrxq9LkqEih3jr45K97pN7Jj94OW/c9E+GDX+c0uXrWS6zj/opVhVclfLuuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DJcllXGv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=V97xLKxh; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65C3CEPj2452600
	for <linux-media@vger.kernel.org>; Fri, 12 Jun 2026 09:26:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/OOL9Fbb5ab9YXxSbJvRKruTCR6weoazdSeJyfd3wBk=; b=DJcllXGv7u3L/EVD
	y8mE7AmE1DXKA/FLyP0tTMYOBD4EKSAktVgEU1VTM8jpr+Guav42fMU/NKwDg5O/
	N0YR/eCTduFKTOUnVoMEUkUWXp/DVsUPKsYdQhaVou0KhPAZHgzp4/khaDr09juH
	GXAY4AEU0K4aYFP9B3KuLAG0WESwGmmfkARZjTU/GGuPVh5+mshBAHOgY3SE+4yc
	3aRqCCLAGN1jkzkpwrtm6ZizJXKBQz1umwHgMo4mrSyIBlsZNssCINejN5sy5XpO
	ZiDKj5GDvNhhUXxZ83dG3e7vK2+f7Q8ncsiRg8/P7WR71HjzxeIJUhlRWKuMwkxk
	65uUQg==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4er1xcjnam-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 12 Jun 2026 09:26:12 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-963aef8124fso284325241.1
        for <linux-media@vger.kernel.org>; Fri, 12 Jun 2026 02:26:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781256371; x=1781861171; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/OOL9Fbb5ab9YXxSbJvRKruTCR6weoazdSeJyfd3wBk=;
        b=V97xLKxh0T8Pqx/wmoISr103y3QvjDwJRr3NWwZK9gY+IJZ75aAeOtJ4N96TvFUR4z
         9iYoxzHfSGoa61RLfMwegwbDwKWAVrnKWyFk18vL9kO99lRbUt1F7fSntRo6R+bBINMX
         vf7bry2XfGkjGOTQnp2gJjisojZz5bF3J0CvxEWN9Ov4bGA5wXpFY0y4UAJyTnX6SMut
         Wzl+zzCXaKDkUgRaFKqriJeMR+AH2UXTN1dJiCi83tDkdlhgGTiVEh6aZq70yxORDDnC
         qJzMJEkKPoHOWvrdDCfLkqHS8GkEqpiawVSoCL4IMy9zp5B52ZkwDpJAsF+Y7IzgAaI9
         p2jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781256371; x=1781861171;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/OOL9Fbb5ab9YXxSbJvRKruTCR6weoazdSeJyfd3wBk=;
        b=UxE1TmFbrJNfeCqO77pfs8jSgbLSgv/wTW++P/HPQu/UwiRVDw7G8CvkqujpgYwnPP
         drKOJTCSnno8LtASIupYVi6tyL6VnDAhm/gR1QmIJ14uk7I8gHkYkOnD+bgh+y78x9Dv
         0kBmFKCreOVi3nmaOYnt9aEh7Jcln1jQjz5tu0eMYySAvRHuel59VKXP0q7AXxpQwD+6
         62IOSIPuEUd8AbA4IqSuugfyga64i7gcCc5cQyvA4b1O3pES1m9Uoue6tJWZ+UU0L3vX
         RXbtjn99undwQLglgbCnlcFcUPWfdomqBJjoV1hS6TabqtLG/Y528jsKjCrlNdNiIoQu
         nCuQ==
X-Gm-Message-State: AOJu0Yw/ems0PItl16THgnkBuenbb0vIQ1xXyj3/hjh8Of9hj2mqYJRP
	MS9FUFlcMnPgm/SpCZrsOMChEtqXdF29gx98Vd9CsrvAFGddAfxjP4mgsoFZE8wmrqqIYeL6Pqm
	JetgY2z4IonKEEJMSJzZnlWMqB2QDbnwzhA2d4zl4HZKjpMBrxm2BeOF0tbo5cgNx0A==
X-Gm-Gg: Acq92OGzokpAKEhbVzZzJyHy1VVp160ZZc5/QXz7zYauDavnnBR4QW9laAqOvNFIX3k
	3byBQKt2CY5JRV5f4plzg9ypYpzxd/rqtupVSticX0hVLV0UiomIGfuBpiIXaR/2+V83A+nhIIk
	BDcZCNSK75LcB6Ncn+/kCA9PSr5QhguSXiAsJzQhsqs2nRL2Vm8SJ+QTBiBBBVAIQ92TSek1auy
	5ckk8W2WLJbe+87G7bovTdLBjuhaEmzdsuJ7tyo1Mcx8+IK53cmeESIiYG5UeksxERGZc1t+Bp9
	7+eA/qO6qdmhz+ZJVR8fYm5HSb9n2HJ6qIjeNc8bUX9aQ30/8NSPoepjDr0aQSqOm7kw0Ht5Gf+
	xdxMRYJ2dmrPYt2TDlF8KZtovG8u1MHhL7msi6fxxOC+2EF3Wg0zf0ypce8LluYboTNtaU/d1Ap
	cgDqBXX+evZWhqXeHqnkqB6ON6dBo1n6N4sq8=
X-Received: by 2002:a05:6102:b10:b0:631:b834:e052 with SMTP id ada2fe7eead31-71e88b2b1f8mr876013137.12.1781256371347;
        Fri, 12 Jun 2026 02:26:11 -0700 (PDT)
X-Received: by 2002:a05:6102:b10:b0:631:b834:e052 with SMTP id ada2fe7eead31-71e88b2b1f8mr875999137.12.1781256370737;
        Fri, 12 Jun 2026 02:26:10 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39929f190ddsm4560191fa.19.2026.06.12.02.26.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 02:26:09 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 12 Jun 2026 12:25:44 +0300
Subject: [PATCH v4 12/16] media: iris: implement support for the Agatti
 platform
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260612-iris-ar50lt-v4-12-0abfb74d5b3c@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=17237;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=9UNxbtDOKcqj/XRj767wK8XZ/LIeAPPIVLk9YZhcHWE=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqK9CQOr+Td0y8PrVbuhAaUHXocQxALKhMhYI2H
 aacRx7rGUWJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaivQkAAKCRCLPIo+Aiko
 1ZnzB/42dGP/KtSPQwmdwhXsDECawOCywVdthUHyd29fB8BGp5la41YuYzaVYX3tTADIT6MKZ7z
 BPdyeL8OGMgrIJk3cxElsfF3/5/AaMhsadCHMwhMn4EuzGsxg+xBKUs1cGG/74aGXZUBoEtV/RH
 CD+g1WyJJyelf4EDoY32PRed4Hby275H1OtUtg0rHutr6ypoN3UpP/oAHvVjBqJxZeRg3gxsEJg
 Eo3aeTTf9D68D+i9f4tXNWpuEMtw9XmKVlCbKUIUYefRZ/k53guKTRe4uGBFuAfjJ5PRPv3H1JL
 1DZVaZvxwSjGRFqiIr0YWq4wp80jQluUcn7OVmPztc1IPZfO
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEyMDA4NCBTYWx0ZWRfX1gle6Ap0X1pg
 ApHY5LyBkMowlVApmYSImexOn+oBKxGLMiv9rJDlylSurb0kYYF6n+YeoI+NxgqEoYHVGC/iF8D
 4WtNFfywHhRW2VZXuVLA/6qFFFsgRFSUdFgO/K4V0zorQFsN77j1+KSGroDiyqdpbtOhh4BKYBX
 LUeCF+Uj3KLKJfvOHX/fxePZF2rFtsuRUFAhOVegW7jSuJsiKBuu+9xvAPjedIvmZr2ts+Ro9sc
 i9Opco1G/OaLVVlmqwCJhjt7hVvY2EEG9tyRZR+p+pUTuFgDDQKmQh0cKFaQuMwHdwlBUHZ2MaP
 XvgrXFEYJ1S0WpBj/BvfkWO0nbZLil6hdpNWhFeAmy/ggSlK9DbMdlQx0+Ob16CsMCT+AqDlA3G
 8JFjpWwF/FyJ1XEU8Pxorawd4bKJUWoUdDD4ShFwZyX6/e90aWbPrRh4oNwh5+PkQXOcEf3LKDT
 fpfhllP/PmT0hf61lEA==
X-Proofpoint-GUID: 8zHjQPZVR5JT2_P5iU9EXkF-o49T4tBk
X-Proofpoint-ORIG-GUID: 8zHjQPZVR5JT2_P5iU9EXkF-o49T4tBk
X-Authority-Analysis: v=2.4 cv=NZPWEWD4 c=1 sm=1 tr=0 ts=6a2bd0b4 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=dOk1iDCBItVmpnauvPoA:9 a=QEXdDO2ut3YA:10 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjEyMDA4NCBTYWx0ZWRfXzy9oYmHCO6Va
 yCAMO8TlSzRwWQPMgxMjdrgyxk3FsHfp0QEv2xvgQ8VilxiT7v0ovxkyaRyQGXdaQoakMJZhDul
 RTiMZjuqbp+c2h/GfNX7bQnqhPaFDUA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-12_01,2026-06-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 malwarescore=0 bulkscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606120084
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-64674-lists,linux-media=lfdr.de];
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
X-Rspamd-Queue-Id: 9EE0A6784D1

Port support for the AR50Lt video codec core (present for example on the
Agatti platform) to the Iris driver. Unlike more recent cores this
generation doesn't have the PIPE property (as it always has only one
pipe). Also, unlike newer platforms, buffer sizes are requested from the
firmware instead of being calculated by the driver.

Co-developed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/Makefile          |   1 +
 drivers/media/platform/qcom/iris/iris_hfi_gen1.c   | 227 +++++++++++++++++++++
 .../platform/qcom/iris/iris_platform_common.h      |   6 +
 .../platform/qcom/iris/iris_platform_vpu_ar50lt.c  | 110 ++++++++++
 drivers/media/platform/qcom/iris/iris_probe.c      |   4 +
 drivers/media/platform/qcom/iris/iris_vpu_buffer.c |  13 ++
 drivers/media/platform/qcom/iris/iris_vpu_buffer.h |   1 +
 7 files changed, 362 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/Makefile b/drivers/media/platform/qcom/iris/Makefile
index f1b204b95694..bbd1f724963e 100644
--- a/drivers/media/platform/qcom/iris/Makefile
+++ b/drivers/media/platform/qcom/iris/Makefile
@@ -14,6 +14,7 @@ qcom-iris-objs += iris_buffer.o \
              iris_hfi_queue.o \
              iris_platform_vpu2.o \
              iris_platform_vpu3x.o \
+             iris_platform_vpu_ar50lt.o \
              iris_power.o \
              iris_probe.o \
              iris_resources.o \
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1.c
index ca1545d28b53..f57af31dbd9f 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1.c
@@ -443,3 +443,230 @@ const struct iris_firmware_data iris_hfi_gen1_data = {
 	.enc_ip_int_buf_tbl = sm8250_enc_ip_int_buf_tbl,
 	.enc_ip_int_buf_tbl_size = ARRAY_SIZE(sm8250_enc_ip_int_buf_tbl),
 };
+
+static const struct platform_inst_fw_cap iris_inst_fw_cap_gen1_ar50lt_dec[] = {
+	{
+		.cap_id = STAGE,
+		.min = STAGE_1,
+		.max = STAGE_2,
+		.step_or_mask = 1,
+		.value = STAGE_2,
+		.hfi_id = HFI_PROPERTY_PARAM_WORK_MODE,
+		.set = iris_set_stage,
+	},
+};
+
+static const struct platform_inst_fw_cap inst_fw_cap_gen1_ar50lt_enc[] = {
+	{
+		.cap_id = STAGE,
+		.min = STAGE_1,
+		.max = STAGE_2,
+		.step_or_mask = 1,
+		.value = STAGE_2,
+		.hfi_id = HFI_PROPERTY_PARAM_WORK_MODE,
+		.set = iris_set_stage,
+	},
+	{
+		.cap_id = PROFILE_H264,
+		.min = V4L2_MPEG_VIDEO_H264_PROFILE_BASELINE,
+		.max = V4L2_MPEG_VIDEO_H264_PROFILE_MULTIVIEW_HIGH,
+		.step_or_mask = BIT(V4L2_MPEG_VIDEO_H264_PROFILE_BASELINE) |
+				BIT(V4L2_MPEG_VIDEO_H264_PROFILE_CONSTRAINED_BASELINE) |
+				BIT(V4L2_MPEG_VIDEO_H264_PROFILE_MAIN) |
+				BIT(V4L2_MPEG_VIDEO_H264_PROFILE_HIGH) |
+				BIT(V4L2_MPEG_VIDEO_H264_PROFILE_STEREO_HIGH) |
+				BIT(V4L2_MPEG_VIDEO_H264_PROFILE_MULTIVIEW_HIGH),
+		.value = V4L2_MPEG_VIDEO_H264_PROFILE_HIGH,
+		.hfi_id = HFI_PROPERTY_PARAM_PROFILE_LEVEL_CURRENT,
+		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
+		.set = iris_set_profile_level_gen1,
+	},
+	{
+		.cap_id = PROFILE_HEVC,
+		.min = V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN,
+		.max = V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_STILL_PICTURE,
+		.step_or_mask = BIT(V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN) |
+				BIT(V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_STILL_PICTURE),
+		.value = V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN,
+		.hfi_id = HFI_PROPERTY_PARAM_PROFILE_LEVEL_CURRENT,
+		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
+		.set = iris_set_profile_level_gen1,
+	},
+	{
+		.cap_id = LEVEL_H264,
+		.min = V4L2_MPEG_VIDEO_H264_LEVEL_1_0,
+		.max = V4L2_MPEG_VIDEO_H264_LEVEL_4_2,
+		.step_or_mask = BIT(V4L2_MPEG_VIDEO_H264_LEVEL_1_0) |
+				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_1B) |
+				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_1_1) |
+				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_1_2) |
+				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_1_3) |
+				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_2_0) |
+				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_2_1) |
+				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_2_2) |
+				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_3_0) |
+				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_3_1) |
+				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_3_2) |
+				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_4_0) |
+				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_4_1) |
+				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_4_2),
+		.value = V4L2_MPEG_VIDEO_H264_LEVEL_1_0,
+		.hfi_id = HFI_PROPERTY_PARAM_PROFILE_LEVEL_CURRENT,
+		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
+		.set = iris_set_profile_level_gen1,
+	},
+	{
+		.cap_id = LEVEL_HEVC,
+		.min = V4L2_MPEG_VIDEO_HEVC_LEVEL_1,
+		.max = V4L2_MPEG_VIDEO_HEVC_LEVEL_4_1,
+		.step_or_mask = BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_1) |
+				BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_2) |
+				BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_2_1) |
+				BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_3) |
+				BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_3_1) |
+				BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_4) |
+				BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_4_1),
+		.value = V4L2_MPEG_VIDEO_HEVC_LEVEL_1,
+		.hfi_id = HFI_PROPERTY_PARAM_PROFILE_LEVEL_CURRENT,
+		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
+		.set = iris_set_profile_level_gen1,
+	},
+	{
+		.cap_id = HEADER_MODE,
+		.min = V4L2_MPEG_VIDEO_HEADER_MODE_SEPARATE,
+		.max = V4L2_MPEG_VIDEO_HEADER_MODE_JOINED_WITH_1ST_FRAME,
+		.step_or_mask = BIT(V4L2_MPEG_VIDEO_HEADER_MODE_SEPARATE) |
+				BIT(V4L2_MPEG_VIDEO_HEADER_MODE_JOINED_WITH_1ST_FRAME),
+		.value = V4L2_MPEG_VIDEO_HEADER_MODE_JOINED_WITH_1ST_FRAME,
+		.hfi_id = HFI_PROPERTY_CONFIG_VENC_SYNC_FRAME_SEQUENCE_HEADER,
+		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
+		.set = iris_set_header_mode_gen1,
+	},
+	{
+		.cap_id = BITRATE,
+		.min = BITRATE_MIN,
+		.max = BITRATE_MAX_AR50LT,
+		.step_or_mask = BITRATE_STEP,
+		.value = BITRATE_DEFAULT_AR50LT,
+		.hfi_id = HFI_PROPERTY_CONFIG_VENC_TARGET_BITRATE,
+		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_INPUT_PORT |
+			CAP_FLAG_DYNAMIC_ALLOWED,
+		.set = iris_set_bitrate_gen1,
+	},
+	{
+		.cap_id = BITRATE_MODE,
+		.min = V4L2_MPEG_VIDEO_BITRATE_MODE_VBR,
+		.max = V4L2_MPEG_VIDEO_BITRATE_MODE_CBR,
+		.step_or_mask = BIT(V4L2_MPEG_VIDEO_BITRATE_MODE_VBR) |
+				BIT(V4L2_MPEG_VIDEO_BITRATE_MODE_CBR),
+		.value = V4L2_MPEG_VIDEO_BITRATE_MODE_VBR,
+		.hfi_id = HFI_PROPERTY_PARAM_VENC_RATE_CONTROL,
+		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
+		.set = iris_set_bitrate_mode_gen1,
+	},
+	{
+		.cap_id = FRAME_SKIP_MODE,
+		.min = V4L2_MPEG_VIDEO_FRAME_SKIP_MODE_DISABLED,
+		.max = V4L2_MPEG_VIDEO_FRAME_SKIP_MODE_BUF_LIMIT,
+		.step_or_mask = BIT(V4L2_MPEG_VIDEO_FRAME_SKIP_MODE_DISABLED) |
+				BIT(V4L2_MPEG_VIDEO_FRAME_SKIP_MODE_BUF_LIMIT),
+		.value = V4L2_MPEG_VIDEO_FRAME_SKIP_MODE_DISABLED,
+		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
+	},
+	{
+		.cap_id = FRAME_RC_ENABLE,
+		.min = 0,
+		.max = 1,
+		.step_or_mask = 1,
+		.value = 1,
+	},
+	{
+		.cap_id = GOP_SIZE,
+		.min = 0,
+		.max = (1 << 16) - 1,
+		.step_or_mask = 1,
+		.value = 30,
+		.set = iris_set_u32
+	},
+	{
+		.cap_id = ENTROPY_MODE,
+		.min = V4L2_MPEG_VIDEO_H264_ENTROPY_MODE_CAVLC,
+		.max = V4L2_MPEG_VIDEO_H264_ENTROPY_MODE_CABAC,
+		.step_or_mask = BIT(V4L2_MPEG_VIDEO_H264_ENTROPY_MODE_CAVLC) |
+				BIT(V4L2_MPEG_VIDEO_H264_ENTROPY_MODE_CABAC),
+		.value = V4L2_MPEG_VIDEO_H264_ENTROPY_MODE_CAVLC,
+		.hfi_id = HFI_PROPERTY_PARAM_VENC_H264_ENTROPY_CONTROL,
+		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
+		.set = iris_set_entropy_mode_gen1,
+	},
+	{
+		.cap_id = MIN_FRAME_QP_H264,
+		.min = MIN_QP_8BIT_AR50LT,
+		.max = MAX_QP,
+		.step_or_mask = 1,
+		.value = MIN_QP_8BIT_AR50LT,
+		.hfi_id = HFI_PROPERTY_PARAM_VENC_SESSION_QP_RANGE_V2,
+		.flags = CAP_FLAG_OUTPUT_PORT,
+		.set = iris_set_qp_range,
+	},
+	{
+		.cap_id = MIN_FRAME_QP_HEVC,
+		.min = MIN_QP_8BIT_AR50LT,
+		.max = MAX_QP_HEVC,
+		.step_or_mask = 1,
+		.value = MIN_QP_8BIT_AR50LT,
+		.hfi_id = HFI_PROPERTY_PARAM_VENC_SESSION_QP_RANGE_V2,
+		.flags = CAP_FLAG_OUTPUT_PORT,
+		.set = iris_set_qp_range,
+	},
+	{
+		.cap_id = MAX_FRAME_QP_H264,
+		.min = MIN_QP_8BIT_AR50LT,
+		.max = MAX_QP,
+		.step_or_mask = 1,
+		.value = MAX_QP,
+		.hfi_id = HFI_PROPERTY_PARAM_VENC_SESSION_QP_RANGE_V2,
+		.flags = CAP_FLAG_OUTPUT_PORT,
+		.set = iris_set_qp_range,
+	},
+	{
+		.cap_id = MAX_FRAME_QP_HEVC,
+		.min = MIN_QP_8BIT_AR50LT,
+		.max = MAX_QP_HEVC,
+		.step_or_mask = 1,
+		.value = MAX_QP_HEVC,
+		.hfi_id = HFI_PROPERTY_PARAM_VENC_SESSION_QP_RANGE_V2,
+		.flags = CAP_FLAG_OUTPUT_PORT,
+		.set = iris_set_qp_range,
+	},
+};
+
+static const u32 iris_hfi_gen2_ar50lt_dec_ip_int_buf_tbl[] = {
+	BUF_BIN,
+	BUF_SCRATCH_1,
+};
+
+const struct iris_firmware_data iris_hfi_gen1_ar50lt_data = {
+	.init_hfi_ops = &iris_hfi_gen1_sys_ops_init,
+
+	.inst_fw_caps_dec = iris_inst_fw_cap_gen1_ar50lt_dec,
+	.inst_fw_caps_dec_size = ARRAY_SIZE(iris_inst_fw_cap_gen1_ar50lt_dec),
+	.inst_fw_caps_enc = inst_fw_cap_gen1_ar50lt_enc,
+	.inst_fw_caps_enc_size = ARRAY_SIZE(inst_fw_cap_gen1_ar50lt_enc),
+
+	.dec_input_config_params_default =
+		sm8250_vdec_input_config_param_default,
+	.dec_input_config_params_default_size =
+		ARRAY_SIZE(sm8250_vdec_input_config_param_default),
+	.enc_input_config_params = sm8250_venc_input_config_param,
+	.enc_input_config_params_size =
+		ARRAY_SIZE(sm8250_venc_input_config_param),
+
+	.dec_ip_int_buf_tbl = iris_hfi_gen2_ar50lt_dec_ip_int_buf_tbl,
+	.dec_ip_int_buf_tbl_size = ARRAY_SIZE(iris_hfi_gen2_ar50lt_dec_ip_int_buf_tbl),
+	.dec_op_int_buf_tbl = sm8250_dec_op_int_buf_tbl,
+	.dec_op_int_buf_tbl_size = ARRAY_SIZE(sm8250_dec_op_int_buf_tbl),
+
+	.enc_ip_int_buf_tbl = sm8250_enc_ip_int_buf_tbl,
+	.enc_ip_int_buf_tbl_size = ARRAY_SIZE(sm8250_enc_ip_int_buf_tbl),
+};
diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index 6a189489369f..bc04831ae7fc 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -39,6 +39,10 @@ struct iris_inst;
 #define MAX_HEVC_VBR_LAYER_HP_SLIDING_WINDOW	5
 #define MAX_HIER_CODING_LAYER_GEN1		6
 
+#define BITRATE_MAX_AR50LT		100000000
+#define BITRATE_DEFAULT_AR50LT		20000000
+#define MIN_QP_8BIT_AR50LT		0
+
 enum stage_type {
 	STAGE_1 = 1,
 	STAGE_2 = 2,
@@ -51,8 +55,10 @@ enum pipe_type {
 };
 
 extern const struct iris_firmware_data iris_hfi_gen1_data;
+extern const struct iris_firmware_data iris_hfi_gen1_ar50lt_data;
 extern const struct iris_firmware_data iris_hfi_gen2_data;
 
+extern const struct iris_platform_data qcm2290_data;
 extern const struct iris_platform_data qcs8300_data;
 extern const struct iris_platform_data sc7280_data;
 extern const struct iris_platform_data sm8250_data;
diff --git a/drivers/media/platform/qcom/iris/iris_platform_vpu_ar50lt.c b/drivers/media/platform/qcom/iris/iris_platform_vpu_ar50lt.c
new file mode 100644
index 000000000000..393256f39112
--- /dev/null
+++ b/drivers/media/platform/qcom/iris/iris_platform_vpu_ar50lt.c
@@ -0,0 +1,110 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#include "iris_core.h"
+#include "iris_ctrls.h"
+#include "iris_hfi_gen2.h"
+#include "iris_hfi_gen2_defines.h"
+#include "iris_platform_common.h"
+#include "iris_vpu_buffer.h"
+#include "iris_vpu_common.h"
+
+#define WRAPPER_INTR_STATUS_A2HWD_BMSK		0x10
+
+const struct iris_firmware_desc iris_vpu_ar50lt_p1_gen1_s6_desc = {
+	.firmware_data = &iris_hfi_gen1_ar50lt_data,
+	.get_vpu_buffer_size = iris_vpu_ar50lt_gen1_buf_size,
+	.fwname = "qcom/venus-6.0/venus.mbn",
+};
+
+static const u32 iris_fmts_ar50lt_dec[] = {
+	[IRIS_FMT_H264] = V4L2_PIX_FMT_H264,
+	[IRIS_FMT_HEVC] = V4L2_PIX_FMT_HEVC,
+	[IRIS_FMT_VP9] = V4L2_PIX_FMT_VP9,
+};
+
+static const struct bw_info iris_bw_table_dec_ar50lt[] = {
+	{ ((1920 * 1080) / 256) * 60, 1564000, },
+	{ ((1920 * 1080) / 256) * 30,  791000, },
+	{ ((1280 * 720) / 256) * 60,   688000, },
+	{ ((1280 * 720) / 256) * 30,   347000, },
+};
+
+static const struct icc_info iris_icc_info_ar50lt[] = {
+	{ "cpu-cfg",    1000, 1000     },
+	{ "video-mem",  1000, 6500000  },
+};
+
+static const char * const iris_pmdomain_table_ar50lt[] = { "venus", "vcodec0" };
+
+static const char * const iris_opp_pd_table_ar50lt[] = { "cx" };
+
+static const struct platform_clk_data iris_clk_table_ar50lt[] = {
+	{IRIS_CTRL_CLK,    "core"         },
+	{IRIS_AXI_CLK,     "iface"        },
+	{IRIS_AHB_CLK,     "bus"          },
+	{IRIS_HW_CLK,      "vcodec0_core" },
+	{IRIS_HW_AHB_CLK,  "vcodec0_bus"  },
+	{IRIS_THROTTLE_CLK, "throttle"    },
+};
+
+static const char * const iris_opp_clk_table_ar50lt[] = {
+	"vcodec0_core",
+	NULL,
+};
+
+static const struct tz_cp_config tz_cp_config_ar50lt[] = {
+	{
+		.cp_start = 0,
+		.cp_size = 0x25800000,
+		.cp_nonpixel_start = 0x01000000,
+		.cp_nonpixel_size = 0x24800000,
+	},
+};
+
+static struct platform_inst_caps platform_inst_cap_ar50lt = {
+	.min_frame_width = 128,
+	.max_frame_width = 1920,
+	.min_frame_height = 128,
+	.max_frame_height = 1920,
+	.max_mbpf = (1920 * 1088) / 256,
+	.mb_cycles_vpp = 440,
+	.mb_cycles_fw = 733003,
+	.mb_cycles_fw_vpp = 225975,
+	.max_frame_rate = 120,
+	.max_operating_rate = 120,
+};
+
+const struct iris_platform_data qcm2290_data = {
+	.firmware_desc_gen1 = &iris_vpu_ar50lt_p1_gen1_s6_desc,
+	.vpu_ops = &iris_vpu_ar50lt_ops,
+	.icc_tbl = iris_icc_info_ar50lt,
+	.icc_tbl_size = ARRAY_SIZE(iris_icc_info_ar50lt),
+	.bw_tbl_dec = iris_bw_table_dec_ar50lt,
+	.bw_tbl_dec_size = ARRAY_SIZE(iris_bw_table_dec_ar50lt),
+	.pmdomain_tbl = iris_pmdomain_table_ar50lt,
+	.pmdomain_tbl_size = ARRAY_SIZE(iris_pmdomain_table_ar50lt),
+	.opp_pd_tbl = iris_opp_pd_table_ar50lt,
+	.opp_pd_tbl_size = ARRAY_SIZE(iris_opp_pd_table_ar50lt),
+	.clk_tbl = iris_clk_table_ar50lt,
+	.clk_tbl_size = ARRAY_SIZE(iris_clk_table_ar50lt),
+	.opp_clk_tbl = iris_opp_clk_table_ar50lt,
+	/* Upper bound of DMA address range */
+	.dma_mask = 0xe0000000 - 1,
+	.inst_iris_fmts = iris_fmts_ar50lt_dec,
+	.inst_iris_fmts_size = ARRAY_SIZE(iris_fmts_ar50lt_dec),
+	.inst_caps = &platform_inst_cap_ar50lt,
+	.tz_cp_config_data = tz_cp_config_ar50lt,
+	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_ar50lt),
+	.num_vpp_pipe = 1,
+	.no_rpmh = true,
+	.wd_intr_mask = WRAPPER_INTR_STATUS_A2HWD_BMSK,
+	.icc_ib_multiplier = 2,
+	.max_session_count = 8,
+	.max_core_mbpf = ((1920 * 1088) / 256) * 4,
+	/* Concurrency: 1080p@30 decode + 1080p@30 encode */
+	/* Concurrency: 3 * 1080p@30 decode */
+	.max_core_mbps = (((1920 * 1088) / 256) * 90),
+};
diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
index 7fe31136df21..472d9e293ece 100644
--- a/drivers/media/platform/qcom/iris/iris_probe.c
+++ b/drivers/media/platform/qcom/iris/iris_probe.c
@@ -356,6 +356,10 @@ static const struct dev_pm_ops iris_pm_ops = {
 };
 
 static const struct of_device_id iris_dt_match[] = {
+	{
+		.compatible = "qcom,qcm2290-venus",
+		.data = &qcm2290_data,
+	},
 	{
 		.compatible = "qcom,qcs8300-iris",
 		.data = &qcs8300_data,
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_buffer.c b/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
index fb6f1016415e..4a39b8fef52b 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
@@ -2194,6 +2194,19 @@ u32 iris_vpu4x_buf_size(struct iris_inst *inst, enum iris_buffer_type buffer_typ
 	return size;
 }
 
+u32 iris_vpu_ar50lt_gen1_buf_size(struct iris_inst *inst, enum iris_buffer_type buffer_type)
+{
+	const struct iris_hfi_session_ops *hfi_ops = inst->hfi_session_ops;
+	int ret;
+
+	/* return 0 on error to let the driver cope */
+	ret = hfi_ops->session_get_property(inst, HFI_PROPERTY_CONFIG_BUFFER_REQUIREMENTS);
+	if (ret)
+		return 0;
+
+	return inst->buffers[buffer_type].size;
+}
+
 static u32 internal_buffer_count(struct iris_inst *inst,
 				 enum iris_buffer_type buffer_type)
 {
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_buffer.h b/drivers/media/platform/qcom/iris/iris_vpu_buffer.h
index 8c0d6b7b5de8..1d07137c70cd 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_buffer.h
+++ b/drivers/media/platform/qcom/iris/iris_vpu_buffer.h
@@ -288,6 +288,7 @@ static inline u32 size_av1d_qp(u32 frame_width, u32 frame_height)
 u32 iris_vpu_buf_size(struct iris_inst *inst, enum iris_buffer_type buffer_type);
 u32 iris_vpu33_buf_size(struct iris_inst *inst, enum iris_buffer_type buffer_type);
 u32 iris_vpu4x_buf_size(struct iris_inst *inst, enum iris_buffer_type buffer_type);
+u32 iris_vpu_ar50lt_gen1_buf_size(struct iris_inst *inst, enum iris_buffer_type buffer_type);
 int iris_vpu_buf_count(struct iris_inst *inst, enum iris_buffer_type buffer_type);
 
 #endif

-- 
2.47.3


