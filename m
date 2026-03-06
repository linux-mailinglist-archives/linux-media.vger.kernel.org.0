Return-Path: <linux-media+bounces-54709-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EMoKIAqUqml0TQEAu9opvQ
	(envelope-from <linux-media+bounces-54709-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 06 Mar 2026 09:44:58 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FB8221D423
	for <lists+linux-media@lfdr.de>; Fri, 06 Mar 2026 09:44:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 38EB13011C82
	for <lists+linux-media@lfdr.de>; Fri,  6 Mar 2026 08:44:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0642C3793D9;
	Fri,  6 Mar 2026 08:44:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E9NQLOyN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IrP0T7VK"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BB5A379EDF
	for <linux-media@vger.kernel.org>; Fri,  6 Mar 2026 08:44:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772786695; cv=none; b=u/YjwlgTM7YvwFA3f0pHKLoi4/J8TYqUolJPHoPp23LK284wowv0uKr6I5nORdmrbnHLC0Kzi4+R/ABzltGFYE2LX14KdF9i1t5uwm6HWECCZM/O3qIhxLvbOR2+OWxvzRfDsMxPkaKLOouRW/hK6jOqpLCKqCghLn/0DCYV9wk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772786695; c=relaxed/simple;
	bh=KA18KGyDt3RXzJgye73pZlEUQ6kGq8j/JfGqg316kMc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AEkxemFOAvn9R/pmawgUwAH1Hg18mfEfxzn073dI+HKOEVTVCQ3GvBCuJolHWX3fH9C4oasLUBVkRRfKPTxd30cFo8ps9ZZmumZ8liKvfvloqy0qU0fJlRSOVpefv5SF1L1p7kkz0yrpvisfDeTlGcmDqE7W2FXwQI6BP8/NDTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E9NQLOyN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IrP0T7VK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6265V51p3382947
	for <linux-media@vger.kernel.org>; Fri, 6 Mar 2026 08:44:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1DBByKuzvkaKJ29qKLEZiH31R+C0wZhUtK6HatDKMR0=; b=E9NQLOyNZkWhiy5n
	DfIq5YauA1Uh7DCF7AvZJU88adXqZc32UHxfxX3mu9hwfvWc2MsqtQkQSjOncqiA
	BUUvNGnCkKFBGgj96qKB7yPpXD2oHB6gT3YOHcA10xN64hYcd7N+amKyFYGIAU0V
	ZEMDjbMrwrt2uPRP+5YRady2NXobmtyn36zCAx4fbDlYxVQ47NWSVyex2wrSwXIL
	De7gpALjqw8Jh4L806KKdbzyL/ZoXu0k43ZIw4iRy00DU3OkKPrpG6rNipi6xY76
	N6a175JAUGsx/sUTbqb807sJdbL0te+73S/7M3PrKcKg+5shCdqvmvfkC59ZoU0J
	eLYv2g==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cqruk8kj9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 06 Mar 2026 08:44:53 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-82990cfa91aso522489b3a.1
        for <linux-media@vger.kernel.org>; Fri, 06 Mar 2026 00:44:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772786692; x=1773391492; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1DBByKuzvkaKJ29qKLEZiH31R+C0wZhUtK6HatDKMR0=;
        b=IrP0T7VKFmBxM1MJEAz9ws1Ejo36Wb2Lyz5glKy8K+YjTQUpMVcXiJiq4pyK1LJXbO
         9XKFP7FXuN9Gv1MBdLV/odE9hwOcim8xg2dzhCXdcHDxLT7moatgKjwiJWU8rRkG5Gfs
         2txAxXX5d3Bqp2U3/OJn15HkbIH/t2rqcp3JUOSUBEP5/7Sma9nBq/+oipUSnyGG+Ev5
         HqgFayt6QEWwn6n2xEpQ5saBry/ZtNZRyWd7zHE3lOA8anBZfKNHVSKfvj2qk64+cEDU
         /yQI5xHicgQqfPX+YxiGUo4aHIbPeQyJdm+p1NPcw9LTWp3tgVjQuM/c/EITW1wluiKw
         0zpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772786692; x=1773391492;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1DBByKuzvkaKJ29qKLEZiH31R+C0wZhUtK6HatDKMR0=;
        b=YcQBS+StOSHY20XkT9JdW3NXKp9BB5i1s6ZCvqHlehtvyY3j1bj/Ic4Gk136iVFStm
         u9jJd1tdDLgMh8X7fb6VVtWifKB8goWcQJJlZxGbpyYCT+5qMUEcUMmeOenKKFyp9lGp
         +uCmZLlXkZfK1FBxviGrwQOYS1Y+UZoCyaAQFaMAZ6l2Opwv/uMwqQHNG7mF2c3T0LSN
         LoCwRkbFG+HYSV1x9RWyrtg3bfIWmOCGuLYsvIVWGdoLHH72cX6abML59UBcoPWQceZY
         S9O7m0krDtH2g5IjxRVgs1McG5wxN7AyHiWCOl8OEn1KzdVInE0pduV5/7fdUA+H0jF6
         M6Ig==
X-Gm-Message-State: AOJu0YxnL/l3ga/wFmuqcmb7tulvdcEMHuRUWChogbxoeOr5s8E83sUh
	jFHmy45vTOl5JezIJ5ekjbteyh1JYiTMuILuDYKINjSh0vTYX1+Rhw7lc03WAEjOtba6NSL7aL1
	9yW98vUB3uhcbx1g72Ar07q9YFP/Pn+EWeRxi5Qq4SvP/DeTnPXh/ctvL57K5/WhkMw==
X-Gm-Gg: ATEYQzx0HYgrUK6gFelsIgx57JJBKR3b1r/Jdl0Cxu7OTtYR23LQij+JvsqwuIUaAqQ
	AI0/zOMsRs7EuPSlVi7UAXsg1eJFOgVORkfUDv27nFtLpVPCdsGUpCdhhM8sEdP1atxA1LYfw+R
	6cZmg+1B+zKJ5kVumn1c5bFKrr/qv2rZMQNuYUH06wHRjOKvPuPJVXLgINXoeHb++nvcH01y4ed
	wz9eiQVN3mP2Z1/u4LTIaXYxCwYbeWNVfe9S5rF+2ivcoWZ6FGh3ZUYfEksz+XQXMQast+8UE27
	zXe3SBVW2b/zGb/SoCGKqUhUsv8SlyD1SQABx8RufUT1jNfqbj29SqpWzg8Bv47hxEMxrD6yaa2
	6/CRhAh4+XS46D1K9dizBRm1gd8vpyabMfs+n4zVB2b8J0Y5fEbHqctg6d3WTbo9Qe4R8KhsvQx
	kwV50UAP5HDoi5i8wf76U1
X-Received: by 2002:a05:6a00:3c8a:b0:822:1dbc:e75d with SMTP id d2e1a72fcca58-829a2d65577mr1402044b3a.1.1772786691999;
        Fri, 06 Mar 2026 00:44:51 -0800 (PST)
X-Received: by 2002:a05:6a00:3c8a:b0:822:1dbc:e75d with SMTP id d2e1a72fcca58-829a2d65577mr1402017b3a.1.1772786691497;
        Fri, 06 Mar 2026 00:44:51 -0800 (PST)
Received: from WANGAOW-LAB01.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-829a4636c74sm1393573b3a.12.2026.03.06.00.44.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 00:44:51 -0800 (PST)
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
Date: Fri, 06 Mar 2026 16:44:31 +0800
Subject: [PATCH v2 3/5] media: iris: Add IRIS_BSE_HW_CLK handling in vpu3
 power on/off sequence
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260306-enable_iris_on_purwa-v2-3-75fa80a0a9e3@oss.qualcomm.com>
References: <20260306-enable_iris_on_purwa-v2-0-75fa80a0a9e3@oss.qualcomm.com>
In-Reply-To: <20260306-enable_iris_on_purwa-v2-0-75fa80a0a9e3@oss.qualcomm.com>
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
        Wangao Wang <wangao.wang@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772786674; l=4048;
 i=wangao.wang@oss.qualcomm.com; s=20251021; h=from:subject:message-id;
 bh=KA18KGyDt3RXzJgye73pZlEUQ6kGq8j/JfGqg316kMc=;
 b=Bnvf2rulCR4TGvaytwZz4dESvtFbUyOgS8wcQ6BaCMuc36BwTd/pcJL8jYXNW1sTxn2YhlI2k
 s5EKxIKPxr7CP/a5OWyzrsJMdAaUPF0P7LFmnofsuew7ghIvpuYIoOW
X-Developer-Key: i=wangao.wang@oss.qualcomm.com; a=ed25519;
 pk=bUPgYblBUAsoPyGfssbNR7ZXUSGF8v1VF4FJzSO6/aA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDA4MiBTYWx0ZWRfX6oSNmUKEOsUg
 DL9vRWypY929UTs1ionvE5QXfD5Vant+eAKmGJ5NIQ03XBz+wStKgs3utb5k/yys3Yfh8M5IzIv
 8kyltfFEbADWmS01Mh7AamW0urH1+DWG96iPN8YeACs3nVhgRQqe6/ac4Lcs/IRk+GTUVhGcRjZ
 xG/Q+fEa3CbKF3FIgEjA0xJPrpFzMwfM1ogX03XXI+RVtSUeF//uEPpwQ01Ytl9/U9epBDNblPI
 85HjRsc7TuxWLh8SSNoBNY0HUTJbPIj4XnkzSDwVhsaTr9lI+zH3hFQ8bD2fDA+l+lvIbxJdPyC
 3Ly+NJXuYTMsmtGRXdiP+sxqSxqBw7fnN5ShThM3508FxzYP/HE4oSya1uQt7BgZH1E22U+hmWz
 RySbWABic0+X2Jq5cW7XGBtU6PhWVRU+5K2iI+Pt0zx9QCYHemlPUMFtZ/gUP54D+bR+vRLJu4G
 dKBuBcCT/v0p3Wgh1hQ==
X-Proofpoint-ORIG-GUID: du2ZkcliFZ4xuqyq-BRkl57LFzUoji3m
X-Authority-Analysis: v=2.4 cv=DvZbOW/+ c=1 sm=1 tr=0 ts=69aa9405 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=RNMrTprwP3u3wXAvS-YA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: du2ZkcliFZ4xuqyq-BRkl57LFzUoji3m
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-06_03,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 bulkscore=0 adultscore=0
 suspectscore=0 clxscore=1015 phishscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603060082
X-Rspamd-Queue-Id: 1FB8221D423
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	TAGGED_FROM(0.00)[bounces-54709-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wangao.wang@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On X1P42100 the Iris block has an extra BSE clock. Wire this clock into
the power on/off sequence.

The BSE clock is used to drive the Bin Stream Engine, which is a sub-block
of the video codec hardware responsible for bitstream-level processing. It
is required to be enabled separately from the core clock to ensure proper
codec operation.

Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_vpu3x.c | 55 +++++++++++++++++++++++++--
 1 file changed, 51 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_vpu3x.c b/drivers/media/platform/qcom/iris/iris_vpu3x.c
index fe4423b951b1e9e31d06dffc69d18071cc985731..3f9e67604ef6aad773837df584362446052e34c2 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu3x.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu3x.c
@@ -27,6 +27,53 @@ static bool iris_vpu3x_hw_power_collapsed(struct iris_core *core)
 	return pwr_status ? false : true;
 }
 
+static int iris_vpu3_power_on_hw(struct iris_core *core)
+{
+	int ret;
+
+	ret = iris_enable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAIN]);
+	if (ret)
+		return ret;
+
+	ret = iris_prepare_enable_clock(core, IRIS_HW_CLK);
+	if (ret)
+		goto err_disable_power;
+
+	ret = iris_prepare_enable_clock(core, IRIS_HW_AHB_CLK);
+	if (ret && ret != -ENOENT)
+		goto err_disable_hw_clock;
+
+	ret = iris_prepare_enable_clock(core, IRIS_BSE_HW_CLK);
+	if (ret && ret != -ENOENT)
+		goto err_disable_hw_ahb_clock;
+
+	ret = dev_pm_genpd_set_hwmode(core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAIN], true);
+	if (ret)
+		goto err_disable_bse_hw_clock;
+
+	return 0;
+
+err_disable_bse_hw_clock:
+	iris_disable_unprepare_clock(core, IRIS_BSE_HW_CLK);
+err_disable_hw_ahb_clock:
+	iris_disable_unprepare_clock(core, IRIS_HW_AHB_CLK);
+err_disable_hw_clock:
+	iris_disable_unprepare_clock(core, IRIS_HW_CLK);
+err_disable_power:
+	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAIN]);
+
+	return ret;
+}
+
+static void iris_vpu3_power_off_hw(struct iris_core *core)
+{
+	dev_pm_genpd_set_hwmode(core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAIN], false);
+	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAIN]);
+	iris_disable_unprepare_clock(core, IRIS_BSE_HW_CLK);
+	iris_disable_unprepare_clock(core, IRIS_HW_AHB_CLK);
+	iris_disable_unprepare_clock(core, IRIS_HW_CLK);
+}
+
 static void iris_vpu3_power_off_hardware(struct iris_core *core)
 {
 	u32 reg_val = 0, value, i;
@@ -68,7 +115,7 @@ static void iris_vpu3_power_off_hardware(struct iris_core *core)
 	writel(0x0, core->reg_base + CPU_CS_AHB_BRIDGE_SYNC_RESET);
 
 disable_power:
-	iris_vpu_power_off_hw(core);
+	iris_vpu3_power_off_hw(core);
 }
 
 static void iris_vpu33_power_off_hardware(struct iris_core *core)
