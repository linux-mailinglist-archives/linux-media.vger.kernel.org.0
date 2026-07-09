Return-Path: <linux-media+bounces-67172-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id K/zsJ6+mT2oDlwIAu9opvQ
	(envelope-from <linux-media+bounces-67172-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 09 Jul 2026 15:48:31 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C89A731C19
	for <lists+linux-media@lfdr.de>; Thu, 09 Jul 2026 15:48:31 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=HZLYIpnf;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=YriYE0SI;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67172-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-media+bounces-67172-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 07C153068C6E
	for <lists+linux-media@lfdr.de>; Thu,  9 Jul 2026 13:44:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2265346E72;
	Thu,  9 Jul 2026 13:42:29 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E849133F5A1
	for <linux-media@vger.kernel.org>; Thu,  9 Jul 2026 13:42:27 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783604549; cv=none; b=LnWHsWRa1Vx+b5ur0RWoqUvu/PT04HiHHMe8Yqg2j2jsfXo5u89gdIdUG1BLpZx9hCdJ1vl30WQWorewkKJ6CEz3zoTrs9PPyQxCRnuGxNSWjtNgrLbBpe5iydZNeNTN3+kGc/zdM31l64oRHbfVS8v3P4kHsfP6AMLoLHMnFbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783604549; c=relaxed/simple;
	bh=sUPB9VJRkRZ4see9KcmUKrC+0hNnHbRSIZoFexQREuo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Xuf/t0m57s2ndH0zzJsZMXvan2xrnjMcHBftIwOFcRMS+i8I4KYMKXPsIhHgIwvDEYN1BSrCXZgbrqo2VfpL211Ic/E2Hvxm3HI4G5og3N5oDXF0/K2YXGGZEmt2otY3HVWMEajFmySSOKz3dF+bcIpkc+fyY1n2fyLXCZNCzgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HZLYIpnf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YriYE0SI; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669BN56X1450398
	for <linux-media@vger.kernel.org>; Thu, 9 Jul 2026 13:42:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	U0gyuvkccvtpcfH79fJjPBeyRgK2qdZ/uoYlWvMd7TM=; b=HZLYIpnfESnQK3N/
	LgXYva4tv2++5bjrwdATe00vOwsQXT/98ekjMNWaLlHbfZSisGSAZg/o42ZkKy7S
	0JT5LVp2Bbzt+Xu5hgqrPAAgQxBeSORwcf2Oll5OYLIjogczIVkRJC64g2ypqp6b
	BnPo9y6bOt2D+FHX9Vn6yxPs0FF9STUox4dCUBjkPOijuiHnJ/rMyyojBi30TAkG
	dpO+12MCkLjHMFSyqH+/6QMcpA8HGMkRIyjogBou0feoD39vCwx3nLmdRoOBqzfP
	pq+ewYx4tL9I7HgsekBS8LVUmZ7zv826uP82v6dk6xO6zlopfmd2GS6WHzKGuSsI
	ariCuQ==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fa55vj7qu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 09 Jul 2026 13:42:27 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-9694e84752eso1635717241.0
        for <linux-media@vger.kernel.org>; Thu, 09 Jul 2026 06:42:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783604546; x=1784209346; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U0gyuvkccvtpcfH79fJjPBeyRgK2qdZ/uoYlWvMd7TM=;
        b=YriYE0SIC1q+75c8JNB9AaVb05xmC3kb1MW4pZbj/aJ+nyFfc1N3Ur2jPL6IsIf9FD
         RgRWPx0QwQ32uh75cl4JEb4glmAa0flcEtbvseidZMvHjtiSW8imqlhjnBDw4EfvXfNg
         /VINJceIYZKeZkTcD7ZyXhWhY/6JnDzNUKzS2Us5h0hQALpvOeqnjtnTFS3hXPJBIryF
         Ge15RUG9f5xzj98+o3HdOkyWqpRuwAg3JiKuqdHqeMkpV7BfXHKtBj1oPRv2j2abLq2F
         etrk/N2/Wrwm719jlI5a18tIrWm+x/SosHl3BHAW8lEvLXK6yT+68EsgUQX7sZ2g/UKI
         FT7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783604546; x=1784209346;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U0gyuvkccvtpcfH79fJjPBeyRgK2qdZ/uoYlWvMd7TM=;
        b=W0t1A834VsGBM6EYtfwpdxuVIwHWef2ZVSSiFtaaM9440LQzq0hxFzZqSCR9w2u3hT
         xQJH3ZGrpgnUxsKLzpsW4ao3RF1utEJNkdBo8CwZEXelCYJAZ63V/6OQ78snJZWXuk39
         7HApICyZNKHHzS7XEmyiybn+gT+HuB27t29KUufgh9Qarmv43o+0E3HQmiyKYAzFsPWq
         qLgvgFrIpsObR2/J55l03fcsl4/05bMYQfbzT3zIR3v2LqQImZh+JMwR/eKCjPv5YBVl
         /RhgyhBg6JDs7Nk8OBpykBMAlPZpVAybObGDrrzUr2DxtLd7pWboeVldH0QnCFK/6nUN
         ajKA==
X-Gm-Message-State: AOJu0YzjWV/GR46Wf/x1i8ESJRYCdybJiPnZHC/EDuitk2+pd6QnU4Sy
	0stUckscRQfZU2lcKRkj0jhDV8HmTBokX5E2Lvx8P167zhbFp8W22hzok+6UejPZQLG6U4I+TWb
	GIp8+2Duj+5KWzH/FJVp5S8bSjwCiOvUwB/YYQSBtx9YqRhlmvqG6XTLynuxHV8n+gbXUwxff6Q
	==
X-Gm-Gg: AfdE7ck6o9t39X0YsdepxAd12Dxjg5wAuYXPXlA+Zx7YLa5rcwgIohKihYmpIp/BTWf
	Xtrad/FQPC0DHKkdTan0jDLL5d/27uO0fLXxzeFvA2I/lgiXO8bu96TgwP6j0YZQtKdaZXXZLGL
	gcmsf2tRZq5LTY5YGgzV/RQkPUHrXiXL41IkQ/3M07MVGGauX6JLdspjb+bigot87TAWzhFfKMy
	jK4q+D4bFnCscYa75f99fTTrsXpagcBcAqhgwUEWZmV0cnsHm9vTFfay0H65lflBVUkNogS4zQ9
	S2NsXIA+zRWGCpwZSWctilm00jrYg7z8PTTLzvjWZPcH0ZUrjNmn7CChYX6LMJkL2JTBASEPvEo
	p9ze71UpaamokzFnTTA+kvYSy0lGLs4Z1bX5TONEznRHo1kZcSXVlchpgLVYchukYqOthYTXL/P
	4AjxkYM9Vq7GY9ZXWxeVWEr+Kc
X-Received: by 2002:a05:6102:6d6:b0:73d:cca0:a220 with SMTP id ada2fe7eead31-744e0091664mr4685329137.12.1783604545997;
        Thu, 09 Jul 2026 06:42:25 -0700 (PDT)
X-Received: by 2002:a05:6102:6d6:b0:73d:cca0:a220 with SMTP id ada2fe7eead31-744e0091664mr4685309137.12.1783604545522;
        Thu, 09 Jul 2026 06:42:25 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39c849186e1sm3345151fa.9.2026.07.09.06.42.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 06:42:23 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 09 Jul 2026 16:42:01 +0300
Subject: [PATCH v7 10/18] media: iris: skip PIPE if it is not supported by
 the platform
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260709-iris-ar50lt-v7-10-76af9dd4d1f6@oss.qualcomm.com>
References: <20260709-iris-ar50lt-v7-0-76af9dd4d1f6@oss.qualcomm.com>
In-Reply-To: <20260709-iris-ar50lt-v7-0-76af9dd4d1f6@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1159;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=sUPB9VJRkRZ4see9KcmUKrC+0hNnHbRSIZoFexQREuo=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqT6UlX/9RVSn3JDVBEyI8Qd/76045hV44oJk/7
 xJ4zKI3WYSJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCak+lJQAKCRCLPIo+Aiko
 1QtuCACSDz73theotU0s5d442S4yoLd4Qdst5ADMzPhvxkuJNshOgDJte4nD0bpQ73/VAGHFj00
 sanez87mSGnqz8AFTWd9jJvcr+xnCRejVXoN2Kn9MRUWFcGQpjh7dpfPS/tr6aC1/esbDEEwXXG
 nvOaMP4fgEMfZjQvwPaldcxjzD2n+vFQoINbgj6QoUoJlA12N5Zo7Ns7iR25wTpdyEusp0klsWw
 BH82tuBy+/hccgAq/Udg0gY/9OOO7nRlZypgbixB26FLgFrAAgHj2qfSbZ+G+l/LoRh4UKDBLVh
 GPjit74mpEMG+r3ajEOEzvpwFOa0YeSLHFIKAibgiBJZj7iX
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDEzNCBTYWx0ZWRfX21onKQc3kFeP
 wcSU/VzseSmXKPngN0SLyT+2uV4qvVI0F4ZNQ6SbQheCnAyeBW8FoxW4NCBnRnN2Kid5jSkNtY+
 lZjbvNM+q3svciUfabI+mcJIWQsUzHjQPGnxyALOSuhpGxqn3ImlKN0fm+gPfauZsWMGdKht9T3
 tLVgxME+d9v3KyeEOHQWl1pxgGIOFBI+dJdGtCVrXbO3oA5wIx+GgJRZ8YkP43Bz+TTPSPk4Nb8
 Ck9ExTiKwG7murDGvX5qnVwV4j4tSW2MJWbMOxQXPRB9YUR2aCdtzdKEa10n8Zy64EprvxhTYDt
 /8ckpSeRBVvP//7Ec6qe+vSulToyDf1NrIXY9WBbTJMiMsL/esOBmaltVhl3ZU+UZ3vtUNTteVn
 Vb54VagcWGnp7m1pHXnKlJcZuhal453UkWLKqPFGVTulgVFt8YsY49g1215q222bS/328x7Wikd
 /zIuY09dbkg9HifNp4w==
X-Authority-Analysis: v=2.4 cv=KfDidwYD c=1 sm=1 tr=0 ts=6a4fa543 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=9TuWGWrZIemhly9L:21 a=xqWC_Br6kY4A:10
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=DRvvl89rPFtLv9ObwM0A:9 a=QEXdDO2ut3YA:10
 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDEzNCBTYWx0ZWRfX+5Mk687tcHsW
 fFa1jXecfdBA2GkOv+Ymz7Hci5SWIZXbQ7KXuvasyG7ZbOeT9adpy3TurSeJ9d03CgX/51RS+Fw
 zMRSmGV1GUmLQLdzA1H5wrjWFQNw2D4=
X-Proofpoint-ORIG-GUID: dctQnpI9C2HAmv4tbYlkpmSTM4oqE1bW
X-Proofpoint-GUID: dctQnpI9C2HAmv4tbYlkpmSTM4oqE1bW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_02,2026-07-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0
 adultscore=0 clxscore=1015 priorityscore=1501 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090134
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-67172-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:vikash.garodia@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:mchehab@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:busanna.reddy@oss.qualcomm.com,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:dikshita.agarwal@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2C89A731C19

AR50Lt doesn't support HFI_PROPERTY_PARAM_WORK_ROUTE. Tables for AR50LT
won't have corresponding entry in the capability tables. Let
iris_set_pipe() silently skip propgramming the property if there is no
corresponding capability.

Reviewed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_ctrls.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.c b/drivers/media/platform/qcom/iris/iris_ctrls.c
index 10e33b8a73f6..33a34573391a 100644
--- a/drivers/media/platform/qcom/iris/iris_ctrls.c
+++ b/drivers/media/platform/qcom/iris/iris_ctrls.c
@@ -534,6 +534,9 @@ int iris_set_pipe(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
 	u32 work_route = inst->fw_caps[PIPE].value;
 	u32 hfi_id = inst->fw_caps[cap_id].hfi_id;
 
+	if (!hfi_id)
+		return 0;
+
 	return hfi_ops->session_set_property(inst, hfi_id,
 					     HFI_HOST_FLAGS_NONE,
 					     iris_get_port_info(inst, cap_id),

-- 
2.47.3


