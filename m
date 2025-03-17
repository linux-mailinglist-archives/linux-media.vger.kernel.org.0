Return-Path: <linux-media+bounces-28339-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 205BCA64419
	for <lists+linux-media@lfdr.de>; Mon, 17 Mar 2025 08:45:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BDFDF3A747F
	for <lists+linux-media@lfdr.de>; Mon, 17 Mar 2025 07:45:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 535BE21B90F;
	Mon, 17 Mar 2025 07:45:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="SKEvc+fa"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA2BB21ABC1
	for <linux-media@vger.kernel.org>; Mon, 17 Mar 2025 07:45:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742197550; cv=none; b=K21E54JEbUjHsBe8gOaQQNLQ/18YLD66dYn/NUC48hrGrmdVQY6wr02YazH+/lliDqkp6+FfCfnkkbV8UFit4FrBAePdoRNEGwMva/dZSGSdtvmriU1b+rSuMwkKX1CU4buMTFo3AnWduXEyLp8RvAZoPykz3eAiyW6i27p5xNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742197550; c=relaxed/simple;
	bh=z/35C6OncKImSrzwCMGsv4v7SHuEIwjIRKaGVCMngMk=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=K5W/qNe5yfS06inp5sGw1SRVr3lw/Bhp9NAxlk8SxD2NKkDnSyp9uInopgePPd7tpBhpvkJ4v3KgVjuOVDQABCClgc7A48gBrkkJ9wdE0qVvJl27S+UoGoQ1rmd8ljo5GqlJXytAUd4eT2yH78EBibL0Az3BO4oyf9PKmI4CIRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=SKEvc+fa; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5e5e8274a74so6522856a12.1
        for <linux-media@vger.kernel.org>; Mon, 17 Mar 2025 00:45:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1742197547; x=1742802347; darn=vger.kernel.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gl7H7yZOIWFrlEzxdHx2ScaCc87hpAhwNF8CQ1QYBik=;
        b=SKEvc+faLEJJIRTvnn7nJyhuqtSC91fYhPUaM4EqY2EHC+FV2cPcLnlBagyvmEnv3W
         dG69pcspGSax0w4/OXWmYqyo3Oh+qD1h+n8MCf3k2daVrm5Jh82vxgkpgHFAPokeq3Js
         CaoqeTH4hS1KfpGm2CYmIaK8qiisMHd4FwCp4U0823sGqc8UgkDF41QiveiFD+zo4bPf
         04zWvXBLP8z8wVzIKds/n1A77x9A9SGZgB7UEvgWmEX9Sea0lYdFQkOTnkonRi3wNZvw
         51KUI07RWyW+Kct/edAQq/TuyYm3PvALwuZkI09dbcWRzXOBA9X3fDHyC8BrwBRtuZf1
         JEHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742197547; x=1742802347;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Gl7H7yZOIWFrlEzxdHx2ScaCc87hpAhwNF8CQ1QYBik=;
        b=C9Sf/6trp4WExMc4cvqZF1NQO81aZ4m4TY9tr1VqbG2uA8Uoe/lR5gj1OK4ZbmBpO/
         S86zIL/4J557H3U1+WD6wYbQXsTtnH99TjYxo6CYW3TuvRsRjAaluuxB/tPMVo4jZFd6
         RDXKYTTkBBWHUfdwWAMaU+0Ac7Gw4KYDS74BSCxqfloEHw7kK4XCQTLJ+CQLhGrO/tO+
         ikSzJ6jkJebO+ivU3Jcko3D9gVNYj7eRzn389lOhKQ9dtzqg2lJhCRV9kLgS3kH3A+Wx
         XQyJtf8gTatrzSvBGpdUZALUIU+VyRX4gvuc+VV+Ovl2PAlArYsiBOy/ixZTHSsk/N72
         43Yw==
X-Forwarded-Encrypted: i=1; AJvYcCXAgYTJAhykMpx4MOPsWru+g1WL++Ck+36EmAreST1LDGJ9fZm7XgA4fKYaDtcd5YovkeGuDNwaTrEerw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzKI7fIuxgmgKGkQ6Gp3/I40QuiewGp3oomaDu3udippS9Jfx7K
	KOVPrKyM2U7v50bOt74uXQgVsabpZwMvHH6P2mxDWMQj13gPuo/AbtjkCP/wW7s=
