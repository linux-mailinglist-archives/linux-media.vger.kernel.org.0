Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 16E74337061
	for <lists+linux-media@lfdr.de>; Thu, 11 Mar 2021 11:45:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232494AbhCKKpU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 11 Mar 2021 05:45:20 -0500
Received: from mail.kernel.org ([198.145.29.99]:36912 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232439AbhCKKpO (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 11 Mar 2021 05:45:14 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9C3B864FC1;
        Thu, 11 Mar 2021 10:45:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1615459513;
        bh=a/rTVB4agGuDEQZSZshiw5T0iwv6k8Kvi5JSFYOuhOY=;
        h=Date:From:To:Cc:Subject:From;
        b=sPolRgq9IHrR10dHlbd0KBprmAkplLCvBvei6IA44VTAswYoKr0HG7j3+J6PqvDXm
         qJEE80wJskBe3PVhBr/+scQzP8YzWEY0eEtLVuO0QmK4M4UzvlN/q0fi8yortu3hED
         +vii5jT0l6HVOzKAxye6su+eIiudVzjnDaqs3YwIeGIBTBvYA9Jfuqk0WsaSzERWY4
         3HJkKhXjdaoWiTiGEWBfxOJriTygvq02sezPSQJM1hPIW95KsSGpIYRFG3MZWXwg5R
         tptXmccCm/155JlO5zDqyEmtfXMIdYOIgoCfTJxBglkRn9pLvq7jVCbTVwT2cYO00z
         bL7OkpO4PaoDg==
Date:   Thu, 11 Mar 2021 11:45:08 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [GIT PULL for v5.12-rc3] media fixes
Message-ID: <20210311114508.21f48415@coco.lan>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Linus,

Please pull from:
   git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media tags/media/v5.12-2

For a couple of fixes:
- Fix a build issue with CEC;
- Fix a deadlock at usbtv driver;
- Fix some null pointer address issues at vsp1 driver;
- Fix a wrong bitmap setting at rkisp1 driver.

Thanks!
Mauro

Em Thu, 11 Mar 2021 11:42:43 +0100
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> escreveu:

> The following changes since commit a38fd8748464831584a19438cbb3082b5a2dab15:
> 
>   Linux 5.12-rc2 (2021-03-05 17:33:41 -0800)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media tags/media/v5.12-2
> 
> for you to fetch changes up to 2025a48cfd92d541c5ee47deee97f8a46d00c4ac:
> 
>   media: rkisp1: params: fix wrong bits settings (2021-03-11 11:40:29 +0100)
> 
> ----------------------------------------------------------------
> media fixes for v5.12-rc3
> 
> ----------------------------------------------------------------
> Biju Das (2):
>       media: v4l: vsp1: Fix bru null pointer access
>       media: v4l: vsp1: Fix uif null pointer access
> 
> Dafna Hirschfeld (1):
>       media: rkisp1: params: fix wrong bits settings
> 
> Hans Verkuil (1):
>       media: rc: compile rc-cec.c into rc-core
> 
> Maxim Mikityanskiy (1):
>       media: usbtv: Fix deadlock on suspend
> 
>  .../media/platform/rockchip/rkisp1/rkisp1-params.c |  1 -
>  drivers/media/platform/vsp1/vsp1_drm.c             |  6 ++---
>  drivers/media/rc/Makefile                          |  1 +
>  drivers/media/rc/keymaps/Makefile                  |  1 -
>  drivers/media/rc/keymaps/rc-cec.c                  | 28 +++++++++-------------
>  drivers/media/rc/rc-main.c                         |  6 +++++
>  drivers/media/usb/usbtv/usbtv-audio.c              |  2 +-
>  include/media/rc-map.h                             |  7 ++++++
>  8 files changed, 29 insertions(+), 23 deletions(-)
> 



Thanks,
Mauro
