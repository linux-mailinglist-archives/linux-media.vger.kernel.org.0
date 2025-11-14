Return-Path: <linux-media+bounces-47054-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id F1B84C5BB1C
	for <lists+linux-media@lfdr.de>; Fri, 14 Nov 2025 08:11:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id C6502356D5F
	for <lists+linux-media@lfdr.de>; Fri, 14 Nov 2025 07:11:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A82392EBBB8;
	Fri, 14 Nov 2025 07:11:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Rwus1PAF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LGA7U8lR"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63B7F238C0D
	for <linux-media@vger.kernel.org>; Fri, 14 Nov 2025 07:11:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763104292; cv=none; b=mqjn0XrZJ2opBfisz18/fbiMspBtZfEUP4vNkNnIC0M01inC5Hi/CBHRme34/NuQbP6YkKkQJ4MeAnt96/QRwe4F8rpqMwP4upmoWcZ7bbgBYu0o8TYNCcvZehOoGTjMO1ZZP7yMvm+26OFINyfaQXiZn4oVzhjS2ugbwguFRHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763104292; c=relaxed/simple;
	bh=NyGElt8WJNJoiwG6vhUR0dKnxrD0vuHyd7oq67dk2ek=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=nsR+C20QpkiVM5j13/VIRUbUiK1Fa1dWd+he/yjmuxnV4yydcMAvqus9JgGvsW6/D2PspxOAHQGFvG8+k99j+xNSqN6GwsyR3tJIRmVVXhMZ6ucotffr6eaReCkzBCfbRBK13ZFAWN7FiyM9ceJmkJUOd+t/wCtbEkon1EQbvJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Rwus1PAF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LGA7U8lR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ADMaiYB1479481
	for <linux-media@vger.kernel.org>; Fri, 14 Nov 2025 07:11:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=vP0KtREwSxFv2mZCu+bDXA
	tD84hbpmh5y5nO0KKI4Bw=; b=Rwus1PAF4SseJ/rWUpeqE6HfToUWw4SZHl9oFp
	Z8LLsjpPA+RK9+QlG4EiisRr3FZJlqrj4iACEPiT3rd9SgbcgAMCIG43xfvzM+mk
	AbZd453hsA1L03VXusGOETAJ50mRdNEPYnhi+KQvJxGIgzlteXTR++ZHrzNd9341
	Ecp1fREgR9m2sew8CIy7QAteTe8KpxPX0V886N/zBMRUqsBrZt/mhtkfEPg4fE+J
	HQjYfh1jbUkY5BALUyRJDbC7TbqQwQ1Cr1n38qLALPg064pMlfL+nh8JmrQqjAPK
	u6ZlxKZjXSGTlbczozA7cMjCWYbQz0G0ZysUtem6QBDLOjxw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4adr9ds6va-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 14 Nov 2025 07:11:29 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ed6466f2baso48545401cf.0
        for <linux-media@vger.kernel.org>; Thu, 13 Nov 2025 23:11:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763104287; x=1763709087; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vP0KtREwSxFv2mZCu+bDXAtD84hbpmh5y5nO0KKI4Bw=;
        b=LGA7U8lRpk5MWSF1NYLI0w6f4c0Ho4FoGKJvZhsy+XbGYY3avDj6Zkhin5Rgf+hZsa
         R0Er3Mfjj9xpHd61HBH8t4lJoAditrMmuXIBg3/1uRBxOnIS/XpYIWc32Y6krnZGl8pj
         1XQpo5WZe0kCx5bU+/eFdSdACMz6ypT+2JSks26xMoUST6AglI3wUkoL67QHG/p/sntv
         cGfABSRp5hwMZFVOvWAQta2t9Ii0EALKE3ly1h+mGArtLDzYrLAHNaUEnncG9yqBFZY1
         4axQbE/rPJwPAbU6l+lseNCXjZ/3lYzHKh197axPVZccgbfSx6gIkX+Y2UsVB4gzoaXA
         5JbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763104287; x=1763709087;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vP0KtREwSxFv2mZCu+bDXAtD84hbpmh5y5nO0KKI4Bw=;
        b=bXOR3Pa6P/cIlQ3sZg5+bMPn3pOLEgMnjLyC2YQxFm9aqbQ2EOmoKqAodcLxq1RuIU
         sBLCIXcKF66IqZh1+sbCX2WuemnrYplhqQLYplK9rkvRk5iLSPCdrC9Hx8CaQohoa+FC
         IphIs0KKt/8tWU1mOyV6+1vKHXAKyXwxkintTtyomdwdcKXoaze63TpcgmW0P8ePZQir
         jRJa7+zmX6S4QrNR/V23XLAIuLKYRG5V68uyiqyRcMjPeh5LciueX7xh+3PyLtGQzVR/
         D+UIG9DYoc36XMAq6IAx5WYnM/M/do6J2NLVm1Ut3rHCtf6DDe7pcZ+GNoynDAs+F3Ok
         +g5w==
