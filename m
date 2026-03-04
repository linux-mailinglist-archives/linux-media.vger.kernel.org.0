Return-Path: <linux-media+bounces-54438-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UM28ESH2p2mtmwAAu9opvQ
	(envelope-from <linux-media+bounces-54438-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 04 Mar 2026 10:06:41 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id CCF581FD2FB
	for <lists+linux-media@lfdr.de>; Wed, 04 Mar 2026 10:06:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BFE2930C523C
	for <lists+linux-media@lfdr.de>; Wed,  4 Mar 2026 09:03:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5CBC396586;
	Wed,  4 Mar 2026 09:03:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KM1nxb8a";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bSdBvOcq"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CFCE3932C8
	for <linux-media@vger.kernel.org>; Wed,  4 Mar 2026 09:03:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772615008; cv=none; b=VgFHtmfNKrwT8LYpLML0te3k6tSmWjvK045oQA5QJn2ircGF4PD4m2ypjWWixejnpE4qfV11MgIu0ewacJ+9hvVm/tROmolOwdpr+SuDeHd+b+XWZgblyqA/31Sne0LHp1OAw1RQ7J4rZcAffwUoD3Cj73oI7g7ZPMH7lVW5C/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772615008; c=relaxed/simple;
	bh=esqrcU2iBVY8ci/hzt1UovcnezFcilbxILgA7vFytvo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=grK26A+VXI5mivmNU5TipEfYEa2SzOr96vo8qiH4516zwtb1fIAKHH5A/BFeiyYs4yGF6Uvsnp13XepzU8aic8UEzx/cGoeOjaEqvMNeGrOXnIGlLaG50X+1IPJ9swPCwe/gD1d7SAK+B+juhiKNyiFmt6kjk/QasCK61GbH/SE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KM1nxb8a; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bSdBvOcq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6246DWVk1203738
	for <linux-media@vger.kernel.org>; Wed, 4 Mar 2026 09:03:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	m25Evgz+upNl8LtXZ2aO7wMuzsie8zywScFsKF98g7Q=; b=KM1nxb8aj0tWlKAq
	b52Nx7se77o3CBamhSkfMSBNL/LoHsX6BkUJw8XnmD1Hk32c0FZXccAxHNksV1kf
	fNRo/k1ZAt3VNvk16Evg4xhW52CXIfNhQiqDirLYASsnk31X4aLnKZmGdfZypEwU
	YUXXRyyM6MQxSqtbgN01xRiU7PnUPmyqJNjLj3J8QnRYxDI7QOvrOQ2ZkNSAKCtM
	a7lNFKTSwcYExx9osupgM7HO+JzSxfF+A/fFW5Vyyx+qhBCGWyYkzfftDhOr+6xh
	iSCVrsUVqMbrd409to0DbK/MIt8YJrf7MQPa/SWIJn40kd+UAL3tUJrNjzQTJDaI
	g5mi2Q==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cpf9c0juf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 04 Mar 2026 09:03:25 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cb3a2eb984so4787176985a.0
        for <linux-media@vger.kernel.org>; Wed, 04 Mar 2026 01:03:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772615005; x=1773219805; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m25Evgz+upNl8LtXZ2aO7wMuzsie8zywScFsKF98g7Q=;
        b=bSdBvOcqWbeABc8e5vQbfAvAAEkZYQNGAFrYXSYt2MIMOh0+PndbaqWWHcEw3CzWwl
         jsdi0kYg/mElKvRtYwkzgUShwPpQqVuIGDKpz5Le2w0L8sR4LdiPcGljrTd/jQPUcZGw
         BWX2sEUV6II2MV2VF94551s5e6uMiRtiQwOvAz+inSZ613o08RZDI/9rv4Ju+JbbS0R5
         bo7miyFaSSuM3yICPV2seWTT3Nf2VzRnp0x8n+XpGUBxC97epcEkNpUJ5rCSgZDYpsce
         JGSgHlzAI2mtVT8QzIzqYUZSfWo59JV1YsL80H/z6GP1BhCpYAbHjCUs3igf0n6TLufm
         dqqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772615005; x=1773219805;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=m25Evgz+upNl8LtXZ2aO7wMuzsie8zywScFsKF98g7Q=;
        b=iv4N81YsAxDlvw/8lR6tQl1hid+r/bcaPrnA9uO3yC18V386ZkELulaNMg+rBuc6ol
         uXYlF007jBa/B9LiJTHtTgZ2nimXdYc4reXbEcb8zNM0xoIUQqTZGm/87u6vvxgX4MPB
         Ddig5L53REPgmGw3weeBQ8v78TucE7f4od75sMme61UhGaD/jBqvxDcPzBiKbJClXKP1
         rSwH1GVWr7DA/8qxnjb3ZW/e4PUkFwAG++u+lTHFBVv7Wo3avcbbNw5ip/HSB7Q20BuS
         daIas1Q+Y6mhwynS3lVjkvL1gf1eRLm/N9ZvkpwmSHU72scrQqDhP8SpT/ENltCEp36m
         LR4w==
X-Forwarded-Encrypted: i=1; AJvYcCVckaLc3L3l3SPpdBB/ePG5zafgTAHupNclcnudOWg7k7WI8PH3TsG52v6oJVyZoPQUtprZ0hBI17kWsg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwZzgfjX4Iq5rySMS7J8Q4wYoZLM3aM2m96WRtJL10oXE7Fh0GO
	KeC+EtlvpORm7+ykIGrera3TW7kdl3LP1Yvuvnq3SxYBP49KfvXlWOniFejcMiJZCcSAzVMnETj
	GtTqsRan7K8V3JTphTZbHUeKa7K6wrCzS0nYiM4b2KSonOgAoNny4EgPz8R1D3D+TQQ==
X-Gm-Gg: ATEYQzwKMSMEbrysvUoQIgf6F7icMaglgO2Wl5R1f3PBJ/Wyam+up9WJRnF9GHYpxf+
	F/1pSfp2CTPnczvlVcM/eH1wI27qtfrr25CyhKpihQVjdZKSHmhCtz2/02nKGOPrQ5U1YYLO2l9
	rjF/4d/TtfseDV5799/Y2dRQOnmYDBH5paoLNJ6ERGW4bzaQDxTqyUdJXed4E4ki3j447crw+pr
	MyD7x0C5QuxJSWtDD+pRM0lZNbRGP3Isi07nOvEtr0IcRdaWJUa9CVgcpEH6S0itaIEyVrKzhlD
	9wFD13VEQwwN061FmYy6kyIwuSfFS7qQ4DfmlPyV2InrC0xISzjSaAHZl7W3rn5Pwn0ctaGdGeK
	WEOtWoVdLTvhIl33sfrF2GDXLCrHf2xDWGMzib+N8zUpsCkFrPwMg
X-Received: by 2002:a05:620a:2a11:b0:8ca:2e37:ad07 with SMTP id af79cd13be357-8cd5aedc525mr148299385a.8.1772615004775;
        Wed, 04 Mar 2026 01:03:24 -0800 (PST)
X-Received: by 2002:a05:620a:2a11:b0:8ca:2e37:ad07 with SMTP id af79cd13be357-8cd5aedc525mr148296585a.8.1772615004301;
        Wed, 04 Mar 2026 01:03:24 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:edb0:af14:f4c7:c6ac])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4851ad02ffcsm3644895e9.20.2026.03.04.01.03.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 01:03:23 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Wed, 04 Mar 2026 10:02:29 +0100
