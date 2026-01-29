Return-Path: <linux-media+bounces-51770-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YLmTFo8Re2nqAwIAu9opvQ
	(envelope-from <linux-media+bounces-51770-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 29 Jan 2026 08:51:43 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id DD91FAD030
	for <lists+linux-media@lfdr.de>; Thu, 29 Jan 2026 08:51:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4785530642F0
	for <lists+linux-media@lfdr.de>; Thu, 29 Jan 2026 07:49:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2D4137BE76;
	Thu, 29 Jan 2026 07:49:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IuZSoFFW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LpeaBLWt"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FDD637BE71
	for <linux-media@vger.kernel.org>; Thu, 29 Jan 2026 07:49:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769672942; cv=none; b=R8TujXEMCxaTT8+cZNeX1cddPvihJslrWhSKvlgiSBIi1nxIwqTwmB13aOztQzSKMkIrip3aeaZmDDxE3FvqueCRqu4H09sJ/MzuAhAT09Cjmp68kg+KLyAVMzC43BneXaKsZzFxMTdKbWRBoKCsZ8Ur1x7LsMsC4Av9SNsu0Ww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769672942; c=relaxed/simple;
	bh=vtZ8qpxO1glVKw5WkTGV/9fGQlliBjbhanGx9pnoSjM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=c87h7ayzerZKxeH0LcC+5TQ01GGaq0pJbkMWr1J8p6/Ye8aj62t1Kz38/63Aj6XFVafd9H+JtwsiTpqqn/lVFbrJKo9EGfBysizUtclCtoQVe12DW1X1GKmopzJJ8dVHGqJmRxPjSpZ0k4KY5u03JG4toY0B7eXpM6Muwd7x99U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IuZSoFFW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LpeaBLWt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60T39xSW1429065
	for <linux-media@vger.kernel.org>; Thu, 29 Jan 2026 07:48:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	14DCHSOuOQFKW6OTpiNFZoRvwSOz4r8wKdkOgTkHAjQ=; b=IuZSoFFW780jc7Oz
	kq8HqLhfGXqkVrK4MSG7iQ0Mv+qx2HyChJgxVcFYdKOnE5qXYrtJdJt6m/5A7HJe
	wzCNxcCB2LhoQmtv/LKeOv2D/GQxdWtba+TqShW2oJONWDgvKiXPkn04jXbaV+MT
	C5jkQrCuFs14ZseoCz9ATnbVE0ireRKMG4XU3pbpDhPd9ha0UggoSyqi814/PFNz
	o6iunT8aZFOsBFkxAJMsMq4Qkntg1UXc6aWDANV/BN4CuL5sMrW59ySGgAOtUq8Q
	dbIvEQgIV11q8TFD2p6/CImuGLgURCanMWEhrx8i4pLWMW5ut/lulWWkRc90f9nL
	atYqgw==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4byydh0qbg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 29 Jan 2026 07:48:59 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-82357cbd272so1061823b3a.0
        for <linux-media@vger.kernel.org>; Wed, 28 Jan 2026 23:48:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769672938; x=1770277738; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=14DCHSOuOQFKW6OTpiNFZoRvwSOz4r8wKdkOgTkHAjQ=;
        b=LpeaBLWtywPqgvTFSIxK4KZX+DA4a8D8y7G2D5Wq86L11SwyKpdJIuYKdhXmd4SHR7
         0CowupcARA48eMx9XrIb6tBO9FuzJ5TP/TPiTe6TVpbQpJ9yvJhbEpzUaKKJTNPVr5Br
         2jMMAOm+/WmAiTI477DiPmQmkpmm1MmTxgsT5iJ0ckCyHh1Pwn7jQr/amu8nem3i3rjQ
         mrTtynntdm74hz428s1Ns0Kox2sBYu22fsUtGHPS7TQEaip7uN9evRAF4bZq7xngsf4o
         l+5rcpaKdbNjwTAZtlSE8AYAaKX5g7JLquKpfjFOMgbQMHAmnlZo68XRTRQZSeypciKu
         w58g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769672938; x=1770277738;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=14DCHSOuOQFKW6OTpiNFZoRvwSOz4r8wKdkOgTkHAjQ=;
        b=ml8zJtyigLpx72DafmbyKZGSEuOkMd139gQGbbQuFJE4CDQEIDwX5KxT0fgnZCo7TL
         K63jKGb0/PxWRPw0b6k/cvafJePwh1g0eZXoWOdqLUb+qHpbyo8e11iiX2y8+vHO6MkV
         brFMN0g12U74+0xk7Gz1kCSxuE9OjwNrIrNfG0u6w4q+6+ofibGPdq6ykTPraWmrtPIe
         E+xZHlM/eUKCP2TlaecMwy1erB/tozx/QSZIhp/3u1ePR0OhwQohcKmzKtNI6WcJF8nG
         Co9k1ocaPJ9HbodXnmxWgVsMLWLmSEKMJih8Z8Bv+HXpYFq4O1IqA7jrXr5ZF7/o3Gp8
         hQhQ==
X-Forwarded-Encrypted: i=1; AJvYcCVB6tNWOWFhoo6wRe4ol0TitNQneDPlJDvqNIvlLipAlDJVK+QoNMAe6Lp7RZbKbH3xDI3/HtW+64nUVQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwrLkYyjIIrRH4cH7F53L74Qk1sQQ1CbYSeinRbFk7BfabhBx0s
	8aHHyOouHqVLrturdgxNVrsjZ9gXXNbTdEoXmiBzi2ywaanyt+T0sh1CXEoqj5gzmQIy4+0GQdA
	ov1tz1j5kvMchpaDh2fFcicvGkSJAyO5vBulhkChjjSV3ZFK00aprmdi4drVSgeX47g==
X-Gm-Gg: AZuq6aI+Pb1SvhdftzZUEFgSZUKYgKXwuMW2N1YmAyA+zr/oS/+BUErFS8wpiQIQ2Lm
	NNNgxJa0/DvGN6H2118jOFOyLWW9Raw54qtxEWK+aFzQjeT2uCiFgWzUUzxZut4EjTuSB/m26ak
	pqbX5JuSPWF25vXG90lSA97mlTxDT2Dwv9dU8fVj+fwOD/ldt3xhCoxyU2wfk9sRM2YYkiTWFkW
	5UuYUCMEX/z6upHeVQF9lO1HCHyPDxwKwkL2ZVi5OkgYpMCMtbeuYEK5A9B+81kuvhaKydlmfUy
	Q0WwHxHvfMgUPtdE5ruE+1MAhu4c1378nidwYrpF8wXl7NaCBx1x+JJnH45LcYTTgXxugbCs3AA
	PgJRN8E43LV/kaqyOPX6AqVtcQTVAftByhGE1814IuFfu8KO1XV+Sr0q02kMWVxfm/FkGO+RpCF
	imOkvuADT0/8k=
X-Received: by 2002:a05:6a00:b481:b0:823:1679:49cc with SMTP id d2e1a72fcca58-823693027c0mr7725479b3a.66.1769672938355;
        Wed, 28 Jan 2026 23:48:58 -0800 (PST)
X-Received: by 2002:a05:6a00:b481:b0:823:1679:49cc with SMTP id d2e1a72fcca58-823693027c0mr7725453b3a.66.1769672937863;
        Wed, 28 Jan 2026 23:48:57 -0800 (PST)
Received: from WANGAOW-LAB01.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82379b49fecsm4534634b3a.15.2026.01.28.23.48.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 23:48:57 -0800 (PST)
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
Date: Thu, 29 Jan 2026 15:48:26 +0800
Subject: [PATCH v4 5/6] media: qcom: iris: Optimize
 iris_hfi_gen1_packet_session_set_property
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260129-batch2_iris_encoder_enhancements-v4-5-efaac131a5f7@oss.qualcomm.com>
References: <20260129-batch2_iris_encoder_enhancements-v4-0-efaac131a5f7@oss.qualcomm.com>
In-Reply-To: <20260129-batch2_iris_encoder_enhancements-v4-0-efaac131a5f7@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: quic_qiweil@quicinc.com, Renjiang Han <renjiang.han@oss.qualcomm.com>,
        Wangao Wang <wangao.wang@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769672917; l=9503;
 i=wangao.wang@oss.qualcomm.com; s=20251021; h=from:subject:message-id;
 bh=vtZ8qpxO1glVKw5WkTGV/9fGQlliBjbhanGx9pnoSjM=;
 b=spXlVBTmO8xUhF/BGYet9A0KHqnQ5uqY678/roxKlyw4iNEzp5jclU2dTjVLf1dt8MS4M9aBv
 OytHcPHRShYD8iNHNKUhxB0o7pkf4A7yT8k7We3WObirjuu8t5YANAL
X-Developer-Key: i=wangao.wang@oss.qualcomm.com; a=ed25519;
 pk=bUPgYblBUAsoPyGfssbNR7ZXUSGF8v1VF4FJzSO6/aA=
X-Proofpoint-GUID: wiFQ-gSB92aJihfJvQCUJTKldYNWBsat
X-Proofpoint-ORIG-GUID: wiFQ-gSB92aJihfJvQCUJTKldYNWBsat
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI5MDA0NiBTYWx0ZWRfX67VO62iD32QK
 WBt9Tf98yZ+tt4dhxkFabWXPzvQNULoC3h7H4BZ0CfkLGowQB9PjR8UHXmPsoAbLzyvTHVaBFN4
 E9eE4C16A/bTTYf3LokpmRGzgWpyMxbHg0QnPiXbaixYITHUaWP7371scr/aeUob3+b0rmOqVj/
 nNs5SQbH48tcEfJ2TH2MTz+sSv2oLg2cpb2RDOHeR8dDY5OtyMeOML3gh3+NHOob6EBkwiOnJWN
 6KI2yKORBkqqPhEDpoSa1vhB0lxDHU+ftf1hC8N3zj9xVYv0+dWX0RM6X3ohnr4xNPWxP5fGyXA
 1biQ7suKJn6YS4zGq5BRyZ50gc/HHKVRbcvPP2gni7NGfXtjenTAgQqgWup495+JOHo6f5ss+8i
 98VuYR7cGi0Ew5JgzuY4KnIy008Y6GXxFaR6cMaRKHlGDVV09DXV47aWhbtER14r3scH1JPIPa+
 0v4mIRPnWTOQQr3rnpA==
X-Authority-Analysis: v=2.4 cv=Cs6ys34D c=1 sm=1 tr=0 ts=697b10eb cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=7zm3FxsWSslHyZ29AF8A:9 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-29_01,2026-01-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 spamscore=0 phishscore=0 bulkscore=0
 malwarescore=0 priorityscore=1501 adultscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601290046
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-51770-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,linaro.org:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wangao.wang@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: DD91FAD030
X-Rspamd-Action: no action

Modify iris_hfi_gen1_packet_session_set_property to simplify size
calculations and remove redundant code patterns.

Previously, packet->shdr.hdr.size was incremented by sizeof(u32) in
every switch case, resulting in repetitive and less maintainable
logic.

Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-HDK
Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
---
 .../platform/qcom/iris/iris_hfi_gen1_command.c     | 50 +++++++++++-----------
 1 file changed, 25 insertions(+), 25 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
index 39fc728646d3808c50481ccdfa15ef0dfab05576..d19d15435424da375919e3de729e756be23c0882 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
@@ -485,7 +485,7 @@ iris_hfi_gen1_packet_session_set_property(struct hfi_session_set_property_pkt *p
 {
 	void *prop_data = &packet->data[1];
 
-	packet->shdr.hdr.size = sizeof(*packet);
+	packet->shdr.hdr.size = sizeof(*packet) + sizeof(ptype);
 	packet->shdr.hdr.pkt_type = HFI_CMD_SESSION_SET_PROPERTY;
 	packet->shdr.session_id = inst->session_id;
 	packet->num_properties = 1;
@@ -498,14 +498,14 @@ iris_hfi_gen1_packet_session_set_property(struct hfi_session_set_property_pkt *p
 		fsize->buffer_type = in->buffer_type;
 		fsize->height = in->height;
 		fsize->width = in->width;
-		packet->shdr.hdr.size += sizeof(u32) + sizeof(*fsize);
+		packet->shdr.hdr.size += sizeof(*fsize);
 		break;
 	}
 	case HFI_PROPERTY_CONFIG_VIDEOCORES_USAGE: {
 		struct hfi_videocores_usage_type *in = pdata, *cu = prop_data;
 
 		cu->video_core_enable_mask = in->video_core_enable_mask;
-		packet->shdr.hdr.size += sizeof(u32) + sizeof(*cu);
+		packet->shdr.hdr.size += sizeof(*cu);
 		break;
 	}
 	case HFI_PROPERTY_PARAM_UNCOMPRESSED_FORMAT_SELECT: {
@@ -514,7 +514,7 @@ iris_hfi_gen1_packet_session_set_property(struct hfi_session_set_property_pkt *p
 
 		hfi->buffer_type = in->buffer_type;
 		hfi->format = in->format;
-		packet->shdr.hdr.size += sizeof(u32) + sizeof(*hfi);
+		packet->shdr.hdr.size += sizeof(*hfi);
 		break;
 	}
 	case HFI_PROPERTY_PARAM_UNCOMPRESSED_PLANE_ACTUAL_CONSTRAINTS_INFO: {
@@ -533,7 +533,7 @@ iris_hfi_gen1_packet_session_set_property(struct hfi_session_set_property_pkt *p
 			info->plane_format[1].buffer_alignment = 256;
 		}
 
-		packet->shdr.hdr.size += sizeof(u32) + sizeof(*info);
+		packet->shdr.hdr.size += sizeof(*info);
 		break;
 	}
 	case HFI_PROPERTY_PARAM_BUFFER_COUNT_ACTUAL: {
@@ -543,7 +543,7 @@ iris_hfi_gen1_packet_session_set_property(struct hfi_session_set_property_pkt *p
 		count->type = in->type;
 		count->count_actual = in->count_actual;
 		count->count_min_host = in->count_min_host;
-		packet->shdr.hdr.size += sizeof(u32) + sizeof(*count);
+		packet->shdr.hdr.size += sizeof(*count);
 		break;
 	}
 	case HFI_PROPERTY_PARAM_VDEC_MULTI_STREAM: {
@@ -552,7 +552,7 @@ iris_hfi_gen1_packet_session_set_property(struct hfi_session_set_property_pkt *p
 
 		multi->buffer_type = in->buffer_type;
 		multi->enable = in->enable;
-		packet->shdr.hdr.size += sizeof(u32) + sizeof(*multi);
+		packet->shdr.hdr.size += sizeof(*multi);
 		break;
 	}
 	case HFI_PROPERTY_PARAM_BUFFER_SIZE_ACTUAL: {
@@ -560,7 +560,7 @@ iris_hfi_gen1_packet_session_set_property(struct hfi_session_set_property_pkt *p
 
 		sz->size = in->size;
 		sz->type = in->type;
-		packet->shdr.hdr.size += sizeof(u32) + sizeof(*sz);
+		packet->shdr.hdr.size += sizeof(*sz);
 		break;
 	}
 	case HFI_PROPERTY_PARAM_WORK_ROUTE: {
@@ -568,7 +568,7 @@ iris_hfi_gen1_packet_session_set_property(struct hfi_session_set_property_pkt *p
 		u32 *in = pdata;
 
 		wr->video_work_route = *in;
-		packet->shdr.hdr.size += sizeof(u32) + sizeof(*wr);
+		packet->shdr.hdr.size += sizeof(*wr);
 		break;
 	}
 	case HFI_PROPERTY_PARAM_WORK_MODE: {
@@ -576,7 +576,7 @@ iris_hfi_gen1_packet_session_set_property(struct hfi_session_set_property_pkt *p
 		u32 *in = pdata;
 
 		wm->video_work_mode = *in;
-		packet->shdr.hdr.size += sizeof(u32) + sizeof(*wm);
+		packet->shdr.hdr.size += sizeof(*wm);
 		break;
 	}
 	case HFI_PROPERTY_PARAM_PROFILE_LEVEL_CURRENT: {
@@ -592,7 +592,7 @@ iris_hfi_gen1_packet_session_set_property(struct hfi_session_set_property_pkt *p
 			/* Level not supported, falling back to 1 */
 			pl->level = 1;
 
-		packet->shdr.hdr.size += sizeof(u32) + sizeof(*pl);
+		packet->shdr.hdr.size += sizeof(*pl);
 		break;
 	}
 	case HFI_PROPERTY_CONFIG_VENC_SYNC_FRAME_SEQUENCE_HEADER: {
@@ -600,7 +600,7 @@ iris_hfi_gen1_packet_session_set_property(struct hfi_session_set_property_pkt *p
 		u32 *in = pdata;
 
 		en->enable = *in;
-		packet->shdr.hdr.size += sizeof(u32) + sizeof(*en);
+		packet->shdr.hdr.size += sizeof(*en);
 		break;
 	}
 	case HFI_PROPERTY_CONFIG_VENC_TARGET_BITRATE: {
@@ -608,7 +608,7 @@ iris_hfi_gen1_packet_session_set_property(struct hfi_session_set_property_pkt *p
 
 		brate->bitrate = in->bitrate;
 		brate->layer_id = in->layer_id;
-		packet->shdr.hdr.size += sizeof(u32) + sizeof(*brate);
+		packet->shdr.hdr.size += sizeof(*brate);
 		break;
 	}
 	case HFI_PROPERTY_PARAM_VENC_RATE_CONTROL: {
@@ -627,7 +627,7 @@ iris_hfi_gen1_packet_session_set_property(struct hfi_session_set_property_pkt *p
 		}
 
 		packet->data[1] = *in;
-		packet->shdr.hdr.size += sizeof(u32) * 2;
+		packet->shdr.hdr.size += sizeof(u32);
 		break;
 	}
 	case HFI_PROPERTY_PARAM_VENC_H264_ENTROPY_CONTROL: {
@@ -637,7 +637,7 @@ iris_hfi_gen1_packet_session_set_property(struct hfi_session_set_property_pkt *p
 		entropy->entropy_mode = *in;
 		if (entropy->entropy_mode == HFI_H264_ENTROPY_CABAC)
 			entropy->cabac_model = HFI_H264_CABAC_MODEL_0;
-		packet->shdr.hdr.size += sizeof(u32) + sizeof(*entropy);
+		packet->shdr.hdr.size += sizeof(*entropy);
 		break;
 	}
 	case HFI_PROPERTY_PARAM_VENC_SESSION_QP_RANGE_V2: {
@@ -662,7 +662,7 @@ iris_hfi_gen1_packet_session_set_property(struct hfi_session_set_property_pkt *p
 			((max_qp & 0xFF) << 16);
 		range->min_qp.enable = 7;
 		range->max_qp.enable = 7;
-		packet->shdr.hdr.size += sizeof(u32) + sizeof(*range);
+		packet->shdr.hdr.size += sizeof(*range);
 		break;
 	}
 	case HFI_PROPERTY_CONFIG_FRAME_RATE: {
@@ -671,7 +671,7 @@ iris_hfi_gen1_packet_session_set_property(struct hfi_session_set_property_pkt *p
 
 		frate->buffer_type = in->buffer_type;
 		frate->framerate = in->framerate;
-		packet->shdr.hdr.size += sizeof(u32) + sizeof(*frate);
+		packet->shdr.hdr.size += sizeof(*frate);
 		break;
 	}
 	case HFI_PROPERTY_PARAM_UNCOMPRESSED_PLANE_ACTUAL_INFO: {
@@ -683,7 +683,7 @@ iris_hfi_gen1_packet_session_set_property(struct hfi_session_set_property_pkt *p
 		plane_actual_info->plane_format[0] = in->plane_format[0];
 		if (in->num_planes > 1)
 			plane_actual_info->plane_format[1] = in->plane_format[1];
-		packet->shdr.hdr.size += sizeof(u32) + sizeof(*plane_actual_info);
+		packet->shdr.hdr.size += sizeof(*plane_actual_info);
 		break;
 	}
 	case HFI_PROPERTY_PARAM_VENC_INTRA_REFRESH: {
@@ -691,7 +691,7 @@ iris_hfi_gen1_packet_session_set_property(struct hfi_session_set_property_pkt *p
 
 		intra_refresh->mode = in->mode;
 		intra_refresh->mbs = in->mbs;
-		packet->shdr.hdr.size += sizeof(u32) + sizeof(*intra_refresh);
+		packet->shdr.hdr.size += sizeof(*intra_refresh);
 		break;
 	}
 	case HFI_PROPERTY_PARAM_VENC_LTRMODE: {
@@ -700,7 +700,7 @@ iris_hfi_gen1_packet_session_set_property(struct hfi_session_set_property_pkt *p
 		ltr_mode->mode = in->mode;
 		ltr_mode->count = in->count;
 		ltr_mode->trust_mode = in->trust_mode;
-		packet->shdr.hdr.size += sizeof(u32) + sizeof(*ltr_mode);
+		packet->shdr.hdr.size += sizeof(*ltr_mode);
 		break;
 	}
 	case HFI_PROPERTY_CONFIG_VENC_USELTRFRAME: {
@@ -709,14 +709,14 @@ iris_hfi_gen1_packet_session_set_property(struct hfi_session_set_property_pkt *p
 		ltr_use->frames = in->frames;
 		ltr_use->ref_ltr = in->ref_ltr;
 		ltr_use->use_constrnt = in->use_constrnt;
-		packet->shdr.hdr.size += sizeof(u32) + sizeof(*ltr_use);
+		packet->shdr.hdr.size += sizeof(*ltr_use);
 		break;
 	}
 	case HFI_PROPERTY_CONFIG_VENC_MARKLTRFRAME: {
 		struct hfi_ltr_mark *in = pdata, *ltr_mark = prop_data;
 
 		ltr_mark->mark_frame = in->mark_frame;
-		packet->shdr.hdr.size += sizeof(u32) + sizeof(*ltr_mark);
+		packet->shdr.hdr.size += sizeof(*ltr_mark);
 		break;
 	}
 	case HFI_PROPERTY_CONFIG_VENC_INTRA_PERIOD: {
@@ -724,21 +724,21 @@ iris_hfi_gen1_packet_session_set_property(struct hfi_session_set_property_pkt *p
 
 		intra_period->pframes = in->pframes;
 		intra_period->bframes = in->bframes;
-		packet->shdr.hdr.size += sizeof(u32) + sizeof(*intra_period);
+		packet->shdr.hdr.size += sizeof(*intra_period);
 		break;
 	}
 	case HFI_PROPERTY_PARAM_VENC_HIER_P_MAX_NUM_ENH_LAYER: {
 		u32 *in = pdata;
 
 		packet->data[1] = *in;
-		packet->shdr.hdr.size += sizeof(u32) + sizeof(u32);
+		packet->shdr.hdr.size += sizeof(u32);
 		break;
 	}
 	case HFI_PROPERTY_CONFIG_VENC_HIER_P_ENH_LAYER: {
 		u32 *in = pdata;
 
 		packet->data[1] = *in;
-		packet->shdr.hdr.size += sizeof(u32) + sizeof(u32);
+		packet->shdr.hdr.size += sizeof(u32);
 		break;
 	}
 	default:

-- 
2.43.0


