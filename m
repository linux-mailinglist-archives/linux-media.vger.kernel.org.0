Return-Path: <linux-media+bounces-63827-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id At/pF6KtIWp5LAEAu9opvQ
	(envelope-from <linux-media+bounces-63827-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 04 Jun 2026 18:53:54 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BD4C642150
	for <lists+linux-media@lfdr.de>; Thu, 04 Jun 2026 18:53:53 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=EZ5jiiY0;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=cJfgV0cl;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63827-lists+linux-media=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-media+bounces-63827-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 6A17230008B9
	for <lists+linux-media@lfdr.de>; Thu,  4 Jun 2026 16:25:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F59648B361;
	Thu,  4 Jun 2026 16:22:37 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC99C48A2D5
	for <linux-media@vger.kernel.org>; Thu,  4 Jun 2026 16:22:32 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780590155; cv=none; b=KGLcprinz5Zban51JhN6O6a0rxJwn/+YqXOE9sFxdax6PIvVWnt+TN8zGdC4pvTHkWDExKjCnzySw8KDkVJeCqWuD83ez461gutVQutONjLyHGvb/M9TtFRNQzKIRrdzKT3RfTWLkvJNPTI4i/3KwCbkV0tq2aKRtuE7218fZB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780590155; c=relaxed/simple;
	bh=KDONWoVWgo4bQVHIX5jep12WUUSRUxz8kNJF/VhmCpQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Ai7Tk+8WyHx3ydQySaWkSE3ibiaM3ARn9atMWaT12BvqC+CPmENYoCqNjvrZDBwm6wy7g/LhiOQ5Tv24uOPw8DmuF34NNOC+zDA85g+nIiwIekKnitk8y6NrAyarbLAevYPjaJJtcFswLuFKvkIDEWuYtvLLGKWuuFb45KaANyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EZ5jiiY0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cJfgV0cl; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 654Eh4eH600152
	for <linux-media@vger.kernel.org>; Thu, 4 Jun 2026 16:22:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=k3wL2K3dlb2dNxaCHLSI8S
	bji31i/l3i8H4s1lAhgCs=; b=EZ5jiiY0WHUhzRfvD304C2b2o45tICUlCYvFxk
	qyA0Zs9yjtB+VZMO369CKdOTKD1bp8z1qM2u28THTBVjDQqu1NAKC4GQuBBOPf1T
	VItdDlEQ5T3stAM1PK5PfTqbJcOOlQ+AEVkTUr1aR879ta5sHJWbLzT9zdzFcIoj
	3QKubtLRQ+HtTAekZzBU5O2pIjJTX1sqbg7S2gFRujmZMnIjGJxO1j/gLkqzmQJw
	KxDNEdlKkPAg4QnMu95de/nN+/7uoZs3juGJWmjp31Vhh3+MORqJv38bbIIqn037
	w24veYHzx7qUO3viIP5DWQr/tFBjv4/YZoAGlysin40ZhO2w==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejy8m3eqg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 04 Jun 2026 16:22:32 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-963b07e2003so935124241.0
        for <linux-media@vger.kernel.org>; Thu, 04 Jun 2026 09:22:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780590151; x=1781194951; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=k3wL2K3dlb2dNxaCHLSI8Sbji31i/l3i8H4s1lAhgCs=;
        b=cJfgV0cliH1hNhe65HWQC8QT+t7KFeeq9JMyOkD518E7n/vDHkgW3FsL6DB7VG0a90
         P4XSKxzG4nrs6lmav0lQ9iGzXD7Ot/VvC5bBgkzvNih4SonNpo2S3tG7uUdJEu97uzxb
         QRYtW1CL2lpzBVaVg+7wDwNqDw/VYIk3pKLKVkE0Vf41iCq+LHkx7NYkRvVD4HWhosXF
         q1HOhWNMtTSKtAbfMvgZOWrJ/+GPj2dZGn+XEZYf82WWZg/9YxR/Oug42MgMNYxhJWWg
         B2kLGnQh4EkwslEpJjZrWvIfNwtkzIm+hL7EFQ6fqqiVGIr94LQrmMCGWVnle6fngG9F
         eQiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780590151; x=1781194951;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k3wL2K3dlb2dNxaCHLSI8Sbji31i/l3i8H4s1lAhgCs=;
        b=SIFf/WZ/fLpxzngyzfI6c7l85oqjVZUC1VtBNsgqsED+AEs8hEc4ncJR/CrlcNXKrN
         rI89JtnXe4KhoIu1CnoQtJ7PxvpBsD9qygh4FHpOmQCoP/SKc1VwgH9cT/fhLi/x7zV/
         IO1FngZO3shC9fZh7BVwm8vTtET8amWSBjJeHtXFWQwvY0+Itps3WkF3v1FQKibZs7IF
         Nhsx/gL0N69xrTISIxMsJcFkKDlg34In/3LwQgEo2Sj/Fl3zPsu3C7zdxPzU+uJZ2hqv
         fGZYov2EZWRMP/ph0c/ailiJtiUpaD9bj33VRqzU+WbpXx3te/8JgRD/6xSw/GO3XaBt
         tojw==
X-Forwarded-Encrypted: i=1; AFNElJ9SPKyXs3TxiXWJ7DyN9rniVoQwjSwlsqHfemrpF1WNVat4EHSESTwRkFptBAUM7F/ciEoZpShlNLXxjQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyKJmMEdR9Z+8tawt9ZMv0Q3rBM+zlu37v2eADhUs3JIEqfjYZ4
	GPuvM6ICh0MteRLcvJ6xZnFsfC4UFicRmmnJwyqZEQF+3z+twUSJYVbu7WSpqiIbwrow56aKrsq
	JicUdeh/Ysd0WVGdZ9CyJhjo4mqpF3+qd26uUyDdlZRs3LbOOf4+xYYqN8XbePagR4g==
X-Gm-Gg: Acq92OG8NMgZOpj31OB5G6xMFqgVYJnjzC/kLdkA3cw/28opJKIi6TfJ7eUIlrhC3IB
	XP0jZNKQPwR0IikG27xYslMXBtXXNMtnxNcW7aYD8po5Hx2y7VRrxoVBYbvZWOPZAfPTvDJlVmD
	G/1QHHyJZJsrb/qMsA81wAs+b4uJ808Ap7531tHGF0U++70R49SvVghNXVrnHrI3m+JsvJmRdl4
	UsRH2egvp8mGstz1G2Zg08nqj4FIbp7A6/H+IQ1KJUpx6x4dNdtJE9+7AapZ7aYGjyiVild5IG3
	yn+5ewtrqmzZh5J+wiEfdu4uxNiceZo0pF1X4LKwwdl24BoUySwyjnR5KDda9CIMj+jSVNkVgHE
	pjubqGRO4yctPddXfO3HNfmSPnFDVqObepOlE/hFexXgoMuVi1ourqQTwuq9kl+9SXCx4pJkXyc
	M1xZUdytNJowstNBD9J5/qNbb6Di0Z6Y6AbRP6f3V9ubu8Mg==
X-Received: by 2002:a05:6102:94f:b0:631:ec2d:12b2 with SMTP id ada2fe7eead31-6ec2b17cf54mr6178921137.1.1780590150586;
        Thu, 04 Jun 2026 09:22:30 -0700 (PDT)
X-Received: by 2002:a05:6102:94f:b0:631:ec2d:12b2 with SMTP id ada2fe7eead31-6ec2b17cf54mr6178772137.1.1780590149625;
        Thu, 04 Jun 2026 09:22:29 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-396ac2d5034sm17591591fa.29.2026.06.04.09.22.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 09:22:27 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v7 0/2] arm64: dts: qcom: fix power domain handling on
 SM8250
