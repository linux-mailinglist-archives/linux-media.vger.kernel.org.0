Return-Path: <linux-media+bounces-65437-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Yqw4NlceOmoU1wcAu9opvQ
	(envelope-from <linux-media+bounces-65437-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 23 Jun 2026 07:49:11 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 822946B4422
	for <lists+linux-media@lfdr.de>; Tue, 23 Jun 2026 07:49:11 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=ghjTzxQN;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=iNedaBIS;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65437-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-65437-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2C9C130166CF
	for <lists+linux-media@lfdr.de>; Tue, 23 Jun 2026 05:49:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6D053AA4E1;
	Tue, 23 Jun 2026 05:49:06 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D2A83438A6
	for <linux-media@vger.kernel.org>; Tue, 23 Jun 2026 05:49:03 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782193746; cv=none; b=FqgAJb+luHF2z4rbioYAnDffmzoisIaqfXWCltwsFopxAPM4+4eAt5TPlVNL4binOp6ptb7qo+j55Zgj7/ZnIMotQr+JPcbjLqIDJ4E/vGZyLBzfYL52JJ68y4J+gDb5mOKeRKrdLmDh1iv8H/F4n9WaQV0Pst8KoJW7gOWBGGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782193746; c=relaxed/simple;
	bh=43pJw6DvWM48MK0qOhX2LPbHO1ITuc3SC/S5TDYz9Xo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aiSdiSe2AArq5cBFQXsWuSiEWSjqeHbdguSGUtYBbCDuKBi+J4mMFFq1vd4avwCIau6skOlaUUN667bKZXrYoqW58R4XrYtK0ymMUuFMgWh3IXQ6UtpduimbioOsVjDmXlkAP1sr1z16V0PzJzPh80cnoBkBz0Ebkpx3ajGeFRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ghjTzxQN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iNedaBIS; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65N0krZv2600112
	for <linux-media@vger.kernel.org>; Tue, 23 Jun 2026 05:49:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=QG3aJcDD0ugIKtSRz9Ak9B1Q0FV2od+EXVp
	HzTQsOoA=; b=ghjTzxQNSPunCSRYc6erD4dzkHScpm4YIGLE+Q5qFlUwuSEH5Yi
	9y0/8lDemkYIV45m9tQOuT+NTYocyHoyXd11Ap1OwcKb2ljWD/y9lWmuUKgr0FnF
	S0gH/gVWKy6KIQMFcG1qjg37fWMz1E95Lm6I9Kar1s75E7/gNS7ObtE9imtghGHO
	gKLakEmFtDZI9tU+jRwrFj+M1jof0HNZHClBHnEe/HbnJo5hu0J5HBvNC1nsNvVg
	9LeMVOd4kFOF09L5bE0GyW0rdpFG+vq6Qtysi/0TRsgs3DTNJJciuAl97/pDfMXX
	AfBUr7iWlAfLyX4XXQaaNfR/IxiG/FDETRQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ey5yeb4d7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 23 Jun 2026 05:49:02 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92158791d14so399399785a.2
        for <linux-media@vger.kernel.org>; Mon, 22 Jun 2026 22:49:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782193741; x=1782798541; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QG3aJcDD0ugIKtSRz9Ak9B1Q0FV2od+EXVpHzTQsOoA=;
        b=iNedaBISzrCH0w1ypE96cXkk9/OJEAFiiiJd5g3AfGoBj46pB97V9V5bV6i1NqggaK
         DRV4zxXRwZv361BL4YFNvLJhMZs/5aiNlaElDUN3nlUWgyaoRSxeST18zz0+HBS6k5Y3
         1u78rx+3h0mJ9qbz029ffJGlRbvLN4wLrQcl/XaSxDAhmMik0QEvBmiSi+IjJcRFV3ca
         4RmN0Tn8W9X+Q48+X8F941yw6gP5OI+CIaRZsc/8iNwWn0wZQUdoZ65j48DwWdZSiNbh
         DMNX5vJ8kDnzOeERDnYeQ89hhEqUb/yX3D6eMZ3aoluT2rni5Y5p9NMQGx1p1XFY20rm
         kBmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782193741; x=1782798541;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QG3aJcDD0ugIKtSRz9Ak9B1Q0FV2od+EXVpHzTQsOoA=;
        b=C45HrJ9W9UlpViJYGr6cNmfLHxnijWFESBR0bDzfiOqlI7tjteuEA7hUNwa5yN8EVp
         Fu3PJs7Jhovci7hTbdDWqdLQnHDOznlV8CZeRqZfa37hUdphEcMm01AGICQZCg3lWolG
         6gW7xzv9S1skhOL2ijgSeXVPKfBXTVs4Q8NvrKf2d+4oNs2Sxjxk0KLEobRKTUViSkMN
         iucJSG3yI6u15glNOPD1fzSExuqHfF5Zc8OWtXrgoYYZDKjitCxNBs1AqcfJl/QGinlm
         RIHDp3i0dp/P1/Y1DgxG7yiJ20XmY6+LfWRj2+iMdIwAf4LGByhq4vcvM67pS/l6+QD2
         X0Wg==
X-Forwarded-Encrypted: i=1; AFNElJ++o+E0t1HtUkykbgEzHKh38zEpaT9V8OZytpajIKhMhOuzKIkUzsKlLG8hXVPIaTH+oHIAroEb94cGdA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwcjnvM5phTgbx4f9O1J7vUpL8+yzDn3XfiOp2bZJZZvCXyKkBC
	0agENoonLB6FKxUsDGMcDYc2lw/8n4cSRGw5qEH53lNQYn2BsnJ1uvAeA9VG4NnJXdtLpeyM68R
	pPtJ1WvJthuhHKB+fAXNUY4SlwRjU8/P+qAbJWw5u+T3k/Q+QTkWV9o/I9YAAiDgDtg==
X-Gm-Gg: AfdE7ckLHxBw0sa5j6ang31pvF7UC6LROhOjXUMECsBkK8bq+EWsOrfqQmulnatBasP
	8QJtFEPmY4IsSWIAYxFbJ3NGhPJy2k27QBMzfKhS6YKvqNkdISxtziRpBWHpRfQ+F0P+MVu90RB
	5+P+KZkR4OimLgfyUq5bNIaPLYJTb7d2zow/3p5vsRmYKkUcxz9jL3MUq3dE/r1a4oBfFoC1acH
	UntzyREY6B/Ua+xj895uZoZGjfN0nNc3PawmKFfrmWKJXs+kFsZU2bU/aXTM5ulu1mFfBQY04NU
	n5kcmVJpK8J/j4kmvCyBTeN7Ght5j3jDq3/kpmNzXoUyFMZeTAfkbMn+qJN2/+ZC7I7GqIIOYJp
	XYfdrMajZ3pf0WeeWxpkOEPiVOuA=
X-Received: by 2002:a05:620a:17a3:b0:8ef:3de6:c5a6 with SMTP id af79cd13be357-9208d3f9286mr2845667585a.47.1782193740853;
        Mon, 22 Jun 2026 22:49:00 -0700 (PDT)
X-Received: by 2002:a05:620a:17a3:b0:8ef:3de6:c5a6 with SMTP id af79cd13be357-9208d3f9286mr2845657985a.47.1782193740029;
        Mon, 22 Jun 2026 22:49:00 -0700 (PDT)
Received: from quoll ([178.197.218.240])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46666c579dfsm32588915f8f.31.2026.06.22.22.48.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2026 22:48:59 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Peter Griffin <peter.griffin@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Sam Protsenko <semen.protsenko@linaro.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Inki Dae <inki.dae@samsung.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Andi Shyti <andi.shyti@kernel.org>, Georgi Djakov <djakov@kernel.org>,
        Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Ulf Hansson <ulfh@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Linus Walleij <linusw@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Sebastian Reichel <sre@kernel.org>,
        Javier Martinez Canillas <javier@dowhile0.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Jonathan Marek <jonathan@marek.ca>, Taniya Das <quic_tdas@quicinc.com>,
        Robert Marko <robimarko@gmail.com>,
        Christian Marangi <ansuelsmth@gmail.com>,
        Stephan Gerhold <stephan@gerhold.net>,
        Adam Skladowski <a_skl39@protonmail.com>,
        Sireesh Kodali <sireeshkodali@protonmail.com>,
        Barnabas Czeman <barnabas.czeman@mainlining.org>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Sricharan Ramabadhran <quic_srichara@quicinc.com>,
        Anusha Rao <quic_anusha@quicinc.com>, Luo Jie <quic_luoj@quicinc.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanho Park <chanho61.park@samsung.com>,
        Sunyeal Hong <sunyeal.hong@samsung.com>,
        Shin Son <shin.son@samsung.com>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Jaehoon Chung <jh80.chung@samsung.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Alina Yu <alina_yu@richtek.com>, Andy Gross <agross@kernel.org>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Wesley Cheng <quic_wcheng@quicinc.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-i2c@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-leds@vger.kernel.org, linux-media@vger.kernel.org,
        linux-mmc@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-serial@vger.kernel.org, linux-sound@vger.kernel.org,
        linux-usb@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v2 1/2] dt-bindings: clock: Drop incorrect usage of double '::'
