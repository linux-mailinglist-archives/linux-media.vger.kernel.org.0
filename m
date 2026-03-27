Return-Path: <linux-media+bounces-57395-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id K37zCysUx2mWSgUAu9opvQ
	(envelope-from <linux-media+bounces-57395-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 28 Mar 2026 00:35:07 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 79F8934C57D
	for <lists+linux-media@lfdr.de>; Sat, 28 Mar 2026 00:35:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5A61130D483E
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 23:29:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C58AE376BF2;
	Fri, 27 Mar 2026 23:29:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="c9Ss2vws";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dL2p8eR4"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EBE42EFD95
	for <linux-media@vger.kernel.org>; Fri, 27 Mar 2026 23:29:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774654148; cv=none; b=bD7cqD2eSZ4SN2l+6QTb8T3W6y2CQhpWWf2F9yE48oeBdt8UEsxDEqlb7/m0oTFTUVMiKwyK9GHSW8nqXKByQzo7YziNiNecWupvMMHnVjFDpXysOo5c63izkNvGUmEfNwCJwN7xqBApF3HiDW1Q8iolSjoCUyU3/HKLLX1mhjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774654148; c=relaxed/simple;
	bh=mN2B8mMErlly0rhOY6EnYewAknm6tdZRVcCuF6xiQiQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KOW1yhRY9ScpNwlGU5WYZPSlmj1JPpY9kp/dWEnoF1ZN2JRzZsGQVsEpmsBaAwwt5PsWmc7QwnMsqzRVZW7RkBleuAfxnTxXfKvts20mGL1NRvnuG6yDLlpFtWN93sDAdIwUgfP9yaxUIbPM004nzdRoiWmEFePVqlryqPd71g4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=c9Ss2vws; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dL2p8eR4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62RN42kb772927
	for <linux-media@vger.kernel.org>; Fri, 27 Mar 2026 23:29:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	X3roVKO9HbGyFQCP9qFC8PS8kvPsGONebIVZO3TAK2Y=; b=c9Ss2vwsNBKl2Q3r
	SxtTLc47Zt6UcpP6NpQjlQTMZSC8WfC890IrmbzmobGJ90IlzWY9uxKUcSoe8qJ/
	FbhzGiahJv/8JOEvrRxIJ8P3H0txfB85bENJAefatEn8fV6UZU/pbHIBBMZD9aWq
	mWoKH0BgMilv4+ZO0w/5bPh6kGYDduVio4bCG13AVF4MjNQnD6s9mpYNk1+uk83v
	aXaKjaeQGBzhAlSu5oQFmYoFdUxAKdXrEnp7xS+YmX5enAOl/FcrbMJr/inqOceS
	Unr7dQpIgWYbdkVosGk1J/hd1I1tZY8hxJRyFqsNMurrV5YAldBSkQIIxj2grlZD
	3W2sUQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d5sxhhyhg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 27 Mar 2026 23:29:04 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50b323c43fdso19456941cf.2
        for <linux-media@vger.kernel.org>; Fri, 27 Mar 2026 16:29:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774654143; x=1775258943; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X3roVKO9HbGyFQCP9qFC8PS8kvPsGONebIVZO3TAK2Y=;
        b=dL2p8eR4tptS7hIqSSmrlPMZ1B3jQTHDU102r+XXhrFm2UWaQJQBAjGv0cxNhLBWWU
         pmtTdw1PYwKwO+H3cngFddThzrZHYBK8tzI+V6VKyhgfo7ZqJpq8E3bQkW5n4g7ZmkXM
         B5mhHdmLVebrVC1iiOcc4Q78FlDOzHvAE7CbYVHMZ1VRZpdaNf925n52U6iyi6LGuZ4B
         IqK/Wq6crcifs8GhhMMgguFwxY/1hC6RfgDddaswWfw+SnVuuc30CTSod5RTJYGQDNav
         mMfbXKd5iPcao07O9fctNzYtPVYMnC9c8TpsNCs618YD1CfpCBRRvp1i5uzbwPzwoj3M
         5+6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774654143; x=1775258943;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=X3roVKO9HbGyFQCP9qFC8PS8kvPsGONebIVZO3TAK2Y=;
        b=R0ZwHXWqzvFulWc3li2YtiJXQtmSAT08V5QkIoGMXS+RX7yu9dlj7CMd0VN7rEchW0
         EUHPfz54AHvJVgWkHlsxsd+3zM+Ep/KXXS93jxuxQTr9m5aNfp+sJLuwDAUA0lanAkF8
         sy2pab57DHBoC0JCKS8ElSUP847AXPiNrhXSeQo/qtUOfTm+Tl7z+MSffiwj+e3v+M2p
         nCabVRPC5T4EgqrDbAkeJphuO6rQ4oYkttkLW8Mcyn0YKOLJKW8bhYE3a4Iqb1EhWW7z
         edTiCBBsp+fwG7Dpn/RpqHyh5GBNNCD0CXT6goacfo30UbZnica3zx1wJCS+yagQAngj
         OQmQ==
X-Gm-Message-State: AOJu0YxXVZLd+1oJ4eTSHtvWzWZuZLKFhBXuq7CsUZ7OXI3GY2CmgLZ8
	HZqpYsbI+AggS276k+dOlOrGXb1LPFS0Ft1HIViYa8Boyfa1TuaELQtv5ICPaQcIQBLgUE4tN1U
	BjXWZgAY4zGntANLYGGefUe/NUmqgtv0VTW4gPUlmr8z3qHsnuZuN00E1pJ/IGPY8Dw==
X-Gm-Gg: ATEYQzyApok9n3DCdyLVXXlkWYQlkXLnp3BHngh0q+9o8WoGWnDc1ingAHlcgKXB/XS
	TeEHme0itq98ZidOSsTY9Q9Cu70FTtWwZcuba5KgxXgCB8AAtN6WX+iWE/fdWA9y+ptEAadVnPF
	pLIvQFXyjeK/SZuQdf1Cpgkh8CpFLZqPqyty8bmyqPYDDL8XZ71N9WldMN2aRGEvf+ro4btbGjl
	tIMuuOYLD0Ox+DbQwDn0TgzO2KKTnlJZsEC2jfX/OnzcrEL25aomwmwIW3pn9/wCptAPUzYj3uY
	/VeV0o3OoXrA12qsbUVD+eDAeCiJm9AN5s3i4InF9ZRJm08GqJaQzLH4atAGi1U5DMCD+IJ8d6m
	v1y4lfbmVMWQQH3W+UmHFYpyc/n1/ZMLYbOazc/XwewxUL1A+JWxpZDjYRX2Zg+au6PLzAjUsym
	dllfye81sYTjB6g5nd2xlTrpGJFqY8spl0L6w=
X-Received: by 2002:a05:622a:112:b0:509:348f:bc1a with SMTP id d75a77b69052e-50ba380a83cmr64799031cf.26.1774654143369;
        Fri, 27 Mar 2026 16:29:03 -0700 (PDT)
X-Received: by 2002:a05:622a:112:b0:509:348f:bc1a with SMTP id d75a77b69052e-50ba380a83cmr64798811cf.26.1774654142934;
        Fri, 27 Mar 2026 16:29:02 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38c83729522sm1177991fa.14.2026.03.27.16.29.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 16:29:00 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 28 Mar 2026 01:28:41 +0200
Subject: [PATCH v10 06/11] media: qcom: iris: move get_instance to
 iris_hfi_sys_ops
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260328-iris-platform-data-v10-6-46b92bfe7b52@oss.qualcomm.com>
References: <20260328-iris-platform-data-v10-0-46b92bfe7b52@oss.qualcomm.com>
In-Reply-To: <20260328-iris-platform-data-v10-0-46b92bfe7b52@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=9259;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=mN2B8mMErlly0rhOY6EnYewAknm6tdZRVcCuF6xiQiQ=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpxxKopP+XuPMDggwn0LhwPGjWJdziRQP26rtLm
 hHPaCAbkBGJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaccSqAAKCRCLPIo+Aiko
 1Z0LB/9msNlqSH7tW8qtDYs1MbYGwUORgRNu6HlmjIH0FdlIqJgLoAX3/YB6lzMINmdsL2Yyvvi
 I04isIeSiA9HIq/L6lpX3NuIp78QqThlcfuU5lCRlem15KEdZg+wjukZbC3tcVl3eS4mwVxt887
 UyBfAAyr9j4X7X3mPm44zRX7hSNqwyS/4oE7H1QJYlAQGcNsyA0Vyh71jgPLKNQLlkLiHqhBilc
 W01e0YfwYe1DYbQT6KuCIyicmuSSr7tfshY2BDmrWtSsHtLmYPE6vDRUlz00rodjt0NSXt6EOKa
 sv6BKAi4SWiGDJjXB7votLKjRy6L1xpHaPPot8m56VllPGFV
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=QZVrf8bv c=1 sm=1 tr=0 ts=69c712c0 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=2oeCRJBNelE_HTcD8YQA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: sr21YbB2WicQN4ipVATezEHIJvvSgU3T
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDE2NSBTYWx0ZWRfX9TbbZZZad5qg
 i35jMF1da81Ra/yUURMbqc8/xx51NCWIUuac3n+GrOgLEwFJJgPbp2fol+42TdCKwA7Tu/vT4Jv
 dYd7PsQOms08IB367nNnKeFAxBRoXY3+dc72uLrZyytbKkDQhHA3+ihVE7KYnuIkNMV4/USZ9Yb
 539mzoelW3K7Mbaeb+wqXs8W/oEpSSWvwAdcrvNa5XCa4Tquxst6WBusd1I2/gCxhzurPqs+28f
 k/sUXLLAu8GNfLa+iMTTt1n2gXc7WVRhFqh1XkIjml0QFw0kmkzJKlMveyOCW/pdo4AwLT8Nx0w
 GphamPm5VkkRClX0oOhdQeEJUbovgiGmkWglsZPYWoA2t5T5Tff6ztK+tIi2+93KC2VoRwk++Jd
 /Ycd8rZ3qH2LAtahJivO7nmDoBwEdfNLmQVoHTWWGY7QAU7D3V2zUQJGiy1ZGa1LwXJBCmGVkqX
 NK5LY1HGaQ6GCZamncw==
X-Proofpoint-GUID: sr21YbB2WicQN4ipVATezEHIJvvSgU3T
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-27_02,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 clxscore=1015 spamscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 lowpriorityscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603270165
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-57395-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 79F8934C57D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The get_instance() is a callback tightly connected to the HFI
implementation. Move it into the new iris_hfi_sys_ops structure, merging
all core callbacks into a single vtable.

Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_hfi_common.h |  2 ++
 drivers/media/platform/qcom/iris/iris_hfi_gen1.h   |  2 --
 .../platform/qcom/iris/iris_hfi_gen1_command.c     | 28 ++++++++++----------
 drivers/media/platform/qcom/iris/iris_hfi_gen2.h   |  1 -
 .../platform/qcom/iris/iris_hfi_gen2_command.c     | 30 ++++++++++++----------
 .../platform/qcom/iris/iris_platform_common.h      |  1 -
 .../media/platform/qcom/iris/iris_platform_gen1.c  |  2 --
 .../media/platform/qcom/iris/iris_platform_gen2.c  |  4 ---
 drivers/media/platform/qcom/iris/iris_vidc.c       |  2 +-
 9 files changed, 34 insertions(+), 38 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_common.h b/drivers/media/platform/qcom/iris/iris_hfi_common.h
index 9aa84a1d8f95..a27447eb2519 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_common.h
+++ b/drivers/media/platform/qcom/iris/iris_hfi_common.h
@@ -112,6 +112,8 @@ struct iris_hfi_sys_ops {
 	int (*sys_pc_prep)(struct iris_core *core);
 
 	void (*sys_hfi_response_handler)(struct iris_core *core);
+
+	struct iris_inst *(*sys_get_instance)(void);
 };
 
 struct iris_hfi_session_ops {
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1.h b/drivers/media/platform/qcom/iris/iris_hfi_gen1.h
index 38e9d262d7df..c37adf65055a 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1.h
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1.h
@@ -7,10 +7,8 @@
 #define __IRIS_HFI_GEN1_H__
 
 struct iris_core;
-struct iris_inst;
 
 void iris_hfi_gen1_sys_ops_init(struct iris_core *core);
 void iris_hfi_gen1_response_handler(struct iris_core *core);
-struct iris_inst *iris_hfi_gen1_get_instance(void);
 
 #endif
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
index 26b7feb05d15..0017ade4adbd 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
@@ -1076,6 +1076,19 @@ static const struct iris_hfi_session_ops iris_hfi_gen1_session_ops = {
 	.session_close = iris_hfi_gen1_session_close,
 };
 
+static struct iris_inst *iris_hfi_gen1_get_instance(void)
+{
+	struct iris_inst *out;
+
+	out = kzalloc_obj(*out);
+	if (!out)
+		return NULL;
+
+	out->hfi_session_ops = &iris_hfi_gen1_session_ops;
+
+	return out;
+}
+
 static const struct iris_hfi_sys_ops iris_hfi_gen1_sys_ops = {
 	.sys_init = iris_hfi_gen1_sys_init,
 	.sys_image_version = iris_hfi_gen1_sys_image_version,
@@ -1083,22 +1096,11 @@ static const struct iris_hfi_sys_ops iris_hfi_gen1_sys_ops = {
 	.sys_pc_prep = iris_hfi_gen1_sys_pc_prep,
 
 	.sys_hfi_response_handler = iris_hfi_gen1_response_handler,
+
+	.sys_get_instance = iris_hfi_gen1_get_instance,
 };
 
 void iris_hfi_gen1_sys_ops_init(struct iris_core *core)
 {
 	core->hfi_sys_ops = &iris_hfi_gen1_sys_ops;
 }
-
-struct iris_inst *iris_hfi_gen1_get_instance(void)
-{
-	struct iris_inst *out;
-
-	out = kzalloc_obj(*out);
-	if (!out)
-		return NULL;
-
-	out->hfi_session_ops = &iris_hfi_gen1_session_ops;
-
-	return out;
-}
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2.h b/drivers/media/platform/qcom/iris/iris_hfi_gen2.h
index 6cc6d9890c12..21ab58e0aa84 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2.h
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2.h
@@ -36,6 +36,5 @@ struct iris_inst_hfi_gen2 {
 
 void iris_hfi_gen2_sys_ops_init(struct iris_core *core);
 void iris_hfi_gen2_response_handler(struct iris_core *core);
-struct iris_inst *iris_hfi_gen2_get_instance(void);
 
 #endif
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
index 0c98d680bf09..639b75fca1ab 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
@@ -1315,6 +1315,20 @@ static const struct iris_hfi_session_ops iris_hfi_gen2_session_ops = {
 	.session_close = iris_hfi_gen2_session_close,
 };
 
+static struct iris_inst *iris_hfi_gen2_get_instance(void)
+{
+	struct iris_inst_hfi_gen2 *out;
+
+	/* The allocation is intentionally larger than struct iris_inst. */
+	out = kzalloc_obj(*out);
+	if (!out)
+		return NULL;
+
+	out->inst.hfi_session_ops = &iris_hfi_gen2_session_ops;
+
+	return &out->inst;
+}
+
 static const struct iris_hfi_sys_ops iris_hfi_gen2_sys_ops = {
 	.sys_init = iris_hfi_gen2_sys_init,
 	.sys_image_version = iris_hfi_gen2_sys_image_version,
@@ -1322,23 +1336,11 @@ static const struct iris_hfi_sys_ops iris_hfi_gen2_sys_ops = {
 	.sys_pc_prep = iris_hfi_gen2_sys_pc_prep,
 
 	.sys_hfi_response_handler = iris_hfi_gen2_response_handler,
+
+	.sys_get_instance = iris_hfi_gen2_get_instance,
 };
 
 void iris_hfi_gen2_sys_ops_init(struct iris_core *core)
 {
 	core->hfi_sys_ops = &iris_hfi_gen2_sys_ops;
 }
-
-struct iris_inst *iris_hfi_gen2_get_instance(void)
-{
-	struct iris_inst_hfi_gen2 *out;
-
-	/* The allocation is intentionally larger than struct iris_inst. */
-	out = kzalloc_obj(*out);
-	if (!out)
-		return NULL;
-
-	out->inst.hfi_session_ops = &iris_hfi_gen2_session_ops;
-
-	return &out->inst;
-}
diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index 6b76a9046f9a..d1daef2d874b 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -203,7 +203,6 @@ enum platform_pm_domain_type {
 
 struct iris_platform_data {
 	void (*init_hfi_ops)(struct iris_core *core);
-	struct iris_inst *(*get_instance)(void);
 	u32 (*get_vpu_buffer_size)(struct iris_inst *inst, enum iris_buffer_type buffer_type);
 	const struct vpu_ops *vpu_ops;
 	const struct icc_info *icc_tbl;
diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen1.c b/drivers/media/platform/qcom/iris/iris_platform_gen1.c
index dc74da04771b..9925a893b404 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_gen1.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_gen1.c
@@ -333,7 +333,6 @@ static const u32 sm8250_enc_ip_int_buf_tbl[] = {
 };
 
 const struct iris_platform_data sm8250_data = {
-	.get_instance = iris_hfi_gen1_get_instance,
 	.init_hfi_ops = &iris_hfi_gen1_sys_ops_init,
 	.get_vpu_buffer_size = iris_vpu_buf_size,
 	.vpu_ops = &iris_vpu2_ops,
@@ -385,7 +384,6 @@ const struct iris_platform_data sm8250_data = {
 };
 
 const struct iris_platform_data sc7280_data = {
-	.get_instance = iris_hfi_gen1_get_instance,
 	.init_hfi_ops = &iris_hfi_gen1_sys_ops_init,
 	.get_vpu_buffer_size = iris_vpu_buf_size,
 	.vpu_ops = &iris_vpu2_ops,
diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
index 19e99e1c2aff..10a972f96cbe 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
@@ -907,7 +907,6 @@ static const u32 sm8550_enc_op_int_buf_tbl[] = {
 };
 
 const struct iris_platform_data sm8550_data = {
-	.get_instance = iris_hfi_gen2_get_instance,
 	.init_hfi_ops = iris_hfi_gen2_sys_ops_init,
 	.get_vpu_buffer_size = iris_vpu_buf_size,
 	.vpu_ops = &iris_vpu3_ops,
@@ -1006,7 +1005,6 @@ const struct iris_platform_data sm8550_data = {
  * - fwname to "qcom/vpu/vpu33_p4.mbn"
  */
 const struct iris_platform_data sm8650_data = {
-	.get_instance = iris_hfi_gen2_get_instance,
 	.init_hfi_ops = iris_hfi_gen2_sys_ops_init,
 	.get_vpu_buffer_size = iris_vpu33_buf_size,
 	.vpu_ops = &iris_vpu33_ops,
@@ -1100,7 +1098,6 @@ const struct iris_platform_data sm8650_data = {
 };
 
 const struct iris_platform_data sm8750_data = {
-	.get_instance = iris_hfi_gen2_get_instance,
 	.init_hfi_ops = iris_hfi_gen2_sys_ops_init,
 	.get_vpu_buffer_size = iris_vpu33_buf_size,
 	.vpu_ops = &iris_vpu35_ops,
@@ -1196,7 +1193,6 @@ const struct iris_platform_data sm8750_data = {
  * - inst_caps to platform_inst_cap_qcs8300
  */
 const struct iris_platform_data qcs8300_data = {
-	.get_instance = iris_hfi_gen2_get_instance,
 	.init_hfi_ops = iris_hfi_gen2_sys_ops_init,
 	.get_vpu_buffer_size = iris_vpu_buf_size,
 	.vpu_ops = &iris_vpu3_ops,
diff --git a/drivers/media/platform/qcom/iris/iris_vidc.c b/drivers/media/platform/qcom/iris/iris_vidc.c
index 7e03d63578e1..ecd8a20fedbf 100644
--- a/drivers/media/platform/qcom/iris/iris_vidc.c
+++ b/drivers/media/platform/qcom/iris/iris_vidc.c
@@ -156,7 +156,7 @@ int iris_open(struct file *filp)
 
 	pm_runtime_put_sync(core->dev);
 
-	inst = core->iris_platform_data->get_instance();
+	inst = core->hfi_sys_ops->sys_get_instance();
 	if (!inst)
 		return -ENOMEM;
 

-- 
2.47.3


