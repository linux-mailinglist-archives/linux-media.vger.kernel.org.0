Return-Path: <linux-media+bounces-61682-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uAI/FQkMB2oLrAIAu9opvQ
	(envelope-from <linux-media+bounces-61682-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 15 May 2026 14:05:29 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F6E154F0A6
	for <lists+linux-media@lfdr.de>; Fri, 15 May 2026 14:05:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 0C7863129125
	for <lists+linux-media@lfdr.de>; Fri, 15 May 2026 11:26:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0041948124C;
	Fri, 15 May 2026 11:25:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ugvn8ITM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="i5BPHWbU"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E871481238
	for <linux-media@vger.kernel.org>; Fri, 15 May 2026 11:24:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778844300; cv=none; b=S5auopLpqWNIRiuoGj1bBoWr3f9HDX74bVhhun2HsexWcla6B7a7ys/ma0+M3n2VUfLHvWCQwSRoUKM0j+3nrtbXK9h4Ypq8Faisd1z2+qNHMI/d/aHUQUUfvDPj9g2+hlUBoTbWKwzVGKPW8p2T9dxiYjhPGq7fwOvIPRc/e70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778844300; c=relaxed/simple;
	bh=mB3ax+sGyD+thy/S+owtTT++uI8XjdDtWOIrFE8Yvn8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DoS62EW5dNK3KvtHNCiudO0vINPXZHDOM38wi3EyFeRMJK3+mMniA5wrZ47Tt9TCVLr3IDarLniClpElr/+VVMLSfU1k4+yNs4JpRV2tCJavtCq7EiQ0EEnmLCgC8/2KIQpjX35N9LqYRihthZF3Hz9/tjSwH6qhlmqSQrHqN9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ugvn8ITM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=i5BPHWbU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64FAXXeH3514495
	for <linux-media@vger.kernel.org>; Fri, 15 May 2026 11:24:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hICxZj15kBmkUDSg2CSx6+F75VQu4k37C8p6b0IsqL4=; b=Ugvn8ITM5bq/Ebp+
	XyzKfxVb7RJj5ZGNRQMPY+/xmjZhho/aQvgBf9fa+Ce8LN/47s0yUOIRGBR5FFBZ
	K5qNAnzd2lvSfSyGvbhBCcm/Hr4N4llpW3E/EtO0WbcpoeCRutAwfzNdEgJDmdmi
	oH31Sc0f1izXsL1INrtgQuYV95larZq9itsg6aAGWfF8ovCZScBGw6bYdtpw2qae
	LI23anlW7IzyHP9c6+lR6VWFbx5WF3z85KWj4un6bzCbTb8RpGUNQJ7rYCcpfaiG
	ERNd+zb8haXs71W7yo+K2MoV+YgdzUdyvOHl+O5eqeO0+wj9YBZg2sUBKkwwdXm4
	D0rD5w==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1vb1f8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 15 May 2026 11:24:57 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-368b0dc7731so2755571a91.3
        for <linux-media@vger.kernel.org>; Fri, 15 May 2026 04:24:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778844297; x=1779449097; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hICxZj15kBmkUDSg2CSx6+F75VQu4k37C8p6b0IsqL4=;
        b=i5BPHWbUpcEA9PydLmSYOwUOHloCpBeNpbxhGZCFKBOcv3JEp3ZlUauDynuG5QPxPB
         44c9tqnYPGp9SDg3KJSWlcfxzhGm4MrGoOZsiq71+Jh/WJCG2nqnOd9eKmlk+cvRYnZv
         MKLE1nnZpjbdU+TzzkoNBNH9GhkaRJwGA79TqyOLbDdYyYU/0eu5mzRHggqfq9cRhz/9
         P9JCgXCsCw8DJTZMn1xyUKNEL3Kiv089ohi+n6ljdayIYByv5m9aQ6/A2LM9weX+foju
         aeaBOtnL/cmy1v2jOXwKLdJVeMWu0SPC43tZujPb/fHxz21en36qyI/VWdvKoScx9phO
         sa/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778844297; x=1779449097;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hICxZj15kBmkUDSg2CSx6+F75VQu4k37C8p6b0IsqL4=;
        b=fYkLVQfb0v2YQRPov9ktn8tDLiSRVioNCM5bk3ufoQnY2mM7AKbL9tMfJeSGYBEHIh
         x4Ac3savZhAHNJmbf48a1tR7BNUXeSX6ABlJmnXswxWlrOWeO/H1rpYx2JcnUSuq0dsi
         4oBMy3RKSZE6fvyLnEOnD8a0J6/sgb4eHH1XJlvCXYhhEPgLTJ41xiV3M9iwLoSgmKtY
         L0kU2APc2eNHbBHs8p1N4UOLN1E4ylueGcSscilNjrn1H7qRS/NRplR41bSJ4CNK4uXD
         /5LlNsD6M20f218+KF2/8dC8f0Tcj7feejZf8yL3MfxiBgsg18SUvMtcNDfip3g+xaP5
         1mCg==
X-Forwarded-Encrypted: i=1; AFNElJ/UjQIb8HyAI3K3Yt483HFYYY37fTKxn0+gXJg+QB3N0CbC2kcqWWEssFzoHBv9HeHsP5k2crAW6InDjQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwnRhR7vd08o3Er1i2L8jNhUBdJ0nEx+0rWYWDuH5FgqEzsPUSu
	7gNQU9O2giwaqyp+JW3QZeA7z/bzScrlH+QAYkW+x6KWAkYz3ndu14b9iQRhd34P6JQHp439Fh+
	4wxjReXhOVihMC5yplbOltoYRi8aXRGAYi1+mIA4xjmqh9WGJAbNyW6N+8xQXmv/cRVcRpsQIDg
	==
X-Gm-Gg: Acq92OH7y+BwxqrNj4E9Po3PaFSWQ1CSmueT2ERxkCbC45R0qsPT1HZn+KXgukhAGAi
	/4pXxyrnnisBR50IS23td/3MFs2ZEIsrnYe4uUZQ5cxPcljsO1vJ5xgFIUxkmPGA8V64nXaFD/r
	3z4MJu3GU+X6CwoRQnSPZHjesQDyqfael/gTvfwlFyA+MfX0qwdMs+6/6yPT9f/BF5yH3A9xBPM
	oVFQUReeYZrtG1I2b4/fNGhpJzBGmuq5j/VBk53Hlh5lff2Ytw1qYHWs1Yt9ti0Z/rEuJPDWQgP
	4CrAEn9H93fbdFrwQn4BmA1eLS3CD/BOL8nO/Wmx5XmSah4MdBKa9VLuTNseH70yVl0c9sUjsnd
	fyFNEP6t0t5vSW++tFCbL6Wp+sQlUbAHxKRafFui9PXb5tQBnzaiHr9s=
X-Received: by 2002:a17:90b:58c4:b0:368:b4a5:c4dd with SMTP id 98e67ed59e1d1-36951895b63mr3507731a91.2.1778844297054;
        Fri, 15 May 2026 04:24:57 -0700 (PDT)
X-Received: by 2002:a17:90b:58c4:b0:368:b4a5:c4dd with SMTP id 98e67ed59e1d1-36951895b63mr3507692a91.2.1778844296564;
        Fri, 15 May 2026 04:24:56 -0700 (PDT)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36951584654sm2476249a91.7.2026.05.15.04.24.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 04:24:56 -0700 (PDT)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Fri, 15 May 2026 16:51:29 +0530
Subject: [PATCH v6 14/14] arm64: dts: qcom: glymur-crd: Enable iris video
 codec node
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260515-glymur-v6-14-f6a99cb43a24@oss.qualcomm.com>
References: <20260515-glymur-v6-0-f6a99cb43a24@oss.qualcomm.com>
In-Reply-To: <20260515-glymur-v6-0-f6a99cb43a24@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778844197; l=828;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=mB3ax+sGyD+thy/S+owtTT++uI8XjdDtWOIrFE8Yvn8=;
 b=PkZtwhvTexrUnZWWAE21Y2y7ROg0444tAsb/bRuCRc76y02WUWY7ps7jFUEMVmPTgL1iUL9my
 GGaPgGvD3bDApcsPuObmhs21d4H9/RAnJwDeZHTK1P7mtZ4A2GqU0Mm
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDExNSBTYWx0ZWRfX6ONLE+meYdZx
 /ebpja72J46atkDHhQw5zVlqcTGcXmjhcHEXko6RF7FTb2ZOrwm9ET2a2SUreTYgjoU/CPOWedm
 NvcK6fl8TY0sf+OVsShv9NlUMKIFC9URuAfwXrgXe6VLYmdlNZ29YPxsCzoTAO5gjfgOg04WCrW
 pe3is9VgNfWrFFiWC59ZUEBETZxUJyn9CrmT1o+aJspznAqknOR9Wtd7WgJDpzILhdTsnajaCC1
 jqya13vS2isVBiXHnS6fJ+pEhBnk+x6XVD4H08YwTgcbJbxZoH77qLusOj/fePQ9tjS24x5LzQ/
 /G1Z01NOrqBd8P6bMERjAkcbYXuh06tZntJBCl9zG0XDj18w/F2YJvGpAnF4hNF/NNIe++Rt4Zt
 gyKnPy4QNc/fMXDkenIaAjCrMcTTxS3YsqakstVgR6JZaohFnyASDj/Q5uKbQuTla9Wb99Wos9U
 mxfmiqJIt9mBS4bvKHw==
X-Proofpoint-GUID: 8iSks7HqIBgzbnauz4Bp46nX1Vbmlsp9
X-Proofpoint-ORIG-GUID: 8iSks7HqIBgzbnauz4Bp46nX1Vbmlsp9
X-Authority-Analysis: v=2.4 cv=BvqtB4X5 c=1 sm=1 tr=0 ts=6a07028a cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=Dn0IJEph4XI5J7oltBAA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 spamscore=0 malwarescore=0 bulkscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605150115
X-Rspamd-Queue-Id: 7F6E154F0A6
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-61682-lists,linux-media=lfdr.de];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,linux.dev,kernel.org,8bytes.org,arm.com,linaro.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[busanna.reddy@oss.qualcomm.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

The iris hardware block is described in the glymur SoC DTSI, and enabling
it here allows the media iris driver to probe and use the video codec
functionality.

Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur-crd.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dts b/arch/arm64/boot/dts/qcom/glymur-crd.dts
index 35aaf09e4e2b..8d6ea857634b 100644
--- a/arch/arm64/boot/dts/qcom/glymur-crd.dts
+++ b/arch/arm64/boot/dts/qcom/glymur-crd.dts
@@ -198,6 +198,10 @@ ptn3222_1: redriver@47 {
 	};
 };
 
+&iris {
+	status = "okay";
+};
+
 &mdss {
 	status = "okay";
 };

-- 
2.34.1


