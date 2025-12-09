Return-Path: <linux-media+bounces-48479-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 20103CB0805
	for <lists+linux-media@lfdr.de>; Tue, 09 Dec 2025 17:06:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 994813018B99
	for <lists+linux-media@lfdr.de>; Tue,  9 Dec 2025 16:06:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EC0B271457;
	Tue,  9 Dec 2025 16:06:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RSboq6GS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ly0BIEDs"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7FAE1FF5E3
	for <linux-media@vger.kernel.org>; Tue,  9 Dec 2025 16:06:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765296390; cv=none; b=hvp/oBY85GW4de1zSwQ0x9WG9CcVeWt0G4qwQMwtI0xmDAaK27cB9lPKd3oVchERR6AMQ4IxTD/SkoZQI33hgi3PMkqzCmEt5mk93KVULwkVNfE5Ug2s8wnNOCiEAaqw/Jj7hcddCDHy8xoq+LJFS27v+yrwB8xzcEGdL9+p1Rw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765296390; c=relaxed/simple;
	bh=z5Fss1otRuENp1ZYRWidO1D8HTvR7wg70oWa9sJRZVY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ow/tCRCweo/B9Qh+SdQIDdMxMSd+APO1pvjRTEp/DRBFYW1asQXnwW2uAs5lwvHNjHI6YJdm266rE+Q0XoFZ18rGz5TwNLGb5da2/mEv9+VaUUXA0hkpzv+MZ6QhzIfsUC/DqLj0xhkWFxfszavxWCn/nXhfquULSTCj6v/I4dA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RSboq6GS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ly0BIEDs; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B9Fhhu83960943
	for <linux-media@vger.kernel.org>; Tue, 9 Dec 2025 16:06:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=2pbtjhxC4eV
	7PD5NCpiUxhV9IH0jDpFIsG5St2ZYJ6w=; b=RSboq6GSrHCHxM9kSZp2zUp9YvC
	J3BDYgZ9zcx7lPqZovW8TIiDddqR6dY0R1H1VQYqsKaRL1GOOFUODCQV2L0rIPcx
	e5xFv9BJ844eW1LsxzqJs2YNvKuxTwGLGDJ7N2JvNoXCD1ZbM1fzDWp1Z+uJtW3y
	tSRKtpCfeMCIkP29OyaRYaKdxhrHDtF1Prz8tW+F6ufbGVKrOK1zoRks+iVb2MV+
	S4x1HrF28S1ogaR3JD1S298UQKIs1SdzSaHeDxyOTtjeV2gb5/a2KqGGo9jC9dFx
	FckwzcUwZpQQy9IxTpRqyr72CMpUJGdVldVF06QHsceq3bh8mTvTXz2cM0w==
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4axjk5109t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 09 Dec 2025 16:06:26 +0000 (GMT)
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-4538a8bc513so6674753b6e.2
        for <linux-media@vger.kernel.org>; Tue, 09 Dec 2025 08:06:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765296386; x=1765901186; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2pbtjhxC4eV7PD5NCpiUxhV9IH0jDpFIsG5St2ZYJ6w=;
        b=Ly0BIEDsAnB6wTQXaZljDQgKaVU8vC0dmOe5RkMfzBifO3F+ztujYc3nc2oXDxyxHh
         FSzWVCBBwkAgJDjOD3AHeynlfY/nQ6MlxRUjj1tFZGZAbZD/aMA6JlR1XjNRge0V68uX
         F6H85f7e9OtBAaVwEZQdp6bhlRb+b9ZEATXm5DHwHmmpdoNDUg0Gr2npFO3cycF50Fzc
         qcC7eFzs2SBGbYjDpnosJTWmkx4dTOYHwTi2khxPSi5JkOsvbexvnJq+WqklGh6q41eL
         6LaNSkoci+3FkQXkz4b8E/REe9G8mwgqn6JBeCkvi3ykYXmIiYo9pzc7i4xemK0ecECg
         0SAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765296386; x=1765901186;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2pbtjhxC4eV7PD5NCpiUxhV9IH0jDpFIsG5St2ZYJ6w=;
        b=Q6786EBv3obGl3gEDBrRkFjNwuXdEFFf0Q++9r7N7zQ3soH/WrhfwNLnXtHUMQGZlM
         JwmlDVn28g9pyIcx5B+cnjSVkx742BHx5RcmJqVZif5wTH6n+FVn44eGpEpJ6+SAn16e
         jJ5v573hduC0eUqORle7oB40cF3RvQHl49EjQ9mdX3EX6P4kSaHQLK6UB6xDmYGBl6Bl
         PPPrcZF09fWebR0RF1qPUnNTyP5LFZrrC92er8a6DTDLLayPYaWvMWZ8kb86g5/vWbRy
         bCJ3BGHf0H8+bDImFecVF+DqotAQFUFi/oe6NEaGQVE6SedJxF5PYMtRsJmrzDlS4CHz
         mNCQ==
