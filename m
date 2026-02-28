Return-Path: <linux-media+bounces-53813-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yPaGAFOnomkK4wQAu9opvQ
	(envelope-from <linux-media+bounces-53813-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 28 Feb 2026 09:29:07 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 91FBB1C15D4
	for <lists+linux-media@lfdr.de>; Sat, 28 Feb 2026 09:29:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0549E3076532
	for <lists+linux-media@lfdr.de>; Sat, 28 Feb 2026 08:28:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E56E53D9033;
	Sat, 28 Feb 2026 08:28:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ieTBdvWJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LnD12k2i"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF36C3D902F
	for <linux-media@vger.kernel.org>; Sat, 28 Feb 2026 08:28:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772267336; cv=none; b=pOiurmnhpsjVojsGtGLJpFkSnMpXXF0dXRANa3mJ0/ObUZa51/bhZZkTZS0O64QIqJZ2c5Ras2a++nCbxzawNP7lg+u1U7q16wfqS0qrezvdcBs9nKyKQ0xZvD+WiMo/1GCbFMxfv0cXzNSQO0mUWHCedXscawONxlQiKvY5kcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772267336; c=relaxed/simple;
	bh=0nr0pzY6ErYrmvTorWsh0WrbeWMW8rIdPmn2lok6lWI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=W5DqqxkdakhXxklqidOBcHW4YAZK8IDY6g1u21Uz0LaXxSImLVVTyta48bBu+fMJiJl5lszuP9n3nn6gNPPn5B4MuOs0b5AQk81XIx0AYF2sG2lZbOUSshlDo/YLIuH99QosBQomFC/Q0derhfnLwarqS3vlAs46wJUu0RESEyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ieTBdvWJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LnD12k2i; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61S6NcNG950979
	for <linux-media@vger.kernel.org>; Sat, 28 Feb 2026 08:28:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=29xgwz8GHNrcojLIFVnw/d
	Q2p1z2qJmLnpOCARft9IQ=; b=ieTBdvWJ9W/ZhgujtOpX345RqdQXmjEO6Ip/5Y
	aKbLQvJ4/Bf8qZ4G/tDh8fQEmBkEf/pxuqm6Frjn6FENfpcAexdSjHdyXUD6E6f7
	4DQAbHeBoKaG7BgdrRgDI8irsQcvOe6K91P0RInbY8MASQ28Yzy08ODI/D0SYb5m
	ItO83qiZDovZHVJZY0+SdKsIASYbC4MSCZ/cr+1pD1HsVOM9fPqz9Ob3TS+9Cjbr
	DY+V0M6JdJ0v02yKSXjhhQYf9LOCuPqjXl6XINaw1jGoAs7Ke2Qrm4h7/8psvIVi
	bF+2Odyhuo/V0+UrQKG/HeDMFqf8YwiEjJ8+DjGMqyKc3kTA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cksn40h4y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sat, 28 Feb 2026 08:28:54 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cb3fae6f60so2845619085a.1
        for <linux-media@vger.kernel.org>; Sat, 28 Feb 2026 00:28:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772267333; x=1772872133; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=29xgwz8GHNrcojLIFVnw/dQ2p1z2qJmLnpOCARft9IQ=;
        b=LnD12k2i+pZ0rF80p7pF9wTk1AysJ5CJQqnO1o4lV6gw+mLPxgF6DJrS4vz6rttKJT
         62a9CvrRwyPW0Y8eBCUuSshAtrpKyE1TPoKjz3V9vTVwgEeSxnNqVfRzIHn5K6w02O5W
         W3ScRA/nvCYrkWGQPj7FdDSUbkGitcFH9eA+53h3Ze0IV/YIe2Y5iLgbsT/zH5m6DaMG
         Oe5DIo6+oSCHLsmR1RsVKqm0CYeYBc7lOTeUmeUsix1diTXxvS5iH/qHpixSxIvZXh/U
         nMBvf222NHCgrTdIKzVgX0V+jw3hve6niaumn/Lq0UrBwxLZuzzud7SiCZdA5cHWhDYQ
         5h+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772267333; x=1772872133;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=29xgwz8GHNrcojLIFVnw/dQ2p1z2qJmLnpOCARft9IQ=;
        b=Jhs57oWSOMFmJ+oT3uiWwqFD2jRwfrioocy4F0OqhlaUvLx2UYFP5vnHd03uRrH+lJ
         VBsHMm0pNC3hpVvo7L5UEs03UC12GLc8tBNoSGoFfKLOgXZmvMBJWKZ8Wlj1U+6+Q87K
         g/ig9R+v1dGK+VD7M52Zaks+Hlk8aRIyiYHmpFSIw1oV3MxlEPIeTUoelvo7gN5Xfnd3
         LAwl8dfjBdVH1NHB8/IcmfaDN5dlncVAccSowAzhRI9OVkhvJdE6us0hiLSwdCFLxVH6
         oZnZY/+/iz5MLKb/iKrubGL9A5YhMOagGSUI2Vmwph4qZZ3hsNYCiXB8euAReqdIsbyY
         1CXw==
X-Gm-Message-State: AOJu0YwUkpqfN8rcFqoeSLuOUtp/fcQCINEuVeyrfho1h/FoN7Po6uGI
	e151Yte0VbgP0FrVK8U46gt7lRTOR9sRaFr5Anbar3mUwP1QiTxTH3tVi8LOdD3MlgbRMpoCPWk
	EgUxBDTu9U82D0eoJmX+nSlXauI94PBpHFYuyW5hD0EBSgFrPrgnxxgpwt9h0RawMvQ==
X-Gm-Gg: ATEYQzx+LbYOsu3WXHiavdeRqnEJg5C5HfoDr2kmlKNFKmhXDON22De6D3djvVaQ9we
	7gm3ljI+iVVzLsy3zuVrpoj4Kferdj5Bb1R8AE8jTvV54hJaMvILFLlhVMtyfEMsS973LnFFs3t
	4XO4PbAbr0ZKxK57iFYKWDVKcH3KuTRBp2LclVlHJ0xMtjpRxj+ypoLdQleEiq7mhn7eOOJIX0+
	g3uyzI47V+DxowLWQ1IvlkH4zbNtzaZ6yd/4mJXy1AWXKag/W14f3PXzcq+EnKu1q9CCj05tBIt
	wB27LLdZP1cmYSf26LmgPFsQg+dj2arL0y5hQvdDa5WIKC5o7tYv5mfAM66RI7Tq8h5S5LTeVMC
	+2waL0z5i4vqbig1PwYCmirU/rAX8ZPw2aRA68tcv9WkcI7oZYxOZaiQdYqTN/1lq1g8I4rJaJR
	0hmqPfmx8eoLQVGmBtUYcin3MA4QCjhtTqLTI=
X-Received: by 2002:a05:620a:4586:b0:8c6:a587:377f with SMTP id af79cd13be357-8cbbf3f632dmr1156425985a.36.1772267333082;
        Sat, 28 Feb 2026 00:28:53 -0800 (PST)
X-Received: by 2002:a05:620a:4586:b0:8c6:a587:377f with SMTP id af79cd13be357-8cbbf3f632dmr1156423685a.36.1772267332639;
        Sat, 28 Feb 2026 00:28:52 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-389f2f4b158sm17970711fa.6.2026.02.28.00.28.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Feb 2026 00:28:50 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH 00/11] media: qcom: iris: rework platform data handling
