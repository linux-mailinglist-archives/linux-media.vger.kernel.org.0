Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 69E78E4391
	for <lists+linux-media@lfdr.de>; Fri, 25 Oct 2019 08:30:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391649AbfJYGaF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 25 Oct 2019 02:30:05 -0400
Received: from mail-ed1-f49.google.com ([209.85.208.49]:37729 "EHLO
        mail-ed1-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389669AbfJYGaF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 25 Oct 2019 02:30:05 -0400
Received: by mail-ed1-f49.google.com with SMTP id e12so830122edr.4
        for <linux-media@vger.kernel.org>; Thu, 24 Oct 2019 23:30:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=KBahDbxyjykw16Smp8ssk33B7yz2Fp8/ldvWCRbG2Z4=;
        b=QrT82WhWCShRcFq8HOk2tvnrEMKgGYiKewH6271lt5TFReEFLhYi2LZ4Y1XH2+MO3S
         +lARuRBZaajuMm0c4fpm1CL6G8pWT/Vyq23cF6aUFgA54pT+BnDaXRzLeRKmOzY62gWF
         xJgEMINzx0lVuzlTj1N/aIYq0JTgJofhfX4NE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KBahDbxyjykw16Smp8ssk33B7yz2Fp8/ldvWCRbG2Z4=;
        b=UlYKp4k+uWAFlL6loRiJJG8FKNisu+NPVMGPCGkhSEbfOhTQmxu8s9khhtaI5Yx+TO
         8CR25XcsscwLQye+kQFfoz9yhqCodxfBBbM3UADOr+CqjhHfD2+Z9xbeJXIe9+7lDVok
         sCEBmVbUowpcPwA2n2Sb5BvPz6HogJgy6RreUncRbLnYiW8ScbIsqiGegWpInXcxcGYA
         H9Vn3x8oBrxVhaL0M1FEXFhYLp8Dcu1hQEp3DKji+XsZ4v21uWxeoQyrFBeU7u/tvtkO
         +WPj294vyE+wRsOGi0cUFcSDxX9qF/o2HrqO6waSLXvKNjgvO627fyoD+sabSPtGjA24
         sgLQ==
X-Gm-Message-State: APjAAAXptPjD9a0vX7LpR13dII9UpT4MoGk18rWWmgK3I9kUm+UxJW7i
        eMLqAKabP+py51natw1f72wfJ2FsiL+ShA==
X-Google-Smtp-Source: APXvYqwHNzx9lTsmS5z58EUXwaXM3EgSs8mM+jU1fTSBovn6Xzumg5y9wQx+HKpmChYCbzT22r14Vw==
X-Received: by 2002:a05:6402:13c5:: with SMTP id a5mr2088743edx.106.1571985003301;
        Thu, 24 Oct 2019 23:30:03 -0700 (PDT)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com. [209.85.221.47])
        by smtp.gmail.com with ESMTPSA id z25sm35897edl.58.2019.10.24.23.30.01
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Oct 2019 23:30:01 -0700 (PDT)
Received: by mail-wr1-f47.google.com with SMTP id t16so916433wrr.1
        for <linux-media@vger.kernel.org>; Thu, 24 Oct 2019 23:30:01 -0700 (PDT)
X-Received: by 2002:a5d:6a42:: with SMTP id t2mr1209968wrw.155.1571985000947;
 Thu, 24 Oct 2019 23:30:00 -0700 (PDT)
MIME-Version: 1.0
References: <20191007162913.250743-1-jacopo@jmondi.org> <20191007162913.250743-2-jacopo@jmondi.org>
 <20191008074052.GA633@amd> <20191008075828.phxf2m7237ryl6yf@uno.localdomain>
 <20191008080634.GC633@amd> <20191008082041.476a2soclry6qn3v@uno.localdomain>
 <9788aa13-1bc0-02c3-33f5-a875940f2dc3@xs4all.nl> <20191023142717.GA22854@duo.ucw.cz>
In-Reply-To: <20191023142717.GA22854@duo.ucw.cz>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Fri, 25 Oct 2019 15:29:49 +0900
X-Gmail-Original-Message-ID: <CAAFQd5CjUH7QRg-oQOKB=YH9NPvSxwjrdRUPYZkYVAHgJh6dZg@mail.gmail.com>
Message-ID: <CAAFQd5CjUH7QRg-oQOKB=YH9NPvSxwjrdRUPYZkYVAHgJh6dZg@mail.gmail.com>
Subject: Re: [PATCH v4 01/11] dt-bindings: video-interfaces: Document
 'location' property
To:     Pavel Machek <pavel@ucw.cz>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        "open list:MEDIA INPUT INFRASTRUCTURE (V4L/DVB)" 
        <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Oct 23, 2019 at 11:27 PM Pavel Machek <pavel@ucw.cz> wrote:
>
> Hi!
>
> > > I'm skeptical about adding now a property for a device that we don't
> > > support, because we -now- think it's a good idea. I might be wrong,
> > > but my assumption is that when someone will want to support an
> > > 'advanced' device, it's easy to add "movable" or whatever else to the
> > > list of accepted properties values. Am I wrong in assuming this? As
> > > long as "front" "back" and "external" will stay supported for backward
> > > DTB compatibility it should be fine, right ?
> >
> > The basic rule is that you should not define things unless you KNOW that
> > they will be needed. So when we actually see new devices for which
> > "front", "back" or "external" does not fit, then new names can be
> > created.
>
> > It's impossible to cover all situations since we can't predict the future.
> > The best we can do is to allow for future extensions.
>
> Those devices are already being sold, and yes, they are running linux
> (with some patches probably).
>
> I believe it would be better to specify "this camera is selfie --
> takes pictures of the user" vs. "this is main camera -- takes pictures
> of what user is looking at".

FWIW, Android and Chrome OS call those "user-facing" and
"world-facing" respectively.

Best regards,
Tomasz
