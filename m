Return-Path: <linux-media+bounces-64665-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 5QqWIfnQK2pUFgQAu9opvQ
	(envelope-from <linux-media+bounces-64665-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 12 Jun 2026 11:27:21 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id EF2BA6783F3
	for <lists+linux-media@lfdr.de>; Fri, 12 Jun 2026 11:27:20 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=FC4OnYya;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=A8MShnKS;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64665-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-64665-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id F00153155CBC
	for <lists+linux-media@lfdr.de>; Fri, 12 Jun 2026 09:25:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C567397E80;
	Fri, 12 Jun 2026 09:25:52 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25FB33812F2
	for <linux-media@vger.kernel.org>; Fri, 12 Jun 2026 09:25:50 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781256351; cv=none; b=m1VUAhvdwcYxQrOSc7cifDqPiTxPnEnZ8JGPkkVtlMDSFrCPmm2CT2DhuNrS1sEcQNmhMl7pQh3EbhU6Dmt4WLLHBM6sXHaJGksLXXKj/TWdEytXxdoRcBqMOUF757JiryJSsV0zhlXtpBCKFk8NLpCgC6iuYOugziG46BNk8bI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781256351; c=relaxed/simple;
	bh=SUPr9326R8/I85NqmtSxzGXasITRZ38mBZxBYOCk/p0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FcPiu1IN5yVsU0PTQqM9QzVmyRcaXBigfunBgmXHg6wnxwkN0qmCIAjpfTTdtdYjyn52MVuL+eKsFyirn5WqOaXwoJ7fAtgn4i9n11b5xOCzJ8hK232rvBW1Z2rXMJC1Phx5JT0AwElrK0U1raKso4/6U49ia3JDEVV8wIjcEjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FC4OnYya; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=A8MShnKS; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65C39WSB940542
	for <linux-media@vger.kernel.org>; Fri, 12 Jun 2026 09:25:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rZBfUegtVT46gf+3kV/ulvsSL+G4ssvBArwyOeiJ5Vw=; b=FC4OnYyanQwlf6YP
	sRu0Kr0XS2TOxOLpct+/px4A9tn42duMpcNMoHaFT3iNxZCj/L+qOyOkdwfys9do
	5ctg0SnNUg0xcvdsoEwNg1flp6zjOmYR7Wkiaf4ABwzjv99Sdc8uYk20nuuhaXD8
	XFhJNvA0sB+OQ/lZz3meBO20Mk9SCc3bK+qSAkgzCcg+9lkL2Q2ekBNWt6NMSBA/
	0uF5h6wVul0AfO/DrdonumDOAMVJiaWvRkWFQzesDpk7ZRwgzTYxJP92nWgpK3zU
	d0OO3dMOPxcjOje4OkPaChfEhfY1NwBwh3hugtH52JnuoRUJDLcxpMi+H19dJ1Fd
	ZfMqGA==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4er014kb68-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 12 Jun 2026 09:25:49 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-9639158a44dso268656241.3
        for <linux-media@vger.kernel.org>; Fri, 12 Jun 2026 02:25:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781256348; x=1781861148; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rZBfUegtVT46gf+3kV/ulvsSL+G4ssvBArwyOeiJ5Vw=;
        b=A8MShnKSNtcXVVI2wKMG8uFLy5CIms5VW0tKLvQ+m/j/fTIG9FlKIIJkLdOK6GsJCo
         Vn0EpnbgQ2fZGOmp2oyjZec6WUfzORhnpRh81yHsFPrSn6+Lu6ENuKiK9vF1SWug1hV+
         hnD/vDihiUxDpMPdaYX//mlrrP+KSlJKViKZtO+lfzYsjFTW3zOsnHd6kIC8V8wcohsd
         egXhUrsU9+ebKZrvhXsEY8112nL4bkFQUqV9hFBlhd7+MwXQcN7LpNg0/iBOIbtLzIiu
         TDnedkmidkajdH88kWx7dm4ecthQHNRoH8iEEpj5LwL5P4l0Rn41HsWmIs86Gz85AGGL
         VIRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781256348; x=1781861148;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rZBfUegtVT46gf+3kV/ulvsSL+G4ssvBArwyOeiJ5Vw=;
        b=sm1aD8b43PxSUfWC1bpY4Kg0QFdW19HTe4IeyLati1ggGGmIidcibj9Nw2Nl/of9cZ
         WGKw0bdifqt8E5rHTd7ycnEMwPySzn96zJwn1xFeOwfD86YEbcWYoy3f7QK9GNXKKQd7
         28QJzgbxtiXfA0u3q6FMaz1AKy+U0K/kBtPk01wQVyqFzlbW/8aRexYUVQgwAo8JqU5j
         MaOuyHWtLekF79n2993z18Rz8T1a2uzN7uYLSQv41PXIXlq/dusdgFBI+8WwzZfM5EDQ
         VmUFsNqvpYfIyBnZZYdf+ZTSoRkMsMEtXIzeueVJPFY/FIU9cNoGr/nwoaF+6lyfeDDk
         18YQ==
X-Gm-Message-State: AOJu0YxXqYFEsHk4NaZvtyJaFjoBRI7PjlXGLzVwcVSsJHlKENKBlOgz
	vQgZdcdObA7uatwnQdBr08UBFlH6Ezlk5lDaOldSVqc7BWgX36p1m5mgSFrYidu9uEiwDYB+Z/H
	RCaBlOuTGpIUhh4P6ynMV23S4Xsw/FrXcC6FHzGTn0BPLsdTcmfHDLFJfm9XpdSVz7Q==
X-Gm-Gg: Acq92OHv/X+d5g2/2oGofb4/S1TmTZx2E1My+4oLbigUgirPt2dojAV0lIdy8+mzis4
	xHbddQ+lb+JbNZLXVl61GjWGmoGDfa1FCu/J6hoRl+KmGTQ39McuJLAZjedlDdmMM6yDmM5l3ii
	vFsfGrMXWuWfqflz3DDr5pmOfQtCbuuhQjvIGZs/7Vl1x9xRfZivzLYv558cqTw6Ffkn/1xtDun
	T219X9+A4PDta20bOW23si3QFIm0yOjjLmzdjg5BLicEhTmhfBVb2zCitjSQwlUmng6prVZlIxI
	m+UrYPuzJdCjTuknkKos8yXYaSr2lJun7wg1Rd9FGhUGbJBWkMJg1/kQ+XcLGisTi6GlaKpK1hf
	79V/xw7/WUSlrpnDxkKGZ4QJejl1NAwsnDitrBpFAyN4IE5/a//Y7toTmz26veS+JmXvHvkJYv9
	dJ0V1tuhzmGcjL5eEDMgt2WOEabZ0ScAm7tqo=
X-Received: by 2002:a05:6102:e0e:b0:631:b834:e05f with SMTP id ada2fe7eead31-71e88b2429amr696321137.11.1781256348443;
        Fri, 12 Jun 2026 02:25:48 -0700 (PDT)
X-Received: by 2002:a05:6102:e0e:b0:631:b834:e05f with SMTP id ada2fe7eead31-71e88b2429amr696312137.11.1781256348047;
        Fri, 12 Jun 2026 02:25:48 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39929f190ddsm4560191fa.19.2026.06.12.02.25.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 02:25:45 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 12 Jun 2026 12:25:35 +0300
Subject: [PATCH v4 03/16] media: iris: Introduce set_preset_register as a
 vpu_op
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260612-iris-ar50lt-v4-3-0abfb74d5b3c@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4447;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=vk2n05YaqyNL1lA1l7CdzDHPMAEMMeRGvxRtE9L+Mhs=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqK9CP06uA1MfAx9NVcJQtYISoHjxpkdnctXAUv
 EI3dWTY7OuJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaivQjwAKCRCLPIo+Aiko
 1dByB/9h49Ludasl5mHPJr2+ZuLwbzoVRnrgxMRn2mQlejV2yKPfTWhCS4U680kJTVRLvPZIW0C
 irs3/gMJzbjUPZmidXm9Drhi1YDO6nQldgNbmwwA8h5dEQmbwtPmLj5NTtsSLhk5dHEyzqRbEve
 iWdVdnZ9GRUSvv9wwyggzAtxEi2F9Aceo07gwANcqZTbcO6++ZKeXbKsO2cRzsOTavArVJYtQgb
 tkT6qOi/P+Ba3dbG1cFLvRtpMF/jsL+cIFDtUJ9Ce5NuiL7fhRJxhFCHF1YSy0ZE7TkVQuivpa5
 GRapbEFfQeXYlVJP0bMRbn0KmiSAzHSDDPdYWi5xWntfOyaA
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: tEOpafFOixDGFfclZMT3DXjS4CM3cyu3
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjEyMDA4NCBTYWx0ZWRfX/xtOyh1ywv1v
 j7lCEXegElSwFafvjbbZtqrlFKXY9A8q+xJdA5+kM4dvei3SmxP0Xda27Jo2qih8XaNXZnu1cN7
 DLdqJdR4XLQ09L1pUenk1cCGVT6qo7M=
X-Authority-Analysis: v=2.4 cv=Qp9uG1yd c=1 sm=1 tr=0 ts=6a2bd09d cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=4Uh0hlRDs2lXuULb_e4A:9 a=QEXdDO2ut3YA:10 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEyMDA4NCBTYWx0ZWRfXwVVBe6oRqCnN
 NEnCEwxQ7FU4tqaWbr9jtYFAxSr2bJtoewNwTzc49IwH90YAzOzxsUui0NTv/nQpqy/G2Agfs+n
 mbrmX3DAyXjjxYwob/HsE2v50RzSwGERjS9peYnCkb98iaGnh+KykMotV0a1/UOp3Z0UjWdfuwm
 EnzacuDfI0Mt4yDPs9WwcmHZLmVVYGYBscgRO5sbox5qPfrTRXOcMy1a9kvLlE/VjMv5Fcr8LIM
 Gk4/3fLV9Xr9yPgGYWADM/nvefIXG5Cy/usd9H0Iwl5fkBJE9lXh36YOrRNH6Zqw1I5LBVjvbE2
 gyMMRFK4/S273U4h5cyqpvnJjmBfmTNBykQiLwTGMjHZqTPC9CrP9DT0NI3Poo5FDmDDZhWDB7w
 sElQdcI+wKcnVcZPkFZfpIlBaikytkwAayIWu6CGV/zZhynfVOOU8g9pFM5kjPqfXkQhAb2hjz4
 k6XClevIMzdOe3qAuyA==
X-Proofpoint-ORIG-GUID: tEOpafFOixDGFfclZMT3DXjS4CM3cyu3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-12_01,2026-06-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0
 priorityscore=1501 phishscore=0 adultscore=0 bulkscore=0 clxscore=1015
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606120084
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-64665-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:vikash.garodia@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:mchehab@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:busanna.reddy@oss.qualcomm.com,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:dikshita.agarwal@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: EF2BA6783F3

From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>

The set_preset_registers sequence is currently shared across all
supported devices. Starting with Qualcomm QCM2290 (AR50LT), the register
programming would differ.

Move set_preset_register into a vpu_op to allow per-device
customization.

This change prepares the driver for upcoming hardware variants.
No functional change so far for existing devices.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Reviewed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_vpu2.c       | 1 +
 drivers/media/platform/qcom/iris/iris_vpu3x.c      | 3 +++
 drivers/media/platform/qcom/iris/iris_vpu4x.c      | 1 +
 drivers/media/platform/qcom/iris/iris_vpu_common.c | 2 +-
 drivers/media/platform/qcom/iris/iris_vpu_common.h | 1 +
 5 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/iris_vpu2.c b/drivers/media/platform/qcom/iris/iris_vpu2.c
index b8714dcbad10..2dc121a3f5e8 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu2.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu2.c
@@ -45,4 +45,5 @@ const struct vpu_ops iris_vpu2_ops = {
 	.power_on_controller = iris_vpu_power_on_controller,
 	.calc_freq = iris_vpu2_calc_freq,
 	.set_hwmode = iris_vpu_set_hwmode,
+	.set_preset_registers = iris_vpu_set_preset_registers,
 };
diff --git a/drivers/media/platform/qcom/iris/iris_vpu3x.c b/drivers/media/platform/qcom/iris/iris_vpu3x.c
index 3dad47be78b5..dc02ced1b931 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu3x.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu3x.c
@@ -261,6 +261,7 @@ const struct vpu_ops iris_vpu3_ops = {
 	.power_on_controller = iris_vpu_power_on_controller,
 	.calc_freq = iris_vpu3x_vpu4x_calculate_frequency,
 	.set_hwmode = iris_vpu_set_hwmode,
+	.set_preset_registers = iris_vpu_set_preset_registers,
 };
 
 const struct vpu_ops iris_vpu33_ops = {
@@ -270,6 +271,7 @@ const struct vpu_ops iris_vpu33_ops = {
 	.power_on_controller = iris_vpu_power_on_controller,
 	.calc_freq = iris_vpu3x_vpu4x_calculate_frequency,
 	.set_hwmode = iris_vpu_set_hwmode,
+	.set_preset_registers = iris_vpu_set_preset_registers,
 };
 
 const struct vpu_ops iris_vpu35_ops = {
@@ -280,4 +282,5 @@ const struct vpu_ops iris_vpu35_ops = {
 	.program_bootup_registers = iris_vpu35_vpu4x_program_bootup_registers,
 	.calc_freq = iris_vpu3x_vpu4x_calculate_frequency,
 	.set_hwmode = iris_vpu_set_hwmode,
+	.set_preset_registers = iris_vpu_set_preset_registers,
 };
diff --git a/drivers/media/platform/qcom/iris/iris_vpu4x.c b/drivers/media/platform/qcom/iris/iris_vpu4x.c
index 02e100a4045f..f608a297d4a3 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu4x.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu4x.c
@@ -368,4 +368,5 @@ const struct vpu_ops iris_vpu4x_ops = {
 	.program_bootup_registers = iris_vpu35_vpu4x_program_bootup_registers,
 	.calc_freq = iris_vpu3x_vpu4x_calculate_frequency,
 	.set_hwmode = iris_vpu4x_set_hwmode,
+	.set_preset_registers = iris_vpu_set_preset_registers,
 };
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.c b/drivers/media/platform/qcom/iris/iris_vpu_common.c
index ab41da1f47c8..a49113b0da23 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_common.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu_common.c
@@ -483,7 +483,7 @@ int iris_vpu_power_on(struct iris_core *core)
 
 	iris_opp_set_rate(core->dev, freq);
 
-	iris_vpu_set_preset_registers(core);
+	core->iris_platform_data->vpu_ops->set_preset_registers(core);
 
 	iris_vpu_interrupt_init(core);
 	core->intr_status = 0;
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.h b/drivers/media/platform/qcom/iris/iris_vpu_common.h
index 09799a375c14..21ed4c9bd5e3 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_common.h
+++ b/drivers/media/platform/qcom/iris/iris_vpu_common.h
@@ -22,6 +22,7 @@ struct vpu_ops {
 	void (*program_bootup_registers)(struct iris_core *core);
 	u64 (*calc_freq)(struct iris_inst *inst, size_t data_size);
 	int (*set_hwmode)(struct iris_core *core);
+	void (*set_preset_registers)(struct iris_core *core);
 };
 
 int iris_vpu_boot_firmware(struct iris_core *core);

-- 
2.47.3


