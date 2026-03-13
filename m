Return-Path: <linux-media+bounces-55591-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qKNlF27Cs2mEagAAu9opvQ
	(envelope-from <linux-media+bounces-55591-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 08:53:18 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C7E7F27F025
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 08:53:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EEC82306B7B6
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 07:52:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7999D36E48F;
	Fri, 13 Mar 2026 07:52:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AiCj/xsy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UEjbpVtm"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB23836E491
	for <linux-media@vger.kernel.org>; Fri, 13 Mar 2026 07:52:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773388369; cv=none; b=ITDbXkQ+aiWCgHnFjawF9kRAs29OP1fsHGczdGqc+czWoWCwfKkY/U8VAg+V4D3RMifoJ+YPFAjSdCkJD03GEfiI4+7NAVKviRDcQ8qtrnX1xEZCSAVXfjl4sOSSF6hMt7dd+QwVxBj+BYr0EQXZXJT1rJSKca+Any5y5I+hGWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773388369; c=relaxed/simple;
	bh=aTF0YnIeFbu4knylfO+sYRRi3bmAVW0OrgW38xoR+cU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=q7KrGGaZ9ZMxZF8MhGtBObebwZksyC1PFMrvadAyvJVy+34Siu8XeFv3XpXvX//lQXiz+R7fzEer/LTjZHE+T9JBa0PcO9X/S0A++RuzcAVsvTBbyxwr7Nh01TGtf6XWwMI8E8TBtxKzsuRRoGF2Y8QM9qvwLDIyUnGL70tAwEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AiCj/xsy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UEjbpVtm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62D5tp0Q1015142
	for <linux-media@vger.kernel.org>; Fri, 13 Mar 2026 07:52:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qh4dQvpDzLBQ9gAVo0QUWBrIj5M8q/M3N7KOvc0zWQo=; b=AiCj/xsyESYnCjRx
	SM0KuH6UGWGfMhEoGvtVKZsGiBd0+cmUzo7EDvO6ya6A7vw9agiGRIXqRHN5/qnm
	igHHuaLtW81EhXAlOtJJUBdaHUSFYasSIqNbQ6R1clpHrU973UG4pu5ZozJa7vCO
	dKFZU2Nr40JkTxkVEPmALuT4/BnufCXGALz7nb3ylxPssFcEVSQMcSozvcetPfpa
	xflbasmgYzzR5+StybT+q8QZhXXzTYrrl54/EMpyRx0Z7/aBOx2T5lZAdhae2hxR
	FRORLWe46QAd4BMgeAtnl7FRnas6NTe9UQZOeVzfXtJU4Yz3A/P+Y7o7u39kL7c7
	NMLlgA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cumvdmeyr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 13 Mar 2026 07:52:46 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cd773dd409so293396985a.1
        for <linux-media@vger.kernel.org>; Fri, 13 Mar 2026 00:52:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773388366; x=1773993166; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qh4dQvpDzLBQ9gAVo0QUWBrIj5M8q/M3N7KOvc0zWQo=;
        b=UEjbpVtm3ZpURFuMYfe6b6rd+8bpYBzVfV5MCsvY6m/PM1b+tffacgpeQPKQ0kdWis
         MMRX8jkNYg8G6VHqFzTsyDekYs6TvocpucTUmtOCNjQz9JT8LigiFgre/EMlOf2XrVRS
         X35XQln1SEqzEWdON/nzgP40TTgVP5F87DWl6/O/Z8Wtqe1MhANKjUkX5ddY2jAfcvhA
         /W8/2GeDgw+GFvyaun4hIkVMrvNgbgkz+MrcktoZDgs+O9/ZF0jtE14qnyAIVeuXoo1+
         cIf/qjOPBnkFZq5AmR3x8GGTe65HTt9gV90BRvJdQkyPMzgAwUkzsax/rdpGB90aPOFD
         ORlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773388366; x=1773993166;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qh4dQvpDzLBQ9gAVo0QUWBrIj5M8q/M3N7KOvc0zWQo=;
        b=TafvQaB2Tol7xvbbx9x/7ZvAdt6JM6tiufjON8muILctYfawgRLUvmQSCUkVVRbMt/
         3iINFug+4U7moh3n0+mRQKninqIg1Xx/RFALJ0oD5z7maITW1IF4VPkqXq5E3j+rY02U
         4QrQPvOCRpZmvWonmITBkFiBESiRUP2HIuD8Dt+BxoqQxp0DohkOlc+w0JeOhUiS0E44
         NXH2q9Jpkz9XKUiAimrCufDjcskIeMrB7fsSR87h2fcHjh2MqMrVGA3ooD6E7Io4Npqi
         LNP/CKq7Hl2F5RZUMuyjdbjBodoCZtdHnoAY4rRJyPgUUDRDGJ93whzSEI/V1v+Cglb3
         zQgg==
X-Gm-Message-State: AOJu0YwKWq/bNFmlgrIUw8i+nZD2AM4lndJ2Y3vta1H+bx4Ial80623c
	7kQyfucLAK0FNkCNWI4YkJsJ0HVdiGvrvkO1MviV5cSsYk3UPd+WloYdA8bOzLBhoo2yS/VJRVE
	bfZtNlZo+5d+VLN6/MhexyGlskm6s6ZijcZAtgbwT14zHGUxcE2AwbDtcfS85Inl+/X+gxQzS7Q
	==
X-Gm-Gg: ATEYQzxoeDvqhhDP0TRJaQF61CjwSr2dRcRrLHSnLu0wF7Kg+LDK7X3LyMjXutxLdsO
	pfrPP5etQKxrr+dGcqOBn7Nadl8v0uaLsUBN2Dw0gWpB5gwntaE79Zjd1taC7T5tKGwFlt8Zt9v
	jXgi2OZPnCvVvGJP1LLvzTkK53uJm1dhDwJxHVm/2TORlHX+4n5ovXY3rW7DfhKr+/5kcjw4f/J
	rKBao39vUfF0Zs2ExO6eRsl6IblGxUCzCjIrWYHbus0dpxcPG6k419wZtrZFCwAQSlRsbi16mrk
	wQsO9m1oUGOl6ie0HABB0THGqNtkcMrthTZzuJd03Zz2Nc0LbBQFad2CuLzGBcnP0rDE9+F55OL
	WrNyeMKW1JlP5KuieJ5NQ8RYvgXWam66WvOhABZIt0eab05evoB2G61g4qTPqkNfUGBVlnztiR5
	7FnycufS0e8V7SHTPwIP1DT1G8dr7Q4AlIJuo=
X-Received: by 2002:a05:620a:46ac:b0:8cd:95b4:c525 with SMTP id af79cd13be357-8cdb5b05a60mr332313685a.39.1773388365933;
        Fri, 13 Mar 2026 00:52:45 -0700 (PDT)
X-Received: by 2002:a05:620a:46ac:b0:8cd:95b4:c525 with SMTP id af79cd13be357-8cdb5b05a60mr332311485a.39.1773388365333;
        Fri, 13 Mar 2026 00:52:45 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a1563775a2sm1347475e87.89.2026.03.13.00.52.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 00:52:44 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 13 Mar 2026 09:52:37 +0200
Subject: [PATCH v5 5/8] media: qcom: iris: merge hfi_response_ops and
 hfi_command_ops
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260313-iris-platform-data-v5-5-180484af4490@oss.qualcomm.com>
References: <20260313-iris-platform-data-v5-0-180484af4490@oss.qualcomm.com>
In-Reply-To: <20260313-iris-platform-data-v5-0-180484af4490@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=15734;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=aTF0YnIeFbu4knylfO+sYRRi3bmAVW0OrgW38xoR+cU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBps8JDj7VXrQIjhYORIn8p1NDQdlvqUs+bcde2l
 6H16R3vIbWJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCabPCQwAKCRCLPIo+Aiko
 1YMiB/4vUJ3PAj6Uch6qcdcnebK2ki+8ij7kjurnlaPwjJDedIk5oe6nt9k+r78pYv8rHU3TnI5
 il/KfS97dFpmi9uHNm5MgUaVv4QZZ2wmFjuawN7fUwgg4K/Vt2l3gZDiTg5w/0hJJueDVf9vpBP
 FeJoX29SJC42gjSFJLhABhlx837ERtaS34/QDQ4JFoRuB2qBHbcK2j/gNwtebgPz/Bi4I0sETY2
 TRQUfQ3sRpeHJceEsrJFLeAmlwMAzBAuYUOIA+qSJiAlKv254RUGJaFLa34Y/7+Qbrn/sYfMISt
 e5rxqgSzfEg3hzWGwSSkt9dbeJ8icB6y+cCki4e+9zryqzDu
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDA2MSBTYWx0ZWRfX3jAirts3Kr1t
 1KRdxdEIFKDdVyOf6rxhePaEcYEb56rGhbUFxUOulMSVBSDQOq6y7DiPRz3GDM1G02mtzP1ocKw
 AjFyXsqNrG4XSHIo+GbeCTd48DuOhBXIOPS7/RkraWYhazkJCIBm4/Ixg4QZAG45Mf0VuZBEDjB
 WMMrC4TXefPTqdDgXWc4V3KDr1Bd5PTdhEtewnRnXdMcsIQ6sE4EPWpcWJTm3WuzcEqmveDmnNi
 JEqxKCzimGtRdSvuY5sNAOkXcdh4sz3NIVEQFBTYv4APy5ZolkhqVZLfq33nSdLcpkYLzmpsKMt
 tJK6tT2M2z+a3b+q126psWFbuZ+pH58B0NLtmY/JM1PelJaHowfO+qH9fg7skzTW74Hti4cILnE
 TGhptD5ixAUjN1Nnu6wpmSzhZV/tQ+YUcT14N4S4rIUMWx7NOPqYakAqYG2c2Svc50RR5MA+H17
 TSMKpq9LiB0z7oC+e1w==
X-Proofpoint-GUID: YCoGyYZRl_9VNAy4HL1z5La1dhC2Wacm
X-Proofpoint-ORIG-GUID: YCoGyYZRl_9VNAy4HL1z5La1dhC2Wacm
X-Authority-Analysis: v=2.4 cv=XsT3+FF9 c=1 sm=1 tr=0 ts=69b3c24e cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=6t3FZmZJ4ffncKB-xNAA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_01,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 bulkscore=0 clxscore=1015 adultscore=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603130061
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-55591-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C7E7F27F025
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

There is little point in having two different structures for HFI-related
core ops. Merge both of them into the new iris_hfi_ops structure.

Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_core.h              |  6 ++----
 drivers/media/platform/qcom/iris/iris_hfi_common.c        |  6 +++---
 drivers/media/platform/qcom/iris/iris_hfi_common.h        |  8 +++-----
 drivers/media/platform/qcom/iris/iris_hfi_gen1.h          |  4 ++--
 drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c  |  8 +++++---
 drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c | 11 +----------
 drivers/media/platform/qcom/iris/iris_hfi_gen2.h          |  4 ++--
 drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c  |  8 +++++---
 drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c | 11 +----------
 drivers/media/platform/qcom/iris/iris_platform_common.h   |  3 +--
 drivers/media/platform/qcom/iris/iris_platform_gen1.c     |  6 ++----
 drivers/media/platform/qcom/iris/iris_platform_gen2.c     | 12 ++++--------
 drivers/media/platform/qcom/iris/iris_probe.c             |  3 +--
 drivers/media/platform/qcom/iris/iris_vpu_common.c        |  2 +-
 14 files changed, 33 insertions(+), 59 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_core.h b/drivers/media/platform/qcom/iris/iris_core.h
index d10a03aa5685..1592681640ab 100644
--- a/drivers/media/platform/qcom/iris/iris_core.h
+++ b/drivers/media/platform/qcom/iris/iris_core.h
@@ -68,8 +68,7 @@ struct qcom_ubwc_cfg_data;
  * @header_id: id of packet header
  * @packet_id: id of packet
  * @power: a structure for clock and bw information
- * @hfi_ops: iris hfi command ops
- * @hfi_response_ops: iris hfi response ops
+ * @hfi_sys_ops: iris HFI system ops
  * @core_init_done: structure of signal completion for system response
  * @intr_status: interrupt status
  * @sys_error_handler: a delayed work for handling system fatal error
@@ -112,8 +111,7 @@ struct iris_core {
 	u32					header_id;
 	u32					packet_id;
 	struct iris_core_power			power;
-	const struct iris_hfi_command_ops	*hfi_ops;
-	const struct iris_hfi_response_ops	*hfi_response_ops;
+	const struct iris_hfi_sys_ops		*hfi_sys_ops;
 	struct completion			core_init_done;
 	u32					intr_status;
 	struct delayed_work			sys_error_handler;
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_common.c b/drivers/media/platform/qcom/iris/iris_hfi_common.c
index 92112eb16c11..ad8e4ecb8605 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_common.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_common.c
@@ -76,7 +76,7 @@ u32 iris_hfi_get_v4l2_matrix_coefficients(u32 hfi_coefficients)
 
 int iris_hfi_core_init(struct iris_core *core)
 {
-	const struct iris_hfi_command_ops *hfi_ops = core->hfi_ops;
+	const struct iris_hfi_sys_ops *hfi_ops = core->hfi_sys_ops;
 	int ret;
 
 	ret = hfi_ops->sys_init(core);
@@ -109,7 +109,7 @@ irqreturn_t iris_hfi_isr_handler(int irq, void *data)
 	iris_vpu_clear_interrupt(core);
 	mutex_unlock(&core->lock);
 
-	core->hfi_response_ops->hfi_response_handler(core);
+	core->hfi_sys_ops->sys_hfi_response_handler(core);
 
 	if (!iris_vpu_watchdog(core, core->intr_status))
 		enable_irq(irq);
@@ -144,7 +144,7 @@ int iris_hfi_pm_suspend(struct iris_core *core)
 
 int iris_hfi_pm_resume(struct iris_core *core)
 {
-	const struct iris_hfi_command_ops *ops = core->hfi_ops;
+	const struct iris_hfi_sys_ops *ops = core->hfi_sys_ops;
 	int ret;
 
 	ret = iris_vpu_power_on(core);
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_common.h b/drivers/media/platform/qcom/iris/iris_hfi_common.h
index 18684ada78b2..9aa84a1d8f95 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_common.h
+++ b/drivers/media/platform/qcom/iris/iris_hfi_common.h
@@ -105,11 +105,13 @@ struct iris_hfi_prop_type_handle {
 	int (*handle)(struct iris_inst *inst, u32 plane);
 };
 
-struct iris_hfi_command_ops {
+struct iris_hfi_sys_ops {
 	int (*sys_init)(struct iris_core *core);
 	int (*sys_image_version)(struct iris_core *core);
 	int (*sys_interframe_powercollapse)(struct iris_core *core);
 	int (*sys_pc_prep)(struct iris_core *core);
+
+	void (*sys_hfi_response_handler)(struct iris_core *core);
 };
 
 struct iris_hfi_session_ops {
@@ -129,10 +131,6 @@ struct iris_hfi_session_ops {
 	int (*session_close)(struct iris_inst *inst);
 };
 
-struct iris_hfi_response_ops {
-	void (*hfi_response_handler)(struct iris_core *core);
-};
-
 struct hfi_subscription_params {
 	u32	bitstream_resolution;
 	u32	crop_offsets[2];
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1.h b/drivers/media/platform/qcom/iris/iris_hfi_gen1.h
index 19b8e9054a75..38e9d262d7df 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1.h
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1.h
@@ -9,8 +9,8 @@
 struct iris_core;
 struct iris_inst;
 
-void iris_hfi_gen1_command_ops_init(struct iris_core *core);
-void iris_hfi_gen1_response_ops_init(struct iris_core *core);
+void iris_hfi_gen1_sys_ops_init(struct iris_core *core);
+void iris_hfi_gen1_response_handler(struct iris_core *core);
 struct iris_inst *iris_hfi_gen1_get_instance(void);
 
 #endif
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
index a28b0c7ebbad..26b7feb05d15 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
@@ -1076,16 +1076,18 @@ static const struct iris_hfi_session_ops iris_hfi_gen1_session_ops = {
 	.session_close = iris_hfi_gen1_session_close,
 };
 
-static const struct iris_hfi_command_ops iris_hfi_gen1_command_ops = {
+static const struct iris_hfi_sys_ops iris_hfi_gen1_sys_ops = {
 	.sys_init = iris_hfi_gen1_sys_init,
 	.sys_image_version = iris_hfi_gen1_sys_image_version,
 	.sys_interframe_powercollapse = iris_hfi_gen1_sys_interframe_powercollapse,
 	.sys_pc_prep = iris_hfi_gen1_sys_pc_prep,
+
+	.sys_hfi_response_handler = iris_hfi_gen1_response_handler,
 };
 
-void iris_hfi_gen1_command_ops_init(struct iris_core *core)
+void iris_hfi_gen1_sys_ops_init(struct iris_core *core)
 {
-	core->hfi_ops = &iris_hfi_gen1_command_ops;
+	core->hfi_sys_ops = &iris_hfi_gen1_sys_ops;
 }
 
 struct iris_inst *iris_hfi_gen1_get_instance(void)
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
index 8e864c239e29..bfd7495bf44f 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
@@ -688,7 +688,7 @@ static void iris_hfi_gen1_flush_debug_queue(struct iris_core *core, u8 *packet)
 	}
 }
 
-static void iris_hfi_gen1_response_handler(struct iris_core *core)
+void iris_hfi_gen1_response_handler(struct iris_core *core)
 {
 	memset(core->response_packet, 0, sizeof(struct hfi_pkt_hdr));
 	while (!iris_hfi_queue_msg_read(core, core->response_packet)) {
@@ -698,12 +698,3 @@ static void iris_hfi_gen1_response_handler(struct iris_core *core)
 
 	iris_hfi_gen1_flush_debug_queue(core, core->response_packet);
 }
-
-static const struct iris_hfi_response_ops iris_hfi_gen1_response_ops = {
-	.hfi_response_handler = iris_hfi_gen1_response_handler,
-};
-
-void iris_hfi_gen1_response_ops_init(struct iris_core *core)
-{
-	core->hfi_response_ops = &iris_hfi_gen1_response_ops;
-}
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2.h b/drivers/media/platform/qcom/iris/iris_hfi_gen2.h
index b9d3749a10ef..6cc6d9890c12 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2.h
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2.h
@@ -34,8 +34,8 @@ struct iris_inst_hfi_gen2 {
 	struct hfi_subscription_params	dst_subcr_params;
 };
 
-void iris_hfi_gen2_command_ops_init(struct iris_core *core);
-void iris_hfi_gen2_response_ops_init(struct iris_core *core);
+void iris_hfi_gen2_sys_ops_init(struct iris_core *core);
+void iris_hfi_gen2_response_handler(struct iris_core *core);
 struct iris_inst *iris_hfi_gen2_get_instance(void);
 
 #endif
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
index ffb70fd9499c..0c98d680bf09 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
@@ -1315,16 +1315,18 @@ static const struct iris_hfi_session_ops iris_hfi_gen2_session_ops = {
 	.session_close = iris_hfi_gen2_session_close,
 };
 
-static const struct iris_hfi_command_ops iris_hfi_gen2_command_ops = {
+static const struct iris_hfi_sys_ops iris_hfi_gen2_sys_ops = {
 	.sys_init = iris_hfi_gen2_sys_init,
 	.sys_image_version = iris_hfi_gen2_sys_image_version,
 	.sys_interframe_powercollapse = iris_hfi_gen2_sys_interframe_powercollapse,
 	.sys_pc_prep = iris_hfi_gen2_sys_pc_prep,
+
+	.sys_hfi_response_handler = iris_hfi_gen2_response_handler,
 };
 
-void iris_hfi_gen2_command_ops_init(struct iris_core *core)
+void iris_hfi_gen2_sys_ops_init(struct iris_core *core)
 {
-	core->hfi_ops = &iris_hfi_gen2_command_ops;
+	core->hfi_sys_ops = &iris_hfi_gen2_sys_ops;
 }
 
 struct iris_inst *iris_hfi_gen2_get_instance(void)
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
index 8e19f61bbbf9..c350d231265e 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
@@ -977,7 +977,7 @@ static void iris_hfi_gen2_flush_debug_queue(struct iris_core *core, u8 *packet)
 	}
 }
 
-static void iris_hfi_gen2_response_handler(struct iris_core *core)
+void iris_hfi_gen2_response_handler(struct iris_core *core)
 {
 	if (iris_vpu_watchdog(core, core->intr_status)) {
 		struct iris_hfi_packet pkt = {.type = HFI_SYS_ERROR_WD_TIMEOUT};
@@ -997,12 +997,3 @@ static void iris_hfi_gen2_response_handler(struct iris_core *core)
 
 	iris_hfi_gen2_flush_debug_queue(core, core->response_packet);
 }
-
-static const struct iris_hfi_response_ops iris_hfi_gen2_response_ops = {
-	.hfi_response_handler = iris_hfi_gen2_response_handler,
-};
-
-void iris_hfi_gen2_response_ops_init(struct iris_core *core)
-{
-	core->hfi_response_ops = &iris_hfi_gen2_response_ops;
-}
diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index d7106902698c..6b76a9046f9a 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -202,8 +202,7 @@ enum platform_pm_domain_type {
 };
 
 struct iris_platform_data {
-	void (*init_hfi_command_ops)(struct iris_core *core);
-	void (*init_hfi_response_ops)(struct iris_core *core);
+	void (*init_hfi_ops)(struct iris_core *core);
 	struct iris_inst *(*get_instance)(void);
 	u32 (*get_vpu_buffer_size)(struct iris_inst *inst, enum iris_buffer_type buffer_type);
 	const struct vpu_ops *vpu_ops;
diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen1.c b/drivers/media/platform/qcom/iris/iris_platform_gen1.c
index ed07d1b00e43..dc74da04771b 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_gen1.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_gen1.c
@@ -334,8 +334,7 @@ static const u32 sm8250_enc_ip_int_buf_tbl[] = {
 
 const struct iris_platform_data sm8250_data = {
 	.get_instance = iris_hfi_gen1_get_instance,
-	.init_hfi_command_ops = &iris_hfi_gen1_command_ops_init,
-	.init_hfi_response_ops = iris_hfi_gen1_response_ops_init,
+	.init_hfi_ops = &iris_hfi_gen1_sys_ops_init,
 	.get_vpu_buffer_size = iris_vpu_buf_size,
 	.vpu_ops = &iris_vpu2_ops,
 	.icc_tbl = sm8250_icc_table,
@@ -387,8 +386,7 @@ const struct iris_platform_data sm8250_data = {
 
 const struct iris_platform_data sc7280_data = {
 	.get_instance = iris_hfi_gen1_get_instance,
-	.init_hfi_command_ops = &iris_hfi_gen1_command_ops_init,
-	.init_hfi_response_ops = iris_hfi_gen1_response_ops_init,
+	.init_hfi_ops = &iris_hfi_gen1_sys_ops_init,
 	.get_vpu_buffer_size = iris_vpu_buf_size,
 	.vpu_ops = &iris_vpu2_ops,
 	.icc_tbl = sm8250_icc_table,
diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
index c84d4399f84d..19e99e1c2aff 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
@@ -908,8 +908,7 @@ static const u32 sm8550_enc_op_int_buf_tbl[] = {
 
 const struct iris_platform_data sm8550_data = {
 	.get_instance = iris_hfi_gen2_get_instance,
-	.init_hfi_command_ops = iris_hfi_gen2_command_ops_init,
-	.init_hfi_response_ops = iris_hfi_gen2_response_ops_init,
+	.init_hfi_ops = iris_hfi_gen2_sys_ops_init,
 	.get_vpu_buffer_size = iris_vpu_buf_size,
 	.vpu_ops = &iris_vpu3_ops,
 	.icc_tbl = sm8550_icc_table,
@@ -1008,8 +1007,7 @@ const struct iris_platform_data sm8550_data = {
  */
 const struct iris_platform_data sm8650_data = {
 	.get_instance = iris_hfi_gen2_get_instance,
-	.init_hfi_command_ops = iris_hfi_gen2_command_ops_init,
-	.init_hfi_response_ops = iris_hfi_gen2_response_ops_init,
+	.init_hfi_ops = iris_hfi_gen2_sys_ops_init,
 	.get_vpu_buffer_size = iris_vpu33_buf_size,
 	.vpu_ops = &iris_vpu33_ops,
 	.icc_tbl = sm8550_icc_table,
@@ -1103,8 +1101,7 @@ const struct iris_platform_data sm8650_data = {
 
 const struct iris_platform_data sm8750_data = {
 	.get_instance = iris_hfi_gen2_get_instance,
-	.init_hfi_command_ops = iris_hfi_gen2_command_ops_init,
-	.init_hfi_response_ops = iris_hfi_gen2_response_ops_init,
+	.init_hfi_ops = iris_hfi_gen2_sys_ops_init,
 	.get_vpu_buffer_size = iris_vpu33_buf_size,
 	.vpu_ops = &iris_vpu35_ops,
 	.icc_tbl = sm8550_icc_table,
@@ -1200,8 +1197,7 @@ const struct iris_platform_data sm8750_data = {
  */
 const struct iris_platform_data qcs8300_data = {
 	.get_instance = iris_hfi_gen2_get_instance,
-	.init_hfi_command_ops = iris_hfi_gen2_command_ops_init,
-	.init_hfi_response_ops = iris_hfi_gen2_response_ops_init,
+	.init_hfi_ops = iris_hfi_gen2_sys_ops_init,
 	.get_vpu_buffer_size = iris_vpu_buf_size,
 	.vpu_ops = &iris_vpu3_ops,
 	.icc_tbl = sm8550_icc_table,
diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
index baa13cc5c209..fa561f6a736c 100644
--- a/drivers/media/platform/qcom/iris/iris_probe.c
+++ b/drivers/media/platform/qcom/iris/iris_probe.c
@@ -264,8 +264,7 @@ static int iris_probe(struct platform_device *pdev)
 	disable_irq_nosync(core->irq);
 
 	iris_init_ops(core);
-	core->iris_platform_data->init_hfi_command_ops(core);
-	core->iris_platform_data->init_hfi_response_ops(core);
+	core->iris_platform_data->init_hfi_ops(core);
 
 	ret = iris_init_resources(core);
 	if (ret)
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.c b/drivers/media/platform/qcom/iris/iris_vpu_common.c
index faabf53126f3..dbce5aeba06c 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_common.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu_common.c
@@ -149,7 +149,7 @@ int iris_vpu_prepare_pc(struct iris_core *core)
 	if (!wfi_status || !idle_status)
 		goto skip_power_off;
 
-	ret = core->hfi_ops->sys_pc_prep(core);
+	ret = core->hfi_sys_ops->sys_pc_prep(core);
 	if (ret)
 		goto skip_power_off;
 

-- 
2.47.3