@@ -131,7 +178,7 @@ static void iris_vpu33_power_off_hardware(struct iris_core *core)
 	writel(0x0, core->reg_base + CPU_CS_AHB_BRIDGE_SYNC_RESET);
 
 disable_power:
-	iris_vpu_power_off_hw(core);
+	iris_vpu3_power_off_hw(core);
 }
 
 static int iris_vpu33_power_off_controller(struct iris_core *core)
@@ -262,7 +309,7 @@ static void iris_vpu35_power_off_hw(struct iris_core *core)
 
 const struct vpu_ops iris_vpu3_ops = {
 	.power_off_hw = iris_vpu3_power_off_hardware,
-	.power_on_hw = iris_vpu_power_on_hw,
+	.power_on_hw = iris_vpu3_power_on_hw,
 	.power_off_controller = iris_vpu_power_off_controller,
 	.power_on_controller = iris_vpu_power_on_controller,
 	.calc_freq = iris_vpu3x_vpu4x_calculate_frequency,
@@ -270,7 +317,7 @@ const struct vpu_ops iris_vpu3_ops = {
 
 const struct vpu_ops iris_vpu33_ops = {
 	.power_off_hw = iris_vpu33_power_off_hardware,
-	.power_on_hw = iris_vpu_power_on_hw,
+	.power_on_hw = iris_vpu3_power_on_hw,
 	.power_off_controller = iris_vpu33_power_off_controller,
 	.power_on_controller = iris_vpu_power_on_controller,
 	.calc_freq = iris_vpu3x_vpu4x_calculate_frequency,

-- 
2.43.0


