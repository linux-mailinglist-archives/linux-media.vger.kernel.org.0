Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 522FD24ACA7
	for <lists+linux-media@lfdr.de>; Thu, 20 Aug 2020 03:31:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726772AbgHTBbZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 19 Aug 2020 21:31:25 -0400
Received: from netrider.rowland.org ([192.131.102.5]:38233 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1726435AbgHTBbY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 19 Aug 2020 21:31:24 -0400
Received: (qmail 202460 invoked by uid 1000); 19 Aug 2020 21:31:22 -0400
Date:   Wed, 19 Aug 2020 21:31:22 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-usb <linux-usb@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        linux-media@vger.kernel.org, linux-uvc-devel@lists.sourceforge.net,
        Sakari Ailus <sakari.ailus@iki.fi>
Subject: Re: Protecting uvcvideo againt USB device disconnect [Was: Re:
 Protecting usb_set_interface() against device removal]
Message-ID: <20200820013122.GA202178@rowland.harvard.edu>
References: <b0a7247c-bed3-934b-2c73-7f4b0adb5e75@roeck-us.net>
 <20200815020739.GB52242@rowland.harvard.edu>
 <20200816003315.GA13826@roeck-us.net>
 <20200816121816.GC32174@pendragon.ideasonboard.com>
 <9bb20ed7-b156-f6c2-4d25-6acac1a0021b@roeck-us.net>
 <20200816235155.GA7729@pendragon.ideasonboard.com>
 <0684b71c-8ac5-8962-cbd5-c0bcaa8b6881@xs4all.nl>
 <20200819013002.GL2360@pendragon.ideasonboard.com>
 <20200819230851.GA222844@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200819230851.GA222844@roeck-us.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Aug 19, 2020 at 04:08:51PM -0700, Guenter Roeck wrote:

> usb_set_interface() should not be called anymore after uvc_disconnect(),
> or at east I think so (is that documented anywhere ?).

It may be documented somewhere, but basically it goes without saying.  

A main feature of the device model design is that drivers get bound to 
devices by having their probe routine called, and they get unbound by 
having their disconnect routine called.  It should go without saying 
that once a driver is unbound from a device, it must not communicate 
with that device any more.

It might be nice if this requirement could be enforced (say in the USB 
core), but doing so is impractical.  It would require every I/O request 
to include some sort of cookie proving that the caller is authorized to 
make the request.  That's not how the kernel works; it trusts drivers 
to generally do the right thing without constant checking.

Alan Stern
