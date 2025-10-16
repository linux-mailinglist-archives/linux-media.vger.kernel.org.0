Return-Path: <linux-media+bounces-44704-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 13DD9BE2BC0
	for <lists+linux-media@lfdr.de>; Thu, 16 Oct 2025 12:23:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5C3C719C61E0
	for <lists+linux-media@lfdr.de>; Thu, 16 Oct 2025 10:23:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 749E432863D;
	Thu, 16 Oct 2025 10:22:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KM35PjRC"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ED4132862C
	for <linux-media@vger.kernel.org>; Thu, 16 Oct 2025 10:22:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760610177; cv=none; b=A6d4ZQB0TxQ/m+xg2oa5mfQZOvoAlsQ4fvmKxYCt13brmmZYE4/LqhLM/LkKLmLMzD4FGqpEfnD4H9sDElv47MgHlljGgSPvRWWsgcLfEYFjge+UPTDVvfRdajX9BPGpqD6thyY8js4ttnsxazETu0CUBl2DDtrHwic9+sj4Twc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760610177; c=relaxed/simple;
	bh=I9VswCZxjcOq69ij3zBWOQIB67DabNCkSG+J/cCx0JY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=GIeR6lOhe3c9VBKDm8CR3MLQmNbEEK1+SvlvGzrQKUSVgwF1NwjNt4f8M2Gl0oMNcqs6TG/oKnapc0c7m2L+nbjRAOM7D5nwIatp0MRQfiXW4V8A4PkwvlMmbRSSxqorfSdVK6p3CLUkfdv2VEVQBPHyn0WdwTJkFt6ND60jkj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KM35PjRC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59G6b8Ki003473
	for <linux-media@vger.kernel.org>; Thu, 16 Oct 2025 10:22:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=hDoIxXS0NZAzvm9AzoX+o8
	wdS79L/6mlJ9xQBMQLOEU=; b=KM35PjRC2NMMPdWw/9/LFM+8aL+o8DoD/77ogw
	NqJ2eqoBK69bPPYu/dEgCa1VyzXPg2dtetV+1/kZdaI2jyifzkMDnHlrrJPqypaY
	rUpXhON5b1YEAg4L3+mZ14yuvbHwaEeotfp87f08g0xifkDhNl0grWuH/iWYW+i9
	8K6S/zpbdp5xiToOYRMIEpbCAdhxDfYNj4GGBIRM64Axm8VCreIIh23nBg8m8lBy
	dxL556sevyKsrP3/DCQZItfEsDGVTq3XhxFUaJyToUjC8+H45KGP/3duc/T892j8
	rt6AQP208EFdIqt7kosymt9rJbwYOWpBXk82IIL6q+Ctt/YQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49sua8pjp2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 16 Oct 2025 10:22:55 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-78efb3e2738so17371316d6.3
        for <linux-media@vger.kernel.org>; Thu, 16 Oct 2025 03:22:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760610174; x=1761214974;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hDoIxXS0NZAzvm9AzoX+o8wdS79L/6mlJ9xQBMQLOEU=;
        b=QIbVqEW8N/Tr33vaWH0CBTRqpoTdcgLzZwzvO0tLNNtUBFn4ZqLGX3g7Iz7e/QzP5F
         HbHy5dh3cDQHwGgkQleTGFXsNQgGv8r3/PLo47xCIAaEpuosowtFTjbw++ANEYMNB6Gj
         volNqMz2Os7XdfUESN8f80j0Xhnv5AT+rEyd43whzEN1NfzCgZsXB6E07AfGARrMD6H4
         7XUWjK+Ud3KfTPbK4eAOx3MpZC1F8NFR7GV6DZOIaMlkxqFM73bjyiFNqnxKR0Bbzu+R
         7RoQ7JqyXXWV0sQV9BC17/SyCCS+0jLkIWc47hTe+Nm0wFgTaZSYXEL4Ys/qunmzHOBY
         ra7A==
X-Gm-Message-State: AOJu0Yz5KDYQSsZjse3MJg750u7Cxk8Ljig0HRp8AaJHhfOUh2iTdfnB
	QiMmJSIrUdNBGmUhfIK5V/bNuhlbFKxHkRN701giwkmesS2j8/Z1beUChcGVQKDMfJTxBWHUUyg
	dPM9EzOkGCf/rmLOOow3dE92+cmWBvIiFYDRQJOLzexiffTdCRA32cp6tx1dbqdyLdg==
X-Gm-Gg: ASbGncuV6hmHvcVAyhdhqSSXczwKFA2WkFadNN2OC300HDPA4i1dHBZ41XCv31rvs43
	foGSeglrTiYmVuyPIQCzjzydyIU54/UkQT3GYcd9SKCIyymFrk32YQv0o7fd07jfwgUtIsPZMeh
	UO+EwfS02hdMLDdgOAokRBlrWBtMvGd2mHd1Th+Nwh8cSAQsty4ApouuQw0LGdAPotOE2NlslER
	+oBwVORyqnDQwnQTbjmc1Z+amXYNaRZ1HlcjF6OOli/f693mO8crf6DnWCRS37zuvUGXU9GpJ7t
	33fVNJl/LXX7aAEbQbOPl6/Tw6IE0JoiheaTuWYgtjW+dezDPOg/7veRQlzKjiW/rnOvBBnGNjR
	Wupd1v7tgxKvkRXs52flDx792KEzk+H23o6nmAC4ioFFQ65xdau6k06pU3/5Nc5d7fw==
