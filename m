Return-Path: <linux-media+bounces-884-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DB087F5C92
	for <lists+linux-media@lfdr.de>; Thu, 23 Nov 2023 11:38:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 549B32819EC
	for <lists+linux-media@lfdr.de>; Thu, 23 Nov 2023 10:38:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD04A2137A;
	Thu, 23 Nov 2023 10:38:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PHMiaI+c"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05BAC1C28C
	for <linux-media@vger.kernel.org>; Thu, 23 Nov 2023 10:38:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE516C433CB
	for <linux-media@vger.kernel.org>; Thu, 23 Nov 2023 10:38:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700735929;
	bh=p2hyFSZMchP3/9dCAytYtSTF0O7fbXlOb4QBMO8rtU4=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
	b=PHMiaI+crM4Uy1jOHYuodN1GYtWbC2YSBekq/MY1WNUXxrzg1N/RfVw7Uo2oVncaP
	 nG/V5cKH0tSuGppMX3AIfbRrGjWKRMJTfYRQVh1gfQaY6gqpiK7X7MUe4XekvJLMub
	 uKreh03e8DaxrCaR8Iqdzh7+BQ//oj85SXGtEfvpJSiYPeUaT3n9LD/gR5Ry93H+b6
	 G8S61/JozkIdm5eD+xBtM8fhEPlwhsbT4xwB+vtbnw9jEn/eQr+7SWzWmNy28gP6j6
	 8lzz1Cd/4JurUc7QcsF1+Z5HHI9VnoWJiihhKU5ftDFPmGo5cwwyNUilhMI+R9I/uY
	 TO+JDMp2MErAA==
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-5c1a75a4b6cso453175a12.2
        for <linux-media@vger.kernel.org>; Thu, 23 Nov 2023 02:38:49 -0800 (PST)
X-Gm-Message-State: AOJu0YyBhCGVay1aHIbqd++EsSpKmkcrrwut0is7pjZZy7mMjKF69xjB
	GPCrePNdOT6PQxfmUQacGRUqJtB4CJ+D/nU/Ftw=
X-Google-Smtp-Source: AGHT+IFHkmKesjjeYxAKXV7h+TUtecJsw79S2bL8Fr7wbH+uQKWzGp2Bc1z2r6iMR4jjvMTM5aJogh36smnwlH1K3/I=
X-Received: by 2002:a05:6a20:4401:b0:18b:386a:46a5 with SMTP id
 ce1-20020a056a20440100b0018b386a46a5mr4820129pzb.17.1700735929131; Thu, 23
 Nov 2023 02:38:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231027085058.k65rwgxepmx5ivu5@basti-XPS-13-9310> <20231123110230.7c7a9d8e@coco.lan>
In-Reply-To: <20231123110230.7c7a9d8e@coco.lan>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Thu, 23 Nov 2023 18:38:38 +0800
X-Gmail-Original-Message-ID: <CAGb2v64+-DE0t0M0aVQ4tBnMgsmaP96AeAJDy4AWPc0icAKfng@mail.gmail.com>
Message-ID: <CAGb2v64+-DE0t0M0aVQ4tBnMgsmaP96AeAJDy4AWPc0icAKfng@mail.gmail.com>
Subject: Re: [GIT PULL FOR 6.7] Mediatek Vcodec: Codec profile and level setting
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Sebastian Fricke <sebastian.fricke@collabora.com>, linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 23, 2023 at 6:02=E2=80=AFPM Mauro Carvalho Chehab
<mchehab@kernel.org> wrote:
>
> Em Fri, 27 Oct 2023 10:50:58 +0200
> Sebastian Fricke <sebastian.fricke@collabora.com> escreveu:
>
> > Hey Mauro and Hans,
> >
> > first attempt at doing a PR, could you please check and pull this?
> >
> > The following changes since commit 19e67e01eb1e84f3529770d084b93f16a489=
4c42:
> >
> >    media: venus: Fix firmware path for resources (2023-10-23 12:24:53 +=
0200)
> >
> > are available in the Git repository at:
> >
> >    https://gitlab.collabora.com/sebastianfricke/linux tags/for-6.7-sign=
ed
> >
> > for you to fetch changes up to ccd08a80f5e1844819874b01c5ff61e18aa9e133=
:
> >
> >    media: mediatek: vcodec: Set the supported vp9 profile for each plat=
form (2023-10-26 09:09:21 +0200)
>
>
> Checkpatch is producing some warnings here:
>
> WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possibl=
e unwrapped commit description?)
> #32:
> The following changes since commit 19e67e01eb1e84f3529770d084b93f16a4894c=
42:
>
> ERROR:GIT_COMMIT_ID: Please use git commit description style 'commit <12+=
 chars of sha1> ("<title line>")' - ie: 'commit 19e67e01eb1e ("media: venus=
: Fix firmware path for resources")'
> #32:
> The following changes since commit 19e67e01eb1e84f3529770d084b93f16a4894c=
42:
>
> ERROR:NOT_UNIFIED_DIFF: Does not appear to be a unified-diff format patch
>
> Could you please double-check those?

It seems like you ran checkpatch against this pull request email, not
the patches to be pulled in?

ChenYu

> Regards,
> Mauro
>
> >
> > ----------------------------------------------------------------
> > Mediatek Codec patches for 6.7
> >
> > ----------------------------------------------------------------
> > Yunfei Dong (7):
> >        media: mediatek: vcodec: Get the chip name for each platform
> >        media: mediatek: vcodec: Set the supported h264 level for each p=
latform
> >        media: mediatek: vcodec: Set the supported h265 level for each p=
latform
> >        media: mediatek: vcodec: Set the supported h264 profile for each=
 platform
> >        media: mediatek: vcodec: Set the supported h265 profile for each=
 platform
> >        media: mediatek: vcodec: Set the supported vp9 level for each pl=
atform
> >        media: mediatek: vcodec: Set the supported vp9 profile for each =
platform
> >
> >   drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c      =
     |  24 +-----------------
> >   drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c  =
     |  26 ++++++++++++++++++++
> >   drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h  =
     |  14 +++++++++++
> >   drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_statele=
ss.c | 168 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++=
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-
> >   4 files changed, 208 insertions(+), 24 deletions(-)
> >
> > Greetings,
> > Sebastian
>
>
>
> Thanks,
> Mauro
>

