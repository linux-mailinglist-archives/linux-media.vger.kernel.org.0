Return-Path: <linux-media+bounces-56451-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SAYTJrapvGnD1wIAu9opvQ
	(envelope-from <linux-media+bounces-56451-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 02:58:14 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 546492D4EEC
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 02:58:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 97BAE302861B
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 01:57:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6898234575D;
	Fri, 20 Mar 2026 01:55:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hhgWNDEs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PPj/rRh2"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D79D32652B0
	for <linux-media@vger.kernel.org>; Fri, 20 Mar 2026 01:55:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773971735; cv=none; b=QbMmKIu0/aHeMKyqq2QCpubVeg0UKfV18ZViBhGPB7Df0c5etuY501c0a0vfeTvX3v+Gbfl2kPScyNpp8i7T5fzx/rm7KB/4A1DZmIYWbsBD0qMIbVleMxaBtZIXPFvEMoGTwtJEkuPafKGtycZPKXQmNYsGVU8tY0OAvUcI6Ag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773971735; c=relaxed/simple;
	bh=9KYQ4mP8r4dJEkonOPAFQaieXV/3Q2yhfdlMr2DFkuQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=J6VUEnQ4SxEzuYxtQhxRAVNfWzxlIwvcZS/RoXuF5ZUyq3tWJZMcGSK3uFYWjkHypGyPwRf0P9JfGaUf1wql6bJ49WURJr7UDeNOqfYs9ZwflvoqvJzuROFl4Nd3jtkuWP2Xey6/d1AMCIKfXU9pIOOhbmEJ5CGyOMn3pUizkyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hhgWNDEs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PPj/rRh2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62JKGOHg2773150
	for <linux-media@vger.kernel.org>; Fri, 20 Mar 2026 01:55:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZxDQDVAUD4jwRWPx6btZcogiI3FOwvGdejCVTe0Ku5E=; b=hhgWNDEsTVrF38ud
	dTmVNLFEsMudBPWGpyeefdnvI71268pp0zoRj/Vyw/T1FM4AnzzD6fZsca5SD69X
	WAN2hDC3luXT6Nlktf2H4qk/Qm4GrCRwSzfQo+Wc2LlOpWDuUlaZX4r++tOoirYy
	h0SzsOpQ6ahjFm6sxcZLLvhQseaXBW7PlaiDxBAF0dOSu/yJjYRAq/7FgOZWiO5K
	/5sr2uWKO/Smc7Y1oWDEbOElE4aI2EJAe9YUIxcpWurMIwWowS0UFnPzW6XiBuS+
	ZHFK4f2sX0O2NuT0SHgIq02nRcmiopDnl1Hy4z39aEHOPAF4F7Kt3e9pspJx3O5s
	BxUTWg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d0r1grq41-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 20 Mar 2026 01:55:28 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5091f12ed3bso11485721cf.3
        for <linux-media@vger.kernel.org>; Thu, 19 Mar 2026 18:55:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773971728; x=1774576528; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZxDQDVAUD4jwRWPx6btZcogiI3FOwvGdejCVTe0Ku5E=;
        b=PPj/rRh2AP7mVx4LrDegq96hqfEs0svXjrNF5W6y0meB2ldcmx2etYjOub5XxD6S30
         DjzkOvo59HSNOblmwrElGxsyGRZi2pwd7Aqqc9sIk0FY0JKDMo1cgNTUY6/I+bFj5WhM
         ziK3yxMIQGHyTUrxaQdcC0yr8V5fuVm3bomTOy1QmnakVF5Ibm2LM30DcKcJMsgrd/Bj
         v5GGhKdhb/PQd3S8+hEjhBwyMVMUHZLYUwE7cPCr5i+UoS1/WaXwQBRi9KrDWG5HwugW
         w7O5akx53BnsDnZ4P8puaazNOuGNjGOig75bUb2ITZ8sTKVYIJNRygGNVzWa1a7G90B9
         dMAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773971728; x=1774576528;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZxDQDVAUD4jwRWPx6btZcogiI3FOwvGdejCVTe0Ku5E=;
        b=gygXS3QEUyxViiu+A5OY6I0a8UfBqh1e2S6gCKbThi5LOECYgVu36SHpkIgVs6Z7OS
         4+3dtI7Z3QvRK5GdTllpTzp/ElvuCYLRnzTgRqjRr2otllzoQJ96aKAiLj+THv8n8ypQ
         8NJ10CJMlV5jz5BSDe2rD3HNvG3FXhLAd86WCcLso2COLlNjfVaOPGtXj7eUxLyqUrBl
         OPlp4hf/E0f57gaf1dIRJHmvoBF0eFmINnJ1zqDO3pipwg8ix/MGtwOS9D2N+5y9U2iu
         YE/m66Q7yVXB3wxOV6PNRx978JZhmoNpf+QJD7MorJmadeB0O/NNckQDx8gdVEdaCOx1
         /AUQ==
X-Gm-Message-State: AOJu0YweWKd1v9pAYteqD9wYkDivoUyVH6eH348ByeLWeC6PufWqZL97
	sfRZT3Hy8Tu0mIpVCMyJt83Z6gnCEeBgQQ+kxspF7+P7rr1hBiGbC1Pg03Hha8NasxS3JFBn9JR
	Fsn4vYVUT+P/Skxucweu7USB7tPalVcjzUanI3vRlXuDSFGNYj1O4qXZsxf2yl2pAZw==
X-Gm-Gg: ATEYQzx/pPs2utO//2Bqp7CdYxRCq+6Np9d3xFxW7/ImZaKOl2E7DFqW8V0AJStogdO
	OF4HsEIcs6mBPy0jRfdu8+d5PoKbUX/hvVXKrMR5lRqzQ4Ba4ODftOTNOAcjT7vHAam4x8UW/1N
	htJWIWFFV/5RCFDSQeO1dBDsi3fpyQIOKpKN77+cPg02JHmUguqq1CRwFgCiTyEi4Fhj0AW2mPt
	ewQqdrBr02GeLh8CJ9pd12B5JayGWnvaamyuzvpP2EBCz9D8Ms2NLw6z6XDllimPwrmC8183mxC
	/L1rxtvT2TuPp/dFMuh09FRekzOyDhPk6XNNFdNe5pN/Jps7KAlCqP3G82K0WeFT3jHYwRN4d+S
	aPRzpNMmQ2oXyxW9+OIk3wuMJaa1bS4yJzTYxNZHitJIAR1GBGTFBPvxhrVASnr4SF4H8cBzOIM
	FWMnPBqM7+eH8zvHatwJMb5u7u63a7vN95/mM=
X-Received: by 2002:a05:622a:178f:b0:509:bdb:1539 with SMTP id d75a77b69052e-50b3744891emr22595781cf.23.1773971727746;
        Thu, 19 Mar 2026 18:55:27 -0700 (PDT)
X-Received: by 2002:a05:622a:178f:b0:509:bdb:1539 with SMTP id d75a77b69052e-50b3744891emr22595541cf.23.1773971727126;
        Thu, 19 Mar 2026 18:55:27 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a285305eefsm232344e87.70.2026.03.19.18.55.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 18:55:24 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 20 Mar 2026 03:54:50 +0200
Subject: [PATCH v9 10/11] media: qcom: iris: use new firmware name for
 SM8250
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260320-iris-platform-data-v9-10-3939967f4752@oss.qualcomm.com>
References: <20260320-iris-platform-data-v9-0-3939967f4752@oss.qualcomm.com>
In-Reply-To: <20260320-iris-platform-data-v9-0-3939967f4752@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1172;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=9KYQ4mP8r4dJEkonOPAFQaieXV/3Q2yhfdlMr2DFkuQ=;
 b=kA0DAAoBizyKPgIpKNUByyZiAGm8qOajaR0GiLyf1pfu+VnXoI8jLqhJ7WG7IaGPs0RDqUiU9
 4kBMwQAAQoAHRYhBExwhJVcsmNW8LiVf4s8ij4CKSjVBQJpvKjmAAoJEIs8ij4CKSjVTuwH/2fX
 Il2S/zJ8wi/gdULkhsV69go/z8ocU9AHqtW/W62r6N59WLRJFkeJXn6FnPACabPU3886+UKkzey
 8HYMTuSuuj7EAYeC9UEDOZ+Etj026/1p8LO5CqrQUNkwZdTYQ7ZgsIiT5goYQ6VrFRggptjoSDc
 ub/kx44orbvKDr6yGoAOSgd0k/aqs+Oic0qs9653im21peS7Hi/0mlDnHLDH1ALmq+JhjJezNCe
 vgWp8PE59ajFN4FmKHt+5nBXlfRZODDy/Z4mO2cRkUcdtpIwU4OzkDmqPaHcYW9avmWUVzmmwpZ
 aHUY91EsdUyYmIeGh1MEEeCANhJ09+8w5FSKfxY=
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIwMDAxMyBTYWx0ZWRfX3OaAJNi0AuJp
 vG9Tr66QUIaAC0QgbiL5PXb297e9vkbzOpkTQvSPP2F3JbAm5bR9DfbULhOaewokeQ/cU93HXP2
 i1eEeQj948phaocRSI8pLOYBRDss9/EPzWs+ZGZQ9H8LlhkBF3M6qB6NpOZebxr3LjgK0e8n1On
 5a4UX9e7eyG+eYZcHmjn9RsoPbQ5Eubk8zOTEBCznXuTQxTPsN1uY7VnXGiyXnaKmNxLe4shgyN
 LiVkqsavDCmFtLHeLtIl5kMirJTyA8RyZJrsh2nE+EJhQPjbupbwMWi3eoz50Dmj5TNorS8X4fC
 ORYATHB/GaOr0QzUjudndTFgb5rRdamEDsbAMKN+X3pPyKGoPjcoRsAdHZDCHX7CpBVggqVhUKk
 5CmpmzYOl3HlDSAR1Q9javZtIagEcjlUneA+AbRQGWXDqTIC60KDY6/rabDu76imOhoYPS/u9A7
 eXCuFmAcSXfhwn6PKLA==
X-Proofpoint-GUID: B8yxCFM_HZ508KeDK1HsYpfKOmniYmjl
X-Proofpoint-ORIG-GUID: B8yxCFM_HZ508KeDK1HsYpfKOmniYmjl
X-Authority-Analysis: v=2.4 cv=Y/D1cxeN c=1 sm=1 tr=0 ts=69bca910 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=nz9G3-SO7wN5dIpBwN0A:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-19_04,2026-03-19_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0
 malwarescore=0 clxscore=1015 phishscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603200013
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-56451-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 546492D4EEC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The linux-firmware is providing the vpuNN_pM.mbn firmware for SM8250
since August of 2024. Stop using the legacy firmware name
(vpu-1.0/venus.mbn) and switch to the standard firmware name schema
(vpu/vpu20_p4.mbn).

Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_platform_vpu2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/iris_platform_vpu2.c b/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
index ab2a19aa9c36..692fbc2aab56 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
@@ -111,7 +111,7 @@ const struct iris_platform_data sm8250_data = {
 	.opp_clk_tbl = sm8250_opp_clk_table,
 	/* Upper bound of DMA address range */
 	.dma_mask = 0xe0000000 - 1,
-	.fwname = "qcom/vpu-1.0/venus.mbn",
+	.fwname = "qcom/vpu/vpu20_p4.mbn",
 	.inst_iris_fmts = iris_fmts_vpu2_dec,
 	.inst_iris_fmts_size = ARRAY_SIZE(iris_fmts_vpu2_dec),
 	.inst_caps = &platform_inst_cap_vpu2,

-- 
2.47.3