X-Forwarded-Encrypted: i=1; AJvYcCVv+2DhpWjNqNPi/JHnKUzWOJOwgiH1KtBKAur2EERjVqVrrgtL670wTMWyugRltyPuNr+BweQtYCJaVA==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywkab+HEXfvpS/I8bGjO5V7+jPRz60iuOglbLPVqKHNekPrnUO/
	TJ3RC6JUxT8xkmILp4FWtDBd9/lrU+4l3hMvGuJLZxEoyWPgYyd6xZPMcb/ss7Octp9opggiNwl
	FMJz6/HacUSJeFe5MGfFFnMXotYXay1cMxYDS8bDA5eGl/uMlDrdk1Hnn40V5ITw+Ng==
X-Gm-Gg: ASbGnctbPXtrcwkquKjCxx+99YH+4SujtOD8gr5nGeBDQfGv5pZPPagbhG82Dp6YY0e
	jh4AosUIrGs/LJ+VMHhHUgmNFhAl52x4bg5U4xufI57O8al1OAzmXudzy9Q4xM/clXXfFVSa/qs
	Z8OTFRTUF9NlUNFMTESyyMGY/Jxus2tweF94UskE09Jj82rvKRf7htgPPXLpv2JDXHq3VIV+mtK
	ozjjHJHZd9fsNz0+doUktf2wfucPkixCoBHNO/CIWvyjM3+MM755FAUdGyXYdPYEIzHw/tyepKD
	7+c0uSJ3/2UwERDwM1EIJCZIfvLXJZQFIVuoPGBIWPp1CFV1MJffTA3wFSNM2HfIT1s2yj/3lIt
	djRXZgM1fw6kkeQkWrVuHoYq2H2BIlcoyR6vT7J5D9yU6/z0pWNEm1gWehkh0Mu1VvQ==
X-Received: by 2002:a05:622a:10a:b0:4ed:a7ba:6a4 with SMTP id d75a77b69052e-4edf20883b8mr40601701cf.22.1763104287152;
        Thu, 13 Nov 2025 23:11:27 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGD3Q6w6GFwZ1WPixcifpOQy8RDF9pjyr3Dlq4PlFOyPzaa6a9z/lPNrOJohRdnswuI0TY3zg==
X-Received: by 2002:a05:622a:10a:b0:4ed:a7ba:6a4 with SMTP id d75a77b69052e-4edf20883b8mr40601371cf.22.1763104286640;
        Thu, 13 Nov 2025 23:11:26 -0800 (PST)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-882862ce056sm26336666d6.6.2025.11.13.23.11.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Nov 2025 23:11:25 -0800 (PST)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Subject: [PATCH v6 0/3] media: qcom: camss: Add LeMans and Monaco camss TPG
 support
Date: Fri, 14 Nov 2025 15:11:17 +0800
Message-Id: <20251114-camss_tpg-v6-0-38d3d9fbe339@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABbWFmkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyzHQUlJIzE
 vPSU3UzU4B8JSMDI1NDQ0MT3eTE3OLi+JKCdN0UI4sUc9NUcxPTJGMloPqCotS0zAqwWdGxtbU
 AWlMU1FsAAAA=
X-Change-ID: 20251114-camss_tpg-d28d75e745b3
To: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763104282; l=3204;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=NyGElt8WJNJoiwG6vhUR0dKnxrD0vuHyd7oq67dk2ek=;
 b=IFKYkWfiYE7tsNO78OaAL5GiPhohpUpaOf8kaeXsSwWBJC4NkYAKkzxp3D/Tb5M2xoRV3zx5K
 2lrTO9MgJaRDdqbUCC9u6iU4/TiH6BD46ZmR+eQ36C0Ihuev25DaHxF
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Authority-Analysis: v=2.4 cv=IaiKmGqa c=1 sm=1 tr=0 ts=6916d621 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=kOGcwOAPJYE99aWUTwcA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: Z9gN3Ojhl2qpYZu-YskOkN91fHE3Ytld
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE0MDA1NSBTYWx0ZWRfX9D9ie49Qyll3
 LyHqiiQCY+GOws9pfQ4a62SKliBpO9kFibIOb9jqRjALlm9j64oWzMWw/2Eki719GAl4OHCvnPN
 FN3WAkOjaGLpO3wF40lVyZh81W/RmhYG6jQz5nk+ki5cySMVob/59Sd2XoL8vig/hIVuThjdDRd
 7YWssBbuhWhHWD3+tfyEGy8pGch4v4S1eI2vRbfK0P5JSaeaBJTEirCIXAFjYzdK0xUenKOouti
 DZrvQ+Uj9pgSm/Wn/dZzgyFR4Ccy5/tySMQ2csgI44F/7zMWgx7hhATdR5Z/kV7Tql3pOnmoFAh
 iGzuklGyyKEo7ZhlXs9+hlFLIdQ0UJA9799tnn21ULXN6OkuQUuDQzgpWSVbPaTmyRtRPW98q3g
 kww7a5AG/Oo9mrCQw8Jiug9TPMLLag==
