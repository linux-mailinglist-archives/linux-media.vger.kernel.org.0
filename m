Return-Path: <linux-media+bounces-55783-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EPUXLmhwtGm2oAAAu9opvQ
	(envelope-from <linux-media+bounces-55783-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 21:15:36 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FDFF2899FC
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 21:15:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8324E30D031C
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 20:13:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE9A93E5561;
	Fri, 13 Mar 2026 20:13:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bnYJz9Ig";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="T7uTE0mc"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9705F3E51EA
	for <linux-media@vger.kernel.org>; Fri, 13 Mar 2026 20:13:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773432791; cv=none; b=NlNVZwS4fJup7vYI9pwFQvlusS1diHdiSQO4uG+as1zMGLK4FJSCBE2oPdFpl3ub3teqMa0Lg/hWsCrOzUBhirBfTFdg9KLP6dWoiNW9M0Uq9Bxm2fyUBjPA0HJoN7b50BsoJTm1tSHFFuYQfOwSpwvjARakhkzPfzAFDMwnmPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773432791; c=relaxed/simple;
	bh=Knwl9TIGW90PmwXP68VpHHyknWQzY2+lfOIWG1iTcOE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hmW6bcbcL9o+WuPAh6+/ddeyFSfX87L11eN8M8K0JrXJDkhTDVtMa++w0edLL4bnTCUB4bY2Na6ix4QK9wfDTFuDsslAk4I65Fy1LIa1hVnbLF73JNsAohhXm5kxwJ+fCoboiWCU53MWjfigg4m45PU81DQMLIEoZH/Fp39Fucs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bnYJz9Ig; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=T7uTE0mc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62DESYll2262547
	for <linux-media@vger.kernel.org>; Fri, 13 Mar 2026 20:13:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WkIxi4+/C28jrvf8ES6/SIOuPsWcpSdm1apYAbDQVp0=; b=bnYJz9Ig4EiRPQIr
	Wm6fCVOmazLziJByu9poW8VVEJWSRwWYqphLwEWDp8pHS7bXrljQCPdd/eb3pc0c
	7ezRVMbyp4zwh9XPYbVlLMUETlwWalbQXSIqET0pLDb67ypEuk15iwW2sO4yZKvn
	OViKJ0mnN52fTKW/GNkxsg7eHia/OAL0xckza25KJe/cf0zjAVDFYygK3o2bCsFx
	Ejyo/0jthni9LExUw6CYIEwaL5zqn6EiLjH36kb6bkjCNxQ7eVI1QEeUX8zVE3Yq
	getrb1X4M/+RX77RYn72C4AvpCzXhwVDRccKVqk4rf3P8S2+nVkOF/qjxB5jFOn5
	2hlbjg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cvef4tjer-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 13 Mar 2026 20:13:08 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cdae902bccso1159823485a.0
        for <linux-media@vger.kernel.org>; Fri, 13 Mar 2026 13:13:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773432788; x=1774037588; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WkIxi4+/C28jrvf8ES6/SIOuPsWcpSdm1apYAbDQVp0=;
        b=T7uTE0mcSCsEeJ2/7oyS/6qHdzTU4PaDfXMsuEqbpo+FlDqMniN4JByOWZ8BtX2Q+v
         3A18NgtjdK0XKGzX+itwrVrmJWmKQ3XqlJLbwHMuCNLvmLHXE7AAyVo7nDaaxQlCYcAb
         kENzojjgqkdvHiK4XdttCJf+8vZ//rR45HyDG4zsi9oj3IF8r1KGajp7dcMUxxX8rB8h
         dKXDfLrBppDd8Etmb/ZhlgEU3UEyzSpacAFtlV3u4kUaQAxhf7vasOff5NgYakXIHv0j
         uGEc3kdazbKSTtBrwIJ8WSVWa/uXEBpiEGtfY3xftiDRLvcCZpJ4AAltwY+Xo08STTRJ
         FufA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773432788; x=1774037588;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WkIxi4+/C28jrvf8ES6/SIOuPsWcpSdm1apYAbDQVp0=;
        b=djUdZ5QOcLi5AzGrPLMnVjK3ryiuACDgHssWAr9WgAcI0aQAvLuIe20DXXH9C6/8+x
         sD7U4TMiJ6+dhaQPPXkslN+kdyiTMYy/hgxB/UxqBH6WmZMvCqgp5sTqU+chGWOjPXG1
         TlmPVjrwwuqMomuT+hZUGBkQSLywgwsOc5UE0yDAB5zfQ4XKmbWzAqaiye98inNukWDj
         FTaYtB5rL1/0hxX334UbS4oyHFNLgAVe/1tjP0qpxdHy7PpPhWwNrHUroZhDLBUdg7Gj
         X4AQXSQ6N676err2BPsugnIIXxUYWBmkCR8kcFkni2WTP5QYK+axDwbW/JKB4YnKE0by
         hjSQ==
X-Gm-Message-State: AOJu0YyL9kdiTuToar7DXlpmNb1OhartmxT5fK8vinJrDKUc44wpyTo+
	8/HwfobehEqrt6uAT3I17wW1g6lcQ5jf/RtwHF9DfFEQDctmuqkgFFYPkojWommpOfFgN2GJN+1
	IFGrrk1FNbzKznuIoxw8V5mGBmjvj84fJ/hK6Dsl/KTnEDFhvwrd591kCvMfzgSs7uQ==
X-Gm-Gg: ATEYQzwXbhrUmC18Vc3b0s4FAJ5UnN+FX5lOss8TAcQRlaAlFqEnnIpfVZSL2zUZi5t
	hXVhcdnJD0ZOCIWpf5qAHwsKPIVe7hkLYYObpTlJ2/4zQLYRqSgyUXoDVbVazciFsklOzNT/igw
	oOxllxbiLPb3omtg73vkxc0l8D3HU1IYkKez1GJhfkeScmpWPzHF0czJKQh4kk5dv1ZXd3ckwrL
	Xi06m0FJSYJ2sZMlfSwuvm9CAhGQfIU6GSSgnO7RQUkkBgiqkdPFkii5l0GqTdLiPO4LLzZQkEd
	nw9ycJhuc/D2hoyCj0UkeuMDPbhKo+T0hpkHRSA0sRe74FFyanOzRhEkMuRwelNOZgXjltFG2mr
	KZqB/Ji3WBrlSBtaJpcV/Q0GMg13a6BqGGX2oZW3UYFNPQevI+nbXx07YiEQ4roWnGYUveZQqJs
	hwMi8xnmva5FhYRkVhq8GNtsQhT8aUFmBOr6Q=
X-Received: by 2002:a05:620a:4008:b0:8cd:9aba:f5fa with SMTP id af79cd13be357-8cdb5b2486emr637753685a.42.1773432787776;
        Fri, 13 Mar 2026 13:13:07 -0700 (PDT)
X-Received: by 2002:a05:620a:4008:b0:8cd:9aba:f5fa with SMTP id af79cd13be357-8cdb5b2486emr637748685a.42.1773432787192;
        Fri, 13 Mar 2026 13:13:07 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a155f33c15sm1681259e87.17.2026.03.13.13.13.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 13:13:03 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 13 Mar 2026 22:12:54 +0200
Subject: [PATCH v6 6/8] media: qcom: iris: move get_instance to
 iris_hfi_sys_ops
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260313-iris-platform-data-v6-6-1763bb837fd2@oss.qualcomm.com>
References: <20260313-iris-platform-data-v6-0-1763bb837fd2@oss.qualcomm.com>
In-Reply-To: <20260313-iris-platform-data-v6-0-1763bb837fd2@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=9196;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=Knwl9TIGW90PmwXP68VpHHyknWQzY2+lfOIWG1iTcOE=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBptG/EX/EK0nyVc4RQAsZsk6+jLoFZWf98GPVGN
 PgBFjCYe7CJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCabRvxAAKCRCLPIo+Aiko
 1S6kCACgYCrq7t+RDR6B4Ve05g9RRvycxbQlZtfBOKMFreyjuPKVl51z9dsCobwZHdcwfUwfJMz
 SkJTaKb+ajei5mRqitdxG76UmSCuV+IJ+w2xRowAUQpmG+zbc+T+bRolhMIu8dh7SAY+r+qx4Cu
 jpKEOKxiI346cJ3vNOzP0BxYiTi66D5/2EoFpr+eY9yKxoerAXKVQQNGc8sLSWaqF6Ub+q9uDt5
 SYju/Hd1DdHON+8vGZ6ifCwACzVf7XpiIQ9mesDir/IbbLrZI4j6O0ZTZiWm7YwKs2mjBw0Y+9n
 7F5YhT6o0Q3a4QfBRREqshuSVeFgfgJCISrIYSRsFxV6isCW
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: kOw3k-qg3N7YiUqNlwnvtY-FMpVM6zbR
X-Proofpoint-GUID: kOw3k-qg3N7YiUqNlwnvtY-FMpVM6zbR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDE2MSBTYWx0ZWRfXz7jw0M4y4ZwA
 gyDIxLHJiZwPYBZ2tSX3m6fojk6LYzNvZhCVsQxH77WxNwE2n/U6DEF0zHrNOhRZxRauzbZtn5t
 LMIgbMMQa+JBYBLvUon3xkoxs7y6DdIxIGN4p9jMofZfGyb101WNf/rkzWnGlMkBDzx/nf2/q1A
 k5gOussh/hp8c117SsBgUKDcuYKlPJK0tNXJ1nwNUXnQ89y+TN0Q4ZH/uX3ECcm818FnaoOfPIq
 8sOmR45PsZbNHfFWQRMTR9h3TODFTzbD/6ckCfaBXoTsE1O7iusNSI0aVcghm5UYg15z63kus5X
 gbAonw6o4+cTw2d5jMuDUQXAMgM8rfW6ppDAJRR/Aryd8zd+ZtcLHJ/NGs+SsW7vMoO72THJo4l
 mogRSDxC6rmn9PYNgFl07V+DR0nNUXgB09R1zHd8WUYD8MdVTvRXCWliea95f3SzcjF7cTlexPI
 28J9HwWj52JGGi8rMFA==
X-Authority-Analysis: v=2.4 cv=S9nUAYsP c=1 sm=1 tr=0 ts=69b46fd4 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=65xn1vM8G5_EQ4liwbMA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_04,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 malwarescore=0 priorityscore=1501 suspectscore=0
 clxscore=1015 lowpriorityscore=0 phishscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130161
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-55783-lists,linux-media=lfdr.de];
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
X-Rspamd-Queue-Id: 3FDFF2899FC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The get_instance() is a callback tightly connected to the HFI
implementation. Move it into the new iris_hfi_sys_ops structure, merging
all core callbacks into a single vtable.

Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_hfi_common.h |  2 ++
 drivers/media/platform/qcom/iris/iris_hfi_gen1.h   |  2 --
 .../platform/qcom/iris/iris_hfi_gen1_command.c     | 28 ++++++++++----------
 drivers/media/platform/qcom/iris/iris_hfi_gen2.h   |  1 -
 .../platform/qcom/iris/iris_hfi_gen2_command.c     | 30 ++++++++++++----------
 .../platform/qcom/iris/iris_platform_common.h      |  1 -
 .../media/platform/qcom/iris/iris_platform_gen1.c  |  2 --
 .../media/platform/qcom/iris/iris_platform_gen2.c  |  4 ---
 drivers/media/platform/qcom/iris/iris_vidc.c       |  2 +-
 9 files changed, 34 insertions(+), 38 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_common.h b/drivers/media/platform/qcom/iris/iris_hfi_common.h
