Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B918EBE6C9
	for <lists+linux-media@lfdr.de>; Wed, 25 Sep 2019 23:01:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2437658AbfIYVBA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 25 Sep 2019 17:01:00 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:46268 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730434AbfIYVBA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 25 Sep 2019 17:01:00 -0400
Received: by mail-lf1-f68.google.com with SMTP id t8so5003lfc.13;
        Wed, 25 Sep 2019 14:00:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MymcLqXLu2R7VgSZysaxkbGT3jtuEM3ojf3ChQo8Jss=;
        b=owFD+RWB84TOQ0fNEVa/nPqxV7rSQqOm5ZuNI+n6MJYGP60E0tBMJhtNJdNu/fjbEU
         gNZQFqUj2H4wKViM2lrdBpE/6+QXlZUzWiUd1njeHvSYWfAJ/znaAsA8xdKx+vO8zh26
         ypL0yJFlmb7K6AMJztWZOA02cBUyKFx1kWemeCc27x8Vhk4AFrTD6GmAPje/qrBHqsSv
         3CDMCOG1/QMw5776uLI/WxyiUJ5dQtRupOb2hwT88MN2baVVr5Nd7IfFcigckzkbmWe3
         vUxuGWKhfEfSxjW6je+egjcpQTrAwv6ITOpirxRVTQkUinvi4PKbIpUalZiFfDjEd1Rz
         yf/w==
X-Gm-Message-State: APjAAAWD6ZDbuNnr503vLZ03tl4nWjD6xv0D7+qZ+AfJdCtVQQuMwszD
        Mf8NISrvuT0uhZPaV9AyVAAo7UTTGGZNF9sP1kw=
X-Google-Smtp-Source: APXvYqyYNBQ6SqCmSqUZoCRsaANcA31Pqa5j5B+33cUGp+VbMRbH6ggjsEjkHy/L0aDa/9VFnfKhzADc0t/lXOOe1Ec=
X-Received: by 2002:a19:f247:: with SMTP id d7mr7090029lfk.191.1569445257886;
 Wed, 25 Sep 2019 14:00:57 -0700 (PDT)
MIME-Version: 1.0
References: <20190920135137.10052-1-ricardo@ribalda.com> <20190920135137.10052-3-ricardo@ribalda.com>
 <20190925082203.b2phkyrvfyv6imfv@uno.localdomain>
In-Reply-To: <20190925082203.b2phkyrvfyv6imfv@uno.localdomain>
From:   Ricardo Ribalda Delgado <ricardo@ribalda.com>
Date:   Wed, 25 Sep 2019 23:00:40 +0200
Message-ID: <CAPybu_2jXb1kcKA7+3QA2FT29qg3dOvXTZBxROk0WxTFhwFQ6g@mail.gmail.com>
Subject: Re: [PATCH v6 2/7] Documentation: v4l2_ctrl_new_std_compound
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media <linux-media@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo
On Wed, Sep 25, 2019 at 10:20 AM Jacopo Mondi <jacopo@jmondi.org> wrote:
>
> Hi Ricardo,
>
> On Fri, Sep 20, 2019 at 03:51:32PM +0200, Ricardo Ribalda Delgado wrote:
> > Function for initializing compound controls with a default value.
> >
> > Suggested-by: Hans Verkuil <hverkuil@xs4all.nl>
> > Signed-off-by: Ricardo Ribalda Delgado <ricardo@ribalda.com>
> > ---
> >  Documentation/media/kapi/v4l2-controls.rst | 9 +++++++++
> >  1 file changed, 9 insertions(+)
> >
> > diff --git a/Documentation/media/kapi/v4l2-controls.rst b/Documentation/media/kapi/v4l2-controls.rst
> > index ebe2a55908be..b20800cae3f2 100644
> > --- a/Documentation/media/kapi/v4l2-controls.rst
> > +++ b/Documentation/media/kapi/v4l2-controls.rst
> > @@ -140,6 +140,15 @@ Menu controls with a driver specific menu are added by calling
> >                         const struct v4l2_ctrl_ops *ops, u32 id, s32 max,
> >                         s32 skip_mask, s32 def, const char * const *qmenu);
> >
> > +Standard compound controls can be added by calling
>
> Standard compound controls with a driver provided default value can be..
>
> Or is it un-necessary to re-state it?
>

I think is a bit redundant, nothing stops you from not defining def,
if ctrl_fill has the default value for it.

> In any case:
> Reviewed-by: Jacopo Mondi <jacopo@jmondi.org>

Thanks
>
> Thanks
>   j
> > +:c:func:`v4l2_ctrl_new_std_compound`:
> > +
> > +.. code-block:: c
> > +
> > +       struct v4l2_ctrl *v4l2_ctrl_new_std_compound(struct v4l2_ctrl_handler *hdl,
> > +                       const struct v4l2_ctrl_ops *ops, u32 id,
> > +                       const union v4l2_ctrl_ptr p_def);
> > +
> >  Integer menu controls with a driver specific menu can be added by calling
> >  :c:func:`v4l2_ctrl_new_int_menu`:
> >
> > --
> > 2.23.0
> >



-- 
Ricardo Ribalda
