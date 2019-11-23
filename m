Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 48CF4107F5A
	for <lists+linux-media@lfdr.de>; Sat, 23 Nov 2019 17:27:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726757AbfKWQ1r (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 23 Nov 2019 11:27:47 -0500
Received: from lb2-smtp-cloud7.xs4all.net ([194.109.24.28]:42843 "EHLO
        lb2-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726487AbfKWQ1q (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 23 Nov 2019 11:27:46 -0500
Received: from [192.168.2.10] ([46.9.232.237])
        by smtp-cloud7.xs4all.net with ESMTPA
        id YYG5iljsmcs92YYG8iKXbj; Sat, 23 Nov 2019 17:27:44 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1574526464; bh=DGM6J9o8PLZIDnbCtqEDDIgMS6Bymc7T0bSTzSjS0hA=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=Jx7WPlQZiTg09YTqb6G8KIAM2ckkMo/v/xX175ati25oqn/ETlna89i5sW5OyC0R3
         KkxEwoS5Km/koWrKSoM4BIS8UDO2lBpIbHQ254jju9XjGwXcJfUsqdlW3wbsnDRoWV
         h+mYdoO+arAsyKxKiB8t/xPxWtWvDjm6rmDNugf0lPX/C5L1pzPa2vYE+/WqmMVqd6
         cnRKDY7oRic56c20qb5KnjzeLll9v8ak4qCePfhHJDwZkfkD5/yppOq4pfvn2h3hyg
         lPk/94wkZsGyt8LTYlid4fcdnapKs7Hke7bhJIYDat+x3CPtemZNsYZ2qsVrNrT0rV
         wrWWb2aKjmhVQ==
Subject: [PATCHv2 5/5] input/rmi4/rmi_smbus.c: don't increment rmiaddr
To:     linux-media@vger.kernel.org
Cc:     linux-input@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Nick Dyer <nick@shmanahar.org>,
        Lucas Stach <l.stach@pengutronix.de>,
        Christopher Heiny <cheiny@synaptics.com>,
        Vandana BN <bnvandana@gmail.com>
References: <20191119105118.54285-1-hverkuil-cisco@xs4all.nl>
 <20191119105118.54285-6-hverkuil-cisco@xs4all.nl>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <8dd22e21-4933-8e9c-a696-d281872c8de7@xs4all.nl>
Date:   Sat, 23 Nov 2019 17:27:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191119105118.54285-6-hverkuil-cisco@xs4all.nl>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfGT6F0rmTJb3wB29yEgY7TOoegt20SL4lATZ6w0ZhCdcTzE+nV+nEZbmpARgLv5YqHgg7ICbfxovC6xL6PAgRS4ih+TVd1OIunj3SQfmeVwttVFr/Uwm
 uzZxq8v9R3mLyUxrL5vVZwcd0uetO+eKIBVTCJmUoaGHTXKcl6T5OX2qnZRZRMQYKXy0JqZO21nPnjFoLibOWdJfhTQEv+DazR06M2nKDXRBGG/MHoXCdAFg
 QHXp5pjkWYfhtpZf2n8QFyRNSbLP57Up29Ek3Zk7koJb6L+YwmPwXbsG7fgi9LC/QSs8Shns69aIHxDoMqD/jB9sOS6Agi4Rl3Evl1PJd1m6K/SK2zWNA4mU
 4KIDSkDGAHSipbnjdzqan4StI0pWOBelUEU4NYRZ3iB2zpy8Cp56qNO6DKKkymvbUXn3JmKV
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This increment of rmi_smbus in rmi_smb_read/write_block() causes
garbage to be read/written.

The first read of SMB_MAX_COUNT bytes is fine, but after that
it is nonsense. Trial-and-error showed that by dropping the
increment of rmiaddr everything is fine and the F54 function
properly works.

I tried a hack with rmi_smb_write_block() as well (writing to the
same F54 touchpad data area, then reading it back), and that
suggests that there too the rmiaddr increment has to be dropped.
It makes sense that if it has to be dropped for read, then it has
to be dropped for write as well.

It looks like the initial work with F54 was done using i2c, not smbus,
and it seems nobody ever tested F54 with smbus. The other functions
all read/write less than SMB_MAX_COUNT as far as I can tell, so this
issue was never noticed with non-F54 functions.

With this change I can read out the touchpad data correctly on my
Lenovo X1 Carbon 6th Gen laptop.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/input/rmi4/rmi_smbus.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/input/rmi4/rmi_smbus.c b/drivers/input/rmi4/rmi_smbus.c
index 2407ea43de59..b313c579914f 100644
--- a/drivers/input/rmi4/rmi_smbus.c
+++ b/drivers/input/rmi4/rmi_smbus.c
@@ -163,7 +163,6 @@ static int rmi_smb_write_block(struct rmi_transport_dev *xport, u16 rmiaddr,
 		/* prepare to write next block of bytes */
 		cur_len -= SMB_MAX_COUNT;
 		databuff += SMB_MAX_COUNT;
-		rmiaddr += SMB_MAX_COUNT;
 	}
 exit:
 	mutex_unlock(&rmi_smb->page_mutex);
@@ -215,7 +214,6 @@ static int rmi_smb_read_block(struct rmi_transport_dev *xport, u16 rmiaddr,
 		/* prepare to read next block of bytes */
 		cur_len -= SMB_MAX_COUNT;
 		databuff += SMB_MAX_COUNT;
-		rmiaddr += SMB_MAX_COUNT;
 	}

 	retval = 0;
-- 
2.24.0


