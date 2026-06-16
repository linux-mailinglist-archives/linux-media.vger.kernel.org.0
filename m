Return-Path: <linux-media+bounces-64942-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id YMAQJoyTMGqDUgUAu9opvQ
	(envelope-from <linux-media+bounces-64942-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 16 Jun 2026 02:06:36 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A5A668AC89
	for <lists+linux-media@lfdr.de>; Tue, 16 Jun 2026 02:06:36 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=BirFjMnX;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=iIEa7QZe;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64942-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-64942-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2CA02311D8DE
	for <lists+linux-media@lfdr.de>; Tue, 16 Jun 2026 00:04:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36693175A86;
	Tue, 16 Jun 2026 00:04:49 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20C3622301
	for <linux-media@vger.kernel.org>; Tue, 16 Jun 2026 00:04:47 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781568288; cv=none; b=sO85bWBznCrob6FYtl8AZb35Y0bl2h6ntXPcQIoVQaX2sE3sy8eizOy6Ie4lf43zr5H+2Nv0unzk/T2C6zENEcR1h0jb/3pLvu8bmPOZve/mLYMz/UO4RsD1KL7Ar203aNW/Rx5xToommyWjxaD/XUgh+PVoN/Rgh8m0epLqUgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781568288; c=relaxed/simple;
	bh=w6VvzeXtMFbm92J+o6+RQFxhKFl1bm3gP4NcPPLrgdA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=omImfZCoK+jMBDruidOTbAQTnQdLVHExv4R5s1yakAVu+YFrjfVvBjz/RXsIMjdoN68djvDmLFbCzu4ZRnlbM0ezEaQibcNBNs/MCpEJ8P94hwFPqsstQG6nwfrgCAT9JgIyBnTv5sObNIVnc+ZkeTAJWcNW6IwCGb9Cx3l4Y0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BirFjMnX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iIEa7QZe; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65FIx0c93577888
	for <linux-media@vger.kernel.org>; Tue, 16 Jun 2026 00:04:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QHinJ5pmzeA+6swGJ+pu13N7o3lyaDZ9KgcAONydjSE=; b=BirFjMnXx/w78PQR
	ioq4PTSxqLkLlMGJi7pey+pcuVZ6wzpMh1w7h9UwF3rOX/3+hN+rmyqmrIkmkA0l
	PvjDPgUZuiIiBZrVreWo3T35iJlsaQq+FQymC/TcXOxIFAXg/NXY+IMvsJSJaT/Z
	yhGZg3FZnbj4L7bqBW6RIEgzX9858tlVXzz4Usbu4pBxl+YsWp+PJ75tNYpVflCH
	B6ys7g8nIFwPtx5BjeuaADHDdt6ULgQjgb4JEXLPE2Kjn0qoauzyKOFVmG8o5Lil
	KfJd9xc95kUjcFfXpSgkVxHCIznEOxG42KAigY9GOyH4xzW2AILGOb3ZlxjZwalg
	Qzie2A==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ete983tg1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 16 Jun 2026 00:04:46 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-9157a31ac37so573972685a.2
        for <linux-media@vger.kernel.org>; Mon, 15 Jun 2026 17:04:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781568285; x=1782173085; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QHinJ5pmzeA+6swGJ+pu13N7o3lyaDZ9KgcAONydjSE=;
        b=iIEa7QZe5745rbtdkbvmLrdofIUiMR+yqCtO8Wj53PW6SDJr9mvdZblqp1iDNVPmkn
         8G4HTYT9LFU2pgJ5IF5St4peni7R7x4jfGb6Egm9ks21luEy1/XvwzW1lKQzDDkoIwij
         G6CB/WZHjB9sDzHys6Z9KigNYUv2LHcoVDDrHUT5HzFFM8kUBefpXnaoCm4D7miJuDDJ
         rvTKF2LbMmEbOuE59RIZmRkMMlRoUdFgSTR7AgVHBRaFtRPx1dUKe6mK4fDWQzjVHrec
         EbEXU56tN0cD9eK8Gvq2ANnK6cef6Vlp/9qMO9y0dN8tJusnag7pzMwfERwOfRjii/R5
         EEnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781568285; x=1782173085;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QHinJ5pmzeA+6swGJ+pu13N7o3lyaDZ9KgcAONydjSE=;
        b=ZejG2aZev+jTnfP7Cv58/EkZrhk0w2cVZWweuxQzwQFgxvawu2g2osmqCgdy0vGQ11
         SwZ6tkRCZqPqIYYzish7YU6OXP2nl/45ERi/hIhaJOLj2BY+sw9BVq4f+m0xOFUy4AZu
         2AVdvViOrdSkR14YzogZh1yd6Tf9wA3VTiRENoPgMyZd8d4oJwPz9a9/omFam7IVdUQn
         SUmL3adGphhc/Pem4sVOPXr6lZot9UEO5WQYJ45AKrICOKZITJqYl/mUWbV05VHOoynx
         pN5muY6Rlxbt51lIf51vpE+oYPfPt84V4O5uira2Hd4V4w/Rvq1QV9jLwtC3Cr1khYOO
         u+xg==
X-Gm-Message-State: AOJu0YyO0yaF093i7FmrXV4Lkdn+b3CHqJOgsUyBjFwTRA96Lvi0E25M
	Qd7USboRar0HGYGTHXMHsksvwUSG8LRGhrKp6YZG59OGukjaoM0x+Jq6EBdtJ08w21YD7q1RFSc
	u8xOsO7uMj/vMfzaCkDITleYszPpfnCoSTSKFgQagIbzHcPCfsBvr3oxKAeZk9Ttizg==
X-Gm-Gg: Acq92OHXPLgXOWZyRVX+E3UJZ8Ufb3Pdm9+bQIe8dazfFAKLRsWQqKnvghzjB4OmQBu
	Q7VkyMLZD4UGnBCpW6nkVt6/U/mEZ3yYu0Qp+HsgaHYv2J9/au/Dgkx+Wq+cyWOGrkuSzhbkSL5
	RzjLIqfSedznaYThGfa1mHQ4QgLrozV6ArZKUsZNq3SXRwKptRnqf5H2X1Dw3nvH9ZSMZFr7YhI
	PwLBwkDt3A0zcBvbW1CwzAuF/TA7jeVtO4MwqjRKvXxOX+544d2S3ZuxYTCDLbDm/Cp6trB/Ser
	OL6XJGmJeBUY8usOBhqNV/YJGJ5As61tzlEVUnGM+pYKdd1wJhkpA5GoN8RwA90Il8SGscZWLsi
	R6awiSJGZfEL39dZjaETFv0z4xpzQSCTp2epACYldw+A4A/bubQFd0x+WTf4R4LzkKDrF/8qxTk
	WXEfouQmOlMI6hIeptZM1a0VWoMCmkn+IhXdU=
X-Received: by 2002:a05:620a:84c8:b0:915:9125:e649 with SMTP id af79cd13be357-91c48b34225mr213379985a.44.1781568285337;
        Mon, 15 Jun 2026 17:04:45 -0700 (PDT)
X-Received: by 2002:a05:620a:84c8:b0:915:9125:e649 with SMTP id af79cd13be357-91c48b34225mr213374585a.44.1781568284882;
        Mon, 15 Jun 2026 17:04:44 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad2e1a7092sm3015731e87.50.2026.06.15.17.04.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 17:04:43 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 16 Jun 2026 03:04:29 +0300
Subject: [PATCH v5 02/16] media: iris: Filter UBWC raw formats based on
 hardware capabilities
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260616-iris-ar50lt-v5-2-583b42770b6a@oss.qualcomm.com>
References: <20260616-iris-ar50lt-v5-0-583b42770b6a@oss.qualcomm.com>
In-Reply-To: <20260616-iris-ar50lt-v5-0-583b42770b6a@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5156;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=7eAXYetUjHA2IWQTpRRRPO4xYcQIYvJysU+KoTDDI4E=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqMJMOCVxIJE4Ld/rO9Q7yn/i8ttZAKx5qQWi63
 m8rDhp917GJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCajCTDgAKCRCLPIo+Aiko
 1QQaB/9Cs+A3xnIsEPIFwBSOVrrECopmLXgHrH/IIKZRfSKjijMQkVawulOo96ZaphpGTVfQ9/3
 AF+0G3tmGSgsnwFK2l3aaGOC8oDMiD0taI8RPXIezmElaw8vzJQRSMo0q0g1BAp4GkUNS3jRGHk
 KTW2j5pvjIdy6L8cbKi5iEwhMlJMFZma4NWoafEY4HOvuDA8PNfoDur0VWJM4lzTh20386ZyPxi
 r7Pq50hXX76eVSR+a/Su1Spy9xb0ocMQkkRQbSC7To2U+SVcLvENRTOcF0fdth5j4Jny1UrcPUq
 pZhUHRHcjA1FlMHHFpgqXhpvTkHw2bumvMRsp1ib0kkzcKX0
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=V5tNF+ni c=1 sm=1 tr=0 ts=6a30931e cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=gsa84qigJ8via7s57H0A:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: RAOTso4vHNyQavAXaBCbulMOS1YR3VvI
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDI1NCBTYWx0ZWRfX6Dl6T/eS5ZA2
 nLDP/G/7s+iRwDegHjfv4TpO5D35f0EfzCLRj/1evgTnMubHTCcS9B8Dbk443fokWPfKSVqQIZq
 jijtung/lRqJMYzc6ySKeu5utYt91Zs=
X-Proofpoint-ORIG-GUID: RAOTso4vHNyQavAXaBCbulMOS1YR3VvI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDI1NCBTYWx0ZWRfXyLoQCxOkYK6b
 8PePt9gMTm6BFdz7c8He6wol7CtCd73OOf0j3Xums70wnOqQpZw9Ke9EglfCS6OJyQgy8JDTE8b
 okdNGhNalpKROTvuxdvO5U0OS1CQYkZ4tXJVRMSVF1cHQQa5GioRizExWyxZB7AjPn3BPnK1kks
 xJm86AWFf0Nf+9lFEsS5Er3yBPL7UVxZhZg783citHuS299AgTUsmsUzHENicvUqezDvFjWLYDC
 PIXsVNA5O3VOEb5OPnCIhQ1UEWQza5qF19ybBZVML3LWzC+zjIbrRLdGmjh71RYuNKlSZbu9blI
 Zd3/xuARA6nfDcKRsvBT47wcp363X8OYU5ZvOPWwONyu5NdZm/KcatnAjWoQCctYitI8YY5MeTn
 FZxr+esUM3YigmERqaZcWOuszv5JvCa8NoGKVVZ8udka0FV+AKu4ZASeLRTI7G3ZHqtWCFKDevW
 ZRP7R14dlSOeAoetnPw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_05,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 phishscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606150254
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-64942-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:vikash.garodia@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:mchehab@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:busanna.reddy@oss.qualcomm.com,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:dikshita.agarwal@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1A5A668AC89

From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>

The raw formats supported by Iris were previously advertised
unconditionally, assuming UBWC support on all platforms. However, some
platforms do not support UBWC which results in incorrect format
capability exposure.

Use the UBWC configuration provided by the platform to dynamically
filter raw formats at runtime. If UBWC is not supported, UBWC-based
formats are omitted from the advertised capability list, while linear
formats remain available.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Reviewed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_vdec.c | 26 ++++++++++++++++++++++----
 drivers/media/platform/qcom/iris/iris_venc.c |  9 +++++++++
 2 files changed, 31 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_vdec.c b/drivers/media/platform/qcom/iris/iris_vdec.c
index 9e228b70420e..63b7c9dec60a 100644
--- a/drivers/media/platform/qcom/iris/iris_vdec.c
+++ b/drivers/media/platform/qcom/iris/iris_vdec.c
@@ -3,6 +3,7 @@
  * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
  */
 
+#include <linux/soc/qcom/ubwc.h>
 #include <media/v4l2-event.h>
 #include <media/v4l2-mem2mem.h>
 
@@ -69,8 +70,14 @@ static const u32 iris_vdec_formats_cap[] = {
 	[IRIS_FMT_QC10C] =  V4L2_PIX_FMT_QC10C,
 };
 
+static const u32 iris_vdec_formats_noubwc_cap[] = {
+	[IRIS_FMT_NV12] = V4L2_PIX_FMT_NV12,
+	[IRIS_FMT_TP10] =  V4L2_PIX_FMT_P010,
+};
+
 static bool check_format(struct iris_inst *inst, u32 pixfmt, u32 type)
 {
+	const struct qcom_ubwc_cfg_data *ubwc = inst->core->ubwc_cfg;
 	unsigned int size, i;
 	const u32 *fmt;
 
@@ -80,8 +87,13 @@ static bool check_format(struct iris_inst *inst, u32 pixfmt, u32 type)
 		size = inst->core->iris_platform_data->inst_iris_fmts_size;
 		break;
 	case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
-		fmt = iris_vdec_formats_cap;
-		size = ARRAY_SIZE(iris_vdec_formats_cap);
+		if (ubwc->ubwc_enc_version) {
+			fmt = iris_vdec_formats_cap;
+			size = ARRAY_SIZE(iris_vdec_formats_cap);
+		} else {
+			fmt = iris_vdec_formats_noubwc_cap;
+			size = ARRAY_SIZE(iris_vdec_formats_noubwc_cap);
+		}
 		break;
 	default:
 		return false;
@@ -110,6 +122,7 @@ static bool check_format(struct iris_inst *inst, u32 pixfmt, u32 type)
 
 static u32 find_format_by_index(struct iris_inst *inst, u32 index, u32 type)
 {
+	const struct qcom_ubwc_cfg_data *ubwc = inst->core->ubwc_cfg;
 	unsigned int size;
 	const u32 *fmt;
 
@@ -119,8 +132,13 @@ static u32 find_format_by_index(struct iris_inst *inst, u32 index, u32 type)
 		size = inst->core->iris_platform_data->inst_iris_fmts_size;
 		break;
 	case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
-		fmt = iris_vdec_formats_cap;
-		size = ARRAY_SIZE(iris_vdec_formats_cap);
+		if (ubwc->ubwc_enc_version) {
+			fmt = iris_vdec_formats_cap;
+			size = ARRAY_SIZE(iris_vdec_formats_cap);
+		} else {
+			fmt = iris_vdec_formats_noubwc_cap;
+			size = ARRAY_SIZE(iris_vdec_formats_noubwc_cap);
+		}
 		break;
 	default:
 		return 0;
diff --git a/drivers/media/platform/qcom/iris/iris_venc.c b/drivers/media/platform/qcom/iris/iris_venc.c
index a945992f63aa..2cafbe9f8abb 100644
--- a/drivers/media/platform/qcom/iris/iris_venc.c
+++ b/drivers/media/platform/qcom/iris/iris_venc.c
@@ -3,6 +3,7 @@
  * Copyright (c) 2022-2025 Qualcomm Innovation Center, Inc. All rights reserved.
  */
 
+#include <linux/soc/qcom/ubwc.h>
 #include <media/v4l2-event.h>
 #include <media/v4l2-mem2mem.h>
 
@@ -91,6 +92,7 @@ static const u32 iris_venc_formats_out[] = {
 
 static bool check_format(struct iris_inst *inst, u32 pixfmt, u32 type)
 {
+	const struct qcom_ubwc_cfg_data *ubwc = inst->core->ubwc_cfg;
 	unsigned int size, i;
 	const u32 *fmt;
 
@@ -98,6 +100,9 @@ static bool check_format(struct iris_inst *inst, u32 pixfmt, u32 type)
 	case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
 		fmt = iris_venc_formats_out;
 		size = ARRAY_SIZE(iris_venc_formats_out);
+		/* Last format is UBWC; drop it if UBWC is unsupported */
+		if (!ubwc->ubwc_enc_version)
+			size--;
 		break;
 	case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
 		fmt = iris_venc_formats_cap;
@@ -117,6 +122,7 @@ static bool check_format(struct iris_inst *inst, u32 pixfmt, u32 type)
 
 static u32 find_format_by_index(struct iris_inst *inst, u32 index, u32 type)
 {
+	const struct qcom_ubwc_cfg_data *ubwc = inst->core->ubwc_cfg;
 	unsigned int size;
 	const u32 *fmt;
 
@@ -124,6 +130,9 @@ static u32 find_format_by_index(struct iris_inst *inst, u32 index, u32 type)
 	case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
 		fmt = iris_venc_formats_out;
 		size = ARRAY_SIZE(iris_venc_formats_out);
+		/* Last format is UBWC; drop it if UBWC is unsupported */
+		if (!ubwc->ubwc_enc_version)
+			size--;
 		break;
 	case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
 		fmt = iris_venc_formats_cap;

-- 
2.47.3


