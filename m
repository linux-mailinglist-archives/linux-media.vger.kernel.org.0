Return-Path: <linux-media+bounces-55879-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6JxkNOHRt2n0VgEAu9opvQ
	(envelope-from <linux-media+bounces-55879-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 10:48:17 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9985829755C
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 10:48:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0CC3030255F9
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 09:46:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76A2F3909A0;
	Mon, 16 Mar 2026 09:45:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gOnW1Gr2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fEVS+Jk7"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C381538F923
	for <linux-media@vger.kernel.org>; Mon, 16 Mar 2026 09:45:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773654353; cv=none; b=FTmAhm3yFLurdBP3/lPS0Afm8mmiPv5rSqodr2D2OBeRmGnVsRzXyZP54d/zJppdvFjdF86yR1foF/369WCbvB/0X+aDkVm7g7hgj7PLw+xOHKUEdwQEnzHawQeELeVHEpgSNh7ENCl0FJNJelcenA5qmZ2eri6JKtyD8f7fMs8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773654353; c=relaxed/simple;
	bh=4fbp6KU0HzzSL9Nt1PKq3lQF7ufXuCLrwnMnj5C0HYw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HQMDqSpDKIn5v0M1abOO6v4yKpD3l+Z4Tt4ZIZss7zOC9ZRkLRz6JxARhty91QU1P6kOVZZ5vPPJssHKAbwylsfoUPwdol8LkRAFlFpgV2B1FF/71F7/xu5EjntnQsOWWSK6JRZFtMb1vtjtd+/wsi6boYWHeiqrG3VIaWzjC/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gOnW1Gr2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fEVS+Jk7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62G64jNk538903
	for <linux-media@vger.kernel.org>; Mon, 16 Mar 2026 09:45:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WLabK281ljaRm4Q5k6ndGIQLgmuJ6H/0UUBtzqck2mc=; b=gOnW1Gr21MR0c0st
	MopeeI/HR2qvWWFVCUpGzwpAoS/j1cXoCMCyS67cLyaMfqXHBZPH6zN0vJWk14uW
	/VoT0HN419Ngdx+utCOTWnPcQ+D7wjOhjnEuBc+tuAxBXcYsnZVHwlyLoC7699+p
	vrQgrj+IEYr1BuhMyj9iUxa9vf3Z8Om+PtD6EptbVQap1KF8fwAQsoHsfJ3JTHri
	n5U0OnRve6y5jKTGiTxQWNVivGyEXR1gIqN3bftjy3fWDG2dprdScRsWrr6rntvo
	/q3eAoM/fowpIerRemnyQHRetcL4bHjBtzPTbCrXU1RYBeCmQE+Sh2Il7CEoklI8
	irVvVA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cvyy5n30y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 16 Mar 2026 09:45:50 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cd849cd562so2963955085a.0
        for <linux-media@vger.kernel.org>; Mon, 16 Mar 2026 02:45:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773654349; x=1774259149; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WLabK281ljaRm4Q5k6ndGIQLgmuJ6H/0UUBtzqck2mc=;
        b=fEVS+Jk7cWrVpUTw8hEH8ErVW0lOXT0Cz9ERZNe3eBuPeyTQ9d/pXvWzI18iyLS88S
         4NJlw8Va7GlPZ78h5m37N8it8fCg6zaO6z8XXHFBn8vIzXzzo+tlAsV2Ql/wFSpfL29T
         4vdLoKkO0fX55SLtXAKHPx7Ze5f/CgyBAny28yeEKIXQcngvRgCn58Nyhg2+Dp+yzn+A
         CgdE5pehAczu4wZM+dov/CNkc7KNhELR4yNpfvQvQqtnAzxfPk7/80Ik1FKCZefJK4/r
         T8hDdbhsySWPuiOb12DfDk2myHoAh4AF01bDCCCn40q5oW7bb19gzXIMwxK3swKpF9PS
         btMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773654349; x=1774259149;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WLabK281ljaRm4Q5k6ndGIQLgmuJ6H/0UUBtzqck2mc=;
        b=T1IPjwsSmCq40jE6oRA7mM2Sc+ofLEuklq522pAk58ygGICO+4qHAy+O/vCvfIrnOR
         4C5UllYhxghEZuhEjx9to0RtXVSgcxbjFDCeA6IkQqnuuLeY+poZzRk1THfMivXiDDtW
         RBw23ji74oYnuNnzEyFtx5WWiXp0gI89fOxII7LwcWg2DjRLJJ/9eB/afU4iAT0EUOKO
         39aBPkNxHtWrxzU+o4YfPcHh8Fu5kRVJeV09M5HI5LJaWtdnSyputpKjUl/0Lg8rypW2
         Bxopq3AgoYCJj+2boyUWygIb2jzvQBKyOgrc+Q/vFrZoROdJm+YH6XZlB3+PDwH7BnEq
         77PA==
X-Forwarded-Encrypted: i=1; AJvYcCU5g+EZVwTPApaiNx6VOkBGJnIkJiDo2zlA82nvKi8WvFI5OsquA+jluTMecM3vLObzLNq4wj33uc8usA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwL136/yI+G5PnMjM3kaJREDbaBnBo1jZ4mwuGzXvfqeFRPc9DE
	JcHVl9AYq44pxS5VrqBhZTZ1SmRkefQ79Y5WYaCL+wYG/mktqnssGN6KxJcvTO4zuCNnb1w4UZU
	kA3UzgR8GTx73KUY4l799TIj1/uPE8QRwMuuYfIdfKjYMKOr6BNrgP06qhNviOrK0fA==
X-Gm-Gg: ATEYQzzSO4UrSq69LhmIjFkR6ttJ0Drxmi251uhwELmE2Y8a9EXdVYMR6zpcGjMK0Ko
	POJ9+z+7I1G8UDizOUKJgUcL+tbbdoxQnTjjhUuFL0eyuZKC7xUdHooQmFVBI4yu9yNPew8l5cj
	RfaysKuk4Y1SqKcBonplMZPLTLi9lg4fJ/+xqwqMlbKLBIdnT0TWFgn02pUmnvPyzpb/vTLtyVt
	aqAMvf1E6unQkSvFV1FMd6nw3bOfRb+icAoT/kZxgsFKw+eVJDS1AtPsw3wTmWCBn8bfI2+ZX24
	jQf537V33BeLK2lASZIBWnNdvAtMpQDRWYjNhMd9SGqdx4JpmciVgErys1C/UgFa5MJRs6KmCo2
	p95H2/hVR1cnM4zJ74ZvZJbgqNaRYU/lgA4JryKkU5BMp7CWPJ0vr
X-Received: by 2002:a05:620a:4044:b0:8c5:2ce6:dc2 with SMTP id af79cd13be357-8cdb5a54963mr1552520885a.17.1773654348884;
        Mon, 16 Mar 2026 02:45:48 -0700 (PDT)
X-Received: by 2002:a05:620a:4044:b0:8c5:2ce6:dc2 with SMTP id af79cd13be357-8cdb5a54963mr1552518085a.17.1773654348306;
        Mon, 16 Mar 2026 02:45:48 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:ba9e:e504:fb0b:f1f3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48541ab9f9esm503138755e9.4.2026.03.16.02.45.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 02:45:47 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 16 Mar 2026 10:45:23 +0100
Subject: [PATCH v2 3/9] gpio: drop unneeded Kconfig dependencies on OF_GPIO
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260316-gpio-of-kconfig-v2-3-de2f4b00a0e4@oss.qualcomm.com>
References: <20260316-gpio-of-kconfig-v2-0-de2f4b00a0e4@oss.qualcomm.com>
In-Reply-To: <20260316-gpio-of-kconfig-v2-0-de2f4b00a0e4@oss.qualcomm.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
        Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Linus Walleij <linusw@kernel.org>,
        Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Sebastian Reichel <sre@kernel.org>
Cc: brgl@kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-leds@vger.kernel.org,
        linux-watchdog@vger.kernel.org, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev, linux-pm@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=10217;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=4fbp6KU0HzzSL9Nt1PKq3lQF7ufXuCLrwnMnj5C0HYw=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpt9E72wS/2QRzY6ua4fnuXp5Pa0ZmDCGvN7Kw0
 pPgAXLjA5WJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCabfROwAKCRAFnS7L/zaE
 w82VD/wPe/R5EdgCGL5r1clbzEmU1eW8JTPSygYwiq6h6sIxqeH09lWmUl/6jcIIpXZ0MReMmUE
 gBeDme+Trsp+4DOrNnoCXlk7uaOS73yuvnSerY20kkuTYXMAVcDJKs+D9Z6pZxtG4CigywriMLh
 R4s3gdXwzRlhHoO2w8JYm9oFCxzCosuv7/5S2nxuogCCnZ6GE8iq6gwUIr2/wHVUoFPQRsRzEGG
 VihGMeFWWan4Fuboyb3SzuaKSjd5GgVle5J7iEap+PrCg7QAJLiETcLptpMMN/00Z6R5syCS4D4
 WaBI2KO/v3O9TpuQMqaWcQMimPFt3L9YUadVAeTuU6FuzXG24lcNqigs3Aq2j4vuWpGvCj8nNK5
 y3KyHmJTByhpf7b6To2O+na15MpGhaY7VPmBon6TgxXofooRuCvtP2Jf/Vhl74UhqlzfTZgC3sJ
 PcZheudtladAMZ6Zas2Yqc09kvOrZJcVjI5gXjOrrFbfZ+QPMSbGE7QvsGKVfIJmb39Bvr3QdMG
 boZAVGJqzwO+fhrJbZ6UhIaXAoeW+oWyneuvJ2GUxnBm7Kdj0/X6xrzhNP97tzQH8ajdoZ9mSuG
 BbCxLrcxN1+a46LxiDvyUEY0bKle/kF5JZrc1I34SGwAZcx+arnTNUcu4elVbb5C4yxxFDF720k
 HxfRsTBLTdT0gGw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: Ls4aKWeZ74o2OvgoIks1pcsOgsMJ92O6
X-Authority-Analysis: v=2.4 cv=QOxlhwLL c=1 sm=1 tr=0 ts=69b7d14e cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=os9z4gxJ5ke727RypPIA:9 a=r15waxpOa3ezfu1y:21 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: Ls4aKWeZ74o2OvgoIks1pcsOgsMJ92O6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDA3NSBTYWx0ZWRfX4LihT6jhKSLj
 f1hE5TOwdx7uadHwPcDKsi8P+WiOQmjX3i2BofyZTvQhLOUej7rQpHymPOqP4LJPhIx0a+LPt/R
 Sml32s/Q1p5lzNgyOH1WcAdHBYbNiTzxTv0nyiqXxZENdyD0KL3QeroWbifZ4zXad9YnG7FQDAZ
 g3SemfoZsab2/Ywtt6bxMk1NpogNahrzoHLSXIPDJYz0Khx3FLdbKAaXq81CKHUYlErWMoNfECF
 8Mtoho33cVz849AhBvRMRzxFpu3stjJ+JVN7FMHTpl9sSuKCvhhcHGXSre2udzLOuZs/RljIV62
 LG+UXE6nB97kLdyxX5SHpd1uaiPYfLY6g81Ci/XuhEpD+ZuU74sal7B+CH1kF05tY1POM+DMwG0
 4KS7THptmAf0C6lo7Y/ksLGtwG757BqtAqWAKNZNQn2fdrUlcQP0GpheG0v9/r+FkApDNNmkCTd
 Gn6B/fotNpirnBMLhkg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_03,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0
 bulkscore=0 suspectscore=0 clxscore=1015 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603160075
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-55879-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[arm.com,kernel.org,lunn.ch,gmail.com,armlinux.org.uk,davemloft.net,google.com,redhat.com,linux-watchdog.org,roeck-us.net,linuxfoundation.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[28];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 9985829755C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

OF_GPIO is selected automatically on all OF systems. Any symbols it
controls also provide stubs so there's really no reason to select it
explicitly. Remove all Kconfig dependencies/selects for GPIO drivers.
For those that have no other dependencies: convert it to requiring
CONFIG_OF instead to avoid new symbols popping up in make config.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/gpio/Kconfig | 53 +++++++++++++++++-----------------------------------
 1 file changed, 17 insertions(+), 36 deletions(-)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index b45fb799e36c19794e56bbac7539250c09beaeb7..e649384f436e7fdd6ac633d9caad94bbee724439 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -145,7 +145,7 @@ menu "Memory mapped GPIO drivers"
 
 config GPIO_74XX_MMIO
 	tristate "GPIO driver for 74xx-ICs with MMIO access"
-	depends on OF_GPIO
+	depends on OF
 	select GPIO_GENERIC
 	help
 	  Say yes here to support GPIO functionality for 74xx-compatible ICs
@@ -175,14 +175,14 @@ config GPIO_AMDPT
 
 config GPIO_ASPEED
 	tristate "Aspeed GPIO support"
-	depends on (ARCH_ASPEED || COMPILE_TEST) && OF_GPIO
+	depends on ARCH_ASPEED || COMPILE_TEST
 	select GPIOLIB_IRQCHIP
 	help
 	  Say Y here to support Aspeed AST2400 and AST2500 GPIO controllers.
 
 config GPIO_ASPEED_SGPIO
 	bool "Aspeed SGPIO support"
-	depends on (ARCH_ASPEED || COMPILE_TEST) && OF_GPIO
+	depends on ARCH_ASPEED || COMPILE_TEST
 	select GPIO_GENERIC
 	select GPIOLIB_IRQCHIP
 	help
@@ -201,7 +201,6 @@ config GPIO_ATH79
 config GPIO_RASPBERRYPI_EXP
 	tristate "Raspberry Pi 3 GPIO Expander"
 	default RASPBERRYPI_FIRMWARE
-	depends on OF_GPIO
 	# Make sure not 'y' when RASPBERRYPI_FIRMWARE is 'm'. This can only
 	# happen when COMPILE_TEST=y, hence the added !RASPBERRYPI_FIRMWARE.
 	depends on (ARCH_BCM2835 && RASPBERRYPI_FIRMWARE) || (COMPILE_TEST && !RASPBERRYPI_FIRMWARE)
@@ -218,7 +217,7 @@ config GPIO_BCM_KONA
 
 config GPIO_BCM_XGS_IPROC
 	tristate "BRCM XGS iProc GPIO support"
-	depends on OF_GPIO && (ARCH_BCM_IPROC || COMPILE_TEST)
+	depends on ARCH_BCM_IPROC || COMPILE_TEST
 	select GPIO_GENERIC
 	select GPIOLIB_IRQCHIP
 	default ARCH_BCM_IPROC
@@ -229,7 +228,6 @@ config GPIO_BLZP1600
 	tristate "Blaize BLZP1600 GPIO support"
 	default y if ARCH_BLAIZE
 	depends on ARCH_BLAIZE || COMPILE_TEST
-	depends on OF_GPIO
 	select GPIO_GENERIC
 	select GPIOLIB_IRQCHIP
 	help
@@ -240,7 +238,7 @@ config GPIO_BLZP1600
 config GPIO_BRCMSTB
 	tristate "BRCMSTB GPIO support"
 	default y if (ARCH_BRCMSTB || BMIPS_GENERIC)
-	depends on OF_GPIO && (ARCH_BRCMSTB || ARCH_BCM2835 || BMIPS_GENERIC || COMPILE_TEST)
+	depends on ARCH_BRCMSTB || ARCH_BCM2835 || BMIPS_GENERIC || COMPILE_TEST
 	select GPIO_GENERIC
 	select IRQ_DOMAIN
 	help
@@ -248,7 +246,7 @@ config GPIO_BRCMSTB
 
 config GPIO_CADENCE
 	tristate "Cadence GPIO support"
-	depends on OF_GPIO
+	depends on OF
 	select GPIO_GENERIC
 	select GPIOLIB_IRQCHIP
 	help
@@ -280,14 +278,13 @@ config GPIO_DWAPB
 config GPIO_EIC_SPRD
 	tristate "Spreadtrum EIC support"
 	depends on ARCH_SPRD || COMPILE_TEST
-	depends on OF_GPIO
 	select GPIOLIB_IRQCHIP
 	help
 	  Say yes here to support Spreadtrum EIC device.
 
 config GPIO_EM
 	tristate "Emma Mobile GPIO"
-	depends on (ARCH_EMEV2 || COMPILE_TEST) && OF_GPIO
+	depends on ARCH_EMEV2 || COMPILE_TEST
 	help
 	  Say yes here to support GPIO on Renesas Emma Mobile SoCs.
 
@@ -329,7 +326,7 @@ config GPIO_GE_FPGA
 
 config GPIO_FTGPIO010
 	bool "Faraday FTGPIO010 GPIO"
-	depends on OF_GPIO
+	depends on OF
 	select GPIO_GENERIC
 	select GPIOLIB_IRQCHIP
 	default (ARCH_GEMINI || ARCH_MOXART)
@@ -383,7 +380,7 @@ config GPIO_HISI
 
 config GPIO_HLWD
 	tristate "Nintendo Wii (Hollywood) GPIO"
-	depends on OF_GPIO
+	depends on OF
 	select GPIO_GENERIC
 	select GPIOLIB_IRQCHIP
 	help
@@ -434,7 +431,6 @@ config GPIO_LOONGSON
 config GPIO_LOONGSON_64BIT
 	tristate "Loongson 64 bit GPIO support"
 	depends on LOONGARCH || COMPILE_TEST
-	depends on OF_GPIO
 	select GPIO_GENERIC
 	select GPIOLIB_IRQCHIP
 	help
@@ -447,7 +443,7 @@ config GPIO_LOONGSON_64BIT
 config GPIO_LPC18XX
 	tristate "NXP LPC18XX/43XX GPIO support"
 	default y if ARCH_LPC18XX
-	depends on OF_GPIO && (ARCH_LPC18XX || COMPILE_TEST)
+	depends on ARCH_LPC18XX || COMPILE_TEST
 	select IRQ_DOMAIN_HIERARCHY
 	select GPIOLIB_IRQCHIP
 	help
@@ -456,7 +452,7 @@ config GPIO_LPC18XX
 
 config GPIO_LPC32XX
 	tristate "NXP LPC32XX GPIO support"
-	depends on OF_GPIO && (ARCH_LPC32XX || COMPILE_TEST)
+	depends on ARCH_LPC32XX || COMPILE_TEST
 	help
 	  Select this option to enable GPIO driver for
 	  NXP LPC32XX devices.
@@ -499,7 +495,6 @@ config GPIO_MPC8XXX
 config GPIO_MT7621
 	bool "Mediatek MT7621 GPIO Support"
 	depends on SOC_MT7620 || SOC_MT7621 || COMPILE_TEST
-	depends on OF_GPIO
 	select GPIO_GENERIC
 	select GPIOLIB_IRQCHIP
 	help
@@ -592,7 +587,6 @@ config GPIO_RCAR
 config GPIO_RDA
 	bool "RDA Micro GPIO controller support"
 	depends on ARCH_RDA || COMPILE_TEST
-	depends on OF_GPIO
 	select GPIO_GENERIC
 	select GPIOLIB_IRQCHIP
 	help
@@ -642,7 +636,6 @@ config GPIO_RTD
 config GPIO_SAMA5D2_PIOBU
 	tristate "SAMA5D2 PIOBU GPIO support"
 	depends on MFD_SYSCON
-	depends on OF_GPIO
 	depends on ARCH_AT91 || COMPILE_TEST
 	select GPIO_SYSCON
 	help
@@ -654,7 +647,7 @@ config GPIO_SAMA5D2_PIOBU
 
 config GPIO_SIFIVE
 	tristate "SiFive GPIO support"
-	depends on OF_GPIO
+	depends on OF
 	select IRQ_DOMAIN_HIERARCHY
 	select GPIO_GENERIC
 	select GPIOLIB_IRQCHIP
@@ -673,7 +666,6 @@ config GPIO_SIOX
 config GPIO_SNPS_CREG
 	bool "Synopsys GPIO via CREG (Control REGisters) driver"
 	depends on ARC || COMPILE_TEST
-	depends on OF_GPIO
 	help
 	  This driver supports GPIOs via CREG on various Synopsys SoCs.
 	  This is a single-register MMIO GPIO driver for complex cases
@@ -683,7 +675,6 @@ config GPIO_SNPS_CREG
 config GPIO_SPACEMIT_K1
 	tristate "SPACEMIT K1 GPIO support"
 	depends on ARCH_SPACEMIT || COMPILE_TEST
-	depends on OF_GPIO
 	select GPIO_GENERIC
 	select GPIOLIB_IRQCHIP
 	help
@@ -699,7 +690,6 @@ config GPIO_SPEAR_SPICS
 config GPIO_SPRD
 	tristate "Spreadtrum GPIO support"
 	depends on ARCH_SPRD || COMPILE_TEST
-	depends on OF_GPIO
 	select GPIOLIB_IRQCHIP
 	help
 	  Say yes here to support Spreadtrum GPIO device.
@@ -707,7 +697,6 @@ config GPIO_SPRD
 config GPIO_STP_XWAY
 	bool "XWAY STP GPIOs"
 	depends on SOC_XWAY || COMPILE_TEST
-	depends on OF_GPIO
 	help
 	  This enables support for the Serial To Parallel (STP) unit found on
 	  XWAY SoC. The STP allows the SoC to drive a shift registers cascade,
@@ -742,7 +731,6 @@ config GPIO_TEGRA
 	tristate "NVIDIA Tegra GPIO support"
 	default ARCH_TEGRA
 	depends on ARCH_TEGRA || COMPILE_TEST
-	depends on OF_GPIO
 	select GPIOLIB_IRQCHIP
 	select IRQ_DOMAIN_HIERARCHY
 	help
@@ -752,7 +740,6 @@ config GPIO_TEGRA186
 	tristate "NVIDIA Tegra186 GPIO support"
 	default ARCH_TEGRA_186_SOC || ARCH_TEGRA_194_SOC || ARCH_TEGRA_234_SOC
 	depends on ARCH_TEGRA_186_SOC || ARCH_TEGRA_194_SOC || ARCH_TEGRA_234_SOC || COMPILE_TEST
-	depends on OF_GPIO
 	select GPIOLIB_IRQCHIP
 	select IRQ_DOMAIN_HIERARCHY
 	help
@@ -760,7 +747,6 @@ config GPIO_TEGRA186
 
 config GPIO_TS4800
 	tristate "TS-4800 DIO blocks and compatibles"
-	depends on OF_GPIO
 	depends on SOC_IMX51 || COMPILE_TEST
 	select GPIO_GENERIC
 	help
@@ -780,7 +766,6 @@ config GPIO_THUNDERX
 config GPIO_UNIPHIER
 	tristate "UniPhier GPIO support"
 	depends on ARCH_UNIPHIER || COMPILE_TEST
-	depends on OF_GPIO
 	select IRQ_DOMAIN_HIERARCHY
 	help
 	  Say yes here to support UniPhier GPIOs.
@@ -797,7 +782,6 @@ config GPIO_VF610
 config GPIO_VISCONTI
 	tristate "Toshiba Visconti GPIO support"
 	depends on ARCH_VISCONTI || COMPILE_TEST
-	depends on OF_GPIO
 	select GPIOLIB_IRQCHIP
 	select GPIO_GENERIC
 	select IRQ_DOMAIN_HIERARCHY
@@ -806,14 +790,14 @@ config GPIO_VISCONTI
 
 config GPIO_WCD934X
 	tristate "Qualcomm Technologies Inc WCD9340/WCD9341 GPIO controller driver"
-	depends on MFD_WCD934X && OF_GPIO
+	depends on MFD_WCD934X
 	help
          This driver is to support GPIO block found on the Qualcomm Technologies
 	 Inc WCD9340/WCD9341 Audio Codec.
 
 config GPIO_XGENE
 	bool "APM X-Gene GPIO controller support"
-	depends on ARM64 && OF_GPIO
+	depends on ARM64
 	help
 	  This driver is to support the GPIO block within the APM X-Gene SoC
 	  platform's generic flash controller. The GPIO pins are muxed with
@@ -1111,7 +1095,7 @@ menu "I2C GPIO expanders"
 
 config GPIO_ADNP
 	tristate "Avionic Design N-bit GPIO expander"
-	depends on OF_GPIO
+	depends on OF
 	select GPIOLIB_IRQCHIP
 	help
 	  This option enables support for N GPIOs found on Avionic Design
@@ -1144,7 +1128,7 @@ config GPIO_DS4520
 
 config GPIO_GW_PLD
 	tristate "Gateworks PLD GPIO Expander"
-	depends on OF_GPIO
+	depends on OF
 	help
 	  Say yes here to provide access to the Gateworks I2C PLD GPIO
 	  Expander. This is used at least on the Cambria GW2358-4.
@@ -1567,7 +1551,6 @@ config GPIO_PALMAS
 config GPIO_PMIC_EIC_SPRD
 	tristate "Spreadtrum PMIC EIC support"
 	depends on MFD_SC27XX_PMIC || COMPILE_TEST
-	depends on OF_GPIO
 	select GPIOLIB_IRQCHIP
 	help
 	  Say yes here to support Spreadtrum PMIC EIC device.
@@ -1606,7 +1589,6 @@ config GPIO_SL28CPLD
 config GPIO_STMPE
 	tristate "STMPE GPIOs"
 	depends on MFD_STMPE
-	depends on OF_GPIO
 	select GPIOLIB_IRQCHIP
 	help
 	  This enables support for the GPIOs found on the STMPE I/O
@@ -1615,7 +1597,6 @@ config GPIO_STMPE
 config GPIO_TC3589X
 	bool "TC3589X GPIOs"
 	depends on MFD_TC3589X
-	depends on OF_GPIO
 	select GPIOLIB_IRQCHIP
 	help
 	  This enables support for the GPIOs found on the TC3589X
@@ -2005,7 +1986,7 @@ config GPIO_LATCH
 
 config GPIO_LINE_MUX
 	tristate "GPIO line mux driver"
-	depends on OF_GPIO
+	depends on OF
 	select MULTIPLEXER
 	help
 	  Say Y here to support the GPIO line mux, which can provide virtual

-- 
2.47.3


