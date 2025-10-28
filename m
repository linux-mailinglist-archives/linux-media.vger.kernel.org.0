Return-Path: <linux-media+bounces-45802-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B898C14569
	for <lists+linux-media@lfdr.de>; Tue, 28 Oct 2025 12:25:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8619C1A660DC
	for <lists+linux-media@lfdr.de>; Tue, 28 Oct 2025 11:25:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1E223081BE;
	Tue, 28 Oct 2025 11:24:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="BgGXWr1L"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A82202EB10
	for <linux-media@vger.kernel.org>; Tue, 28 Oct 2025 11:24:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761650684; cv=none; b=AF1S0f+m+ZpBDmUERWporXcdc9NstP25uglb62rc536P16QRzRT0GGff4NdZD9D+z/MLXXKRNTB5EIFA9L9PmqrJzok+xRLdpBodC+YAg48F1WBPgUevCU2Hly852P4VBCZWuDbQznwLO8HiFHpj4pT/tyhXXXcOIaIn0+nsFt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761650684; c=relaxed/simple;
	bh=ZS8D7YevM68kueG73PP38JtCM4/TbPTO+FFQtYA36Xk=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=YPaatva8rcghyfuIVqjZwI174FSs25z7iD0gwv9lQDdf4RUCipjHAALoOgKTAEVg1gUD1lOQbKTNEzQi4sDe1fUGuHuGEOfA0AhBNs341M1sDmgskH2005gjyJLCME7YV23EOfFZoNL3V+OgnHQHvdBBtJVGcSk90iyW51JI0Gs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=BgGXWr1L; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-b6d70df0851so863586666b.1
        for <linux-media@vger.kernel.org>; Tue, 28 Oct 2025 04:24:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1761650681; x=1762255481; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1X0JyiHF22wejOgofms7G80j8gK+WhQgjSa7+ha7gyo=;
        b=BgGXWr1LwuQwdmscGN2R6zsTMYKLiPURTF+5Y4Q8H7w3aRU4OEgoqnpYEGXfYh5gZq
         G3lC6sY0p/BcxJYZZug2Ddmu9t+WdYb+iU1/ib/oesOx9hgET9sEfUN4byOL9oglw8GU
         KKcvmTr/JisJLD56M0RcYg7vq9zp5E2YzqhxCq2rqueuVk2O5UqYY+f4ZdWE3KPBW3QK
         MJQm/SK3L97THbOmhMhNFO7icuodMEIM4bNt2cOH2Y81kBQZAznbmpKzlvPIABvtqb15
         OeQptLrD5PuyllwRoHMzO1qwUO0qyFg8FCDSfnzcmhnYPq5XxCnBsFKJ/OdTGM7UvjAA
         XR/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761650681; x=1762255481;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1X0JyiHF22wejOgofms7G80j8gK+WhQgjSa7+ha7gyo=;
        b=KRqIG+JjhbvB9Blu9o2RUPCsCNs+PItN96oARyJk+exdWe6LRWOwzbtccAu+VAeKB2
         I5L7ZhsNfdmgvtf4F+ON6wZmaz85Z2wK0+plzmnTFdBWccqKjf4rJtMHBWa2DsozPlDB
         f8Kzgsp4qLabz0ngMgwfI2occ2Oc7R6vV9anJa0hOnBGxkKyf34vURtjMGk+LVD2tqLs
         /HnOikcdMpkPGgR0v/roXHoLTVihHa11Gmbsrp/sdU+XgA+F7kXAEgZW1/cu/rmyBW+0
         MiJAP+6fSdLdebptoEiu8tU6b6em/RHx1z2IzZ/JiGNVT8RI+Olk/55G7mt1QNvfcPd2
         hL4Q==
X-Forwarded-Encrypted: i=1; AJvYcCWgCkMsxoX+q0BRAEARpnoPbqhGpk8e89qkWxqnadHHuMJiaJSgdiZa3ALxZiMRhj+t4XD5kc3XpvGRiQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzGHRvXX+uFEnLY75J+giSVMzJ501WDa31iUP1aLAMyktJXNonI
	SARbpLjnDwMdGqOKNIcSd9u5DOdE178e43wGX1JdQAVy3+zNuFs2yTq9LDFDmV/7Lsc=
