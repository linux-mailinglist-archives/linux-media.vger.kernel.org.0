Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F3AA4B3796
	for <lists+linux-media@lfdr.de>; Mon, 16 Sep 2019 11:55:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726872AbfIPJzE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Sep 2019 05:55:04 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:54652 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728163AbfIPJzD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Sep 2019 05:55:03 -0400
Received: from pendragon.ideasonboard.com (unknown [IPv6:2001:8a0:6be4:9301:a728:6099:33:a27c])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1E2F7528;
        Mon, 16 Sep 2019 11:55:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1568627701;
        bh=WaL0YSzlDNICxPzMXSVJ5+GLNuIjXM6NKcYRw/MPgU0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Ekkr2JXlpAMqOvvKmd6Hr6PmXuBsH7kPuCv+Gnr7fKaZ9L3cdhHR+q2w4/xCE+n/b
         ejTTHxpoXS4RiZzwu/gzwVcHO7WWZAJKT3lNG772gUnwn9+BY468CO9m7W/DMHLmGd
         R3VnAZ9CpPSOUD7Lby8THADu48LOzIm92YMqLJ4s=
Date:   Mon, 16 Sep 2019 12:54:51 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Jose Abreu <Jose.Abreu@synopsys.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Angelo Ribeiro <Angelo.Ribeiro@synopsys.com>,
        Joao Pinto <Joao.Pinto@synopsys.com>,
        Alexandre Courbot <acourbot@chromium.org>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Tomasz Figa <tfiga@chromium.org>
Subject: Re: [ANN] Topics for a media summit in Lyon in October
Message-ID: <20190916095451.GA4734@pendragon.ideasonboard.com>
References: <010ba9ce-bac9-6f0c-f128-4f163a7d8ea7@xs4all.nl>
 <BN8PR12MB3266963E3EAA25AC2644942DD38C0@BN8PR12MB3266.namprd12.prod.outlook.com>
 <3d6735ce-d39b-9875-1cfc-0e68fa3a45c6@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <3d6735ce-d39b-9875-1cfc-0e68fa3a45c6@xs4all.nl>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Sep 16, 2019 at 10:48:51AM +0200, Hans Verkuil wrote:
> On 9/16/19 10:40 AM, Jose Abreu wrote:
> > From: Hans Verkuil <hverkuil@xs4all.nl>
> > Date: Aug/16/2019, 09:06:30 (UTC+00:00)
> > 
> >> Rather then discussing topics for a meeting under the subject 'Lisbon'
> >> let's start a new thread referring to the right place :-)
> >>
> >> I will try to organize a room, either during the ELCE or (if that doesn't
> >> work) perhaps on the Thursday afterwards. If that's going to be a problem
> >> for someone, please let me know.
> >>
> >> I do need to know how many people I can expect. I have the following
> >> confirmed attendees (and please reply if you are not listed!):
> > 
> > Hi Hans,
> > 
> > It's been a while, hope you are doing well :)
> > 
> > I'm no longer working in media subsystem but my colleagues Angelo and 
> > Joao would like to attend.
> > 
> > We currently have HDMI and CSI support for our IPs using V4L2 and we 
> > would like to interact with the community in order to get this 
> > up-streamed so that we have as many features supported as possible.
> > 
> > Is it possible ?
> 
> Yes. That said, since this is fairly specific and doesn't fall into any of
> the three discussions that we plan (codecs, libcamera, future developments)
> I think it is more useful if I discuss this separately with Angelo and
> Joao on Monday or Tuesday afternoon.
> 
> I can definitely discuss HDMI support, and probably give a good stab at the
> CSI support (too bad Sakari won't be there).
> 
> How about we get together after Greg KH's keynote on Monday?

I'll try to join as well. I've run into issues in the past with the
development process related to an HDMI IP (but on the DRM/KMS side), and
I'd like to try and avoid the same mistakes here.

-- 
Regards,

Laurent Pinchart