Date: Sat, 28 Feb 2026 10:28:45 +0200
Message-Id: <20260228-iris-platform-data-v1-0-c2c53539f948@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAD2nomkC/2WNyw6CMBBFf4V07cQWoQK/YlhMy1QmkYdtQRPDv
 1tlY+Ly3OTc8xKBPFMQTfYSnlYOPI0J1CETtsfxSsBdYpHLXMs8PwN7DjDfMLrJD9BhRLClrSR
 VRafwLJI4e3L8/J5e2p093Zf0HfdRGAwEdhoGjk020jMeBwyRvPjNNlmKlkqpGlYal7Cn3Y1nC
 A+OtoeurPHkjNVYmGYt/m0tlZK7t5iHBamdLqwxJ4X0EdptewOer1XKAgEAAA==
X-Change-ID: 20260227-iris-platform-data-c5c80e84d1a7
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=4933;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=0nr0pzY6ErYrmvTorWsh0WrbeWMW8rIdPmn2lok6lWI=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpoqc/i6d3TXdIXwZ8Qj8hwtQ32CaLrhKHGYQzB
 Zau6jKOpQOJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaaKnPwAKCRCLPIo+Aiko
 1djIB/91rCJ1zwQPQcv4D/F1Cuq+d4tJMX8GFCHwsDmHfNrage2phrZqmSRTeDQqGcglr8zgO8p
 pL9yVGzVBM8yAGNUkNC0YTAIm31Z4JVnr2FzvuzAX2kCNWhDEsVtmJqvanpWUYvu1P2pauUwtkl
 BcBDPZ/1Z7l+2djb2JloFQBbPrjn/BEbX9W9aDrfOnGmd4VxIVErNDPl8zPgj22uT49vqqpzmDE
 v1IpO/kYZNrNpirDu7C6TifgQhE1JmIsxp8R5q1ezPQKqWel7ujgdwhrHMFHq1fFDWG+Y7bcBpS
 ErpF2t99mLnSxTAtkf1IcPTbW9jc0Dsywco+D5Q0N/V5+Aql
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=Tq3rRTXh c=1 sm=1 tr=0 ts=69a2a746 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=lWie69A6hENyb8yNhxIA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: vAPpoRaxRpIrvvP8bzSc84rmwjXj1poQ
X-Proofpoint-GUID: vAPpoRaxRpIrvvP8bzSc84rmwjXj1poQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI4MDA3NyBTYWx0ZWRfXx2XWOpHJi/ii
 +GATMfD6+fOywwXM9IhQTJ/bCwphU4hqR4T4NupmvfVMqb+1sepY2ISVEbtAGvTHG6KR8IhlIdd
 SfWjz569TIsTvrgMqEPapOLmOm09y4nRMRkjTBbTEDCRYdQlC2ikhEWNTiSxhS4MhfDodTg3o2b
 ZXcMIDoDHcfWjr/K7u0wAMrpby4T+Glq1ZvAX3SElvqUzENVhIqTu9ku/mfN5W9sEqpo3IeiGsk
 PRofDLB2ebNULPM1VIfclYuYVZCCtRd+TBUyOrhCN4yJl31BHRFIVEvOV2j98JBXcRHmO//g5Y8
 EnKZndYBfLP8XrLIADJ2xq/D5ONEu7TxX2hpwF/LyNqltNprFvfiR4Hrec3kTJgcmI1Vk2EzHAw
 zkifeR6ADGx+72zPX6VtoLMcgSMsoa+uherqYnT5xH82vphzuYI0CGzB5e1OIE9fsv80uaRiVK8
 V/f7ccUIJbwZR1jQqgw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-28_02,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0
 adultscore=0 priorityscore=1501 malwarescore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602280077
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-53813-lists,linux-media=lfdr.de];
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
X-Rspamd-Queue-Id: 91FBB1C15D4
X-Rspamd-Action: no action

