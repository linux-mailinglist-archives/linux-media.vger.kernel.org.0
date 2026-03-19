Return-Path: <linux-media+bounces-56297-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EPbeM9qRu2mYlgIAu9opvQ
	(envelope-from <linux-media+bounces-56297-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2026 07:04:10 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id EEAE02C67EF
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2026 07:04:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 1DB9F301C6BA
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2026 06:01:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B9C634DB7B;
	Thu, 19 Mar 2026 06:00:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mtEeAumF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="czCkvEqS"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EEB434D923
	for <linux-media@vger.kernel.org>; Thu, 19 Mar 2026 06:00:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773900026; cv=none; b=rhetbIsBkqG9D5HM9ZizPyixpLyGB3K3Px2AUcbnc4g4UJRasBG0ckOKWMJF7kRkl5FtaCWInTpRPIqCwVn48f92KDt9SmF9rnyDyeXsIgqnovnqP2dXqyDGXJGEM7mxnQ0RPaVWOHP5hXyKzYN8v+4GWLxKehA9mEdhD9JUBvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773900026; c=relaxed/simple;
	bh=tosnyhh8DtswMdbD6EGU7YTtdFXnAzWlifAthWRXRV0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Le1QqYN7nzms0d2aHvQmptAspGacfrQB5kEaFNqgWArKYpiGEla3oMPFJHo/bB5KA+TP8LXyAoBKR8iZBPfI8tWSoxE37g/2CLLEYNyO6b5fxufmasCbx7WDg4DMLByCbXTIWEl/D8Odf7s75SI+VckIWrvHyB2uRQYOmTK7vgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mtEeAumF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=czCkvEqS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62J5XtrB3732644
	for <linux-media@vger.kernel.org>; Thu, 19 Mar 2026 06:00:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zAAZ9np3vSaZuqX49z75F1UXFOFKtBEtrhQT2MwCAZg=; b=mtEeAumFO60arsB3
	3L59qf/CA+oUcLLBGi0EV/vU6yARdTMES9d4oU/a9Eoqw3FiLGGKCA2Qtn+Eaoau
	S2K7TxpHh1tiDxDlUOi/woWBcjEt8vD0/bMBAp/cQa1rAeLMihgJ1GZ/MNfdYOkh
	aHn2FPtv7G6f3KLsnJjtP1KuPN/T2Lc1bh6IAxkRR82Im5PvKDKWNTiyyShuEQqX
	9j9aGixrhv/Erq4P/IAxxYlhiKhMecshkczYAcrHUMwLj1K4dFxvMdKiqPqLXj6F
	RKpwrkql9iMwgHbPEs7uEFCwAbJuRqfwA/MFOzxL+S74DTVrEjfS6GoSpbNNhyx2
	nhbo0w==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cyut1b81c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 19 Mar 2026 06:00:23 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-509114d7418so7228671cf.1
        for <linux-media@vger.kernel.org>; Wed, 18 Mar 2026 23:00:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773900022; x=1774504822; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zAAZ9np3vSaZuqX49z75F1UXFOFKtBEtrhQT2MwCAZg=;
        b=czCkvEqSpjCPbHF7AFT5B/1qFKWsrTpRA9ftJy6nMx7L24MhJ+YSoArmRFUSvdO/yU
         +G6MDiqSvsfHv8jdOgGtgRCskRAT0HYs9MOxxEBjXl2A3u0JjvePFkLxVJB2Yvik06vq
         SdYul1CK0GEudICC78oiYXBw+mfs0OwdhY7EChOULGMgKLhd39Bwq9lelHZQc5rF/JIy
         TTM76o7ThFse0kB9KQQsdpOBj7a0w9nlR7RKqYy7oZ2RYZU8za34Cbm/qh6DmD07pv+a
         NPwT2ZdxQZ7We1nK+Qv/dNpKG4hD9Qkmarre50WRE4eAaEwRu+Fq2qante5hUz3zZi6a
         EAMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773900022; x=1774504822;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zAAZ9np3vSaZuqX49z75F1UXFOFKtBEtrhQT2MwCAZg=;
        b=bxf8j16eWs4rYHNflYV8t3XruxyY83YTli+mrOp8G7juyVvP+Ms+Sv1bAZ8x8J3NGc
         OSpEx8JxRSbgosEdeoJUM7l/Rqwuj/6PGWL10Wqovji79dwuob+M0qVUXw7ibLNUOt48
         +IMN3ZoI9ipPqvfM6VArX9MhKbtXg1jOFCxrGMFgWpQaYS4osCLgZ9nUMtFzrwzPESw8
         4PPMNX8zDIQ4H0bXGolG6428tBeJxIkSEVSkz695hUgH7dyzqB6H0B1RxPZO3hZ9MeR9
         4m+QevYPkQE94oCLhXvYcbuAoQ5H2T7K6qh7WzUmtpeZs7Z8BgklG0B5PX41dFHzWhV7
         qlpQ==
X-Gm-Message-State: AOJu0YwD9N2mwvE/pSWcxp/EuLZf7I9TfD8vcbabISIwZslqg78r/WUj
	Xwl0f2Em2wMXVlNnPCmKr4oZ3HmmU+r5baxr3vwQ73DtPh8dNhYydRn1PW/O/ZIpx4xjxDirdAv
	0QNOK5zEQ/Snf9zzM8nBN/ZhT1eieQr81okzTrI1q23KI0+/qK3RhkkX3Z8y0zTNzdg==
X-Gm-Gg: ATEYQzwzRQlAi6c5hoaiw4ySmEhqk2IJ50gZfI5GSZ3WjzMrNx7CszpAYB7XRIKVHJl
	hAWzjsGZCQ3nM6o0OJzO74EgRNfhNEhRA967aTWd12FbqmgPFh9JtqWkYNNyvTUfzpd41kFtvDD
	8drLiRJdpq6mjxvdRhIvoAm+Su/ozxlpCcfwYbp+HiYNNwUBGlK7MST9ErIZ/6a3NDj4FjsQteU
	pn0fQGq2hIhuXI86QuJUYIo70ndj4wzIh9fuI3idMXNpPjXJ5Rb39H67ACTnKtJlu0FFE/9fkIw
	q5XiPy/BddFER7kAjNSzq7cwkgywGCYyQ+/wgBfOiCeRkDCspsEig7HzAtfFz47f08FY+K/NR+E
	XEn6PHF14drREnSXkOr0C8LvzK3wMlQ0+NnTZreilMjMeVg1RIAE/WLrXFE2juDZ//RsxOS8bp4
	TSNS9svQf4pccI3goYNjSJCpS+qsc+cU3oMxQ=
X-Received: by 2002:ac8:7d55:0:b0:50b:2eef:c900 with SMTP id d75a77b69052e-50b2eefd78cmr2160161cf.24.1773900022097;
        Wed, 18 Mar 2026 23:00:22 -0700 (PDT)
X-Received: by 2002:ac8:7d55:0:b0:50b:2eef:c900 with SMTP id d75a77b69052e-50b2eefd78cmr2151771cf.24.1773900016823;
        Wed, 18 Mar 2026 23:00:16 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a279c7415asm993174e87.56.2026.03.18.23.00.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 23:00:14 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 19 Mar 2026 07:59:55 +0200
Subject: [PATCH v8 11/11] media: qcom: iris: extract firmware description
 data
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260319-iris-platform-data-v8-11-55a9566ebf60@oss.qualcomm.com>
References: <20260319-iris-platform-data-v8-0-55a9566ebf60@oss.qualcomm.com>
In-Reply-To: <20260319-iris-platform-data-v8-0-55a9566ebf60@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=12526;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=tosnyhh8DtswMdbD6EGU7YTtdFXnAzWlifAthWRXRV0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpu5DYLGkoaJsPsALFOvpJcZ6jZCKy1GbFpH0Gd
 h+2x8Lsk0GJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCabuQ2AAKCRCLPIo+Aiko
 1V/UB/0b1EdvoMYUP0r5NLOrJxQx8rF39PkrSmRJB4zdkq2GTGor6MAkJ/c1o3GcbWii+5PYDdH
 VZH/L4IcF88maC5X5X5Kw5LRFJXiyjGCk+Bj1IwhvVTa1FnzZX1rypFF8KMZEdWIbgkfZb2Kkkj
 VmazMqehhH62kgfI6/ivR9L/+NS0/87Xa5TFYFPUJ1EjRgaDpdv6S6kWj9lj7OaEwLsUaFHSGWX
 PxPijbLAgWrG2UeI3pqUJu2tjRIZdrfIHX3JGyR2KjyfS27AVD9Nj9c3yHgXfNlSCfoXQ/HBOT8
 SapqKQC9Z0Ya4C9J15qFkjBb96TN/C77gTdE9VcosIZyc9pY
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: Ucr2ikgEiZxLVK1VVDe8NLcZSSj4YNFW
X-Authority-Analysis: v=2.4 cv=ModfKmae c=1 sm=1 tr=0 ts=69bb90f7 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=pn2aoerzR4tYcExiNNwA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: Ucr2ikgEiZxLVK1VVDe8NLcZSSj4YNFW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE5MDA0NSBTYWx0ZWRfX1KsZGkxUGrKx
 54fDOLBXBExTawMaIsUH77Mli2r7Xk2pg+KTKiV0Uhwx45nGsDbO3euOJbff1lHIQudmP+Daqav
 ZS2rL58uR3AscKINT5bLIErMiPEekCIJiDkjgq+27hD0OzRBAK5iAEQEucVaQdjoFekitdnyRe0
 CPgYCtYvs6NDg9oU+41VDvEAf7G+P831tb19CnK7S/qDjkI5SYPAiqws7E8a68ZDiwKE0BvOIcu
 p8wZ612vDRTYFeZTIH+LBUPQh2Hpn4vcpeVPeG6UuR7m+/bZnE5VMBhL+GCqhD5gsJ9jaN5jtRe
 /55wWbkwmEvlsFpLMQfpZDFAQ6kxapmm1MwvSkw19WSPRKa0tqZhRASrYLhEy+zY4eeF5QS9QZM
 IUrVffIui2aAm/wUFIDFGniwobxoBRuMdYyO4fYMViCw2tYVFduxvwMdtWrOd4Sfapxq90oZ/+A
 WR+CGOAtq5VGUyVs8cg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-19_01,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 clxscore=1015 adultscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603190045
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-56297-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: EEAE02C67EF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

In preparation to adding support for several firmware revisions to be
used for a platform, extract the firmware description data. It
incorporates firmware name, HFI ops and buffer requirements of the
particular firmware build.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_buffer.c     |  2 +-
 drivers/media/platform/qcom/iris/iris_core.h       |  1 +
 drivers/media/platform/qcom/iris/iris_firmware.c   |  2 +-
 .../platform/qcom/iris/iris_hfi_gen1_command.c     |  2 +-
 .../platform/qcom/iris/iris_platform_common.h      | 15 ++++----
 .../media/platform/qcom/iris/iris_platform_vpu2.c  | 20 +++++++----
 .../media/platform/qcom/iris/iris_platform_vpu3x.c | 41 +++++++++++++++-------
 drivers/media/platform/qcom/iris/iris_probe.c      |  3 +-
 8 files changed, 57 insertions(+), 29 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_buffer.c b/drivers/media/platform/qcom/iris/iris_buffer.c
index fbe136360aa1..ef7f6f931557 100644
--- a/drivers/media/platform/qcom/iris/iris_buffer.c
+++ b/drivers/media/platform/qcom/iris/iris_buffer.c
@@ -295,7 +295,7 @@ static void iris_fill_internal_buf_info(struct iris_inst *inst,
 {
 	struct iris_buffers *buffers = &inst->buffers[buffer_type];
 
-	buffers->size = inst->core->iris_platform_data->get_vpu_buffer_size(inst, buffer_type);
+	buffers->size = inst->core->iris_firmware_desc->get_vpu_buffer_size(inst, buffer_type);
 	buffers->min_count = iris_vpu_buf_count(inst, buffer_type);
 }
 
diff --git a/drivers/media/platform/qcom/iris/iris_core.h b/drivers/media/platform/qcom/iris/iris_core.h
index e0ca245c8c63..7f36eb65dcbf 100644
--- a/drivers/media/platform/qcom/iris/iris_core.h
+++ b/drivers/media/platform/qcom/iris/iris_core.h
@@ -99,6 +99,7 @@ struct iris_core {
 	struct reset_control_bulk_data		*controller_resets;
 	const struct iris_platform_data		*iris_platform_data;
 	const struct iris_firmware_data		*iris_firmware_data;
+	const struct iris_firmware_desc		*iris_firmware_desc;
 	const struct qcom_ubwc_cfg_data		*ubwc_cfg;
 	enum iris_core_state			state;
 	dma_addr_t				iface_q_table_daddr;
diff --git a/drivers/media/platform/qcom/iris/iris_firmware.c b/drivers/media/platform/qcom/iris/iris_firmware.c
index bc6c5c3e00c3..1a476146d758 100644
--- a/drivers/media/platform/qcom/iris/iris_firmware.c
+++ b/drivers/media/platform/qcom/iris/iris_firmware.c
@@ -72,7 +72,7 @@ int iris_fw_load(struct iris_core *core)
 	ret = of_property_read_string_index(core->dev->of_node, "firmware-name", 0,
 					    &fwpath);
 	if (ret)
-		fwpath = core->iris_platform_data->fwname;
+		fwpath = core->iris_firmware_desc->fwname;
 
 	ret = iris_load_fw_to_memory(core, fwpath);
 	if (ret) {
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
index 3fb90a466a64..83373862655f 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
@@ -918,7 +918,7 @@ static int iris_hfi_gen1_set_bufsize(struct iris_inst *inst, u32 plane)
 
 	if (iris_split_mode_enabled(inst)) {
 		bufsz.type = HFI_BUFFER_OUTPUT;
-		bufsz.size = inst->core->iris_platform_data->get_vpu_buffer_size(inst, BUF_DPB);
+		bufsz.size = inst->core->iris_firmware_desc->get_vpu_buffer_size(inst, BUF_DPB);
 
 		ret = hfi_gen1_set_property(inst, ptype, &bufsz, sizeof(bufsz));
 		if (ret)
diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index 6dfead673393..6a108173be35 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -250,14 +250,18 @@ struct iris_firmware_data {
 	unsigned int enc_op_int_buf_tbl_size;
 };
 
+struct iris_firmware_desc {
+	const struct iris_firmware_data *firmware_data;
+	u32 (*get_vpu_buffer_size)(struct iris_inst *inst, enum iris_buffer_type buffer_type);
+	const char *fwname;
+};
+
 struct iris_platform_data {
 	/*
-	 * XXX: remove firmware_data pointer and consider moving
-	 * get_vpu_buffer_size pointer once we have platforms supporting both
-	 * firmware kinds.
+	 * XXX: replace with gen1 / gen2 pointers once we have platforms
+	 * supporting both firmware kinds.
 	 */
-	const struct iris_firmware_data *firmware_data;
-	u32 (*get_vpu_buffer_size)(struct iris_inst *inst, enum iris_buffer_type buffer_type);
+	const struct iris_firmware_desc *firmware_desc;
 
 	const struct vpu_ops *vpu_ops;
 	const struct icc_info *icc_tbl;
@@ -276,7 +280,6 @@ struct iris_platform_data {
 	const char * const *controller_rst_tbl;
 	unsigned int controller_rst_tbl_size;
 	u64 dma_mask;
-	const char *fwname;
 	struct iris_fmt *inst_iris_fmts;
 	u32 inst_iris_fmts_size;
 	struct platform_inst_caps *inst_caps;
diff --git a/drivers/media/platform/qcom/iris/iris_platform_vpu2.c b/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
index 692fbc2aab56..ff8ce078238a 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
@@ -16,6 +16,18 @@
 #include "iris_platform_sc7280.h"
 #include "iris_platform_sm8250.h"
 
+const struct iris_firmware_desc iris_vpu20_p1_gen1_desc = {
+	.firmware_data = &iris_hfi_gen1_data,
+	.get_vpu_buffer_size = iris_vpu_buf_size,
+	.fwname = "qcom/vpu/vpu20_p1.mbn",
+};
+
+const struct iris_firmware_desc iris_vpu20_p4_gen1_desc = {
+	.firmware_data = &iris_hfi_gen1_data,
+	.get_vpu_buffer_size = iris_vpu_buf_size,
+	.fwname = "qcom/vpu/vpu20_p4.mbn",
+};
+
 static struct iris_fmt iris_fmts_vpu2_dec[] = {
 	[IRIS_FMT_H264] = {
 		.pixfmt = V4L2_PIX_FMT_H264,
@@ -62,8 +74,7 @@ static const struct tz_cp_config tz_cp_config_vpu2[] = {
 };
 
 const struct iris_platform_data sc7280_data = {
-	.firmware_data = &iris_hfi_gen1_data,
-	.get_vpu_buffer_size = iris_vpu_buf_size,
+	.firmware_desc = &iris_vpu20_p1_gen1_desc,
 	.vpu_ops = &iris_vpu2_ops,
 	.icc_tbl = iris_icc_info_vpu2,
 	.icc_tbl_size = ARRAY_SIZE(iris_icc_info_vpu2),
@@ -78,7 +89,6 @@ const struct iris_platform_data sc7280_data = {
 	.opp_clk_tbl = sc7280_opp_clk_table,
 	/* Upper bound of DMA address range */
 	.dma_mask = 0xe0000000 - 1,
-	.fwname = "qcom/vpu/vpu20_p1.mbn",
 	.inst_iris_fmts = iris_fmts_vpu2_dec,
 	.inst_iris_fmts_size = ARRAY_SIZE(iris_fmts_vpu2_dec),
 	.inst_caps = &platform_inst_cap_vpu2,
@@ -93,8 +103,7 @@ const struct iris_platform_data sc7280_data = {
 };
 
 const struct iris_platform_data sm8250_data = {
-	.firmware_data = &iris_hfi_gen1_data,
-	.get_vpu_buffer_size = iris_vpu_buf_size,
+	.firmware_desc = &iris_vpu20_p4_gen1_desc,
 	.vpu_ops = &iris_vpu2_ops,
 	.icc_tbl = iris_icc_info_vpu2,
 	.icc_tbl_size = ARRAY_SIZE(iris_icc_info_vpu2),
@@ -111,7 +120,6 @@ const struct iris_platform_data sm8250_data = {
 	.opp_clk_tbl = sm8250_opp_clk_table,
 	/* Upper bound of DMA address range */
 	.dma_mask = 0xe0000000 - 1,
-	.fwname = "qcom/vpu/vpu20_p4.mbn",
 	.inst_iris_fmts = iris_fmts_vpu2_dec,
 	.inst_iris_fmts_size = ARRAY_SIZE(iris_fmts_vpu2_dec),
 	.inst_caps = &platform_inst_cap_vpu2,
diff --git a/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c b/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c
index c2496aa0f851..c3b6cd6fe777 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c
@@ -17,6 +17,30 @@
 #include "iris_platform_sm8650.h"
 #include "iris_platform_sm8750.h"
 
+const struct iris_firmware_desc iris_vpu30_p4_s6_gen2_desc = {
+	.firmware_data = &iris_hfi_gen2_data,
+	.get_vpu_buffer_size = iris_vpu_buf_size,
+	.fwname = "qcom/vpu/vpu30_p4_s6.mbn",
+};
+
+const struct iris_firmware_desc iris_vpu30_p4_gen2_desc = {
+	.firmware_data = &iris_hfi_gen2_data,
+	.get_vpu_buffer_size = iris_vpu_buf_size,
+	.fwname = "qcom/vpu/vpu30_p4.mbn",
+};
+
+const struct iris_firmware_desc iris_vpu33_p4_gen2_desc = {
+	.firmware_data = &iris_hfi_gen2_data,
+	.get_vpu_buffer_size = iris_vpu33_buf_size,
+	.fwname = "qcom/vpu/vpu33_p4.mbn",
+};
+
+const struct iris_firmware_desc iris_vpu35_p4_gen2_desc = {
+	.firmware_data = &iris_hfi_gen2_data,
+	.get_vpu_buffer_size = iris_vpu33_buf_size,
+	.fwname = "qcom/vpu/vpu35_p4.mbn",
+};
+
 static struct iris_fmt iris_fmts_vpu3x_dec[] = {
 	[IRIS_FMT_H264] = {
 		.pixfmt = V4L2_PIX_FMT_H264,
@@ -71,8 +95,7 @@ static const struct tz_cp_config tz_cp_config_vpu3[] = {
  * - inst_caps to platform_inst_cap_qcs8300
  */
 const struct iris_platform_data qcs8300_data = {
-	.firmware_data = &iris_hfi_gen2_data,
-	.get_vpu_buffer_size = iris_vpu_buf_size,
+	.firmware_desc = &iris_vpu30_p4_s6_gen2_desc,
 	.vpu_ops = &iris_vpu3_ops,
 	.icc_tbl = iris_icc_info_vpu3x,
 	.icc_tbl_size = ARRAY_SIZE(iris_icc_info_vpu3x),
@@ -89,7 +112,6 @@ const struct iris_platform_data qcs8300_data = {
 	.opp_clk_tbl = iris_opp_clk_table_vpu3x,
 	/* Upper bound of DMA address range */
 	.dma_mask = 0xe0000000 - 1,
-	.fwname = "qcom/vpu/vpu30_p4_s6.mbn",
 	.inst_iris_fmts = iris_fmts_vpu3x_dec,
 	.inst_iris_fmts_size = ARRAY_SIZE(iris_fmts_vpu3x_dec),
 	.inst_caps = &platform_inst_cap_qcs8300,
@@ -102,8 +124,7 @@ const struct iris_platform_data qcs8300_data = {
 };
 
 const struct iris_platform_data sm8550_data = {
-	.firmware_data = &iris_hfi_gen2_data,
-	.get_vpu_buffer_size = iris_vpu_buf_size,
+	.firmware_desc = &iris_vpu30_p4_gen2_desc,
 	.vpu_ops = &iris_vpu3_ops,
 	.icc_tbl = iris_icc_info_vpu3x,
 	.icc_tbl_size = ARRAY_SIZE(iris_icc_info_vpu3x),
@@ -120,7 +141,6 @@ const struct iris_platform_data sm8550_data = {
 	.opp_clk_tbl = iris_opp_clk_table_vpu3x,
 	/* Upper bound of DMA address range */
 	.dma_mask = 0xe0000000 - 1,
-	.fwname = "qcom/vpu/vpu30_p4.mbn",
 	.inst_iris_fmts = iris_fmts_vpu3x_dec,
 	.inst_iris_fmts_size = ARRAY_SIZE(iris_fmts_vpu3x_dec),
 	.inst_caps = &platform_inst_cap_sm8550,
@@ -137,11 +157,9 @@ const struct iris_platform_data sm8550_data = {
  * - vpu_ops to iris_vpu33_ops
  * - clk_rst_tbl to sm8650_clk_reset_table
  * - controller_rst_tbl to sm8650_controller_reset_table
- * - fwname to "qcom/vpu/vpu33_p4.mbn"
  */
 const struct iris_platform_data sm8650_data = {
-	.firmware_data = &iris_hfi_gen2_data,
-	.get_vpu_buffer_size = iris_vpu33_buf_size,
+	.firmware_desc = &iris_vpu33_p4_gen2_desc,
 	.vpu_ops = &iris_vpu33_ops,
 	.icc_tbl = iris_icc_info_vpu3x,
 	.icc_tbl_size = ARRAY_SIZE(iris_icc_info_vpu3x),
@@ -160,7 +178,6 @@ const struct iris_platform_data sm8650_data = {
 	.opp_clk_tbl = iris_opp_clk_table_vpu3x,
 	/* Upper bound of DMA address range */
 	.dma_mask = 0xe0000000 - 1,
-	.fwname = "qcom/vpu/vpu33_p4.mbn",
 	.inst_iris_fmts = iris_fmts_vpu3x_dec,
 	.inst_iris_fmts_size = ARRAY_SIZE(iris_fmts_vpu3x_dec),
 	.inst_caps = &platform_inst_cap_sm8550,
@@ -173,8 +190,7 @@ const struct iris_platform_data sm8650_data = {
 };
 
 const struct iris_platform_data sm8750_data = {
-	.firmware_data = &iris_hfi_gen2_data,
-	.get_vpu_buffer_size = iris_vpu33_buf_size,
+	.firmware_desc = &iris_vpu35_p4_gen2_desc,
 	.vpu_ops = &iris_vpu35_ops,
 	.icc_tbl = iris_icc_info_vpu3x,
 	.icc_tbl_size = ARRAY_SIZE(iris_icc_info_vpu3x),
@@ -191,7 +207,6 @@ const struct iris_platform_data sm8750_data = {
 	.opp_clk_tbl = iris_opp_clk_table_vpu3x,
 	/* Upper bound of DMA address range */
 	.dma_mask = 0xe0000000 - 1,
-	.fwname = "qcom/vpu/vpu35_p4.mbn",
 	.inst_iris_fmts = iris_fmts_vpu3x_dec,
 	.inst_iris_fmts_size = ARRAY_SIZE(iris_fmts_vpu3x_dec),
 	.inst_caps = &platform_inst_cap_sm8550,
diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
index dd87504c2e67..d36f0c0e785b 100644
--- a/drivers/media/platform/qcom/iris/iris_probe.c
+++ b/drivers/media/platform/qcom/iris/iris_probe.c
@@ -251,7 +251,8 @@ static int iris_probe(struct platform_device *pdev)
 		return core->irq;
 
 	core->iris_platform_data = of_device_get_match_data(core->dev);
-	core->iris_firmware_data = core->iris_platform_data->firmware_data;
+	core->iris_firmware_desc = core->iris_platform_data->firmware_desc;
+	core->iris_firmware_data = core->iris_firmware_desc->firmware_data;
 
 	core->ubwc_cfg = qcom_ubwc_config_get_data();
 	if (IS_ERR(core->ubwc_cfg))

-- 
2.47.3


