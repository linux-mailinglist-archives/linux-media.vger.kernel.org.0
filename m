Return-Path: <linux-media+bounces-49136-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CE62CCED8D
	for <lists+linux-media@lfdr.de>; Fri, 19 Dec 2025 08:51:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D9E013016DBA
	for <lists+linux-media@lfdr.de>; Fri, 19 Dec 2025 07:51:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3A9D2F12A5;
	Fri, 19 Dec 2025 07:43:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Tr1Z2Ru/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZrPOJn+u"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9C7C2E22BA
	for <linux-media@vger.kernel.org>; Fri, 19 Dec 2025 07:43:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766130211; cv=none; b=qDnS0q2TEx6iB2eQIWKX52PveGy03DmEILYjjec+fJXJVKUAhZkhlD4uFUoQXWgEsIn/gafmfTXrPLSAvzMVPvPiBZoO1pM8Wo2tdX+g06iqcbFubqPPVOz1JNsUHCd9gsgwbcB7eSJLmI3gv9goljevg47hsxsxHYjBy7GH8lM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766130211; c=relaxed/simple;
	bh=uIMTSmtJoVkGUl0RGol1bMIhEjXPmF2zePxvZdQhLiU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Gepdp1+4nUiVO2h1zNlPEEMWbYwdTauPjA0q23zlVDlnBFzJpb9/GacTkVosBowCsSfBVsxN2H3fzZ+arNY5GrLVN2TC3ttOFIchldou1+vQHvyZnl9jTl4BEyjCcTGPv/JeYRVWuJm556XTTQyf0tvvrQOHssJuVxIgQhWZU/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Tr1Z2Ru/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZrPOJn+u; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BJ4cGVF3319255
	for <linux-media@vger.kernel.org>; Fri, 19 Dec 2025 07:43:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EvPwkihF9+yeuuXUKkRYpVA/NsYjUy9wnJEg8/IUJzE=; b=Tr1Z2Ru/qOiULuuS
	LIu8nShiw5+9YW4bF1BLMTL58dt9a+IQ0rGSxOR7r+2RUI5kIEePzCx0u67a1lyG
	siZM1QlXvou8ACUsWLqJVyv+QFzp0Ga08hqTSuLrtTQNP9Dg+k0B9iO0i91IlNVP
	sTsQXdbw3y++cLl2WPyvLGib+A4YZn3asnrS5cAMUQpJgNYTArdJm567B8muzzi1
	s+NX7hMvHRoFLeb7g9uLu0yeafpL/PJojYGiYdN1p8ihBkggXaAFcuTzVdyZuAnF
	bCMhY8ni11uaeLJQMuJ4ggL9d8dfnlELbVd7CZUghpL6LecLJ4SbsfX7Micl6Vh/
	nz8Oeg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b4r2esqp2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 19 Dec 2025 07:43:26 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c1d27c65670so1007876a12.1
        for <linux-media@vger.kernel.org>; Thu, 18 Dec 2025 23:43:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766130206; x=1766735006; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EvPwkihF9+yeuuXUKkRYpVA/NsYjUy9wnJEg8/IUJzE=;
        b=ZrPOJn+uagq9xhBWnhRx8pOwDe/X9bE0MUEsTFxHVPEttahuQFykWM/I7E9Axny7G2
         8f1Am9UZT0Kb3sqk85igkZrjpaRmCP0UTKjE9zD7UO6ZYY25YMbr3NDNoauj+kAQeWCS
         kebBf0EXbQml9fbVISVVxdxm66pPDauRZP4rsqEc0jdZD8nuq3MNGqrMBQ2JocckTggZ
         OkSB391He0+ETAYYsnRwtM1SmHa/4FgmpEVtlUql2NUwTGOAijOuAwXE+KOaYwA8uauQ
         K1kfqBKnTLHYyugqkiNLnIFZsKg9gvPsJBNW9IjVYJLW8KW14O2oI+/xaCHWQp5pNuG9
         Mhgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766130206; x=1766735006;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EvPwkihF9+yeuuXUKkRYpVA/NsYjUy9wnJEg8/IUJzE=;
        b=vW+BApE7+VzWaEgay13XOTeB5R+1Hw7ECb+7dkk8RkdckVoDs4wQmuRoGlIpuaGWNC
         M20EyAKKlGdHDJxj0TPcSuYcF1iXeaJXGpmqauVYHlCpsCRp4cVpy+L3UFjdzZiRRghS
         7WV4h4tuCBokv46+Sr69DLJtO2r88xFG/iThW7fR62HGrJog22jL5wr/oQ6l3wiT1c3R
         nM9MNiS1FxChySyiZHkM/W5cIUQKBqg/as+hGUQfQkkuE6/254r87Ep0Tp9lnBpzQpxe
         F0djfJpzTvvD7KCj40nOtp4lXO6eKmBAlJB50thti3xqRS5tQTOXt/rY/wsZX+PXm2nO
         kQ7Q==
