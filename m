Return-Path: <linux-media+bounces-54444-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ABxGOVf3p2lpnAAAu9opvQ
	(envelope-from <linux-media+bounces-54444-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 04 Mar 2026 10:11:51 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 907581FD54B
	for <lists+linux-media@lfdr.de>; Wed, 04 Mar 2026 10:11:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id F267B3114396
	for <lists+linux-media@lfdr.de>; Wed,  4 Mar 2026 09:04:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C69793976A0;
	Wed,  4 Mar 2026 09:03:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LZ5ZeC1k";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RN19UWFK"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CCF4397694
	for <linux-media@vger.kernel.org>; Wed,  4 Mar 2026 09:03:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772615030; cv=none; b=T+VD4qbeIPPuX8YbFyTZSK+gFy0HsdnuCYVbPjHs/iBdrLVWAP2MOVXcOCWVf9aKKdDM5d5eFzViDM0JvcN+x0JdApt5TrTViuh1/6vos4yK3/rFE695oVHXKST2/1JW3NdGSmJoMEp8bYVw658jqy3Mvi1SMGwbuI4XpmZ7gEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772615030; c=relaxed/simple;
	bh=MCUltpFZ7WmEs+Zx30xfCDFOTCP7ddjGHJyyrYpihXQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WLDxbxLPCIzfGkD9yNs+Zitr26hOjSqKbw5MKWqoG5zMVV/34+GS4+ioEiz5czKpY9CwbF93nmxaFq8MccMoiFs1LyIVl8HHWV3HR6J/dieqtdfLJGzjD0bDW073u6L+71hrHa0o0HQKM2lG9JGBrG9KJW0toGCtCcBWyMpu9Hs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LZ5ZeC1k; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RN19UWFK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6245SOhd631858
	for <linux-media@vger.kernel.org>; Wed, 4 Mar 2026 09:03:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fo8hOHsMcpRWpT+37kKvxNuUEm/9ffpY1iawyCnqVM0=; b=LZ5ZeC1kqTnN1jFh
	vCca7TV1UKLuarWNNA4j74IoHQZeS4rJ8wyjWtEjFDwOeF5LL3i4PnB/RtNWZk9c
	WyhH4S9YFRvmPpc5DDWtNq0Lq7gVxrQuyl7jXzEbNBoJOvYqY4FEi2nhcWKRIYhc
	Zn0ZezifGODDAv6RguH2+n4lz6j6XJtVzi8WCuvy6g0/Rm2g1Za1QiGg18MnZsQt
	LxXLnZIpg4RalfuDBpF/CIraKi91ur9+sQIPVX3xDa9cuFhzDc9DYM+q8+wJzJlF
	TMjqx7cw9Gq5Cw3kk2q8+PQ+IyRTcHcTOFocmDDfXcv5qgLhgSrVLF0TRjDNjCBg
	YOz7wQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cnvtucck1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 04 Mar 2026 09:03:47 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c881d0c617so3981651585a.1
        for <linux-media@vger.kernel.org>; Wed, 04 Mar 2026 01:03:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772615027; x=1773219827; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fo8hOHsMcpRWpT+37kKvxNuUEm/9ffpY1iawyCnqVM0=;
        b=RN19UWFKwAltZVbuZIw92wLgat2xY19BGUZFgb3BUr7B8fCrNB42hdQuYDT7g2hepN
         Nc7/OCwtsN8Dqss6Bs9fb8Dm8Qs2NcADK8P8/XqpOIVqaBZAVM2sAcFFtY/64dS9u6nS
         TgEOdv0TDcMsXF6o8b4djNJIb+/+Cm/TPPvRC6V+EZjujDB9A/CPDQ50bI5QXzdMH8bL
         VJ6aJggE4ilf+ssR9Qhf4w13qckxdZrTOmjTJjOCfRVb3RXbHQpzvxzeiZ9WJDSpIw8A
         19tzEhY2Fi3QVt93I+YDRG5v/IP46Ts7biC5UkrZI53lmfS4+qHN0YtbTT4FhhkACzgr
         8zYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772615027; x=1773219827;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fo8hOHsMcpRWpT+37kKvxNuUEm/9ffpY1iawyCnqVM0=;
        b=B5PSMqsgb6NS0ydP4BIwuFnOrZDJrRCZHGDOqQJZlR839py+McxpCh+8jtla98Yd8j
         nfG9qkk7R8euhAmdoZJ88QIv3cxRc7mh7BnrmwNLpGTnfaF2lSWP5ktdkRQOPQDJcTD4
         KZoP2+a70jNE7AoYeocqEVQifOOOH38MyygVGOTo6CEhJxpS5+ZW9LH9pXuDWkOt13Y7
         LKabft+Pv3Zb9uigQLtj+7bgj8XKv/TDL0lYY6HPV/0IssiMk4ZPInZfzCPPGrCRqip2
         /JpN++RWukuJcedMco0YpHmhuP80k50yGLcsq3o1Lw8o3tX2dj2qLf8oVJOvyWkTHxdN
         mgfQ==
X-Forwarded-Encrypted: i=1; AJvYcCUb5LSOGE33SSY33t6+9sXFeKl+KCbfivOCDg17htQdItZLAHu1I1cyQV1qiGdIhol3Kg1YOZ1Wq4y2Fw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4t2NivJTVAmfhS/LCYeCQCE5YvrGSCWcvqzf5sEwGqi9Un5+a
	HnE459fcznrxN7zb08QAVVTt1A5LbuEgI4gLXPNhWF/wj1V/EBs1Yfb0F7VAYj43eY0pPHsoHkb
	boUDi3UPe8oD6z6a+9GPnGH+EJ8hmGeVNYM4Gzwkr2/oCy205s7XwKSm7SZxwiyg4Cz9RgiQG5A
	==
X-Gm-Gg: ATEYQzwnk8mppYlDPLiaYcezHbj9ZowStz56rwO1hA7hmxRvjOCJpwcr6mWxCcJ194s
	5GvqDNMkEphzUlDIzLddq6IQ+La/E5AlTzjbEJxGODml479eTrG4D83Ahn5mIXps8ZxeHmGoOVS
	BDWn/n9OMYDyNNCp7inY9Gv6eRtDgkSsepd230/EwktduSPDYBP/5lf0WmePG6ZXI9wPJeD5wMk
	/vNJcnSJGBhNJdss1EG0AAwAtJuJpPEjvU8aicx634qYwrk7P69lFJkhV37hs0H/TZGZ8TNcyJJ
	Wu7qf9EP34QB1VTPoRT3YH6InLedq7xae7I5w6TV+vMstTuHyUluF/Q34+te1n5CCgm8dQP+UWn
	x8g5Ex/VkuAwc5pQtuAGxN7O5xEYAMe3cNEVUW+fZ313bOZ4HrtWf
X-Received: by 2002:a05:620a:31a4:b0:8c6:a539:55cd with SMTP id af79cd13be357-8cd5af818b8mr152241485a.41.1772615027052;
        Wed, 04 Mar 2026 01:03:47 -0800 (PST)
X-Received: by 2002:a05:620a:31a4:b0:8c6:a539:55cd with SMTP id af79cd13be357-8cd5af818b8mr152238485a.41.1772615026584;
        Wed, 04 Mar 2026 01:03:46 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:edb0:af14:f4c7:c6ac])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4851ad02ffcsm3644895e9.20.2026.03.04.01.03.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 01:03:45 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Wed, 04 Mar 2026 10:02:35 +0100
