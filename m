Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9440155435
	for <lists+linux-media@lfdr.de>; Tue, 25 Jun 2019 18:12:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728997AbfFYQMq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 25 Jun 2019 12:12:46 -0400
Received: from gofer.mess.org ([88.97.38.141]:50039 "EHLO gofer.mess.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732602AbfFYQMn (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 25 Jun 2019 12:12:43 -0400
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 07CF260739; Tue, 25 Jun 2019 17:12:41 +0100 (BST)
Date:   Tue, 25 Jun 2019 17:12:41 +0100
From:   Sean Young <sean@mess.org>
To:     A Sun <as1033x@comcast.net>
Cc:     linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH v2 2/3] [media] mceusb: Reword messages referring to "urb"
Message-ID: <20190625161241.u5v7fiegokwrzvey@gofer.mess.org>
References: <999ae5cd-d72b-983f-2f96-5aaca72e8214@comcast.net>
 <43f4ef6e-2c64-cd7a-26f7-3c1309b68936@comcast.net>
 <20190606095337.jfhmc6jqgyhmxn4q@gofer.mess.org>
 <2548e827-1d11-4ce2-013f-bf36c9f5436e@comcast.net>
 <20190608083729.bw47vkplpf3r4e4b@gofer.mess.org>
 <7e0c816d-c7bf-a3bf-a9f3-8c61605dbb17@comcast.net>
 <20190625105127.qw73fwt6dku5736m@gofer.mess.org>
 <3c452b74-dc5b-f1d4-3c66-8acdb69da5da@comcast.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3c452b74-dc5b-f1d4-3c66-8acdb69da5da@comcast.net>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

On Tue, Jun 25, 2019 at 11:01:32AM -0400, A Sun wrote:
> On 6/25/2019 6:51 AM, Sean Young wrote:
> > On Wed, Jun 19, 2019 at 03:54:21AM -0400, A Sun wrote:
> >>
> 
> >> -		dev_err(ir->dev, "Error: request urb status = %d (TX HALT)",
> >> +		dev_err(ir->dev, "Error: tx urb status = %d (TX HALT)",
> > 
> > I am not sure this makes things clearer. Some of the code still refers
> > to request, e.g. mce_request_packet.
> > 
> > Since this is an IR device, there is IR TX and RX; however this unrelated
> > to that.
> > 
> > There is one urb/endpoint on which commands are sent; on the other, we
> > receiver responses and IR data. Calling those TX and RX is not a good
> > idea I think.
> 
> The tx urb described is also for IR data TX.
> IR TX is one primary function/purpose of the device.
>
> It happens that the urb/endpoint for IR TX is the same urb/endpoint for
> mceusb device commands.

The outgoing urb is for command, e.g. get version, set IR Rx timeout,
set IR Rx carrier report, set IR wakeup protocol/scancode, resume
device after suspend. Not everything is IR Tx.

> The same is found for IR data RX.
> The urb/endpoint for IR RX is the same urb/endpoint for mceusb device
> responses (to commands).

The response to get version, how many Tx ports are there etc. Responses
to commands and IR data. Not everything is IR Rx here.

> > The existing code refers to request and response, and also TX and RX in
> > places. The microsoft documentation refers to "command and response" which
> > would be consistent with the #define's we have (MCE_CMD_* and MCE_RSP_*).
> > 
> 
> My intent is to try and better word several of the USB layer messages,
> and avoid confusing Microsoft MCE terms in those messages.
> 
> The original "(request) urb" phrases expand to "request USB Request Block"
> and "<blank> USB Request Block" which are particularly confusing, and
> non-specific, respectively.

How about command and response?

Sean
