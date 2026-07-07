Return-Path: <linux-media+bounces-66907-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id TlwvILx9TWol1AEAu9opvQ
	(envelope-from <linux-media+bounces-66907-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 08 Jul 2026 00:29:16 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 236847200F9
	for <lists+linux-media@lfdr.de>; Wed, 08 Jul 2026 00:29:11 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=ltG6BbcU;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=FVL8B1UK;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66907-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-66907-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 110B73020125
	for <lists+linux-media@lfdr.de>; Tue,  7 Jul 2026 22:29:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFEF63DA7CD;
	Tue,  7 Jul 2026 22:29:09 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 921203D6480
	for <linux-media@vger.kernel.org>; Tue,  7 Jul 2026 22:29:06 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783463349; cv=none; b=Hm4U8rEXluJ2QCe4Rd2qxpQ7KymBSrUR4AK88ELOJkyHWV15r/JjJaevwBOIMTTwuXsh5OmKaGebYwRTR4QINIaPk05+l6VtAufj7O9MdF2iagWiC/0OG+joqL6A8bNAHQuvfE9l+4cxOB+9iI7+5NCjm6BV0cPz/dZ9ntkDWck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783463349; c=relaxed/simple;
	bh=CmUeNJMGv205BweUgjIxNSCWvez6XH7fdiYPDrcx0rg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=NZkFBPZj6BHM2gwM1tyCxkD2OpteP1a5d7AhcJ6pEA+EElDNBrey89FSmlqPVay64ErJyI6LMQ5uhoe0RHTU7EDI4e/1WJPIxFztwhSRUbod1ksqKVe0twBz3lAs2zxMW15i2f6/bmWSfxAM+HeQGjMRxerD+EDzb9lSOwRgeEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ltG6BbcU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FVL8B1UK; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 667J58Tq472005
	for <linux-media@vger.kernel.org>; Tue, 7 Jul 2026 22:29:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=vknrMZ2z6pp7fmMwQo8G7/
	tkx++PRXUc58Zdt62luCs=; b=ltG6BbcUCvNhStxjskva6i5LX/ZRZKth8g2yql
	xyhG54UjdsxHgWQyh5UEOfo6rQGFOX4dsTolgagN9V+FnkMgxsP7erz+lq7NstCu
	K55n4WeTVpyJklLsREVCN7AKK7XtEWiHnNI62mG9p18Ki6Y1pQAW6Ks+s0oyMVaX
	Nzl2s96qwfeSEVojPqy7eIcpErbJbwXe3SfQZBVIuuUsbkn1bnTDZLg4qvclQBJE
	g2xudUkO4SSne+CvopxaoHDzwhf8gCub8w9etdVktwoq9dIpmuSQ6s7tU25NMRx/
	VwAr5XPfdwScrPkgVrWDKrwG7cvBgBKrtRuuMCuk57Lf60eg==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f95fd1eub-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 07 Jul 2026 22:29:05 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-738627c7908so4057137.2
        for <linux-media@vger.kernel.org>; Tue, 07 Jul 2026 15:29:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783463345; x=1784068145; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vknrMZ2z6pp7fmMwQo8G7/tkx++PRXUc58Zdt62luCs=;
        b=FVL8B1UK4oTSV9YyS3vLa/MufMZVG6EEVb2maLLhn+OCeDEBsDkgGkrJMNw0ajcPGp
         XOTeh6DJih+fNRVFilGZszpowwy/mr367w81W38/LEJeGou0t+4XdHwY/1BuDecnrEL+
         xNECz31e/dyEIbsMkQQWmj8KGm3kJPS843IPbLvIMdZS56mebdSAf43IuSwPJg+Qf17s
         8VO7KmgV/32bHq/FSD3RIfRgsg5mygW9TedMluA8l717fWfhKJ1+RmC1IKp2HdPhlCN8
         ZYpyuzs9N6J1iH4qA1SNPFxEDYOw5Fp0uOnxLExw+xLW+FSG1hVKPp/WURZH0eB0CNlU
         qP6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783463345; x=1784068145;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vknrMZ2z6pp7fmMwQo8G7/tkx++PRXUc58Zdt62luCs=;
        b=nat2vwvXUvZJyHGuU2AunQk0yDcCQSO0nubjxZJ4j0jELFsLhSR7WqfpyqprOhj4o5
         gEgB6S0yjXyqfKdw88fM3N64pF6P+rr/iGtzoPEt2urq4jKSXxcA5z/ECwmHsYdtDeng
         TRcMLr4lFmbkI0eq5+B3+68b4woQ1cTTtujTS37xxjazBQqclx/YbVqa+jA9+vjwdJF4
         nw80dn2ibKJHJlIt2W9TzACNkuLEUMvCSautPqroTxCtYJzkBAKM3paypjy/ydQV+OiO
         lY2EeoyS2WOwT+GdWYRQZ5VqVX9qYyljcndMCeptrLN98DmYZR0Gvtf57gSiZFyI0StD
         Gsfg==
X-Gm-Message-State: AOJu0YxCwwkzKHaetNqUNUncnYCFCgOfmIENe+spRy7i+FPu39xzYhLG
	RvMq0P4YV6G7mZCgWfBvvnIY2y8WrmzLGi2j1Pw/Z4IjgEnRryBl8c8wCOWTcgsfAJ8rN9ZcSoy
	BTJ2MLEkoDe1AoGewZZ+ODBFV6xuivO0vV3u9knBb6BpZVFkkxkUYuoGloCJkR9G8S1UW3K4biw
	==
X-Gm-Gg: AfdE7ckIMTzLePbZXmW4wg1Snf5+f+MQd/0f7fT1zjKU7ZNqCWc3eMu8NCzWCY2t3m8
	hJBv+PmWAKqdalHW1eQs3AR7HGCLdqScVCqExDKSHHwomt++hsMZLg1p0OonfpKs4te0k+eXipb
	NjCWqk8ExeGFPG4+oYDeUO2zNMCIyIqHa+DkEVZfve4csdAGeIp4MYFcp8IgLalqtNi06dShqI/
	r/glWggJb7NAjMrWKKuSI6Rg+RVGei4sL/tKYI55iolG8OQL28jri8Li2lGUVxBBJE2htuEPbFX
	9dht92EgmJxFNoaBjsk8d5UH+LeJtmZcdP3BlYeQCYBrMhqO3nRJpJ+Nwn7VKsn/Bxu0j89BDmk
	AHXfER9riSQpIYoWookEIox5TDCjMAnWnhcJ4lSMYkag3LcPeCNjZv2cQRup2+mNdfqyeTOXLx3
	W7KC13tA7gG6Q0FiqAq4N5Y4O2
X-Received: by 2002:a05:6102:3709:b0:739:15ef:cdf2 with SMTP id ada2fe7eead31-744b7b934b7mr3665513137.12.1783463344439;
        Tue, 07 Jul 2026 15:29:04 -0700 (PDT)
X-Received: by 2002:a05:6102:3709:b0:739:15ef:cdf2 with SMTP id ada2fe7eead31-744b7b934b7mr3665467137.12.1783463343296;
        Tue, 07 Jul 2026 15:29:03 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39c7312bc25sm1897231fa.40.2026.07.07.15.28.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 15:29:00 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v6 00/18] media: iris: Add AR50LT core support and enable
 Agatti platform