Date: Tue, 23 Jun 2026 07:48:43 +0200
Message-ID: <20260623054842.21831-3-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=24538; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=43pJw6DvWM48MK0qOhX2LPbHO1ITuc3SC/S5TDYz9Xo=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqOh46i2/XRiqEjf4RlyvTKWXtcHXSOAUJTIX2q
 Hf+onZFHyCJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCajoeOgAKCRDBN2bmhouD
 1zEXD/0d5p4axXW5efPiX7RUnSL9svTCXbUKBh5ZS6XsWj0n1ONuepokWhRZ4FyBOieKLAg4DlK
 QRRGftrVXy10+Dd/VaXPcfsKM6DI1KmkBqQB+o9NcqzbWvGwPfZ0s+GfRpKG4MLboT+xcO+wQQw
 zy4kZvaq0L9KJIv3YtcM9hxy2bEf0rV6Rs5ch5ouAQlrn99JzkKufT4UnwyuSeTCoe13QsfeOvW
 sArEjXRGSDGxFPZ/Kj4cBPA3Kig0LkMrcncF0PfjwSeVAkroMA9W1taeApq2atfavpwQZji22xN
 WW6lzclPqgY2DDSZOvfN9tkQYSOZ1io5DZs3/nZIfMMxZx8qSKbIixYc/dUZeyCr5ux44jSwBIR
 W2uUMBSK3R98+/4RvwDaThw7yBKzV31pJEcjpzyMLVFJ42T/0y7m+FYbcRYMy2wN/e7lXr6jwoz
 t425TsEdmGpFjH/JKVsGZLwratLCn+niz3BYBWfyU7zF5xzwPa8XyJ2cDud2FpCxHERpakMnHIZ
 6LXTcjADmk03uK96M3leZBNGn3XK2Y24P/AvfGc1c4W+U2sWG7Erde94m7fccR1/8Uc63Qx4Pay
 4B/S+x6QfT6unSqKAoUj86tNchsiUmSFs/9ivYLulzQHrHa/1M83LTEfFWFJI13w2GNpqPdwCEB ktwA5kNfaRIKx0g==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: Uy1svHe5p9G3uSaUDyBa6jEve43mti2U
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDA0NCBTYWx0ZWRfX0TS6x163kYMd
 oFyPlyLTiMrWztWZuhwZ83PVGizE8deK8LMtJsGttBgF3CTh06KTX4AmtbCmjrSNNVq2leOBZVn
 qad7EgXFf1HHrYBUarc4qSM+aZK2Wjk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDA0NCBTYWx0ZWRfXzTt8mw1zQUg/
 V1KYUbQ24ozTiJpnORYCBYYLVRWsZUUomKfaygS/oNDmaGHoGvkf5iALrePvnEjgDO1Cq53DFaW
 60tFMM0DeboT7g7zBbYKDhjuwHT+rvvwdq2qLr2pQUBKoTPd1wwq2w2s/zIY050+s3xi+nU27lL
 ii74wRZlbnvmjNfokbDNMAY1NnTn3+14LfYFosmtWekjHtGZwK6cs4Wml6t7jZ/Rqh5sbo3dtMD
 cFWRwfnFWWfZTi2lQ/HAUvuQHy4ckVdTGmmmQs9XzyxQVSTREnb0CJinF31UfwgJrQIOABIU5K1
 x1VCatt5ROPM0G3EIpDsZA7E9X7wVt8BE60wS/ZQvXkubGZZzSGVx45TYusnhlXQPYv+2/dx5kb
 J5CeJVIjeXw4qvp5X9eFC+nd22AJmt077sHQXGeJuZpfFC7g683QY/XJZc4qU5xEJqNCAgdX4t+
 zkPFuC9uPbDHgYqwINQ==