X-Received: by 2002:ad4:5f4b:0:b0:809:aa63:1c34 with SMTP id 6a1803df08f44-87b2efa8496mr424424606d6.32.1760610174254;
        Thu, 16 Oct 2025 03:22:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH6d6oYLYeAIExz8iIXHij6zsjbOQRta+Z1UCL3YKsFUr27c+K/XPIglf22UQsocFsJpABHiw==
X-Received: by 2002:ad4:5f4b:0:b0:809:aa63:1c34 with SMTP id 6a1803df08f44-87b2efa8496mr424424346d6.32.1760610173829;
        Thu, 16 Oct 2025 03:22:53 -0700 (PDT)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-87c012b3ff9sm36777576d6.56.2025.10.16.03.22.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Oct 2025 03:22:53 -0700 (PDT)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Subject: [PATCH 0/3] media: qcom: camss: Add sm6150 camss support
Date: Thu, 16 Oct 2025 18:22:42 +0800
Message-Id: <20251016-sm6150-camss-v1-0-e7f64ac32370@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHLH8GgC/x3MQQqAIBBA0avIrBMcQcGuEi3MppqFFg5EIN09a
 fkW/zcQqkwCo2pQ6Wbhs3TgoCAdseykee0Ga6xDg15L9uiMTjGL6LigTy4kazBAT65KGz//bpr
 f9wMDOqAiXgAAAA==
X-Change-ID: 20251016-sm6150-camss-ab16c59c2019
To: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760610168; l=1565;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=I9VswCZxjcOq69ij3zBWOQIB67DabNCkSG+J/cCx0JY=;
 b=g9B5EyS1GxW0yAwaD0Z6+w85dCqr5D+Ua30ZzHq3BG9VwHlg/ZBx090hFoQzMueW+8yiO/VHX
 WCpcaeqihkdD878/RkHqCzeqBRWtRg3nQFVZ5CzVxKhtC62V0d2V2tw
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Proofpoint-GUID: A0Dq821h8jqAz_pGjIegNzybFgpWikqB
X-Authority-Analysis: v=2.4 cv=e5MLiKp/ c=1 sm=1 tr=0 ts=68f0c77f cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=Vb9n8AilU_5XW5ZOngoA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE0MDEzNCBTYWx0ZWRfX/TgU7YI8lzwd
 1D7xB3iCCp00VRg52b5QxkavekeCta8cyth4zcZ1csGoe4OAIcMpaiW23+BP3DTnKArK+YEjR+5
 8953vvQE6FV+87/ZujcWI7FwIgm9yDPyx1Zoh7okL3QfNvi8VTEIvgUw1GxqshgsIsmPrKuLtsN
 WSvC3oxnztPyLAdgG4SRKu6BmE/Eya0fKlm5qnosFntWE1O6O+D+JNFmLNs2nJTW2R0C365fnwp
 niUsfxCYEENYhqhh2Hmx99+CeS4w8OKbsrC7jCYM/Fed6+Rs5yaJe8Wqs0sLaZV0vZ2bnaohGxK
 5B/6j8piJVTjtOtWu6Arfwytyof57+YqBiQJn/CtGMD79+0JM5mJeoWC/Vq+5F54DaJGpGKr0Bg
 Q7/9udCv1avSPa/mAw5wr8WQlj1dRQ==
X-Proofpoint-ORIG-GUID: A0Dq821h8jqAz_pGjIegNzybFgpWikqB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-16_01,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 spamscore=0 adultscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 malwarescore=0 bulkscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510140134

SM6150 is a Qualcomm flagship SoC. This series adds support to
the CSIPHY, CSID, VFE/RDI interfaces in SM6150.

SM6150 provides

- 2 x VFE, 3 RDI per VFE
- 1 x VFE Lite, 4 RDI per VFE
- 2 x CSID
- 1 x CSID Lite
- 3 x CSI PHY

Tested on Talos EVK board.

Tested with following commands:
media-ctl -d /dev/media0 --reset
media-ctl -d /dev/media0 -V '"imx577 9-001a":0[fmt:SRGGB10/4056x3040 field:none]'
media-ctl -d /dev/media0 -V '"msm_csid0":0[fmt:SRGGB10/4056x3040]'
media-ctl -d /dev/media0 -V '"msm_vfe0_rdi0":0[fmt:SRGGB10/4056x3040]'
media-ctl -d /dev/media0 -l '"msm_csiphy1":1->"msm_csid0":0[1]'
media-ctl -d /dev/media0 -l '"msm_csid0":1->"msm_vfe0_rdi0":0[1]'
yavta -B capture-mplane  -n 5 -f SRGGB10P -s 4056x3040 -F /dev/video0 --capture=5

---
Wenmeng Liu (3):
      media: dt-bindings: Add qcom,sm6150-camss
      media: qcom: camss: add support for SM6150 camss
      arm64: dts: qcom: sm6150: Add camss node

 .../bindings/media/qcom,sm6150-camss.yaml          | 283 +++++++++++++++++++++
 arch/arm64/boot/dts/qcom/sm6150.dtsi               | 121 +++++++++
 .../platform/qcom/camss/camss-csiphy-3ph-1-0.c     |   2 +
 drivers/media/platform/qcom/camss/camss-vfe.c      |   2 +
 drivers/media/platform/qcom/camss/camss.c          | 186 ++++++++++++++
 drivers/media/platform/qcom/camss/camss.h          |   1 +
 6 files changed, 595 insertions(+)
---
base-commit: 1fdbb3ff1233e204e26f9f6821ae9c125a055229
change-id: 20251016-sm6150-camss-ab16c59c2019

Best regards,
-- 
Wenmeng <wenmeng.liu@oss.qualcomm.com>


