Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5A942F3097
	for <lists+linux-media@lfdr.de>; Thu,  7 Nov 2019 14:52:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389468AbfKGNwl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 7 Nov 2019 08:52:41 -0500
Received: from mx2.suse.de ([195.135.220.15]:44488 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2389455AbfKGNwl (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 7 Nov 2019 08:52:41 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id B9D25AF81;
        Thu,  7 Nov 2019 13:52:39 +0000 (UTC)
Date:   Thu, 7 Nov 2019 14:52:38 +0100
From:   Jean Delvare <jdelvare@suse.de>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-usb@vger.kernel.org
Subject: Re: Logitech C270 webcam floods the log
Message-ID: <20191107145238.0e7c9388@endymion>
In-Reply-To: <20191107143941.1649db47@endymion>
References: <20191023151859.30a8ce88@endymion>
        <20191023142016.GA1904@pendragon.ideasonboard.com>
        <20191107143941.1649db47@endymion>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, 7 Nov 2019 14:39:41 +0100, Jean Delvare wrote:
> On Wed, 23 Oct 2019 17:20:16 +0300, Laurent Pinchart wrote:
> > Is this before or after the uvcvideo driver gets involved ? One easy way
> > to check is to move the uvcvideo.ko module out of the way so that it
> > doesn't get loaded automatically (or just blacklist it in
> > /etc/modprobe.d/) and then plug the camera.  
> 
> I did as you suggested and it turns out that the "reset high-speed USB
> device" messages are not printed originally, they start being printed
> right after the uvcvideo kernel driver gets loaded. So that would be a
> problem with the uvcvideo driver?
> 
> When unloading the uvcvideo driver, there's one more "reset high-speed
> USB device" message and then no more.

One more data point: the log flood happens when the uvcvideo driver is
loaded but the webcam is unused. If I start e.g. cheese, it takes a
long time to start but once started, the log flood stops. As soon as I
stop cheese, the log flood starts again.

-- 
Jean Delvare
SUSE L3 Support
