Return-Path: <linux-media+bounces-66639-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 6U8aBDO0Smq1GQEAu9opvQ
	(envelope-from <linux-media+bounces-66639-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 05 Jul 2026 21:44:51 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 34DF670B15E
	for <lists+linux-media@lfdr.de>; Sun, 05 Jul 2026 21:44:50 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=hPcw2XE0;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Ki4huXFc;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66639-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-66639-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 20722303D2C8
	for <lists+linux-media@lfdr.de>; Sun,  5 Jul 2026 19:41:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B3B22FFF8D;
	Sun,  5 Jul 2026 19:41:03 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD72F3A2544
	for <linux-media@vger.kernel.org>; Sun,  5 Jul 2026 19:41:00 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783280462; cv=none; b=IPzHaxeqb2m0WSJgo873YTZZtypV5KbmStPA360K+u77XUn9QzIKuMJPT0de/45Dh8nHkhp0AzMXiIVgYreOBNR+GcTyarDNKbaTFzJAa/adcS4tCyr6Oye/VXGzf9+WLvHTY7KFoliexabn2CsPdupoR066OQfxhLyqCxKTcUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783280462; c=relaxed/simple;
	bh=v3ifKCsrwDtuvCvlwDYadGM1Uonf2WH1mckdOsVySyc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mCDohNsk1CBhw85GIsByk7tqasDH+DDydu4ez4BSr3aIbHPXq0cxl5ir9NYLNdUIy9XZfT1BWPyB2sOKRNioHbUhwHSY8JzpPVn5GyWcg/ZcU/w1PtiqRomXd7ocam1Pu+pN5WtoA0fpn8Xas+uAQkzkBwQ5N2l/DSPBgpG/0+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hPcw2XE0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ki4huXFc; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 665HiSm32343306
	for <linux-media@vger.kernel.org>; Sun, 5 Jul 2026 19:41:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=3J7+oNMk7WM
	Q4KOiVM1+PpfhqlleI9nCGCg735LegyU=; b=hPcw2XE00hJiXGUlPJdzgAHVQzT
	3IKBxTpsdM3YltXY0Gb00tp8cyyqr2jLji+CKNDBWau5JTu+BreuyR01af4GFyfv
	ngpGWe//C62ZWMgkGJk4zSl0S0wOJ9lpQw3JAKnLg2fIs5pZCB7N4aamjssEjqJr
	56eMgt2RR1Wu9uGyx458onBujfZX4GqD+UxQKYZvfMFk6K6CooiLxTXLejKO9W0R
	0jkXD7cR55aEXj06BsfreVAtJNhMuxZgvDsgw5Rbn8a2yz3zzklaCOw3S6PIDyNi
	LSZAc2ZKjYucaa8JgIZQNxudHkYVpBDXyT4e5CmqkA1zH01od7f0TWn9fNw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6srvkbvh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sun, 05 Jul 2026 19:40:59 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cca5e0a0c9so1029505ad.1
        for <linux-media@vger.kernel.org>; Sun, 05 Jul 2026 12:40:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783280459; x=1783885259; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3J7+oNMk7WMQ4KOiVM1+PpfhqlleI9nCGCg735LegyU=;
        b=Ki4huXFcopiUnCi55PmHll9dN0enRKHhl3SR+texrrDbfxFUA7YcAbqswPPFZUR5Hu
         trTCi/r+LieHmgndCX+yybgp2kntxcI/sTt9zQ0ci3nSkdKplKgU8nMY9wZZH+RQmkkM
         6pQz1v/onmqnWmZ4W/bUhgIHDYJkAXQIDT/f9/fFD9fFly0DZVgxPG/UmzOjzRmybFIl
         6uk0k/wuONSStO8paHob0mxdQ2hOXYbS2j+Wm7AJArNYgZEV3n6JEZ260E4SB54cpCRV
         H6T1VsK/F9uPAAeOpQVxJTA8I3T0zjEUsZsjjr6xqBs/3Ljk03DYGzkvU0NwQxWZz/dh
         7itw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783280459; x=1783885259;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3J7+oNMk7WMQ4KOiVM1+PpfhqlleI9nCGCg735LegyU=;
        b=o+8v8QGL17A08ymZWnethtIfFbxXipLrq2IfPK/3d3aAhHhsADDohKmmUb9du1sFIT
         t1D0GMpUEyZKIqyp1jU2kUtZzvtwBvixFcAgqfcCnSj+Ip6koEi2aMrxqoFjpAAY7Hp1
         aPKMKTm7i7LSlW5BuXepjXl3QUc/SGPX3Im02Z/n3i2lL3w/cHR6iNjF7bYdh+Kd8TI/
         mSrMWFmu7S8ozgj0uGyr5XIUV7TTUmLpdVIUkFICh4xQshs9e0MGD9Vu2kMef6ZrTKln
         58vrnjcvYGlke+hT1C63GUJsStQQ+alOX1I/csvJQTYL1a9isWN5VXe7uwJeV6xs0dck
         e5Ng==
X-Forwarded-Encrypted: i=1; AHgh+RqW7F/4oP9ISZX38xOKYpKn8AgBIPrErkSKB0OWvNnsRfT+jQMrdNCNVFjykLxyL3Or6TQl4HrkzipnDQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1ZcIl0BCUvxmvXH6Wfq5u5Bfrsg13WAYKgrdxrSphx/lYzi0V
	1PjggJ4fKO2IDayAaiYdIx+wfG1BKLifg8AlxZv/NngFzMu59dDuSKzBLknRsDQatkXcwSUwBbC
	UhWiz8QFKuilxHx3+ErnMDT+DdknqySeMahQuZ+VoxFC/gGlwyO7i+VKnM1Eh99LmXQ==
X-Gm-Gg: AfdE7ckGhyzYwirBZHPuXCn9hZRfteiP5fb2QOXTO+yv/cSitxuvMFVNWJpdqwBb1kf
	ePhm6BE2DEY87ArIQ6QW7TylxQeH06Cdl6FLBx/SweUpLTioQkSwHzz+pRN3ghQkyoy77NM545c
	jcqCKwMvbZ9KiD/3ferYWRmoqG6pG5yyr767IyFCg433x7PoZ17cJa1uOgQWzh+G0Z63v6EMGkE
	ce6Rzpy85dGLFVbioeluq/i1kpTBAdyPgXP4kVfOEOVpntNbf1+w2oL/MTtVk9Hu2oLaANbb1E5
	XsNzWI/cslIB0B+pEJ2YsbV6cZ1ef1CgvMHFAl2Whz52DdTD6rm2vSA1wRo+IX2ZSgScCs9oXSk
	vt5RBM9/yBz1t8hd+JttTTNSYPOTT6SKXBoWIRQ==
X-Received: by 2002:a17:902:db05:b0:2c8:1f1e:6922 with SMTP id d9443c01a7336-2cbb9ee11admr72369455ad.37.1783280458796;
        Sun, 05 Jul 2026 12:40:58 -0700 (PDT)
X-Received: by 2002:a17:902:db05:b0:2c8:1f1e:6922 with SMTP id d9443c01a7336-2cbb9ee11admr72369145ad.37.1783280458256;
        Sun, 05 Jul 2026 12:40:58 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b3c7fa566sm40573417c88.4.2026.07.05.12.40.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 12:40:58 -0700 (PDT)
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
Subject: [PATCH 37/42] ASoC: mediatek: mt8195: Use devm_of_reserved_mem_device_init()
Date: Mon,  6 Jul 2026 01:10:13 +0530
Message-ID: <20260705194019.2565498-5-mukesh.ojha@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=TcamcxQh c=1 sm=1 tr=0 ts=6a4ab34b cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=FVZLpNCcgjzkSGVc8gUA:9 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: REO8toKL_Cns-RKqyho5bdB9z7bFCTzA
X-Proofpoint-GUID: REO8toKL_Cns-RKqyho5bdB9z7bFCTzA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA1MDIxMiBTYWx0ZWRfX12WIKjLaeqle
 8fFCo0gQ6+JXELc1ISL2U9+b+Z6c1reZMXf5wFIeIXf1QdR01ZR+rwXUAs9ky53k03lT4irDVFQ
 lQbbcYnYMBzLgyVd7tqMUO51imluJ3ShIqL1O0qRKn4OgL+ZCx7jvbVx4p9roCS+BqAvTRTdZ72
 iQ+yh7WJh0rr0ySRP7sxRg0SkDshu3V+CbY2M6aU6F9skIQ0Q1aJdnNjVzmQnHI8QhIsnhfBiOR
 lYKO8vZhhRs3S8IUxOJBJDd8mS7beJMWDF/oiHX+nrEXCIe6BBzE79v/b4lGDddyb5FMwNqa/q+
 qNB7JeVfaFs1MvMVnM5GC7u7qEQdwhYwSz5Q1ImNKPsUnRktZzlvpSDsPnDoJFKpBVCJeAPXDT+
 orn+kzRTXSazmOXsXbQ4Zq2QxKUDQ93GI7UvllFIlqyr9fb5FsnbRxxvDs3vgXvcKMTGsFvT7So
 poW5mm1QLST2E141SNw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA1MDIxMiBTYWx0ZWRfX+AA7BTrAL6E7
 R8nGkWLNClgWR5cfLVUttK4dHqY2j3inbg2hSx46dwcNm7IK2ZEY31sGr64I4+ersUOE+8SKyDh
 kquuDfGLqhzNXJ1I1ANtdCP8/hLQnHE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-05_01,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 suspectscore=0 bulkscore=0 phishscore=0
 impostorscore=0 adultscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[mukesh.ojha@oss.qualcomm.com,linux-media@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[20];
	TAGGED_FROM(0.00)[bounces-66639-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:devicetree@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:imx@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:linux-arm-msm@vger.kernel.org,m:linux-aspeed@lists.ozlabs.org,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:linux-mediatek@lists.infradead.org,m:linux-mmc@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:linux-sound@vger.kernel.org,m:linux-staging@lists.linux.dev,m:linux-sunxi@lists.linux.dev,m:linux-tegra@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:openbmc@lists.ozlabs.org,m:sound-open-firmware@alsa-project.org,m:konradybcio@kernel.org,m:mukesh.ojha@oss.qualcomm.com,s:lists@lfdr.de];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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
X-Rspamd-Queue-Id: 34DF670B15E

Use the devres-managed devm_of_reserved_mem_device_init() to ensure
the reserved memory region is released on device removal, fixing a
missing cleanup in the original code.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 sound/soc/mediatek/mt8195/mt8195-afe-pcm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c b/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
index bc0a63457cd7..52c3381e6766 100644
--- a/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
+++ b/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
@@ -3013,7 +3013,7 @@ static int mt8195_afe_pcm_dev_probe(struct platform_device *pdev)
 	struct reset_control *rstc;
 	int i, irq_id, ret;
 
-	ret = of_reserved_mem_device_init(dev);
+	ret = devm_of_reserved_mem_device_init(dev);
 	if (ret)
 		return dev_err_probe(dev, ret, "failed to assign memory region\n");
 
-- 
2.53.0


