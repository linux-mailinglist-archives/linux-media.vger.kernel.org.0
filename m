Return-Path: <linux-media+bounces-23484-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 578329F3629
	for <lists+linux-media@lfdr.de>; Mon, 16 Dec 2024 17:34:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 15F991883137
	for <lists+linux-media@lfdr.de>; Mon, 16 Dec 2024 16:32:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7893B206F06;
	Mon, 16 Dec 2024 16:29:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="i+52tTeI"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EE06207A35
	for <linux-media@vger.kernel.org>; Mon, 16 Dec 2024 16:29:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734366573; cv=none; b=NlR0LvoFdt+ALDd+KTP8c4R6XI9YPqh4s+1lEqyb3+xGV8LaFyouRH2GhiieewzmqxuRVyVc7M4hYKJ/0kvvijfHvEFyVCoizvv7nA8diMerrL5Mp7TjQFkLeNo0Hcf0OYeRGlXPwXY/B/meC4TdGWD17RbaPcaYJj1YAksHI8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734366573; c=relaxed/simple;
	bh=meBuQTqibPCoCdQtPAplVWCvCzXcGb+673eHerIjR58=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Oc7TFkcHJ++wBS/qTJixXBfdayOyFNeNWsSZ2oWidqV1Ti1eM3cugGICEspap2SQAjow4E0XvcNFkhpqHfn3n46m55/ZuwjjFl0g/6HejFA8ETYeKiV3QlSpe2nPP/2q14oI1voDwksXRz1H5Bn1rRIwxS+ILN5vI8bJJydKprw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=i+52tTeI; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2166022c5caso33585885ad.2
        for <linux-media@vger.kernel.org>; Mon, 16 Dec 2024 08:29:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1734366571; x=1734971371; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9Z59GLf8XiBlzN9yul/97/9j8EsBiViggAMyWm18iOo=;
        b=i+52tTeI93QYpiq5D/BRQ4fj81nCcaf7pdpNa8uB2lko+MaBdiVHULYj/RpC5C+VVE
         OP1WzlfT2fb5HUtIWFsAF8010s3aK7jD57aE78zCnZjtThor+Dz5QW/cj9E/7qNjcoze
         GTlQtAFL2AFh6/LPBjao+RT0xFI7UPKIPKUXU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734366571; x=1734971371;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9Z59GLf8XiBlzN9yul/97/9j8EsBiViggAMyWm18iOo=;
        b=FTGFFyRmgAPoZapd8M6cR7zxSKHu+Xu3mvExHBtjOWDXWbOY2FzNONbqW7LhAOqbyx
         5caAIPjTqh4MEImP3/fbNvV2u4asvomWRumJNNOmvux/yRSbeLiv211fluzr8OZojVmT
         lpp3fBr7oYFaQESEPvzCFUClwuJ6sq/OhzhS30gkZbu/EjJTvt3pgJ2KGcIIcnpOew17
         uqppfqeIdUg4x+VW232A3vhsBJ/7j9omiW1aTEMViTbEfzu3i8jNGQbHkK71pD9uUmFe
         CTmAFr4fXqZZKxOiQ6qXx/wBOqUeeRsc/dlR3H87sDGs86hKuDmtkFkSTUt64s1ULqEg
         PF2Q==
X-Forwarded-Encrypted: i=1; AJvYcCWLoFyTPMR55DskoV6CLg5WC+T4r1T78+SixeUyM1OstXwytQRM8hPYR2so3b2oEsSEyJ9ZI/VusHTESg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzWmCp3D0C5lF5EB3tUx3yicrefunGXlBdey2ddiAOG+96M7/Rr
	ipUoZDzCOsaltX6eR7XIOzL+T1ceIkqkvyuknsSU0b9pve6kLhAym4IUaKu6HDyPPA/6ez0EUJU
	=
