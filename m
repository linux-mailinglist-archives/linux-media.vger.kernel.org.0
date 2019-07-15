Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E97CB688DE
	for <lists+linux-media@lfdr.de>; Mon, 15 Jul 2019 14:29:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729983AbfGOM2a (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 15 Jul 2019 08:28:30 -0400
Received: from gofer.mess.org ([88.97.38.141]:60843 "EHLO gofer.mess.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728933AbfGOM2a (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 15 Jul 2019 08:28:30 -0400
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 3EFC360523; Mon, 15 Jul 2019 13:28:28 +0100 (BST)
Date:   Mon, 15 Jul 2019 13:28:28 +0100
From:   Sean Young <sean@mess.org>
To:     A Sun <as1033x@comcast.net>
Cc:     linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH v2 2/3] [media] mceusb: Reword messages referring to "urb"
Message-ID: <20190715122827.picgfztheuklfl64@gofer.mess.org>
References: <999ae5cd-d72b-983f-2f96-5aaca72e8214@comcast.net>
 <43f4ef6e-2c64-cd7a-26f7-3c1309b68936@comcast.net>
 <20190606095337.jfhmc6jqgyhmxn4q@gofer.mess.org>
 <2548e827-1d11-4ce2-013f-bf36c9f5436e@comcast.net>
 <20190608083729.bw47vkplpf3r4e4b@gofer.mess.org>
 <7e0c816d-c7bf-a3bf-a9f3-8c61605dbb17@comcast.net>
 <20190625105127.qw73fwt6dku5736m@gofer.mess.org>
 <3c452b74-dc5b-f1d4-3c66-8acdb69da5da@comcast.net>
 <20190625161241.u5v7fiegokwrzvey@gofer.mess.org>
 <44516839-3c00-1f1e-30c6-3638e45e8d2d@comcast.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <44516839-3c00-1f1e-30c6-3638e45e8d2d@comcast.net>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On Tue, Jun 25, 2019 at 05:29:02PM -0400, A Sun wrote:
> 
> Hi again,
> 
> On 6/25/2019 12:12 PM, Sean Young wrote:
> > Hello,
> > 
> > On Tue, Jun 25, 2019 at 11:01:32AM -0400, A Sun wrote:
> >> On 6/25/2019 6:51 AM, Sean Young wrote:
> >>> On Wed, Jun 19, 2019 at 03:54:21AM -0400, A Sun wrote:
> >>>>
> >>
> >>>> -		dev_err(ir->dev, "Error: request urb status = %d (TX HALT)",
> >>>> +		dev_err(ir->dev, "Error: tx urb status = %d (TX HALT)",
> >>>
> >>> I am not sure this makes things clearer. Some of the code still refers
> >>> to request, e.g. mce_request_packet.
> >>>
> >>> Since this is an IR device, there is IR TX and RX; however this unrelated
> >>> to that.
> >>>
> >>> There is one urb/endpoint on which commands are sent; on the other, we
> >>> receiver responses and IR data. Calling those TX and RX is not a good
> >>> idea I think.
> >>
> >> The tx urb described is also for IR data TX.
> >> IR TX is one primary function/purpose of the device.
> >>
> >> It happens that the urb/endpoint for IR TX is the same urb/endpoint for
> >> mceusb device commands.
> > 
> > The outgoing urb is for command, e.g. get version, set IR Rx timeout,
> > set IR Rx carrier report, set IR wakeup protocol/scancode, resume
> > device after suspend. Not everything is IR Tx.
> > 
> 
> Right. Not everything is command either.
> The subject USB interface endpoint-out (and -in) is intended for data
> (interrupt/bulk) transfer. The only true data here is IR data.
> 
> It's a quirk of mceusb devices to use endpoint-out as a command channel too,
> where commands masquerade as data.
> 
> A quick sampling of other USB devices, I'm seeing they customarily use
> USB default endpoint 0 and control transfers (rather than data transfers)
> for device management commands.
> 
> >>> The existing code refers to request and response, and also TX and RX in
> >>> places. The microsoft documentation refers to "command and response" which
> >>> would be consistent with the #define's we have (MCE_CMD_* and MCE_RSP_*).
> >>>
> >>
> >> My intent is to try and better word several of the USB layer messages,
> >> and avoid confusing Microsoft MCE terms in those messages.
> >>
> >> The original "(request) urb" phrases expand to "request USB Request Block"
> >> and "<blank> USB Request Block" which are particularly confusing, and
> >> non-specific, respectively.
> > 
> > How about command and response?
> > 
> 
> Still seem confusing and awkward to me, as in "response USB Request Block",
> or "command USB Request Block" that might be IR data. "Command" also suggests
> to me USB interface endpoint 0, which isn't the case with mceusb.
> 
> Again, my intent is to avoid Microsoft MCE specific terms in messages pertaining
> to USB.

You are right. Command and response isn't great.

> In a quick look though other USB drivers, here are some other possibilities:
> 
> Endpoint-in / Endpoint-out	(not concise)
> ep-in / ep-out			(abbrev may be too obscure)
> in / out			("Error: in urb status.." confusing,
> 				 "in" is noun, adj, or verb?)
> read / write			(confusing, "read" is noun, adj, verb?)
> RD / WR
> RX / TX
> 
> I suggest RX/TX. However, I'll have to leave it up to you to make a choice.

TBH I've been mulling this over. I think you're right that the terms should
be usb centric. TX seems confusing, there are mceusb devices with no IR 
transmit ports, so it would be surprising to see errors about TX. Your
first option is usb centric and can be wordy in errors messages and concise
in code (option #2).

However as you're writing patches I'll leave it up to you. It would be nice
if the usage is consistent in the driver code.


Thanks

Sean