X-Forwarded-Encrypted: i=1; AJvYcCWgq8jR4CAY47oJYMmTYsbdLIugivoy1/9pMe9C75wgrw/c1J7uifS+EaBJvuCvI5FSaEel6fUF+GVy1w==@vger.kernel.org
X-Gm-Message-State: AOJu0YwOfYq2oQjkj/jPZU0ZMr52X8kp3zxc6ShMrnEkcwLESfWFmYUi
	hh51AvLcAfk2jlNfQ7fAXtZ13Uevuk7+USR0KsI3UXKyn5gaQZrIURGQ8EjFrCpoMRA+5L5BseV
	6fKCdV0ZFnjxNbghjQVTGqL285STcM2cy/s2GmP8cHdrJ4OhaTAy8zUI6M7TIA30Y2A==
X-Gm-Gg: AY/fxX7EI9yX/Y6UM9P4B2NtVXNf6BgWBycn8cuyZIwLaDuvK+b3h7PyMAnoRebHESy
	S68d4Gs14bSKt87K7XyLKeTMtGMftgqoHNhTGi7GDNz/8yA5wr6gAVHEk3WjxIVKs1L/Knvh0af
	NS0zIHB1GlxJkJrMKXLEb9FnizgUztVB71F4qGd/141XD3jtt3lUv5JBlhvtMVet3JLXejWg9RS
	52GKMv9s4m9w5FJW4Copg0CHIgsRxXbS35gJ6S78lyzv93hh7e6od75vxAZ57rEEvBWtwpBQx2M
	Cnew/Ue5Qisk3uhHcxyAAzjNBrncTYrlIWhleXzgVO8pWQW/JcdRgaP7A5Be8aXxtBZH8A4ilOH
	81w9SAJYuegkHfcv2jd3nzKxdd4mpgthGSs76oNA5
X-Received: by 2002:a17:902:c94f:b0:2a0:d527:4d07 with SMTP id d9443c01a7336-2a2f0d2db0amr24235185ad.17.1766130205691;
        Thu, 18 Dec 2025 23:43:25 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH+ko1eCYY3xiUYKJRpBf66RTUV7GT1KAXGRjRu2KHKw6DGNvX2wWFBl4npMxnoA1UIKnmWFQ==
X-Received: by 2002:a17:902:c94f:b0:2a0:d527:4d07 with SMTP id d9443c01a7336-2a2f0d2db0amr24235015ad.17.1766130205219;
        Thu, 18 Dec 2025 23:43:25 -0800 (PST)
Received: from WANGAOW-LAB01.ap.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3d4cb90sm14007325ad.51.2025.12.18.23.43.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 23:43:24 -0800 (PST)
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
Date: Fri, 19 Dec 2025 15:42:34 +0800
Subject: [PATCH v2 6/6] media: qcom: iris: Simplify COMV size calculation
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251219-batch2_iris_encoder_enhancements-v2-6-371f7fe24801@oss.qualcomm.com>
References: <20251219-batch2_iris_encoder_enhancements-v2-0-371f7fe24801@oss.qualcomm.com>
In-Reply-To: <20251219-batch2_iris_encoder_enhancements-v2-0-371f7fe24801@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: quic_qiweil@quicinc.com, Renjiang Han <renjiang.han@oss.qualcomm.com>,
        Wangao Wang <wangao.wang@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766130176; l=1442;
 i=wangao.wang@oss.qualcomm.com; s=20251021; h=from:subject:message-id;
 bh=uIMTSmtJoVkGUl0RGol1bMIhEjXPmF2zePxvZdQhLiU=;
 b=Tbe5Ji47HKTOfrbM7WITyBB5sVo/7KDAGSedBno61TnuDcAK1r6YL8tgtHu+T74NW30lESGlQ
 xS5dH9nbAxNATFSw5qoOPx59pWIer1mjk0HffvKVoKKAjsNrQFcAF/M
