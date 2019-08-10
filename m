Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9B8CD88B46
	for <lists+linux-media@lfdr.de>; Sat, 10 Aug 2019 14:17:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726221AbfHJMR0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 10 Aug 2019 08:17:26 -0400
Received: from gofer.mess.org ([88.97.38.141]:39923 "EHLO gofer.mess.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726162AbfHJMR0 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 10 Aug 2019 08:17:26 -0400
Received: by gofer.mess.org (Postfix, from userid 1000)
        id E368E60A27; Sat, 10 Aug 2019 13:17:24 +0100 (BST)
Date:   Sat, 10 Aug 2019 13:17:24 +0100
From:   Sean Young <sean@mess.org>
To:     A Sun <as1033x@comcast.net>
Cc:     linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH v2 2/3] [media] mceusb: Reword messages referring to "urb"
Message-ID: <20190810121724.7oo7uoggxg4hha6i@gofer.mess.org>
References: <20190606095337.jfhmc6jqgyhmxn4q@gofer.mess.org>
 <2548e827-1d11-4ce2-013f-bf36c9f5436e@comcast.net>
 <20190608083729.bw47vkplpf3r4e4b@gofer.mess.org>
 <7e0c816d-c7bf-a3bf-a9f3-8c61605dbb17@comcast.net>
 <20190625105127.qw73fwt6dku5736m@gofer.mess.org>
 <3c452b74-dc5b-f1d4-3c66-8acdb69da5da@comcast.net>
 <20190625161241.u5v7fiegokwrzvey@gofer.mess.org>
 <44516839-3c00-1f1e-30c6-3638e45e8d2d@comcast.net>
 <20190715122827.picgfztheuklfl64@gofer.mess.org>
 <49527290-a5b0-4b4f-c93a-ac54ff52edc8@comcast.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <49527290-a5b0-4b4f-c93a-ac54ff52edc8@comcast.net>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On Sun, Jul 21, 2019 at 05:31:55PM -0400, A Sun wrote:
> FYI, I'm in progress on another mceusb patch to fix, and eliminate, the driver's
> TX IR length limits. Limit causes -EINVAL errors for > ~300 pulse/space samples and
> I've seen reports (and patches for) of appliances with IR over 400 pulse/spaces.

This always looked like it needed improvement. Thank you!

> 
> The future patch rewrites:
>   mceusb_tx_ir()
> And revises "write/tx" async I/O to sync I/O to do unlimited multipart TX IR.
> These functions will need rewrite and rename:
>   mce_async_callback() -> mce_tx_callback()
>   mce_request_packet() -> mce_tx()
> The present mce_async_out() name will become misleading. mce_command_out()
> or mce_request_out() (which calls mce_tx()), are probably better names.
> 
> I'm still mulling over whether the more generic "read/write" term
> (e.g. mce_write() and mce_write_callback()) may be a better migration path,
> for future work.

Thanks.

Another thing the mceusb driver could do with is usb wakeup. I've hadn't
had the time to look at that.


Sean
