Return-Path: <linux-media+bounces-49569-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 62F34CDE86F
	for <lists+linux-media@lfdr.de>; Fri, 26 Dec 2025 10:19:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AB50F300D48B
	for <lists+linux-media@lfdr.de>; Fri, 26 Dec 2025 09:19:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75B79288517;
	Fri, 26 Dec 2025 09:19:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="S3eX0x6w";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GAEgYB2d"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E499D273F9
	for <linux-media@vger.kernel.org>; Fri, 26 Dec 2025 09:19:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766740768; cv=none; b=FODxCpOnebOnUE62i0lqAB2tQL8EYq/oxZiHqtGjMqViklbmxqsLon0XVt6fpvGlNSV+D0StfsazIo8Vz6XNFKUnnn9qCweLNaC3K6gwyGeFHxiUhj15ouWP8Aj+nGk+kZqmmCHCn1AOrrVsRP0teh/Z6P3aHZMTtv0GsqzkyVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766740768; c=relaxed/simple;
	bh=GZMVRYhU+AUdWZVvCOHNJdwpKXiKPbdvJH1lXrSlMp0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=IarbpsMrxaJNO7fcbuUuX4km9XDJHB7isil44RDltiLDdteJ8s7wQMpM76snC21s85xL57Q6yYQ4lPuLmYen7d3pLUrtOBLNpoHfRX1/ERDpiTb59/W8IvqqA25EL52OA+HGBpC6EEfjnwf/BmkvQmJW2vGOOqdgoSXCZwfmFno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=S3eX0x6w; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GAEgYB2d; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BQ8c21n951139
	for <linux-media@vger.kernel.org>; Fri, 26 Dec 2025 09:19:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=kqi0TBYDTBmFyf+3+3KX9f
	iObtBvKkiX8I2/RVrc/qo=; b=S3eX0x6wGFWv3Yj+nZIZy821F1t9fbJCew6lSq
	nwzTQ1DTB9nBHGjSlfCubFOrmO/1enES8LlmkhjycLdJbYBQK20umZQ/bwex+tTf
	qfJeo7oUn6izm7oN4FLi3IVsITv4xwfJ/KtbZiSuFvjc/jRw4APKQinkw+cPyRCE
	XEVB1oTpX29ddsoBXvCrXnGr+BaC8SQf3WFfePF6Aokc4zhnIEckh8W4OiRPuaDk
	ZfAva886RxeGmQ19oX7onWIK+9A3RIqhV3ZJ7fXEmaGcs6pKeMq8vp6SE5zRcMBt
	uVsvzMiaeDPdayJFwEGcMBHkoNoSKCUsfE9KzrfMvhd2LCaw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b8v9y2sp6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 26 Dec 2025 09:19:25 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-88883a2cabbso257536296d6.0
        for <linux-media@vger.kernel.org>; Fri, 26 Dec 2025 01:19:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766740764; x=1767345564; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kqi0TBYDTBmFyf+3+3KX9fiObtBvKkiX8I2/RVrc/qo=;
        b=GAEgYB2dC1Fy3liPB7zNy9jSNUNjU1xPOB/siLiKMe+v1S7q/ibMcLzbm2uvWLsf+j
         HuzlOOqAvR4ayRUyLtvfDSUlGgVobQUndPXTbn9AH8f+tIOcr8NPx/i83ElN1XZo+VqK
         UK1DsFSe4CiR0ALCUc5ZSAIiMFRr2zkovkKVNR/sROlSzrEzPOvx5tyQUaHO1QSxg+9o
         ZWjEx6RLNp1I6yLLYYW32PyofJ0jwcKNCTLyyZjQeZzd8V8KL+9H0WCJy+R1pXSa9WU5
         /+cMdxl1SDoeY+GbTnKqCSOzajAWqvqR84RF4V/yr4467Hu+oZy73afdC30mV49NP9qZ
         21bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766740764; x=1767345564;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kqi0TBYDTBmFyf+3+3KX9fiObtBvKkiX8I2/RVrc/qo=;
        b=D56mYh9wC0HlWhL1abjNhPDC2LO1h00+qgNovoROSMlkM1E5Z45U4XZbHZ6h3fcn0z
         AC6obiI6T446OakdNZgc9ZHxRkpa2SXkn0oXyVB/hF4Njkt20H+8dO1CEUd9pV7aPHHz
         cBV4bChwUT3nUPHvI5v5QmgByG7fm8HPPlL/fnSTsGH87ubY28MdFC9LlKsxpt/xk3Hi
         QNyqwTay6t9g5nWfD8RkAfeBj47wXYeEGgr+mL3tuC0usTSyFTr6WRkLkjGRwdU+XEM1
         laqZ7LfPv6RY8lQGTepbRhO6US2OtCbl5jfDTlOW505z6MT1kXXR64kzmjtDjLGsWEOY
         /dpA==
