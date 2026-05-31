Return-Path: <linux-media+bounces-63163-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UM7FDHHOG2prGQkAu9opvQ
	(envelope-from <linux-media+bounces-63163-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 31 May 2026 08:00:17 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 843FA614A45
	for <lists+linux-media@lfdr.de>; Sun, 31 May 2026 08:00:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 22AB4308F363
	for <lists+linux-media@lfdr.de>; Sun, 31 May 2026 05:55:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFB9D31E859;
	Sun, 31 May 2026 05:55:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SQKNiB80";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DHm3DrXc"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 517BB3264EF
	for <linux-media@vger.kernel.org>; Sun, 31 May 2026 05:55:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780206958; cv=none; b=Bee6SG+mPVVkFGwuzzz+iWL6/xwQPJWLSB6gItQ73DStqsP6R2xEw2ejtQtuu9wtUv9hYzLriPFVr1AfKx/SnA5/y9lKnknrcZ1yPWnfl3M9ehXZ9PqdNRJi39n6xw7XqUJb8P6l57txbZ+hYife2p1hDvsKvN3VRaekYup/6Vk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780206958; c=relaxed/simple;
	bh=alP24qX7DhfjrijXtmZLs7Pqi9WftD4XbQsop7LdBKw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NoPt/uJ9R1ObN2i9p2niR7YTWz9yjIkkLLWedGljjsKFoXcAj6OEcTBlUW06dzyTHp1bOKRLh4sGwxbX+aPlC6B6AdDjhX8K446wClQLPHkcm3AeYfB6OCcclLR9e6ROqw8vsYXTQgMBOXkdtVlbS1x8eETDUNkZZa7EfhOO2GA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SQKNiB80; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DHm3DrXc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64V2vCsf3764324
	for <linux-media@vger.kernel.org>; Sun, 31 May 2026 05:55:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	U3Jm2LCWMeiItYyzNb5FlmstRZ2VQtC2wNQk+gG0Iig=; b=SQKNiB80V217qYVT
	34PkLP4x6Uk4GzCGcfFQREvAKzBDSfMbPBUaszhQdrbvRef5U+ud6C7hAmeqZbEm
	H3CtBIZ6DY1Rf5jHpoNMvnkiFyIskd5xzW2SXTM8nU5WpLTkA5QAe1NjCYbeF4Z3
	Y02/+j/AfT+yN2CdA+dXmIAj54SojHzSe/AFS7ppaGtV++W2XFGJyR6po56MpwiD
	Jr8cEQVuddHSwf6QBIvRDs4UdBHLCgTzR4M8FYShJ/a7msMYFRCa+yCxIG3OlOyJ
	2T4DOCz2zj5BSaaF7H6YqRAFsGQA6WKAtirvlufyZ1cN9uUymwiBZxO4qBXIrj8C
	/PvF1g==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4efs66tpa1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sun, 31 May 2026 05:55:56 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2c0532a6588so8743155ad.0
        for <linux-media@vger.kernel.org>; Sat, 30 May 2026 22:55:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780206956; x=1780811756; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U3Jm2LCWMeiItYyzNb5FlmstRZ2VQtC2wNQk+gG0Iig=;
        b=DHm3DrXcukmwIlyq5dIrCtTSNEeS1CdkjvNwmguJGBhrHl+DtDIaBlGVmeomfGIDiR
         OuRoEmIU5UwbIezlj/uHOQMWCDh9UBbuxt0R4zm0KbNqIbfK70DJliYKvZnz4GlRvI6U
         6tcEEfNIuDG/iwBF8BGwLY2be8xmHG4GclrB5SWHlszgQfvqVxXnAEDFL9vKgBhlVe7i
         nwTYYbrVIqMItrQfZ1wY8ii1xrSiNfaA3djwz/55+LVaM0fMoQBFBkxCpato3gsrz9qJ
         ZIjSVKmwu0IxClJ92TmXGLPA7IJc/16V2P+jKWQt8YJDpDA9FPLtqcBUzjbOWwM2ZeSb
         mxvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780206956; x=1780811756;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=U3Jm2LCWMeiItYyzNb5FlmstRZ2VQtC2wNQk+gG0Iig=;
        b=bkOQo1YYpNUpQv8AKrtqRHafeyaQ60Xa4VfLxTDfxlTjxEqOi2ndYazpM5xPWwW7CY
         jn3KU17JLi5+n5nKf75aOyqRHh5S+xWqqw2kZ4UHCRnOw79hM03G8GtiHxOyR5KAXm/c
         fVBLRSz4IAOJaSF03L2zIhI08ixERz37+s/JjX7UfutBOXvKasDNfSfI3iarAOvtJ1Zu
         zuBObprOfne5FyLvyRAD4S7x++zoeJ/5FNafhwPvNZbiY+DTOzwkERsY6buuzl+e8X8b
         j46SUWhPMKK3c4xrEXlMhX+9KxYi9ZOt8ZAIdnpxRop5jMT8D3Q9sW3DWDUxNIcou4uH
         Xpsw==
X-Gm-Message-State: AOJu0Yz5JnXGNq6UJaztFeJA5OM3d0RVI4jiQiWHPSRkHhEynmWhn0xa
	Yt2xXTd5yg+dKtpWgtTKZmn8cWBIpRp/Cfi2cCLXMMj+Vt+DE/Poe07bBKiGBcqX1ZCpf8C9F/K
	/Xub3i8D/2m31JmUMFaDTvoP3DJVjnwSG20oWKis3wzblfF25VxMuOqAc+2A4WyLReA==
X-Gm-Gg: Acq92OEXFTL/sqfd+6RlqQJa7DnjHDYzqIAPMBOAWyxNIXqmr5slX8bB+cv+0UNU1Ye
	KFwbeCFygHrKhFfVbePZem+RatvzEk7007FK8+vaG4D4aGZybIRpaI0UaagzVltThBzIYz7m87C
	KQpJgaXJijE7KW6/7fcz7mURBWGiCZEjweu50zp0JsLsj7VNhkqAQcNfqwYqVdwm99VqlG9DWSm
	O3KH8eFomDWY0xxCDLak6kUBhqt2M+dIfXTSCkWU8RRR6F7xnLbyZjorahh7dkA3V8KGGJ8GB3u
	DTbH6XDuvDbeClzXmgpNOzj/jsjGesYhSVS8MTLZVHfTqRxURS/OFPA+B5iCAxn8Q1hpZU37MpT
	N6SQ73+kRmfZj25ZRyqC4qiFB5Oe05Q1vckm7zhn6/ThCO8oW9uB+zW4JgbnDBfmxlQ==
X-Received: by 2002:a17:902:f610:b0:2c0:c389:d99c with SMTP id d9443c01a7336-2c0c389dd89mr19582555ad.15.1780206956096;
        Sat, 30 May 2026 22:55:56 -0700 (PDT)
X-Received: by 2002:a17:902:f610:b0:2c0:c389:d99c with SMTP id d9443c01a7336-2c0c389dd89mr19582295ad.15.1780206955617;
        Sat, 30 May 2026 22:55:55 -0700 (PDT)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf239e702fsm67124375ad.4.2026.05.30.22.55.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 May 2026 22:55:55 -0700 (PDT)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Sun, 31 May 2026 11:20:40 +0530
Subject: [PATCH v3 6/7] media: qcom: iris: Add missing break in
 iris_hfi_gen2_session_set_codec()
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260531-iris-code-improvement-v3-6-4c699c3dd719@oss.qualcomm.com>
References: <20260531-iris-code-improvement-v3-0-4c699c3dd719@oss.qualcomm.com>
In-Reply-To: <20260531-iris-code-improvement-v3-0-4c699c3dd719@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
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
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780206921; l=1008;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=Epm1IKP1y3YypBiDQmS8q4B6XeOav7jYm04d3gKp/TE=;
 b=NZZG5FNBcf9RC63vZ+mr1u26VmtIZoWhEUGQ2riAIUczEpgPpkN1sT7pqGBNRNVJzLGOLvao8
 IWd9KWIvoWrB5kpvr/aOCWN3HqwBCEog3lYq0MpqGJah7zPqZV0uQ5m
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTMxMDA2MiBTYWx0ZWRfXwCQYIIG9XkHS
 E1yCEmeJCGoRkZAsCgOZiPme4gqBhU2wHrTWFTcWqvpz03CSUmTqDahVUHvcjhSSXmRSWglylnZ
 2g03/f9dB6K2K53+aee4MhD5VO3OUUVxmajHKQhru8+qXTqa5PWTMjvofkLycPMSh3O859zCCH/
 fTnX/cj18ZTWfVPUIYh2fiC0Te414cJ8iqib9mckvGT8PNbyxNgTU8RAW7YOxnabp+96a4yRTtH
 Z+S4bOz0rCDPpUX4/lt6oVjKFQ5cIVZ+/NGoN7FAuPwzpJ+gO4u7uSutwS4QiHzB+5cYg/NgwOo
 0HUkLdfiOrJ+eOHuenOZioh4+NlPC7BErNv5W8Q3n8fbSl8GMhTMyOr5Lgi3YVM5MAynDUBddlN
 n3/V9/Yb53DNicY1YuvzPj3B2HSGrue27L80pSgzh8RNVCHvwUFbUw7MGtEb5PqYDQphMkH0EUm
 EMf/o+cSJhwtnkXX5hQ==
X-Authority-Analysis: v=2.4 cv=X8di7mTe c=1 sm=1 tr=0 ts=6a1bcd6c cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=nqERTrTL3htJ2auDmasA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: uNCJaRg4R_rQZX2teHci9sXxPA6DukCV
X-Proofpoint-GUID: uNCJaRg4R_rQZX2teHci9sXxPA6DukCV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-31_02,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 phishscore=0 impostorscore=0
 priorityscore=1501 bulkscore=0 adultscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605310062
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-63163-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[busanna.reddy@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 843FA614A45
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>

Without the break the AV1 case falls through, risking unintended behaviour
if new cases are added after it.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
index 516bc468c72c..1d21ddd84f41 100644
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


