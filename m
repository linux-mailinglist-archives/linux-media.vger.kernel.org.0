Return-Path: <linux-media+bounces-48551-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D04E5CB2CFE
	for <lists+linux-media@lfdr.de>; Wed, 10 Dec 2025 12:25:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0DBA330E54C5
	for <lists+linux-media@lfdr.de>; Wed, 10 Dec 2025 11:24:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A5662DE6EF;
	Wed, 10 Dec 2025 11:24:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dv35FpFp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KtrPpDmr"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A52372877D8
	for <linux-media@vger.kernel.org>; Wed, 10 Dec 2025 11:24:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765365883; cv=none; b=ME0LTnM++ZVVXh3yRihGsDnFtEhDHFmHqAME9DOSD20sjszWCiGL0F3O31XwYw7OAGYjK9kCxNt1HF7cGUnX0WuLHt+CB+sFU5gwXr2AQwGhhl8cx+cHYAxkM53N/2u7+VxXWllO1j7Szyyc8eFKx4ImL9xHJwFplOcxbGrFRKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765365883; c=relaxed/simple;
	bh=rNR7EXPl86rbTWN0Lt97s6nqyMeGIDhIh2PCHA3te+Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rEzpKpv4XLw4m8p24A6/0jcQZmS4t9zc6xR0P2Hl69vAxkJ1pRt+Vqrdg9J4HMa1x/za2cP5D94avgb2pD5d+aeH2uvv93jGgmYbzhlgielFdYEERJRqLtjp9XJy0dTfDbmC8usP+mW+MCjyOGftR9FSO3Ia7VTl1utNqs8Bxjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dv35FpFp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KtrPpDmr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BA8e2Iw1934095
	for <linux-media@vger.kernel.org>; Wed, 10 Dec 2025 11:24:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=cnMORWoZXvu
	5f6gtZ/v4yMHO8QWC0/Po8/JI0GaNh7c=; b=dv35FpFp5LQtHnNmoMgk5kyRN9N
	hJpUmLinMlYGCsvdOmkQD4RxFUrbUXR8jWT3RoxdNfLbfNl7KiwDCy0RRYD+9OOg
	giVfsf9djKkEVBWxqS8zrpqwNZDV7+3ilKmRtqnXKrnnsqy4XjHBLw055fqwR+IQ
	mBc9AoncPpAUAhRSXvp0en46ZyJ/53D8QW9MRZk6JVnO/CIwTGPUa6RINE95I3lO
	WlxKradk1KTinDmXZMY5AaUKi/7udg2euA5fkRE0mp9JqF8Yfk3B9mZwNL9BczQT
	2persq8NkYEOkERgl9/DOqgbNQXQKF6j1zZdRgt3iKFoLUqoYt2lfsp6iTQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ay505gmqr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 10 Dec 2025 11:24:40 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4ee0193a239so75453191cf.0
        for <linux-media@vger.kernel.org>; Wed, 10 Dec 2025 03:24:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765365880; x=1765970680; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cnMORWoZXvu5f6gtZ/v4yMHO8QWC0/Po8/JI0GaNh7c=;
        b=KtrPpDmrrvLMJSfhMtqUVd9hJQOT1q59mFHsumzeyrXStlX/NWSlOKUQ0qfHtA/B+I
         Uf+jHnUkZI70MDDRXRTzNCBERAMTBbVJbM8DrV8yWpqyHYyZDh2pt1vcN/lNobhVDpKA
         wz/jssuHw1JlvhILtfAXAeco43ApitOGfAFHqS6Ei6gpPAFXFW2ca0dZSTNd9NeqtV+A
         52Hp6O+RECl6Bd8syw0nShWVlk83whBTh4UM0IBUOItTzTauwXINp3qm6x2uUKhapheO
         BmjvO5giOM94E3efM2e41PR/takXs/HXNCn4bSgCZP3iyMx0otEfM41Bv/fFncIduM5E
         Ub8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765365880; x=1765970680;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cnMORWoZXvu5f6gtZ/v4yMHO8QWC0/Po8/JI0GaNh7c=;
        b=CxwCZd9kvSfKB0QGJyqvSJP8rqHP7+uzPkvz/4lvidUstkN5k2wD3RQnC6I81n+qU0
         DXPfO0unRzaoZKQFHKapj19fubgP8UwTJevtOzccI/gmDeaqpHEYUmDhtUXpx9UUqhIG
         0up6nJU2Zazr/3p56HF3KLcpcc061qI6+OQswfKFSMUOQRnHBSt2OXK6cJkgjMC5w9mr
         M11otqQfSFFQbjGbzLYKhypC+ASjyhQAp78v2c5X2m5sftC8WEg5X+7u5ZgCE1GwPR00
         lkBQs68pD1ZGfEdi3k6NJ9GuSoIMmZOkicd9NBAlpDyeQz2k59UUPq3frzJkDvpy+weg
         xNmA==
