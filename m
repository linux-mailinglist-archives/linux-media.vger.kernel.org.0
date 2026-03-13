Return-Path: <linux-media+bounces-55640-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kN7zJPPjs2ktcQAAu9opvQ
	(envelope-from <linux-media+bounces-55640-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 11:16:19 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 3159E281497
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 11:16:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3E11430CF226
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 10:13:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6075938D00F;
	Fri, 13 Mar 2026 10:13:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TGwyE0rc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CTx9hGE1"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74AF338CFE7
	for <linux-media@vger.kernel.org>; Fri, 13 Mar 2026 10:13:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773396799; cv=none; b=nSz1NY6taMsXvbLWF62OPx3JzVEMve0gH28bjarsrhWlPZmRTDJ8kzDosoaiw+xv1jmybhp0rNZcDnR6k0vQi+/GvN8amYfnncZR/uAEwExxgC+7QKzeXOnzJoc9UZvaTtZZF08R5uXDARN5UvlpFCGv6SUwrD9yjU8nInhZzd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773396799; c=relaxed/simple;
	bh=K5GvC1+wvz9BYR8rEiEtRZoiLvCVUI9tXfFyBcUASiQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QZk/4V+swgPT8cVW4mVapjIIy5GO8Q4Nm9q5BO/B5MIg9sVro0BBxxvr+YsyaqXGeoY2KQW9ndg/KndhBd3cqvdT5QZfhDLcsT6SdY8aM1RrCqatA57hNXb2wbYgOG8Fna7aDKaS3qHT5wEfdkpk61dnLchFmzfHGVdIjHqMtyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TGwyE0rc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CTx9hGE1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62D7iLv52262549
	for <linux-media@vger.kernel.org>; Fri, 13 Mar 2026 10:13:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Y4xes2K8HcDX8bDIghpemOVi10XzD0xj930L0wB/O1E=; b=TGwyE0rc7qxEsy7Z
	QggV1vMcgWJ5wuJY+YL6/RificLBavtq/VLG8+1nDpf/H/XktiCKio914CwCIJ9T
	gYXZzkTh81zw9VegGHxtt5SG7u6wGYhPqXIU9zd2BI8+KdjDxkMnboFyKsR2DC4N
	26PFg5fmYMjvsEVkHjX6cT99la4ZBf3YfpT5zRuNuE3sWhvj354srEFIe4syvZyA
	i6RkpTu5M8YxL6kA/kjb2LFJ+rlAyCygFC6rbfeEfCG1UOjdweCnO54kM1NjYI4U
	kr1gvFbGEvbveyhB5zIYwzAJyzsbRfexSBhCx36iE42GVD81cEkkcF+Jb14MuFit
	EKXk0g==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cvef4rhp9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 13 Mar 2026 10:13:17 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50920055f0aso145687141cf.1
        for <linux-media@vger.kernel.org>; Fri, 13 Mar 2026 03:13:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773396797; x=1774001597; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y4xes2K8HcDX8bDIghpemOVi10XzD0xj930L0wB/O1E=;
        b=CTx9hGE1qTgF0VjBdhYoDl0sO/Qa95f7dEpiIX9c2ZooesxxDglwVvyQeukYv+YvKY
         rtC+2KosGytgxK+V+R7d9RAzP4ct2bSFUZ+tC4kzAiRORW/AqMU5g5Cxi5FdfCj2EAvY
         uj1IfxVBKVsIaCQFxwHbqKwC7MeVglAXy2d4/ddFnTq14hbFGHJoGvVNnswy/oDTk9WG
         2ihLU/5jFaZFd2rHlMzTRr/t2avEF4VnK+lXupZRixJn4Wu/xMXcMTkN6KgfnYsFB+ag
         m7br2wAB1ZBPxRY4Wr612oAquUthV0Ks2+HKCn79FXXRvbX4Ik+82mgHxtO01NR7/UQO
         s7Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773396797; x=1774001597;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Y4xes2K8HcDX8bDIghpemOVi10XzD0xj930L0wB/O1E=;
        b=WaFTwW8oBHYzcQ7zL5Vo4+SjrEEUnLLA6MPNKeRnvvzC1v/2sADSBlSE5Zo1qEuu4u
         JLUbezaKOWKZaEhGlvyo/+AS3CWz4xV2GHnENh2CYCWwc4cSqIjZVisE1KQV8LrjoeRW
         uqHTnjXN1RGX2Wcr9sh6MAKJzGHVOnS4Py/wZazS0KkgPJlTtKLGqfV6Gn//Z6PXPi8y
         8r1uCAQfK/gaqW1TQc+dfkn0NI8cvA0UwyUqgx70XGkxK12K7wjkGzOpVLsIz2nDHqW7
         stfe1dkgGcpOQARIEBZi7jS7etrjWDroqC6kxlSTw6WKVj5jhxttyH0Jry7w28NZQwfe
         GV8g==
X-Gm-Message-State: AOJu0YwjYQiev8l/dHH0YyMxnu2MfWBHTNTJg6cdsQ6ilqJzrYgsB+d4
	No8wvbR5OkpoYvPEMAEQRGNABTTzI2UmQybVnNJ09K7TQn3NgGJp1AQ0LoM1RFe97kHP6MapO2+
	mOXSbfp9f7Rg6aAhMDlhnOoW1dkOLooQjViDSyPwBGIbOyJGoAqmLFbv2l7T3jNYvDQ==
X-Gm-Gg: ATEYQzy2nFMJzp/tlHVHRjQBAyW7/7r23OJa3vW7x8J5zGStjhlRxuvBlFdn2Rmnbm6
	IcGQihV2c6ohMY09ZjgpU+Q5+2haiE/VtzPI/wMQvVbI9z2GRuSwXe3aki6QFusNwpfosp19ZxX
	0gBcXH+0LMBhX1HnAowL/UO7FbG+f3c/jvYkVTtAEfH/0b1Linl29vpbGBsB8Phln9J7Rg2dWIq
	YCHzjQRnyjOstglcF6JrnxzPUCjkWAYM8I0seu95NNYzwSxZ0rvKE8XR40BLzz0xapq2EuWgjTp
	2tMZqFDrehhFsxVwx+Nt4hsKWWKYSzDKzyQKvsH0gPPGY/1vJF6bcO/f/Wc/dEhNmDAaaFtzk7+
	0Nul4x5vvsGDQd15/8HYkTCym1fFW04VWs9N+7fvBC32+XE0A7AOrvDtDSa/0alvdYwtM/b68ZA
	CIAd+D+/epg0Qs
X-Received: by 2002:ac8:57c5:0:b0:509:35d1:ca37 with SMTP id d75a77b69052e-50957cb7808mr32951651cf.16.1773396796829;
        Fri, 13 Mar 2026 03:13:16 -0700 (PDT)
X-Received: by 2002:ac8:57c5:0:b0:509:35d1:ca37 with SMTP id d75a77b69052e-50957cb7808mr32951261cf.16.1773396796386;
        Fri, 13 Mar 2026 03:13:16 -0700 (PDT)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89a65bd5274sm53628846d6.3.2026.03.13.03.13.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 03:13:16 -0700 (PDT)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Date: Fri, 13 Mar 2026 18:13:02 +0800
Subject: [PATCH v2 1/3] media: qcom: camss: Fix csid IRQ offset for sa8775p
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260313-vfelite_fix-v2-1-7014429c8345@oss.qualcomm.com>
References: <20260313-vfelite_fix-v2-0-7014429c8345@oss.qualcomm.com>
In-Reply-To: <20260313-vfelite_fix-v2-0-7014429c8345@oss.qualcomm.com>
To: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        Vikram Sharma <quic_vikramsa@quicinc.com>,
        Suresh Vankadara <quic_svankada@quicinc.com>,
        Wenmeng Liu <quic_wenmliu@quicinc.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773396787; l=1305;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=K5GvC1+wvz9BYR8rEiEtRZoiLvCVUI9tXfFyBcUASiQ=;
 b=CGptbu+jo4/NdngL/xz9C6XxxD+8awu/1xaw9h51x0oxYBRChrgZea5ij15lS3pD7CMPzo+6T
 snO4xdxxhj3AMu9fyXDOLJ/tUqC7efYKQJx6LvJgtLz2t4RH8IXhNLC
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Proofpoint-ORIG-GUID: f_Lrfroi__I2PmgE8yqYi5LpS_nwdv66
X-Proofpoint-GUID: f_Lrfroi__I2PmgE8yqYi5LpS_nwdv66
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDA3NiBTYWx0ZWRfX1ql0he7c24V9
 dVb46njGciit1xYnIUtb3FhEjjdFOcT3Ty+FqYLxXcWtnF2aqdia9ZP2bEUDk4k7GOPP9o/sNJW
 WQ/CrA+Gi8V7aQYcXpJvzNwpiD+4xjGoZUm9zKi9UAIQ8/dBf5HUHJlH7GPS7GejGjLXmqpHQhA
 7SsHUbem26GV0DLMvTt7JPXj1zSGQDvbyLvutNru2986Zqkc3l1VPTVQVfN/OumfsbkJC8viNmD
 VzEZRfQbn66yzt7eJJ9cBGfviM8AleYQKLjeAtLW1E93dvE55skO3oKDydZIVBx0HiejUL0/QzT
 MY064cBvgGl/015TD9sK82wTX5X7ndoupnc2scA7DQ+cx+45hQDlEqadPUiUZQPxRSNlnvNhIE3
 jNcgZ0T7fczCdWRY3j7+0PyGbNg7nnUK5m9XOCZvvDO2LUO1+W61UUodXG/fCMJGEJH/X7Vo0ps
 2xlWYeT5CI0i0e6NE6g==
X-Authority-Analysis: v=2.4 cv=S9nUAYsP c=1 sm=1 tr=0 ts=69b3e33d cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=4sclNeChft9oZP3SpF4A:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_02,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 malwarescore=0 priorityscore=1501 suspectscore=0
 clxscore=1015 lowpriorityscore=0 phishscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130076
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-55640-lists,linux-media=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,linaro.org,quicinc.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wenmeng.liu@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 3159E281497
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Fix BUF_DONE_IRQ_STATUS_RDI_OFFSET calculation for csid lite on
sa8775p platform. The offset should be 0 for csid lite on sa8775p,

Fixes: ed03e99de0fa ("media: qcom: camss: Add support for CSID 690")
Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss-csid-gen3.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csid-gen3.c b/drivers/media/platform/qcom/camss/camss-csid-gen3.c
index 664245cf6eb0cac662b02f8b920cd1c72db0aeb2..bd059243790edeb045080905eb76fef3b12caae1 100644
--- a/drivers/media/platform/qcom/camss/camss-csid-gen3.c
+++ b/drivers/media/platform/qcom/camss/camss-csid-gen3.c
@@ -48,9 +48,9 @@
 #define IS_CSID_690(csid)	((csid->camss->res->version == CAMSS_8775P) \
 				 || (csid->camss->res->version == CAMSS_8300))
 #define CSID_BUF_DONE_IRQ_STATUS	0x8C
-#define BUF_DONE_IRQ_STATUS_RDI_OFFSET  (csid_is_lite(csid) ?\
-						1 : (IS_CSID_690(csid) ?\
-						13 : 14))
+#define BUF_DONE_IRQ_STATUS_RDI_OFFSET  (csid_is_lite(csid) ? \
+						((IS_CSID_690(csid) ? 0 : 1)) : \
+						((IS_CSID_690(csid) ? 13 : 14)))
 #define CSID_BUF_DONE_IRQ_MASK		0x90
 #define CSID_BUF_DONE_IRQ_CLEAR		0x94
 #define CSID_BUF_DONE_IRQ_SET		0x98

-- 
2.34.1


