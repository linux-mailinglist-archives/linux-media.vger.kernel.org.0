Return-Path: <linux-media+bounces-64879-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ZgIYMhimL2o2EAUAu9opvQ
	(envelope-from <linux-media+bounces-64879-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 15 Jun 2026 09:13:28 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B2E2684131
	for <lists+linux-media@lfdr.de>; Mon, 15 Jun 2026 09:13:28 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=cMKg0+Cc;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=CNaMflDV;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64879-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-media+bounces-64879-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7F00C30067A9
	for <lists+linux-media@lfdr.de>; Mon, 15 Jun 2026 07:13:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 540803BCD28;
	Mon, 15 Jun 2026 07:13:20 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A3673BBFD8
	for <linux-media@vger.kernel.org>; Mon, 15 Jun 2026 07:13:18 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781507599; cv=none; b=JsQqGPyrUHywUNs/pOrCywt+p3Z/MmpzjpZQ2B6h95AHC54XQd/FHdP1nf6YhYdqfYkDmgKfEtRl/VUHZJyHHxX7s+GSPcag5YhGtjXqcebW8rY8t6O0t8yXKoDQeV9NbvbgZKQjLUEDQ5/JBmc9ORC1nM1KxU0a/bWyaObpLLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781507599; c=relaxed/simple;
	bh=uTL9b6XbA0RtAXsYmfuH5ui5uiOY/IkXuIsNHvc3KvM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lC/xJKV+4zXAX132tfFNj9RtYvK9mcOqlUkUfVWHSkDzZpLrBVYFEPTOHRS4lU3LXkd58pyuL6FqPnX/mCZvIOPPvEBLGcpZJtOloRH4w9dSWNU6SV11fUBkvPD4jhIpj2RwStOe0ClHxiKqnMLQ2+/ZDeqaToscaIE0/2jnqCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cMKg0+Cc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CNaMflDV; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65F6J9kw3346939
	for <linux-media@vger.kernel.org>; Mon, 15 Jun 2026 07:13:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VMYIMAke9Egc/yVx7PIrN4xAB45Me7NI309julpzCAg=; b=cMKg0+CcGZtEofP6
	Vm2Gj5fuqMQcQAnKlpt0K7N8H4hMgZhCTO1ZqCTEUfzV7ttTak1RgAHxglDOmCrZ
	hQ/9wXVXhVo5SSfFHgJaeLjOn4HQXBNSralSgefPdfYBaokyMahWXBiz+JFJ+LLv
	SD9fQFczZGuVvHJ/VNToWZ6KQCkxTZnsw8Bq2W49t2m6JMW0Oilli5xQsz0A985Y
	vpvY+CVRr+TvGQUXIHfhP5H9YiK1/lCPr7Zd2ptZvhRzJPQy0eMrWMFYJnH943ri
	LI81TcgIzVk0X4J19TU0I9J7UDKsrEKqN+EkW0jJZSm/Ma+GBvSUjWp2f9STudfS
	EgLpYA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4es0g864hg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 15 Jun 2026 07:13:17 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-36d97955899so2947243a91.0
        for <linux-media@vger.kernel.org>; Mon, 15 Jun 2026 00:13:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781507597; x=1782112397; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VMYIMAke9Egc/yVx7PIrN4xAB45Me7NI309julpzCAg=;
        b=CNaMflDVinu0gZdGplgrxWyQ3SPh88e3guwoj8UrO/1B9rhembpcxdU1rkS00pw0yW
         r0v3ZcBAKKmIZWTIxuAiQqXJbB1rXMFc5/8T8cH36nOT68BvFcS2VslBsWpzuKLFoP1F
         XYTd/TWTV0aV3XDpg0k2UhAOrmS8stTHjeDWwWFQ8KvSEftvL3iBSA3roS4oSRm/wfy1
         6Z7ENzv8c77gTS+pS7UVXfY+e/8vVqPnvkwTi6bivke0ZlavTv3B9FNrOajgtJzCcFtY
         o1lULKNZZoaFhECl/r/ytXI0KJxF5K4K3GIvXs0G8zALfoTvJiE8pI4zixkZOJtjS2iU
         Jj9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781507597; x=1782112397;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VMYIMAke9Egc/yVx7PIrN4xAB45Me7NI309julpzCAg=;
        b=hd37DCm2QQZJon9u3xXv20VrUpnjdTokFeon0Tz80h9IxXDW1Au+eik3lU1aEFmowC
         6MAcAthpan3CeP9ECor8/wcxbdiiiAYeg3MSSrQu/rS8PyF4z8r/twcZ3ptFn+3WSISA
         30a9Uc17QjQ3JdvRCbbqjvs9XZKz75e6AL5JjaUXSoSYTiU78iJjq29bp9PO4OGQbSCT
         hDzXzIFKqQUsaRBHZ+w5DY8bRvH6LUT6OKVRIMEUUxgVbhDAjBh8jhNChx5aMhyojABT
         Nwgh2FxaZeGgcm5zlbJkudcKmnV0HSIJYZBng5+SuUfcUD6xZCTE6gW/0HCvUj1Awy+g
         hn6Q==
X-Forwarded-Encrypted: i=1; AFNElJ/iAPDIQZsil2TRPeyaKcmdW9vf0MCa6d9Cm8h0PPnkNw3dV6gx1nGYqJysA+wIaUoNANEpEdAOMJeYCA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxGd3Z4Me+sXJcLK1/PPkBqHyruh5ojj7T4nInIHu9py34ajFWq
	zlMgnQgRZE8nVXFNkz1dYODZVa1OIOlIV4s7+LpQ8o+peE3VFsQPUOjja7k807/+D8PKJFWXQ2W
	VJ5xtsV21aJc/CGYOwTJqyEwFMC2jt/aST/WqwcPHvj2qHp4s7RLd1Ji30YWEhrgxFQ==
X-Gm-Gg: Acq92OFGloUsFl0I6K28iv0G4tzYdqdvo7q/qyPxKYLUMiHX6IsXUZIlSIiEPpTU/FI
	sZNMelFxdgXScc5BzfcQwzC28c0I1jYwRAA7zzG4Q/ovKpy+Lvnp9GyfNFVH2MMg3d2/FPilNvB
	PK2PJr5AvA5QPpesX8cRq8buTyLSpQewaIqOgkZADAm8/ClOZgVDnU77wVDGHb25mlEOM2GgHk+
	FqZ0lxh0Np+1GIUlSinxCXy128Mm78USi6H/OrZM/iuWor9mpWiidI7OYwpYK8Fuj49cPB1GtCj
	Zoxjnw1FDmmrS5lLOA9No101g/KrvzOjnTY82v2F9UlhX6blkvOPbeowFCi4iF8pzl3/jbdIED/
	/6kgwgnhIMt3KBj6dx/ckC/xVvu8HuFrvs1Qqw8uYoyRBcT4Iu/tI
X-Received: by 2002:a17:90b:4d08:b0:368:b01c:85a0 with SMTP id 98e67ed59e1d1-37a035ed628mr13606860a91.14.1781507596558;
        Mon, 15 Jun 2026 00:13:16 -0700 (PDT)
X-Received: by 2002:a17:90b:4d08:b0:368:b01c:85a0 with SMTP id 98e67ed59e1d1-37a035ed628mr13606824a91.14.1781507596089;
        Mon, 15 Jun 2026 00:13:16 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37a2668cce5sm14867474a91.16.2026.06.15.00.13.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 00:13:15 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Mon, 15 Jun 2026 12:42:16 +0530
Subject: [PATCH v3 5/6] arm64: dts: qcom: shikra-cqm-cqs-evk-imx577-camera:
 Add DT overlay
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260615-shikra-camss-review-v3-5-8183481f48d0@oss.qualcomm.com>
References: <20260615-shikra-camss-review-v3-0-8183481f48d0@oss.qualcomm.com>
In-Reply-To: <20260615-shikra-camss-review-v3-0-8183481f48d0@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        Suresh Vankadara <quic_svankada@quicinc.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781507551; l=3728;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=uTL9b6XbA0RtAXsYmfuH5ui5uiOY/IkXuIsNHvc3KvM=;
 b=IB1ghu+w4PvpyGH6m0Bdnutb3tvpsG7T2pM4eyAH//Ujm7h8j2hvoG5mLCD9eCaT/meO11WSe
 FQqQreHmmuwCpXhO2fvpzM/r8856xfGl5oUyy3yAlAdzwqvM1GBTdVQ
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Authority-Analysis: v=2.4 cv=OOoXGyaB c=1 sm=1 tr=0 ts=6a2fa60d cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=OGCdAuOInqFJiNoUztwA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: XTt-h695EJk1wzX6JkwVigXQrNZHFosh
X-Proofpoint-ORIG-GUID: XTt-h695EJk1wzX6JkwVigXQrNZHFosh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDA3NCBTYWx0ZWRfXy2tG2svsY6Ox
 oRgVEcR6KPvuqCyI04f9UBrGnKPioyqJqw5ct5UsztjssiX0rlCQEcpgBFhwneerZYBBNMAMlj6
 yY914FcuVMm8mxWP5vOKDiyhzxpJ2AHtOv5/6YRlNjrDbDLXyHIpiMWzVCWqgtQ6TZ7Ni0etiX+
 yScg8qeQWSRG0b6/tQNyAz0G+FEkqCYOMrcmrUIRLeAnyH48iw6IOmdSUCM3CENWPyn/CFC+S+7
 rq+ZTGLvF9qmIOpao6ZGkyRCix2m461d1+DwkoufL4bB6YWPSYw3hGM/EIG61a0P+g5eRfpVzd8
 1tPQG51FKkkQPuNbxdy00XWHEztKujO4ufKzS3hrKR7YmVBBFCBKXh99UkkgTOQg2bTH7DTxwLy
 DxDv99FlffQirBXOvfpXXbqktFXrBS5xBq4NX+Ri0IRoRwCd9s5tvMmu9i10FlGL+dpPVAliR/K
 RorUv4McwnIYa6mQ9DA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDA3NCBTYWx0ZWRfXxoXyPEg9a7bd
 0b2Ow5cDI44GrttbVoJydnxZJiZXPttZ7h9J97QrD9oYEfo6fEaI/dfA5/sYe6yieMnqB716F9R
 dpVchOhAXbDBtsrp1SiQ102KNH3nKIY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_02,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 adultscore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606150074
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-64879-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[26];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,linaro.org,oss.qualcomm.com,nxp.com,pengutronix.de,gmail.com];
	FORGED_RECIPIENTS(0.00)[m:bod@kernel.org,m:vladimir.zapolskiy@linaro.org,m:loic.poulain@oss.qualcomm.com,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:rfoss@kernel.org,m:andi.shyti@kernel.org,m:bryan.odonoghue@linaro.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:Frank.Li@nxp.com,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:linux-arm-msm@vger.kernel.org,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-i2c@vger.kernel.org,m:imx@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:quic_svankada@quicinc.com,m:vikram.sharma@oss.qualcomm.com,m:nihal.gupta@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[nihal.gupta@oss.qualcomm.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nihal.gupta@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6B2E2684131

Shikra CQM and CQS are retail variants sharing the same PM4125 PMIC
and identical camera supply rails. The only difference between them
is the integrated modem on CQM, which does not affect camera hardware.

Add a shared overlay for optional IMX577 integration via CSIPHY1,
used by both CQM and CQS EVK boards.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile                  |  6 ++
 .../dts/qcom/shikra-cqm-cqs-evk-imx577-camera.dtso | 79 ++++++++++++++++++++++
 2 files changed, 85 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index a9e9d829fb962386b3975f345ec006504607130a..76b8f144983827f4905a72935e8d5291a227dc97 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -337,6 +337,12 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sdx75-idp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= shikra-cqm-evk.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= shikra-cqs-evk.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= shikra-iqs-evk.dtb
+
+shikra-cqm-evk-imx577-camera-dtbs	:= shikra-cqm-evk.dtb shikra-cqm-cqs-evk-imx577-camera.dtbo
+shikra-cqs-evk-imx577-camera-dtbs	:= shikra-cqs-evk.dtb shikra-cqm-cqs-evk-imx577-camera.dtbo
+
+dtb-$(CONFIG_ARCH_QCOM)	+= shikra-cqm-evk-imx577-camera.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= shikra-cqs-evk-imx577-camera.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm4250-oneplus-billie2.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm4450-qrd.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm6115-fxtec-pro1x.dtb
diff --git a/arch/arm64/boot/dts/qcom/shikra-cqm-cqs-evk-imx577-camera.dtso b/arch/arm64/boot/dts/qcom/shikra-cqm-cqs-evk-imx577-camera.dtso
new file mode 100644
index 0000000000000000000000000000000000000000..037cef17ca8196ddbb5c1b0c301702e4f0ea3a47
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/shikra-cqm-cqs-evk-imx577-camera.dtso
@@ -0,0 +1,79 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/clock/qcom,shikra-gcc.h>
+#include <dt-bindings/gpio/gpio.h>
+
+&camss {
+	vdd-csiphy-1p2-supply = <&pm4125_l5>;
+	vdd-csiphy-1p8-supply = <&pm4125_l13>;
+
+	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@1 {
+			reg = <1>;
+
+			csiphy1_ep: endpoint {
+				data-lanes = <0 1 2 3>;
+				remote-endpoint = <&imx577_ep1>;
+			};
+		};
+	};
+};
+
+&cci {
+	status = "okay";
+};
+
+&cci_i2c1 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	camera@1a {
+		compatible = "sony,imx577";
+		reg = <0x1a>;
+
+		reset-gpios = <&tlmm 33 GPIO_ACTIVE_LOW>;
+		pinctrl-0 = <&cam_mclk1_default &cam1_reset_default>;
+		pinctrl-names = "default";
+
+		clocks = <&gcc GCC_CAMSS_MCLK1_CLK>;
+		assigned-clocks = <&gcc GCC_CAMSS_MCLK1_CLK>;
+		assigned-clock-rates = <24000000>;
+
+		/*
+		 * avdd and dvdd are supplied by on-board regulators on the
+		 * IMX577 module from the connector's 3.3 V rail; they are
+		 * not SoC-controlled. dovdd (1.8 V) powers the carrier board
+		 * level-shifter that translates CCI I2C and reset lines
+		 * between the SoC and the connector.
+		 */
+		dovdd-supply = <&pm4125_l15>;
+
+		port {
+			imx577_ep1: endpoint {
+				link-frequencies = /bits/ 64 <600000000>;
+				data-lanes = <0 1 2 3>;
+				remote-endpoint = <&csiphy1_ep>;
+			};
+		};
+	};
+};
+
+&tlmm {
+	cam1_reset_default: cam1-reset-default-state {
+		pins = "gpio33";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+};

-- 
2.34.1


