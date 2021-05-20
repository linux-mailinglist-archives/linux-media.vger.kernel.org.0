Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7BC5938B028
	for <lists+linux-media@lfdr.de>; Thu, 20 May 2021 15:40:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234535AbhETNlo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 20 May 2021 09:41:44 -0400
Received: from mail.kernel.org ([198.145.29.99]:52798 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232329AbhETNln (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 20 May 2021 09:41:43 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0B40F610A2;
        Thu, 20 May 2021 13:40:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1621518022;
        bh=xmqOMVxzef+0xjadTTR7mxQKx/1uIEM1zXpOv5MSvxI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=NuGwzEFkniCG4IVNoyBNhra2sUWKbpvAooZQfBCtusrY6FLDzEfQVpxn+v4AmcYRC
         Q9e3QtCr3D7Bd6RzguV9yCHIr8iqhUIqZezItM577NJaCiY22XBBGdJ1Hci+9SSgLw
         djcj1URDgOelZs8JTn8abEASUmaXG4FlaNMvKsHpbIjUtnb8A3DnGwEY2crSkSrdx/
         U7VnG1G+JSEua5Y6+YoxORuwZfQYMDYV6nYT74/dU1xz0pJxdHXFJ/RcAgxCIzlSky
         exNg/Ss/cR7XznnF7Zd6lFETo2yc6m8Sc+v8LgbuxdJvEjm1l0eSsUHsg50hZ6VK1k
         2REdnQdhF2AFQ==
Received: from johan by xi.lan with local (Exim 4.94.2)
        (envelope-from <johan@kernel.org>)
        id 1ljiuU-00038U-2B; Thu, 20 May 2021 15:40:22 +0200
Date:   Thu, 20 May 2021 15:40:22 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Sean Young <sean@mess.org>
Cc:     linux-media@vger.kernel.org, linux-usb@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jon Rhees <support@usbuirt.com>,
        Oliver Neukum <oneukum@suse.com>
Subject: Re: [PATCH v3 0/3] IR driver for USB-UIRT device
Message-ID: <YKZmxkmRXYRnTL/o@hovoldconsulting.com>
References: <cover.1620304986.git.sean@mess.org>
 <YJjrkhfN9Sgq6UX8@hovoldconsulting.com>
 <20210511103219.GA13769@gofer.mess.org>
 <YJ5cH1Z5MdZHE8HU@hovoldconsulting.com>
 <20210515092226.GA31801@gofer.mess.org>
 <YKI3vyOE8XmpNAuC@hovoldconsulting.com>
 <20210517103522.GA4644@gofer.mess.org>
 <20210517123509.GA6597@gofer.mess.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210517123509.GA6597@gofer.mess.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, May 17, 2021 at 01:35:09PM +0100, Sean Young wrote:
> On Mon, May 17, 2021 at 11:35:22AM +0100, Sean Young wrote:
> > On Mon, May 17, 2021 at 11:30:39AM +0200, Johan Hovold wrote:

> > > Ok, but apart from BPF that sound like other stuff and not the three
> > > items you list above? Is there anything preventing those items from
> > > being implemented in user space?
> > 
> > Well, after IR is decoded, you want to send decoded scancodes/key codes
> > to any input device, so your remote works just like any input device.
> 
> There is another advantage. IR decoding in userspace involves a lot more
> context switches/scheduling, and it can feel laggy when the cpu is under
> load (e.g. video decoding on the CPU). When you press pause/play/stop or
> so you expect the response the instantatiously. A 100ms delay is noticable.

RT scheduling? Sounds like you should be able to handle this way faster
than 100 ms.

> Alternatively the key-up events get delayed and you end up with multiple
> un-intended button repeats. None of this happens with kernel decoding and
> it feels very snappy.

Yeah, perhaps it's best handled in-kernel, but it seems we should be
able to handle a simple key press within 20 ms or whatever the critical
latency is here using either option (kernel or user-space driver).

Johan
