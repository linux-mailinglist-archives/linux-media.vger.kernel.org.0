Return-Path: <linux-media+bounces-65466-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id dQwdFI9yOmry9AcAu9opvQ
	(envelope-from <linux-media+bounces-65466-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 23 Jun 2026 13:48:31 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A10916B6DCC
	for <lists+linux-media@lfdr.de>; Tue, 23 Jun 2026 13:48:30 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=exUMlBsl;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=BvcnztHI;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65466-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-65466-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 80B6530F81BE
	for <lists+linux-media@lfdr.de>; Tue, 23 Jun 2026 11:46:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A35B73D5679;
	Tue, 23 Jun 2026 11:46:08 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 081453D522F
	for <linux-media@vger.kernel.org>; Tue, 23 Jun 2026 11:46:05 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782215168; cv=none; b=XpEs8qlbVWTXs8iA0ItL8ys8Yaf3z7eDqN58Gjc9MyiUlrC89rmFTZGA2HIlfC15+gaCmA88qBaXS4/GK6xhgSc/RKvOoYfQzmxPwjqcnY74uB0PmskjRra4IBIfMAXYEtZrhHbkJdLH3qjxv9BPJVaRpsG9V+psFWc+cxaOufg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782215168; c=relaxed/simple;
	bh=Hso0a6UrliQE5puSOMxPFIsfnb5JdMwIZP9scKQqL2c=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=gPAw4z3DfF9m9zQg+xFBe4RRyypDWwEWafW+S6ST2FUpeRkWlJ7535MdvRpAOFgsI/jDhpH1jZf3oAGFDG5+vhPLzAyvfpPOljnUcxSlAQeZ41sXZprod5U8MR4RSqAiAjxesGU/+kG37U4M348lzCHcfHNqQ5/f75POSKaeR44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=exUMlBsl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BvcnztHI; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65NBXjro3745293
	for <linux-media@vger.kernel.org>; Tue, 23 Jun 2026 11:46:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	m5U5jjEW9F6IsBKiOyKcfNkewQXQpsrvSh1PrEY+JBU=; b=exUMlBslb0malfKz
	wCVTsgbL6sHO2bs58FC2dSO2vcOdObXhisMaudGZqA+tvxqLVcxYMqo53yM5ZR3k
	XgaFyf1xh5KgV/PPy3y70NVXa1uNxhmxw94+fRE5kzc861jjNTEkp8qJDvUWoR6K
	rDO5jMbVYXVvf1I3jovyjDvZPXW+MH4biNZK3cbEceK9vZN4EZC304yp8g+n68sx
	TbW5Sgatnbk8GjPZq4FkVYvsrOiIeJJyG9AyJpWJkmjeU+4evg7ol9N4Qb8sRU6Y
	oR5lhUn7boKNCCKY7S/c+dL5/L+QKMpvL32nAU1kri1Ox2Sulta97j8lScjbM9h8
	9+z2Gg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eypx38rsk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 23 Jun 2026 11:46:05 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-9254309dfd4so308901885a.2
        for <linux-media@vger.kernel.org>; Tue, 23 Jun 2026 04:46:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782215164; x=1782819964; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=m5U5jjEW9F6IsBKiOyKcfNkewQXQpsrvSh1PrEY+JBU=;
        b=BvcnztHIDBzosmQ82QmQ2MMbQuqs6E3OokPRoy5EOrmxzSa87gk6eE4UTvN4yFO+3n
         WEStobcZSvMpZLHUzGu7V5CUuRzkqLXyFWP4NBa3+eR0vY+OnXxzZXOzHLZqERqB8tex
         H19TVV+Moc/Kb30M44bJz9D/sLWaRL2lTX+benm6riMk/8nfe/dSCv1qcFy5OwNyaIGm
         SIjKQyVbdNyvNgorDMWffcZd68ipVw8DQ4GDm8XAzVxQu1sAI94/Iv7VVrK9fxlqqW9h
         Uwwp8oN2PjKjsaLp271UfkYJbLJiHCci+1IXVkiRRJSqqchatwBJXtoIzSnkbaoDlX7O
         +qwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782215164; x=1782819964;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m5U5jjEW9F6IsBKiOyKcfNkewQXQpsrvSh1PrEY+JBU=;
        b=f2cvZ0rEP1/7xGfEP/Zj8tPY+0UwQ0peKCRr9rE0/imH/zGITMwsrd8FraxzNVug8t
         tBGk2gJJ+nCgyH7tvVB5vVNfAaJATffg25NsOv0OcHtcgqhelkL6g63XbmU2WQZvfEry
         xZtlwCGZDmQ/oS3q7rG06YQbNnDat0amynwm1OIQ1ffxN5kQ/xWwtVpSwCWLyOgoY3+x
         9c9loTsJVHKPaSw56WVb8ot/8Jpnt8JH9epqy+qYtmm0X09+TXdCpC2zVzgQZ9kSjGvU
         Y3wfv8AiEnvCNWYebMNtkiWzLgvSUByz6sD4tI8dV1d2OsIeg3JbW1fRDKvoDD8/8puk
         YHHw==
X-Forwarded-Encrypted: i=1; AFNElJ/v3AeXBjWl5aZWi/I6mSC2qFbPiykqCa17Gvvaaca+rL7SsapH5L06WgZ4eP6MwUBYLyIze5gQ+1CMzg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8TtBY/1pyy/D6GQ3rZsH9Vm7qvGBytJwi68pTGuGdXjV7Jp0R
	x2xWAzg1z74iBXsV5mgxVibBKTi/pL0r0w2Dcz+HVL6/403vFze+umk84S9seF9Gv9Sxd0UPiez
	LdyzstwIBgUq7O6cpiIm7Vzx+SWUTD0yulqT2F/CBIuNkbPT7lvJVyWvhzZx8jV59Lg==
X-Gm-Gg: AfdE7cnO/2ztU8sn32RAF2g7z/lkrmJgZr9t/B5hXhZocCzYPjfX/8uLoVGn3by6Qmk
	3sTDw8Tw9lUBBfH6OoTdMVaiuBRh98et4YXbp24KdawOeDOXNH8jOmXPm0xJwME3HtAptNG29ZD
	kjQZxJl5VrgYTnNY8pw8e+rrEXwwueQm30u8eZaGtc+2PsL6TI5UE//6gFfUAo1KLty18cNfzpi
	s+s9YgbwgF4jIHqBRLYWvpGjTCXdEMwiuX4kxwgHV8m4bDtcdWNLycXJSsfYO+1IF0suzGQolAA
	gWTxs/lQngkL5gE2xfZhoOJ35TUzStfF6VYpX7ekbAWxfI5F01pO1wSTzSNfzL3w7tO70vtAZyq
	fdGE9UMZezv7BTk6ZxsZMkNJ4ZM1XSNvI0pYChXanxrFRzdtd9nOU4jUTvL8FIxC1yNtKHFCFqQ
	==
X-Received: by 2002:a05:620a:4625:b0:915:d322:c47b with SMTP id af79cd13be357-92645aa5b4dmr405206885a.13.1782215163862;
        Tue, 23 Jun 2026 04:46:03 -0700 (PDT)
X-Received: by 2002:a05:620a:4625:b0:915:d322:c47b with SMTP id af79cd13be357-92645aa5b4dmr405194985a.13.1782215163149;
        Tue, 23 Jun 2026 04:46:03 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:21db:9254:19d9:645e? ([2a05:6e02:1041:c10:21db:9254:19d9:645e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4923fe7ba08sm370702135e9.11.2026.06.23.04.46.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Jun 2026 04:46:02 -0700 (PDT)
Message-ID: <b35abbd7-f06e-4794-91a1-bdaccd63af50@oss.qualcomm.com>
Date: Tue, 23 Jun 2026 13:45:59 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] dt-bindings: Drop incorrect usage of double '::'
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Peter Griffin <peter.griffin@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Sam Protsenko <semen.protsenko@linaro.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
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
        Andi Shyti
 <andi.shyti@kernel.org>, Georgi Djakov <djakov@kernel.org>,
        Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Ulf Hansson <ulfh@kernel.org>, Peter Rosin <peda@lysator.liu.se>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Linus Walleij
 <linusw@kernel.org>,
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
        Chanho Park
 <chanho61.park@samsung.com>,
        Sunyeal Hong <sunyeal.hong@samsung.com>,
        Shin Son <shin.son@samsung.com>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Jaehoon Chung <jh80.chung@samsung.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Alina Yu
 <alina_yu@richtek.com>, Andy Gross <agross@kernel.org>,
        =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
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
References: <20260622101606.485961-3-krzysztof.kozlowski@oss.qualcomm.com>
 <20260622101606.485961-4-krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <20260622101606.485961-4-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=EsfiaycA c=1 sm=1 tr=0 ts=6a3a71fd cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=fqWYVyBuAAAA:8
 a=EUspDBNiAAAA:8 a=p1VIHm5NO6eVjb5xVX8A:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=3EkFFxAVN7Xjp7FSp-fE:22
X-Proofpoint-ORIG-GUID: tJUO_XuWj2eJedlnj0PkPnj5XqMOj4vq
X-Proofpoint-GUID: tJUO_XuWj2eJedlnj0PkPnj5XqMOj4vq
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDA5NiBTYWx0ZWRfX2GQo1p1w/gyN
 kLr00+9hn6vEW0us6fcgkpK0VmoHrlyiggIJobP1XWTnPeC3dsr6oh+iq0irW+eAiurDa5Clvir
 qacHylX30MrtH3yOEEnuLIi9HmYOIoo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDA5NiBTYWx0ZWRfX5SoUBMzLme5y
 7RE4iSLykpQe5gsJHaGZ16c+WJAbGDKqebRlVMiISkoHcw2ZhRe36hjuEg3ZtWf5yr6JKLg7j3H
 toZCd+tTp4R8mqfL4yeF5b1CF5oUIfH/RFLDNnacZ7jae9VXOpefnBzkHZ7TREtbzP2qOGXkcRP
 gNx2/fh9lZTjhJ+TyojlE1uZwfOB2U4H+Jcgu6+YcBYfOkFKuO6sRJkk/7swfc3aiNQqCBL3e1t
 xlp8q9LT0VPVwIXLa27ieSI5D77B5HjHvgKvQqqnehfNbPG1E8Y7qoYjxOhHIxF4J7UfCphCEl3
 JmwzCxQ++ddgfx2IBW+JnTOQmFXSqBPwlPGUwUTQ9rxBKU6WzNiHQYYN/RpzFf9zrxTlhEdTgEn
 /Q8t4DjgPnPU1uCG2AGBiqRN1YYU1azs4w/iutc6aI9Fkm8V84J823JnISNOpootaj119jytcSg
 Ig6PVkjXsSoOTy8w07A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_03,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 bulkscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 spamscore=0 adultscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606230096
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-65466-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:krzysztof.kozlowski@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:peter.griffin@linaro.org,m:alim.akhtar@samsung.com,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:s.nawrocki@samsung.com,m:cw00.choi@samsung.com,m:semen.protsenko@linaro.org,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:inki.dae@samsung.com,m:sw0312.kim@samsung.com,m:kyungmin.park@samsung.com,m:andi.shyti@kernel.org,m:djakov@kernel.org,m:lee@kernel.org,m:pavel@kernel.org,m:hverkuil@kernel.org,m:mchehab@kernel.org,m:ulfh@kernel.org,m:peda@lysator.liu.se,m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:linusw@kernel.org,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:sr
 e@kernel.org,m:javier@dowhile0.org,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:gregkh@linuxfoundation.org,m:jirislaby@kernel.org,m:srini@kernel.org,m:bzolnier@gmail.com,m:rafael@kernel.org,m:daniel.lezcano@kernel.org,m:rui.zhang@intel.com,m:lukasz.luba@arm.com,m:jonathan@marek.ca,m:quic_tdas@quicinc.com,m:robimarko@gmail.com,m:ansuelsmth@gmail.com,m:stephan@gerhold.net,m:a_skl39@protonmail.com,m:sireeshkodali@protonmail.com,m:barnabas.czeman@mainlining.org,m:quic_imrashai@quicinc.com,m:quic_srichara@quicinc.com,m:quic_anusha@quicinc.com,m:quic_luoj@quicinc.com,m:tomasz.figa@gmail.com,m:chanho61.park@samsung.com,m:sunyeal.hong@samsung.com,m:shin.son@samsung.com,m:quic_mkrishn@quicinc.com,m:jacek.anaszewski@gmail.com,m:jh80.chung@samsung.com,m:m.szyprowski@samsung.com,m:alina_yu@richtek.com,m:agross@kernel.org,m:niklas.soderlund@ragnatech.se,m:quic_wcheng@quicinc.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.i
 nfradead.org,m:linux-samsung-soc@vger.kernel.org,m:linux-clk@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:linux-i2c@vger.kernel.org,m:linux-pm@vger.kernel.org,m:linux-leds@vger.kernel.org,m:linux-media@vger.kernel.org,m:linux-mmc@vger.kernel.org,m:linux-phy@lists.infradead.org,m:linux-gpio@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-serial@vger.kernel.org,m:linux-sound@vger.kernel.org,m:linux-usb@vger.kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linaro.org,samsung.com,baylibre.com,redhat.com,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,linux.intel.com,suse.de,lysator.liu.se,glider.be,dowhile0.org,linuxfoundation.org,intel.com,arm.com,marek.ca,quicinc.com,gerhold.net,protonmail.com,mainlining.org,richtek.com,ragnatech.se,vger.kernel.org,lists.infradead.org,lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[daniel.lezcano@oss.qualcomm.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,yaml.org:url,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[daniel.lezcano@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_GT_50(0.00)[96];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt,renesas];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A10916B6DCC

On 6/22/26 12:16, Krzysztof Kozlowski wrote:
> There is no use of double colon '::' in YAML. OTOH, the literal style
> block, e.g. using '|' treats all characters as content [1] therefore
> single use of ':' in descriptions is perfectly fine, whenever '|' is
> used.
> 
> Cleanup existing code, so the confusing style won't be re-used in new
> contributions.
> 
> Link: https://yaml.org/spec/1.2.2/#literal-style [1]
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> ---
> 
> Intention for this patch is to go via Rob's tree.
> ---
>   .../devicetree/bindings/arm/qcom-soc.yaml     |  4 ++--
>   .../devicetree/bindings/arm/qcom.yaml         |  4 ++--
>   .../bindings/arm/samsung/samsung-soc.yaml     |  4 ++--
>   .../display/msm/dsi-controller-main.yaml      | 20 +++++++++----------
>   .../display/samsung/samsung,fimd.yaml         |  4 ++--
>   .../bindings/i2c/samsung,s3c2410-i2c.yaml     |  2 +-
>   .../interconnect/qcom,msm8998-bwmon.yaml      |  2 +-
>   .../interconnect/samsung,exynos-bus.yaml      | 14 ++++++-------
>   .../bindings/leds/qcom,pm8058-led.yaml        |  4 ++--
>   .../bindings/leds/skyworks,aat1290.yaml       |  6 +++---
>   .../bindings/media/cec/cec-gpio.yaml          |  2 +-
>   .../bindings/mmc/samsung,exynos-dw-mshc.yaml  |  2 +-
>   .../devicetree/bindings/mux/mux-consumer.yaml |  4 ++--
>   .../bindings/phy/samsung,mipi-video-phy.yaml  |  4 ++--
>   .../bindings/phy/samsung,usb2-phy.yaml        |  2 +-
>   .../bindings/phy/samsung,usb3-drd-phy.yaml    |  2 +-
>   .../bindings/pinctrl/samsung,pinctrl.yaml     |  2 +-
>   .../bindings/power/renesas,rcar-sysc.yaml     |  2 +-
>   .../bindings/power/reset/restart-handler.yaml |  8 ++++----
>   .../bindings/regulator/maxim,max77802.yaml    |  4 ++--
>   .../bindings/regulator/richtek,rtq2208.yaml   |  2 +-
>   .../bindings/serial/qcom,msm-uartdm.yaml      |  2 +-
>   .../devicetree/bindings/slimbus/slimbus.yaml  |  4 ++--
>   .../bindings/soc/qcom/qcom,apr-services.yaml  |  2 +-
>   .../bindings/soc/qcom/qcom,rpmh-rsc.yaml      |  8 ++++----
>   .../bindings/soc/qcom/qcom,wcnss.yaml         |  2 +-
>   .../bindings/soc/renesas/renesas-soc.yaml     |  4 ++--
>   .../bindings/sound/qcom,q6asm-dais.yaml       |  2 +-
>   .../thermal/samsung,exynos-thermal.yaml       |  4 ++--

Acked-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com> # thermal