X-Forwarded-Encrypted: i=1; AJvYcCWh2a5WDksqbV/oe0lDb/68home3M8QZwKIZDZiMPDPId3wX1wqs+/YHHWw49habrBTvOY7RuOqclCSqg==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywf+aRshjp/vypS4fKQhNvKpLEeeYHcHcmcIWaCtdExx2pcTHFz
	aM0qXtysmBD8OQLucKLjeCp1xsggFmdccAvfCXopomuUDBTidlVxr8JnjrJc53udPidDi1KhbNM
	98iJISDlIzcIqOp7hAlfzWUZVzL74s3aPaL//LmMD9axPpQxRFyH1AkaTRi2xCuGhRQ==
X-Gm-Gg: ASbGnctGBhlJYE3ax2S+Mex29XbZWYJjWINGmkUWoEpM2oqxc2rRvhaIAgjk3YeTiJW
	+AHKWERvz2HIUVkE9bbq0Q4xmOV2GsVrl0GCPKpU9iO+AdSFheI8/5f08CiyIrTqv8Q9dNz3HBn
	VR5aypdhi8AhF949k6jcjAdHOqk8pW8mDRG+b/fIcC6v5cCuuokyDlQbMxjJEp9Nym15+XCmTwo
	ueSr3RUPAis7DHHBnSnIlmzyicg1VOBl90MOsyK4u3QJgO0LJhwVC3lYi0Mui3f4yJPr7REt2n4
	V4FQQqjCMgesq/GE3WMMUWCXucUu4Q3dlGsxb1u2YF/U5wncDxzn/f3XnKyq/bGEM36MWO27kc1
	lOcolifmlVVZ10oBFUXninC5ooqcFDMZa2Y3je23TXJ4tOBVmCTR2qVHKcCflPcHUPE7fyb5SMS
	IRaJJX6/mHtdPyY6e2EiUqsJjxpklJD7MrAryXzSNtXVJx2A==
X-Received: by 2002:a05:6808:1790:b0:43d:6a69:7752 with SMTP id 5614622812f47-4539deda1b6mr4258577b6e.2.1765296386131;
        Tue, 09 Dec 2025 08:06:26 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE+V1FVd6N2FNNCGlJ3kEfiMsRc9DWM6m4UauVbWWoZ+X2Muwa8Jbe0GEZ+AdEkqHv7QavWGQ==
X-Received: by 2002:a05:6808:1790:b0:43d:6a69:7752 with SMTP id 5614622812f47-4539deda1b6mr4258556b6e.2.1765296385747;
        Tue, 09 Dec 2025 08:06:25 -0800 (PST)
