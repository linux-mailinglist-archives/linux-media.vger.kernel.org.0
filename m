Return-Path: <linux-media+bounces-62327-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4FlfKrTeDWrb4QUAu9opvQ
	(envelope-from <linux-media+bounces-62327-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 18:17:56 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F24D591B45
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 18:17:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1275E3213BB0
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 15:36:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C7153EFD35;
	Wed, 20 May 2026 15:36:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KrSuBNrw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZGorK990"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53E013EDAB1
	for <linux-media@vger.kernel.org>; Wed, 20 May 2026 15:36:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779291366; cv=none; b=X9dA6MlKSd2DH+HKCb/0zEOczMaCXxPspf0znOtV8OjiIdPF8ZU+d8j+S9mfTTvgwZ/og7AYBeSesqNhyORvAdQAJQVYaXeIDoXEnh0xAfk5fSqJxk42Mtnxqe/K59SAtHQ0thDeR9yAMVsv9F0bsGNjZsKzF89j52jgdJ8Ti2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779291366; c=relaxed/simple;
	bh=grK9Sk8iW6KUeMq1UrYciHs9/Q7D0/UySExNCSNTiQ8=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=M1Y/qJkoEk8GddwSw2UI3AmM2KEMvzn5mWakarvqazy9egehfOS5f72vo4sOpw2lEmOml+aWAbXYg9s0Fj6r2mY0UTQ4/uE5uZ1ECk58qG8gEzamvaZGuuTA1xJIZhCn4wBjCi3Z1dNt3BLNIX+xcnHX93tWmA4G3a6ImbnPkHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KrSuBNrw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZGorK990; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64KBZhPT3085238
	for <linux-media@vger.kernel.org>; Wed, 20 May 2026 15:36:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LX1bOj+G5ahWYvZvTeBmcr/OlqkTeJDTD2IiN0zQbbc=; b=KrSuBNrwaiehvrIO
	FzTZf4Mvww0VyNu9V5D4NyMEDGhu1qWedER7p6bsNk9xKzqr788drW8gbj7DikpG
	IkvNtyUhGUcioPl0c9vKtl259ZgHUiOMnNid7ZTv7DB0KzxOuk4tTY/tD+KcnbYr
	9orpsnPHESIWm34aGkYt3LveZXn/KGnwyDSwGmw4rNGE8soOwoaIL+wt0RWM5H0a
	y5feACtKhuUSOnM8EiMhE4WXE5LZ8YC/Kn1bMKc7ulsCy14Nm1tzuowbdd7q07WC
	7Lc30xmVze/B5WXjuSQb2JeaRkbkQyNHuCQtmq4DZmvZZyKLsb/3U1gFuYy25Hkc
	VrM3eg==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9c7f0x2x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 20 May 2026 15:36:04 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-63136f3c5d6so9087817137.1
        for <linux-media@vger.kernel.org>; Wed, 20 May 2026 08:36:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779291364; x=1779896164; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LX1bOj+G5ahWYvZvTeBmcr/OlqkTeJDTD2IiN0zQbbc=;
        b=ZGorK990PE/HNsTJtSGTr+QmN5sS3BaAvi4wkh2YHwwBhji+N73AQpMP9SCC9H4u81
         RShMc/zopsscxfNDqE0TdYAp6I4MxRWJSJX+UBBj1sr/guSD5FDKyUOCQff5cdiVCAn2
         yqx8ErqTu38QIJIle1isrOuTe355MQG40mVCjLwxZ4lgJfwVFXxdWo+FJr4r+Uv5qcnp
         MCc1mQjke9qjl5X14134W3xLMEQDVxbDwvUhBenE8GpkGdEUKcsz2fwvF/gTEQo9/tT7
         5qIh+Ha846WK03OxCVoRgcb+h4gpPIx6Y8/URs+e/fddDQdTT14dNcKF8KvwdeDcrK2p
         xwdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779291364; x=1779896164;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LX1bOj+G5ahWYvZvTeBmcr/OlqkTeJDTD2IiN0zQbbc=;
        b=rD5IFp2wmN+CRQdld9aU8hQw7yoT5s0vOE6LujkFs+UhqVsdouEdXPo/Tu5U2/Salu
         AUGKpgzhR6qWCb3jNZ/WTmCyIeX1D7X1Qt9gTrITXvVj5mrRzw3frloz+Xib45vbrOK7
         v+3xUZ9ZuRY5H9uiVoBWKWMHXoKFFJbEMYywGCkTfabngzihkPCtwzIu+HUJuRjVJDkH
         6jtuN4sYy3Waw0y6o2mdzpGc1ubDwfXc+5nraDlEKBw+xaSfbFXeLyv2Mv2CxyGd0Qfw
         zRaj6g04/lmXT87ocJb2nevDxXZARMU9Kcs+gSHeTNN0NPLxhhRo0HPa6Zzi9fkGGhxO
         oG7Q==
X-Gm-Message-State: AOJu0YwBdVIGtf1bTL41iWWfBi3T9zoqTpOlzwDLZavLLuD7NSRN3+3b
	keXctwaY5MUO+Pma/w/JRJR5E6ujBvm88OfKIhC9adk98kipGaNmK6otznPo6JQf+TPPRQVqWGq
	M4dtexT3yXY+x8GazIcG9I2BJQgctdNVUsb3PyVP5LziCclEIk/qAkDSxpNbisx338A==
X-Gm-Gg: Acq92OFYN6IlFzRrQBrj/WArye6G7Xmb1mvq8E2SFEcz/kBA+aumntczB63RsM9+84F
	y+7Kf+KzJ/2mfSxrH/LycHOk/mOErtKpXyPDPTRe24CwTux2FCIgHswg6MNYAYNzZUsGH0XJ8aJ
	NEC+kknyi1RE3k5KDV5gE44moKb2F0Su3Y3mt2BuMaSvfB5xAdAdJaZoqYe1TYqMSP4kYRzn8gI
	vEXQs0/PaLtfQFPQuAILnTxOrQBsFZzUsHHD15UrQZaYZYspTnICv/whoH7vKd+yYCgLgduS86s
	51z6DISpy9+Ln+iIzp7IaR8C7+JdL8lsU6/yy+SThhhD1Nwn7jKV9kjIzC+nWtAUoK1buHPUYUI
	50pmq2RKoaNEVRr1girtmQo4x/xn+cisSeoH40vJdoVj66+ckfb5AieOFz2pHZaq1kK813aA250
	n0UuN1D3myh8aVxjMXfD+OWZFgZltuqttnps3Yvm8qsjmX6U7Rl8DNATRy4JowSW6kG5zkJfHbT
	K4eh+FJXCtBSdrC
X-Received: by 2002:a05:6102:548c:b0:637:ad7:f57 with SMTP id ada2fe7eead31-63a3f79362amr12683048137.25.1779291363427;
        Wed, 20 May 2026 08:36:03 -0700 (PDT)
X-Received: by 2002:a05:6102:548c:b0:637:ad7:f57 with SMTP id ada2fe7eead31-63a3f79362amr12682800137.25.1779291360918;
        Wed, 20 May 2026 08:36:00 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bd4f4e60a76sm871298766b.53.2026.05.20.08.35.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 May 2026 08:35:59 -0700 (PDT)
Message-ID: <ac8081d7-da49-4282-a967-55f726d8c384@oss.qualcomm.com>
Date: Wed, 20 May 2026 17:35:58 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 13/15] media: qcom: camss: Add CAMSS Offline Processing
 Engine driver
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Bryan O'Donoghue <bod@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
        devicetree@vger.kernel.org, laurent.pinchart@ideasonboard.com,
        kieran.bingham@ideasonboard.com