Date: Thu, 04 Jun 2026 19:22:22 +0300
Message-Id: <20260604-iris-venus-fix-sm8250-v7-0-7bd2f0e5bae8@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAD6mIWoC/43SS27DIBAG4KtYrEvK+5FV71F1ge2hQartBGwrV
 ZS7d5wskkVRu0H6YfhGaLiQAjlBIfvmQjKsqaRpxGBfGtIdwvgJNPWYiWDCMC45TTkVusK4FBr
 TmZbBCc1o9NKB8GCVtwTvHjPg6c19/8B8SGWe8vetzcq33b/ElVNGWyM1gDHCqe5tKmV3WsJXN
 w3DDheywat4YIJVMYGYiYr1WKY75yuYfMZUDZOIWRaDcaBt9KaCqWfM1zCFmMcXBqYs752oYPp
 fmEaMBSGk0b3UTlcw88A0FzXMIKa506ZvITr52wCu91FnOC34c+b7vEkbCtCtKM37ZoTz/DqEM
 kPG+usPvdAjxXECAAA=
X-Change-ID: 20260131-iris-venus-fix-sm8250-f938e29e7497
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>,
        Jonathan Marek <jonathan@marek.ca>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Dikshita Agarwal <dikshita@qti.qualcomm.com>,
        Ulf Hansson <ulfh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2209;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=KDONWoVWgo4bQVHIX5jep12WUUSRUxz8kNJF/VhmCpQ=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqIaZBXqz/eOv6SsVdSHfYNYXRqRBPY0J8sui/B
 jhNDL2e2HyJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaiGmQQAKCRCLPIo+Aiko
 1ScVB/9o14pbiVemUmz9SJ3JKaNgvASIRblAOhzAS3YU6g1eiawgEsP08a5cIbYb/xu7mxrQb0e
 wVhGoZLEwnzHSOldaIX9uk7a/RJRPc+uDViiI+aIpN8ShCnXI5F0VV84GRakr69sSkzFw+lEBqE
 TtIPeLyQn9AiTKOTwcWvaYVqX1NBS+N0Yh6ZBVj1FGCOMPWsGy4UOe5j4DUdjmBPknCy4aa0yc6
 Eq2B0JOytVwTPNlYRAi9azpWY6c1rgzPAl7wKfjAk2KDB1xm8qB2Baah5F1B0PPk3Gw4wLSun6K
 q/bwYSfQYdm1wy8AtKfSgG0aGYxnIqSt1pUFng3k6503FYdJ
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=KfDidwYD c=1 sm=1 tr=0 ts=6a21a648 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=cvYA71F9yvrgsMZaK7wA:9 a=QEXdDO2ut3YA:10
 a=1WsBpfsz9X-RYQiigVTh:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA0MDE2MCBTYWx0ZWRfX8A8w5G5qo2n3
 Z6psr7EraiOlIy+fpbiehynlqBYgfUqPhx48ew84F2460jHCvw+dPzUSjkXUkUkOApTpnTg/qTE
 KNMmHpDys+5qKoiGkaxPBo30Ow5KKUi5jH+LnYPgii+QFgwkd72J9Q+BvPAytOcpzLU3zUnTBfh
 7dd1XdgJwzg/O1GbUpdP31yYjNWd4qlPIj1QiHhZTwwYSkpWnARTm49eahyMxG1lKBSG1WNqc+W
 A5G+46Uzcydp1rsKPBMfTXoBPpX7tyLMe65EDsDkTtCRwfJeeMUXirxlVLVqgGQ8XYsvpi1leLh
 Tav2Vt6cAKsLnuon65HAFbauzZA31NsE6RHycExW4PqMa8LB7EkfdiIKqw/cIPYXpdKKp8cg1sJ
 pgeUx0FgRdex7+DUqqKMcyKiQtIRzSydFmXphsdG+c+2qkpb24wRqyzRMtE2AnoqmLRn5clMiTg
 5LVLRrmmj7VuVd9ufeA==
