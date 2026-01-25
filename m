Return-Path: <linux-media+bounces-51498-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4L6UDaAhdmndMAEAu9opvQ
	(envelope-from <linux-media+bounces-51498-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 25 Jan 2026 14:58:56 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id A043B80E20
	for <lists+linux-media@lfdr.de>; Sun, 25 Jan 2026 14:58:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4C78D300D61D
	for <lists+linux-media@lfdr.de>; Sun, 25 Jan 2026 13:57:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0239931D39A;
	Sun, 25 Jan 2026 13:57:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mJIIjGCI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ezxCtycj"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B24E322533
	for <linux-media@vger.kernel.org>; Sun, 25 Jan 2026 13:57:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769349477; cv=none; b=tdGuqfBhMgjh0GXT2Fd5asplBDm2BtRl0TvdABKohOH5Ysbf8Z4NfospLSBjdqdgUqbi4Vlfw2nOHTqm+jhZ4+fSte1u4m+cTVyZsiTnA/hGhICVZ5aRBjf0if77gFHyp/xmm98g37UwTRvbiKIbDdlGNUGq0RRS8awsMl+np4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769349477; c=relaxed/simple;
	bh=dIO5YayCmsnxyES+C8CIdExF900jm6HWgkVRfQodJ/4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kSng4TfmtzzUtjkVV3Tsh2o0w7nAbeIZqMcZCXAQNSBbZLL8B9Fja7st9xpbxE7NZUcXPo9+p2AFUafnrMpXzgl8B25hPM/DHCF2PYA1/sJBe7/UEbSP2vCl/SERIy1CAsm/MG53I2JXIjFYdNJSetOSodC5tO9JEcBkrPLJr9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mJIIjGCI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ezxCtycj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60P8s8vb3794811
	for <linux-media@vger.kernel.org>; Sun, 25 Jan 2026 13:57:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	R55yhKJIM4GxZKFd/ExviBVtmS7VFYCJqkhbikeyemo=; b=mJIIjGCIDMZaBOCL
	bfp09Z2IFXIq8nh2iBtYuTiouqqJug7r1NIGlpfMijSnqYHToyxSdDuNFuTB9odx
	cbxzflrp1v5sYwvYF33dFZp7ZFqD21bFZqSxnV6F+hMpYDnLMtcQ3nYRCIQ9Ds6O
	021gIyrDkNXsp8NtYPuICiAr0daE0DPhSjGWRRqiKtx1JH7MfuJ2j0jiKEVzpHsE
	xltyFfbjd44hH4o3xcblYlfLDCQOCbUJvjExgudZ8L1oMZ/2XflZqTf5xVMtYFaE
	Yv5Jz45hNSPirWWoRsDJLhCFjeL381TBqc8OfUqQvBeS/VydNxkM0aPhhCRU+vXj
	wznvNA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bvq3ha79g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sun, 25 Jan 2026 13:57:47 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c53919fbfcso957886685a.2
        for <linux-media@vger.kernel.org>; Sun, 25 Jan 2026 05:57:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769349467; x=1769954267; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R55yhKJIM4GxZKFd/ExviBVtmS7VFYCJqkhbikeyemo=;
        b=ezxCtycjORjOqMKTWcTyz+9rIhcOY53PdnHnLGQIM3G/imLpLVDrGFycL2rlNbRw+O
         RpQcb4+uxbQoeqnaekApy4siY2yFJwIkfgrBTSz3v3iTmnDSJSPwm0/8HvZ5azNakgjk
         5oHv9mHwWedMgGugDDFYD/ryYs5c3HI11k2VVxXLsG+eQoTNlq7dF49iHjivQH9kMu+Z
         mbyzw7a07Fcq/X7B0l+u6FsA+dMacpuaGWWo9VL1t+s6d1uLH44Q2ZgD2/Z7IaUEsdA6
         UDfjWWANqv2UtyMsrfq0PbTGHu2saJzfZorGCyMcQuAjLNR0OsPuiYqs9oB1CjodAlkR
         Di/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769349467; x=1769954267;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=R55yhKJIM4GxZKFd/ExviBVtmS7VFYCJqkhbikeyemo=;
        b=BFyisvphfn+QFgxo26ihwso+5Kz+RIJOMFfKpq1+eKTMmmA/vz/qAW2P2dCRfuQnS0
         WyzsBsKSv4hEU5foJ4k+400nnssjn8TTEgCREgK9sJqcxlXUbgphm+odnItwWc6ipt6L
         g8k42brfc0ih2Z4UuN0gdWl+KsH1apUQXY2Xc7quqJKH9TRPHb5aZNdOx5JECRBOGbOO
         on8thATBQntD9GBNxRzf7czc3W7Gm+Ku8mGoCxBkcWmxNVK44GqzdyXbsMoA0uFe5lPf
         1swE+sLOcyf6L+ydF62ltyn6/oDBBoaoIjP5qSpldoMGOBqMklG4Ud/GjWtKwQEOYL7Z
         j/QQ==
X-Gm-Message-State: AOJu0Yx005pnbtwXzOoE1jcFawcMAzu4+tI/bXXr5j8FyOC9+FmWaWJk
	ypQ6UJ2mU+LD0+etTyRo1ILsJj0K1NTrJA/ZP0mDkrON+6u2aNm+/6oBQsgiWOZBnxSrsQ7OxWy
	i9SZaCTkiUfYcj6wF1Zi+tfpkU3dqHjDHcKsaBloprePvseshkwKlTTAAxZP58VMjTQ==
X-Gm-Gg: AZuq6aJXZjuuZwlPlx5hWC1Q63w4MRC+ZU9h47t0NZJrMlm0cWNOwgVJA3yc2HR+kam
	qzPoQHvZ8Cnk9aEYdO3b2owkfLyrhBoLY4jTuBLpXD0Gfb516AR9acGBPq3mPhM85FNWDAfua/6
	ClgiBv6JoYAo/11QIvpZ5LLs/GnWepWkfFbXUQR3A0ytLIE5VXH6lFqy/VADtWC5dExfHAaLESz
	uwUHdlM1wVavlHyk/p9mf4EQLrc+VhPC4PvW5cpdNvS1+Vn5ytUDOxiIpQ9XoobYI7q6o2b/SXv
	jyY7rTslGLc6CE82ZobAVOZJ5NXCImzAqcNnhLR074O9sTJi6cki/u2uLNOTb2H5MPlb8Af5vYh
	UkioJPL1hI0na1AEFc5u7hPPUSbOP8y1/+m6JRND6n6P9oUD8xpGGyUzKAQT8TYrTDOt4wO3Qsk
	iaO8d30heYPPlg+1aTf1nuiNk=
X-Received: by 2002:a05:620a:4620:b0:8c6:ae63:dbbe with SMTP id af79cd13be357-8c6f9693b6emr173214085a.79.1769349466713;
        Sun, 25 Jan 2026 05:57:46 -0800 (PST)
X-Received: by 2002:a05:620a:4620:b0:8c6:ae63:dbbe with SMTP id af79cd13be357-8c6f9693b6emr173212185a.79.1769349466186;
        Sun, 25 Jan 2026 05:57:46 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59de4918a3asm2033621e87.52.2026.01.25.05.57.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Jan 2026 05:57:45 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 25 Jan 2026 15:57:30 +0200
Subject: [PATCH v2 7/7] arm64: dts: qcom: sm8350-hdk: enable Venus core
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260125-iris-sc8280xp-v2-7-552cdc3ea691@oss.qualcomm.com>
References: <20260125-iris-sc8280xp-v2-0-552cdc3ea691@oss.qualcomm.com>
In-Reply-To: <20260125-iris-sc8280xp-v2-0-552cdc3ea691@oss.qualcomm.com>
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
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpdiFGMlmbbXYuiwT9bw/VLrqqu9Y4L0m626IE5
 Q/3bGAJg3aJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaXYhRgAKCRCLPIo+Aiko
 1aw7CACJLvV90JUstbr0QcoZJiIQkKsvDAaMysmbdiXvqEa97jGxUf5h/vGmWKI0q4F+2L4XfGe
 /F2p6/Vj7k8TGFaq/ma6cQLFxsj/z52pC4JFukr5nld8JmUfg738RP2U3nOWIkMHBfekwZQQvak
 u4tntOYsFyBoABVy9susQXzYOsoqHfWS5cJX0jEsAsCrGM1en1BIuIH7Poy4Zv8MuYmY3jiIpWZ
 0xd04YQbBmczgNsXDC2qs822nGnYFEaJgIwgKoCNAnZ78977TO7PhjvaRmvfn6vtu2H3DbGWH83
 Grd/dauZ2l7JAejjvo2vlawDxEKSwPdPw8a1W3aR0kU6/kPF
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI1MDExNyBTYWx0ZWRfX0DM0+0w4zZVp
 veGudVOpxRgvm7EJ2UuaUSatptp6wu5U3d7CALnlvJZqslY+PMtcBY/xCQz4acSU1+fetwGylBo
 ysP11MPYLJq00AYV6QypL7/XTzw8Gb6e4+yw7yKolZ2AJtDmRCaRGY6JpELmimOF3tkZ2yVhCe+
 G6PoWgtS0zVkQ7icTQCQHosD2KpqzuHlV8G89Inc4x0Vmobgbr42ujAdh7ZVXNXmMReWaSmt22o
 0kVLqwxZadXSR2zi5QNBRzJx7s3sfVtCDcUXD65Yx4ISN1PSrn802uaukwKkCWDbF9TRLFWJSHi
 iaRJ7tu6ZTaKCWETTj4Vn6PsmonA5UxruyrXaEbRtzp9SndPk6AkRFGx7qPw5V1TVRrgjpypKPz
 Vq9E2Ag+VBl2odfHz+vRuVOZvc45GnIGJcsaGUbmd4lhMy/SROjms3gI4NaNTkhT3apYhgn6vCg
 +7u/aG3dr1V7b/7ZGQw==
X-Proofpoint-ORIG-GUID: Rb29MtRsUqgVRYi7qjq6VKh1E2L-r4sE
X-Proofpoint-GUID: Rb29MtRsUqgVRYi7qjq6VKh1E2L-r4sE
X-Authority-Analysis: v=2.4 cv=c/imgB9l c=1 sm=1 tr=0 ts=6976215b cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=sbAN9nOpwR4X-TBSHOkA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-25_03,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 suspectscore=0 priorityscore=1501 clxscore=1015 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601250117
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	TAGGED_FROM(0.00)[bounces-51498-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
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
X-Rspamd-Queue-Id: A043B80E20
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


