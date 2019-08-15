Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8894D8EC19
	for <lists+linux-media@lfdr.de>; Thu, 15 Aug 2019 14:57:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731171AbfHOM5g (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 15 Aug 2019 08:57:36 -0400
Received: from lb3-smtp-cloud8.xs4all.net ([194.109.24.29]:42315 "EHLO
        lb3-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729818AbfHOM5g (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 15 Aug 2019 08:57:36 -0400
Received: from [IPv6:2001:420:44c1:2579:f038:4b04:f67a:276f] ([IPv6:2001:420:44c1:2579:f038:4b04:f67a:276f])
        by smtp-cloud8.xs4all.net with ESMTPA
        id yFJrhvmBFDqPeyFJuhYBm6; Thu, 15 Aug 2019 14:57:34 +0200
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Antti Palosaari <crope@iki.fi>, Sean Young <sean@mess.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Akihiro Tsukada <tskd08@gmail.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [PATCH] dvb-usb-v2/gl861: fix wrong memcpy
Message-ID: <98cb0a1c-0db8-951b-80e1-12756678db9a@xs4all.nl>
Date:   Thu, 15 Aug 2019 14:57:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfHuMiBUZmfT6wf5jZ5NdYizu9p7+9HC18TnnY5/TDMaae9MsGH2Q8FG/NmaeFUmf11zHHdcITK0iGVbOITLu4AP0zrTCetONH+6NSVtncoHfvENciAki
 lwhFwx4pJCU1nhEDGow01aWHHyCFkbyNhGQngqRNE3+IqppjXChZ3uVhnvflpt1QfrIvj5aJIRui4JiOqpeQgB0I/tEM/b6XJbnQvwO5re/nAkVd1ukLn88h
 Vvd8bKsB5su1B51C8nWi85ZZZj1/nHisowvJ2yHVI0CnZNqdEwl55GLBlTbp4pDIO5irhOR608sDs1Ud5TnidJmcNCSm246rZTJ6H1vADG2MxqViJnYkREG9
 dCn7XxIKa/4X4EofCAU9/kEz1BhX7SAfWCmKjTfP8mdcSsujmtg=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The memcpy in gl861_i2c_read_ex() in gl861.c swapped the src and dst arguments,
leaving the rbuf uninitialized.

This issue caused this syzbot error:

https://syzkaller.appspot.com/bug?extid=9e6bf7282557bd1fc80d

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Reported-and-tested-by: syzbot+9e6bf7282557bd1fc80d@syzkaller.appspotmail.com
Fixes: commit b30cc07de8a9 ("media: dvb-usb/friio, dvb-usb-v2/gl861: decompose friio and merge with gl861")
---
Does anyone have this hardware? This device must have been dead for about
a year, ever since commit b30cc07de8a9 was merged.
---
diff --git a/drivers/media/usb/dvb-usb-v2/gl861.c b/drivers/media/usb/dvb-usb-v2/gl861.c
index b784d9da1a82..65d7c51ef56f 100644
--- a/drivers/media/usb/dvb-usb-v2/gl861.c
+++ b/drivers/media/usb/dvb-usb-v2/gl861.c
@@ -222,7 +222,7 @@ gl861_i2c_read_ex(struct dvb_usb_device *d, u8 addr, u8 *rbuf, u16 rlen)
 				 GL861_REQ_I2C_READ, GL861_READ,
 				 addr << (8 + 1), 0x0100, buf, rlen, 2000);
 	if (ret > 0 && rlen > 0)
-		memcpy(buf, rbuf, rlen);
+		memcpy(rbuf, buf, rlen);
 	kfree(buf);
 	return ret;
 }
