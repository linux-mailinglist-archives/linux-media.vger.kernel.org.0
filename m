Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3A050221DA6
	for <lists+linux-media@lfdr.de>; Thu, 16 Jul 2020 09:52:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726422AbgGPHwO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 16 Jul 2020 03:52:14 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:43082 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725867AbgGPHwN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 16 Jul 2020 03:52:13 -0400
Received: by mail-ot1-f68.google.com with SMTP id 95so3503912otw.10;
        Thu, 16 Jul 2020 00:52:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8WlI+YHkueSuF08RQCnLnwIMdn+ACDRoO1h1JCP5bfU=;
        b=C8ZTow2oSWruCrATvualw8O3DNZd91TOgxfKCov/J67YLtc8lmULvkvqGzP8OPQ6cL
         sOwyh3kTam21y1GW4mwYMO9lPY312aVp4OGP+mfj+OD5MaNfES0t+yHjiO0pPLoelRns
         seXWoWdtXT2rE/374xknV51yJID3drLZ73HClGSAaQXRF8waRLgtVMHcPHGTP7CgpfPB
         p5AqTe+iIbJpipvAw/gCMUTT47esCX2Vym8ycbGGNCOgXbK6o9ELHV8rXpaoGZG6LK4v
         +lWkjoJS51q71DLUHUm3pyzKafwXxOCIKZqPs41ZI16hOJbzQW5vsszA9e6GbG6fC3By
         0iXA==
X-Gm-Message-State: AOAM533jxJEpedWbtx+pIw58SZAHLtDCftE+cgL3XlheIyBd8aftj5vB
        VmpQkgkpUTPvtIVLa2oMT7syZIf/E4YMW5o9PhA=
X-Google-Smtp-Source: ABdhPJyFWwITqb6ejbM+toUXP0VUMT8h2tr0L7qnGfNLMwwxUyIsQvFrtRpDRgKqCP4v+ZZ5x4Fa6xXPoCX6ZH6bz8U=
X-Received: by 2002:a05:6830:1451:: with SMTP id w17mr3330266otp.250.1594885932674;
 Thu, 16 Jul 2020 00:52:12 -0700 (PDT)
MIME-Version: 1.0
References: <20200715140951.90753-1-jacopo+renesas@jmondi.org>
 <20200715140951.90753-2-jacopo+renesas@jmondi.org> <20200716015323.GQ6144@pendragon.ideasonboard.com>
In-Reply-To: <20200716015323.GQ6144@pendragon.ideasonboard.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 16 Jul 2020 09:52:01 +0200
Message-ID: <CAMuHMdXYX-6H99B=dkKxeD3f_Mr1tETYGJGBqqKMgjR_kFF2-A@mail.gmail.com>
Subject: Re: [PATCH 1/8] dt-bindings: media: ov5640: Convert to json-schema
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Steve Longerbeam <slongerbeam@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Jul 16, 2020 at 3:54 AM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> On Wed, Jul 15, 2020 at 04:09:44PM +0200, Jacopo Mondi wrote:
> > Convert the ov5640 bindings document to json-schema and update

> > +  rotation:
> > +    description: |
> > +      As defined in Documentation/devicetree/bindings/media/video-interfaces.txt,
> > +      valid values are 0 (sensor mounted upright) and 180 (sensor mounted upside
> > +      down).
>
> The second sentence should be replaced with
>   enum:
>     - 0
>     - 180

Or (ignoring Jacopo's later comment):

    enum: [ 0, 180 ]

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
