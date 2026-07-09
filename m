Return-Path: <linux-media+bounces-67162-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id d55mGSenT2oklwIAu9opvQ
	(envelope-from <linux-media+bounces-67162-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 09 Jul 2026 15:50:31 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id BD751731C62
	for <lists+linux-media@lfdr.de>; Thu, 09 Jul 2026 15:50:30 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="iyHf7/Tm";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=DH4MV4LU;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67162-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-67162-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CF6E630FB0D2
	for <lists+linux-media@lfdr.de>; Thu,  9 Jul 2026 13:42:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E30C2FE59C;
	Thu,  9 Jul 2026 13:42:06 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 850A92E7F2C
	for <linux-media@vger.kernel.org>; Thu,  9 Jul 2026 13:42:03 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783604525; cv=none; b=Vdx1RLMIkJTOYpBvWlt6uWQM4sjhiJcAtewC1upKoCBDL2eK8xAw6CrM4yg42AgnfvPKc4CJbuphuA/2XxPQ/Sox1qvjDh7jtoEoSogUJ0wHK91zrzsuj20cdjOlwRqeFCipzcLU9CxeN8+4EJq9wfTtBBrh7OdZsmzncQBefHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783604525; c=relaxed/simple;
	bh=J46HpBfv6gGlXONIlYHUVh3biI79Kpu6qTSIZBJaYh4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=KgOjFPUDQFR5eMJzIlBs24Ad7+2Df3Y1heFRTzw2b4BKO5Gj37NwEjxgXLQLzTDosRBoksI4U0hEXO5kc6UGEilWDcUkl1rZ06ax5JJXWCOPRlR7PYiOYXvifSc7CpZUvVa9RmhIzyXxnCLLWXP90XgnDKPeMpF+VKExivpgH98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iyHf7/Tm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DH4MV4LU; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669BNUTj1672688
	for <linux-media@vger.kernel.org>; Thu, 9 Jul 2026 13:42:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=KcPYQA7h+OHxoWVclXOCwX
	ywEQOoeyNOjOr3nLnaCuM=; b=iyHf7/TmG445EZeMGIYesZPUYG+rKB4b0+b4gB
	WOrD+sEHvD1otFO6nPSpGsPfW3NIVAtaG3kO8Wpb+hJbYvQYE4nHeZK5AZYFaS6A
	agiR/VKr66oIhGQuT9mcR5T2UpyCr3ZyaLJcAzBIeQDk5rAyiuI5ugsvYzvdEKcA
	gTY+fEKcbPL6qmAHvVAI3q4IELsYWe91hphQHHOLzPSQ3h/tQclXOnL54JTDVw76
	KCcEQOYt850sUNv2C1/9RnAPDcC6S0GqHyq7bpKzDi1K4derRVTbI7zRU0a92Yhm
	g//uhycEVKEAreX0q/Ezhyy4KHCj8zjfHxADxmJ3h63fF51w==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9sqschku-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 09 Jul 2026 13:42:02 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-969208e497eso1752035241.0
        for <linux-media@vger.kernel.org>; Thu, 09 Jul 2026 06:42:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783604521; x=1784209321; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=KcPYQA7h+OHxoWVclXOCwXywEQOoeyNOjOr3nLnaCuM=;
        b=DH4MV4LUBvc82XTqRdu1eLtTuJd5FgQG8SQPbRA+E0DwOdibd88ZV0ox6GtFa0SKk8
         EKn+ytnrxbJQmW4DGdnTK7HAHcfwb/LEiQ0YqSVdkU3N4Bae3sMdpEQ2exHUxdYHF2Kh
         wdzHWe0lWGU2V5k009xencxWj2KWTwcpC5ueh4s0ePQVBzfJN5MN8vd3A5I9FSNLDlef
         TvgdBaoHtMvG0JvL1rR0mvNLH9wp5V1Ig0rIUdxjiaHUBXQy2r/FmDwAi8Hs4KSMj4v4
         Q05KWAccDJo8mY0Q/3hfPtxov6moDkxAui45WGaAJXiByHuM6j0nCoTSyBZ5tF6ll8Yy
         Qqkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783604521; x=1784209321;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=KcPYQA7h+OHxoWVclXOCwXywEQOoeyNOjOr3nLnaCuM=;
        b=HxPaREO3/2oy3rLVHTWutFTz13uMSFD6OYHzHQGzoS0NDpT9kYnU6YxMdKBMaWh7jn
         ZLrdub9IZGaFddauUWzNGWmhIUUzMvBiY3cIJKDvOkVukVPLrJ/+ubIrPPlj6iwULcQv
         TeOT3TyC1D4hjkBvz3o3j8sMh4lofyNktLa12+f6K0WRtiBQWZFLUWa1LjGTgPpi05cg
         Sd+pkjq8BNSWLRu8T19+cXDtnal5KSJKYBPoa1EGX/P91S5/8PvMnWklmETxafppZQ3K
         rO37eaq9LQRbJJuiKKkUbcYyui2rck7uoKDC5l/XT9+ErR3VH6VreRuGP76Orle8ROuS
         kQ2g==
X-Gm-Message-State: AOJu0YyxoRyjrcJOh6oWnqCfI8XQ+XZaFNoDkb1dhuwNlTqJXZlEhVJN
	1ZZszBQUmb8rAZi5wdNUT0rHJ3PHZp2Ut9x/mg5OqK0HozWGcLDiT7ej4PX07bHcj6ok31uc8c3
	vMKaZQbxxK45XU27I951jbDXEGGTZ33bO5kNRUaKPC51ccRa+evLUo0CAzh9U32OhsA==
X-Gm-Gg: AfdE7cnRIUk0gIohY/k+0qy850rmJqZsU8VV5YIlVblgvcsGNwJRCaZjv/5Upji1iiZ
	Rt8pqvTqKbhhlfDeJGVfJ8dDCv7ChE/uVV+RlEKlQFVwwvCnlnoDCGfDB4M9GM5xLFM9HVIGZ5R
	5QU9GrLZC/PwBXZoUr1GwfcaUWYSXLAvmE1bCBL6rz0+j41emA0nbDH/xj5aez47ITkT15nNoBV
	U6XHe39Gecn2rIMJCIcBvlCqfE8rVkoS5pLrWTrvPNk8ZJMXjoMUnm+nvdOKNc3TIrxr7eoiMxN
	CqCLnFfjnwKRUBncr4/vc80wx181zE1GCyXLQtcDHfelklu1q40+mEJTP4YpcYWQHp+a0TreETE
	dt6WYY1TzJ/163FzChkeCC/4uZqcWcZFlaY93SN4l2/BiahpG/R3UB6YMGw3+PZwEV66OiFxX9s
	4IlwfkWVd9RQdqwWVYt9Fwg85r
X-Received: by 2002:a05:6102:579a:b0:737:e816:b26f with SMTP id ada2fe7eead31-744dfd6bbd4mr4780647137.10.1783604521254;
        Thu, 09 Jul 2026 06:42:01 -0700 (PDT)
X-Received: by 2002:a05:6102:579a:b0:737:e816:b26f with SMTP id ada2fe7eead31-744dfd6bbd4mr4780621137.10.1783604520629;
        Thu, 09 Jul 2026 06:42:00 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39c849186e1sm3345151fa.9.2026.07.09.06.41.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 06:41:59 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v7 00/18] media: iris: Add AR50LT core support and enable
 Agatti platform
