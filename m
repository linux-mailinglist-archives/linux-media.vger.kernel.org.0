Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 069B7193229
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2020 21:49:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727356AbgCYUtI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 25 Mar 2020 16:49:08 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:39780 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727306AbgCYUtH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 25 Mar 2020 16:49:07 -0400
Received: by mail-pg1-f194.google.com with SMTP id b22so1738779pgb.6
        for <linux-media@vger.kernel.org>; Wed, 25 Mar 2020 13:49:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=DCl6Uzk3YCvxFy/Sfh1MfDqSBV/2m3KHS+BeAcBStpI=;
        b=KqfheSdLUbvTZrQhHcW2KBQjYjXbwlp+Uqveb1rUxCwMYxXCXurmQpkszV1Z9iK7BC
         xJH8LV9ssFQiymx7peOGhoTbAD0RUQ8azhcgNvGD7p5Q2YQPXY3I/xQZb5QjI8pVYyAL
         QSpHKkhZfkX1eaNMCI7h/71Pk3CMhamHYMJYMqWdYw97DFufX9sz3H7ssFl/I64pG9N/
         19o4RbEm77FOCVqoHIljnoObGkVNthUSYtG5Ijet7qVG30DiWvtcTdlly8bPkU2wwMzD
         eNCcMO0hU4IXvxTt/H7HQCRoog8K7tMutI55n4Gh0PBhU6YnqT/2OQUqdu/cNyGsirmE
         3ncA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=DCl6Uzk3YCvxFy/Sfh1MfDqSBV/2m3KHS+BeAcBStpI=;
        b=OTyEaPAIu+RBq+vQzUEECts7n3Zyq4IkF/lC+ghRaeoY+8Ghkl+5fMwTtkxtGlFR28
         4i0WOWBP/Jx/ZqxxtZGKjs6yk2+aRZrmB35H15oZJRF8JHUCCt58BjA9ui/hJClGLfee
         q5zHLsZZnldRaRQ9s2llVEj74XBBNN0rsz9R7febbuEjCFINTphOLDAzMBQK+TMPONzR
         KR0zoDYHN3YAQc/Kcsw2hn6XcOko7kc+hl8osL7v37estGV/BWntzBjqAmN3R72OjHLO
         dVr3IniMSlhCciwQL4QYs++BjYn2ad+TfrksUKaLkSTpzMutx23vJCQBED9z5L+qSUHG
         bc4Q==
X-Gm-Message-State: ANhLgQ3+vMqCa+BIKWs2UODIvoc1STkUq0RO7WjaEcpQv3Qa9cc4R17U
        e9jynfqXwHfsuFrNn4C9R3g=
X-Google-Smtp-Source: ADFU+vu9cSQOQz/ahBeWgJ/aq8cp7OZCT3xjZk7MpKQJL0YY8IBjZxPCVTxTubjF7BaVwud4yAszmg==
X-Received: by 2002:a63:f243:: with SMTP id d3mr4878985pgk.254.1585169346826;
        Wed, 25 Mar 2020 13:49:06 -0700 (PDT)
Received: from deeUbuntu ([103.228.147.248])
        by smtp.gmail.com with ESMTPSA id u21sm141310pjy.8.2020.03.25.13.48.56
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 25 Mar 2020 13:49:06 -0700 (PDT)
Date:   Thu, 26 Mar 2020 02:18:49 +0530
From:   DEEPAK VARMA <mh12gx2825@gmail.com>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     outreachy-kernel@googlegroups.com,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Daniel Baluta <daniel.baluta@gmail.com>,
        kieran.bingham@ideasonboard.com,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH v2] media: staging/intel-ipu3: Reformat pointer
 initialization
Message-ID: <20200325204844.GA30732@deeUbuntu>
References: <20200322185350.GA12377@deeUbuntu>
 <CAHp75VcP1O_QwepgAHPBaTLcr_3=ynV6hsmcgvYnBCz7DdoWxw@mail.gmail.com>
 <20200323151710.GA22110@deeUbuntu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200323151710.GA22110@deeUbuntu>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Adding Linux-media list as advised by Sakari Ailus.

On Mon, Mar 23, 2020 at 08:47:12PM +0530, DEEPAK VARMA wrote:
> On Mon, Mar 23, 2020 at 01:35:58AM +0200, Andy Shevchenko wrote:
> > On Sun, Mar 22, 2020 at 8:54 PM Deepak R Varma <mh12gx2825@gmail.com> wrote:
> > >
> > > Reformat pointer initialization to make it more readable as per the
> > > coding standards. Problem detected by checkpatch.
> > 
> > > -       struct imgu_v4l2_subdev *imgu_sd =
> > > -               container_of(ctrl->handler, struct imgu_v4l2_subdev, ctrl_handler);
> > > +       struct imgu_v4l2_subdev *imgu_sd = container_of(ctrl->handler,
> > > +                                                       struct imgu_v4l2_subdev,
> > > +                                                       ctrl_handler);
> > 
> > I'm sorry I don't see benefit of this change, actually an opposite.
> 
> Hello Andy,
> Thank you for your comment. To me, it helps quickly and clearly spot
> *imgu_sd. Also the initialization looks more structured. But that's just
> me.
> 
> I will wait to see if anyone else wants to share their thoughts, and
> then circle back to you on next steps. Is that fine?
> 

Hello Andy and all,
I have not seen any additional comments on this thread. Let me know if
you approve the proposed change or want me to leave it as is.

Thank you,
Deepak.

> Deepak.
> > 
> > -- 
> > With Best Regards,
> > Andy Shevchenko
