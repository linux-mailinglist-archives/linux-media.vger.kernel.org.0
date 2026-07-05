Return-Path: <linux-media+bounces-66637-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id XMkMNLGzSmqWGQEAu9opvQ
	(envelope-from <linux-media+bounces-66637-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 05 Jul 2026 21:42:41 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6924370B124
	for <lists+linux-media@lfdr.de>; Sun, 05 Jul 2026 21:42:41 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="Lc/WGFTE";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=gKDe1OP2;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66637-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-66637-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 23BDB302BEA9
	for <lists+linux-media@lfdr.de>; Sun,  5 Jul 2026 19:40:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C57E3A542F;
	Sun,  5 Jul 2026 19:40:50 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 464283A1A23
	for <linux-media@vger.kernel.org>; Sun,  5 Jul 2026 19:40:47 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783280449; cv=none; b=EZsu9qevdCZuWfP9P/rPiPBOkJcLYOuJNFov+dXOM4RI34rBrt7GilIgbbsup1PkpU10Re6shCeVoTx+xcV0h7yFmRoea/rRS+jqViBWTYNpKlCj9IgSFgU8PeV2XwGXh+rEDrbdZiljxvIZ9l3RISDmAYc3vn6qbKxAQGoZluM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783280449; c=relaxed/simple;
	bh=uWGYzLdeRrzr6t0aAVNStOMdR0p2+G904nfPHoPwpPs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aj6CjiKWa1krt66XFCulTfzDDbrGwBQzhYhyFOieHaitre4AZEA/HQHbMQnIommVPpzkoskPl46KYExUgun/MitVHtq5l8P4CdLBTRAMta5pb+isV3nlLv6EBbxsVikWSvTumAhGU47qeuuBYDh2COzybZN2eNsuYIXRIrhUzSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Lc/WGFTE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gKDe1OP2; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 665Hhjgo2326427
	for <linux-media@vger.kernel.org>; Sun, 5 Jul 2026 19:40:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=7OthzF5yzbE
	g8KQGkSEAgoedjCLI4POQTlWuL9KBHJU=; b=Lc/WGFTEsBR6FyBf8pb2q2cTo/S
	IRTkAnMpy4BZluObjv10Ds1+8wWUnkRZLMFnZfxn4lwUf9wNpTCxvblYHfxq/YKl
	Ovc/Cj5jLSEuk8ulecmXZk1CDgTUxGIQtjZKnuWR+K1jUu+ftDDZonwnoZEjSzlk
	ct1xTk+NVIo42IekyeGwdAr5vq+YHarJ6RB16P36dz97W6pvhWCceSyR2czSTYp6
	hSXnIp2oW/ZkZTxzubwpV++50pKMPkSorshnXRFfqderNm50KPgm9F/0EgLX4x+X
	hMm6Gy4Wmztc6y63i7GrlHroXX0TGdaLddDcR9h9VbzCKd2rrL7p6658Gqg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6sgh3csu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sun, 05 Jul 2026 19:40:47 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c88fc985a65so3719798a12.2
        for <linux-media@vger.kernel.org>; Sun, 05 Jul 2026 12:40:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783280446; x=1783885246; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7OthzF5yzbEg8KQGkSEAgoedjCLI4POQTlWuL9KBHJU=;
        b=gKDe1OP2VeZBHb29Tyhk0spYB0JmIjlaM0WTmBM1yBJQhBOf9aEAfK2exn1LVOPmEW
         t4kJI5JbWvo7DnSp0hgIRl4RWIqkD9+3U5qVshADpK4OTBL9FHpl2bQOdUEXUgeyPqdr
         8kPKsWQfcJxQQOftnOh2eJtuGQQ31071Y2jn62GkaOy1+vlsou3sABX4caEqGuvHzOKW
         ns2kVtK4ktPvEWHke6Rx7gSE/FRUcNMXW9zs8/1IZh4kAyQ7Pu6TNfQpy3Hq/ARbyQqK
         EmfE87yx1Oi4kvZWhENXHgShyz/hVyxit+9LLPZMP5iWFa9ik3Bh5lE/KP9OAvYmxxsT
         xdXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783280446; x=1783885246;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7OthzF5yzbEg8KQGkSEAgoedjCLI4POQTlWuL9KBHJU=;
        b=PFhRnQQC+zjwPXkVhlJ+rtWN9rhGDlpapvudCk16F0a6ewaoXKCPVSPcSJCu9LavDZ
         MadWMWhv+z9t2BdqucQ8Qauxyk8Ruz4k5kZPWYGnzRPfe1CHV/CTHXNwGBfx9fXElO/s
         LXLEGj5FGGXisQhwcJ2mO+7Aex5vbioW7ysxjJwYwYkrLh75lkCwiVHXtp9ptkA00rWR
         yVOgO0JXu201pbfqrWPtWM6q2yZF2rgQhieQMs+hzajvkRSglwgrjs03jSJiETzwoGit
         UpcXGpj5Y2rpDnEYlRXZ9VyC+ZPLcV0nFpIMsJFdMgI1D+kvrvexIxFe5zc0DswFoSNy
         vEQg==
X-Forwarded-Encrypted: i=1; AHgh+RpZYDBGlRwlc4Hb8VToczT8Y+lan5bSCKUESsbslHDO2rgIHx/SB1pdgzhVRKDfQM9E67Za5lmpC1PoeQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzKxq/yrtUr55l5L3a+AiS2bPUrfr4nlgSz3+dnvTifB7POJbgx
	a4xKf75cv262ZN1lhhCHdnJeeJEthszqO4g5FJbDJky7WoZ1iM9/9QKDlm35/9ml6N6gGOdi9UJ
	1neSTgXML3I0Ixo2+cvligHNa/ReC8el9R97DN8O0vrMKaU1rM59+35ZTWG3XQ35ZZQ==
X-Gm-Gg: AfdE7cksBPiiVtDGAY86UyRfFIIelqd8VYYGzf+NPSuRfs1XpgPRGl1s2q9rcIIoPoj
	LsYK21VEQs5ekJ1TJWZDneiHCrgAyU78K9ryFHIPxKnAqNLpSxUQExKhjP6FYTjrkmP65u+EQhH
	0KQHTO9tc1xH5YqKdNawn10/jjHVIB9ZGT2ZDwOm0jH2HhRP1Kyo+lwMQqlJBiUTzTp3BWc5ybU
	WF7NTjlAFLswmak6kQflBXnedzhDctPVeE0xBLJhq7GCnGqCswdnR6+mdPhrqGbENlXPDUjhdR3
	qzx64TBQeqSQeqKpeOOJcbYkbQ/+db52GxTgG+qQer3F+t88tjbOgyiHGVwUgmjrPb2v1Zy9vzx
	w2uthCUCB/ZrGBJaB22xT4fW1pNIbg6ewox3gNg==
X-Received: by 2002:a05:6300:2211:b0:3bf:6c08:fb8c with SMTP id adf61e73a8af0-3c03e521435mr7049936637.60.1783280445928;
        Sun, 05 Jul 2026 12:40:45 -0700 (PDT)
X-Received: by 2002:a05:6300:2211:b0:3bf:6c08:fb8c with SMTP id adf61e73a8af0-3c03e521435mr7049907637.60.1783280445455;
        Sun, 05 Jul 2026 12:40:45 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b3c7fa566sm40573417c88.4.2026.07.05.12.40.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 12:40:45 -0700 (PDT)
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
Subject: [PATCH 35/42] ASoC: mediatek: mt8186: Use devm_of_reserved_mem_device_init()
Date: Mon,  6 Jul 2026 01:10:11 +0530
Message-ID: <20260705194019.2565498-3-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260703193855.110619-1-mukesh.ojha@oss.qualcomm.com>
References: <20260703193855.110619-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=bLkm5v+Z c=1 sm=1 tr=0 ts=6a4ab33f cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=YxFYfaw6DuWYmsw8bRUA:9 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA1MDIxMiBTYWx0ZWRfX3iaclTpEfU/V
 Tgi0GCVOAn92Em2UOd+XzVrI0xmwDYBRdwOhHxir/E5stp6x7blCQbnm4gUDqVmWym5kyR6zLKn
 nQVwPQFSw0KFgcCoGWhzg9W6ClMfog4eoUb+VNFSXBBAId3uRe6TE1dd42Dmp5ukQ89ZIp3GxUp
 7JcyaeJimp3Y8Sw9earMr7iHt4xjbstOLntQNS3uNWOiA9FAnS1pYDPNU6e99J7w0gjg93E+W7y
 IrjAz5y5LrLVcOn3FTOfr5ttt8LLl0n3k5nbClrY1cwFpUljH8NgXSVAFrq3xR+IMs3Lv0h5e1G
 ljisDQfqf//DVcVlltz7U+UugT35asU/KF3qws6VJKZAks1zZfnrpQcJoG4OwSPSsgeaIFpVyP4
 hF8cyy4L6MuBe5ykbqn9+DvaMiRK501DcOPGmmRByBY71aHd4Q77TsA1zv+0dvQymT2bbGNGpTO
 bErsFHRVrXbjyFt2MNA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA1MDIxMiBTYWx0ZWRfX+rd1M9c4p1kR
 l2o4u9z70oCTClMZHBcX9lMv5HCi1Ttc7hyIoZ+Ak63zRQT/ZlO32hF3qgPoDoczHyO6cZIOT2S
 Hdt3i6hlSe8XYQajEUhaOGrSYLP3CoY=
X-Proofpoint-ORIG-GUID: 7uXejQlro0OzwPb46wZJZ-sCpSx3azOZ
X-Proofpoint-GUID: 7uXejQlro0OzwPb46wZJZ-sCpSx3azOZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-05_01,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 impostorscore=0 spamscore=0 clxscore=1015
 adultscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607050212
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[mukesh.ojha@oss.qualcomm.com,linux-media@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[20];
	TAGGED_FROM(0.00)[bounces-66637-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:devicetree@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:imx@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:linux-arm-msm@vger.kernel.org,m:linux-aspeed@lists.ozlabs.org,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:linux-mediatek@lists.infradead.org,m:linux-mmc@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:linux-sound@vger.kernel.org,m:linux-staging@lists.linux.dev,m:linux-sunxi@lists.linux.dev,m:linux-tegra@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:openbmc@lists.ozlabs.org,m:sound-open-firmware@alsa-project.org,m:konradybcio@kernel.org,m:mukesh.ojha@oss.qualcomm.com,s:lists@lfdr.de];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6924370B124

Use the devres-managed devm_of_reserved_mem_device_init() to ensure
the reserved memory region is released on device removal, fixing a
missing cleanup in the original code.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 sound/soc/mediatek/mt8186/mt8186-afe-pcm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/mediatek/mt8186/mt8186-afe-pcm.c b/sound/soc/mediatek/mt8186/mt8186-afe-pcm.c
index 44a521c3a610..60576f885acd 100644
--- a/sound/soc/mediatek/mt8186/mt8186-afe-pcm.c
+++ b/sound/soc/mediatek/mt8186/mt8186-afe-pcm.c
@@ -2836,7 +2836,7 @@ static int mt8186_afe_pcm_dev_probe(struct platform_device *pdev)
 	afe_priv = afe->platform_priv;
 	afe->dev = &pdev->dev;
 
-	ret = of_reserved_mem_device_init(dev);
+	ret = devm_of_reserved_mem_device_init(dev);
 	if (ret) {
 		dev_info(dev, "no reserved memory found, pre-allocating buffers instead\n");
 		afe->preallocate_buffers = true;
-- 
2.53.0


