Return-Path: <linux-media+bounces-57731-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0J5UFJp7y2lPIQYAu9opvQ
	(envelope-from <linux-media+bounces-57731-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2026 09:45:30 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B53223656D2
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2026 09:45:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CFF7F308DFD9
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2026 07:40:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78B523CE49F;
	Tue, 31 Mar 2026 07:40:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mFQ0Wlje";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="G/84N8bs"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA0353CE4BA
	for <linux-media@vger.kernel.org>; Tue, 31 Mar 2026 07:40:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774942816; cv=none; b=VNT+2XtviDUqr4qSDwhuQvD8UuJQhKWUwwjghg7YTeZj5npWNp7wqzotsbQyE03BQ6msf11gk9Qr0AlVJVXszkzXqcrxCcAg85CBYL40ZiQnX69kOE9OYbtNkjLgEYRwFEp4vxQ9gaPxqj5bay1qZqLJCAdxc8uDpYK6qO/rmmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774942816; c=relaxed/simple;
	bh=o9pxdPoJfkiELITVw7ZSpLtjExuHdSfKJ0n0DkpmG+o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LCOlrSQElOH8OG47LiOY7O+Sd0i6av3KgRoGCD+hdYidjy3wj8eIeJWoDvh8wNeEnJ/MT1Uj+zNGsyQ5SHgwLb1NkxA+usefExl8dEmxKTfS5rvdsWknWVeCZkHQCKPFMoAPC3QBR6HaFhL5DUU9jipnCUCYbqfQbSPi3Dclk4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mFQ0Wlje; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=G/84N8bs; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62V4XtNf4053783
	for <linux-media@vger.kernel.org>; Tue, 31 Mar 2026 07:40:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vYxV75Z4wnjwOVaThSDC96yl6BuVtN/GBJ2eo+yQEEk=; b=mFQ0Wlje/IjzSQAV
	W992CMCSf63T67Bf71/26I9KP2l0miWOncgv21NoY+yIr7e0hg1L8Fkyc8oer9Bl
	PMrdwVlOU6Tl7txy0SxUqVmeK8Lix0EPQ7Q/54EJLTJBJrpdWmOeI3kWCrL/iOFJ
	n67fFZKF4cv0Rw2/rzrgOQ2q/fQSvf8UT2XVgTEP5PdG/kogsjrzbrwts0VwG2DC
	IX9kA+6dmUxINtlis3JRzGT+jS/0+jIxcnEFdVEQ/wj52JmVz/droI0LgE0SnRdL
	WxZi0oOwtxUgilB8E+EAaVE1CfCh8+A8NxAsTis/vE0PQmo6FeQoYBbcXUlED+w2
	D1EO5w==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d7xx3aby3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 31 Mar 2026 07:40:11 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-35dacc40f92so1785523a91.2
        for <linux-media@vger.kernel.org>; Tue, 31 Mar 2026 00:40:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774942811; x=1775547611; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vYxV75Z4wnjwOVaThSDC96yl6BuVtN/GBJ2eo+yQEEk=;
        b=G/84N8bs0KnDAReGc5giJdv20+nrZMtcQOlg8vnkYX4JR3M9D7VTRzCsHc1mZNqfnY
         wRp+B3xxt07U7FsgisaHOl+d/adJNNcZicGfrxduawdT3VxchwKjkuMeQLgQp4tjDleL
         xpLVMt5RQdXKfJIPmDgWb+LcfSYxFRygXGtRPly2kt+k/CUDgUIHI9t3elCSVOi4yAw2
         BhCfLDqU+e+JBGA6oY01bYIMF/trYAsL0XpoljGS1CPqCp9a0vzV+zmJRDgk6pxSB0Fw
         fz5NGZSnTQfVsr2Xju2nKNzyBOFTLzWaIJlBjLZN6dNewRKACx5LmFuqBIuTXjiHSX/p
         yiBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774942811; x=1775547611;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vYxV75Z4wnjwOVaThSDC96yl6BuVtN/GBJ2eo+yQEEk=;
        b=HPsy2UgygCxcLfio9kLMw1VqreNlG7Amc2SNLGTwbNMEkOchf4C47aklImBwGfg+fA
         ORo4VwrUsVw4eI7FvJN6bHdzi5Ypdz/hAVFl9gU+zhmEOXz+IF4j/6MOK/AEII/+2f40
         xFiiRdnL/SFs5uy9HtOIV7vrSERjokCAomo/IsAf+4vENSzyU6WNVcGM0VFwMTo+07Xu
         ocZ1btwdu9fKfaUncs6tNmaptzC4liCrHCGET6AANrMxbKQaTz6F4f4uuOTbLcNp7Vgp
         /cuDLp9o3S1UWoH608oWfb5Wes92WfecLiezHLCAi/Gk7CYjWb8yPu2Nrw4nU64oQQCr
         udEg==
X-Gm-Message-State: AOJu0YwAWgnL4Y0SEHDWl3jEJ7cmXfhXKFgcKy9cLfIJH2F6aWWpYaOv
	YdKQ5U8Gnll9trslGyDgIIPzDIO2/Ovj6p3Ik4gDrrx1uYFm9czqRK5nKSWx9XN9B4lQ6G0Fd0a
	4SSKfvw3nIi4W5WiKr6F50XwKpuciRoqMw7X/OdH8/1jcRvPVwjCDrkB65XX3sBct2w==
X-Gm-Gg: ATEYQzwooEFBA4zWg6Xo3D2eljlS9MvNOXTRuGbL9QtUPRWCtOTfRd5R5s0DyTzSsmM
	NTdMvD70EiYi8bxSz0EG96YMtqmomyjKM4C6N4ZbFsqPQPBOfDYdFnBcLk5rgKGlWh2izfU4zW+
	xDjyhI+L4zruzQs5Z67UtNczNUqrw1LpEiL/B2gdvLEISmgk3SntgeyO6hJoXMoblpM4DqXWSI1
	KYz9x0UWj8BoP+7vCvyaXfdFeYtoit8PJoJ59WP7+25LMIQk1WByR9tXLZgHxahPEMWd23+KL8T
	TIrRv5tBFkoFIW+jxqI1uC1SITxsPUMqjHUeDBcI4Wy5cq4YYAzDkNbqViDNQkK9ZnBia10Wz5V
	+Cl6N6UiFAJVCcDfxHCIIOBa6SDfIsizJU4+pFApkW40oZzWs84/XBf//Ufg=
X-Received: by 2002:a17:90b:2d90:b0:35d:a2d3:5c31 with SMTP id 98e67ed59e1d1-35da3e1da37mr7569997a91.29.1774942809785;
        Tue, 31 Mar 2026 00:40:09 -0700 (PDT)
X-Received: by 2002:a17:90b:2d90:b0:35d:a2d3:5c31 with SMTP id 98e67ed59e1d1-35da3e1da37mr7569935a91.29.1774942807799;
        Tue, 31 Mar 2026 00:40:07 -0700 (PDT)
Received: from hu-dikshita-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c76916baab6sm8013076a12.2.2026.03.31.00.40.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 00:40:07 -0700 (PDT)
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Date: Tue, 31 Mar 2026 13:09:56 +0530
Subject: [PATCH v3 2/3] media: iris: Initialize HFI ops after firmware load
 in core init
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260331-kodiak-gen2-support-v3-2-958296fab838@oss.qualcomm.com>
References: <20260331-kodiak-gen2-support-v3-0-958296fab838@oss.qualcomm.com>
In-Reply-To: <20260331-kodiak-gen2-support-v3-0-958296fab838@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774942796; l=1626;
 i=dikshita.agarwal@oss.qualcomm.com; s=20240917; h=from:subject:message-id;
 bh=o9pxdPoJfkiELITVw7ZSpLtjExuHdSfKJ0n0DkpmG+o=;
 b=YhtbDfKazact3rpzFkaBQzq06718OGM0mYT7j51SsFDEOAsb85TkzJJMAyBJqhlifjdvNbnzq
 FPqawSWsSJPAdr+7wH1zOVEs8s14fC4fmIHnWakO2ax8j68xFelT+Qa
X-Developer-Key: i=dikshita.agarwal@oss.qualcomm.com; a=ed25519;
 pk=EEvKY6Ar1OI5SWf44FJ1Ebo1KuQEVbbf5UNPO+UHVhM=
X-Authority-Analysis: v=2.4 cv=ErbfbCcA c=1 sm=1 tr=0 ts=69cb7a5b cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=u1mmxsKKFvk7TXqck8YA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: lp5ezuWVWuewGvPCz8L3ublkd8TIsqC7
X-Proofpoint-GUID: lp5ezuWVWuewGvPCz8L3ublkd8TIsqC7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDA3MCBTYWx0ZWRfX75nk4dwBO/uP
 G2RudIa/f+cjpCc7q2C9kFt4ZvX6dOfueHLmlBRod9Sgj3B3jfAL7idu8zydeH8k+E7Y0EWUvOk
 tVyW3mqcQTRTmGV0TX9/CJNPzBspf8bdbtCp/dJnV6hsdf2UIUss7FZJFR41fC3qqWu/Chur3Rw
 izQAxNpVq4439kZLT+di2zBd6J1g3UFVNcXdZYh0z2CLZnd6UFcGnmGaEbePpqeMhebKkMD3xRo
 e3MHZNC/jOUjmzA+KNhd6kYTNxFJlM8bnCh9VMM/Wn8Ks6zf/P4TbK5t2lZHAWxh0ywKxtYMgrO
 0H023KeUxIlMErQaMlYOo8IB9yBBBwT3UPiSNoLqf7f+AE8JJmw1ka9PNDnAXT9STAGn9T4F/O9
 VCiQUzBrDBKlW4u51DJA24w/GD1JjGgOe3C6lwGMgXsboGPWFGLRbi+TtOBA3nWDzBsN0G3A6rM
 zH4Rcy46vdxJApLSRrg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-31_02,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 phishscore=0 spamscore=0 lowpriorityscore=0
 suspectscore=0 malwarescore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603310070
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-57731-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dikshita.agarwal@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B53223656D2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The HFI sys ops were previously initialized in probe() but, we don't
have firmware loaded at probe time. Since HFI is tightly coupled to
firmware, initialize the HFI sys ops after firmware has been successfully
loaded and booted.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_core.c  | 2 ++
 drivers/media/platform/qcom/iris/iris_probe.c | 1 -
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/iris_core.c b/drivers/media/platform/qcom/iris/iris_core.c
index 1f326f696d08014f5ebfeb0b99cfed70665fd6ab..52bf56e517f91e98569ee02986183971266e1c76 100644
--- a/drivers/media/platform/qcom/iris/iris_core.c
+++ b/drivers/media/platform/qcom/iris/iris_core.c
@@ -78,6 +78,8 @@ int iris_core_init(struct iris_core *core)
 	if (ret)
 		goto error_unload_fw;
 
+	core->iris_firmware_data->init_hfi_ops(core);
+
 	ret = iris_hfi_core_init(core);
 	if (ret)
 		goto error_unload_fw;
diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
index d36f0c0e785b7de0e3527e0a824942db0fb79133..dbc15edc602b72fdec8bb2d8d3623676afee728c 100644
--- a/drivers/media/platform/qcom/iris/iris_probe.c
+++ b/drivers/media/platform/qcom/iris/iris_probe.c
@@ -266,7 +266,6 @@ static int iris_probe(struct platform_device *pdev)
 	disable_irq_nosync(core->irq);
 
 	iris_init_ops(core);
-	core->iris_firmware_data->init_hfi_ops(core);
 
 	ret = iris_init_resources(core);
 	if (ret)

-- 
2.34.1


