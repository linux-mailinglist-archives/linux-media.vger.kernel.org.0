Return-Path: <linux-media+bounces-52152-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iJJAGF6agmkzWwMAu9opvQ
	(envelope-from <linux-media+bounces-52152-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 04 Feb 2026 02:01:18 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E681BE0309
	for <lists+linux-media@lfdr.de>; Wed, 04 Feb 2026 02:01:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id AE2F330E8DCF
	for <lists+linux-media@lfdr.de>; Wed,  4 Feb 2026 01:00:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C41921EE7D5;
	Wed,  4 Feb 2026 01:00:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="k2Zv/a8Z";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VleHCBND"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C344623D7D4
	for <linux-media@vger.kernel.org>; Wed,  4 Feb 2026 01:00:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770166803; cv=none; b=GCccZFbZ3/s0nTmJ6hfPG/7KJe6zPBPjO9KqBVsBl26a2k/fHFOvhbDxNNw7bsZhqyoxWNVEUTnqWmnNn/rtptZreDy916EfUngu93JEgcCTBQ42Sww4pVdx7OxE2t/11FeMOVh3hDwCVWAZRH6sjiBJ3HFOMMtAO8EvZsv86lA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770166803; c=relaxed/simple;
	bh=DrFwEkIoYrD1qa5tx9EdrYljNPefynFUvMATHqt7Zhg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=U9jthgVSdjhEqS2tPwmFVziXG8y9txJi2v1xE4mVMaBCAb8euF3y0tpJ6rUTDmr6eZuoyRGA5tQLhSD4IYel9Q8X/YEm1NlXDn8h+aMopuf//S0LuUHpxmYywOwfyBgdZhcoHLu0nOgl/Dj8XukFO0mJ90JHBGYAJLgnisj3iZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=k2Zv/a8Z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VleHCBND; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 613ImjYv3824711
	for <linux-media@vger.kernel.org>; Wed, 4 Feb 2026 01:00:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HFgRG5qL9bnoUT3jp+ysOldDPm40o5vQTA9j6ykK/qw=; b=k2Zv/a8Z0KJ+rUmV
	oMJx+1RTv6EK/XHMNwvwIHIQbf7SVyEVr3teJD4KYzxtuoQ8mDZ1ra2mnwGYswP4
	n3Za56KUmZj/p9y0bD3D99UVauFXB+Hdt59PcvbkibN7AlY0LNMzwhZlCtYqtvQQ
	/2F0Q+eJQPQ853xWzsHqX9B7e+uX6R1TfGw4N8DQxRRuwEFu04v/o/BiaYVO5C+3
	eqr7nLqYPreMkmUwp53vv51M2gviNMj4IyuYagIu1PRA7VikAq4VBVmoapEJ9Hbx
	4k4CmIHgCzWQkXfwAPp47VdqCqw1FH8eZnUZk5py4jluMhMmEcrKBKUUUHrmvuhr
	aL2kew==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c3g33jgjy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 04 Feb 2026 01:00:00 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c6a289856eso135967485a.0
        for <linux-media@vger.kernel.org>; Tue, 03 Feb 2026 17:00:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770166800; x=1770771600; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HFgRG5qL9bnoUT3jp+ysOldDPm40o5vQTA9j6ykK/qw=;
        b=VleHCBND3S2RJj5CpZZTpVF+0Pc9mLuvuApB+dI0DzUgPS9KPglsniRt9mLJ9n0SNl
         wajmFaKXbYUtR5pgj6mznxM7bqm36V2rIpM6Vg49MQzyBpsjZl11nEas+CbSu13kF0Xg
         7gYGz3MGSTsaQMKIikAzAFcWR+4D2ebAtwZ9nuZnmMvE9K201LLUNweNRdmBAgLgEBZh
         4pEfKyfIIdykYk6JxT1CoiCAe5tPBCMwIRIoQMqfi99XgIw/w6+XflRCJIIniuBYjM2x
         L6RVPlMBA5gdlAQamfZFD8u8TjlHdg3GNl1+W9AKfGerLV6dyK2t4SwoBbNBHpqVxDrb
         m67A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770166800; x=1770771600;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HFgRG5qL9bnoUT3jp+ysOldDPm40o5vQTA9j6ykK/qw=;
        b=J0xuvPDSrdI2DLKAzQkiRJg7/KOMoKdHgo6gXvLY4txGPyYrwdfjeXtxEYz9KR2ciH
         mQXGDUuCLgubhkZWPzNpi0Nmt6uDP0RyPcxEROk2bCO8BA22x7W6beT0MnFHyWik2Fht
         QE3ieng4yluqAeR7pA8XRhqI2KN2f3lFQqRRJnzjmwLKvywYUPj7C6IARVyCm9WhH+2Q
         3h/CSFRlmhPs1/MKX2Y9ahSlyrqQe/I4jwgeBeLhWFa4EFZAJBNWL8MBXKIwyDXmCV0T
         TzMzc5Asi91nBOixkeXYOjt2BM/zGHQg0YDQHDY25DnZtEFDVNZz+lyz0DXxESqfCshq
         3HfQ==
X-Forwarded-Encrypted: i=1; AJvYcCVLgpKcbxxuQ9+ZKfc08FXHjUYBqvKO4PJ04c01TpWqM/6ryTIT/PdmX/LVFWqwyQ2UQp+scG2nMnF9bQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwAx2hTC2QSh5xmJBRjYiWYhBpB/gMwATdKp+nFukmz2UJQzR3G
	NedHzNOmfirdrJbSW6jvdvizN0AqmjkTN7Xx3TaD5SbDVFzZlR5qhmP8yZ5/hsKwbuR3fSA+GkJ
	fx1nFQuJoi4OumFzW0wJZkH56fZ2C0Tb44A6YZfTFOxotVpInKgmzAeVtmrKdxgirhw==
X-Gm-Gg: AZuq6aL1cUGw1OAbu4C3Mf95LYvkskGvlZbUfz5EhwdfbT3yR2hmmJdVDgr7NvMHjdl
	Gd1XhzNqQ9tQGYYUVIKIWWCHK9sDsqJZvQ8sSSE/8YnY+5fccxvpQGIS0ErrcvrNS1olYMyGl1c
	1ibe41U+dflkSWVPNg4IG/wFxevOJyuTDXBsQEr3CVssGx/SoSwsL6guWjEGP7l+7pCSWqOuWFb
	Xl98d1krw6hI9S6mJ5XabWzc4ijF2CYQWzQ3HdplmRa+jmOXyTLvK6y/7zpN4tdN/G48rvkELUU
	5FqrDAB35dcO1kRMaFHRnv83gLPTK8/xJiupowcqI+nKo6wgys7X2w7MI3x4NlKeGqiN88CFT9D
	ZB8GxxJT032xbHhkapNHldIjzG9O01yi8k/WnGmKo1238U8VBc3QhPwfdMGlU2Mjp+vEO3aIUWi
	etYQ8W8ToD+LEnuZA6dp4wqa8=
X-Received: by 2002:a05:620a:4723:b0:8b2:e0db:e639 with SMTP id af79cd13be357-8ca204cd086mr614823885a.32.1770166800178;
        Tue, 03 Feb 2026 17:00:00 -0800 (PST)
X-Received: by 2002:a05:620a:4723:b0:8b2:e0db:e639 with SMTP id af79cd13be357-8ca204cd086mr614820985a.32.1770166799720;
        Tue, 03 Feb 2026 16:59:59 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e386ff563sm253405e87.1.2026.02.03.16.59.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Feb 2026 16:59:57 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 04 Feb 2026 02:59:50 +0200
Subject: [PATCH v3 2/7] media: dt-bindings: qcom,sm8250-venus: sort out
 power domains
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260204-iris-venus-fix-sm8250-v3-2-70fa68e57f96@oss.qualcomm.com>
References: <20260204-iris-venus-fix-sm8250-v3-0-70fa68e57f96@oss.qualcomm.com>
In-Reply-To: <20260204-iris-venus-fix-sm8250-v3-0-70fa68e57f96@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2051;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=DrFwEkIoYrD1qa5tx9EdrYljNPefynFUvMATHqt7Zhg=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpgpoHGVXP1oPuZ1HuUzywdpPWCvtW3w+jr4aSM
 y/VnjMcAf2JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaYKaBwAKCRCLPIo+Aiko
 1URPB/9AbHHnOcBK0yW1YvGlYOkWgOh7u5KCk0ZVSgqo0xge7DvEHmVVxxD/P1sQxFA65QGswBT
 TZdKhKTqca9+6fPUjh0BVrkCYPAK+/yj9TUZOYnIJCvSl9TiIIAVbkrjQTW5zhVQkJY0b7asY3i
 O8RuKd86nreQOjaqhDl5lZEZIpUF1tL3mytnS2Q5ka3fvdAyibGpul+zgxBe6qwkLhMCyR/Huea
 dRigVV0bMz2b3othCMm5yTbD4ld2O6C8538X0oKnKyzBzHKxZ06dQDrXKIDSpzNr/ewcRxErGDA
 PKllVBMVXDCzw5DFeUIQVpKHURpbMzaCTZf711bnD6XLOryV
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=afVsXBot c=1 sm=1 tr=0 ts=69829a10 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=V4YYwRrX08S5_i0GLdQA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: mpqkaOy-R6yJxF9arliBavKOeuBVEnA0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA0MDAwNCBTYWx0ZWRfX8mx/sUXDyf7W
 pqRdH8IhIyt9eoJzeDlD97+o6l6InM/dyuqcJV6zzRg4VGN3dO9MvMMBT6OVFnOtfQ3lMHfYFNk
 nY7uI1Hrng2ZQ/Zb581hE74A2Yon/ITD9q0u85/WyxXsOeOlADoYfIAWMX1pS+p/jxQMFvL6bhh
 RSKuMbto8/nVpIzU0I80jVsmAUKDzpxcZ2/79D0tMVy82qUgBr1zMSqhbmaddV5EzKhWa6hsUBD
 ycmZj38FXAwaZhH1/psO3NNTyggwMg6W3jPgn2PJizIhzDYr0JQYEtYAylTpFXiPSUtzDbxnfUp
 TONmMiDUyjgbjE4hIALFBVrMccSTCvF/VpkI3Z7dB3q9igKbQDcB+uauzbrkb5xf6yI8LxnQwf7
 AG8nf3TfJb7pDXG97gCjSQFboLE8tjbOSEfugbkGekzzQ59xHrHF73VyKNnuMvH09jMNZTrNlK+
 PSBmrTuOrgBa68j8nEA==
X-Proofpoint-GUID: mpqkaOy-R6yJxF9arliBavKOeuBVEnA0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-03_07,2026-02-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 bulkscore=0 suspectscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602040004
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[29];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-52152-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-media,dt,huawei];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: E681BE0309
X-Rspamd-Action: no action

