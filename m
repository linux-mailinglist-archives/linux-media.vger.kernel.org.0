Return-Path: <linux-media+bounces-56286-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0D2JOw6Ru2lmlgIAu9opvQ
	(envelope-from <linux-media+bounces-56286-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2026 07:00:47 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 54B9F2C6740
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2026 07:00:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7238E30F0B61
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2026 06:00:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9F5A39A7E0;
	Thu, 19 Mar 2026 06:00:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WePKgZPn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZnquuyVk"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C98039A06B
	for <linux-media@vger.kernel.org>; Thu, 19 Mar 2026 05:59:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773899999; cv=none; b=mfrmrsyYJFNqxX7yeJLUP6lS00SjgDwKybLEioLiHyp1v8UATmoss+D5nqArK7hppF8rtEoFqWsCjGA1QbrRl+mGxZTw9hDGqV8BPn/8SQFwzd9Jaxvwx0cBIHg8DZOpHTJ2qyKe0JNtoTiRG2bnqrSEG6kmZaZkJVcCqFXNfxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773899999; c=relaxed/simple;
	bh=2UsUzwDS9vrTW7XmWOeg8FEIp9GoGoCVKVqNC/kLiOw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=hlHMxthVUJWcJwBa8SrxJIkchgEDXA0lM+T+GrDcC+MnUtofrLc6CNa2CdiAMXiXW9zKkQw/nbClUAv5jMo7tFZbXU32zgBbaPm5tNp9GA4pkLpfGKmkDCkHmAyVmoxfmH4X4WyzQU2+n+vjm/rekfM9y/0iheVn4uGPyaIIBkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WePKgZPn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZnquuyVk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62J5XIMx3573640
	for <linux-media@vger.kernel.org>; Thu, 19 Mar 2026 05:59:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=RscWtkozYyOkH1Xnq3DS0c
	N3dAN9hmOZiONFiETL2P4=; b=WePKgZPnHvJ17s9d32kn6DqrXClSs422AgBXhy
	FNfqompbJC5vR5F9WqDKcghOO7e/wC7C+4GexOiFTgl16HRoAT0RugYCIfvW6CBI
	nwHZaVF9oaLXnb5uzzBymwmoHa/sKuu5BOAGu1zdvb6hgZvBFf7goO0+blwCcAy5
	JYZdoi/ZXe72qDu+voUZa8nN3coPMsv+dUGnv2q46gOlzNjeAE9LTNLxBbSsgSAd
	1Ju9I99pm0VELy+XV3UCgKXS13Epd8pPhM1NAn7ZpOQIBzEGQW01m9IGI5H9d08c
	1Dl9J5UW8JizXDEPObIxNa4bjHZZG/QsOnj1oe+fx3+s4G5g==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d083r8jbx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 19 Mar 2026 05:59:56 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50921f7da67so40973711cf.0
        for <linux-media@vger.kernel.org>; Wed, 18 Mar 2026 22:59:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773899995; x=1774504795; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RscWtkozYyOkH1Xnq3DS0cN3dAN9hmOZiONFiETL2P4=;
        b=ZnquuyVkJMeI/8Aer2Ypk6+YadnWtA19skjysb2ejAlPN7n3nhyqugLVMBjhWxU5Ue
         C7jAXIKIdKTsiMiotZpWQA+HW1tpr4YfjAGmEEr39FdJzZeKjn9Ik2ekTS9Z4zvgobeT
         6huYE+qubBbFbuXpma4OL9HaF5AkQ2+iEbIqlQYsLy3Fa10TW3++cjbq8MCznYy7iRjv
         AaIj/jNdvwE4DO1dgwPb4u7G6tl8pygejGpy1290XPC2X5VR+V4OKcXsz6Vr5aC0H1Bh
         TvtR5LaMxqSLtIyMg1tTzM3gV9QBiLBEGdhn49hNxw2C6TSdgXy2xar+JpsmjI6gZvDl
         tgyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773899995; x=1774504795;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RscWtkozYyOkH1Xnq3DS0cN3dAN9hmOZiONFiETL2P4=;
        b=eRP86JKKUC+neDyqBMveERzPA0K02M1z3vol5s44+7ol6Mm6K75UnLX1khrzVY6Bc1
         kVcP/REJLU3STmh/SxxNhwSJA4ef6IG21qlLAKZzVhKQ2PfFX9668uhBKgmeoepwoIgL
         N1tnCVQIB0GPPTh9o8O7nv9MeiFVb+BLstvW0mepUASUVnFiQb8XjchBJPK6kdPsERLf
         W6RT/c94x8V7GSK0In2SQjctmQ8EEnMJ+hcP5Pi6ZKTse4Lk0EETLCb8cayDagWSWyWY
         6TCwGc3kTkgzG3ABc+tSaz/B50L9Lqz0f0hxeCme+t4O8eUq8A/3iQNFS8+Q8eqc8D5y
         Yt7w==
X-Gm-Message-State: AOJu0YwWHUneWbgWCaVQbrxbcA23mrpBrzkcI6EEC/aWsOv7lG+hdMSd
	LC9nIh56tnBzEnCxRLjgyIHA7sPkYM/KbpBKgp8iZPDBWQXdjHeNokeRbiC7UpfinhEepFns3kf
	4639D25CGDAqSL4nk3CUv5LXZtEADQ0sFRHVud2Wx0jyhu5AHEkjAg4CXvjK0oPDrVg==
X-Gm-Gg: ATEYQzxfGgUUXNlEm1WW5L4pjLEDFMPeLMDmqxtTlWc+XlSaWV8Aj0awOr9t68DCNMV
	o7u2K3ypshjX4hmoDeyEDupP5P6vjRi5PW0WoEkDkOAU+XI+z5JsCjsgYtkJGuZNlGAWs4XqKsJ
	BVOu6Zoo4w6qnnsrIvfKTQNudbMilvmYew48Sy0GOLHuFiqfNTyLDOPmnmD+v8TSQbyDp4nLt5J
	WKUrbXZhbG2g6Qm552UHCbF70uYZU1Ng2QpPfQ/uJ+cfAwaAFC4cb86RlxCeLC8NZ461rC2FMK9
	EtIx12kxGqM8HCLJdvLA3y91yZ/6Jyi1FtvAOv9fuoYYZyw2kbGAYXKrPlUU+la6qRoezlY2vea
	X2bDGtEo+rr4QCJsZrJNKAZxoke/jGkfFP8Hyl2HugGjqBjvuw30/UAnSH6mf0d+A5wiFNnS1uj
	vdlFW0RefOKRQVHqhMv+usL234JQh8rAV/+N4=
X-Received: by 2002:ac8:5992:0:b0:509:1f95:f3b6 with SMTP id d75a77b69052e-50b14742dddmr78805901cf.2.1773899995268;
        Wed, 18 Mar 2026 22:59:55 -0700 (PDT)
X-Received: by 2002:ac8:5992:0:b0:509:1f95:f3b6 with SMTP id d75a77b69052e-50b14742dddmr78805741cf.2.1773899994751;
        Wed, 18 Mar 2026 22:59:54 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a279c7415asm993174e87.56.2026.03.18.22.59.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 22:59:53 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v8 00/11] media: qcom: iris: rework platform data handling
