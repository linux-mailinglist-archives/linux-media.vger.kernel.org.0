Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5C75129F240
	for <lists+linux-media@lfdr.de>; Thu, 29 Oct 2020 17:53:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727864AbgJ2Qxi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 29 Oct 2020 12:53:38 -0400
Received: from retiisi.eu ([95.216.213.190]:60702 "EHLO hillosipuli.retiisi.eu"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727863AbgJ2Qx1 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 29 Oct 2020 12:53:27 -0400
Received: from valkosipuli.localdomain (valkosipuli.retiisi.org.uk [IPv6:2a01:4f9:c010:4572::80:2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 806BE634C87;
        Thu, 29 Oct 2020 18:52:44 +0200 (EET)
Received: from sailus by valkosipuli.localdomain with local (Exim 4.92)
        (envelope-from <sakari.ailus@retiisi.org.uk>)
        id 1kYBAL-0001vm-N1; Thu, 29 Oct 2020 18:52:45 +0200
Date:   Thu, 29 Oct 2020 18:52:45 +0200
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Sowjanya Komatineni <skomatineni@nvidia.com>
Cc:     Hans Verkuil <hverkuil@xs4all.nl>,
        Thierry Reding <treding@nvidia.com>,
        linux-media@vger.kernel.org
Subject: Re: Suggestion regarding x8 gang mode device tree changes
Message-ID: <20201029165245.GB6899@valkosipuli.retiisi.org.uk>
References: <e253fee3-5358-aaf1-d317-162dc8e98afc@nvidia.com>
 <20201029145013.GA6899@valkosipuli.retiisi.org.uk>
 <59f91ac7-84fc-a9fd-e331-35adf4e5f5b9@nvidia.com>
 <2ac2eb3d-32df-a352-3ce5-918ddbf718af@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2ac2eb3d-32df-a352-3ce5-918ddbf718af@nvidia.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Oct 29, 2020 at 09:49:57AM -0700, Sowjanya Komatineni wrote:
> 
> On 10/29/20 8:36 AM, Sowjanya Komatineni wrote:
> > 
> > On 10/29/20 7:50 AM, Sakari Ailus wrote:
> > > Hi Sowjanya,
> > > 
> > > On Wed, Oct 28, 2020 at 06:48:59PM -0700, Sowjanya Komatineni wrote:
> > > > Hi Sakari,
> > > > 
> > > > Missed to add you to below patch series for HDMI2CSI bridge support
> > > > 
> > > > https://patchwork.kernel.org/project/linux-media/cover/1603768763-25590-1-git-send-email-skomatineni@nvidia.com/
> > > > 
> > > > 
> > > > Patch-10 of this series is for x8 capture from HDMI2CSI bridge.
> > > > 
> > > > Would like to get your suggestion on x8 gang/combined ports capture
> > > > implementation.
> > > The majority of CSI-2 receiver devices support partitioning the
> > > lanes among
> > > different PHYs in various ways. They do support usually up to four
> > > lanes,
> > > but adding four more lanes is not a reason for making the API different.
> > > 
> > > So instead, you should implement this as a single port that simply has 8
> > > lanes.
> > > 
> > Thanks Sakari for your reply.
> > 
> > current v2 series treats as 8 lanes. You mean to not expose 2nd port in
> > device tree as VI/CSI side takes care of 2nd port as combined to treat
> > as 8 lane?

Correct.

Although you can have the second port connected if fewer lanes are assigned
to the first one.

How does it work for this device, are the lanes statically allocated to
ports, apart from the special 8 lane mode?

> 
> AS csi2 bus type supports max 4 data lanes with endpoint parse API.
> 
> Currently with x8 as single port, I am using bus-width with bus type as
> parallel in device tree and when using x4 using data-lanes with csi2 bus
> type and driver gets lanes based on either of this from DT.
> 
> Instead should we update endpoint parse API for max up to 8 lanes for
> data-lanes?

Yes, please. Could you send a patch?

The standard AFAIK supports up to four lanes but as we know, hardware
sometimes has more than that.

-- 
Sakari Ailus
