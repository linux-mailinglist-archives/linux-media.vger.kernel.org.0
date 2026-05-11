Return-Path: <linux-media+bounces-61057-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oO5gEDadAWqTgQEAu9opvQ
	(envelope-from <linux-media+bounces-61057-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2026 11:11:18 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 931A850AA7C
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2026 11:11:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 546CD31EB4B2
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2026 09:02:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 846543C5529;
	Mon, 11 May 2026 09:00:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="McZhUcIM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ka+FCKnG"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F0503C3BF4
	for <linux-media@vger.kernel.org>; Mon, 11 May 2026 09:00:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778490004; cv=none; b=FzVFA33vgZjj+m+DqFBx5XPvIlorcdakpkhaQxOxQcPjpDLw1Wgin/E8b7qGwKwQGSG/gHxT8FT+YEV90kHclRfpmwkfXZi7L2k7rog/BnYcEpOXfCTGC9Afnn9CYOMatiiC6LSKkeZmUy80wedW0IfTfNiSbRP3TQTHdppXo3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778490004; c=relaxed/simple;
	bh=n9VibjCSLVlYOqXWp9xJAZh+no8a7iSRp7Es5SfJBcY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DddZtp/+CFynu2+N8NrdY71VWYteOg6RRVJBzwnCZSOxV9r818I63uXQju5GFgtQ4rvA/SGXkGSEhMrMUgKRzHIEjoSq94T3BZ62j4STZBf5IKCK2ES39RceP/R4okeURXDdYEbSEXQD9Wm8qtLH8u6RPZv5yzhH81c9fifI/L8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=McZhUcIM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ka+FCKnG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64B7A3i71258452
	for <linux-media@vger.kernel.org>; Mon, 11 May 2026 09:00:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xQXFwNJB51A+dwfMhRTmVUJPOq/oAjwYwUSnTy38oVE=; b=McZhUcIM9tY15jo8
	hrhevcwp1uLtygIgcecHlpUuChqc0xGJ0Aq1dnxpPRNGn/HQfuNfqh9Oc700yykc
	sC6+oB4a3eftx1QF853YiaakKByxBBLK/zxLvGzTbuNPuDvjLR4H0Jj4Px6w0SQa
	EkWNG/6uMJBzkc9moNCqwFmbbu8a7E0/pDtrOQjH9RaU/HL0csf32gWFj2uf90h8
	lpXWV/Bok4ygPxRDsqSfKlJxLjPXdrwkSwF5Wnd9BSQdbrP4UP8uJCOfOX+Xz8AJ
	VR+bmyFtjxAzr/LU3ByKjj1SgGZik6//DF1CfNc4Ln90DR6EfRUz+mVizLIAAEAU
	xc5F/w==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e3ag20csb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 11 May 2026 09:00:01 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8badccc9194so38728436d6.1
        for <linux-media@vger.kernel.org>; Mon, 11 May 2026 02:00:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778490000; x=1779094800; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xQXFwNJB51A+dwfMhRTmVUJPOq/oAjwYwUSnTy38oVE=;
        b=ka+FCKnGmMKYhbDRb9kTdIl6XzPXxloCUawsmQWf/I/U2RV/Lo2kUTffEUP+/ze8Eb
         56Ag1fjETpccb3zXioDMnZqa/C8TzB9BRUXUfIXHYl2RXUezL+3MAxvu4bkzYI4khslW
         kc9UKorVM42wf61ocs4U+bDgCElNGxiCfLgzVwiYK/7B2qj8b+EfLau3frDor1sSo+W7
         dCj4qB6L9iQ5gdyDwQfsu+Ad2Nney/DN6RhWqQQqPHloyGapSmqJg+y+oucGnn3UzX2S
         W7nNg4UpRCsq7ttcJO3OWz5qHZG9EnJGfnM5O2+emE6OpZrscyPDyyVeTbva2vk5UYQP
         FXdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778490000; x=1779094800;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xQXFwNJB51A+dwfMhRTmVUJPOq/oAjwYwUSnTy38oVE=;
        b=V3eV12zcW6e73CHZJWDH6ARXTmOlkLDFYEf5qG7boKVbR8am/Z+R6Aq8ZVWoNB/CGN
         SBas3/+sTfpDn7U2Btw1sALqXcZueK5CeIREi5b2RNEUB1WhK0J0XbIOOobRqjAXHzTs
         3EyoYzud2g4UGMBoZjPiCjJbCN1XuaAj2/ZFqwAluCZAMsGw0qiOgajLbGDfTvvZP9xI
         E9mHS2AKqcNI5KSiBw3hEt0WrwjbBqca+OxH0LEEVg5VB50iqrMMmXluGAxrKK7L23QR
         swUPXsI5Hn6/FTmyl9h6UeRbEndNk6J602vY/+S+vSzHpLKfvQRwKbsahyZQvUogiPVe
         /5Bw==
X-Gm-Message-State: AOJu0YxoLh2KJr4GPTnw8WUxyhq3ZXVE6AmdhKWMdjhxgEvT2F9WhL4N
	yrv0rvd5t6ye52tokbQkII3E5yR4Nn77yEt3OUtAH0833rLYVqh4VKTVGDzAs4Ora7bNcp86Ato
	7t7WKY1hjHS95jyP3/HGr2wi7/KrBiBSIE0UhPbJDxS8taPCE9GtBLuDgB/Q9us4n1w==
X-Gm-Gg: Acq92OEhyiJvbMZyEUDYWasttkR7atzKBp6nw7l7/5iWuzlvZNCXBxYLoOvBUq4/+wU
	TC3w1QeiuyZOIOdR0p2XnIH62P/I+xnxPNYtMlSZoEXJy4EsznpUOsP9A2ekB2Oy726o8hYbw8R
	rkQ/rmlFDEznSVVtQMvaBt93Km2GOCR895A9DYkKecktpMHlgGkin4qBp5A3pYXFaG6VnS0XGCf
	9Eokg7Z7hfUkMYXB7E6e6pz2Y62pO+raTuUtxm+4aJbf6d2CS3DCTAuvMU2FPgKY0X25Gg8Z8qQ
	KdD2gtd8WlWSkuUKrCTOCgpFeqdM8CnNV1F/7kXkkjutiD7Qhww3y9FWxrHd7XeaszPwMJ/kBSs
	IeVREZmhTUIasXLQawTddqtXmwoqliIh6ZxiBh8gQHTgnMwez+ApLXh5c/YP+L8lzZtRPkS1vE+
	ZBGxfqJtQjCoQk
X-Received: by 2002:a05:6214:258c:b0:8a4:c1ef:d727 with SMTP id 6a1803df08f44-8bc422a6815mr338158776d6.10.1778490000245;
        Mon, 11 May 2026 02:00:00 -0700 (PDT)
X-Received: by 2002:a05:6214:258c:b0:8a4:c1ef:d727 with SMTP id 6a1803df08f44-8bc422a6815mr338158446d6.10.1778489999722;
        Mon, 11 May 2026 01:59:59 -0700 (PDT)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8bf3b0c7600sm89017316d6.1.2026.05.11.01.59.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 01:59:59 -0700 (PDT)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Date: Mon, 11 May 2026 16:59:36 +0800
Subject: [PATCH v2 3/3] arm64: dts: qcom: purwa: Add camss node
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260511-purwa_camss-v2-3-22608ab9126c@oss.qualcomm.com>
References: <20260511-purwa_camss-v2-0-22608ab9126c@oss.qualcomm.com>
In-Reply-To: <20260511-purwa_camss-v2-0-22608ab9126c@oss.qualcomm.com>
To: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778489976; l=4576;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=n9VibjCSLVlYOqXWp9xJAZh+no8a7iSRp7Es5SfJBcY=;
 b=BDq9piCmFFhpZ0b8v+oZHYaQaVFHIWpvUkMcSuCAoojfoYA/5JW4leNqIHmE4URnbE7eae3SD
 JT8XBgmuthmBwWAA/OotiuKE9LK+RRkVysWts/HBD8sjhBdLJn7f9nl
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Proofpoint-ORIG-GUID: cIsACz3HEVPfa2TxH6t1_qT9QSnLJmrV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTExMDA5OCBTYWx0ZWRfXwBQy19VuY5p0
 9pRQwvhwBhX10fo6TBKdXB5lydlq+9jV+nWsUM3wqoV36nFBY7cHXi3/3+Blr4GHrc4ZXutSAGL
 nGZ85gZGts307PVsJ+fjismiIcXWIPpwWNu71mGxBS08t/4xTQk8cSaoeIOCt/mMWHNgmUGdWYu
 Egug4oW7uiI55X1MVAoJUHnjmba1b4l+goGXGSoaVTfxQYkRBMs37zJH3Q2XA/y0VGGYvQ6s7/7
 M81Gm4KE7h4Z6jSQ7SXuIlTY+BgDl1Ay0YvV2+MifbNyhig1ABIybe7qC0EDlJe4dl0y1zQuqKj
 YSrru+CeoJCW1l8isAqyJ+gBzWmQoUlnWHl/UEhUs+39SZwElhq5j+9NvxJqu84pYVbWAKeGmdh
 eRaH0p9raT6JWinI/C8ImomhoHUAL4X5UFudGPC+9jnIg6VyiquEHwgKgSgxzShzOlIy2p+c7W+
 VbI8jqP+Ii1v7R19f2Q==
X-Proofpoint-GUID: cIsACz3HEVPfa2TxH6t1_qT9QSnLJmrV
X-Authority-Analysis: v=2.4 cv=NODlPU6g c=1 sm=1 tr=0 ts=6a019a91 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=Q9ZxdLzGgorN4A3_XcgA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_02,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 adultscore=0 suspectscore=0 malwarescore=0
 lowpriorityscore=0 impostorscore=0 spamscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605110098
X-Rspamd-Queue-Id: 931A850AA7C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-61057-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.0:email,qualcomm.com:email,qualcomm.com:dkim,0.0.0.1:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wenmeng.liu@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Add node for the X1P42100 camera subsystem.

Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/purwa.dtsi | 143 ++++++++++++++++++++++++++++++++++++
 1 file changed, 143 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/purwa.dtsi b/arch/arm64/boot/dts/qcom/purwa.dtsi
index 25cd547caab8fa64eb1a134068b77f5178f5c248..cee72349da4916790a39ef3ce9219d3304ecae12 100644
--- a/arch/arm64/boot/dts/qcom/purwa.dtsi
+++ b/arch/arm64/boot/dts/qcom/purwa.dtsi
@@ -38,6 +38,149 @@
 /delete-node/ &thermal_gpuss_6;
 /delete-node/ &thermal_gpuss_7;
 
+&camss {
+	compatible = "qcom,x1p42100-camss";
+
+	reg = <0 0x0acb7000 0 0x2000>,
+	      <0 0x0acb9000 0 0x2000>,
+	      <0 0x0acbb000 0 0x2000>,
+	      <0 0x0acc6000 0 0x1000>,
+	      <0 0x0acca000 0 0x1000>,
+	      <0 0x0acb6000 0 0x1000>,
+	      <0 0x0ace4000 0 0x2000>,
+	      <0 0x0acec000 0 0x4000>,
+	      <0 0x0acf6000 0 0x1000>,
+	      <0 0x0acf7000 0 0x1000>,
+	      <0 0x0acf8000 0 0x1000>,
+	      <0 0x0ac62000 0 0xf000>,
+	      <0 0x0acc7000 0 0x2000>,
+	      <0 0x0accb000 0 0x2000>;
+
+	reg-names = "csid0",
+		    "csid1",
+		    "csid2",
+		    "csid_lite0",
+		    "csid_lite1",
+		    "csid_wrapper",
+		    "csiphy0",
+		    "csiphy4",
+		    "csitpg0",
+		    "csitpg1",
+		    "csitpg2",
+		    "vfe0",
+		    "vfe_lite0",
+		    "vfe_lite1";
+
+	clocks = <&camcc CAM_CC_CAMNOC_AXI_NRT_CLK>,
+		 <&camcc CAM_CC_CAMNOC_AXI_RT_CLK>,
+		 <&camcc CAM_CC_CORE_AHB_CLK>,
+		 <&camcc CAM_CC_CPAS_AHB_CLK>,
+		 <&camcc CAM_CC_CPAS_FAST_AHB_CLK>,
+		 <&camcc CAM_CC_CPAS_IFE_0_CLK>,
+		 <&camcc CAM_CC_CPAS_IFE_LITE_CLK>,
+		 <&camcc CAM_CC_CSID_CLK>,
+		 <&camcc CAM_CC_CSID_CSIPHY_RX_CLK>,
+		 <&camcc CAM_CC_CSIPHY0_CLK>,
+		 <&camcc CAM_CC_CSI0PHYTIMER_CLK>,
+		 <&camcc CAM_CC_CSIPHY4_CLK>,
+		 <&camcc CAM_CC_CSI4PHYTIMER_CLK>,
+		 <&gcc GCC_CAMERA_HF_AXI_CLK>,
+		 <&gcc GCC_CAMERA_SF_AXI_CLK>,
+		 <&camcc CAM_CC_IFE_0_CLK>,
+		 <&camcc CAM_CC_IFE_0_FAST_AHB_CLK>,
+		 <&camcc CAM_CC_IFE_LITE_CLK>,
+		 <&camcc CAM_CC_IFE_LITE_AHB_CLK>,
+		 <&camcc CAM_CC_IFE_LITE_CPHY_RX_CLK>,
+		 <&camcc CAM_CC_IFE_LITE_CSID_CLK>;
+
+	clock-names = "camnoc_nrt_axi",
+		      "camnoc_rt_axi",
+		      "core_ahb",
+		      "cpas_ahb",
+		      "cpas_fast_ahb",
+		      "cpas_vfe0",
+		      "cpas_vfe_lite",
+		      "csid",
+		      "csid_csiphy_rx",
+		      "csiphy0",
+		      "csiphy0_timer",
+		      "csiphy4",
+		      "csiphy4_timer",
+		      "gcc_axi_hf",
+		      "gcc_axi_sf",
+		      "vfe0",
+		      "vfe0_fast_ahb",
+		      "vfe_lite",
+		      "vfe_lite_ahb",
+		      "vfe_lite_cphy_rx",
+		      "vfe_lite_csid";
+
+	interrupts = <GIC_SPI 464 IRQ_TYPE_EDGE_RISING>,
+		     <GIC_SPI 466 IRQ_TYPE_EDGE_RISING>,
+		     <GIC_SPI 431 IRQ_TYPE_EDGE_RISING>,
+		     <GIC_SPI 468 IRQ_TYPE_EDGE_RISING>,
+		     <GIC_SPI 359 IRQ_TYPE_EDGE_RISING>,
+		     <GIC_SPI 477 IRQ_TYPE_EDGE_RISING>,
+		     <GIC_SPI 122 IRQ_TYPE_EDGE_RISING>,
+		     <GIC_SPI 465 IRQ_TYPE_EDGE_RISING>,
+		     <GIC_SPI 469 IRQ_TYPE_EDGE_RISING>,
+		     <GIC_SPI 360 IRQ_TYPE_EDGE_RISING>;
+
+	interrupt-names = "csid0",
+			  "csid1",
+			  "csid2",
+			  "csid_lite0",
+			  "csid_lite1",
+			  "csiphy0",
+			  "csiphy4",
+			  "vfe0",
+			  "vfe_lite0",
+			  "vfe_lite1";
+
+	interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+			 &config_noc SLAVE_CAMERA_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
+			<&mmss_noc MASTER_CAMNOC_HF QCOM_ICC_TAG_ALWAYS
+			 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
+			<&mmss_noc MASTER_CAMNOC_SF QCOM_ICC_TAG_ALWAYS
+			 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
+			<&mmss_noc MASTER_CAMNOC_ICP QCOM_ICC_TAG_ALWAYS
+			 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+	interconnect-names = "ahb",
+			     "hf_mnoc",
+			     "sf_mnoc",
+			     "sf_icp_mnoc";
+
+	iommus = <&apps_smmu 0x800 0x60>,
+		 <&apps_smmu 0x860 0x60>,
+		 <&apps_smmu 0x1860 0x60>,
+		 <&apps_smmu 0x18e0 0x00>,
+		 <&apps_smmu 0x19a0 0x20>;
+
+	power-domains = <&camcc CAM_CC_IFE_0_GDSC>,
+			<&camcc CAM_CC_TITAN_TOP_GDSC>;
+	power-domain-names = "ife0",
+			     "top";
+
+	status = "disabled";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
+		port@1 {
+			reg = <1>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+	};
+};
+
 &camcc {
 	compatible = "qcom,x1p42100-camcc";
 };

-- 
2.34.1


