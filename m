Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 54FC232126
	for <lists+linux-media@lfdr.de>; Sun,  2 Jun 2019 01:38:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726414AbfFAXid (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 1 Jun 2019 19:38:33 -0400
Received: from resqmta-po-03v.sys.comcast.net ([96.114.154.162]:43846 "EHLO
        resqmta-po-03v.sys.comcast.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726211AbfFAXid (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 1 Jun 2019 19:38:33 -0400
X-Greylist: delayed 310 seconds by postgrey-1.27 at vger.kernel.org; Sat, 01 Jun 2019 19:38:33 EDT
Received: from resomta-po-18v.sys.comcast.net ([96.114.154.242])
        by resqmta-po-03v.sys.comcast.net with ESMTP
        id XD6OhrPNhpf2NXDVThdHUS; Sat, 01 Jun 2019 23:33:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=comcast.net;
        s=20190202a; t=1559432027;
        bh=3hesTGMPqedqGNOjzNwYYXY72iTqt0GIgKxBok2uJjg=;
        h=Received:Received:From:Subject:To:Message-ID:Date:MIME-Version:
         Content-Type;
        b=Ekp++VQh0U/6I5JV8kYsO+4cwtcvayAh+VRlBZRtt84mU3hgWlXrmdT/M/6wUy5Jp
         Gb9QfZ0K5kJmfJD+Bz+j1UWHRb3+IrxT4TWZ7UfQPyYQtc/RiozqPiF+SX/lF71M9d
         dFXHGnoaXW/h/KTm62ev1awIZWv/PGhaJs/MRL9QtiieLmG8R9fvv348SSg7sZe0Rv
         1ka3vwtaz7Cb3w1CzOcl0Va1zrzTIdetjkICBDF+dxBnYa2mPy6zSxVbclYDqR7cOH
         gKqeLp7pABMuZLsu56s9mejR0D2rDqn1mAFzimF2cI0l1U7YKBlZpfBdJwqpbCjC3b
         5y6heMzfLDwYw==
Received: from [192.168.4.4] ([73.248.220.215])
        by resomta-po-18v.sys.comcast.net with ESMTPA
        id XDVSheTpitBiqXDVShfYbe; Sat, 01 Jun 2019 23:33:47 +0000
X-Xfinity-VAAS: gggruggvucftvghtrhhoucdtuddrgeduuddrudefgedgvdefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuvehomhgtrghsthdqtfgvshhipdfqfgfvpdfpqffurfetoffkrfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffuvfhfkffffgggjggtgfesthejredttdefjeenucfhrhhomheptecuufhunhcuoegrshdutdeffeigsegtohhmtggrshhtrdhnvghtqeenucfkphepjeefrddvgeekrddvvddtrddvudehnecurfgrrhgrmhephhgvlhhopegludelvddrudeikedrgedrgegnpdhinhgvthepjeefrddvgeekrddvvddtrddvudehpdhmrghilhhfrhhomheprghsuddtfeefgiestghomhgtrghsthdrnhgvthdprhgtphhtthhopehmtghhvghhrggssehoshhgrdhsrghmshhunhhgrdgtohhmpdhrtghpthhtohepshgvrghnsehmvghsshdrohhrghdprhgtphhtthhopehlihhnuhigqdhmvgguihgrsehvghgvrhdrkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptd
X-Xfinity-VMeta: sc=-100;st=legit
From:   A Sun <as1033x@comcast.net>
Subject: [PATCH v1 1/3] [media] mceusb: Disable "nonsensical irdata" messages
To:     linux-media@vger.kernel.org
Cc:     Sean Young <sean@mess.org>,
        Mauro Carvalho Chehab <mchehab@osg.samsung.com>
References: <999ae5cd-d72b-983f-2f96-5aaca72e8214@comcast.net>
Message-ID: <6a0c1793-6249-99f5-05b9-5fcccf645f53@comcast.net>
Date:   Sat, 1 Jun 2019 19:34:01 -0400
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <999ae5cd-d72b-983f-2f96-5aaca72e8214@comcast.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

mceusb device 2304:0225, and likely others, produces numerous
warnings:

[ 4231.111310] mceusb 1-1.1.2:1.0: nonsensical irdata 80 with duration 0
[ 4381.493597] mceusb 1-1.1.2:1.0: nonsensical irdata 80 with duration 0
[ 4410.247568] mceusb 1-1.1.2:1.0: nonsensical irdata 80 with duration 0
...
[60153.264064] mceusb 1-1.1.2:1.0: nonsensical irdata 00 with duration 0
...

due to reception of ambient IR noise.
Change these warning messages to debug messages.

Signed-off-by: A Sun <as1033x@comcast.net>
---
 drivers/media/rc/mceusb.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/rc/mceusb.c b/drivers/media/rc/mceusb.c
index 82d4261c9..0cd8f6f57 100644
--- a/drivers/media/rc/mceusb.c
+++ b/drivers/media/rc/mceusb.c
@@ -1182,8 +1182,8 @@ static void mceusb_process_ir_data(struct mceusb_dev *ir, int buf_len)
 			rawir.pulse = ((ir->buf_in[i] & MCE_PULSE_BIT) != 0);
 			rawir.duration = (ir->buf_in[i] & MCE_PULSE_MASK);
 			if (unlikely(!rawir.duration)) {
-				dev_warn(ir->dev, "nonsensical irdata %02x with duration 0",
-					 ir->buf_in[i]);
+				dev_dbg(ir->dev, "nonsensical irdata %02x with duration 0",
+					ir->buf_in[i]);
 				break;
 			}
 			if (rawir.pulse) {
-- 
2.11.0

