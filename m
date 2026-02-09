Return-Path: <linux-media+bounces-52377-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OB+GGNSPiWlz+wQAu9opvQ
	(envelope-from <linux-media+bounces-52377-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 09 Feb 2026 08:42:12 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BB41010C8DD
	for <lists+linux-media@lfdr.de>; Mon, 09 Feb 2026 08:42:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 37EA2303DD1E
	for <lists+linux-media@lfdr.de>; Mon,  9 Feb 2026 07:39:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 369B73328EA;
	Mon,  9 Feb 2026 07:39:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LvkKQGq7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CPLbyd7C"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74951331A5F
	for <linux-media@vger.kernel.org>; Mon,  9 Feb 2026 07:39:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770622765; cv=none; b=fqGRAIpgtg8dsrZe/RGnfcmUlgU6TIAT4QMemRjsibxLjtaOy+3kPohfUlct64d9ETzktzbN5IqGX8LzluAnoFHN1Ivexwxp4Az7eL03UvHiWZR4Ny0UCPH9FxZlRZ4J/97g7aHLsOBQTpy+iOl/X/npMWlwMLNQJT8Af3kXSAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770622765; c=relaxed/simple;
	bh=YFwltuvjo2/bTSOBXuP6qsYG5TWAbcKhuCp6WGLCKVo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=El/slb+F+G+7KOX6UWHAfuxtXDkS15B1XyKnl5sQEks57UJz4obKbH+uOFjsvkJM9TU02a681C3HBvcyslXBSWp6yFKbLcW9HM5yTN+iB0FpJ02UICkK+JkP9pSG/WBxnIjxMGeq6x8gGm9ymlJ8k78ItHDODqkCOEZfSBzOasQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LvkKQGq7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CPLbyd7C; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61952lIj2586940
	for <linux-media@vger.kernel.org>; Mon, 9 Feb 2026 07:39:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xhOKCFoYM2cTEdGk465nlwdn7Pnu44jm+hJIP4NutB4=; b=LvkKQGq7xi6bVr6+
	5nzZRQIEJbLWPdddP1HINCojKe80EQ2WePhIqnoSb9ZrXUKrPR+t+QgXdNR8CcXi
	UTeM2G3C8TfJcALZkryY0gO1wQ+UalzaeP6188I1WnfazP0uyXP4lx2Jzg7UM/WG
	8rgjvnlkLwqU+AK4Jb4dLDAhcVlHxoNHs3nNPpQ63Je19P2/m7whnqyjXuiHt81B
	ou2wiaDzRPq6TKBJ8F01i1D6z8SigzKHCfXTFdlzWMpxt+4JLxBhboCKsHtPJ06j
	tW6xX66GS6BQvvo+DyGw6P1tbgRF5Axsqrsw6suosEWD0r+ye3Ke36oEKG42b4gZ
	fhx2dw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c793bgg8w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 09 Feb 2026 07:39:24 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2a784b2234dso135163225ad.1
        for <linux-media@vger.kernel.org>; Sun, 08 Feb 2026 23:39:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770622763; x=1771227563; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xhOKCFoYM2cTEdGk465nlwdn7Pnu44jm+hJIP4NutB4=;
        b=CPLbyd7C0NHHLnSZKzAnXv3JtlqI0QLel8cSdPc56uU4mIWw5gDGWExsgYgqiEDvqY
         DFNw06joePjYjevtz1rOXKtBOCMUjrzxRX6QzfRFFYJkMNZCA5SrSkbAzzPJWTTlSmrD
         R5E2jB3sfc/XGSd1tWEh0r68M6HzGFxwx4X8RTIafNFe/gH0iuUrHTcGEo1zejlETgOT
         F7sk8JFJEi3QoZMhtdVg4GoUtx0EXHJTLmGJt5iLFdfS2vu/fu9vjRde3ZH9w1jnLk5H
         Hn9hY33rCqdEOlKK8rleAjgIaHD/ULH4TDDHs7jwtzqXnofGqZFmNvK6/qi+oFqoCy2z
         Fryg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770622763; x=1771227563;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xhOKCFoYM2cTEdGk465nlwdn7Pnu44jm+hJIP4NutB4=;
        b=UGHWs0oru89XmsPQBErNIITMypCubpZri4N0uCtbq0vrYlZYrkHt+3jHsHJw5J3mH2
         yWfGiMK7wWENvVDx2BUYy2MQOeBDsDGbuWKUHlOEfTwyyKmpPSWN7IR/kgRN34UsEWTw
         SPhRPay9kFj199hvVJTPvL7yF9lpmjoqNWDnRXWMHA/FHYQOwkextA4G204eG1VpYynZ
         obOMRDTt0Np1wwDZCR2QAcGWqOcrZEQ7x8VspnxjlL+7X7jOUm9jtER2vt8vRLGR+ZnJ
         YnJmMje33UHYhHwCqt90ovflrW/oYqrnHkDJy1zh6ccY7d7avDAjRM46hOIrh1KAORCv
         37mQ==
X-Gm-Message-State: AOJu0YyuIOjqGsIFJYpcbY+ZnjEkeoXQL2yhpHLUT0TluOhbNsB1xfO8
	QtwAk8fE8oiiwvqJ7tifX/1Svk4vIfRP7sfL8/Mv5dw6FA2RnM7ZTh+R/rwEpsysTcWL50u3CoD
	u2eyc2Mf0Gpclh2eKFSuqqD1YJRej2eN/pbgai1RrVUD9TyFA37EYLEvAZKOaWYTnCA==
X-Gm-Gg: AZuq6aLj3coQwg3zOu+7QMtz+rTErJWdzrE6U2cIXa3E/h5MRZkQE1YCm7j1bGPkKAd
	umylsXeQ0Z/3gFJ1+KC1BleO7TWDYAxRYK17gSi63NM/vA9KO4zoqRNCfKqYIASWjKFI7B5rHcF
	IHr+7360p73BUsBqft3U0/0z+z9KCu9Fp9Iv8nVPk68huOUwORJe3/VkbHpWA4CDOpQigfNDSwE
	Z2uQw5bT94YdsmJUrdc7TY6Y9RLM1AmfhGLFjdUdp7kzVgpETXOZzq1I26TPqciM5sfCCLdr9XI
	dDHhZDzpJJJavxdNNpWk5UrrCjfVuZQTaMgVim1rbXYND7y10EtSeAniirak7j0GppASckiGWbx
	5SJEzNJGN0aWbTIRVf9rNVW6rgvyz79DrANr+Q5NVuqmZiAO0yVl0SCZrmdTygvDqbJc7ahjFgt
	1RgvC2tIbo
X-Received: by 2002:a17:903:2443:b0:2aa:e574:d7da with SMTP id d9443c01a7336-2aae574dad9mr30817495ad.0.1770622763379;
        Sun, 08 Feb 2026 23:39:23 -0800 (PST)
X-Received: by 2002:a17:903:2443:b0:2aa:e574:d7da with SMTP id d9443c01a7336-2aae574dad9mr30817295ad.0.1770622762878;
        Sun, 08 Feb 2026 23:39:22 -0800 (PST)
Received: from WANGAOW-LAB01.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a951c9746esm99023545ad.39.2026.02.08.23.39.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Feb 2026 23:39:22 -0800 (PST)
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
Date: Mon, 09 Feb 2026 15:39:05 +0800
Subject: [PATCH 3/5] media: iris: Add IRIS_BSE_HW_CLK handling in power
 on/off sequence
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260209-enable_iris_on_purwa-v1-3-537c410f604f@oss.qualcomm.com>
References: <20260209-enable_iris_on_purwa-v1-0-537c410f604f@oss.qualcomm.com>
In-Reply-To: <20260209-enable_iris_on_purwa-v1-0-537c410f604f@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770622746; l=2101;
 i=wangao.wang@oss.qualcomm.com; s=20251021; h=from:subject:message-id;
 bh=YFwltuvjo2/bTSOBXuP6qsYG5TWAbcKhuCp6WGLCKVo=;
 b=0t2prkKudFnllNt1adakYdXwwxu9PLVM22qT+4fNaEpPiV0pvMD0spiX1DIhcrixuFLX/KqXk
 CM11yC+bsFbDFaCoHEsswEhk46U7VyTG56u+0BKYYshsYueJ6pH0akU
X-Developer-Key: i=wangao.wang@oss.qualcomm.com; a=ed25519;
 pk=bUPgYblBUAsoPyGfssbNR7ZXUSGF8v1VF4FJzSO6/aA=
X-Authority-Analysis: v=2.4 cv=ctOWUl4i c=1 sm=1 tr=0 ts=69898f2c cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=Jj0QviqCfRpxDJo41YMA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: aMoB43vNDZFxB4KeM2jvRwJ-TCgODcsl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA5MDA2MiBTYWx0ZWRfX8veeUjwlNVDL
 000kFIXKDm/hwPJQnZlFslztAshTrHCtIS4FVHT8xmRYH1G9aOQHRKrtwdhQzmy9ZlRbqEw2xDA
 qVMcL3/VD9wmXfBE/xu/J7w52dq2ZiREZSNvP8gN3saq8YB21Ictk0mZJatFF+ixrOyK5qona38
 xeE2q4I0eBkBQdcnK0uMakmqTiQAxmGy0oN4Xlj/4i/tWKr7TTw8UeeSqE9gm8A5pu9HWP+lfFV
 E/+83/0Ys5L4L+OW3ry1sUrle/sNJvLFRG4DThr4zs+NCvLRZRsbGF7I7JYWDON+0ShAwsFLfS8
 RjJpkrHvwemLZuWDVV2gT0N/rxRQKeDgvLJftpNHILLyDc6hpnOGd9v4/0LBFxNJ4uxEanQjHNu
 /wW6kHDnCDBx5mHvWDWTW8Jwiyx8RluUJkgXJDqpUDmmQYnbgINazSee1Y1OgDCWFTXhXUcEM19
 jZ9ZXLPljo0L1zlSILg==
X-Proofpoint-GUID: aMoB43vNDZFxB4KeM2jvRwJ-TCgODcsl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-08_05,2026-02-05_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 suspectscore=0 spamscore=0 adultscore=0
 malwarescore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602090062
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	TAGGED_FROM(0.00)[bounces-52377-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wangao.wang@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: BB41010C8DD
X-Rspamd-Action: no action

On X1P42100 the Iris block has an extra BSE clock. Wire this clock into
the power on/off sequence.

The BSE clock is used to drive the Bin Stream Engine, which is a sub-block
of the video codec hardware responsible for bitstream-level processing. It
is required to be enabled separately from the core clock to ensure proper
codec operation.

Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_vpu_common.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.c b/drivers/media/platform/qcom/iris/iris_vpu_common.c
index 548e5f1727fdb7543f76a1871f17257fa2360733..8f5cfad87b42f52e49fc25bc0b43c7e1a0ccc5e1 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_common.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu_common.c
@@ -226,6 +226,7 @@ void iris_vpu_power_off_hw(struct iris_core *core)
 	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAIN]);
 	iris_disable_unprepare_clock(core, IRIS_HW_AHB_CLK);
 	iris_disable_unprepare_clock(core, IRIS_HW_CLK);
