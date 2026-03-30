Return-Path: <linux-media+bounces-57570-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ICJmDJI9ymnG6wUAu9opvQ
	(envelope-from <linux-media+bounces-57570-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 11:08:34 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 7783A357D93
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 11:08:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 7C839308C3A3
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 08:56:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A0E43B27E1;
	Mon, 30 Mar 2026 08:55:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="A4CCJWdp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TNcBlIfI"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A8A13AE71D
	for <linux-media@vger.kernel.org>; Mon, 30 Mar 2026 08:55:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774860946; cv=pass; b=QO01N/hjepPqBI9u3X+HEL5YLfQea0L3HxpXlK2WFm353OiQxIF4HqKUmmhzlXpqDTfGK/IguS2y15Fg6vwL7IBnMv8qkgJ1vpj7sLU5DPjmEpIULBsUkSLNo7dfaikR2S6WfetjMkqK8bobALYeT4CtyuE7u/PKl76d9/Be8cI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774860946; c=relaxed/simple;
	bh=SRrNYohKxnZSbgLZfgaJEvQX/4xzIBNkhGypkqbdSYM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aG0e6CuUpdJpfJda9QVuOnPsLbkEP0PFtVTIpXHnVZ0Dp2qc1UtCPEhrE/TWLlAnRW6z/lm9weMGadrMHc0sZ7mcgn0iPy+FY5z0hYLuvQOh5x+mE6WTnbp/yWaEADF7oYBsm7HeVaYK0tGhUuBq2UEjop231guu9KCTPePi4yw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=A4CCJWdp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TNcBlIfI; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62U4UpgB3031490
	for <linux-media@vger.kernel.org>; Mon, 30 Mar 2026 08:55:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PefIoBp8Rz0km1wBYm1VpXsapGC6sDamADdSsc56l5w=; b=A4CCJWdpZcJy7BHy
	s8rPnbA2OP8suuW5zKkGi5UNNCIz9NPJono6Yo+NFMcE7P6cKFEL3YQ1NRxr1tfh
	aI7q4zEstPqrd3EOiSkS6sQBOQ0tA5zV9yQenSNRn2eV1I9Dy5OZ0teB8E6tBkih
	29VP4t2Vu8NvSrzBrV4YUItdpF+BfX9v71zmgqKq5eDdVmOYHQIFP/O9bIG6FRUr
	g71dXbtPMaxsPSLFooKadWSoq5/ELH4pDKzn69n+DUxle/6xZp8gzfFssNI3cLCa
	PxBdsStk4UKWY2onpoz3VpY519+EF1d/Q2sEFMe0ke6cqGwc1qyiRr7tt99M98hF
	9RbfoQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d6wqek6xk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 30 Mar 2026 08:55:44 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5090cc6a7d2so137869961cf.2
        for <linux-media@vger.kernel.org>; Mon, 30 Mar 2026 01:55:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774860943; cv=none;
        d=google.com; s=arc-20240605;
        b=jLGeb59Zi77s3N+KTVX34GfIYXZGgScmgRdufxjl6NXJHiCwfGqO5D48XEb4S/qHcn
         zfWEPc2Y6x4zJkREgBgBVFh/LsQ1QJcdog4M0bToK0gKbkCxE/H8yh568TzKL5lkUjsc
         72KTP9EEePGfdjouCfrGEAvwSscjBE61+Wvf1471B4vRi1EBxC+TzqYqmjrkTiho+gD0
         M7ICtshuU8gauD0VtRD0iXooxaJJFL4Hu1mDL8pUP4ZYwmv71TCg/abgGsQjEy8DuFkx
         wIpPLQCwMNgJINeTamkE9feDHvyjq2hKtKICjT1xM4H46WxO/LBBhBfl+zIQ92wW3ShO
         AAHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PefIoBp8Rz0km1wBYm1VpXsapGC6sDamADdSsc56l5w=;
        fh=aS56bgOddajrvypRxHndk6p2QQ3itMa2G1T1BCyqR50=;
        b=ZZzPBF4DAqrl0JqPhbrtOAH03hwhzpZxELof6vqbE4mDF89MpMVv+8WHCpuIC5XWwn
         66r0vd9qe4WDu++TxtLFpa+fVbgW1bZGG3xz0RJ24rNvDqiu8+NOQkFZ5LCEsqzNODtJ
         IgD4mvXWEJOR0/xUZ8XVf3dbS3lCTUTX5alAnomy1tINTgloR4ymUHdAOnut4JOldJ+i
         HOSnejaZUG5ZiS8h0dsCzr7+pdaD6RhtOuzv1XksvStqRLgcrsynIx1m29n09+evGTM2
         RZ8ZRIsHhvXRs+Z6HOHWGXiKKIsHSIW4ItUZMkX58G4XxDHZix/18MZXKORsQ5HeBMcC
         fEYw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774860943; x=1775465743; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PefIoBp8Rz0km1wBYm1VpXsapGC6sDamADdSsc56l5w=;
        b=TNcBlIfIi/L4MQNGd8PeCf0aVsWT0V/0e+aAh0l2eCuGRpFOo5ch3GJQwvMObtglmM
         njkMGFre0k92Bi85MPZs0891LHJqT66XiMN1S7qUtm5yEz/jSTWHKcXbaDQ+7nBkOHtJ
         6PTdJJ7BxoPygySqfL8tNBKlPUslv1aTPbNDkegxKwWYqw6PvyxAzTGnWkMEv3RAV+Mz
         +gtyWOJw4TNFfs2GF2Fa6x01sS1nPlOTfvg84W9yucFZfoNJX7hi4/Nyk114zX7w41MU
         v5kG683pQGkDfMjlpEGLkVpTTmAG5TirpOowEzrvadko89yGqp+Fzk/1XWckr/3vghip
         fMFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774860943; x=1775465743;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PefIoBp8Rz0km1wBYm1VpXsapGC6sDamADdSsc56l5w=;
        b=WTWlzQCF9z9HIIfoBh1+vUtlau8bKY6oG2ECT51oYhV9cNpjLyIHjs4DCWnK4S6jp9
         UA3KTf2cB5oy5K9UWeFhRJ/M+8nril2A8kZbuwuLkt9rJA5Fx/jjmdpTJGDX0x0XIAxT
         8o4lK1bvVMbuXvWBGyW1Rhiz53Mzh2l2tXY2az5cuBd2O7Fu2Bbk6eI0Js1EnIgeegsY
         EcDjT9dVzJvg/8hGmLXJtDddlX6Ar0YsJ/9eUNjdI+1x/AzjSweaG9s6aNZNMuwphalE
         mLOTwZPCngctUCPtorspc6F51hXy4SHpjLSmCl6uN8NhoaY2ix33r9E+be1r/0JEh4NF
         VtJQ==
X-Forwarded-Encrypted: i=1; AJvYcCWZWN4h91ziwehZ6i+WGdKULLGH5p+BGUGfNKx9OKQXP4t5xSwN7XcJlkyw7ZhsOydnaZ5II6Y2Hk4/dg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxeiF6uIbUwvgfFNlnMg/E+Q5zHWdlA+Fe/Av2yYXzIrPksEb35
	nhB8qMBBoQ5Mj3oeHTD3cJsxBcWmImDfqJo9e+mmPJ/2O+1Q8qZkyjQuqTUzKUF74YVepKqG4Gd
	myFXGONW45PBWTtmt/UftJU2iJk1anDQU023xNyUiJhykzbJUBmLEN5JnPt5NPM/cGBRmgHejQ1
	0m+pc00xmjb3PBKR9qYaQl2h/FbvPczlBtj9rt1Sa2
X-Gm-Gg: ATEYQzxQguNmLVU5tI/lwXDK7CDI4w08/BTFQ2K7EfVgL1scGsyugttCt41QxlPiAR2
	BGLDHv5OnZpsbUl++TQQKO1tqaMOEpOTjCvleuZUyqVLnifngv6Kb9SetXdb4fGjL2wFvgvbbDM
	qErwJmKFWMh2Z/qMI4z9zbodDo5VSvxsleywy2o0+K1Jq82SvLIEppOjSL5d8W5Ye3Z1kePe4gD
	CfKQD3zYb++mLjuKfft5vB+OLJ/QKvlG9mMfb4=
X-Received: by 2002:a05:622a:2593:b0:509:1a72:e332 with SMTP id d75a77b69052e-50ba37f5c80mr177298021cf.16.1774860943438;
        Mon, 30 Mar 2026 01:55:43 -0700 (PDT)
X-Received: by 2002:a05:622a:2593:b0:509:1a72:e332 with SMTP id
 d75a77b69052e-50ba37f5c80mr177297741cf.16.1774860943044; Mon, 30 Mar 2026
 01:55:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260326-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v11-0-5b93415be6dd@linaro.org>
 <20260326-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v11-6-5b93415be6dd@linaro.org>
In-Reply-To: <20260326-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v11-6-5b93415be6dd@linaro.org>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 30 Mar 2026 10:55:31 +0200
X-Gm-Features: AQROBzBxMB6veijPqkgVNgzq21VJpm26IzXgh3AXCyALUcCgg6JzL9jZ1w35UvA
Message-ID: <CAFEp6-2iSR_BBuYE6t__yuRr1e4WN8pGnqJSGS6YnKVFw+YPdg@mail.gmail.com>
Subject: Re: [PATCH v11 6/7] media: qcom: camss: Add support for PHY API devices
To: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        "Bryan O'Donoghue" <bod@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Christopher Obbard <christopher.obbard@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=Jo78bc4C c=1 sm=1 tr=0 ts=69ca3a90 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=KKAkSRfTAAAA:8 a=2ZO8jXjuQ1C68hZI1ogA:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: 6v_sXH2jkqwsZAoKX7oflvfZedNWQ8gY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDA2OSBTYWx0ZWRfX4p1CzKP7j9P0
 JeRbwiiKb5gd6ARrIYuW8gPREm93LBAKt/5MdTe7w1Pct+ZMicGMpHlJQ6rmb2NKuAWFP+X3+LZ
 I359XPegHxKYnTfjWralnRP/FEBRiwKzRCCIO6oPXFza5h4szPqZS+FsTKqasA/s1va4OoldKrJ
 ius6JBlw7nVUxqiWJPE/aSSINeK6T1HWVGeatRgHvmn80fakdXuzhKQWklL0lC2S1i9b4pCquoL
 uZ4f7o9jwzovzyKSxs/EJC2wpkbZFsoMo91DP2nGGv034jGyq2SwK9wqp8Dan621gpFC/TPg9BH
 7Lr1nRey5pK1aOhATkxxB1E6FHiOstkBoJnzynO19jP6qdL8/mIVT+h/CZLlpsI/2OZMZsZO3dw
 m23x7NAEwLw+OlfA833GHAz/Sk/T92FkU4aeF2U4UM5U/XHU5bDYE7+RyuTi8hnRwK5sPjh+hBG
 AFUtbcFHj0XyzKnVz6Q==
X-Proofpoint-ORIG-GUID: 6v_sXH2jkqwsZAoKX7oflvfZedNWQ8gY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_05,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 malwarescore=0 suspectscore=0
 impostorscore=0 adultscore=0 priorityscore=1501 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603300069
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-57570-lists,linux-media=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,baylibre.com,gmail.com,linaro.org,vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-media,dt];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:dkim,linaro.org:email,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 7783A357D93
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Bryan,

On Thu, Mar 26, 2026 at 2:29=E2=80=AFAM Bryan O'Donoghue
<bryan.odonoghue@linaro.org> wrote:
>
> Add the ability to use a PHY pointer which interacts with the standard PH=
Y
> API.
>
> In the first instance the code will try to use the new PHY interface. If =
no
> PHYs are present in the DT then the legacy method will be attempted.

This looks good and pragmatic to me. I just wanted to raise another
idea for discussion: would it be feasible to always rely on the PHY
interface, without maintaining a separate legacy path, by creating a
platform_device and attached resources from the legacy PHY
descriptors? This would allow camss driver to handle both cases
uniformly.



>
> Reviewed-by: Christopher Obbard <christopher.obbard@linaro.org>
> Tested-by: Christopher Obbard <christopher.obbard@linaro.org>
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  drivers/media/platform/qcom/camss/Kconfig        |   1 +
>  drivers/media/platform/qcom/camss/camss-csiphy.c | 189 +++++++++++++++++=
++++--
>  drivers/media/platform/qcom/camss/camss-csiphy.h |   7 +
>  drivers/media/platform/qcom/camss/camss.c        |  72 +++++++--
>  4 files changed, 239 insertions(+), 30 deletions(-)