Subject: [PATCH 14/14] media: i2c: drop unneeded dependencies on OF_GPIO
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260304-gpio-of-kconfig-v1-14-d597916e79e7@oss.qualcomm.com>
References: <20260304-gpio-of-kconfig-v1-0-d597916e79e7@oss.qualcomm.com>
In-Reply-To: <20260304-gpio-of-kconfig-v1-0-d597916e79e7@oss.qualcomm.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
        Alexey Brodkin <abrodkin@synopsys.com>,
        Vineet Gupta <vgupta@kernel.org>, Scott Wood <oss@buserror.net>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
        Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Dvorkin Dmitry <dvorkin@tibbo.com>, Wells Lu <wellslutw@gmail.com>,
        Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Sebastian Reichel <sre@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-snps-arc@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
        netdev@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-amlogic@lists.infradead.org, linux-leds@vger.kernel.org,
        linux-hwmon@vger.kernel.org, linux-watchdog@vger.kernel.org,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-pm@vger.kernel.org, brgl@kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2430;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=MCUltpFZ7WmEs+Zx30xfCDFOTCP7ddjGHJyyrYpihXQ=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpp/U2S+uVTRDUZjbW42G7Pde+e98yExCfHmKSl
 HuuGodjDTOJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaaf1NgAKCRAFnS7L/zaE
 w04sD/4l9ifYSWVyk+wcaQpjTACkURD2eCeWi7XG5/uxKcFxPRjOjYbnVCNmKnRiNYQHTnOdZAD
 RHEPNL9Tmn5V/K3zGBvodWKK7DoWQJZcGQLrC8VNmiFODSfkjheHHtNx6K9SzWyk4fsz/3U9/Do
 uRHRJZ7f7yJAP3QJaZ9QxWkzuAC8If42NLay9hfVcfo+kS0TOu1NNRM+6gXMA5Y/pP4FlXYs8DC
 IsZC4Qjx9Hx0bhbmMqrIpAUFk9OaN3t+oV92DLq/zFIvuNHMy0/L8N/wiyzmLbnZcfTpsf6+Qgp
 4P2FgxgqxO9yyi+cm3IA9XfiOCzuJOPteySq4NcdBekIwuXhYMeYRNqInw0HjhWFwbiAeFthwO3
 DOQAqM86R5V0bfFnCvwu7MoqjY1SjVWit3ZOt/iTOhJSvBydJJ8pgS8/ULEYw/m0sZuvYNvGOV6
 lYD11td3ysN/HbFMLVs6zX9Rr75VDl7CdXbXSc4aQbBdsN1WHf0tu+5dKq1slodk3V/ZxT2jL86
 Ns5Z37xaPgZ8pZRZw86cfDDtlRD4+3qaW4Zkd8uc9TQlPBg2iVpIMvoZdChHXBocSpd4F921tHV
 NqGZ8FhAn8Awi3Dn3ouTs3qouRo73WZp98ukYqMVfXEjl4gbfeCP/mjH85au2MmJuJ/7PUDuHTk
 DzYrk83TwNVNPsA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: v7jEq1qu_5N5GXmcQKV-cEa0dPQoOTXn
