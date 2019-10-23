Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5CACAE1DFA
	for <lists+linux-media@lfdr.de>; Wed, 23 Oct 2019 16:20:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406380AbfJWOUY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 23 Oct 2019 10:20:24 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:38524 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725852AbfJWOUX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 23 Oct 2019 10:20:23 -0400
Received: from pendragon.ideasonboard.com (143.121.2.93.rev.sfr.net [93.2.121.143])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9248F71F;
        Wed, 23 Oct 2019 16:20:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1571840421;
        bh=ZN4esrfVTSXQCeDtJTnyp/5+MEwfIxLla+K4wvGg9Y0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Vd6gqdYnjc3QUx+9Hm1cEGKJmOsckWahI7KPz4SLSVxEGo74ctV9ftQ80ogqxu16/
         2JcV1EmHfSj63VX7av7VEhuhQz6ZxMSA+Jz91nBGpRLCQBzIQvoiy5XakXF5qGjE86
         vUhZFnzdjAwYRhtVRxFNkhxV2XlSKC3K2IsuOjfQ=
Date:   Wed, 23 Oct 2019 17:20:16 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jean Delvare <jdelvare@suse.de>
Cc:     linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-usb@vger.kernel.org
Subject: Re: Logitech C270 webcam floods the log
Message-ID: <20191023142016.GA1904@pendragon.ideasonboard.com>
References: <20191023151859.30a8ce88@endymion>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20191023151859.30a8ce88@endymion>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jean,

On Wed, Oct 23, 2019 at 03:18:59PM +0200, Jean Delvare wrote:
> Hi all,
> 
> When my Logitech C270 webcam is plugged in, my kernel log gets filled
> with this message:
> 
> usb 3-4.1: reset high-speed USB device number 4 using xhci_hcd
> 
> every 5 seconds. I have the same problem on 3 different Intel-based
> computers (different generations), using 2 different webcams, same
> brand "same model".
>
> Is Logitech doing crappy hardware these days, or are we doing something
> wrong? Is there any way to know the reason that triggers the reset?

Is this before or after the uvcvideo driver gets involved ? One easy way
to check is to move the uvcvideo.ko module out of the way so that it
doesn't get loaded automatically (or just blacklist it in
/etc/modprobe.d/) and then plug the camera.

> I would be more than happy to provide any relevant debugging
> information if anyone is able to make it stop. As it stands, I must
> plug my webcam before using it and unplug it as soon as I'm done, which
> isn't exactly convenient.

-- 
Regards,

Laurent Pinchart