X-Gm-Gg: ASbGnctWrnnFcKAEahqEoNULUlbRZGsX+MaCU7kzShTGcv1o/qpJtbl6MIlpsMn0uMn
	ieWYqPx5QowCSWMmWxAanusqkH88fVirewdbV2lq/zucZ7pbvZbPQB+Plsi9Jp8j56fbXuozaMb
	2h6SN8rS/4UFXP32No/cXjtqQ4ZuVjOhq83E3wN8U7I1GZm71E4D+Ot5XfP2aI2vLtRhKrtzm8M
	B0dmTuPBHBEZ3FBDePfj2Ge/AG3D+zMj1EiLGdqB7ypCyh9Mp8sNKb28RLh1KyPvhfDHKOPVHo6
	KI1a4NuIO5Xd3YtMQ7A=
X-Google-Smtp-Source: AGHT+IGahHYZoyWm14MO7ufVDZM9mxdyomIoXO/BxqaL9jFU0Ej1z0Cx9eNEbB3toEUFGp+/42vpsA==
X-Received: by 2002:a17:902:ce04:b0:215:b45a:6a63 with SMTP id d9443c01a7336-21892a115c7mr201477705ad.32.1734366571334;
        Mon, 16 Dec 2024 08:29:31 -0800 (PST)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com. [209.85.216.46])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-218a1e4ffd9sm44961995ad.142.2024.12.16.08.29.30
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Dec 2024 08:29:30 -0800 (PST)
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-2ef8c012913so3058380a91.3
        for <linux-media@vger.kernel.org>; Mon, 16 Dec 2024 08:29:30 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWbCHn7WG/BlwDUd4FEMNSxzt/m+uMZwE+Hd/+g2rTS+v4BDhz2BbT3ZdXms7JTSNhUXQ/hSe6lbtAWhw==@vger.kernel.org
X-Received: by 2002:a17:90b:5105:b0:2ee:ed07:d6d2 with SMTP id
 98e67ed59e1d1-2f2902ac693mr18968712a91.37.1734366569425; Mon, 16 Dec 2024
 08:29:29 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241216-ipu-doc-v1-1-e07f0b4f9065@chromium.org> <Z2BOAHleNCsuCoHq@kekkonen.localdomain>
In-Reply-To: <Z2BOAHleNCsuCoHq@kekkonen.localdomain>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 16 Dec 2024 17:29:17 +0100
X-Gmail-Original-Message-ID: <CANiDSCv6vC5uzeswB__biC42j=01-kZkoKYW2FQv-cDAULiKtg@mail.gmail.com>
X-Gm-Features: AbW1kvZi_6EfyZOTZs3A0KuJkDkszn8E8Jb-ClaSZjICowH_1EO2R4Flpkq-6vk
Message-ID: <CANiDSCv6vC5uzeswB__biC42j=01-kZkoKYW2FQv-cDAULiKtg@mail.gmail.com>
Subject: Re: [PATCH] media: Documentation: ipu3: Remove unused footnotes
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Bingbu Cao <bingbu.cao@intel.com>, Tianshu Qiu <tian.shu.qiu@intel.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 16 Dec 2024 at 16:58, Sakari Ailus <sakari.ailus@linux.intel.com> wrote:
>
> Hi Ricardo,
>
> On Mon, Dec 16, 2024 at 03:51:28PM +0000, Ricardo Ribalda wrote:
> > These footnotes are not used, or they are used in a codeblock:
> > Documentation/media/admin-guide/ipu3.rst:592: WARNING: Footnote [#] is not referenced. [ref.footnote]
> > Documentation/media/admin-guide/ipu3.rst:598: WARNING: Footnote [#] is not referenced. [ref.footnote]
> >
> > Remove them for now.
> >
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
>
> You seem to have written the same patch I have. :-)
>
> I'm about to send a PR soon, however if you can get this merged before
> that, let me know and feel free to add:
>
> Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>

Let's land your patch. I already marked this as duplicate.

Thanks!

>
> --
> Sakari Ailus



-- 
Ricardo Ribalda

