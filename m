Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 29FCE377DC3
	for <lists+linux-media@lfdr.de>; Mon, 10 May 2021 10:15:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230215AbhEJIQR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 10 May 2021 04:16:17 -0400
Received: from mail.kernel.org ([198.145.29.99]:49134 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230045AbhEJIQQ (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 10 May 2021 04:16:16 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 109096108B;
        Mon, 10 May 2021 08:15:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1620634512;
        bh=L8elJ69iynnTYAvCMM9JNNeRWaANDd/PDWsBDi7Yvmk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=SzTKdVWH4ueMeLmbk6HLGvq4cgQnoV+ogJbraw+6DfAJF+f576zJcD3Ro7TL1aQbM
         fNP5ojNCQoY9E3InqGSW6fU+Rsso1c9V9zA2588YYsL7Emrck5xGAcK5S1O9Hd/z/6
         UT9iMoyfKuY2+qDomVPN9RlvUUJOAG7l6YhfoMO159G6Sdk5ZwnwyMDrl/SejJIWPd
         oYBO4A3DazPGE+lD+gQwGGNflfs3w7rbd1YwBZ2sPTHhCJt9+gZO5og4qBO+gsrQF6
         SHHWmVL8sKfaDDV2BKoti4jL9miJRhBG6+R8+WYTEAjSWQyMVfeQU3v1CApHqsKvE6
         SKseYv3iXTg8A==
Received: from johan by xi.lan with local (Exim 4.94.2)
        (envelope-from <johan@kernel.org>)
        id 1lg14M-0000Nu-S7; Mon, 10 May 2021 10:15:14 +0200
Date:   Mon, 10 May 2021 10:15:14 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Sean Young <sean@mess.org>
Cc:     linux-media@vger.kernel.org, linux-usb@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jon Rhees <support@usbuirt.com>,
        Oliver Neukum <oneukum@suse.com>
Subject: Re: [PATCH v3 0/3] IR driver for USB-UIRT device
Message-ID: <YJjrkhfN9Sgq6UX8@hovoldconsulting.com>
References: <cover.1620304986.git.sean@mess.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1620304986.git.sean@mess.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, May 06, 2021 at 01:44:52PM +0100, Sean Young wrote:
> This is a new rc-core driver for the USB-UIRT which you can see here
> http://www.usbuirt.com/
> 
> This device is supported in lirc, via the usb serial kernel driver. This
> driver is both for rc-core, which means it can use kernel/BPF decoding
> ec. Also this implement is superior because it can:
>  - support learning mode
>  - setting transmit carrier
>  - larger transmits using streaming tx command

This looks like something which should have been implemented as a
line-discipline or serdev driver instead of reimplementing a minimal
on-off ftdi driver and tying it closely to the RC subsystem.

Why can't you just add support for the above features to whatever
subsystem is managing this device today?

Serdev still doesn't support hotplugging unfortunately so that route may
take a bit more work.

Johan
