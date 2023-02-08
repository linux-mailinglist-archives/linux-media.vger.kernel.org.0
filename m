Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C54E768EA25
	for <lists+linux-media@lfdr.de>; Wed,  8 Feb 2023 09:46:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230417AbjBHIqJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 8 Feb 2023 03:46:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43202 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229953AbjBHIqH (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 8 Feb 2023 03:46:07 -0500
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8AEA015CAF
        for <linux-media@vger.kernel.org>; Wed,  8 Feb 2023 00:46:05 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id 92D58CE1FA5
        for <linux-media@vger.kernel.org>; Wed,  8 Feb 2023 08:46:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 530FBC433D2;
        Wed,  8 Feb 2023 08:46:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1675845961;
        bh=s3b9ZU1hdPIFx4K0UNStX+pQ5VwdOlcaBsaXHcZDHF0=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=ofDhVaz4GDpF6RInNuGiLKRuI6/+3A2SKWIMM1ytzITANQU/8PYFgFO7Ahg5xO0ud
         eLgqZ6VPOY1jdo32MOWM+HYhgwEV+Lk1C1MDT6sZrNUsSDtrRYBL4O/avWZeb5XrBv
         vmIXIYcHd6IZmlXNLYgUpHK93t9OrT571cLfTOw7aBYTcNE4rIsa4B54p5KuOegiY6
         iLMwDW3UC5OhkVQIxqiEn3VXfYmZvE5TzVsMVp4MQ1AATkT0P64FN+XqQb9EdxRaTQ
         J2P2twzcis1C92djADKLNunr25sUlfBIlxyJBB4t1RzSZ1Wyp0J2RW+WELMm/1CgHH
         n1Gc4CbXt5fVw==
Date:   Wed, 8 Feb 2023 09:45:57 +0100
From:   Mauro Carvalho Chehab <mchehab@kernel.org>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>
Subject: Re: [GIT PULL FOR v6.3] Revert saa7146: move it back to mainline
Message-ID: <20230208094557.0af6ea95@coco.lan>
In-Reply-To: <5902a4f2-da31-816c-f3cf-020340dbaddf@xs4all.nl>
References: <5902a4f2-da31-816c-f3cf-020340dbaddf@xs4all.nl>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.36; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Wed, 1 Feb 2023 14:49:15 +0100
Hans Verkuil <hverkuil@xs4all.nl> escreveu:

> This reverts the two patches that moved saa7146/av7110 to the
> staging/media/deprecated directory.
> 
> It turns out that these drivers are still in use, so this
> restores the old situation.
> 
> I will try to convert saa7146 to vb2 this month.
> 
> Regards,
> 
> 	Hans
> 
> The following changes since commit 7120d6bfd6d0b26b49958f429701996f2d3e2c2a:
> 
>   media: tm6000: remove deprecated driver (2023-01-22 09:57:19 +0100)
> 
> are available in the Git repository at:
> 
>   git://linuxtv.org/hverkuil/media_tree.git tags/br-v6.3j
> 
> for you to fetch changes up to e9e9865975389e311eddf571afbe93ae31474a36:
> 
>   Revert "media: saa7146: deprecate hexium_gemini/orion, mxb and ttpci" (2023-02-01 14:24:13 +0100)
> 
> ----------------------------------------------------------------
> Tag branch
> 
> ----------------------------------------------------------------
> Hans Verkuil (2):
>       Revert "media: av7110: move to staging/media/deprecated/saa7146"

As I commented on a separate thread, we shouldn't move av7110 out of
staging while its API is not properly documented.

I'm OK to move the saa7146 driver back to its original place, for
the parts that aren't dependent on av7110.

Regards,
Mauro

>       Revert "media: saa7146: deprecate hexium_gemini/orion, mxb and ttpci"
> 
>  MAINTAINERS                                                                               |  4 +++-
>  drivers/media/common/Kconfig                                                              |  1 +
>  drivers/media/common/Makefile                                                             |  2 +-
>  drivers/{staging/media/deprecated/saa7146/common => media/common/saa7146}/Kconfig         |  0
>  drivers/{staging/media/deprecated/saa7146/common => media/common/saa7146}/Makefile        |  0
>  drivers/{staging/media/deprecated/saa7146/common => media/common/saa7146}/saa7146_core.c  |  2 +-
>  drivers/{staging/media/deprecated/saa7146/common => media/common/saa7146}/saa7146_fops.c  |  2 +-
>  drivers/{staging/media/deprecated/saa7146/common => media/common/saa7146}/saa7146_hlp.c   |  2 +-
>  drivers/{staging/media/deprecated/saa7146/common => media/common/saa7146}/saa7146_i2c.c   |  2 +-
>  drivers/{staging/media/deprecated/saa7146/common => media/common/saa7146}/saa7146_vbi.c   |  2 +-
>  drivers/{staging/media/deprecated/saa7146/common => media/common/saa7146}/saa7146_video.c |  2 +-
>  drivers/media/pci/Kconfig                                                                 |  2 ++
>  drivers/media/pci/Makefile                                                                |  4 +++-
>  drivers/{staging/media/deprecated/saa7146 => media/pci}/saa7146/Kconfig                   | 15 +++------------
>  drivers/{staging/media/deprecated/saa7146 => media/pci}/saa7146/Makefile                  |  0
>  drivers/{staging/media/deprecated/saa7146 => media/pci}/saa7146/hexium_gemini.c           |  2 +-
>  drivers/{staging/media/deprecated/saa7146 => media/pci}/saa7146/hexium_orion.c            |  2 +-
>  drivers/{staging/media/deprecated/saa7146 => media/pci}/saa7146/mxb.c                     |  2 +-
>  drivers/{staging/media/deprecated/saa7146 => media/pci}/ttpci/Kconfig                     | 17 ++++-------------
>  drivers/{staging/media/deprecated/saa7146 => media/pci}/ttpci/Makefile                    |  0
>  drivers/{staging/media/deprecated/saa7146 => media/pci}/ttpci/budget-av.c                 |  2 +-
>  drivers/{staging/media/deprecated/saa7146 => media/pci}/ttpci/budget-ci.c                 |  0
>  drivers/{staging/media/deprecated/saa7146 => media/pci}/ttpci/budget-core.c               |  0
>  drivers/{staging/media/deprecated/saa7146 => media/pci}/ttpci/budget.c                    |  0
>  drivers/{staging/media/deprecated/saa7146 => media/pci}/ttpci/budget.h                    |  2 +-
>  drivers/staging/media/Kconfig                                                             |  3 ++-
>  drivers/staging/media/Makefile                                                            |  2 +-
>  drivers/staging/media/{deprecated/saa7146 => }/av7110/Kconfig                             | 20 ++++----------------
>  drivers/staging/media/{deprecated/saa7146 => }/av7110/Makefile                            |  3 +--
>  drivers/staging/media/av7110/TODO                                                         |  3 +++
>  drivers/staging/media/{deprecated/saa7146 => }/av7110/audio-bilingual-channel-select.rst  |  0
>  drivers/staging/media/{deprecated/saa7146 => }/av7110/audio-channel-select.rst            |  0
>  drivers/staging/media/{deprecated/saa7146 => }/av7110/audio-clear-buffer.rst              |  0
>  drivers/staging/media/{deprecated/saa7146 => }/av7110/audio-continue.rst                  |  0
>  drivers/staging/media/{deprecated/saa7146 => }/av7110/audio-fclose.rst                    |  0
>  drivers/staging/media/{deprecated/saa7146 => }/av7110/audio-fopen.rst                     |  0
>  drivers/staging/media/{deprecated/saa7146 => }/av7110/audio-fwrite.rst                    |  0
>  drivers/staging/media/{deprecated/saa7146 => }/av7110/audio-get-capabilities.rst          |  0
>  drivers/staging/media/{deprecated/saa7146 => }/av7110/audio-get-status.rst                |  0
>  drivers/staging/media/{deprecated/saa7146 => }/av7110/audio-pause.rst                     |  0
>  drivers/staging/media/{deprecated/saa7146 => }/av7110/audio-play.rst                      |  0
>  drivers/staging/media/{deprecated/saa7146 => }/av7110/audio-select-source.rst             |  0
>  drivers/staging/media/{deprecated/saa7146 => }/av7110/audio-set-av-sync.rst               |  0
>  drivers/staging/media/{deprecated/saa7146 => }/av7110/audio-set-bypass-mode.rst           |  0
>  drivers/staging/media/{deprecated/saa7146 => }/av7110/audio-set-id.rst                    |  0
>  drivers/staging/media/{deprecated/saa7146 => }/av7110/audio-set-mixer.rst                 |  0
>  drivers/staging/media/{deprecated/saa7146 => }/av7110/audio-set-mute.rst                  |  0
>  drivers/staging/media/{deprecated/saa7146 => }/av7110/audio-set-streamtype.rst            |  0
>  drivers/staging/media/{deprecated/saa7146 => }/av7110/audio-stop.rst                      |  0
>  drivers/staging/media/{deprecated/saa7146 => }/av7110/audio.rst                           |  0
>  drivers/staging/media/{deprecated/saa7146 => }/av7110/audio_data_types.rst                |  0
>  drivers/staging/media/{deprecated/saa7146 => }/av7110/audio_function_calls.rst            |  0
>  drivers/staging/media/{deprecated/saa7146 => }/av7110/av7110.c                            |  0
>  drivers/staging/media/{deprecated/saa7146 => }/av7110/av7110.h                            |  2 +-
>  drivers/staging/media/{deprecated/saa7146 => }/av7110/av7110_av.c                         |  0
>  drivers/staging/media/{deprecated/saa7146 => }/av7110/av7110_av.h                         |  0
>  drivers/staging/media/{deprecated/saa7146 => }/av7110/av7110_ca.c                         |  0
>  drivers/staging/media/{deprecated/saa7146 => }/av7110/av7110_ca.h                         |  0
>  drivers/staging/media/{deprecated/saa7146 => }/av7110/av7110_hw.c                         |  0
>  drivers/staging/media/{deprecated/saa7146 => }/av7110/av7110_hw.h                         |  0
>  drivers/staging/media/{deprecated/saa7146 => }/av7110/av7110_ipack.c                      |  0
>  drivers/staging/media/{deprecated/saa7146 => }/av7110/av7110_ipack.h                      |  0
>  drivers/staging/media/{deprecated/saa7146 => }/av7110/av7110_ir.c                         |  0
>  drivers/staging/media/{deprecated/saa7146 => }/av7110/av7110_v4l.c                        |  0
>  drivers/staging/media/{deprecated/saa7146 => }/av7110/budget-patch.c                      |  0
>  drivers/staging/media/{deprecated/saa7146 => }/av7110/dvb_filter.c                        |  0
>  drivers/staging/media/{deprecated/saa7146 => }/av7110/dvb_filter.h                        |  0
>  drivers/staging/media/{deprecated/saa7146 => }/av7110/sp8870.c                            |  0
>  drivers/staging/media/{deprecated/saa7146 => }/av7110/sp8870.h                            |  0
>  drivers/staging/media/{deprecated/saa7146 => }/av7110/video-clear-buffer.rst              |  0
>  drivers/staging/media/{deprecated/saa7146 => }/av7110/video-command.rst                   |  0
>  drivers/staging/media/{deprecated/saa7146 => }/av7110/video-continue.rst                  |  0
>  drivers/staging/media/{deprecated/saa7146 => }/av7110/video-fast-forward.rst              |  0
>  drivers/staging/media/{deprecated/saa7146 => }/av7110/video-fclose.rst                    |  0
>  drivers/staging/media/{deprecated/saa7146 => }/av7110/video-fopen.rst                     |  0
>  drivers/staging/media/{deprecated/saa7146 => }/av7110/video-freeze.rst                    |  0
>  drivers/staging/media/{deprecated/saa7146 => }/av7110/video-fwrite.rst                    |  0
>  drivers/staging/media/{deprecated/saa7146 => }/av7110/video-get-capabilities.rst          |  0
>  drivers/staging/media/{deprecated/saa7146 => }/av7110/video-get-event.rst                 |  0
>  drivers/staging/media/{deprecated/saa7146 => }/av7110/video-get-frame-count.rst           |  0
>  drivers/staging/media/{deprecated/saa7146 => }/av7110/video-get-pts.rst                   |  0
>  drivers/staging/media/{deprecated/saa7146 => }/av7110/video-get-size.rst                  |  0
>  drivers/staging/media/{deprecated/saa7146 => }/av7110/video-get-status.rst                |  0
>  drivers/staging/media/{deprecated/saa7146 => }/av7110/video-play.rst                      |  0
>  drivers/staging/media/{deprecated/saa7146 => }/av7110/video-select-source.rst             |  0
>  drivers/staging/media/{deprecated/saa7146 => }/av7110/video-set-blank.rst                 |  0
>  drivers/staging/media/{deprecated/saa7146 => }/av7110/video-set-display-format.rst        |  0
>  drivers/staging/media/{deprecated/saa7146 => }/av7110/video-set-format.rst                |  0
>  drivers/staging/media/{deprecated/saa7146 => }/av7110/video-set-streamtype.rst            |  0
>  drivers/staging/media/{deprecated/saa7146 => }/av7110/video-slowmotion.rst                |  0
>  drivers/staging/media/{deprecated/saa7146 => }/av7110/video-stillpicture.rst              |  0
>  drivers/staging/media/{deprecated/saa7146 => }/av7110/video-stop.rst                      |  0
>  drivers/staging/media/{deprecated/saa7146 => }/av7110/video-try-command.rst               |  0
>  drivers/staging/media/{deprecated/saa7146 => }/av7110/video.rst                           |  0
>  drivers/staging/media/{deprecated/saa7146 => }/av7110/video_function_calls.rst            |  0
>  drivers/staging/media/{deprecated/saa7146 => }/av7110/video_types.rst                     |  0
>  drivers/staging/media/deprecated/saa7146/Kconfig                                          |  5 -----
>  drivers/staging/media/deprecated/saa7146/Makefile                                         |  2 --
>  drivers/staging/media/deprecated/saa7146/av7110/TODO                                      |  9 ---------
>  drivers/staging/media/deprecated/saa7146/saa7146/TODO                                     |  7 -------
>  drivers/staging/media/deprecated/saa7146/ttpci/TODO                                       |  7 -------
>  {drivers/staging/media/deprecated/saa7146/common => include/media/drv-intf}/saa7146.h     |  0
>  {drivers/staging/media/deprecated/saa7146/common => include/media/drv-intf}/saa7146_vv.h  |  2 +-
>  103 files changed, 41 insertions(+), 91 deletions(-)
>  rename drivers/{staging/media/deprecated/saa7146/common => media/common/saa7146}/Kconfig (100%)
>  rename drivers/{staging/media/deprecated/saa7146/common => media/common/saa7146}/Makefile (100%)
>  rename drivers/{staging/media/deprecated/saa7146/common => media/common/saa7146}/saa7146_core.c (99%)
>  rename drivers/{staging/media/deprecated/saa7146/common => media/common/saa7146}/saa7146_fops.c (99%)
>  rename drivers/{staging/media/deprecated/saa7146/common => media/common/saa7146}/saa7146_hlp.c (99%)
>  rename drivers/{staging/media/deprecated/saa7146/common => media/common/saa7146}/saa7146_i2c.c (99%)
>  rename drivers/{staging/media/deprecated/saa7146/common => media/common/saa7146}/saa7146_vbi.c (99%)
>  rename drivers/{staging/media/deprecated/saa7146/common => media/common/saa7146}/saa7146_video.c (99%)
>  rename drivers/{staging/media/deprecated/saa7146 => media/pci}/saa7146/Kconfig (67%)
>  rename drivers/{staging/media/deprecated/saa7146 => media/pci}/saa7146/Makefile (100%)
>  rename drivers/{staging/media/deprecated/saa7146 => media/pci}/saa7146/hexium_gemini.c (99%)
>  rename drivers/{staging/media/deprecated/saa7146 => media/pci}/saa7146/hexium_orion.c (99%)
>  rename drivers/{staging/media/deprecated/saa7146 => media/pci}/saa7146/mxb.c (99%)
>  rename drivers/{staging/media/deprecated/saa7146 => media/pci}/ttpci/Kconfig (83%)
>  rename drivers/{staging/media/deprecated/saa7146 => media/pci}/ttpci/Makefile (100%)
>  rename drivers/{staging/media/deprecated/saa7146 => media/pci}/ttpci/budget-av.c (99%)
>  rename drivers/{staging/media/deprecated/saa7146 => media/pci}/ttpci/budget-ci.c (100%)
>  rename drivers/{staging/media/deprecated/saa7146 => media/pci}/ttpci/budget-core.c (100%)
>  rename drivers/{staging/media/deprecated/saa7146 => media/pci}/ttpci/budget.c (100%)
>  rename drivers/{staging/media/deprecated/saa7146 => media/pci}/ttpci/budget.h (98%)
>  rename drivers/staging/media/{deprecated/saa7146 => }/av7110/Kconfig (82%)
>  rename drivers/staging/media/{deprecated/saa7146 => }/av7110/Makefile (78%)
>  create mode 100644 drivers/staging/media/av7110/TODO
>  rename drivers/staging/media/{deprecated/saa7146 => }/av7110/audio-bilingual-channel-select.rst (100%)
>  rename drivers/staging/media/{deprecated/saa7146 => }/av7110/audio-channel-select.rst (100%)
>  rename drivers/staging/media/{deprecated/saa7146 => }/av7110/audio-clear-buffer.rst (100%)
>  rename drivers/staging/media/{deprecated/saa7146 => }/av7110/audio-continue.rst (100%)
>  rename drivers/staging/media/{deprecated/saa7146 => }/av7110/audio-fclose.rst (100%)
>  rename drivers/staging/media/{deprecated/saa7146 => }/av7110/audio-fopen.rst (100%)
>  rename drivers/staging/media/{deprecated/saa7146 => }/av7110/audio-fwrite.rst (100%)
>  rename drivers/staging/media/{deprecated/saa7146 => }/av7110/audio-get-capabilities.rst (100%)
>  rename drivers/staging/media/{deprecated/saa7146 => }/av7110/audio-get-status.rst (100%)
>  rename drivers/staging/media/{deprecated/saa7146 => }/av7110/audio-pause.rst (100%)
>  rename drivers/staging/media/{deprecated/saa7146 => }/av7110/audio-play.rst (100%)
>  rename drivers/staging/media/{deprecated/saa7146 => }/av7110/audio-select-source.rst (100%)
>  rename drivers/staging/media/{deprecated/saa7146 => }/av7110/audio-set-av-sync.rst (100%)
>  rename drivers/staging/media/{deprecated/saa7146 => }/av7110/audio-set-bypass-mode.rst (100%)
>  rename drivers/staging/media/{deprecated/saa7146 => }/av7110/audio-set-id.rst (100%)
>  rename drivers/staging/media/{deprecated/saa7146 => }/av7110/audio-set-mixer.rst (100%)
>  rename drivers/staging/media/{deprecated/saa7146 => }/av7110/audio-set-mute.rst (100%)
>  rename drivers/staging/media/{deprecated/saa7146 => }/av7110/audio-set-streamtype.rst (100%)
>  rename drivers/staging/media/{deprecated/saa7146 => }/av7110/audio-stop.rst (100%)
>  rename drivers/staging/media/{deprecated/saa7146 => }/av7110/audio.rst (100%)
>  rename drivers/staging/media/{deprecated/saa7146 => }/av7110/audio_data_types.rst (100%)
>  rename drivers/staging/media/{deprecated/saa7146 => }/av7110/audio_function_calls.rst (100%)
>  rename drivers/staging/media/{deprecated/saa7146 => }/av7110/av7110.c (100%)
>  rename drivers/staging/media/{deprecated/saa7146 => }/av7110/av7110.h (99%)
>  rename drivers/staging/media/{deprecated/saa7146 => }/av7110/av7110_av.c (100%)
>  rename drivers/staging/media/{deprecated/saa7146 => }/av7110/av7110_av.h (100%)
>  rename drivers/staging/media/{deprecated/saa7146 => }/av7110/av7110_ca.c (100%)
>  rename drivers/staging/media/{deprecated/saa7146 => }/av7110/av7110_ca.h (100%)
>  rename drivers/staging/media/{deprecated/saa7146 => }/av7110/av7110_hw.c (100%)
>  rename drivers/staging/media/{deprecated/saa7146 => }/av7110/av7110_hw.h (100%)
>  rename drivers/staging/media/{deprecated/saa7146 => }/av7110/av7110_ipack.c (100%)
>  rename drivers/staging/media/{deprecated/saa7146 => }/av7110/av7110_ipack.h (100%)
>  rename drivers/staging/media/{deprecated/saa7146 => }/av7110/av7110_ir.c (100%)
>  rename drivers/staging/media/{deprecated/saa7146 => }/av7110/av7110_v4l.c (100%)
>  rename drivers/staging/media/{deprecated/saa7146 => }/av7110/budget-patch.c (100%)
>  rename drivers/staging/media/{deprecated/saa7146 => }/av7110/dvb_filter.c (100%)
>  rename drivers/staging/media/{deprecated/saa7146 => }/av7110/dvb_filter.h (100%)
>  rename drivers/staging/media/{deprecated/saa7146 => }/av7110/sp8870.c (100%)
>  rename drivers/staging/media/{deprecated/saa7146 => }/av7110/sp8870.h (100%)
>  rename drivers/staging/media/{deprecated/saa7146 => }/av7110/video-clear-buffer.rst (100%)
>  rename drivers/staging/media/{deprecated/saa7146 => }/av7110/video-command.rst (100%)
>  rename drivers/staging/media/{deprecated/saa7146 => }/av7110/video-continue.rst (100%)
>  rename drivers/staging/media/{deprecated/saa7146 => }/av7110/video-fast-forward.rst (100%)
>  rename drivers/staging/media/{deprecated/saa7146 => }/av7110/video-fclose.rst (100%)
>  rename drivers/staging/media/{deprecated/saa7146 => }/av7110/video-fopen.rst (100%)
>  rename drivers/staging/media/{deprecated/saa7146 => }/av7110/video-freeze.rst (100%)
>  rename drivers/staging/media/{deprecated/saa7146 => }/av7110/video-fwrite.rst (100%)
>  rename drivers/staging/media/{deprecated/saa7146 => }/av7110/video-get-capabilities.rst (100%)
>  rename drivers/staging/media/{deprecated/saa7146 => }/av7110/video-get-event.rst (100%)
>  rename drivers/staging/media/{deprecated/saa7146 => }/av7110/video-get-frame-count.rst (100%)
>  rename drivers/staging/media/{deprecated/saa7146 => }/av7110/video-get-pts.rst (100%)
>  rename drivers/staging/media/{deprecated/saa7146 => }/av7110/video-get-size.rst (100%)
>  rename drivers/staging/media/{deprecated/saa7146 => }/av7110/video-get-status.rst (100%)
>  rename drivers/staging/media/{deprecated/saa7146 => }/av7110/video-play.rst (100%)
>  rename drivers/staging/media/{deprecated/saa7146 => }/av7110/video-select-source.rst (100%)
>  rename drivers/staging/media/{deprecated/saa7146 => }/av7110/video-set-blank.rst (100%)
>  rename drivers/staging/media/{deprecated/saa7146 => }/av7110/video-set-display-format.rst (100%)
>  rename drivers/staging/media/{deprecated/saa7146 => }/av7110/video-set-format.rst (100%)
>  rename drivers/staging/media/{deprecated/saa7146 => }/av7110/video-set-streamtype.rst (100%)
>  rename drivers/staging/media/{deprecated/saa7146 => }/av7110/video-slowmotion.rst (100%)
>  rename drivers/staging/media/{deprecated/saa7146 => }/av7110/video-stillpicture.rst (100%)
>  rename drivers/staging/media/{deprecated/saa7146 => }/av7110/video-stop.rst (100%)
>  rename drivers/staging/media/{deprecated/saa7146 => }/av7110/video-try-command.rst (100%)
>  rename drivers/staging/media/{deprecated/saa7146 => }/av7110/video.rst (100%)
>  rename drivers/staging/media/{deprecated/saa7146 => }/av7110/video_function_calls.rst (100%)
>  rename drivers/staging/media/{deprecated/saa7146 => }/av7110/video_types.rst (100%)
>  delete mode 100644 drivers/staging/media/deprecated/saa7146/Kconfig
>  delete mode 100644 drivers/staging/media/deprecated/saa7146/Makefile
>  delete mode 100644 drivers/staging/media/deprecated/saa7146/av7110/TODO
>  delete mode 100644 drivers/staging/media/deprecated/saa7146/saa7146/TODO
>  delete mode 100644 drivers/staging/media/deprecated/saa7146/ttpci/TODO
>  rename {drivers/staging/media/deprecated/saa7146/common => include/media/drv-intf}/saa7146.h (100%)
>  rename {drivers/staging/media/deprecated/saa7146/common => include/media/drv-intf}/saa7146_vv.h (99%)



Thanks,
Mauro
