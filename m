Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 58A4B552C7
	for <lists+linux-media@lfdr.de>; Tue, 25 Jun 2019 17:02:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731166AbfFYPCP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 25 Jun 2019 11:02:15 -0400
Received: from resqmta-po-05v.sys.comcast.net ([96.114.154.164]:55906 "EHLO
        resqmta-po-05v.sys.comcast.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730957AbfFYPCP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 25 Jun 2019 11:02:15 -0400
Received: from resomta-po-10v.sys.comcast.net ([96.114.154.234])
        by resqmta-po-05v.sys.comcast.net with ESMTP
        id fmirhtMk0PM4nfmxahdV4W; Tue, 25 Jun 2019 15:02:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=comcast.net;
        s=20190202a; t=1561474934;
        bh=FiS2/sOK5d0o8+oZlwrZ1TGBuNKuCe/2yUCOLPo9QRU=;
        h=Received:Received:Subject:To:From:Message-ID:Date:MIME-Version:
         Content-Type;
        b=td9JbF+2KpyfNdjtoVbAZY1Aiqmijl1bImN0m+kQlLJHC9lH6LA8CXw/voM7/gXKX
         PAbZtEmJ8NFK0bt0hNPNeZfX6asmOS4TmKY1Fz84DJhHcbTqLz7QMP0Eml/X8eTf8c
         dblGcgF7g/aq8ihTG5rsOEThM1WgCNto8D3LzPKxVPjye/QckEWbGGMu066YsHXwIZ
         a7lVRvrnICVXvofylVMrgm7rq/fhW2HfAymcrqoWLQq9qmdt+GI7991xpvUS6teKqu
         s2sTZlHEabYCxK39mu8d62pqvmRijXbJoC+obkUB30GgNg+XAyh3Xd/N6aFlaaeIs7
         al9GA814Kto9g==
Received: from [192.168.4.4] ([73.248.220.215])
        by resomta-po-10v.sys.comcast.net with ESMTPA
        id fmxJhSpFRY4ycfmxZhiB5v; Tue, 25 Jun 2019 15:02:14 +0000
X-Xfinity-VAAS: gggruggvucftvghtrhhoucdtuddrgeduvddrudeggdekvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucevohhmtggrshhtqdftvghsihdpqfgfvfdppffquffrtefokffrnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefuvfhfhffkffgfgggjtgfgsehtjeertddtfeejnecuhfhrohhmpeetucfuuhhnuceorghsuddtfeefgiestghomhgtrghsthdrnhgvtheqnecukfhppeejfedrvdegkedrvddvtddrvdduheenucfrrghrrghmpehhvghloheplgduledvrdduieekrdegrdegngdpihhnvghtpeejfedrvdegkedrvddvtddrvdduhedpmhgrihhlfhhrohhmpegrshdutdeffeigsegtohhmtggrshhtrdhnvghtpdhrtghpthhtohepmhgthhgvhhgrsgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqmhgvughirgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehsvggrnhesmhgvshhsrdhorhhgnecuvehluhhsthgvrhfuihiivgeptd
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
From:   A Sun <as1033x@comcast.net>
Message-ID: <3c452b74-dc5b-f1d4-3c66-8acdb69da5da@comcast.net>
Date:   Tue, 25 Jun 2019 11:01:32 -0400
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190625105127.qw73fwt6dku5736m@gofer.mess.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


Hi,

On 6/25/2019 6:51 AM, Sean Young wrote:
> On Wed, Jun 19, 2019 at 03:54:21AM -0400, A Sun wrote:
>>

>> -		dev_err(ir->dev, "Error: request urb status = %d (TX HALT)",
>> +		dev_err(ir->dev, "Error: tx urb status = %d (TX HALT)",
> 
> I am not sure this makes things clearer. Some of the code still refers
> to request, e.g. mce_request_packet.
> 
> Since this is an IR device, there is IR TX and RX; however this unrelated
> to that.
> 
> There is one urb/endpoint on which commands are sent; on the other, we
> receiver responses and IR data. Calling those TX and RX is not a good
> idea I think.

The tx urb described is also for IR data TX.
IR TX is one primary function/purpose of the device.
It happens that the urb/endpoint for IR TX is the same urb/endpoint for
mceusb device commands.

The same is found for IR data RX.
The urb/endpoint for IR RX is the same urb/endpoint for mceusb device
responses (to commands).

> 
> The existing code refers to request and response, and also TX and RX in
> places. The microsoft documentation refers to "command and response" which
> would be consistent with the #define's we have (MCE_CMD_* and MCE_RSP_*).
> 

My intent is to try and better word several of the USB layer messages,
and avoid confusing Microsoft MCE terms in those messages.

The original "(request) urb" phrases expand to "request USB Request Block"
and "<blank> USB Request Block" which are particularly confusing, and
non-specific, respectively.

Thanks, ..A Sun