Date: Thu, 09 Jul 2026 16:41:51 +0300
Message-Id: <20260709-iris-ar50lt-v7-0-76af9dd4d1f6@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAB+lT2oC/3XQ326DIBgF8FcxXI8OP/65Xu09ll0Afq4sVVdA0
 6Xx3Yd2STWpNyQnOfw44UYiBo+RHIsbCTj66PsuB/1SEHcy3RdSX+dMgIFikmnqg4/UBMnOiTI
 FUAn1Zoy0JN/4Cdj466J9fN5zHOw3ujQT/42AlyE/k+41Yk1E6vq29elYdHhNr62JCQOZgZOPq
 Q+/y7qxXPpPh4wlZbQGcM5h7TjCex/j4TKY8ywf8rFwI6yIkm8JyIQoS5SNtrUTbofga0JuCT6
 vaHj+EtSCC71DiAehStgSIhPM2MZqUUvL91bINaG2hMyErLgVoDWzyuwQ6kFoVm0JlQmuRcOMU
 A64fUJM0/QHXEbVGz0CAAA=
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=25919;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=J46HpBfv6gGlXONIlYHUVh3biI79Kpu6qTSIZBJaYh4=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqT6UjlvUyEdXEJ48PVvREEcEd8Ne6gmKFh6Qf4
 hwMJ782iE2JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCak+lIwAKCRCLPIo+Aiko
 1Wb/B/9XOar0IWFNUBXIGwfBaWdhaEPby44BAmgSbUdkvAyiApNt9525q0l10wdcr1YehOFnVkp
 3NfjfYsWq+DrA3M4EZJmDhl2cC++16S36sHsm+pFcmw8FcTVxAULRNM/sdnPPA9XzK9o1ukMobx
 EWApLKYA1plrsI23VFPzs1Q3tvYxMBdllyDpZTthyVOM2xfaSnDX/m9ISpEshZAI1yPExG6ho+m
 /7o61tsmjaA/qgTkviYZrBgaxVE/jOQkJO/Hqz8pcES/47spArh5gUCHDlUDVWjrRwwJThWOrW5
 dtKE4U1aaAWF78t/PcSgo9/Iv3fzCADRhVChcnLgDQFwKvtN
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDEzNCBTYWx0ZWRfX/2N6XOW6looh
 XzPBs2NVwpcoCEEQaShKD4xskGmOhBZoZefS956PLKdwKeXGMtaVJ/coqx1nBChGkTu0HHt78aL
 pnJ6fF2vJkN3u45OYhMhugTwKkP3pG0=
