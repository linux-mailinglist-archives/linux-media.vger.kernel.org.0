Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 88C721D02FB
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2020 01:24:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729215AbgELXYM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 12 May 2020 19:24:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36864 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726031AbgELXYM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 12 May 2020 19:24:12 -0400
Received: from mail-yb1-xb42.google.com (mail-yb1-xb42.google.com [IPv6:2607:f8b0:4864:20::b42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C3229C061A0E
        for <linux-media@vger.kernel.org>; Tue, 12 May 2020 16:24:10 -0700 (PDT)
Received: by mail-yb1-xb42.google.com with SMTP id r14so7841502ybm.12
        for <linux-media@vger.kernel.org>; Tue, 12 May 2020 16:24:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/u4atMFlBmLtwnSTMgMCyabi/w8j3iTCGwRJskabUDQ=;
        b=FUMFvFyjoY5VlbhYA9rjNaJMt+/kRqiJvdjU8f/dcnmZ5RZh2+QgVU8DfaWiULoOCW
         XPd2H5H8qIDmEqp5e/bpmkxzAepnCV1VFhTrWF+3VAvuef1c3Ty6QX1dLhH+Pj/VZIM/
         EaIkMy2EevAj1mRnJJshNV56xmonJ3SL8jlEKq2PMMpl0h0EFctkKeVAFCMZXE8OCler
         5a3UPBxJwucuQcZpYZ6Iz2rU3MlxNRIu3JqfpdeTMx4JjOSKOtJ/tWAY+iiZwNiBK5UM
         +oDEIngTzcaD//Xe5yqEjSQVXlEf3ThtGlADepvyHCAGRhVhyJE4nL2XKU1uedBG0y22
         2u+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/u4atMFlBmLtwnSTMgMCyabi/w8j3iTCGwRJskabUDQ=;
        b=OqpSJt8mAwz4KerThgCoZb1fT87jKgAUtrK26EV7vCNmA4SCIW8Cj4KDatFfLROnrf
         +JyR/mUPrwGjOkHFcmCrb8dgTBWNZbiyI2GVG0mlJ4fSj6UvLtX1ymZbTH3RiURd/L4r
         1AszkAYXZGOw7fmfJ+Hy7NI29iRiDerAFz9V1dpzsFHq3H3ZI06wTINLodeLCfwpyHb5
         JtWVx1htZkPwieoLsyL5GxmD7uZhkZzQSJFmuljAE2VCv9cv6T/Pu1f+26vYepW1yBlA
         kEvggTfwBKQMP3GsL0agn997xP4hfPY1Z4e+LZJ2bIBtT47Awvl/rcApJBNMfKb7Agt0
         6Epw==
X-Gm-Message-State: AGi0Pua3UtkaWJX+XbRYtlg+9ZGkAZD+Qty40RaK4GE2PEGzPiqZc3rn
        yq4e/Gi4KeFsUG7AmovixJQfiHwJVHq84pAm+VxXkQ==
X-Google-Smtp-Source: APiQypJsh1XuLI/Or+Cuxml34jfZWIFEC2vOt3BCpxxZ5Z8CSRquQEhUPx0qqlzhIuvjXww3sdCPdkWC8bA4V5hfgzE=
X-Received: by 2002:a25:ba8f:: with SMTP id s15mr39075879ybg.34.1589325849314;
 Tue, 12 May 2020 16:24:09 -0700 (PDT)
MIME-Version: 1.0
References: <20200424053819.220276-1-jnchase@google.com> <20200511212047.GA21845@bogus>
In-Reply-To: <20200511212047.GA21845@bogus>
From:   Jeff Chase <jnchase@google.com>
Date:   Tue, 12 May 2020 19:23:57 -0400
Message-ID: <CALTkaQ1syQDYw9afNbU5GGGG2=-u4ByTAc3w6xhL_F6F=EBOzA@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: Add ch7322 as a trivial device
To:     Rob Herring <robh@kernel.org>
Cc:     linux-media@vger.kernel.org, mchehab@kernel.org,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, May 11, 2020 at 5:20 PM Rob Herring <robh@kernel.org> wrote:
>
> On Fri, Apr 24, 2020 at 01:38:18AM -0400, Jeff Chase wrote:
> > The ch7322 is a Chrontel CEC controller.
> >
> > Signed-off-by: Jeff Chase <jnchase@google.com>
> > ---
> >  Documentation/devicetree/bindings/trivial-devices.yaml | 2 ++
> >  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
> >  2 files changed, 4 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
> > index 4165352a590a..ec2ddc6cdf9a 100644
> > --- a/Documentation/devicetree/bindings/trivial-devices.yaml
> > +++ b/Documentation/devicetree/bindings/trivial-devices.yaml
> > @@ -48,6 +48,8 @@ properties:
> >            - capella,cm32181
> >              # CM3232: Ambient Light Sensor
> >            - capella,cm3232
> > +            # CH7322: HDMI-CEC Controller
> > +          - chrontel,ch7322
>
> I don't think this qualifies as a trivial device. It has HPDI, OE and
> reset signals all likely hooked up to GPIOs. You might not have those
> hooked up for s/w control, but someone will.
>
> And I'd assume if you had multiple instances, they will need to be
> associated with each connector.
>
> Rob

Thank you for looking at this. Taking a step back for a moment, I am
developing this driver for an x86/ACPI platform on which I also
control the firmware. Is there a preference between using an ACPI ID
and a devicetree compatible id? I am trying to find out if the vendor
already has an ACPI ID for this device. If I find and use that should
I still add a compatible id anyways?

Jeff
