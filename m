Return-Path: <linux-media+bounces-59952-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yAJJCj/O8WlrkgEAu9opvQ
	(envelope-from <linux-media+bounces-59952-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 29 Apr 2026 11:24:15 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 83C32491D36
	for <lists+linux-media@lfdr.de>; Wed, 29 Apr 2026 11:24:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 69EA030C4F55
	for <lists+linux-media@lfdr.de>; Wed, 29 Apr 2026 09:17:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A55113C3C14;
	Wed, 29 Apr 2026 09:17:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ltprExDm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Yi+m7BTU"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B7BF3C3BE6
	for <linux-media@vger.kernel.org>; Wed, 29 Apr 2026 09:17:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777454227; cv=none; b=JK/DCTaK9d3lQqNAQbQvQZJpL0AS44RO/0OnVF4xz/wRGYYHiump34ChcuC8SebsMGwG2Y3Tp1QG+WqiHZfqqrafmvZhBrSdggLlaJiBf0+oC8W9Txha1K8LGYO7yn1eJpDUAtPSxj2uc9bNmMAYALuYs+uMn8gM6UnT+QBaAuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777454227; c=relaxed/simple;
	bh=jrRFuWoxlVioqpDAeJWOWFjbmkL6denLp6VOgJXrMto=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uFj7lWvFub7c2diyr5kWiizXBIP8Jorm+JBUEk0t/2Tb7S8JJ0VjJ/DziOM64flRBHOobyTyD65ah/64oxe8X6Zvk7EkUZaLjBemkT6nYH/a84HylI+WM9c8ZEsPdQhgIFlv29yy3iuDj2W4sk3vVpTfMEDzbEY7wMYnSOBqTG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ltprExDm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Yi+m7BTU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63T8psdu2094143
	for <linux-media@vger.kernel.org>; Wed, 29 Apr 2026 09:17:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SgKjKjKvqbUKmC0sveVddbfRIm0tA2cFa4F+N92yWLw=; b=ltprExDmECCikxep
	rDPBqept/PRuNoi0mwn6qX7KfTO2oJa6KbSznvm39MEikHTVpNIHGY8Me4wUdXqL
	2gO9UIKVjlIGsGZyfXwj4RZhmE0k0RjNasKUAc7pcJR4nWn8m1+mWV366ziSU6pe
	3CQNFKHGEhfwHkF7apwdfmPT4WRpL3Q/P1xs3FL9J2h3phXQzXn70YzKnu9RAwqM
	348NSFy4k84UGBBI+Fc6MIdfJOJyUgVikStamVB0FZm/HksE5JCG/p0/IbbIDSD/
	kZhgFG/YbuYGRg3riLRBXcqHVJWQzkuPYRnMfwvHUcx8nyDYJnyHUkZcu9N8oMqf
	S7RbQw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dudh3rhyu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 29 Apr 2026 09:17:04 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-82f0e12d375so7099546b3a.1
        for <linux-media@vger.kernel.org>; Wed, 29 Apr 2026 02:17:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777454223; x=1778059023; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SgKjKjKvqbUKmC0sveVddbfRIm0tA2cFa4F+N92yWLw=;
        b=Yi+m7BTUfHWxxDPFO+yiqXCh7VYjbDyxKWfWtuFj1PTi5f17DJrJmZrBcuA2TZw2y1
         0EXQe61EGGlH7xM3CrCa0U7dcK2qYxKvgiakyOp6d1Ky1RwBi8rNsc+asSrAuG7RRuu6
         6BNZ/TSRbNvGnyVcbINcM7KXGcn1G0uDC+/OXf1AstQAGaFM34JhMrPbhwV/eiPq78G0
         TlcKnK7BV3rpCdajbRUHVQ9mGwIrcMnEf2mYLW0RnwbN5NEPMc2dP47CICaohr+mtacb
         H8LLDMI/mV5VjBHCR2i2cKBWS7IGHzDdUDa2TCC/H0ojHBlVfnzDL/SwT2hrkBvLa+gn
         Fvig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777454223; x=1778059023;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SgKjKjKvqbUKmC0sveVddbfRIm0tA2cFa4F+N92yWLw=;
        b=kqGvgaf9R5M0CWW5D7X9aGR1eXbYCjPNMsgmy3WAuH15KQ6Zq08kDtgy8YQFIHjyc9
         0fhnS9SKjWMtIEBYGyPyrpuyZMY4cO7qfPKFniQO4t7Fk//yHgZHjr5KWAicAuRwBfXs
         dvEPE5t9NohkQLIWZGyNOlhjYHr59wrIlXBRiK7O7GRePuh1y5PrRGsKpRITqugMVFaZ
         UNTwzEXp/yjG9pdSBbAYTO+B7CtCxW2a1ag/L5RzraKpUdx6vNG//UbAVRHvFQMkP4SN
         7okk2+dbEAt6cnen8cKIMHGh0fdtmBi9nhUMPynuHhw6MaUppO86Q+AeQ4z+1600B8GL
         3cog==
X-Forwarded-Encrypted: i=1; AFNElJ/Z3qyMpF+KSnb/Uc4kLiu/axKCcXWPKMHrHAMYX491MOp6DewcTk9jyW7VKO030cEuZw33OrT1raVkmw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwW7TPQH5tISC+NY3AvbuIqtQLIhiPk2FbRXGnJrIzJfo04CRjm
	CU8P16vXmRnfqmk8KZ1z0sH5V6fJKLKlN6Wyh8/sppHtmctRGffCsvX0bvUVDMsK8CDTB5PDR6c
	Rb3ukn4X5gJaEHdfslI1lheKDT9SHL6r/vax7DwFROZ3TXvDM2i17OmIlvpRtT6M5Pw==
X-Gm-Gg: AeBDieujDO2e4XvOZ1rZyiho6lkw43fZ39Q80agkBKTvnkhifKn29zzxPXin+wh1b/z
	SIrAR2f3vzWLMJqxTy0jTYfT+3q559FgvF3g56R2InX3Yc58UzbDkpM5t2Wh4iAjyrtKXOZAOHp
	W6ttktrPJZBov3L5IzpyFoa9x0BMdCldTglz/k8zqmbEsH0ie8ab46GiYze4dJJ5a9+ROWf6gXH
	EiocmYNAO9CmMw4tajksnqWSGV6YY2ZKAxzTOF/5maBniInILCMU+Get1cHCnEHzHWGFL+4G+5x
	FlcGt27Ss2Vz29+2AUcH21mYFPJqBTLNRT3IW2Tt99Czc9vAgEELe07/2Bn78ya747OEN42Bjc4
	//UmMbYo6CWWCblfjY2R2s99ufQFcXkM9jxX/OEe+CeLaZSAQ5+x9OowElIg6bbVLdz1ZoYaMeV
	mA6UlmZrOPuvjJQxXivnWPJ6TJ8LeeTgI=
X-Received: by 2002:a05:6a00:418e:b0:82f:6b3a:8281 with SMTP id d2e1a72fcca58-834ddae11damr6731535b3a.7.1777454223401;
        Wed, 29 Apr 2026 02:17:03 -0700 (PDT)
X-Received: by 2002:a05:6a00:418e:b0:82f:6b3a:8281 with SMTP id d2e1a72fcca58-834ddae11damr6731489b3a.7.1777454222833;
        Wed, 29 Apr 2026 02:17:02 -0700 (PDT)
Received: from WANGAOW-LAB01.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-834ed80dfa6sm1496340b3a.57.2026.04.29.02.16.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 02:17:01 -0700 (PDT)
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
Date: Wed, 29 Apr 2026 17:16:49 +0800
Subject: [PATCH 2/2] media: qcom: iris: Add request key frame support for
 encoder
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260429-dynamic_encode-v1-2-c9fb691d8b3a@oss.qualcomm.com>
References: <20260429-dynamic_encode-v1-0-c9fb691d8b3a@oss.qualcomm.com>
In-Reply-To: <20260429-dynamic_encode-v1-0-c9fb691d8b3a@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: quic_qiweil@quicinc.com, Renjiang Han <renjiang.han@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Wangao Wang <wangao.wang@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777454211; l=8120;
 i=wangao.wang@oss.qualcomm.com; s=20251021; h=from:subject:message-id;
 bh=jrRFuWoxlVioqpDAeJWOWFjbmkL6denLp6VOgJXrMto=;
 b=1TXNPHKYLonNThWCmXghV5quvSJQEZm6CbDgVJLJA4GeY1vsGYNz2/mqmA402aYh3zAlt9rfu
 4UFYqX4f6D3AZ7TlK6yboEz+DJWctmFJMhWFqBRDoeFQ8Xhd5HOLh3Y
X-Developer-Key: i=wangao.wang@oss.qualcomm.com; a=ed25519;
 pk=bUPgYblBUAsoPyGfssbNR7ZXUSGF8v1VF4FJzSO6/aA=
X-Proofpoint-GUID: jwv8LZ9tX2IcSlP9qgTuY3GXAXl3Zuyj
X-Authority-Analysis: v=2.4 cv=A4dc+aWG c=1 sm=1 tr=0 ts=69f1cc90 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=VWFmKy9SzxuNEvGSCf4A:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: jwv8LZ9tX2IcSlP9qgTuY3GXAXl3Zuyj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDA5MiBTYWx0ZWRfX77Igod9IzJm4
 r49p5e+CjcuhManUKZ2GegDaeKs1sI4iY/XgQPJMJFETjXM64k0AVSFpVWTSfo4Q2zvVksA1qFF
 ZC6K0B/1+dNUZllR3wTYmHWISDF4lUxYmNS+QuqbRj3PNeeWvHyjJyQyZRXk38IT8YzCPz/a85e
 GDpx/tKGXSdsGy0hLOE+Y5NL7gJGekpoSnhKJgXasDK02ok8MUtwBD/2RAXcRXrdWxq8K1mgNvk
 skI44bIdaFVjq6PByT18Z2tZDQan6k8jHekTipVNiEVWucipKvTGzq99SeauuSW0QJ5gUtW+nap
 ioKMhUoQEeGykBk4iZhR3LljO0961u1SuCCwtiptFliJ7eDe+dBUm9bs9YGrYMf2bFFnIh22IJx
 LOel5IDUKYdd+0AETZOE9WcsOIc9glTUoFL1hHWqPWvUgCQAEtUthYzrgUkiJqfipgGF021wPrx
 rwCs5vNYw8NybZI10Yg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_05,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 phishscore=0 bulkscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604290092
X-Rspamd-Queue-Id: 83C32491D36
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-59952-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FROM_NEQ_ENVFROM(0.00)[wangao.wang@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_COUNT_SEVEN(0.00)[7]

Add request key frame support for both gen1 and gen2 encoders by enabling

V4L2_CID_MPEG_VIDEO_FORCE_KEY_FRAME.

Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_ctrls.c      | 22 ++++++++++++++++++++++
 drivers/media/platform/qcom/iris/iris_ctrls.h      |  1 +
 .../platform/qcom/iris/iris_hfi_gen1_command.c     |  3 +++
 .../platform/qcom/iris/iris_hfi_gen1_defines.h     |  1 +
 .../platform/qcom/iris/iris_hfi_gen2_defines.h     |  7 +++++++
 .../platform/qcom/iris/iris_platform_common.h      |  1 +
 .../media/platform/qcom/iris/iris_platform_gen1.c  | 10 ++++++++++
 .../media/platform/qcom/iris/iris_platform_gen2.c  | 12 +++++++++++-
 8 files changed, 56 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.c b/drivers/media/platform/qcom/iris/iris_ctrls.c
index 51eb644f2f1aba95b72a6cc8706beb3d2d67451a..b83445b6e596466c48884669e1b11b6f581e9461 100644
--- a/drivers/media/platform/qcom/iris/iris_ctrls.c
+++ b/drivers/media/platform/qcom/iris/iris_ctrls.c
@@ -154,6 +154,8 @@ static enum platform_inst_fw_cap_type iris_get_cap_id(u32 id)
 		return LAYER4_BITRATE_HEVC;
 	case V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_L5_BR:
 		return LAYER5_BITRATE_HEVC;
+	case V4L2_CID_MPEG_VIDEO_FORCE_KEY_FRAME:
+		return REQUEST_SYNC_FRAME;
 	default:
 		return INST_FW_CAP_MAX;
 	}
@@ -297,6 +299,8 @@ static u32 iris_get_v4l2_id(enum platform_inst_fw_cap_type cap_id)
 		return V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_L4_BR;
 	case LAYER5_BITRATE_HEVC:
 		return V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_L5_BR;
+	case REQUEST_SYNC_FRAME:
+		return V4L2_CID_MPEG_VIDEO_FORCE_KEY_FRAME;
 	default:
 		return 0;
 	}
