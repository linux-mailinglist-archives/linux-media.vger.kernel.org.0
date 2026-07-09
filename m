Return-Path: <linux-media+bounces-67165-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 3lqHC6qlT2qllgIAu9opvQ
	(envelope-from <linux-media+bounces-67165-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 09 Jul 2026 15:44:10 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id AB3D9731B50
	for <lists+linux-media@lfdr.de>; Thu, 09 Jul 2026 15:44:09 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=paiqDtVp;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=QMrONoS9;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67165-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-media+bounces-67165-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 703353065D1E
	for <lists+linux-media@lfdr.de>; Thu,  9 Jul 2026 13:42:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3312031F9BE;
	Thu,  9 Jul 2026 13:42:11 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37F7330D41A
	for <linux-media@vger.kernel.org>; Thu,  9 Jul 2026 13:42:08 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783604530; cv=none; b=lugHSM9a8eImqiA9fhStjzT2F3pVoInQaOHNn46x0QhljztSfUHMLA/WLIhn8ewy0l4vdy2zDm+SpOcuyWbS9rG+HJ6RUVH/jpvgFGfcazACzSxuGSXt/ZiG8x+MhsND5sUX0hMeAWuYqeVerhKNEvqdzp8C9gwfl6nEEv/PBHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783604530; c=relaxed/simple;
	bh=T4eIYBccxXJeZW7OH2Zm0x8+WH27A+FuLPhy+n6Z5fM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BGdtpvULFc3EkkGRnuNrj99E/28cd1ShDMPsO79InILTg5FRaBgsk0ivtBOsHBtGcmvBXA033sfP8X3NvAJmXo6ip512khFQ27iypueM5eFLF/BukjEQqRL21ATT+rmWcyf/Imtd7zLosQbUN6TLvJYtBFo3w5szIfFC1oFTx/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=paiqDtVp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QMrONoS9; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669BN7uu1450416
	for <linux-media@vger.kernel.org>; Thu, 9 Jul 2026 13:42:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wUHnGdkfUXRQwt8oe8xuo2tN8rjbIhoMZwW9C9J3BuU=; b=paiqDtVpB4W8XMia
	mkUOQiclKvrkJBkcy+rO5hkMq0oI6Cn0Xzn4u/AP0M3GJ9+tahIRGcJJEe7hpHbM
	D4oF0a6RGy6DeHU/i+bW66vbGrvathcUACM6H+8F8H10kapxcyB6ZtiHA0NSTrt/
	ZO5zNCTQhVervggey8DeCVP//zsz8Ro+9EOIUW6ZODwNzBilBoU1bbzLn0bmNzI1
	tQztUKJ4b4/LY24SELohmsZzYcWgaqFxAWtVikjoPK+KBv1PsimQsvSoxtD6xRb7
	ZToP3b1eG9BKFBMs+zUvuOti/J0hgC0mKBL7MrvPwk9jYcZxRkL4wvH4jcaHCxRn
	TBEUlw==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fa55vj7pm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 09 Jul 2026 13:42:08 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-970e646d5cfso77968241.2
        for <linux-media@vger.kernel.org>; Thu, 09 Jul 2026 06:42:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783604527; x=1784209327; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wUHnGdkfUXRQwt8oe8xuo2tN8rjbIhoMZwW9C9J3BuU=;
        b=QMrONoS98MRsINVRmW4Sb+bMj7m6+ZfzeRu/9HfU9tknzFAihWDsg++2BnO7DnaKCk
         5zBYVuyUwCF/GfX7rx/Kex/iPKrnQm/PMh9f5QWGkFiN4A9loF89tvjIN5mX1/UH16gx
         7PYca81MYtzMQ+8/z1WlBXW6El/qlYWkk6YfSeWIqqnRTy3iDrrJ8m6W5G2XJ5LlFtNW
         MqhUvEjM4xzv39JCAAlbEqAI+rPm1Ea+yUY0UD4Z2/WRs1ILqTTYR0L9QAVYkBqJUY17
         c1pv4cvuiNbR4ANEZpDMQr7YEv+8InNarHFt2nw4S3rZSbtXrhutLtKmnRHaZscnrMB+
         2r3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783604527; x=1784209327;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wUHnGdkfUXRQwt8oe8xuo2tN8rjbIhoMZwW9C9J3BuU=;
        b=VF3cv3i5tJTQbCuzOYo6bEMUtdESVQE7XZj3X4DNgVUDl/qQcNI8NRCCLNDKCseabQ
         tVPkPcp10NinG/vZMh/Lm9IVB0wVZ1/JFDQWqxxlWolpzFaaIEDlPk33YnMFj4xcKNuG
         nase7qp2FW8PqXrVQwFOjAdk1s/2ATdZULHYWj2gI+vGyJokPyUKJaG9eXBnHzE2p0Cq
         /8vCJNVsDDioTccCGwwBeWwb0TDb7T0CdXqOfemk4nvltYN25bpJLqcp6Rk2GDy1FKWb
         GCcHHkCd8inZI0r777ulUEThCJ980RCKUGvzaxgvER288OzefBuveIMWxejXtwk6Y78D
         vKXA==
X-Gm-Message-State: AOJu0YzJoMhD/mF/DkwNb9+zVCzeSgaThiGMEWYSUYxU46mt8wFI3ngf
	J3JUNTk7CcKw9p4hCzVAif+CyBMiX47AvZq7P5gmg17tDyPaSOvpHTODWZUcYRMSQ80ih7CugjL
	P4XJ9NHaBxgIBUjPkMxaLs0bWm6NXyL7nIbPLn49QohwdiraNWYrv6RO2ijFa5iRoxQ==
X-Gm-Gg: AfdE7cnA88WTDk0Njjcd1dNB6pyxRQfq3aI91M8MT8reLjT/fL0+WRZ1/UlDsKB33iQ
	MWcL4sxcTg9SXejLSH/FKFrFYvLkhKP+1mT+OJgGFFi+/NZtTJk+/pi1G96v0VhgM5IkaF9ziBB
	1ZjYw8xgJPu8oYaDkfmnTkgs2raYI0vdosi3yW46jtAHdTWch43N2ijgkuqq7IYr9FAgpmzhr1B
	FVXGoJ3wYXmFuecDgi57A3zEKHxaIX+cq4CK55aG8NynAbjmTooMeQ3bstvpFRBAuyUlX3Afy8S
	CEj35QKA7pnX+Tf5HRR7lrmDMVDo0souGR93Va/tqCYsn9DNtQeH4pRELp6HMeo7I0VcNGXelmL
	V6J3MWeRlQJURHZ56Oii+Wy5bo1KbCYkXPa+aUizWU1MSMXf47x4tk+arB24kJiQvltz97ICtSs
	N7z/+Q8qAssA5cvUnkZJ+JOSE/
X-Received: by 2002:a05:6102:579a:b0:738:9c79:750c with SMTP id ada2fe7eead31-744e010f583mr4087186137.15.1783604527184;
        Thu, 09 Jul 2026 06:42:07 -0700 (PDT)
X-Received: by 2002:a05:6102:579a:b0:738:9c79:750c with SMTP id ada2fe7eead31-744e010f583mr4087164137.15.1783604526550;
        Thu, 09 Jul 2026 06:42:06 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39c849186e1sm3345151fa.9.2026.07.09.06.42.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 06:42:04 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 09 Jul 2026 16:41:54 +0300
Subject: [PATCH v7 03/18] media: iris: drop IRIS_FMT_foo enumeration
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260709-iris-ar50lt-v7-3-76af9dd4d1f6@oss.qualcomm.com>
References: <20260709-iris-ar50lt-v7-0-76af9dd4d1f6@oss.qualcomm.com>
In-Reply-To: <20260709-iris-ar50lt-v7-0-76af9dd4d1f6@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4455;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=T4eIYBccxXJeZW7OH2Zm0x8+WH27A+FuLPhy+n6Z5fM=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqT6UkC6y03dfoL2gL2Fcssdxok7zymtMG6w1KB
 CjuKHWyNKCJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCak+lJAAKCRCLPIo+Aiko
 1dAhB/97z4/xuC7+0LB1G/OrJulzwP3h8a/2nkFKlFqBXh1nnLB0IVS12gpa8iN0f+nTAZTm+3G
 Llt49B7giCMHZykD8OcbNgB70rg834GSxnleqLhBr+hs8u/HgTUOzk7Uglt0t26ycbuRWUlG51Y
 5QVPoh/itCTTdj2sdcFaByryM92t5A34XATi6Jvx490Q20Tz9TYnh+qPdvJp2pycQ2NNxUP9XNS
 yDzr2PVaS9Y5s5DV6d0JY3AI396PDJhbCMQJi6mIkkkd6lyWIBd5xt+4nAUn/uNTdTuqWkbXiaC
 13C4zH3qqz/UEdEymefaNr+BQqlsVsOQm5vfQoGRHO8BKiDP
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDEzNCBTYWx0ZWRfX03BCmSe5RCPR
 iqoIiuyOyHVNDXdVrlKvH05EUi7wHqDQ6ziTTjgJ8SpI7C4Gw2U+OmcNjxTvb0AtBaR4B0nhHZd
 Dz2aaMSUO+UvUYWw+ZIcOC8w29Y0DocJiTWYydO/THDBr9GkBh4pkHQu85DdsVPn1onmplIxxBV
 SVnkK3CHtAZHSR6yynFlUxxS66+NkSxuZ41epqQ57jhKeWDxXHGP9VV8VJPA2WNxOABIz19dDPF
 tqG1dQ5CCxNeQUkkm0QdYKoflbKtwWgvlJlJ1G0p4PSuuOMR1idKbvVhorKEYqhaQRpqSLIuDWn
 b4vBhXrqmsysa6VjmHg5HYp9B0k235F5gqQAhHajsOfNwBhzeUpv0dQf41tbY7UxhZD9M+Qp5H3
 c+sCd4nkB59gFmJ0b9x28IkD0RpDimGs6opUURNqxzptepZ/+Tl4UqeCyXslXNL4PspcfrQAlnY
 vc7900W4JvL/AUZlX5w==
X-Authority-Analysis: v=2.4 cv=KfDidwYD c=1 sm=1 tr=0 ts=6a4fa530 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=Azqn4rg6zLMgtGihcfEA:9 a=QEXdDO2ut3YA:10 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDEzNCBTYWx0ZWRfX6olrd9NJkxWr
 V9BmyNURqXu4TSWliQbTkRe4M6junZKoKev4MeUHT+Jcll6OG130+/5X8a//m6ukjua/tZxKI0Y
 v5ObH3+Fv8sqP7BulCmRrIoW+KFYaDE=
X-Proofpoint-ORIG-GUID: BpwARFMfTO7nJ_jhnjB-tnanz45nAsZS
X-Proofpoint-GUID: BpwARFMfTO7nJ_jhnjB-tnanz45nAsZS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_02,2026-07-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0
 adultscore=0 clxscore=1015 priorityscore=1501 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090134
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-67165-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:vikash.garodia@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:mchehab@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:busanna.reddy@oss.qualcomm.com,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:dikshita.agarwal@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: AB3D9731B50

The IRIS_FMT_foo defines are only used for indexing values in the format
enumeration arrays. However this kind of enumeration doesn't follow the
V4L2 logic (which expects an array with consequtive indexing rather
than a sparse array) and complicates adding support for platforms which
support different sets of formats. Drop this enumeration and use flat
lists of supported formats.

Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_instance.h       | 14 --------------
 drivers/media/platform/qcom/iris/iris_platform_vpu2.c  |  6 +++---
 drivers/media/platform/qcom/iris/iris_platform_vpu3x.c |  8 ++++----
 drivers/media/platform/qcom/iris/iris_vdec.c           |  8 ++++----
 drivers/media/platform/qcom/iris/iris_venc.c           |  8 ++++----
 5 files changed, 15 insertions(+), 29 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_instance.h b/drivers/media/platform/qcom/iris/iris_instance.h
index a770331d1675..ffdbbd20901a 100644
--- a/drivers/media/platform/qcom/iris/iris_instance.h
+++ b/drivers/media/platform/qcom/iris/iris_instance.h
@@ -17,20 +17,6 @@
 
 struct iris_hfi_session_ops;
 
-enum iris_fmt_type_out {
-	IRIS_FMT_H264,
-	IRIS_FMT_HEVC,
-	IRIS_FMT_VP9,
-	IRIS_FMT_AV1,
-};
-
-enum iris_fmt_type_cap {
-	IRIS_FMT_NV12,
-	IRIS_FMT_QC08C,
-	IRIS_FMT_TP10,
-	IRIS_FMT_QC10C,
-};
-
 /**
  * struct iris_inst - holds per video instance parameters
  *
diff --git a/drivers/media/platform/qcom/iris/iris_platform_vpu2.c b/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
index 961dce2e6aa9..ba91672df1bb 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
@@ -35,9 +35,9 @@ static const struct iris_firmware_desc iris_vpu20_p4_gen1_desc = {
 };
 
 static const u32 iris_fmts_vpu2_dec[] = {
-	[IRIS_FMT_H264] = V4L2_PIX_FMT_H264,
-	[IRIS_FMT_HEVC] = V4L2_PIX_FMT_HEVC,
-	[IRIS_FMT_VP9] = V4L2_PIX_FMT_VP9,
+	V4L2_PIX_FMT_H264,
+	V4L2_PIX_FMT_HEVC,
+	V4L2_PIX_FMT_VP9,
 };
 
 static struct platform_inst_caps platform_inst_cap_vpu2 = {
diff --git a/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c b/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c
index 74626b35d9cb..7098b652c117 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c
@@ -49,10 +49,10 @@ static const struct iris_firmware_desc iris_vpu35_p4_gen2_desc = {
 };
 
 static const u32 iris_fmts_vpu3x_dec[] = {
-	[IRIS_FMT_H264] = V4L2_PIX_FMT_H264,
-	[IRIS_FMT_HEVC] = V4L2_PIX_FMT_HEVC,
-	[IRIS_FMT_VP9] = V4L2_PIX_FMT_VP9,
-	[IRIS_FMT_AV1] = V4L2_PIX_FMT_AV1,
+	V4L2_PIX_FMT_H264,
+	V4L2_PIX_FMT_HEVC,
+	V4L2_PIX_FMT_VP9,
+	V4L2_PIX_FMT_AV1,
 };
 
 static const struct icc_info iris_icc_info_vpu3x[] = {
diff --git a/drivers/media/platform/qcom/iris/iris_vdec.c b/drivers/media/platform/qcom/iris/iris_vdec.c
index 9e228b70420e..4c8bc7aac135 100644
--- a/drivers/media/platform/qcom/iris/iris_vdec.c
+++ b/drivers/media/platform/qcom/iris/iris_vdec.c
@@ -63,10 +63,10 @@ int iris_vdec_inst_init(struct iris_inst *inst)
 }
 
 static const u32 iris_vdec_formats_cap[] = {
-	[IRIS_FMT_NV12] = V4L2_PIX_FMT_NV12,
-	[IRIS_FMT_QC08C] = V4L2_PIX_FMT_QC08C,
-	[IRIS_FMT_TP10] =  V4L2_PIX_FMT_P010,
-	[IRIS_FMT_QC10C] =  V4L2_PIX_FMT_QC10C,
+	V4L2_PIX_FMT_NV12,
+	V4L2_PIX_FMT_QC08C,
+	V4L2_PIX_FMT_P010,
+	V4L2_PIX_FMT_QC10C,
 };
 
 static bool check_format(struct iris_inst *inst, u32 pixfmt, u32 type)
diff --git a/drivers/media/platform/qcom/iris/iris_venc.c b/drivers/media/platform/qcom/iris/iris_venc.c
index a945992f63aa..16c52ad07e2c 100644
--- a/drivers/media/platform/qcom/iris/iris_venc.c
+++ b/drivers/media/platform/qcom/iris/iris_venc.c
@@ -80,13 +80,13 @@ int iris_venc_inst_init(struct iris_inst *inst)
 }
 
 static const u32 iris_venc_formats_cap[] = {
-	[IRIS_FMT_H264] = V4L2_PIX_FMT_H264,
-	[IRIS_FMT_HEVC] = V4L2_PIX_FMT_HEVC,
+	V4L2_PIX_FMT_H264,
+	V4L2_PIX_FMT_HEVC,
 };
 
 static const u32 iris_venc_formats_out[] = {
-	[IRIS_FMT_NV12] = V4L2_PIX_FMT_NV12,
-	[IRIS_FMT_QC08C] = V4L2_PIX_FMT_QC08C,
+	V4L2_PIX_FMT_NV12,
+	V4L2_PIX_FMT_QC08C,
 };
 
 static bool check_format(struct iris_inst *inst, u32 pixfmt, u32 type)

-- 
2.47.3


