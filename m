Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A697A204CF4
	for <lists+linux-media@lfdr.de>; Tue, 23 Jun 2020 10:49:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731775AbgFWIth (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 23 Jun 2020 04:49:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58076 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731158AbgFWIth (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 23 Jun 2020 04:49:37 -0400
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com [IPv6:2607:f8b0:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37DECC061573
        for <linux-media@vger.kernel.org>; Tue, 23 Jun 2020 01:49:37 -0700 (PDT)
Received: by mail-ot1-x342.google.com with SMTP id g7so15758902oti.13
        for <linux-media@vger.kernel.org>; Tue, 23 Jun 2020 01:49:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=G+m+qROqLj4+DW2F7miAnUvrD+NvpuWcFm1XH6O1s3E=;
        b=otaD9OqXXD1i7/TRXbj2XhYcnvpW6+rupefIuD1AbwOQOG0DeCMfMfYtA+ERq0Wq+T
         0ZTnJG62p6X+iNrF9J3xl+CJkIsTP6w6+F//lqKiYc/gavbPFT17OMXPZ19k/Tv071us
         4oXB4ObBG8P3EGXX2AIZLPXDlyq3TKVKtIjbT5/R5tcEFRSNZNUAiF/seMOsYMBw26px
         H34ujXktwU0dqWHtsF7QYtFsMJZPSwjdUXdDHM2fQyCYxT6iXWXbJTos74OpboVQkvxT
         /oPMVvbjY22ta76LmwVQVEppaHldIf+4PTZtkobTeWuonCXI0R8yU+G9pfJXI9CUkw9Z
         1SVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=G+m+qROqLj4+DW2F7miAnUvrD+NvpuWcFm1XH6O1s3E=;
        b=oYvISDyULaDaO+PXmklv+N+8puJ/j5br/peu947p342LI9SrpsTvgejjQnwGqAS0q9
         x+xhoe1q2uubn1RUvWxdLoos64YdFBpSCXrvkZjjMKCb1/NAdY5phnT6nAQ076iQ74dm
         GSm3nwyKJYA0WY9c4cf9wN0UcqQ44Dx5dpKFepRrS2Vhu0g826ak/BEeR1CEbLErCpVL
         FbKx2HiMw+Jw9P1nkoCaAgrXcIXvdCp08pJfm4ysIlN7dCfthz5VASc+sYLOhqVwdini
         vSodNpZybRNf2L+zBw6NrOlR7CEU9YkA5gTOf399pqWSPwJncLObn4BrFMGPThcABFwp
         pIXg==
X-Gm-Message-State: AOAM530ASCT+4pcMGFCu0BcBW10H0RsuU6fqOUaCvBrYkGz6fNOwMnt7
        iexE7rtEHyybdxo1cmmAG/xiCR5s9CA/M5gnnE7u4g==
X-Google-Smtp-Source: ABdhPJzSxbbOFAbuUrzcFmBVkMh+zGjlMA88Relp3KJtlGOUG0jJQkJU2e2tWmgg44Pt/ovoNjvm8wISxFkT8PgJcxs=
X-Received: by 2002:a9d:4b83:: with SMTP id k3mr16792589otf.272.1592902176603;
 Tue, 23 Jun 2020 01:49:36 -0700 (PDT)
MIME-Version: 1.0
References: <20200409112404.21071-1-andrey.konovalov@linaro.org> <CAG3jFyt8sUL0kJMCN=FYJp49BF=_BB6+MKVk04=7JcCAVovOFw@mail.gmail.com>
In-Reply-To: <CAG3jFyt8sUL0kJMCN=FYJp49BF=_BB6+MKVk04=7JcCAVovOFw@mail.gmail.com>
From:   Robert Foss <robert.foss@linaro.org>
Date:   Tue, 23 Jun 2020 10:49:25 +0200
Message-ID: <CAG3jFysQRN=_Go8y5V_dTP3uYCAUMeW6z3sX+92Mp3=QVLHz1w@mail.gmail.com>
Subject: Re: [PATCH] media: camss: use proper media entity function for subdevices
To:     Andrey Konovalov <andrey.konovalov@linaro.org>
Cc:     todor.too@gmail.com, linux-media <linux-media@vger.kernel.org>,
        Loic Poulain <loic.poulain@linaro.org>,
        Peter Griffin <peter.griffin@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Reviewed-by: Robert Foss <robert.foss@linaro.org>

On Thu, 9 Apr 2020 at 13:29, Robert Foss <robert.foss@linaro.org> wrote:
>
> Hey Andrey,
>
> Thanks for sending this out. I've tested this patch on a db410c board.
>
> Tested-by: Robert Foss <robert.foss@linaro.org>
>
>
> On Thu, 9 Apr 2020 at 13:24, Andrey Konovalov
> <andrey.konovalov@linaro.org> wrote:
> >
> > Currently for msm_csiphy, msm_csid, and msm_ispif subdevices the media
> > entity function field is set to MEDIA_ENT_F_IO_V4L. This is incorrect
> > as MEDIA_ENT_F_IO_V4L implies V4L2 video node.
> >
> > Change it to MEDIA_ENT_F_PROC_VIDEO_PIXEL_FORMATTER as this is the best
> > fit from the functions defined in include/uapi/linux/media.h.
> >
> > Signed-off-by: Andrey Konovalov <andrey.konovalov@linaro.org>
> > ---
> >  drivers/media/platform/qcom/camss/camss-csid.c   | 2 +-
> >  drivers/media/platform/qcom/camss/camss-csiphy.c | 2 +-
> >  drivers/media/platform/qcom/camss/camss-ispif.c  | 2 +-
> >  3 files changed, 3 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/media/platform/qcom/camss/camss-csid.c b/drivers/media/platform/qcom/camss/camss-csid.c
> > index a5ae85674ffb..721d7434253e 100644
> > --- a/drivers/media/platform/qcom/camss/camss-csid.c
> > +++ b/drivers/media/platform/qcom/camss/camss-csid.c
> > @@ -1356,7 +1356,7 @@ int msm_csid_register_entity(struct csid_device *csid,
> >         pads[MSM_CSID_PAD_SINK].flags = MEDIA_PAD_FL_SINK;
> >         pads[MSM_CSID_PAD_SRC].flags = MEDIA_PAD_FL_SOURCE;
> >
> > -       sd->entity.function = MEDIA_ENT_F_IO_V4L;
> > +       sd->entity.function = MEDIA_ENT_F_PROC_VIDEO_PIXEL_FORMATTER;
> >         sd->entity.ops = &csid_media_ops;
> >         ret = media_entity_pads_init(&sd->entity, MSM_CSID_PADS_NUM, pads);
> >         if (ret < 0) {
> > diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.c b/drivers/media/platform/qcom/camss/camss-csiphy.c
> > index 008afb85023b..03ef9c5f4774 100644
> > --- a/drivers/media/platform/qcom/camss/camss-csiphy.c
> > +++ b/drivers/media/platform/qcom/camss/camss-csiphy.c
> > @@ -737,7 +737,7 @@ int msm_csiphy_register_entity(struct csiphy_device *csiphy,
> >         pads[MSM_CSIPHY_PAD_SINK].flags = MEDIA_PAD_FL_SINK;
> >         pads[MSM_CSIPHY_PAD_SRC].flags = MEDIA_PAD_FL_SOURCE;
> >
> > -       sd->entity.function = MEDIA_ENT_F_IO_V4L;
> > +       sd->entity.function = MEDIA_ENT_F_PROC_VIDEO_PIXEL_FORMATTER;
> >         sd->entity.ops = &csiphy_media_ops;
> >         ret = media_entity_pads_init(&sd->entity, MSM_CSIPHY_PADS_NUM, pads);
> >         if (ret < 0) {
> > diff --git a/drivers/media/platform/qcom/camss/camss-ispif.c b/drivers/media/platform/qcom/camss/camss-ispif.c
> > index 1f33b4eb198c..f04cdeafbcac 100644
> > --- a/drivers/media/platform/qcom/camss/camss-ispif.c
> > +++ b/drivers/media/platform/qcom/camss/camss-ispif.c
> > @@ -1323,7 +1323,7 @@ int msm_ispif_register_entities(struct ispif_device *ispif,
> >                 pads[MSM_ISPIF_PAD_SINK].flags = MEDIA_PAD_FL_SINK;
> >                 pads[MSM_ISPIF_PAD_SRC].flags = MEDIA_PAD_FL_SOURCE;
> >
> > -               sd->entity.function = MEDIA_ENT_F_IO_V4L;
> > +               sd->entity.function = MEDIA_ENT_F_PROC_VIDEO_PIXEL_FORMATTER;

At some point in the future it is possible that the ispif could
support memory to memory operations, and then MEDIA_ENT_F_IO_V4L might
be correct. But until then I'd say that this change is what we want.

> >                 sd->entity.ops = &ispif_media_ops;
> >                 ret = media_entity_pads_init(&sd->entity, MSM_ISPIF_PADS_NUM,
> >                                              pads);
> > --
> > 2.17.1
> >
