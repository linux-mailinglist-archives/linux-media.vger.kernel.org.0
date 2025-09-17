Return-Path: <linux-media+bounces-42670-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0826AB7E360
	for <lists+linux-media@lfdr.de>; Wed, 17 Sep 2025 14:45:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 237C2468069
	for <lists+linux-media@lfdr.de>; Wed, 17 Sep 2025 12:43:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5EC81F873B;
	Wed, 17 Sep 2025 12:43:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nP6pojE/"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07114337EB9
	for <linux-media@vger.kernel.org>; Wed, 17 Sep 2025 12:43:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758113000; cv=none; b=BdPEvQUOuZheGNuj076tQ2AI+joP5O4mJMV8OOd57OmEmdI7+29gb8kneN8JfTiwOMvJ3ojXZEDw1DN+eYJnuWMgQcDH80/mFNCwThaSeRWMwZ7VobLgLhSnCrOyXjEEYgXS68LvkZf0KaTjCbBYVHnhOVGW0JyrBSTIMkVcz1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758113000; c=relaxed/simple;
	bh=oOZ/7kAmUDMub6ey+4hK6Sglu0Yb5mr5rXFQCUqGmPs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=fr3RqFbqtUJLIgbZI9831blwNdHYzmWgcFWaZR4HBoYYSA8cjTlJnt7MpZX/KeEFesR+osDuZXFEvfFLLPhkJd9TyO1Z+C2bMSfBdKM/L0qK3B83cIIvQXSLBklTxAjiR2m05WXqwrKwmQZrKlSWKy6iGhROH2zp/nlj3TO1XEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nP6pojE/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58H8XlJO014430
	for <linux-media@vger.kernel.org>; Wed, 17 Sep 2025 12:43:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=k9z+tLwy73tIEM76xmcjOm76wTNihCeFsBC
	dMYZqszw=; b=nP6pojE/v7li6XNVjOY9F37t5DSUV4Tmd9UbpQK7ki3QETLnCLq
	PWsU6YHEJcJLROH3hMW9cvGhzvSt4qrI9s7DZc5cDHDGG0Z+rPPrTMrt+FnNftG0
	MhTk5l7q8DVJG9wbY7E8IBXHNqj3Li4dVrFaXuTMBlEpMh9VJWC59wtPtjH8gZNk
	u4VKgwjgi70YR5KkCZHwvc+QYuch1LDkck11R1mXk6luhpAqbq3FgjeOvCrrHV4Z
	aVQtZsIw22TlxXGfjTcKT4g4ygXkE+bRHIvoIvN3NqHRvCzke6eTa5Y511zW2Jt1
	1rztMDsNdZ9t8dsLyaanv3wViSXh1k63lQw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 497fxu2d5u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 17 Sep 2025 12:43:18 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-777a81f38a6so101843296d6.1
        for <linux-media@vger.kernel.org>; Wed, 17 Sep 2025 05:43:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758112997; x=1758717797;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k9z+tLwy73tIEM76xmcjOm76wTNihCeFsBCdMYZqszw=;
        b=YEr+cuFFYcckNJ54Clx9Pi8Vb8iVJql5E85bfazq6fHYo/wnVIyanQi8wCDD5gMUlW
         KjdidhcPbCI3O5DctfWWhwL17qOHixtwj5eIRUKYr6EMVDMyaSk3jcQ62qKLjn5QbPBX
         T+y4iEYd1J2rjWKzi2UVZmQAH5SkyjfCdr6ZRs3kb66Btq4KTyhtsQZil3huFuGWnAlO
         ynimSyA+Cm1eRmQdmUUnxhLe3SzmpUAcrLS/UIiFd5S39IQxXza68TjKOdt7kYVqQ0+i
         W17V+YFpsh2CrgNcBg5VcsoUXXg9zIYHDV8FbncgsuXwqqjDLb51ao/2PTHJJOVxE17y
         j0jw==
X-Gm-Message-State: AOJu0YwL3F9ppUVC/EAuxTW0q7ol5WeQt2e73oUxyRSkZBtZS1KRA+NZ
	WEKbyVjgEyq8pzXLxGxb3AAppThskyS9ZJ8vKU/x79hW7CfIxA3EWA3b9dLEbfkq5LxOfyaWFsu
	dyOqyI8E7hHIeV3QGi6GeL6RreSbR9nNC+FhJN9pNPVuaqEL7hHoPzffODUyHmFgv3w==