Date: Thu, 19 Mar 2026 07:59:44 +0200
Message-Id: <20260319-iris-platform-data-v8-0-55a9566ebf60@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANGQu2kC/4XQyWrDMBQF0F8xWlet5sGr/kfpQmMjiO3Esp2Uk
 H+vbBcaqE02gie45/HuDeTQp5BBXd1AH6aUU9eWQb1UwB1M+xVg8mUGBBGBCJEw9SnD09EMses
 b6M1goONOoaCYx0aCEjz1Iabrgn58rnMfzmOxh/UTWJMDdF3TpKGu2nAd3hqTh9CDx7V1VZZyj
 LGGU2jHvK6Ox3SC+ZIGd4Cea0OjdcIwW0/sf1ogjNGaG+3FQSSiYM5aik3YC1C8Btad5RCYG0U
 4glFTFYgOkmlZTxzMpx1SHrr+e6lvwsttv02praYmDBF0xHHKqY6aqfcu59fzaI5zGa/lWdSJP
 JdIkYyLiApDnWJuR6J/EsV4U6JFimUPV455FvyOxB4luimxImGmifSRaST2JP5c4rOkEFPMRFa
 sHUk8l8QsSUGtVVRGT3Yk+SiJTUnOPTmpI0I0crzV+P1+/wGtSRj+UgMAAA==
