Return-Path: <linux-media+bounces-27046-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 27D89A461FF
	for <lists+linux-media@lfdr.de>; Wed, 26 Feb 2025 15:13:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7A57C175118
	for <lists+linux-media@lfdr.de>; Wed, 26 Feb 2025 14:13:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4EB3221724;
	Wed, 26 Feb 2025 14:13:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="oeQkAmaw"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 973CC22171D
	for <linux-media@vger.kernel.org>; Wed, 26 Feb 2025 14:13:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740579217; cv=none; b=RPyATdAHrh46ZT+09InbfI6e4vBga8mciLBgiZKEzKf5otQjFcikFqckOYBGUl//KMDup/1qyEWlpa0c/5AgMot4n4d+K17czJ8qCetwAOHHOqi+OpvkWBaHk47kDp/AGQ9hg0+0KgdJoJRCXrJVwT3KL5ki6jMmAK9ETI7HkyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740579217; c=relaxed/simple;
	bh=NakPrcYHABUnkE9/40aDSNT5XIpd9QvW3ezgcg7EAk8=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=JRaOFOHzRPvtd9ZvWpQN2mnXmP8MCq9WZwx7AHvnLU3PrnXH1JOdHk1M5xYz59NnvBPvflNWAyS1TjcLPpsr/otL99+nTjPbPmXsXyuRco/kzjDZeTCI+cViplHENEtiPgE0eg+hOdaK50glFucb7KNg7KT2+9zkMnH55VPsp00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=oeQkAmaw; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4394a823036so65838235e9.0
        for <linux-media@vger.kernel.org>; Wed, 26 Feb 2025 06:13:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1740579214; x=1741184014; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vgbpb+wQs1fiWsUu+quFf7N3iJTinXogOjcbntSJGqg=;
        b=oeQkAmawKdFkOYIh1KZFQXcbri2BxNd4USu1sfqxG1oG4BhpFo600nhh6wWLLDlXTB
         OsPrUz8eNDTFeQBsPtAtxKDMv6m4fPhcI9ityR7RSBOOwzURU+LdzDsNuSkEDx0supIs
         NhVQlvcEABsAw6jwUGO8u03wAnafGXqMHwNP4JvciSUkJkAYDKjjIDeLJeH3Bg/qTPZu
         PnxTxFwG6HYXTKpjxWr3tzWt07PPUn8ZjvsYjKi2zvOFf2Z0EX5iOLztv3ae8RHq3x+7
         f3KB0hRtFHCYXs6QkVNrebs7WOrVhkh7DYxGDGx3iyRgrnnAalh/D8Q7XUNyQn9QSNLq
         QhuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740579214; x=1741184014;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vgbpb+wQs1fiWsUu+quFf7N3iJTinXogOjcbntSJGqg=;
        b=kiuKwbqDGdNBrVQSCt8YL7je6nKAZtvVAb+ob9230USuwgRLvGg1Hd7H+QwrmSX0E4
         TdWjLGi3BJQflAMCtiFxKmd+GrorNg9BQrH2goF+ZyZB9gSaDf293JbrY/0rOF2pZdBM
         j5Pw0IS3+Vi30AafTqYxiW9cBDSXVoMRHhYCEJY35aVM6VwSJxP92hgWXNpqLmtdJusn
         92lNx7XcbzPXAIW8Bfa7nFP/R+3jtvkLs5TxS3Huu4eCkzVjEXR4epdreasIu+7sP/lJ
         sYrkw1RcXIDziyrSOTBEZkIH+fDcgkbmE+5Xsvsd4mnW2Ag4wrgJRJIT9vx76lomxguL
         qtmA==
X-Forwarded-Encrypted: i=1; AJvYcCVQVecBs0FUZhwFJH+4MKzpdWLNQxr5J4DafuacqibRUXqRU4o9L7veJanLSnq1vuTNZK7bu8HkjiMpgg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0xUADS/a6m0jVRi1W/D4gctTXzawLbGsWeb7v4K4AVyniJLrJ
	RS9Ft/xYLcEOZDbwLfqwabZAo73LlwW57CkYS9p53ZSnGysuC2Wor+qtrgPw2BI=