Date: Wed, 08 Jul 2026 01:28:43 +0300
Message-Id: <20260708-iris-ar50lt-v6-0-374f0a46c23b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJt9TWoC/3XQ32rDIBgF8FcpXs9OP/+1vdp7jF2o+bI6mmRVE
 zpK3n0mHSyB5kY4cPx58E4SxoCJnHZ3EnEIKXRtCfplR/zZtp9IQ1UyAQaaKWZoiCFRGxW7ZMo
 0wEHqo7XKkXLjO2IdbrP2/vHIqXdf6PNE/DUiXvvyTH7UiLMJqe+aJuTTrsVbfm1syhjJBJxDy
 l38mdcNfO4/HTJwymgF4L3HyguEty6l/bW3l0nel2PmBlgQXKwJKITkHFVtXOWl3yDEklBrQkw
 ralG+BI0U0mwQ8p/QHNaELASzrnZGVsqJrRVqSeg1oQqhDsJJMIY5bZ8Q4zj+Av1u5db6AQAA
X-Change-ID: 20260507-iris-ar50lt-06228469aa5b
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=25287;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=CmUeNJMGv205BweUgjIxNSCWvez6XH7fdiYPDrcx0rg=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqTX2o3xbg7RfNqQj/c14KkXXh51aJX7jK7V8Vb
 5VwiTBCTgyJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCak19qAAKCRCLPIo+Aiko
 1QiXB/40pETmr4jd5H/MD3vAjUpe7ARG7RdUDbVzcjpBlJvl2fDzM/bnvTkmO4q0eCMxTXJHJNz
 RM68ibbuMgBB9d7qeucHHU/O71FfOUC2MulHatdA0crFgjOWeVS1YIM5QEuLci7Qw4eDgRHHVg/
 FowZCJ3r+1fDz33ay30714hZy34OprVDYFfBjaJTh8W2R88sgT+9tNZpOh/9Fg1/U6QrU1I/Hep
 /aUzRAc34I4JMvFb4Ivhe9SCYmT36oui827/HvpqPiHL0kWxcJIZbHLxSJWlqhCgHnVRlswGkcm
 opNrcdCsYHnDo3/9Mh1cFNcmXgPpMa8mivT8WTdFXDVo+y8e
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDIyMSBTYWx0ZWRfX6b0p7ADKECgZ
 FFtHITyR3PFLIaPemvLkFtjWOpr+ZnZtXeUOo8BNJXvH9nnOJmJrnUf+aNLvVVD643vtMES6vTk
 3PSlok5YqP5JEJ6l8svEG151/PlWqsD1FMJQH0dSumbgFdjJgaFjWBe7Kzt5Vh1G3UtCFTqXIC/
 PKr6F7i9ELcmuQXgWVN8aZsfiQfzvU8vyXCUkrZDDd6Wvgeo9tSVl9NExkRv7rayB9XdMkuI2Cg
 WFWlsWqHI7iIMjFeTpUCiHmZN6gk1OTGHcjYZ5DoXEo9ij3SsVwmNRlNg4zFQC6TM/0SNN84X+l
 ASRIEmgH+8OBtvFlL2boPKV5O1ouEIMizdGP1Bm7F2UKfsIj1pmFZXKYLQ1IgMS4gxFSSjwUPbV
 z6GyvyFt6F98hRNAP7qTNi1Jep7UPgbjNmxRxwqDwKLYtlwTibqVXYnMAL0gbw7uPVuc3weZwdX
 vz0J0uSyPOW710lctlA==
