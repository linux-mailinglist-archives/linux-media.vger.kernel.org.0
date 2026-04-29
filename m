Return-Path: <linux-media+bounces-59936-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SIYzK6i38WngjwEAu9opvQ
	(envelope-from <linux-media+bounces-59936-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 29 Apr 2026 09:47:52 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 233F4490B62
	for <lists+linux-media@lfdr.de>; Wed, 29 Apr 2026 09:47:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2CB7330B1507
	for <lists+linux-media@lfdr.de>; Wed, 29 Apr 2026 07:44:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A81B13A7F52;
	Wed, 29 Apr 2026 07:44:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pEOTYkVm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DQN/kdoW"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D2313A6EF5
	for <linux-media@vger.kernel.org>; Wed, 29 Apr 2026 07:44:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777448663; cv=none; b=efFkYIBmg9Yr00lRu9sWysdydzE2J7p9aJ7DeV1sKqzoOmeckWeortGyHUBu8vuj/9KAm+OdrpYiDgqAzB8ZfkABtccmHNWHGjOd0/Xm/Q64i2UyG0YYAXtbtDZ0QRcol/AYXtscRj8FzKkAYBmJVNACL6CSnN1U0I2HhQ8ARRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777448663; c=relaxed/simple;
	bh=IVMOjjeOvVzA34ONEIzI9yOomKhrFD3snmXGZuN/fhk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mroiQEfbRVFszfyv9G9XtmVWsqupCv8zgvL1r/U7R4J2FJB4Xr9davRH4iMgAnRoOkQAmsVNvWJcKclGOc/68JLjeG4062lrFQs2EfXngQCKGynJLwjUTvgHrU8CYvQ8PohpbRN8g3AUtnZxEPtoiM5aBhODp53Osm9yAFEeoJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pEOTYkVm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DQN/kdoW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63T1QwCb3705148
	for <linux-media@vger.kernel.org>; Wed, 29 Apr 2026 07:44:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jrwpLPifDsLwhC1CYMFolsR2RenoGcmSmM2DcBjyNLY=; b=pEOTYkVmR2g2pAaw
	cjTo3V6SwYGLFgDHfByQN/PDUH46QdePidNAvx8X6Ad5q10ywnIEZfDbztLp2hCb
	P7gm7Y/NPv9OSva/dCBSLcsLa6I35igZxHoF9bK1jcgT/GsoqY/zfl2nNeA+HpCA
	YHFN0aS6b0Uo7N9+6J5wbv1F6bQZyiVZDGOxkETvzSTYPABTaX2JFm8E3prNWyyz
	lP9V9YwfGZJJBZ0pl5NLoTgUfeW7cvl+v5mLWh7gHrrffTiWFV069nzqrquweNUe
	SKbbVmkjmQv9lIig2qosSHIt1mJjawpENzfu3/cX980uxMHLx+GWD61rpx2nFMcg
	26cj/w==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dttxhcaj7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 29 Apr 2026 07:44:17 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c70ea91bfe1so6569607a12.1
        for <linux-media@vger.kernel.org>; Wed, 29 Apr 2026 00:44:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777448656; x=1778053456; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jrwpLPifDsLwhC1CYMFolsR2RenoGcmSmM2DcBjyNLY=;
        b=DQN/kdoWxHkfJseHYcRmG2g7JslqgdpDheyRI1nrypGqwMOhOsSEChtjb0Y3L2Cv8n
         Ud2quXmfI/80aDgFCXUf2wk3dpilNofAe7dWnLtYsvTvNpeYYQQE6a0i3sPYlv9OD4HN
         Y5exZv/M6aZZHTPx/57KnRUZIDS2FbSQaAkTMcwc1ECSBgCNcCV1pbHYzHTni6hmNAGq
         SCRSx9cLzZFZBM7NLmgvjxuv8PIkzlVkaFZLxdWejsebsK27NxhKG7IUkgRMVBvwI+gT
         8tbvpE2xheYx9SSgNn3Xp7qq2zZiA21civnliOpCOuBX/kPAOmf94dMXtajN/TT0WtI5
         KybA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777448656; x=1778053456;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jrwpLPifDsLwhC1CYMFolsR2RenoGcmSmM2DcBjyNLY=;
        b=baJbhLqUi6TVdGf5fRloxK1+0eGjjVwRDvbq54133a/5qiTCZhSczovLSHKuuKqfil
         x3mDslOR0n4bJKGgOyhmL7Q1wYqR06rnPBsSbDxAxbFpDEYB4ZPWiko9wexjmKdO/1QZ
         KuObl6OxZFAG6APE3IQovZ3AY5p1/sY32CqUqnz006HUI1xW+t4B/C2scpD36tgL/nDV
         /iRHOrsKQ5Rbz2Dfu39+sAy3Ar/ytvHjFpCn5e5HegPLfFlOZPUDDrJdU6DdIKKjwVJ/
         j9MarE64SJyar9yD1AyeLTHya8FPtKqXYDeXS2WK33H8bPUPXyVutpYIEcoWlPX8714F
         7Ddg==
X-Gm-Message-State: AOJu0YwrE8tnBVvVZ9KQn8Ull78lyapiA+5TOc0m+Fw5zMzjAUfYJ8G8
	t4bjL8VTUqi5slhv5AFFhwbAcjaRwKvzGcqIDPS2OsYAtKxAsACOrVCOOHEyAfEx7fqFRib49gz
	DnUWMIZK7iyezoadcz3QR6eOwTcbY5l4PvFEvE22yXsi2zUfMzXnPDqaJ3SRvxemPpRyUO//Nuw
	==
X-Gm-Gg: AeBDiesyOolM+Itq37UJg5LUgCDQQEKcdVPen7QRKqrJOLStPe+dTftT8tYsyT6QhbC
	z8PuSGErZSDjn5/z3QfTy+2KyDFVol4mJlHQBQWqAOLe9uldGJz4DDguSv6TiHfMOEmYjQ5ygC2
	uicrI4GL1q4p54mRo4RUNI/nUvgPQ4rYEayIlTpuDQe0u3vsRluoF6qTW20q+qa8mlceW6MVAQK
	3PHnQVmYURvguGiOV/6YHxX0M1eY5MOb/USlrEBXfEMQtpcUFJejUIimvTM0HGPO/aKbsOpS7Ei
	jF58mkki18raE6xta6QJNeO23yBuhTxd7K2cAArSg9C8eX0mDFlFx/bsyVQCw6etS4U8+QP0DbQ
	7hVApiHekcHOHJvEYGQvV08AWco8W/2K/lAv5M5MOcp6sMVy1sy1h3LJFvw/HzVY=
X-Received: by 2002:a05:6a21:e081:b0:39b:edcd:d92f with SMTP id adf61e73a8af0-3a3af47153emr2915964637.11.1777448656220;
        Wed, 29 Apr 2026 00:44:16 -0700 (PDT)
X-Received: by 2002:a05:6a21:e081:b0:39b:edcd:d92f with SMTP id adf61e73a8af0-3a3af47153emr2915934637.11.1777448655598;
        Wed, 29 Apr 2026 00:44:15 -0700 (PDT)
Received: from WANGAOW-LAB01.ap.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c7fd6506858sm1155848a12.24.2026.04.29.00.44.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 00:44:15 -0700 (PDT)
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
Date: Wed, 29 Apr 2026 15:43:53 +0800
Subject: [PATCH v5 2/5] media: iris: Add hardware power on/off ops for
 X1P42100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260429-enable_iris_on_purwa-v5-2-438fa96da248@oss.qualcomm.com>
References: <20260429-enable_iris_on_purwa-v5-0-438fa96da248@oss.qualcomm.com>
In-Reply-To: <20260429-enable_iris_on_purwa-v5-0-438fa96da248@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wangao Wang <wangao.wang@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777448637; l=2003;
 i=wangao.wang@oss.qualcomm.com; s=20251021; h=from:subject:message-id;
 bh=IVMOjjeOvVzA34ONEIzI9yOomKhrFD3snmXGZuN/fhk=;
 b=zHRn+CRPe9RYKsWCqWea9qvi1Hh0/u/crDyXYzYHHS0vj8BXGWWOOKzL4euhyYWrPDmk6SmJP
 9K9zF3qCSupBhfuQrueqcc4UVxs34XCKSm82gA9+5YkVaLRO7KDKbJH
X-Developer-Key: i=wangao.wang@oss.qualcomm.com; a=ed25519;
 pk=bUPgYblBUAsoPyGfssbNR7ZXUSGF8v1VF4FJzSO6/aA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDA3NSBTYWx0ZWRfX/GuWGGSQxbyP
 o9847sGDfKmFzhQYL/H3QNaeMee+9ZD10lGbwWxMHqE015iuCDnWA0J2SRYN5I54tBBvLbQL220
 fT4CDEip6LUYLUnQbqgzNn5xqHWFmA/JM8hr8tX0MRgRl8DfzEzJfI3zQvo2xF/WNhWjIWUkp/5
 eznhe7g5kMPWCpREbbg0gLt6ynWT5pqMxDE9SOF1zP6fNmxU4gqz92fvsC8mKGdhlwPBdbrRbyo
 zuanLDR15U7/zpmNUAPpAwCyFtQ4fIDw0hOqcciVqY/Y7FSgv199bq9NFyH3l86zz5mSTVppmJI
 TZ1G9MLfcZpIanZGQT/bCzWBobvrnizf8FGdXSOTK3964A6m+09xBLxMzj2unY9Y0YycOp80MDM
 g72XvUYO1hHT5h9upFoywC/5ud4fIcdFM4NFJkP0J1/2Lmy5h3LkKTFLu4IoOVid85wSo8SLmu5
 PA7B/FDd52KQejE6oEw==
X-Authority-Analysis: v=2.4 cv=Uu5T8ewB c=1 sm=1 tr=0 ts=69f1b6d1 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=KtZWPW8jcQ_ObEEXPWgA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: L5h_7v6dudI7lKMbzJfVEFAG_wkbDXie
X-Proofpoint-GUID: L5h_7v6dudI7lKMbzJfVEFAG_wkbDXie
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_05,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 phishscore=0 adultscore=0 clxscore=1015
 suspectscore=0 impostorscore=0 bulkscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604290075
X-Rspamd-Queue-Id: 233F4490B62
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-59936-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,linaro.org:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wangao.wang@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

On X1P42100 the Iris block has an extra BSE clock. Wire this clock into
the power on/off sequence.

The BSE clock is used to drive the Bin Stream Engine, which is a sub-block
of the video codec hardware responsible for bitstream-level processing. It
is required to be enabled separately from the core clock to ensure proper
codec operation.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_vpu_common.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.c b/drivers/media/platform/qcom/iris/iris_vpu_common.c
index 548e5f1727fdb7543f76a1871f17257fa2360733..281b1f54cb962dedbfb0ec96ed3a5aab99b50eb8 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_common.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu_common.c
@@ -224,6 +224,7 @@ void iris_vpu_power_off_hw(struct iris_core *core)
 {
 	dev_pm_genpd_set_hwmode(core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAIN], false);
 	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAIN]);
+	iris_disable_unprepare_clock(core, IRIS_BSE_HW_CLK);
 	iris_disable_unprepare_clock(core, IRIS_HW_AHB_CLK);
 	iris_disable_unprepare_clock(core, IRIS_HW_CLK);
 }
@@ -292,12 +293,18 @@ int iris_vpu_power_on_hw(struct iris_core *core)
 	if (ret && ret != -ENOENT)
 		goto err_disable_hw_clock;
 
+	ret = iris_prepare_enable_clock(core, IRIS_BSE_HW_CLK);
+	if (ret && ret != -ENOENT)
+		goto err_disable_hw_ahb_clock;
+
 	ret = dev_pm_genpd_set_hwmode(core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAIN], true);
 	if (ret)
-		goto err_disable_hw_ahb_clock;
+		goto err_disable_bse_hw_clock;
 
 	return 0;
 
+err_disable_bse_hw_clock:
+	iris_disable_unprepare_clock(core, IRIS_BSE_HW_CLK);
 err_disable_hw_ahb_clock:
 	iris_disable_unprepare_clock(core, IRIS_HW_AHB_CLK);
 err_disable_hw_clock:

-- 
2.43.0


