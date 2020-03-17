Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 87F58187ABB
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2020 08:58:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726082AbgCQH60 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 17 Mar 2020 03:58:26 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:41099 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725536AbgCQH6Z (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 17 Mar 2020 03:58:25 -0400
Received: by mail-lj1-f195.google.com with SMTP id o10so21657298ljc.8;
        Tue, 17 Mar 2020 00:58:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=zllu9dyob3KR6mqd5D9YEgxS//bxCCQ/mmmNOs5S+jY=;
        b=kE3/Af4s7Np2SGnO2kk/xC9qG1nv/Blz1B5vv5vafcCUYNEUNkH3UIsjN6bfQZ2trH
         faYAwkZ73guJVi58YtaXhfBabRHe+UYXAcdiRwyUlKqkLrCvDgORFFCq4UCVTsCmkf8r
         cFsj6Op1Fjd+wJiFdragkc6fK6bVe9jdBXBLeBNsH0mhICIKvJrAwKvl0DoOdrG4OfZB
         sG43dSApb5zORjBJi8e7Ve3M4JtX47oOmn39es+GYGLAg+S7/Zy/7BZzmVtOlXpUP7C2
         hej0d2XoVfgeKAHC+4ZSl5YJGrDmvWY3Nq2iiiB1sql0jXWxNvwbHYyMx1b/5NOSKHQg
         O5ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=zllu9dyob3KR6mqd5D9YEgxS//bxCCQ/mmmNOs5S+jY=;
        b=VShOqiPgn25nr/dtIzwmtJ+A5jDp/h/afvBL56hO8ZLLJYXBxMelVNc58lZTziX3A5
         1ouxLgVjQ9g9vCX60EwHZ4dwKzhevGRWQaLK2cxexhUMxXQvNlYYdgb4Dgub58CoJ5R4
         76gokdRtYIw2D396N3XARxGEMdrwPb5rtrcLpTLyhaHPvhT1qp14Tst51SzsyqMkDN0H
         4jl6Ev+sQgAktAIF1Pjj/3aYftSvYOvEs7R8cjWmA0U1baD0JcYmaZarXXTulAhcZJnI
         vvdhs3xGgBtyDF09NZS3m1bC1p9StKFQ/Icu02Pig+kAnF6TzJ+cSlnkikxdBngArtR1
         OiDQ==
X-Gm-Message-State: ANhLgQ25ICuLxR/olDHBcs5w1Yi2NEL/T35jGHYPUaCEk95vQChJY8wP
        ByH5Dt5uttBlpDUbtiP6L9NTBzPY
X-Google-Smtp-Source: ADFU+vsrCJIN5MM8IPzGQvIGA4jCAxyZ9ZjipnpLKf1O7P8hDyvknoCAYHD5D4uxP4IhXvfS/eA1VQ==
X-Received: by 2002:a2e:3c01:: with SMTP id j1mr1991421lja.175.1584431902850;
        Tue, 17 Mar 2020 00:58:22 -0700 (PDT)
Received: from gmail.com (94-255-169-249.cust.bredband2.com. [94.255.169.249])
        by smtp.gmail.com with ESMTPSA id q4sm2045458lfp.18.2020.03.17.00.58.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2020 00:58:22 -0700 (PDT)
Date:   Tue, 17 Mar 2020 09:01:35 +0100
From:   Marcus Folkesson <marcus.folkesson@gmail.com>
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Lad Prabhakar <prabhakar.csengg@gmail.com>
Subject: Re: [PATCH v4 0/3] media: i2c: imx219: Feature enhancements
Message-ID: <20200317080135.GA138007@gmail.com>
References: <1583846229-6799-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1583846229-6799-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

To which tree does this patchset apply?

On Tue, Mar 10, 2020 at 01:17:06PM +0000, Lad Prabhakar wrote:
> This patch series does the following:
> 1: Makes sure the sensor is LP11 state on power up
> 2: Adds support for RAW8
> 3: Adds support for 640x480 resolution
>=20
> Changes for v4:
> 1: Fixed review comments for patch 2/2 as request by Sakari.
>=20
> Changes for v3:
> 1: Only patch 3/3 was posted for review.
>=20
> Changes for v2:
> 1: Dropped setting the format in probe to coax the sensor to enter LP11
>    state.
> 2: Fixed switching between RAW8/RAW10 modes.
> 3: Fixed fps setting for 640x480 and switched to auto mode.
>=20
> Lad Prabhakar (3):
>   media: i2c: imx219: Fix power sequence
>   media: i2c: imx219: Add support for RAW8 bit bayer format
>   media: i2c: imx219: Add support for cropped 640x480 resolution
>=20
>  drivers/media/i2c/imx219.c | 235 ++++++++++++++++++++++++++++++++++++++-=
------
>  1 file changed, 202 insertions(+), 33 deletions(-)
>=20
> --=20
> 2.7.4
>=20


Thanks,
Marcus Folkesson
