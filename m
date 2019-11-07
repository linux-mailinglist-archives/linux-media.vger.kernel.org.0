Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 992F5F3277
	for <lists+linux-media@lfdr.de>; Thu,  7 Nov 2019 16:13:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388802AbfKGPMY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 7 Nov 2019 10:12:24 -0500
Received: from mx2.suse.de ([195.135.220.15]:57658 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729656AbfKGPMY (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 7 Nov 2019 10:12:24 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id DFC3FB240;
        Thu,  7 Nov 2019 15:12:22 +0000 (UTC)
Message-ID: <1573138580.3024.5.camel@suse.com>
Subject: Re: Logitech C270 webcam floods the log
From:   Oliver Neukum <oneukum@suse.com>
To:     Jean Delvare <jdelvare@suse.de>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-usb@vger.kernel.org
Date:   Thu, 07 Nov 2019 15:56:20 +0100
In-Reply-To: <20191107145238.0e7c9388@endymion>
References: <20191023151859.30a8ce88@endymion>
         <20191023142016.GA1904@pendragon.ideasonboard.com>
         <20191107143941.1649db47@endymion> <20191107145238.0e7c9388@endymion>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.26.6 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Am Donnerstag, den 07.11.2019, 14:52 +0100 schrieb Jean Delvare:
> On Thu, 7 Nov 2019 14:39:41 +0100, Jean Delvare wrote:
> > On Wed, 23 Oct 2019 17:20:16 +0300, Laurent Pinchart wrote:
> > > Is this before or after the uvcvideo driver gets involved ? One easy way
> > > to check is to move the uvcvideo.ko module out of the way so that it
> > > doesn't get loaded automatically (or just blacklist it in
> > > /etc/modprobe.d/) and then plug the camera.  
> > 
> > I did as you suggested and it turns out that the "reset high-speed USB
> > device" messages are not printed originally, they start being printed
> > right after the uvcvideo kernel driver gets loaded. So that would be a
> > problem with the uvcvideo driver?
> > 
> > When unloading the uvcvideo driver, there's one more "reset high-speed
> > USB device" message and then no more.
> 
> One more data point: the log flood happens when the uvcvideo driver is
> loaded but the webcam is unused. If I start e.g. cheese, it takes a
> long time to start but once started, the log flood stops. As soon as I
> stop cheese, the log flood starts again.
> 

Hi,

try

usbcore.autosuspend=-1

on the kernel command line.

	Regards
		Oliver

