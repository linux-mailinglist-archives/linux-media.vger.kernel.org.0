Return-Path: <linux-media+bounces-57371-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cLHBIQT2xmkGQwUAu9opvQ
	(envelope-from <linux-media+bounces-57371-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 22:26:28 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DCAF934BA81
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 22:26:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BC02030AF01B
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 21:22:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B556396D07;
	Fri, 27 Mar 2026 21:22:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ItGHgQWd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TU3Tc/qS"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C7D33932E5
	for <linux-media@vger.kernel.org>; Fri, 27 Mar 2026 21:22:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774646539; cv=pass; b=k+5kUkg8sPpBl6R8eZ2JubmcP+WG65LiMhholDd2C/t78VEeh08wW2DtaQiocXebv2PC5CPrKl7DpJgFk/KVd+XLnmh9gmMMFRnqZgmli8yxYBaz0/D66HteZwTBMqDpy3DV96mK7lw7NP0fBgL/whvsoMOHWqMUmwChoLrvFAQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774646539; c=relaxed/simple;
	bh=EKd89lwZSQ/xsDQeDeVnhMqnSWOHBwJ1HhYorIEMpOo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CUNlbLrHCoUUmmoMj+PA2skFoXkPCJjbgPeztbGx71dnCrfIg9YqzbVqotmhLGZqylvB222jlA0uxcYz/m48nh/Ry0stz+4khshmOWUfm/Z40bGg/c4pMq6HKU6w0PN4xsBrksAE2DAL19+NuUIubvkRi0afYLdXX6S8lBidi/c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ItGHgQWd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TU3Tc/qS; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62RLD9B63761474
	for <linux-media@vger.kernel.org>; Fri, 27 Mar 2026 21:22:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zeKQIQllLYW41sCID45frB/eLHlYNGIKXDuo/pPMVtc=; b=ItGHgQWdEC/OotkD
	lYqaBWBVfEN8SJ6MUCVvSS00UXSOu8XmYOg8IzeyNCPpnVxvxKUfSdWenTNIIHhD
	CU2cfZomO7EliK42WXN3RT0NihJFx8578fC7UCIgMtxkVC4BE4VunAF8JSNQRisA
	FcJh33p/JrXf+Xg5QMkw7RzM8hkNwCVXe9ie6iOg40Rf5fwRFThQEoQsIRlwdhIF
	tgkxGhLQ/bljJX4XFidEr9Yz3W5okEiEkk1ia0q0YrJ4jc0ISWFxjdGnLKBEcyTX
	ZnOa6hBta0b9evaUx5ox1NapVJaZFYyEEHD+/htXFvQ51Zze93h9Wtk5EOb163jj
	A3K4xg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d61m700m9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 27 Mar 2026 21:22:17 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-89e56a8c863so17335376d6.3
        for <linux-media@vger.kernel.org>; Fri, 27 Mar 2026 14:22:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774646537; cv=none;
        d=google.com; s=arc-20240605;
        b=Yx2Ei/XlYdcQc2fSD1nOsb7xfGUrv+fPmZB2GLnUsnGc3mMfmcl1fkNxc8YkwmYMmC
         ohqt29MYRIhnAy4Bm+AsaB7cBPXw382TRNqRy6hV3nqyA6B+wlXzoGayKrfqp6SkFDox
         dMZMNWkgyBal8Uv8xkMGhXGYmR7lBUTcmKPwoD+l3wrkCe8dPraAuul2Lg+Kw+KX2R+N
         v/b0lN+54P7fQbMw/pToA2//Q7q4CIt+t1xLuWnxDBcFKVff5vL5gIiwkHhJ8lzNmKou
         q0ywwHrE1cRqKUaNWXiQNThTQOIHaaYhQoloAYi0gD1lQu0pbehBAeqg4ekya462bry0
         /xhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zeKQIQllLYW41sCID45frB/eLHlYNGIKXDuo/pPMVtc=;
        fh=DUyZax6Q4PPSEWnLNiP/PrGkBL7RWD972Q4OY1Gn5GU=;
        b=hn7KlOMoDIHXgAuAfUEzNgreYLxpWxvfp7kpivWbXcJfqKG+C+GWz1XFV62Eac2W0k
         8ObCTqe+beJY3whw4vkgen3dOzHwEUjGtOvqi873MgnSZfgjGXUO0esHRMoE9xN+r308
         yCUCrHlkyfFfLllVgKtqa8zz7mGDwJ00mECAwZOGLo6Yq8Xy9Tk8myDpbPjM4GZJKqQj
         nE1Skd6PSQI7osiY9atP0sfGmuOuhxVdR9mJrRayW4rMHT64IAqA/RsX1KSbf1Y5/sPN
         eWJ04YGdpA6PUlwc37BwWA9dQFzqjVkY4XijRveMJKPTBctxWYuzL8YU2cHCSpiPlDU+
         tdng==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774646537; x=1775251337; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zeKQIQllLYW41sCID45frB/eLHlYNGIKXDuo/pPMVtc=;
        b=TU3Tc/qStrZnr1l5foed5hTU8hBwnFi3YjlkMbLLg91r3MR/axM5A52yVikollEqWM
         3AzK4vs8mZfQPnI+S0kEiWkFfLG8IhRWkxz70jnNL70Pf7rub/lfTupEu6EAdPLjqEPR
         t9VE8z8UEySLYcgzCuOX4cFdDCkVMBqVUdv7qJAu6XhNCbccBQ/Yyq8P3J84yo9XSUcM
         8ISWxnGalREu/klByImrhKVHEoczkrlmPMlbItzEtaXKhEZt2gCiSUr6LIo2psj3Ruz7
         x7LMDxykO7DSKjo3CxPZE/oNjs3R1iiO4f25sb/7nC6XDrrU/fYxjTOxRu8E3cNkGcMy
         9jEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774646537; x=1775251337;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zeKQIQllLYW41sCID45frB/eLHlYNGIKXDuo/pPMVtc=;
        b=RP0VxIr9rZGjCNJkrstnV7wC8YirQ0HdqLabah1VJUFa14M5aD6UAQV8rJSNkqXgbS
         oOWNsEE+8QSzQA09oqORnSFhUqrBTfB/UfjANuDch5HRmqq7piTUc1PRxWrkXFHM8a5q
         YPN/i/6vOseElT3pG3cTO+U38dgs+rGxejfeIecJBoD76zLakszIeCsmh8aQ9u4SoDyx
         LU9I6luzTJpBYTlKNY1S7zv5E6aUb5Ekv3zZA8QgtN1S/OUvXlzswcvu/30jEuydLthq
         AcDj6PTCQifSH4pU0RkYxJoy7RZ1TrUW45l6S1FLDdJZUvRVDJQ73Qqc8A+TpZENC5Wt
         k3RQ==
X-Forwarded-Encrypted: i=1; AJvYcCUuA5ML4/Cz1HaLWFBzYUsI5luVwjQ36LEDYI2BYJ1lRSIGa0cSuWj86MT7czb29tu1DQLIqihy4NprtA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yym8zqRIGLBO9bjCMuw+cJg0sGclPPAe49c/FcbCp1yw9f0WAN8
	6F9QN7UMEi8PzgrU5ay7aYyf4T2kjq4QXHU3KZEN6hpLCbJWq0jHBKJv0ddit7j14zEkWpy1c9T
	6wXHkIisGwycfKKwGUQbKssHhPfI7QeFrPoZphix92WRvLC9Roc+tZSlFounx2GJ16cBgI1MDcz
	cKkblLLF54jSw2c0bjcb17OrOKveiBoffvbwB83AVz
X-Gm-Gg: ATEYQzwUWa/xtZIGIUOe0wpy0ZE6gDt3QaQaDEHoPDPMzNeT34FTY3MUAyqakT+J5aA
	hYmz7HXIK8eqLx7QOPoHnay8vG4CVoW1XZP+dBOuC4Lt9nDyInJsi2HeYZWvPe2K0ZOPYofuqla
	KNCC7gHRDzdxCP3ZW0pu2LPRU61cDHUs07kteEkTp0+5VIctH9NKQFiczplp5oHBgk+y9X22JR7
	sFvSkV1s10pevzzeQJ0ZbK7S7OK/JelsITaPaWetNuJwEy5OHXsIxcthsEceUAjBxwy
X-Received: by 2002:a05:6214:4602:b0:899:f820:641a with SMTP id 6a1803df08f44-89ce8ea0959mr54540556d6.30.1774646536622;
        Fri, 27 Mar 2026 14:22:16 -0700 (PDT)
X-Received: by 2002:a05:6214:4602:b0:899:f820:641a with SMTP id
 6a1803df08f44-89ce8ea0959mr54540086d6.30.1774646536246; Fri, 27 Mar 2026
 14:22:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260326-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v11-0-5b93415be6dd@linaro.org>
 <20260326-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v11-4-5b93415be6dd@linaro.org>
In-Reply-To: <20260326-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v11-4-5b93415be6dd@linaro.org>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 27 Mar 2026 22:22:04 +0100
X-Gm-Features: AQROBzCYYOuC9NiCmUVBMRzmwgB3BcHsu5HnhoneZ8m-194fkybLeOjKTsh6p1g
Message-ID: <CAFEp6-2s=N9=Z5A3gZZYo+XErBT=gMRHdxB7EQV71wPd3UqYrg@mail.gmail.com>
Subject: Re: [PATCH v11 4/7] media: qcom: camss: Add support to populate sub-devices
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
        Krzysztof Kozlowski <krzk@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDE1MCBTYWx0ZWRfXyMzk4fyKBjPl
 56E4t6B7ox/vPRJJbVDhHdDmf5ok+l2051M8oVLEXZ0Gu5JQ0Hsolk/oWWLNovZAgwoPe/NWDxP
 J9p5RMzFQWHO87vMZeXe0E87mmc1p0tbjrToA0xpFZEAjwKjoPDMbXEpgqP8YovvInBNxxfVnZG
 +ii2QJG0WjsXdjZSgeOV620/JA3MMt1PCXoD0gcre6Vti+kU6KMShi7s3lhphi66VqIRMwyo9pZ
 PbLJMX7/DECqn+fKj4xLWgsZaUphuwhixJHHwDxHrj0XJxKXRsHPy5KwXnbsDdhckRLazqxsrOD
 cVyP4a42Y2d6uAgjMeaVcEJIPESbSX2JIoPno8VSCzgSKyjO4HCgjCd4DCFVs0e4BlohSJIYvGN
 pfe9WC/q8ES1soIww6jJ6k3THEOOaXwiKSaVgtArUvZs10uMgur9N9NtusnarI10tdq0ofXcbvm
 cNpn1L3fBnv37um95rg==
X-Proofpoint-ORIG-GUID: kIQkxFhUkCU9iqHDTlBFq3gjihNzYjjF
X-Authority-Analysis: v=2.4 cv=aoC/yCZV c=1 sm=1 tr=0 ts=69c6f509 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=_ALasc2Z-pMJxbpW9BwA:9 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: kIQkxFhUkCU9iqHDTlBFq3gjihNzYjjF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-27_01,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 spamscore=0 malwarescore=0
 lowpriorityscore=0 bulkscore=0 phishscore=0 suspectscore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603270150
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-57371-lists,linux-media=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,baylibre.com,gmail.com,linaro.org,vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,mail.gmail.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email]
X-Rspamd-Queue-Id: DCAF934BA81
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Mar 26, 2026 at 2:28=E2=80=AFAM Bryan O'Donoghue
<bryan.odonoghue@linaro.org> wrote:
>
> Use devm_of_platform_populate() to populate subs in the tree.
>
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

Other drivers typically call the populate function at the end of the
probe function. In this case, however, it is invoked before the main
resources are enabled. I assume this is because the CSIPHY device
needs to be available early. Aside from that, it looks good to me.

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>


>
> ---
>  drivers/media/platform/qcom/camss/camss.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/pl=
atform/qcom/camss/camss.c
> index 00b87fd9afbd8..66ea057291f6d 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -16,6 +16,7 @@
>  #include <linux/of.h>
>  #include <linux/of_device.h>
>  #include <linux/of_graph.h>
> +#include <linux/of_platform.h>
>  #include <linux/pm_runtime.h>
>  #include <linux/pm_domain.h>
>  #include <linux/slab.h>
> @@ -4964,6 +4965,8 @@ static int camss_probe(struct platform_device *pdev=
)
>         if (!camss)
>                 return -ENOMEM;
>
> +       devm_of_platform_populate(dev);
> +
>         camss->res =3D of_device_get_match_data(dev);
>
>         atomic_set(&camss->ref_count, 0);
>
> --
> 2.52.0
>
>

