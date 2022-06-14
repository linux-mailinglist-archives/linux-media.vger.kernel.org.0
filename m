Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3DC0D54AD4F
	for <lists+linux-media@lfdr.de>; Tue, 14 Jun 2022 11:25:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233210AbiFNJZr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 Jun 2022 05:25:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37946 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230352AbiFNJZq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 Jun 2022 05:25:46 -0400
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 731EE1E8
        for <linux-media@vger.kernel.org>; Tue, 14 Jun 2022 02:25:45 -0700 (PDT)
Received: by mail-ed1-x530.google.com with SMTP id 25so10702811edw.8
        for <linux-media@vger.kernel.org>; Tue, 14 Jun 2022 02:25:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=YrDf5katseQGG8uaQuWQKbhXfxFpcC3yl5rKMRd8YpQ=;
        b=DARvJXbmDN+Zx1KyMbemFE8zprrglPmtUryNtqcDBwgctTmvpBdGuHuvJWMAqgG12D
         fSx+RetN6GK8Y6Y3hYYFLdSJjKPr3NrWZvAu4KcPEZsG9yUodLn8FeTVPHZLBjv/ALCF
         OO/orll6KPGh5AWpTD/62pots8qV4mgRaeQDWmRjHRCm3OmKudhXx4mZJKo+yLTMdgAT
         8i1hiPa0JXAnZv6JRsyq+l+QkNSPHvM//GPXMO21Au8pDjYy17JnXfmkE1a4ODlwnV/k
         AF19jzKUL0co4yeYV+GnF5s5I7/FPqnCq/HfLIudJO70R/q9EqOE/oGnzjW/BzZF6cKU
         RYoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YrDf5katseQGG8uaQuWQKbhXfxFpcC3yl5rKMRd8YpQ=;
        b=VEjcMvw1vV6b6AAumCw5mxr4cYaZyvZbpTDi9l/Q+y6Xdter+Eg24+5/J0dffr0bpE
         yXih/VH0tl9CH5/W7oYqEqiLCCe3+8jghP56uqT0xSjXsGj8M9zt3hGg6LsoZ9NkxEpP
         DVoT0ERoY1fPQKsLDqPzj4GL9Zyc3ipP1i3kM74HWc7xmjY2gF0D+9QZXwrTn15/v8LM
         uiXPnnui9856h5aaQvGpiZ6dvfa1h7zTWBwdrmGAemTrANKWWWsETYtPIoBvpqc1bVyZ
         LUOlyZy9MuORZM7EzFC9vw9wrDFkl54Ro34Lr/teltKPt1mwDhYIUhKHfDsolom8ULC7
         EDhQ==
X-Gm-Message-State: AOAM532Tk+ne6Loyl+9SV8FT+DaX9rEkx2xYKiqoti7xYmKyvO5EqYyT
        OSGYcvMWVRkliecEYSQ2QntFcaeypmA75Rxzl01l2aShJfxYWw==
X-Google-Smtp-Source: AGRyM1t5Ua9z/Be8WsTtXVrE2gKD38XdYyW2Wjh5eApp/dCFA6nGZHwK2naNpZ+oTERQgU+EakqcenJ0iY1eh5aUn38=
X-Received: by 2002:a05:6402:11d2:b0:42d:e68a:eae0 with SMTP id
 j18-20020a05640211d200b0042de68aeae0mr4659197edw.111.1655198743828; Tue, 14
 Jun 2022 02:25:43 -0700 (PDT)
MIME-Version: 1.0
References: <20220613195137.8117-1-hdegoede@redhat.com>
In-Reply-To: <20220613195137.8117-1-hdegoede@redhat.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 14 Jun 2022 11:25:07 +0200
Message-ID: <CAHp75VcLfeN+y3S=AkMDjUyB3oS1k0j7pu4Ts7D9K35F3UkEbw@mail.gmail.com>
Subject: Re: [PATCH 00/40] media: atomisp: Various hmm and other cleanups
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Andy Shevchenko <andy@kernel.org>,
        Yury Luneff <yury.lunev@gmail.com>,
        Nable <nable.maininbox@googlemail.com>,
        "andrey.i.trufanov" <andrey.i.trufanov@gmail.com>,
        Fabio Aiuto <fabioaiuto83@gmail.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Jun 13, 2022 at 9:51 PM Hans de Goede <hdegoede@redhat.com> wrote:
