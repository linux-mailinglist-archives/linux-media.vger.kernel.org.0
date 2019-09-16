Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 86A2CB38A3
	for <lists+linux-media@lfdr.de>; Mon, 16 Sep 2019 12:51:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728347AbfIPKvm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Sep 2019 06:51:42 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:57884 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726118AbfIPKvm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Sep 2019 06:51:42 -0400
Received: from pendragon.ideasonboard.com (bl10-204-24.dsl.telepac.pt [85.243.204.24])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 499EAB76;
        Mon, 16 Sep 2019 12:51:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1568631100;
        bh=80OsfFZN84T63mnXQlhn1J5X5AJd+V8XVGjBOuNU1QM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=qL8QcL+nZiTgaLZiVvcq0OhKQ2JgcPD60bOcP/++EOZicDBvZ+N5OHG7p88imF52+
         5wlArjaPrm9yvDSDEfdD3OzN6xfpYTCOJb57tgrlc8nvZPjQjJkYzXbuSfO/zyuV4w
         m0KNNuQ6fBQXbNpbmYBZRj54jp45ivr9cKnVeU8M=
Date:   Mon, 16 Sep 2019 13:51:31 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Angelo Ribeiro <Angelo.Ribeiro@synopsys.com>
Cc:     Hans Verkuil <hverkuil@xs4all.nl>,
        Jose Abreu <Jose.Abreu@synopsys.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Joao Pinto <Joao.Pinto@synopsys.com>,
        Alexandre Courbot <acourbot@chromium.org>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Tomasz Figa <tfiga@chromium.org>
Subject: Re: [ANN] Topics for a media summit in Lyon in October
Message-ID: <20190916105131.GC4734@pendragon.ideasonboard.com>
References: <010ba9ce-bac9-6f0c-f128-4f163a7d8ea7@xs4all.nl>
 <BN8PR12MB3266963E3EAA25AC2644942DD38C0@BN8PR12MB3266.namprd12.prod.outlook.com>
 <3d6735ce-d39b-9875-1cfc-0e68fa3a45c6@xs4all.nl>
 <20190916095451.GA4734@pendragon.ideasonboard.com>
 <SN6PR12MB2814153C981E306E253CD013CB8C0@SN6PR12MB2814.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <SN6PR12MB2814153C981E306E253CD013CB8C0@SN6PR12MB2814.namprd12.prod.outlook.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Angelo,

On Mon, Sep 16, 2019 at 10:39:56AM +0000, Angelo Ribeiro wrote:
> On Mon, Sep 16, 2019 at 10:54:51 Laurent Pinchart wrote:
> > On Mon, Sep 16, 2019 at 10:48:51AM +0200, Hans Verkuil wrote:
> > > On 9/16/19 10:40 AM, Jose Abreu wrote:
> > > > From: Hans Verkuil <hverkuil@xs4all.nl>
> > > > Date: Aug/16/2019, 09:06:30 (UTC+00:00)
> > > > 
> > > >> Rather then discussing topics for a meeting under the subject 'Lisbon'
> > > >> let's start a new thread referring to the right place :-)
> > > >>
> > > >> I will try to organize a room, either during the ELCE or (if that doesn't
> > > >> work) perhaps on the Thursday afterwards. If that's going to be a problem
> > > >> for someone, please let me know.
> > > >>
> > > >> I do need to know how many people I can expect. I have the following
> > > >> confirmed attendees (and please reply if you are not listed!):
> > > > 
> > > > Hi Hans,
> > > > 
> > > > It's been a while, hope you are doing well :)
> > > > 
> > > > I'm no longer working in media subsystem but my colleagues Angelo and 
> > > > Joao would like to attend.
> > > > 
> > > > We currently have HDMI and CSI support for our IPs using V4L2 and we 
> > > > would like to interact with the community in order to get this 
> > > > up-streamed so that we have as many features supported as possible.
> > > > 
> > > > Is it possible ?
> > > 
> > > Yes. That said, since this is fairly specific and doesn't fall into any of
> > > the three discussions that we plan (codecs, libcamera, future developments)
> > > I think it is more useful if I discuss this separately with Angelo and
> > > Joao on Monday or Tuesday afternoon.
> > > 
> > > I can definitely discuss HDMI support, and probably give a good stab at the
> > > CSI support (too bad Sakari won't be there).
> > > 
> > > How about we get together after Greg KH's keynote on Monday?
> > 
> > I'll try to join as well. I've run into issues in the past with the
> > development process related to an HDMI IP (but on the DRM/KMS side), and
> > I'd like to try and avoid the same mistakes here.
> 
> Thanks for the meeting proposal, for me sounds great.
> Currently I'm building a DRM/KMS video pipeline for our HW solution with 
> Synopsys DSI IP, that is supported by the dw-mipi-dsi driver.

Can you share details about the part of the pipeline before the DSI
encoder ? Are there Synopsys IPs there too, or is the DSI encoder
connected to a display controller from the SoC vendor ?

> Also I'm going to support the DesignWare MIPI CSI-2 Host and D-PHY
> that uses V4l2.

-- 
Regards,

Laurent Pinchart
