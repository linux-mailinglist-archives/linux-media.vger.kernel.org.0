Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DCCC5D7A64
	for <lists+linux-media@lfdr.de>; Tue, 15 Oct 2019 17:49:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387517AbfJOPtf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 15 Oct 2019 11:49:35 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:51635 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387488AbfJOPte (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 15 Oct 2019 11:49:34 -0400
Received: by mail-wm1-f68.google.com with SMTP id 7so21457476wme.1
        for <linux-media@vger.kernel.org>; Tue, 15 Oct 2019 08:49:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gateworks-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=k0oLZeNxHzTE8IIUE86e9oBCkL5+n2Sfhb/h8AwqfjU=;
        b=ukXEJ5BasvyJEqwD95mjIV42aYMpvQWIh38DnM9tAxawdvVa8HUCLSbJ2fSLlIP5JD
         ArSgDppv+xuN8diGoG64y53Lx044wsFQgIRw5QavaiqeTvzUkjeaVtpjs7sMYoHmF7AW
         SGJdeMYyQems6gh6dDGnb5uHn4Io6V//l4kCFGOxXp6Hfm2SOz0acEizEs4MoILqhh+P
         HM0hr1YNTAorfvyTkam7GtSxgNiBwjod2wFGbc2Q/pvaow7fjp8w4zBUvZkIjr7Y0BBs
         fV/qavVYPbXKwzH+8J1mrvbjY+5wBiKM6F5q1O5lmE7/X6j0Zf/mJrYk3cCNGMbaxaaD
         XJag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=k0oLZeNxHzTE8IIUE86e9oBCkL5+n2Sfhb/h8AwqfjU=;
        b=nKF6QFkQPYWiSXo7+9euacsNpA0qLxjxMUUH6GhdN7H4BfxFfDDYOV4GSWiC9Qj2yI
         S+ZKsVfWFdIVqxF9E5wI82Sx1EulFRdwwUqNCHWFzm+WX+tBAL+hOV+c2koVFN9rc0aI
         yvv+5h3gELz8eHwnkEblmvQpwb4sdIUwh0xx15mpI+RIed9oahHiDdJYG+PyYxbHxQ6x
         uRULRdcLagUGfiIKABy+yvPuvmDqYMLV16Ek3xTiwbKdlp7TeoVfgkxkyiGiZBXt2v8o
         1MfeTfJDuGVbyqoAvqs+7x1t/KHsMSWfLhsxmy9OPlwR+6o1rz1eojFTBOajSWe3O1cJ
         CQFg==
X-Gm-Message-State: APjAAAXtPQz4yLD6kJ5d7Bh6ajytdkzxP7S46rtX+khO7T61swNe/ABZ
        UJItxyyi6r5LaOaWtFuKbT7ZQg8ay7PmORIsjhBk4g==
X-Google-Smtp-Source: APXvYqzastSsw4V+dEjNx58X7tiMEvkjbe7BQIl6lY20TUPQIdjpF8jEDsg5ytFn6PzPnIzaf6XahyR+FAyDgwJSEUA=
X-Received: by 2002:a1c:9ecf:: with SMTP id h198mr19728282wme.45.1571154572182;
 Tue, 15 Oct 2019 08:49:32 -0700 (PDT)
MIME-Version: 1.0
References: <20191010154417.9437-1-festevam@gmail.com> <0f7a7910-8652-7a95-1f04-e25278ec05aa@gmail.com>
 <593b540b-d5f9-63ba-becc-0902dc5d7900@gmail.com> <CAOMZO5BgnbfFSmu7HEWtaT9Gexb-u13ZxzWEN-+Hw9eMfuC+LQ@mail.gmail.com>
In-Reply-To: <CAOMZO5BgnbfFSmu7HEWtaT9Gexb-u13ZxzWEN-+Hw9eMfuC+LQ@mail.gmail.com>
From:   Tim Harvey <tharvey@gateworks.com>
Date:   Tue, 15 Oct 2019 08:49:21 -0700
Message-ID: <CAJ+vNU2fJ_eGMwQH7-HmO_==5p3Uuscv6S2fG_NY67J2o8OG+g@mail.gmail.com>
Subject: Re: [PATCH] media: imx.rst: Update the imx6-sabreauto ADV7180 instructions
To:     Fabio Estevam <festevam@gmail.com>
Cc:     Steve Longerbeam <slongerbeam@gmail.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-media <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sat, Oct 12, 2019 at 2:19 PM Fabio Estevam <festevam@gmail.com> wrote:
>
> Hi Steve,
>
> On Sat, Oct 12, 2019 at 5:24 PM Steve Longerbeam <slongerbeam@gmail.com> wrote:
>
> > Ah, now I remember. You are using the imx6dl sabreauto, it's IPU-CSI
>
> Yes, correct. I am using the imx6dl-sabreauto.
>
> > video muxes have five input pads for each of the four MIPI CSI-2 virtual
> > channels (pads 0 - 3) and one parallel input (pad 4). The output mux pad
> > is pad 5.
> >
> > But the doc should clarify which SabreAuto corresponds to the given
> > example pipeline config. Can you send a v2 of this patch that clarifies
> > the config corresponds to the imx6 quad SabreAuto. If you like you could
> > also include the analogous config for the imx6dl.
>
> Good idea. Will send a v2 that clarifies the example pipeline for each
> sabreauto variant.
>
> Thanks

Fabio,

I assume your seeing the same rolling video issue on capture unless
you discard the first few 'corrupt' frames? I'm still wondering how we
can address this properly upstream.

Tim
