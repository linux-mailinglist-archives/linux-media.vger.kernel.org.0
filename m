Return-Path: <linux-media+bounces-66644-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 3ZaFL7+0SmrbGQEAu9opvQ
	(envelope-from <linux-media+bounces-66644-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 05 Jul 2026 21:47:11 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A69B70B19E
	for <lists+linux-media@lfdr.de>; Sun, 05 Jul 2026 21:47:11 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=LEH8gBGq;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=ZGUYJzWq;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66644-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-66644-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 467723051C79
	for <lists+linux-media@lfdr.de>; Sun,  5 Jul 2026 19:41:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FFF83A6B6C;
	Sun,  5 Jul 2026 19:41:34 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F2653A7F64
	for <linux-media@vger.kernel.org>; Sun,  5 Jul 2026 19:41:32 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783280493; cv=none; b=msY+/nlRthmW8fOdGcTkdwYkKbMH+EBLV+MScySLqMZ47jVgFBZ791/viht5DcwFA4nBn4BHLF5LhaViZtqOclkvkYJe5Bbwh+lOkAZBBASlVgEGZT7FzWINnZRmRVCDj2fjD9omO+17qWnV+L1/ZqxtZnlKB4KUJIk1YZxGLWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783280493; c=relaxed/simple;
	bh=ih+WmqIWK722niQ5u1H1E9UksjJJYkGhr2LClEew4jI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ivfzi5oop4Gqv9m+zJXkLix9AqI2ONAj292XtheawRYv9aBiDPmkb+Q/A+nuiR37on41uuSCAAMoY5O+T50R1Cpc27bXBDGD0YxLd1u4c0qY9r9ebT9Ilxyk3DQ2gsroMMpN+m7/vc/ZpiJv8nBgPrasjI5PEQGk1c6hGXO707A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LEH8gBGq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZGUYJzWq; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 665Hi5V32343696
	for <linux-media@vger.kernel.org>; Sun, 5 Jul 2026 19:41:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	keNlL6A8+I5pnaNawbDLPC3Skjo9l1+hFMmFLmQIfDI=; b=LEH8gBGqre98aZ5S
	R+gXIdM13wWVBKCaHBPzQIy3YO16XtaM2Yeu1rWWcKE8Ahh7phGi5PdgSe6faHYh
	NZ6WuJayU3dm2BjN9bw+VBE+ZM79Gb5/VMy0wrJmVG9PAL4oi/vWr8CCwZvut6LG
	bgx8kYmZdMLIw+hO7G1imKVsWOK46Uaj/pGQFCjPL0CK5llMYjmxUaWFjupRdJAp
	DojiJvRtFxtp1fbC0Y51KdHDxd4iTgLcudGv/2y9joceF7NK21EqPuFhp9vBp/DG
	Mr1h6o1uwl/xqAgXXnlbwqyx/z4fTFXUP1+eeaAFH0RCQyOQiLqKrFrdvXcDdzoo
	l70Dvg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6td3ba40-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sun, 05 Jul 2026 19:41:31 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c88ad1558f4so3633428a12.2
        for <linux-media@vger.kernel.org>; Sun, 05 Jul 2026 12:41:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783280491; x=1783885291; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=keNlL6A8+I5pnaNawbDLPC3Skjo9l1+hFMmFLmQIfDI=;
        b=ZGUYJzWqAxIXzMBhph0O6XZxQ2hb7H/KXvng0K9qR4w7d+q3Sv6K+L43GoWU+lC/eB
         zj6lXNOaefif9INP93rxsaXEdR0CjTrKZGapgon6K1xSO1x1etJ4wLJDdM7oKLYC6UTV
         NRA4nTW/+XQn8Szeb4LL6DdMhYo5n4f3YUhH1g0tSK55IgC0QZ2d/TW+BUga2bVWgSEA
         Qhegor/v/kr8DRMoTs6WRi6UxOrDObS923e3toV/e+RGNIb04oCCQKbCOU1ukU392DNe
         Z7aykGAkOON0r4zSU7b3Oha3Nd22etGk3JptUhC4oSp131Bfdcdkyb4mmUdDOJ2HTRDv
         Zu4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783280491; x=1783885291;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=keNlL6A8+I5pnaNawbDLPC3Skjo9l1+hFMmFLmQIfDI=;
        b=KPVaBjRNeiczcMOHXMO/NF26Mhnhwog2ppEyalMAYTOdyIG0HC7DS72EPt4IsMQXXn
         GHDa3PiRDk87JJenTKlmjQixzGXn0M0wbIBpEHBmi+itniybneGFcFpjJqdzcfbTz27g
         zSzEQpneOTr/A+FiKbuyTEhAQCu7AFMZn3AulEo+b73CYJgiyfelXhOEIkJSv7T+Qctv
         sgxAkoqFliNyLObbdyN1pL5vloLHmCVkUpxp3Jh9qc08boxNQQsb3DISm0T6EmGv6cFK
         CISexTsu/ZdJ4bkKDJlU/fSoO9y/NyBMOifWQLlYTNSwuBjXLaJxE7DgQFkp7qc+udMV
         6TxA==
X-Forwarded-Encrypted: i=1; AHgh+Ro4m/mAtAZZjmPVsP0OR14oDH1SrmfdSK/WCOeVFF+rIAJLzxr0vOzKexXo2stdppSuA0BpmCzSTC4InQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy015qmOBZ+P1zpKOj1zJZRKCp50kGnyHDRy+x9jwbBnah2TNV5
	FPjhJ73WQMpV9PaJ7Qi3cmp1u1W49+/pery4K3/SgR4nHXS60KymSIFrjHpRyDAt8+1xnQf2b0n
	dgzez6cQ7o0JvRzt7Ea3i6b76sWY/QXW7oCEv/1LKSmc1qvEpFScSLjitzawxBps5Dw==
X-Gm-Gg: AfdE7cktSSHqVRnfO6kK1lNSlMPP+6rractZwJtJvPadujocTWvc27tQSWvqgqZ7Zwj
	RjEMY9fgTHb17AEQv6ayqIyR6J9WlrzsK286jxRDl8u5TAMp5frtoKR7vjaV0mHjIPYaIWW1smd
	Hc6f4PvnP8wIad8beQbwmsODvx+hx/IYxGImZpcjs55k/bwxUWX5U3XbTs/o8Km7HkgqyaOzvy7
	7SM37gbcb2WZTGi9qorey7TeX/ooyLNl7/A7whsi012dp/GqRmAjb7GM9BuBfJjzBE/cETVvXQU
	dc5s/n+99XbFmT+tKQPEoABqfROkCc4gTUlB6aUq0J95NME4QtSGFZuvklbpxlU0ztgzunUg0vg
	82SGxq/dTGXky9U0AjyaC0GC3hHJbHd8Avmdx0Q==
X-Received: by 2002:a05:6a21:4cc6:b0:3bf:a0e5:99a5 with SMTP id adf61e73a8af0-3c03e509089mr7554481637.47.1783280490846;
        Sun, 05 Jul 2026 12:41:30 -0700 (PDT)
X-Received: by 2002:a05:6a21:4cc6:b0:3bf:a0e5:99a5 with SMTP id adf61e73a8af0-3c03e509089mr7554455637.47.1783280490326;
        Sun, 05 Jul 2026 12:41:30 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b3c7fa566sm40573417c88.4.2026.07.05.12.41.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 12:41:30 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-mediatek@lists.infradead.org, linux-mmc@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-sound@vger.kernel.org,
        linux-staging@lists.linux.dev, linux-sunxi@lists.linux.dev,
        linux-tegra@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        openbmc@lists.ozlabs.org, sound-open-firmware@alsa-project.org
Cc: Konrad Dybcio <konradybcio@kernel.org>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH 42/42] ASoC: sprd: Use devm_of_reserved_mem_device_init()
Date: Mon,  6 Jul 2026 01:10:18 +0530
Message-ID: <20260705194019.2565498-10-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260703193855.110619-1-mukesh.ojha@oss.qualcomm.com>
References: <20260703193855.110619-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA1MDIxMiBTYWx0ZWRfX6K9/eRtq5u0L
 Ly6+Y6zh3qHEWn6A8MQjnfheSy6Kcb8/LBPWwX6h+7AMpLFHjetZN6Zao5DfsW+4la6UOBOt4nV
 oJL56CCrvhgST9L0/uYUsj/CoJB/CcM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA1MDIxMiBTYWx0ZWRfX7jXrBMlnn7ML
 gspUlEQUxKUSLD+mY3Nlmzy66xWWneIDublX4xTcH065TBWfTKWTLH0nuaj8wqb8Q8IaJ45Gwee
 diERyLLrycgCX9rPdnzqBT6X3PBbapaFVXeS1lTCe3zjJ/rhLfqlIHMLFntVmcOBtwE6cfpaMrZ
 WYmcBXgMUdYs1JVmjQzYgdzdbKH1MepkTKni7/WNWs8qSJDW4pRsRozEBA4aHu3dCh6cswdOF16
 20AWqBYFiIZhZg2k5lBJfvu3+7MvjZfIWfQtDCWerVvqQvuptZkuD0az6xhzhuunhnQyNFYnjvP
 vJ8pwgKzhDGZ2mJrJOXVspN0ARSs1MxazdpV4CTeSEp/cbDfw19ZQ6MGx8vw7ieTEHnvk2v+e5c
 cK15wk+e2ooH+tG/6fvQVjtizfiaMKcX5KIK65kNaUXN4B9dwvRnWdUp4NIYhdhnay1gpEE+2J/
 YrHKNO8pSLp1y6Y9cxw==
