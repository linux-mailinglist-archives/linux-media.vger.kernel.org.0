Return-Path: <linux-media+bounces-64672-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id nKPaNIDRK2qQFgQAu9opvQ
	(envelope-from <linux-media+bounces-64672-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 12 Jun 2026 11:29:36 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 52F2E67848A
	for <lists+linux-media@lfdr.de>; Fri, 12 Jun 2026 11:29:36 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=dv5VJoUJ;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=WHImsBYf;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64672-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64672-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4088031E7528
	for <lists+linux-media@lfdr.de>; Fri, 12 Jun 2026 09:26:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79BBC3AA9F3;
	Fri, 12 Jun 2026 09:26:13 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3E813A785D
	for <linux-media@vger.kernel.org>; Fri, 12 Jun 2026 09:26:10 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781256372; cv=none; b=FGorxef9tsVfqlRkTML+ymMQRQRYYjT2ntDZDARJgy1GZsnqEp/AAaDCZEp2piYt4DPmJ9fId7CuySWwhg1g+PEiwUaMcxjz7GOl31WQddBd7JpvhyyekR38qcBxdHMGXdwLWd0m+NOPpFYnYi9PWVS8UGffpjRwQJ+Ld64HoX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781256372; c=relaxed/simple;
	bh=mHXDVdfr7gnTb95IEhVzRsetkQWLh/qFMSUsTo2m6qI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mSiFK21uB+xHTPCApu+HvaZyoSygDmquDtvx5tW16P42lY4uCKTVYhzUaNwvJaApfFPB8AVNjal1IRjaKgyvdNyvamNl+tiv7dwV4OfRNylT3Fodu9nuuo/37USt2U5U0fgpaBIV8RWGTM04+sSo6Kj6yuTfbVnhELoQ/t7Ymy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dv5VJoUJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WHImsBYf; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65C39Rve2502674
	for <linux-media@vger.kernel.org>; Fri, 12 Jun 2026 09:26:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bXndIN75K0AaXVjopFWYHYCCeFs50ol73V5r1YtNQ7s=; b=dv5VJoUJsmlpNo+m
	i4E7qhiNz7IbrybRY2qrSVxJn3BMAVItXcZKXdxH5/jCUuC2Krsa0Ced8QLpbwmv
	ACdATbAJ/gwdKC4cZHjWpOHVHalDU5dSaz6ubALV13IL853AIvjDBhKuVKc2J4OE
	+Jps5TdwBu1bCKARCmIbv7H6Do1x3AKc3Gc+y0gTC9SJRAoC7YIm40181xAx4vde
	bswSmtu38uQvSYUhfUqyj8wyruJrq6k44ibmoMghVQbMrLFO+L3uPzsUyfiV3BT3
	lzimONwLQZyDpFVvBHxJ6RJmTnBSrCUmH8CZtRhXXmXRya34uWnByB0IyULMRJuU
	Ce4ZYw==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4er0xd30q2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 12 Jun 2026 09:26:07 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-963d9b6b92dso243239241.2
        for <linux-media@vger.kernel.org>; Fri, 12 Jun 2026 02:26:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781256367; x=1781861167; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bXndIN75K0AaXVjopFWYHYCCeFs50ol73V5r1YtNQ7s=;
        b=WHImsBYfigSMyXEzpoPWg6k6kjQ3nTirEwyxwPHerY2hn6YWQtAsMc1iZQzhG4P9ge
         +K8HKhOTlHHjqLGdX7JxYFogt1On4nRXui7Fo/7IFxF0N/usGFk7mwsyI6CGhF2dlGth
         bT/SdPQaatEqs/1URQGJk9U1iTeN2giOedK5q0ms+aPX3c4G42G4mwvRtTlceRmBacWL
         NCVgSdpRCHPcTVyAjolA+TVd1u9yaDOKBmPD9LF/4n3vFU7d7U9VTKj/twn1M/47LwKi
         2HrvbO3sWJtHGTQ/irJgwIIhaGT5obOTDapZGHNsF4BtYeyhQpZN2A7KnmZaD7NJhsmb
         pAIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781256367; x=1781861167;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bXndIN75K0AaXVjopFWYHYCCeFs50ol73V5r1YtNQ7s=;
        b=ZfKPX7jHJDuRpF47F4Yv/cU7n8/TNvZ+eO6R/6K4JiGb+b1y4F/Pf46ccj9GgC92nH
         Ph9edlHhTo+PGb8VFBqae/Oy4ZOU3cYYB3DpQY1+kMX4VDUEKc231mG4BhW/fy4oNO2L
         UndwsiZdpYjW/b8uKc9y48uriWLaJ0ofxArMA2H8QdLW9BTpKOpQK+qcYYw2HI9OwAnn
         VY+vdfQyuSOUtK3BW4lxOQgpX16CACTpxBy0KAhva8Y0CV00HLt3LYDqshG66GUjCrSL
         YWgV7CcUzfzE8m9rkiWKf2WMeKFsPpC5JqyDbAbVPOEqNLljKTgUQvJ1iM/oKSSv42ka
         V5OA==
X-Gm-Message-State: AOJu0Yy2ptCEmAesV98TC+toeTrB1aSgjlRmzVnyK7iOnwnTJrUQ+mtj
	pWgtWfo9Hgp172FpuVOCokNer88RXelt22QFpQAbSmwwX0y599yxIyw/ieYQaYQzanNWRIEn9xi
	ZGe+Ak27ZsZCFYRgdbYTWKGaTMv9036MkAgFPvn9n/YVFyOYeR5M/kaLrUwrait13JA==
X-Gm-Gg: Acq92OGq4PV7kJsZT7NNGmRnMNwHTvSD/PK+XV74BsfWtkgv7F1QoArPK2BZZdm2Uf6
	QeNxeJIIfyRKlmjt5m2cGsKWHFK/lPPlXTBa7zDkmiYE9oBBZ5rIVVgGZxB5eOFeHoxfHI5WUGx
	owOhz/yNrK0fMVXOUmkiP22mWWb5uiaThayh9agKZkcTIYrxt4u00O+/GxfN82it3GhNRE1S2vC
	HZ41f2bktN24DPPO9nyTz3qfV572XKdoLX5VHvXkJAf+vVLgEnys5SP8ccqpVFoWykRivREtCW/
	Xd4Yh7Mg7GX90xX4vog5I+mbGevvlktkPtJIwVOVKXo/vJscWftl1pP5bGeRjLjrKDjD1h4KA0O
	8V6ZXwKEVcniJlS5Bej33+z7k//KNMer4AiH7I8sA/+IAJRc5bNh4tvpvBli7y9+UKZniQbWt7v
	GVELxGGz6Zsjlw8nu4+jb+S2Y/5iHlEkQR6W4=
X-Received: by 2002:a05:6102:6a8f:b0:632:29a5:2b27 with SMTP id ada2fe7eead31-71e88ac8d00mr630897137.3.1781256366914;
        Fri, 12 Jun 2026 02:26:06 -0700 (PDT)
X-Received: by 2002:a05:6102:6a8f:b0:632:29a5:2b27 with SMTP id ada2fe7eead31-71e88ac8d00mr630886137.3.1781256366415;
        Fri, 12 Jun 2026 02:26:06 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39929f190ddsm4560191fa.19.2026.06.12.02.26.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 02:26:04 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 12 Jun 2026 12:25:42 +0300
Subject: [PATCH v4 10/16] media: iris: add minimal GET_PROPERTY
 implementation
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260612-iris-ar50lt-v4-10-0abfb74d5b3c@oss.qualcomm.com>
References: <20260612-iris-ar50lt-v4-0-0abfb74d5b3c@oss.qualcomm.com>
In-Reply-To: <20260612-iris-ar50lt-v4-0-0abfb74d5b3c@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5660;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=mHXDVdfr7gnTb95IEhVzRsetkQWLh/qFMSUsTo2m6qI=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqK9CQh268wxh4KI1kmUq3UxOlKVe3lPkF7/RVK
 9eAGWWjKL6JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaivQkAAKCRCLPIo+Aiko
 1fODB/9cC+BkMa0lNoeX9Uy3YCEaRlzUH+byxpXq0gGIVzZbExdYaeBb8cmoTsM9tuG6Oj2n99g
 wrg9RA5F6KnzELcTVVNBBohGNFvhktQTFVpG0F0dDxOkmhF8f4mXV33g3dw7QK0RjiMPsJKXW6r
 QNmYUy5FXteXKf0RQ+PQnvDz+2BwFtqLPZLJfyCgB6oy+CKugI9m+6wR5feA+NDYMjFdLDYBmNP
 FrVKxtZDXU9ghcOkDG5v2a469LtP+VD0ui1Sv/w2JJiJuAaHGPDMX4WBqyiyWpE2ovzrJmQKZIs
 WoJXXfhRXIrFrBqAwA2aIIq7GQPmcTTBn6ufHvSuJIejOvTe
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: n2BlLL6U0BafzzvdpHHzaEnjHuBsSkYq
X-Proofpoint-GUID: n2BlLL6U0BafzzvdpHHzaEnjHuBsSkYq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEyMDA4NCBTYWx0ZWRfX+/OxRq2vZpJX
 Wv+PAjZOGpLGanHVyTR1ZU1uPZkbsGJelokNw2Nmd/nfgFt84DQ5hEON5WxevhIQZwyMBom5Tac
 BP1UU/jNqqfJFUqIS38LLtb5xjt9H4k/BLfEAHtyEWjLP504p6Xn1ppMkrb4Z5Rn8KR9zahQjdB
 9Ec+v5R3C13TeLTQMVXA1Og4Rga+u7uDcEWb+Zzh3TDcbUxLLA+jqAMvt4zlk2htJWZ3Rwao5mG
 Zrp2DN9RudYiG/yhrEo1cfOwpR5vxL69Fho//WtnBp8N3jbW12vng7vDlQqssu3zAcGoZV+wlla
 TD5A09GxKlZYMR5QuRZBNlsqHJ7T/1P738UDaF9wIgPMeYgymJ+NVdkSBSmKVrWuHx66Ts7tzNT
 dmZJAEfk9q/XBC9SdkwXRcIukxTxqUuwtRYn6Hw98yhLTjGddwC/dlWGEsmn7otuIKPQcHm4OoG
 YBT/iMQ5pEA87gzH44A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjEyMDA4NCBTYWx0ZWRfXzVvjdE06cF3x
 SFojxDDAY1Wtk93xrQfYazExLJni3i+x5sqj7WqLJeMBw+cNdAGPRW+GM6JHF14t6uHHgRcF98I
 FXWzN3ajWiriHw5Fhy15Vh/HXt2FT70=
X-Authority-Analysis: v=2.4 cv=O6UJeh9W c=1 sm=1 tr=0 ts=6a2bd0b0 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=4y4YWC2vBVg0P_IM3hEA:9 a=QEXdDO2ut3YA:10 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-12_01,2026-06-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 phishscore=0 priorityscore=1501 spamscore=0
 suspectscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606120084
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-64672-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:vikash.garodia@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:mchehab@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:busanna.reddy@oss.qualcomm.com,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:dikshita.agarwal@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,pkt.data:url,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 52F2E67848A

AR50Lt with the Gen1 firmware requires host to read
HFI_PROPERTY_CONFIG_BUFFER_REQUIREMENTS property, otherwie it doesn't
update internal data and fails the HFI_CMD_SESSION_LOAD_RESOURCES
command. Implement minimal support for querying the properties from the
firmware.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_hfi_common.h  |  1 +
 .../platform/qcom/iris/iris_hfi_gen1_command.c      | 21 +++++++++++++++++++++
 .../platform/qcom/iris/iris_hfi_gen1_defines.h      | 15 +++++++++++++++
 .../platform/qcom/iris/iris_hfi_gen1_response.c     |  6 ++++++
 4 files changed, 43 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_common.h b/drivers/media/platform/qcom/iris/iris_hfi_common.h
index a27447eb2519..16099f9a25b6 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_common.h
+++ b/drivers/media/platform/qcom/iris/iris_hfi_common.h
@@ -121,6 +121,7 @@ struct iris_hfi_session_ops {
 	int (*session_set_property)(struct iris_inst *inst,
 				    u32 packet_type, u32 flag, u32 plane, u32 payload_type,
 				    void *payload, u32 payload_size);
+	int (*session_get_property)(struct iris_inst *inst, u32 packet_type);
 	int (*session_open)(struct iris_inst *inst);
 	int (*session_start)(struct iris_inst *inst, u32 plane);
 	int (*session_queue_buf)(struct iris_inst *inst, struct iris_buffer *buffer);
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
index 7674b47ad6c4..99e82e5510ab 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
@@ -1117,10 +1117,31 @@ static int iris_hfi_gen1_session_set_config_params(struct iris_inst *inst, u32 p
 	return 0;
 }
 
+static int iris_hfi_gen1_session_get_property(struct iris_inst *inst, u32 packet_type)
+{
+	struct hfi_session_get_property_pkt pkt;
+	int ret;
+
+	pkt.shdr.hdr.size = sizeof(pkt);
+	pkt.shdr.hdr.pkt_type = HFI_CMD_SESSION_GET_PROPERTY;
+	pkt.shdr.session_id = inst->session_id;
+	pkt.num_properties = 1;
+	pkt.data = packet_type;
+
+	reinit_completion(&inst->completion);
+
+	ret = iris_hfi_queue_cmd_write(inst->core, &pkt, pkt.shdr.hdr.size);
+	if (ret)
+		return ret;
+
+	return iris_wait_for_session_response(inst, false);
+}
+
 static const struct iris_hfi_session_ops iris_hfi_gen1_session_ops = {
 	.session_open = iris_hfi_gen1_session_open,
 	.session_set_config_params = iris_hfi_gen1_session_set_config_params,
 	.session_set_property = iris_hfi_gen1_session_set_property,
+	.session_get_property = iris_hfi_gen1_session_get_property,
 	.session_start = iris_hfi_gen1_session_start,
 	.session_queue_buf = iris_hfi_gen1_session_queue_buffer,
 	.session_release_buf = iris_hfi_gen1_session_unset_buffers,
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h b/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h
index 0e4dee192384..bb495a1d2623 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h
@@ -35,6 +35,7 @@
 #define HFI_CMD_SESSION_EMPTY_BUFFER			0x211004
 #define HFI_CMD_SESSION_FILL_BUFFER			0x211005
 #define HFI_CMD_SESSION_FLUSH				0x211008
+#define HFI_CMD_SESSION_GET_PROPERTY			0x211009
 #define HFI_CMD_SESSION_RELEASE_BUFFERS			0x21100b
 #define HFI_CMD_SESSION_RELEASE_RESOURCES		0x21100c
 #define HFI_CMD_SESSION_CONTINUE			0x21100d
@@ -113,6 +114,7 @@
 #define HFI_MSG_SESSION_FLUSH				0x221006
 #define HFI_MSG_SESSION_EMPTY_BUFFER			0x221007
 #define HFI_MSG_SESSION_FILL_BUFFER			0x221008
+#define HFI_MSG_SESSION_PROPERTY_INFO			0x221009
 #define HFI_MSG_SESSION_RELEASE_RESOURCES		0x22100a
 #define HFI_MSG_SESSION_RELEASE_BUFFERS			0x22100c
 
@@ -205,6 +207,12 @@ struct hfi_session_set_property_pkt {
 	u32 data[];
 };
 
+struct hfi_session_get_property_pkt {
+	struct hfi_session_hdr_pkt shdr;
+	u32 num_properties;
+	u32 data;
+};
+
 struct hfi_sys_pc_prep_pkt {
 	struct hfi_pkt_hdr hdr;
 };
@@ -574,6 +582,13 @@ struct hfi_msg_session_fbd_uncompressed_plane0_pkt {
 	u32 data[];
 };
 
+struct hfi_msg_session_property_info_pkt {
+	struct hfi_session_hdr_pkt shdr;
+	u32 num_properties;
+	u32 property;
+	u8 data[];
+};
+
 struct hfi_msg_session_release_buffers_done_pkt {
 	struct hfi_msg_session_hdr_pkt shdr;
 	u32 num_buffers;
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
index bfd7495bf44f..23fc7194b1e3 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
@@ -591,6 +591,10 @@ static const struct iris_hfi_gen1_response_pkt_info pkt_infos[] = {
 	 .pkt = HFI_MSG_SESSION_RELEASE_BUFFERS,
 	 .pkt_sz = sizeof(struct hfi_msg_session_release_buffers_done_pkt),
 	},
+	{
+	 .pkt = HFI_MSG_SESSION_PROPERTY_INFO,
+	 .pkt_sz = sizeof(struct hfi_msg_session_property_info_pkt),
+	},
 };
 
 static void iris_hfi_gen1_handle_response(struct iris_core *core, void *response)
@@ -652,6 +656,8 @@ static void iris_hfi_gen1_handle_response(struct iris_core *core, void *response
 			iris_hfi_gen1_session_etb_done(inst, hdr);
 		} else if (hdr->pkt_type == HFI_MSG_SESSION_FILL_BUFFER) {
 			iris_hfi_gen1_session_ftb_done(inst, hdr);
+		} else if (hdr->pkt_type == HFI_MSG_SESSION_PROPERTY_INFO) {
+			complete(&inst->completion);
 		} else {
 			struct hfi_msg_session_hdr_pkt *shdr;
 

-- 
2.47.3