X-Proofpoint-ORIG-GUID: v7jEq1qu_5N5GXmcQKV-cEa0dPQoOTXn
X-Authority-Analysis: v=2.4 cv=A75h/qWG c=1 sm=1 tr=0 ts=69a7f573 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=jH2LZSAcktARuhmwcr4A:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDA2NyBTYWx0ZWRfXwHdQ8VNZOtzr
 IK7GRN84ASlwCqni0YMOu5xKJb0AtEPOWBtZsIvwu85uE0yTud66QIY6/esa9U2Z4MaDx87MmBa
 qGyt3I9iP6C3mfq+xgMoqbNPFv+ZknZeRKxsyteB/k1aLj2jDMqEt+w2dhfs2ZeR4oumPLeLx9M
 QDHgeEumSBFTmOjF3Htb6XcBZcLkKkRVraKKSLGE4RdGrv7qFw4S51il+MjEoRCRJ2rpAi4zzK5
 kwUtBS1H5CA7ig1GqetUc7/SAtC5Cg5l+fbgRL/D0Wb6k5dTQhfDxfxvY80PwaIDDMVUMpF+Y5i
 UPGU4xSFgLybbpiDBB2dJbWlMT2eNISSfCqJhC2rDylkM1Rsz0GcTSqWBrxvh5tb/xHf9oBKY0v
 Zj3Zgh7MLS+y5AMosdzcDgV/ruisapAZNxWvO80S8FZ+wa84QnxTTt6MuF8tKxSnPbiPBoQkzaA
 SMGStelN2Vo6RFJHZ+Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_04,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0
 adultscore=0 clxscore=1015 bulkscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603040067
X-Rspamd-Queue-Id: 907581FD54B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-54444-lists,linux-media=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	FREEMAIL_TO(0.00)[arm.com,kernel.org,synopsys.com,buserror.net,linux.ibm.com,ellerman.id.au,gmail.com,lunn.ch,armlinux.org.uk,davemloft.net,google.com,redhat.com,linaro.org,baylibre.com,googlemail.com,tibbo.com,roeck-us.net,linux-watchdog.org,linuxfoundation.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[48];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

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
index 5eb1e0e0a87ab350060567f578960c0e98940d6d..40b6fa3fe38b8d64d029d385f1acd1de4480aa69 100644
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
@@ -689,7 +689,7 @@ config VIDEO_OV8865
 
 config VIDEO_OV9282
 	tristate "OmniVision OV9282 sensor support"
-	depends on OF_GPIO
+	depends on OF
 	help
 	  This is a Video4Linux2 sensor driver for the OmniVision
 	  OV9282 camera sensor.
@@ -1244,7 +1244,6 @@ config VIDEO_BT866
 config VIDEO_ISL7998X
 	tristate "Intersil ISL7998x video decoder"
 	depends on VIDEO_DEV && I2C
-	depends on OF_GPIO
 	select MEDIA_CONTROLLER
 	select VIDEO_V4L2_SUBDEV_API
 	select V4L2_FWNODE
@@ -1282,7 +1281,6 @@ config VIDEO_MAX9286
 	tristate "Maxim MAX9286 GMSL deserializer support"
 	depends on I2C && I2C_MUX
 	depends on VIDEO_DEV
-	depends on OF_GPIO
 	select V4L2_FWNODE
 	select VIDEO_V4L2_SUBDEV_API
 	select MEDIA_CONTROLLER

-- 
2.47.3


