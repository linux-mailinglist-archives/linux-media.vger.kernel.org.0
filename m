Return-Path: <linux-media+bounces-66808-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id N4X0Dv2eTGq/nAEAu9opvQ
	(envelope-from <linux-media+bounces-66808-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 07 Jul 2026 08:38:53 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 938D7718098
	for <lists+linux-media@lfdr.de>; Tue, 07 Jul 2026 08:38:52 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=mRdrq3NM;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=CEKYxWSO;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66808-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-66808-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 93003308A778
	for <lists+linux-media@lfdr.de>; Tue,  7 Jul 2026 06:35:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37BBF3A8759;
	Tue,  7 Jul 2026 06:35:53 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98CBC3A8FE9
	for <linux-media@vger.kernel.org>; Tue,  7 Jul 2026 06:35:50 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783406152; cv=none; b=s2OIwaq/m4OEJd+3ThiIHmBXejANv5IteTFwtnQ8+q6jA8gpzb+UN3b2XZ6/SEeOz2uRW8Njv7YqOWWs1KyHSkG7s2AK6R7JOs048sQka4FamuKfdL8mAV50lciXGgI0Of17RWX/+lnWAX+PtAvCYY/xYZCB4ZlA46BGgXNc9xw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783406152; c=relaxed/simple;
	bh=r0NQcgVWIF3QYqJ4mnNHJAILzS2N4Wgq7EHm3cD0oHY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=flrpxml1iwG0gBt372mjbGI9CH6emYdxCaN8QiQP8dZjKRuWisezDVwu2K7LkqVZizJrGp8QjwOa7d5uhdl7gGS5JDYtGK1f+95W7ngs9XcQfsUcDbgp92hNH1m/hahigt4a3ITfOSUUp0HEGeKTaKlJVQ23sjsFG6BTniNvKZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mRdrq3NM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CEKYxWSO; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 667491na2649872
	for <linux-media@vger.kernel.org>; Tue, 7 Jul 2026 06:35:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	k1hNNt27jWnOZ+OiFVXad0UrkLnA0nIc+AMtFumubcc=; b=mRdrq3NMFT+VnlSb
	w6rT/DTseWlOJmPZUsJA07GNfNipWMsr0SdudKl0XZMa2ObJ1aHHB2C8p/JkOnY9
	7gheAQ2morNwNeQOrvfPzn89BMA5gZ9SxtDO/q+9nfOQ9oomdrkv3FAvmRpy3b3u
	69PUf20cmZD2+0KqJe52sruINhsBGJPxyy+HSstX3Pjkz9DmInogsaiyV8ARoJ9T
	vpgOlCPeEi8raijSMC4f/UXQKYyL8bRaIYfytdNNr2/+Tkz11Lnj4TSWAXd5/GmB
	2Vq3Bo5X6WtHFyJk9oNypiYzlFpBcKj4C700iCKSfAiDC3DieqOlVzVpKUZKXbeo
	fidEsw==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8fdw2w0b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 07 Jul 2026 06:35:49 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-846f50381a6so3271600b3a.0
        for <linux-media@vger.kernel.org>; Mon, 06 Jul 2026 23:35:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783406149; x=1784010949; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=k1hNNt27jWnOZ+OiFVXad0UrkLnA0nIc+AMtFumubcc=;
        b=CEKYxWSOia0z7qCfEKuu7ODORi594B47VwJ/oWFjRratXan9IErVj5FNGMthj+UxwJ
         0F/EQEZtPC07K/x2nInLtMVCtKglf/8CqjfFNaC22VBpmhNqe0DYOAKvuDewYghYnBbT
         dHWUb3ZURdtv/UaxHVVV5izLmABl/MsMmwq5V8Fvr+ZRe5L8Yo6ZrQnsuS1mSj88cPJZ
         y1HFTRdc7pK5OmY7LIDxVAaPTYDG8KsLjwztwm84I3tEU9Bvwh/p4tXiflkBD/usFhl7
         wbrUtUegiMdxSfKq0evn2rMFXFT0xC9VNq+s4wTlFPa6UsTx1OkWVstFO+oGNXlNovMO
         Iv+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783406149; x=1784010949;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k1hNNt27jWnOZ+OiFVXad0UrkLnA0nIc+AMtFumubcc=;
        b=Wn5nQdoZ9cyuhyrw/TqZEzwVg72p2MDWqCoLAFfd0dvp0YKPgX/4Ms1BHTdA/CnD8u
         3/N+LRr2kh6CNeOQE32mixly8J9evgefpN8o3LBYjDp5mOjWcYOGAWFj7u+te+RT8f2l
         xhgjhl34rrFUtA4KJjcst4QVVHL2yuC0KhuXeYtMbnc/Mq4+ypTikHuuqVOUWnfCpZY3
         unxgRJdg169NJ0QgaryFsGKliNKpK8yLXrs/5P3p8dAfekU8piMLTPm9BD5rsBSgQXLM
         eXuDU1xHsIep/kk1xnZl4QnOO2DoYTSzPnjkiWJA3cnzLEV+CMFocNFlE3YgYC3rh2C/
         GXwA==
X-Forwarded-Encrypted: i=1; AHgh+RrAesO0BBDIUhFo05uOO0tWStHe4aAUwl51OwA3fJ7YhC0rlBX8tcGs0pTyRQ1hUPrpxZpB654Edssq7g==@vger.kernel.org
X-Gm-Message-State: AOJu0YyKbvSJOXeQJ+7MKRVFDzAExIZ0KREqnnX8wvXH02C5BApA1NER
	YD74GeaU0tWhgNXbH1s+V1CT3Z24KQG9MxFDID/CtaDf2a91NiTVy+BvOIX6pIaRN5ivoyn6I43
	7RXkJOEB9D48YBuZDLImRcOjMP7G7coJa42GLP5rxwehCWOiYUhMEttUgB5Ganmye1A==
X-Gm-Gg: AfdE7cmj8xZ7FZ8MUWm9CPqQESND1tdQX3yUIc9i5f+fkwse/C+WUlGuPZjGesDsnSP
	tu6I+xYAmKiKhGKBzECzTgGZu/ChvywvPLJcxgjEQ1RV4En08LbYyxWBoBMYslMR7ZwzRcJcYCf
	XRZt/3JtnpTnEekwaSLIK2vxXKvB44C3SJwWq5y4tMgwh4E7vMskdQT8j1qPSvBO+rrYOyDOGzP
	yhn0QqzMwgAwSNZOpoFvoGJAbAgnYnoBQvNnhHKpvIbF+3APfekLm7dsBEEDrn1jXR+dUXH69s0
	hxY0u+u7GVkPOP/ROvpqpYIru3V9Mb4sGJnyRZpnZBgdnWJsuORGM/t7L9uTnjinrOq2FeTu5Pu
	V+lABSt0N1zV7v38XBCbOvwxUt5rykPaunf3yxmshrc/x
X-Received: by 2002:a05:6a00:1796:b0:847:9c3a:b77f with SMTP id d2e1a72fcca58-84826e28b2dmr3860444b3a.35.1783406148991;
        Mon, 06 Jul 2026 23:35:48 -0700 (PDT)
X-Received: by 2002:a05:6a00:1796:b0:847:9c3a:b77f with SMTP id d2e1a72fcca58-84826e28b2dmr3860427b3a.35.1783406148494;
        Mon, 06 Jul 2026 23:35:48 -0700 (PDT)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6db29d1sm4889973b3a.53.2026.07.06.23.35.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 23:35:47 -0700 (PDT)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Tue, 07 Jul 2026 12:05:23 +0530
Subject: [PATCH 1/2] media: iris: avoid bit depth validation for capture
 formats
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260707-qc10c_fix_and_disable_time_delta_based_rc-v1-1-33fa130bc535@oss.qualcomm.com>
References: <20260707-qc10c_fix_and_disable_time_delta_based_rc-v1-0-33fa130bc535@oss.qualcomm.com>
In-Reply-To: <20260707-qc10c_fix_and_disable_time_delta_based_rc-v1-0-33fa130bc535@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>, stable@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783406138; l=2154;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=r0NQcgVWIF3QYqJ4mnNHJAILzS2N4Wgq7EHm3cD0oHY=;
 b=YS5HcCYaIYKbnA2YywI0czjqnCJmNdxLlZ+W2pdvia8EPCS4vQVHLoCFE2MM9nQiN0XmHTWIh
 7q+B+yp7A2bCuLcXTBI6mN3HIW7Hr0KX3iaqo9/OFldGVZYJN8uvzbO
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDA2MSBTYWx0ZWRfXzPyP86LJv5pU
 MFEdoFA2TrFpyCPqOxZDf+0P9dkmgBgUXKfGwbKOjU4EtBV3LsohBZX27elZhV12KXvp3b8yPNp
 6xqlZMmXQUquNCIyYc6Ht5QXz/TqbWk=
X-Proofpoint-ORIG-GUID: nS_qmqjx1BW9pGa39slY31oFA995FECk
X-Authority-Analysis: v=2.4 cv=EtziaycA c=1 sm=1 tr=0 ts=6a4c9e45 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=vL0Q6q4W2X9FnyRf_zQA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDA2MSBTYWx0ZWRfX67AMt9LzP55P
 XnaC4vwhsttfjR5u6vrJ9BA0olqMDOXnUJvpQgLjCo8n12f+KEnZeWqtO1I79GEYP65md7ojgmB
 LxUi1P9cowT3cUCxFadgsLN4UDcCQPwHz9bfN/78/C0exhiLIhNcrcHkv6y9EaPFxol74xZFGRm
 eDVv14lEmHXopFe2Cy/U1Hyk2q2UkjmQvYSpFaXD6M/D7xtmYh8HFfTEQt0IMdh9OHo5bSk0Qou
 Q384pL7FQCpnzzE+OAB6Bt8tCqjTo+/v0nLa9F9oBHUNe3+O53VduWnHbOqWn1jJwGtgZBR+NIo
 /ZO8oK6LlpaOiB6UAMNlIMY6V6vOXDXDswoOK45QnwItyuPGhfhtbxyUEmZLAgw5DANGU0HJEnY
 L53G3AqHLpWar1H0p+L8ddi7fjlskkZNLgYvcA4X15Zy/P+2TsnHCIqHRaEanyukC1tdhc8YChu
 Uh4bKRg5145b/wWxiHw==
X-Proofpoint-GUID: nS_qmqjx1BW9pGa39slY31oFA995FECk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_01,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 clxscore=1015 adultscore=0 phishscore=0
 spamscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070061
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-66808-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:vikash.garodia@oss.qualcomm.com,m:dikshita.agarwal@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:mchehab@kernel.org,m:dmitry.baryshkov@oss.qualcomm.com,m:neil.armstrong@linaro.org,m:bryan.odonoghue@linaro.org,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:busanna.reddy@oss.qualcomm.com,m:stable@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[busanna.reddy@oss.qualcomm.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[busanna.reddy@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 938D7718098

When validating a capture format, check_format() compares the requested
pixel format against inst->fw_caps[BIT_DEPTH]. However, the bit depth
capability is not available at this stage and it contains the default
value of BIT_DEPTH_8. The actual bit depth is updated later after the
firmware reports stream capabilities through read_input_subcr_params().
Because of this, a valid QC10C format request is rejected during the
initial format negotiation. The driver then falls back to the default
capture format (NV12) and stores it as capture format.

Later, when the firmware reports that the stream is 10-bit, the driver
sees NV12 as the selected capture format and switches to the default
10-bit format (P010). As a result, the original QC10C format requested
by userspace is lost and QC10C decoding cannot work correctly.

The bit depth information is not reliable during the initial format
setup, so it should not be used to validate capture formats. Remove
the bit-depth checks from check_format() and only verify that the
requested pixel format is supported. This allows the format requested
by userspace is handled correctly.

Fixes: 20c3ef4c7cae ("media: qcom: iris: vdec: update find_format to handle 8bit and 10bit formats")
Cc: stable@vger.kernel.org
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_vdec.c | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_vdec.c b/drivers/media/platform/qcom/iris/iris_vdec.c
index 9e228b70420e..7f89e745a4b1 100644
--- a/drivers/media/platform/qcom/iris/iris_vdec.c
+++ b/drivers/media/platform/qcom/iris/iris_vdec.c
@@ -95,16 +95,6 @@ static bool check_format(struct iris_inst *inst, u32 pixfmt, u32 type)
 	if (i == size)
 		return false;
 
-	if (type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE) {
-		if (iris_fmt_is_8bit(pixfmt) &&
-		    inst->fw_caps[BIT_DEPTH].value == BIT_DEPTH_10)
-			return false;
-
-		if (iris_fmt_is_10bit(pixfmt) &&
-		    inst->fw_caps[BIT_DEPTH].value != BIT_DEPTH_10)
-			return false;
-	}
-
 	return true;
 }
 

-- 
2.34.1


