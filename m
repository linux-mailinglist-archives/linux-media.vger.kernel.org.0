Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 429D763EA7A
	for <lists+linux-media@lfdr.de>; Thu,  1 Dec 2022 08:44:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229507AbiLAHoy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 1 Dec 2022 02:44:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54334 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229497AbiLAHow (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 1 Dec 2022 02:44:52 -0500
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com [IPv6:2607:f8b0:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 473911C11F
        for <linux-media@vger.kernel.org>; Wed, 30 Nov 2022 23:44:51 -0800 (PST)
Received: by mail-pg1-x535.google.com with SMTP id f9so958142pgf.7
        for <linux-media@vger.kernel.org>; Wed, 30 Nov 2022 23:44:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=DmcgvghbSyLETEiIiqLC0sxEJ/RMk6n6/8eL24bWMBs=;
        b=Yx2ZfemFxyoM/0QW/JdyoF0maNAYSQYb8rt1NhRljcp7MKl0ziNJMBJ0SzAY9DIBFl
         aGZrE8tKJ9SWhObnmXg5uXXYKgu8QCM4HIjzcanWq/GaD9yihyUgFLuYHHT3VDX1TLt6
         c3wBULAzz/3QgoQQ/878H7Klbo45sj2drO9XWvhULJIyJCRW9rxgkMtVwIFiZlcBKzkH
         F1zK7us+/cQafcLSbMCVB83ZmwNTEFAtxNlGQtNrRZXfiI+w/xIh5wgbJpA1DVDpu1V1
         36OtLklBASdQc7XxgLMkO7MFW5gnUnYOA/ZMpor3qORLdik4xvNiLNwpi5SRt7n6AHPl
         jbRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DmcgvghbSyLETEiIiqLC0sxEJ/RMk6n6/8eL24bWMBs=;
        b=1wgl3ghQ+bz/ewlpZI7pMA5hUk+qzUgqrUaFZG1tEKju/cOOdHE5AAIWpTtm+29rjI
         RCGUDlyNetVpN/fcr71VZLJCS3Q4eaKWg97r3hkrUe2pHLteFwH+haKkTZjms+XJiu+h
         IkhBGxlIIPw7T2bo+SX9ffG/f4SY5DxRG37UxTdfKisw7XfATarbi767ngbEol671l2T
         GOK7XmIDZT831lofNhTrf/ohxLHY+kHd/OVxpDt2yU6xZ6ivP9PAu8pa32RA0BanOVYF
         oSPwd2IHOma9etT8a1Jw2eUlhzSAQ02Q/QiY+eIX5sZ39M8YHGGehzcECDBSjO5Bjzp3
         KE8Q==
X-Gm-Message-State: ANoB5pmKRWcmKLh8of8qfXjKhnqvPsAjSqNLuBvgYlj8JUJaf2GOt6qr
        S8zFMRUrYRwT55BJ4m72G1Ct5uScYHpzMQfyf3+T6w==
X-Google-Smtp-Source: AA0mqf49indqv/b5nd3C/0vW+yWfNh9rCi0z795YuXezT342+ZwxuFJxHclerV+exc+YdIOTWvoN6u7KcFy7vV4Ygc4=
X-Received: by 2002:a63:105c:0:b0:46f:f72c:cdae with SMTP id
 28-20020a63105c000000b0046ff72ccdaemr41659653pgq.237.1669880690455; Wed, 30
 Nov 2022 23:44:50 -0800 (PST)
MIME-Version: 1.0
References: <20221201023204.2177458-3-yunkec@google.com> <202212011503.PQRj8R8e-lkp@intel.com>
In-Reply-To: <202212011503.PQRj8R8e-lkp@intel.com>
From:   Yunke Cao <yunkec@google.com>
Date:   Thu, 1 Dec 2022 16:44:39 +0900
Message-ID: <CANqU6FfTDK1W3=t3KwXtH=5hVjWeAXsWJsLshuXhtMUDztX_rA@mail.gmail.com>
Subject: Re: [PATCH v10 02/11 RESEND] media: uvcvideo: add uvc_ctrl_get_boundary
 for getting default value
To:     kernel test robot <lkp@intel.com>
Cc:     Hans Verkuil <hverkuil@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        oe-kbuild-all@lists.linux.dev, Tomasz Figa <tfiga@chromium.org>,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        Ricardo Ribalda <ribalda@chromium.org>,
        linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi!

Thanks for the review.

On Thu, Dec 1, 2022 at 4:16 PM kernel test robot <lkp@intel.com> wrote:
>
> Hi Yunke,
>
> Thank you for the patch! Perhaps something to improve:
>
> [auto build test WARNING on linus/master]
> [also build test WARNING on v6.1-rc7 next-20221201]
> [cannot apply to media-tree/master]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Yunke-Cao/media-Implement-UVC-v1-5-ROI/20221201-103422
> patch link:    https://lore.kernel.org/r/20221201023204.2177458-3-yunkec%40google.com
> patch subject: [PATCH v10 02/11 RESEND] media: uvcvideo: add uvc_ctrl_get_boundary for getting default value
> config: m68k-allyesconfig
> compiler: m68k-linux-gcc (GCC) 12.1.0
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://github.com/intel-lab-lkp/linux/commit/bb57965a09e65c4ed0cc01d63e158bba810648b4
>         git remote add linux-review https://github.com/intel-lab-lkp/linux
>         git fetch --no-tags linux-review Yunke-Cao/media-Implement-UVC-v1-5-ROI/20221201-103422
>         git checkout bb57965a09e65c4ed0cc01d63e158bba810648b4
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k SHELL=/bin/bash drivers/media/usb/uvc/
>
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
>
> All warnings (new ones prefixed by >>):
>
>    drivers/media/usb/uvc/uvc_ctrl.c: In function 'uvc_ctrl_get_boundary':
> >> drivers/media/usb/uvc/uvc_ctrl.c:1788:73: warning: passing argument 4 of '__uvc_ctrl_get_boundary_std' makes integer from pointer without a cast [-Wint-conversion]
>     1788 |                 ret = __uvc_ctrl_get_boundary_std(chain, ctrl, mapping, xctrl);
>          |                                                                         ^~~~~
>          |                                                                         |
>          |                                                                         struct v4l2_ext_control *
>    drivers/media/usb/uvc/uvc_ctrl.c:1755:44: note: expected 'u32' {aka 'unsigned int'} but argument is of type 'struct v4l2_ext_control *'
>     1755 |                                        u32 v4l2_which,
>          |                                        ~~~~^~~~~~~~~~

1755 |                                        u32 v4l2_which,

This parameter should have been added as part of patch 10/11 instead
of here. Sorry!
Will fix it in the next version.

>    drivers/media/usb/uvc/uvc_ctrl.c:1788:23: error: too few arguments to function '__uvc_ctrl_get_boundary_std'
>     1788 |                 ret = __uvc_ctrl_get_boundary_std(chain, ctrl, mapping, xctrl);
>          |                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>    drivers/media/usb/uvc/uvc_ctrl.c:1752:12: note: declared here
>     1752 | static int __uvc_ctrl_get_boundary_std(struct uvc_video_chain *chain,
>          |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>
>
> vim +/__uvc_ctrl_get_boundary_std +1788 drivers/media/usb/uvc/uvc_ctrl.c
>
>   1768
>   1769  int uvc_ctrl_get_boundary(struct uvc_video_chain *chain,
>   1770                            struct v4l2_ext_control *xctrl)
>   1771  {
>   1772          struct uvc_control *ctrl;
>   1773          struct uvc_control_mapping *mapping;
>   1774          int ret;
>   1775
>   1776          if (mutex_lock_interruptible(&chain->ctrl_mutex))
>   1777                  return -ERESTARTSYS;
>   1778
>   1779          ctrl = uvc_find_control(chain, xctrl->id, &mapping);
>   1780          if (!ctrl) {
>   1781                  ret = -EINVAL;
>   1782                  goto done;
>   1783          }
>   1784
>   1785          if (uvc_ctrl_mapping_is_compound(mapping))
>   1786                  ret = -EINVAL;
>   1787          else
> > 1788                  ret = __uvc_ctrl_get_boundary_std(chain, ctrl, mapping, xctrl);
>   1789
>   1790  done:
>   1791          mutex_unlock(&chain->ctrl_mutex);
>   1792          return ret;
>   1793  }
>   1794
>
> --
> 0-DAY CI Kernel Test Service
> https://01.org/lkp