>
> Hi All,
>
> I want to start writing a libcamera pipeline handler for the atomisp2,
> but before I can do that I first need to fix mmap support in  atomisp2.
>
> My plan for this is to port the atomisp2 handler to videobuf2. To do that
> I first need to understand the existing memory/buffer management so I've
> started with cleaning up the hmm code (with a bit of a detour here and
> there).
>
> This series is the result of that. There are likely more cleanups to
> follow, but I've to focus on some other things for a bit. I hope to be
> able to return to the cleanups + an eventual videobuf2 conversion soon.

Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

For patches 1-8: The code wise it's good clean up, functionality it
might be that intention was to implement it as some point, but looking
into (internal) history of the driver development I believe it would
require some firmware changes which is impossible for upstreamed
version of the driver and as you noticed never productized that time.
Hence, good that we got less LoCs after all.

For patches 9-13: I believe that patch 10 and 9 should be swapped in
the series. Logically you drop caller first followed by (unused)
callee.

For the rest: To be continued...

> Hans de Goede (40):
>   media: atomisp: remove the unused RAW_BUF_STRIDE macro
>   media: atomisp: remove unused ia_css_frame_allocate_contiguous*()
>     functions
>   media: atomisp: drop contiguous argument from
>     ia_css_frame_allocate_with_buffer_size()
>   media: atomisp: drop contiguous argument from
>     frame_allocate_with_data()
>   media: atomisp: drop contiguous argument from frame_create()
>   media: atomisp: drop IA_CSS_FRAME_FORMAT_MIPI support from
>     ia_css_frame_init_planes()
>   media: atomisp: drop contiguous flag from struct ia_css_frame
>   media: atomisp: drop ATOMISP_MAP_FLAG_CONTIGUOUS
>   media: atomisp: remove dynamic and reserved pool code
>   media: atomisp: remove hmm_pool_[un]register()
>   media: atomisp: remove hmm pool code
>   media: atomisp: remove hmm_mem_stats
>   media: atomisp: remove pool related kernel cmdline options
>   media: atomisp: remove unused attribute argument from
>     ia_css_frame_map()
>   media: atomisp: drop hmm_page_type
>   media: atomisp: removed unused hmm_bo_get_page_info() function
>   media: atomisp: remove bogus comment above hmm_bo_allocated()
>     prototype
>   media: atomisp: remove private acceleration ioctls
>   media: atomisp: remove atomisp_acc.c
>   media: atomisp: remove unused atomisp_*css_* functions
>   media: atomisp: asc.acc.pipeline is always NULL
>   media: atomisp: remove no longer used atomisp_css_acc_done() function
>   media: atomisp: remove atomisp_is_acc_enabled()
>   media: atomisp: drop unused ATOMISP_ACC_FW_LOAD_* defines
>   media: atomisp: drop ATOMISP_MAP_FLAG_CLEARED
>   media: atomisp: drop unused ATOMISP_MAP_FLAG_* flags
>   media: atomisp: remove unused hmm address translation functions
>   media: atomisp: add hmm_create_from_userdata() helper
>   media: atomisp: Simplify hmm_alloc() calls
>   media: atomisp: drop highmem var/arg from the hmm code
>   media: atomisp: drop HMM_BO_SHARE type
>   media: atomisp: remove hmm_page_object
>   media: atomisp: fix __get_frame_info() error handling
>   media: atomisp: add error checking to atomisp_create_pipes_stream()
>   media: atomisp: add error logging to
>     atomisp_destroy_pipes_stream_force()
>   media: atomisp: use atomisp_create_pipes_stream() in more places
>   media: atomisp: use atomisp_css_update_stream() in more places
>   media: atomisp: use atomisp_destroy_pipes_stream_force() in more
>     places
>   media: atomisp: remove force argument from
>     __destroy_[stream[s]|pipe[s]]()
>   media: atomisp: Add a notes.txt file
>
>  drivers/staging/media/atomisp/Makefile        |   3 -
>  .../staging/media/atomisp/include/hmm/hmm.h   |  32 +-
>  .../media/atomisp/include/hmm/hmm_bo.h        |  37 +-
>  .../media/atomisp/include/hmm/hmm_common.h    |  26 -
>  .../media/atomisp/include/hmm/hmm_pool.h      | 116 ----
>  .../media/atomisp/include/linux/atomisp.h     | 146 ----
>  drivers/staging/media/atomisp/notes.txt       |  30 +
>  .../staging/media/atomisp/pci/atomisp_acc.c   | 625 ------------------
>  .../staging/media/atomisp/pci/atomisp_acc.h   | 120 ----
>  .../staging/media/atomisp/pci/atomisp_cmd.c   |  33 +-
>  .../media/atomisp/pci/atomisp_compat.h        |  29 +-
>  .../media/atomisp/pci/atomisp_compat_css20.c  | 365 ++--------
>  .../atomisp/pci/atomisp_compat_ioctl32.h      |  58 --
>  .../staging/media/atomisp/pci/atomisp_drvfs.c |   7 +-
>  .../staging/media/atomisp/pci/atomisp_fops.c  |  13 -
>  .../staging/media/atomisp/pci/atomisp_ioctl.c |  73 +-
>  .../staging/media/atomisp/pci/atomisp_ioctl.h |   1 -
>  .../media/atomisp/pci/atomisp_subdev.c        |   3 -
>  .../media/atomisp/pci/atomisp_subdev.h        |  10 -
>  .../staging/media/atomisp/pci/atomisp_v4l2.c  |  32 -
>  drivers/staging/media/atomisp/pci/hmm/hmm.c   | 186 +-----
>  .../staging/media/atomisp/pci/hmm/hmm_bo.c    | 261 ++------
>  .../media/atomisp/pci/hmm/hmm_dynamic_pool.c  | 234 -------
>  .../media/atomisp/pci/hmm/hmm_reserved_pool.c | 253 -------
>  .../media/atomisp/pci/ia_css_frame_public.h   |  40 --
>  .../kernels/sdis/sdis_1.0/ia_css_sdis.host.c  |   2 +-
>  .../kernels/sdis/sdis_2/ia_css_sdis2.host.c   |   2 +-
>  .../pci/isp/modes/interface/isp_const.h       |   6 -
>  .../pci/runtime/debug/src/ia_css_debug.c      |   2 -
>  .../runtime/frame/interface/ia_css_frame.h    |   7 +-
>  .../atomisp/pci/runtime/frame/src/frame.c     | 105 +--
>  .../pci/runtime/isp_param/src/isp_param.c     |   2 +-
>  .../atomisp/pci/runtime/rmgr/src/rmgr_vbuf.c  |   3 +-
>  .../atomisp/pci/runtime/spctrl/src/spctrl.c   |   2 +-
>  drivers/staging/media/atomisp/pci/sh_css.c    |   5 -
>  .../media/atomisp/pci/sh_css_firmware.c       |   2 +-
>  .../staging/media/atomisp/pci/sh_css_mipi.c   |   3 +-
>  .../staging/media/atomisp/pci/sh_css_params.c |  47 +-
>  38 files changed, 205 insertions(+), 2716 deletions(-)
>  delete mode 100644 drivers/staging/media/atomisp/include/hmm/hmm_pool.h
>  create mode 100644 drivers/staging/media/atomisp/notes.txt
>  delete mode 100644 drivers/staging/media/atomisp/pci/atomisp_acc.c
>  delete mode 100644 drivers/staging/media/atomisp/pci/atomisp_acc.h
>  delete mode 100644 drivers/staging/media/atomisp/pci/hmm/hmm_dynamic_pool.c
>  delete mode 100644 drivers/staging/media/atomisp/pci/hmm/hmm_reserved_pool.c
>
> --
> 2.36.0
>


-- 
With Best Regards,
Andy Shevchenko
