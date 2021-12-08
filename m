Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0C4B846C967
	for <lists+linux-media@lfdr.de>; Wed,  8 Dec 2021 01:39:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229918AbhLHAnP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 7 Dec 2021 19:43:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49074 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233843AbhLHAnJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 7 Dec 2021 19:43:09 -0500
Received: from mail-yb1-xb43.google.com (mail-yb1-xb43.google.com [IPv6:2607:f8b0:4864:20::b43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2B5DC061A32
        for <linux-media@vger.kernel.org>; Tue,  7 Dec 2021 16:39:38 -0800 (PST)
Received: by mail-yb1-xb43.google.com with SMTP id x32so1955378ybi.12
        for <linux-media@vger.kernel.org>; Tue, 07 Dec 2021 16:39:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Z91/RQR2ggN3CNO0vBhZ5cqS+NaKjKzA2siwSt23VIQ=;
        b=gJr1huwnOxRd5CJO+p7AKd2HUtvmHs4Y8h/XOXbmRUATqq/RGh+GJq7FNHx3Qqgitq
         tC7nNsg+zcnFbghr61hbjzRz6p5cW22AlP0qm5KsgRgb/h/V3gundG44zGR4najpIift
         UH9D/IMs0p0vF93Mat8HGiXBMvIq68iXhpbV68bXNfuaxQnIkGHLQY5Mbp4m+75+pqME
         t1gPvQRXYf25UESVWcYDmhg0c2NLHK8pTnBjAg/Ji3bEsDNnHGR3uw1k7JcKDeQ+i392
         qSda9LNKzqgPFaGnhfMq8UaPJ3yLlhiCQ9D8s+KFVmLC54aQTxcF1UGCB8f9I7YvL0IC
         t7yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Z91/RQR2ggN3CNO0vBhZ5cqS+NaKjKzA2siwSt23VIQ=;
        b=WFRvhLLJzCdTaRT78dgg61atYzD/AaciHgxu/UG5Oj55hiohMHHDfk7C0vU9oLwiDW
         SXO8OEtMyXjKS07qGi5zvsrvgJF+eLUc/qYtbBTGKWz6Yzl8pNUhHd6zSdC5DE7eM1IR
         28fC9qlM7Ednm2k/fERbel85Q2lazm90OfaQTmJJLFVieAi2yrmp+HofRYo4ivOvJVG0
         6yAy9szAsWSULypLfBqeXfQmxU12TzUnVPgnnrsIgXEC0S18JCMzhE6oUyICmh+fqWKW
         Q/UoNEWEPmJK4/cvMzc0EZCn79Qp/aWL4SURM3IkFBV2SCpZrGWtHeGcVwcNxXwwGncO
         QbVw==
X-Gm-Message-State: AOAM532iXXrRli+XTI51sxCgq4LqLUT90t/O/1N3ANdV9yCPAwfGm1w0
        rIs9UI8peywUnyXWKk97oO6eUcQEQWbSGCVRILNUmSdo4ohcOg==
X-Google-Smtp-Source: ABdhPJxLRoaaBkcymQbH/RzbI04V4rIZoex+GoNCYSc2acZbod4+T8ivp/Znc25zlV8jT6E+J2Vp33NUJ/sCx0Da128=
X-Received: by 2002:a25:2f13:: with SMTP id v19mr51833927ybv.410.1638923977871;
 Tue, 07 Dec 2021 16:39:37 -0800 (PST)
MIME-Version: 1.0
References: <20211204061351.53611-1-deborahbrouwer3563@gmail.com> <202112042134.zRpYtrRg-lkp@intel.com>
In-Reply-To: <202112042134.zRpYtrRg-lkp@intel.com>
From:   Deborah Brouwer <deborahbrouwer3563@gmail.com>
Date:   Tue, 7 Dec 2021 16:39:26 -0800
Message-ID: <CAONMFfBQ7B9pXjiOmZkdw+LpjQBaZbPqSGMEk8nLTAfrKVp-OA@mail.gmail.com>
Subject: Re: [PATCH v2] media: vivid: fix timestamp and sequence wrapping
To:     linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil@xs4all.nl>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Ok, ignore this v2, I am sending a v3 with this issue fixed I hope.

On Sat, Dec 4, 2021 at 5:56 AM kernel test robot <lkp@intel.com> wrote:
>
> Hi Deborah,
>
> Thank you for the patch! Perhaps something to improve:
>
> [auto build test WARNING on media-tree/master]
> [also build test WARNING on v5.16-rc3 next-20211203]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch]
>
> url:    https://github.com/0day-ci/linux/commits/Deborah-Brouwer/media-vivid-fix-timestamp-and-sequence-wrapping/20211204-141534
> base:   git://linuxtv.org/media_tree.git master
> config: i386-randconfig-a013-20211203 (https://download.01.org/0day-ci/archive/20211204/202112042134.zRpYtrRg-lkp@intel.com/config)
> compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 5f1d1854eb1450d352663ee732235893c5782237)
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://github.com/0day-ci/linux/commit/e6e5201f7b5b9718f318a5c3034b71fcc79aa47f
>         git remote add linux-review https://github.com/0day-ci/linux
>         git fetch --no-tags linux-review Deborah-Brouwer/media-vivid-fix-timestamp-and-sequence-wrapping/20211204-141534
>         git checkout e6e5201f7b5b9718f318a5c3034b71fcc79aa47f
>         # save the config file to linux build tree
>         mkdir build_dir
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/media/test-drivers/vivid/
>
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
>
> All warnings (new ones prefixed by >>):
>
> >> drivers/media/test-drivers/vivid/vivid-ctrls.c:1125:49: warning: overflow in expression; result is -1179869184 with type 'long' [-Winteger-overflow]
>                            dev->time_wrap = (1ULL << 63) - NSEC_PER_SEC * 16;
>                                                                         ^
>    1 warning generated.
>
>
> vim +/long +1125 drivers/media/test-drivers/vivid/vivid-ctrls.c
>
>   1083
>   1084  static int vivid_streaming_s_ctrl(struct v4l2_ctrl *ctrl)
>   1085  {
>   1086          struct vivid_dev *dev = container_of(ctrl->handler, struct vivid_dev, ctrl_hdl_streaming);
>   1087
>   1088          switch (ctrl->id) {
>   1089          case VIVID_CID_DQBUF_ERROR:
>   1090                  dev->dqbuf_error = true;
>   1091                  break;
>   1092          case VIVID_CID_PERC_DROPPED:
>   1093                  dev->perc_dropped_buffers = ctrl->val;
>   1094                  break;
>   1095          case VIVID_CID_QUEUE_SETUP_ERROR:
>   1096                  dev->queue_setup_error = true;
>   1097                  break;
>   1098          case VIVID_CID_BUF_PREPARE_ERROR:
>   1099                  dev->buf_prepare_error = true;
>   1100                  break;
>   1101          case VIVID_CID_START_STR_ERROR:
>   1102                  dev->start_streaming_error = true;
>   1103                  break;
>   1104          case VIVID_CID_REQ_VALIDATE_ERROR:
>   1105                  dev->req_validate_error = true;
>   1106                  break;
>   1107          case VIVID_CID_QUEUE_ERROR:
>   1108                  if (vb2_start_streaming_called(&dev->vb_vid_cap_q))
>   1109                          vb2_queue_error(&dev->vb_vid_cap_q);
>   1110                  if (vb2_start_streaming_called(&dev->vb_vbi_cap_q))
>   1111                          vb2_queue_error(&dev->vb_vbi_cap_q);
>   1112                  if (vb2_start_streaming_called(&dev->vb_vid_out_q))
>   1113                          vb2_queue_error(&dev->vb_vid_out_q);
>   1114                  if (vb2_start_streaming_called(&dev->vb_vbi_out_q))
>   1115                          vb2_queue_error(&dev->vb_vbi_out_q);
>   1116                  if (vb2_start_streaming_called(&dev->vb_sdr_cap_q))
>   1117                          vb2_queue_error(&dev->vb_sdr_cap_q);
>   1118                  break;
>   1119          case VIVID_CID_SEQ_WRAP:
>   1120                  dev->seq_wrap = ctrl->val;
>   1121                  break;
>   1122          case VIVID_CID_TIME_WRAP:
>   1123                  dev->time_wrap = ctrl->val;
>   1124                  if (dev->time_wrap == 1)
> > 1125                          dev->time_wrap = (1ULL << 63) - NSEC_PER_SEC * 16;
>   1126                  else if (dev->time_wrap == 2)
>   1127                          dev->time_wrap = ((1ULL << 31) - 16) * NSEC_PER_SEC;
>   1128                  break;
>   1129          }
>   1130          return 0;
>   1131  }
>   1132
>
> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