@@ -1477,6 +1481,24 @@ int iris_set_layer_bitrate(struct iris_inst *inst, enum platform_inst_fw_cap_typ
 					     &bitrate, sizeof(u32));
 }
 
+int iris_set_req_sync_frame(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
+{
+	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
+	u32 hfi_id = inst->fw_caps[cap_id].hfi_id;
+	u32 hfi_val = 0;
+
+	if (inst->fw_caps[PREPEND_SPSPPS_TO_IDR].value)
+		hfi_val = HFI_SYNC_FRAME_REQUEST_WITH_PREFIX_SEQ_HDR;
+	else
+		hfi_val = HFI_SYNC_FRAME_REQUEST_WITHOUT_SEQ_HDR;
+
+	return hfi_ops->session_set_property(inst, hfi_id,
+					     HFI_HOST_FLAGS_NONE,
+					     iris_get_port_info(inst, cap_id),
+					     HFI_PAYLOAD_U32_ENUM,
+					     &hfi_val, sizeof(u32));
+}
+
 int iris_set_properties(struct iris_inst *inst, u32 plane)
 {
 	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.h b/drivers/media/platform/qcom/iris/iris_ctrls.h
index 3c462ec9190be8935176b290588f224fe4f144a4..8d8bbef960076c08e5af0f65920dde187f24a313 100644
--- a/drivers/media/platform/qcom/iris/iris_ctrls.h
+++ b/drivers/media/platform/qcom/iris/iris_ctrls.h
@@ -47,6 +47,7 @@ int iris_set_layer_type(struct iris_inst *inst, enum platform_inst_fw_cap_type c
 int iris_set_layer_count_gen1(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
 int iris_set_layer_count_gen2(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
 int iris_set_layer_bitrate(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
+int iris_set_req_sync_frame(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
 int iris_set_properties(struct iris_inst *inst, u32 plane);
 
 #endif
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
index 3779fe5040badf1e264f5ab56938d7334ec7ab8b..c567b464aede77dd58bd3dc2596350fa068da2d8 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
@@ -741,6 +741,9 @@ iris_hfi_gen1_packet_session_set_property(struct hfi_session_set_property_pkt *p
 		packet->shdr.hdr.size += sizeof(u32);
 		break;
 	}
+	case HFI_PROPERTY_CONFIG_VENC_REQUEST_SYNC_FRAME: {
+		break;
+	}
 	default:
 		return -EINVAL;
 	}
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h b/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h
index 0e4dee19238464a9671a94eaab8eeda2d7f7ca9f..275f3fea3d2aabe26a2a0498c78c09ec28765b24 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h
@@ -157,6 +157,7 @@
 #define HFI_PROPERTY_PARAM_VENC_HIER_P_MAX_NUM_ENH_LAYER	0x2005026
 #define HFI_PROPERTY_CONFIG_VENC_TARGET_BITRATE			0x2006001
 #define HFI_PROPERTY_CONFIG_VENC_INTRA_PERIOD			0x2006003
+#define HFI_PROPERTY_CONFIG_VENC_REQUEST_SYNC_FRAME		0x2006004
 #define HFI_PROPERTY_CONFIG_VENC_MARKLTRFRAME			0x2006009
 #define HFI_PROPERTY_CONFIG_VENC_USELTRFRAME			0x200600a
 #define HFI_PROPERTY_CONFIG_VENC_SYNC_FRAME_SEQUENCE_HEADER	0x2006008
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h b/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
index d09096a9d5f934acf072b05c2cf80f3007c3aa7e..66d37130bde3cdce7387b980c5058b74335b6633 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
@@ -90,6 +90,13 @@ enum hfi_layer_encoding_type {
 #define HFI_PROP_BITRATE_LAYER4			0x0300013f
 #define HFI_PROP_BITRATE_LAYER5			0x03000140
 #define HFI_PROP_BITRATE_LAYER6			0x03000141
+
+enum hfi_syncframe_request_mode {
+	HFI_SYNC_FRAME_REQUEST_WITHOUT_SEQ_HDR		= 0x00000001,
+	HFI_SYNC_FRAME_REQUEST_WITH_PREFIX_SEQ_HDR	= 0x00000002,
+};
+
+#define HFI_PROP_REQUEST_SYNC_FRAME		0x03000145
 #define HFI_PROP_MAX_GOP_FRAMES			0x03000146
 #define HFI_PROP_MAX_B_FRAMES			0x03000147
 #define HFI_PROP_QUALITY_MODE			0x03000148
diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index e1e8cff01f5be2554ce4704f74bcd76d2477a413..d906ea4fe4e0197ff60382b3d601c76ab4638a31 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -189,6 +189,7 @@ enum platform_inst_fw_cap_type {
 	LAYER3_BITRATE_HEVC,
 	LAYER4_BITRATE_HEVC,
 	LAYER5_BITRATE_HEVC,
+	REQUEST_SYNC_FRAME,
 	INST_FW_CAP_MAX,
 };
 
diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen1.c b/drivers/media/platform/qcom/iris/iris_platform_gen1.c
index a1988f22f8aac72eb64f944f0d341a49e8b8ee5c..194e192dc035d2b72e97cba493c38bed04639955 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_gen1.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_gen1.c
@@ -397,6 +397,16 @@ static const struct platform_inst_fw_cap inst_fw_cap_sm8250_enc[] = {
 			CAP_FLAG_DYNAMIC_ALLOWED,
 		.set = iris_set_bitrate_gen1,
 	},
+	{
+		.cap_id = REQUEST_SYNC_FRAME,
+		.min = 0,
+		.max = 0,
+		.step_or_mask = 0,
+		.value = 0,
+		.hfi_id = HFI_PROPERTY_CONFIG_VENC_REQUEST_SYNC_FRAME,
+		.flags = CAP_FLAG_INPUT_PORT | CAP_FLAG_DYNAMIC_ALLOWED,
+		.set = iris_set_req_sync_frame,
+	},
 };
 
 static struct platform_inst_caps platform_inst_cap_sm8250 = {
diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
index f87c713e1153388d5724a5a2add48022367d8737..807a4bb1213d5cc984e611cb155a02611997409b 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
@@ -961,7 +961,17 @@ static const struct platform_inst_fw_cap inst_fw_cap_sm8550_enc[] = {
 		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_INPUT_PORT |
 			CAP_FLAG_DYNAMIC_ALLOWED,
 		.set = iris_set_layer_bitrate,
-	}
+	},
+	{
+		.cap_id = REQUEST_SYNC_FRAME,
+		.min = 0,
+		.max = 0,
+		.step_or_mask = 0,
+		.value = 0,
+		.hfi_id = HFI_PROP_REQUEST_SYNC_FRAME,
+		.flags = CAP_FLAG_INPUT_PORT | CAP_FLAG_DYNAMIC_ALLOWED,
+		.set = iris_set_req_sync_frame,
+	},
 };
 
 static struct platform_inst_caps platform_inst_cap_sm8550 = {

-- 
2.43.0


