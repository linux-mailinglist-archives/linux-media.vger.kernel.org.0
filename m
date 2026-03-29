Return-Path: <linux-media+bounces-57472-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AF7oMWNzyGkNmQUAu9opvQ
	(envelope-from <linux-media+bounces-57472-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 29 Mar 2026 01:33:39 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FAC13504E8
	for <lists+linux-media@lfdr.de>; Sun, 29 Mar 2026 01:33:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AB871302AC17
	for <lists+linux-media@lfdr.de>; Sun, 29 Mar 2026 00:33:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BEDE140DFD3;
	Sun, 29 Mar 2026 00:33:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZbRocqgy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NNLhKviu"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC57D10F2
	for <linux-media@vger.kernel.org>; Sun, 29 Mar 2026 00:33:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774744401; cv=none; b=Y4+PPlFRs/yvOFX3Hp5QF+TEOIAux/e47kU0FzcRotOwG2rvBKqRWXxOVizcBve+6FItWxuDbdCwmaDn6KhVyzsqmWuaqQHmBk3/ifdU54hdkVtJD5p1Yk4YN+6IcuQvjXU95zMZqdXPvhAh94nCvm2imU2A/zTnYDxkZt/2Djo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774744401; c=relaxed/simple;
	bh=SjkvZmad7Ea65W5NUnQALYfC1Q4a5zu6TUBfKgTtnHo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ERNQVyH2TmblQoFfsjjxc723YN2nQ5Ismj92CJ+0sfqRTJS0TC9nzHmiyfjuVMcJPX/0MwpLlCk7kdw5BmCJ2gEcM7ALifQ+qYx4IHMoHxw4OqnS06k27x1ouTnFxGQGdhdtYU8BawKNxHgkSqnU7hu2s2bOV9qqJB5qcAa6aRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZbRocqgy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NNLhKviu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62SKVbur807448
	for <linux-media@vger.kernel.org>; Sun, 29 Mar 2026 00:33:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=2xsd61szdOs7ONQnaP3wgU
	350xfQuQaGXOKQkd6ZSQE=; b=ZbRocqgynknDRTZnatLQJVGX4divav1BXV0JDF
	XDXLWOg8Ycg1to+F7O2ieCnQRKIewcTvVurSYNb4kLm+z4i43ugeMDYCgLOTj8jh
	Su7RE8k46zWXXvVCuYvGW4OoQZIh3+FgfRTUJvh3/BxjCdGFXrWMQM7RUbe3D039
	bg5wRubX2fjvRM6cmCu2ePaZ0NmiEshABTUzL5MJiNQ3OcyfRFRDiNDQqZ9pYswn
	NBxP19+ALJVfvw4oj148oxzO/PLKeQUruNBPS9SlttzS9dMM0mPljHv4fWRpQXFl
	v+DlgGZIHAM5nOw4rMb3DYpYBCnxHlsJEq4wqqJ0c9D/TDxQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d66afsvb6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sun, 29 Mar 2026 00:33:18 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-89e56a8c863so47704476d6.3
        for <linux-media@vger.kernel.org>; Sat, 28 Mar 2026 17:33:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774744398; x=1775349198; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2xsd61szdOs7ONQnaP3wgU350xfQuQaGXOKQkd6ZSQE=;
        b=NNLhKviuMEevvVjyMOIdQs8rzByOJgufkonIZwVo9c8omwQgJBfPWn/8BCwOMAkgQ5
         /h8BFOHJ6M9xqSms4LEgFrFPm+5PxTRTZWWag6kqUK5/S8oSyxsM0B9M3XhW5tI4N6F2
         9GzsuiaTqld+Qaru2tylJyndL/P2UMVvjJRWHEk4OHC+DUODmr6w9dPzErBa3T+3Dnt9
         XtGCdY+r1nmPVNqjn/Xod4GdNI+ppevhdxdI0/IiFbszaVRuDUpUjshW4qtwjieikPGl
         SczWJQaJXVrAzydUAY97FjIwjx6rrhE37WH0qULAWiAIqpOc1hfRZ+6EahZQxku+Ltkm
         EyDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774744398; x=1775349198;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2xsd61szdOs7ONQnaP3wgU350xfQuQaGXOKQkd6ZSQE=;
        b=dGSKOHC5i6kCHzWP4z9yksT2yPMb4Vev17TzpBiwv5RA/ejLRSxDTjNyNL6FtScYIw
         BT/z6Cz1UlMDJPYoiWaEq/KtS8MOO7sOhM4uUg8mlXgGdTssKfacs27ielN6GT5nTETy
         ecOTo0cvAXVqfV9Nbd3GhgD4uv94mU+Kd8GW9rfuxz4zw+8HkKkxnbcmdlItBoiO9sf8
         o5bjLk2yC081MPqUzUlvh9oxyBCOCDjWtnXeLwkLJ7bswmpSZvlchwoZ8xiGVEYaQdcq
         JfqtAuvOu1mWcVn6l0P7rxNB7u1zkU5f1kuAXiFZhGYUcm68yWyo1k61Ci2PzhGKcDVw
         ZxBg==
X-Gm-Message-State: AOJu0YxMnvQ5l/RTfndOlY3R0UbKQNqZtdPULWDMQiLotVs2Ext4PB4o
	K17/G5fMZRncBMV1yEUtmi13lY6m2nxfqlPf7h7pBtpQl4vX590wS2Dz4/YgtyB5fXn0JetmKpn
	O5wz/hHNfynA++dxMXJis+ZG4iKwPtkRYIfJ35VpFcLwyd5AaPbzIwoiVpH7agRh7UA==
X-Gm-Gg: ATEYQzyyUndx2/Lpd4Hrjims4c7ktkT/ye4FgHGtn+EJh1iqJ+PIZa9FO/dMG9jYusG
	T7CWBQ1qBH+An/gIvSrpL9b3bf7LNvxr3JpCFmh+AcuFG5dijxzu4H/RhmPyuL06JBwTFB+zp1t
	GjojVTPnOugyeFQ01SQIHNirI1Yc7dCx6iUcK+Zm5ELExewLhf65YCS1R6J2GnuUcVB+tuNa8zd
	zfYmDSbILdMvlJjZkwCWpsY5c8cdo0rnmTFNrjcNP/lVAZuu4n1lFQ+ToWMvVyPYUhU2SmCyy3o
	2Zp33oAPdKpedqpTj1SugaN3DqYSLuqTKr4xGNJnb/oyFCiKiinbH4znq9nANDEDfWn7jA3SAkk
	WW9ElLtkunr6BGOKUJkcIbTgbYRCZlkodiAu+s8A2sbYjWIUrZ4L0OGG2LX0Q1reBS2jA8gosIO
	G1PsxXE3kOMk8xDKnHWAjzP9Zmras0PqyaE1Q=
X-Received: by 2002:ac8:7dc2:0:b0:50b:46c2:bb78 with SMTP id d75a77b69052e-50ba3a00035mr108418381cf.63.1774744398004;
        Sat, 28 Mar 2026 17:33:18 -0700 (PDT)
X-Received: by 2002:ac8:7dc2:0:b0:50b:46c2:bb78 with SMTP id d75a77b69052e-50ba3a00035mr108418241cf.63.1774744397554;
        Sat, 28 Mar 2026 17:33:17 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38c83892035sm7024731fa.22.2026.03.28.17.33.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Mar 2026 17:33:15 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v11 00/11] media: qcom: iris: rework platform data handling