X-Authority-Analysis: v=2.4 cv=VZLH+lp9 c=1 sm=1 tr=0 ts=6a4d7db1 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=0ZFKG7FiYUcsN90ZXqMA:9 a=QEXdDO2ut3YA:10
 a=crWF4MFLhNY0qMRaF8an:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-ORIG-GUID: v82ZM4jxFg5tKYZRTuGlouLywuOTaAVw
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDIyMSBTYWx0ZWRfXyf9kf1aEz0GZ
 Ui8V4oKCfKQ779ssUBYwLzUHySMicm7gKpv27nQcVtPfP9XqpyPSaAJRyFAGZcKkneWRlHaswcw
 RFPuJtpdNWDoxQ4gGgZIqcCrn751xUM=
X-Proofpoint-GUID: v82ZM4jxFg5tKYZRTuGlouLywuOTaAVw
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-66907-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_RECIPIENTS(0.00)[m:vikash.garodia@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:mchehab@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:busanna.reddy@oss.qualcomm.com,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:dikshita.agarwal@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 236847200F9

This series adds support for the AR50Lt VPU core to the iris driver and
enables the Agatti SoC to use Gen2 firmware and HFI.

AR50Lt introduces a few platform-specific requirements that need to be
handled in the iris core and VPU abstraction layer. To accommodate
this, the series adds minimal hooks and updates needed to allow the
firmware to operate correctly on AR50Lt without impacting existing
supported platforms.

Additionally, the series wires up Agatti to use the Gen2 firmware and
HFI path, aligning it with newer generations of supported Qualcomm
video hardware.

v4l2-compliance results:

v4l2-compliance -d /dev/video1 -s
v4l2-compliance 1.33.0-5421, 64 bits, 64-bit time_t
v4l2-compliance SHA: af4a91dea9a2 2025-10-29 10:33:25

Compliance test for iris_driver device /dev/video1:

Driver Info:
        Driver name      : iris_driver
        Card type        : Iris Encoder
        Bus info         : platform:5a00000.video-codec
        Driver version   : 6.19.0
        Capabilities     : 0x84204000
                Video Memory-to-Memory Multiplanar
                Streaming
                Extended Pix Format
                Device Capabilities
        Device Caps      : 0x04204000
                Video Memory-to-Memory Multiplanar
                Streaming
                Extended Pix Format
        Detected Stateful Encoder

Required ioctls:
        test VIDIOC_QUERYCAP: OK
        test invalid ioctls: OK

Allow for multiple opens:
        test second /dev/video1 open: OK
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
        Standard Controls: 43 Private Controls: 0

Format ioctls:
        test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
        test VIDIOC_G/S_PARM: OK
        test VIDIOC_G_FBUF: OK (Not Supported)
        test VIDIOC_G_FMT: OK
        test VIDIOC_TRY_FMT: OK
        test VIDIOC_S_FMT: OK
        test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
        test Cropping: OK
        test Composing: OK (Not Supported)
        test Scaling: OK (Not Supported)

Codec ioctls:
        test VIDIOC_(TRY_)ENCODER_CMD: OK
        test VIDIOC_G_ENC_INDEX: OK (Not Supported)
        test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)

