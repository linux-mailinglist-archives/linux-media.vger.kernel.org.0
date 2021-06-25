Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 20DFD3B3E3F
	for <lists+linux-media@lfdr.de>; Fri, 25 Jun 2021 10:08:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230037AbhFYIKY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 25 Jun 2021 04:10:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55700 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229748AbhFYIKX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 25 Jun 2021 04:10:23 -0400
Received: from gofer.mess.org (gofer.mess.org [IPv6:2a02:8011:d000:212::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 806E7C061574;
        Fri, 25 Jun 2021 01:08:03 -0700 (PDT)
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 5FC1BC6459; Fri, 25 Jun 2021 09:08:00 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mess.org; s=2020;
        t=1624608480; bh=amkY74lh1X/rDudc8tVavuYeXKhobyg9/z/WmVzcVBU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=gElQlNxn6t2aTCOvxeKkYTpnnyE4XJi2e/xw2WVp635+hsphQnGuPAm1/UVS98lu1
         MzMBdj1kclVk7c3AA5Mni74nvkTB+PKv5WvD+s7dksIOH45cezSvDHpUdgrx7enRNE
         IoLRItkZXuHSvDEiGVQO+BpaUmoc4YVIxEq+2WzBRZvsI/Kp0PvnPqEDJlx3kxq8Nq
         LEuCKARnNM+HyLe+K564XDgeLzVPEyABV3x0qW/SDhJG0ffOMQh/hC6cqI3iLCmSZL
         jZowJh52CreDufxz66OSCyh1g+VbgAYyOWBz52jUscuARS4hDSOKCayrFTBBfvbEVx
         lf5tkPOEPFwQw==
Date:   Fri, 25 Jun 2021 09:08:00 +0100
From:   Sean Young <sean@mess.org>
To:     Johan Hovold <johan@kernel.org>
Cc:     Oliver Neukum <oneukum@suse.com>, linux-media@vger.kernel.org,
        linux-usb@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jon Rhees <support@usbuirt.com>
Subject: Re: [PATCH v3 0/3] IR driver for USB-UIRT device
Message-ID: <20210625080800.GA25403@gofer.mess.org>
References: <20210511103219.GA13769@gofer.mess.org>
 <YJ5cH1Z5MdZHE8HU@hovoldconsulting.com>
 <20210515092226.GA31801@gofer.mess.org>
 <YKI3vyOE8XmpNAuC@hovoldconsulting.com>
 <20210517103522.GA4644@gofer.mess.org>
 <YKZktqzkddh3amqX@hovoldconsulting.com>
 <35840cdac1dcb2808e98ebb57afeba352624d15c.camel@suse.com>
 <YNMyvCaZUIDOnSc9@hovoldconsulting.com>
 <20210624091349.GA7476@gofer.mess.org>
 <YNRTSLEHzFKU1KOa@hovoldconsulting.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YNRTSLEHzFKU1KOa@hovoldconsulting.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Jun 24, 2021 at 11:41:28AM +0200, Johan Hovold wrote:
> I'm not, again see above. I'm saying that we should not make one-off
> copies of serial drivers if we can avoid it.
> 
> In this case the limitations of lircd and the lack of hotplugging in
> serdev may be a sufficient reason for making an exception. As we've
> already discussed.

Great, thanks very much. I totally agree a serdev solution would be
preferable.

In that case, can have your Signed-off-by for the ftdi_sio.c change, or
could this be merged through the usb tree please?

Thanks

Sean