X-Forwarded-Encrypted: i=1; AJvYcCWFLgKXntS6YmUHfnDQNP6t4ooboZ4I9WjU76cZKX7/d8GK/8gC3iSpEPP6gz3u5ZEC5BEDulgBWecWCQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywnx4oU63DLTZTV4h9sUN5YsGT5xLOw4iM5g2GeF1K6lCK1zmSQ
	mGbiQck78+E4i5KPKMISB6eU1hPPUzO16f22yIcuMUuGRd/I4wGFnNQuP0OB+Lc/PCJonM+oL1M
	4A2sWZuIXnaEpsx/KztHJDcPHf/I0R5WYVR6YiLTj5HThyhmgdrkpMiOlBfJvZ3e+mQ==
X-Gm-Gg: AY/fxX6Fswy9Ld700qcHEBkqlNZzjx8WvFwzq7jxu/EhqecgmWmLnpJdUiKxZXMySt7
	bwQMzS38GfWbbjwNs0Vv6ItHowaNxW4y1UIMuWMD+yg/7bk6exBM7c5G+kvQ9pjLopvpmiQ7gV4
	AKtPpCsI7uEBUl15BAaY/bKAcL08RLHaROWQCAqMdMg3S9sUCRqV1jJmd5Fun0QelovyxJFTcCG
	UDDeINc96MDE/NavtZIoZUFXYkesHuEul6gagnKLeinQXZqQrVTZorPJ/WCxuESJiD6aGiEELzD
	lx0sYo3kgNrOV17Ys3K+ZewuqV4khfgdv8lDctaNe/soeaVLdHQdg2fg78e1c56xJBFv46sBLgd
	ROG9ZXxY8a27WiCvGUPJ09Vci5AHBzpwVizlRfjk2S2ZlDvIY7jW4Zl0f84Nw6FIbtWfchg6dwI
	lb
X-Received: by 2002:a05:622a:4183:b0:4ee:4a3a:bcf5 with SMTP id d75a77b69052e-4f4abda1925mr289892681cf.67.1766740764338;
        Fri, 26 Dec 2025 01:19:24 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEIgHP2FQZqe/Lh2igCUqW0yGJhmY/0wpG+31XpI0LMZEDm2jsnq9VeW+kfzOcxXq1JSby74A==
X-Received: by 2002:a05:622a:4183:b0:4ee:4a3a:bcf5 with SMTP id d75a77b69052e-4f4abda1925mr289892521cf.67.1766740763873;
        Fri, 26 Dec 2025 01:19:23 -0800 (PST)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4f4ac62d53dsm160612891cf.19.2025.12.26.01.19.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Dec 2025 01:19:23 -0800 (PST)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Subject: [PATCH v7 0/3] media: qcom: camss: Add camss TPG support for
 multiple targets
Date: Fri, 26 Dec 2025 17:19:09 +0800
Message-Id: <20251226-camss_tpg-v7-0-ccb536734805@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAA1TTmkC/02OQQqDMBBFryKzbsQk1WpXvUeRkuiogWo0E6VFv
 HtT7aKbgff5vD8rEDqDBNdoBYeLIWOHAJdTBFWnhhaZqQODSETKhchYpXqihx9bpoVUssi1zlI
 FoT86bMxrd93LwJ0hb917Vy/8mx4Wzs9/liVjCZN5Leui0ShlcbNE8TSrZ2X7Pg4Hyu2wO5zm8
 KD/TWzbBw2cEbK+AAAA