Buffer ioctls:
        test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
        test CREATE_BUFS maximum buffers: OK
        test VIDIOC_REMOVE_BUFS: OK
        test VIDIOC_EXPBUF: OK
        test Requests: OK (Not Supported)
        test blocking wait: OK

Test input 0:

Streaming ioctls:
        test read/write: OK67609.731994] use of bytesused == 0 is deprecated and will be removed in the future,
[67609.741833] use the actual size instead.
m (Not Supported)
        Video Capture Multiplanar: Captured 61 buffers
        test MMAP (select, REQBUFS): OK
        Video Capture Multiplanar: Captured 61 buffers
        test MMAP (epoll, REQBUFS): OK
        Video Capture Multiplanar: Captured 61 buffers
        test MMAP (select, CREATE_BUFS): OK
        Video Capture Multiplanar: Captured 61 buffers
        test MMAP (epoll, CREATE_BUFS): OK
        test USERPTR (select): OK (Not Supported)
        test DMABUF: Cannot test, specify --expbuf-device

Total for iris_driver device /dev/video1: 54, Succeeded: 54, Failed: 0, Warnings: 0

v4l2-compliance -d /dev/video0 -s5 --stream-from=/media/FVDO_Freeway_720p.264
v4l2-compliance 1.33.0-5421, 64 bits, 64-bit time_t
v4l2-compliance SHA: af4a91dea9a2 2025-10-29 10:33:25

Compliance test for iris_driver device /dev/video0:

Driver Info:
        Driver name      : iris_driver
        Card type        : Iris Decoder
        Bus info         : platform:5a00000.video-codec
        Driver version   : 6.19.0
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
        Standard Controls: 12 Private Controls: 0

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

Test input 0:

Streaming ioctls:
        test read/write: OK (Not Supported)
the input file is smaller than 7077888 bytes
        Video Capture Multiplanar: Captured 465 buffers
        test MMAP (select, REQBUFS): OK
the input file is smaller than 7077888 bytes
        Video Capture Multiplanar: Captured 465 buffers
        test MMAP (epoll, REQBUFS): OK
the input file is smaller than 7077888 bytes
        Video Capture Multiplanar: Captured 465 buffers
        test MMAP (select, CREATE_BUFS): OK
the input file is smaller than 7077888 bytes
        Video Capture Multiplanar: Captured 465 buffers
        test MMAP (epoll, CREATE_BUFS): OK
        test USERPTR (select): OK (Not Supported)
        test DMABUF: Cannot test, specify --expbuf-device

Total for iris_driver device /dev/video0: 54, Succeeded: 54, Failed: 0, Warnings: 0

Fluster results for HFI Gen2 firmware:

./fluster.py run -ts JVT-AVC_V1 -d GStreamer-H.264-V4L2-Gst1.0 - 77/135
The failing test case:
- Unsupported profile: H.264 Extended profile is deprecated.
        - BA3_SVA_C
- Interlaced content is not supported yet.
        - CABREF3_Sand_D
        - CAFI1_SVA_C
        - CAMA1_Sony_C
        - CAMA1_TOSHIBA_B
        - CAMA3_Sand_E
        - CAMACI3_Sony_C
        - CAMANL1_TOSHIBA_B
        - CAMANL2_TOSHIBA_B
        - CAMANL3_Sand_E
        - CAMASL3_Sony_B
        - CAMP_MOT_MBAFF_L30
        - CAMP_MOT_MBAFF_L31
        - CANLMA2_Sony_C
        - CANLMA3_Sony_C
        - CAPA1_TOSHIBA_B
        - CAPAMA3_Sand_F
        - CVCANLMA2_Sony_C
        - CVFI1_SVA_C
        - CVFI1_Sony_D
        - CVFI2_SVA_C
        - CVFI2_Sony_H
        - CVMA1_Sony_D
        - CVMA1_TOSHIBA_B
        - CVMANL1_TOSHIBA_B
        - CVMANL2_TOSHIBA_B
        - CVMAPAQP3_Sony_E
        - CVMAQP2_Sony_G
        - CVMAQP3_Sony_D
        - CVMP_MOT_FLD_L30_B
        - CVMP_MOT_FRM_L31
        - CVNLFI1_Sony_C
        - CVNLFI2_Sony_H
        - CVPA1_TOSHIBA_B
        - FI1_Sony_E
        - MR6_BT_B
        - MR7_BT_B
        - MR8_BT_B
        - MR9_BT_B
        - Sharp_MP_Field_1_B
        - Sharp_MP_Field_2_B
        - Sharp_MP_Field_3_B
        - Sharp_MP_PAFF_1r2
        - Sharp_MP_PAFF_2r
        - cabac_mot_fld0_full
        - cabac_mot_mbaff0_full
        - cabac_mot_picaff0_full
        - cama1_vtc_c
        - cama2_vtc_b
        - cama3_vtc_b
        - cavlc_mot_fld0_full_B
        - cavlc_mot_mbaff0_full_B
        - cavlc_mot_picaff0_full_B
