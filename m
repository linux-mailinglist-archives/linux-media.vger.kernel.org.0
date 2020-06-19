Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 167772017E2
	for <lists+linux-media@lfdr.de>; Fri, 19 Jun 2020 18:47:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404500AbgFSQol (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 19 Jun 2020 12:44:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388435AbgFSOnE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 19 Jun 2020 10:43:04 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9FA2C06174E
        for <linux-media@vger.kernel.org>; Fri, 19 Jun 2020 07:43:04 -0700 (PDT)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9D3C2552;
        Fri, 19 Jun 2020 16:42:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1592577772;
        bh=HsRAvbQg64jQYgEYRkaSrnPoFrz1Pylf5Xbwoex7BWw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=iCkFEUtJU4hkkyL7Qm3HUtAReAlK+VjBqpRDN+zzMPD1EprBPceHUDPLtpH7aczg/
         z6hbw19EtLFCoqlbw3OjCJw4PCdwHmjATUzr5GvrHhdu4JjcfN7HGG3PjEw+6MXLQw
         AC+be0WkGYhL6tV48455LgySTqhT/RKQBxSP+obk=
Date:   Fri, 19 Jun 2020 17:42:29 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Ezequiel Garcia <ezequiel@collabora.com>
Cc:     kieran.bingham@ideasonboard.com,
        Ariel D'Alessandro <ariel@vanguardiasur.com.ar>,
        linux-media@vger.kernel.org, hverkuil@xs4all.nl, sean@mess.org,
        p.zabel@pengutronix.de, nicolas@ndufresne.ca,
        gjasny@googlemail.com,
        nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Xavier Claessens <xavier.claessens@collabora.com>
Subject: Re: [PATCH v1 1/1] Add support for meson building
Message-ID: <20200619144229.GD5823@pendragon.ideasonboard.com>
References: <20200618133303.28676-1-ariel@vanguardiasur.com.ar>
 <20200618133303.28676-2-ariel@vanguardiasur.com.ar>
 <d09caaf6-402f-ba57-825c-410ce39a5e2b@ideasonboard.com>
 <f2bf8846e265024c20a77fa618d54455b3b7ca95.camel@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <f2bf8846e265024c20a77fa618d54455b3b7ca95.camel@collabora.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Ezequiel,

On Fri, Jun 19, 2020 at 11:12:58AM -0300, Ezequiel Garcia wrote:
> +Xavier, Nicolas
> 
> On Thu, 2020-06-18 at 14:57 +0100, Kieran Bingham wrote:
> > Hi Ariel,
> > 
> > Wow there's a lot of work there! That must have taken quite some effort
> > between you and Ezequiel!
> > 
> 
> (: I don't remember having done much, so all kudos must go to Ariel.
>  
> > I've looked through, and about the only thing that stands out to me is
> > the way you're joining strings.
> > 
> > Meson provides a join_paths() function specifically for that.
> > Now we're "probably" not going to build this library on anything other
> > than linux, but I think the function still has merit over the arbitrary
> > strings which I mis-interpreted for 'divide' at first glance :S
> > 
> > Other than that, I expect we will have to run both build systems in
> > parallel for some time to allow packaging and other builders to adapt.
> > That might mean it's a bit more difficult to make sure both build
> > systems are updated when adding new files or changing the build in anyway.
> 
> Why?
> 
> Is it too naive to expect that's it's safe to just turn the flip on meson,
> and remove autotools?
> 
> Everyone doing packaging is already aware and used to meson.

If we add meson as an option and keep autotools supported in parallel,
there's a high change packagers won't notice, so it won't help much. I'd
recommend reaching out to known packagers (major distros, buildroot,
...) to let them know of the move. If any of them requests to have time
to adapt, then we could support both build systems in parallel.
Otherwise, I'd just flip the switch.

-- 
Regards,

Laurent Pinchart
