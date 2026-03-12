Return-Path: <linux-media+bounces-55504-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EHH+IP/YsmlDQAAAu9opvQ
	(envelope-from <linux-media+bounces-55504-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 12 Mar 2026 16:17:19 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EC262741E1
	for <lists+linux-media@lfdr.de>; Thu, 12 Mar 2026 16:17:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id AE9C4306744D
	for <lists+linux-media@lfdr.de>; Thu, 12 Mar 2026 15:14:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53D093C6A22;
	Thu, 12 Mar 2026 15:14:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NUqQP7W9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XMG7V6Rd"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4964397E94
	for <linux-media@vger.kernel.org>; Thu, 12 Mar 2026 15:14:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773328471; cv=none; b=aNwOV9QEwLzHeUojo9ghrv7S5/mJXJtUVZNlp7/d/eYzVACBXlBO8YLuqvltXmuAnuvCHfsBmSZUIUo1WBSkj/gXYykGPmhV1CLp7+nA5k+6b88KTI0JYHZOPp1+4augO6CDzFQ0xGDofUawgm2DCAX6IHCJf7HI8p4qZEelGKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773328471; c=relaxed/simple;
	bh=/ZA8EqIJvQFdw+PjTKWRkmWtbHTOk+KCGhpYBiyWltU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=MRq3y7GitPgvHB6vQgiJ/Srzn7RObkUQ9UJCd3uXWazkb+wWiWjGJPVB859x3DtCfgzq01aLctGN0ssy3qkFa++vpwwfOjR12Gz4/CD6KH6vhQHDdhdf4Xt/EBVMr+IzKQI9Pqsyo1JQuwNHrOTNLGZltOWpj06WFzNB8rPRzd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NUqQP7W9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XMG7V6Rd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62C8W4PP1922702
	for <linux-media@vger.kernel.org>; Thu, 12 Mar 2026 15:14:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=GM2Wx5uXh6SPCHi+KyzhFl
	2NF8yLxL2VWQtpmg3m4Iw=; b=NUqQP7W9ptNHgtwvc7SCHM/VSlX9q1NrQ6+ep3
	DXM1oErDJtbC9B2D2ivZre8LuWAvZUKycVag36ZG39ATP2Qthr7jqhKa77/WEoZI
	N7JVNrTGFpVK5m3N9kBkxRsCrNpu/wh+Ql4vD8TeRN10WEE8jLP3/YQv+otPrz7m
	k9i4mui91jVwLfEOEEITG5AVAE2OkS4aVF8H1SUhuTNUJfOIZXWhh1DRQuSLDYte
	LOZdP9TWEMyw0TyFLI1Vb8HgrEyEVcmgLDRbdzTVwbjUxERXgVhG287ffuHEs8r7
	+FYQK83f+P+p/Le6BtAlwBqTXUmYAc2Zrn9HxOEprHn+3Peg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cuh4wthx0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 12 Mar 2026 15:14:28 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cd773dd39bso850131285a.2
        for <linux-media@vger.kernel.org>; Thu, 12 Mar 2026 08:14:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773328468; x=1773933268; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GM2Wx5uXh6SPCHi+KyzhFl2NF8yLxL2VWQtpmg3m4Iw=;
        b=XMG7V6RdIPZI86ciyjvAGtcRvK6fbnYt471TwYYGlAKM8XokvKNYEXk0c1BagMNI2b
         1yfuh+YvY1sVmGALtcvMBhskV7/2c/H6WqZQ8clMpqf1hjVrV2P1TwWGBW5GZTVBRrwZ
         Gut1/kdIRAQrgwYisW3D34OenMMc8FJ4n57CcAC8SqXLj66dSmaG5Dmf1bIWiyTJ/dQk
         eqWA8xDqCYOGcs8xOXcA7QNi6nhULyMZVRWxPd6rKuHB/QdfC+uw/ZM691Q81VctVBb2
         GhKn1qzt2YX2c+onzqFClQJhT5kTtLMtMx6rXJy+jl7ZyRQ8YHjKmnDlGifdEjofkf1u
         4BcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773328468; x=1773933268;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GM2Wx5uXh6SPCHi+KyzhFl2NF8yLxL2VWQtpmg3m4Iw=;
        b=ZjE6C+nAhhoTd3TAxgNnCCnw98ye0P0OIRYCCdksZgsqUZ6uWTLtspAMlqexorF19s
         3pU6FSzWmdV3AhXfPyNfeMAlPJgkAaMg2LoE5Kc0Oa2TcV/qYihdjxlwuoc9iuAt4zQH
         6bv8dhXTiiZTa64J3ER+tIxX3fZ+m0x3UJhEC9AbLtHGPgo1kb9U+PbhzJdPMFpOSrrD
         GY+Dic7HxT+f/CzVqpPdFKEwX4mvJW3yxjWnB0CnVEUMLGHUIyRSY4BBnplgFh3USdLN
         yY/CvLu8zAY0Taj9xy7k2Wk9wnZppYVxwn8sJhhePwtVGJdnNzTQ3kLLgLBnFF9XjQMA
         pWEQ==
X-Gm-Message-State: AOJu0YyMqfUPEJt9ow4MGHpmFebk1I5OEZtl1PfONzX8BCZmDqS36tdt
	UzFOINAJTAbAfaPU+E0RCdQexIjJ1Nn76zwLOfus9CyXKLLXCgJ9k2q54FwypZjXhHfQ4+EaeR5
	4XXH7cR3Dvb502D3vuZgKNwLA+/aTssqHr3NdsEMvOpcgWIpxS70e24VZ/8c+UFcJuA==
X-Gm-Gg: ATEYQzyraarOOqybgofCqnAO4Uk+OAYn4q6WNWsKmLHoekxx/tME9r9ztZGWhlBUV6a
	PBe1P+M//c159HydXlmYpyug4xF5OJwMy4SfmnfR63E7EoFo9QBsvmEIzvuPKLKaYq7D+XaQxA2
	BnXucJKgkqKdks7xiRPiWwIaXhcup1jACDuJNcfd5aiF1JpJ5f8rN7IoTkKk32X6ZovEASi4ER+
	9Ppa3UbdemQ/oRirNAIJFlLvHGCeh6ptSQWWiDui2KJuL+d5Znid0fWx8tQ2pa95oYbXpn3emEE
	1qzc1lRphznaEgsExM8j3BPw0LH99KSWEzy++aHuW5i//RxkLhmMSck1hBtkQR5PiCn+FoZMtDF
	6SoIhMCh+Zdi+T54bBYNRkP5YumJBYPJHfMpcT3NUy6PVnZFdLQ3q6nFapeowT7bmDWdetlfpG7
	FytpW3ER1N7nqwLV9A666CEUuSzPX2vuTMKzg=
X-Received: by 2002:a05:620a:2a09:b0:8cd:827a:2abf with SMTP id af79cd13be357-8cdb5bb1ac8mr1907385a.64.1773328467792;
        Thu, 12 Mar 2026 08:14:27 -0700 (PDT)
X-Received: by 2002:a05:620a:2a09:b0:8cd:827a:2abf with SMTP id af79cd13be357-8cdb5bb1ac8mr1899385a.64.1773328467233;
        Thu, 12 Mar 2026 08:14:27 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a15635786bsm972822e87.61.2026.03.12.08.14.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 08:14:26 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v4 0/6] media: iris: enable SM8350 and SC8280XP support