X-Gm-Gg: ASbGncvwYxFELH++M1JdrniO4lc7/vbEeZ6lfJgIdvQ3VzjZ/hGOobt5eOPNRd0m48/
	DzpiOkxwk6goPsDK1Pqnu/UEYTYwkEq2JIg8m2+oWN9TeUQ4CTUs1dwB3GdxWrYizech2+aAUp2
	t3eexIzvgJ95uw21RqL5HDDXURixSdZg0lX6lL4ZclNv3Ep47uWnfareFFPKhLYDV2o0C8LvB5L
	FxlDWd+ywd2P17iswkSx+N/2ZYk/3GrOi2AhD4FNj9K4hlZWdVAhMh7mVmtzTSdx6gsDO/uQZsG
	LRfoJ24qY8ie8OPmrdAGeH26JZfwroAfS52Y0BIRZYdsmTSmm1dAdlU66nKoI9JPgfWFZE3DuFa
	Y0JrIM+NxVsxjenqr3646MHO+Q5X08FtbzD5yxy1QKzvO5TvPy5NZgtQM41lG8I3EDMAvTaezV/
	WqlfWTno1vUQceI2v+Xf4SKnyGaRlcyIBSYcuvDsj3bbEBDhvwwKQipNWufy8M5W+QFtUVoYpvr
	qqDDP9gY9Bo5qRp
X-Google-Smtp-Source: AGHT+IFncZEIG2aB8fskoYH1N8Pf/o+3C4t3kr4xMiHMDpXB3GXPV+hTSqwVR4PFYW4I2LOJqiq/XA==
X-Received: by 2002:a17:907:7205:b0:b45:b1f2:fac0 with SMTP id a640c23a62f3a-b6dba4a8d87mr344374766b.29.1761650680970;
        Tue, 28 Oct 2025 04:24:40 -0700 (PDT)
Received: from localhost (2a02-8388-6584-6400-d322-7350-96d2-429d.cable.dynamic.v6.surfer.at. [2a02:8388:6584:6400:d322:7350:96d2:429d])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b6d853077d2sm1068327966b.3.2025.10.28.04.24.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Oct 2025 04:24:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 28 Oct 2025 12:24:39 +0100
Message-Id: <DDTX1PP2BBSX.WS61ZEATB649@fairphone.com>
Cc: <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <linux-media@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/3] media: qcom: camss: Add SM6350 support
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, "Luca Weiss"
 <luca.weiss@fairphone.com>, "Bryan O'Donoghue" <bod@kernel.org>, "Robert
 Foss" <rfoss@kernel.org>, "Todor Tomov" <todor.too@gmail.com>, "Vladimir
 Zapolskiy" <vladimir.zapolskiy@linaro.org>, "Mauro Carvalho Chehab"
 <mchehab@kernel.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Bjorn Andersson" <andersson@kernel.org>, "Konrad Dybcio"
 <konradybcio@kernel.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251024-sm6350-camss-v1-0-63d626638add@fairphone.com>
 <20251024-sm6350-camss-v1-2-63d626638add@fairphone.com>
 <7e7e35f3-82b6-4757-bbcd-38e0e867b184@linaro.org>
In-Reply-To: <7e7e35f3-82b6-4757-bbcd-38e0e867b184@linaro.org>

On Tue Oct 28, 2025 at 10:26 AM CET, Bryan O'Donoghue wrote:
> On 24/10/2025 13:24, Luca Weiss wrote:
>> +		.regulators =3D { "vdda-0.9", "vdda-1.25" },
>
> I'd like a little bit more consistency with the regulator names.
>
> 0p9 1p2 instead of 0.9 and 1.25

Based on the dt-bindings discussion, this will be updated in v2:

-          .regulators =3D { "vdda-0.9", "vdda-1.25" },
+          .regulators =3D { "vdd-csiphy-0p9", "vdd-csiphy-1p25" },

Regards
Luca

>
> ---
> bod