X-Gm-Gg: ASbGnctXxYhIQCzQ8W0h9Lb93noBSvw9EibC+2a4AcF5qiTPiMZL/ma58IlwyazAOL+
	R27AIiQEHQ8pSvECGXZ9JwD/o6LZg7Po+lrxz1RzPsLSgpQHaRHJqCbvvGyNTShh4+St2puBKIj
	D30wSMPzkxOecSvkB6lJyKEy4u5dLeSPERoDfSm8/V4Wkhci55JqOsaJUSbDrmRnzFvnCnJ/7Za
	xZFblq73vTaJhL16TwobXkpsbbFbj599XI7i8lijRlhujqGUBfSewvLVbAoCzJuWYIfpMWZ1Kyj
	rlLEbqAoX+rX816SBio2v1uDKz2Th7Vw+YIgVGxojDRPH2JD3hhVX3aIGJUdTotbZ+WSgwzkJ2+
	v8fgIDHyo3AYGvw==
X-Google-Smtp-Source: AGHT+IGmNMHuunVdQSgHrKnOfe/ERZGsvr0xj7JwdS+NX5aLfGQnW8CH56uoLVrH9JWD/35XdRKpyA==
X-Received: by 2002:a17:907:2d92:b0:abf:6b14:6d00 with SMTP id a640c23a62f3a-ac3301e1e64mr1158441066b.5.1742197546956;
        Mon, 17 Mar 2025 00:45:46 -0700 (PDT)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3147ed1e4sm623996666b.66.2025.03.17.00.45.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Mar 2025 00:45:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 17 Mar 2025 08:45:45 +0100
Message-Id: <D8IDHJAC4BJ1.WNTMQEJXD2R2@fairphone.com>
Subject: Re: [PATCH 0/2] Some small preparations around CAMSS D-PHY / C-PHY
 support
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, "Robert Foss"
 <rfoss@kernel.org>, "Todor Tomov" <todor.too@gmail.com>, "Mauro Carvalho
 Chehab" <mchehab@kernel.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Barnabas Czeman" <barnabas.czeman@mainlining.org>, "AngeloGioacchino Del
 Regno" <angelogioacchino.delregno@somainline.org>, "Caleb Connolly"
 <caleb.connolly@linaro.org>, "David Heidelberg" <david@ixit.cz>, "Hans
 Verkuil" <hverkuil@xs4all.nl>
Cc: <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <linux-media@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20241209-camss-dphy-v1-0-5f1b6f25ed92@fairphone.com>
 <D82FU3SIX5RZ.1Y525GJO0UOAA@fairphone.com>
 <eb06daf1-3cc3-4b31-a0bf-bc450cd0f041@linaro.org>
In-Reply-To: <eb06daf1-3cc3-4b31-a0bf-bc450cd0f041@linaro.org>

On Wed Feb 26, 2025 at 3:47 PM CET, Bryan O'Donoghue wrote:
> On 26/02/2025 14:13, Luca Weiss wrote:
>> Hi all,
>>=20
>> On Mon Dec 9, 2024 at 1:01 PM CET, Luca Weiss wrote:
>>> Since the hardware blocks on the SoCs generally support both D-PHY and
>>> C-PHY standards for camera, but the camss driver currently is only
>>> supporting D-PHY, do some preparations in order to add C-PHY support at
>>> some point.
>>>
>>> Make the dt bindings explicit that the hardware supports both (except
>>> for MSM8916) but also add a check to the driver that errors out in case
>>> a dt tries to use C-PHY since that's not supported yet.
>>>
>>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>>> ---
>>> Luca Weiss (2):
>>>        media: dt-bindings: media: camss: Restrict bus-type property
>>>        media: qcom: camss: Restrict endpoint bus-type to D-PHY
>>=20
>> This series is still pending, both patches got reviews and no pending
>> comments from what I can see.
>>=20
>> Would be nice to get it in for 6.15.
>>=20
> Yes this should be merged.
>
> Thanks for following up.

Hi Bryan, hi Hans,

6.15 merge window is approaching fast, I wonder if this series was
missed still.

Regards
Luca

>
> ---
> bod


