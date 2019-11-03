Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 76A61ED41E
	for <lists+linux-media@lfdr.de>; Sun,  3 Nov 2019 19:15:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727268AbfKCSPw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 3 Nov 2019 13:15:52 -0500
Received: from mail.kmu-office.ch ([178.209.48.109]:35740 "EHLO
        mail.kmu-office.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726719AbfKCSPw (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 3 Nov 2019 13:15:52 -0500
Received: from webmail.kmu-office.ch (unknown [IPv6:2a02:418:6a02::a3])
        by mail.kmu-office.ch (Postfix) with ESMTPSA id 9D73D5C2BE3;
        Sun,  3 Nov 2019 19:15:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim;
        t=1572804950;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=S+/UABCDinadtw63ATNaDHAFZFEIeKGjqQ5seYW2+5Y=;
        b=rkdAdML4+/Vshtn3Z9jw+7BAgb386KpDQ88j5k2dy+hPwteBW0OzFOKJp53xuYqM+8Prel
        dQ03nv0vgmnJRv234NbPdwMew6kIHnRCrb7XmpvjoroZb95pi66AdYxJHlfkcs2V8djAgU
        8r9UFsWDEqOGz8UUKzIGv37FwDQITuA=
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Date:   Sun, 03 Nov 2019 19:15:49 +0100
From:   Stefan Agner <stefan@agner.ch>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Marek Vasut <marex@denx.de>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org
Subject: Re: Overlay support in the i.MX7 display
In-Reply-To: <20191101084318.GA8428@pendragon.ideasonboard.com>
References: <20191101084318.GA8428@pendragon.ideasonboard.com>
Message-ID: <67057f1082886726268f346f49c23051@agner.ch>
X-Sender: stefan@agner.ch
User-Agent: Roundcube Webmail/1.3.9
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On 2019-11-01 09:43, Laurent Pinchart wrote:
> Hello,
> 
> I'm looking at the available options to support overlays in the display
> pipeline of the i.MX7. The LCDIF itself unfortunaltey doesn't support
> overlays, the feature being implemented in the PXP. A driver for the PXP
> is available but only supports older SoCs whose PXP doesn't support
> overlays. This driver is implemented as a V4L2 mem2mem driver, which
> makes support of additional input channels impossible.

Thanks for bringing this up, it is a topic I have wondered too:
Interaction between PXP and mxsfb.

I am not very familiar with the V4L2 subsystem so take my opinions with
a grain of salt.

> 
> Here are the options I can envision:
> 
> - Extend the existing PXP driver to support multiple channels. This is
>   technically feasible, but will require moving away from the V4L2
>   mem2mem framework, which would break userspace. I don't think this
>   path could lead anywhere.
> 
> - Write a new PXP driver for the i.MX7, still using V4L2, but with
>   multiple video nodes. This would allow blending multiple layers, but
>   would require writing the output to memory, while the PXP has support
>   for direct connections to the LCDIF (through small SRAM buffers).
>   Performances would thus be suboptimal. The API would also be awkward,
>   as using the PXP for display would require usage of V4L2 in
>   applications.

So the video nodes would be sinks? I would expect overlays to be usable
through KMS, I guess that would then not work, correct?

> 
> - Extend the mxsfb driver with PXP support, and expose the PXP inputs as
>   KMS planes. The PXP would only be used when available, and would be
>   transparent to applications. This would however prevent using it
>   separately from the display (to perform multi-pass alpha blending for
>   instance).

KMS planes are well defined and are well integrated with the KMS API, so
I prefer this option. But is this compatible with the currently
supported video use-case? E.g. could we make PXP available through V4L2
and through DRM/mxsfb?

Not sure what your use case is exactly, but when playing a video I
wonder where is the higher value using PXP: Color conversion and scaling
or compositing...? I would expect higher value in the former use case.

> 
> What would be the best option going forward ? Would any of you, by any
> chance, have already started work in this area ?

I have not worked in that area, so feel free!

--
Stefan
