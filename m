Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 37D8F24C79D
	for <lists+linux-media@lfdr.de>; Fri, 21 Aug 2020 00:12:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727831AbgHTWMm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 20 Aug 2020 18:12:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728439AbgHTWMg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 20 Aug 2020 18:12:36 -0400
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15038C061385
        for <linux-media@vger.kernel.org>; Thu, 20 Aug 2020 15:12:36 -0700 (PDT)
Received: by mail-pl1-x62c.google.com with SMTP id z23so1520559plo.8
        for <linux-media@vger.kernel.org>; Thu, 20 Aug 2020 15:12:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jSZ37HzFz4cJLEqryTW4r8+gzV1qf8+OnouHqKhzQwg=;
        b=O5uMe++Mml//7wB6mT3g8Y36+HHpKfs9VdcsTXGfQXiMmZxkU/8Fuquysi9xxtjgtE
         /mjBitCnZXIyr4LWDT8jfFgFzG9teuhnFMN7OixTIDKjeqeHLSa8uZl+ZoVcjOlcJavJ
         yqWJJ8VYzN0h80aXEkdKLGuvop+rO0ahvjrK87kpr7JfJDeC2ocixMKWCI1GC0UJiGfn
         iuDk/87zpE79V86zGDQO4QOZ3e7yAWAJElT9eDK7nq8Yw0DbGxhNrEMuXhLPzxtapqc5
         KULS+/X8uzsdX5YfljhipE6Qcf+/Ydsu2kWQGItxiKzKzVyZkY9r/05WmxD6+nutMSg2
         YS2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jSZ37HzFz4cJLEqryTW4r8+gzV1qf8+OnouHqKhzQwg=;
        b=mN9aKIV74bQeNmZ3sWM3K3V0hxBr8nM6HjUGSEO1avlCBKzohe8Me8Tr+SrODmULoA
         XhspQn+YCSnosKKY8bZ55L/suSDhRdg+kuMXVr2H2mAdAteVeZlqm02vF/HQRC5E33i6
         0cwnCVz+GrAVFIZg98MM96r4qmsQ46KYM+WwmsY+94fxSqDsxgpajV8t+uxtSDSMsEHK
         K36EZogKV80EpPO73PLkEDOFaOcCEmpuQvyGfspzR6ZjFqbKQtTkUxfRHO5dvoTUKldb
         16WfHJ9UyMUjjWd2fRcrF0WerqiRHH9deopigZlFE0gokq/VetMHzQoHglQ1N2QnQr/p
         ZDow==
X-Gm-Message-State: AOAM53396S1D8XFfTqP/2AOzki2iWFLg8s2bvT3qeE1s6Uq9B6GQKNst
        iZ9/N9YPvUrvqp2mlxNTHCIx9cqN6CkzX+EzcMWodnvMtbw=
X-Google-Smtp-Source: ABdhPJx5FkQEceM1lD/Qd+qrIeTHIuzPcCYcP5cDWvVn0LvtjoTxD7AvtP6/ja95Sagv6lzfwm/9iNHUGU6Wst9FaEY=
X-Received: by 2002:a17:90a:fa06:: with SMTP id cm6mr324557pjb.129.1597961554254;
 Thu, 20 Aug 2020 15:12:34 -0700 (PDT)
MIME-Version: 1.0
References: <20200803213929.34616-1-rosenp@gmail.com> <992328dc-8ad5-063c-69fc-b01364bf3011@xs4all.nl>
In-Reply-To: <992328dc-8ad5-063c-69fc-b01364bf3011@xs4all.nl>
From:   Rosen Penev <rosenp@gmail.com>
Date:   Thu, 20 Aug 2020 15:12:22 -0700
Message-ID: <CAKxU2N8CjSw+awumPNL_9WfdvXMbSBtmRDtfq9AsL7P2sppJWQ@mail.gmail.com>
Subject: Re: [PATCHv2] fix GCC enum warning
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Aug 20, 2020 at 5:26 AM Hans Verkuil <hverkuil@xs4all.nl> wrote:
>
> On 03/08/2020 23:39, Rosen Penev wrote:
> > Found with -Wenum-compare
> >
> > ../utils/common/v4l-helpers.h:880:36: warning: enumerated and
> > non-enumerated type in conditional expression [-Wextra]
> >   880 |  return hsv_enc < V4L2_HSV_ENC_180 ? V4L2_HSV_ENC_180 : hsv_enc;
> >
> > Signed-off-by: Rosen Penev <rosenp@gmail.com>
> > ---
> >  v2: Added warning message.
> >  utils/common/v4l-helpers.h | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/utils/common/v4l-helpers.h b/utils/common/v4l-helpers.h
> > index e093e717..edd21c16 100644
> > --- a/utils/common/v4l-helpers.h
> > +++ b/utils/common/v4l-helpers.h
> > @@ -877,7 +877,7 @@ v4l_format_g_hsv_enc(const struct v4l2_format *fmt)
> >  {
> >       unsigned hsv_enc = v4l_format_g_ycbcr_enc(fmt);
>
> Does the warning go away if you replace 'unsigned' with enum v4l2_hsv_encoding?
../utils/common/v4l-helpers.h:878:25: error: cannot initialize a
variable of type 'enum v4l2_hsv_encoding' with an rvalue of type
'unsigned int'
        enum v4l2_hsv_encoding hsv_enc = v4l_format_g_ycbcr_enc(fmt);

>
> I would like that a lot better than casting V4L2_HSV_ENC_180.
>
> Regards,
>
>         Hans
>
> >
> > -     return hsv_enc < V4L2_HSV_ENC_180 ? V4L2_HSV_ENC_180 : hsv_enc;
> > +     return hsv_enc < V4L2_HSV_ENC_180 ? unsigned(V4L2_HSV_ENC_180) : hsv_enc;
> >  }
> >
> >  static inline void v4l_format_s_quantization(struct v4l2_format *fmt,
> >
>
