Return-Path: <linux-media+bounces-67255-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 3eEFH1+7UGqo4AIAu9opvQ
	(envelope-from <linux-media+bounces-67255-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 10 Jul 2026 11:29:03 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 947DB7390AE
	for <lists+linux-media@lfdr.de>; Fri, 10 Jul 2026 11:29:02 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=MMYkQD6+;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=EAvhJrjj;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67255-lists+linux-media=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-media+bounces-67255-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 1680E30D02E1
	for <lists+linux-media@lfdr.de>; Fri, 10 Jul 2026 09:06:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07FFB3D669E;
	Fri, 10 Jul 2026 09:05:08 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 527783DEFFA
	for <linux-media@vger.kernel.org>; Fri, 10 Jul 2026 09:05:05 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783674307; cv=none; b=hpCLZKy/jHkzXPNz8kL1cvGzKymXEm8wgBmAYeatzD6QerbOt0LPiwA0GUKSDRf+WtoxF+uhzCt2+lVJxfUDBMHSC1ZN7pCiJZL4AFlPe05lFnYd/xxE9bi3d8Mf/EjcVc6gAXkldQ4+281F707eZCLJTdXlspVHo6w1MXnspY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783674307; c=relaxed/simple;
	bh=VmSVbvVuTt4AN5C8oiuT9E98mX8DRT9XHfPGxKvhc/w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=K3DcLYG9WWiENSaDnHcN9fE5DosA2jK6ghFwIi8RmvzXC+grCfQO3HgCi+X+Mat9jOrhecORKgoTQ8YAa3JCfbTf7LS6/526m68hF/AC9MCYGrT1M1VL6C/yAXnbyiAlXUoW8dmsqN+KdmWknefxaAWWIiM/c77d7UgQunm7kg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MMYkQD6+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EAvhJrjj; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66A7dUUZ182768
	for <linux-media@vger.kernel.org>; Fri, 10 Jul 2026 09:05:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rzlf2ZtK9nuTY0MJJWVDEnSEIyJ35HZ7vs1BndCygtQ=; b=MMYkQD6+kI8HwVus
	v+lIuYYzSiya2DyC+iLQXcxhHHHM3KItB/1J6Ce391tk0SPnlpDVwFRr2+Br/rTB
	h6q6MX6ocPwBnqc/JCOZpsnjvmOUgM8awpXqpOeuEuPtbf/y/4ipDRMtFvgW+Bhz
	G8tRID+oL22dAYzIRw/XKe8bmpGfs/C4YHx6z4YOrmUivZIMj24fo8ELPv89hxHf
	Biwmd5xzLMwW4t9mopGddztqe2KBwIJ0RoBYvWvCHl2uER30pNlq/UbGAyO+GDFZ
	2jPOrX2DPYBao1DdTvQKRnzu80FgbnIaVuAjpgTnrYONTCDqojJr6x9tL6cyMx0q
	tDdToQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fajte2abr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 10 Jul 2026 09:05:04 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e4f27f49bso64827485a.0
        for <linux-media@vger.kernel.org>; Fri, 10 Jul 2026 02:05:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783674303; x=1784279103; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rzlf2ZtK9nuTY0MJJWVDEnSEIyJ35HZ7vs1BndCygtQ=;
        b=EAvhJrjjsXHBC6EPTI5i6zBVqEJBBhpwryjf15H/5p0OlrR43fRa0nWR8EUd/lFcyb
         CTM8BjG09LUxLwIAtNC+2zGKmTZGEDx/HiZLP/4hk6+HshHJZxpgxXq6hS7X5vANN4D2
         ApfKcOKMWK8IstvLuo2oeXZLTiC6rRDGSV3gmFjDk9fsJ2l5dcw0+AMH03HRMKKi0pa+
         CiKDdAfPPw8piw7eF/62RvSv3KiGA5O+c4QcjbKWQdq+VZslJOlXSyTeQn0yFkb71oqt
         2xtem30VpxOriNXNsXNXOclJoeL1bch2PqaH25+fhKELDKgj3G/I9Ey0olRfA7UMFWQq
         waew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783674303; x=1784279103;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rzlf2ZtK9nuTY0MJJWVDEnSEIyJ35HZ7vs1BndCygtQ=;
        b=RSDq6GAaZroiRc80N42mxHG4BzMT1W4mBPTIP5OnZ+LFT3SShRrrUkAVzYp34ztyQr
         Qxnu2n1p5vb4TMLOKKnNC6nq9iZZv1zeBnYWuGTD5au8j6tbt7VwDNlMyGlMOAUTRmfe
         bLFcB5NSy2oOZ9usqATDGqnhAw/yIJXX/njYwl4XgNBjoK/KDstJPwT2zOf2xMLa3krq
         eFmE6Je+MT4VdCbOERe0rMWwB2chS5cO1hfZtNeHSpXobRsD89fn8Tp5ynHNVxdlQO9i
         MLyZLXOIVp+FO8eAKJ3dJlWsjGRDTpEexy7fLiyyTk9GYg4PdiVgkya3cMYZNDnrS0qa
         u4CQ==
X-Forwarded-Encrypted: i=1; AHgh+RoTwWcA8hlWnrPpn2EbKoqUiYdgqECZifooia56GlT1vzt0vSMpSeWsNNJilCeQT2SB5nf3F9VxKqll1g==@vger.kernel.org
X-Gm-Message-State: AOJu0YyTj3DUixqt5/Ss9gHTOPOuqQFTwD6w8lJD2K/uoIwnjdEB1auk
	iBfsIDkw6shKJ31CBe5jLvhUt+3MBffmtvH7JtdkzMJEF95xCaiVFJ/3tqePj1ZwkQgxjPpnNe7
	mqGfwEdEJgjcHR+JmfshARjZVhZiGLKf5Vw1SjPN8a1bs9upFfXFLE7wIVc87i44ysA==
X-Gm-Gg: AfdE7clROhlXMfPvZAgljXS0jLdFBI9OfSOM35WMUjFE/UivrgS0HMT+b57VU7rZ1vn
	2IzreBzWcaGQvIiP39lC2INZBnFWM2wrUWKjIej3wsv+saMuJtACXWQo56HhZEQhg+iCZ8gYBLf
	YVG1g9qVODa8iAL3+FXbZr3Jp/GjLmvEeTQmcbHHBkP3AoBoi9bs26fuQcoEF9XZ5JDC45nwtr1
	FX/Awt91Kps5cQk9HIg83+l5+NUDm4aJmTB6pKeeny29QAcuuR8nouXLLFaA5Ptm9id7ADtTGOp
	plrNz/dsNiePBM3TYws5dGAEzsHXmm/IIgGEyHrf37t4CSLKPIm3V6+W9IGRb5OR3TXVb11vO2k
	n2fY2B+w8/NO0/+sA98GB7/jFDUEbR6p3rSvjSscLPUXZ1SSMztCXuhGwzuEfVlRDtF9DAPjvly
	by0a5Jsh4fCRQ/dNciRw5asev7j3dNgdklQHLlZHAGB92Bm0ZFG+ULv9db4mtspQ==
X-Received: by 2002:a05:622a:1819:b0:51c:1a4c:3c91 with SMTP id d75a77b69052e-51c8b2adf76mr112432881cf.1.1783674303227;
        Fri, 10 Jul 2026 02:05:03 -0700 (PDT)
X-Received: by 2002:a05:622a:1819:b0:51c:1a4c:3c91 with SMTP id d75a77b69052e-51c8b2adf76mr112432391cf.1.1783674302574;
        Fri, 10 Jul 2026 02:05:02 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([82.64.236.198])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15dfda815dsm259932266b.36.2026.07.10.02.05.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 02:05:01 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 10 Jul 2026 11:04:51 +0200
Subject: [PATCH v4 5/7] media: uapi: Add CAMSS ISP configuration definition
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260710-camss-isp-ope-v4-5-51207a0319d8@oss.qualcomm.com>
References: <20260710-camss-isp-ope-v4-0-51207a0319d8@oss.qualcomm.com>
In-Reply-To: <20260710-camss-isp-ope-v4-0-51207a0319d8@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-hardening@vger.kernel.org,
        devicetree@vger.kernel.org
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: wJN3mHt0gw9YBnwQ5_LIrNeJbaa3wghN
X-Proofpoint-ORIG-GUID: wJN3mHt0gw9YBnwQ5_LIrNeJbaa3wghN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDA4OCBTYWx0ZWRfX6fRcBlsHYg/O
 mBu9hsl2oHsdUv+dDRoLL/m/VjuY55OdSTM3cMvjp+XzrZK1A+VhOcywIFsiDG0v04yi2jS0fkq
 Botsc5b1wWlO4VHb3CTebz/Dy97G6ytO6KBJGCtl7ISLG56wxdoFIUf8SwlWekiQUuHaP6ETSsG
 Z0Wv/ItEZf1bhH/VbjpgJuhq34m+XCCDWUZzb+KXMroWeRgMUIbMu/yUPC7HKzgKlAULPNdFbiN
 jxJHVCRQ/7LJ7mGJXtbvX/RXsR6YMWKtmzS+xXaaA25fyeTrliClD+ZhD0uwrwBhVRMD69vi8EG
 kpnWFk/8wWC5bUmaGRsG/47S+uNUcy1BB9rxDpQv4lYc64Gq9x0koIjuzmevZ7p1YbGHazX6VAP
 YritbfzBojaSI9GR4U1F4IYbweP6rXcQEY7lY90W2Tvpne+fDArcax1CfwtQnJzmmdL7MO+k5+I
 8YCmSx1aOqQa41zNNWw==
X-Authority-Analysis: v=2.4 cv=N7MZ0W9B c=1 sm=1 tr=0 ts=6a50b5c0 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=MDeckJw97qnk8wCBExTehA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=kFo2aqxNIXtk6PDOeyQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDA4OCBTYWx0ZWRfX2txi1ao+sRA6
 V8HI/gugjQVfsJPfBolvga004VcwagHnsRQESzrLGdckrsc99cfkStP5tBNCweb6BGcFLHetlmb
 cVEiQ16yW913jDZfdE5u8KcIzySxB6c=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_02,2026-07-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 impostorscore=0 suspectscore=0 adultscore=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607100088
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-67255-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:bryan.odonoghue@linaro.org,m:vladimir.zapolskiy@linaro.org,m:loic.poulain@oss.qualcomm.com,m:mchehab@kernel.org,m:kees@kernel.org,m:gustavoars@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-hardening@vger.kernel.org,m:devicetree@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[loic.poulain@oss.qualcomm.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 947DB7390AE

Add the uapi header camss-config.h defining the ISP parameter
structures used by the CAMSS Offline Processing Engine (OPE) driver.
This includes structures for white balance, chroma enhancement and
color correction configuration.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 include/uapi/linux/camss-config.h | 161 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 161 insertions(+)

diff --git a/include/uapi/linux/camss-config.h b/include/uapi/linux/camss-config.h
new file mode 100644
index 0000000000000000000000000000000000000000..d0d087eea08337fea14211d356195cacea2fb050
--- /dev/null
+++ b/include/uapi/linux/camss-config.h
@@ -0,0 +1,161 @@
+/* SPDX-License-Identifier: GPL-2.0-only WITH Linux-syscall-note */
+/*
+ * Qualcomm CAMSS ISP parameters UAPI
+ *
+ * Uses the generic V4L2 extensible ISP parameters buffer format defined in
+ * <uapi/linux/media/v4l2-isp.h>.
+ *
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef _UAPI_LINUX_CAMSS_CONFIG_H
+#define _UAPI_LINUX_CAMSS_CONFIG_H
+
+#include <linux/types.h>
+#include <linux/media/v4l2-isp.h>
+
+/**
+ * enum camss_params_block_type - CAMSS ISP parameter block identifiers
+ *
+ * Each value identifies one ISP processing block.  The value is placed in
+ * the @type field of &struct v4l2_isp_params_block_header.
+ */
+enum camss_params_block_type {
+	CAMSS_PARAMS_WB_GAIN = 1,
+	CAMSS_PARAMS_CHROMA_ENHAN = 2,
+	CAMSS_PARAMS_COLOR_CORRECT = 3,
+	CAMSS_PARAMS_MAX,
+};
+
+/**
+ * struct camss_params_wb_gain - White Balance gains
+ *
+ * Implements the CLC_WB pipeline module.  The pipeline applies three
+ * sequential operations per channel:
+ *   1. Subtract sub-offset (black-level substraction)
+ *   2. Multiply by gain    (colour balance)
+ *   3. Add add-offset      (output pedestal)
+ *
+ * Gains are 15uQ10 (15-bit unsigned, 10 fractional bits). Offsets
+ * are 16-bit unsigned, normalised to full input scale (65535 = 1.0)
+ *
+ * @header:   block header; @header.type = CAMSS_PARAMS_WB_GAIN
+ * @g_gain:   green channel gain (15uQ10, 1024 = 1.0)
+ * @b_gain:   blue  channel gain (15uQ10, 1024 = 1.0)
+ * @r_gain:   red   channel gain (15uQ10, 1024 = 1.0)
+ * @g_sub:    green sub-offset, subtracted before gain (16u)
+ * @b_sub:    blue  sub-offset, subtracted before gain (16u)
+ * @r_sub:    red   sub-offset, subtracted before gain (16u)
+ * @g_add:    green add-offset, added after gain (16u)
+ * @b_add:    blue  add-offset, added after gain (16u)
+ * @r_add:    red   add-offset, added after gain (16u)
+ */
+struct camss_params_wb_gain {
+	struct v4l2_isp_params_block_header header;
+	__u16 g_gain;
+	__u16 b_gain;
+	__u16 r_gain;
+	__u16 g_sub;
+	__u16 b_sub;
+	__u16 r_sub;
+	__u16 g_add;
+	__u16 b_add;
+	__u16 r_add;
+	__u16 _pad[3];
+} __attribute__((aligned(8)));
+
+/**
+ * struct camss_params_chroma_enhan - RGB to YUV colour transfer matrix
+ *
+ * Implements the CLC_CHROMA_ENHAN pipeline module. All coefficients are
+ * signed 12-bit fixed-point Q3.8 (range roughly -8.0 to +7.996).
+ *
+ * RGB2Y - Luma (Y) ceofficients
+ * Y = v0 * R + v1 * G + v2 * B
+ *
+ * @luma_v0:  R-to-Y coefficient (12sQ8)
+ * @luma_v1:  G-to-Y coefficient (12sQ8)
+ * @luma_v2:  B-to-Y coefficient (12sQ8)
+ * @luma_k:   Y output offset    (9s,  0 = no offset)
+ *
+ * RGB2Cb - Chroma (Cb) coefficients
+ * Cb = a x ((B - G) + b(R - G)) + KCb
+ * with:
+ *   a = ap, when (B-G) + b(R-G) > 0; a = am, when (B-G) + b(R-G) ≤ 0;
+ *   b = bp when (R-G) > 0; b = bm when (R-G) ≤ 0
+ *
+ * @coeff_ap: Cb positive coefficient (12sQ8)
+ * @coeff_am: Cb negative coefficient (12sQ8)
+ * @coeff_bp: Cb positive coefficient (12sQ8)
+ * @coeff_bm: Cb negative coefficient (12sQ8)
+ * @kcb:      Cb output offset        (11s)
+ *
+ * RGB2Cr - Chroma (Cr) coefficients:
+ * Cr = c x ((R - G) + d(B - G)) + KCr
+ * with:
+ *   c = cp, when (R-G) + d(B-G) > 0; c = cm, when (R-G) + d(B-G) ≤ 0
+ *   d = dp when (B-G) > 0; d = dm when (B-G) ≤ 0
+ *
+ * @coeff_cp: Cr positive coefficient (12sQ8)
+ * @coeff_cm: Cr negative coefficient (12sQ8)
+ * @coeff_dp: Cr positive coefficient (12sQ8)
+ * @coeff_dm: Cr negative coefficient (12sQ8)
+ * @kcr:      Cr output offset        (11s)
+ *
+ * @header: generic block header; @header.type = CAMSS_PARAMS_CHROMA_ENHAN
+ */
+struct camss_params_chroma_enhan {
+	struct v4l2_isp_params_block_header header;
+	__u16 luma_v0;
+	__u16 luma_v1;
+	__u16 luma_v2;
+	__u16 luma_k;
+	__u16 coeff_ap;
+	__u16 coeff_am;
+	__u16 coeff_bp;
+	__u16 coeff_bm;
+	__u16 coeff_cp;
+	__u16 coeff_cm;
+	__u16 coeff_dp;
+	__u16 coeff_dm;
+	__u16 kcb;
+	__u16 kcr;
+	__u16 _pad[2];
+} __attribute__((aligned(8)));
+
+/**
+ * struct camss_params_color_correct - colour correction matrix
+ *
+ * Implements the CLC_CC pipeline module.  The matrix computes:
+ *   Out_ch0 (G) = a0*G + b0*B + c0*R + k0
+ *   Out_ch1 (B) = a1*G + b1*B + c1*R + k1
+ *   Out_ch2 (R) = a2*G + b2*B + c2*R + k2
+ *
+ * @header:  block header; @header.type = CAMSS_PARAMS_COLOR_CORRECT
+ * @a:       G-input coefficients per output channel (12s;
+ *           a[0]=Out_G, a[1]=Out_B, a[2]=Out_R)
+ * @b:       B-input coefficients (12s)
+ * @c:       R-input coefficients (12s)
+ * @k:       per-output-channel offsets (typically 9s effective)
+ * @qfactor: Q-format selector (2u):
+ *           0 = 12sQ7  (range ~-256.0 .. +255.992)
+ *           1 = 12sQ8  (range ~-128.0 .. +127.996)
+ *           2 = 12sQ9  (range ~-64.0  .. +63.998)
+ *           3 = 12sQ10 (range ~-32.0  .. +31.999)
+ */
+struct camss_params_color_correct {
+	struct v4l2_isp_params_block_header header;
+	__u16 a[3];
+	__u16 b[3];
+	__u16 c[3];
+	__u16 k[3];
+	__u16 qfactor;
+	__u16 _pad[3];
+} __attribute__((aligned(8)));
+
+#define CAMSS_PARAMS_MAX_PAYLOAD		\
+	(sizeof(struct camss_params_wb_gain)	+\
+	 sizeof(struct camss_params_chroma_enhan)	+\
+	 sizeof(struct camss_params_color_correct))
+
+#endif /* _UAPI_LINUX_CAMSS_CONFIG_H */

-- 
2.34.1


