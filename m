Return-Path: <linux-media+bounces-55885-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KL8lNCvTt2n0VgEAu9opvQ
	(envelope-from <linux-media+bounces-55885-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 10:53:47 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 50BC1297724
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 10:53:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 983473087FC0
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 09:48:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27D6F394782;
	Mon, 16 Mar 2026 09:46:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QU0Say8C";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="F0U7Zt33"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1AB338F24C
	for <linux-media@vger.kernel.org>; Mon, 16 Mar 2026 09:46:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773654367; cv=none; b=kqSBU2ix/breWBg/CLJK2b50vD4TfqTDzVurSFlEd+Bg61VTh3npkqiGezNDj/Mb+YLuuJU5N9lOxVy0yp8eIKqnZ/G0KxDxW3jWlEesKi6+CpsDnR597qvFxk4kaLeu3/dnXDGnotj5Wiv1q6UmqNaF1SzlLNcNDIrXmQtJ1H0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773654367; c=relaxed/simple;
	bh=ycfAg3aclT41fsBWRPRsJNKO48Ir9OozAETuIxOc+z0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Nj1+KMNkhtKi/7FTdW/p8aybl8Bfd93eqxwYZTBhc4rmW75msQfIzPibQk1aygJvltoWYHDqn1ajQUxeA9rGv87eg+lP1mCk6RY0nQ9/e1LZ16pFnqVWF5Gicw6JlokATRUDSwQVRuLZv8eyxujQxplf+Cu10bWttL9wZkbnoGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QU0Say8C; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=F0U7Zt33; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62G7muaH041587
	for <linux-media@vger.kernel.org>; Mon, 16 Mar 2026 09:46:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/8M92/apjmq6CGydOBASUnB0p6g0vTHMl9+aCEywdD0=; b=QU0Say8CoQSUyAkp
	JckFVBdAU4zPilowwEhJglY8sfwkbmvrMT9wYno9to0d7PQW1Cy+d8u0vHTri7HK
	l/uwb8jNBeeSBzTtyNeMwYHIcqFVwoouzrAHEbMWW7FrAzvEIMYVLi324lBRPKeB
	SbAPrvftyxr4lIq/U66rVl5Cjmf+P4ArQuPSnWu9BQS2jqxwgBZRypxRIHv0qXqP
	j5GOwAIuIjzdMbd9kc6RcJPgdbzfWHSaj0034I1OMOygbj2gP2sfnW3MqEy0wQ8a
	BkwBEwuC7ys0K4pcY8zWMf6xajJLpY/AuSy9ZJyEMKMuGVRt5vuUpmhsbmORE+A1
	ilYstA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cxdt80dpn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 16 Mar 2026 09:46:04 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50900e9803aso294947141cf.2
        for <linux-media@vger.kernel.org>; Mon, 16 Mar 2026 02:46:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773654364; x=1774259164; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/8M92/apjmq6CGydOBASUnB0p6g0vTHMl9+aCEywdD0=;
        b=F0U7Zt33xch+Wfa6pT2zDbfJZjuld8/O5LDAcCKA4bWp7JIxZR1Tih0ZuZ0Dq3FTZ5
         8Uv8NQiX3nNVjHmJ/LLg+sHqURqAnBAdRbmx+fwokaIWaNfrQtIW6D6W4oVuX5X4OIin
         zZpT3PYCA647KZINtLVkn0MJe9PaVyUwaqmMmN2PUMcl5k67Koa7HMQDYrIrapXJgNS7
         mCTHxRUjB0NCeqZAbPDaEcoZq9aVmc5RIuULBrWdda49BhGhT7iS2xF/1J+0dpbY/3Lv
         T0lz3YrcPTBEwhnjuVgVpnI6ru+4VeltqeHb+JTqx23vWgvKL1HaA4N3W8X+Symida0L
         2pmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773654364; x=1774259164;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/8M92/apjmq6CGydOBASUnB0p6g0vTHMl9+aCEywdD0=;
        b=o58n1qvGNuXvMCw7/m8YSVds5O+J7HtjKSbfyhdFm89mmZX9WCovuiMHanki2fpsKL
         ewy1niRKwYZo7J4gltfaDQBXziofCb/qUxxTa2euWgDyTa8eiwWrO0vlpv9J5oVbxOxx
         TGU1VkGt1cJ0nemQA1vPMJRhhTn/+oGkK6BWNIwVsh+uZ7aDRqNVmCI1gWRmSGJ7uK4d
         RMl9I2KO8zpK5I84HVSKHcIm2cqvSlfZHhHNEdDQWuhqTu19DlH2deuTwEyHXf6gPLnH
         eejjqMDrkJJcOvm6uO9nHulNvLCajndT9fcsQcRqIcDXXhMNqe0wyjx9hxJdCa/ax+ix
         XjjQ==
X-Forwarded-Encrypted: i=1; AJvYcCVM+6RAB1TzKXGApk3qupunN/dt8Sll2UTUV5GtnNnjy8VW/MLD8xOw696SXr92g+YD+BsEZTtvnVwr4Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YyJjGPUJcjElQ1n/9pUbwt5/ObUUOVSRqTX2WuA/MSPmvIixtfR
	Ab1X4dw5t5DZYRprECPrXhYfszLW9TnJLR8RfD+BViFTZ9t2CXdK4we3OLrZztDIXpLXsrwuQaK
	LHunRkAsd8t0sKmfq2CncNK/WXEjvprzVF3ubQtoxnaLkksFDqrbN++8Y6vbZcaRChQ==
X-Gm-Gg: ATEYQzyrdx/vmcsN3GYBOQ1Bv5AI6f4YBb24V7GJZ277MHxLTN7u3wKn/4//FCLMeus
	qdbTmgM7MDN97irCfi8/l7KasWT49oqCZ5nTzYEnXJ9zsehVPFxYwPp7k45MuA08cAPVMrcvkJo
	fldB0Of6XTP1ekjJToOY/Ht/1bWNx6TLwoSlPXiSJmsONh2nhN4qWsGAp0CrV0YUwgJO09TsL4R
	Jul2krTgJEGwCYlFB2/OBwjUicJ3BIx7u30NEaEwGjVXFnJ8WS9C0Cg0xs3m7nhuePPFXHxn17/
	x7mrI/nFtpJRT02jhKn2dBW17zdbYBkOrxERALaAJIZHVJZn4XVgOrJrvDKUjfMMhHcdAX5ZI3G
	MLu+7mf/SgBQELfjX4+KxpLhtbAJ3S8wMm/8bLm254qLTIENBSxeu
X-Received: by 2002:ac8:7d4b:0:b0:509:1795:a7db with SMTP id d75a77b69052e-50957ba91camr166152311cf.6.1773654364247;
        Mon, 16 Mar 2026 02:46:04 -0700 (PDT)
X-Received: by 2002:ac8:7d4b:0:b0:509:1795:a7db with SMTP id d75a77b69052e-50957ba91camr166152101cf.6.1773654363732;
        Mon, 16 Mar 2026 02:46:03 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:ba9e:e504:fb0b:f1f3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48541ab9f9esm503138755e9.4.2026.03.16.02.46.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 02:46:02 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 16 Mar 2026 10:45:29 +0100
Subject: [PATCH v2 9/9] media: i2c: drop unneeded dependencies on OF_GPIO
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260316-gpio-of-kconfig-v2-9-de2f4b00a0e4@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2426;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=ycfAg3aclT41fsBWRPRsJNKO48Ir9OozAETuIxOc+z0=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpt9FCsr+3ySzhvaFrDEu2jlI2ca2/VU0ZuUDRZ
 h/QHOkV8MaJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCabfRQgAKCRAFnS7L/zaE
 w8OSD/4xPlSKe6zDcXWGEo5YW/EA9uYpMpG4PAQmPnTEFzbMr5PpOZXrZzNFIreMNBy2BpYPII0
 FLOfvACMKHBEK/lMJcpdhUIe+a8tPlN/SBSZTqiQwHIETPhjhExIVinaATuY7HLkMDFOQTP0JNC
 J2BqkKFeHcgq3PUcgb9xiRvZoMPCkxnrpRTpXX1y835JSmBnPDReQi6vHK5ADP1/BPutdidnyvH
 9yZ1TYt0ljYws4J7lSHR/WMyOjESwqYlEV69fRKln2E2SAfyf0FntWujUoN/kBchRmLm+n85X4m
 YbbA5PdEEp+/gZnj+Uhc/xsNPFeVN4oM0buYTASV7EXs0LcJMEgtxr6D14oomGSC4KMgGouUlys
 H1oTd+Vuhlz1fdvmKc3+vuHNauM/axnC54bVunevji7HKnidBr5irLbip392znw7aBqbh1vEfEB
 fRxBTPwY3ZNQkwCPLBO4giaehLHs3b2eRR7Tq8X09vWEZTdKNeb57phqFPPRESgjdPh+HLCarEn
 W0ATTNh+lSJ29lS7HwMxD9K/AF/3JWHml4ukBQ9t+4CRoQo7QKNpOBdybXr77GQ8uPjHNfG3Dxe
 5t73cP8z/CU4814/6ae1jBKHAPzcm/YjxFBsAZKehYuWY02UArO7lR+KM0SGGBNTmQxkWquSutP
 kHQ0kr8eTmMfR1Q==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: NsVaOc2AnAozVHtp9R4keSI3yhlcKajM
X-Authority-Analysis: v=2.4 cv=CKInnBrD c=1 sm=1 tr=0 ts=69b7d15c cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=jH2LZSAcktARuhmwcr4A:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: NsVaOc2AnAozVHtp9R4keSI3yhlcKajM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDA3NSBTYWx0ZWRfXzBVxLE9y3Mih
 5Y93XxyQIteMjLBybR0cJr2aESdSsTbuurJheu5GO/FwQvoEo8e0n0ygn+48pKxX1QmilsTeCxN
 12lg3Ck+tC+zy+0ALwYrtW6sxv/XJa+sXcWHbKH2SUWdBO+TwGS8FzHgbN2hQGJ6aPLrisIQkjb
 OKlRUai/+w4iPdQuiX2j/BILOAwrkndS7XsjKY+Qzuc0GX45f8cP8p4dsPk6+fQAOcMo2xV0rwm
 hoKAJKXD/WFZs6tpxC/EIjJxJyf6D8MtR3alHjJAnP4kO6OT3EKOBLIP1YmvHgB4Py1YeQWG/mm
 xJVjvQO7VE2ymuvsIZYWkb2nSS1xs45lVFjjuKnzLCQnluZq/I3mo9ZrXozuEjwz+YM2b2CucdS
 7B652XY9WF1VGU6tSTAYm6bLxzJH47q5gQKcGOPs1NZrLFzjhilDJrLj5+CRXGbrkJxeYUsN9Mh
 VSTHOI4LYA0eYaHWELQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_03,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 adultscore=0 impostorscore=0 suspectscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603160075
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-55885-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[arm.com,kernel.org,lunn.ch,gmail.com,armlinux.org.uk,davemloft.net,google.com,redhat.com,linux-watchdog.org,roeck-us.net,linuxfoundation.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[28];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 50BC1297724
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

OF_GPIO is selected automatically on all OF systems. Any symbols it
controls also provide stubs so there's really no reason to select it
explicitly. For Kconfig entries that have no other dependencies: convert
it to requiring OF to avoid new symbols popping up for everyone in make
config, for others just drop it altogether.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/media/i2c/Kconfig | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
index 20482be35f268221b2a14a73f4cac107fa0ffa93..1bfc7f0f0fffd395c548c8ce36d4e31931efd093 100644
--- a/drivers/media/i2c/Kconfig
+++ b/drivers/media/i2c/Kconfig
@@ -237,7 +237,7 @@ config VIDEO_IMX319
 
 config VIDEO_IMX334
 	tristate "Sony IMX334 sensor support"
-	depends on OF_GPIO
+	depends on OF
 	select V4L2_CCI_I2C
 	help
 	  This is a Video4Linux2 sensor driver for the Sony
@@ -248,7 +248,7 @@ config VIDEO_IMX334
 
 config VIDEO_IMX335
 	tristate "Sony IMX335 sensor support"
-	depends on OF_GPIO
+	depends on OF
 	select V4L2_CCI_I2C
 	help
 	  This is a Video4Linux2 sensor driver for the Sony
@@ -268,7 +268,7 @@ config VIDEO_IMX355
 
 config VIDEO_IMX412
 	tristate "Sony IMX412 sensor support"
-	depends on OF_GPIO
+	depends on OF
 	help
 	  This is a Video4Linux2 sensor driver for the Sony
 	  IMX412 camera.
@@ -278,7 +278,7 @@ config VIDEO_IMX412
 
 config VIDEO_IMX415
 	tristate "Sony IMX415 sensor support"
-	depends on OF_GPIO
+	depends on OF
 	select V4L2_CCI_I2C
 	help
 	  This is a Video4Linux2 sensor driver for the Sony
@@ -690,7 +690,7 @@ config VIDEO_OV8865
 
 config VIDEO_OV9282
 	tristate "OmniVision OV9282 sensor support"
-	depends on OF_GPIO
+	depends on OF
 	select V4L2_CCI_I2C
 	help
 	  This is a Video4Linux2 sensor driver for the OmniVision
@@ -1246,7 +1246,6 @@ config VIDEO_BT866
 config VIDEO_ISL7998X
 	tristate "Intersil ISL7998x video decoder"
 	depends on VIDEO_DEV && I2C
-	depends on OF_GPIO
 	select MEDIA_CONTROLLER
 	select VIDEO_V4L2_SUBDEV_API
 	select V4L2_FWNODE
@@ -1284,7 +1283,6 @@ config VIDEO_MAX9286
 	tristate "Maxim MAX9286 GMSL deserializer support"
 	depends on I2C && I2C_MUX
 	depends on VIDEO_DEV
-	depends on OF_GPIO
 	select V4L2_FWNODE
 	select VIDEO_V4L2_SUBDEV_API
 	select MEDIA_CONTROLLER

-- 
2.47.3