Date: Sun, 29 Mar 2026 02:33:01 +0200
Message-Id: <20260329-iris-platform-data-v11-0-eea672b03a95@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAD5zyGkC/4XS22rjMBAG4FcJuq5aHUaH8dW+x9ILSZY2gjhOL
 cdtKXn3yk6hhrXJjUCC/xvmR1+kxCHHQprDFxnilEvuz/XC+dOBhKM7/4s0t/WBCCY0E8LQPOR
 CLyc3pn7oaOtGR4MKlkULLXeG1OBliCl/LOrf1/t9iG/Xio/3R+JdiTT0XZfH5nCOH+NL58oYB
 7Ie2xyWoVzy+9Apnq+FVpmWzgrFaEJpo8BoAE0zqf/DinOOP7mFSKd8oeU9j+FIW4VOJh+0A7+
 ZrqM5u+eu/j1QppOG4L3kLjYTkHm1Yy5jP3wu/U182e2nKbvV1MQpo0EEJZXEhGD/9KU8v13da
 S7juR6LOonHkqiSC4lJ7WSwEHYk+StJzjclWaVU5ygboIXY7kiwluSmBFXigMK0CZDpPUk9ltQ
 sWQYWXIJq7Uj6saRnyWjpvZUmtWJHMmtJb0pm7ikYTIzJpPhe43Yt4aZkq6SUQ6V19EnvbYcrS
 bBNCaskUSJqk8Cove04W1M7X5NVC7RH4VM0ftO63W7frTU/vTMEAAA=