- Unsupported bitstream: num_slice_group_minus1 > 0 (slice groups not supported by hardware).
        - FM1_BT_B
        - FM1_FT_E
        - FM2_SVA_C
- Unsupported bitstream: SP slice type is not supported by hardware.
        - SP1_BT_A
        - sp2_bt_b

./fluster.py run -ts JCT-VC-HEVC_V1 -d GStreamer-H.265-V4L2-Gst1.0 - 113/147
The failing test case:
- Unsupported level
        - AMP_D_Hisilicon_3
        - AMP_E_Hisilicon_3
        - AMP_F_Hisilicon_3
        - DELTAQP_A_BRCM_4
        - IPRED_A_docomo_2
        - IPRED_C_Mitsubishi_3
        - LS_A_Orange_2
        - LS_B_Orange_4
        - PPS_A_qualcomm_7
        - RAP_B_Bossen_2
        - RPS_F_docomo_2
        - SAO_G_Canon_3
        - SDH_A_Orange_4
- 10bit content not supported yet
        - DBLK_A_MAIN10_VIXS_4
        - INITQP_B_Main10_Sony_1
        - TSUNEQBD_A_MAIN10_Technicolor_2
        -  WPP_A_ericsson_MAIN10_2
        -  WPP_B_ericsson_MAIN10_2
        - WPP_C_ericsson_MAIN10_2
        - WPP_D_ericsson_MAIN10_2
        - WPP_E_ericsson_MAIN10_2
        - WPP_F_ericsson_MAIN10_2
        - WP_A_MAIN10_Toshiba_3
        - WP_MAIN10_B_Toshiba_3
- Unsupported resolution
        - AMP_A_Samsung_7 - resolution is higher than max supported
        - AMP_B_Samsung_7 - resolution is higher than max supported
        - PICSIZE_A_Bossen_1 - resolution is higher than max supported
        - PICSIZE_B_Bossen_1 - resolution is higher than max supported
        - PICSIZE_C_Bossen_1 - resolution is higher than max supported
        - PICSIZE_D_Bossen_1 - resolution is higher than max supported
        - TUSIZE_A_Samsung_1 - resolution is higher than max supported
        - WPP_D_ericsson_MAIN_2 - resolution is lower than min supported
- CRC mismatch
        - RAP_A_docomo_6
- CRC mismatch - bitstream issue - fails with ffmpeg sw decoder as well
        - VPSSPSPPS_A_MainConcept_1

