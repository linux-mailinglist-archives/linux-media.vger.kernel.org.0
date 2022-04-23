Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F2D1450C7B5
	for <lists+linux-media@lfdr.de>; Sat, 23 Apr 2022 07:51:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233468AbiDWFye (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 23 Apr 2022 01:54:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51728 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231492AbiDWFyd (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 23 Apr 2022 01:54:33 -0400
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8942912AC9
        for <linux-media@vger.kernel.org>; Fri, 22 Apr 2022 22:51:36 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id 36014CE2DB2
        for <linux-media@vger.kernel.org>; Sat, 23 Apr 2022 05:51:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D009C385A5;
        Sat, 23 Apr 2022 05:51:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1650693092;
        bh=5TfSzoM0+C34kFA270DcwrDwiICarNl9PErqjvsvgTo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=U89bcblhhca3nsvoaUke0u7d+3p0CiHD/UB3cZssf5WCzDou/ql9fPVJa83D0hFoD
         qu/IfndpWM8t7fcUzTlixos3bHPGKS4xEdiX2CkhIbCEoup8prGtUy7K43D5Pyaq5U
         wy0E5VQEV2yFpmX8GkqTJTmnKhRZ4nfH06s45e6A=
Date:   Sat, 23 Apr 2022 07:51:27 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Ian Cowan <ian@linux.cowan.aero>
Cc:     Dan Carpenter <dan.carpenter@oracle.com>, clabbe@baylibre.com,
        mchehab@kernel.org, mjpeg-users@lists.sourceforge.net,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH] media: staging: zoran: refactor printk debugging function
Message-ID: <YmOT357wfr3/DqzD@kroah.com>
References: <20220421002316.873109-1-ian@linux.cowan.aero>
 <20220421142153.GA2462@kadam>
 <YmF2mM+Lqv/HOgFl@fedora>
 <20220421155203.GB2462@kadam>
 <YmH3IZhUrvEzZlZU@fedora>
 <YmI4yh88pYVvVE/X@kroah.com>
 <YmONU1yZ9FATroR9@fedora>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YmONU1yZ9FATroR9@fedora>
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sat, Apr 23, 2022 at 01:23:31AM -0400, Ian Cowan wrote:
> On Fri, Apr 22, 2022 at 07:10:34AM +0200, Greg KH wrote:
> > On Thu, Apr 21, 2022 at 08:30:25PM -0400, Ian Cowan wrote:
> > > On Thu, Apr 21, 2022 at 06:52:04PM +0300, Dan Carpenter wrote:
> > > > On Thu, Apr 21, 2022 at 11:22:00AM -0400, Ian Cowan wrote:
> > > > > 
> > > > > For using the dev_dbg() macro, do you define this in the header file
> > > > > (i.e. for this it would be videocodec.h), or where should this be
> > > > > included from?
> > > > 
> > > > dev_dbg() is defined in include/linux/dev_printk.h.  Look around at how
> > > > it's used.  pr_debug() might be an option, but I don't know if we will
> > > > accept that, we prefer dev_dbg().
> > > > 
> > > > regards,
> > > > dan carpenter
> > > > 
> > > 
> > > I'm about to submit the modified patch, but I went and looked and we
> > > cannot use dev_dbg() because these specific drivers do not have any
> > > association with a device struct.
> > 
> > Then please fix that issue, as there is a real struct device that they
> > are using somewhere.  That is the correct solution as drivers should
> > never use pr_* calls directly.
> > 
> > thanks,
> > 
> > greg k-h
> > 
> 
> I just resubmitted and this time used dev_dbg() (I split the resubmitted
> patch into 4 parts that will work if they are applied in order). There
> were a few places that pr_debug() had to be used (or it can be changed
> back to dprintk()) because they are cleanup functions and do not have
> any devices available at the cleanup. If there is a better way to handle
> that, I will go back and make a modification to that. Other than those 3
> spots, dev_dbg() is being used.

Looks good, nice work!
