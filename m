Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E9BF7F5F7C
	for <lists+linux-media@lfdr.de>; Sat,  9 Nov 2019 15:18:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726545AbfKIOS2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 9 Nov 2019 09:18:28 -0500
Received: from mail-qv1-f46.google.com ([209.85.219.46]:45331 "EHLO
        mail-qv1-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726405AbfKIOS1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 9 Nov 2019 09:18:27 -0500
Received: by mail-qv1-f46.google.com with SMTP id g12so3324470qvy.12
        for <linux-media@vger.kernel.org>; Sat, 09 Nov 2019 06:18:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20150623.gappssmtp.com; s=20150623;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=ng53qPLNs5kHgfs4uey3AtSUtfr+RGwf85rqHKv2lzw=;
        b=DPW0dTJUGUzkE9oPjW0Rc+otzF+87DSY5ltFGz/2OSFCurB+UH+Ul29jBmkzqFTa7B
         yCQy/EFRlQX6MNQuco11mMR9olSy1qv8Dwtp6CJxcPeV/+3rrEE1uMRzU8tOwWBjNAxY
         yREXYNQZDl96Oua/RUj9S5SdbF1C7f+zfM29KmdPn+8O7ReKdnou6nZXKVOFSKsm3SwJ
         OzncDN+wLRuFr51ubDueBf0hwXVCN0LOP0JErgHjSvySHGzlFi5IuIwiOEaugDJH6069
         8hYM0FSVJkcc4wtnfQLFZJhZnMAeKT6vgSKwATxpD7UieGn1TCo3BNhrwI1kAkArUFsK
         Y0Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=ng53qPLNs5kHgfs4uey3AtSUtfr+RGwf85rqHKv2lzw=;
        b=KSHSS3JxXqi1w1uIAwhW+WOBMTBTrFsoYUmSP8pdbTS/dWnHQ8sZ/1DsDEHJB6Ukpu
         P2qJow4mc7J5pa99gXXvHM5hTikSCFCV6/FD4GI7RGKATvdq20mG1udVdiYWPb+uXsPk
         Cxiz1IFyiyX6QRee0KVw1KJCrxbgHJ5y0VdOBqo5nUXhN5+FlqA8r0pllknuOhGxDU0V
         sKpjd1rThUO3QCfoCl9kv0ymXBrtXfIkEVEaaycaPu0zUcbF6u8t4Gotg0vgzXQn6r0G
         sKif7HOxxP1VGOq3LZopDgXVRpwJslR/jyMM3tVDrWNsNcHJ1w0ZQ5FPYeJlmyR+Zrmq
         pNeA==
X-Gm-Message-State: APjAAAUTuN6Z6z1silSJJ68ZTYj2pPfrZClRHaC2kIrurYe2bH9bg5r6
        dJRmWfnQxjDhXQQWlQYny1YfVA==
X-Google-Smtp-Source: APXvYqz8X8jV8NSwC/puYzOueVgLBZtpBZacvKCplg3EpDC+DGLkqoSeOMkbTj1mXraWyuEDzqSw/w==
X-Received: by 2002:a05:6214:11f2:: with SMTP id e18mr15775725qvu.86.1573309106651;
        Sat, 09 Nov 2019 06:18:26 -0800 (PST)
Received: from skullcanyon ([192.222.193.21])
        by smtp.gmail.com with ESMTPSA id 7sm4226879qkf.67.2019.11.09.06.18.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Nov 2019 06:18:25 -0800 (PST)
Message-ID: <d7c8c26b2f941b455f9da9f5abc2f96693286f6e.camel@ndufresne.ca>
Subject: Re: Overlay support in the i.MX7 display
From:   Nicolas Dufresne <nicolas@ndufresne.ca>
To:     Pekka Paalanen <ppaalanen@gmail.com>,
        Stefan Agner <stefan@agner.ch>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Marek Vasut <marex@denx.de>, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org
Date:   Sat, 09 Nov 2019 09:18:24 -0500
In-Reply-To: <20191104100947.4e198e72@eldfell.localdomain>
References: <20191101084318.GA8428@pendragon.ideasonboard.com>
         <67057f1082886726268f346f49c23051@agner.ch>
         <20191104100947.4e198e72@eldfell.localdomain>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.32.4 (3.32.4-1.fc30) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Le lundi 04 novembre 2019 à 10:09 +0200, Pekka Paalanen a écrit :
> On Sun, 03 Nov 2019 19:15:49 +0100
> Stefan Agner <stefan@agner.ch> wrote:
> 
> > Hi Laurent,
> > 
> > On 2019-11-01 09:43, Laurent Pinchart wrote:
> > > Hello,
> > > 
> > > I'm looking at the available options to support overlays in the display
> > > pipeline of the i.MX7. The LCDIF itself unfortunaltey doesn't support
> > > overlays, the feature being implemented in the PXP. A driver for the PXP
> > > is available but only supports older SoCs whose PXP doesn't support
> > > overlays. This driver is implemented as a V4L2 mem2mem driver, which
> > > makes support of additional input channels impossible.  
> > 
> > Thanks for bringing this up, it is a topic I have wondered too:
> > Interaction between PXP and mxsfb.
> > 
> > I am not very familiar with the V4L2 subsystem so take my opinions with
> > a grain of salt.
> > 
> > > Here are the options I can envision:
> > > 
> > > - Extend the existing PXP driver to support multiple channels. This is
> > >   technically feasible, but will require moving away from the V4L2
> > >   mem2mem framework, which would break userspace. I don't think this
> > >   path could lead anywhere.
> > > 
> > > - Write a new PXP driver for the i.MX7, still using V4L2, but with
> > >   multiple video nodes. This would allow blending multiple layers, but
> > >   would require writing the output to memory, while the PXP has support
> > >   for direct connections to the LCDIF (through small SRAM buffers).
> > >   Performances would thus be suboptimal. The API would also be awkward,
> > >   as using the PXP for display would require usage of V4L2 in
> > >   applications.  
> > 
> > So the video nodes would be sinks? I would expect overlays to be usable
> > through KMS, I guess that would then not work, correct?
> > 
> > > - Extend the mxsfb driver with PXP support, and expose the PXP inputs as
> > >   KMS planes. The PXP would only be used when available, and would be
> > >   transparent to applications. This would however prevent using it
> > >   separately from the display (to perform multi-pass alpha blending for
> > >   instance).  
> > 
> > KMS planes are well defined and are well integrated with the KMS API, so
> > I prefer this option. But is this compatible with the currently
> > supported video use-case? E.g. could we make PXP available through V4L2
> > and through DRM/mxsfb?
> > 
> > Not sure what your use case is exactly, but when playing a video I
> > wonder where is the higher value using PXP: Color conversion and scaling
> > or compositing...? I would expect higher value in the former use case.
> 
> Hi,
> 
> mind, with Wayland architecture, color conversion and scaling could be
> at the same level/step as compositing, in the display server instead of
> an application. Hence if the PXP capabilities were advertised as KMS
> planes, there should be nothing to patch in Wayland-designed
> applications to make use of them, assuming the applications did not
> already rely on V4L2 M2M devices.

The PXP can already be used with GStreamer v4l2convert element, for CSC
and scaling.

> 
> Would it not be possible to expose PXP through both uAPI interfaces? At
> least KMS atomic's TEST_ONLY feature would make it easy to say "no" to
> userspace if another bit of userspace already reserved the device via
> e.g. V4L2.

Same exist for decoders with fixed number of streams/instances I think.

> 
> 
> Thanks,
> pq