Subject: [PATCH 08/14] leds: Kconfig: drop unneeded dependency on OF_GPIO
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260304-gpio-of-kconfig-v1-8-d597916e79e7@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=808;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=esqrcU2iBVY8ci/hzt1UovcnezFcilbxILgA7vFytvo=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpp/UyednvCwSCoZ+nWGbhEbuv0oD/DsD+ub+SH
 Bayu8pZbRSJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaaf1MgAKCRAFnS7L/zaE
 w1PEEACFpMfWSUuL7d1juKi1HvQOLE5EdxG8E6A4QaKtXdS3ANVfIy0qrGuEIUQXgicbWadwYfl
 OaTottfXrufEJmdI0fv5wm/Ba0Ce+dGauXb9LT3oWERf8IIESub3fSBxQR47tJ3RvMiImrdQvVN
 kKc/LD7R2+gjpCuPPTddvQZJ0tlkKy8e1ZTmaa/hkzkJ94XaN9nPnEIdFCu9Kr62779GyMchvXx
 BxRd++vsdgYSwLCw/buTmw5zNTr370yDqP+1qH+rVjMxtfO9Zw8zkY6hmSt2xTXNEqu7awNMt87
 y9s51NYMLEt/5kNRRBWwiQXOTueyUnFLcKDvppzruElRsoI/mAX658xGSGoP67hp+abb3nb6OLi
 JL4vTng9bv5lINhV3xT8Atk3VZh7t7iysgSY7rfnm/j5+USEIwNtWYLtSKS/Joc6vNav3MgRLhO
 4LmEv8gppfOWfvU+papRncEUoxZKfsuyg5JDM3qszyQdUxzbvR7uaaxIY92hvizidXOfkzZHiUm
 xis1G8tdtqLlUrRO525gB+cnSkXockjuD9cvWhGSr90WATkl8RtxCNSTacO8tjTGK7UiE0PavPA
 wmJlJkD5UNPd6btvf4QqiFjWdL6XosBMIn6BtwfkGMIKJS7BPu0sIS693sDZqL7tU3J1U4xbUVW
 GuGQMI9pJeVyrkQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDA2NyBTYWx0ZWRfX1/8LK7ee6YmR
 ptBqAzKD0AoO8723rRrK9apbFcvvJJwwWlfQrTwVg6uoDM5uwaRRCoAtkJNjz40pGf+aPbd0D98
 uV6hpN3MNDHuRt+ZFcxC6rh7WUrMu4AQaFtG2bS0tSvHKpNzZTipnmxIzV2HPKC/MQyPlG6kbP7
 TGVLBvV4w+CMHqUguNspjrQhIx9/A+KxQP0cTMUk2mt8y6qsG6rNoNoVuF2vThxpMoKdHgshapg
 zJcXp7+J5pirG2Bd8cjzA4j4CAaPWmG/vm4Jin3bn0JfaK9NK5MNxodFMQ5IUoNPMqBocmYO0PZ
 rp5G2SEs+jidnsB6j9ca440HftHQNQSaCmkxcVk5gTnILZgxAwBC4nRQTN1YX0ZknIbVjdtxl4d
 Ibq0vPD2Rt7Z5T73UHZIkTTFBB8QbpzFM8h1jtMuW8NQQt+ugh0DoVc9TqMJXedlcqtUdady/od
 0QAf5PUK6OwUYFMdcrA==
X-Proofpoint-GUID: IfpeyPRtVVnD-_Zgg4EMC4sUuGS8tMvL
X-Authority-Analysis: v=2.4 cv=S4LUAYsP c=1 sm=1 tr=0 ts=69a7f55d cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=ULgK7OEL32dECu8VbM0A:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: IfpeyPRtVVnD-_Zgg4EMC4sUuGS8tMvL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_04,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 impostorscore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 malwarescore=0 clxscore=1015 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603040067
X-Rspamd-Queue-Id: CCF581FD2FB
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
	TAGGED_FROM(0.00)[bounces-54438-lists,linux-media=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
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


