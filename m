Return-Path: <linux-media+bounces-55880-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UNgPMbvTt2n0VgEAu9opvQ
	(envelope-from <linux-media+bounces-55880-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 10:56:11 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 11C0C2977FD
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 10:56:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A62C5305C78D
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 09:46:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D7C9390C96;
	Mon, 16 Mar 2026 09:45:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jNm9uV8w";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Koa7Ox7T"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEC2439021F
	for <linux-media@vger.kernel.org>; Mon, 16 Mar 2026 09:45:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773654354; cv=none; b=KJ/gsjgQlZzKizZV5vNEPtPKwgaBOcSKQINsC/SRqbP63xmzZfHCi9B5sINtdKcxLxLClhntP70GLM/Hdt3lyQXVK/gZHFAOh+M1Z2GH6JQbUmfiWz1Qt4TP1w9AUt87+ym6gPj4o74KVnoO/9BHEGDhi3rd3DhdGOOqCkggXPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773654354; c=relaxed/simple;
	bh=esqrcU2iBVY8ci/hzt1UovcnezFcilbxILgA7vFytvo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VANHyF+CRUnhwcRDFVLd8CJ9jaoHTB8/kUBenk7H0SpCU2AbEr61MU8rCgIvGn3e84TLQMq4FLY0WIKHhDQrN8N6YorB42eJyOeGTuWJvVyAx6koLaXdV50CSL5CDlv0K/AoN1wV1T+gftdLPRt3c4f4GDaAmAq+T5KirUIfvQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jNm9uV8w; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Koa7Ox7T; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62G64fSg663054
	for <linux-media@vger.kernel.org>; Mon, 16 Mar 2026 09:45:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	m25Evgz+upNl8LtXZ2aO7wMuzsie8zywScFsKF98g7Q=; b=jNm9uV8wa7esxl23
	r9DP5HoqaYHcDUIqlxJHYWwY1Fp3Jy6Wi0qaxhB/TZ1RCg/NH1fXtASxjZs8D0rG
	NvE6y938E9UPgqduAJ7tocNKi3+OTDm/wE+wYT6ywH5m9dgZ3srcq3I8+d64pzvU
	svwgMKlCJKEEiOJ7MxFht8CYa2STD7z2OmO1EW/RXaLq6hyxZp62tTeX8xWs1A/H
	95qD7oyG1nHjMJv+CVZmUVNW9yrEC2WGIQdE5WcX7Qze5CIaHqokyJernc4tNBmo
	w7DEh0EurOSrrjn7+E4qw8gA2PAUb1rO5HM5GEfcgqjbsTgVxYLdyeYjTXVn0VAu
	IiL0yw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cw043n2pu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 16 Mar 2026 09:45:51 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cd7774be64so2681663285a.0
        for <linux-media@vger.kernel.org>; Mon, 16 Mar 2026 02:45:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773654351; x=1774259151; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m25Evgz+upNl8LtXZ2aO7wMuzsie8zywScFsKF98g7Q=;
        b=Koa7Ox7TwZSlaIOYMAy4dR9Jw6DESTj45d6sBtCCM9o6cs8QLC4ijrBFsu1CyU+KnB
         Vgz3eiW2JrXqs/Kqi8JpX4Htwh9LCYj8gIPkU9Iy8b+9DwlXpjBpNAJPmDAJwI/bQYMZ
         FZtZ3ETiHFzM6/V7aASNcw24X54c8izsAGzdb08OvgIOa+cHBlLkUKVzn2ut023kwcM4
         CRdjHzPGP0//4JfqR5uI3kBHZ/4OBwwbDB4EcsojzMA92H4t9oZCoD3ErGL82pAyag8y
         u9M7R+WRb2970VphAwN7m4vDWJYcpJURyxx81BshwibVMDiyOi1h9zkZv8DsNgxP5XY9
         kwcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773654351; x=1774259151;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=m25Evgz+upNl8LtXZ2aO7wMuzsie8zywScFsKF98g7Q=;
        b=ZdjGleCJVpenD8hdyZmZAVFyj1/XuhXrQT8VLqWIiMe72lSHbM2wJXwDFMC16pnTRs
         KprFZ1ue5Z/I8gWGR4qCnqJMurbWdL6LnxchyHWCmxEB5fUfoF7D13PB+Jxo7wlIwbBW
         eZtvsD6l2XA44sIiOrwt65czmpetxnVwRvRazxHI0RzmpabzM8YKPWyzlOiYOLdOOawh
         MLxCcDr2vdWe2fJIGaUbdPnNT33obByvj4A7zXjy6Yf7TkJKQBKWnt3Te37Ub4Il9Ctf
         ncbMR05jWr+eaSuh8XCdqmkB0umuBx5TSWOxRPsbfvu07F7zirfPonC7re+MKrB+k6GS
         9NEQ==
X-Forwarded-Encrypted: i=1; AJvYcCXzGzrpcSG0Pu05+6D6hEPHQDAt9Xi5oVljbJ+AFmd/ovsxmpyxEVckAj1KtBSmESOEokcpXC3HFNA38w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyrk0zur81TP85ey99hl3Jjj8sZ8e301lEirpkYsvNnQIKh7+4Z
	vvdmkHrZ4tFM8hCeD9b4YF4HlVPsySWxxvHuVpolmbnkDgXR8SpRF+MTqwhMnGU/oa4nD/3R6vY
	yyIHicWHoPU0/zmpa+B1NEcuVF5k9cqH26BmPU8pKaY398ud/TE6p0SUebAvTVCyHdQ==
X-Gm-Gg: ATEYQzyty4Bvc0n7o+vCOXKA7CQRjUNsPwUdfdiZTFYgVS0+BD4bzkOZJxE0yPP6pbl
	lgODvTsedA/uyTYCAk0683AH/4YXFy0GbwiqdRBEpeTUhq9KNSUcysjsZEcBINJA53EfX46LOSw
	jt7PYTb3jEl+oLxn5CQVXFa/iU3T6UZ9pet0zWpE/R4HWxnpGHEAs+jT4yKgC8vfk3wbVDU59VS
	cWyJKkyLlMQoWKC6R4OVCX0YxIyU/igaWSUlT2meAlqL+btji6bMBSvIN//cQEzuAUqp6BQcssn
	O+uTrUmn4w82L0u15iOjgF2LC7JHjEICfZNyrx8+aFpHkZIf9IayF9K+cTqx1XXE+tCWqMAZYd0
	juIJCcxMyjUkRhkevV5MgY557PAx+89no0feOr9XX5rZgj5Ej0heX
X-Received: by 2002:a05:620a:4153:b0:8cd:91f5:7a29 with SMTP id af79cd13be357-8cdb5b2598emr1635911885a.53.1773654351029;
        Mon, 16 Mar 2026 02:45:51 -0700 (PDT)
X-Received: by 2002:a05:620a:4153:b0:8cd:91f5:7a29 with SMTP id af79cd13be357-8cdb5b2598emr1635907985a.53.1773654350529;
        Mon, 16 Mar 2026 02:45:50 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:ba9e:e504:fb0b:f1f3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48541ab9f9esm503138755e9.4.2026.03.16.02.45.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 02:45:49 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 16 Mar 2026 10:45:24 +0100
Subject: [PATCH v2 4/9] leds: Kconfig: drop unneeded dependency on OF_GPIO
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260316-gpio-of-kconfig-v2-4-de2f4b00a0e4@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=808;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=esqrcU2iBVY8ci/hzt1UovcnezFcilbxILgA7vFytvo=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpt9E8i6aEL4piTNPBuxvNyhkggWe1e3NVYraN7
 Ks7jiQgHs+JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCabfRPAAKCRAFnS7L/zaE
 w/ZAD/9owgYgilZp+MsY55UDQRktGsR/H7gu25ynf1yhU4AxMzntmbgKtI8ceNacGdL80sij1rd
 BC1afcEdcSeocPHYhV8XrTHz09iBj+gnuOx806Aztjp7T2dAIN+2iEIjUM3kaBCEgSnqgV4zQr6
 KP800070rOt+5F9egqM0Lv6yiQUDNMAn8zKj1lHgWzcRAX+/m+tJCaOTvMQ+lfYmN8RwfNOnafG
 cDonwS9X74nEm1gLh3vwBangOT0m6NA/CaV9RZH8/DXyYqAIvvCpV8Jz3U2D1pRdGxSrHe9eRup
 cbjzFzq/LgbVkxDXxoTu4i4o1iNuhn4k1/feicc2rZzuUySztakWwWWSm5acHzKR6Ptz1WMQI89
 Hai2+hXihj3LpxTO/VnuyrqwkfChDWqcIYxw3Vsn9nZdRi4NraVQGY/AjuFi4NDRw8E0I0oIZ0V
 bqrdOjurKqeApM8B3x+pdjk3MGTlDbhn/AQrLzGeiWpOHr5yNZeuN+E8BiBQFvka6LJRALRFKtN
 lpy5tTKnZuANqh+kbu8XfvN1aim+wXkG0r+mrAX66Sm6PuUCfDKrXHz5NKSMBkBfTvAtGmGzu0s
 L0qw3k6k3RvIxBjnOdCxgcNf83bKNrudGRNJ53TXD5F7++vEy53ZASRmatk5lcOn2fdcam0C7NF
 v/S76FvWP49WAfg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDA3NSBTYWx0ZWRfXzwo0azeOQHT9
 pvkMmTm0sjFYYozTdJnfqXNOIqpfsufP8c5/6VrT2a2BJ8hs3um+Ie57rkQZau7t9dVIS14UER6
 hR2Sc9dohk1HwtEM+KOC3gW8yXBd418Mdsvo40jUSU8/soaIqBASP1NM12WtBLhjgMHhCSS7FE5
 cdAUjXCehDol2ne2/vsPTEryDMO0rD8HVoGCWTYc6/y4oy4ODEJA7nmTzihsM56wmOfVMbEvNsE
 BhJJAAdpheFw02P4HQJr3WrhYriI1SGknhuER1yEUt3esRKsceDaTnwBSRHJFudFHJMQvbr9SbT
 H4h+G6e7NvmNE7R2lREhcTRafVGoVO9+WYzoRPoyifcNdjo1eCi/ObNZJZ11nXfpxKj4IJFB40P
 9bQzmevv7NU0kUAcF04RwI8f0huU3l5bn7ipJ+nunndQCzNUxqsVxEUl2V0h3y4d1zfjkWuvUqj
 5lLycHipmiReHl6+gTQ==
X-Proofpoint-GUID: eFxWZ1h69zYUcj5Y6QHjkmlapmibSgZC
X-Authority-Analysis: v=2.4 cv=fLs0HJae c=1 sm=1 tr=0 ts=69b7d14f cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=ULgK7OEL32dECu8VbM0A:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: eFxWZ1h69zYUcj5Y6QHjkmlapmibSgZC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_03,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 suspectscore=0 impostorscore=0 clxscore=1015 adultscore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603160075
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-55880-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[arm.com,kernel.org,lunn.ch,gmail.com,armlinux.org.uk,davemloft.net,google.com,redhat.com,linux-watchdog.org,roeck-us.net,linuxfoundation.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[28];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 11C0C2977FD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

OF_GPIO is selected automatically on all OF systems. Any symbols it
controls also provide stubs so there's really no reason to select it
explicitly.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/leds/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
index 597d7a79c988b35f304e953e873af3afe2ae04b8..f4a0a3c8c8705e0f10ba26584277dbb2d5eac5b5 100644
--- a/drivers/leds/Kconfig
+++ b/drivers/leds/Kconfig
@@ -765,7 +765,6 @@ config LEDS_NETXBIG
 	tristate "LED support for Big Network series LEDs"
 	depends on LEDS_CLASS
 	depends on MACH_KIRKWOOD || COMPILE_TEST
-	depends on OF_GPIO
 	default MACH_KIRKWOOD
 	help
 	  This option enables support for LEDs found on the LaCie 2Big

-- 
2.47.3


