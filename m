Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 42FE35612AB
	for <lists+linux-media@lfdr.de>; Thu, 30 Jun 2022 08:42:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232577AbiF3GmO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 30 Jun 2022 02:42:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45568 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232434AbiF3GmN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 30 Jun 2022 02:42:13 -0400
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com [IPv6:2607:f8b0:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B26D23136B
        for <linux-media@vger.kernel.org>; Wed, 29 Jun 2022 23:42:12 -0700 (PDT)
Received: by mail-oi1-x231.google.com with SMTP id be10so24792630oib.7
        for <linux-media@vger.kernel.org>; Wed, 29 Jun 2022 23:42:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9vw/di/zLpnsL1sONxLawi7FcB/n26joNOuAKf9jcy8=;
        b=XAtP6BQUkHmk1qNwxtD3iT8ZA1Elx2hs72dMKwT0Fg6+bFBO0Y1RyEhdNYH00mvwJl
         Y+mb2j9owr2kQCJZwKx8VxsbAUeYM8HEvtFjQcXfL8ORq+GjM/jd1TYDD3qpJu/ZFIJp
         b3bLyj2fRK3mCvtPAZunZ0+Wyy1OdCjrcfuIk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9vw/di/zLpnsL1sONxLawi7FcB/n26joNOuAKf9jcy8=;
        b=7YAs7xjMUh+HaBcrsElZ7vEpuBybWP+ez72VOJHcx4KhPoiZxwDikZiQ0lSA5f/2lA
         PZ52Je/hfGM2sOo/bKMm/70JKFmwKAngxFYa4oYa/VNswD1+bwMzn9WJXpim57wx8z72
         DdO3ZQpiP0V7Chm/J6olOlIGQ75kTTfwBTwSPYS3Erg91qK8t+Io3gcH5s6/LrP/uYXp
         3A/Xv3hEkkyWuPnzzBs+kQ4agDHOz2ZR7SV78WVIsgP60id+Af1og1Qq+b72gR+z8T1X
         JkC6pByqXSj+F3PatQG1E1QdljBL0Zc+7BzBJxLjlalPuUew+osj5Jc55yW/WFM36M/+
         79rA==
X-Gm-Message-State: AJIora9UUwhjYfkTF6RSOIyku41XfTXfQlt39xOCdSnMw/p2Myfji+E8
        S4pEs6Lzf+VjrkYO1Hts3unFm9rUPH/URQ==
X-Google-Smtp-Source: AGRyM1sCT9bHOFJl+Vu0YcB+0FkJelq5uVtW4JZm2Kkm5su4M2HSfEL9V8yNzpliYcknftMJJNxDuw==
X-Received: by 2002:a05:6808:1992:b0:335:3a49:2944 with SMTP id bj18-20020a056808199200b003353a492944mr5371606oib.48.1656571331829;
        Wed, 29 Jun 2022 23:42:11 -0700 (PDT)
Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com. [209.85.161.54])
        by smtp.gmail.com with ESMTPSA id r23-20020a056870179700b000f2455e26acsm12288194oae.48.2022.06.29.23.42.08
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jun 2022 23:42:09 -0700 (PDT)
Received: by mail-oo1-f54.google.com with SMTP id w3-20020a4ab6c3000000b0041c1e737283so3577095ooo.12
        for <linux-media@vger.kernel.org>; Wed, 29 Jun 2022 23:42:08 -0700 (PDT)
X-Received: by 2002:a4a:986c:0:b0:40e:94c3:3233 with SMTP id
 z41-20020a4a986c000000b0040e94c33233mr3153628ooi.2.1656571328228; Wed, 29 Jun
 2022 23:42:08 -0700 (PDT)