X-Change-ID: 20251226-camss_tpg-b23a398bb65a
To: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766740760; l=3606;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=GZMVRYhU+AUdWZVvCOHNJdwpKXiKPbdvJH1lXrSlMp0=;
 b=3u423GlczqEyRG72a1AJ1FG4zxwbxb6jQjMnM3p8pynXBwM+6zRy6tLnpBmGAKPmx/iL8G/au
 BuUCUWwUYWNClkVsy6/Z9gzpFgG+fFhAHYjfWIb/R6UsqBNRpzWBPjU
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Proofpoint-GUID: WBFvxNTKEtJ7Py5ezVdt5V-LU2Rc8Lu7
X-Proofpoint-ORIG-GUID: WBFvxNTKEtJ7Py5ezVdt5V-LU2Rc8Lu7
X-Authority-Analysis: v=2.4 cv=Uolu9uwB c=1 sm=1 tr=0 ts=694e531d cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=GpE7naLpSaSh0VXB7mUA:9 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI2MDA4NiBTYWx0ZWRfX57VGXsE47/CT
 LZu/b+x6dmJPk9ZKmnJdMhw2lseZlLwKoUyJ9WE1h+Ije80Y+4kdbjDY5Gd2MfXLs3DGG7oErUG
 BQHF4QIcV39flLawJyucIBxoskh32NKeRngNlf47NGEDFPJ/8pj9QjEueGTCxDhpHYexPkikGrx
 hmW0f612ItKBcUfM/TR8m+YWytSNe4hHFZIrYfQ10umW7/2h+I6Erp/xxF9K+Gfu9+OkZ7vOX5I
 cA2dTUFaQ3tp/IzTHrLTMsdzWrqIpnQ9bYsmKZ9yh1JyO9WLqaBspp+ZPpOc9SjbuiI1bypijft
 GfY8QyslATzN2sJb1V0plhzlVQVfmfisqwcklssmm3r93kWAVwR6cY0mxIRtP7LoSnBbT8D8DWU
 dGqjFkiX9GcC276bBLgFNiyTkJuswGJtOF/wH1q9cbl/s9O29hHmEX88uC+xvcrIWsQFQOyoHdr
 HvENQkNNIUeGvrsKdfQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-26_03,2025-12-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 suspectscore=0 adultscore=0
 phishscore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512260086

This series adds driver changes to bring up the TPG interfaces 
in LeMans, Monaco, Hamoa.

We have tested this on LeMans EVK board and qcs8300-ride board and
Hamoa EVK board with 'Test Pattern Generator'.
Unlike CSID TPG, this TPG can be seen as a combination of CSIPHY
and sensor.

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

Changes in V7:
- Add TPG support for Hamoa
- Add differentiation of register bitfields based on hardware version number.
- Fix the null pointer issue when TPG clock is 0.
- Correct the clock dependency for TPG.
- Link to V6: https://lore.kernel.org/all/20251114-camss_tpg-v6-0-38d3d9fbe339@oss.qualcomm.com/

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
      media: qcom: camss: tpg: Add TPG support for multiple targets

 drivers/media/platform/qcom/camss/Makefile         |   2 +
 drivers/media/platform/qcom/camss/camss-csid-680.c |  16 +
 .../media/platform/qcom/camss/camss-csid-gen3.c    |  16 +
 drivers/media/platform/qcom/camss/camss-csid.c     |  43 +-
 drivers/media/platform/qcom/camss/camss-csiphy.c   |   1 +
 drivers/media/platform/qcom/camss/camss-csiphy.h   |   2 +
 drivers/media/platform/qcom/camss/camss-tpg-gen1.c | 257 ++++++++
 drivers/media/platform/qcom/camss/camss-tpg.c      | 710 +++++++++++++++++++++
 drivers/media/platform/qcom/camss/camss-tpg.h      | 127 ++++
 drivers/media/platform/qcom/camss/camss.c          | 183 ++++++
 drivers/media/platform/qcom/camss/camss.h          |   5 +
 11 files changed, 1348 insertions(+), 14 deletions(-)
---
base-commit: cc3aa43b44bdb43dfbac0fcb51c56594a11338a8
change-id: 20251226-camss_tpg-b23a398bb65a

Best regards,
-- 
Wenmeng <wenmeng.liu@oss.qualcomm.com>


