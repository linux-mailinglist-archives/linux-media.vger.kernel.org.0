Return-Path: <linux-media+bounces-460-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DAC77EE4AA
	for <lists+linux-media@lfdr.de>; Thu, 16 Nov 2023 16:50:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5B1691C20A51
	for <lists+linux-media@lfdr.de>; Thu, 16 Nov 2023 15:50:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B5E836AF1;
	Thu, 16 Nov 2023 15:50:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UF9HIah3"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4E2A364C9
	for <linux-media@vger.kernel.org>; Thu, 16 Nov 2023 15:50:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2422BC43391;
	Thu, 16 Nov 2023 15:50:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700149824;
	bh=BolSwldx43V1s8lR3ByoyIMODjpgx8SOOvx2mkBrbUI=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
	b=UF9HIah3VHoLbYth2CTAiD1ubicY+3D8g70w32pOj8EiJBfWgopgAv+aS118WcvSd
	 D7MOh9+8VypvhXwQX8ohvQYLcPhvCTYogzjM/RJUefhmFk2hzi+hgq3MiD081Fom4i
	 XH1a33/MHR4QzKmupt6urAfAFvX4pn8AbQskBC1CE1gqPAPNSSadHvbyew2Anb6KXO
	 Tm9KCx/wJ+y9Hgl8A7/U8BQlpfD8g53pcMErzwqdFJGhO+5lt2FdSF0EjWGPN7A8bW
	 IpKruvN8lZK3aXyVB9xtnd33CfwZtqonmfZuuG2RDyIyK8DIexINh0OH1Jr4j6wOSb
	 ULZu8Hu6cjEDw==
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-5be30d543c4so714194a12.2;
        Thu, 16 Nov 2023 07:50:24 -0800 (PST)
X-Gm-Message-State: AOJu0YyVQyOHnrpQ4vus+FXAq1fVkJBuwPJGZcvceYVo8O0OhNHAAomU
	oBKBPoGqDCJI1TDB57eXfThB8AACuExW40KCXhA=
X-Google-Smtp-Source: AGHT+IEMGFlu4SzYQe96Vr6F03Rp/SrNkJGccyxr7tmeveiTXRgztgXi+I4dU+cty9a2FC6wuDTy4PmEvaAETZ2DgJ8=
X-Received: by 2002:a17:90b:1802:b0:280:1c25:b633 with SMTP id
 lw2-20020a17090b180200b002801c25b633mr14521522pjb.2.1700149823613; Thu, 16
 Nov 2023 07:50:23 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231116154816.70959-1-andrzej.p@collabora.com> <20231116154816.70959-2-andrzej.p@collabora.com>
In-Reply-To: <20231116154816.70959-2-andrzej.p@collabora.com>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Thu, 16 Nov 2023 23:50:12 +0800
X-Gmail-Original-Message-ID: <CAGb2v64dFzqvvY4BanJ6WO667jFvxaoAX68EACYz7-Byu9i7qg@mail.gmail.com>
Message-ID: <CAGb2v64dFzqvvY4BanJ6WO667jFvxaoAX68EACYz7-Byu9i7qg@mail.gmail.com>
Subject: Re: [RFC 1/6] media: verisilicon Correct a typo in H1_REG_ENC_CTRL2_DEBLOCKING_FILTER_MODE
To: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Cc: linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	Hugues Fruchet <hugues.fruchet@foss.st.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
	Daniel Almeida <daniel.almeida@collabora.com>, 
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Nicolas Dufresne <nicolas.dufresne@collabora.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 16, 2023 at 11:48=E2=80=AFPM Andrzej Pietrasiewicz
<andrzej.p@collabora.com> wrote:
>
> It's a FILTER and not FILETER.
>
> Signed-off-by: Andrzej Pietrasiewicz <andrzej.p@collabora.com>

Reviewed-by: Chen-Yu Tsai <wens@csie.org>

