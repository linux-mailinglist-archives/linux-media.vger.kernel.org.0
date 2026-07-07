Return-Path: <linux-media+bounces-66908-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id iDGSCDp+TWpL1AEAu9opvQ
	(envelope-from <linux-media+bounces-66908-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 08 Jul 2026 00:31:22 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FF12720150
	for <lists+linux-media@lfdr.de>; Wed, 08 Jul 2026 00:31:21 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=KR40zBJH;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=TGCmGuxO;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66908-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-66908-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D9176305D838
	for <lists+linux-media@lfdr.de>; Tue,  7 Jul 2026 22:29:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26B7A3D955B;
	Tue,  7 Jul 2026 22:29:14 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5B383D952A
	for <linux-media@vger.kernel.org>; Tue,  7 Jul 2026 22:29:11 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783463353; cv=none; b=aOL3EDQY027Um6YnB1fq4OiHa9By7YQ+xvxKbKo3MC5M2V2YJ4a/24zUnsa9k+x/Atw+Yy1XmAw9pMHUG+1O0pkABVpeuGa4JM6e22Qlc+fByRD/1qSu9KOqCAG6+XWuNXVAuSBTByTS4awUCrLn+onu4tsJ0BjrrxHrlxnVzHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783463353; c=relaxed/simple;
	bh=Yx4Ojo8hT2dAPoa5hdZJacsWB1jCN93GEb4U7XoWr0c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WQF3WYOTz6sjgrImz4H3whbrTjikC2ByZTuyuP9s87Mx3ZZ/pAE4l5OyCrnGYVeVuBrELHqQ/RP5ZbVuxr4SwO0cuel1c/eMZKOqtr/hQNi5Hbbin/KLS6D7K7TAkVD3iHmGcemk8If+u33qoHRPPoDtL3UnjSEsGEZ+43pCEu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KR40zBJH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TGCmGuxO; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 667J5Lhk518268
	for <linux-media@vger.kernel.org>; Tue, 7 Jul 2026 22:29:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PCGh4Un270dq9rjktSNiz/FPU9cZ+BxUKfrIlNR1R4I=; b=KR40zBJH6W9PKzeL
	WSEr/CipfH4YGO/pSs+G67+B7mo9WRk6gbxhMwhmSEXq1ltjtb+vtqdj7m28lI4G
	wJN/3iO9ld6yU1LEMs0phc5G0WUCig8G6PWKL8LLzLzzVkXLVf5TWYt+loZ7nYMu
	rfVFcF6Z+Uz5Rv6MRqwF5vF98nBI8rnFJlsM1ObcItW8GstZr2xKijic2g754fkZ
	8f8ssSw7n6f2ju+sWlB0UiLADV/h4eoCgImwcUSxynnkV/7UVgwMYNhPUw0HC+ZR
	DyD5Kdj0Ike/y6dWXKQPtQxOh7ELN4NgUYewU2WmP+Y3ZvfAtliPkg4wwqAHajAd
	UNILug==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f95e5sf4u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 07 Jul 2026 22:29:10 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-737f1f1e0e5so5845137.3
        for <linux-media@vger.kernel.org>; Tue, 07 Jul 2026 15:29:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783463350; x=1784068150; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PCGh4Un270dq9rjktSNiz/FPU9cZ+BxUKfrIlNR1R4I=;
        b=TGCmGuxOfbyODVat4hZw7Q1/KxamcUxWiCtsRoCcrIoLz2K2Ev8z8aVP818kcPR1uf
         wwpNT127GygTdf6G5u8Y/YKFJKuYxrnPe/xTVnRjKDDrHT6w7DMyQVjRnasPEem6YE9U
         cv7S0TAHN1eJ7GxIp0i+KpzheneguGFc8AohxR3JGW6IY/M4d822tGWow2tJzkscgwkk
         NiTdJxOsNPeFkUwCDDt1h60mgLRSiXqbt8VfK56SXvMFMUr7rusdxxDWcqSg+dAEYFfx
         llYP1JNoMy8INlLY8+6RU5+3xDRJfSq043cDwCF6A//jW8wC1tl7iySTb9FTrbhXbmIM
         HSFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783463350; x=1784068150;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PCGh4Un270dq9rjktSNiz/FPU9cZ+BxUKfrIlNR1R4I=;
        b=rF+A3JnWarWTd4wFJ51jhF15ECVU5Kwiw+EQL6xEODyoP1qtaVyMflBP2sLBRRDW7u
         dU2/rLoaoVjxy5vweq/UauTIZilx0Z5OH3Vr5ZqgFrX9zTOID+LRyz1HYDZbv27r8vTO
         /6UMEF7dr2DlzBzaON3fW6xLS7cuOaA39UgkhCLQFm1lIh50r4vkZlC+RlTVzebw6vH4
         6/ZetYVnwzesFnxQfrdhWRxKS3UiIOs45MqCEaJlOoKYClZbxDzr4/6hkt+vhEWHewP8
         n0tPrL+ywWeFUKh7p/CkLNvXOKqdalwd0c4BNs0nvouvNhEbZKVKJNTs/fuRXw3x3Hfv
         rRdg==
X-Gm-Message-State: AOJu0YzvcERSrnZDQds49HunG7G47agBLg18LjHaUJMpJ635Kl38yGK1
	kaAhQ8dPi2J8B4V3PbhZlnZbJdWbLxb5/Eu3sRaMWZKX9cS1k36ApUv+M++jvvlWLw8xueKGJZS
	dli8ECB/SYhq+Xhl4tSfEwEMwp3NKn96QqveFfEfto0+xlfWH5JlszQJjlL9lVzd1ufYWMaLyvw
	==
X-Gm-Gg: AfdE7cm5+dGNm+pnj1u43n5OaWsHChFZzvsrra9VOrZentwwPCGzkJ1I0iF4iZL0drg
	Ff67PE3tggp56nQsQftmMlJ3h+tj6xUrDdd2Nm/bJ6CdrE5gudvXzus+aZ5uwghMxfUd+R75Bmi
	1F4RyxGaYJpKqcHDZqgZEGgeWJZQ3cKW8FvWEjMuaMee9Q+b25TXgeAR/G+/ohSrTo66sZsUj0L
	rOx1vbOHYpLqYLBuU/ndcZiCHMLWdQ0Cwpmo4OtNlq92z1ZOZ1c2N/X2BUvcZzxP1VszV26jHcl
	7c40/d/SiAb9oPOSGeWtXLSCvLJr8HleWgDmekPQsSD6Ox3bRH6Cml7A2AMy/D3scsh+Fq8Q6SZ
	Mw6NW/3WqdYy53KbLaF4Y4IXhAVzSVHhkCinpeXn+fHqTRM8ONL/KpVUxg2u9qvK/J7NV/8EzYb
	cLTBFQeuEvF0OUKR6HjRpQAc5L
X-Received: by 2002:a05:6102:c4c:b0:740:2974:1b19 with SMTP id ada2fe7eead31-744b7b90c4amr3622007137.4.1783463349571;
        Tue, 07 Jul 2026 15:29:09 -0700 (PDT)
X-Received: by 2002:a05:6102:c4c:b0:740:2974:1b19 with SMTP id ada2fe7eead31-744b7b90c4amr3621987137.4.1783463349013;
        Tue, 07 Jul 2026 15:29:09 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39c7312bc25sm1897231fa.40.2026.07.07.15.29.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 15:29:06 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 08 Jul 2026 01:28:44 +0300
Subject: [PATCH v6 01/18] media: iris: Add Gen2 firmware autodetect and
 fallback
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260708-iris-ar50lt-v6-1-374f0a46c23b@oss.qualcomm.com>
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
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=13023;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=4U9Hhq6CmBYCiS/HXV5oyppARpG3Tf8APX9CCUr2skc=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqTX2oV+7Y6o58E3XJQVS5fgkB7aPQpUErEagvm
 2biRE/0RHmJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCak19qAAKCRCLPIo+Aiko
 1WGZCACPNGpZLxcnwPbhb4KMtiSxUQxKNtWFIeggbfFs3OUGTy8ksTuWLhpfsXywFry7GtuWqYx
 oWMaCSD7yf+Tvmy0RLqIKGKbEtn9iz0FgS52qBTc9ggna3R6aEH/TD2RXM73TQm/WipYb/WxDFl
 y5mKHTWHa0IpfZJVeXRsgN34P+sBuHWAnIsmlCmyTSdgthc07Ibmq3D8YfvU8sRBqbYJEPXts9V
 QPvkps/EG7PA+iSLcqTvY2r/3KnYosNoQEE+6DfI4IkO3xKZWPCe5T7N9lOPJxX5hH/CcnnNHu0
 bcMTOs3A2hExcry+G2MfOwKQdnYscjJ51+IMTJEczbBt/6rP
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: gQX9txjcOefpJgeKErom6jrgRWu2kTwk
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDIyMSBTYWx0ZWRfX611Qji436r4P
 HThQbF6hgPLNEnAXA/USKaDFGi6PCB27fl+QLTDRRN7h3haFUIdURvWSMJizOa2RQwCFdry0NHQ
 TLf40KQsqBiyQiOV/rTTe9tsmo9FMvY=
X-Authority-Analysis: v=2.4 cv=CNoamxrD c=1 sm=1 tr=0 ts=6a4d7db6 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=AJYS51BlHv6FyquiitgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-ORIG-GUID: gQX9txjcOefpJgeKErom6jrgRWu2kTwk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDIyMSBTYWx0ZWRfXxN8n8ADGSi7S
 Lo2GIxsLD3BldEw+BOKvZnK2rVfKvKIEL3i0RW7D9hvOaICaLkFUVGSJmB80iFo1+NE/sulUkod
 1zxqQPM5qcXrw61dWmpAd6Dqgs78NGjpB11rGzuSfOSyeZ1Z90rLPphxdso0LHERBZQQC/YiKq9
 X5YUbyPdluwlUI9aMqC5kzXUjgU5ITLzf0Sus6aTSBnjfOrBhYjoo1rkhqgIy+iCBbHlN5Z4XAO
 mmgEDK8NDiS0uE/z2v0z4XEWKwSmSTUFxRQs1pFvKz0O+f3ZH1y+iPixJhmZ0y/JGRiriJ4o9Il
 oBzEzlTYhl0WYouJBDpULq8pV/YV72G/3PKyOQJ+EGxS7NRwtlvrtogDm7lEZwRTt9xf/Ip3UBA
 /g+5F+qc3+1MXh6iVTtZ20byYIiaZWHN6V2iVHEo73AsPREOIEbiHqBjeIe6Gtg+KTLSR9+bKic
 72c/QkfnQ2TVVQLw2fQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_05,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 adultscore=0 phishscore=0 impostorscore=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070221
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-66908-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:vikash.garodia@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:mchehab@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:busanna.reddy@oss.qualcomm.com,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:dikshita.agarwal@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7FF12720150

From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>

Some Iris platforms support both Gen1 and Gen2 HFI firmware images.
Update the firmware loading logic to handle this generically by
preferring Gen2 when available, while safely falling back to Gen1
when required.

The firmware loading logic is updated with the following priority:
1. Device Tree (`firmware-name`): If specified, load unconditionally.
2. Gen2 default : If no DT override exists, select the Gen2 firmware
   descriptor when present and attempt to load the corresponding
   firmware image.
3. Gen1 Fallback: If loading the Gen2 firmware fails and a Gen1
   descriptor is available, retry with the Gen1 firmware image.

When a platform provides both Gen1 and Gen2 firmware descriptors and the
firmware is loaded via a DT override, the driver detects the
firmware generation at runtime before authentication by inspecting
the firmware data. The firmware is classified as Gen2 if the
QC_IMAGE_VERSION_STRING starts with "vfw" or matches the
"video-firmware.N.M" format with N >= 2.

If a Gen1 firmware image is detected in this case, the driver switches
to the Gen1 firmware descriptor and associated platform data so that
the correct HFI implementation is used.

This change makes firmware generation detection platform‑agnostic,
preserves DT overrides, prefers newer Gen2 firmware when available,
and maintains compatibility with platforms that only support Gen1.

Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Co-developed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_firmware.c   | 119 ++++++++++++++++++---
 .../platform/qcom/iris/iris_platform_common.h      |   6 +-
 .../media/platform/qcom/iris/iris_platform_vpu2.c  |  11 +-
 .../media/platform/qcom/iris/iris_platform_vpu3x.c |  10 +-
 drivers/media/platform/qcom/iris/iris_probe.c      |   4 -
 drivers/media/platform/qcom/iris/iris_vidc.c       |   3 +
 6 files changed, 120 insertions(+), 33 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_firmware.c b/drivers/media/platform/qcom/iris/iris_firmware.c
index 1a476146d758..965384fdd339 100644
--- a/drivers/media/platform/qcom/iris/iris_firmware.c
+++ b/drivers/media/platform/qcom/iris/iris_firmware.c
@@ -16,20 +16,109 @@
 
 #define MAX_FIRMWARE_NAME_SIZE	128
 
-static int iris_load_fw_to_memory(struct iris_core *core, const char *fw_name)
+/* Detect Gen2 firmware by scanning the blob for:
+ *   QC_IMAGE_VERSION_STRING=<version>
+ * and then checking:
+ *   - version starts with "vfw", OR
+ *   - version matches "video-firmware.N.M" with N >= 2
+ */
+
+static bool iris_detect_gen2_from_fwdata(const u8 *data, size_t size)
+{
+	static const char *marker = "QC_IMAGE_VERSION_STRING=";
+	const size_t mlen = strlen(marker);
+	static const char *vfw = "vfw";
+	const size_t vfwlen = strlen(vfw);
+	static const char *vf = "video-firmware.";
+	const size_t vflen = strlen(vf);
+
+	for (size_t i = 0; i + mlen < size; i++) {
+		const char *found;
+
+		if (memcmp(data + i, marker, mlen))
+			continue;
+
+		found = data + i + mlen;
+		size -= i + mlen;
+
+		/* vfw => Gen2 */
+		if (size > vfwlen && !memcmp(found, vfw, vfwlen))
+			return true;
+
+		if (size < vflen ||
+		    memcmp(found, vf, vflen))
+			return false;
+
+		found += vflen;
+		size -= vflen;
+
+		/*
+		 * video-firmware.1.x is Gen1.
+		 * video-firmware.2.x and video-firmware.10.x are Gen2.
+		 */
+		return size >= 2 &&
+			(*found >= '2' || (*found == '1' && found[1] != '.'));
+	}
+
+	return false;
+}
+
+static const struct firmware *iris_detect_firmware(struct iris_core *core,
+						   const char **fw_name)
+{
+	const struct firmware *firmware;
+	bool has_both_gens;
+	int ret;
+
+	*fw_name = NULL;
+	if (core->iris_platform_data->firmware_desc_gen2)
+		core->iris_firmware_desc = core->iris_platform_data->firmware_desc_gen2;
+	else if (core->iris_platform_data->firmware_desc_gen1)
+		core->iris_firmware_desc = core->iris_platform_data->firmware_desc_gen1;
+	else
+		return ERR_PTR(-EINVAL);
+
+	has_both_gens = core->iris_platform_data->firmware_desc_gen2 &&
+		core->iris_platform_data->firmware_desc_gen1;
+
+	ret = of_property_read_string_index(dev_of_node(core->dev), "firmware-name", 0, fw_name);
+	if (ret) {
+		*fw_name = core->iris_firmware_desc->fwname;
+		ret = request_firmware(&firmware, *fw_name, core->dev);
+		if (ret && has_both_gens) {
+			core->iris_firmware_desc = core->iris_platform_data->firmware_desc_gen1;
+			*fw_name = core->iris_firmware_desc->fwname;
+			ret = request_firmware(&firmware, *fw_name, core->dev);
+		}
+
+		return ret ? ERR_PTR(ret) : firmware;
+	}
+
+	ret = request_firmware(&firmware, *fw_name, core->dev);
+	if (ret)
+		return ERR_PTR(ret);
+
+	if (has_both_gens &&
+	    !iris_detect_gen2_from_fwdata((const u8 *)firmware->data, firmware->size)) {
+		dev_info(core->dev, "Gen1 FW detected in %s\n", *fw_name);
+		core->iris_firmware_desc = core->iris_platform_data->firmware_desc_gen1;
+	}
+
+	return firmware;
+}
+
+static int iris_load_fw_to_memory(struct iris_core *core)
 {
 	const struct firmware *firmware = NULL;
 	struct device *dev = core->dev;
 	struct resource res;
 	phys_addr_t mem_phys;
+	const char *fw_name;
 	size_t res_size;
 	ssize_t fw_size;
 	void *mem_virt;
 	int ret;
 
-	if (strlen(fw_name) >= MAX_FIRMWARE_NAME_SIZE - 4)
-		return -EINVAL;
-
 	ret = of_reserved_mem_region_to_resource(dev->of_node, 0, &res);
 	if (ret)
 		return ret;
@@ -37,9 +126,11 @@ static int iris_load_fw_to_memory(struct iris_core *core, const char *fw_name)
 	mem_phys = res.start;
 	res_size = resource_size(&res);
 
-	ret = request_firmware(&firmware, fw_name, dev);
-	if (ret)
-		return ret;
+	firmware = iris_detect_firmware(core, &fw_name);
+	if (IS_ERR(firmware))
+		return PTR_ERR(firmware);
+
+	core->iris_firmware_data = core->iris_firmware_desc->firmware_data;
 
 	fw_size = qcom_mdt_get_size(firmware);
 	if (fw_size < 0 || res_size < (size_t)fw_size) {
@@ -66,18 +157,12 @@ static int iris_load_fw_to_memory(struct iris_core *core, const char *fw_name)
 int iris_fw_load(struct iris_core *core)
 {
 	const struct tz_cp_config *cp_config;
-	const char *fwpath = NULL;
 	int i, ret;
 
-	ret = of_property_read_string_index(core->dev->of_node, "firmware-name", 0,
-					    &fwpath);
-	if (ret)
-		fwpath = core->iris_firmware_desc->fwname;
-
-	ret = iris_load_fw_to_memory(core, fwpath);
+	ret = iris_load_fw_to_memory(core);
 	if (ret) {
-		dev_err(core->dev, "firmware download failed\n");
-		return -ENOMEM;
+		dev_err(core->dev, "firmware download failed %d\n", ret);
+		return ret;
 	}
 
 	ret = qcom_scm_pas_auth_and_reset(IRIS_PAS_ID);
@@ -99,7 +184,7 @@ int iris_fw_load(struct iris_core *core)
 		}
 	}
 
-	return ret;
+	return 0;
 }
 
 int iris_fw_unload(struct iris_core *core)
diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index c9256f2323dc..55a4fa356985 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -289,11 +289,7 @@ struct iris_firmware_desc {
 };
 
 struct iris_platform_data {
-	/*
-	 * XXX: replace with gen1 / gen2 pointers once we have platforms
-	 * supporting both firmware kinds.
-	 */
-	const struct iris_firmware_desc *firmware_desc;
+	const struct iris_firmware_desc *firmware_desc_gen1, *firmware_desc_gen2;
 
 	const struct vpu_ops *vpu_ops;
 	const struct icc_info *icc_tbl;
diff --git a/drivers/media/platform/qcom/iris/iris_platform_vpu2.c b/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
index 6e06a32822bb..961dce2e6aa9 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
@@ -22,6 +22,12 @@ static const struct iris_firmware_desc iris_vpu20_p1_gen1_desc = {
 	.fwname = "qcom/vpu/vpu20_p1.mbn",
 };
 
+static const struct iris_firmware_desc iris_vpu20_p1_gen2_s6_desc = {
+	.firmware_data = &iris_hfi_gen2_data,
+	.get_vpu_buffer_size = iris_vpu33_buf_size,
+	.fwname = "qcom/vpu/vpu20_p1_gen2_s6.mbn",
+};
+
 static const struct iris_firmware_desc iris_vpu20_p4_gen1_desc = {
 	.firmware_data = &iris_hfi_gen1_data,
 	.get_vpu_buffer_size = iris_vpu_buf_size,
@@ -65,7 +71,8 @@ static const struct tz_cp_config tz_cp_config_vpu2[] = {
 };
 
 const struct iris_platform_data sc7280_data = {
-	.firmware_desc = &iris_vpu20_p1_gen1_desc,
+	.firmware_desc_gen1 = &iris_vpu20_p1_gen1_desc,
+	.firmware_desc_gen2 = &iris_vpu20_p1_gen2_s6_desc,
 	.vpu_ops = &iris_vpu2_ops,
 	.icc_tbl = iris_icc_info_vpu2,
 	.icc_tbl_size = ARRAY_SIZE(iris_icc_info_vpu2),
@@ -94,7 +101,7 @@ const struct iris_platform_data sc7280_data = {
 };
 
 const struct iris_platform_data sm8250_data = {
-	.firmware_desc = &iris_vpu20_p4_gen1_desc,
+	.firmware_desc_gen1 = &iris_vpu20_p4_gen1_desc,
 	.vpu_ops = &iris_vpu2_ops,
 	.icc_tbl = iris_icc_info_vpu2,
 	.icc_tbl_size = ARRAY_SIZE(iris_icc_info_vpu2),
diff --git a/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c b/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c
index 2c63adbc5579..74626b35d9cb 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c
@@ -90,7 +90,7 @@ static const struct tz_cp_config tz_cp_config_vpu3[] = {
  * - inst_caps to platform_inst_cap_qcs8300
  */
 const struct iris_platform_data qcs8300_data = {
-	.firmware_desc = &iris_vpu30_p4_s6_gen2_desc,
+	.firmware_desc_gen2 = &iris_vpu30_p4_s6_gen2_desc,
 	.vpu_ops = &iris_vpu3_ops,
 	.icc_tbl = iris_icc_info_vpu3x,
 	.icc_tbl_size = ARRAY_SIZE(iris_icc_info_vpu3x),
@@ -119,7 +119,7 @@ const struct iris_platform_data qcs8300_data = {
 };
 
 const struct iris_platform_data sm8550_data = {
-	.firmware_desc = &iris_vpu30_p4_gen2_desc,
+	.firmware_desc_gen2 = &iris_vpu30_p4_gen2_desc,
 	.vpu_ops = &iris_vpu3_ops,
 	.icc_tbl = iris_icc_info_vpu3x,
 	.icc_tbl_size = ARRAY_SIZE(iris_icc_info_vpu3x),
@@ -154,7 +154,7 @@ const struct iris_platform_data sm8550_data = {
  * - controller_rst_tbl to sm8650_controller_reset_table
  */
 const struct iris_platform_data sm8650_data = {
-	.firmware_desc = &iris_vpu33_p4_gen2_desc,
+	.firmware_desc_gen2 = &iris_vpu33_p4_gen2_desc,
 	.vpu_ops = &iris_vpu33_ops,
 	.icc_tbl = iris_icc_info_vpu3x,
 	.icc_tbl_size = ARRAY_SIZE(iris_icc_info_vpu3x),
@@ -185,7 +185,7 @@ const struct iris_platform_data sm8650_data = {
 };
 
 const struct iris_platform_data sm8750_data = {
-	.firmware_desc = &iris_vpu35_p4_gen2_desc,
+	.firmware_desc_gen2 = &iris_vpu35_p4_gen2_desc,
 	.vpu_ops = &iris_vpu35_ops,
 	.icc_tbl = iris_icc_info_vpu3x,
 	.icc_tbl_size = ARRAY_SIZE(iris_icc_info_vpu3x),
@@ -220,7 +220,7 @@ const struct iris_platform_data sm8750_data = {
  * - different num_vpp_pipe
  */
 const struct iris_platform_data x1p42100_data = {
-	.firmware_desc = &iris_vpu30_p1_gen2_desc,
+	.firmware_desc_gen2 = &iris_vpu30_p1_gen2_desc,
 	.vpu_ops = &iris_vpu3_ops,
 	.icc_tbl = iris_icc_info_vpu3x,
 	.icc_tbl_size = ARRAY_SIZE(iris_icc_info_vpu3x),
diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
index c2dcb50a2782..7fe31136df21 100644
--- a/drivers/media/platform/qcom/iris/iris_probe.c
+++ b/drivers/media/platform/qcom/iris/iris_probe.c
@@ -251,8 +251,6 @@ static int iris_probe(struct platform_device *pdev)
 		return core->irq;
 
 	core->iris_platform_data = of_device_get_match_data(core->dev);
-	core->iris_firmware_desc = core->iris_platform_data->firmware_desc;
-	core->iris_firmware_data = core->iris_firmware_desc->firmware_data;
 
 	core->ubwc_cfg = qcom_ubwc_config_get_data();
 	if (IS_ERR(core->ubwc_cfg))
@@ -271,8 +269,6 @@ static int iris_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	iris_session_init_caps(core);
-
 	ret = v4l2_device_register(dev, &core->v4l2_dev);
 	if (ret)
 		return ret;
diff --git a/drivers/media/platform/qcom/iris/iris_vidc.c b/drivers/media/platform/qcom/iris/iris_vidc.c
index 14d63dc76c9b..372408b894c1 100644
--- a/drivers/media/platform/qcom/iris/iris_vidc.c
+++ b/drivers/media/platform/qcom/iris/iris_vidc.c
@@ -9,6 +9,7 @@
 #include <media/v4l2-mem2mem.h>
 #include <media/videobuf2-dma-contig.h>
 
+#include "iris_ctrls.h"
 #include "iris_vidc.h"
 #include "iris_instance.h"
 #include "iris_vdec.h"
@@ -196,6 +197,8 @@ int iris_open(struct file *filp)
 		goto fail_m2m_release;
 	}
 
+	iris_session_init_caps(core);
+
 	if (inst->domain == DECODER)
 		ret = iris_vdec_inst_init(inst);
 	else if (inst->domain == ENCODER)

-- 
2.47.3


