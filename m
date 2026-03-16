Return-Path: <linux-media+bounces-55882-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aLNPCFLUt2n0VgEAu9opvQ
	(envelope-from <linux-media+bounces-55882-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 10:58:42 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 279122978C0
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 10:58:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 710563191D88
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 09:47:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E0A738E5DA;
	Mon, 16 Mar 2026 09:45:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="F52FR0Eh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GcE4tAGG"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67499391513
	for <linux-media@vger.kernel.org>; Mon, 16 Mar 2026 09:45:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773654359; cv=none; b=lQIII/BYp1mf7/qt5iDaT5AaN/TEbu7t9+y90ecyrUrGlnOGHDu5vCbkvsK2oSwIu//zUlycgzkD9axt8/l8NHRXKKN0IcyoLak670lKA8wfGfWhUUKUrgJTusWskjdzmM1yVklGBLQWL5TxXIuQ8p1MMcqfp0y48F72rIIi8bw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773654359; c=relaxed/simple;
	bh=Vpj7XblcOBfhTzLdpL+R0P+2mUUD1VQIJTUYQBBtQPc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mgry+yXbWN1gsTnSIR+09d3NGD8v+IwqEpzkVs97AvXtOmgVGYhb05/Y5yzT/uEc0oFnbLHcQr3bVS3vXUdhsGmq9NJsgX+ULvUDygb0LL0afj4MylXW/LCG81Qy01ikPngn0RBay+5pPreen8b84grVcvIjWuGmeDiWYLE4zww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=F52FR0Eh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GcE4tAGG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62G64hV11724707
	for <linux-media@vger.kernel.org>; Mon, 16 Mar 2026 09:45:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aWPerG47//Rh0t217I+PdOiAOICa6opjKtGqqyPqftY=; b=F52FR0EhvI080Bw6
	ZAJNJx0a8UcwiT3pF4CZaST6zvv6FC8R2WEUPwGU+gRdeFs0uVCgYR0x2hqAuiLq
	GIJPeQG7Jo58rFBq3l6pxK1KOXmL1nNKvQp2X4lK1ud+bBmUI2E1pj7K4OrxUUj8
	EreZJmGtfRbMrEwQsViN3qglzA3t43jI+pdjhZ1Y/0y4aDYlRKhDWWGw6X/9f3gL
	EImt+siXIOQQXUd0q6gCYCKY7EXGXlB2sCDkSi9xP1qBslke5TS+K6Qogxl/lb0F
	fxkLqOuUO8xl6aXBNz+gJU0vXnhRPkgLnhTM2E4mq5EuExlAd303cZSBrKJuyyj8
	uiS9pw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cw0udn036-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 16 Mar 2026 09:45:56 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cd7fc27cf7so2611607785a.1
        for <linux-media@vger.kernel.org>; Mon, 16 Mar 2026 02:45:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773654356; x=1774259156; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aWPerG47//Rh0t217I+PdOiAOICa6opjKtGqqyPqftY=;
        b=GcE4tAGGZeIog+4coq/V6Ug4a1STpB7r7KS6ot5m/8Eskya3G+x9ed7zDcNnKGm9UU
         /dNaG54RwcqZq0SOy6LrOJXiLnUZVVjDXkzCgr//WKnJh+9IvD4QmJApxnQul/Im/oT2
         jMIhWW6qRppXxo6PYJMKg9gYTzCgJPLx7LzAHPX8xXoKQhTTPoss35OO2S7mi24xBqMg
         7tJVhbB0wFnIPIxSfpef9oQNL+8u+rK/p5nxvJxve8dG2DO8xTLpEQlDwQnBBtlGbs2V
         h1oQiDCbGK8D66RiUJmflHJmy91R9DO391hNSpD3Se0Ywm1jqeY03QEl51AR2MzB2DEj
         NDQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773654356; x=1774259156;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=aWPerG47//Rh0t217I+PdOiAOICa6opjKtGqqyPqftY=;
        b=hdhfRyd221sgjBVKXo4Kj0l9E1a+nabVCtRBBwZrW2b1i6ewxYuTLv3L53q6j3sLh1
         XEeRlklYqUwmXFh7S9caDnsFEk0Nrva8E1QAU1fTPkNK2ZCYUYkDvEFRcJpOr328Ror1
         eCVvrUkBnuf09nezOYaweBAlqRrDCasj7h/Fob8CubeHYL8iRkoKyFmR2aLRXo7w3p74
         oPzZdwWeV66ofkClqgVzneVlMtB8fd3EOu6y4t6l3aV9K/b7nkrDpyUiro+0RP6ju3dA
         5B/ifex4BrKazq4Yov7RP1bRuU7H86BkG7yMF6yE8X2Agex6gFTDR+yt21W0+Nto4EDP
         RcYQ==
X-Forwarded-Encrypted: i=1; AJvYcCWLCWGmRATXdy21WFopnqCS0dbwEZ7uVDKpcTsc5arlsxHJH7e6J9HJ7jpi5/5lnawu5Bl3EJ1nRnvPfw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwrTDTjwS26IBCC/FDIxVNhvzjP2zu5q/YV4zKWF1sT1TpNRjzo
	dPsa8wEGZ5Zd5ocyCEliBz6TC0LitJP5qt0g/7i5JD65BypmF9GD+dTY9h77uI/PkF0rLR9hyKH
	vKTIz7DIcYwdf5G8S6RDss1qgq6LqVEeqZcSmgdvApmsTmGxAmUT5938O2Vzg80TLKA==
X-Gm-Gg: ATEYQzx38JjGZYtzjNn8gcMIhHnSjFwGIkXxhLiMeeqP+dFmcl3sSBt2ngtg2p0Oaab
	OuhT5reDHGV83CTyu+asRLvhrieHB2Ozh3TOFM4K1QVpiR5l6GPjM07Fd3xS5+gK+DMDfB8Rh6B
	5u6AvNrqFmOjNaDyrEcbZc0+w/9lxg77QNJNvcZhacaWZcyA2HGFGe02Jm8YVu32MF7QfWi5ioY
	SUoD4bCsLZvUWnBva9S3wjy4GMcYEJhD9kPIq0yWhzGmnoJEIUp6220zclfHdblsNcFy03l6Jyu
	RZ4K/iVnWlMvRcVQVfgzquBXwuXAxT0iBbi2I5LC7kO+bbGVZfVMrJXZ0NOcWivko/9NNZ8iUf6
	8xbSNSgpWOiBdSKcM0wUDAUxMkw6VLdNGwhuOxkBbf41ZNPJWVmW5
X-Received: by 2002:a05:620a:7103:b0:8ca:4288:b163 with SMTP id af79cd13be357-8cdb5a05dbemr1624641685a.17.1773654355877;
        Mon, 16 Mar 2026 02:45:55 -0700 (PDT)
X-Received: by 2002:a05:620a:7103:b0:8ca:4288:b163 with SMTP id af79cd13be357-8cdb5a05dbemr1624637685a.17.1773654355478;
        Mon, 16 Mar 2026 02:45:55 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:ba9e:e504:fb0b:f1f3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48541ab9f9esm503138755e9.4.2026.03.16.02.45.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 02:45:54 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 16 Mar 2026 10:45:26 +0100
Subject: [PATCH v2 6/9] bus: drop unneeded dependency on OF_GPIO
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260316-gpio-of-kconfig-v2-6-de2f4b00a0e4@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=843;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=Vpj7XblcOBfhTzLdpL+R0P+2mUUD1VQIJTUYQBBtQPc=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpt9E/BPk3re52ZJWSY5xhnCOBbXVxjU7260Fk+
 srsoMcqMFmJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCabfRPwAKCRAFnS7L/zaE
 w7ebD/9C5UxsVXbQ5n7GRcwj3aymQcwnmyJt5yL4Rjo3loecX6xlAIkCw6qE4wVvwlikpDiMICH
 Hlu6BqVViA68+gFZjra+HVX4cOzmIN5Etdo2UQVZnpgLkbtFl0aVyfjMXq/KEzefEF1MQ5xW+V0
 8P/5vVxEo/wTwSEUeXu91SjctdqANe9rV+yw8Y7yvO7/VxdJs97L7trXK51vWRpKzzeBGFLwgSM
 6BvxbcfOouG1wqurT5mzb8ndXlGrBBwkK3bL1VwPLaOpprLSCibrFFUHcr/Z+qWyYQOxPjfipIK
 C1PYQRPoXpfYokNYx/wtSlLunVdWAgJUBCbli+AGoHcqL+7B016/ejjMfBXYAMj3ez9oY+Nx2lX
 g63HzmI5tbWpMzltRMaOqJvZ742jn6tUPwfmbzhUwRKb/vZd2F9cQ7xcL5JS5j7QO9OXDQW7Kwb
 bm3sTzDWsRqJLEgbM2zLYkSo5Pm2sUoTFTndNwjNCY1r0+ltSAz2Lty0J+erC8vlj2FyHUIORQu
 4morlORo1RMu3RvdZ1tDEpXN4wof4XKnugvEhbsmPlsYqNKUt5XbyCFJP0/LFquiiQWRfXgPI+i
 Kzs+Uv2OCTkDZo9Oq6IwDVn/idGa4h6W7vMhuxVUixG0QCg5T46K09qvQCgBXcwz06G15PzWuDb
 Pd1gyza78ZAtsXA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=BJ2+bVQG c=1 sm=1 tr=0 ts=69b7d154 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=tMvFuq0QiVTRqkuSJkEA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: 3pABzNTER97nhrI_Dpcc_EBZGrzhTyD1
X-Proofpoint-ORIG-GUID: 3pABzNTER97nhrI_Dpcc_EBZGrzhTyD1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDA3NSBTYWx0ZWRfX7Ue2t2zt52ro
 3xEmzX/eRY/kUoNOy8/N+Pu4qGch4HJmvmWGGPy7P0nbJoXnqa6Boo7jwyogqpsFdE/yP3THoUq
 Wv5nOeuw3qRGUD4CO2Pk2IIT2vLgJUzqcky7eA3BFozzd1PoW4eOSbUqHJsXZagYxn9Noe/Qm7u
 yxuz5/JBl1yasDChJrFT2ZYGRTG3zKv0j3WewdRd3AlznEKshmWU1/WGjed72e1Dy/wAqzT0FfN
 4/qhOl+TMyxFWNqARvHsS48+IhxeRC8jPCanMrtrhEwATjHJ007Q7To0y9lXd6P7MnSv3HWck/A
 DcWX0e1blLfi/M3y28OmRjR8LuTGuRtUwxRnHJzwstyG/+unPOKc/gN4jqadz0CYfbbrb97rizu
 ddEkPVCbqGc0B9r/PrPJ5z4QmNuUqP005xaHfQODjtu7HFT3WnH1E1N861g7mkkS8MxMk2qOxVt
 5SY/XLla8I4HGgOyr3Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_03,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 priorityscore=1501 phishscore=0
 bulkscore=0 impostorscore=0 spamscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603160075
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-55882-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[arm.com,kernel.org,lunn.ch,gmail.com,armlinux.org.uk,davemloft.net,google.com,redhat.com,linux-watchdog.org,roeck-us.net,linuxfoundation.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[28];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 279122978C0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

OF_GPIO is selected automatically on all OF systems. Any symbols it
controls also provide stubs so there's really no reason to select it
explicitly.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/bus/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/bus/Kconfig b/drivers/bus/Kconfig
index 3181d8aa32a3e3ec26935afdbde1ef647f425fd5..e4b1db809187fc5f8b39e3950776df94005476ad 100644
--- a/drivers/bus/Kconfig
+++ b/drivers/bus/Kconfig
@@ -216,7 +216,7 @@ config TI_SYSC
 config TS_NBUS
 	tristate "Technologic Systems NBUS Driver"
 	depends on SOC_IMX28
-	depends on OF_GPIO && PWM
+	depends on PWM
 	help
 	  Driver for the Technologic Systems NBUS which is used to interface
 	  with the peripherals in the FPGA of the TS-4600 SoM.

-- 
2.47.3


