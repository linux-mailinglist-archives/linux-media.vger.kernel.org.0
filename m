Return-Path: <linux-media+bounces-51509-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KLsDHrk4dmmTNgEAu9opvQ
	(envelope-from <linux-media+bounces-51509-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 25 Jan 2026 16:37:29 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C1EFF81464
	for <lists+linux-media@lfdr.de>; Sun, 25 Jan 2026 16:37:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4EAF930574AB
	for <lists+linux-media@lfdr.de>; Sun, 25 Jan 2026 15:33:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 070BE32860E;
	Sun, 25 Jan 2026 15:33:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RuNgUwgM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="c8KAnFEf"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99C41327202
	for <linux-media@vger.kernel.org>; Sun, 25 Jan 2026 15:33:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769355198; cv=none; b=jN+CZ20VEAsVCLxjgM+XNRTkD79Z4R4fBVffgUPIkl/ulySMChlA+2UUelJFgJpLruLgliIyZatC/7xIw7FMCqPA4xrfT6gp526+3JMgBkteM64px3oG9fFgE3BKapJ2NCiCSFnV9JEWyd9qJ7lEUTQxaK2+0tVluicSZzw6R5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769355198; c=relaxed/simple;
	bh=dIO5YayCmsnxyES+C8CIdExF900jm6HWgkVRfQodJ/4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=o40oZ45gmEKlKAHqgCwV5X+8zBYIVUGV77akUxNwHc0XiRfg731/t48t5AhDhq8SYMFcEQa8Q7MHibfcarFYPqCV+kKzfPwhWrtaaCqyyHOcyPkOg7Xrisn+H6ivduQBdqf7phPv1dzfFosgp3ER8w7seu0WlhfLhpekxcv+6Cg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RuNgUwgM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=c8KAnFEf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60P9qtaY3387389
	for <linux-media@vger.kernel.org>; Sun, 25 Jan 2026 15:33:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	R55yhKJIM4GxZKFd/ExviBVtmS7VFYCJqkhbikeyemo=; b=RuNgUwgMgUS9Lmr+
	XrUFZv3HhvM7w7W+V4kzZZmEh7Gl5ETyUG8T+q0RnLBUkudiiB6ZooFn1lP8E2vT
	iZuKAyVLVdunlBJtsbhZeWX7cARuhVPWuQSWfAO37Giv5aqw6H7h5r0Hz8ucBeMR
	qo08QpJyoZfZAISzpJPys5bFseSr/uCAodCsp5BOY673ZGYFNPTidVmaqi4dzJI/
	UnZ1QM5mZWW63+kaEBNhZn5fJGPzpuKkoacyXrKEyM2v0cREyPujR8njhqnyncYq
	ofausS8ODF3slUlbncJ6TrkL0yDlwEN9N+rZzmR5Opse0wdHn8Sx6c2p1asyLrS7
	EaFjHQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bvq9ftb2f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sun, 25 Jan 2026 15:33:15 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c538971a16so291136585a.1
        for <linux-media@vger.kernel.org>; Sun, 25 Jan 2026 07:33:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769355195; x=1769959995; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R55yhKJIM4GxZKFd/ExviBVtmS7VFYCJqkhbikeyemo=;
        b=c8KAnFEf35MwendzX/aFU/92s+W3RFgjvT+mQ5SSpNzO4U/pXDVPdxGaVygBX/vOCt
         7qg9a/kFG1WPMDhqT7JTCLftCcv5xtCb2pXByupuC6zyonkMEwZDLgApXeDqw9iiWZMH
         qqrubOO7Sux0q9rwyCWyRkjId1kXv823aoz48O72kvWImfvvvmR9o87D+NxCzNoB8Vqx
         Fyzm/3aT91l2Blbt4V0QxxyNsLmV+SilrBO3T6JxtaZMvpJzMHdWMnClFIYLSFD6eoBE
         TQlwORbzK+ErKD5wgT+tdFzuYoMsxEgKaQPzcwZOgDawjw8kWjusg/Pa++gtypXx6fsl
         b2DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769355195; x=1769959995;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=R55yhKJIM4GxZKFd/ExviBVtmS7VFYCJqkhbikeyemo=;
        b=eSQ+CN7LjX4Qg8QNOETdZsauPcLRJFAE9zHumzUXsOTK4RECJ4rZPlxkEHxkaD3VTv
         /Qba2QPmUX43Re3wwuDdqOG9/Qi7F9jHhjNvBTADS0Lz2wnC9nNJs200PGBsOy6+8Gea
         voVO52GP68KB2eNCks7+GywQcRR9Bu5RjMm1799pCtFwJuXOWe8T2LvqNDpWkGcmAGSS
         WznG5DzICkJ/2bBhszwjP5IBT0sgRJJgIaau8lKZNm8OQ3oxADCcFf82kuwd2lY5GEbc
         yOlFlCFxVAj95kFkEnz1nzQhi8+kGMjI5fHO3G3ZKYiJEE9HehlOKjwmT/BImGvNkI/V
         NdWw==
X-Gm-Message-State: AOJu0YyiCayMYQgv1lajeUxAUn7jYLG8mYDH2+j5MkdvPI2MEoS/C/A9
	ntaVRq86sNaA2Og4vh696I4gdW4gW7LTD64cvnIShq60mOdvBl3apWQ2mI4UFwL2F9NXfKj+L53
	dTURjq+TSqbfUT2SP9zcOlPUsqalivJD6aHGZEfgGU+WcCkSby3FnGjD2YGyLg6GwiQ==
X-Gm-Gg: AZuq6aJBCk77HsumwClfmnzwBBdpVzR3tcEfnxz8gk2TJnPgjTJYsLEjt6jy1yq8JVN
	ndAtM5KBvxULTI0TfC3TFQDhcvHkzw111FgNKHKiG3ZjoFKYdZSFbps6osr82BUhcOwPweR6vLf
	+M+zCrKcdZWCm3T1rOg14agX5bLI0zMKS0VaJM4nuWjwc8XFHH696ZTsQ4y3WcpbYxuYYIwXslX
	WzKBjwWLmWb9yIIZYZsJ9zK2HUGt8dxLqOvwUvG7o/ioig7dNTE5vAVLzngGJefirmP088zDL50
	LU2UkIP8CZ0Xv1adPt7d6TQGcEYECj/dz2p7I7ZqFBEhoB4LUB7EBLk26IP6u8gpxTDIAwfFZQ6
	oa6qsOY3jZRmmWSLStYLat6lOIFB9dDLKavIZ/QuSMHQ3Oy6nD1M+8uIBGD5y+b27aS+QN+7+2Q
	11G3CR7HOaqCA9mdwv3l0cvA4=
X-Received: by 2002:a05:620a:4115:b0:8be:88f2:5b15 with SMTP id af79cd13be357-8c6f95d44fcmr205786285a.38.1769355194994;
        Sun, 25 Jan 2026 07:33:14 -0800 (PST)
X-Received: by 2002:a05:620a:4115:b0:8be:88f2:5b15 with SMTP id af79cd13be357-8c6f95d44fcmr205782485a.38.1769355194528;
        Sun, 25 Jan 2026 07:33:14 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-385da1a0a45sm19154661fa.34.2026.01.25.07.33.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Jan 2026 07:33:13 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 25 Jan 2026 17:33:04 +0200
Subject: [PATCH v3 7/7] arm64: dts: qcom: sm8350-hdk: enable Venus core
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260125-iris-sc8280xp-v3-7-d21861a9ea33@oss.qualcomm.com>
References: <20260125-iris-sc8280xp-v3-0-d21861a9ea33@oss.qualcomm.com>
In-Reply-To: <20260125-iris-sc8280xp-v3-0-d21861a9ea33@oss.qualcomm.com>
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
        David Heidelberg <david@ixit.cz>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Johan Hovold <johan+linaro@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=771;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=dIO5YayCmsnxyES+C8CIdExF900jm6HWgkVRfQodJ/4=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpdjetDdXIMrIeYjwtTG4C6H9chW5bsLcrwEICJ
 Fo4kYX1xPWJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaXY3rQAKCRCLPIo+Aiko
 1VtwB/9eDbbVQFMsu6AWYK2Nvkq3JuOQAH7SfOxC8QRd+dKi+3K0hthB1FxAF4kX+o7/yx0FwY1
 1LfMWHqM33TgWtSh8bPmZac+XA/9SFpBm5Y/+UfpuSuO2r2Jt0+3vxOsEUEn89+jYZZkIYMWvMR
 WwRxGHpLwn9W4MpBVy20Fok25x9ql3pRJXplN4HdqZnaH9YRZrGKvd/IXSRu3wbztD4HNJWNRiS
 AgS4VQJG2P9q1WOzJUdC/nSDj/c7rj819zotfXu0qldcY84nsepUw+gwJ9lbF65lj3dloG1FRxx
 DsOcnWeqDm0AfCHQcXNuQFnLpLIv/AYvXJme3+mMobqX5EEZ
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: do9TImUtWbSNXDAq8vRHOJ-YAr40IGwh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI1MDEzMCBTYWx0ZWRfX8Vm1x7TwW7tc
 P2gCdo3bSxJuHgjxJ+qZ+9kI7Hn2jkP7nPsfS29UGjDxiRyEs+BOjcC8fkzqJMojA7qutBpoed0
 khzvZXZ6/hF+iB9+xAKj3yi6RVKrIirC3vpUVqZWADg5ZGxsHV7sb3jTcaBO7IMMi+QBeaN0wcS
 aoRg5Or3gwA+UucP9GoSmFLFB+ZO1QD064HwA0SyS4hFvmnE8Lej9dlk5cnyLfJ/AhOF0c9FBsb
 7f525Oh/CHC+LxEPc+5SbCui6hKZkiEtGF0OA+ruNa8kZjGqkRynTAc+ZOhGehQtGHqXykWCpBa
 ry3XVnvJwRYsqDs+fhoaNeQ/zvrJYC93bbO9UGGX4HuWITZNzh0Hhxb93Ky0B6xMRgAuDmTkOBd
 ELxLdg9UwvXALjze0ZgLH2XDERqqxqUHWSk2ujgsBCwt3aE2auHPaJRwApY931MelRLiGyo5QvB
 4NdguYXQodRe1NcVzlw==
X-Authority-Analysis: v=2.4 cv=btlBxUai c=1 sm=1 tr=0 ts=697637bc cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=sbAN9nOpwR4X-TBSHOkA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: do9TImUtWbSNXDAq8vRHOJ-YAr40IGwh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-25_03,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 impostorscore=0 adultscore=0 clxscore=1015
 suspectscore=0 phishscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601250130
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	TAGGED_FROM(0.00)[bounces-51509-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt,linaro];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C1EFF81464
X-Rspamd-Action: no action

Enable video en/decoder on the SM8350 HDK board. There is no need to
specify the firmware as the driver will use the default one, provided by
the linux-firmware.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8350-hdk.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8350-hdk.dts b/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
index 5f975d009465..79f024fd47f9 100644
--- a/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
@@ -894,6 +894,10 @@ &usb_2_qmpphy {
 	vdda-pll-supply = <&vreg_l5b_0p88>;
 };
 
+&venus {
+	status = "okay";
+};
+
 /* PINCTRL - additions to nodes defined in sm8350.dtsi */
 
 &tlmm {

-- 
2.47.3


