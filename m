Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5C4221FD85D
	for <lists+linux-media@lfdr.de>; Thu, 18 Jun 2020 00:07:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726909AbgFQWHq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 17 Jun 2020 18:07:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45586 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726835AbgFQWHo (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 17 Jun 2020 18:07:44 -0400
Received: from mail-yb1-xb44.google.com (mail-yb1-xb44.google.com [IPv6:2607:f8b0:4864:20::b44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 310D5C06174E
        for <linux-media@vger.kernel.org>; Wed, 17 Jun 2020 15:07:43 -0700 (PDT)
Received: by mail-yb1-xb44.google.com with SMTP id m16so2057030ybf.4
        for <linux-media@vger.kernel.org>; Wed, 17 Jun 2020 15:07:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=y+nBmhNSgE5/KJgzUGIyU14Car0+dblfov0Gz+IxE+Y=;
        b=gnPSUYqcV/QHB6lDj/49U8FH/Y2M6vfoPn4+JBtghQI1XLfhiH8LLgUSnfmksiYo3I
         2P1UQv+mBcannQnF+aIAE6SwCxtZU5k16VUb29LJCtBZrjLCUSCYgr8hXYGmKkqxkzvT
         /2v9/AQCRVbeaFt0k3Iu8GEM26/sQq7tFhKS+6h+HB7xjQnKGuG5qyk6YFDC985c80Hx
         YmyOWLQhb+lvVJmcIHSKjwNy7xJG9BEB2OyV4xiD766tXLCaTK1NOl8U7gGSnubPDrrB
         4PCtYhoRo4FaSlzvdJ7fsWEe/CCrtFqa0wH/dXP5hign3sp+n43z6DaBdfT/WIKmoYmT
         PC6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=y+nBmhNSgE5/KJgzUGIyU14Car0+dblfov0Gz+IxE+Y=;
        b=c9ZlYqAXUrcDiFvHTlDEkXOOOm5zs/CNR4fM3yIzt20S13vWCpXCoNjTL2KdVRkpm9
         XmtIe/LmY1Oahbd2+BXG3upX9BeTYRcHnljD7fIgTMuDWnUVNrzQAoBDZLyf/YgsYVka
         Pz3QPujBxu6JL6DOwr+DlcLVNX5OwaUc9r574LB2nNtizJLyS/fYQEh/MPqP1cGWhjvU
         nAqMnBofw1+vO7fACcZ1EKtWo/Z3CMm9wtE6tOQR7piHm3Ua+9luloRZ3G2Rw+qVGqMT
         vd+bcBUUuWk9IkSSNlA4waZFW2SlwG67umLS8pBtyxm1SeX2PGvEb1ivgrpJMnFbeIsE
         Glfw==
X-Gm-Message-State: AOAM530rWukz6t1G6tpkPUaRa2zfZzZaghop1cGPVg36zpMSGiU5KETL
        A5Vc0jSiWP60qb5kAv7/WYmMIoQK4TkhZ7SJsziqfw==
X-Google-Smtp-Source: ABdhPJyfXGntakeTVfHZEfQG9XfX+r1JGGWMwayN2tLsGEeNCZVfjhh9l6O5KED7dswsY8IcAKjmmk3cbZ2V2+GTdc8=
X-Received: by 2002:a25:ca45:: with SMTP id a66mr1830715ybg.164.1592431662324;
 Wed, 17 Jun 2020 15:07:42 -0700 (PDT)
MIME-Version: 1.0
References: <20200615193811.233737-1-jnchase@google.com> <20200615193811.233737-2-jnchase@google.com>
 <20200617202645.GA2728573@bogus>
In-Reply-To: <20200617202645.GA2728573@bogus>
From:   Jeff Chase <jnchase@google.com>
Date:   Wed, 17 Jun 2020 15:07:31 -0700
Message-ID: <CALTkaQ2q0=Z5bo4p5jwJcS9j9TikKq-TzSXhWLyP8P71n1m0Zw@mail.gmail.com>
Subject: Re: [PATCH v5 1/2] dt-bindings: Add ch7322 media i2c device
To:     Rob Herring <robh@kernel.org>
Cc:     mchehab@kernel.org, robh+dt@kernel.org,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Jun 17, 2020 at 1:26 PM Rob Herring <robh@kernel.org> wrote:
>
> On Mon, 15 Jun 2020 15:38:10 -0400, Jeff Chase wrote:
> > The ch7322 is a Chrontel CEC controller.
> >
> > Signed-off-by: Jeff Chase <jnchase@google.com>
> > ---
> >  .../bindings/media/i2c/chrontel,ch7322.yaml   | 67 +++++++++++++++++++
> >  MAINTAINERS                                   |  7 ++
> >  2 files changed, 74 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/media/i2c/chrontel,ch7322.yaml
> >
>
>
> Please add Acked-by/Reviewed-by tags when posting new versions. However,
> there's no need to repost patches *only* to add the tags. The upstream
> maintainer will do that for acks received on the version they apply.
>
> If a tag was not added on purpose, please state why and what changed.

Sorry, still learning this process.

Hans, should I resubmit or would you add the Reviewed-by tag from v4?

Thanks,
Jeff