Date: Thu, 12 Mar 2026 17:14:21 +0200
Message-Id: <20260312-iris-sc8280xp-v4-0-a047ef1e3c7d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAE3YsmkC/33R226EIBAA0F8xPJctF0Hxqf/R9AFxrCTrZRmlN
 pv996K2SdPLvpAMYc5cuBKE4AFJlV1JgOjRj0MK8oeMuM4Or0B9k2IimNCMC0Z98EjRlaJk60R
 L1XBZO82U1CTlTAFav+7e80uKO4/zGN53PvLt9ktSP6TIKaPCKdCmtVDo+mlEPF0We3Zj35/SQ
 TYwiruISIhSwjVOgtWG/4PIu4hMSCN4qbk1YKX8A7kdswa4LGll8zEwqS0C3R75ucoGWOfH3uI
 MgXzfZpUddSU/6kYYFqRpaxT7UihGWyNLEAaK3BRVVL+TFefcfObtRHv2E8U3P7uONspY2aYvs
 XldxTy1evsAjIBZwOUBAAA=
X-Change-ID: 20260120-iris-sc8280xp-85d13bc60536
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bjorn Andersson <andersson@kernel.org>,
        David Heidelberg <david@ixit.cz>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Johan Hovold <johan+linaro@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=7812;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=/ZA8EqIJvQFdw+PjTKWRkmWtbHTOk+KCGhpYBiyWltU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpsthQmQR4Y4paCODMoNzOssbJkp+oe1OGDwVnt
 LcF5nHZ8ACJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCabLYUAAKCRCLPIo+Aiko
 1Vs3B/9z29srBLfQJxC+uoRBPe1XtkgUZu3dQEbmBR2uRz2qja8f7EQxNVxgONMfJ2++8eA4PMz
 rfU9t+ztWEJ8b02C9rITSah9Et93G6JQc+BFNh7i1r/TmnlG4DB8EKxIZuNuuBlQ/5HKx/YU4Cu
 8qqKYp/0gwrQzH9uE9VK8d61dHNe0cxPtJDncFs1Cq0U46iUTK9aFsXdOLhcZ/4lF28yC3yLDKW
 VhSLaiqlgmv3A4CJsKMLjsovLRqib0z/KaCbOVOsqPE6lkkaLpDzXA/m9P4+NdpG3kSBRVG9k3V
 4UnBurJhvHmYUfYZwUWMeHo7L1L3GQfJzGICDtqPVGPn6Pwr
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=GcoaXAXL c=1 sm=1 tr=0 ts=69b2d854 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=jpKruf4vVCMxx-1oOY0A:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=mUDYQMy1hxdww3aAYIDK:22
X-Proofpoint-GUID: ok4I-RfW8OFp3yZbWqNGqD5b-VemnJ4C
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEyMDEyMSBTYWx0ZWRfX2slhFnwJ/u0L
 DafPxvKaDZgVGTDt+OC29wb6Y0rEtz2cmksUxSca77doItOZ2qlAzClDQnzaGlnbPofgHjWbSnp
 bPGuQHzKg+ee9fcVrU9CcmbkpwEaruiRrBuJFBgcDWatfc98wM96DYG6P/NelQQID7qxfvquCm0
 CKpWpPdDanoHFQEaq5tsNp1ojZi+lG6VQcoWnNSy3ax1rtw9F3vgwjeLD3vcAmAGD4tfPj9T06d
 iPXxNoSbYEbYZvHFFXmQNd8eIsmFThIx8dDOctxCdfxFZy0xm7Ita1O+MeFRCf2joZuOEYwnPYt
 X1fapYb4EqGEVB7TpCS279vXC9JHUKgsdUvpPdlqc1A0kshwdRjlH1d6R1WhzMhjOEHlvENztGx
 HYGtMiyL4XpcPs5wSd0DHnZOp80qT0nNvkZyqOOVVm8eE4/0Wm6MZCJEr70BF2HXVpKXA01KYej
 Hvw8XQS/h4RAgMD3M8Q==