X-Gm-Gg: ASbGncu6iIgpAjao3yFvTyGiPMja50P1DSCArIJ/b42/Ht5+wYMu6dw7+KmbCfNonct
	bbyYNJzcZ0CHED3rfRS3YM1P5Ml5BKTGOBwrrMebzOTTZbWzK6lUE5RyCR0ic4RmB/J2xjmGYWH
	5bsc7CXjSW/rvr7Cn6EO1HP7cvgukTK0A/IedqGbTEfizDMlk25AdGZesWNe6vNg091z40b4yUX
	hfDKzVrwS2qt8CQ7RF/10pls0VBLItPQJynf1Pm2bCmIZr1K6cpt0jd2NknrQXOVvDUrpI/k9C9
	FBpJk7kGQjHttYfZRGAlFMHbUIqE3rfxFSmHeoduLxNF5KDlnPW8y8kayA5BAMAO7B54kQOlxJU
	=
X-Received: by 2002:a05:6214:4e01:b0:78e:f843:e946 with SMTP id 6a1803df08f44-78ef843f609mr13785236d6.18.1758112996561;
        Wed, 17 Sep 2025 05:43:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IELljfmECKu32zNDPwj9ZBwm7G4s6/ARtKvGww6liQ0R5vbGuh0ED7c/QnHn3Y9lXKYu42Icg==
X-Received: by 2002:a05:6214:4e01:b0:78e:f843:e946 with SMTP id 6a1803df08f44-78ef843f609mr13784786d6.18.1758112995894;
        Wed, 17 Sep 2025 05:43:15 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.qualcomm.com ([2a01:e0a:82c:5f0:81ce:8337:616d:c2d5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46137930274sm35251035e9.6.2025.09.17.05.43.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Sep 2025 05:43:14 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
To: bryan.odonoghue@linaro.org
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        vladimir.zapolskiy@linaro.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: [PATCH] media: qcom: camss: vfe: Fix BPL alignment for QCM2290
Date: Wed, 17 Sep 2025 14:43:12 +0200
Message-Id: <20250917124312.675996-1-loic.poulain@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE2MDIwMiBTYWx0ZWRfXxsJSyJMtiBch
 tHv7WuhWoL1dxs5XVLpQD0HsgCxnhqAoO755L7Z72qI405658kVJBhcF90J6F98cYcMWQ1U6xn1
 LgbiDzYJ0eAEVdUgqR5IZoIGqAC3qy5nfDmkGW6mPlpzNfbxHxsjLlIpCYSuSmVXdlVEx1fOZe3
 y4WiS5YQ4mZ+5t3MbjhgJcasnj28E4e9pORcki7pelFKuyZDeRmgyMOtPD63WJIzymw+bUmLMcb
 UqpiCWTOI6P/aOdPLd9mF14Ti/1gT8TMjZLoL+QMSLeX6B+mxmz+JtJ0LKylBtVIY07C0Ftchcv
 Dz3+0S6C+J6zfiQsF9D1jDLA0MU9oIlb5FphFMvGcVXCOn94sBhigmCw0ez2nMxtMzhcBtg5aU6
 PnfFicFp
X-Proofpoint-ORIG-GUID: a9VfrF8rvvb4qPzfA9YJfijMpK3IA3mC
X-Authority-Analysis: v=2.4 cv=R+UDGcRX c=1 sm=1 tr=0 ts=68caace6 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=yJojWOMRYYMA:10
 a=EUspDBNiAAAA:8 a=gZ4aIBoJpEVIEF-KsNAA:9 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: a9VfrF8rvvb4qPzfA9YJfijMpK3IA3mC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-17_01,2025-09-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 bulkscore=0 malwarescore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509160202

VFE-340 requires 8-byte alignment instead of 16-byte. This adjustment
prevents image corruption/misaligment when padding is needed.

Example: For SRGGB10_1X10/3280x2464, aligned BPL was 4112 instead of 4104

Fixes: 9e89149a19ed ("media: qcom: camss: add support for QCM2290 camss")
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss-vfe.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
index ee08dbbddf88..dff8d0a1e8c2 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe.c
@@ -1989,7 +1989,6 @@ static int vfe_bpl_align(struct vfe_device *vfe)
 	int ret = 8;
 
 	switch (vfe->camss->res->version) {
-	case CAMSS_2290:
 	case CAMSS_7280:
 	case CAMSS_8250:
 	case CAMSS_8280XP:
-- 
2.34.1


