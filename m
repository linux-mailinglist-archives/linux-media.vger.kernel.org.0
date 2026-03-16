Return-Path: <linux-media+bounces-55878-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AKNjJjHTt2n0VgEAu9opvQ
	(envelope-from <linux-media+bounces-55878-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 10:53:53 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D47929772B
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 10:53:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 8A3F93025123
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 09:46:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2962F38F647;
	Mon, 16 Mar 2026 09:45:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nlTloFLe";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="E+HME7Xm"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8AEE38F22B
	for <linux-media@vger.kernel.org>; Mon, 16 Mar 2026 09:45:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773654349; cv=none; b=EuGbImWFhO3gie1Hr39cB8Ty3gTkp2DWfP58r5WP838BNpwr++NKciKbBLJvyzW2zGZ4d/Tlf33ibNxjkHSn3GmxAleMim63e/3ioF3XDyYiV6v3Wy8QGfjo1ICgHMCNV8x09bO/j06jP9TtClVLsx3zjWk+9VFGZSkiUoO0VTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773654349; c=relaxed/simple;
	bh=HYhh5175MjWDCW3hz6XHSycHBy64wcX8wW09sbGX2gk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Alwy1kdtR4QU/P1ouOE+s7oI4hpKSRbSA/+stcNnY2mV+6gjdKFZkvKhnJ/Svw6wU+LfGYm8fzfQhqGHojjbDxyNkjxWKG3MH6dSyrBJNcdSjjL+sAC/rPny5G0pbADZDbYvnzpm3F7WWY+gZo815h4sEKknwLWvEkLglTmvwBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nlTloFLe; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=E+HME7Xm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62G64bim2672146
	for <linux-media@vger.kernel.org>; Mon, 16 Mar 2026 09:45:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/me2wMiiolCP2vBwysex2L1/sOMs+/dHNx+CpVpgu5U=; b=nlTloFLeXHhd34SU
	KHEF07Cw4bHJjx4+NADFDDQK25xjWQN8q6A5ukg+f0T7kANvhLcVjo8x0IY8ksz4
	SkCe5/ki2c+E2Svz9nLH1uJukU3ByK5hgmJ4+3Cjfre8lRw42cgKEJ7pm27DfGBX
	0ApOLWMlmtnhE7pREydl4rEgsbNN4/Ci0Y8b+gsKIfEZZvtm6LFKC7x0YhEiLVGV
	eI4P/ujAeBoKSSTDnKxG64wWj0YMtVL/AkWKCaq6TeRjYk7quZeEw4TuOTcEnqCV
	lXQO3UIAmbcnj3bs+Mk7vwfZXtdv8Cehdq6lo8o3YY3x44uyPpAWyzTAVLuWl2Hq
	H+dyZg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cw03xn4aj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 16 Mar 2026 09:45:46 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-899eacb58a5so483895846d6.1
        for <linux-media@vger.kernel.org>; Mon, 16 Mar 2026 02:45:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773654346; x=1774259146; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/me2wMiiolCP2vBwysex2L1/sOMs+/dHNx+CpVpgu5U=;
        b=E+HME7Xm1njdm35DvXN3ilADzesxZjPmFQR7K+o2QQRarRq/NTckc1QhHPAvvtkdN3
         GnidETFqgAkSyCfxm76nwFP/nE763UDyoTLBJzxXokCZBDXAu6K7e+5BMXJJN+7L6FcF
         mhj2xB0kA0RGDgK6CaaNqxccOtqE9TdRVHBjfFias0ZzbiNS+DtOUrEtvyz24KIfSr66
         Ki7IFIeYCSAqpsbOg/2+5FIAeeHVoglyZ/G7yUQF400+lAR7GNqUqgg8xA++gmckbxx/
         l1qWiycW9C5ToGx/k+2MTfUardVXvVTFBU+VEV89GFaXwRSONITnl+97zIgSNzkYHZv3
         dAHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773654346; x=1774259146;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/me2wMiiolCP2vBwysex2L1/sOMs+/dHNx+CpVpgu5U=;
        b=BCJTH5stKU0QtCJdCu24F292UNY/K080TLNob2/QjgfYVSV7kbckj7DeEAkuV/dw2h
         t1zjh9UMi6zTYbdhqkAHlVoj5MKm3a5zvPIBdi833iOAU8NcAORqFDkIegsGrY1qCRIk
         xcaH0zj01iUHOS+1edPnVKMn3sr/x8E2WJinCTLUPsmjGG2b+5KaftLdI3u3JvsJORv1
         F49P1IAnsVfqT8IltntPwjA40MXiPDmlXbn6DKjdvBa2wSwaK6+yeqOGrOLh38IFTLsM
         +XXVRYSNnnS6gWqHmg9JSw2SmvoV567CnwRpzdakDa/wsHZ7rcNnhzP63uZnlpvwPy7Q
         YBQA==
X-Forwarded-Encrypted: i=1; AJvYcCV2nfTTrJYwRMAORA1asdrXcYPTF+sZGnHrSkyCBBUQYgptPOQe0E9Qa82L6raKKPYmV8YDcDt3etLeVw==@vger.kernel.org
X-Gm-Message-State: AOJu0YztIr2BbFM/Vik/M6LhWrTyx+KtEU7CXakDI1Bi7YfemepUtafo
	pnPEcG3qWOP6ADG64TeauxgbnEtaSxHLlw8j/9llxNaaDF9vZ8Jx1uKuerQKv6VoZMRP2Mlmi6f
	D7yyHmnOoMfxa0i7ung15CM0KNvbA4DGpQWPMZ9u0qyqKeuAquJO/z+XVO/UK8R9UKQ==
X-Gm-Gg: ATEYQzwBlKvDWiZHgq3d71mjFa+X2EWPv+AQy8D9SsShi3/NYgauIGvBUmdEKRIyb0Z
	ik4N54sdSF8FQtauInB+Yrpg5B4mMoVu+ZwKAyjW6QZhQM/osKizbLF1n1ZDEye8BO9wIoMOoAK
	6wiZSrl0450Pg+nBHJRmNpDVKdH9DbRDW9ygHyM5cDHjf1vaY7rbUTLMz1TbchkdxpLRlJa9UvA
	jAxaaIfkIMLfuY8CQD8urByoSHg6TxDo4nFsMqoPeNBj24/jH6hnTa0nizprFIM1cXsZ/VoOfvV
	z25z+GsYZKyqbDqHzs0u8D5dN2e0pqtDUAz0V0AvWeWVAjnL32DDv4eaHnmCR8gaifdTDHPdJx7
	sKWVZnzvxHv627HQ7JYyxwRekB6DaRUEB80x1PF+qOwDYhlKx9e3S
X-Received: by 2002:a05:620a:1a03:b0:8cd:8889:227 with SMTP id af79cd13be357-8cdb5bdf07cmr1592978285a.73.1773654346414;
        Mon, 16 Mar 2026 02:45:46 -0700 (PDT)
X-Received: by 2002:a05:620a:1a03:b0:8cd:8889:227 with SMTP id af79cd13be357-8cdb5bdf07cmr1592976685a.73.1773654345997;
        Mon, 16 Mar 2026 02:45:45 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:ba9e:e504:fb0b:f1f3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48541ab9f9esm503138755e9.4.2026.03.16.02.45.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 02:45:44 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 16 Mar 2026 10:45:22 +0100
Subject: [PATCH v2 2/9] net: mdio: drop unneeded dependency on OF_GPIO
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260316-gpio-of-kconfig-v2-2-de2f4b00a0e4@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=845;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=HYhh5175MjWDCW3hz6XHSycHBy64wcX8wW09sbGX2gk=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpt9E6fJnMreFnmXzFZLhGkFMX3Zsbw1YGYTLK5
 r72IbihzNiJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCabfROgAKCRAFnS7L/zaE
 w5VREACIACWA1TEOB3OkduZYg56RL8zQ+HZ6Oo/yVmrqQYlHjx25QRiQ2HPIcJJUzD/3LSnl5Az
 +CQjrdV2dnFfgYI0cfJ9o8p9YV1RGtqJcy+s0IbM01gIsppk09IuT1rSm4lrJc8uqe0aSp9ELSy
 UfT8wzgrIYj/AVf+j+w9WzR4VyzJony2Jd/gMvYeip/ndZ5lp+rdGjJmgO9rG95qPamh/V2up8w
 bJ8ucXvQHd7SoDqn3sl5sho1+xwrxd7XSSJsyDPIBazuuIi78vX4UD9m5Wf0Zk0ITqoC0btzxT2
 JrinwUMkNL42rcMRGtcE1M7j5sCO4D32hv2dx9/g6DRstSJhfFS0YuoAp9sJ7bAbhOYsMsgH3Hb
 iGrWSGNrsX3IFn0/Gon1aIDg0FpkjL9y4BjVz0FbY5A+SGZD1o5Nc5pcklxtWN4yEsRIxXw/7V9
 Pnjy7EKuWj1l9J/DgiYUZJn62N+H3hTVPzjnIIusYb5qsmQvhdCpEd7DLr4cc+Ph3zRmmvp7G+X
 uJIC32ILWINvVfp4ak7+VmGQRAuXyk1bE7WMCmskegYt1hmq9lMb+4LMUREytKZtMBNml+sXwiz
 P6ch0yS6NHRFKsXtzo0oGoJlAIns2XabXySwSwNCx2Xv+R0/UYkJxL9bt96Z7v6wiHsI0lTtHWS
 24r/N3M/aDxX2oQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDA3NSBTYWx0ZWRfX23FXHJOMPQLZ
 tFiKYNAc72z/FZZ3iV3FZx74PiMbEIhjywNZqV19PnNzkJoUtJz6ZfUH0eNx5BoH+akpXQ+mU8V
 tKLNNxqFzk/pozclUm/y2DmnsrfnW7JKzMAQLErLkUdPfrU4c9CeOLMPRhFP/xB91aQceBkwjJK
 TM896RiaaNpHCE2xBGOiTohF8OUnjWhUUr53UUn+qPg6AUs9BXLfcRn/+Gybuoff6S/JO9HJXmJ
 V553pZAXwhd2jXHy8qeH5rMp/eJLgrVkepzyCXBq/LgKoE+eSqFHq2hBQ2/5RSyhZOXRRX8OAa+
 ttWJp1w/BdQW0BqWOF+Jw4TMCVEU6P+NyI+4fd7Tw62Juh2WjmK4tIXHJpE9Mehq+9rAuJ75fOi
 9Do6S4hV78mMvGu9gC3Bhe2tzMrLqcRnm0Q0Yf9kEoRpYzqP7RPys3gl1nI6sHbU+a2k4Iqzd2y
 5S06whzisepacntdz8A==
X-Authority-Analysis: v=2.4 cv=YLOSCBGx c=1 sm=1 tr=0 ts=69b7d14a cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=wUbH2sL_sFSbtn_y6v8A:9 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: ZqWbUQhtaPHY70aRkiQxDKbZ-_7wwMjc
X-Proofpoint-GUID: ZqWbUQhtaPHY70aRkiQxDKbZ-_7wwMjc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_03,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 spamscore=0 malwarescore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603160075
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-55878-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[arm.com,kernel.org,lunn.ch,gmail.com,armlinux.org.uk,davemloft.net,google.com,redhat.com,linux-watchdog.org,roeck-us.net,linuxfoundation.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[28];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
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
X-Rspamd-Queue-Id: 9D47929772B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

OF_GPIO is selected automatically on all OF systems. Any symbols it
controls also provide stubs so there's really no reason to select it
explicitly.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/net/mdio/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/mdio/Kconfig b/drivers/net/mdio/Kconfig
index 44380378911b7d72e7289951fca90282d731913d..d7ca7fce7a3b86a435fac035534260146f114bc7 100644
--- a/drivers/net/mdio/Kconfig
+++ b/drivers/net/mdio/Kconfig
@@ -247,7 +247,7 @@ config MDIO_BUS_MUX_BCM_IPROC
 
 config MDIO_BUS_MUX_GPIO
 	tristate "GPIO controlled MDIO bus multiplexers"
-	depends on OF_GPIO && OF_MDIO
+	depends on OF_MDIO
 	select MDIO_BUS_MUX
 	help
 	  This module provides a driver for MDIO bus multiplexers that

-- 
2.47.3


