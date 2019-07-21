Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8FFAF6F5D3
	for <lists+linux-media@lfdr.de>; Sun, 21 Jul 2019 23:32:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726106AbfGUVcQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 21 Jul 2019 17:32:16 -0400
Received: from resqmta-po-06v.sys.comcast.net ([96.114.154.165]:49534 "EHLO
        resqmta-po-06v.sys.comcast.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726022AbfGUVcQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 21 Jul 2019 17:32:16 -0400
Received: from resomta-po-11v.sys.comcast.net ([96.114.154.235])
        by resqmta-po-06v.sys.comcast.net with ESMTP
        id pJQMhVBWOMC2xpJRHhWE75; Sun, 21 Jul 2019 21:32:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=comcast.net;
        s=20190202a; t=1563744735;
        bh=8ampsgH7M1kR8GbR+1cSxOn20t1hHFPJeLob6tDlTTA=;
        h=Received:Received:Subject:To:From:Message-ID:Date:MIME-Version:
         Content-Type;
        b=hnyADTRlovbQoJqvWvVJCQcidqJuretFDU1d20W7ZAef3Z+BtiZYH35M2oleJviRZ
         uj06fxvtfTzYuqZyoZlX79Y971wx2MvnwaOnL+ylRRH2QTXzJFM8E8qTfbIOJLqCvK
         xxegph9KYlsBm6KpoUz9H9oMPO5UJ/bgCjpK6LkeNHPJmEsCvi9mEzH+rpaC6B07XT
         lzyhWZv3urtcx5lY0TyZkygPiC9JyYv3/gkUDTPSsIVKmABE5VNVOAYhcQwmD2Ymx9
         nXz949PjunKyeaBLaPr8AMx4DUih1y2vmMAavUzM2YzVmjB+8vtEfZiCmaVdeBOFlQ
         efhEp/zKSm9lA==
Received: from [192.168.4.4] ([73.248.220.215])
        by resomta-po-11v.sys.comcast.net with ESMTPA
        id pJR6hMUdoHnV3pJRHhq5tJ; Sun, 21 Jul 2019 21:32:15 +0000
X-Xfinity-VAAS: gggruggvucftvghtrhhoucdtuddrgeduvddrjedvgdduieehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuvehomhgtrghsthdqtfgvshhipdfqfgfvpdfpqffurfetoffkrfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepuffvfhfhkffffgggjggtgfesthejredttdefjeenucfhrhhomheptecuufhunhcuoegrshdutdeffeigsegtohhmtggrshhtrdhnvghtqeenucfkphepjeefrddvgeekrddvvddtrddvudehnecurfgrrhgrmhephhgvlhhopegludelvddrudeikedrgedrgegnpdhinhgvthepjeefrddvgeekrddvvddtrddvudehpdhmrghilhhfrhhomheprghsuddtfeefgiestghomhgtrghsthdrnhgvthdprhgtphhtthhopehmtghhvghhrggssehkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhmvgguihgrsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepshgvrghnsehmvghsshdrohhrghenucevlhhushhtvghrufhiiigvpedt
X-Xfinity-VMeta: sc=-100;st=legit
Subject: Re: [PATCH v2 2/3] [media] mceusb: Reword messages referring to "urb"
To:     Sean Young <sean@mess.org>
Cc:     linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>
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
 <20190715122827.picgfztheuklfl64@gofer.mess.org>
From:   A Sun <as1033x@comcast.net>
Message-ID: <49527290-a5b0-4b4f-c93a-ac54ff52edc8@comcast.net>
Date:   Sun, 21 Jul 2019 17:31:55 -0400
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190715122827.picgfztheuklfl64@gofer.mess.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


Hi again,

On 7/15/2019 8:28 AM, Sean Young wrote:
> Hi,
> 
> On Tue, Jun 25, 2019 at 05:29:02PM -0400, A Sun wrote:


>> In a quick look though other USB drivers, here are some other possibilities:
>>
>> Endpoint-in / Endpoint-out	(not concise)
>> ep-in / ep-out			(abbrev may be too obscure)
>> in / out			("Error: in urb status.." confusing,
>> 				 "in" is noun, adj, or verb?)
>> read / write			(confusing, "read" is noun, adj, verb?)
>> RD / WR
>> RX / TX
>>
>> I suggest RX/TX. However, I'll have to leave it up to you to make a choice.
> 
> TBH I've been mulling this over. I think you're right that the terms should
> be usb centric. TX seems confusing, there are mceusb devices with no IR 
> transmit ports, so it would be surprising to see errors about TX. Your
> first option is usb centric and can be wordy in errors messages and concise
> in code (option #2).
> 
> However as you're writing patches I'll leave it up to you. It would be nice
> if the usage is consistent in the driver code.
> 

ok, I'll leave this patch proposal as is, where RX/TX is the favored terminology.
rx/tx was already in use elsewhere outside the message text of this patch,
and is prevalent in mceusb_dev_printdata() output.

I also found that my later patch submission:
  [PATCH v1] [media] mceusb: USB reset device following USB clear halt error
has an unintended dependency on this [PATCH v2 2/3].


FYI, I'm in progress on another mceusb patch to fix, and eliminate, the driver's
TX IR length limits. Limit causes -EINVAL errors for > ~300 pulse/space samples and
I've seen reports (and patches for) of appliances with IR over 400 pulse/spaces.

The future patch rewrites:
  mceusb_tx_ir()
And revises "write/tx" async I/O to sync I/O to do unlimited multipart TX IR.
These functions will need rewrite and rename:
  mce_async_callback() -> mce_tx_callback()
  mce_request_packet() -> mce_tx()
The present mce_async_out() name will become misleading. mce_command_out()
or mce_request_out() (which calls mce_tx()), are probably better names.

I'm still mulling over whether the more generic "read/write" term
(e.g. mce_write() and mce_write_callback()) may be a better migration path,
for future work.

Thanks, ..A Sun
