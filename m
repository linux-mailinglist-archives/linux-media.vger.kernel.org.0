Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EFF35300F18
	for <lists+linux-media@lfdr.de>; Fri, 22 Jan 2021 22:45:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729178AbhAVVoA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 22 Jan 2021 16:44:00 -0500
Received: from mail.kernel.org ([198.145.29.99]:59848 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730259AbhAVVnt (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 22 Jan 2021 16:43:49 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7CEDB23ACA;
        Fri, 22 Jan 2021 21:43:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1611351789;
        bh=mmFjhRYntRGF7JqBKKJ7VPcPiMpsAqOeWWCtqwgMXRg=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=ZGcTKDnupr/AkOmJbxevkLLmBc/FqDw1DUfnOY3B+dJqILUoEQJbIC1SSHU3uafk5
         ZU2+d4+mzczOnSVeRwD1XT8eoy1zW4yvkwiJXW+EVVVBB5OquTtS4i7nX8TznH2QKA
         X1zdToO6zLXwRLWUyI9ahaSg/jlHyJGcHe29bNxz7QvvYd98SdikOg8PpAiahkOC+I
         /o8KwmuLkDYrDi450TQQRf/ZRUDOsg+0rtziO7vR7lvFQqbH2ZiqtDrWYgBEiorG2c
         EyGc7E9QF7+Qcds8gBRwKXo4nNPJ6VwCCkWxRR3NmN1+j0nsit1Am4W2lpOxdCgAGY
         ox56qV9egC9Rw==
Date:   Fri, 22 Jan 2021 22:43:03 +0100
From:   Mauro Carvalho Chehab <mchehab@kernel.org>
To:     Rob Herring <robh@kernel.org>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        devicetree@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Guennadi Liakhovetski <g.liakhovetski@gmx.de>,
        Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Jacopo Mondi <jacopo@jmondi.org>
Subject: Re: [PATCH v4 1/2] media: dt-bindings: Convert video-interfaces.txt
 properties to schemas
Message-ID: <20210122224303.6a743c83@coco.lan>
In-Reply-To: <20210122170144.GE27155@paasikivi.fi.intel.com>
References: <20210104165808.2166686-1-robh@kernel.org>
        <20210104165808.2166686-2-robh@kernel.org>
        <CAL_Jsq+dpVvA0iOMzaPf50Decc1hj7zH0eq-RyuVkdzp729vEQ@mail.gmail.com>
        <20210122170144.GE27155@paasikivi.fi.intel.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Fri, 22 Jan 2021 19:01:44 +0200
Sakari Ailus <sakari.ailus@linux.intel.com> escreveu:

> Hi Rob,
> 
> On Fri, Jan 22, 2021 at 10:23:44AM -0600, Rob Herring wrote:
> > On Mon, Jan 4, 2021 at 10:58 AM Rob Herring <robh@kernel.org> wrote:  
> > >
> > > Convert video-interfaces.txt to DT schema. As it contains a mixture of
> > > device level and endpoint properties, split it up into 2 schemas.  
> > 
> > Ping!
> > 
> > Can this please be applied to the media tree so I can tell folks to
> > use it in reviews of media bindings.  

Just merged both patches.

> Yes, it can. It's in my tree now.



Thanks,
Mauro
