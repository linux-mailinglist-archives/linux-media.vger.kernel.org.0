Return-Path: <linux-media+bounces-52366-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id tT0yFr45iWnk4gQAu9opvQ
	(envelope-from <linux-media+bounces-52366-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 09 Feb 2026 02:34:54 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DC21610AE23
	for <lists+linux-media@lfdr.de>; Mon, 09 Feb 2026 02:34:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C91FC3008E0B
	for <lists+linux-media@lfdr.de>; Mon,  9 Feb 2026 01:33:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1917E2D3A69;
	Mon,  9 Feb 2026 01:32:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="S7Uli7I2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OzG3Fzvj"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 534622D29C7
	for <linux-media@vger.kernel.org>; Mon,  9 Feb 2026 01:32:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770600765; cv=none; b=PA3jk5hkuELhpuNnycUYXAxcD8DnwsGgcRrX6P3/9yKMDlH5qzLVnf8DMcuhjvnghtWrkzOSpiyRywzqiw+LNKSicd56/ZNApqZRSiTPQhL0BqfHT6WZObcxSBelOVgoZfo9pjbhi3l8huS6uZuuNhqIXImZHInzTy8cI3YngR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770600765; c=relaxed/simple;
	bh=AguPyjryJFtRx2eaJbYNMbx1txjYcA3Blb6q3wboAz4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=O+OgLpYV2PBVYoSlIr1HbHgY+BJ/oGPMrK2dp/R4LkJyfLoJjZfp7uWqmHY7Gm5uJ+Fxaa1vCVGJmHPdZoIT8nqNf852eejqvh4NLN13oDd3ZXMVdzpXvcnQZX9rRscUzU+4ls9GW+lDe7E86qlywUhNpocMWNX4BL+44dr3zGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=S7Uli7I2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OzG3Fzvj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 618Kpb7m989745
	for <linux-media@vger.kernel.org>; Mon, 9 Feb 2026 01:32:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+rRlQKJisATzVZPJyVOcJXS8qbgH74hMR0xOPMwnDPw=; b=S7Uli7I2MnVM6IDl
	R9gSScAmQwZQxBYikujVR6fv+vr1VUmkoiTmujEu9nWROFhS0JI/p2vOmhuh3Mms
	RN2WWRgIsbjomptrDrm5M/ympN3Dz/lID1m9/p+qEQ2PdYR7ze/lw+IVwR9MiGsA
	0PPQ50KfXZKumZHwSb3qQbEH2mcrze2S23t5T7hUdys67TUjIXcKsdnudw7Zp7++
	J1jNsHO4DurhkZQ91CFU9EPIMFTjgn0SgQDbr8Fv1wqiY3rKgwwf/hU2M5Z54Gen
	mGqVeUPPRfezqV+jHTIhc/FWeTXqOUgAlP0DVOeFeX6k2G09Ka2XlAkZy7Ecb65Q
	KmE+zg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c5xb4u8gr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 09 Feb 2026 01:32:44 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c538971a16so1062975885a.1
        for <linux-media@vger.kernel.org>; Sun, 08 Feb 2026 17:32:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770600764; x=1771205564; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+rRlQKJisATzVZPJyVOcJXS8qbgH74hMR0xOPMwnDPw=;
        b=OzG3FzvjoabiJG7I8ZzpyZ+dK2nhE+85B67hM9CM+rz65ckW4+KX1eMhP5IVzjj9MA
         Vru5Gvwm3umzTGBbmgx1npooO3vvWWbHGcIV4yPcj2wqO43jEb9FAJsSXXW0nct6U94H
         fom/aosvDfVWug5YqviPtiWT1EMPLW294aqnHvkXJvWhAyslgG/3Zb2HgAb6DbWTHtJl
         1rdyQRlxlgrY4V1dRmS9ktx9LS8GnB0qCHE4/XB0tmKbwEBTGPO5lL8oL2zr0gdGsahp
         ryrYW7XpY7KX3tcNmFn1RcTvbZVSvDqugJfj0Syj7U5hAu/soEqaWjSmygs+Ccesco2c
         swLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770600764; x=1771205564;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+rRlQKJisATzVZPJyVOcJXS8qbgH74hMR0xOPMwnDPw=;
        b=nzToVjNH6gM/hc0dJjjsPxJyzmg8TLaAqfhf5PlEbKsO9Dnymyb4HVvhLNehrFbfBe
         XAjhDXuD4aDwSllJ6WO4V69hOv2fsw5oQzpRk6Bz5vlMJSxOpHJZE5PnDr33cl+xAOjH
         l+sOTxohRPe5QzxgOKF4/ZPvNnZnQs8YHZHWn9YNWky8uukRcVYPST2DgUKh1RTfq+GH
         Obs7x0fmHsLv2mlCJsVhtVAOwEMCR/7lZJvXw6LMEwb/wMHA/2WIv0f0oWzowT6d7UkD
         qET1JviuU8S36qnSHeAi4hm6jbsvWQd3z+l5XKsk4vSWTXYgPl4OtnOw9oExuKQkdvH1
         XAYw==
X-Forwarded-Encrypted: i=1; AJvYcCVmLwjFUdBxxmZlbyR4kZVpwdt8pkc6DH68wQ0zqqWlUDMbz9q4SqatfoBholyEwi7H98V8rnVLGuqtKQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxNDzro5nwtYWnKkWJRkVjmkO95qT8Ox7GTspnNyk6JATbNSnS+
	guHFlhO8bYzHSUlxI6Zmpx5C21rQnnjuaw7xU/jnAkAZdBfRbazr3IzzZdzrLRuh+jB0/dyAj/T
	yNeomJ1+5o43JIlfVi7NhdKxNWdkhfLCgNR5CeWNgSP2tZOTBMtYjTZMrpKPHZf2P7Q==
X-Gm-Gg: AZuq6aLsV5M8zFkBBEhKkFdHvzX2A7Ik/Xdd7ASn9Ta+3C+/etzRCDfxf3yJPoyvmgy
	hNGmebPwuiZ8RizjReXQ6wSwlp5Bq2Kbfce6HZYcbVd6MGi/fBAgR8LrF/+iGddg30xlM2lVdHj
	f8N11iIKkeXy/6sl5FBBFK6WrSzjHrrSmVtyayol8IM1UMd8BVrMcSoZupGQB3MHL3i0TymISwK
	131N16boiVp0yCmbHujrxkiFw0dtFHF/IsL3SCYozqq3PZ9oPxK1pz6wWSsFDxtMfi6XSI1XRaW
	11fMAIhKfXQkFOSNW0SwG+Y4Q51mOw7zOoQvECaZS4sbIB9p+w4Xi2ronL1j5RwehZZBqd2F2r/
	MtWkHy0oaOFxnSFH8glhljmK5l+PoTG0sgARi59rmwcfpk1nYmcwOpzPvH1Kkr9n681iNFL4pcg
	rqICwjkllgns6jmy85sFIll4Y=
X-Received: by 2002:a05:620a:45ab:b0:8c6:d398:4a76 with SMTP id af79cd13be357-8caefccac74mr1222189185a.2.1770600763834;
        Sun, 08 Feb 2026 17:32:43 -0800 (PST)
X-Received: by 2002:a05:620a:45ab:b0:8c6:d398:4a76 with SMTP id af79cd13be357-8caefccac74mr1222185585a.2.1770600763392;
        Sun, 08 Feb 2026 17:32:43 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-386b623668asm21688601fa.3.2026.02.08.17.32.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Feb 2026 17:32:41 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 09 Feb 2026 03:32:20 +0200
Subject: [PATCH v5 5/5] arm64: dts: qcom: sm8250: correct frequencies in
 the Iris OPP table
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260209-iris-venus-fix-sm8250-v5-5-0a22365d3585@oss.qualcomm.com>
References: <20260209-iris-venus-fix-sm8250-v5-0-0a22365d3585@oss.qualcomm.com>
In-Reply-To: <20260209-iris-venus-fix-sm8250-v5-0-0a22365d3585@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>,
        Jonathan Marek <jonathan@marek.ca>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Dikshita Agarwal <dikshita@qti.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1944;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=AguPyjryJFtRx2eaJbYNMbx1txjYcA3Blb6q3wboAz4=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpiTkmJsL4kleC5vw4uvTcTGmVWfWCZLGjjZJAm
 eOUhGQfU3+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaYk5JgAKCRCLPIo+Aiko
 1XZpB/0RO0lLZwrCkx22/CU5SlJtM65S4vT7oHOjMXUyOjBg8+OI//S9ks5ykJuxJS0C/AlZkhT
 4f5z98h26mP7WtTcbQaBn25g6jI8V0YRwHdITbRCsKR7Z9KLvXpcfVNxhCUADKlBrNAnq18jxsw
 EFbc1B0xK3dy2UqpV/6TaCMzpNjXrPl5+DUxjim3c9Nek4h+59d3sWXWQIQMH1hDL+VP2/077NN
 d++1fXxwLxqpc6p0XhJnpAvqgNYJdOC0acn6F+8QJ4ucAwWBMHp6fHpBxJueQwntQCcPA4eQqYJ
 T+sMens7DH2nCftZZygSnWlt2DjRfDkRh30c24HODBAjBM7V
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: Jd8ysZbDQVm6uiCzQpXAvTGZdDqifi2f
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA5MDAxMSBTYWx0ZWRfX2j+EYPSzdrIV
 XcpBMTZs5liBzBqy8P4cx8f2l2R07iR3WTU2VsJklIRnUfK/bucOxyQsvT5cFlmNPcqpspl8xAm
 e1nJ4WejjihwG43gM6zu1OHJOQ/3KvofLC/9mqXraFVhHrkaXWLTvAq91IX1iOt8iqd4ZMUcJLF
 UHKaXiv51KovbYfKu/XP5o7+xWWbt7GdJKwBRj2u7FGyOXI5Cfk03YDgYwaZ0z/g50fdtCoF2J8
 DAmQDrVUQ3LKp9uI7igiWyhFRnoxMfssFvkwDceKmaHmuUlChkR9V61IQ//8tLaAWuPliuNmUI8
 MYDLJPq4qLaLa6ixOKzkWH8+QO/dOOb0lb53ZwcKLmKnpZRCNc2gVAsmMn5k2twYbuSgCsDTkou
 DB6COT8DmZ6f9HEJunf/wBGr6Rqg/qyt1tVoCO5LkNQpglclGPr0C09tQsF8q8d9jOStuJRWPpT
 Gkw0Kxw1j13Di9pw0uQ==
X-Authority-Analysis: v=2.4 cv=PYLyRyhd c=1 sm=1 tr=0 ts=6989393c cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=EUspDBNiAAAA:8
 a=EQKuo8RqpatckOKiKW0A:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: Jd8ysZbDQVm6uiCzQpXAvTGZdDqifi2f
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-08_05,2026-02-05_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 malwarescore=0 priorityscore=1501
 suspectscore=0 bulkscore=0 impostorscore=0 spamscore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602090011
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[29];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-52366-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[aa00000:email,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.988];
	TAGGED_RCPT(0.00)[linux-media,dt,huawei];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: DC21610AE23
X-Rspamd-Action: no action

The OPP table for the Iris core is wrong, it copies the VDD table from
the downstream kernel, but that table is written for the
video_cc_mvs0_clk_src, while the upstream uses video_cc_mvs0_clk for OPP
rate setting (which is clk_src divided by 3). Specify correct
frequencies in the OPP table.

Fixes: fa245b3f06cd ("arm64: dts: qcom: sm8250: Add venus DT node")
Reported-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index a1ab8c3c27e6..a80defcb29ed 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -4350,26 +4350,26 @@ venus: video-codec@aa00000 {
 			venus_opp_table: opp-table {
 				compatible = "operating-points-v2";
 
-				opp-720000000 {
-					opp-hz = /bits/ 64 <720000000>;
+				opp-240000000 {
+					opp-hz = /bits/ 64 <240000000>;
 					required-opps = <&rpmhpd_opp_svs>,
 							<&rpmhpd_opp_low_svs>;
 				};
 
-				opp-1014000000 {
-					opp-hz = /bits/ 64 <1014000000>;
+				opp-338000000 {
+					opp-hz = /bits/ 64 <338000000>;
 					required-opps = <&rpmhpd_opp_svs>,
 							<&rpmhpd_opp_svs>;
 				};
 
-				opp-1098000000 {
-					opp-hz = /bits/ 64 <1098000000>;
+				opp-366000000 {
+					opp-hz = /bits/ 64 <366000000>;
 					required-opps = <&rpmhpd_opp_svs_l1>,
 							<&rpmhpd_opp_svs_l1>;
 				};
 
-				opp-1332000000 {
-					opp-hz = /bits/ 64 <1332000000>;
+				opp-444000000 {
+					opp-hz = /bits/ 64 <444000000>;
 					required-opps = <&rpmhpd_opp_svs_l1>,
 							<&rpmhpd_opp_nom>;
 				};

-- 
2.47.3