References: <20260508-camss-isp-ope-v3-0-bb1055274603@oss.qualcomm.com>
 <20260508-camss-isp-ope-v3-13-bb1055274603@oss.qualcomm.com>
 <3f75dd6a-96d8-4feb-b44c-39c8f5d3492b@oss.qualcomm.com>
Content-Language: en-US, nl
In-Reply-To: <3f75dd6a-96d8-4feb-b44c-39c8f5d3492b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=c/ibhx9l c=1 sm=1 tr=0 ts=6a0dd4e4 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=4MUlk2DU2KS13UTX2eQA:9 a=QEXdDO2ut3YA:10 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-GUID: el9Ft1VrxOLM_rZTM2TuhVPd801iRM6j
X-Proofpoint-ORIG-GUID: el9Ft1VrxOLM_rZTM2TuhVPd801iRM6j
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDE1MCBTYWx0ZWRfX+iVPeLYfmpU/
 EK8j3zh3oxaCgJKDarBkT8YvKsQRRc2iTyzxMBU919TQbnTj5+l5v1//ZehhJkm+gsBii7gQuXY
 adKU+ueASC+9Iw/h/s95JE5obqbAF00lf4BSqA0g80CorMXzgRmnVTuw7aEB88HtsJi826bCNAz
 9OhnqJklRk4uiPDptU6YKkfvvmo0f2Vth7DSsHKnTxy8emnFepZ+muJrTuggF9lyfvANHf68myb
 MapvGxSs+V8PZsqU9czV/qTN6DyntjhLGIomsHHVaqTUHZQylFWXOw42pTS/w1PcY39MnYVZXj5
 aasESVcshhgBC5tjnh2m5DDZY7J4W2nkgjBwesDV9FA5URpEDWOkcPJv2g0RrAy27t93xJWPke1
 3r3+alrOI70kKcPSLxDD8qbX5W419vEx7Cu6WeINSGIfb+7E7pyO/bV67h8J9+Wya598epi+XyK
 6u4fso7rex/DMM/VS6Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 priorityscore=1501 phishscore=0 bulkscore=0
 clxscore=1015 malwarescore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605200150
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-62327-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[johannes.goede@oss.qualcomm.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 0F24D591B45
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi All,

On 20-May-26 17:32, johannes.goede@oss.qualcomm.com wrote:
> 3. Similar to the ope_input /dev/video# to ope_proc pad 0 propagation,
>    for the try stuff automatically propagating info from ope_proc pad 2
>    to ope_disp pad 0 will also not work. In this case it might be best to
>    just completely disable auto-propagation and rely on userspace to do
>    this itself even for the active state. Or you could do the
>    v4l2_subdev_get_locked_active_state() thing again.
> 
>    You can check userspace has done this properly by calling
>    media_pipeline_start() at stream-on time, which ensures that enabled
>    source -> sink pad links agree on the format on both sides.
>    You should probably call media_pipeline_start() regardless.

Correction this is superseeded by note 6:

> 6. There should be no propagation from /dev/video# nodes to pads, instead
>    a validate_link media-entity op should be used to check userspace has
>    properly made these line up on stream-start

So no propagation from [try|set]_fmt on /dev/video# to subdev pads should
happen at all.

Regards,

Hans

(also sorry for not cutting the large rest of the patch in my previous reply)