./fluster.py run -ts VP9-TEST-VECTORS -d GStreamer-VP9-V4L2-Gst1.0 -j1 - 206/305
The failing test case:
- Unsupported resolution
        - vp90-2-02-size-08x08.webm
        - vp90-2-02-size-08x10.webm
        - vp90-2-02-size-08x16.webm
        - vp90-2-02-size-08x18.webm
        - vp90-2-02-size-08x32.webm
        - vp90-2-02-size-08x34.webm
        - vp90-2-02-size-08x64.webm
        - vp90-2-02-size-08x66.webm
        - vp90-2-02-size-10x08.webm
        - vp90-2-02-size-10x10.webm
        - vp90-2-02-size-10x16.webm
        - vp90-2-02-size-10x18.webm
        - vp90-2-02-size-10x32.webm
        - vp90-2-02-size-10x34.webm
        - vp90-2-02-size-10x64.webm
        - vp90-2-02-size-10x66.webm
        - vp90-2-02-size-16x08.webm
        - vp90-2-02-size-16x10.webm
        - vp90-2-02-size-16x16.webm
        - vp90-2-02-size-16x18.webm
        - vp90-2-02-size-16x32.webm
        - vp90-2-02-size-16x34.webm
        - vp90-2-02-size-16x64.webm
        - vp90-2-02-size-16x66.webm
        - vp90-2-02-size-18x08.webm
        - vp90-2-02-size-18x10.webm
        - vp90-2-02-size-18x16.webm
        - vp90-2-02-size-18x18.webm
        - vp90-2-02-size-18x32.webm
        - vp90-2-02-size-18x34.webm
        - vp90-2-02-size-18x64.webm
        - vp90-2-02-size-18x66.webm
        - vp90-2-02-size-32x08.webm
        - vp90-2-02-size-32x10.webm
        - vp90-2-02-size-32x16.webm
        - vp90-2-02-size-32x18.webm
        - vp90-2-02-size-32x32.webm
        - vp90-2-02-size-32x34.webm
        - vp90-2-02-size-32x64.webm
        - vp90-2-02-size-32x66.webm
        - vp90-2-02-size-34x08.webm
        - vp90-2-02-size-34x10.webm
        - vp90-2-02-size-34x16.webm
        - vp90-2-02-size-34x18.webm
        - vp90-2-02-size-34x32.webm
        - vp90-2-02-size-34x34.webm
        - vp90-2-02-size-34x64.webm
        - vp90-2-02-size-34x66.webm
        - vp90-2-02-size-64x08.webm
        - vp90-2-02-size-64x10.webm
        - vp90-2-02-size-64x16.webm
        - vp90-2-02-size-64x18.webm
        - vp90-2-02-size-64x32.webm
        - vp90-2-02-size-64x34.webm
        - vp90-2-02-size-64x64.webm
        - vp90-2-02-size-64x66.webm
        - vp90-2-02-size-66x08.webm
        - vp90-2-02-size-66x10.webm
        - vp90-2-02-size-66x16.webm
        - vp90-2-02-size-66x18.webm
        - vp90-2-02-size-66x32.webm
        - vp90-2-02-size-66x34.webm
        - vp90-2-02-size-66x64.webm
        - vp90-2-02-size-66x66.webm
        - vp90-2-08-tile_1x8.webm - resolution is higher than max supported
        - vp90-2-08-tile_1x8_frame_parallel.webm - resolution is higher than max supported
        - vp90-2-14-resize-10frames-fp-tiles-1-2-4-8.webm - resolution is higher than max supported
        - vp90-2-14-resize-10frames-fp-tiles-1-8.webm - resolution is higher than max supported
        - vp90-2-14-resize-10frames-fp-tiles-2-8.webm - resolution is higher than max supported
        - vp90-2-14-resize-10frames-fp-tiles-4-8.webm - resolution is higher than max supported
        - vp90-2-14-resize-10frames-fp-tiles-8-1.webm - resolution is higher than max supported
        - vp90-2-14-resize-10frames-fp-tiles-8-2.webm - resolution is higher than max supported
        - vp90-2-14-resize-10frames-fp-tiles-8-4-2-1.webm - resolution is higher than max supported
        - vp90-2-14-resize-10frames-fp-tiles-8-4.webm - resolution is higher than max supported
        - vp90-2-14-resize-fp-tiles-1-16.webm - resolution is higher than max supported
        - vp90-2-14-resize-fp-tiles-1-2-4-8-16.webm - resolution is higher than max supported
        - vp90-2-14-resize-fp-tiles-1-8.webm - resolution is higher than max supported
        - vp90-2-14-resize-fp-tiles-16-1.webm - resolution is higher than max supported
        - vp90-2-14-resize-fp-tiles-16-2.webm - resolution is higher than max supported
        - vp90-2-14-resize-fp-tiles-16-4.webm - resolution is higher than max supported
        - vp90-2-14-resize-fp-tiles-16-8-4-2-1.webm - resolution is higher than max supported
        - vp90-2-14-resize-fp-tiles-16-8.webm - resolution is higher than max supported
        - vp90-2-14-resize-fp-tiles-2-16.webm - resolution is higher than max supported
        - vp90-2-14-resize-fp-tiles-2-8.webm - resolution is higher than max supported
        - vp90-2-14-resize-fp-tiles-4-16.webm - resolution is higher than max supported
        - vp90-2-14-resize-fp-tiles-4-8.webm - resolution is higher than max supported
        - vp90-2-14-resize-fp-tiles-8-1.webm - resolution is higher than max supported
        - vp90-2-14-resize-fp-tiles-8-16.webm - resolution is higher than max supported
        - vp90-2-14-resize-fp-tiles-8-2.webm - resolution is higher than max supported
        - vp90-2-14-resize-fp-tiles-8-4.webm - resolution is higher than max supported
- Unsupported format
        - vp91-2-04-yuv422.webm
        - vp91-2-04-yuv444.webm
- CRC mismatch
        - vp90-2-22-svc_1280x720_3.ivf
- Unsupported resolution after sequence change
        - vp90-2-18-resize.ivf
        - vp90-2-21-resize_inter_320x180_5_1-2.webm
        - vp90-2-21-resize_inter_320x180_7_1-2.webm
        - vp90-2-21-resize_inter_320x240_5_1-2.webm
        - p90-2-21-resize_inter_320x240_7_1-2.webm
- Unsupported stream
        - vp90-2-16-intra-only.webm

