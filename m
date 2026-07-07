Return-Path: <linux-media+bounces-66909-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 5dlmD21+TWpj1AEAu9opvQ
	(envelope-from <linux-media+bounces-66909-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 08 Jul 2026 00:32:13 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B4E972017F
	for <lists+linux-media@lfdr.de>; Wed, 08 Jul 2026 00:32:12 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=NiIChZki;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=R6Es7dkX;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66909-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-66909-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BC9EB307D36C
	for <lists+linux-media@lfdr.de>; Tue,  7 Jul 2026 22:29:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87FD83DA7CD;
	Tue,  7 Jul 2026 22:29:17 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F5603E63BD
	for <linux-media@vger.kernel.org>; Tue,  7 Jul 2026 22:29:14 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783463356; cv=none; b=BD3oMCduUFl5XHr8N5O0rKOifmfXcfhJsRf9O5Sk93UTZ8X9HHH/0dR6wogU+B+gwbCahXAGTZSBHYvXgyUgpZids1l+Q4hn7MxhIqavMR4AgtHZDUSevlw+FyMMbIYJWawphuMO0xChnnR0B1e5mJxNnwaYvNTJnpeCGswEXyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783463356; c=relaxed/simple;
	bh=aFCxwN+s0nObB9dYmcqshZUCs9EjeMcuhwbHJaldKhc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pATOTFT97NWPIQJU61+PMmSAFqq4n0umjg3/AWP42Rf++JYkT3/H6V+ku7JU3NSaBw/sLnzzoi84YLPDwdT9D4jNoJlfZfYuAo/YomjE/3prnfNQNoAv+sqcbI7xivr2zvXq/JCEtqg36z2uxJZxZ+uoxIWtbph1rh7xHuINwng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NiIChZki; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=R6Es7dkX; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 667J5Qw7472315
	for <linux-media@vger.kernel.org>; Tue, 7 Jul 2026 22:29:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CUFPN10YozDbbYt5j7NhH44x2aT4ZP340z/Eg0bq1Jk=; b=NiIChZkiA9JCrQx1
	253QFZ8kOYXy5njNkugfhXY9FCl9gcnEIDHEkmE9kLnBdD0OILsWD8HhjYMIPvzr
	kFp4DHcIwCwGm/IeAeRSPQuaKvs3XNMy+4/0eozj5OiQv3rg9Fv46xOJSZnGe4wB
	pH578jFfwN/C/ShgQ8BNfHmu9kD3So9YxaQ8vMJjvIjUPjGQuYUCefq7tBXbUmXu
	Qa/MaFGke/1jGl6PI2dLog2oRk05a+RevFAGTXPieKOtnroJImoHWyBa+wEBc7ey
	npHnrMVaFAVqxVl+3DMch7N1XJA28q0EBq0Ll+IpYCIN8P6H50WG4q4/j1f6Y+Nt
	IAmiPQ==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f95fd1euv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 07 Jul 2026 22:29:13 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-73883529f72so34570137.3
        for <linux-media@vger.kernel.org>; Tue, 07 Jul 2026 15:29:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783463353; x=1784068153; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CUFPN10YozDbbYt5j7NhH44x2aT4ZP340z/Eg0bq1Jk=;
        b=R6Es7dkX73rRZ2TW793LdWIUIkNEo6uPqHI6GDO/zbuURzO046xYX66egZvHdEsZvr
         Y0n+5acjEIu+vmGZFft5invsEmmkgqrByoXjHCBfubDUmTvRglCGtUjmQBRgFjvB0GTz
         NjH2cGPnIq+/QjBFwZNn9puauW0BIFVznyBhqV+kBYowLI47ahlf5OGOU5HBz9sGpJYi
         R1pjLsVhr7p0H/d0Q1XW0VWubF7OO66fqGy47Os0vHGC+dihG7mY8ejWu62t5vTAf6Sw
         0jS/LxrnBvK62cUMCcohImWN9l1mFp7oJAk0OM+qxCuumSDkz9aSoo8eNVrgexyGQleb
         5QdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783463353; x=1784068153;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CUFPN10YozDbbYt5j7NhH44x2aT4ZP340z/Eg0bq1Jk=;
        b=L9yFQnQm77WkS74xY1odtXtc/MNRO+i4dq3DX/jjGLDbXjvxcoATSjsQYqZfAscAj7
         l99jrqXW1LBZnyDb1GElacyCE/mpuUZ0ID7bLcHh3BOPQmGW9jXO0eDHQyo6ohYYZye6
         EoyJSRhJryGwzV9s+K+sbfEH29m4mi3gZaVV7tLHa117cUlO3DdYR6JVhUjrvm1njpwy
         Wz4pXSUIS11Y5FI1xeD9Mlc1dEbZ/FSoobP1BIrAtk1zo/L+Ht8Z/0h8oKjfO8cgjrBF
         tmMG0F4BhfKCwARbSh8BLcXqJT42mlRJ4JQcJ23iI94GNQx9sWqpJU45Xz1P/0dy/+Xw
         IwDA==
X-Gm-Message-State: AOJu0YwziaZnJPxkeCCOcYTp91UCH0NGnidSlEywfPXvJLFp/CZwk9Ss
	EWwfS/mV+IrNJQkQbE6X83K/A5haZmM+dCKU/57FJPCoMrZ4Bv8WUwsJaSlI320Rulye8BRzr8a
	uKnTske/2DTrzPVsG4jnXucMsPggZ1dUB6s41AlyIlQMQcCYy1BmxQM55Nb/Hjx74IUE4BVSqhw
	==
X-Gm-Gg: AfdE7clE5z2iBt5z3GZqUuXRn/hfhiq3RLr6bb0qBdrtSZz5kbYhrKgutraINhQNbq9
	CkmUdIfKeOsl+FoB6Z74wt4E20f7T4ATsPT21tw/mSnTqkINU5iDtOXkLi7xoJS1N/iYGuKDEtw
	IrBBJhIxvL7IcYKeupUK1rBBYKMA1ylNpZuJXY2H9IeTkMxrPE4C7IN+TqytGTTwqIv2UISEaYZ
	Jwhr3TDMqQkOFLxYgBt0eiDkre2lwA3syh6C1f1nNQFLw8vdd+4CYuALuAg+Q2bNVSBkLoTkPzf
	TjfJG5O/6E9FpWIf9HHBcTEqSn/tZq+ped/xPW7TUhylL5id2Sty0YYGWJgsir+b9nFtX3xXL6w
	StL9zFffp6YBOw0nNI7mvVe8KlJeKi+/AGZePznJ+DaItCxJaVsKxZ/Z3oMkjW9FF5675svqkq3
	XbptqMMVyo/HwMF5uHywr0URXV
X-Received: by 2002:a05:6102:3f8f:b0:73e:751a:167b with SMTP id ada2fe7eead31-744b7ebf61bmr4629095137.29.1783463352862;
        Tue, 07 Jul 2026 15:29:12 -0700 (PDT)
X-Received: by 2002:a05:6102:3f8f:b0:73e:751a:167b with SMTP id ada2fe7eead31-744b7ebf61bmr4629081137.29.1783463352477;
        Tue, 07 Jul 2026 15:29:12 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39c7312bc25sm1897231fa.40.2026.07.07.15.29.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 15:29:10 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 08 Jul 2026 01:28:45 +0300
Subject: [PATCH v6 02/18] media: iris: Skip UBWC configuration when not
 supported
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-iris-ar50lt-v6-2-374f0a46c23b@oss.qualcomm.com>
References: <20260708-iris-ar50lt-v6-0-374f0a46c23b@oss.qualcomm.com>
In-Reply-To: <20260708-iris-ar50lt-v6-0-374f0a46c23b@oss.qualcomm.com>
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
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1263;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=SkhEj21efbGwh1OhN+7NneptPnsqOcydi7iGjY56ptE=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqTX2oNMyxvO4unLEvy0svWQ+MNdp2GtSPxwBnI
 KQBAEc117yJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCak19qAAKCRCLPIo+Aiko
 1dJwB/4wyu3PSujBNfXAb+8LzNzBLXNEbiAaJ+D15/m6fq92Fhilpdoaman29BtzO5jYTReE+Fh
 g3uiwHnOlsaJUxPWYY0IIsnaRMZqi2buGGfqBPvIKt4NtmImy21N56c1fPXoee33GZoFTWm9Ny9
 BnqEo4KeTMmPjNug1WD5NfHyizoNYGPr2zFM0d5QNZM5aK+jwNqqS3bQrKXj9IhlIICwSUmTW3q
 bezqbqRCWm5eMB/gA4c3L6UuGu/gZeZ8TQ+7JUHS9qM7H2bXaStZNmiVMcgz3apWZeVkeOVH6ls
 fYtpK1Rf1WHB+Jnk4QTq0J/b0tamgbFxOjFduS/8AkcmgymJ
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDIyMSBTYWx0ZWRfXw74vwPjJLiQZ
 7ibSN6msFbX8StY2La5P3HhRsAJuo9sjg6uufGTcKJ7snhvNu0GHqIDL1br4P1vV12xNvZHujON
 9Mf6Z5upf4vpdGqetkeBWIeqfsrKzYspH33FBSK9YlA1yi2GvrPyC8Zb5CYNn9MuVTBH7RsflTo
 7aF+Z58JTryi/u1hILQ7pT2ggm0tf48/fERR+UfrOnoCkyA1AFqkcmj4YHYIrq8/QbqGfJNvDny
 /zRvw+0Z7TFffyiEPs2C1TazFoe6Jj28SLKKjnLXtxMrRta+xuoRfitgXJczXT0S+YeebDOqTCH
 cb0WIWev+IA0zwDwKdhpfScXnT2fUqIt8kWsg3cgInauDKpw65obbPfBP7HM4fYAxK19Jf7zxhT
 oJtC8hMN+YG8VQN4IZ7LfMlMA8eCK/uRUul7HWam+Xg5zLZ4eapY3pRtxipcKvjkoAdmN7cOSsL
 555wSaSrS95nL4ENLZA==
X-Authority-Analysis: v=2.4 cv=VZLH+lp9 c=1 sm=1 tr=0 ts=6a4d7db9 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=wrkyJH6U6m0Jdbs6q_kA:9 a=QEXdDO2ut3YA:10 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-ORIG-GUID: XR5dwK_ooNn9TgRYtawLGWoq0fdr6iAF
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDIyMSBTYWx0ZWRfX5SpTNTZ7z30Y
 50uy41Je6RqzaXcVxx6ldnX1itFtRd4u1aWCeIwmGiQDQaI4QIGTtZm9BZ//hHu3dGHoxPsD/qt
 Ijw2Btdq1Ia7uGnemU6rv0PPQn0/qvI=
X-Proofpoint-GUID: XR5dwK_ooNn9TgRYtawLGWoq0fdr6iAF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_05,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 spamscore=0 malwarescore=0 adultscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607070221
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-66909-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:vikash.garodia@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:mchehab@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:busanna.reddy@oss.qualcomm.com,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:dikshita.agarwal@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim];
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
X-Rspamd-Queue-Id: 8B4E972017F

From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>

UBWC configuration is not applicable to all SoCs. Add a check to avoid
configuring UBWC during sys init on unsupported platforms.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Reviewed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
index 0d05dd2afc07..6e04175eb904 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
@@ -140,6 +140,9 @@ void iris_hfi_gen2_packet_sys_init(struct iris_core *core, struct iris_hfi_heade
 				    &payload,
 				    sizeof(u32));
 
+	if (!ubwc->ubwc_enc_version)
+		return;
+
 	payload = qcom_ubwc_macrotile_mode(ubwc) ? 8 : 4;
 	iris_hfi_gen2_create_packet(hdr,
 				    HFI_PROP_UBWC_MAX_CHANNELS,

-- 
2.47.3


