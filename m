Return-Path: <linux-media+bounces-67206-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id P3LfKpz4T2pBrQIAu9opvQ
	(envelope-from <linux-media+bounces-67206-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 09 Jul 2026 21:38:04 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B9DC73510A
	for <lists+linux-media@lfdr.de>; Thu, 09 Jul 2026 21:38:04 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=gu4wnLBc;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=iSo2vQTw;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67206-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-67206-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EF1DD30416BE
	for <lists+linux-media@lfdr.de>; Thu,  9 Jul 2026 19:37:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CD6F3C2BBE;
	Thu,  9 Jul 2026 19:37:17 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 372CF3C062F
	for <linux-media@vger.kernel.org>; Thu,  9 Jul 2026 19:37:12 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783625836; cv=none; b=GjLFo/dJ8vGNa7cY/4WFHz4mfN8HU6vg4WJ+1tLEBgYGDY2z5Pl9W5gEF3OS2p3+t0Nhm5mbS8IR+gy5dviD8/waLkqaEi4YZZjezV7VM8uvxERdTbCyXY5k3hdKkH18zZHLhyuX8U6hdkmctGqg+wBXScY25U2k+6Uv/bzuLeU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783625836; c=relaxed/simple;
	bh=/yX5qqwc0FwDwfzLIeoMUNSa8oPTYi1YpRWwIMheozQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=koJV7tDH+M5qe99ANjCRvTjQ4wnPLIK6+/yQ0pOc68//h7Ktui1jIepuGXzD/38HLaUGhAwMx5CzFNl1URQ8x+dmDc8gjyQWRfchBoiBmzhxSLco6xdbQ9qZThbwKLLciNKtikufg/MOwuVLsM/jSXJE7HmDJfKTjLsV6abJDqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gu4wnLBc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iSo2vQTw; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669HXm1R2475783
	for <linux-media@vger.kernel.org>; Thu, 9 Jul 2026 19:37:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/h0in8AC8WcWs2ubAUt9BJaWYQrytkWk3f4Tb9JaVLE=; b=gu4wnLBcZZpzd1Ze
	nC5EAL9kZv65BfGn81Jfw7dOslfSI1FvG+FDOz24FF3nxgFlH1G91RzBRy0ffrGV
	CYBuYk9qO/aDI9ldVdMB9Pg1LItNOADBGaUSTb+e6mdu2wN+c66vqDjQDQYFAk0Y
	NzG9xbmVmBt6EiBJepP89ae1uGboDrZTLenyOzx9QZQiiYNsMvbcc6yctUKdwUDJ
	CYu19R82uUmYW2JnvTKnPX7QHgrfc7pizmvIyBPZdAZRq1i6WPfbEzORvJdLY87B
	NQ2B1oRzVJ04CICmHmAxwu4axwXTls4dNDH2RT3Ccu/sWZ91Iv0i/0RBCouC8568
	fKOUxA==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4faf5mrvw7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 09 Jul 2026 19:37:10 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-744e7c40512so41065137.1
        for <linux-media@vger.kernel.org>; Thu, 09 Jul 2026 12:37:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783625830; x=1784230630; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/h0in8AC8WcWs2ubAUt9BJaWYQrytkWk3f4Tb9JaVLE=;
        b=iSo2vQTw/ayPRBr9aK+gcre6dNlAVRqt53U4Ay6RK1FB9OxMW9JteNZYTtbg+FiiRR
         +9r+YYk2lOlQKB21+CwWE5AyBdaO9kdzHsGeZEhRoTo1MPLKAEhlcvRxR0vhGrR8BCfM
         ZnjaoIEymydkkxUQg37nQ+kGvCALkSw+kv2T+WhCf81fKg0Foa0PQRnYsfRk645ZInTk
         gR9I01jai/7v9f3W6PaYEk3ym5Dfvyq2OL5zuQe3AFccsJxPizp2o9RUW7UEO3UdScLm
         Uo8kJf7ULkbbuBf+3McVKG5JPqNK3FMNScSxiag75B4uRlP35I+L/PCoFPUfVgMZ2zLV
         q3vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783625830; x=1784230630;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/h0in8AC8WcWs2ubAUt9BJaWYQrytkWk3f4Tb9JaVLE=;
        b=qipJCSt3LeJL8NK9paAwLqHs/U+OE1Se3ej+cN8RtLI0Mg4E/B44Ge7OpYCK9n9/0E
         PdIs7JGJFAanyv5eim/wwqgcr4cHLCkndYdK+KPHsHSGJgtmSz3gC4Pt3HyeghvYLhaV
         CUkwgTj9Nrt3pl+krH7Q0dm0YS8m0mdKofDI4TL/Ft9DuyDWFPeQdhB6EDPCAXNulxtn
         Lhs+Y3LyxKJtTRctH0GOVijmav1I429SffzCiwBXCYOtttKy10+7VNocRabtgM0EnrIw
         kWAhTh3lrFb7NUMCGejIADf/1cE6zy4+LkCG7aP803af29tMBFlmZ9/SaKYDiJYcXgyG
         0yrw==
X-Gm-Message-State: AOJu0YzKC/nWhMVKfMwBV6vWxm5y3uXmEISDzlo7b1sVHBpYvZkxo9Eb
	dsSXL4kSpyknWG793hvA8VJOnwMhEUKnZXKouEoqFxLlNngdxjnVV7lxP4mXwr5wQgcDFE0DX4F
	TPetJMuSZNYLRXJaUWuCI5fu2m/0rYsVRgAgJNgMr8LbwfZc5xpPeu8jIZPTatVvRtQ==
X-Gm-Gg: AfdE7cmfoE4dUOBsNBH0IWia7yKJVsLRhSo09OXi6cYIPNH5/IV7uDOKFPo7SMO66kK
	/ZWXMLb2fj/edOXwIiNSelAih1njg76o6aMxjzsvZxNrlSlpIrSzCB0NOEWr5/ez/0DzlTRcU8q
	++OanJJam2Gbdm9/I05ajwcSLlTWs315CnQ1qOeAczrR7vQb0STgJOMbucwvLEbD+xCW/KFPKJF
	Z/bICikmWI/MOG5n/NRb40gIbQmksz0YKtWcQOr6xrRHyOqsGmcFyxn/XdfnSZ7dlzvk+mP9OLj
	DgDgb5n3yrJgISPrUpPHpQdvEYk5+h8tXe7yDlbXLx5ZOvoRlRUO8QysXL3hD0tLfdb3A/l5L/1
	GAFT8xx5UxyAAtF70ao2+11uMnTM5xRzshfsQtF2yVD+O67ZVQFlwFyQtaR/LxacJqgVYKbb1hO
	Nrf7spErobSm0jtqg9iU6Ss1cx
X-Received: by 2002:a05:6102:8019:b0:744:dc62:55ae with SMTP id ada2fe7eead31-744e00d15d0mr5415331137.16.1783625830193;
        Thu, 09 Jul 2026 12:37:10 -0700 (PDT)
X-Received: by 2002:a05:6102:8019:b0:744:dc62:55ae with SMTP id ada2fe7eead31-744e00d15d0mr5415302137.16.1783625829641;
        Thu, 09 Jul 2026 12:37:09 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b01caa635dsm46400e87.62.2026.07.09.12.37.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 12:37:08 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 09 Jul 2026 22:37:00 +0300
Subject: [PATCH 3/9] media: iris: add support for interlaced decoded
 content
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260709-iris-vp8-v1-3-6af3ab578a7c@oss.qualcomm.com>
References: <20260709-iris-vp8-v1-0-6af3ab578a7c@oss.qualcomm.com>
In-Reply-To: <20260709-iris-vp8-v1-0-6af3ab578a7c@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6795;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=/yX5qqwc0FwDwfzLIeoMUNSa8oPTYi1YpRWwIMheozQ=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqT/hd/dkVhmw79DxeguEZlzh3VAfnVKsMVsTmU
 4JlU+hRdIeJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCak/4XQAKCRCLPIo+Aiko
 1RhbB/4lWopNP5iVxyB8+1/qsq1f15PEbkFe4MI/OonE85gIpTrHFLs42E+OXGZCBfVL90HoG/+
 qQYSIPYvJxlrgn93j136/co1cZ9jHyLQG8adAEyYi8wQfRi6mbJ5hPaHUpM+fGc30H6pmpuYtpK
 77+Hf+D3W6tKgEqTkUOqtFW05jo2ftrXUEk9e/kGXzERVCDACUm4hPeB+QlwOixNB2Dq1TSmvD5
 zc17gHyl4ipDtja/3rHwtPoT8N1e9A8pnJht9eXnshUF7d7z0/qCLRBpZVZmtIAgANkNUFZkP9E
 bhWQ3njanj5LE2rUqQZ7MBHL5JZzjeRZ3S5O0x+fibAsp1zg
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: OMvObKQ-Ot6ngea9deKK28Z2Cg_siJRl
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDE5NCBTYWx0ZWRfX7yQ0vDLfrp8X
 L9aCWvC0l9Wnaft27ju4/nnYaqMxRulQOUgmDjFSKKNS215x0zzShiLKHVlodItNt0GVfg06M9O
 hLQ3HZPVMMSHaeWznbqGIz5SfOLVca4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDE5NCBTYWx0ZWRfXzSg+1UvM4htb
 K7NMep5bv2QGwfspS2D7QYHst6Sgw+w0YBuNS1q4zTi16M5MEJtVlk/QYWbbhS5WCoGXPaN0Nxg
 BNNw+unRozhYok0kw3FDvL5v/QEHJfNMFxlXyc2bRZqMOy6ZnlUL0PAX2sMgeh7qIOB9CoC0O+m
 Co6rD82MkVbHLRb0I269jynXgQ/Zo7Bvhixbj0elDu9yOHQ4rWJEDLmKUiIo1GD9TNWFZgJChvi
 kuUWb6HXjCERIAekYGOGcRogtlcoe0UMaRCBMMd2sGLoCBaDAVAPlRUnxa/x90sBXNM4N71O1hD
 qn5PP7XM/YwjQQSaX/flzchSUKo00E38sc45q4e83w9svlYHBbOk2I1aS3beYWs3aAcWSVuKweT
 T7qkG7EoI2CWQMLFWOlRc2IFCHjjMvb7Sj6D1ICZCx43Tp6zCSQb64H4z+o8v79t1ZBleZnFljH
 nMMiI27AYVn6vjEwmog==
X-Proofpoint-GUID: OMvObKQ-Ot6ngea9deKK28Z2Cg_siJRl
X-Authority-Analysis: v=2.4 cv=N+QZ0W9B c=1 sm=1 tr=0 ts=6a4ff867 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=5v90hXcHZB-AQrEjmJcA:9 a=QEXdDO2ut3YA:10 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_04,2026-07-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 priorityscore=1501 phishscore=0 adultscore=0
 suspectscore=0 impostorscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090194
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-67206-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:vikash.garodia@oss.qualcomm.com,m:dikshita.agarwal@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:mchehab@kernel.org,m:hverkuil+cisco@kernel.org,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:hverkuil@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2B9DC73510A

The Gen1 firmware can report that a decoded stream is interlaced through
the progressive_only field of HFI_PROPERTY_PARAM_VDEC_PIC_STRUCT. So far
the driver treated any interlaced content as unsupported and moved the
instance to the error state, rejecting otherwise decodable streams.

Stop rejecting interlaced content. Track the interlaced state on the
instance, report V4L2_FIELD_INTERLACED on the capture queue when the
content is interlaced, and skip allocation of the bin (scratch) buffer
in that case, matching the venus driver behaviour. Only genuinely
unsupported content (non-8-bit depth) is still rejected.

Assisted-by: Claude:claude-opus-4-8
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_ctrls.c             | 8 +++++++-
 drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c | 6 +++++-
 drivers/media/platform/qcom/iris/iris_instance.h          | 2 ++
 drivers/media/platform/qcom/iris/iris_vb2.c               | 2 --
 drivers/media/platform/qcom/iris/iris_vdec.c              | 2 ++
 drivers/media/platform/qcom/iris/iris_vpu_buffer.c        | 7 +++++++
 6 files changed, 23 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.c b/drivers/media/platform/qcom/iris/iris_ctrls.c
index 33a34573391a..c12fe724dfb8 100644
--- a/drivers/media/platform/qcom/iris/iris_ctrls.c
+++ b/drivers/media/platform/qcom/iris/iris_ctrls.c
@@ -517,7 +517,13 @@ int iris_set_stage(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id
 	u32 work_mode = STAGE_2;
 
 	if (inst->domain == DECODER) {
-		if (iris_res_is_less_than(width, height, 1280, 720))
+		/*
+		 * The two-stage pipeline cannot decode interlaced or MPEG2
+		 * content, so fall back to a single stage. Low resolution
+		 * content also uses a single stage.
+		 */
+		if (inst->is_interlaced ||
+		    iris_res_is_less_than(width, height, 1280, 720))
 			work_mode = STAGE_1;
 	}
 
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
index 7ad6f0bb4677..cf2cf31d5b61 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
@@ -103,11 +103,15 @@ static void iris_hfi_gen1_read_changed_params(struct iris_inst *inst,
 		num_properties_changed--;
 	} while (num_properties_changed > 0);
 
+	/* pic_struct carries progressive_only: 0 means the content is interlaced */
+	inst->is_interlaced = !event.pic_struct;
+
 	pixmp_ip->width = event.width;
 	pixmp_ip->height = event.height;
 
 	pixmp_op->width = ALIGN(event.width, 128);
 	pixmp_op->height = ALIGN(event.height, 32);
+	pixmp_op->field = inst->is_interlaced ? V4L2_FIELD_INTERLACED : V4L2_FIELD_NONE;
 	pixmp_op->plane_fmt[0].bytesperline = ALIGN(event.width, 128);
 	pixmp_op->plane_fmt[0].sizeimage = iris_get_buffer_size(inst, BUF_OUTPUT);
 
@@ -165,7 +169,7 @@ static void iris_hfi_gen1_read_changed_params(struct iris_inst *inst,
 	dst_q = v4l2_m2m_get_dst_vq(inst->m2m_ctx);
 	dst_q->min_reqbufs_allocation = inst->buffers[BUF_OUTPUT].min_count;
 
-	if (event.bit_depth || !event.pic_struct) {
+	if (event.bit_depth) {
 		dev_err(core->dev, "unsupported content, bit depth: %x, pic_struct = %x\n",
 			event.bit_depth, event.pic_struct);
 		iris_inst_change_state(inst, IRIS_INST_ERROR);
diff --git a/drivers/media/platform/qcom/iris/iris_instance.h b/drivers/media/platform/qcom/iris/iris_instance.h
index ffdbbd20901a..67466b4d0896 100644
--- a/drivers/media/platform/qcom/iris/iris_instance.h
+++ b/drivers/media/platform/qcom/iris/iris_instance.h
@@ -53,6 +53,7 @@ struct iris_hfi_session_ops;
  * @metadata_idx: index for metadata buffer
  * @codec: codec type
  * @last_buffer_dequeued: a flag to indicate that last buffer is sent by driver
+ * @is_interlaced: a flag to indicate that decoded content is interlaced
  * @last_buf_ns: start time of received input buffer for current one second FPS window
  * @frame_counter: input buffer counter for current one second FPS window
  * @frame_rate: frame rate of current instance
@@ -100,6 +101,7 @@ struct iris_inst {
 	u32				metadata_idx;
 	u32				codec;
 	bool				last_buffer_dequeued;
+	bool				is_interlaced;
 	u64				last_buf_ns;
 	u32				frame_counter;
 	u32				frame_rate;
diff --git a/drivers/media/platform/qcom/iris/iris_vb2.c b/drivers/media/platform/qcom/iris/iris_vb2.c
index a2ea2d67f60d..28dc269dcf0b 100644
--- a/drivers/media/platform/qcom/iris/iris_vb2.c
+++ b/drivers/media/platform/qcom/iris/iris_vb2.c
@@ -260,8 +260,6 @@ int iris_vb2_buf_prepare(struct vb2_buffer *vb)
 	if (V4L2_TYPE_IS_OUTPUT(vb->vb2_queue->type)) {
 		if (vbuf->field == V4L2_FIELD_ANY)
 			vbuf->field = V4L2_FIELD_NONE;
-		if (vbuf->field != V4L2_FIELD_NONE)
-			return -EINVAL;
 	}
 
 	if (!(inst->sub_state & IRIS_INST_SUB_DRC)) {
diff --git a/drivers/media/platform/qcom/iris/iris_vdec.c b/drivers/media/platform/qcom/iris/iris_vdec.c
index 9fee5f28097d..9169b1335b5c 100644
--- a/drivers/media/platform/qcom/iris/iris_vdec.c
+++ b/drivers/media/platform/qcom/iris/iris_vdec.c
@@ -251,6 +251,7 @@ int iris_vdec_s_fmt(struct iris_inst *inst, struct v4l2_format *f)
 		fmt = inst->fmt_src;
 		fmt->type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE;
 		fmt->fmt.pix_mp.pixelformat = f->fmt.pix_mp.pixelformat;
+		fmt->fmt.pix_mp.field = f->fmt.pix_mp.field;
 		inst->codec = fmt->fmt.pix_mp.pixelformat;
 		codec_align = inst->codec == V4L2_PIX_FMT_HEVC ? 32 : 16;
 		fmt->fmt.pix_mp.width = ALIGN(f->fmt.pix_mp.width, codec_align);
@@ -290,6 +291,7 @@ int iris_vdec_s_fmt(struct iris_inst *inst, struct v4l2_format *f)
 		fmt = inst->fmt_dst;
 		fmt->type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
 		fmt->fmt.pix_mp.pixelformat = f->fmt.pix_mp.pixelformat;
+		fmt->fmt.pix_mp.field = f->fmt.pix_mp.field;
 		fmt->fmt.pix_mp.num_planes = 1;
 		switch (f->fmt.pix_mp.pixelformat) {
 		case V4L2_PIX_FMT_P010:
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_buffer.c b/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
index 00dbb091c54e..88f130d09a6e 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
@@ -937,6 +937,13 @@ static u32 iris_vpu_dec_bin_size(struct iris_inst *inst)
 	u32 height = f->fmt.pix_mp.height;
 	u32 width = f->fmt.pix_mp.width;
 
+	/*
+	 * The bin (scratch) buffer is not used when decoding interlaced
+	 * content.
+	 */
+	if (inst->is_interlaced)
+		return 0;
+
 	if (inst->codec == V4L2_PIX_FMT_H264)
 		return hfi_buffer_bin_h264d(width, height, num_vpp_pipes);
 	else if (inst->codec == V4L2_PIX_FMT_HEVC)

-- 
2.47.3


