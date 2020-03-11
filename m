Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0D18C182185
	for <lists+linux-media@lfdr.de>; Wed, 11 Mar 2020 20:05:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731014AbgCKTFx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 11 Mar 2020 15:05:53 -0400
Received: from mail-qk1-f196.google.com ([209.85.222.196]:37396 "EHLO
        mail-qk1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731013AbgCKTFw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 11 Mar 2020 15:05:52 -0400
Received: by mail-qk1-f196.google.com with SMTP id y126so3214521qke.4
        for <linux-media@vger.kernel.org>; Wed, 11 Mar 2020 12:05:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20150623.gappssmtp.com; s=20150623;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=b3Cgy29Dqf3TWGwP4FeGEObg2LE3ugs0svlpIKXT5us=;
        b=evlE+ihydYjvf1CAzYyc/cSmxxZTJf+v9vTFOJSzv2Aj22RAqC1XIPri4QkoIaA7Rg
         YWH1rx5+g5h3hW45C5qCh7qB3r9L9xrZaF8yAiO3IOF3z/p0aQBYEjgAjUuLkxmUPbWb
         T6oh7sa0WwsHJtffQYyRQpDoHyQaWIITdaprkiJOUURxo0SN9dT7/GF75CDPOm9tlfvx
         VghETFrGNVya0yqpgHHJCvYDHbnCHDali4+2/V/y2SCL9qWqxoLruOjJr8+fVh/yV30p
         JDfOphA9lXyQf/VOGOG7LyJFGDfl66AAM7JE1gWyliuSIDI6zR3Obh+y4dMGTwGkcXvC
         5s/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=b3Cgy29Dqf3TWGwP4FeGEObg2LE3ugs0svlpIKXT5us=;
        b=aS2MHAk0iVfifQvhj7OC24grUlt1BUMEF8HCWjBp/0rj/e7CYYP9dnYqHyaczc6cnR
         VwoiY8AuRpgXzYJ+1sDjd8Jk9xlGhFs4KxwftUrD+7+shSxVRWv7GwPvJfvYUKnyviQm
         MN5QIeBVzI9KGIjrNGpwB1ejWMgwNs9taO9CG27tgy45Bs5PwOX8/wz7/1ph1rLIkx6o
         EEFSz7S7LLN8AMEP8r3XPrZ8H522Ofv8RMIYPp234EuoLIaXWtQVeuivd8jIjOzBWDqn
         n1rzyOW3+t2hHcpwlaeZRLk2kkMxT+4wnQi2Gic4dtDygTLqm25C2EEhmKUis+7alA+I
         kYoQ==
X-Gm-Message-State: ANhLgQ0e6UI8ErPY3DQ4VZnyxbW2WogVx1rGvwtBIXJkUkmB6/cidoQY
        CMW9ChpPsWwT2K+foMkfOnQRXQTz5YdvXg==
X-Google-Smtp-Source: ADFU+vtPh9VFF6uJppdFwQULJigLWibp0JW5x3C7j90z+Fnfcy70E2+wXDbPb0ezgo71+CPAU84wHg==
X-Received: by 2002:a37:d96:: with SMTP id 144mr3785883qkn.324.1583953549721;
        Wed, 11 Mar 2020 12:05:49 -0700 (PDT)
Received: from nicolas-tpx395.localdomain ([2610:98:8005::527])
        by smtp.gmail.com with ESMTPSA id f13sm6334201qka.83.2020.03.11.12.05.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2020 12:05:47 -0700 (PDT)
Message-ID: <b24e52a8b9c110ad7ded0b031cadc57c74ec8b84.camel@ndufresne.ca>
Subject: Re: [PATCH 6/6] hantro: Refactor for V4L2 API spec compliancy
From:   Nicolas Dufresne <nicolas@ndufresne.ca>
To:     Ezequiel Garcia <ezequiel@collabora.com>,
        linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-kernel@vger.kernel.org
Cc:     Tomasz Figa <tfiga@chromium.org>, kernel@collabora.com,
        Jonas Karlman <jonas@kwiboo.se>,
        Heiko Stuebner <heiko@sntech.de>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Alexandre Courbot <acourbot@chromium.org>,
        Jeffrey Kardatzke <jkardatzke@chromium.org>
Date:   Wed, 11 Mar 2020 15:05:46 -0400
In-Reply-To: <02c89cb555c10ae61a365a2f54eb72bc4aee3c78.camel@collabora.com>
References: <20200311174300.19407-1-ezequiel@collabora.com>
         <20200311174300.19407-7-ezequiel@collabora.com>
         <02c89cb555c10ae61a365a2f54eb72bc4aee3c78.camel@collabora.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.4 (3.34.4-1.fc31) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Le mercredi 11 mars 2020 à 16:01 -0300, Ezequiel Garcia a écrit :
> On Wed, 2020-03-11 at 14:43 -0300, Ezequiel Garcia wrote:
> > Refactor how S_FMT and TRY_FMT are handled, and also make sure
> > internal initial format and format reset are done properly.
> > 
> > The latter is achieved by making sure the same hantro_{set,try}_fmt
> > helpers are called on all paths that set the format (which is
> > part of the driver state).
> > 
> > This commit removes the following v4l2-compliance warnings:
> > 
> > test VIDIOC_G_FMT: OK
> > 	fail: v4l2-test-formats.cpp(711): Video Capture Multiplanar: TRY_FMT(G_FMT) != G_FMT
> > test VIDIOC_TRY_FMT: FAIL
> > 	fail: v4l2-test-formats.cpp(1116): Video Capture Multiplanar: S_FMT(G_FMT) != G_FMT
> > test VIDIOC_S_FMT: FAIL
> > 
> > Reported-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
> > Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
> > ---
> [..]
> > @@ -227,12 +232,12 @@ static int vidioc_g_fmt_cap_mplane(struct file *file, void *priv,
> >  	return 0;
> >  }
> >  
> > -static int vidioc_try_fmt(struct file *file, void *priv, struct v4l2_format *f,
> > -			  bool capture)
> > +static int hantro_try_fmt(const struct hantro_ctx *ctx,
> 
> Oops, it seems there's a warning due to ctx being const-qualified.

Indeed:

drivers/staging/media/hantro/hantro_v4l2.c: In function ‘hantro_try_fmt’:
drivers/staging/media/hantro/hantro_v4l2.c:282:30: warning: passing argument 1 of ‘hantro_needs_postproc’ discards ‘const’ qualifier from pointer target type [-Wdiscarded-qualifiers]
  282 |       !hantro_needs_postproc(ctx, fmt))
      |                              ^~~
In file included from drivers/staging/media/hantro/hantro_v4l2.c:29:
drivers/staging/media/hantro/hantro.h:420:42: note: expected ‘struct hantro_ctx *’ but argument is of type ‘const struct hantro_ctx *’
  420 | hantro_needs_postproc(struct hantro_ctx *ctx, const struct hantro_fmt *fmt)
      |                       ~~~~~~~~~~~~~~~~~~~^~~

> 
> That should be fixed of course.
> 
> Regards,
> Ezequiel
> 
> 

