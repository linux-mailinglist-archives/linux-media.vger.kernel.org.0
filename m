Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E1D4C431246
	for <lists+linux-media@lfdr.de>; Mon, 18 Oct 2021 10:40:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230477AbhJRIms (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 18 Oct 2021 04:42:48 -0400
Received: from mail.kernel.org ([198.145.29.99]:57918 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229820AbhJRImr (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 18 Oct 2021 04:42:47 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id C018060F8F;
        Mon, 18 Oct 2021 08:40:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1634546436;
        bh=pVL2Lx9SfeFrAJm5NBMEscVm8kP0KvbD0apM0HksDzc=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=JCl41TC2niDYaNsuizEeRFmrQ0ZBgce/iZEMycP2+vmaoISbv6iP7+hsQKLU6amGS
         JBBW0Rs9bIa+8GT+Tr8DcO8aWT9a9Z+mp070oiBQOnCS2//4nB23GCjluTHAcR+XHZ
         bLRGA6UdOS8+i8gy0MeZ61tEDHjGCL9Q5koHXr9clPszALm7KwMYo+3KxcEnRnPQpG
         iHlMKGnzWCmsrMiKDVRWmplUChkR8wnsa4Qz8onsFJV7nCrfbqS54FxAA2BB939zLL
         FdaMAZD4JYV+vQL56+e1dfyx02N3yjCzXg8ySad6tSIYV6VGqNTD069Y/8E/oAgpv1
         ttLFrk3ig2lXg==
Date:   Mon, 18 Oct 2021 09:40:32 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Michael Tretter <m.tretter@pengutronix.de>
Subject: Re: [GIT PULL FOR v5.16] Allegro fixes/enhancements
Message-ID: <20211018094032.40f7c656@sal.lan>
In-Reply-To: <710cddfc-e3c3-0cf3-d2f9-c38ef6ca8b1a@xs4all.nl>
References: <710cddfc-e3c3-0cf3-d2f9-c38ef6ca8b1a@xs4all.nl>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Mon, 11 Oct 2021 10:49:14 +0200
Hans Verkuil <hverkuil@xs4all.nl> escreveu:

> The following changes since commit fd2eda71a47b095e81b9170c3f8b7ae82b04e7=
85:
>=20
>   media: remove myself from dvb media maintainers (2021-10-08 13:56:25 +0=
200)
>=20
> are available in the Git repository at:
>=20
>   git://linuxtv.org/hverkuil/media_tree.git tags/br-v5.16i
>=20
> for you to fetch changes up to 8f472ea73758255b366fae57bde772396231efcd:
>=20
>   media: allegro: write vui parameters for HEVC (2021-10-11 10:18:33 +020=
0)
>=20
> ----------------------------------------------------------------
> Tag branch
>=20
> ----------------------------------------------------------------
> Michael Tretter (13):
>       media: allegro: ignore interrupt if mailbox is not initialized
>       media: allegro: fix module removal if initialization failed
>       media: allegro: lookup VCU settings
>       media: allegro: add pm_runtime support
>       media: allegro: add encoder buffer support
>       media: allegro: add control to disable encoder buffer
>       media: allegro: fix row and column in response message
>       media: allegro: remove external QP table
>       media: allegro: correctly scale the bit rate in SPS
>       media: allegro: extract nal value lookup functions to header
>       media: allegro: write correct colorspace into SPS
>       media: allegro: nal-hevc: implement generator for vui
>       media: allegro: write vui parameters for HEVC

Jenkins is reporting compilation breakage when -Werror is turned on:

patches/0010-media-allegro-extract-nal-value-lookup-functions-to-.patch:

    allyesconfig: return code #512:
	In file included from ../drivers/media/platform/allegro-dvt/nal-hevc.c:24:
	../drivers/media/platform/allegro-dvt/nal-hevc.h:416:30: error: =E2=80=98e=
num v4l2_quantization=E2=80=99 declared inside parameter list will not be v=
isible outside of this definition or declaration [-Werror]
	../drivers/media/platform/allegro-dvt/nal-hevc.h:417:40: error: =E2=80=98e=
num v4l2_colorspace=E2=80=99 declared inside parameter list will not be vis=
ible outside of this definition or declaration [-Werror]
	../drivers/media/platform/allegro-dvt/nal-hevc.h:419:14: error: =E2=80=98e=
num v4l2_xfer_func=E2=80=99 declared inside parameter list will not be visi=
ble outside of this definition or declaration [-Werror]
	../drivers/media/platform/allegro-dvt/nal-hevc.h:418:49: error: =E2=80=98e=
num v4l2_colorspace=E2=80=99 declared inside parameter list will not be vis=
ible outside of this definition or declaration [-Werror]
	../drivers/media/platform/allegro-dvt/nal-hevc.h:421:10: error: =E2=80=98e=
num v4l2_ycbcr_encoding=E2=80=99 declared inside parameter list will not be=
 visible outside of this definition or declaration [-Werror]
	../drivers/media/platform/allegro-dvt/nal-hevc.h:420:38: error: =E2=80=98e=
num v4l2_colorspace=E2=80=99 declared inside parameter list will not be vis=
ible

Are there any missing include?

Regards,
Mauro
