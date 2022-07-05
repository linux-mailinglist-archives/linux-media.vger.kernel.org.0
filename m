Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D2B9656715B
	for <lists+linux-media@lfdr.de>; Tue,  5 Jul 2022 16:42:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229532AbiGEOmf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 5 Jul 2022 10:42:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38788 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229488AbiGEOmX (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 5 Jul 2022 10:42:23 -0400
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 838A65FF8
        for <linux-media@vger.kernel.org>; Tue,  5 Jul 2022 07:42:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1657032141; x=1688568141;
  h=subject:from:to:cc:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=wHrbftVPCxrnN1Dvsq0AnzejJKaWWpchpyr6uWQGqSA=;
  b=kLneiYH66vm4LqkXaZDtZ1bly2x/Dcusrs6EV7virOKkyKOIeslH4mQJ
   g2cwQqdpXbVkt6cJ4b3o5ooMhw24eCKEafprtnkqPzviho0ntaWnSY7bL
   HARYIn7V9AquECRYtMXodC/JFyX5LpHtuIdnx1cVXWcZRuIS4HayyHg9S
   aWzkvOih/hy74X+m5vE4DrXK0sP4S+toEoOK2CoWKogNk3AksZB4FlgrJ
   LURx4AhPMFrKDxx+1CEhEOs5D5v84y+q1zL39MTtjPNMCvbMg17SK+apf
   INUB16Lt2iHr5w3+UNjpo7bavnnhg1DnW85fpEassoDTvG1vQ9pFrRznx
   A==;
X-IronPort-AV: E=Sophos;i="5.92,247,1650924000"; 
   d="scan'208";a="24867575"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 05 Jul 2022 16:42:19 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Tue, 05 Jul 2022 16:42:19 +0200
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Tue, 05 Jul 2022 16:42:19 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1657032139; x=1688568139;
  h=from:to:cc:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding:subject;
  bh=wHrbftVPCxrnN1Dvsq0AnzejJKaWWpchpyr6uWQGqSA=;
  b=MaJoFpH00hVcnEySh+sIU4DJ8yT8tFxu01wzXgcGkxNZFkfBiuYobb4/
   e4EWPSa83/8UmOHqpDZkK4gN3tCMql7Bb5+Lurt/luHFNIzn5b30fZysq
   GDa0GtEOHV69FS3FhCYkJL+tMc91Iy9ZVzxZPmzpoZInaU4dNv8IGrjE0
   /nhxSXD3nFHlGvfJdMhqdr52Uh+0BhGD8IL9WoOfH1ySuHt3yBXdDhUOb
   Ia3fNJP1kYkLY1owhfarMEBYnTgb0DaTsgfZWSe1KkzVA+gz0Um3nqfxs
   8I9CE4GbPGQwLb86QSwiwRkgHWSjhMJFz0uEqrSmvqTWY7RkG3rBljyYv
   g==;
X-IronPort-AV: E=Sophos;i="5.92,247,1650924000"; 
   d="scan'208";a="24867574"
Subject: Re: Re: hooking Sony 47MPixel sensor to NXP imx8m-mini MIPI CSI2
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 05 Jul 2022 16:42:19 +0200
Received: from steina-w.localnet (unknown [10.123.49.12])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 5E163280071;
        Tue,  5 Jul 2022 16:42:19 +0200 (CEST)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     Petko Manolov <petko.manolov@konsulko.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org, jacopo@jmondi.org
Date:   Tue, 05 Jul 2022 16:42:16 +0200
Message-ID: <12352558.O9o76ZdvQC@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <YsQHwUCLlombAj85@p310.k.g>
References: <YrwFf7Jw2/yDlcDq@carbon.lan> <Yr38wcjA24QkZSRQ@pendragon.ideasonboard.com> <YsQHwUCLlombAj85@p310.k.g>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Petko,

Am Dienstag, 5. Juli 2022, 11:43:29 CEST schrieb Petko Manolov:
> On 22-06-30 22:42:57, Laurent Pinchart wrote:
> > On Thu, Jun 30, 2022 at 09:52:05PM +0300, Petko Manolov wrote:
> > > On 22-06-30 03:50:55, Laurent Pinchart wrote:
> > > > For an i.MX8MM I'd try running the mainline kernel directly. If that
> > > > doesn't work, I would backport the camera drivers from mainline to
> > > > the v5.15 NXP kernel. As far as I know, the v5.18 branch isn't an
> > > > official BSP release (I'm actually not sure what it's for).
> > > 
> > > The 5.15 NXP kernel got released sometime in June, but the CSI capture
> > > drivers are pretty much the same as in their older versions.  So sad...
> > > 
> > > Nevermind, i'll share any good news here as well as the imx492 driver
> > > code as soon i am certain it can successfully stream in at least one
> > > mode.
> > > 
> > > BTW, the 'fec' section in Variscite's var-som-symphony DT is broken for
> > > v5.18 (mainline) kernels. I am not certain whom should i send the
> > > patch.  Would that be Rob Herring or should i just use 'git blame' to
> > > identify the victim? :)> 
> > scripts/get_maintainer.pl is your friend for that.
> 
> Done, sent a patch for review to lkml and Rob.

Do you have a link for the mailing list archive? I failed to find the patch. I 
just want to check how things are done compared to other sensors.

Best reagrds,
Alexander



