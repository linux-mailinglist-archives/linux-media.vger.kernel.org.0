Return-Path: <linux-media+bounces-61591-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6LBpAn6fBWo1ZAIAu9opvQ
	(envelope-from <linux-media+bounces-61591-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 14 May 2026 12:10:06 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D58E540288
	for <lists+linux-media@lfdr.de>; Thu, 14 May 2026 12:10:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 94AE73023BF8
	for <lists+linux-media@lfdr.de>; Thu, 14 May 2026 10:09:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0B102848BA;
	Thu, 14 May 2026 10:09:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CS4ZwiSw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="c34tJZG7"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FE26390219
	for <linux-media@vger.kernel.org>; Thu, 14 May 2026 10:09:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778753397; cv=none; b=UxoBaOnkXpvu2oI0DjfjsoLUXKdR+SUmamlnpdpn9CaiVGwN9zyckWzGTAYhA+5ahcsWJi3TfdZDQqF+iTstMctQth+T2eMKnbcM2Qa518w1Cvx8uV34eRuCrx+9JWDkUoHGoEkHOpZuagsdn07l3CY9rdbo5pjclq8QbeKsbBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778753397; c=relaxed/simple;
	bh=gq8aOZkBsiDMRGuZvW0oMU+XJc6ElAnhG4Gvvrsxc/Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oKlsFqaAQ4mzcBpz56QmHo0MhC2BqCDEBVAkrRj99t2Vp0KEUdZYBnPAfqE7MCL1D/T0QleJZYCEHd4e50IFwK6eDW05gf7+HBCNPaB1+9mgaJM2juJlNX57SlYjnEQ7rbHtXF3cSxfFlnNQIq30ofU1mLhIM7N1pVjrmEEI3uY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CS4ZwiSw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=c34tJZG7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64E9klmX2797163
	for <linux-media@vger.kernel.org>; Thu, 14 May 2026 10:09:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2I1g4g3NXHj7asmn8red4VpcwcClen11uThd0ZWvSoo=; b=CS4ZwiSw1zMaWqIm
	7In14uybYiHzrwtZTcivLMmHYFSnz3moN7VoAusQ3YE/2ktdl9Rw+yb2RPIpCH8q
	lfWT7i+1hWEjX7uz6IJ9F40apVvCFdJGEW+RPFjShKRvIOALHpCZK3AHl0cT1QQh
	ki1xDb4i6p/xhWXfdhbmq9zW33h/M8o5seY9/55O3T2a9GzyUk0XjOOJ0AKqRbUO
	UJb0O5ZoX/TozbKiXu7VaDBnpsBeI1sVaSFKYcQvuxaYg76W8d3HRHmwwJQhH0Bc
	njSLvlLzLZDoXo7QeFiuaqS4ZH1PsONXWcZlwWBeWFTap6zVEq6bE+mE4dzznHUH
	GIqVEQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5492sns1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 14 May 2026 10:09:54 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-366ded5ab5fso11642516a91.0
        for <linux-media@vger.kernel.org>; Thu, 14 May 2026 03:09:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778753394; x=1779358194; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2I1g4g3NXHj7asmn8red4VpcwcClen11uThd0ZWvSoo=;
        b=c34tJZG751WwGWVMdwR+aKJOtNzoZ8/lRJLUyxMFkYZ/YS7sCMMXPhnd0LNtyMJq8z
         zBB/WlxjyioKp7gVdONxfDTIKqgyuSvvJF0TB+sf1r3SxCq4WBMhmcjIQBfV+2W9Ewz1
         ttY39tI6KKKm0gU0+7y+qOtsvu26Zm+xMR/vf+/cpFw/T8QDaP0BHLatjE8ruVm3ywxx
         H9BevbbRM1ipizLX3OjWWXCBXCdzHkera9eZ/oZlGcP8866oaIHMp3svHXSyOf4J8Gfi
         2M/U3EyCR5ktAmnk81gJuTCWT3qiq0M0FkhQqoBHz7a2LxkFYoIgctIG10z6VrFjBcIw
         wv5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778753394; x=1779358194;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2I1g4g3NXHj7asmn8red4VpcwcClen11uThd0ZWvSoo=;
        b=Vr3vYRb3NxTh1WNm5b3GNPh8QCYButM0URbzh9VR7Bf67wujTsc77RhWhOzCop2Y1o
         XBmL1Jal0xRpK8r0qZRZ+06jfWeuzkA+0C5WSZ5AJ2sQl22ENd02iLk5VEf2zWcS1ZrP
         75NnS8L7Ryd2684ldsYOhyyzLvEH8qmk2VUAUgiSr90vnvyRDSyE4BKNtjAY5HVl0y66
         88tRyvLHXXI7dZivVTeMERrKtE++I2GuIn3c/SCIkQ7EBICpjIpkgT2SDmvYkaLAE+mb
         afnv10E8HCaS9zI+2MvhaGqHVPXo44LJH4V1IUIi60XPsOnBHjw55pyBjWRn8x4IxKrv
         RgWQ==
X-Gm-Message-State: AOJu0YwNBuHFdjh1mTs70bsdPZIEuOyXXZWLNYHmaB94OF5RgKbKRfwi
	fB667f9y0CP/Zj7Mdm0nWVDoDnCk+7IJSooJwCDlXBa1KTin4YVWV1+9ydnLfBCbjEOap9r/G88
	sFXoBpJRxH9WzqTU//eaGEb2LNxo9mx/BB9AtK+7QZotEqPW5+3UeWiOJ6wFCCDxUsA==
X-Gm-Gg: Acq92OFa9oYGmiXmE3K+bUNHnQVwnCugwlInC9mXxc2GWK26VB9wfqUj1bg2WuoIHQR
	C2w27uNUyJbMcIQBBTsk8WEIP+4DjB58fc7jJnMdUx926OFDNgNvHpXbCqfOuSCNCGvCJtX3tav
	PjtQHNAWCpPAYEIVWDCqE2I254qQSRrYBss45iiOgrEITCnv8nWiLe6lmkAaYuH4ZtowEmmR2VW
	DROMTkilCOKa4799c4PKm5kyC+8huvvwpkjeMdGRTc0xObXACzBYGsBnXvbA0WS/0kYtvtfCpba
	/H1yOvDNAzW5dhRlBCs2YU8dIzix0Hqgo7J5ABxS8SgjHKgPdZjO2u34oEJF2k2kZNspWhuvUcS
	JzBvF2/BFZgyEmrXqc1nr48vy/+KgtGIYWevjm+wD4VfrdbDYoV8lh71Itqa4eK0Za66cfc0e0d
	mkb9jsPENhftR1hXthflAC
X-Received: by 2002:a05:6a20:9155:b0:3a1:f82e:b009 with SMTP id adf61e73a8af0-3af80c7c317mr8223426637.18.1778753393390;
        Thu, 14 May 2026 03:09:53 -0700 (PDT)
X-Received: by 2002:a05:6a20:9155:b0:3a1:f82e:b009 with SMTP id adf61e73a8af0-3af80c7c317mr8223387637.18.1778753392871;
        Thu, 14 May 2026 03:09:52 -0700 (PDT)
Received: from WANGAOW-LAB01.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c82bb07b007sm1966450a12.11.2026.05.14.03.09.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 03:09:52 -0700 (PDT)
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
Date: Thu, 14 May 2026 18:09:34 +0800
Subject: [PATCH v7 2/5] media: iris: Add hardware power on/off ops for
 X1P42100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260514-enable_iris_on_purwa-v7-2-47aa5b026f1a@oss.qualcomm.com>
References: <20260514-enable_iris_on_purwa-v7-0-47aa5b026f1a@oss.qualcomm.com>
In-Reply-To: <20260514-enable_iris_on_purwa-v7-0-47aa5b026f1a@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778753378; l=1865;
 i=wangao.wang@oss.qualcomm.com; s=20251021; h=from:subject:message-id;
 bh=gq8aOZkBsiDMRGuZvW0oMU+XJc6ElAnhG4Gvvrsxc/Y=;
 b=4aNTlavU+CQmFQ6AP59YVXJRskb91Vz5ZbBGb6tUVJLE0yySTBb+IWmNBj6z8z1LirkZ9aJxj
 CQ45om64z1PBOL73Evs79UWz9q9Px/bqv+7ftolhMCfNaYRPt3S397B
X-Developer-Key: i=wangao.wang@oss.qualcomm.com; a=ed25519;
 pk=bUPgYblBUAsoPyGfssbNR7ZXUSGF8v1VF4FJzSO6/aA=
X-Proofpoint-GUID: Oyl1E0maN61g43TT0gOelN7gSH8SikoG
X-Authority-Analysis: v=2.4 cv=R74z39RX c=1 sm=1 tr=0 ts=6a059f72 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=KtZWPW8jcQ_ObEEXPWgA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: Oyl1E0maN61g43TT0gOelN7gSH8SikoG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE0MDEwMCBTYWx0ZWRfX0VuRveCT9YzR
 w/4bK5bhDAdN0NIdjO8xxQxz5dNPQj/MK0Zix2EUpt8/T3kcMhiNZRfMCitL6S0H3gbVLrQYT8m
 XWLh0OuDf0pM6Ih7nvpg6i3Dt0hFuGmcf5KpW8I80+Q3ZdlOP5NX2WM6mlB6l/D8DmkDbLZvYkN
 oe7arbUTiiFvFuTG9xsSpOn438nUcLP0ZA8AWu+0ipgyOEY2dB9czN7UqjSFRg3/KWoFvenauN9
 odlSpFil9JOJgwV8Px3PcNCLp01mVeSJ031O5wbLrTkqR0Oxr29LDqdqUFolN9+Zp+2H9BCPq51
 xA0EaMgf6MKU1gaYNklCV47ybX6A4Lz4xkdV5y9HhgTPuk3lxI28rfujeKm3fARzab8Huib53xE
 BpZLaPbDFuz4nv9Zc7Ci2jumucuoXj8dqWEUgdsCF5onfrS8SHQRK5Sv1GUP/LSsWOcHXUEBNy2
 aQK7ebCKzZXkjUvClxQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-14_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 impostorscore=0 adultscore=0 lowpriorityscore=0
 clxscore=1015 phishscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605140100
X-Rspamd-Queue-Id: 9D58E540288
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-61591-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,linaro.org:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wangao.wang@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
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

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_vpu_common.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.c b/drivers/media/platform/qcom/iris/iris_vpu_common.c
index 7bba3b6209c2061dce72facab7c2b58d6b3bb9b9..7d322306c6011c758b77555788d4c0ef4705fc28 100644
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
@@ -292,8 +293,14 @@ int iris_vpu_power_on_hw(struct iris_core *core)
 	if (ret && ret != -ENOENT)
 		goto err_disable_hw_clock;
 
+	ret = iris_prepare_enable_clock(core, IRIS_BSE_HW_CLK);
+	if (ret && ret != -ENOENT)
+		goto err_disable_hw_ahb_clock;
+
 	return 0;
 
+err_disable_hw_ahb_clock:
+	iris_disable_unprepare_clock(core, IRIS_HW_AHB_CLK);
 err_disable_hw_clock:
 	iris_disable_unprepare_clock(core, IRIS_HW_CLK);
 err_disable_power:

-- 
2.43.0


