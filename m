Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 63E1E54CBF
	for <lists+linux-media@lfdr.de>; Tue, 25 Jun 2019 12:51:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730082AbfFYKv3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 25 Jun 2019 06:51:29 -0400
Received: from gofer.mess.org ([88.97.38.141]:57527 "EHLO gofer.mess.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728732AbfFYKv3 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 25 Jun 2019 06:51:29 -0400
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 3B37360E3B; Tue, 25 Jun 2019 11:51:28 +0100 (BST)
Date:   Tue, 25 Jun 2019 11:51:28 +0100
From:   Sean Young <sean@mess.org>
To:     A Sun <as1033x@comcast.net>
Cc:     linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH v2 2/3] [media] mceusb: Reword messages referring to "urb"
Message-ID: <20190625105127.qw73fwt6dku5736m@gofer.mess.org>
References: <999ae5cd-d72b-983f-2f96-5aaca72e8214@comcast.net>
 <43f4ef6e-2c64-cd7a-26f7-3c1309b68936@comcast.net>
 <20190606095337.jfhmc6jqgyhmxn4q@gofer.mess.org>
 <2548e827-1d11-4ce2-013f-bf36c9f5436e@comcast.net>
 <20190608083729.bw47vkplpf3r4e4b@gofer.mess.org>
 <7e0c816d-c7bf-a3bf-a9f3-8c61605dbb17@comcast.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7e0c816d-c7bf-a3bf-a9f3-8c61605dbb17@comcast.net>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Jun 19, 2019 at 03:54:21AM -0400, A Sun wrote:
> 
> Clarify messages referencing "request urb" to mean "tx urb"
> (host transmit/send (to mceusb device)).
> Qualify messages referencing plain "urb" to mean "rx urb"
> (host receive (from mceusb device)).
> Add missing "couldn't allocate rx urb" error message.
> Clean extraneous "\n" in dev_dbg messages.
> 
> Signed-off-by: A Sun <as1033x@comcast.net>
> ---
>  drivers/media/rc/mceusb.c | 24 +++++++++++++-----------
>  1 file changed, 13 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/media/rc/mceusb.c b/drivers/media/rc/mceusb.c
> index 0cd8f6f57..efffb1795 100644
> --- a/drivers/media/rc/mceusb.c
> +++ b/drivers/media/rc/mceusb.c
> @@ -796,13 +796,13 @@ static void mce_async_callback(struct urb *urb)
>  		break;
>  
>  	case -EPIPE:
> -		dev_err(ir->dev, "Error: request urb status = %d (TX HALT)",
> +		dev_err(ir->dev, "Error: tx urb status = %d (TX HALT)",

I am not sure this makes things clearer. Some of the code still refers
to request, e.g. mce_request_packet.

Since this is an IR device, there is IR TX and RX; however this unrelated
to that.

There is one urb/endpoint on which commands are sent; on the other, we
receiver responses and IR data. Calling those TX and RX is not a good
idea I think.

The existing code refers to request and response, and also TX and RX in
places. The microsoft documentation refers to "command and response" which
would be consistent with the #define's we have (MCE_CMD_* and MCE_RSP_*).


Thanks

Sean
