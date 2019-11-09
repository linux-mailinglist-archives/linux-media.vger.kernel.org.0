Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A37FCF5F89
	for <lists+linux-media@lfdr.de>; Sat,  9 Nov 2019 15:27:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726383AbfKIO1n (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 9 Nov 2019 09:27:43 -0500
Received: from mail-qt1-f193.google.com ([209.85.160.193]:33981 "EHLO
        mail-qt1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726289AbfKIO1m (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 9 Nov 2019 09:27:42 -0500
Received: by mail-qt1-f193.google.com with SMTP id c25so9617068qtq.1
        for <linux-media@vger.kernel.org>; Sat, 09 Nov 2019 06:27:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20150623.gappssmtp.com; s=20150623;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=/y+aqStaEEoDaiz79tY9g2CQ2osI4F2QwJynUTOYdPA=;
        b=YjSQTYQvq9DdFpuj7j9ockD0XV0U59ZcdT0pwDpcXktY9YvAkVwjMuY9eN70QYD0bf
         SYclRm+lvMpKtgr3Z6pcm35/CSn99halAMpkX2B2E8FtBjMBm+NH4H1iuLw/DBLyhWNr
         ZA8f8ub/4IGyMDplP0oLJCH8dgBPxhCZq1cPJa2vo4+JB7ye7pZQj9donLlcrGF+A+L3
         NKmpYHBq2kgUg0lvQO+y64+sNQS699CK3JEHMbikNQrprx+PWd9D7XdYoaOe+K3ve9Or
         1HOvWPhcC/p8ZF1GJ0DfCBtuc/6VTGBDjmIlsJVFgj4+tXk31ELRVXJF8eJPfjFC/K+l
         uOPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=/y+aqStaEEoDaiz79tY9g2CQ2osI4F2QwJynUTOYdPA=;
        b=KhsFYtH5cgACDJYUiStQId7wceBJhCfvxLbO/rNXa/q24yDteCvyMAXu8RIBWmWEwq
         DP4m7qzZ/SZtPaLMysvX8Z1Xn8Rm9EUZy0z5CEgl9ehHcABRR0F7i0quWK/3Lc3MeI6y
         r5y+Ew/a804Xsv7ov4nm16UESYNmv+5AEXvHjbbq9hpmClrGSLW/QHG4T520YlCKAECI
         pfgNS7hmHsJsiTyYT/qPqcnGY+8wv3GJpNt9OKBpez3StEpM54o8zX+Gv1A0BT0AoSPO
         rbl0BXRp0oRcjwMDLgnWB7HC/q+8nNtVz7ccIn/3YIRug/lr2MBIC/RUU2HDDZXSfh8U
         ChdQ==
X-Gm-Message-State: APjAAAX00nyabzqd/3G6TzNN64pXZiIQcnWJIIGs8KXufK/K5okj+quf
        VePEsadV7p89DE/OpqdBJNTX8g==
X-Google-Smtp-Source: APXvYqzEejcNvziXBikkmRZarvF/WMEsrzP4YWZ7aSqtcC8ldj7H/uhpnSGRK8718huqoWFjFlQD9Q==
X-Received: by 2002:ac8:6a0a:: with SMTP id t10mr17666466qtr.62.1573309661592;
        Sat, 09 Nov 2019 06:27:41 -0800 (PST)
Received: from skullcanyon ([192.222.193.21])
        by smtp.gmail.com with ESMTPSA id w2sm2630680qkw.31.2019.11.09.06.27.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Nov 2019 06:27:40 -0800 (PST)
Message-ID: <a55bcd49a72230a683ebf816586b695739598535.camel@ndufresne.ca>
Subject: Re: Overlay support in the i.MX7 display
From:   Nicolas Dufresne <nicolas@ndufresne.ca>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Pekka Paalanen <ppaalanen@gmail.com>
Cc:     Stefan Agner <stefan@agner.ch>, Marek Vasut <marex@denx.de>,
        dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org
Date:   Sat, 09 Nov 2019 09:27:39 -0500
In-Reply-To: <20191104125829.GA4913@pendragon.ideasonboard.com>
References: <20191101084318.GA8428@pendragon.ideasonboard.com>
         <67057f1082886726268f346f49c23051@agner.ch>
         <20191104100947.4e198e72@eldfell.localdomain>
         <20191104125829.GA4913@pendragon.ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.32.4 (3.32.4-1.fc30) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Le lundi 04 novembre 2019 à 14:58 +0200, Laurent Pinchart a écrit :
> Hello,
> 
> On Mon, Nov 04, 2019 at 10:09:47AM +0200, Pekka Paalanen wrote:
> > On Sun, 03 Nov 2019 19:15:49 +0100 Stefan Agner wrote:
> > > On 2019-11-01 09:43, Laurent Pinchart wrote:
> > > > Hello,
> > > > 
> > > > I'm looking at the available options to support overlays in the display
> > > > pipeline of the i.MX7. The LCDIF itself unfortunaltey doesn't support
> > > > overlays, the feature being implemented in the PXP. A driver for the PXP
> > > > is available but only supports older SoCs whose PXP doesn't support
> > > > overlays. This driver is implemented as a V4L2 mem2mem driver, which
> > > > makes support of additional input channels impossible.  
> > > 
> > > Thanks for bringing this up, it is a topic I have wondered too:
> > > Interaction between PXP and mxsfb.
> > > 
> > > I am not very familiar with the V4L2 subsystem so take my opinions with
> > > a grain of salt.
> > > 
> > > > Here are the options I can envision:
> > > > 
> > > > - Extend the existing PXP driver to support multiple channels. This is
> > > >   technically feasible, but will require moving away from the V4L2
> > > >   mem2mem framework, which would break userspace. I don't think this
> > > >   path could lead anywhere.
> > > > 
> > > > - Write a new PXP driver for the i.MX7, still using V4L2, but with
> > > >   multiple video nodes. This would allow blending multiple layers, but
> > > >   would require writing the output to memory, while the PXP has support
> > > >   for direct connections to the LCDIF (through small SRAM buffers).
> > > >   Performances would thus be suboptimal. The API would also be awkward,
> > > >   as using the PXP for display would require usage of V4L2 in
> > > >   applications.  
> > > 
> > > So the video nodes would be sinks? I would expect overlays to be usable
> > > through KMS, I guess that would then not work, correct?
> 
> There would be sink video nodes for the PXP inputs, and one source video
> node for the PXP output. The PXP can be used stand-alone, in
> memory-to-memory mode, and V4L2 is a good fit for that.
> 
> > > > - Extend the mxsfb driver with PXP support, and expose the PXP inputs as
> > > >   KMS planes. The PXP would only be used when available, and would be
> > > >   transparent to applications. This would however prevent using it
> > > >   separately from the display (to perform multi-pass alpha blending for
> > > >   instance).  
> > > 
> > > KMS planes are well defined and are well integrated with the KMS API, so
> > > I prefer this option. But is this compatible with the currently
> > > supported video use-case? E.g. could we make PXP available through V4L2
> > > and through DRM/mxsfb?
> 
> That's the issue, it's not easily doable. I think we could do so, but
> how to ensure mutual exclusion between the two APIs needs to be
> researched. I fear it will result in an awkward solution with fuzzy
> semantics. A module parameter could be an option, but wouldn't be very
> flexible.
> 
> > > Not sure what your use case is exactly, but when playing a video I
> > > wonder where is the higher value using PXP: Color conversion and scaling
> > > or compositing...? I would expect higher value in the former use case.
> 
> I think it's highly use-case-dependent.
> 
> > mind, with Wayland architecture, color conversion and scaling could be
> > at the same level/step as compositing, in the display server instead of
> > an application. Hence if the PXP capabilities were advertised as KMS
> > planes, there should be nothing to patch in Wayland-designed
> > applications to make use of them, assuming the applications did not
> > already rely on V4L2 M2M devices.
> > 
> > Would it not be possible to expose PXP through both uAPI interfaces? At
> > least KMS atomic's TEST_ONLY feature would make it easy to say "no" to
> > userspace if another bit of userspace already reserved the device via
> > e.g. V4L2.
> 
> We would also need to figure out how to do it the other way around,
> reporting properly through V4L2 that the device is busy. I think it's
> feasible, but I doubt it would result in anything usable for userspace.

We already have this needs for decoders with fixed number of streams.

> If the KMS device exposes multiple planes unconditionally and fails the
> atomic commit if the PXP is used through V4L2, I think it would be hard
> for Wayland to use this consistently. Given that I expect the PXP to be
> mostly used for display purpose I'm tempted to allocate it for display
> unconditionally, or, possibly, decide how to expose it through a module
> parameter.

It's a strange statement "mostly used for display purpose", considering
the upstream driver exist for video scaling and color conversion, and
no one have yet implement the "display purpose" driver.

My impression is that the complication is kernel specific (the fact we
very have two subsystems for the same IPs). Since software wise,
sharing and allocating resources seems pretty simple.

> 
> We have a similar situation on Renesas R-Car Gen3 platforms, with a
> memory-to-memory compositor called VSP. Some VSP instances are connected
> to the display controller, and we allocate them for display
> unconditionally. Other VSP instances are exposed as V4L2 devices. We
> haven't heard of anyone who wanted to use the display VSP instances for
> unrelated purposes. If such a use case arose, exposing those instances
> through V4L2 would just be a matter of flipping one bit in the driver
> (all the infrastructure is in place), which we would likely expose as a
> module parameter.