X-Proofpoint-GUID: Uy1svHe5p9G3uSaUDyBa6jEve43mti2U
X-Authority-Analysis: v=2.4 cv=YpI/gYYX c=1 sm=1 tr=0 ts=6a3a1e4e cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=qMZSjPy+XpteAuilWfML4g==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=fqWYVyBuAAAA:8
 a=hD80L64hAAAA:8 a=XYAwZIGsAAAA:8 a=EUspDBNiAAAA:8 a=lo55dvS-tf9TgaL6bfgA:9
 a=PEH46H7Ffwr30OY-TuGO:22 a=3EkFFxAVN7Xjp7FSp-fE:22 a=E8ToXWR_bxluHZ7gmE-Z:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_01,2026-06-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 spamscore=0 phishscore=0 priorityscore=1501
 malwarescore=0 bulkscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606230044
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:peter.griffin@linaro.org,m:alim.akhtar@samsung.com,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:s.nawrocki@samsung.com,m:cw00.choi@samsung.com,m:semen.protsenko@linaro.org,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:inki.dae@samsung.com,m:sw0312.kim@samsung.com,m:kyungmin.park@samsung.com,m:andi.shyti@kernel.org,m:djakov@kernel.org,m:lee@kernel.org,m:pavel@kernel.org,m:hverkuil@kernel.org,m:mchehab@kernel.org,m:ulfh@kernel.org,m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:linusw@kernel.org,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:sre@kernel.org,m:javier@dowhile0.org,m:lgirdwood@gmail.com,m:br
 oonie@kernel.org,m:gregkh@linuxfoundation.org,m:jirislaby@kernel.org,m:srini@kernel.org,m:bzolnier@gmail.com,m:rafael@kernel.org,m:daniel.lezcano@kernel.org,m:rui.zhang@intel.com,m:lukasz.luba@arm.com,m:jonathan@marek.ca,m:quic_tdas@quicinc.com,m:robimarko@gmail.com,m:ansuelsmth@gmail.com,m:stephan@gerhold.net,m:a_skl39@protonmail.com,m:sireeshkodali@protonmail.com,m:barnabas.czeman@mainlining.org,m:quic_imrashai@quicinc.com,m:quic_srichara@quicinc.com,m:quic_anusha@quicinc.com,m:quic_luoj@quicinc.com,m:tomasz.figa@gmail.com,m:chanho61.park@samsung.com,m:sunyeal.hong@samsung.com,m:shin.son@samsung.com,m:quic_mkrishn@quicinc.com,m:jacek.anaszewski@gmail.com,m:jh80.chung@samsung.com,m:m.szyprowski@samsung.com,m:alina_yu@richtek.com,m:agross@kernel.org,m:niklas.soderlund@ragnatech.se,m:quic_wcheng@quicinc.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-samsung-soc@vger.kernel.org,m:linux-clk@
 vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:linux-i2c@vger.kernel.org,m:linux-pm@vger.kernel.org,m:linux-leds@vger.kernel.org,m:linux-media@vger.kernel.org,m:linux-mmc@vger.kernel.org,m:linux-phy@lists.infradead.org,m:linux-gpio@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-serial@vger.kernel.org,m:linux-sound@vger.kernel.org,m:linux-usb@vger.kernel.org,m:krzysztof.kozlowski@oss.qualcomm.com,m:conor.dooley@microchip.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-65437-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-media@vger.kernel.org];
	FREEMAIL_TO(0.00)[kernel.org,linaro.org,samsung.com,baylibre.com,redhat.com,oss.qualcomm.com,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,linux.intel.com,suse.de,glider.be,dowhile0.org,linuxfoundation.org,intel.com,arm.com,marek.ca,quicinc.com,gerhold.net,protonmail.com,mainlining.org,richtek.com,ragnatech.se,vger.kernel.org,lists.infradead.org,lists.freedesktop.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[yaml.org:url,samsung.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,microchip.com:email];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_GT_50(0.00)[96];
	TAGGED_RCPT(0.00)[linux-media,dt,renesas];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 822946B4422

There is no use of double colon '::' in YAML. OTOH, the literal style
block, e.g. using '|' treats all characters as content [1] therefore
single use of ':' in descriptions is perfectly fine, whenever '|' is
used.

Cleanup existing code, so the confusing style won't be re-used in new
contributions.

Link: https://yaml.org/spec/1.2.2/#literal-style [1]
Acked-by: Alim Akhtar <alim.akhtar@samsung.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
I split the patches to avoid bounces from mailing list due to email size.

This can go via clock tree (no dependencies)... or both could go via
Rob's tree.

Changes in v2:
1. Add tags (partial Reviews as Acks, as that's the meaning of Ack)
---
 .../devicetree/bindings/clock/qcom,dispcc-sm8x50.yaml       | 2 +-
 .../devicetree/bindings/clock/qcom,gcc-apq8064.yaml         | 2 +-
 .../devicetree/bindings/clock/qcom,gcc-apq8084.yaml         | 2 +-
 .../devicetree/bindings/clock/qcom,gcc-ipq6018.yaml         | 2 +-
 .../devicetree/bindings/clock/qcom,gcc-ipq8064.yaml         | 2 +-
 .../devicetree/bindings/clock/qcom,gcc-mdm9607.yaml         | 2 +-
 .../devicetree/bindings/clock/qcom,gcc-mdm9615.yaml         | 2 +-
 .../devicetree/bindings/clock/qcom,gcc-msm8660.yaml         | 2 +-
 .../devicetree/bindings/clock/qcom,gcc-msm8909.yaml         | 2 +-
 .../devicetree/bindings/clock/qcom,gcc-msm8916.yaml         | 2 +-
 .../devicetree/bindings/clock/qcom,gcc-msm8953.yaml         | 2 +-
 .../devicetree/bindings/clock/qcom,gcc-msm8974.yaml         | 2 +-
 .../devicetree/bindings/clock/qcom,gcc-sdm660.yaml          | 2 +-
 Documentation/devicetree/bindings/clock/qcom,gpucc.yaml     | 2 +-
 .../devicetree/bindings/clock/qcom,ipq5018-gcc.yaml         | 2 +-
 .../devicetree/bindings/clock/qcom,ipq9574-gcc.yaml         | 2 +-
 .../devicetree/bindings/clock/qcom,qca8k-nsscc.yaml         | 2 +-
 .../devicetree/bindings/clock/qcom,qcm2290-gpucc.yaml       | 2 +-
 Documentation/devicetree/bindings/clock/qcom,rpmcc.yaml     | 2 +-
 .../devicetree/bindings/clock/qcom,sc7280-lpasscorecc.yaml  | 2 +-
 .../devicetree/bindings/clock/qcom,sc8280xp-lpasscc.yaml    | 2 +-
 .../devicetree/bindings/clock/qcom,sm6115-lpasscc.yaml      | 2 +-
 .../devicetree/bindings/clock/qcom,sm8350-videocc.yaml      | 2 +-
 Documentation/devicetree/bindings/clock/qcom,videocc.yaml   | 2 +-
 .../devicetree/bindings/clock/samsung,exynos5260-clock.yaml | 6 +++---
 .../devicetree/bindings/clock/samsung,exynos5410-clock.yaml | 2 +-
 .../devicetree/bindings/clock/samsung,exynos5433-clock.yaml | 2 +-
 .../devicetree/bindings/clock/samsung,exynos7-clock.yaml    | 2 +-
 .../devicetree/bindings/clock/samsung,exynos850-clock.yaml  | 2 +-
 .../bindings/clock/samsung,exynosautov9-clock.yaml          | 2 +-
 .../bindings/clock/samsung,exynosautov920-clock.yaml        | 2 +-
 .../devicetree/bindings/clock/samsung,s5pv210-clock.yaml    | 2 +-
 32 files changed, 34 insertions(+), 34 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,dispcc-sm8x50.yaml b/Documentation/devicetree/bindings/clock/qcom,dispcc-sm8x50.yaml
index 53a5ab319159..6863db9bd092 100644
--- a/Documentation/devicetree/bindings/clock/qcom,dispcc-sm8x50.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,dispcc-sm8x50.yaml
@@ -13,7 +13,7 @@ description: |
   Qualcomm display clock control module provides the clocks, resets and power
   domains on SM8150/SM8250/SM8350.
 
-  See also::
+  See also:
     include/dt-bindings/clock/qcom,dispcc-sm8150.h
     include/dt-bindings/clock/qcom,dispcc-sm8250.h
     include/dt-bindings/clock/qcom,dispcc-sm8350.h
diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-apq8064.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-apq8064.yaml
index 27df7e3e5bf3..68532244901e 100644
--- a/Documentation/devicetree/bindings/clock/qcom,gcc-apq8064.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,gcc-apq8064.yaml
@@ -14,7 +14,7 @@ description: |
   Qualcomm global clock control module provides the clocks, resets and power
   domains on APQ8064.
 
-  See also::
+  See also:
     include/dt-bindings/clock/qcom,gcc-msm8960.h
     include/dt-bindings/reset/qcom,gcc-msm8960.h
 
diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-apq8084.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-apq8084.yaml
index 0a0a26d9beab..1c022e75fd71 100644
--- a/Documentation/devicetree/bindings/clock/qcom,gcc-apq8084.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,gcc-apq8084.yaml
@@ -14,7 +14,7 @@ description: |
   Qualcomm global clock control module provides the clocks, resets and power
   domains on APQ8084.
 
-  See also::
+  See also:
     include/dt-bindings/clock/qcom,gcc-apq8084.h
     include/dt-bindings/reset/qcom,gcc-apq8084.h
 
diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-ipq6018.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-ipq6018.yaml
index 4d2614d4f368..c7fb84438db7 100644
--- a/Documentation/devicetree/bindings/clock/qcom,gcc-ipq6018.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,gcc-ipq6018.yaml
@@ -15,7 +15,7 @@ description: |
   Qualcomm global clock control module provides the clocks, resets and power
   domains on IPQ6018.
 
-  See also::
+  See also:
     include/dt-bindings/clock/qcom,gcc-ipq6018.h
     include/dt-bindings/reset/qcom,gcc-ipq6018.h
 
diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-ipq8064.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-ipq8064.yaml
index a71557395c01..b4d3175780bc 100644
--- a/Documentation/devicetree/bindings/clock/qcom,gcc-ipq8064.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,gcc-ipq8064.yaml
@@ -13,7 +13,7 @@ description: |
   Qualcomm global clock control module provides the clocks, resets and power
   domains on IPQ8064.
 
-  See also::
+  See also:
     include/dt-bindings/clock/qcom,gcc-ipq806x.h (qcom,gcc-ipq8064)
     include/dt-bindings/reset/qcom,gcc-ipq806x.h (qcom,gcc-ipq8064)
 
diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-mdm9607.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-mdm9607.yaml
index d7da30b0e7ee..0a7be7583bdd 100644
--- a/Documentation/devicetree/bindings/clock/qcom,gcc-mdm9607.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,gcc-mdm9607.yaml
@@ -14,7 +14,7 @@ description: |
   Qualcomm global clock control module provides the clocks, resets and power
   domains.
 
-  See also::
+  See also:
     include/dt-bindings/clock/qcom,gcc-mdm9607.h
 
 allOf:
diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-mdm9615.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-mdm9615.yaml
index 418dea31eb62..0656d5ee448d 100644
--- a/Documentation/devicetree/bindings/clock/qcom,gcc-mdm9615.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,gcc-mdm9615.yaml
@@ -14,7 +14,7 @@ description: |
   Qualcomm global clock control module provides the clocks, resets and power
   domains.
 
-  See also::
+  See also:
     include/dt-bindings/clock/qcom,gcc-mdm9615.h
 
 allOf:
diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-msm8660.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-msm8660.yaml
index e03b6d0acdb6..70c9da1f35c2 100644
--- a/Documentation/devicetree/bindings/clock/qcom,gcc-msm8660.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,gcc-msm8660.yaml
@@ -14,7 +14,7 @@ description: |
   Qualcomm global clock control module provides the clocks and resets on
   MSM8660
 
-  See also::
+  See also:
     include/dt-bindings/clock/qcom,gcc-msm8660.h
     include/dt-bindings/reset/qcom,gcc-msm8660.h
 
diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-msm8909.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-msm8909.yaml
index ce1f5a60bd8c..2edb6c251d99 100644
--- a/Documentation/devicetree/bindings/clock/qcom,gcc-msm8909.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,gcc-msm8909.yaml
@@ -13,7 +13,7 @@ description: |
   Qualcomm global clock control module provides the clocks, resets and power
   domains on MSM8909, MSM8917 or QM215.
 
-  See also::
+  See also:
     include/dt-bindings/clock/qcom,gcc-msm8909.h
     include/dt-bindings/clock/qcom,gcc-msm8917.h
 
diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-msm8916.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-msm8916.yaml
index 258b6b93deca..af4b639ea8c3 100644
--- a/Documentation/devicetree/bindings/clock/qcom,gcc-msm8916.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,gcc-msm8916.yaml
@@ -14,7 +14,7 @@ description: |
   Qualcomm global clock control module provides the clocks, resets and power
   domains on MSM8916 or MSM8939.
 
-  See also::
+  See also:
     include/dt-bindings/clock/qcom,gcc-msm8916.h
     include/dt-bindings/clock/qcom,gcc-msm8939.h
     include/dt-bindings/reset/qcom,gcc-msm8916.h
diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-msm8953.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-msm8953.yaml
index ced3118c8580..fc0360554f68 100644
--- a/Documentation/devicetree/bindings/clock/qcom,gcc-msm8953.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,gcc-msm8953.yaml
@@ -15,7 +15,7 @@ description: |
   Qualcomm global clock control module provides the clocks, resets and power
   domains on MSM8937, MSM8940, MSM8953 or SDM439.
 
-  See also::
+  See also:
     include/dt-bindings/clock/qcom,gcc-msm8917.h
     include/dt-bindings/clock/qcom,gcc-msm8953.h
 
diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-msm8974.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-msm8974.yaml
index 929fafc84c19..378dfe7854ac 100644
--- a/Documentation/devicetree/bindings/clock/qcom,gcc-msm8974.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,gcc-msm8974.yaml
@@ -15,7 +15,7 @@ description: |
   Qualcomm global clock control module provides the clocks, resets and power
   domains on MSM8974 (all variants) and MSM8226.
 
-  See also::
+  See also:
     include/dt-bindings/clock/qcom,gcc-msm8974.h (qcom,gcc-msm8226 and qcom,gcc-msm8974)
     include/dt-bindings/reset/qcom,gcc-msm8974.h (qcom,gcc-msm8226 and qcom,gcc-msm8974)
 
diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-sdm660.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-sdm660.yaml
index 724ce0491118..72aaf699cf70 100644
--- a/Documentation/devicetree/bindings/clock/qcom,gcc-sdm660.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,gcc-sdm660.yaml
@@ -14,7 +14,7 @@ description: |
   Qualcomm global clock control module provides the clocks, resets and power
   domains on SDM630, SDM636 and SDM660
 
-  See also::
+  See also:
     include/dt-bindings/clock/qcom,gcc-sdm660.h  (qcom,gcc-sdm630 and qcom,gcc-sdm660)
 
 $ref: qcom,gcc.yaml#
diff --git a/Documentation/devicetree/bindings/clock/qcom,gpucc.yaml b/Documentation/devicetree/bindings/clock/qcom,gpucc.yaml
index 4cdff6161bf0..3ac4419009a9 100644
--- a/Documentation/devicetree/bindings/clock/qcom,gpucc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,gpucc.yaml
@@ -14,7 +14,7 @@ description: |
   Qualcomm graphics clock control module provides the clocks, resets and power
   domains on Qualcomm SoCs.
 
-  See also::
+  See also:
     include/dt-bindings/clock/qcom,gpucc-sdm845.h
     include/dt-bindings/clock/qcom,gpucc-sa8775p.h
     include/dt-bindings/clock/qcom,gpucc-sc7180.h
diff --git a/Documentation/devicetree/bindings/clock/qcom,ipq5018-gcc.yaml b/Documentation/devicetree/bindings/clock/qcom,ipq5018-gcc.yaml
index 489d0fc5607c..9925b931ecad 100644
--- a/Documentation/devicetree/bindings/clock/qcom,ipq5018-gcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,ipq5018-gcc.yaml
@@ -13,7 +13,7 @@ description: |
   Qualcomm global clock control module provides the clocks, resets and power
   domains on IPQ5018
 
-  See also::
+  See also:
     include/dt-bindings/clock/qcom,ipq5018-gcc.h
     include/dt-bindings/reset/qcom,ipq5018-gcc.h
 
diff --git a/Documentation/devicetree/bindings/clock/qcom,ipq9574-gcc.yaml b/Documentation/devicetree/bindings/clock/qcom,ipq9574-gcc.yaml
index 27ae9938febc..5b128fa841aa 100644
--- a/Documentation/devicetree/bindings/clock/qcom,ipq9574-gcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,ipq9574-gcc.yaml
@@ -14,7 +14,7 @@ description: |
   Qualcomm global clock control module provides the clocks, resets and power
   domains on IPQ9574
 
-  See also::
+  See also:
     include/dt-bindings/clock/qcom,ipq9574-gcc.h
     include/dt-bindings/reset/qcom,ipq9574-gcc.h
 
diff --git a/Documentation/devicetree/bindings/clock/qcom,qca8k-nsscc.yaml b/Documentation/devicetree/bindings/clock/qcom,qca8k-nsscc.yaml
index 61473385da2d..3da10c364a85 100644
--- a/Documentation/devicetree/bindings/clock/qcom,qca8k-nsscc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,qca8k-nsscc.yaml
@@ -14,7 +14,7 @@ description: |
   Qualcomm NSS clock control module provides the clocks and resets
   on QCA8386(switch mode)/QCA8084(PHY mode)
 
-  See also::
+  See also:
     include/dt-bindings/clock/qcom,qca8k-nsscc.h
     include/dt-bindings/reset/qcom,qca8k-nsscc.h
 
diff --git a/Documentation/devicetree/bindings/clock/qcom,qcm2290-gpucc.yaml b/Documentation/devicetree/bindings/clock/qcom,qcm2290-gpucc.yaml
index 734880805c1b..bedbdabef672 100644
--- a/Documentation/devicetree/bindings/clock/qcom,qcm2290-gpucc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,qcm2290-gpucc.yaml
@@ -13,7 +13,7 @@ description: |
   Qualcomm graphics clock control module provides the clocks, resets and power
   domains on Qualcomm SoCs.
 
-  See also::
+  See also:
     include/dt-bindings/clock/qcom,qcm2290-gpucc.h
 
 properties:
diff --git a/Documentation/devicetree/bindings/clock/qcom,rpmcc.yaml b/Documentation/devicetree/bindings/clock/qcom,rpmcc.yaml
index ab97d4b7dba8..b6c835bfd0d9 100644
--- a/Documentation/devicetree/bindings/clock/qcom,rpmcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,rpmcc.yaml
@@ -12,7 +12,7 @@ maintainers:
 
 description: |
   The clock enumerators are defined in <dt-bindings/clock/qcom,rpmcc.h> and
-  come in pairs:: FOO_CLK followed by FOO_A_CLK. The latter clock is
+  come in pairs: FOO_CLK followed by FOO_A_CLK. The latter clock is
   an "active" clock, which means that the consumer only care that the clock is
   available when the apps CPU subsystem is active, i.e. not suspended or in
   deep idle. If it is important that the clock keeps running during system
diff --git a/Documentation/devicetree/bindings/clock/qcom,sc7280-lpasscorecc.yaml b/Documentation/devicetree/bindings/clock/qcom,sc7280-lpasscorecc.yaml
index 99ab9106009f..fd06ac9bceb9 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sc7280-lpasscorecc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sc7280-lpasscorecc.yaml
@@ -13,7 +13,7 @@ description: |
   Qualcomm LPASS core and audio clock control module provides the clocks and
   power domains on SC7280.
 
-  See also::
+  See also:
     include/dt-bindings/clock/qcom,lpasscorecc-sc7280.h
     include/dt-bindings/clock/qcom,lpassaudiocc-sc7280.h
 
diff --git a/Documentation/devicetree/bindings/clock/qcom,sc8280xp-lpasscc.yaml b/Documentation/devicetree/bindings/clock/qcom,sc8280xp-lpasscc.yaml
index 273d66e245c5..f235b4e24cc7 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sc8280xp-lpasscc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sc8280xp-lpasscc.yaml
@@ -13,7 +13,7 @@ description: |
   Qualcomm LPASS core and audio clock control module provides the clocks,
   and reset on SC8280XP.
 
-  See also::
+  See also:
     include/dt-bindings/clock/qcom,lpasscc-sc8280xp.h
 
 properties:
diff --git a/Documentation/devicetree/bindings/clock/qcom,sm6115-lpasscc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm6115-lpasscc.yaml
index 8cbab3fbb660..d7e1938b5e1b 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sm6115-lpasscc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sm6115-lpasscc.yaml
@@ -14,7 +14,7 @@ description: |
   Qualcomm LPASS core and audio clock controllers provide audio-related resets
   on SM6115 and its derivatives.
 
-  See also::
+  See also:
     include/dt-bindings/clock/qcom,sm6115-lpasscc.h
 
 properties:
diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8350-videocc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8350-videocc.yaml
index 5c2ecec0624e..a986ab4ce7c7 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sm8350-videocc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sm8350-videocc.yaml
@@ -13,7 +13,7 @@ description: |
   Qualcomm video clock control module provides the clocks, resets and power
   domains on Qualcomm SoCs.
 
-  See also::
+  See also:
     include/dt-bindings/clock/qcom,videocc-sm8350.h
     include/dt-bindings/reset/qcom,videocc-sm8350.h
 
diff --git a/Documentation/devicetree/bindings/clock/qcom,videocc.yaml b/Documentation/devicetree/bindings/clock/qcom,videocc.yaml
index f4ff9acef9d5..124d259fc85e 100644
--- a/Documentation/devicetree/bindings/clock/qcom,videocc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,videocc.yaml
@@ -13,7 +13,7 @@ description: |
   Qualcomm video clock control module provides the clocks, resets and power
   domains on Qualcomm SoCs.
 
-  See also::
+  See also:
     include/dt-bindings/clock/qcom,sm6350-videocc.h
     include/dt-bindings/clock/qcom,videocc-sc7180.h
     include/dt-bindings/clock/qcom,videocc-sc7280.h
diff --git a/Documentation/devicetree/bindings/clock/samsung,exynos5260-clock.yaml b/Documentation/devicetree/bindings/clock/samsung,exynos5260-clock.yaml
index b05f83533e3d..56ab972c3da5 100644
--- a/Documentation/devicetree/bindings/clock/samsung,exynos5260-clock.yaml
+++ b/Documentation/devicetree/bindings/clock/samsung,exynos5260-clock.yaml
@@ -14,17 +14,17 @@ maintainers:
 
 description: |
   Expected external clocks, defined in DTS as fixed-rate clocks with a matching
-  name::
+  name:
     - "fin_pll" - PLL input clock from XXTI
     - "xrtcxti" - input clock from XRTCXTI
     - "ioclk_pcm_extclk" - pcm external operation clock
     - "ioclk_spdif_extclk" - spdif external operation clock
     - "ioclk_i2s_cdclk" - i2s0 codec clock
 
-  Phy clocks::
+  Phy clocks:
   There are several clocks which are generated by specific PHYs.  These clocks
   are fed into the clock controller and then routed to the hardware blocks.
-  These clocks are defined as fixed clocks in the driver with following names::
+  These clocks are defined as fixed clocks in the driver with following names:
     - "phyclk_dptx_phy_ch3_txd_clk" - dp phy clock for channel 3
     - "phyclk_dptx_phy_ch2_txd_clk" - dp phy clock for channel 2
     - "phyclk_dptx_phy_ch1_txd_clk" - dp phy clock for channel 1
diff --git a/Documentation/devicetree/bindings/clock/samsung,exynos5410-clock.yaml b/Documentation/devicetree/bindings/clock/samsung,exynos5410-clock.yaml
index b737c9d35a1c..1d907dd8fbf1 100644
--- a/Documentation/devicetree/bindings/clock/samsung,exynos5410-clock.yaml
+++ b/Documentation/devicetree/bindings/clock/samsung,exynos5410-clock.yaml
@@ -14,7 +14,7 @@ maintainers:
 
 description: |
   Expected external clocks, defined in DTS as fixed-rate clocks with a matching
-  name::
+  name:
     - "fin_pll" - PLL input clock from XXTI
 
   All available clocks are defined as preprocessor macros in
diff --git a/Documentation/devicetree/bindings/clock/samsung,exynos5433-clock.yaml b/Documentation/devicetree/bindings/clock/samsung,exynos5433-clock.yaml
index 3f9326e09f79..8a289f1e2ace 100644
--- a/Documentation/devicetree/bindings/clock/samsung,exynos5433-clock.yaml
+++ b/Documentation/devicetree/bindings/clock/samsung,exynos5433-clock.yaml
@@ -14,7 +14,7 @@ maintainers:
 
 description: |
   Expected external clocks, defined in DTS as fixed-rate clocks with a matching
-  name::
+  name:
     - "oscclk" - PLL input clock from XXTI
 
   All available clocks are defined as preprocessor macros in
diff --git a/Documentation/devicetree/bindings/clock/samsung,exynos7-clock.yaml b/Documentation/devicetree/bindings/clock/samsung,exynos7-clock.yaml
index c137c6744ef9..a51cd4fafb41 100644
--- a/Documentation/devicetree/bindings/clock/samsung,exynos7-clock.yaml
+++ b/Documentation/devicetree/bindings/clock/samsung,exynos7-clock.yaml
@@ -14,7 +14,7 @@ maintainers:
 
 description: |
   Expected external clocks, defined in DTS as fixed-rate clocks with a matching
-  name::
+  name:
     - "fin_pll" - PLL input clock from XXTI
 
   All available clocks are defined as preprocessor macros in
diff --git a/Documentation/devicetree/bindings/clock/samsung,exynos850-clock.yaml b/Documentation/devicetree/bindings/clock/samsung,exynos850-clock.yaml
index cdc5ded59fe5..68c2fd318765 100644
--- a/Documentation/devicetree/bindings/clock/samsung,exynos850-clock.yaml
+++ b/Documentation/devicetree/bindings/clock/samsung,exynos850-clock.yaml
@@ -17,7 +17,7 @@ description: |
   Exynos850 clock controller is comprised of several CMU units, generating
   clocks for different domains. Those CMU units are modeled as separate device
   tree nodes, and might depend on each other. Root clocks in that clock tree are
-  two external clocks:: OSCCLK (26 MHz) and RTCCLK (32768 Hz). Those external
+  two external clocks: OSCCLK (26 MHz) and RTCCLK (32768 Hz). Those external
   clocks must be defined as fixed-rate clocks in dts.
 
   CMU_TOP is a top-level CMU, where all base clocks are prepared using PLLs and
diff --git a/Documentation/devicetree/bindings/clock/samsung,exynosautov9-clock.yaml b/Documentation/devicetree/bindings/clock/samsung,exynosautov9-clock.yaml
index 32f39e543b36..e9d17d48b4f3 100644
--- a/Documentation/devicetree/bindings/clock/samsung,exynosautov9-clock.yaml
+++ b/Documentation/devicetree/bindings/clock/samsung,exynosautov9-clock.yaml
@@ -17,7 +17,7 @@ description: |
   Exynos Auto v9 clock controller is comprised of several CMU units, generating
   clocks for different domains. Those CMU units are modeled as separate device
   tree nodes, and might depend on each other. Root clocks in that clock tree are
-  two external clocks:: OSCCLK/XTCXO (26 MHz) and RTCCLK/XrtcXTI (32768 Hz).
+  two external clocks: OSCCLK/XTCXO (26 MHz) and RTCCLK/XrtcXTI (32768 Hz).
   The external OSCCLK must be defined as fixed-rate clock in dts.
 
   CMU_TOP is a top-level CMU, where all base clocks are prepared using PLLs and
diff --git a/Documentation/devicetree/bindings/clock/samsung,exynosautov920-clock.yaml b/Documentation/devicetree/bindings/clock/samsung,exynosautov920-clock.yaml
index 6b1fc61a2ff9..475db824d4d3 100644
--- a/Documentation/devicetree/bindings/clock/samsung,exynosautov920-clock.yaml
+++ b/Documentation/devicetree/bindings/clock/samsung,exynosautov920-clock.yaml
@@ -17,7 +17,7 @@ description: |
   ExynosAuto v920 clock controller is comprised of several CMU units, generating
   clocks for different domains. Those CMU units are modeled as separate device
   tree nodes, and might depend on each other. Root clocks in that clock tree are
-  two external clocks:: OSCCLK/XTCXO (38.4 MHz) and RTCCLK/XrtcXTI (32768 Hz).
+  two external clocks: OSCCLK/XTCXO (38.4 MHz) and RTCCLK/XrtcXTI (32768 Hz).
   The external OSCCLK must be defined as fixed-rate clock in dts.
 
   CMU_TOP is a top-level CMU, where all base clocks are prepared using PLLs and
diff --git a/Documentation/devicetree/bindings/clock/samsung,s5pv210-clock.yaml b/Documentation/devicetree/bindings/clock/samsung,s5pv210-clock.yaml
index 67a33665cf00..b1617d96d3fb 100644
--- a/Documentation/devicetree/bindings/clock/samsung,s5pv210-clock.yaml
+++ b/Documentation/devicetree/bindings/clock/samsung,s5pv210-clock.yaml
@@ -14,7 +14,7 @@ maintainers:
 
 description: |
   Expected external clocks, defined in DTS as fixed-rate clocks with a matching
-  name::
+  name:
     - "xxti" - external crystal oscillator connected to XXTI and XXTO pins of
       the SoC,
     - "xusbxti" - external crystal oscillator connected to XUSBXTI and XUSBXTO
-- 
2.53.0


