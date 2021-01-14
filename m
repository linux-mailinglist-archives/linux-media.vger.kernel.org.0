Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A81542F6BFA
	for <lists+linux-media@lfdr.de>; Thu, 14 Jan 2021 21:22:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726043AbhANUV3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 Jan 2021 15:21:29 -0500
Received: from mail.kernel.org ([198.145.29.99]:39232 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725995AbhANUV3 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 Jan 2021 15:21:29 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0188B23A57;
        Thu, 14 Jan 2021 20:20:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1610655648;
        bh=OeS6t5/ij95xKwcEsB+fKixUHBBG+IQfwdzS+DDkg90=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=VjL8bxWbWFbjWWd8YDqy2XEV3mNuJAI46u5QHVCmbVxjpjAim1nSp1y6QBOlPYwbM
         R/bjsn6TMlWYJuYcBKt/1j8q9xg427T9o93uXfr/gtfjVQ3zkn5z+BoxLQsS8kHW3l
         6VQusQgK0cXzKDb3M27jhPQtZREs3PL9NV65Fr3x/OaMhC0WmTp7KbGxQ2MZrOS7Uh
         klX5s8aVrtO8RubUYNfWe99VDdqKAxfnciKZVChW5hXAgeKPDRkkq+syajU/pc8ab9
         ep9xKfk0wEgDrzuPEl3A2fhctPbTqn7GrBQVtJB2LdgV4Orq3u+qTZfD4tmksLZVOc
         3TO+GzAZh2k5Q==
Received: by mail-ed1-f53.google.com with SMTP id b2so7126193edm.3;
        Thu, 14 Jan 2021 12:20:47 -0800 (PST)
X-Gm-Message-State: AOAM533+HFw99moZGN5JQJ9KUd7/reqmuXGeuLhcL+gOrVTKGNT8gOHi
        ufcNcGUzCu+UWpoaqB+VHqmt/DIZb9MBuFH4Ig==
X-Google-Smtp-Source: ABdhPJzfWIS4FKxHuDGQAHwI9ZRMPwIT7WkHqx5GxMCULXVuYAK1shAq5TcsuRZfYIo+Owg1y0tuvijW+4RMn/Yk0EQ=
X-Received: by 2002:aa7:d154:: with SMTP id r20mr7331879edo.258.1610655646544;
 Thu, 14 Jan 2021 12:20:46 -0800 (PST)
MIME-Version: 1.0
References: <20201119161956.756455-1-jacopo@jmondi.org> <20201119161956.756455-2-jacopo@jmondi.org>
 <20201125091526.GI3940@paasikivi.fi.intel.com> <CAL_JsqLfdGumeicqqhkfn5K40GaXX93NuNZTOpgcCLycHmVQbg@mail.gmail.com>
 <20201222095025.GS26370@paasikivi.fi.intel.com>
In-Reply-To: <20201222095025.GS26370@paasikivi.fi.intel.com>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Thu, 14 Jan 2021 14:20:34 -0600
X-Gmail-Original-Message-ID: <CAL_JsqL6e3Ko=gwPZj6SeFHofiebeR3-HzsEHcNiXrabruJtLA@mail.gmail.com>
Message-ID: <CAL_JsqL6e3Ko=gwPZj6SeFHofiebeR3-HzsEHcNiXrabruJtLA@mail.gmail.com>
Subject: Re: [PATCH v4 01/30] dt-bindings: media: i2c: Rename ov5647.yaml
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Jacopo Mondi <jacopo@jmondi.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        roman.kovalivskyi@globallogic.com,
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.org>,
        naush@raspberrypi.com, Eugeniu Rosca <erosca@de.adit-jv.com>,
        devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Dec 22, 2020 at 3:50 AM Sakari Ailus
<sakari.ailus@linux.intel.com> wrote:
>
> Hi Rob,
>
> On Mon, Dec 21, 2020 at 01:23:29PM -0700, Rob Herring wrote:
> > On Wed, Nov 25, 2020 at 2:15 AM Sakari Ailus
> > <sakari.ailus@linux.intel.com> wrote:
> > >
> > > Cc Rob + DT list.
> >
> > You have to resend if you really want me to see things. In this case,
> > I don't think you need to wait on me for a rename.
>
> I merged the patch earlier based on the IRC discussion.

Seems this landed in -next:

./Documentation/devicetree/bindings/media/i2c/ovti,ov5647.yaml: $id:
relative path/filename doesn't match actual path or filename
expected: http://devicetree.org/schemas/media/i2c/ovti,ov5647.yaml#

Rob