Received: from t14s.space.revspace.nl (2001-1c00-2a07-3a01-8e96-3679-0b9c-de47.cable.dynamic.v6.ziggo.nl. [2001:1c00:2a07:3a01:8e96:3679:b9c:de47])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-647b3599050sm14324838a12.17.2025.12.09.08.06.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Dec 2025 08:06:24 -0800 (PST)
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
        Bryan O'Donoghue <bod@kernel.org>
Cc: Hans de Goede <johannes.goede@oss.qualcomm.com>,
        Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
        linux-media@vger.kernel.org, Sebastian Reichel <sre@kernel.org>
Subject: [PATCH 1/5] media: ov02c10: Fix bayer-pattern change after default vflip change
Date: Tue,  9 Dec 2025 17:06:17 +0100
Message-ID: <20251209160621.6854-2-johannes.goede@oss.qualcomm.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251209160621.6854-1-johannes.goede@oss.qualcomm.com>
References: <20251209160621.6854-1-johannes.goede@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: qzFjAd6NRWlP41bsxroK_6ZMeZeM1bh-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA5MDEyMSBTYWx0ZWRfX6bmZiFCBTthR
 NLREUSaGLa/uyhB4IN5imAXSzHvZYtJgHFgObSi00EVoTZH2seKo+YeYj2oPNTLlF/HMWLppY5J
 5Wgzv9Se/Jz0gpKpw8A966udp7G8MFthmJTqd35oRvzomK0HSVqirq4TWI1KVihgLXlCc3Bzp4b
 GVxtaZwKrHWngCRrauT88HiHXjXtHNpqu2ZY7keUDBJLZq1mVsVsFZruMDwidxf4V2W47Ypb7ov
 iVLebLrt8yY/4reqKJM/vOl6kdGjNaks7tBesSAhACNYnDtlDAz5NYUMVpQRPHKxx5paX897Znv
 e852FuDM2hcoEGfMNemNOH6DsC4Bxkpc1r1blYJVW8BY4P2ILOK35xTAeIKRtcD4LgQ/99upTnu
 KyJTpUJTMoQV8icbG+yhX5E5ps08lg==
X-Proofpoint-GUID: qzFjAd6NRWlP41bsxroK_6ZMeZeM1bh-
X-Authority-Analysis: v=2.4 cv=RqvI7SmK c=1 sm=1 tr=0 ts=69384902 cx=c_pps
 a=WJcna6AvsNCxL/DJwPP1KA==:117 a=xqWC_Br6kY4A:10 a=wP3pNCr1ah4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=zB1yXfqWNuH8b4Bk64IA:9 a=_Y9Zt4tPzoBS9L09Snn2:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-09_04,2025-12-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 priorityscore=1501 malwarescore=0 suspectscore=0
 bulkscore=0 lowpriorityscore=0 phishscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512090121

After commit 69fe27173396 ("media: ov02c10: Fix default vertical flip")
the reported bayer-pattern of MEDIA_BUS_FMT_SGRBG10_1X10 is no longer
correct.

Change the 16-bit x-win register (0x3810) value from 2 to 1 so that
the sensor will generate data in GRBG bayer-order again.

Fixes: 69fe27173396 ("media: ov02c10: Fix default vertical flip")
Cc: Sebastian Reichel <sre@kernel.org>
Cc: Bryan O'Donoghue <bod@kernel.org>
Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
---
 drivers/media/i2c/ov02c10.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ov02c10.c b/drivers/media/i2c/ov02c10.c
index b1e540eb8326..6369841de88b 100644
--- a/drivers/media/i2c/ov02c10.c
+++ b/drivers/media/i2c/ov02c10.c
@@ -168,7 +168,7 @@ static const struct reg_sequence sensor_1928x1092_30fps_setting[] = {
 	{0x3810, 0x00},
 	{0x3811, 0x02},
 	{0x3812, 0x00},
-	{0x3813, 0x02},
+	{0x3813, 0x01},
 	{0x3814, 0x01},
 	{0x3815, 0x01},
 	{0x3816, 0x01},
-- 
2.52.0


