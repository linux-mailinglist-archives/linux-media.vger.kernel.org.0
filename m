Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3A7D34B37C
	for <lists+linux-media@lfdr.de>; Wed, 19 Jun 2019 09:58:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731245AbfFSH6r (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 19 Jun 2019 03:58:47 -0400
Received: from resqmta-ch2-03v.sys.comcast.net ([69.252.207.35]:38036 "EHLO
        resqmta-ch2-03v.sys.comcast.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1731234AbfFSH6r (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 19 Jun 2019 03:58:47 -0400
X-Greylist: delayed 306 seconds by postgrey-1.27 at vger.kernel.org; Wed, 19 Jun 2019 03:58:47 EDT
Received: from resomta-ch2-14v.sys.comcast.net ([69.252.207.110])
        by resqmta-ch2-03v.sys.comcast.net with ESMTP
        id dVLthWwhqGd4odVPuhz0D9; Wed, 19 Jun 2019 07:54:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=comcast.net;
        s=20190202a; t=1560930842;
        bh=DzjMT/PSq8SjqkjkeMNq7Bw6ohS/HA0fgV++5DBodSE=;
        h=Received:Received:Subject:To:From:Message-ID:Date:MIME-Version:
         Content-Type;
        b=1WxNkslDeO5wk4Vdn6a4pCp3H9bBF6BZuKDdAVvYj3vtnUJDQCBsBDXd04X2Nc3w8
         8hjZaNVE4RKBdVSg6ZnQWLZQID/8ekYtNCcxVzhr/AJh7ARjbW8on+bDvNpQ1gZ9rr
         2sUo1kc98akl/O/+SChnXmq9t3gTCxd9OT2wdBkhONRJybyeevarlzPkpaK7IYSh0D
         ITK0ciXphU2l3sNV+B/6ftt2IgVJqTZIt70v7rFmLjApTYZuT156wHXR+iEscKwHEc
         eYnUQYhvvQoxSQHb6Lsup1G9tpyq+hrNODFQ43N3C7IypOka3Pv1AT7/9u4Jy98iTv
         8wA25dZKm0qCg==
Received: from [192.168.4.4] ([73.248.220.215])
        by resomta-ch2-14v.sys.comcast.net with ESMTPA
        id dVPqh6EvvllmHdVPthD3oh; Wed, 19 Jun 2019 07:54:02 +0000
X-Xfinity-VAAS: gggruggvucftvghtrhhoucdtuddrgeduvddrtddugdduvdeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuvehomhgtrghsthdqtfgvshhipdfqfgfvpdfpqffurfetoffkrfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepuffvfhfhkffffgggjggtgfesthejredttdefjeenucfhrhhomheptecuufhunhcuoegrshdutdeffeigsegtohhmtggrshhtrdhnvghtqeenucfkphepjeefrddvgeekrddvvddtrddvudehnecurfgrrhgrmhephhgvlhhopegludelvddrudeikedrgedrgegnpdhinhgvthepjeefrddvgeekrddvvddtrddvudehpdhmrghilhhfrhhomheprghsuddtfeefgiestghomhgtrghsthdrnhgvthdprhgtphhtthhopehmtghhvghhrggssehkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhmvgguihgrsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepshgvrghnsehmvghsshdrohhrghenucevlhhushhtvghrufhiiigvpedt
X-Xfinity-VMeta: sc=-100;st=legit
Subject: [PATCH v2 1/3] [media] mceusb: Disable "nonsensical irdata" messages
To:     Sean Young <sean@mess.org>
Cc:     linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>
References: <999ae5cd-d72b-983f-2f96-5aaca72e8214@comcast.net>
 <43f4ef6e-2c64-cd7a-26f7-3c1309b68936@comcast.net>
 <20190606095337.jfhmc6jqgyhmxn4q@gofer.mess.org>
 <2548e827-1d11-4ce2-013f-bf36c9f5436e@comcast.net>
 <20190608083729.bw47vkplpf3r4e4b@gofer.mess.org>
From:   A Sun <as1033x@comcast.net>
Message-ID: <f7b132ae-db6d-765a-5901-4e10ad87c977@comcast.net>
Date:   Wed, 19 Jun 2019 03:53:53 -0400
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190608083729.bw47vkplpf3r4e4b@gofer.mess.org>
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

