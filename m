Return-Path: <linux-media+bounces-59401-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YFKOMiUL6mnFsgIAu9opvQ
	(envelope-from <linux-media+bounces-59401-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 23 Apr 2026 14:05:57 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 22E63451BEA
	for <lists+linux-media@lfdr.de>; Thu, 23 Apr 2026 14:05:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DDA293054BA9
	for <lists+linux-media@lfdr.de>; Thu, 23 Apr 2026 12:01:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DEEE43ED11B;
	Thu, 23 Apr 2026 12:01:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="n7c2DpDM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JEuQpYjh"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A1CE2BE026
	for <linux-media@vger.kernel.org>; Thu, 23 Apr 2026 12:01:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776945664; cv=none; b=EWlE241ZhTmH2Yo5wtoty2k4ZijMgAgeTtNUWCC9GxICAl7wlJd31t8POAfMmxOFjmPnM2RQg/Fa9NiuGYmwAgcUGBcRrnh3ubilSPxLCp8i8v0TE6fzYcHLppRhVIbCnfjmG2ZFnzM22pZtcBBsYW/OUptkLltUoPJRfRlagwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776945664; c=relaxed/simple;
	bh=HeQbfzBZxtAvx8sqFyD8eutBlpfwbgcN8L7xmMcTs+4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Gdh9n+H5XDLD88FxIZrj+tV49zWYszXOEC/CCTtx0G/UtYtqjIfxdpOWJ//aXlM4BrwKL8rC+yoDRK7eD1oEm8Sdqbtdh/S+qxeya9BpiEos175J3Mg7ezEJebQoZbCepiITGXCVj57Jm51EtQk+pziTfkfjAI3wauEEgn2LfUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=n7c2DpDM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JEuQpYjh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63N8u2qZ366198
	for <linux-media@vger.kernel.org>; Thu, 23 Apr 2026 12:01:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DWu+M18Oh4d1GMifcY3gZ9BMwszgGFVkypbPKVidZrU=; b=n7c2DpDMENbdI0sa
	+lT1nQZNEnnswgXt8ucfdHMKRu5TX0OGaDf700iTylJrifGL369rjY3aY2dG3YDR
	RUeM7w6A7TFQf/1ydEOYIIJmBsaOmTD+Zr83acH27y+XCSg66Ued3tgF+jzo77In
	UlVuo7V1YPm0qsOjqvIfnCnd5dwbDTzOerN55bZ39pRIcz82czhChHKPldmww1ps
	RieOS6+hwV82EQz/47wCslieDuIOJ9iMnfeOF0OT9+Pd8GeSTT2NpH+LQFJH4HFE
	ReSXTBuIO+O2mvZyGchcGNvwVQJC9Ldfjx/u2XzyceeHYZru+2x2yMp6QPaCUxXR
	YvU5Fg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dq35rbbwm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 23 Apr 2026 12:01:01 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2b79f4b35b7so7025145ad.0
        for <linux-media@vger.kernel.org>; Thu, 23 Apr 2026 05:01:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776945661; x=1777550461; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DWu+M18Oh4d1GMifcY3gZ9BMwszgGFVkypbPKVidZrU=;
        b=JEuQpYjhWjl84Zj4EvNmmUQfHxQ9xD+bGMwic3R6/Yadcgq3rwwtV5fZgpUC+ufnDe
         bZ6qFU0FIPa8ETfjPh0tV4BHyqA87NRGd9XEOWFHEDSYPGOKjK1b/Zgi24YSg7EmvuTP
         73M7Xc8VGivLRituhoJeQ4bED1YUFZQdR1orEbmk3LZ+i1F6DfC4miQrFeb4wRM8+tW0
         mel7hmt+Pd7SgpNK43C/4JxSLjZYI2itaq7jl/UD5ilCJ5mBtIzTm3p4UbFaZGlHv7Kv
         //nBiTjtQvj4gJNZVuFzRtgIl4pZ9dGN2HfwKn7JKnqjBCb6RYjIdENrcnKQLBr8Mt80
         Anrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776945661; x=1777550461;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DWu+M18Oh4d1GMifcY3gZ9BMwszgGFVkypbPKVidZrU=;
        b=KTbqddoiNVgWBtQVaU6Z5PRaaJ7b+hfTNN9S+tNeEnJPo9mmD0bAFe0oFHFG16+mdm
         oydmgOvhyDihxyMmuUqiL7ekQF1nuq6V5Yk5nzBq8tHVOAYW6SWj+eSVHt9zTrFQPoKD
         O5X+XfquQ0hrEXoEAOK3GDBjfJci1s4sZ2VQ/Z4jtB7eqUEgQM1+pm936aeF6Br0hRzw
         +fO0Gu95IqoTWu0HEljQTG7folURSvmDvYCwRZKIx3mduGdGl9FqFANgfPXPoQZ06Bxw
         Ca1poDtyAh2cb7ypQ8hKDI1yKOTm1wBEawHsrdZiAA0O5k0to+Xb8gdz6jRSugFrpQno
         xzdQ==
X-Gm-Message-State: AOJu0YwKba6QCt/Dxy7yZjn2GhfwzcLpDOUovSO6xVldxFOWo8d7U40I
	UQiCTKchI/1tjV0bXL1JshCVPIF0byLSV3536D2ubyYNwCfKOb8fYSCVkX1gWIF0MkoAiFt958R
	rlwQtiPkqWfLXgCh43uOdaPkXyLG3bKwV1WfJ9RGJcbAfR1qg/UVu8juQwQC5avV7eA==
X-Gm-Gg: AeBDievS8jfTylrsz4SMY7s+uE+uLxUJlfirihxHsaEXOAGuCyrAJBPXPn4vqG41rZR
	omN9EAMJR/953ICTL1bpAcO5xfq25Mc2bzAZllneQfDYPSLyT3lifLYRKPzi671iHZKNu2fA+SG
	rD62ppCP5qsj4WABLbDkKasrSBFZ8g9Wqa8rKrXBWQRj0QDYRnR+QJugah8wyCC1GIV7ojUiP62
	T2m+QgHiD6unGzb+8N7XbNXhtm+Q0SPQ90IvByE663wS0yiqHdMEjFcV5aDp38e4XLdJxltEPxY
	u4PNgGuxkL6P7YqSwsEzi+fuf0rb2jWEE4uO2bCLbV3faZYuT4ljVApVz0SfocgbIi6j2Db3S0x
	ZwPRQXP0OaEToMe8tToeB+i10fti6WN7ngCIHfSG71DjkELRgauh7e0oosd0dj3I2KPnqgA==
X-Received: by 2002:a17:902:ce09:b0:2b4:5d87:a1fd with SMTP id d9443c01a7336-2b5f9fd21c5mr281094265ad.27.1776945660798;
        Thu, 23 Apr 2026 05:01:00 -0700 (PDT)
X-Received: by 2002:a17:902:ce09:b0:2b4:5d87:a1fd with SMTP id d9443c01a7336-2b5f9fd21c5mr281093675ad.27.1776945660319;
        Thu, 23 Apr 2026 05:01:00 -0700 (PDT)
Received: from hu-dikshita-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5faa4f092sm194790355ad.36.2026.04.23.05.00.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 05:00:59 -0700 (PDT)
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Date: Thu, 23 Apr 2026 17:30:10 +0530
Subject: [PATCH v2 6/7] media: qcom: iris: Add missing break in
 iris_hfi_gen2_session_set_codec()
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260423-iris-code-improvement-v2-6-9e9cbf00f9c9@oss.qualcomm.com>
References: <20260423-iris-code-improvement-v2-0-9e9cbf00f9c9@oss.qualcomm.com>
In-Reply-To: <20260423-iris-code-improvement-v2-0-9e9cbf00f9c9@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776945627; l=1002;
 i=dikshita.agarwal@oss.qualcomm.com; s=20240917; h=from:subject:message-id;
 bh=HeQbfzBZxtAvx8sqFyD8eutBlpfwbgcN8L7xmMcTs+4=;
 b=MFvb/avwBQUHw1mATjVUho0TncKBj6ZokRDF4/aZOYG11kpwd6toJbTYSSs2elkAbj4U1CX5M
 FeqFDF1noxsBhEfT5qgpmw63n72ftCdKD28DQHc1Tf9L/K7jTGEvdVv
X-Developer-Key: i=dikshita.agarwal@oss.qualcomm.com; a=ed25519;
 pk=EEvKY6Ar1OI5SWf44FJ1Ebo1KuQEVbbf5UNPO+UHVhM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIzMDExOSBTYWx0ZWRfX8VZazVIThTVq
 ItzioZazrNxahE4uZoKUOiysWw+REetE0kWwOYqqng03rN7IciGk4Py+Nzb9SnVyPczwdu04iME
 MC4zNlHh/Tbe7q3WWs7RSHdHiR7ONVfRuUegZwYStwgbAuKMNOaJMuDKDbmsjBkLbMVFXGKvgH8
 mNwEsUNdYJSYMcpu0mAaMMjtejOHSsn2P8P+MiNV7+TntruqjPqWwomlmHaCD96s0qMrkVDbSxm
 d5Jv5QdgqovScs/hWPxzNoNErrHSxrgwK7SM3UhiDGqVRTSY/zsMLIeHHheIRHRN4EiLlH7Hgwb
 ZBFSpaGYFu63HwPKiqcoVlBT+IKKWhKkzQlN8sq71976aO/H4fOI5hERP8FXxvwe2fYxCbCScB8
 wp9kbcrvW3TzwaO1vz1C89ddJ3C9rkCODvNedoQnArn5fZtwLJ42+bJlyTIeyoTYn4gaEO7mQ3F
 hmgY+cWn2tB9uIvDfLQ==
X-Proofpoint-ORIG-GUID: ozmIpLULTYMcQyu_ODGAB44RB_OneSmT
X-Proofpoint-GUID: ozmIpLULTYMcQyu_ODGAB44RB_OneSmT
X-Authority-Analysis: v=2.4 cv=f5J4wuyM c=1 sm=1 tr=0 ts=69ea09fd cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=TZpohm96M3O9q7pB9U4A:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 phishscore=0 adultscore=0 malwarescore=0
 spamscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604230119
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
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-59401-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,linaro.org:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dikshita.agarwal@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MAILSPIKE_FAIL(0.00)[2600:3c04:e001:36c::12fc:5321:query timed out];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 22E63451BEA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Without the break the AV1 case falls through, risking unintended behaviour
if new cases are added after it.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
index cf3386437102b814cf4b042a0a27f25a886dcf36..693fe3b34b078b12a738ae36fd12e9b1edf4a13b 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
@@ -696,6 +696,7 @@ static int iris_hfi_gen2_session_set_codec(struct iris_inst *inst)
 		break;
 	case V4L2_PIX_FMT_AV1:
 		codec = HFI_CODEC_DECODE_AV1;
+		break;
 	}
 
 	iris_hfi_gen2_packet_session_property(inst,

-- 
2.34.1