X-Proofpoint-ORIG-GUID: ok4I-RfW8OFp3yZbWqNGqD5b-VemnJ4C
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-12_01,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 suspectscore=0 spamscore=0 adultscore=0
 impostorscore=0 malwarescore=0 priorityscore=1501 bulkscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603120121
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-55504-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt,linaro];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 2EC262741E1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

In order to enable wider testing of the Iris driver on the HFI Gen1
platforms enable support for Qualcomm SM8350 and SC8280XP platforms.

Note, this has been tested only with the Iris driver. Venus driver fails
to boot the Iris core on SM8350 pointing out the UC_REGION error.

Note, the firmware for SM8250 isn't compatible with SM8350 (nor with
SC8280XP). Please use corresponding firmware, extracted from the Windows
/ Android data.

On SM8350 with the Iris driver:

$ v4l2-compliance
v4l2-compliance 1.30.1, 64 bits, 64-bit time_t

Compliance test for iris_driver device /dev/video0:

Driver Info:
        Driver name      : iris_driver
        Card type        : Iris Decoder
        Bus info         : platform:aa00000.video-codec
        Driver version   : 7.0.0
        Capabilities     : 0x84204000
                Video Memory-to-Memory Multiplanar
                Streaming
                Extended Pix Format
                Device Capabilities
        Device Caps      : 0x04204000
                Video Memory-to-Memory Multiplanar
                Streaming
                Extended Pix Format
        Detected Stateful Decoder

