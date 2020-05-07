Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 835BA1C88FC
	for <lists+linux-media@lfdr.de>; Thu,  7 May 2020 13:54:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725985AbgEGLyu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 7 May 2020 07:54:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725809AbgEGLyu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 7 May 2020 07:54:50 -0400
Received: from mail-il1-x143.google.com (mail-il1-x143.google.com [IPv6:2607:f8b0:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 21079C05BD43
        for <linux-media@vger.kernel.org>; Thu,  7 May 2020 04:54:50 -0700 (PDT)
Received: by mail-il1-x143.google.com with SMTP id c18so5013026ile.5
        for <linux-media@vger.kernel.org>; Thu, 07 May 2020 04:54:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2m9cA2DGlu/tEuDZ2A7JbRjVUhsAD9YOefKw9VlBlkY=;
        b=dqcp3pfndwUbZ9T7kuSY5OzMmsWy+t+bv2bBU/rB7Vtb8jaXQltPnvryJODLgZaLCh
         jNmDz2ssMq3pCcG1s3WCIW29GyxoXEHQ2VEDeC8mldZzeVjBwqV4G7Klv5mYtx8+Anfo
         FQgy4TzR21tbdnpe2DF9MV+V/wL/TTXQ4U7Ws=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2m9cA2DGlu/tEuDZ2A7JbRjVUhsAD9YOefKw9VlBlkY=;
        b=rPIx6FLyeEafaqB4asydwSi9IVTWXjs3/6SkKDmIAWBhP1EFfitYAgfQnK9D32Yx8O
         1VDLiWGoi6sk3CQUr77+bZ1XV5PU0MEWNGC7cia2gM++fl0RAVELdpTn3t5H+GHCweZp
         HHRA4EMl/ICXxlQcck1h1Q5C7qwIv95rUWrS3UQPoXWSGbB1vDlH4odH+YwKIcWWCo5u
         GhPA++Gt+q99WQd0TiFp3g/XnKGQ5uewsSFwZ5twR7bFtp9wkZdYMKaPOkeX8hjTH5By
         4SVzt6+qCLDK9yyqhtjSvIeLrZ/TKRaXdQzmoXKcjkaScEkkHp6FYgPDxmH2Lrj6Qs2J
         W5iA==
X-Gm-Message-State: AGi0PuYQKuzYAL+nQLlRz662adao8KH4GndSFnneG02QxwOgLv9wfWHQ
        +8+v0a0Gx68nwER/xg3g1Q5RZO8DlSbNHg0HaZEBGQ==
X-Google-Smtp-Source: APiQypK+DwwsfPo2MHiclFfqUE05v9MR5PBvG5tjtGjNofe3H4AIurIe0qN0zkogFB5A77k8z8zuNZDhZkVlg8mKSQo=
X-Received: by 2002:a92:8350:: with SMTP id f77mr14310939ild.257.1588852489329;
 Thu, 07 May 2020 04:54:49 -0700 (PDT)
MIME-Version: 1.0
References: <20200423211040.14275-1-rosenp@gmail.com>
In-Reply-To: <20200423211040.14275-1-rosenp@gmail.com>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Thu, 7 May 2020 13:54:38 +0200
Message-ID: <CAHD77H=x2audZcChjCgB=-f4YP2M2MWc5U=FiyXCedbQUPrRfg@mail.gmail.com>
Subject: Re: [PATCH 1/5] utils: fix compilation with C++98
To:     Rosen Penev <rosenp@gmail.com>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

HI Rosen,

On Thu, Apr 23, 2020 at 11:10 PM Rosen Penev <rosenp@gmail.com> wrote:
>
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
>  utils/cec-compliance/cec-test.cpp | 4 ++--
>  utils/rds-ctl/rds-ctl.cpp         | 2 +-
>  utils/v4l2-ctl/v4l2-ctl-tuner.cpp | 2 +-
>  3 files changed, 4 insertions(+), 4 deletions(-)
>

First of all, thanks for the patch!

One question: In what case this file would end up being compiled in
the C++98 mode?

Also, please see a comment inline.

> diff --git a/utils/cec-compliance/cec-test.cpp b/utils/cec-compliance/cec-test.cpp
> index 032ff5ad..cc07998a 100644
> --- a/utils/cec-compliance/cec-test.cpp
> +++ b/utils/cec-compliance/cec-test.cpp
> @@ -908,7 +908,7 @@ static int tuner_ctl_test(struct node *node, unsigned me, unsigned la, bool inte
>                 cec_msg_give_tuner_device_status(&msg, true, CEC_OP_STATUS_REQ_ONCE);
>                 fail_on_test(!transmit_timeout(node, &msg));
>                 fail_on_test(timed_out_or_abort(&msg));
> -               info = {};
> +               memset(&info, 0, sizeof(info));
>                 cec_ops_tuner_device_status(&msg, &info);
>                 if (!memcmp(&info, &info_vec[0], sizeof(info)))
>                         break;
> @@ -935,7 +935,7 @@ static int tuner_ctl_test(struct node *node, unsigned me, unsigned la, bool inte
>                 cec_msg_give_tuner_device_status(&msg, true, CEC_OP_STATUS_REQ_ONCE);
>                 fail_on_test(!transmit_timeout(node, &msg));
>                 fail_on_test(timed_out_or_abort(&msg));
> -               info = {};
> +               memset(&info, 0, sizeof(info));
>                 cec_ops_tuner_device_status(&msg, &info);
>                 if (memcmp(&info, &(*iter), sizeof(info))) {
>                         log_tuner_service(info);
> diff --git a/utils/rds-ctl/rds-ctl.cpp b/utils/rds-ctl/rds-ctl.cpp
> index 0511fe5d..0e497b2a 100644
> --- a/utils/rds-ctl/rds-ctl.cpp
> +++ b/utils/rds-ctl/rds-ctl.cpp
> @@ -918,7 +918,7 @@ static void get_options(const int fd, const int capabilities, struct v4l2_freque
>                                 printf("\tFrequency range      : %.1f MHz - %.1f MHz\n",
>                                          vt.rangelow / 16.0, vt.rangehigh / 16.0);
>                         printf("\tSignal strength/AFC  : %ld%%/%d\n",
> -                               std::lround(vt.signal / 655.35), vt.afc);
> +                               lround(vt.signal / 655.25), vt.afc);

Why the change from .35 to .25?

Best regards,
Tomasz

>                         printf("\tCurrent audio mode   : %s\n", audmode2s(vt.audmode));
>                         printf("\tAvailable subchannels: %s\n",
>                                         rxsubchans2s(vt.rxsubchans).c_str());
> diff --git a/utils/v4l2-ctl/v4l2-ctl-tuner.cpp b/utils/v4l2-ctl/v4l2-ctl-tuner.cpp
> index bc397ec2..73dc323c 100644
> --- a/utils/v4l2-ctl/v4l2-ctl-tuner.cpp
> +++ b/utils/v4l2-ctl/v4l2-ctl-tuner.cpp
> @@ -423,7 +423,7 @@ void tuner_get(cv4l_fd &_fd)
>
>                         if (vt.type != V4L2_TUNER_SDR && vt.type != V4L2_TUNER_RF) {
>                                 printf("\tSignal strength/AFC  : %ld%%/%d\n",
> -                                      std::lround(vt.signal / 655.35), vt.afc);
> +                                      lround(vt.signal / 655.35), vt.afc);
>                                 printf("\tCurrent audio mode   : %s\n", audmode2s(vt.audmode));
>                                 printf("\tAvailable subchannels: %s\n", rxsubchans2s(vt.rxsubchans).c_str());
>                         }
> --
> 2.25.3
>
