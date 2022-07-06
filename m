Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A8BFC567E46
	for <lists+linux-media@lfdr.de>; Wed,  6 Jul 2022 08:18:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229986AbiGFGSe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 6 Jul 2022 02:18:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52042 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229640AbiGFGSa (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 6 Jul 2022 02:18:30 -0400
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 03EDA11A35
        for <linux-media@vger.kernel.org>; Tue,  5 Jul 2022 23:18:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1657088308; x=1688624308;
  h=subject:from:to:cc:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=zl9WTUPpocSW5wjYJ+5tX8Q9Y65dt2HH124yho9YzgI=;
  b=F5HHt4EWuCbueCRbP4WrPGZ0VDcXdup1Xtp4etZqZIBTP7+3Nw4AjWzl
   BrvFpAlj/mF2VEzMUBcjJEcNwJMjkglGy05n6quoe9u0HfVbHs0VPr1DI
   ZtSDOhFbqsvt9FahEyzriYd7ksjvuL+JT8h49uX2Wukfh9JMSJetS8Zbv
   /aiuHfj3txx1mw6U1Tx2iEGwYzQOSrFvpExEFw/W4x4E96KHczImaVXVu
   1cugQHgcrbmueDrBZXzEgc5Q+EKLwHZ+AO7fit47AVfJ0sbk7agN9noou
   dUSCaTovkFRJBlKx1uZmjaMRoGM2osneBeEdmxEzNxroBIJMSI5YEOIoo
   w==;
X-IronPort-AV: E=Sophos;i="5.92,249,1650924000"; 
   d="scan'208";a="24877366"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 06 Jul 2022 08:18:24 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Wed, 06 Jul 2022 08:18:25 +0200
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Wed, 06 Jul 2022 08:18:25 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1657088305; x=1688624305;
  h=from:to:cc:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding:subject;
  bh=zl9WTUPpocSW5wjYJ+5tX8Q9Y65dt2HH124yho9YzgI=;
  b=YInAojig+Hs7TYSw3vgp0Z7kNJe794U/DXlYxXSYO4zCmJYhM03et8Cm
   3qnk+StGERXS0/zUR8DNx5cQqTwDgFUmPPPBRTi+OCnyMTMdiDhntJby0
   gDbzpOmKO65NgbkMK+wfYh3RjApebxuC0qDW6nWxw6/WsC8UVQZFyiBli
   CEGQMEgpqimWYF0zUqsb+CzPEZ2YVUB3KbB/dFlqLiY0srxmJhgNS9dUt
   NHDzmaGdwQ3slepqH+Y/rqYBM8c5nEQyUrBG+mgEnvrAnlnubuEJ75N/l
   jZUDHBRFIr0YlfCwJt9MzD/FSxxgT6d8o7EoSV/TwVqWn4t2ij0XeCa7U
   Q==;
X-IronPort-AV: E=Sophos;i="5.92,249,1650924000"; 
   d="scan'208";a="24877363"
Subject: Re: Re: Re: hooking Sony 47MPixel sensor to NXP imx8m-mini MIPI CSI2
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 06 Jul 2022 08:18:23 +0200
Received: from steina-w.localnet (unknown [10.123.49.12])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 05D55280071;
        Wed,  6 Jul 2022 08:18:22 +0200 (CEST)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     Petko Manolov <petko.manolov@konsulko.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org, jacopo@jmondi.org
Date:   Wed, 06 Jul 2022 08:18:20 +0200
Message-ID: <2450654.irdbgypaU6@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <YsRVAV8a48CwpaSY@p310.k.g>
References: <YrwFf7Jw2/yDlcDq@carbon.lan> <12352558.O9o76ZdvQC@steina-w> <YsRVAV8a48CwpaSY@p310.k.g>
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

Am Dienstag, 5. Juli 2022, 17:13:05 CEST schrieb Petko Manolov:
> On 22-07-05 16:42:16, Alexander Stein wrote:
> > Hi Petko,
> > 
> > Am Dienstag, 5. Juli 2022, 11:43:29 CEST schrieb Petko Manolov:
> > > On 22-06-30 22:42:57, Laurent Pinchart wrote:
> > > > On Thu, Jun 30, 2022 at 09:52:05PM +0300, Petko Manolov wrote:
> > > > > On 22-06-30 03:50:55, Laurent Pinchart wrote:
> > > > > > For an i.MX8MM I'd try running the mainline kernel directly. If
> > > > > > that
> > > > > > doesn't work, I would backport the camera drivers from mainline to
> > > > > > the
> > > > > > v5.15 NXP kernel. As far as I know, the v5.18 branch isn't an
> > > > > > official
> > > > > > BSP release (I'm actually not sure what it's for).
> > > > > 
> > > > > The 5.15 NXP kernel got released sometime in June, but the CSI
> > > > > capture
> > > > > drivers are pretty much the same as in their older versions.  So
> > > > > sad...
> > > > > 
> > > > > Nevermind, i'll share any good news here as well as the imx492
> > > > > driver
> > > > > code as soon i am certain it can successfully stream in at least one
> > > > > mode.
> > > > > 
> > > > > BTW, the 'fec' section in Variscite's var-som-symphony DT is broken
> > > > > for
> > > > > v5.18 (mainline) kernels. I am not certain whom should i send the
> > > > > patch.
> > > > > Would that be Rob Herring or should i just use 'git blame' to
> > > > > identify
> > > > > the victim? :)>
> > > > 
> > > > scripts/get_maintainer.pl is your friend for that.
> > > 
> > > Done, sent a patch for review to lkml and Rob.
> > 
> > Do you have a link for the mailing list archive? I failed to find the
> > patch. I just want to check how things are done compared to other
> > sensors.
> 
> There you go.
> 
> The driver is neither interesting nor complex.  It seems, however, that
> getting this to run on imx8m-mini will require either other tools than
> plain v4l2-ctl or i am missing something here.
> 
> I wonder if i have to play with media-ctl and connect all the dots between
> the Sony sensor, to mipi-csi bridge to the imx7-capture (or whatever the
> damn name is) device.

Thanks! Indeed at a first glance it looks straight forward.
I was trying to get an imx327 running on a imx8mm, called TQMa8MxML. See [1] 
for some details. The cover letter describes the config setup. The media-ctl 
commands might help your setup.
Note the settle times are an ugly bitch and are crucial to be set on my board, 
but I'm not sure why they have to be that way.
Patch 1-8 are obsolete by now with the updates to drivers/media/platform/nxp/
imx-mipi-csis.c. Patch 9 might help you configure the DT.

Best regards,
Alexander

[1] https://patchwork.kernel.org/project/linux-media/cover/
20220211142752.779952-1-alexander.stein@ew.tq-group.com/



