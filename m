Return-Path: <linux-media+bounces-64943-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id xn2xLsWTMGqVUgUAu9opvQ
	(envelope-from <linux-media+bounces-64943-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 16 Jun 2026 02:07:33 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1977A68ACB6
	for <lists+linux-media@lfdr.de>; Tue, 16 Jun 2026 02:07:33 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="FfsJy/xn";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=j0aZyNrJ;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64943-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-64943-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9AE48313B87F
	for <lists+linux-media@lfdr.de>; Tue, 16 Jun 2026 00:04:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5AA202A1CF;
	Tue, 16 Jun 2026 00:04:54 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B9FC1D555
	for <linux-media@vger.kernel.org>; Tue, 16 Jun 2026 00:04:50 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781568293; cv=none; b=Y50P8okVE7XO9vTZssrnV45SYG7VlgIbJevWdEzY5dvilMuw8Uf069+Sw5CVFRw1ARUONFaV4VBArGbjXfMp1nAuQweXUwtVMqMUmzFfC9DR8f504C5IbOSZjhayQcsrETgmjcfzY3uQgz0A0pKsfq4uYwxOMdA0zDT6rdUvR2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781568293; c=relaxed/simple;
	bh=SUPr9326R8/I85NqmtSxzGXasITRZ38mBZxBYOCk/p0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XBqzD98346ZdSig1STPUGvAxIP/o/mvjgFQiUu5Y+1PV8Jpq4CcYOdQApq7+PAyRfK7CL5pR7d+FidHG4Dl03gzhKqo6iZwtBZauog31CI3un1ICuQTFhI3Gtti5UmjXOLPnQ9rUK+dvT93kP9opwePFFUEy/AsMUGS/ozmYV80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FfsJy/xn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=j0aZyNrJ; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65FIx7kL861025
	for <linux-media@vger.kernel.org>; Tue, 16 Jun 2026 00:04:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rZBfUegtVT46gf+3kV/ulvsSL+G4ssvBArwyOeiJ5Vw=; b=FfsJy/xnufqnSeKf
	Xze1sj8sFewclvbfiDjIz8b1Ey0OQ2aQD6MfQa55DRAYX2ltfl7GOeaZg1H0bkyj
	1cUb8/PIroEE71i/ytKj5ziy+KZ0/w9Nomc4rQ08Pjso9zMkTlsJ4LKVrtKPBsqV
	d+hr6RmmeQO90PdA6HZYYLkAxFCAAKKisqTDz+oaP8irI1M71la95XCQ9AfRuS/o
	seEN9YqtyNxGLiZVTW9qxrJM3L0LkBXoP7SErURtx8/P7kDFRGoQyKMuL+M6/IUQ
	134H5d4QNOscV4YE2mNCRLO3bRZPArHHzHIyCun60VzKyvSCqStl7hu2tkY7dxSY
	WEeEMg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eteydbmp7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 16 Jun 2026 00:04:49 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-9157c8eb597so629734385a.2
        for <linux-media@vger.kernel.org>; Mon, 15 Jun 2026 17:04:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781568289; x=1782173089; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rZBfUegtVT46gf+3kV/ulvsSL+G4ssvBArwyOeiJ5Vw=;
        b=j0aZyNrJvnTGq++YQsXSWFQ189kZ/8jPAOWCAMduKcBqv2Aw7k6wd1FlXOnp3O392H
         JaFW+yx1gbcJG2TXHsEYqkf0ZRCgjgCrjaHoaUclCAi4thNcHkpgL1A6haXVQaEkHM0e
         z8bVndarZIzPNxt1+W16VsuBZFqy1wEGvlmps2RtsCXWLYKoh1tG87Wq26sEBpaNrr97
         cFziqlwqf6QzR93UIEKg3lOAmpZbMNql9IKzTM1v5kbvJtcEhPO0Od/dKDitekjM5k+y
         CScR+oBIvHW+y1f7UxRfO0lkUJu8t58c4QVsThP9kG2sAI6bqDce+aYkLFoiopTjojRN
         OiDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781568289; x=1782173089;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rZBfUegtVT46gf+3kV/ulvsSL+G4ssvBArwyOeiJ5Vw=;
        b=BHA8ulm8uO5K+rM6B4YYXeKPOMjHR7yPLF0kmApJLYZSfvcnCW8BLUbBwLbTAsgNDl
         OtTG88F/XSY4Q4jAifURBsvEZV5skdoowoHIc8/vTcdal8L0RUVsB1BnAB28bNPefiQV
         E72IgE5J61wTtilOZJ0xNIPFR4E8BStF2lThrZDo/FfjmOK6sPJfCkkNmG4UTha7Di9y
         UoVzr3b42FeIkXgyqFV+paZsWp8CRg+pbCl8WYiIWI7wcbNB5Ydk9yyctzJzIUcWSdPo
         zeWHItciOWN1xarQJ0/mhPIc1LIKe+uzgYeNe/yF16t3Ojn6UXXZMiklGsndpJF4gC0c
         1tow==
X-Gm-Message-State: AOJu0YzlH2yMZnswU+3MB7OYU7XDAFRBgATnDcXDDPGAUWGzjHDOHGS1
	rJCcm8fpJflp2yFhfPO9JTG68K0JpG1gA3OelZpQNZn+xiNQfZ8o/DDqWwhGUnRog6/XxjrxVO1
	8dd0MWXwUbgqGdtrEN8PgGV+wbfckcJs0+cjfFXTFF8xdWlfKFLJ70NmNOO/9/qUypg==
X-Gm-Gg: Acq92OEPrx52FQO3bQ68Gj/ybdzrmWSX/lS9666BkKDGCm9cLltBhekmrcFkG0B+xuo
	7O47ngzlJgHa66deVUadfCodSPeuxLF1uWDqe9vL5SBzNJpEbCK5hjnrOswW47C4TVnta2RO1RC
	wKvG3sdgVhdaud++8N2a4U5/tgIAlf2qcES89D6yoqXefdaRZwXgitr0l4Zpe+if0EEaQxrJ8xC
	eGd8cu0bgOHKaJpCJW+M14RV2jqsnC5S/Hj+GMaJ4RGFGga/qoCdsUy4EkxhO9Y7W5eQQDBsML5
	+omLVXu5mZMCW2TGw7ScmPs83QTd2R33CBwNN4/oiaoVPv/KXPu3tPomQaBR4HawhhDiAoySp8p
	FU2d1U04kILqzgp84RxPqsdqz0omCrgkkMgCPRYQkVVnx9jsFcsc1P8A/tXTJSHXNUKoDk/6QJT
	n0yHMzbws1gqJDnWDbrCIxCMJuI+4uaOPe5+k=
X-Received: by 2002:a05:620a:2584:b0:915:a762:2735 with SMTP id af79cd13be357-91c47799fd7mr210616785a.37.1781568288706;
        Mon, 15 Jun 2026 17:04:48 -0700 (PDT)
X-Received: by 2002:a05:620a:2584:b0:915:a762:2735 with SMTP id af79cd13be357-91c47799fd7mr210611385a.37.1781568288243;
        Mon, 15 Jun 2026 17:04:48 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad2e1a7092sm3015731e87.50.2026.06.15.17.04.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 17:04:45 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 16 Jun 2026 03:04:30 +0300
Subject: [PATCH v5 03/16] media: iris: Introduce set_preset_register as a
 vpu_op
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260616-iris-ar50lt-v5-3-583b42770b6a@oss.qualcomm.com>
References: <20260616-iris-ar50lt-v5-0-583b42770b6a@oss.qualcomm.com>
In-Reply-To: <20260616-iris-ar50lt-v5-0-583b42770b6a@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4447;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=vk2n05YaqyNL1lA1l7CdzDHPMAEMMeRGvxRtE9L+Mhs=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqMJMO5NJZdxcfI07EHv74CzfYbRVDgOfSBpbS8
 806WVLBtjaJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCajCTDgAKCRCLPIo+Aiko
 1SjLCACJ5iSuZLJwO8U75b0uzLQeYt+gmFY3mI/wLagM2FIkoI0BQ96Lwsg752FdWyVLN/zljXb
 khsPudaw7J+KmYEAAgzaUXnZvddLDp4vDrOI8t/4YT/DnxCZnkplOkz354R4JLctbM4EHkFUMUk
 UnksLH8SLokRxeJjTHQmHYPI/N+XlNmbn9o8dJTzFApDyGRyADxut5VoQSuphwj/YGKiMBegWjQ
 qaD7iEG82M/szol637TL78y8pZl74VbLnDd/RDyMasQbBSPucTgQAQgIS0ceAYduk5TzHXPwnJE
 tXNL2gg5CxCPZhysCmC39A2p5q7WrWAPk5Qla8sqRl+za7ID
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: m80yJ5GoF8m0PvMkmm7j1sov3AaRRBcJ
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDI1NCBTYWx0ZWRfX/d0E+fiuCOTy
 FyPyPbJmqF3fHRCOEKOnzt5SJC8mrn/but7E4kPgNuNPKBykAGe21LYyPPQQy7CtM0TNoOfINFs
 SBkGn/nhfEfD+U2qYTbEWUsSV5fjjvI=
X-Authority-Analysis: v=2.4 cv=QrJuG1yd c=1 sm=1 tr=0 ts=6a309321 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=4Uh0hlRDs2lXuULb_e4A:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: m80yJ5GoF8m0PvMkmm7j1sov3AaRRBcJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDI1NCBTYWx0ZWRfXwH3TijcjbJyx
 1tnZBAak56VXi6J5jXWPDl05kGZfM8FYB15uIuIaDTkAkIjDIU4c21zCGnpi/5ocfIYV1qZIg8z
 nr7EfP+7kbMwcU+huwcpufwpQDIMOdV1/Kyu9A6z3OLzbOw3/Aq3X+e+laIB8vI8f2GcpjieJi5
 72n4t4HuBXYL+NBcPmVbNkPWF7ywbuSxI9+3JmcOaib388cU75gSHooqmxJJig7pEMNojhnCf5I
 Ur+i6DyViW+DuzCNHns6Dy9rNqLY0Kd6JVLJMUi1zv6u91sIGNTwo0oCLSiwIMLIjk9SM6uA6bM
 ywQWr3Sdd+ayLXFB+hk5PYtoNoBK3mXCO4DdqxsMUIiOMpUx8rRzB6nmELZ9VJ4yKgzeTJefAIy
 tSc0OXkf+sBAS5hDQiXkd0uHTHcdvXCEc6L/jJrONOnEsE3SD+MGRy8jWMteas678wApVoUgZWs
 bKmNItOFpq2iQSgJ9yQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_05,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 phishscore=0 spamscore=0 impostorscore=0 malwarescore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606150254
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-64943-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:vikash.garodia@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:mchehab@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:busanna.reddy@oss.qualcomm.com,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:dikshita.agarwal@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
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
X-Rspamd-Queue-Id: 1977A68ACB6

From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>

The set_preset_registers sequence is currently shared across all
supported devices. Starting with Qualcomm QCM2290 (AR50LT), the register
programming would differ.

Move set_preset_register into a vpu_op to allow per-device
customization.

This change prepares the driver for upcoming hardware variants.
No functional change so far for existing devices.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Reviewed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_vpu2.c       | 1 +
 drivers/media/platform/qcom/iris/iris_vpu3x.c      | 3 +++
 drivers/media/platform/qcom/iris/iris_vpu4x.c      | 1 +
 drivers/media/platform/qcom/iris/iris_vpu_common.c | 2 +-
 drivers/media/platform/qcom/iris/iris_vpu_common.h | 1 +
 5 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/iris_vpu2.c b/drivers/media/platform/qcom/iris/iris_vpu2.c
index b8714dcbad10..2dc121a3f5e8 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu2.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu2.c
@@ -45,4 +45,5 @@ const struct vpu_ops iris_vpu2_ops = {
 	.power_on_controller = iris_vpu_power_on_controller,
 	.calc_freq = iris_vpu2_calc_freq,
 	.set_hwmode = iris_vpu_set_hwmode,
+	.set_preset_registers = iris_vpu_set_preset_registers,
 };
diff --git a/drivers/media/platform/qcom/iris/iris_vpu3x.c b/drivers/media/platform/qcom/iris/iris_vpu3x.c
index 3dad47be78b5..dc02ced1b931 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu3x.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu3x.c
@@ -261,6 +261,7 @@ const struct vpu_ops iris_vpu3_ops = {
 	.power_on_controller = iris_vpu_power_on_controller,
 	.calc_freq = iris_vpu3x_vpu4x_calculate_frequency,
 	.set_hwmode = iris_vpu_set_hwmode,
+	.set_preset_registers = iris_vpu_set_preset_registers,
 };
 
 const struct vpu_ops iris_vpu33_ops = {
@@ -270,6 +271,7 @@ const struct vpu_ops iris_vpu33_ops = {
 	.power_on_controller = iris_vpu_power_on_controller,
 	.calc_freq = iris_vpu3x_vpu4x_calculate_frequency,
 	.set_hwmode = iris_vpu_set_hwmode,
+	.set_preset_registers = iris_vpu_set_preset_registers,
 };
 
 const struct vpu_ops iris_vpu35_ops = {
@@ -280,4 +282,5 @@ const struct vpu_ops iris_vpu35_ops = {
 	.program_bootup_registers = iris_vpu35_vpu4x_program_bootup_registers,
 	.calc_freq = iris_vpu3x_vpu4x_calculate_frequency,
 	.set_hwmode = iris_vpu_set_hwmode,
+	.set_preset_registers = iris_vpu_set_preset_registers,
 };
diff --git a/drivers/media/platform/qcom/iris/iris_vpu4x.c b/drivers/media/platform/qcom/iris/iris_vpu4x.c
index 02e100a4045f..f608a297d4a3 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu4x.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu4x.c
@@ -368,4 +368,5 @@ const struct vpu_ops iris_vpu4x_ops = {
 	.program_bootup_registers = iris_vpu35_vpu4x_program_bootup_registers,
 	.calc_freq = iris_vpu3x_vpu4x_calculate_frequency,
 	.set_hwmode = iris_vpu4x_set_hwmode,
+	.set_preset_registers = iris_vpu_set_preset_registers,
 };
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.c b/drivers/media/platform/qcom/iris/iris_vpu_common.c
index ab41da1f47c8..a49113b0da23 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_common.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu_common.c
@@ -483,7 +483,7 @@ int iris_vpu_power_on(struct iris_core *core)
 
 	iris_opp_set_rate(core->dev, freq);
 
-	iris_vpu_set_preset_registers(core);
+	core->iris_platform_data->vpu_ops->set_preset_registers(core);
 
 	iris_vpu_interrupt_init(core);
 	core->intr_status = 0;
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.h b/drivers/media/platform/qcom/iris/iris_vpu_common.h
index 09799a375c14..21ed4c9bd5e3 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_common.h
+++ b/drivers/media/platform/qcom/iris/iris_vpu_common.h
@@ -22,6 +22,7 @@ struct vpu_ops {
 	void (*program_bootup_registers)(struct iris_core *core);
 	u64 (*calc_freq)(struct iris_inst *inst, size_t data_size);
 	int (*set_hwmode)(struct iris_core *core);
+	void (*set_preset_registers)(struct iris_core *core);
 };
 
 int iris_vpu_boot_firmware(struct iris_core *core);

-- 
2.47.3