Currently platform data for the iris devices contain a mixture of
hadware and software description. This seems to work in simple cases,
but as the driver matures, it leads to strange decisions.

For example, the recent series extending SC7280 support to be able to
use HFI Gen2 firmware ended up duplicating SC7280 data, using
SM8550-related structs even though the hardware hasn't changed.

Another example, SM8450 and SM8350 are also simiar cores (and similar to
the existing SM8250), however SM8450 will have to go to the same file as
VPU3 cores just because of the firmware interface.

Last, but not least, this leads to a lot of copy-paste duplicates
between platforms, having similar firmware interfaces. It damages
readability and complicates adding support for new platforms.

Rework Iris platform data, splitting it into hardware description
(definied by the GPU core) and HFI Gen-related firmware data.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Dmitry Baryshkov (11):
      media: qcom: iris: drop pas_id from the iris_platform_data struct
      media: qcom: iris: extract common set_preset_registers function
      media: qcom: iris: handle HFI params directly
      media: qcom: iris: simplify HFI params handling
      media: qcom: iris: handle HFI subscription properties directly
      media: qcom: iris: don't use function indirection in gen2-specific code
      media: qcom: iris: split HFI session ops from core ops
      media: qcom: iris: merge hfi_response_ops and hfi_command_ops
      media: qcom: iris: move get_instance to iris_hfi_ops
      media: qcom: iris: split firmware_data from raw platform data
      media: qcom: iris: split platform data from firmware data

 drivers/media/platform/qcom/iris/Makefile          |   6 +-
 drivers/media/platform/qcom/iris/iris_buffer.c     |  88 ++--
 drivers/media/platform/qcom/iris/iris_common.c     |   8 +-
 drivers/media/platform/qcom/iris/iris_core.h       |   3 +-
 drivers/media/platform/qcom/iris/iris_ctrls.c      |  54 +--
 drivers/media/platform/qcom/iris/iris_firmware.c   |  11 +-
 drivers/media/platform/qcom/iris/iris_hfi_common.c |   6 +-
 drivers/media/platform/qcom/iris/iris_hfi_common.h |  13 +-
 .../iris/{iris_platform_gen1.c => iris_hfi_gen1.c} | 191 +-------
 drivers/media/platform/qcom/iris/iris_hfi_gen1.h   |   6 +-
 .../platform/qcom/iris/iris_hfi_gen1_command.c     | 133 ++----
 .../platform/qcom/iris/iris_hfi_gen1_response.c    |  11 +-
 .../iris/{iris_platform_gen2.c => iris_hfi_gen2.c} | 531 +--------------------
 drivers/media/platform/qcom/iris/iris_hfi_gen2.h   |   5 +-
 .../platform/qcom/iris/iris_hfi_gen2_command.c     | 301 ++++++++----
 .../platform/qcom/iris/iris_hfi_gen2_response.c    |  11 +-
 drivers/media/platform/qcom/iris/iris_instance.h   |   4 +
 .../platform/qcom/iris/iris_platform_common.h      |  71 ++-
 .../platform/qcom/iris/iris_platform_sm8250.h      |  29 ++
 .../platform/qcom/iris/iris_platform_sm8550.h      |  31 ++
 .../media/platform/qcom/iris/iris_platform_vpu2.c  | 126 +++++
 .../media/platform/qcom/iris/iris_platform_vpu3.c  | 214 +++++++++
 drivers/media/platform/qcom/iris/iris_probe.c      |   4 +-
 drivers/media/platform/qcom/iris/iris_vb2.c        |   2 +-
 drivers/media/platform/qcom/iris/iris_vdec.c       |   6 +-
 drivers/media/platform/qcom/iris/iris_venc.c       |   4 +-
 drivers/media/platform/qcom/iris/iris_vidc.c       |  14 +-
 drivers/media/platform/qcom/iris/iris_vpu_common.c |   5 +
 drivers/media/platform/qcom/iris/iris_vpu_common.h |   2 +
 29 files changed, 816 insertions(+), 1074 deletions(-)