+	iris_disable_unprepare_clock(core, IRIS_BSE_HW_CLK);
 }
 
 void iris_vpu_power_off(struct iris_core *core)
@@ -284,9 +285,13 @@ int iris_vpu_power_on_hw(struct iris_core *core)
 	if (ret)
 		return ret;
 
+	ret = iris_prepare_enable_clock(core, IRIS_BSE_HW_CLK);
+	if (ret && ret != -ENOENT)
+		goto err_disable_power;
+
 	ret = iris_prepare_enable_clock(core, IRIS_HW_CLK);
 	if (ret)
-		goto err_disable_power;
+		goto err_disable_bse_hw_clock;
 
 	ret = iris_prepare_enable_clock(core, IRIS_HW_AHB_CLK);
 	if (ret && ret != -ENOENT)
@@ -302,6 +307,8 @@ int iris_vpu_power_on_hw(struct iris_core *core)
 	iris_disable_unprepare_clock(core, IRIS_HW_AHB_CLK);
 err_disable_hw_clock:
 	iris_disable_unprepare_clock(core, IRIS_HW_CLK);
+err_disable_bse_hw_clock:
+	iris_disable_unprepare_clock(core, IRIS_BSE_HW_CLK);
 err_disable_power:
 	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAIN]);
 

-- 
2.43.0