X-Change-ID: 20260227-iris-platform-data-c5c80e84d1a7
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=8492;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=SjkvZmad7Ea65W5NUnQALYfC1Q4a5zu6TUBfKgTtnHo=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpyHNHkPdgsKteG5ktJfJo9dmSH2zOJWv5jxFA3
 7o4vCOWRGyJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCachzRwAKCRCLPIo+Aiko
 1bDtB/9u1L7hX8/L6AH0AgVYFVHuF2FPasoecI3AC0jSEBrwnbV1Sclj7RLlkn84BgSz9QAt2Y/
 9Ypqifln63yDmxegQPDRo3VASe5zS9kdRI7zoUlIws8+SMPn9ftzQ4J95t3JZdO1PM18cNLG1Zb
 L5f+QWlcXJnPfHU97IYNnrlKaYjmUnIxU7iYxXISq2MNbrXeF2fnPkNLpSaPpxIm1TSzGV9ZuQ/
 bDQ7PAYwp191zSTGkf6R19UGG8SaDS06qxHMfk4gvUvkyBQlsehINVEbjN3mZev2O+O7swKe2W8
 fxza6KJalC3k86sUTXd8bgojPOXApVw/nAt78nLDh+kMjPDz
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: Ha8T8WXKaP3iVi-lqrODYOSNnRoa3sFN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI5MDAwMiBTYWx0ZWRfX/3jFdnyQb4fe
 adWxpfdHViPdNidG+OOwujN94BVvPXF6g6SUJpWojWe0Y7qZESv5XapflD+m9CWdFt3t2EFyTEr
 PIKH0OY0Yhs814D6bDeemwg/WjRS2eMuUUPAwAmrNfVDJjXi2P1w2n43ok8mG53NfIzADH4foXO
 T6f48rrf0/GfYt6NKjmYHVwqLX9J9+cckzETPj5NYcFMPFOF/vMtkIdz34W05mkiIdtYXCRZJSP
 5OVanotkIH7b+3wpsUOBgs4mS/vlf/q57CzI9tVfSJQZeWpBpWJIQPirTS+YesWVOd5UozvDkHQ
 DDbX56fTVjQ9F0IqQkWfZm8IwWOFA0k3kvS9iG50AtdxU1LPo2KbrQq/hV4E4DU8+MSrKTs+lxS
 k9fkBGzNtQIR062BUCxw+xPmW4bc7kwDu6pU3hh46cPqw5InjBIkUGQ8SlQ4WXTCUUxuFDwzfFl
 5eLc/fFrocBiNYvaCmA==
X-Authority-Analysis: v=2.4 cv=KN9XzVFo c=1 sm=1 tr=0 ts=69c8734e cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=cAZfk8ZnZX8u_Try5ksA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-GUID: Ha8T8WXKaP3iVi-lqrODYOSNnRoa3sFN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-28_03,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 phishscore=0 spamscore=0
 adultscore=0 suspectscore=0 bulkscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603290002
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-57472-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 2FAC13504E8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

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
Changes in v11:
- Added documentation for iris_core::iris_firmware_desc (Dikshita)
- Link to v10: https://patch.msgid.link/20260328-iris-platform-data-v10-0-46b92bfe7b52@oss.qualcomm.com

