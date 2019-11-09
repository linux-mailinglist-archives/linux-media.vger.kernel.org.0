Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D6B03F5F8C
	for <lists+linux-media@lfdr.de>; Sat,  9 Nov 2019 15:30:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726381AbfKIOal (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 9 Nov 2019 09:30:41 -0500
Received: from mail-qk1-f173.google.com ([209.85.222.173]:39738 "EHLO
        mail-qk1-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726289AbfKIOak (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 9 Nov 2019 09:30:40 -0500
Received: by mail-qk1-f173.google.com with SMTP id 15so7605935qkh.6
        for <linux-media@vger.kernel.org>; Sat, 09 Nov 2019 06:30:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20150623.gappssmtp.com; s=20150623;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=yQ0r3JEPTbHZn+LMT8Z9CJuMImSDIliuPX+hKt5umBA=;
        b=ogB3PEThk43wwF6TguF5/N5XckUKwyz2oqEsYkH8AUhgGgK/6Wnl87CSyha1ktHefe
         79HfaMIlli39jaNLLd0kVJXrK+tQyATwDjKPesLqrfL5tNAlqvLPSMAQPxb9mYsKa6gM
         I8MXtYdVlw1qga5sU8YUN/ErMKEC8t23bGlL0GZ8fXWobmNTb33ziL9LtanKu0G7V00U
         iE5/iCAe0Y0Vf0Pnn4i0TeXeppPhNAGkucA9H5FfD5Zjt4Uq5wuTZLVfEs+1AKHPBh3b
         dDV4MkbgDFnr1lAo33NdV8XT2N82CTOfjfmHoOc/MHSR2/yaful3EMeTghsETQIxMmM3
         6n0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=yQ0r3JEPTbHZn+LMT8Z9CJuMImSDIliuPX+hKt5umBA=;
        b=bg1TAdm4hqkpSfATQJ4IzMKgAOK8b1yrgYaEoyR7auUNfOKB0TS7wBv5Ztuel3zi+i
         a/DtBq+jvDSAte74LRKzGBouJQ1VqnF/PWtOwB8AE74XqVzL5cTqWf67sse6Hvr4oVhO
         wsh/dNjD4EpO86d62ynLnQnDdudUL10wNP6XN4qJ6CQJquGhz+A8K+yeCdybSIYKf8kv
         4uoNB3qZ2VOMyrObIe6G+4c0nQq8omw7kF1CSi1lap9nzRxxQ0vJ7utzzFGEfYz3+8FZ
         hHbQQx+Wq8lNBiK1lC9tcokiOkUv3SDbYlYkuD7eVKLteQqw1EAzfuPFQGvzN9jQznro
         FHbw==
X-Gm-Message-State: APjAAAV4bXxTfROXwG1TN/inNSkJenO+z3eX607qN8zFLiJ3mnehjXVd
        bR0LXYfaWsrZQmtOR08quBRFlg==
X-Google-Smtp-Source: APXvYqxC01ftH5AI8UmEsJMKwVigymBGMGP/N9tY6/5KtYM8DjpPbeoiqcNzIAs8pYBCqyGeFRKhdA==
X-Received: by 2002:a37:4ece:: with SMTP id c197mr2378046qkb.326.1573309837727;
        Sat, 09 Nov 2019 06:30:37 -0800 (PST)
Received: from skullcanyon ([192.222.193.21])
        by smtp.gmail.com with ESMTPSA id y27sm5522342qtj.49.2019.11.09.06.30.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Nov 2019 06:30:36 -0800 (PST)
Message-ID: <b337206695b55e696ab7648f0e983ec400d2e33b.camel@ndufresne.ca>
Subject: Re: Overlay support in the i.MX7 display
From:   Nicolas Dufresne <nicolas@ndufresne.ca>
To:     Daniel Vetter <daniel@ffwll.ch>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Pekka Paalanen <ppaalanen@gmail.com>, Marek Vasut <marex@denx.de>,
        dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org
Date:   Sat, 09 Nov 2019 09:30:35 -0500
In-Reply-To: <20191104182451.GS10326@phenom.ffwll.local>
References: <20191101084318.GA8428@pendragon.ideasonboard.com>
         <67057f1082886726268f346f49c23051@agner.ch>
         <20191104100947.4e198e72@eldfell.localdomain>
         <20191104125829.GA4913@pendragon.ideasonboard.com>
         <20191104182451.GS10326@phenom.ffwll.local>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.32.4 (3.32.4-1.fc30) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Le lundi 04 novembre 2019 à 19:24 +0100, Daniel Vetter a écrit :
> On Mon, Nov 04, 2019 at 02:58:29PM +0200, Laurent Pinchart wrote:
> > Hello,
> > 
> > On Mon, Nov 04, 2019 at 10:09:47AM +0200, Pekka Paalanen wrote:
> > > On Sun, 03 Nov 2019 19:15:49 +0100 Stefan Agner wrote:
> > > > On 2019-11-01 09:43, Laurent Pinchart wrote:
> > > > > Hello,
> > > > > 
> > > > > I'm looking at the available options to support overlays in the display
> > > > > pipeline of the i.MX7. The LCDIF itself unfortunaltey doesn't support
> > > > > overlays, the feature being implemented in the PXP. A driver for the PXP
> > > > > is available but only supports older SoCs whose PXP doesn't support
> > > > > overlays. This driver is implemented as a V4L2 mem2mem driver, which
> > > > > makes support of additional input channels impossible.  
> > > > 
> > > > Thanks for bringing this up, it is a topic I have wondered too:
> > > > Interaction between PXP and mxsfb.
> > > > 
> > > > I am not very familiar with the V4L2 subsystem so take my opinions with
> > > > a grain of salt.
> > > > 
> > > > > Here are the options I can envision:
> > > > > 
> > > > > - Extend the existing PXP driver to support multiple channels. This is
> > > > >   technically feasible, but will require moving away from the V4L2
> > > > >   mem2mem framework, which would break userspace. I don't think this
> > > > >   path could lead anywhere.
> > > > > 
> > > > > - Write a new PXP driver for the i.MX7, still using V4L2, but with
> > > > >   multiple video nodes. This would allow blending multiple layers, but
> > > > >   would require writing the output to memory, while the PXP has support
> > > > >   for direct connections to the LCDIF (through small SRAM buffers).
> > > > >   Performances would thus be suboptimal. The API would also be awkward,
> > > > >   as using the PXP for display would require usage of V4L2 in
> > > > >   applications.  
> > > > 
> > > > So the video nodes would be sinks? I would expect overlays to be usable
> > > > through KMS, I guess that would then not work, correct?
> > 
> > There would be sink video nodes for the PXP inputs, and one source video
> > node for the PXP output. The PXP can be used stand-alone, in
> > memory-to-memory mode, and V4L2 is a good fit for that.
> > 
> > > > > - Extend the mxsfb driver with PXP support, and expose the PXP inputs as
> > > > >   KMS planes. The PXP would only be used when available, and would be
> > > > >   transparent to applications. This would however prevent using it
> > > > >   separately from the display (to perform multi-pass alpha blending for
> > > > >   instance).  
> > > > 
> > > > KMS planes are well defined and are well integrated with the KMS API, so
> > > > I prefer this option. But is this compatible with the currently
> > > > supported video use-case? E.g. could we make PXP available through V4L2
> > > > and through DRM/mxsfb?
> > 
> > That's the issue, it's not easily doable. I think we could do so, but
> > how to ensure mutual exclusion between the two APIs needs to be
> > researched. I fear it will result in an awkward solution with fuzzy
> > semantics. A module parameter could be an option, but wouldn't be very
> > flexible.
> > 
> > > > Not sure what your use case is exactly, but when playing a video I
> > > > wonder where is the higher value using PXP: Color conversion and scaling
> > > > or compositing...? I would expect higher value in the former use case.
> > 
> > I think it's highly use-case-dependent.
> > 
> > > mind, with Wayland architecture, color conversion and scaling could be
> > > at the same level/step as compositing, in the display server instead of
> > > an application. Hence if the PXP capabilities were advertised as KMS
> > > planes, there should be nothing to patch in Wayland-designed
> > > applications to make use of them, assuming the applications did not
> > > already rely on V4L2 M2M devices.
> > > 
> > > Would it not be possible to expose PXP through both uAPI interfaces? At
> > > least KMS atomic's TEST_ONLY feature would make it easy to say "no" to
> > > userspace if another bit of userspace already reserved the device via
> > > e.g. V4L2.
> > 
> > We would also need to figure out how to do it the other way around,
> > reporting properly through V4L2 that the device is busy. I think it's
> > feasible, but I doubt it would result in anything usable for userspace.
> > If the KMS device exposes multiple planes unconditionally and fails the
> > atomic commit if the PXP is used through V4L2, I think it would be hard
> > for Wayland to use this consistently. Given that I expect the PXP to be
> > mostly used for display purpose I'm tempted to allocate it for display
> > unconditionally, or, possibly, decide how to expose it through a module
> > parameter.
> 
> KMS should be fine if planes are missing, userspace is supposed to be able
> to cope with that. Not all userspace does, but welp.
>  
> I figured the bigger issue will be on the v4l side, since "device
> temporarily gone" is not something v4l understands as a concept?

m2m are different, since each time you open the device you get a new
instance. This is handled for decoders already in userspace, I really
don't see the difference. I'm guessing application that wants to
multiplex the PXP, will have to avoid the PXP planes for this HW, this
might be a little tricky and seems HW specific.

> 
> But even then having one device for userspace would be best I think, just
> a lot more reasonable (insert wish for unified video/display subsystem
> here).
> 
> > We have a similar situation on Renesas R-Car Gen3 platforms, with a
> > memory-to-memory compositor called VSP. Some VSP instances are connected
> > to the display controller, and we allocate them for display
> > unconditionally. Other VSP instances are exposed as V4L2 devices. We
> > haven't heard of anyone who wanted to use the display VSP instances for
> > unrelated purposes. If such a use case arose, exposing those instances
> > through V4L2 would just be a matter of flipping one bit in the driver
> > (all the infrastructure is in place), which we would likely expose as a
> > module parameter.
> 
> Hm yeah I guess we could just assign them, if the use-cases are clear-cut
> enough. Are you thinking of doing these links with dt (so at least it
> would be patchable)?
> -Daniel

