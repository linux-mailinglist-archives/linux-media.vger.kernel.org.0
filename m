Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8087126404E
	for <lists+linux-media@lfdr.de>; Thu, 10 Sep 2020 10:46:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730268AbgIJIqC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 10 Sep 2020 04:46:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58614 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730177AbgIJIo3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 10 Sep 2020 04:44:29 -0400
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE2B0C061756
        for <linux-media@vger.kernel.org>; Thu, 10 Sep 2020 01:44:29 -0700 (PDT)
Received: by mail-pf1-x433.google.com with SMTP id k15so4208665pfc.12
        for <linux-media@vger.kernel.org>; Thu, 10 Sep 2020 01:44:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=i1FntIzMPK+2F9y+3ZkPe7MPtSfMIy5aobElwvEAHxA=;
        b=ZwZTS7Vcuzpsr8KgOLQL4KCX2blqHYl1zT3RNpeKvwxETsBALhm87LvBkNNR+hInGo
         VnCSb+9EbzLIJ+U8exVhU1SSgFL0pwdAniNrbQbPPqYPqLur2bOPfT83ov/7yhOtjsNe
         i3xY/zCdZ74f+rT/C0vdNvC6Unve60QZNfaGo1qd3aLo+Rg2cMGFguS3dykGsNT57rnC
         l6JAIqXztWaKebTKXyTgXB5gjjXC0eK6ZJJa3Wj8YpumnfMPXWMw/bgwzWOq/nEcr7Ai
         5l1VGzNITPIK/PB8A+PIrIN/aeFbOOCtK8J+/pktedSiClFDtnKu5ZdIuoycrtpyfm8w
         RuFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=i1FntIzMPK+2F9y+3ZkPe7MPtSfMIy5aobElwvEAHxA=;
        b=Zuck2G1R0QpIjm+rpL6nCvmzAyfJzfjcNdbfgNUsddsz8L4OJ62E+lP/kF4fO6FlFq
         q4QObH0vcnLHIaT1zZc11lT6EP81GW5u3nCi5iYW/vg2WWWzpiluCD+aY5DWm6qcz6Ap
         g6X7WgDMWHh4v+He7mAXMyN2Coy59OmVg8jSivCIhgPAyRlxQdQTvQa3DcDyqPC5UeLw
         r0G45eupkdL+xpGAp8r2PKZjR8ZfXHS+mg1lYHZDgF5TjbU/pZrRXsAiV7J+MXZzi3Cd
         OhjCaiEK2seddSAA7DUivdMNzpiZ9t0FPiGyGFLQB7X25yyFKWzeyazLFck4WJkVb88a
         Evuw==
X-Gm-Message-State: AOAM533Fb+YEv6ECzIN4U9XtCxx8TL5mBtlPhMwtBswg7TdOK6aZ+R/d
        Kncq1tl8SfLww774PjTNf8mPeI625QxbgLVx3ag=
X-Google-Smtp-Source: ABdhPJxrN6WPJRvxPaUk+Plxm0PGRa1gHj+yEr2nquveSBLvlcuGuZHBOYKjoXs4uycpY0dwYhq3hXNVbvnHeSE9/N8=
X-Received: by 2002:aa7:88cc:: with SMTP id k12mr4483196pff.69.1599727469295;
 Thu, 10 Sep 2020 01:44:29 -0700 (PDT)
MIME-Version: 1.0
References: <20200803213929.34616-1-rosenp@gmail.com> <992328dc-8ad5-063c-69fc-b01364bf3011@xs4all.nl>
 <CAKxU2N8CjSw+awumPNL_9WfdvXMbSBtmRDtfq9AsL7P2sppJWQ@mail.gmail.com> <c88d0408-63a8-7216-b2c5-2966135a5fcf@xs4all.nl>
In-Reply-To: <c88d0408-63a8-7216-b2c5-2966135a5fcf@xs4all.nl>
From:   Rosen Penev <rosenp@gmail.com>
Date:   Thu, 10 Sep 2020 01:44:17 -0700
Message-ID: <CAKxU2N8W0fsD6UN1ABNMnQ6cdebn-=cXgy1MSTmnMvYAAxNPNA@mail.gmail.com>
Subject: Re: [PATCHv2] fix GCC enum warning
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Sep 9, 2020 at 7:01 AM Hans Verkuil <hverkuil@xs4all.nl> wrote:
>
> On 21/08/2020 00:12, Rosen Penev wrote:
> > On Thu, Aug 20, 2020 at 5:26 AM Hans Verkuil <hverkuil@xs4all.nl> wrote:
> >>
> >> On 03/08/2020 23:39, Rosen Penev wrote:
> >>> Found with -Wenum-compare
> >>>
> >>> ../utils/common/v4l-helpers.h:880:36: warning: enumerated and
> >>> non-enumerated type in conditional expression [-Wextra]
> >>>   880 |  return hsv_enc < V4L2_HSV_ENC_180 ? V4L2_HSV_ENC_180 : hsv_enc;
> >>>
> >>> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> >>> ---
> >>>  v2: Added warning message.
> >>>  utils/common/v4l-helpers.h | 2 +-
> >>>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>>
> >>> diff --git a/utils/common/v4l-helpers.h b/utils/common/v4l-helpers.h
> >>> index e093e717..edd21c16 100644
> >>> --- a/utils/common/v4l-helpers.h
> >>> +++ b/utils/common/v4l-helpers.h
> >>> @@ -877,7 +877,7 @@ v4l_format_g_hsv_enc(const struct v4l2_format *fmt)
> >>>  {
> >>>       unsigned hsv_enc = v4l_format_g_ycbcr_enc(fmt);
> >>
> >> Does the warning go away if you replace 'unsigned' with enum v4l2_hsv_encoding?
> > ../utils/common/v4l-helpers.h:878:25: error: cannot initialize a
> > variable of type 'enum v4l2_hsv_encoding' with an rvalue of type
> > 'unsigned int'
> >         enum v4l2_hsv_encoding hsv_enc = v4l_format_g_ycbcr_enc(fmt);
>
> Urgh.
>
> How about this:
>
>         if (hsv_enc < V4L2_HSV_ENC_180)
>                 return V4L2_HSV_ENC_180;
>         return hsv_enc;
Huh. That seems to have done it.
>
> Regards,
>
>         Hans
>
> >
> >>
> >> I would like that a lot better than casting V4L2_HSV_ENC_180.
> >>
> >> Regards,
> >>
> >>         Hans
> >>
> >>>
> >>> -     return hsv_enc < V4L2_HSV_ENC_180 ? V4L2_HSV_ENC_180 : hsv_enc;
> >>> +     return hsv_enc < V4L2_HSV_ENC_180 ? unsigned(V4L2_HSV_ENC_180) : hsv_enc;
> >>>  }
> >>>
> >>>  static inline void v4l_format_s_quantization(struct v4l2_format *fmt,
> >>>
> >>
>