X-Developer-Key: i=wangao.wang@oss.qualcomm.com; a=ed25519;
 pk=bUPgYblBUAsoPyGfssbNR7ZXUSGF8v1VF4FJzSO6/aA=
X-Proofpoint-GUID: wXIWzNdHGBBX9uP9W3SSTPamQPMxBzPr
X-Proofpoint-ORIG-GUID: wXIWzNdHGBBX9uP9W3SSTPamQPMxBzPr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE5MDA2MiBTYWx0ZWRfX3JJNrrhzFlrk
 /5HWIZa6PG407IfP1NoaZPaIpCw+xSLvQfUwDLda+4n32kHlc90dM48D+1vV9UahJddA0bDTrIm
 XyOtavnXPL4CN9b9TZGMSBfU6P/yVgUYj4SpsmsUqiQlh+thsJSaySnHKZwJo9uI5fW9d2P74fZ
 RdClMl5XgCfy0+4jUGphbtF5/Nch3WET79EytO5BWHi8CE1C7f5D3O5m+IokQNVavZbKQ8aWmol
 o3Bud3Xzi9vfTLs+MiRmP8qtX/1TyIGB8o1hmtN//nNzUaLznLnzjAx8MzDcIEacB7h+Kq/R6hh
 4xRteqwFlnTMSkmPXRYhjuWz8RF7T2QKeYW6Q9JbBxYO3ZNWbCplfoCqn/2tZXNpsKleb8V0hSQ
 dcbZdh8GDglLAk1y3v9DHJWAcU0btvAJKtAe85z6rprf0S70Rstn/RL87rtEmP22jsm4OTmRmAg
 oCvg+WvQXdiA4taItJg==
X-Authority-Analysis: v=2.4 cv=Tp7rRTXh c=1 sm=1 tr=0 ts=6945021e cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=ihyF2tqwNky6lgPlo9sA:9
 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-19_02,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 impostorscore=0 malwarescore=0 spamscore=0
 phishscore=0 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512190062

Unify AVC/HEVC handling by computing codec and lcu_size upfront.

Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_vpu_buffer.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_vpu_buffer.c b/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
index c962042518fceb0f82a48956df01c8f3cd26df99..d3f1120dac8d64abcf5f87bc11aa368cfb02820f 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
@@ -739,16 +739,13 @@ static u32 iris_vpu_enc_comv_size(struct iris_inst *inst)
 	u32 height = iris_vpu_enc_get_bitstream_height(inst);
 	u32 width = iris_vpu_enc_get_bitstream_width(inst);
 	u32 num_recon = hfi_buffer_get_recon_count(inst);
-	u32 lcu_size = 16;
+	u32 standard, lcu_size;
 
-	if (inst->codec == V4L2_PIX_FMT_HEVC) {
-		lcu_size = 32;
-		return hfi_buffer_comv_enc(width, height, lcu_size,
-					   num_recon + 1, HFI_CODEC_ENCODE_HEVC);
-	}
+	standard = (inst->codec == V4L2_PIX_FMT_HEVC) ?
+		HFI_CODEC_ENCODE_HEVC : HFI_CODEC_ENCODE_AVC;
+	lcu_size = (inst->codec == V4L2_PIX_FMT_HEVC) ? 32 : 16;
 
-	return hfi_buffer_comv_enc(width, height, lcu_size,
-				   num_recon + 1, HFI_CODEC_ENCODE_AVC);
+	return hfi_buffer_comv_enc(width, height, lcu_size, num_recon + 1, standard);
 }
 
 static inline

-- 
2.43.0