X-Gm-Gg: ASbGncsR5wpGlh7F1OqP6feepfWP9MJ/fzjy+8GNHRBHnyn68d5t+tBPhfQDEKZXWH7
	n9OiLnfO4ZWtX3+o9lT5ETKGsgH2gKWbwMUOo5kgjdgYo4pvagFc2QbdYlhmaP9vdAP5I5gQiDV
	Qcz251ClXatE/Z4fomohn7ZuNGiTJg47dFU+X6a8HvVHTQUMP89xdHQOacgoueFyWW7jTgbj1GD
	Y8vU8XelJpmEm1Rs8N/KNKkNRCprLrjKLYgIiDnKsVTB6aDhxI2xu2YDbHWWbLfE3lHrnWhK4Gu
	iyKZkAhwifExlmY4h2qYGRgTDICii2hCAflLm6XFgdoxeyUfVFY+9cSDTx7kxl4OikU+tUs=
X-Google-Smtp-Source: AGHT+IGjMBREYHM3Ps9vQIMuqM9jKVtM80DfGnNOYnRFojf/OC403IkVNKEcMty4GV6fP9tsA8PHBQ==
X-Received: by 2002:a05:600c:19ce:b0:439:92ca:f01b with SMTP id 5b1f17b1804b1-439aeb34975mr170790095e9.13.1740579213904;
        Wed, 26 Feb 2025 06:13:33 -0800 (PST)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390cd8e7121sm5791619f8f.61.2025.02.26.06.13.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Feb 2025 06:13:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 26 Feb 2025 15:13:33 +0100
Message-Id: <D82FU3SIX5RZ.1Y525GJO0UOAA@fairphone.com>
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Luca Weiss" <luca.weiss@fairphone.com>, "Robert Foss"
 <rfoss@kernel.org>, "Todor Tomov" <todor.too@gmail.com>, "Bryan O'Donoghue"
 <bryan.odonoghue@linaro.org>, "Mauro Carvalho Chehab" <mchehab@kernel.org>,
 "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Barnabas
 Czeman" <barnabas.czeman@mainlining.org>, "AngeloGioacchino Del Regno"
 <angelogioacchino.delregno@somainline.org>, "Caleb Connolly"
 <caleb.connolly@linaro.org>, "David Heidelberg" <david@ixit.cz>
Cc: <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <linux-media@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 0/2] Some small preparations around CAMSS D-PHY / C-PHY
 support
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20241209-camss-dphy-v1-0-5f1b6f25ed92@fairphone.com>
In-Reply-To: <20241209-camss-dphy-v1-0-5f1b6f25ed92@fairphone.com>

Hi all,

On Mon Dec 9, 2024 at 1:01 PM CET, Luca Weiss wrote:
> Since the hardware blocks on the SoCs generally support both D-PHY and
> C-PHY standards for camera, but the camss driver currently is only
> supporting D-PHY, do some preparations in order to add C-PHY support at
> some point.
>
> Make the dt bindings explicit that the hardware supports both (except
> for MSM8916) but also add a check to the driver that errors out in case
> a dt tries to use C-PHY since that's not supported yet.
>
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
> Luca Weiss (2):
>       media: dt-bindings: media: camss: Restrict bus-type property
>       media: qcom: camss: Restrict endpoint bus-type to D-PHY

This series is still pending, both patches got reviews and no pending
comments from what I can see.

Would be nice to get it in for 6.15.

Regards
Luca

>
>  .../bindings/media/qcom,msm8916-camss.yaml         |  8 ++++++
>  .../bindings/media/qcom,msm8953-camss.yaml         | 15 +++++++++++
>  .../bindings/media/qcom,msm8996-camss.yaml         | 20 +++++++++++++++
>  .../bindings/media/qcom,sc8280xp-camss.yaml        | 20 +++++++++++++++
>  .../bindings/media/qcom,sdm660-camss.yaml          | 20 +++++++++++++++
>  .../bindings/media/qcom,sdm845-camss.yaml          | 20 +++++++++++++++
>  .../bindings/media/qcom,sm8250-camss.yaml          | 30 ++++++++++++++++=
++++++
>  drivers/media/platform/qcom/camss/camss.c          |  9 +++++++
>  8 files changed, 142 insertions(+)
> ---
> base-commit: fac04efc5c793dccbd07e2d59af9f90b7fc0dca4
> change-id: 20241209-camss-dphy-8bf46e251291
>
> Best regards,


