Return-Path: <linux-media+bounces-57483-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iCALJAB1yGkNmQUAu9opvQ
	(envelope-from <linux-media+bounces-57483-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 29 Mar 2026 01:40:32 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E3C203505D6
	for <lists+linux-media@lfdr.de>; Sun, 29 Mar 2026 01:40:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2F5CD30E0899
	for <lists+linux-media@lfdr.de>; Sun, 29 Mar 2026 00:34:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 667F31F5825;
	Sun, 29 Mar 2026 00:34:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MFga/EgD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Fvir+zRC"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0528923A984
	for <linux-media@vger.kernel.org>; Sun, 29 Mar 2026 00:34:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774744445; cv=none; b=T1a2IGzUeOkO1UguaT609pSBNxnpkXrhygvCBH1fB9/NszYKSkuKhtVlmpfrxwXn1KmSqZ+DmJURQb9WXUrUETcCICYKP/4VAmHflKfd9Q/xIJEzN/7tUQaaZFXiMcQ3wxc7MefWdrAp9L14gH/47TRk2XVtdQo9fUqZyGcYFQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774744445; c=relaxed/simple;
	bh=llLg5eopFftqLZBBp1IlBTwMM41q6fNq9nB/4JNAPL8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TEOYs79Up0dUf4N0pV4g0RdDW5dS56Ot48MY5DLPDhXhJg4FjurYU0p+diC0oVSgpugJI2NA83p0w1KulshLLlZyIwTSSgioXtPX0jW6y66pa2sgs57vVdEc3hpMYJU2w6OBOAqeB4JnhJoZkfreK/5KMEGEMd+mVYtkg05F+J8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MFga/EgD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Fvir+zRC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62SMwRXu2522887
	for <linux-media@vger.kernel.org>; Sun, 29 Mar 2026 00:34:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ed8EN1cJegDn7rFwgFjtpbu8BjZGclcnGC0DQV8reno=; b=MFga/EgDV5M1sg1l
	sXu+3P62XA5r2DxiTJw838zU7PvrN+J8Xn0jO/a1PWtMozviQgidPmul0qGppUfd
	0p/xPREbqt6DtVsRC8vpj1fcQgZe6g1QKNViQZWMplt2naXjWTb1tBfseXYhrAts
	ddZgJ51e2d7jwHd8yruD9Kgit7TArHuk3qqQFCMzRNfsJe21SdpkqNbzUpoj5njy
	1agX7hxGn3Z3K73oxYI4ZgBVN36VLkh6y6CRnqd89QGZaybF50/TSERqNdpy/Es9
	U+0iyUGKGfJryW9iTzrDUVIC1xWNmopIMM87fZwNlRXN/hDosbRWzQmOs4ohK63p
	yYlx8w==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d64pda2qk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sun, 29 Mar 2026 00:34:03 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50911c94db1so81721881cf.0
        for <linux-media@vger.kernel.org>; Sat, 28 Mar 2026 17:34:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774744442; x=1775349242; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ed8EN1cJegDn7rFwgFjtpbu8BjZGclcnGC0DQV8reno=;
        b=Fvir+zRCUjWVIGwCbUiqv+vAONci/Y8t8PMfeoV34M8fuCkPrewwAEMwMi7okM+I6k
         YbiOjQn5UPHMgS+87E6hraYUAOQLChgiyskwy0fcg+9esYLzELOYShYEsh8FEBG8eDGU
         KKzz9/QI4em1z7BdTeix7OpcbeAF4TFfpG/L9mexZP5oeKcB59jzASjuAf5t5tU7P4i3
         yDyfyqoN9KGljumjytxEcvXFCKVal/u7Bx6oCaJyy4X+m5BR1L1Yd8ppYN+xelwCwIL1
         WhxJK/PFHg33e++TVqb6b2b3nZjQVpoa0riodnfPbDyhGuqcDpqx3ebohNlprd0FiolF
         yJRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774744442; x=1775349242;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ed8EN1cJegDn7rFwgFjtpbu8BjZGclcnGC0DQV8reno=;
        b=AgUy3B4xqzj7f177ofcRcgp9BIgWt0lVYlYJ7YaBxp3nVybImHAwOWdOxQ6RxVUZh3
         QDr8Sxd4e0t5y1604WgcOFFIC4UuFtA2oEG0VDB1qpQxdqcBFTYUumzGjqgUOqrMNaAh
         rba8Q1Z0XWGtViC7RSlTQaVZwFr1Mn+o+2AN420xAE9Agjf9NSbLEZT/J0tDcjuYB1vT
         XWkeUZ1GHe3DEPIH/yeEXl/ARe6HXRhnqqF7g4viPx6doawa6zOdYkjb3W8sv+PKoU5K
         W4Rz55mkd161magWg0UzzgTTyig9plV6BcPKmvIa0gfr1oNbRkj45N5FzMd4nSws5148
         0wNA==
X-Gm-Message-State: AOJu0Yzc1SPUMGJEphafzXgZVFXzZBBN7KZidJnfr4zBk7CwyCmdQ9yX
	3neyocg37XhYULEm6FzZvFyFJ3gkOaLnzo8ewSUCUrwPRHXCcbvFTZVR8Evck6LI6A0Mpzbmbl1
	95YuQ5R+L4mVh2PFH8yaiZMG7rBcMmsX9xfITZ33JNQH5ADSVE+Bx293XLoCsh3xq4w==
X-Gm-Gg: ATEYQzxIFWMHf7zvPsay8Qdr2dX+jHgaUTEmM9QhFCnfkDj7M5vhqMmZmE3DTIvRf1p
	Rcw5gF1jupoT7HjPfW3F+kv3GVeMNpO/uUszcZT5kCoIoHw56rf+ocxKQ13oTasxUqSWPvOda/e
	D6j5uWgWjrvwTtwtWx4ADSXkVd5cRPoMKL3crdeU+jpi3pnuJqMSL50cas12XMTfJAiBwtPwOiG
	u0abozsZO7XrCaXzSzUAx6MWZbnI1raWaxYU8ovFnBbqCFbrunFxxavoNw++XZvTSiWX+nnj2Wf
	w2FA9agsL7hWr+KYR1saP/GkEd2ZlZ9JxoY+fc+PX3kNaikKA9mhIKYLpGGXBwP5F/sU2+sJO9w
	hCQI6aoyxm7YUZdOr2sEmHPFDI4C/z3VVb9He+/LGECGuS1tDAKqTmlPICwjZeoD3BGTC8uTGQz
	vO6lUzQxLJ4rh+0IrLAOkTiv8wGjG1oHiljgk=
X-Received: by 2002:ac8:7f4a:0:b0:50b:54e7:f935 with SMTP id d75a77b69052e-50ba38f1d44mr114508381cf.41.1774744442266;
        Sat, 28 Mar 2026 17:34:02 -0700 (PDT)
X-Received: by 2002:ac8:7f4a:0:b0:50b:54e7:f935 with SMTP id d75a77b69052e-50ba38f1d44mr114508161cf.41.1774744441767;
        Sat, 28 Mar 2026 17:34:01 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38c83892035sm7024731fa.22.2026.03.28.17.33.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Mar 2026 17:33:59 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 29 Mar 2026 02:33:12 +0200
Subject: [PATCH v11 11/11] media: qcom: iris: extract firmware description
 data
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260329-iris-platform-data-v11-11-eea672b03a95@oss.qualcomm.com>
References: <20260329-iris-platform-data-v11-0-eea672b03a95@oss.qualcomm.com>
In-Reply-To: <20260329-iris-platform-data-v11-0-eea672b03a95@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=13070;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=llLg5eopFftqLZBBp1IlBTwMM41q6fNq9nB/4JNAPL8=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ+aJYs9HmxQ37Qg9Vdm0vV1VVpZ7lacju3Fv8TLDTTvnq
 8dPnsfbyWjMwsDIxSArpsjiU9AyNWZTctiHHVPrYQaxMoFMYeDiFICJ8MVyMKw8+1jxfd3uhCzN
 uCf1Mfv79V0SRFKFplat+v/M8JrxHasJzLs2sbw/VabZejL0tnljmwGzcGb1V6nomm/CJbXXnyQ
 08N2aVX1IdJbFfc+rFx3mKBlt5GBMuX9RLTnFdVl1yoVq/f6K2iuv8twyTFSaTyfOqgrik2/1Lf
 +v9jCRMVJ+xqN7f6r6eLSnSLkE77Jc41f8lsmwJbPqNdNUKfPGfw0CU0IL10fFh66rvKP9RaVr7
 sloc/8n7Q8EF6kF8KuEr33f82YN/8ePn48mfZfbcac455bMvvlFa0+sWXcn+qukoeDfhevrVmlN
 W3rocOx7TS7VipWlZ3MS5dT0VwUd/FDp5WWu8vFBxKlaAA==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: j0BdUPQRyJSbexO1cLSr2LvNP6mSZGM0
X-Authority-Analysis: v=2.4 cv=UZpciaSN c=1 sm=1 tr=0 ts=69c8737b cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=pn2aoerzR4tYcExiNNwA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: j0BdUPQRyJSbexO1cLSr2LvNP6mSZGM0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI5MDAwMiBTYWx0ZWRfXyxhmFi/bPkux
 NJYXA0rIhhf0hLzHFp7jga7zV5GkY/tKHnUiWQpQRI/yD4xRnzi07gcWqCThICJbmTNGWuvJQJK
 5o2fF33c2xemM0Je3S6mI1a+4tDiOQz2OMT6VHlhi/FARsmklrINPcCzlIhXGsJ4079bNuCHRU1
 6hDNQeyccfVsnGfpXZ3JOWKCwEq+EVbuyseYKzkJBi0lapiLur+I0oVpWIrcQ+2pH1NRLLqQznW
 o1xvDmjBif9HAG+xdYB6lJ2MTxUwpkNeUzw2O+zdvcaho9FH8wg+O863h4s6KnAUX6hrbjFGLbc
 KnbNXKM4khZBFfdOjtnuWLjmfoRS+fPuyi86S7ugjQKO27cmRvtZySjtnG/j29/dJLsptxUW90p
 rHyFseXAccUslgBJeDnjPm1e27ua0b1OBZw4m4sxILFjybgnmvDn3b+HtA4/lhKies3JGGXWiC6
 8ONlVlyVw5j3by7dh6g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-28_03,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0 priorityscore=1501
 adultscore=0 spamscore=0 malwarescore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603290002
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-57483-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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
X-Rspamd-Queue-Id: E3C203505D6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

In preparation to adding support for several firmware revisions to be
used for a platform, extract the firmware description data. It
incorporates firmware name, HFI ops and buffer requirements of the
particular firmware build.

Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_buffer.c     |  2 +-
 drivers/media/platform/qcom/iris/iris_core.h       |  2 ++
 drivers/media/platform/qcom/iris/iris_firmware.c   |  2 +-
 .../platform/qcom/iris/iris_hfi_gen1_command.c     |  2 +-
 .../platform/qcom/iris/iris_platform_common.h      | 15 ++++----
 .../media/platform/qcom/iris/iris_platform_vpu2.c  | 20 +++++++----
 .../media/platform/qcom/iris/iris_platform_vpu3x.c | 41 +++++++++++++++-------
 drivers/media/platform/qcom/iris/iris_probe.c      |  3 +-
 8 files changed, 58 insertions(+), 29 deletions(-)

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
index e0ca245c8c63..24da60448cf2 100644
--- a/drivers/media/platform/qcom/iris/iris_core.h
+++ b/drivers/media/platform/qcom/iris/iris_core.h
@@ -55,6 +55,7 @@ struct qcom_ubwc_cfg_data;
  * @controller_resets: table of controller reset clocks
  * @iris_platform_data: a structure for platform data
  * @iris_firmware_data: a pointer to the firmware (or HFI) specific data
+ * @iris_firmware_desc: a pointer to the firmware-specific descriptive data
  * @ubwc_cfg: UBWC configuration for the platform
  * @state: current state of core
  * @iface_q_table_daddr: device address for interface queue table memory
@@ -99,6 +100,7 @@ struct iris_core {
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


