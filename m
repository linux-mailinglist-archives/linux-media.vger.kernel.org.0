Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 782643B2D52
	for <lists+linux-media@lfdr.de>; Thu, 24 Jun 2021 13:10:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232414AbhFXLNM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 24 Jun 2021 07:13:12 -0400
Received: from mail.kernel.org ([198.145.29.99]:57062 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232331AbhFXLNM (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 24 Jun 2021 07:13:12 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 23FD0613C5;
        Thu, 24 Jun 2021 11:10:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1624533053;
        bh=5unXQcGdHXGPpEFQQQrkEbjDJEEaT7SqNyX7wbWI3LM=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=Dg/Wn6YISmWoO6sovfHAK+pCBZbEZurug6JecfKC/DQ8F+3PJKySz2UKT0h3YocN4
         n54UMhjA8+VQBvGO0q7HFz9PMkjgmq81nA9/egYvPkX/rv5+p7QMDf89OG49Y1NHaK
         zDqzZkvvpgmIO8LhD9lAHhBbgOZEwu1jpGQ1KL9l4LlQdeAq7U+7P2YYrAnc8dh/ca
         Y5wDCWYuOcuRHlVwhXS4QT5kZjglarp+tSK3rJ9Uwv0Xfrw9+gzesH0uPQE8YsR6Z1
         L6pRUkf/uU7y4GVlIHSAYHFmrnrkTkRduwZgoox8vc8ZVFP4GdK/IHGp2lv4lkz/4d
         4VZnKGvjTgdVQ==
Date:   Thu, 24 Jun 2021 13:10:48 +0200
From:   Mauro Carvalho Chehab <mchehab@kernel.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Krzysztof =?UTF-8?B?SGHFgmFzYQ==?= <khalasa@piap.pl>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC v2] MEDIA: Driver for ON Semi AR0521 camera sensor
Message-ID: <20210624131048.1272f272@coco.lan>
In-Reply-To: <YNHQDNdpxcY8+IV2@pendragon.ideasonboard.com>
References: <m3wnqm5eqo.fsf@t19.piap.pl>
        <YNHQDNdpxcY8+IV2@pendragon.ideasonboard.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Tue, 22 Jun 2021 14:57:00 +0300
Laurent Pinchart <laurent.pinchart@ideasonboard.com> escreveu:

> Hi Krzysztof,
>=20
> Thank you for the patch.
>=20
> On Tue, Jun 22, 2021 at 01:18:55PM +0200, Krzysztof Ha=C5=82asa wrote:
> > Changes from v1:
> > - added power management (power supplies, no chip initialization in
> >   probe()).
> > - added [HV]BLANK v4l2 ctrl interface (the "interval" interface is
> >   still implemented for better timing control)
> > - many fixes, including ones requested by Laurent Pinchart.
> >=20
> > The driver has been extensively tested in an i.MX6-based system.
> >=20
> > Not yet signed off - this will change of course. Please do not merge
> > yet, however comments about being ready (or not) to be merged are
> > welcome. =20
>=20
> To spend time reviewing this code, I want to know it will be mergeable,
> and that requires a SoB line. That's a blocker I'm afraid.

If:
	- the driver is in good shape, e. g. no coding style issues,
	  it uses the right kAPI at the right way, etc;
	- the driver is based on the current media_tree.git tree;
	- if you're willing to be responsible during the review process;
	- you would provide maintainance support for the driver if
	  bugs are reported;
	- the driver has a valid Signed-off-by;

then the driver is mergeable.

Media maintainers need a SoB in order to be able to review, as
driver review takes a lot of time and efforts from reviewers, and
the time they spend reviewing a driver prevents them to do their
(paid) work.=20

That's said, on a very quick check, it sounds that this driver requires
some work. For instance, it is based on an v4l2_subdev_pad_config,
which was recently replaced upstream.


Thanks,
Mauro
