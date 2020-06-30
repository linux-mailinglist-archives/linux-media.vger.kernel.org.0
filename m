Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BBA7620FBD5
	for <lists+linux-media@lfdr.de>; Tue, 30 Jun 2020 20:35:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729500AbgF3SfV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 30 Jun 2020 14:35:21 -0400
Received: from mail.kernel.org ([198.145.29.99]:43916 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731452AbgF3SfU (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 30 Jun 2020 14:35:20 -0400
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 9F91C206CB;
        Tue, 30 Jun 2020 18:35:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1593542119;
        bh=gyfWpjnOJwwzGi1tgl/VLHZLp+8PSWYx42nMxv5kKvo=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=VreS75mCNztVC55O5WYtKQ3ty6sypfwjFtEvCpKGJF/P6+aSEBXzu2b1RZvZfzGpB
         fU3Crxvs7MtpRNg03J0qHtUpL7695T+IUbeYINW2k2LPMvnhMrjK404HPe1gY8RZrK
         tm1PctHJAhBK3iKVLx00O8lxXyMtdbS71s+sKX4c=
Received: by mail-ot1-f48.google.com with SMTP id c25so1622230otf.7;
        Tue, 30 Jun 2020 11:35:19 -0700 (PDT)
X-Gm-Message-State: AOAM532IMyqxNf0bTcKWksra+d6le2VoHnmV/JK7CkBuWDk8jVKT+CnD
        8aoK56lNRYZ2JCso6aURqnwvImcCjPbE7V8M1Q==
X-Google-Smtp-Source: ABdhPJyxGkRB5nAl2gD00aoXYNA+A7QZAkg3P0qe89BJ5GCB6sKgUEuOFJbEZFHSpYjGUE+sPWFRo4oj5kH9Y3fJIos=
X-Received: by 2002:a9d:3a36:: with SMTP id j51mr19503925otc.129.1593542118992;
 Tue, 30 Jun 2020 11:35:18 -0700 (PDT)
MIME-Version: 1.0
References: <20200520133932.30441-1-erwan.leray@st.com> <20200520133932.30441-2-erwan.leray@st.com>
 <20200627141801.GA1945477@kroah.com>
In-Reply-To: <20200627141801.GA1945477@kroah.com>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Tue, 30 Jun 2020 12:35:08 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+PFmeN_bFRD1M_E+1NOTsMowViG3CUWDWgy5=3kpC=xw@mail.gmail.com>
Message-ID: <CAL_Jsq+PFmeN_bFRD1M_E+1NOTsMowViG3CUWDWgy5=3kpC=xw@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: serial: add generic DT binding for
 announcing RTS/CTS lines
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Erwan Le Ray <erwan.leray@st.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@st.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
        linux-stm32@st-md-mailman.stormreply.com,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        linaro-mm-sig@lists.linaro.org,
        Fabrice Gasnier <fabrice.gasnier@st.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sat, Jun 27, 2020 at 8:18 AM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Wed, May 20, 2020 at 03:39:31PM +0200, Erwan Le Ray wrote:
> > Add support of generic DT binding for annoucing RTS/CTS lines. The initial
> > binding 'st,hw-flow-control' is not needed anymore since generic binding
> > is available, but is kept for backward compatibility.
> >
> > Signed-off-by: Erwan Le Ray <erwan.leray@st.com>
> >
> > diff --git a/Documentation/devicetree/bindings/serial/st,stm32-uart.yaml b/Documentation/devicetree/bindings/serial/st,stm32-uart.yaml
> > index 75b8521eb7cb..06d5f251ec88 100644
> > --- a/Documentation/devicetree/bindings/serial/st,stm32-uart.yaml
> > +++ b/Documentation/devicetree/bindings/serial/st,stm32-uart.yaml
> > @@ -35,9 +35,11 @@ properties:
> >      description: label associated with this uart
> >
> >    st,hw-flow-ctrl:
> > -    description: enable hardware flow control
> > +    description: enable hardware flow control (deprecated)
> >      $ref: /schemas/types.yaml#/definitions/flag
> >
> > +  uart-has-rtscts: true
> > +
> >    dmas:
> >      minItems: 1
> >      maxItems: 2
> > --
> > 2.17.1
> >
>
> Did this get ignored by the DT maintainers?  :(

When it doesn't go to the DT list, you are playing roulette whether I
happen to see it. :(

Anyways,

Reviewed-by: Rob Herring <robh@kernel.org>
