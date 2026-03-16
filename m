Return-Path: <linux-media+bounces-55884-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qEZlJGLTt2n0VgEAu9opvQ
	(envelope-from <linux-media+bounces-55884-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 10:54:42 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EC0A297768
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 10:54:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9B3FA307751B
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 09:47:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CD293932ED;
	Mon, 16 Mar 2026 09:46:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MmRWhV8p";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IIlDKoq4"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 231F839150E
	for <linux-media@vger.kernel.org>; Mon, 16 Mar 2026 09:46:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773654364; cv=none; b=CsMF9HtyIZxVkvXuYPVkWrXKW323nyobRE1WEUEv0oAST3xtUv+Fk7msQqTFSa6v5DRNJIjCIG9VNq71QeszX8qayFY9q5gez+1Uur7r8Z/2ZIwdztKB5HnaeR4cHw1lnHKgJKTgTqP1p37EUEArS9KfjMPXOaGQh9XRl0HbB0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773654364; c=relaxed/simple;
	bh=N/KccnxICgrK3rI/2fd0AqdTwq45Oh63UAkAjH8PkgY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RJpjxZ6Bk+oGR/2rbQ4D1qo5nbEcPBrFm8PfWmTxN5atUQJkD3vrsEvxNDQqVD6Y71QhObnnzjfS/2TU0vWLny93BSbPNIfCNmBl5dFUBM8JTgL5l/KfJWCeAe1hOwTaizvPCuX64fwTzZHGtKb1Na+hAAn+cinX+eNZmprC2Gc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MmRWhV8p; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IIlDKoq4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62G64luA538989
	for <linux-media@vger.kernel.org>; Mon, 16 Mar 2026 09:46:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HvHWdMGL2qhQtG+yXiw7hgmpA7lCBBYNzpbwEI5vSeI=; b=MmRWhV8pxvq6yPAM
	Yg5E1WSc+BeQb4tX+XvJ2iUF3BjbIcU0ZH5WZLOgUYzAYRw/7eeCdhMbin4qtwWh
	FchyrhgzJ+vAGzFhWchYm7iXBPYgZCUgKcoV0dRKlibhTWrrrWrtiNvgo5KmeefG
	VyWfmOrp0y9G8UxLUetK4NviyuVlCozyEXASZgn6F0/SbZpHTJ0kB7KSGd/Nj2sd
	f+8xePkvt3dAR3HVM6WGKN6ZiMAKk+hazqGJYmUxIcbnwW8dctw1bI0zs3OfOxPh
	adpbDRI40qYCMnj/kEJEL01743iHjrrMuxU41dAps/QAazGcbWS13bGGXTwOPdTC
	X8ElmQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cvyy5n31v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 16 Mar 2026 09:46:02 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cb6291d95aso5047077085a.1
        for <linux-media@vger.kernel.org>; Mon, 16 Mar 2026 02:46:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773654361; x=1774259161; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HvHWdMGL2qhQtG+yXiw7hgmpA7lCBBYNzpbwEI5vSeI=;
        b=IIlDKoq45Q52DgpC5tJOGkOVPd1MdgHiA6nLJP6f0pltP6RTVcXQab/y59WtKCplby
         SL4nAybqg+VW8iHCO2yAN2XLMzRxUylTnji/2Fg6ELYZ1BME9u8rIj1veNoi0b5xsLeu
         cB4uk8rjSD1kq3h9XVxbUFRXGmx90+q5YI8BC48JqiPGnxYmY4XU/guBa24FPdU2pULK
         yAj3Etq6WPy5IxwUnA9krb7joUCjQwU+WXStc6/p0aAMnUpfA3wNZkb0mwICkkAGJDLw
         wtOAoeCq7TS+X8E4nuPVk5d62wrk/rbfjRrOXIbE+nlg/fyqqX9FhGa7ZYdSPIzzFxCS
         wfvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773654361; x=1774259161;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HvHWdMGL2qhQtG+yXiw7hgmpA7lCBBYNzpbwEI5vSeI=;
        b=bMC2XJyvcVc6MyyDQ5aNEScevNDlKzkvv5cfeC9KvpZlR8VvBxxGpdbjUs3p8Khh4U
         0bO6CrLExyDYMfwJ/yWkFPaWfJjUn8u4OsOyZ7eGhvkEslTKi6TDNGjgbhCFiqL+jaF+
         ApSjsj/AyGyr0v0Tl5m0VVxDJXK0Vd2AeRmBboAVHBWWU4IPOGO8SMbPKwMZc7s7r/Zj
         s+E5KWDtaPeRxBqEUPch/W1q0b402Uu/4A17OunAtDr3qvoeJC/KbmBpYSL0k5SZFR/d
         j7u+a9cHpe/pfQr43b/tn1xBaIXMb+ATdunzim7fdgHmzGT9AmFF7OP3nOOQfaFMu4tw
         IAAw==
X-Forwarded-Encrypted: i=1; AJvYcCUkLqVc7ue1DPZkq6tKEgdvarjCzwGZk4FlOUnY6h2b2Z1lxXPD0v37YJdkyDz7lf8FoaQbideiEvJx0Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0lNsnqYbDKrE9LSspIDc9Cq1uNAWE5M/tnlyLK71E0JJ3c5N0
	ntbadJIiIWt9zhVpzwo8T5zQqq+X79nf7/OUzmZS+KSAJCsKTgHuO/fUp+UqeUUA/+UJcdFO50R
	fVREkmXe8krskWo0mOJBIJplFbLKcI+3W1dav8ByEF/oK5bPQcAvWda5AqOQPhtF9nQ==
X-Gm-Gg: ATEYQzxbl+nGB6XpmLTWqw9tN50MFLwj7WL9xOuH7iXNU7ZnRAQwxuW3Rbap3LKdej+
	b7rTzYPAetdbMLXgpVPzZjSByiYs8Xm3E1dWtQyWpNjlCOm6dVuxmGfVEPOfFLk/ysyepDZn9Mg
	NmUurknoncmCwerlYNjP9CsH3J5B3boxMuXza6oX7TaQrbC2NeC5XzgWMvnIJHFyy+aW1m6F8Am
	yl093LPJyLO2fHzrPEFGkA3mRhf0v+Ba7CYXRese5lxpIsr9RT4Ib1yNjBelszlGit3YNUPl0+a
	yu3/U1a6j2ssJfQeAl+wO+J3zKlyVIidZ9bG7Kjf0mj9ECNApJwfcaWuG861lI4vJV2oGGdHZaS
	fTfvA8ANN8O6jsMEVlXkHCiaNJVZ2xJmT1BTud9id5yXId4gFThoD
X-Received: by 2002:a05:620a:2549:b0:8cd:8f18:d1f4 with SMTP id af79cd13be357-8cdb5a4abf2mr1564738285a.6.1773654361419;
        Mon, 16 Mar 2026 02:46:01 -0700 (PDT)
X-Received: by 2002:a05:620a:2549:b0:8cd:8f18:d1f4 with SMTP id af79cd13be357-8cdb5a4abf2mr1564736685a.6.1773654360971;
        Mon, 16 Mar 2026 02:46:00 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:ba9e:e504:fb0b:f1f3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48541ab9f9esm503138755e9.4.2026.03.16.02.45.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 02:45:59 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 16 Mar 2026 10:45:28 +0100
Subject: [PATCH v2 8/9] power: reset: drop unneeded dependencies on OF_GPIO
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260316-gpio-of-kconfig-v2-8-de2f4b00a0e4@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1970;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=N/KccnxICgrK3rI/2fd0AqdTwq45Oh63UAkAjH8PkgY=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpt9FBUPuNGhiF3uPrD3MLEpw265O2ryCfQa0A0
 3Zj48AI/n2JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCabfRQQAKCRAFnS7L/zaE
 w/O9EAChOyuMMoMQSI3Z2l1Ai1DTeM7NVpOttafe54EyetzU0xw8PjsPlMgISx0CWvQ0gahGXVq
 fw++E21GJiYXzpJ3b2aqPC7+zX+2H5Y5orVnw/nRobgzElec6gqJpUSmgt1YDLvxp0PtuPSm6Ya
 A4iXITqLKjd0udPk2gaJGei2UMy6fkjfX6uyNSO3TGmBLquvyFRSevreObYkrywIO+V8vgMiMpa
 wZpzyJZe7cDpXUdQRXxelUAxN0B3TcO/io+SOISUGGzvRwiGpfQQcGSjttrm6om3sHQdwjdIMyV
 toCf80JzUY2N7Ki13DRxjZVnCAOFIXuD2K59YObtzbB9iqtXojbGl+NFNYXRpjhlk7+LOdFCwVt
 Ys9JHWGMBrCk1t9+CpAgigQ1LbMxDP9+5EC1frWy4rS7uBZlOEaozyHrRn6q1i4NhSgPKlIFqU6
 E4Qs06xlH4ks+yPLrcLn5D7P1nGkri8AAIFhOWNYP5POm11KHxerWB02ZbqkwkvkUjLIkumX0wH
 xegWOZOlRuSPp2wPqnVW8WZQqOh3OPUOPIcPnt/UxPvPlLXsz/MvVFadH4CmLG7UVcsD81jpgk8
 L60flzwaTd17bTl5BJJTYa4ZBOk1876I9o7jppj4M2qDWpFv/RRgVGA/71+FMt4JBE9UpRcNRD8
 Kfg2tDgl4ySflcw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: YXHtpa2k23b4VbiDycxnzqDb_dxUwkWC
X-Authority-Analysis: v=2.4 cv=QOxlhwLL c=1 sm=1 tr=0 ts=69b7d15a cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=esZZGTiVAK7d0sqnEIwA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: YXHtpa2k23b4VbiDycxnzqDb_dxUwkWC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDA3NSBTYWx0ZWRfX23y4qCWN7+5t
 PC2SZrLVq2B4L3go98lV9NnDJBV4BlkIFLtqZFAMBum6ErJ3eC20tqJkUX6Fz1cI5mjb2WffhY9
 eQCeUmNJ8f4b8nnSKU2QaS+b4tBNIkNkMq6qW8j+6nHbrixCHLkhvhRvvfsmOVLPuWk3V6FQX2t
 j2XzmcIMjAOcvqaNKPEVNxvnROmji5Q0HgVdINs/f2cUIKOfV/CPZ+jkpz5coLd/lvOQa7hAk8Z
 GiW2nJ0dSYztJsb4Gksc/n0DtczcJoiAkgaNfjcW+jzG5VIEzlwxhkuJwvLbiFM/MUbr8N72XIV
 FW5gFK/tDcP7i3xYhNI2LPw59pKU9SkRGsEsgASkQbfMOe2gpFDknfaFw5lq9Vd9SAveaDSauKT
 4fnY1MOMniduGfXAm5S7oVM1G7FtL+4qBZFZkKSrEOxtCBTby1FKmZpqwPXO1s5To37PkwhwkIN
 vs4f7GX0zgwMpjLvmdA==
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-55884-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 0EC0A297768
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

OF_GPIO is selected automatically on all OF systems. Any symbols it
controls also provide stubs so there's really no reason to select it
explicitly. For Kconfig entries that have no other dependencies: convert
it to requiring OF to avoid new symbols popping up for everyone in make
config, for others just drop it altogether.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/power/reset/Kconfig | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/power/reset/Kconfig b/drivers/power/reset/Kconfig
index f6c1bcbb57deff3568d6b1b326454add3b3bbf06..8af398b4e6f7fc5f2ecd92f11d03c43cdefe1ab6 100644
--- a/drivers/power/reset/Kconfig
+++ b/drivers/power/reset/Kconfig
@@ -97,7 +97,7 @@ config POWER_RESET_GEMINI_POWEROFF
 
 config POWER_RESET_GPIO
 	bool "GPIO power-off driver"
-	depends on OF_GPIO
+	depends on OF
 	help
 	  This driver supports turning off your board via a GPIO line.
 	  If your board needs a GPIO high/low to power down, say Y and
@@ -105,7 +105,7 @@ config POWER_RESET_GPIO
 
 config POWER_RESET_GPIO_RESTART
 	bool "GPIO restart driver"
-	depends on OF_GPIO
+	depends on OF
 	help
 	  This driver supports restarting your board via a GPIO line.
 	  If your board needs a GPIO high/low to restart, say Y and
@@ -181,7 +181,7 @@ config POWER_RESET_PIIX4_POWEROFF
 
 config POWER_RESET_LTC2952
 	bool "LTC2952 PowerPath power-off driver"
-	depends on OF_GPIO
+	depends on OF
 	help
 	  This driver supports an external powerdown trigger and board power
 	  down via the LTC2952. Bindings are made in the device tree.
@@ -198,7 +198,7 @@ config POWER_RESET_MT6323
 
 config POWER_RESET_QNAP
 	bool "QNAP power-off driver"
-	depends on OF_GPIO && PLAT_ORION
+	depends on PLAT_ORION
 	help
 	  This driver supports turning off QNAP NAS devices by sending
 	  commands to the microcontroller which controls the main power.

-- 
2.47.3


