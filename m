Return-Path: <linux-media+bounces-67210-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Rp7NIxX5T2plrQIAu9opvQ
	(envelope-from <linux-media+bounces-67210-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 09 Jul 2026 21:40:05 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C8A573517D
	for <lists+linux-media@lfdr.de>; Thu, 09 Jul 2026 21:40:04 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=URywAtA6;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=EYjRXHu0;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67210-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-67210-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 47359300B83A
	for <lists+linux-media@lfdr.de>; Thu,  9 Jul 2026 19:37:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0FCF3D16F1;
	Thu,  9 Jul 2026 19:37:24 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3143E3C3458
	for <linux-media@vger.kernel.org>; Thu,  9 Jul 2026 19:37:22 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783625843; cv=none; b=DRLnDfS2+PaEgxgB4mWLc5NfH4jBuKJHE8se1djlqBzyqp6S44TLBha85L1LjT8AyybZzEf78K4WJBit5bsHEl7MbUmD7Trtveu6GXJWRvCvz9tx3cpm78l71cVqLgcrhqhCZB3vbLY7qQAZIs1JUIWnuz6tb4U4QPtPb10fzN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783625843; c=relaxed/simple;
	bh=ExR6aYJGUABcfgsgorOmvfya83WqhibhOuJ6YBT96Mw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oMnDDFvH8pF9rV8zqb6i7u7A240xdWSAbJOTv73sfYZCLnLKXBg7UuhdDf6wGgYJhfDA80qG4HK/qBD0aEtVtTVn5chDUna1+jcLyurmj7PMv/Mg4gk5WVZzihJEBHaFqUlquCsmwfzypH+4DGmfZIH30lkAjbQwbTBpDL5/r7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=URywAtA6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EYjRXHu0; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669HXKDK2518781
	for <linux-media@vger.kernel.org>; Thu, 9 Jul 2026 19:37:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Im/jOe8hqK6N5FZ+1qlvzsp8eel4l9P8JPFSMrxcQFA=; b=URywAtA64IyXNcbq
	I2ogQBxxOv0MhB1ztEftPAS9xS14d0nPiGJrtAowqoYovUGhFfXQcuEyEpGhxL5X
	jhx2J1gFzpKaNdhdJgy8P1x+H+vKp/vtL9IUzfZpe6okcHEIFumWKBk2wkcqROLJ
	9MdHC9ueR+hOyHG9GKp9qivwdxilQ/LmOXWu/BXuGu4ZHsqNR+9ebi7Pv6qDLisK
	AnsXeNHTIYxvNxz3YGxbGFvzdZIjJNvRMxG12BmaX+JltD/YVOw75cb7shZWztLu
	E8edS9EpX+K67utVfEAmiVGrM9F1weLXoHwE/WFUoZb3Bf+In0vLIu5IsXIULkz6
	dk6xmw==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4faekn94vu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 09 Jul 2026 19:37:21 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-738105fa48fso194444137.1
        for <linux-media@vger.kernel.org>; Thu, 09 Jul 2026 12:37:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783625840; x=1784230640; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Im/jOe8hqK6N5FZ+1qlvzsp8eel4l9P8JPFSMrxcQFA=;
        b=EYjRXHu0wtk5PBh7gTIGS142wyz3TsbKJyqWp5X2xRe2sFG/acdSTIiXX6b6Uio/dB
         cAWbmZfL1pd/79wOtKkHYbByR+m9NtVTRA/sEF40rHHVwe72IZ8GEA4wCAqIINQLBnis
         8f+jP4F3ptQCpTUWqAryZFJxp7m2iImY6E0pPeD1OkCFbtqDeGliV/LluB8kMXwyeOK2
         yjODldNutISKhohfs/pmSGZmiyF2R8v6j2ggXzfWWsZ7DeStG8UE/DCmBvjI16WK6D+H
         6RQTEuaXMZiUFOcfsJMZsWL70S2TVJob0JpMTsJq48UH2HrkhIyJqlWV6HlKEWkBeXta
         LzSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783625840; x=1784230640;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Im/jOe8hqK6N5FZ+1qlvzsp8eel4l9P8JPFSMrxcQFA=;
        b=KApPZZU7zZm6UsgcXeKiWAf6/AtzTHmA3cRew6/IKzTuwWfZZyyCLUd72DlLVdydMz
         EY0tqFuTsBKzKi2P808ZdYg1BtPQbCGs3JAcs2MxlnzMF6wP9lUZkhD8KHxebmQK3Y/j
         CHpIe++A6gUG6wXnxt82KiCNK0QHqZSZu9MprY6PUVXYdG2+SrolshxvZuMpR/huh2gn
         5QKjeIsdGkv/TeEDY0AnDQwxaL+103WN9pdFT4JixZ3B5C1X2lsldaCKztnGJIN18IUl
         Hys0+VIu/ONwZLTyBpfpd0XFWq/HrNjiByI0UQlg9gbT3+wPZtkNqqEAwqO+AbxSxvI5
         CJjg==
X-Gm-Message-State: AOJu0YxVC8nq0BMeKaYSZZWrBIF2Fu+8scw8nFpuP+rY63h7IFSuPxuf
	Hnc0uTRawZNSIEboXre+B0XJcF7h+JFdXZk8X490YQwwUTlEpbJbJgfPsX9DCdMaub3e81unJqf
	RSB3Cg+OX8R6Kxv5Dpx6wTC3P0fra7I33x2T0UlN0xQ+U+YKJRvEN6IK58kXUEoN3+g==
X-Gm-Gg: AfdE7ckNcEcO0+zuc9OV57c41GVepirCvBZJ28NighHtsU6+XdSVi02lPv7qC9PMrdr
	DnLcXoIV+kksVlkyIhnX+U9bIpW9cRRVIc20lS7YRyyJ20q8yqXP8OK14tmq1Q9uoj5zeZq0SIE
	Iwc56SyhaYiU6IYejM2WZgv3WpprSyU2rRfU0iII0oigAfegl70dJR5/AsxmiV5SfyzhI2nSknQ
	ydeALXpdxA8z7qAGK7/MJq4HbqjMyaENI8a1K+U9pYouBL4ZqsgNgbCTfU876mBV+1/nuv8k4M9
	WBRVFTD0KlLm4wknIBYwtgPea6KCeiFqFi+29UhAYTyMsLkS9amSiaTsY32yuN35AAYMhekJ3oJ
	zs5c5ZpCAvvmZXnRNCGzjMEGKh7ylQsqenDuh0NYifL0q6zaIe7O4CklmLhBp9qBc35YGk6dlpd
	ems8O7rUrXnCKP3IW33AiAMlrg
X-Received: by 2002:a05:6102:8195:10b0:737:edda:e7d7 with SMTP id ada2fe7eead31-7450c6bee37mr318713137.1.1783625835571;
        Thu, 09 Jul 2026 12:37:15 -0700 (PDT)
X-Received: by 2002:a05:6102:8195:10b0:737:edda:e7d7 with SMTP id ada2fe7eead31-7450c6bee37mr318693137.1.1783625834987;
        Thu, 09 Jul 2026 12:37:14 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b01caa635dsm46400e87.62.2026.07.09.12.37.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 12:37:13 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 09 Jul 2026 22:37:03 +0300
Subject: [PATCH 6/9] media: iris: add VP8 decode support on Gen1 firmware
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260709-iris-vp8-v1-6-6af3ab578a7c@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=10875;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=ExR6aYJGUABcfgsgorOmvfya83WqhibhOuJ6YBT96Mw=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ5b/j9ilSr+fnz/yWEr1YJ6P3YmQQ9eL1lRorXfds2NFY
 /XMqzydnYzGLAyMXAyyYoosPgUtU2M2JYd92DG1HmYQKxPIFAYuTgGYyF499v+OqhOz7TjWn92u
 p/fo+MuNmZmWCQe3BhSZr4v+1rv09icj6xV7GeNcFX0473blClU/8tX+ViDztSzwYJzPoZ2Kr40
 feE6I+Oba/k6cNe7olD2v779RPTLhBqvc0Y+NvaJqgTpha7P3Bqy0N2F9cox7p+bH8L7W1VXKIS
 y5ec3vxFnWcd8r5S4yysg4/UTjyRLeXBarmBXWd6MOTfvSrW9x1fTS4opXWn8k8/h6NSc1dv7eq
 XhNvjCzizk871K5k6ZO0cfr5XrpXKIaV/z2LMo33KuuEb/mlaiY3z31ha3OF8618D1j1tpvI+Xd
 oWecf/53waI4u0Yp9W33k9MWfb8kEMFa806Q87GGyAlTAA==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDE5NCBTYWx0ZWRfX4HJXII1BoSgu
 BRsStdkcyoDPYIDFwFGcjXd9BSAvQySZQ0WoU0Gh2pn12UooZWquyRBPGpB8AOh9cqZq2bzWIGX
 JKH5K4gUZ9SE1QPkrs24rwIPwT1H1kI=
X-Authority-Analysis: v=2.4 cv=SNlykuvH c=1 sm=1 tr=0 ts=6a4ff871 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=hIvao4VD2mfccuCEdWcA:9 a=QEXdDO2ut3YA:10 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-GUID: KQQ1p0y9dJ5uAVn7VCEuZSOP4PyCRNyL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDE5NCBTYWx0ZWRfX7JCg102gWynL
 XSJrL7DSxB4Asdx79wJ9jTGzXZNqRhZtFnqnjnK5+Ga/9Ngq9e9UhCjb6A0n2UcNJ1heACyXyGj
 suJbcnS/Qs3OyrZqVL5XFwg78plnkLNKjbcOkjRifojyf9EzIiClUSxjUta6cToqfm2O0GRanvX
 U2e6/uAixMtTVjmNBklx17bMWKj9Tej0c/kKR+3a78P5/qM4/dLrR8mlWnmD2zDUnJJp48vtwEM
 WANyTfBiL+3eiX2HOh6gjQ+bryCJgxNSEgXMaBle2oajKGiYSSEeLZs+uf05e9Za5Nyo0/8Uxvi
 Y5ijs+A6/gdT+qjYNLF9a93rWxuu6GQLhcUP0g5l9d0RQL0mKDKCRZ5iT61rIVGw75AIyqQboni
 rEDGAFnL7nF2PJtVNjSIfyklM7VI1AB8V5KgIiAl0vgFiGb2VK70cnNMlWyYs7Ay4ptVk9Rfiyy
 DTUSOrxsZ0GoWVZIURw==
X-Proofpoint-ORIG-GUID: KQQ1p0y9dJ5uAVn7VCEuZSOP4PyCRNyL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_04,2026-07-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 impostorscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090194
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-67210-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:vikash.garodia@oss.qualcomm.com,m:dikshita.agarwal@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:mchehab@kernel.org,m:hverkuil+cisco@kernel.org,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:hverkuil@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9C8A573517D

The Gen1 firmware supports decoding VP8, but the iris driver never
advertised or wired up the codec.

Add the VP8 HFI codec code, map V4L2_PIX_FMT_VP8 to it in the Gen1
session open path, and compute the VP8 internal buffer sizes (bin,
collocated motion vector, line and probability-table persist buffers,
which reuse the shared VPX helpers). Advertise the codec through the
Gen1 decode format list and register the VP8 profile menu control.

Assisted-by: Claude:claude-opus-4-8
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_ctrls.c      |  7 +++
 drivers/media/platform/qcom/iris/iris_hfi_gen1.c   | 22 +++++++-
 .../platform/qcom/iris/iris_hfi_gen1_command.c     |  3 +
 .../platform/qcom/iris/iris_hfi_gen1_defines.h     |  1 +
 .../platform/qcom/iris/iris_platform_common.h      |  1 +
 drivers/media/platform/qcom/iris/iris_vpu_buffer.c | 64 ++++++++++++++++++++++
 drivers/media/platform/qcom/iris/iris_vpu_buffer.h |  3 +
 7 files changed, 99 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.c b/drivers/media/platform/qcom/iris/iris_ctrls.c
index c12fe724dfb8..1bd6460a1b0a 100644
--- a/drivers/media/platform/qcom/iris/iris_ctrls.c
+++ b/drivers/media/platform/qcom/iris/iris_ctrls.c
@@ -28,6 +28,8 @@ static enum platform_inst_fw_cap_type iris_get_cap_id(u32 id)
 		return PROFILE_HEVC;
 	case V4L2_CID_MPEG_VIDEO_VP9_PROFILE:
 		return PROFILE_VP9;
+	case V4L2_CID_MPEG_VIDEO_VP8_PROFILE:
+		return PROFILE_VP8;
 	case V4L2_CID_MPEG_VIDEO_H264_LEVEL:
 		return LEVEL_H264;
 	case V4L2_CID_MPEG_VIDEO_HEVC_LEVEL:
@@ -171,6 +173,8 @@ static u32 iris_get_v4l2_id(enum platform_inst_fw_cap_type cap_id)
 		return V4L2_CID_MPEG_VIDEO_HEVC_PROFILE;
 	case PROFILE_VP9:
 		return V4L2_CID_MPEG_VIDEO_VP9_PROFILE;
+	case PROFILE_VP8:
+		return V4L2_CID_MPEG_VIDEO_VP8_PROFILE;
 	case LEVEL_H264:
 		return V4L2_CID_MPEG_VIDEO_H264_LEVEL;
 	case LEVEL_HEVC:
@@ -558,6 +562,9 @@ int iris_set_profile(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_
 	if (inst->codec == V4L2_PIX_FMT_H264) {
 		hfi_id = inst->fw_caps[PROFILE_H264].hfi_id;
 		hfi_value = inst->fw_caps[PROFILE_H264].value;
+	} else if (inst->codec == V4L2_PIX_FMT_VP8) {
+		hfi_id = inst->fw_caps[PROFILE_VP8].hfi_id;
+		hfi_value = inst->fw_caps[PROFILE_VP8].value;
 	} else {
 		hfi_id = inst->fw_caps[PROFILE_HEVC].hfi_id;
 		hfi_value = inst->fw_caps[PROFILE_HEVC].value;
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1.c
index 8119c639ec24..4c3aa5a03ddd 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1.c
@@ -30,6 +30,17 @@ static const struct platform_inst_fw_cap inst_fw_cap_sm8250_dec[] = {
 		.hfi_id = HFI_PROPERTY_PARAM_WORK_MODE,
 		.set = iris_set_stage,
 	},
+	{
+		.cap_id = PROFILE_VP8,
+		.min = V4L2_MPEG_VIDEO_VP8_PROFILE_0,
+		.max = V4L2_MPEG_VIDEO_VP8_PROFILE_3,
+		.step_or_mask = BIT(V4L2_MPEG_VIDEO_VP8_PROFILE_0) |
+				BIT(V4L2_MPEG_VIDEO_VP8_PROFILE_1) |
+				BIT(V4L2_MPEG_VIDEO_VP8_PROFILE_2) |
+				BIT(V4L2_MPEG_VIDEO_VP8_PROFILE_3),
+		.value = V4L2_MPEG_VIDEO_VP8_PROFILE_0,
+		.flags = CAP_FLAG_MENU,
+	},
 };
 
 static const struct platform_inst_fw_cap inst_fw_cap_sm8250_enc[] = {
@@ -423,6 +434,13 @@ static const u32 iris_hfi_gen1_dec_fmts[] = {
 	V4L2_PIX_FMT_H264,
 	V4L2_PIX_FMT_HEVC,
 	V4L2_PIX_FMT_VP9,
+	V4L2_PIX_FMT_VP8,
+};
+
+static const u32 iris_hfi_gen1_ar50lt_dec_fmts[] = {
+	V4L2_PIX_FMT_H264,
+	V4L2_PIX_FMT_HEVC,
+	V4L2_PIX_FMT_VP9,
 };
 
 const struct iris_firmware_data iris_hfi_gen1_data = {
@@ -677,8 +695,8 @@ const struct iris_firmware_data iris_hfi_gen1_ar50lt_data = {
 	.inst_fw_caps_enc = inst_fw_cap_gen1_ar50lt_enc,
 	.inst_fw_caps_enc_size = ARRAY_SIZE(inst_fw_cap_gen1_ar50lt_enc),
 
-	.dec_fmts = iris_hfi_gen1_dec_fmts,
-	.dec_fmts_size = ARRAY_SIZE(iris_hfi_gen1_dec_fmts),
+	.dec_fmts = iris_hfi_gen1_ar50lt_dec_fmts,
+	.dec_fmts_size = ARRAY_SIZE(iris_hfi_gen1_ar50lt_dec_fmts),
 
 	.dec_input_config_params_default =
 		sm8250_vdec_input_config_param_default,
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
index ed9fef2aec08..90645ed3e0d8 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
@@ -105,6 +105,9 @@ static int iris_hfi_gen1_session_open(struct iris_inst *inst)
 	case V4L2_PIX_FMT_HEVC:
 		codec = HFI_VIDEO_CODEC_HEVC;
 		break;
+	case V4L2_PIX_FMT_VP8:
+		codec = HFI_VIDEO_CODEC_VP8;
+		break;
 	case V4L2_PIX_FMT_VP9:
 		codec = HFI_VIDEO_CODEC_VP9;
 		break;
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h b/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h
index 2702f255bc04..13c8ff59d6e4 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h
@@ -14,6 +14,7 @@
 #define HFI_SESSION_TYPE_DEC				2
 
 #define HFI_VIDEO_CODEC_H264				0x00000002
+#define HFI_VIDEO_CODEC_VP8				0x00001000
 #define HFI_VIDEO_CODEC_HEVC				0x00002000
 #define HFI_VIDEO_CODEC_VP9				0x00004000
 
diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index 317ba48e6305..84017b66e98f 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -115,6 +115,7 @@ enum platform_inst_fw_cap_type {
 	PROFILE_H264 = 1,
 	PROFILE_HEVC,
 	PROFILE_VP9,
+	PROFILE_VP8,
 	LEVEL_H264,
 	LEVEL_HEVC,
 	LEVEL_VP9,
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_buffer.c b/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
index 88f130d09a6e..ca90414e6c19 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
@@ -293,6 +293,11 @@ static u32 hfi_buffer_persist_vp9d(void)
 		HDR10_HIST_EXTRADATA_SIZE;
 }
 
+static u32 hfi_buffer_persist_vp8d(void)
+{
+	return ALIGN(VP8_NUM_PROBABILITY_TABLE_BUF * VP8_PROB_TABLE_SIZE, DMA_ALIGNMENT);
+}
+
 static u32 hfi_buffer_persist_vp9d_ar50lt(void)
 {
 	return ALIGN(VP9_NUM_PROBABILITY_TABLE_BUF * VP9_PROB_TABLE_SIZE, DMA_ALIGNMENT) +
@@ -715,6 +720,57 @@ u32 hfi_buffer_line_vp9d(u32 frame_width, u32 frame_height, u32 _yuv_bufcount_mi
 	return _lb_size + vpss_lb_size + 4096;
 }
 
+static inline
+u32 size_vp8d_lb_fe_top_data(u32 frame_width, u32 frame_height)
+{
+	return (ALIGN(frame_width, 16) + 8) * 10 * 2;
+}
+
+static inline
+u32 size_vp8d_lb_pe_top_data(u32 frame_width, u32 frame_height)
+{
+	return (ALIGN(frame_width, 16) >> 4) * 64;
+}
+
+static inline
+u32 size_vp8d_lb_vsp_top(u32 frame_width, u32 frame_height)
+{
+	return ((ALIGN(frame_width, 16) >> 4) * 64 / 2) + 256;
+}
+
+static inline
+u32 hfi_iris_vp8d_lb_size(u32 frame_width, u32 frame_height, u32 num_vpp_pipes)
+{
+	return ALIGN(size_vpxd_lb_fe_left_ctrl(frame_width, frame_height), DMA_ALIGNMENT) * num_vpp_pipes +
+		ALIGN(size_vpxd_lb_se_left_ctrl(frame_width, frame_height), DMA_ALIGNMENT) * num_vpp_pipes +
+		ALIGN(size_vp8d_lb_vsp_top(frame_width, frame_height), DMA_ALIGNMENT) +
+		ALIGN(size_vpxd_lb_fe_top_ctrl(frame_width, frame_height), DMA_ALIGNMENT) +
+		2 * ALIGN(size_vpxd_lb_recon_dma_metadata_wr(frame_width, frame_height), DMA_ALIGNMENT) +
+		ALIGN(size_vpxd_lb_se_top_ctrl(frame_width, frame_height), DMA_ALIGNMENT) +
+		ALIGN(size_vp8d_lb_pe_top_data(frame_width, frame_height), DMA_ALIGNMENT) +
+		ALIGN(size_vp8d_lb_fe_top_data(frame_width, frame_height), DMA_ALIGNMENT);
+}
+
+static inline
+u32 hfi_buffer_line_vp8d(u32 frame_width, u32 frame_height, bool is_opb, u32 num_vpp_pipes)
+{
+	u32 vpss_lb_size = 0;
+	u32 _lb_size;
+
+	_lb_size = hfi_iris_vp8d_lb_size(frame_width, frame_height, num_vpp_pipes);
+
+	if (is_opb)
+		vpss_lb_size = size_vpss_lb(frame_width, frame_height);
+
+	return _lb_size + vpss_lb_size;
+}
+
+static inline
+u32 hfi_iris_vp8d_comv_size(u32 frame_width, u32 frame_height)
+{
+	return DIV_ROUND_UP(frame_width, 16) * DIV_ROUND_UP(frame_height, 16) * 8 * 2;
+}
+
 static u32 hfi_buffer_line_h264d(u32 frame_width, u32 frame_height,
 				 bool is_opb, u32 num_vpp_pipes)
 {
@@ -950,6 +1006,8 @@ static u32 iris_vpu_dec_bin_size(struct iris_inst *inst)
 		return hfi_buffer_bin_h265d(width, height, num_vpp_pipes);
 	else if (inst->codec == V4L2_PIX_FMT_VP9)
 		return hfi_buffer_bin_vp9d(width, height, num_vpp_pipes);
+	else if (inst->codec == V4L2_PIX_FMT_VP8)
+		return hfi_buffer_bin_vp9d(width, height, num_vpp_pipes);
 	else if (inst->codec == V4L2_PIX_FMT_AV1)
 		return hfi_buffer_bin_av1d(width, height, num_vpp_pipes);
 
@@ -983,6 +1041,8 @@ static u32 iris_vpu_dec_comv_size(struct iris_inst *inst)
 		return hfi_buffer_comv_h264d(width, height, num_comv);
 	else if (inst->codec == V4L2_PIX_FMT_HEVC)
 		return hfi_buffer_comv_h265d(width, height, num_comv);
+	else if (inst->codec == V4L2_PIX_FMT_VP8)
+		return hfi_iris_vp8d_comv_size(width, height);
 
 	return 0;
 }
@@ -1021,6 +1081,8 @@ static u32 iris_vpu_dec_persist_size(struct iris_inst *inst)
 		return hfi_buffer_persist_h265d(0);
 	else if (inst->codec == V4L2_PIX_FMT_VP9)
 		return hfi_buffer_persist_vp9d();
+	else if (inst->codec == V4L2_PIX_FMT_VP8)
+		return hfi_buffer_persist_vp8d();
 	else if (inst->codec == V4L2_PIX_FMT_AV1) {
 		caps = inst->core->iris_platform_data->inst_caps;
 		if (inst->fw_caps[DRAP].value)
@@ -1101,6 +1163,8 @@ static u32 iris_vpu_dec_line_size(struct iris_inst *inst)
 	else if (inst->codec == V4L2_PIX_FMT_VP9)
 		return hfi_buffer_line_vp9d(width, height, out_min_count, is_opb,
 			num_vpp_pipes);
+	else if (inst->codec == V4L2_PIX_FMT_VP8)
+		return hfi_buffer_line_vp8d(width, height, is_opb, num_vpp_pipes);
 	else if (inst->codec == V4L2_PIX_FMT_AV1)
 		return hfi_buffer_line_av1d(width, height, is_opb, num_vpp_pipes);
 
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_buffer.h b/drivers/media/platform/qcom/iris/iris_vpu_buffer.h
index 2085e316a6bd..684b459c0cad 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_buffer.h
+++ b/drivers/media/platform/qcom/iris/iris_vpu_buffer.h
@@ -66,6 +66,9 @@ struct iris_inst;
 #define MAX_SE_NBR_CTRL_LCU64_LINE_BUFFER_SIZE_AR50LT (32 / 8)
 #define VP9_UDC_HEADER_BUF_SIZE	(3 * 128)
 
+#define VP8_NUM_PROBABILITY_TABLE_BUF (5 + 1)
+#define VP8_PROB_TABLE_SIZE (3840)
+
 #define SIZE_SEI_USERDATA			4096
 #define SIZE_DOLBY_RPU_METADATA (41 * 1024)
 #define H264_CABAC_HDR_RATIO_HD_TOT	1

-- 
2.47.3