Fluster results for HFI Gen1 firmware:

Tests failing with the Venus driver, but passing with the Iris:
- H.264: BA3_SVA_C

- H.265: ipcm_A_NEC_3, ipcm_B_NEC_3, ipcm_C_NEC_3, ipcm_D_NEC_3,
  ipcm_E_NEC_2, IPRED_B_Nokia_3, VPSSPSPPS_A_MainConcept_1

- VP9: vp90-2-14-resize-10frames-fp-tiles-1-2.webm,
  vp90-2-14-resize-10frames-fp-tiles-2-1.webm,
  vp90-2-14-resize-fp-tiles-1-2.webm,
  vp90-2-14-resize-fp-tiles-2-1.webm,
  vp90-2-14-resize-fp-tiles-4-1.webm,
  vp90-2-14-resize-fp-tiles-4-2.webm,
  vp90-2-15-segkey.webm

Tests failing with the Iris driver, but passing with the Venus (due to
interlaced H.264 being not supported yet):

- H.264: cabac_mot_fld0_full, cabac_mot_mbaff0_full,
  cabac_mot_picaff0_full, CABREF3_Sand_D, CAFI1_SVA_C, CAMA1_Sony_C,
  CAMA1_TOSHIBA_B, cama1_vtc_c, cama2_vtc_b, CAMA3_Sand_E, cama3_vtc_b,
  CAMACI3_Sony_C, CAMANL1_TOSHIBA_B, CAMANL2_TOSHIBA_B, CAMANL3_Sand_E,
  CAMASL3_Sony_B, CAMP_MOT_MBAFF_L30, CAMP_MOT_MBAFF_L31,
  CANLMA2_Sony_C, CANLMA3_Sony_C, CAPA1_TOSHIBA_B, CAPAMA3_Sand_F,
  cavlc_mot_fld0_full_B, cavlc_mot_mbaff0_full_B,
  cavlc_mot_picaff0_full_B, CVCANLMA2_Sony_C, CVFI1_Sony_D, CVFI1_SVA_C,
  CVFI2_Sony_H, CVFI2_SVA_C, CVMA1_Sony_D, CVMA1_TOSHIBA_B,
  CVMANL1_TOSHIBA_B, CVMANL2_TOSHIBA_B, CVMAPAQP3_Sony_E,
  CVMAQP2_Sony_G, CVMAQP3_Sony_D, CVMP_MOT_FLD_L30_B,
  CVMP_MOT_FRM_L31_B, CVNLFI1_Sony_C, CVNLFI2_Sony_H, CVPA1_TOSHIBA_B,
  FI1_Sony_E, MR9_BT_B, Sharp_MP_Field_1_B, Sharp_MP_Field_2_B,
  Sharp_MP_Field_3_B, Sharp_MP_PAFF_1r2, Sharp_MP_PAFF_2r

Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Changes in v6:
- Included the Kodiak Gen2 patch to remove extra dependency.
- Reworked buffer handling, dropping useless is_obp (false) and
  num_vpp_pipes (1) (Sashiko, Vikash)
- Removed IRIS_FMT enumrations, fixing the way the driver handles the
  format enumerations (Sashiko)
- Moved buffer size querry to iris_hfi_gen1_set_bufsize(), making sure
  that it isn't repeated for each possible buffer size (Vikash)
- Fixed gen2 -> gen1 typo (Vishnu)
- Link to v5: https://patch.msgid.link/20260616-iris-ar50lt-v5-0-583b42770b6a@oss.qualcomm.com

Changes in v5:
- Corrected UBWC formats handling for non-UBWC targets (Sashiko)
- Added missing data to x1p42100 data structures (Sashiko)
- Fixed bw calculations to use actual FPS, switched to common
  iris_vpu2_calculate_frequency() (Sashiko, Vishnu)
- Added comment regarding hold_count vs min_count (Sashiko)
- Link to v4: https://patch.msgid.link/20260612-iris-ar50lt-v4-0-0abfb74d5b3c@oss.qualcomm.com

Changes in v4:
- Rebaed on linux-next, fixing conflicts. Note, these patches require
  both media/fixes and media/next and thus can be applied only after
  7.2-rc1.
- Link to v3: https://patch.msgid.link/20260515-iris-ar50lt-v3-0-df3846e74347@oss.qualcomm.com

Changes in v3:
- Corrected dependencies list in the cover letter
- Link to v2: https://patch.msgid.link/20260513-iris-ar50lt-v2-0-411e5f7bdc4c@oss.qualcomm.com

Changes in v2:
- Dropped OPP patch, applied by Bjorn.
- Dropped extra check for throttle clocks (Vishnu)
- Made iris_inst_fw_cap_gen1_ar50lt_dec and inst_fw_cap_sm8250_dec const
  (Vishnu)
