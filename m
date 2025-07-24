Return-Path: <linux-media+bounces-38364-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5326EB1072B
	for <lists+linux-media@lfdr.de>; Thu, 24 Jul 2025 11:59:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B1F894E469C
	for <lists+linux-media@lfdr.de>; Thu, 24 Jul 2025 09:58:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1456D25B1EA;
	Thu, 24 Jul 2025 09:59:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="MJDwGuzd"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7056625A626
	for <linux-media@vger.kernel.org>; Thu, 24 Jul 2025 09:58:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753351140; cv=none; b=pBwIYquFIifl++6tQqd8NSYkoGbJg+nKY9M6I7jPpBc83QZ4bsPcYJVQn57w5hEUOQAGlq01To3ztqaY2aaVwzFg0R7lmbvI+hrlvz/v0JH3x17my9UoYiUtYCIiFuJ/YO6ven3RmnPlAp158P+13GLfYe6PpwPFRaSVOze3ugg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753351140; c=relaxed/simple;
	bh=3lDH5ARB26e8DbHF4MxQq93Rk0WGstJeVZQEGstfRkg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DvTzR0HkvPdtqs7HbV1sVItGsOt4GLti+cJ3TXdmSzGmwmuMz3qhkgZpeUBqjLQmnAy+wMVKRW/HpYZvm1Ijfweh9Zln3KN6smMDrdNO4xpLBN6IM/jECjXsT3TPIRUtB+ZvGzBt20z2c7cMGDQjzyrelPTYZjqn+jqDAQwvzjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=MJDwGuzd; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-553dceb342fso636955e87.0
        for <linux-media@vger.kernel.org>; Thu, 24 Jul 2025 02:58:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1753351137; x=1753955937; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3lDH5ARB26e8DbHF4MxQq93Rk0WGstJeVZQEGstfRkg=;
        b=MJDwGuzdBt8lJEfC5oMMVj5dgKxNuAi/xNdia9i31OCMslYNVG2vNAeRuO0iAUKzgL
         b3J0gGVCbd+ivE/0w+/xSCJxTUi4kkSbE8IACHtpmhVNDZha5m/d5G9FgrsP2qlowuyk
         yYWXslIJQsZ71G6vkM06Te+OZ+/L6ZQjzl508=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753351137; x=1753955937;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3lDH5ARB26e8DbHF4MxQq93Rk0WGstJeVZQEGstfRkg=;
        b=ThV0rsROhcq+VJ26M/+s3p/vuQ6akW5u75G3z/FAO9cki0YvK7hL2S0VKx+aO7uXQT
         LyiUgqUjCrC8i7qTVVsVoy09bX9aCDEFdkYijhnNc7lT90JfMDJ6uSDfzZZ+eFh+hp0s
         PuMWsEM0IBCt735gssu2HQpgGfpaMMt0yYyhs0XoMbjV0SXmjbDc50v7qXz6auzzVVYM
         oyb6Z9Xfz4uYyixvDlC/s+jlDk6kllgmIB/+wPYUp0nJ+HF1OBZhyP6R/JntuO+a8aBc
         dbKHVbRXCwjZVVwrxUHLqSuxN9Cc1pycTJH03iPks81TrCvyorK6CCT0hYSaElhz1RUE
         n3vw==
X-Forwarded-Encrypted: i=1; AJvYcCURxGyZOrTH7cb1i/8pHg4Uk3jxCNlsdvBX7FBazXXm0py5WqK5h+XFEsevpe0s/sBkAmkTyUQh0t8ktw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxPsdvjEkPc3dkQ8kZ6TWxAJ5bJrdUbQH63IQ5L1JEiTHKCdOf1
	ef90jNcn5QkmFW4NwdFTaODdGXIcE1rDFzg8XElTUz8wUSwOjEaMVJZf4u4Q5V8f9Zbzvo3hxS2
	D6fye6JO7GqYRwQLvHykT1+4IRlz0/fCCzrJnbB2b
X-Gm-Gg: ASbGncv1zTHFdkOaZnTyAGERzgKp9td1z8K/iZ5yzxKFUdU5d5OxzfLVbQRknD1pgI0
	01506r6RYLPr5iyVC7+cf7qCcCRnPHIFU/1JmoshgpVXpuytzTtDp/cbamXvIPdXMbzYBtftHNv
	UDyHGtx+C8pQ6HmxcoeUCRIvkBYKzBFCaOXvA93NZ1ncCMkMWcCxW9eK+OaX4daIWdViMhqjZZH
	oOFTm/gISYWEw+X/LytYtqPCvxX7M7L7vY=
X-Google-Smtp-Source: AGHT+IFbWpnNaQRMkmMGCWJwKWLSFPCgKrpUVJhkWhmCg8wuzEAglTGmiTQG4cugbeqoeX5uFAZWT86WnfNSaUywLGk=
X-Received: by 2002:a05:6512:60d:20b0:554:f7ec:3b23 with SMTP id
 2adb3069b0e04-55a51359f3dmr1559012e87.15.1753351136563; Thu, 24 Jul 2025
 02:58:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250724083914.61351-1-angelogioacchino.delregno@collabora.com> <20250724083914.61351-37-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20250724083914.61351-37-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 24 Jul 2025 17:58:45 +0800
X-Gm-Features: Ac12FXwhroXh9igzrCvp17h0_fa0JxIrUDzrCtprSHzHickYMU-wGcIvqxYBtBo
Message-ID: <CAGXv+5G3kbSzs99mogy57mh+LUdi_87zBmFH8GQFWvROhLFbDg@mail.gmail.com>
Subject: Re: [PATCH 36/38] arm64: dts: mediatek: mt8195-cherry: Add missing
 regulators to rt5682
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-mediatek@lists.infradead.org, robh@kernel.org, 
	herbert@gondor.apana.org.au, davem@davemloft.net, krzk+dt@kernel.org, 
	conor+dt@kernel.org, chunkuang.hu@kernel.org, p.zabel@pengutronix.de, 
	airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com, 
	mripard@kernel.org, tzimmermann@suse.de, jassisinghbrar@gmail.com, 
	mchehab@kernel.org, matthias.bgg@gmail.com, chunfeng.yun@mediatek.com, 
	vkoul@kernel.org, kishon@kernel.org, sean.wang@kernel.org, 
	linus.walleij@linaro.org, lgirdwood@gmail.com, broonie@kernel.org, 
	andersson@kernel.org, mathieu.poirier@linaro.org, daniel.lezcano@linaro.org, 
	tglx@linutronix.de, atenart@kernel.org, jitao.shi@mediatek.com, 
	ck.hu@mediatek.com, houlong.wei@mediatek.com, 
	kyrie.wu@mediatek.corp-partner.google.com, andy.teng@mediatek.com, 
	tinghan.shen@mediatek.com, jiaxin.yu@mediatek.com, shane.chien@mediatek.com, 
	olivia.wen@mediatek.com, granquet@baylibre.com, eugen.hristev@linaro.org, 
	arnd@arndb.de, sam.shih@mediatek.com, jieyy.yang@mediatek.com, 
	frank-w@public-files.de, mwalle@kernel.org, fparent@baylibre.com, 
	linux-crypto@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-phy@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-remoteproc@vger.kernel.org, linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 24, 2025 at 4:41=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Add the missing DBVDD and LDO1-IN power supplies to the codec
> node as both RT5682i and RT5682s require those.
>
> This commit only fixes a dtbs_check warning but doesn't produce
> any functional changes because the VIO18 LDO is already powered
> on because it's assigned as AVDD supply anyway.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>

Confirmed this matches the schematic.

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