X-Proofpoint-GUID: pm5gvqHHmYkPjSBfzIFeUy6QJqy-uU7Y
X-Proofpoint-ORIG-GUID: pm5gvqHHmYkPjSBfzIFeUy6QJqy-uU7Y
X-Authority-Analysis: v=2.4 cv=b9GCJNGx c=1 sm=1 tr=0 ts=6a4ab36b cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=99hAX-h0IAisWkWT3OgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-05_01,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 clxscore=1015
 phishscore=0 malwarescore=0 adultscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607050212
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-66644-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[mukesh.ojha@oss.qualcomm.com,linux-media@vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:devicetree@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:imx@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:linux-arm-msm@vger.kernel.org,m:linux-aspeed@lists.ozlabs.org,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:linux-mediatek@lists.infradead.org,m:linux-mmc@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:linux-sound@vger.kernel.org,m:linux-staging@lists.linux.dev,m:linux-sunxi@lists.linux.dev,m:linux-tegra@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:openbmc@lists.ozlabs.org,m:sound-open-firmware@alsa-project.org,m:konradybcio@kernel.org,m:mukesh.ojha@oss.qualcomm.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1A69B70B19E

Use the devres-managed devm_of_reserved_mem_device_init() to ensure
the reserved memory region is released on device removal, fixing a
missing cleanup — the driver has no remove function. Also drop the
now-unused local variable np.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 sound/soc/sprd/sprd-pcm-dma.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/sound/soc/sprd/sprd-pcm-dma.c b/sound/soc/sprd/sprd-pcm-dma.c
index cbf5bf82d96e..220f55d475af 100644
--- a/sound/soc/sprd/sprd-pcm-dma.c
+++ b/sound/soc/sprd/sprd-pcm-dma.c
@@ -459,10 +459,9 @@ static const struct snd_soc_component_driver sprd_soc_component = {
 
 static int sprd_soc_platform_probe(struct platform_device *pdev)
 {
-	struct device_node *np = pdev->dev.of_node;
 	int ret;
 
-	ret = of_reserved_mem_device_init_by_idx(&pdev->dev, np, 0);
+	ret = devm_of_reserved_mem_device_init(&pdev->dev);
 	if (ret)
 		dev_warn(&pdev->dev,
 			 "no reserved DMA memory for audio platform device\n");
-- 
2.53.0