First of all, on SM8250 Iris (ex-Venus) core needs to scale clocks which
are powered by the MMCX domain. Add MMCX domain to the list of the power
domain to be used on this platform.

While we are at it, drop minItems from both power-domains and
power-domains-names, it doesn't make sense from the hardware point of
view. There are always 2 GDSCs and two power rails wired to the video
clock controller and Venus. Disallow passing just two.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/media/qcom,sm8250-venus.yaml | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,sm8250-venus.yaml b/Documentation/devicetree/bindings/media/qcom,sm8250-venus.yaml
index da54493220c9..04cbacc251d7 100644
--- a/Documentation/devicetree/bindings/media/qcom,sm8250-venus.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,sm8250-venus.yaml
@@ -21,15 +21,14 @@ properties:
     const: qcom,sm8250-venus
 
   power-domains:
-    minItems: 2
-    maxItems: 3
+    maxItems: 4
 
   power-domain-names:
-    minItems: 2
     items:
       - const: venus
       - const: vcodec0
       - const: mx
+      - const: mmcx
 
   clocks:
     maxItems: 3
@@ -114,8 +113,9 @@ examples:
         interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
         power-domains = <&videocc MVS0C_GDSC>,
                         <&videocc MVS0_GDSC>,
-                        <&rpmhpd RPMHPD_MX>;
-        power-domain-names = "venus", "vcodec0", "mx";
+                        <&rpmhpd RPMHPD_MX>,
+                        <&rpmhpd RPMHPD_MMCX>;
+        power-domain-names = "venus", "vcodec0", "mx", "mmcx";
 
         clocks = <&gcc GCC_VIDEO_AXI0_CLK>,
                  <&videocc VIDEO_CC_MVS0C_CLK>,

-- 
2.47.3