- Renamed iris_vpu_ar50lt_buf_size() to iris_vpu_ar50lt_gen2_buf_size()
  (Vishnu)
- Link to v1: https://patch.msgid.link/20260507-iris-ar50lt-v1-0-d22cccedc3e2@oss.qualcomm.com

To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
To: Abhinav Kumar <abhinav.kumar@linux.dev>
To: Bryan O'Donoghue <bod@kernel.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

---
Dikshita Agarwal (11):
      media: iris: Add Gen2 firmware autodetect and fallback
      media: iris: Skip UBWC configuration when not supported
      media: iris: Filter UBWC raw formats based on hardware capabilities
      media: iris: Introduce set_preset_register as a vpu_op
      media: iris: Introduce interrupt_init as a vpu_op
      media: iris: add vpu op hook to disable ARP buffer
      media: iris: Add platform data field for watchdog interrupt mask
      media: iris: Add platform flag for instantaneous bandwidth voting
      media: iris: Add framework support for AR50_LITE video core
      media: iris: Introduce buffer size calculations for AR50LT
      media: iris: add Gen2 firmware support on the Agatti platform

Dmitry Baryshkov (7):
      media: iris: drop IRIS_FMT_foo enumeration
      media: iris: skip PIPE if it is not supported by the platform
      media: iris: add minimal GET_PROPERTY implementation
      media: iris: update buffer requirements based on received info
      media: iris: implement support for the Agatti platform
      media: venus: skip QCM2290 if Iris driver is enabled
      media: iris: constify inst_fw_cap_sm8250_dec

 drivers/media/platform/qcom/iris/Makefile          |   2 +
 drivers/media/platform/qcom/iris/iris_core.c       |   4 +
 drivers/media/platform/qcom/iris/iris_ctrls.c      |   3 +
 drivers/media/platform/qcom/iris/iris_firmware.c   | 119 +++-
 drivers/media/platform/qcom/iris/iris_hfi_common.c |   4 +
 drivers/media/platform/qcom/iris/iris_hfi_common.h |   1 +
 drivers/media/platform/qcom/iris/iris_hfi_gen1.c   | 229 +++++++-
 .../platform/qcom/iris/iris_hfi_gen1_command.c     |  26 +
 .../platform/qcom/iris/iris_hfi_gen1_defines.h     |  15 +
 .../platform/qcom/iris/iris_hfi_gen1_response.c    |  79 +++
 drivers/media/platform/qcom/iris/iris_hfi_gen2.c   | 613 +++++++++++++++++++++
 .../platform/qcom/iris/iris_hfi_gen2_packet.c      |   3 +
 drivers/media/platform/qcom/iris/iris_instance.h   |  14 -
 .../platform/qcom/iris/iris_platform_common.h      |  17 +-
 .../media/platform/qcom/iris/iris_platform_vpu2.c  |  23 +-
 .../media/platform/qcom/iris/iris_platform_vpu3x.c |  30 +-
 .../platform/qcom/iris/iris_platform_vpu_ar50lt.c  | 117 ++++
 drivers/media/platform/qcom/iris/iris_probe.c      |   8 +-
 drivers/media/platform/qcom/iris/iris_resources.c  |   2 +
 drivers/media/platform/qcom/iris/iris_vdec.c       |  34 +-
 drivers/media/platform/qcom/iris/iris_venc.c       |  33 +-
 drivers/media/platform/qcom/iris/iris_vidc.c       |   3 +
 drivers/media/platform/qcom/iris/iris_vpu2.c       |  30 +-
 drivers/media/platform/qcom/iris/iris_vpu3x.c      |   6 +
 drivers/media/platform/qcom/iris/iris_vpu4x.c      |   2 +
 drivers/media/platform/qcom/iris/iris_vpu_ar50lt.c | 130 +++++
 drivers/media/platform/qcom/iris/iris_vpu_buffer.c | 370 +++++++++++++
 drivers/media/platform/qcom/iris/iris_vpu_buffer.h |  38 ++
 drivers/media/platform/qcom/iris/iris_vpu_common.c |  43 +-
 drivers/media/platform/qcom/iris/iris_vpu_common.h |   6 +
 .../platform/qcom/iris/iris_vpu_register_defines.h |   1 -
 drivers/media/platform/qcom/venus/core.c           |   4 +-
 32 files changed, 1902 insertions(+), 107 deletions(-)
---
base-commit: be5c93fa674f0fc3c8f359c2143abce6bbb422e6
change-id: 20260507-iris-ar50lt-06228469aa5b

Best regards,
--  
With best wishes
Dmitry


