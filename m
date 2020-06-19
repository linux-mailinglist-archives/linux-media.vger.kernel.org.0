Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 09C0D201A83
	for <lists+linux-media@lfdr.de>; Fri, 19 Jun 2020 20:41:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388730AbgFSSkl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 19 Jun 2020 14:40:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33318 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732927AbgFSSkl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 19 Jun 2020 14:40:41 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 29DCDC06174E
        for <linux-media@vger.kernel.org>; Fri, 19 Jun 2020 11:40:41 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: xclaesse)
        with ESMTPSA id 3AF972A5441
Message-ID: <adbb92de81105575d661f348a9804279a2844d64.camel@collabora.com>
Subject: Re: [PATCH v1 1/1] Add support for meson building
From:   Xavier Claessens <xavier.claessens@collabora.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Ezequiel Garcia <ezequiel@collabora.com>
Cc:     kieran.bingham@ideasonboard.com,
        Ariel D'Alessandro <ariel@vanguardiasur.com.ar>,
        linux-media@vger.kernel.org, hverkuil@xs4all.nl, sean@mess.org,
        p.zabel@pengutronix.de, nicolas@ndufresne.ca,
        gjasny@googlemail.com,
        nicolas Dufresne <nicolas.dufresne@collabora.com>
Date:   Fri, 19 Jun 2020 14:40:29 -0400
In-Reply-To: <20200619144229.GD5823@pendragon.ideasonboard.com>
References: <20200618133303.28676-1-ariel@vanguardiasur.com.ar>
         <20200618133303.28676-2-ariel@vanguardiasur.com.ar>
         <d09caaf6-402f-ba57-825c-410ce39a5e2b@ideasonboard.com>
         <f2bf8846e265024c20a77fa618d54455b3b7ca95.camel@collabora.com>
         <20200619144229.GD5823@pendragon.ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.2-0ubuntu1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

I've been added in this thread without much context, not sure which
project it's speaking about.

> > Is it too naive to expect that's it's safe to just turn the flip on
> > meson,
> > and remove autotools?
> > 
> > Everyone doing packaging is already aware and used to meson.
> 
> If we add meson as an option and keep autotools supported in
> parallel,
> there's a high change packagers won't notice, so it won't help much.
> I'd
> recommend reaching out to known packagers (major distros, buildroot,
> ...) to let them know of the move. If any of them requests to have
> time
> to adapt, then we could support both build systems in parallel.
> Otherwise, I'd just flip the switch.


From past experience, distros tend to find many small issues with build
systems, especially debian who have tones of scripts to verify what
changed in the package: a missing installed file, a missing build
option, missing build flag, etc. You can either deal with that and roll
a quick point release to fix any issue they could find, or keep both
build systems for a couple releases while recommending downstream (a
note in ChangeLog) to try the meson build system, making it clear
autotools is going away.

Regards,
Xavier Claessens.

