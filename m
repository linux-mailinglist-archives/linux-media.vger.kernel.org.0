Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E5C87310BB4
	for <lists+linux-media@lfdr.de>; Fri,  5 Feb 2021 14:20:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229841AbhBENSx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 5 Feb 2021 08:18:53 -0500
Received: from vps0.lunn.ch ([185.16.172.187]:50320 "EHLO vps0.lunn.ch"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229772AbhBENNx (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 5 Feb 2021 08:13:53 -0500
Received: from andrew by vps0.lunn.ch with local (Exim 4.94)
        (envelope-from <andrew@lunn.ch>)
        id 1l80v0-004NIN-8L; Fri, 05 Feb 2021 14:13:02 +0100
Date:   Fri, 5 Feb 2021 14:13:02 +0100
From:   Andrew Lunn <andrew@lunn.ch>
To:     Takashi Iwai <tiwai@suse.de>
Cc:     Hans Verkuil <hverkuil@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        "Matwey V. Kornilov" <matwey@sai.msu.ru>,
        Robert Foss <robert.foss@linaro.org>
Subject: Re: [PATCH] media: pwc: Fix the URB buffer allocation
Message-ID: <YB1EXirrstMlg/vA@lunn.ch>
References: <20210121202855.17400-1-tiwai@suse.de>
 <7afd0612-de36-60b1-6650-6f8de24a7145@xs4all.nl>
 <YB0/wTjYqE9IgtXZ@lunn.ch>
 <s5h1rdu4qgo.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <s5h1rdu4qgo.wl-tiwai@suse.de>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Takashi

> Indeed, looks so.  In most cases, this doesn't matter since both point
> to the same device object.  In some cases like xhci-plat HCD, they
> differ.  And sysdev  might be a better choice from the consistency
> POV.
> 
> But this brought an interesting question, too.  eg. USB chipidea
> HCD uses platform devices for both controller and sysdev, and I
> couldn't find any DMA mask setup.  So, no matter what to use, the uwc
> driver would be broken on this...  Maybe it's just not covered.

Did you do a git bisect to see what actually broke it?  "1161db6776bd:
media: usb: pwc: Don't use coherent DMA buffers for ISO transfer"
introduced the code, not the regression. If we understand the
regression, that might give us the answer about chipidea.

	    Andrew
