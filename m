Return-Path: <linux-media+bounces-51473-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iLs2HIz/dWmMKQEAu9opvQ
	(envelope-from <linux-media+bounces-51473-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 25 Jan 2026 12:33:32 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B3E0780444
	for <lists+linux-media@lfdr.de>; Sun, 25 Jan 2026 12:33:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9273230465C8
	for <lists+linux-media@lfdr.de>; Sun, 25 Jan 2026 11:30:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CBFE31A049;
	Sun, 25 Jan 2026 11:30:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XaUMeMpR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Vb4baClw"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE7DE31A7E2
	for <linux-media@vger.kernel.org>; Sun, 25 Jan 2026 11:30:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769340627; cv=none; b=WyBhO9TQsBfnZ41QKSrM4oxY9vSlS0a71tQkW76o7vNEHn7ct1t2ocLXlghFlnfH8kXfIVe8A4Cm93XVSJNSwi4qkPXuPr1czqYWKc5g7lhmpPfZbtGtRepgudQqbVcJh25CWZGWWaS6G6xAj/pgS/SPR8/1Ui0ne+l7b/ESaY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769340627; c=relaxed/simple;
	bh=vCjp6Otef/xE5vbuvwNoduQVTq2eHsexFqb6kzgabfE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QJ0vPuK+BJZ4sDOcZit3D5yrhu3qovdd0cTKMXVQxnqsTZIxCrOYhlSdLX+Zsph5uTx2mmahnFbJhLKR843eT8HvsRiRMfDQ6+/kXwAV9+TeQzfbZRqkTO8pj73xO02FtmEBOdaHTkmcCCTU5qPZrtkEJm/11+ix724bjKn3W3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XaUMeMpR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Vb4baClw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60P3NT8I3147716
	for <linux-media@vger.kernel.org>; Sun, 25 Jan 2026 11:30:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JXzLPzKJmMMfBleWuh+IFIAqE4Ffe4ls9p1aUztqIUU=; b=XaUMeMpR90SZTHdW
	kiMEOE7kQ6uiI+6u9E/sOXjbeFSoV807stnOdr3EbZbr1sFWnPF3U/Zbh8xVwtLc
	iJgCkhH/9HoeGW/zncbR9HxX3An4EHOWgDNSe8mS5PXHkMQJVFKAUOpmOtdXblgZ
	5ymmMkiMsq3RtSH5JzVf1xuToVHThDqprVVVTrE7uij+Tbi5QTSk9vcTXaVqDlR9
	e8gSrKHXQl1ooYTEZh7GL6Y3zByf7N75ZAvmXByuuqNPTNenryAAG5FyWiuvp5i2
	Hw+/cx88GB+8eXTBOPbHIlTp/R+G84ftDWETgfW0e1s36G+nMwefozTsi2ZHVn1F
	fmdN1A==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bvq3ha237-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sun, 25 Jan 2026 11:30:22 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c52af6855fso452981585a.1
        for <linux-media@vger.kernel.org>; Sun, 25 Jan 2026 03:30:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769340622; x=1769945422; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JXzLPzKJmMMfBleWuh+IFIAqE4Ffe4ls9p1aUztqIUU=;
        b=Vb4baClwvmSd4hRTvRsUuEXvjT5/NdKNjeVzHDNkGeo3jO7YwYbIz+e5ItVJRybimS
         Cv4J/XeUum4ifUc+/GzB4Ns1/CsK3wXIcNsE3TF1MCm66B5N7esnUM4iu7JxZC8V+UdQ
         xmc+5kf9k+mBeXJp6yTibeMkzqtLnTUQqmKsVmP5NNE+OiOq7pe+ltenAnT+cTCR6MaR
         AdvBd+LNmzBS3t4Wb3UFvZ7etEE0xT8s1SABRK5KT8WxJ8+TwIOW9fVuFYrI2Oykx+oU
         FgSmSucSl0xxxxNs756O1Om2m7lvemKRkOSC/ikFF/DPwbVniuG3z8CeZKjpvybcqbb5
         RmQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769340622; x=1769945422;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JXzLPzKJmMMfBleWuh+IFIAqE4Ffe4ls9p1aUztqIUU=;
        b=H7PxcXHeeDQptMCK3gxHdH/LEXwNq+oNONRwPPRozT8WQz0um1Z4WEjIdzH8PSaAWh
         jdRCsdGbLzWwaeDDjrQZ2ZzQV32T31xQ6OSAmRrXBLWMsjjIvNm2P5+dAKg+pqG3x9vk
         q0uEmars+qIvqNA6g9JSi97LjaL6ziXBiNM0QjhGrORPGP/SKyqA4jEtYAMbOIHglEya
         lCsXJaT5L7hk85st87ZBAS3njtTmikCU0YcqFo8nE/QgyapHA8Kn5+YZIOdgmhUbAo6L
         RYWtsg6sPx0Khxth13Y5TNgzMmbUAUP/5Q7rKTpH3V7kVvacOr+38d6xsEsWYu+mh23+
         naPQ==
X-Forwarded-Encrypted: i=1; AJvYcCWTS6eWSYFIcJACPOHxk6zOyJ43HwHpaW6dXwHxrLzK4RnSH4lcsEr2yZFf987ewjLnV3mzbsk7eQ/ZbQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzdwzOqjj6UVD9ZZyB16FwKl6L107D/05ooBCjuPW4DWeNQhOkk
	gFZnnd5nbnA5T44UH6/KzH+la9TVE9m7uH34g9GmBCFw4gQ2vbK9ytEgfOZp7WOZzUBMTYDZ1tL
	D7By1WxaDil3B7Tof6mqvjxZhB6AUI4Y0nWbPVsi58DtqAZPODGs8QdoXEQS0cGHLxQ==
X-Gm-Gg: AZuq6aIBGN5hWBHgRaNlfADDFi/0qq28899sMZ4yO5m1sQcdBSGqOzFQ2SFotTIwFai
	X/kIFPc7gjrOTb6iqKpCP4C1WZPCfjkNgC2B0Gzd+o7lMad6lHToS21AKzmtq8EAkDuVvfXGGyL
	tk9E+1k/CFd+Hou78rtoTPo1HLmq4IL9vQy+R2LiU+cXPudFR6G8q9i8hICpQH/X9X3SJ5WOW/g
	1qCkHM4kjqok+IHYw5HvWMTeFLw/B2mDNaxbcbAlpG80m71sBPKb3rR9UXtJG3LczbO8/fWKgfV
	PInyPi4Lmf2sO2lxpDiKTXhe/fjnmmInSlwjKz3Q62q5SoHYO+3ATdZAOJxXWEoKN8XuV8KiWCj
	67NHH6sOhEu7Csil5Fbys7JxLWGSkBupZxpWiMWg8lVMiW81jmcM7yWjLuuUcGqdDxGFXF6e86W
	/7QRcccJXRbT0SS8JgV923pxQ=
X-Received: by 2002:a05:620a:469e:b0:8c6:db7f:d4f8 with SMTP id af79cd13be357-8c6f9565e95mr156280385a.18.1769340622150;
        Sun, 25 Jan 2026 03:30:22 -0800 (PST)
X-Received: by 2002:a05:620a:469e:b0:8c6:db7f:d4f8 with SMTP id af79cd13be357-8c6f9565e95mr156276685a.18.1769340621720;
        Sun, 25 Jan 2026 03:30:21 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-385d9fec3c9sm18583451fa.15.2026.01.25.03.30.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Jan 2026 03:30:21 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 25 Jan 2026 13:30:06 +0200
Subject: [PATCH v4 4/9] media: iris: don't specify min_acc_length in the
 source code
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260125-iris-ubwc-v4-4-1ff30644ac81@oss.qualcomm.com>
References: <20260125-iris-ubwc-v4-0-1ff30644ac81@oss.qualcomm.com>
In-Reply-To: <20260125-iris-ubwc-v4-0-1ff30644ac81@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-media@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Wangao Wang <wangao.wang@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3117;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=vCjp6Otef/xE5vbuvwNoduQVTq2eHsexFqb6kzgabfE=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpdf6/dUSxAP7UblvRb8kGWVJzqs8Ocmet1os/n
 4l7WYzjvrGJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaXX+vwAKCRCLPIo+Aiko
 1UQhB/0SdagutS0t8C4HAwNbbEbmfVRmSBvi7KeOdANOhfifoGEYcJhf0NCoVJ0o7Zpq+QCcfwT
 RqNqFHyNatMyikz7X+AbeH2PZWC1mcQ+zDMrH+4kiEpcERHEsIhWkay2vihuYye4hjmEL1Y9Jbi
 +hC7FB1FwdAa5RltdrpCu4e0fMQf3sQOoy9iuXRqZbvc6umprPFNCFRHSuc3vz/j7w/EZ7O1xcj
 lZY6Sh8U9Ppuq2w81+JiuLNPCFuBtAh/ot1/wzFQ2yuf8wCs5KbVr0Wo2C4WlUhY82NItnRROky
 uKYbzA46dT4TKAb0Xs5vhyK8a0EaoTDkyWl+EMjZjjEPuL02
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI1MDA5NSBTYWx0ZWRfX08ulOYKETFEn
 b0pq0E1N37agn5NTUjCBGFijxk6tNI7VrKVLYA9ywKIj012dHkBbDcBhbM//BIEp0UAMjcQHcA3
 2CRttCZFUbHhUTddOJxqhGtvcgOriJ2AkSv38tt7m0QYlOAusd5TMa8eFzTwLOvop4x55sNzAe8
 oTb4jJ6DUk9i814bm+MDslUaY4FlJIyAmocTbAdhKmd0qkYCQPXl2Qew7ISTJibTyRWDamZuPxc
 3J3pgtfsPA7pbXhHUWNMzqFlpK6hRLcj0bXRavWMjrl9KHqjK/v9NJSjTrGLd49rt2jevocwZxQ
 rO+EXBwrpOVbbu3Z5wdlt9Fjw7iC5SrP55Cx4DHIbstqUvV+UYy7nPaxrK/cgjlNHKvpQyTfwvR
 8qYSme9VqaSOcVH6qtDuoAYsWhynvboo+Px0l9PeA6MrsGew8F87UeOopA3Q7wGSau9si6iH7Kf
 9BO4E56sAvW0D0N2rSg==
X-Proofpoint-ORIG-GUID: UlEzm9ZK247qs3aTzlfhs8NktRhrlVrr
X-Proofpoint-GUID: UlEzm9ZK247qs3aTzlfhs8NktRhrlVrr
X-Authority-Analysis: v=2.4 cv=c/imgB9l c=1 sm=1 tr=0 ts=6975fece cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=qS6nuPEoivtXufaKKhMA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-25_02,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 suspectscore=0 priorityscore=1501 clxscore=1015 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601250095
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	TAGGED_FROM(0.00)[bounces-51473-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,oss.qualcomm.com,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,linaro.org:email,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B3E0780444
X-Rspamd-Action: no action

The min_acc length can be calculated from the platform UBWC
configuration. Use the freshly introduced helper and calculate min_acc
length based on the platform UBWC configuration instead of specifying it
directly in the source.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Tested-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c | 6 +++++-
 drivers/media/platform/qcom/iris/iris_platform_common.h | 1 -
 drivers/media/platform/qcom/iris/iris_platform_gen2.c   | 1 -
 3 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
index d77fa29f44fc..aa4520b27739 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
@@ -3,6 +3,9 @@
  * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
  */
 
+#include <linux/printk.h>
+#include <linux/soc/qcom/ubwc.h>
+
 #include "iris_hfi_common.h"
 #include "iris_hfi_gen2.h"
 #include "iris_hfi_gen2_packet.h"
@@ -120,6 +123,7 @@ static void iris_hfi_gen2_create_packet(struct iris_hfi_header *hdr, u32 pkt_typ
 
 void iris_hfi_gen2_packet_sys_init(struct iris_core *core, struct iris_hfi_header *hdr)
 {
+	const struct qcom_ubwc_cfg_data *ubwc = core->ubwc_cfg;
 	u32 payload = 0;
 
 	iris_hfi_gen2_create_header(hdr, 0, core->header_id++);
@@ -146,7 +150,7 @@ void iris_hfi_gen2_packet_sys_init(struct iris_core *core, struct iris_hfi_heade
 				    &payload,
 				    sizeof(u32));
 
-	payload = core->iris_platform_data->ubwc_config->mal_length;
+	payload = qcom_ubwc_min_acc_length_64b(ubwc) ? 64 : 32;
 	iris_hfi_gen2_create_packet(hdr,
 				    HFI_PROP_UBWC_MAL_LENGTH,
 				    HFI_HOST_FLAGS_NONE,
diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index 5a489917580e..08a9529e599b 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -77,7 +77,6 @@ struct tz_cp_config {
 
 struct ubwc_config_data {
 	u32	max_channels;
-	u32	mal_length;
 	u32	highest_bank_bit;
 	u32	bank_swzl_level;
 	u32	bank_swz2_level;
diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
index 5da90d47f9c6..01c6ffa7e084 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
@@ -792,7 +792,6 @@ static const char * const sm8550_opp_clk_table[] = {
 
 static struct ubwc_config_data ubwc_config_sm8550 = {
 	.max_channels = 8,
-	.mal_length = 32,
 	.highest_bank_bit = 16,
 	.bank_swzl_level = 0,
 	.bank_swz2_level = 1,

-- 
2.47.3