Required ioctls:
        test VIDIOC_QUERYCAP: OK
        test invalid ioctls: OK

Allow for multiple opens:
        test second /dev/video0 open: OK
        test VIDIOC_QUERYCAP: OK
        test VIDIOC_G/S_PRIORITY: OK
        test for unlimited opens: OK

Debug ioctls:
        test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
        test VIDIOC_LOG_STATUS: OK (Not Supported)

Input ioctls:
        test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
        test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
        test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
        test VIDIOC_ENUMAUDIO: OK (Not Supported)
        test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
        test VIDIOC_G/S_AUDIO: OK (Not Supported)
        Inputs: 0 Audio Inputs: 0 Tuners: 0

Output ioctls:
        test VIDIOC_G/S_MODULATOR: OK (Not Supported)
        test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
        test VIDIOC_ENUMAUDOUT: OK (Not Supported)
        test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
        test VIDIOC_G/S_AUDOUT: OK (Not Supported)
        Outputs: 0 Audio Outputs: 0 Modulators: 0

Input/Output configuration ioctls:
        test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
        test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
        test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
        test VIDIOC_G/S_EDID: OK (Not Supported)

Control ioctls:
        test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
        test VIDIOC_QUERYCTRL: OK
        test VIDIOC_G/S_CTRL: OK
        test VIDIOC_G/S/TRY_EXT_CTRLS: OK
        test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
        test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
        Standard Controls: 2 Private Controls: 0

Format ioctls:
        test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
        test VIDIOC_G/S_PARM: OK (Not Supported)
        test VIDIOC_G_FBUF: OK (Not Supported)
        test VIDIOC_G_FMT: OK
        test VIDIOC_TRY_FMT: OK
        test VIDIOC_S_FMT: OK
        test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
        test Cropping: OK
        test Composing: OK
        test Scaling: OK (Not Supported)

Codec ioctls:
        test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
        test VIDIOC_G_ENC_INDEX: OK (Not Supported)
        test VIDIOC_(TRY_)DECODER_CMD: OK

Buffer ioctls:
        test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
        test CREATE_BUFS maximum buffers: OK
        test VIDIOC_REMOVE_BUFS: OK
        test VIDIOC_EXPBUF: OK
        test Requests: OK (Not Supported)
        test blocking wait: OK

Total for iris_driver device /dev/video0: 48, Succeeded: 48, Failed: 0, Warnings: 0