X-Proofpoint-GUID: uksF93xCdi61me-QIkhspWunxud3bABR
X-Proofpoint-ORIG-GUID: uksF93xCdi61me-QIkhspWunxud3bABR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-04_04,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0
 priorityscore=1501 suspectscore=0 spamscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606040160
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-63827-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,vger.kernel.org:from_smtp,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,msgid.link:url,qualcomm.com:email,qualcomm.com:dkim];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[29];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:quic_tdas@quicinc.com,m:jonathan@marek.ca,m:rafael@kernel.org,m:bod@kernel.org,m:vikash.garodia@oss.qualcomm.com,m:dikshita.agarwal@oss.qualcomm.com,m:mchehab@kernel.org,m:stanimir.varbanov@linaro.org,m:abhinav.kumar@linux.dev,m:hverkuil@kernel.org,m:stefan.schmidt@linaro.org,m:konradybcio@kernel.org,m:bryan.odonoghue@linaro.org,m:dikshita@qti.qualcomm.com,m:ulfh@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pm@vger.kernel.org,m:linux-media@vger.kernel.org,m:mchehab+huawei@kernel.org,m:konrad.dybcio@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt,huawei];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7BD4C642150

As pointed out by Konrad during the review of SM8350 / SC8280XP
patchset, Iris aka Venus description has several flows. It doesn't scale
MMCX, the frequencies in the OPP table are wrong, etc.