X-Proofpoint-GUID: uQtkmb5m7gCiCofRkh_vbnrIg2W0NmvI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDEzNCBTYWx0ZWRfX1hPX55PQUDjO
 3FfpmRvgB4DfA2HzGIn1wCB19MOSo32wFh/z60mLIAB4tVNrqBu8O/eYBGi0GL1DrFQBejIbZDl
 SH3bL1J+gMC8JbMsP6trwfwgicBObRoHMvnyIDo5ddr+o1FEMzPTju7WEZvhU2Vz84r9Q9gEC/L
 Se2HGWrERtLsmvsevXa+taAsOx9MX/AeqvRAhJQ9xTH0KZmMuGng/6h8/dhxR/qNnaRgQ92zIaF
 iDpKzfbUJX10DXx4JYKyOqdnd++IKhJBDGyZaWn13oG8x+3aaKxCrFSnfoFcuVkRUfexVJx9HN1
 UB4zgVwEjBGgAsrUPHKoXtx/uC5SHtss5FkuXGpXd6hZyMI5+On9UWUSvZWjrxK0bhT3HaXUmfO
 zqbnqnnCKAuj925DQ/z7gZrSGN+64Xny3nPWgG1+Axbjxh8WeX1LLxrnu9CWEZcProEQwp+5iSN
 kdStC57j2tkvHY79lIQ==
X-Authority-Analysis: v=2.4 cv=Sv2gLvO0 c=1 sm=1 tr=0 ts=6a4fa52a cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=MJa1guta0NK89KAgt-EA:9 a=QEXdDO2ut3YA:10
 a=TD8TdBvy0hsOASGTdmB-:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-ORIG-GUID: uQtkmb5m7gCiCofRkh_vbnrIg2W0NmvI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_02,2026-07-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090134
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-67162-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:vikash.garodia@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:mchehab@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:busanna.reddy@oss.qualcomm.com,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:dikshita.agarwal@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BD751731C62

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
Changes in v7:
- Rewrote firmware detection, making it more robust. Assign firmware
  resources only once and under the lock. Dropped reviews (Sashiko).
- Fixed typo in the formats removal comit message (Vikash)
- Fixed 'invalid buffer' return in iris_hfi_gen1_buf_type() (Sashiko)
- Added a warning if firmware responded with more than one property
  (Sashiko, Vikash)
- Fixed encoder path to also read buffer sizes on AR50LT.
- Made iris_vpu_ar50lt_p1_gen1_s6_desc and
  iris_vpu_ar50lt_p1_gen2_s6_desc static (Media CI)
- Link to v6: https://patch.msgid.link/20260708-iris-ar50lt-v6-0-374f0a46c23b@oss.qualcomm.com

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
 drivers/media/platform/qcom/iris/iris_core.c       |   6 +
 drivers/media/platform/qcom/iris/iris_ctrls.c      |   3 +
 drivers/media/platform/qcom/iris/iris_firmware.c   | 146 ++++-
 drivers/media/platform/qcom/iris/iris_hfi_common.c |   4 +
 drivers/media/platform/qcom/iris/iris_hfi_common.h |   1 +
 drivers/media/platform/qcom/iris/iris_hfi_gen1.c   | 243 +++++++-
 .../platform/qcom/iris/iris_hfi_gen1_command.c     |  28 +
 .../platform/qcom/iris/iris_hfi_gen1_defines.h     |  15 +
 .../platform/qcom/iris/iris_hfi_gen1_response.c    |  80 +++
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
 drivers/media/platform/qcom/iris/iris_vidc.c       |   1 +
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
 32 files changed, 1946 insertions(+), 107 deletions(-)
---
base-commit: b9810cd75b9fb56a3425d391cba3f608502bd474
change-id: 20260507-iris-ar50lt-06228469aa5b

Best regards,
--  
With best wishes
Dmitry


