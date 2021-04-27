Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9840236CACE
	for <lists+linux-media@lfdr.de>; Tue, 27 Apr 2021 20:03:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237634AbhD0SDz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Apr 2021 14:03:55 -0400
Received: from mail.kernel.org ([198.145.29.99]:33726 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235505AbhD0SDx (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Apr 2021 14:03:53 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 455EC613EA;
        Tue, 27 Apr 2021 18:03:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619546590;
        bh=vy3k35Bj6stbxNOye/Cejf2BSEz1ql5Q4SsDkq7RzRw=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=QYvhWproMfI79Q64smdMt9GcN8s23TFQNoLs72QQLe1HKheGnyjRZozAbInICP2jN
         0SScjfwSjsgmRD1prnDIZl1tOsC8XQQ0rfot7rJOcYkUU+qtZiIcUUPV2nkHv6Sesm
         Ds4OJDJIWypq3I8mqJ9pljpr1AhNPUpQJdcUiX64m8HAgd6bK6nLN4kXgeYatq0vO4
         VR3nSjuNq9F9kYPT3BOa3oBZ2qzYUdw/HsRyrrsYvj4uxpBO1213iMFzU4MFj5mNFg
         JiCj0wNVDOduMuvQDO0cwGRz7hQkXiEUtAVQ0jVVRlGNhUYKYrIdhfLqbg5YvFSRR2
         w7y6hEQ1F3mog==
Received: by mail-ed1-f46.google.com with SMTP id y3so34773023eds.5;
        Tue, 27 Apr 2021 11:03:10 -0700 (PDT)
X-Gm-Message-State: AOAM532iWMO2Pn0qSAO9hL4ORDKOPf8bOgEG6VT/4YDVce4MXsGjo3TX
        815qU3RUj7VZLbs0c7Xur7qIxAC6JWiCbf148A==
X-Google-Smtp-Source: ABdhPJw9TV7O3DokH5AG0Ubo8wdmQp0AN5FyiL06VAdwCqc0TDmeBw9QKLyu0QE2TUTo6gHULbCLwJ/ScDO8tZ04rUA=
X-Received: by 2002:a05:6402:34c8:: with SMTP id w8mr6123543edc.194.1619546588848;
 Tue, 27 Apr 2021 11:03:08 -0700 (PDT)
MIME-Version: 1.0
References: <20210408202436.3706-1-fabrizio.castro.jz@renesas.com> <20210409185420.GA3955417@robh.at.kernel.org>
In-Reply-To: <20210409185420.GA3955417@robh.at.kernel.org>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Tue, 27 Apr 2021 13:02:57 -0500
X-Gmail-Original-Message-ID: <CAL_JsqL5tzJhMzTyyTDnVh=doDknepkk8R0McKsj4U2aqSMFAw@mail.gmail.com>
Message-ID: <CAL_JsqL5tzJhMzTyyTDnVh=doDknepkk8R0McKsj4U2aqSMFAw@mail.gmail.com>
Subject: Re: [PATCH] media: dt-bindings: media: renesas,drif: Fix fck definition
To:     Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Ramesh Shanmugasundaram <rashanmu@gmail.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:MEDIA DRIVERS FOR RENESAS - FCP" 
        <linux-renesas-soc@vger.kernel.org>, devicetree@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Apr 9, 2021 at 1:54 PM Rob Herring <robh@kernel.org> wrote:
>
> On Thu, 08 Apr 2021 21:24:36 +0100, Fabrizio Castro wrote:
> > dt_binding_check reports the below error with the latest schema:
> >
> > Documentation/devicetree/bindings/media/renesas,drif.yaml:
> >   properties:clock-names:maxItems: False schema does not allow 1
> > Documentation/devicetree/bindings/media/renesas,drif.yaml:
> >   ignoring, error in schema: properties: clock-names: maxItems
> >
> > This patch fixes the problem.
> >
> > Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> > ---
> >  Documentation/devicetree/bindings/media/renesas,drif.yaml | 4 +---
> >  1 file changed, 1 insertion(+), 3 deletions(-)
> >
>
> Reviewed-by: Rob Herring <robh@kernel.org>

Still failing in linux-next...

Rob
