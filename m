Return-Path: <linux-media+bounces-63011-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mN0iHK5CGWqNuAgAu9opvQ
	(envelope-from <linux-media+bounces-63011-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 29 May 2026 09:39:26 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DEFA85FEA91
	for <lists+linux-media@lfdr.de>; Fri, 29 May 2026 09:39:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BE78730E8EC6
	for <lists+linux-media@lfdr.de>; Fri, 29 May 2026 07:35:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4050F3AFAF9;
	Fri, 29 May 2026 07:35:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ElR5DlSe";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MyX7IFBU"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCAD33B0AE6
	for <linux-media@vger.kernel.org>; Fri, 29 May 2026 07:35:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780040122; cv=none; b=dnV4cvoSjKPznFMRxzCmPh294UEvWv/T92/zutpB9YyCvdzuZRsrnOFg14e/A9Z8Fbbsj5oCMmbDMwmlLyL1ZakGR71jO2QoJEEW3CHBKmMYE99+sV+Hdmequp7MiyUbpz4liqqwfM1dRDBtXh0+vUD1f+4D/Rovr/kzURLYS2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780040122; c=relaxed/simple;
	bh=w6oWbfDOj/BPupXGbVudAgjHSjNgfkhVHt8iQTi4sQg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XLh/w2Fo4Hq2QEaM3EbA+3i5dj+7IEhDdWPBkw8VG3bNvClHzFtno++oaQW18uAYEvdCIpmHfGtKhE2lebxpOd5n1hB5+mmG33q4G9f0gUgpTwHDpntp7CG+DCcw8ym2vby+qwinVXAiE6RYjkm5SxEaIupxhSQ50AigrrGVX8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ElR5DlSe; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MyX7IFBU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64T5KCc31248033
	for <linux-media@vger.kernel.org>; Fri, 29 May 2026 07:35:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	COZw5o5UIhVUejwwfofcoXUCz1oK/yVZrfytNjE34uo=; b=ElR5DlSetqpYNsEs
	/vgTuafi+h+pGUlX4p9Ta3nxUPhhiVqOwSRwOfmZrtJQVF0a9KhQOnntzApHlDbq
	LfaS07A/eOL9Oqy9DnBQ9wT0vKGven299IShWrzePRCt/8Manj8iaxgPI6SziSKw
	a+IqooysEiLS5iwDktYD6jvKVCHUKddragedu6yomNAJWLobIWCqvc14YbvGVurm
	tUTdJ7dvOsX14ChwDXuY3CUB0yDX/QuSF6rbYQR8okM0qnNSDxatR8qq4MtvAqiz
	J4Xr3ZR1sx7AdcxnLkYbfBWx42L6l/erpIcsOOe8pO0aXySJ77vjvALrndYnA/VJ
	tlVV7g==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ef4jj0h1j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 29 May 2026 07:35:19 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ba15e384c7so98499235ad.3
        for <linux-media@vger.kernel.org>; Fri, 29 May 2026 00:35:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780040119; x=1780644919; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=COZw5o5UIhVUejwwfofcoXUCz1oK/yVZrfytNjE34uo=;
        b=MyX7IFBU9ziNQOWSOQFNh7tl1OKk/DZhwL9I84vGFoMy9QGgDD+4cxqjdlUwMbSVGb
         eN3qi5LeXWDRXxMIIccUB0gJtpNpURkm5hfgfo1aDBtI8p1BqEG4bhF+mN731L5RlI5x
         VdSrlW3rhjXsXDjjp9PXp4jyfjss13OVbEI7lm2IT53V9gW5CCqqypYW6gPK9IAdBGIl
         idKC0DAm8fxnIWQ72B9Tm9OvnhGiI0eg5ejMMOTlHL/OvacB1oULIy0PDAlwJ2V9rHYh
         59Hf3dw8OyWw3wi6b/mn0eV8MVqmezyya1+5zDj8S+J7Dcrga5vtmGbjAgTrAV6m79j2
         b2RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780040119; x=1780644919;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=COZw5o5UIhVUejwwfofcoXUCz1oK/yVZrfytNjE34uo=;
        b=J3QVpihh92UHtuUBGP7VmV7sCT70YgxReFI7to3Tcg80CcjbNyN9USmYkaKDqZHuzd
         /aU1IPlJtfD3SDvhz47V64U8b3/9Wqx0c78ItSDn34xc/TZlemPjY7amZa35yKEdHcmf
         ehLyW/wgnh/7uKa0Ik/Ausa8Pg0bK7ndAiIEnTOWOMNELBMJh5yfZ7xHu0CqFn2Qo/aU
         MpbvMDScULllLifkn/ZHRKxyQFHeaXLJfNwWtz048AVrnuyEho3wcQI5J6oBLemP8Sg9
         oaO5KWcBQNZjW/vVjNtgWC0NVyTcpPnnUhDdszShqbvyIzHj6sGU+tdIgXvH8JRJSbDs
         yWwQ==
X-Gm-Message-State: AOJu0Yww3QNt2jDCY4I/xdVwcxw5owr9zeqVURApH5MwTcBz+dq9rv0E
	2qIWwWUviZnSEtso5wCUXlNmfW1pe8eEzSS81bwmnEvQoKswQ3IUzrbR/l6tcmgtCMVQvropGho
	y/aTkimHvHz09sy6a2IEcNEAvORTWfH8CzzGSY+bq+wkdFv46jbOnuMuNz5zTr0mPeoRpbYLYh1
	X7
X-Gm-Gg: Acq92OHDp8nq+pMHgBWin6U8LGoQFRVXF1/hsmllwfwBYOKlbEf7xhIH5D0TK9ZWg/7
	/gD0LXjdyCPPt8VQT+HmlrA8pxWcAQAcb2PzcRw76xodRORf3i2Ezx8WuUtB5QMABvoom+ufIW4
	I38gT4Apgd8QF9MCM1nGoJPQq7g+PcAax9+omdBtF3KZLmfC9Oa5kJiWt+MIlYeTFKQ5faA8MWj
	pqLXr7JdANMiF61RKXPpTYhzyJn0i9FOlkDXhxIx3rJHeOjf6JgwgOgnruN+OE6q0SJarFoPFUT
	UlRaUkw7NxOrb0hsAlM5QO022fnccqkO9bMvFDVsJ6d7S4jAoOgWPKuVOsxZNkzMIKs2jBlGnXx
	K+vxQK9aD3xTO6je20TaRJIS7yG4XLMqZfd6GDghBQ6z+jAW27T/yU3tbwJLjKlmfypU9NyO8Hr
	Y5bUin1//ncpDkiJc9XQl2+pOrLA1Wg+0=
X-Received: by 2002:a17:902:d4c9:b0:2bd:1903:6ced with SMTP id d9443c01a7336-2bf20cf905amr23286825ad.41.1780040118571;
        Fri, 29 May 2026 00:35:18 -0700 (PDT)
X-Received: by 2002:a17:902:d4c9:b0:2bd:1903:6ced with SMTP id d9443c01a7336-2bf20cf905amr23286415ad.41.1780040118068;
        Fri, 29 May 2026 00:35:18 -0700 (PDT)
Received: from WANGAOW-LAB01.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf23b011d3sm9767335ad.52.2026.05.29.00.35.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 00:35:17 -0700 (PDT)
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
Date: Fri, 29 May 2026 15:34:59 +0800
Subject: [PATCH v8 2/5] media: iris: Add hardware power on/off ops for
 X1P42100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260529-enable_iris_on_purwa-v8-2-b1b9670459ab@oss.qualcomm.com>
References: <20260529-enable_iris_on_purwa-v8-0-b1b9670459ab@oss.qualcomm.com>
In-Reply-To: <20260529-enable_iris_on_purwa-v8-0-b1b9670459ab@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780040102; l=2070;
 i=wangao.wang@oss.qualcomm.com; s=20251021; h=from:subject:message-id;
 bh=w6oWbfDOj/BPupXGbVudAgjHSjNgfkhVHt8iQTi4sQg=;
 b=FivbE9ySB0pMWqRMINmWT2gQ0iQYeXqUZZzN6HFlewOJ2SHoOEzAjpS20neXRvTHs7328fNIN
 pBmimr3MGF/DYuMdIaVJZ2312XXGQJIymwjsiX7gQhdAFjR4NAPws6K
X-Developer-Key: i=wangao.wang@oss.qualcomm.com; a=ed25519;
 pk=bUPgYblBUAsoPyGfssbNR7ZXUSGF8v1VF4FJzSO6/aA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI5MDA3MiBTYWx0ZWRfX5zLbV5jb8czr
 0b1a9UeDypnB0BXA0xdpfRfd6QfM8jylT7jU+vsE4pMzx4XleDMvF7lMaue7yI3eER+8UFBPDl0
 QgtoAdWw2mLwi6dML3TUzFB3SLFLoZMGwkowQ2YN/pdWzo1uND7AuaV3T+W0CiJ3G9EgG+XhJcI
 svLd1onIe9jK8i6hZTAtN+ikIMm+3EIbw318wqWAT2TLeXtTYVAYiDMQOFQnQZXQkeoGusfjUud
 +v7uBJRIt1vxv4q9oOhLp5SdYa8jQip9X6J28BXvmm3/NUlPgc2Jmgewg2W2ifkyg68X7CukhbM
 X9oSUxMm31Hlv1MKTtlYUK+vDWbzKxGlXpweDwc+bJ+9o/GarO04GwdM/JOljbvJYjl0/+pMn8p
 SzvpH9vISOGOfDv4QobT3p7CR5cb0ilU4m+DKYgbP06VvRiS63JjXpbvMkquGX86MxdlRL9RU6o
 jE10rCCepsHQpjVOTFQ==
X-Proofpoint-ORIG-GUID: MHKDGOMRAvOKuztcZbs2W17aHh7VzM9-
X-Authority-Analysis: v=2.4 cv=Tt7WQjXh c=1 sm=1 tr=0 ts=6a1941b7 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=1Ijdk7qaabStWezMxE0A:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: MHKDGOMRAvOKuztcZbs2W17aHh7VzM9-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-29_02,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0 bulkscore=0
 adultscore=0 malwarescore=0 phishscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605290072
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-63011-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,linaro.org:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wangao.wang@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: DEFA85FEA91
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On X1P42100 the Iris block has an extra BSE clock. Wire this clock into
the power on/off sequence.

The BSE clock is used to drive the Bin Stream Engine, which is a sub-block
of the video codec hardware responsible for bitstream-level processing. It
is required to be enabled separately from the core clock to ensure proper
codec operation.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_vpu_common.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.c b/drivers/media/platform/qcom/iris/iris_vpu_common.c
index 3872c4f37987ebbddbb040722adaa252faa40a73..5a85568c5ee1c5b656131607e7aef1b8a75e020d 100644
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