---
base-commit: 779cae956c8316aebc1946ef86ca001f99658270
change-id: 20260227-iris-platform-data-c5c80e84d1a7
prerequisite-change-id: 20251119-venus-iris-flip-switch-d59a3fbc6a4b:v4
prerequisite-patch-id: 615a763749fdc0c4ee184478bc64120972d8c7a1
prerequisite-patch-id: 6d85e3db422bc7f16246249288a17b92f6edbc09
prerequisite-patch-id: 579d712ec3f942ba0c362e242c71361c151092b5
prerequisite-patch-id: fa4629a3909fbae3917d8c067cce4f673ee857c0
prerequisite-patch-id: cbbd40736f7a797ff76b0fe2b1ddfb559e14e666
prerequisite-patch-id: 5b50917dcfef01db13af320cbd1cba15fd5fa16f
prerequisite-change-id: 20260110-iris-ubwc-06f64cbb31ae:v4
prerequisite-patch-id: 258496117b2e498200190910a37776be2ced6382
prerequisite-patch-id: 50f58e5d9c6cd2b520d17a7e7b2e657faa7d0847
prerequisite-patch-id: af2ff44a7b919da2ee06cc40893fbcd3f65d32f7
prerequisite-patch-id: f3a2b9ef97be3fa250ea0a6467b2d5a782315aa5
prerequisite-patch-id: 6bdd2119448e84aacbdc6a54d999d47fc69dac81
prerequisite-patch-id: 38cc9502c93c71324f1a11a1fd438374fc41ca84
prerequisite-patch-id: 059d1f35274246575ca4fa9b4ee33cd4801479d1
prerequisite-patch-id: 1cf4ea774a145cdba617eb8be5c1f7afe5817772
prerequisite-patch-id: 46375dcd0da4629e6031336351b9cf688691d7c5

Best regards,
-- 
With best wishes
Dmitry


