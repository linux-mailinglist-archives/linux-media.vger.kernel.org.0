Return-Path: <linux-media+bounces-66911-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id gNGiMtt+TWqI1AEAu9opvQ
	(envelope-from <linux-media+bounces-66911-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 08 Jul 2026 00:34:03 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F257A7201D2
	for <lists+linux-media@lfdr.de>; Wed, 08 Jul 2026 00:34:02 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=S0ZxeO5E;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=f+xXrhda;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66911-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-66911-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6F24830C490E
	for <lists+linux-media@lfdr.de>; Tue,  7 Jul 2026 22:29:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BA753D952E;
	Tue,  7 Jul 2026 22:29:26 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EE4547D938
	for <linux-media@vger.kernel.org>; Tue,  7 Jul 2026 22:29:23 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783463365; cv=none; b=HALRdTNoY5KzwK7dttR6dvDkky/dmtTAAKr42LaPDUCv4B9e5BxVgwp+VG8Zl0mhLU0z9rZDXHjki49RueWP6qlPqarab3zCvnFGhztr1phl7JKLnhkWgOGlxbNLr5ebbsg5166G5ESQe1SZszY10nGgoSGuoTHr6U7S4bhij78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783463365; c=relaxed/simple;
	bh=acnsSKVi2aqjcn7maAiEpfFJlJtCDzjZpY88Lh3Q2Mc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=difu0ADjmg0Cwngq6vz++i2uQswPm/TpTX0kK/uWmTxu9AuBQg6nmpFjGU7YyfamJbMsyTeQCRb7TyJaPmd+tg4ppU38h2mAU5aNxG6TyrYeEWKY3DM6TK09YOZfkOxGs2tN7TQ/+aS+K8ICxQv8DJDyZvjGrFBob2Jw9xg6CiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=S0ZxeO5E; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=f+xXrhda; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 667J5IqE495628
	for <linux-media@vger.kernel.org>; Tue, 7 Jul 2026 22:29:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ahPRS5ACQmds6jy0ulyWNZqZH4qS5C1qdXBV3RFWmSE=; b=S0ZxeO5ESh+IYmYd
	ebndsYR4vFL7FSGBqOy18kymau0Q5/8KBEdhJyzfBGGwNaDUQZyupxkdPIi6O3lD
	7f1R5JroS/SBbGJTb0OuZ+xEj3CuCqeR7j1oYq8OJz4v+8atkQiUFkRYhStB5oYq
	v2P5DfG6mJGOsVIIXUB7UnRRRqT04opB3/uGCbmSkyspETPQdD4WUMeoC5ZoKzar
	lEV/Rq3DBvUiHNzGNumfyATcSjdb9PkEYZixcqToEqe4ioMFKKB7QKEaEly0uRsA
	qvy3eTQsAqUxUVQKXGHr0YJ8MniTyzh5XBBKPWHEAS+EtV6rW7UAWh1nQhKKTAmj
	i0AJdg==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8ye0k2c0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 07 Jul 2026 22:29:23 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-969289fca9dso32418241.1
        for <linux-media@vger.kernel.org>; Tue, 07 Jul 2026 15:29:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783463362; x=1784068162; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ahPRS5ACQmds6jy0ulyWNZqZH4qS5C1qdXBV3RFWmSE=;
        b=f+xXrhdaScY5nQOZG3wWV1J7rkyO4sFgAffKgNHPQuLM8nv6YGf9zEUXX8W9n/CBE1
         4hdn14eeMNYVNrPsw/5aoiXxW0YR5ON639HXpyZgy5PcqD5eeH/GfR8mKoDvXXyuC4Ug
         xK7+5FMKdsH/B5ZNnNGH3ICjv/VldqhEQn8RoZq3KbBBJ2F1edopnlS+/Z/VGejKfBqQ
         2e9F60R2tJKfSQAPSjMK2BwP5LeOhgWiiSkRhZNMMsoUQEW7MWw0NhStNkDGemcWA9pX
         Q0bq0S/akAKKvJuTlA66cqGBH0Mfe94596biaOB9b513yXMG5LwCvXaLrx5A3zueBSV7
         q85Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783463362; x=1784068162;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ahPRS5ACQmds6jy0ulyWNZqZH4qS5C1qdXBV3RFWmSE=;
        b=Sm1wRGMtrZ/JhMPaFCDTlk0COpYnzAiw8DL46/AYYBuwrOOsst6TobXgm3+RVkxt9+
         o75etGN115AQsvmtiTuyrid9++LSbRt+qDT4Z9xxYdBGkOAyqZwkQthWpg8QHToDl5r9
         R+dmUvfmef6s1srLYRnXrav0exaJJHiT6j2QOPA21MohIP0zewIMlp459Rvs7pb8uK6X
         aIuHoqkm57Ef+7G6rXm7NA7VsrjPiXIYvpQJWsnMCyMH60PUtwRR0qEt03WSCZuDr0tf
         Hi+0ozosjaJIMBabO/4Ok8sb7ZqoGHkUEThC4pKfCUZ3OHoWMToHeyRcqVsajr/r8u7e
         EHpg==
X-Gm-Message-State: AOJu0Yy4cpSDW1Xl7HuIFMcJi+2s9KhSX04nsWv2biM629ajhqVfnkSZ
	GpMeqYzFQgXOZYaeh48SJqciG1saBdwjXTIs2Kra5q1xuEnmpBt82ZhvjsF/10jrXe77Qtwh/59
	uBzdcZ1KbIUCmVO+jaRTpxmo0Ic4afAKu2NCp1NEX7+UpRxmdhTsKz6lkQvBRJzU5UJ4qmTG69g
	==
X-Gm-Gg: AfdE7cmQutYKBwFFwGVjJTFRvr+OOtX5Osv3vWBkFWCzjibAR5G6Y7mVeJjZd+L90la
	qGt90/Sg72hemz4O4hG0mJLzso0a79emxnGN2l3C8t/wNin9GY2XOTvhmJRcq87E3RVwQmovNNu
	eJcv8XodiBBUL86J0LLVFrJi0BA8ihvmhzJAAI7rV2aHAPIYwpewmPoaiO/cugWHCJqhhFsqjy4
	YL8QaBOYyhN5Lr4tgZykOW+esgSnnOx3oLyO36pvxKiB6jO57gyGD1Zm0XjllSEuF6JP2WsD/ZF
	KT0N4PBQXzdNwJJhh1GqGf+vIcaLAmMrbLEjDdifRZ0CCt+AFGoQEewCGUMPtuXPMCTjLESgrZh
	xaYM6GbZJHKJwndCWmFWdecyom3W1JZRqGwLdA1Mg/eu3qjTSTVRFgge/sqa4plu/VbSE95LaCJ
	bvZcccnJUI0EUhkfI3ad1sr1Ur
X-Received: by 2002:a05:6102:3589:b0:729:65e:f08c with SMTP id ada2fe7eead31-744b76d9601mr3858989137.0.1783463362266;
        Tue, 07 Jul 2026 15:29:22 -0700 (PDT)
X-Received: by 2002:a05:6102:3589:b0:729:65e:f08c with SMTP id ada2fe7eead31-744b76d9601mr3858974137.0.1783463361755;
        Tue, 07 Jul 2026 15:29:21 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39c7312bc25sm1897231fa.40.2026.07.07.15.29.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 15:29:19 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 08 Jul 2026 01:28:47 +0300
Subject: [PATCH v6 04/18] media: iris: Filter UBWC raw formats based on
 hardware capabilities
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-iris-ar50lt-v6-4-374f0a46c23b@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5132;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=QN/GQkI9t2+DaweZ0uUnFoB7t+XgnQ7MgtUodJ5uTko=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqTX2ojKjhpc7Mn1RilS1YROvN5jKC9Y8cKqhhe
 bG8arYYw/GJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCak19qAAKCRCLPIo+Aiko
 1V9rB/9STSCSCBKkSxslInLYoZung0yonFVg0rRRkhMjx9IPwkLFhHb7GrMX/sAZVxqZwiI4qYL
 U2mlYlvanIa5KbUOmciHNBEuJl0Vd+E8iCX/wZLmc7IZtA1cU57q8NSg6Dcx6klOWN/gHjflMDB
 woNntrfOQPiHE9Wh4kfIwXDj4fVxjyyXOQU1ZvFlJb7PAOA+aW5qgK/4oBxXxc7m9jn/a3YTD6j
 SQ1qh649oUyk7juoJ4CIQlwVcnw06fURP0tzbEIoWaHsvnJPxF5Qkx6Zv/9c0X8lv0Hs4E/K6Aj
 mLLQftbP64B3yxlryWXmhY8pzenTJ6R/LjbGPkVhDF4r4Foj
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: ncvQcOy66BIUw4Bij2g4arEs2Hkhb1L2
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDIyMSBTYWx0ZWRfXxmYJvn1lTMfA
 qRuC0sJlZHcMosufIBFHMDRy1A+CMNOhS5sVsuWRChcDVfgy1czJ9rCXQYg0sEoT9PPeKAitDkT
 ooKYSH688bW5BcNDSArcvhF+H8twKSw=
X-Authority-Analysis: v=2.4 cv=SZfHsPRu c=1 sm=1 tr=0 ts=6a4d7dc3 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=gsa84qigJ8via7s57H0A:9 a=QEXdDO2ut3YA:10 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-GUID: ncvQcOy66BIUw4Bij2g4arEs2Hkhb1L2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDIyMSBTYWx0ZWRfX7cVdKmrkwfzP
 8IT7uvZlrFHMNk9BsYnv3diM2EiDAwXBB5gRuokd54EsVcWtHd3VPKypBymm2vFWxs2pjl4d05k
 EPiK5gFWf3mhHpS966TCuLGRvlSVBjCgCPycH62y64NqW8IG83PcH3KhHM/omSY3/8QXjrtSd24
 n5NHTvli+6WWHjfetcd8yeSMa5vf7QJcKQ1hpQltgSKmGoeR6260N1xlbByuaUfDlBy5TSZQlvK
 8yo0jlFIZT006kFsw4HJ2pPx7cMaKkad5z4im/V4q1wD7S6h7GiR1/7Vqmlr2Fx1uFJty8/CqIx
 7LBjl9y5AKxToI5sxdx8If2pHy3bk9dQudDVIuF7VoS5VcaAR0HBNgS2Yk5IUNyHfIKth6Cekbk
 RVLg+qVVTNNaPR+hzyTBn6vBjhK/5a8WNEvzPjzB/fc2954VCdy+8XliC5JAL9zVatQaKjoX780
 RjsP+ANn0FD9IpYhz7Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_05,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 malwarescore=0 bulkscore=0 spamscore=0
 adultscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070221
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-66911-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:vikash.garodia@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:mchehab@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:busanna.reddy@oss.qualcomm.com,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:dikshita.agarwal@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F257A7201D2

From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>

The raw formats supported by Iris were previously advertised
unconditionally, assuming UBWC support on all platforms. However, some
platforms do not support UBWC which results in incorrect format
capability exposure.

Use the UBWC configuration provided by the platform to dynamically
filter raw formats at runtime. If UBWC is not supported, UBWC-based
formats are omitted from the advertised capability list, while linear
formats remain available.

Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_vdec.c | 26 ++++++++++++++++++++++----
 drivers/media/platform/qcom/iris/iris_venc.c | 25 +++++++++++++++++++++----
 2 files changed, 43 insertions(+), 8 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_vdec.c b/drivers/media/platform/qcom/iris/iris_vdec.c
index 4c8bc7aac135..9fee5f28097d 100644
--- a/drivers/media/platform/qcom/iris/iris_vdec.c
+++ b/drivers/media/platform/qcom/iris/iris_vdec.c
@@ -3,6 +3,7 @@
  * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
  */
 
+#include <linux/soc/qcom/ubwc.h>
 #include <media/v4l2-event.h>
 #include <media/v4l2-mem2mem.h>
 
@@ -69,8 +70,14 @@ static const u32 iris_vdec_formats_cap[] = {
 	V4L2_PIX_FMT_QC10C,
 };
 
+static const u32 iris_vdec_formats_noubwc_cap[] = {
+	V4L2_PIX_FMT_NV12,
+	V4L2_PIX_FMT_P010,
+};
+
 static bool check_format(struct iris_inst *inst, u32 pixfmt, u32 type)
 {
+	const struct qcom_ubwc_cfg_data *ubwc = inst->core->ubwc_cfg;
 	unsigned int size, i;
 	const u32 *fmt;
 
@@ -80,8 +87,13 @@ static bool check_format(struct iris_inst *inst, u32 pixfmt, u32 type)
 		size = inst->core->iris_platform_data->inst_iris_fmts_size;
 		break;
 	case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
-		fmt = iris_vdec_formats_cap;
-		size = ARRAY_SIZE(iris_vdec_formats_cap);
+		if (ubwc->ubwc_enc_version) {
+			fmt = iris_vdec_formats_cap;
+			size = ARRAY_SIZE(iris_vdec_formats_cap);
+		} else {
+			fmt = iris_vdec_formats_noubwc_cap;
+			size = ARRAY_SIZE(iris_vdec_formats_noubwc_cap);
+		}
 		break;
 	default:
 		return false;
@@ -110,6 +122,7 @@ static bool check_format(struct iris_inst *inst, u32 pixfmt, u32 type)
 
 static u32 find_format_by_index(struct iris_inst *inst, u32 index, u32 type)
 {
+	const struct qcom_ubwc_cfg_data *ubwc = inst->core->ubwc_cfg;
 	unsigned int size;
 	const u32 *fmt;
 
@@ -119,8 +132,13 @@ static u32 find_format_by_index(struct iris_inst *inst, u32 index, u32 type)
 		size = inst->core->iris_platform_data->inst_iris_fmts_size;
 		break;
 	case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
-		fmt = iris_vdec_formats_cap;
-		size = ARRAY_SIZE(iris_vdec_formats_cap);
+		if (ubwc->ubwc_enc_version) {
+			fmt = iris_vdec_formats_cap;
+			size = ARRAY_SIZE(iris_vdec_formats_cap);
+		} else {
+			fmt = iris_vdec_formats_noubwc_cap;
+			size = ARRAY_SIZE(iris_vdec_formats_noubwc_cap);
+		}
 		break;
 	default:
 		return 0;
diff --git a/drivers/media/platform/qcom/iris/iris_venc.c b/drivers/media/platform/qcom/iris/iris_venc.c
index 16c52ad07e2c..2f2c56bf9122 100644
--- a/drivers/media/platform/qcom/iris/iris_venc.c
+++ b/drivers/media/platform/qcom/iris/iris_venc.c
@@ -3,6 +3,7 @@
  * Copyright (c) 2022-2025 Qualcomm Innovation Center, Inc. All rights reserved.
  */
 
+#include <linux/soc/qcom/ubwc.h>
 #include <media/v4l2-event.h>
 #include <media/v4l2-mem2mem.h>
 
@@ -89,15 +90,25 @@ static const u32 iris_venc_formats_out[] = {
 	V4L2_PIX_FMT_QC08C,
 };
 
+static const u32 iris_venc_formats_noubwc_out[] = {
+	V4L2_PIX_FMT_NV12,
+};
+
 static bool check_format(struct iris_inst *inst, u32 pixfmt, u32 type)
 {
+	const struct qcom_ubwc_cfg_data *ubwc = inst->core->ubwc_cfg;
 	unsigned int size, i;
 	const u32 *fmt;
 
 	switch (type) {
 	case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
-		fmt = iris_venc_formats_out;
-		size = ARRAY_SIZE(iris_venc_formats_out);
+		if (ubwc->ubwc_enc_version) {
+			fmt = iris_venc_formats_out;
+			size = ARRAY_SIZE(iris_venc_formats_out);
+		} else {
+			fmt = iris_venc_formats_noubwc_out;
+			size = ARRAY_SIZE(iris_venc_formats_noubwc_out);
+		}
 		break;
 	case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
 		fmt = iris_venc_formats_cap;
@@ -117,13 +128,19 @@ static bool check_format(struct iris_inst *inst, u32 pixfmt, u32 type)
 
 static u32 find_format_by_index(struct iris_inst *inst, u32 index, u32 type)
 {
+	const struct qcom_ubwc_cfg_data *ubwc = inst->core->ubwc_cfg;
 	unsigned int size;
 	const u32 *fmt;
 
 	switch (type) {
 	case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
-		fmt = iris_venc_formats_out;
-		size = ARRAY_SIZE(iris_venc_formats_out);
+		if (ubwc->ubwc_enc_version) {
+			fmt = iris_venc_formats_out;
+			size = ARRAY_SIZE(iris_venc_formats_out);
+		} else {
+			fmt = iris_venc_formats_noubwc_out;
+			size = ARRAY_SIZE(iris_venc_formats_noubwc_out);
+		}
 		break;
 	case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
 		fmt = iris_venc_formats_cap;

-- 
2.47.3


