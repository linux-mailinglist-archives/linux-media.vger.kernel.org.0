Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8A48347404F
	for <lists+linux-media@lfdr.de>; Tue, 14 Dec 2021 11:21:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231219AbhLNKVg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 Dec 2021 05:21:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59794 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231145AbhLNKVg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 Dec 2021 05:21:36 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D54C8C061574
        for <linux-media@vger.kernel.org>; Tue, 14 Dec 2021 02:21:35 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 7794C61369
        for <linux-media@vger.kernel.org>; Tue, 14 Dec 2021 10:21:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6393FC34600;
        Tue, 14 Dec 2021 10:21:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1639477294;
        bh=UB1CRVVuuZYkO/qkDhM3Ddt9QT8BxM4UDeKuCFlISBc=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=WAljRHaYZ5ppHGMgubmeVcJQz1dRMvn4Z/u6uzTAiQcMsKPe/U1GaTe5xZxrDDtLH
         bvxVi8jCcd9Nz6enV3WQiNwpoFW7JS/u/LfCvRyZZXDm1KjjXYRiGZXzY6BOLNAqMJ
         4n7wnRUptbbCaAMSyOpjP+I9Y3uqDzIiLIlq1j9UTMcqYqM1EbsmWqcx6WOQiJrVp9
         LlH/UKezq+ECMDTXIo/R8LZCgCk3+jJAmrBbnLk3HB1SprvzZwwbNACS0dXgNT24H0
         3J3NJhHMi3pjRM1QpqYfPyBZ8PyFJFy+Z+KPWlLHv6Kg0d5fpy+og4Z+5kIB7nwizG
         qIzN6yj8y5eXw==
Date:   Tue, 14 Dec 2021 11:21:31 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Sakari Ailus <sakari.ailus@iki.fi>
Cc:     linux-media@vger.kernel.org
Subject: Re: [GIT PULL FOR 5.17] V4L2 patches
Message-ID: <20211214112131.6ccc4a5b@coco.lan>
In-Reply-To: <YbdPdh/ivnjZKIOA@valkosipuli.retiisi.eu>
References: <YbdPdh/ivnjZKIOA@valkosipuli.retiisi.eu>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.30; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

Em Mon, 13 Dec 2021 15:49:42 +0200
Sakari Ailus <sakari.ailus@iki.fi> escreveu:

> Hi Mauro,
> 
> Here's a few patches for 5.17. In particular, included are isl79987 driver
> from Michale Tretter and Marek Vasut, and a dependency fix for the recently
> added max96712 driver.
> 
> Please pull.
> 
> 
> The following changes since commit 4383cfa18c5bbc5b9b6a9e77adc12aec1c20b72d:
> 
>   Merge tag 'v5.16-rc4' into media_tree (2021-12-07 11:29:41 +0100)
> 
> are available in the Git repository at:
> 
>   git://linuxtv.org/sailus/media_tree.git tags/for-5.17-2-signed
> 
> for you to fetch changes up to 0541ae639fb1165fb309ebf58605f901146c2535:
> 
>   media: i2c: isl7998x: Add driver for Intersil ISL7998x (2021-12-08 09:51:54 +0200)
> 
> ----------------------------------------------------------------
> V4L2 patches for 5.17
> 
> ----------------------------------------------------------------
> Andy Shevchenko (1):
>       media: i2c: max9286: Get rid of duplicate of_node assignment
> 
> Marek Vasut (2):
>       media: dt-bindings: Add Intersil ISL79987 DT bindings
>       media: i2c: isl7998x: Add driver for Intersil ISL7998x

There are a couple of issues at the STD decoding logic, plus some coding
style issues at the isl7998x driver. So, I'm not applying those two
patches. Those are easily fixable, but we'll be closing the merge window
for 5.17 this week. If it were just the coding styles, I would have just
fixed and applied, but the best here would be for Marek to fix the issues
I point, re-test and submit asap, in order to be on this merge window.

> 
> Michael Tretter (1):
>       media: imx6-mipi-csi2: use pre_streamon callback to set sensor into LP11
> 
> Sakari Ailus (1):
>       max96712: Depend on VIDEO_V4L2
> 
>  .../bindings/media/i2c/isil,isl79987.yaml          |  113 ++
>  MAINTAINERS                                        |    8 +
>  drivers/media/i2c/Kconfig                          |   10 +
>  drivers/media/i2c/Makefile                         |    1 +
>  drivers/media/i2c/isl7998x.c                       | 1543 ++++++++++++++++++++
>  drivers/media/i2c/max9286.c                        |    1 -
>  drivers/staging/media/imx/imx6-mipi-csi2.c         |    9 +-
>  drivers/staging/media/max96712/Kconfig             |    1 +
>  include/uapi/linux/v4l2-controls.h                 |    6 +
>  9 files changed, 1690 insertions(+), 2 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/isil,isl79987.yaml
>  create mode 100644 drivers/media/i2c/isl7998x.c
> 



Thanks,
Mauro
