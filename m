Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E61743B9F38
	for <lists+linux-media@lfdr.de>; Fri,  2 Jul 2021 12:44:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231575AbhGBKrQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 2 Jul 2021 06:47:16 -0400
Received: from mail.kernel.org ([198.145.29.99]:43530 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231151AbhGBKrQ (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 2 Jul 2021 06:47:16 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id A05B9613C1;
        Fri,  2 Jul 2021 10:44:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1625222684;
        bh=40me/tndtLRUPAPzlY8uMFyl3A5l0EpX80zCT+UJixU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=KpuHK7DgLY6hUa90aOFnRpleVXE9ezoYl0zzTJGFQVSOuwOOkLuZTs6t3PxyIBqHp
         J8Xsy2Yl6cvxb7EcJLzq4BkvV6GAVh+e56EOQPAr2GILCsP/t6C2m5DxSNmC00w2LM
         tcapVrQ3yYZrWUR1gRV80Vp+1CVb7c0oeK2XImxa+0sL6qinPKRhDJ3qSTDO8OkcFZ
         bMFU/BhNQwdHdYY5DnVp9gKsbVuvVKW7PWuvceAdU6S+2QJ5WjXIEu9Be8dNSOPRD/
         OVwItoG79kbCCO9BqaON0nAVWzIrQdyVEVJnItsczbi/KxON5PzGWX30dWD7QDyZmc
         aOfavguM+1oqQ==
Received: from johan by xi.lan with local (Exim 4.94.2)
        (envelope-from <johan@kernel.org>)
        id 1lzGf4-0003Bn-Eg; Fri, 02 Jul 2021 12:44:42 +0200
Date:   Fri, 2 Jul 2021 12:44:42 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Sean Young <sean@mess.org>
Cc:     Oliver Neukum <oneukum@suse.com>, linux-media@vger.kernel.org,
        linux-usb@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jon Rhees <support@usbuirt.com>
Subject: Re: [PATCH v3 0/3] IR driver for USB-UIRT device
Message-ID: <YN7uGoAKTfaqFYTu@hovoldconsulting.com>
References: <YJ5cH1Z5MdZHE8HU@hovoldconsulting.com>
 <20210515092226.GA31801@gofer.mess.org>
 <YKI3vyOE8XmpNAuC@hovoldconsulting.com>
 <20210517103522.GA4644@gofer.mess.org>
 <YKZktqzkddh3amqX@hovoldconsulting.com>
 <35840cdac1dcb2808e98ebb57afeba352624d15c.camel@suse.com>
 <YNMyvCaZUIDOnSc9@hovoldconsulting.com>
 <20210624091349.GA7476@gofer.mess.org>
 <YNRTSLEHzFKU1KOa@hovoldconsulting.com>
 <20210625080800.GA25403@gofer.mess.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210625080800.GA25403@gofer.mess.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Jun 25, 2021 at 09:08:00AM +0100, Sean Young wrote:
> On Thu, Jun 24, 2021 at 11:41:28AM +0200, Johan Hovold wrote:
> > I'm not, again see above. I'm saying that we should not make one-off
> > copies of serial drivers if we can avoid it.
> > 
> > In this case the limitations of lircd and the lack of hotplugging in
> > serdev may be a sufficient reason for making an exception. As we've
> > already discussed.
> 
> Great, thanks very much. I totally agree a serdev solution would be
> preferable.
> 
> In that case, can have your Signed-off-by for the ftdi_sio.c change, or
> could this be merged through the usb tree please?

Sure, I can take the ftdi change (for the current -rc) once the ir
driver hits the media tree.

Johan