X-Change-ID: 20260227-iris-platform-data-c5c80e84d1a7
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=8007;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=2UsUzwDS9vrTW7XmWOeg8FEIp9GoGoCVKVqNC/kLiOw=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpu5DU94pyV/aefQF/XRs6p5/0dmzoHJ0IeqrSq
 ohZPFQHcfuJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCabuQ1AAKCRCLPIo+Aiko
 1VEtB/4vuHT70HH0G7dJVoOBGM8e93Bolh2rtQlJz/RvMvhKDOUx4P1CAi2yh6ymUqIY+x+m0IW
 bgxObc1BzjlS4gzekRXV+xPNN4LY4ypsOE/07FuQhmP0PldlawVlsfYN3c1jmB5B8QMc2Fyrcfl
 qEXJGmlLi7XjYpvotrwpk2hZhbdZyEWTzFbv5Gr4HTalzOScthLA1An9ouFiQcJb1VTDdgvBaPH
 dzBEvvj0BMm8poTTbnahgjw9qAkFbISlL/15vFhtgWj+TV9u9ssbSQy2kUKusW9/xenJ0wt1gZx
 MzZtHMdpGzuqCU2etYI17mpoXKCD1iZh4XqT0RC7vLQcs0Ey
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: eKbYxekDEdkt3epIkw6ncOyL5hHreTo2
X-Proofpoint-ORIG-GUID: eKbYxekDEdkt3epIkw6ncOyL5hHreTo2
X-Authority-Analysis: v=2.4 cv=ApTjHe9P c=1 sm=1 tr=0 ts=69bb90dc cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=6pOZfQhh_3AQRcyt5nQA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE5MDA0NCBTYWx0ZWRfX6SDSbx0qLEsb
 j6T081NQIPlxWlNrJtNeUTaWMSRggKBMScQGLRpL3qviimpwbTrsgn5zNPWxPaPdjyxIWPBkRKF
 pRIkaKNlDm1WVF5KtPgwm0oRlaQ/kKKOfE54Xug1uub5RPwmrH6DiWjgNEwSMQovvXn5xqyZGwO
 jek8bY55ln6Ihg65sGj1uefWE/pOhKR+k4OoiLLHQAYPM4jCFblvqF4eT2elG+oqTCj9/yHURkW
 pql1+E/TWS1Qy8k2Fu1hDMw8TknBLX1b8bzhyrnkf4pQsyF71nUuB4uVD4qEjthNcgRpqsvxIEh
 DPoi97HRrSfTxn+7mKQcSh2T94arJur3gt8T7gRMCr0yJ2DTJlQEcOSfzAGDDoasUPKBmCvp7nP
 K2/uiIpxyxpd7sipBg3KHV90EbEjOd7knvbFvyc+MAz6nkNwoOA/ZSTiK+23VQZ+P67cuN3dEaR
 AC3BqGYEGkCIQGhfykA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-19_01,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0 suspectscore=0
 clxscore=1015 impostorscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603190044
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-56286-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 54B9F2C6740
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
 drivers/media/platform/qcom/iris/iris_core.h       |   9 +-
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
 31 files changed, 703 insertions(+), 828 deletions(-)
---
base-commit: 8e5a478b6d6a5bb0a3d52147862b15e4d826af19
change-id: 20260227-iris-platform-data-c5c80e84d1a7
prerequisite-change-id: 20251119-venus-iris-flip-switch-d59a3fbc6a4b:v4
prerequisite-patch-id: 615a763749fdc0c4ee184478bc64120972d8c7a1
prerequisite-patch-id: 6d85e3db422bc7f16246249288a17b92f6edbc09
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

Best regards,
-- 
With best wishes
Dmitry