Changes in v10:
- Rebase on linux-next and fix dependencies version to the latest
  revision
- No source-level changes
- Link to v9: https://lore.kernel.org/r/20260320-iris-platform-data-v9-0-3939967f4752@oss.qualcomm.com

Changes in v9:
- Collected missing R-Bs from the previous iterations (sorry, Vikash)
- Link to v8: https://lore.kernel.org/r/20260319-iris-platform-data-v8-0-55a9566ebf60@oss.qualcomm.com

Changes in v8:
- Moved core_arch to iris_firmware_data (Dikshita)
- Made HW_RESPONSE_TIMEOUT_VALUE static (Vikash)
- Changed firmware name for SM8250
- Extracted firmware description interface (Dikshita)
- Link to v7: https://lore.kernel.org/r/20260316-iris-platform-data-v7-0-fc79f003f51c@oss.qualcomm.com

Changes in v7:
- Fixed build error
- Link to v6: https://lore.kernel.org/r/20260313-iris-platform-data-v6-0-1763bb837fd2@oss.qualcomm.com

Changes in v6:
- Moved get_vpu_buffer_size() back to iris_platform_data, it will be
  handled separately, when adding support for Gen2 on Kodiak (Dikshita)
- Renamed iris_platform_vpu3.c to iris_platform_vpu3x.c (Dikshita)
- Renamed generic VPU2 and VPU3x constants to stop referencing SM8250
  and SM8550 (Dikshita)
- Link to v5: https://lore.kernel.org/r/20260313-iris-platform-data-v5-0-180484af4490@oss.qualcomm.com

Changes in v5:
- Added missing kerneldoc for struct iris_core (Dikshita)
- Dropped two more unused defines, leftovers from the split
- Link to v4: https://lore.kernel.org/r/20260313-iris-platform-data-v4-0-14927df4906d@oss.qualcomm.com

Changes in v4:
- Renamed iris_hfi_gen1_ops instances and related functions to contain
  _sys_ (Dikshita)
- Link to v3: https://lore.kernel.org/r/20260311-iris-platform-data-v3-0-f02258c4d4ed@oss.qualcomm.com

Changes in v3:
- Dropped the config_params / subscription_params patches for now,
  let's get more different platforms in first, determining the common
  base and the best way to handle the differences.
- Dropped set_preset_registers callback, call
  iris_vpu_set_preset_registers() directly (Dikshita)
- Renamed HFI ops to hfi_sys_ops and hfi_session_ops (Dikshita)
- Dropped (unused) hfi_response_ops from struct iris_core (Dikshita)
- Renamed hfi_response_handler and get_instance callbacks to follow
  other hfi_sys_ops callbacks.
- Link to v2: https://lore.kernel.org/r/20260228-iris-platform-data-v2-0-acf036a3c84c@oss.qualcomm.com

Changes in v2:
- Fixed build error in the interim patch, the fix sneaked to the wrong
  patch in rebases.
- Link to v1: https://lore.kernel.org/r/20260228-iris-platform-data-v1-0-c2c53539f948@oss.qualcomm.com