index 9aa84a1d8f95..a27447eb2519 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_common.h
+++ b/drivers/media/platform/qcom/iris/iris_hfi_common.h
@@ -112,6 +112,8 @@ struct iris_hfi_sys_ops {
 	int (*sys_pc_prep)(struct iris_core *core);
 
 	void (*sys_hfi_response_handler)(struct iris_core *core);
+
+	struct iris_inst *(*sys_get_instance)(void);
 };
 
 struct iris_hfi_session_ops {
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1.h b/drivers/media/platform/qcom/iris/iris_hfi_gen1.h
index 38e9d262d7df..c37adf65055a 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1.h
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1.h
@@ -7,10 +7,8 @@
 #define __IRIS_HFI_GEN1_H__
 
 struct iris_core;
-struct iris_inst;
 
 void iris_hfi_gen1_sys_ops_init(struct iris_core *core);
 void iris_hfi_gen1_response_handler(struct iris_core *core);
-struct iris_inst *iris_hfi_gen1_get_instance(void);
 
 #endif
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
index 26b7feb05d15..0017ade4adbd 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
@@ -1076,6 +1076,19 @@ static const struct iris_hfi_session_ops iris_hfi_gen1_session_ops = {
 	.session_close = iris_hfi_gen1_session_close,
 };
 
+static struct iris_inst *iris_hfi_gen1_get_instance(void)
+{
+	struct iris_inst *out;
+
+	out = kzalloc_obj(*out);
+	if (!out)
+		return NULL;
+
+	out->hfi_session_ops = &iris_hfi_gen1_session_ops;
+
+	return out;
+}
+
 static const struct iris_hfi_sys_ops iris_hfi_gen1_sys_ops = {
 	.sys_init = iris_hfi_gen1_sys_init,
 	.sys_image_version = iris_hfi_gen1_sys_image_version,
@@ -1083,22 +1096,11 @@ static const struct iris_hfi_sys_ops iris_hfi_gen1_sys_ops = {
 	.sys_pc_prep = iris_hfi_gen1_sys_pc_prep,
 
 	.sys_hfi_response_handler = iris_hfi_gen1_response_handler,
+
+	.sys_get_instance = iris_hfi_gen1_get_instance,
 };
 
 void iris_hfi_gen1_sys_ops_init(struct iris_core *core)
 {
 	core->hfi_sys_ops = &iris_hfi_gen1_sys_ops;
 }
-
-struct iris_inst *iris_hfi_gen1_get_instance(void)
-{
-	struct iris_inst *out;
-
-	out = kzalloc_obj(*out);
-	if (!out)
-		return NULL;
-
-	out->hfi_session_ops = &iris_hfi_gen1_session_ops;
-
-	return out;
-}
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2.h b/drivers/media/platform/qcom/iris/iris_hfi_gen2.h
index 6cc6d9890c12..21ab58e0aa84 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2.h
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2.h
@@ -36,6 +36,5 @@ struct iris_inst_hfi_gen2 {
 
 void iris_hfi_gen2_sys_ops_init(struct iris_core *core);
 void iris_hfi_gen2_response_handler(struct iris_core *core);
-struct iris_inst *iris_hfi_gen2_get_instance(void);
 
 #endif
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
index 0c98d680bf09..639b75fca1ab 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
@@ -1315,6 +1315,20 @@ static const struct iris_hfi_session_ops iris_hfi_gen2_session_ops = {
 	.session_close = iris_hfi_gen2_session_close,
 };
 
+static struct iris_inst *iris_hfi_gen2_get_instance(void)
+{
+	struct iris_inst_hfi_gen2 *out;
+
+	/* The allocation is intentionally larger than struct iris_inst. */
+	out = kzalloc_obj(*out);
+	if (!out)
+		return NULL;
+
+	out->inst.hfi_session_ops = &iris_hfi_gen2_session_ops;
+
+	return &out->inst;
+}
+
 static const struct iris_hfi_sys_ops iris_hfi_gen2_sys_ops = {
 	.sys_init = iris_hfi_gen2_sys_init,
 	.sys_image_version = iris_hfi_gen2_sys_image_version,
@@ -1322,23 +1336,11 @@ static const struct iris_hfi_sys_ops iris_hfi_gen2_sys_ops = {
 	.sys_pc_prep = iris_hfi_gen2_sys_pc_prep,
 
 	.sys_hfi_response_handler = iris_hfi_gen2_response_handler,
+
+	.sys_get_instance = iris_hfi_gen2_get_instance,
 };
 
 void iris_hfi_gen2_sys_ops_init(struct iris_core *core)
 {
 	core->hfi_sys_ops = &iris_hfi_gen2_sys_ops;
 }
-
-struct iris_inst *iris_hfi_gen2_get_instance(void)
-{
-	struct iris_inst_hfi_gen2 *out;
-
-	/* The allocation is intentionally larger than struct iris_inst. */
-	out = kzalloc_obj(*out);
-	if (!out)
-		return NULL;
-
-	out->inst.hfi_session_ops = &iris_hfi_gen2_session_ops;
-
-	return &out->inst;
-}
diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index 6b76a9046f9a..d1daef2d874b 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -203,7 +203,6 @@ enum platform_pm_domain_type {
 
 struct iris_platform_data {
 	void (*init_hfi_ops)(struct iris_core *core);
-	struct iris_inst *(*get_instance)(void);
 	u32 (*get_vpu_buffer_size)(struct iris_inst *inst, enum iris_buffer_type buffer_type);
 	const struct vpu_ops *vpu_ops;
 	const struct icc_info *icc_tbl;
diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen1.c b/drivers/media/platform/qcom/iris/iris_platform_gen1.c
index dc74da04771b..9925a893b404 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_gen1.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_gen1.c
@@ -333,7 +333,6 @@ static const u32 sm8250_enc_ip_int_buf_tbl[] = {
 };
 
 const struct iris_platform_data sm8250_data = {
-	.get_instance = iris_hfi_gen1_get_instance,
 	.init_hfi_ops = &iris_hfi_gen1_sys_ops_init,
 	.get_vpu_buffer_size = iris_vpu_buf_size,
 	.vpu_ops = &iris_vpu2_ops,
@@ -385,7 +384,6 @@ const struct iris_platform_data sm8250_data = {
 };
 
 const struct iris_platform_data sc7280_data = {
-	.get_instance = iris_hfi_gen1_get_instance,
 	.init_hfi_ops = &iris_hfi_gen1_sys_ops_init,
 	.get_vpu_buffer_size = iris_vpu_buf_size,
 	.vpu_ops = &iris_vpu2_ops,
diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
index 19e99e1c2aff..10a972f96cbe 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
@@ -907,7 +907,6 @@ static const u32 sm8550_enc_op_int_buf_tbl[] = {
 };
 
 const struct iris_platform_data sm8550_data = {
-	.get_instance = iris_hfi_gen2_get_instance,
 	.init_hfi_ops = iris_hfi_gen2_sys_ops_init,
 	.get_vpu_buffer_size = iris_vpu_buf_size,
 	.vpu_ops = &iris_vpu3_ops,
@@ -1006,7 +1005,6 @@ const struct iris_platform_data sm8550_data = {
  * - fwname to "qcom/vpu/vpu33_p4.mbn"
  */
 const struct iris_platform_data sm8650_data = {
-	.get_instance = iris_hfi_gen2_get_instance,
 	.init_hfi_ops = iris_hfi_gen2_sys_ops_init,
 	.get_vpu_buffer_size = iris_vpu33_buf_size,
 	.vpu_ops = &iris_vpu33_ops,
@@ -1100,7 +1098,6 @@ const struct iris_platform_data sm8650_data = {
 };
 
 const struct iris_platform_data sm8750_data = {
-	.get_instance = iris_hfi_gen2_get_instance,
 	.init_hfi_ops = iris_hfi_gen2_sys_ops_init,
 	.get_vpu_buffer_size = iris_vpu33_buf_size,
 	.vpu_ops = &iris_vpu35_ops,
@@ -1196,7 +1193,6 @@ const struct iris_platform_data sm8750_data = {
  * - inst_caps to platform_inst_cap_qcs8300
  */
 const struct iris_platform_data qcs8300_data = {
-	.get_instance = iris_hfi_gen2_get_instance,
 	.init_hfi_ops = iris_hfi_gen2_sys_ops_init,
 	.get_vpu_buffer_size = iris_vpu_buf_size,
 	.vpu_ops = &iris_vpu3_ops,
diff --git a/drivers/media/platform/qcom/iris/iris_vidc.c b/drivers/media/platform/qcom/iris/iris_vidc.c
index 7e03d63578e1..ecd8a20fedbf 100644
--- a/drivers/media/platform/qcom/iris/iris_vidc.c
+++ b/drivers/media/platform/qcom/iris/iris_vidc.c
@@ -156,7 +156,7 @@ int iris_open(struct file *filp)
 
 	pm_runtime_put_sync(core->dev);
 
-	inst = core->iris_platform_data->get_instance();
+	inst = core->hfi_sys_ops->sys_get_instance();
 	if (!inst)
 		return -ENOMEM;
 

-- 
2.47.3


