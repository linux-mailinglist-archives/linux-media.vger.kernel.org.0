Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 64F0258FA07
	for <lists+linux-media@lfdr.de>; Thu, 11 Aug 2022 11:28:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234156AbiHKJ2U (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 11 Aug 2022 05:28:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41282 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232585AbiHKJ2T (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 11 Aug 2022 05:28:19 -0400
Received: from mail-yw1-x1130.google.com (mail-yw1-x1130.google.com [IPv6:2607:f8b0:4864:20::1130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0FEC92F54
        for <linux-media@vger.kernel.org>; Thu, 11 Aug 2022 02:28:17 -0700 (PDT)
Received: by mail-yw1-x1130.google.com with SMTP id 00721157ae682-32868f43dd6so167041037b3.8
        for <linux-media@vger.kernel.org>; Thu, 11 Aug 2022 02:28:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=r+s24WEpfCrpr3zXYf6KhdqLi+0jwCpTYCMSnMtp/R4=;
        b=CSLWthE2fLHcbx+hUExc3eW1P05KHy68SJS1JukCLPuTOqwR5olFi0Y+K486BbhYPi
         hDWC+EGcOB6mQuIvuq/dKBxwK/frQdZ8748ZApD8VXJe6spWQGS+CTtelZMIDsz2NwKv
         ZxU1oQ/Kq2+M5kSTLOzjTF0+LGfGOqg1EyB8mgExTR1umlWo4piTmbZ9+DGIGlLDoYz7
         O7IDymGrwlLceCAb/M0gDNAj0f9VJ3NWXg0BEZNosSITmZKZ0RuiKopk3vlPXoCK8wET
         s2Fu4VwqQJSKbn346sy6imhfcUoSBiZZbDTmyadMsFZPWEIuZJuWLtqxwsaz9VBiPx9B
         tqVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=r+s24WEpfCrpr3zXYf6KhdqLi+0jwCpTYCMSnMtp/R4=;
        b=waaOF7BrJlyQcy0VYYqLq9UtKuTOd/kt+imJBcTApJOI+bXfJPW5pKWKlhmpHl+AlE
         Ju75nVIaXOv2aVWeUZeyUish7Z0GtVgBqOPpkwZO9VX0Rx16tTFo4IBVMTQIdhQs3vBI
         e9k6JqFYOaCUhWyZvRjVpbmPGjs8JQhCubFSUeWHx4U6WlncFM4lEIRyNmSEkxDYbNKP
         wi5BHnJYS884xQthEL2/9d7bQPJC90gLSM4gyGCfrLQ/M9OWGZSiqFDV2xeGVOL3UQVx
         K1/YmIVAww2JegKFtv8BZkcGu3W/aoyzvlqP3WuTMZRaJX+zT6XxAc+cY/kKwCllmnTa
         31+Q==
X-Gm-Message-State: ACgBeo3UZ48oeX13rPO4Lffg8hAQ/tafhwbn4L0s965SFoan1lorXdGe
        AxV+/jZsEo709Pzout5+d8tKdH1IIbmPN+uRzlO5an5iD1OLJg==
X-Google-Smtp-Source: AA6agR7eA4v4ZRw3SKVFJoaQc4S15aTcFYc1XeKRk4fpJ729aTbNbaPSw5gCh+/IiJKUz+ChehmwxcB0uTfTF601N5U=
X-Received: by 2002:a0d:d60f:0:b0:325:1853:2b with SMTP id y15-20020a0dd60f000000b003251853002bmr31934665ywd.24.1660210097135;
 Thu, 11 Aug 2022 02:28:17 -0700 (PDT)
MIME-Version: 1.0
References: <20220810130127.2707169-1-hverkuil-cisco@xs4all.nl> <20220810130127.2707169-5-hverkuil-cisco@xs4all.nl>
In-Reply-To: <20220810130127.2707169-5-hverkuil-cisco@xs4all.nl>
From:   "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date:   Thu, 11 Aug 2022 10:27:49 +0100
Message-ID: <CA+V-a8tM-i9ixPSptBTyDyh-zheiOSd=N0NYYGkAfnNLdff0EA@mail.gmail.com>
Subject: Re: [PATCH 4/6] media: platform: ti: avoid using 'videobuf' or 'video-buf'
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     linux-media <linux-media@vger.kernel.org>
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

Hi Hans,

Thank you for the patch.

On Wed, Aug 10, 2022 at 2:01 PM Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:
>
> These terms typically refer to the old version 1 videobuf framework.
> It is confusing to use them for the vb2 framework, so reword these
> comments.
>
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> CC: Lad Prabhakar <prabhakar.csengg@gmail.com>
> ---
>  .../media/platform/ti/am437x/am437x-vpfe.h    |  2 +-
>  drivers/media/platform/ti/davinci/vpif.h      | 60 +++++++++----------
>  .../media/platform/ti/davinci/vpif_capture.c  |  6 +-
>  .../media/platform/ti/davinci/vpif_capture.h  |  2 +-
>  .../media/platform/ti/davinci/vpif_display.c  |  6 +-
>  .../media/platform/ti/davinci/vpif_display.h  |  6 +-
>  drivers/media/platform/ti/omap3isp/ispvideo.c |  2 +-
>  include/media/davinci/vpbe_display.h          |  6 +-
>  8 files changed, 45 insertions(+), 45 deletions(-)
>
Reviewed-by: Lad Prabhakar <prabhakar.csengg@gmail.com>

Cheers,
Prabhakar

> diff --git a/drivers/media/platform/ti/am437x/am437x-vpfe.h b/drivers/media/platform/ti/am437x/am437x-vpfe.h
> index 05ee37db0273..f8b4e917b91a 100644
> --- a/drivers/media/platform/ti/am437x/am437x-vpfe.h
> +++ b/drivers/media/platform/ti/am437x/am437x-vpfe.h
> @@ -267,7 +267,7 @@ struct vpfe_device {
>          * is different from the image window
>          */
>         struct v4l2_rect crop;
> -       /* Buffer queue used in video-buf */
> +       /* Buffer queue used in vb2 */
>         struct vb2_queue buffer_queue;
>         /* Queue of filled frames */
>         struct list_head dma_queue;
> diff --git a/drivers/media/platform/ti/davinci/vpif.h b/drivers/media/platform/ti/davinci/vpif.h
> index c6d1d890478a..9ac1430f5bf9 100644
> --- a/drivers/media/platform/ti/davinci/vpif.h
> +++ b/drivers/media/platform/ti/davinci/vpif.h
> @@ -330,10 +330,10 @@ static inline void channel1_intr_enable(int enable)
>  }
>
>  /* inline function to set buffer addresses in case of Y/C non mux mode */
> -static inline void ch0_set_videobuf_addr_yc_nmux(unsigned long top_strt_luma,
> -                                                unsigned long btm_strt_luma,
> -                                                unsigned long top_strt_chroma,
> -                                                unsigned long btm_strt_chroma)
> +static inline void ch0_set_video_buf_addr_yc_nmux(unsigned long top_strt_luma,
> +                                                 unsigned long btm_strt_luma,
> +                                                 unsigned long top_strt_chroma,
> +                                                 unsigned long btm_strt_chroma)
>  {
>         regw(top_strt_luma, VPIF_CH0_TOP_STRT_ADD_LUMA);
>         regw(btm_strt_luma, VPIF_CH0_BTM_STRT_ADD_LUMA);
> @@ -342,10 +342,10 @@ static inline void ch0_set_videobuf_addr_yc_nmux(unsigned long top_strt_luma,
>  }
>
>  /* inline function to set buffer addresses in VPIF registers for video data */
> -static inline void ch0_set_videobuf_addr(unsigned long top_strt_luma,
> -                                        unsigned long btm_strt_luma,
> -                                        unsigned long top_strt_chroma,
> -                                        unsigned long btm_strt_chroma)
> +static inline void ch0_set_video_buf_addr(unsigned long top_strt_luma,
> +                                         unsigned long btm_strt_luma,
> +                                         unsigned long top_strt_chroma,
> +                                         unsigned long btm_strt_chroma)
>  {
>         regw(top_strt_luma, VPIF_CH0_TOP_STRT_ADD_LUMA);
>         regw(btm_strt_luma, VPIF_CH0_BTM_STRT_ADD_LUMA);
> @@ -353,10 +353,10 @@ static inline void ch0_set_videobuf_addr(unsigned long top_strt_luma,
>         regw(btm_strt_chroma, VPIF_CH0_BTM_STRT_ADD_CHROMA);
>  }
>
> -static inline void ch1_set_videobuf_addr(unsigned long top_strt_luma,
> -                                        unsigned long btm_strt_luma,
> -                                        unsigned long top_strt_chroma,
> -                                        unsigned long btm_strt_chroma)
> +static inline void ch1_set_video_buf_addr(unsigned long top_strt_luma,
> +                                         unsigned long btm_strt_luma,
> +                                         unsigned long top_strt_chroma,
> +                                         unsigned long btm_strt_chroma)
>  {
>
>         regw(top_strt_luma, VPIF_CH1_TOP_STRT_ADD_LUMA);
> @@ -546,10 +546,10 @@ static inline void channel3_clipping_enable(int enable)
>  }
>
>  /* inline function to set buffer addresses in case of Y/C non mux mode */
> -static inline void ch2_set_videobuf_addr_yc_nmux(unsigned long top_strt_luma,
> -                                                unsigned long btm_strt_luma,
> -                                                unsigned long top_strt_chroma,
> -                                                unsigned long btm_strt_chroma)
> +static inline void ch2_set_video_buf_addr_yc_nmux(unsigned long top_strt_luma,
> +                                                 unsigned long btm_strt_luma,
> +                                                 unsigned long top_strt_chroma,
> +                                                 unsigned long btm_strt_chroma)
>  {
>         regw(top_strt_luma, VPIF_CH2_TOP_STRT_ADD_LUMA);
>         regw(btm_strt_luma, VPIF_CH2_BTM_STRT_ADD_LUMA);
> @@ -558,10 +558,10 @@ static inline void ch2_set_videobuf_addr_yc_nmux(unsigned long top_strt_luma,
>  }
>
>  /* inline function to set buffer addresses in VPIF registers for video data */
> -static inline void ch2_set_videobuf_addr(unsigned long top_strt_luma,
> -                                        unsigned long btm_strt_luma,
> -                                        unsigned long top_strt_chroma,
> -                                        unsigned long btm_strt_chroma)
> +static inline void ch2_set_video_buf_addr(unsigned long top_strt_luma,
> +                                         unsigned long btm_strt_luma,
> +                                         unsigned long top_strt_chroma,
> +                                         unsigned long btm_strt_chroma)
>  {
>         regw(top_strt_luma, VPIF_CH2_TOP_STRT_ADD_LUMA);
>         regw(btm_strt_luma, VPIF_CH2_BTM_STRT_ADD_LUMA);
> @@ -569,10 +569,10 @@ static inline void ch2_set_videobuf_addr(unsigned long top_strt_luma,
>         regw(btm_strt_chroma, VPIF_CH2_BTM_STRT_ADD_CHROMA);
>  }
>
> -static inline void ch3_set_videobuf_addr(unsigned long top_strt_luma,
> -                                        unsigned long btm_strt_luma,
> -                                        unsigned long top_strt_chroma,
> -                                        unsigned long btm_strt_chroma)
> +static inline void ch3_set_video_buf_addr(unsigned long top_strt_luma,
> +                                         unsigned long btm_strt_luma,
> +                                         unsigned long top_strt_chroma,
> +                                         unsigned long btm_strt_chroma)
>  {
>         regw(top_strt_luma, VPIF_CH3_TOP_STRT_ADD_LUMA);
>         regw(btm_strt_luma, VPIF_CH3_BTM_STRT_ADD_LUMA);
> @@ -582,18 +582,18 @@ static inline void ch3_set_videobuf_addr(unsigned long top_strt_luma,
>
>  /* inline function to set buffer addresses in VPIF registers for vbi data */
>  static inline void ch2_set_vbi_addr(unsigned long top_strt_luma,
> -                                        unsigned long btm_strt_luma,
> -                                        unsigned long top_strt_chroma,
> -                                        unsigned long btm_strt_chroma)
> +                                   unsigned long btm_strt_luma,
> +                                   unsigned long top_strt_chroma,
> +                                   unsigned long btm_strt_chroma)
>  {
>         regw(top_strt_luma, VPIF_CH2_TOP_STRT_ADD_VANC);
>         regw(btm_strt_luma, VPIF_CH2_BTM_STRT_ADD_VANC);
>  }
>
>  static inline void ch3_set_vbi_addr(unsigned long top_strt_luma,
> -                                        unsigned long btm_strt_luma,
> -                                        unsigned long top_strt_chroma,
> -                                        unsigned long btm_strt_chroma)
> +                                   unsigned long btm_strt_luma,
> +                                   unsigned long top_strt_chroma,
> +                                   unsigned long btm_strt_chroma)
>  {
>         regw(top_strt_luma, VPIF_CH3_TOP_STRT_ADD_VANC);
>         regw(btm_strt_luma, VPIF_CH3_BTM_STRT_ADD_VANC);
> diff --git a/drivers/media/platform/ti/davinci/vpif_capture.c b/drivers/media/platform/ti/davinci/vpif_capture.c
> index b91eec899eb5..580723333fcc 100644
> --- a/drivers/media/platform/ti/davinci/vpif_capture.c
> +++ b/drivers/media/platform/ti/davinci/vpif_capture.c
> @@ -632,11 +632,11 @@ static void vpif_config_addr(struct channel_obj *ch, int muxmode)
>         common = &(ch->common[VPIF_VIDEO_INDEX]);
>
>         if (VPIF_CHANNEL1_VIDEO == ch->channel_id)
> -               common->set_addr = ch1_set_videobuf_addr;
> +               common->set_addr = ch1_set_video_buf_addr;
>         else if (2 == muxmode)
> -               common->set_addr = ch0_set_videobuf_addr_yc_nmux;
> +               common->set_addr = ch0_set_video_buf_addr_yc_nmux;
>         else
> -               common->set_addr = ch0_set_videobuf_addr;
> +               common->set_addr = ch0_set_video_buf_addr;
>  }
>
>  /**
> diff --git a/drivers/media/platform/ti/davinci/vpif_capture.h b/drivers/media/platform/ti/davinci/vpif_capture.h
> index d5951f61df47..6191056500cf 100644
> --- a/drivers/media/platform/ti/davinci/vpif_capture.h
> +++ b/drivers/media/platform/ti/davinci/vpif_capture.h
> @@ -50,7 +50,7 @@ struct common_obj {
>         struct vpif_cap_buffer *next_frm;
>         /* Used to store pixel format */
>         struct v4l2_format fmt;
> -       /* Buffer queue used in video-buf */
> +       /* Buffer queue used in vb2 */
>         struct vb2_queue buffer_queue;
>         /* Queue of filled frames */
>         struct list_head dma_queue;
> diff --git a/drivers/media/platform/ti/davinci/vpif_display.c b/drivers/media/platform/ti/davinci/vpif_display.c
> index 5d524acc995d..b2df81603f62 100644
> --- a/drivers/media/platform/ti/davinci/vpif_display.c
> +++ b/drivers/media/platform/ti/davinci/vpif_display.c
> @@ -563,12 +563,12 @@ static void vpif_config_addr(struct channel_obj *ch, int muxmode)
>         struct common_obj *common = &ch->common[VPIF_VIDEO_INDEX];
>
>         if (VPIF_CHANNEL3_VIDEO == ch->channel_id) {
> -               common->set_addr = ch3_set_videobuf_addr;
> +               common->set_addr = ch3_set_video_buf_addr;
>         } else {
>                 if (2 == muxmode)
> -                       common->set_addr = ch2_set_videobuf_addr_yc_nmux;
> +                       common->set_addr = ch2_set_video_buf_addr_yc_nmux;
>                 else
> -                       common->set_addr = ch2_set_videobuf_addr;
> +                       common->set_addr = ch2_set_video_buf_addr;
>         }
>  }
>
> diff --git a/drivers/media/platform/ti/davinci/vpif_display.h b/drivers/media/platform/ti/davinci/vpif_display.h
> index f98062e79167..f300de37e041 100644
> --- a/drivers/media/platform/ti/davinci/vpif_display.h
> +++ b/drivers/media/platform/ti/davinci/vpif_display.h
> @@ -72,11 +72,11 @@ struct common_obj {
>         struct vpif_disp_buffer *next_frm;      /* Pointer pointing to next
>                                                  * vb2_buffer */
>         struct v4l2_format fmt;                 /* Used to store the format */
> -       struct vb2_queue buffer_queue;          /* Buffer queue used in
> -                                                * video-buf */
> +       struct vb2_queue buffer_queue;          /* Buffer queue used in vb2 */
>
>         struct list_head dma_queue;             /* Queue of filled frames */
> -       spinlock_t irqlock;                     /* Used in video-buf */
> +       spinlock_t irqlock;                     /* Used for video buffer
> +                                                * handling */
>
>         /* channel specific parameters */
>         struct mutex lock;                      /* lock used to access this
> diff --git a/drivers/media/platform/ti/omap3isp/ispvideo.c b/drivers/media/platform/ti/omap3isp/ispvideo.c
> index d7059180e80e..cc9a97d5d505 100644
> --- a/drivers/media/platform/ti/omap3isp/ispvideo.c
> +++ b/drivers/media/platform/ti/omap3isp/ispvideo.c
> @@ -1071,7 +1071,7 @@ static int isp_video_check_external_subdevs(struct isp_video *video,
>   * processing might be possible but requires more testing.
>   *
>   * Stream start must be delayed until buffers are available at both the input
> - * and output. The pipeline must be started in the videobuf queue callback with
> + * and output. The pipeline must be started in the vb2 queue callback with
>   * the buffers queue spinlock held. The modules subdev set stream operation must
>   * not sleep.
>   */
> diff --git a/include/media/davinci/vpbe_display.h b/include/media/davinci/vpbe_display.h
> index 6d2a93740130..d8751ea926a2 100644
> --- a/include/media/davinci/vpbe_display.h
> +++ b/include/media/davinci/vpbe_display.h
> @@ -69,13 +69,13 @@ struct vpbe_layer {
>         struct vpbe_disp_buffer *cur_frm;
>         /* Pointer pointing to next v4l2_buffer */
>         struct vpbe_disp_buffer *next_frm;
> -       /* videobuf specific parameters
> -        * Buffer queue used in video-buf
> +       /* vb2 specific parameters
> +        * Buffer queue used in vb2
>          */
>         struct vb2_queue buffer_queue;
>         /* Queue of filled frames */
>         struct list_head dma_queue;
> -       /* Used in video-buf */
> +       /* Used for video buffer handling */
>         spinlock_t irqlock;
>         /* V4l2 specific parameters */
>         /* Identifies video device for this layer */
> --
> 2.35.1
>