X-Proofpoint-GUID: Z9gN3Ojhl2qpYZu-YskOkN91fHE3Ytld
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-14_01,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 adultscore=0 bulkscore=0 phishscore=0
 clxscore=1015 spamscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511140055

This series adds driver changes to bring up the TPG interfaces 
in LeMans and Monaco.

We have tested this on LeMans EVK board and qcs8300-ride board with 
'Test Pattern Generator'. Unlike CSID TPG, this TPG can be seen as 
a combination of CSIPHY and sensor.

Tested with following commands:
- media-ctl --reset
- media-ctl -V '"msm_tpg0":0[fmt:SRGGB10/4608x2592 field:none]'
- media-ctl -V '"msm_csid0":0[fmt:SRGGB10/4608x2592 field:none]'
- media-ctl -V '"msm_vfe0_rdi0":0[fmt:SRGGB10/4608x2592 field:none]'
- media-ctl -l '"msm_tpg0":1->"msm_csid0":0[1]'
- media-ctl -l '"msm_csid0":1->"msm_vfe0_rdi0":0[1]'
- v4l2-ctl -d /dev/v4l-subdev4 -c test_pattern=9
- yavta -B capture-mplane -n 5 -f SRGGB10P -s 4608x2592 /dev/video2
  --capture=7

Changes in V6:
- Addressed comments from Bryan and Konrad.
- Add exception handling for the streamon format.
- Link to V5: https://lore.kernel.org/all/20251017-camss_tpg-v5-0-cafe3ad42163@oss.qualcomm.com/

Changes in V5:
- Modify the commit message and change the chip names to LeMans and Monaco.
- Add the header file to resolve the compilation error.
- Remove the definition where tpg_num is 0.
- Link to v4: https://lore.kernel.org/all/20250925-camss_tpg-v4-0-d2eb099902c8@oss.qualcomm.com/

Changes in V4:
- Rebase changes
- Use GENMASK to define bit fields and avoid using tabs. Use FIELD_PREP and FIELD_GET uniformly to access bit fields.
- Link to V3: https://lore.kernel.org/all/20250822-camss_tpg-v3-0-c7833a5f10d0@quicinc.com/

Changes in V3:
- Change the payload mode string
- Change the method for setting the TPG clock rate
- Remove the TPG IRQ
- Format correction
- Remove unused variables
- Merge functions and eliminate redundancy
- Modify the register write method
- Change TPG matching method to use grp_id
- Encapsulate magic numbers as macros
- Link to V2: https://lore.kernel.org/all/20250717-lemans_tpg-v2-0-a2538659349c@quicinc.com/

Changes in V2:
- rebase tpg changes based on new versions of sa8775p and qcs8300 camss patches
- Link to V1: https://lore.kernel.org/all/20250211-sa8775p_tpg-v1-0-3f76c5f8431f@quicinc.com/

---
Wenmeng Liu (3):
      media: qcom: camss: Add common TPG support
      media: qcom: camss: Add link support for TPG
      media: qcom: camss: tpg: Add TPG support for LeMans and Monaco

 drivers/media/platform/qcom/camss/Makefile         |   2 +
 .../media/platform/qcom/camss/camss-csid-gen3.c    |  16 +
 drivers/media/platform/qcom/camss/camss-csid.c     |  43 +-
 drivers/media/platform/qcom/camss/camss-csiphy.c   |   1 +
 drivers/media/platform/qcom/camss/camss-csiphy.h   |   2 +
 drivers/media/platform/qcom/camss/camss-tpg-gen1.c | 235 +++++++
 drivers/media/platform/qcom/camss/camss-tpg.c      | 710 +++++++++++++++++++++
 drivers/media/platform/qcom/camss/camss-tpg.h      | 126 ++++
 drivers/media/platform/qcom/camss/camss.c          | 122 ++++
 drivers/media/platform/qcom/camss/camss.h          |   5 +
 10 files changed, 1248 insertions(+), 14 deletions(-)
---
base-commit: 6d7e7251d03f98f26f2ee0dfd21bb0a0480a2178
change-id: 20251114-camss_tpg-d28d75e745b3

Best regards,
-- 
Wenmeng <wenmeng.liu@oss.qualcomm.com>