Let's correct the Iris/Venus enablement for SM8250 (unfortunately also
stopping it from being overclocked).

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Changes in v7:
- Revert back to the levels in v5, they were correct
- Link to v6: https://patch.msgid.link/20260512-iris-venus-fix-sm8250-v6-0-51856dbef83c@oss.qualcomm.com

Changes in v6:
- Dropped patces, applied to media tree
- Corrected levels for MX rail. Dropped the review tags from the patch
  to enforce the review of MX levels.
- Link to v5: https://lore.kernel.org/r/20260209-iris-venus-fix-sm8250-v5-0-0a22365d3585@oss.qualcomm.com

Changes in v5:
- Fixed maxItemx -> maxItems typo
- Link to v4: https://lore.kernel.org/r/20260209-iris-venus-fix-sm8250-v4-0-9662a0471d82@oss.qualcomm.com

Changes in v4:
- Dropped MX voting by videocc: it's almost-always-on (Krzysztof)
- Restored minItems for the venus device, preserving the ABI (Krzysztof)
- Link to v3: https://lore.kernel.org/r/20260204-iris-venus-fix-sm8250-v3-0-70fa68e57f96@oss.qualcomm.com

Changes in v3:
- Dropped applied patch
- Fixed typos in the commit messages (Dikshita, Konrad)
- Corrected MX OPP levels (Dikshita)
- Switched Konrad from Suggested-by to Reported-by (Konrad)
- Link to v2: https://lore.kernel.org/r/20260201-iris-venus-fix-sm8250-v2-0-6f40d2605c89@oss.qualcomm.com

Changes in v2:
- Fixed example in the new sm8250-videocc schema
- Link to v1: https://lore.kernel.org/r/20260131-iris-venus-fix-sm8250-v1-0-b635ee66284c@oss.qualcomm.com

---
Dmitry Baryshkov (2):
      arm64: dts: qcom: sm8250: sort out Iris power domains
      arm64: dts: qcom: sm8250: correct frequencies in the Iris OPP table

 arch/arm64/boot/dts/qcom/sm8250.dtsi | 36 ++++++++++++++++++++++--------------
 1 file changed, 22 insertions(+), 14 deletions(-)
---
base-commit: 7da7f07112610a520567421dd2ffcb51beaefbcc
change-id: 20260131-iris-venus-fix-sm8250-f938e29e7497

Best regards,
--  
With best wishes
Dmitry


