Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C9F8B4A0092
	for <lists+linux-media@lfdr.de>; Fri, 28 Jan 2022 20:01:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350700AbiA1TBQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 28 Jan 2022 14:01:16 -0500
Received: from meesny.iki.fi ([195.140.195.201]:59134 "EHLO meesny.iki.fi"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233548AbiA1TBQ (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 28 Jan 2022 14:01:16 -0500
Received: from hillosipuli.retiisi.eu (dkvn5pty0gzs3nltj987t-3.rev.dnainternet.fi [IPv6:2001:14ba:4457:9640:1e2d:1f75:a607:ef37])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by meesny.iki.fi (Postfix) with ESMTPSA id 8AC082005D;
        Fri, 28 Jan 2022 21:01:13 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
        t=1643396473;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=KLYLDHjWR/WaUfpGcms73tXXOgAtasYqQ4MORqEJT58=;
        b=ZzB/AjvOeWKt6CO22pOw5HVvSNx5t7nncMbgD4AyONrGvnsx+StvAcdS/jKmf/FNG8jgIH
        Muywk+KQUkk3t4oJ7NQ0cyFRW/Owe2NiThL/4zR3hr8v8Ds3X7Nydp0QzBviON3BXLAzya
        KaaRPDlt4OsL7jIpu+PlWz9wJjBbbjA=
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 078EA634C90;
        Fri, 28 Jan 2022 21:01:13 +0200 (EET)
Date:   Fri, 28 Jan 2022 21:01:12 +0200
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org
Subject: Re: [GIT PULL v2 FOR 5.18] V4L2 patches
Message-ID: <YfQ9eMB2aP5iH6AZ@valkosipuli.retiisi.eu>
References: <Ye7QMv0OBntzuC1C@valkosipuli.retiisi.eu>
 <20220128195312.092b1d3d@coco.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220128195312.092b1d3d@coco.lan>
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1643396473; a=rsa-sha256; cv=none;
        b=ft3ninm2gMC5HHPkFnVMhOTOvlOMivb4Gu88K1fGff87Ur98BcXmTHUGimKXZjck1wjmcd
        6HjqeAtu5Nx7DnHd9hXK9Qwd2XuAB8fjqPyfGAM2la6XScsMbu86pRUlLYPkbj6e5i+/w6
        KTwEoanx2IJEMmUxF0gjHfecvOE3g6o=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=meesny; t=1643396473;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=KLYLDHjWR/WaUfpGcms73tXXOgAtasYqQ4MORqEJT58=;
        b=dI552XTOd+uZuIc3oAb1XABpoObs0DxKSgqNvRysVJqJ4ivZ6ID6N1kUJACDwTR1h5/qkk
        +Ft7VpXqXSUdyyC//b9sOejHq960n4pXWfdAfSmij/oOj3HHtf/SbHRid5vYuyYuenLQMH
        kwtoCZl7WTythkin8oExvgbb/yhaslU=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

On Fri, Jan 28, 2022 at 07:53:12PM +0100, Mauro Carvalho Chehab wrote:
> Em Mon, 24 Jan 2022 18:13:38 +0200
> Sakari Ailus <sakari.ailus@iki.fi> escreveu:
> 
> > Hi Mauro,
> > 
> > Here's a bunch of patches again for 5.18. Most notably there's V4L2 fwnode
> > / mbus_config cleanup by Laurent, the hi847 camera sensor driver from Shawn
> > Tu and the od08d10 camera sensor driver by Jimmy Su. Fixes elsewhere are
> > included, too.
> > 
> > Since v1, a few more patches have been added and I've dropped a camss patch
> > already picked by Hans.
> > 
> > Please pull.
> > 
> > 
> > The following changes since commit 68b9bcc8a534cd11fe55f8bc82f948aae7d81b3c:
> > 
> >   media: ipu3-cio2: Add support for instantiating i2c-clients for VCMs (2021-12-16 20:58:56 +0100)
> > 
> > are available in the Git repository at:
> > 
> >   git://linuxtv.org/sailus/media_tree.git tags/for-5.18-1.1-signed
> > 
> > for you to fetch changes up to a6876b00e5daa786a406db09f214bbbb4d1f200c:
> > 
> >   media: i2c: dw9714: add optional regulator support (2022-01-22 18:27:43 +0200)
> > 
> > ----------------------------------------------------------------
> > V4L2 patches for 5.18
> > 
> > ----------------------------------------------------------------
> > Angus Ainslie (1):
> >       media: i2c: dw9714: add optional regulator support
> > 
> > Benjamin Gaignard (1):
> >       MAINTAINERS: Update Benjamin Gaignard maintainer status
> > 
> > Bingbu Cao (1):
> >       media: ov2740: identify module after subdev initialisation
> > 
> > Janusz Krzysztofik (4):
> >       media: ov6650: Fix set format try processing path
> >       media: ov6650: Add try support to selection API operations
> >       media: ov6650: Fix crop rectangle affected by set format
> >       media: ov6650: Fix missing frame interval enumeration support
> > 
> > Jimmy Su (1):
> >       media: i2c: Add ov08d10 camera sensor driver
> > 
> > Laurent Pinchart (9):
> >       media: pxa_camera: Drop usage of .set_mbus_config()
> >       media: i2c: ov6650: Drop implementation of .set_mbus_config()
> >       media: v4l2-subdev: Drop .set_mbus_config() operation
> >       media: v4l2-fwnode: Move bus config structure to v4l2_mediabus.h
> 
> >       media: v4l2-mediabus: Use structures to describe bus configuration
> >       media: v4l2-mediabus: Drop legacy V4L2_MBUS_CSI2_*_LANE flags
> >       media: v4l2-mediabus: Drop legacy V4L2_MBUS_CSI2_CHANNEL_* flags
> >       media: v4l2-mediabus: Drop V4L2_MBUS_CSI2_CONTINUOUS_CLOCK flag
> 
> (Some of?) those broke build today:
> 	https://builder.linuxtv.org/job/media_stage_clang/412/
> 
> Probably due to a conflict some other pull request.
> 
> So, I dropped them. Please rebase and re-submit.

It seems patches got merged that make use of [gs]et_mbus_config that is
changed by the patches. This isn't a very commonly used interface so
there's a bit of bad luck here.

I'll see what needs to be changed there.

Please prioritise these on the next time, if possible.

-- 
Kind regards,

Sakari Ailus