X-Forwarded-Encrypted: i=1; AJvYcCXo4oBZZ0mxrcfQcb0DXWmpdfKvwTnbVDNo7C29NL/AQdQDEtlLkNU4A+06Uu6XTGjOFnZ3JjxhHTceuA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzCB07FGO62ERpLBjWb9mPrMUzQGFj/tAn7DaiCAZvwV4zQyfoZ
	rnwTQdZ14vHkhcnNlFdp5aGUFDK9l8LeAGI25syusbCLeGP6d695NgWYuQWeoLG7mRk6wX1R6Nh
	GAILrb9y0O9H2ZD72d1xSora2wi/NrpbsP4Tnv+UHaLK46oPOLt5R3QWdY4ZzHB7ciAurspjxGg
	==
X-Gm-Gg: ASbGnctLY0iutgo18xLoz0UCCfd9UeSMARdXNYA9pXk/PzxzS0P4yn7u6r3ovHxxgha
	8edXNygsd92bXGFp0i+TcSDmnTIqUUoEujF19Vn/A1PhtbC2er4IXu2YuKnjfIRaDOYOIjhKYcW
	LsFPfolatJsr8XqkjJoZaxw5x9RMhau2l7SEQkZlaG4HcIHec5X8QmMMQeHT5Hx83/mmzNXWWrQ
	ey+MOr8p9/Xs6faRjgfXl9PRG/yBLcZ7qiyinV1O9OqdtOCjrlkw8UMmHir2/dk4xlBAISWHK4R
	MFZS9kjEaaAPVQzb9nu6W6yHS4qG71aDhV3KhVhZEgHQMut1izjCfqLFJrUZZ50GP5oaC9piSy8
	SxcNtg1/nXwbmg90ThBmBRJiOihHGILRxeJyXCm5/4dmKeusbsKDarcQb+nWZLsSKXKYsByLjDD
	++l5guoieM1k/4Vb9uxIMaL7fn
X-Received: by 2002:a05:622a:2483:b0:4ef:bd1c:69fa with SMTP id d75a77b69052e-4f1b19e77a2mr22745801cf.18.1765365879667;
        Wed, 10 Dec 2025 03:24:39 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFO9bwBKRNmiwv5FMgTPvCrvJKKiQgWKJR0H8r2+dfvJPaWrOtgVlfrbu7O8TWWqFyYAzrnDg==
X-Received: by 2002:a05:622a:2483:b0:4ef:bd1c:69fa with SMTP id d75a77b69052e-4f1b19e77a2mr22745501cf.18.1765365879204;
        Wed, 10 Dec 2025 03:24:39 -0800 (PST)
Received: from shalem (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b79f49e3fb1sm1696851266b.60.2025.12.10.03.24.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Dec 2025 03:24:38 -0800 (PST)
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
To: Hans Verkuil <hverkuil@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Bryan O'Donoghue <bod@kernel.org>
Cc: Hans de Goede <johannes.goede@oss.qualcomm.com>,
        Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
        Sebastian Reichel <sre@kernel.org>, linux-media@vger.kernel.org,
        stable@vger.kernel.org
Subject: [PATCH v2 1/5] media: ov02c10: Fix bayer-pattern change after default vflip change
Date: Wed, 10 Dec 2025 12:24:32 +0100
Message-ID: <20251210112436.167212-2-johannes.goede@oss.qualcomm.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251210112436.167212-1-johannes.goede@oss.qualcomm.com>
References: <20251210112436.167212-1-johannes.goede@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: Z2nJNR74pM3KVbcOeMv2lBNB_74iG-gi
X-Authority-Analysis: v=2.4 cv=Bu2QAIX5 c=1 sm=1 tr=0 ts=69395879 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=wP3pNCr1ah4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=eVcqbF-lr0Sowpx3myIA:9 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: Z2nJNR74pM3KVbcOeMv2lBNB_74iG-gi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjEwMDA5MSBTYWx0ZWRfXwHOlgHp/Sh7g
 wCbgLone4sa5qZfcwTTp1GwQsLVdCiDxQ4oDSsCuR7acKBwtNpQ5uCBXF//w/RoQ61cL5ndYPH7
 ZCjZxMQ1y6FSql9zv1qZdf6J4Zih1D109HTZZs0Z2a2D3BtLpTumgbDetQTK9gWjdq722GFJJpR
 e6wM+Dki/frRH08YhbBBy3h26vxwloKtGTZyEGZyLCPYucNavY0a0usx8kQxtehRBc/t7+apcCI
 SA8V63BFaAokyxNyFSvea6DFvKDzfe5w51HH3GsI9O58/RfDD6RKzm8ObRhnGeQ9UXVRtlnv62A
 1NpPfKOjz0+sjyJd8FJElXYfFn2/a04SdDNVbCmyfTSo46VW8IqxoOycHvBNlP8RZ61/XGpElrc
 BDdEn0/n5SW5vznyHFYVJ1bJJVukTg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-09_05,2025-12-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 phishscore=0 bulkscore=0 impostorscore=0
 suspectscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512100091

After commit d5ebe3f7d13d ("media: ov02c10: Fix default vertical flip")
the reported bayer-pattern of MEDIA_BUS_FMT_SGRBG10_1X10 is no longer
correct.

Change the 16-bit x-win register (0x3810) value from 2 to 1 so that
the sensor will generate data in GRBG bayer-order again.

Fixes: d5ebe3f7d13d ("media: ov02c10: Fix default vertical flip")
Cc: stable@vger.kernel.org
Cc: Sebastian Reichel <sre@kernel.org>
Reviewed-by: Bryan O'Donoghue <bod@kernel.org>
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