MIME-Version: 1.0
References: <20220628075705.2278044-1-yunkec@google.com> <20220628075705.2278044-7-yunkec@google.com>
In-Reply-To: <20220628075705.2278044-7-yunkec@google.com>
From:   Ricardo Ribalda <ribalda@chromium.org>
Date:   Thu, 30 Jun 2022 08:41:57 +0200
X-Gmail-Original-Message-ID: <CANiDSCvCcLOcgynZcmTBLF__VyNDTETizKGuRK17pxiPtOkUcA@mail.gmail.com>
Message-ID: <CANiDSCvCcLOcgynZcmTBLF__VyNDTETizKGuRK17pxiPtOkUcA@mail.gmail.com>
Subject: Re: [PATCH v7 6/7] media: uvcvideo: support V4L2_CTRL_WHICH_MIN/MAX_VAL
To:     Yunke Cao <yunkec@google.com>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, 28 Jun 2022 at 09:57, Yunke Cao <yunkec@google.com> wrote:
>
> Add support for V4L2_CTRL_WHICH_MIN/MAX_VAL in uvc driver.
> It is useful for the V4L2_CID_UVC_REGION_OF_INTEREST_RECT control.
>
> Signed-off-by: Yunke Cao <yunkec@google.com>
Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  drivers/media/usb/uvc/uvc_ctrl.c | 73 ++++++++++++++++++++++++++------
>  drivers/media/usb/uvc/uvc_v4l2.c | 11 +++--
>  drivers/media/usb/uvc/uvcvideo.h |  3 +-
>  3 files changed, 70 insertions(+), 17 deletions(-)
>
> diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> index 00482269233a..b569d6824ac1 100644
> --- a/drivers/media/usb/uvc/uvc_ctrl.c
> +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> @@ -1923,7 +1923,7 @@ int uvc_ctrl_get(struct uvc_video_chain *chain,
>  }
>
>  int __uvc_ctrl_get_fixed_std(struct uvc_video_chain *chain,
> -                            struct v4l2_ext_control *xctrl)
> +                            struct v4l2_ext_control *xctrl, u32 v4l2_which)
>  {
>         struct v4l2_queryctrl qc = { .id = xctrl->id };
>         int ret = uvc_query_v4l2_ctrl(chain, &qc);
> @@ -1931,16 +1931,69 @@ int __uvc_ctrl_get_fixed_std(struct uvc_video_chain *chain,
>         if (ret < 0)
>                 return ret;
>
> -       xctrl->value = qc.default_value;
> +       switch (v4l2_which) {
> +       case V4L2_CTRL_WHICH_DEF_VAL:
> +               xctrl->value = qc.default_value;
> +               break;
> +       case V4L2_CTRL_WHICH_MIN_VAL:
> +               xctrl->value = qc.minimum;
> +               break;
> +       case V4L2_CTRL_WHICH_MAX_VAL:
> +               xctrl->value = qc.maximum;
> +               break;
> +       default:
> +               return -EINVAL;
> +       }
> +
>         return 0;
>  }
>
> +static int __uvc_ctrl_get_fixed_compound(struct uvc_video_chain *chain,
> +                                        struct uvc_control_mapping *mapping,
> +                                        struct uvc_control *ctrl,
> +                                        u32 v4l2_which,
> +                                        struct v4l2_ext_control *xctrl)
> +{
> +       int ret;
> +       u32 flag, id;
> +
> +       if (mapping->v4l2_type < V4L2_CTRL_COMPOUND_TYPES)
> +               return -EINVAL;
> +
> +       switch (v4l2_which) {
> +       case V4L2_CTRL_WHICH_DEF_VAL:
> +               flag = UVC_CTRL_FLAG_GET_DEF;
> +               id = UVC_CTRL_DATA_DEF;
> +               break;
> +       case V4L2_CTRL_WHICH_MIN_VAL:
> +               flag = UVC_CTRL_FLAG_GET_MIN;
> +               id = UVC_CTRL_DATA_MIN;
> +               break;
> +       case V4L2_CTRL_WHICH_MAX_VAL:
> +               flag = UVC_CTRL_FLAG_GET_MAX;
> +               id = UVC_CTRL_DATA_MAX;
> +               break;
> +       default:
> +               return -EINVAL;
> +       }
> +
> +       if (!(ctrl->info.flags & flag) && flag != UVC_CTRL_FLAG_GET_DEF)
> +               return -EACCES;
> +
> +       if (!ctrl->cached) {
> +               ret = uvc_ctrl_populate_cache(chain, ctrl);
> +               if (ret < 0)
> +                       return ret;
> +       }
> +
> +       return __uvc_ctrl_get_compound_to_user(mapping, ctrl, id, xctrl);
> +}
> +
>  int uvc_ctrl_get_fixed(struct uvc_video_chain *chain,
> -                      struct v4l2_ext_control *xctrl)
> +                      struct v4l2_ext_control *xctrl, u32 v4l2_which)
>  {
>         struct uvc_control *ctrl;
>         struct uvc_control_mapping *mapping;
> -       int ret;
>
>         if (__uvc_query_v4l2_class(chain, xctrl->id, 0) >= 0)
>                 return -EACCES;
> @@ -1950,16 +2003,10 @@ int uvc_ctrl_get_fixed(struct uvc_video_chain *chain,
>                 return -EINVAL;
>
>         if (mapping->v4l2_type < V4L2_CTRL_COMPOUND_TYPES)
> -               return __uvc_ctrl_get_fixed_std(chain, xctrl);
> +               return __uvc_ctrl_get_fixed_std(chain, xctrl, v4l2_which);
>
> -       if (!ctrl->cached) {
> -               ret = uvc_ctrl_populate_cache(chain, ctrl);
> -               if (ret < 0)
> -                       return ret;
> -       }
> -
> -       return __uvc_ctrl_get_compound_to_user(mapping, ctrl, UVC_CTRL_DATA_DEF,
> -                                              xctrl);
> +       return __uvc_ctrl_get_fixed_compound(chain, mapping, ctrl, v4l2_which,
> +                                            xctrl);
>  }
>
>  int __uvc_ctrl_set_compound(struct uvc_control_mapping *mapping,
> diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
> index aad61af36271..004e3b764737 100644
> --- a/drivers/media/usb/uvc/uvc_v4l2.c
> +++ b/drivers/media/usb/uvc/uvc_v4l2.c
> @@ -1043,16 +1043,21 @@ static int uvc_ioctl_g_ext_ctrls(struct file *file, void *fh,
>         if (ret < 0)
>                 return ret;
>
> -       if (ctrls->which == V4L2_CTRL_WHICH_DEF_VAL) {
> +       switch (ctrls->which) {
> +       case V4L2_CTRL_WHICH_DEF_VAL:
> +       case V4L2_CTRL_WHICH_MIN_VAL:
> +       case V4L2_CTRL_WHICH_MAX_VAL:
>                 for (i = 0; i < ctrls->count; ++ctrl, ++i) {
> -                       ret = uvc_ctrl_get_fixed(chain, ctrl);
> +                       ret = uvc_ctrl_get_fixed(chain, ctrl, ctrls->which);
>                         if (ret < 0) {
>                                 ctrls->error_idx = i;
>                                 return ret;
>                         }
>                 }
> -
>                 return 0;
> +
> +       default:
> +               break;
>         }
>
>         ret = uvc_ctrl_begin(chain);
> diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> index 9ff95bbad251..54cc47bc2d33 100644
> --- a/drivers/media/usb/uvc/uvcvideo.h
> +++ b/drivers/media/usb/uvc/uvcvideo.h
> @@ -913,7 +913,8 @@ static inline int uvc_ctrl_rollback(struct uvc_fh *handle)
>
>  int uvc_ctrl_get(struct uvc_video_chain *chain, struct v4l2_ext_control *xctrl);
>  int uvc_ctrl_get_fixed(struct uvc_video_chain *chain,
> -                      struct v4l2_ext_control *xctrl);
> +                      struct v4l2_ext_control *xctrl,
> +                      u32 v4l2_which);
>  int uvc_ctrl_set(struct uvc_fh *handle, struct v4l2_ext_control *xctrl);
>  int uvc_ctrl_is_accessible(struct uvc_video_chain *chain, u32 v4l2_id,
>                            bool read);
> --
> 2.37.0.rc0.161.g10f37bed90-goog
>


-- 
Ricardo Ribalda
