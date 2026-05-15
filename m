Return-Path: <linux-media+bounces-61707-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ALxiIjsOB2oLrAIAu9opvQ
	(envelope-from <linux-media+bounces-61707-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 15 May 2026 14:14:51 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E559154F456
	for <lists+linux-media@lfdr.de>; Fri, 15 May 2026 14:14:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A14AE30E54D5
	for <lists+linux-media@lfdr.de>; Fri, 15 May 2026 12:00:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5CE647DF96;
	Fri, 15 May 2026 11:59:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Rofz1WSw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="U+s5rcpP"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B88C480341
	for <linux-media@vger.kernel.org>; Fri, 15 May 2026 11:59:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778846381; cv=none; b=beg+siSTVxE0IheDGDhHQDnwo4NipHZcdUWcOx303Np5G4K5QoE93bKu/ZkMJpx2sHaiGR9O7nirbpLsDAiqeKTdnofDH88I7KCGOdd7ea7orciEu9LdSjsvBzYCaPp1+TxMEk+uI2fthq2nuI7rfM04IaViwp/N3OiWtiO7lMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778846381; c=relaxed/simple;
	bh=m9X312GlyTzYrjaE5voUXDp0+TdVreRfHVkajhAsNBw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GX5SWbK+HNbx8JAzKbLDRuOD5EVI8gOL4u6scVa0LWy6aASoSreKwgerASAY8eeO2qDLOGUAEdQHxzwJ4+nP2L5BvPY7PmRcpsuI80sDhPqHfl3sQ/lWXVBjsUKZNJ0S0C31ypsr3N9P4z2bfqy3sp2XwFDsYeQ71Og8BAkh60U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Rofz1WSw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=U+s5rcpP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64F5bGX01847994
	for <linux-media@vger.kernel.org>; Fri, 15 May 2026 11:59:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	j7Zo3oRVuQPAjn9JSO06MZzxwB1mFI14yIOh6gsjIS8=; b=Rofz1WSwC8NXFeex
	9wimSd1UWAgNAkFqoJbtrRAa1pZVR5B3SHpcVlyWEe+goM4vyPCN6d8+G5ZDweZX
	rZizdsdd8AtwfxVXTZEYKNBldbqipNUlAdWqUVbCS4KwL3nqwNhqbuWAAF67GIqS
	jxhugyQgtkBqSYc2l8cTvIl8TWrTfPU3/gWYTTLDWRzubeNHN1WuO2t5DrKo5kdf
	nj1aqf4xNG/YFyKeyuB6PPj3W1l6Eb9jOKl/vUy8UPt3RcdwPOuZWSlaSHwl1thR
	3ZtjQKIXStJnR03DZ+L12Z8akNScM6VcyotOnKsFLKJNjwgw0nftVy/Mmnj4vbhk
	TpcCoQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1t33ct-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 15 May 2026 11:59:38 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-90da7efbd60so745283785a.3
        for <linux-media@vger.kernel.org>; Fri, 15 May 2026 04:59:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778846378; x=1779451178; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j7Zo3oRVuQPAjn9JSO06MZzxwB1mFI14yIOh6gsjIS8=;
        b=U+s5rcpP2Hl20XcT3x+zUXnnzsWzT9SPsipOkpZgoXiAqXSd754MCXtR6GLAYKvLdY
         zC8cne9HEzopqkbXylOB+zeubNlc/25ZaslW2qNv1ezOjoaP+q79I9rEEzKNz79H3oa2
         vdByDm0ptLt3Trg3Sx3B1wJ8hMl4VNl3TkVokuKcAyfoVDVBhumEthK6sw9Mp2MTCTmA
         QwgjF9ZgHMWeFb19cKaX3Gnz1li0I4eA2Ih1AFgt8LGrExbPPQHV9xvdpDMMX9q+Q7iB
         6HoHpRoNpfULsIb+wXswqCA04xCBfIv6HwMQFy2ePQUJwmvvO5hiYpC1TuH0FYEAMIy4
         W9OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778846378; x=1779451178;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=j7Zo3oRVuQPAjn9JSO06MZzxwB1mFI14yIOh6gsjIS8=;
        b=Y0qwKE9DVayyf8btTEngWoAcMKIk4p8GNS3WQJB51ryhsWQfF3hfD2XBbZQf7ANEeu
         WJ/mjG/tQkmL1OwaY1Tqv1EWwX19MSzi6BOT9MDl3+GwNHpNZFrK2KPaSnJSAk0/raq8
         L2c7+aIHGgqnrhJ1eP6C4DWWXlSO7peOAlsTyn6lh04pgiA81fjWvsY/jElWcMMzoA3i
         0wy/hijNrqgHXhDNE/a70qYMltBKUVA11/88sDjXNhqt5jNPeHf/vQR9OEKP3Ke7aP/E
         36K0jF3sFktOeFYmWtlSfMZofPoZ7Bx2S3z/a5I3sFUjJqDtPRNyQmYr2FcfuvC7vFzy
         4zow==
X-Forwarded-Encrypted: i=1; AFNElJ+46k06afW8HM7H0Tc8yxV0oBWrNocqrS2uxRwF1iMi7eTDczSNIhzyVHYcgZP2OR2Vbef+dLQcRvQPhg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/Mov1SkA4scRVDhWfwxW09qfmwS+uKNz+XU4Oe599l/xYrCqM
	OsR2aVouN77q0P8j5waV+Qf7AtX/glE+W1vmVl8tJDvYqtjpFWRbt42my6ReVmuZQlSSDhs0V8Z
	+z/K5yBMbmoTLUxrU2/dd8pXDWflVmJ/Ioq5wYvSFij1IO+NffG8Gvqs1vZBVj6eJew==
X-Gm-Gg: Acq92OERyqmkiMhr69idd/41Ms41BXLZnO13OzCva1Bv1uK5bGLzCe0u+1HA7o4PtY/
	CrL6viQA3GqMCmAGCOqpglz+gbWoNqkORKtG5sB6UVjRPMdt0Byprf9wzGNdZj1AJUrXNSmOe17
	/UcP9b8ShYdMDK5368YyqZh0niWQzAaiiCFtflh20FWgBv6Ya6AUT6WkrK633qf8KM1KNCMcnz8
	n1umgsZKz7ng5f2vTh6xgZX5dDJMTNEl/mhNQbi1e3vO6Jtf8MIPRcA7Sg/w0mD612oP2z4Nr41
	VnqPU2EuL/UH6JjZXiv3HoEOVx+sbEePifMEyrc/U1KSWD3D8ChYAatyHk0vW0+JrB0uJwH8ooo
	2xF4+3KnWQn19i7RgcudvShGE+A1aDXZj00rkuQU9c49nsRDhwh44z+dQoh9Wa70wH1CQ80Lhmp
	RB9iXjOKgmrIaiNgE6Iu6UAh5YSX7haqXt+H9hTNHo2csrXQ==
X-Received: by 2002:a05:622a:8c1a:b0:50b:41bf:4ee5 with SMTP id d75a77b69052e-5165a27b291mr45163781cf.57.1778846377802;
        Fri, 15 May 2026 04:59:37 -0700 (PDT)
X-Received: by 2002:a05:622a:8c1a:b0:50b:41bf:4ee5 with SMTP id d75a77b69052e-5165a27b291mr45163251cf.57.1778846377248;
        Fri, 15 May 2026 04:59:37 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a90f119ff4sm1295651e87.20.2026.05.15.04.59.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 04:59:36 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 15 May 2026 14:59:26 +0300
Subject: [PATCH v2 3/4] arm64: dts: qcom: sm6115: add venus device
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260515-iris-sm6115-v2-3-2ab75229de61@oss.qualcomm.com>
References: <20260515-iris-sm6115-v2-0-2ab75229de61@oss.qualcomm.com>
In-Reply-To: <20260515-iris-sm6115-v2-0-2ab75229de61@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2620;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=m9X312GlyTzYrjaE5voUXDp0+TdVreRfHVkajhAsNBw=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqBwqgnkK8T5+7VBArmDGhOKqMgQ7aFld7PTRcY
 M7vxipk9RqJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCagcKoAAKCRCLPIo+Aiko
 1WZ2CACL3N4/XJFOIChQ+TPtlId7HFLg7XpZbJGG/9XaSd5YSfYG8p18jb0GUxSivqXVHC+j/Ij
 fq7MKkcCM8hi0kaamX0R/NNWCQ75qaYrncC8SEkz/3P10lSzFWXcA8vSxKgCtqZF4i+Sq1l0siZ
 teAkeLoanWxXxfSe0YxcSppfX+SSMhWDiCZzTjKuhBf5zV+5FYQ8BTCDUtOli2I1bC5HJHzS9Fg
 FYJS2O8nzBhPExSTFOn4GeoH8DorDvNS/v0ZShmLBPCzBPFoFs76bifkjZsPrZf4BPFpKfGWiBL
 RS7i/pL8cuIqGZiZuytBOUwZsg7QET5n/DU4bl5MA8XG6B9u
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=D7Z37PRj c=1 sm=1 tr=0 ts=6a070aaa cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=RLkLXjOyRIPW4P0KXqIA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDEyMCBTYWx0ZWRfX4fjXYK7LX3JP
 KvVNNKn5Z+PojExiv9iQX8TzFbRXknNxexRFzWmfFPuZa9FF0Qt5NGDCqUwv5j/St7jP4jkVn+w
 urNHPcKCjtbjkiIG8k5l1DKpuvcEcX+ak06NtGeWazEyxhrpyWNKWQQDVSXBFDWD434H9uW6xuW
 XvCEUk8+sLq5GHJz3Myo0tYkIsORxPn7kbCojUS6UDILni53/Lqn6MaAsZ8qDaJgJv0hDKLvOSz
 8HbGe0OSE/XVR71tKEqCs5KxF6M9gj9lKMZbyp4qHGZsnitp2cOF47NSeZiVkv0xO9zTgMXTF4b
 oQTwBN8MpsogDi8RTrBVJaSZKxN57ActGmHIZdbV/WTP5+DtQa3n3TRmYmoYg1nLR/3gZz2qHUc
 zHtssv73hwWydgPFDCfZlW5QXPSdJwcOY+E4fds9uRKkHlBpx3iwf5E4NdfdeAig5H/YQ6Mnws7
 qvSp/DcKK7SzTPU4yRw==
X-Proofpoint-ORIG-GUID: TbKCumtdJQO4Qxpo8WEOXbmaErt6Qbww
X-Proofpoint-GUID: TbKCumtdJQO4Qxpo8WEOXbmaErt6Qbww
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_03,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 adultscore=0 phishscore=0 clxscore=1015 bulkscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605150120
X-Rspamd-Queue-Id: E559154F456
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-61707-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Define the video en/decoding device present on the SM6115 platform. The
core, AR50LT, is mostly compatible with the one present on the Agatti
devices, so it uses qcom,qcm2290-venus as a fallback.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm6115.dtsi | 65 ++++++++++++++++++++++++++++++++++++
 1 file changed, 65 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6115.dtsi b/arch/arm64/boot/dts/qcom/sm6115.dtsi
index bd94eb87d6f9..3520802d1fed 100644
--- a/arch/arm64/boot/dts/qcom/sm6115.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6115.dtsi
@@ -1853,6 +1853,71 @@ adreno_smmu: iommu@59a0000 {
 			#iommu-cells = <2>;
 		};
 
+		venus: video-codec@5a00000 {
+			compatible = "qcom,sm6115-venus",
+				     "qcom,qcm2290-venus";
+			reg = <0x0 0x5a00000 0x0 0xf0000>;
+			interrupts = <GIC_SPI 225 IRQ_TYPE_LEVEL_HIGH>;
+
+			power-domains = <&gcc GCC_VENUS_GDSC>,
+					<&gcc GCC_VCODEC0_GDSC>,
+					<&rpmpd SM6115_VDDCX>;
+			power-domain-names = "venus",
+					     "vcodec0",
+					     "cx";
+			operating-points-v2 = <&venus_opp_table>;
+
+			clocks = <&gcc GCC_VIDEO_VENUS_CTL_CLK>,
+				 <&gcc GCC_VIDEO_AHB_CLK>,
+				 <&gcc GCC_VENUS_CTL_AXI_CLK>,
+				 <&gcc GCC_VIDEO_THROTTLE_CORE_CLK>,
+				 <&gcc GCC_VIDEO_VCODEC0_SYS_CLK>,
+				 <&gcc GCC_VCODEC0_AXI_CLK>;
+			clock-names = "core",
+				      "iface",
+				      "bus",
+				      "throttle",
+				      "vcodec0_core",
+				      "vcodec0_bus";
+
+			memory-region = <&pil_video_mem>;
+			iommus = <&apps_smmu 0x860 0x0>,
+				 <&apps_smmu 0x880 0x0>;
+
+			interconnects = <&mmnrt_virt MASTER_VIDEO_P0 RPM_ALWAYS_TAG
+					 &bimc SLAVE_EBI_CH0 RPM_ALWAYS_TAG>,
+					<&bimc MASTER_AMPSS_M0 RPM_ACTIVE_TAG
+					 &config_noc SLAVE_VENUS_CFG RPM_ACTIVE_TAG>;
+			interconnect-names = "video-mem",
+					     "cpu-cfg";
+
+			status = "disabled";
+
+			venus_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				opp-133333333 {
+					opp-hz = /bits/ 64 <133333333>;
+					required-opps = <&rpmpd_opp_low_svs>;
+				};
+
+				opp-240000000 {
+					opp-hz = /bits/ 64 <240000000>;
+					required-opps = <&rpmpd_opp_svs>;
+				};
+
+				opp-300000000 {
+					opp-hz = /bits/ 64 <300000000>;
+					required-opps = <&rpmpd_opp_svs_plus>;
+				};
+
+				opp-384000000 {
+					opp-hz = /bits/ 64 <384000000>;
+					required-opps = <&rpmpd_opp_nom>;
+				};
+			};
+		};
+
 		mdss: display-subsystem@5e00000 {
 			compatible = "qcom,sm6115-mdss";
 			reg = <0x0 0x05e00000 0x0 0x1000>;

-- 
2.47.3