|TOTALS|FFmpeg-H.265-v4l2m2m|GStreamer-H.265-V4L2-Gst1.0|FFmpeg-H.264-v4l2m2m|GStreamer-H.264-V4L2-Gst1.0|FFmpeg-VP9-v4l2m2m|GStreamer-VP9-V4L2-Gst1.0|
|-|-|-|-|-|-|-|
|TOTAL|169/316|128/316|154/447|126/447|159/311|229/311|
|TOTAL TIME|242.251s|267.903s|293.458s|261.934s|203.009s|366.936s|
|-|-|-|-|-|-|-|
|Profile|FFmpeg-H.265-v4l2m2m|GStreamer-H.265-V4L2-Gst1.0|FFmpeg-H.264-v4l2m2m|GStreamer-H.264-V4L2-Gst1.0|FFmpeg-VP9-v4l2m2m|GStreamer-VP9-V4L2-Gst1.0|
|BASELINE|0/0|0/0|3/7|4/7|0/0|0/0|
|CAVLC_4_4_4|0/0|0/0|0/3|0/3|0/0|0/0|
|CAVLC_4_4_4_INTRA|0/0|0/0|0/4|0/4|0/0|0/0|
|CONSTRAINED_BASELINE|0/0|0/0|32/33|33/33|0/0|0/0|
|EXTENDED|0/0|0/0|1/6|1/6|0/0|0/0|
|HIGH|0/0|0/0|22/45|22/45|0/0|0/0|
|HIGH_10|0/0|0/0|0/2|0/2|0/0|0/0|
|HIGH_10_INTRA|0/0|0/0|0/7|0/7|0/0|0/0|
|HIGH_4_2_2|0/0|0/0|0/21|0/21|0/0|0/0|
|HIGH_4_2_2_INTRA|0/0|0/0|0/7|0/7|0/0|0/0|
|HIGH_4_4_4_INTRA|0/0|0/0|0/6|0/6|0/0|0/0|
|HIGH_4_4_4_PREDICTIVE|0/0|0/0|0/11|0/11|0/0|0/0|
|MAIN|127/135|126/135|41/90|41/90|0/0|0/0|
|MAIN_10|0/11|0/11|0/0|0/0|0/0|0/0|
|MAIN_STILL_PICTURE|1/1|1/1|0/0|0/0|0/0|0/0|
|-|-|-|-|-|-|-|

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Changes in v4:
- Changed compat strings to use -iris instead of -venus (Konrad,
  Dikshita)
- Dropped separate schema file, switched to SM8250 schema
- Dropped driver bits, it's covered by compatible string now
- Link to v3: https://lore.kernel.org/r/20260125-iris-sc8280xp-v3-0-d21861a9ea33@oss.qualcomm.com

Changes in v3:
- Add missing header, sorry.
- Link to v2: https://lore.kernel.org/r/20260125-iris-sc8280xp-v2-0-552cdc3ea691@oss.qualcomm.com

Changes in v2:
- Added missing chunk, including sm8350-videocc.h, lost in rebases.
- Link to v1: https://lore.kernel.org/r/20260125-iris-sc8280xp-v1-0-2c5e69fae76b@oss.qualcomm.com

---
Dmitry Baryshkov (4):
      media: dt-bindings: Document SC8280XP/SM8350 Iris
      arm64: dts: qcom: sc8280xp: sort reserved memory regions
      arm64: dts: qcom: sm8350: add Iris device
      arm64: dts: qcom: sm8350-hdk: enable Iris core

Konrad Dybcio (2):
      arm64: dts: qcom: sc8280xp: Add Iris core
      arm64: dts: qcom: sc8280xp-x13s: Enable Iris

 .../bindings/media/qcom,sm8250-venus.yaml          |  10 +-
 .../dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts     |   6 ++
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi             | 103 ++++++++++++++++++++-
 arch/arm64/boot/dts/qcom/sm8350-hdk.dts            |   6 ++
 arch/arm64/boot/dts/qcom/sm8350.dtsi               |  81 ++++++++++++++++
 5 files changed, 202 insertions(+), 4 deletions(-)
---
base-commit: a0ae2a256046c0c5d3778d1a194ff2e171f16e5f
change-id: 20260120-iris-sc8280xp-85d13bc60536
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
prerequisite-change-id: 20251119-venus-iris-flip-switch-d59a3fbc6a4b:v4
prerequisite-patch-id: 615a763749fdc0c4ee184478bc64120972d8c7a1
prerequisite-patch-id: 6d85e3db422bc7f16246249288a17b92f6edbc09
prerequisite-patch-id: 579d712ec3f942ba0c362e242c71361c151092b5
prerequisite-patch-id: fa4629a3909fbae3917d8c067cce4f673ee857c0
prerequisite-patch-id: cbbd40736f7a797ff76b0fe2b1ddfb559e14e666
prerequisite-patch-id: 5b50917dcfef01db13af320cbd1cba15fd5fa16f

Best regards,
-- 
With best wishes
Dmitry