---
Dmitry Baryshkov (11):
      media: qcom: iris: drop pas_id from the iris_platform_data struct
      media: qcom: iris: use common set_preset_registers function
      media: qcom: iris: don't use function indirection in gen2-specific code
      media: qcom: iris: split HFI session ops from core ops
      media: qcom: iris: merge hfi_response_ops and hfi_command_ops
      media: qcom: iris: move get_instance to iris_hfi_sys_ops
      media: qcom: iris: drop hw_response_timeout_val from platform data
      media: qcom: iris: split firmware_data from raw platform data
      media: qcom: iris: split platform data from firmware data
      media: qcom: iris: use new firmware name for SM8250
      media: qcom: iris: extract firmware description data

 drivers/media/platform/qcom/iris/Makefile          |   6 +-
 drivers/media/platform/qcom/iris/iris_buffer.c     |  88 ++---
 drivers/media/platform/qcom/iris/iris_common.c     |   8 +-
 drivers/media/platform/qcom/iris/iris_core.c       |   3 +-
 drivers/media/platform/qcom/iris/iris_core.h       |  10 +-
 drivers/media/platform/qcom/iris/iris_ctrls.c      |  54 +--
 drivers/media/platform/qcom/iris/iris_firmware.c   |  13 +-
 drivers/media/platform/qcom/iris/iris_hfi_common.c |   6 +-
 drivers/media/platform/qcom/iris/iris_hfi_common.h |  13 +-
 .../iris/{iris_platform_gen1.c => iris_hfi_gen1.c} | 168 +--------
 drivers/media/platform/qcom/iris/iris_hfi_gen1.h   |   6 +-
 .../platform/qcom/iris/iris_hfi_gen1_command.c     |  43 ++-
 .../platform/qcom/iris/iris_hfi_gen1_response.c    |  11 +-
 .../iris/{iris_platform_gen2.c => iris_hfi_gen2.c} | 413 +--------------------
 drivers/media/platform/qcom/iris/iris_hfi_gen2.h   |   5 +-
 .../platform/qcom/iris/iris_hfi_gen2_command.c     | 115 +++---
 .../platform/qcom/iris/iris_hfi_gen2_response.c    |  11 +-
 drivers/media/platform/qcom/iris/iris_instance.h   |   4 +
 .../platform/qcom/iris/iris_platform_common.h      |  95 +++--
 .../platform/qcom/iris/iris_platform_sm8250.h      |  29 ++
 .../platform/qcom/iris/iris_platform_sm8550.h      |  31 ++
 .../media/platform/qcom/iris/iris_platform_vpu2.c  | 132 +++++++
 .../media/platform/qcom/iris/iris_platform_vpu3x.c | 219 +++++++++++
 drivers/media/platform/qcom/iris/iris_probe.c      |   5 +-
 drivers/media/platform/qcom/iris/iris_utils.c      |   5 +-
 drivers/media/platform/qcom/iris/iris_vb2.c        |   2 +-
 drivers/media/platform/qcom/iris/iris_vdec.c       |   6 +-
 drivers/media/platform/qcom/iris/iris_venc.c       |   4 +-
 drivers/media/platform/qcom/iris/iris_vidc.c       |  14 +-
 drivers/media/platform/qcom/iris/iris_vpu_common.c |  11 +-
 drivers/media/platform/qcom/iris/iris_vpu_common.h |   2 +
 31 files changed, 704 insertions(+), 828 deletions(-)
---
base-commit: 3b058d1aeeeff27a7289529c4944291613b364e9
change-id: 20260227-iris-platform-data-c5c80e84d1a7
prerequisite-change-id: 20260131-iris-venus-fix-sm8250-f938e29e7497:v5
prerequisite-patch-id: 6d85e3db422bc7f16246249288a17b92f6edbc09
prerequisite-patch-id: 579d712ec3f942ba0c362e242c71361c151092b5
prerequisite-patch-id: fa4629a3909fbae3917d8c067cce4f673ee857c0
prerequisite-patch-id: cbbd40736f7a797ff76b0fe2b1ddfb559e14e666
prerequisite-patch-id: 5b50917dcfef01db13af320cbd1cba15fd5fa16f
prerequisite-patch-id: 8948139735836adb9fbc51d93b969911dc5b38e8
prerequisite-patch-id: 7ec91bd0149f347c479c906e73cabaa28601ab3d
prerequisite-patch-id: c711522b63f640b7504767b3af7adc05a0b36cac
prerequisite-patch-id: 42b9cd5e0fd6fd99eae267c78b239333adff7637
prerequisite-patch-id: 11c487545e2462ff0a515d689863c3f7f25f9449
prerequisite-change-id: 20251119-venus-iris-flip-switch-d59a3fbc6a4b:v5
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


