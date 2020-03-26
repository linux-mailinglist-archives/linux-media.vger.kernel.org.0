Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6BB8A1943FF
	for <lists+linux-media@lfdr.de>; Thu, 26 Mar 2020 17:07:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727820AbgCZQH0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 26 Mar 2020 12:07:26 -0400
Received: from mail.kernel.org ([198.145.29.99]:60980 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726296AbgCZQH0 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 26 Mar 2020 12:07:26 -0400
Received: from coco.lan (ip5f5ad4d8.dynamic.kabel-deutschland.de [95.90.212.216])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 4CCE52076A;
        Thu, 26 Mar 2020 16:07:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1585238845;
        bh=i0aFsKIqB6M0knbcxiKriTdOAL1ebGcMqY/HSBVyVGU=;
        h=Date:From:To:Subject:In-Reply-To:References:From;
        b=GomGmTrTFfafmXssc+xDlclNgAxUt0qn0EcSWct//vX2EdTXdBG5rDMknnwN5T6VH
         5v+/XcM9iE+f1N4I0mlnKsvW35yWExx+aaP9Y2vHPRT2kxRzPr724RHNcNr12BkuLc
         bx/MvPGmLmuMYjDj8VS8GLOxEDkNSz6a92YMkXOI=
Date:   Thu, 26 Mar 2020 17:07:21 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Helen Koike <helen.koike@collabora.com>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH 0/4] media Kconfig reorg - part 2
Message-ID: <20200326170721.6c71a192@coco.lan>
In-Reply-To: <6fadc6ea-8512-03ba-da30-43c64d7562f6@collabora.com>
References: <cover.1585151701.git.mchehab+huawei@kernel.org>
        <6fadc6ea-8512-03ba-da30-43c64d7562f6@collabora.com>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

(removed that big c/c list - kept just media)

Em Wed, 25 Mar 2020 16:36:31 -0300
Helen Koike <helen.koike@collabora.com> escreveu:

> Hello,
> 
> On 3/25/20 1:03 PM, Mauro Carvalho Chehab wrote:
> > That's the second part of media Kconfig changes. The entire series is
> > at:
> > 
> > 	https://git.linuxtv.org/mchehab/experimental.git/log/?h=media-kconfig  
> 
> I made a quick experiment (using this branch) with someone who works with the kernel for his master degree, but doesn't have much experience in kernel development in general.
> I asked him to enable Vimc (from default configs, where multimedia starts disabled).
> He knows that Vimc is a virtual camera driver, and this is how he behaved:
> 
> === Start of experiment:
> 
> * He pressed '/' and searched for vimc to see the location path.
> * Then he enabled "Multimedia support" and went straight to "Media drivers" (which just shows USB and PCI).
> * He went back to "Multimedia support", entered "Media device types" and enabled "Test drivers".
> * He went back to "Media drivers" again and didn't find Vimc (nothing changed in this menu).

There was an issue with test driver dependencies. this patch
fixes it:

	https://git.linuxtv.org/mchehab/experimental.git/commit/?h=media-kconfig&id=c267c23e0884172beac4fb4e68c35fc26ff2e615

Basically, the VIDEO_DEV was not selected with MEDIA_TEST_SUPPORT.
So, the "Media drivers" menu would be empty.

After this change, the only thing a .config file would need to build
a test driver would either need to select those:

	CONFIG_MODULES=y
	CONFIG_MEDIA_SUPPORT=m
	CONFIG_MEDIA_SUPPORT_FILTER=y
	CONFIG_MEDIA_TEST_SUPPORT=y
	CONFIG_V4L_TEST_DRIVERS=y
	CONFIG_VIDEO_VIMC=y

	(filtering way)

or those:

	CONFIG_MODULES=y
	CONFIG_MEDIA_SUPPORT=m
	CONFIG_VIDEO_DEV=y
	CONFIG_MEDIA_TEST_SUPPORT=y
	CONFIG_V4L_TEST_DRIVERS=y
	CONFIG_VIDEO_VIMC=y

	(non-filtering way)

(MODULES config is optional. I opted to use modules just to be able
to use make M=drivers/media)

For testing purposes, here, I stored just the above on a file
called media_config, and then I did:

	$ make allnoconfig
	$ cp media_config >.config
	$ make olddefconfig && make init 2>/dev/null
	$ rm $(find drivers/media -name '*.ko') $(find drivers/media -name '*.o') 2>/dev/null
	$ make M=drivers/media
	  CC [M]  drivers/media/common/v4l2-tpg/v4l2-tpg-core.o
	  CC [M]  drivers/media/common/videobuf2/videobuf2-core.o
	  ...
	  MODPOST 8 modules
	  ...
	  LD [M]  drivers/media/v4l2-core/v4l2-dv-timings.ko
	  LD [M]  drivers/media/v4l2-core/videodev.ko

In this specific case, either using the filtered or non-filtered way,
the number of options to enable "vimc" are the same.

Thanks,
Mauro
