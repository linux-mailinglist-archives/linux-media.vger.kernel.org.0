Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DDFA31C096C
	for <lists+linux-media@lfdr.de>; Thu, 30 Apr 2020 23:34:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728057AbgD3Vds (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 30 Apr 2020 17:33:48 -0400
Received: from mout.kundenserver.de ([212.227.126.187]:40667 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726752AbgD3Vdr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 30 Apr 2020 17:33:47 -0400
Received: from threadripper.lan ([149.172.19.189]) by mrelayeu.kundenserver.de
 (mreue010 [212.227.15.129]) with ESMTPA (Nemesis) id
 1M6DnM-1jWUnr12TI-006ihr; Thu, 30 Apr 2020 23:33:23 +0200
From:   Arnd Bergmann <arnd@arndb.de>
To:     linux-kernel@vger.kernel.org,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Mauro Carvalho Chehab <m.chehab@samsung.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        linux-media@vger.kernel.org
Subject: [PATCH 12/15] media: s5k5baf: avoid gcc-10 zero-length-bounds warning
Date:   Thu, 30 Apr 2020 23:30:54 +0200
Message-Id: <20200430213101.135134-13-arnd@arndb.de>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200430213101.135134-1-arnd@arndb.de>
References: <20200430213101.135134-1-arnd@arndb.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:KLa+rD8CoNAYi1ja+1cMv6oVML/pmJteDWSgGx6n0lvW5TeF+Sd
 WhfntbdPGehPEaiQn5QGq9jx56PFRwuHHr3QfGfXlZD28ebSfM9FIX3TOzrGL6rp32Rko9L
 bjEXBN2ZuhJ3wMgUPS1gypShti4frgAFndPlDAyLFAtTXD34WV0DcyYTTllhK23rUEhRfg2
 hk19XP9j7T9ssEZO68epA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:c1fC5qyOv2Q=:aAaK7HctWIdNrY8ihPk8uw
 Y+8nA5DUNUdmjjXAfkesxv9zH4K+eJcANDd1QRosLs81MmCnCBkFfU5D+Nm+8oMavVyqRp6/W
 CmSx+l8cGtEe76yGWF6IWj3xqXn6S3c4L1butBkMIPpqp0lrnUuhk+AY+SmsKUECyYKNbMSA0
 04DtQCXlPAQpwgxYo+B5/ShBGh9Ix8Jq8e863CGXiUKnHhCDL584Ij+DWXQX1D8g33Xc6R47J
 TvAWfmxCeqiGygA4Kyofy/ZiRilMuhUiOuWhAMdQZVU5OFgjDDGmaf0Jdws714VEnOnjxOYmG
 Q1wuJIMIdaty9XbyLo++/hkUDp0KruaDDN9ay+zmDPk8nIRHoZejaF/o040NL74VAYbdqvpEQ
 zcKoHm933mcBslwq3K4/G6NUPwjqeBaCzObcLtCRLRw5YwKT9WFcqxyFjZR+amloQK+Am1wrX
 lQP+0wUTZ5tzrUvfhDDsUrsUHbLhzMfzbwrNROEzAW6qG2M0+7H5LWwt+8JW/z/b/CaPYiSfl
 /pmFLYHrdEFe9pp7swGC3N/NEdUbvgi3qa3+PawyCuAnmfJq4n6Vja73FuXAxEqGzgobwOwsB
 Y7sDPISDTolXBxEsQhSYe41uhgtBbM9zcUC5n5Uu/oapCTVdtqz6zK0qVA3jrNlDHKWX9XJmI
 ILCxgLBP7x2nhk14fxwEms/7zM8cDmXxZ38OdsE6IHHw7Ggz9Nqg0tDuZgbqEPCxq+ixS1fJn
 caauaDcWhJzbn/4daprYLZGDn7laZysu9lUsxkeJGlNCr494weP68f/pKKtgbBhlTv2q8J3Z6
 3IjqW/0Yk+DTQra5UG90QQ52Z1byMTfYPposxX5o2U/o80KdG0=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

gcc-10 warns about accessing a zero-length struct member:

drivers/media/i2c/s5k5baf.c: In function 's5k5baf_load_setfile':
drivers/media/i2c/s5k5baf.c:390:13: warning: array subscript 65535 is outside the bounds of an interior zero-length array 'struct <anonymous>[0]' [-Wzero-length-bounds]
  390 |   if (f->seq[i].offset + d <= end)
      |       ~~~~~~^~~

This should really be a flexible-array member, but the structure
already has one. I experimentally confirmed that swapping the two
avoids the warning, as the 'data[]' array is not accessed like this.

Fixes: 3ba225b506a2 ("treewide: Replace zero-length array with flexible-array member")
Fixes: 7d459937dc09 ("[media] Add driver for Samsung S5K5BAF camera sensor")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/media/i2c/s5k5baf.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/s5k5baf.c b/drivers/media/i2c/s5k5baf.c
index 42584a088273..0b1ddedcf7dc 100644
--- a/drivers/media/i2c/s5k5baf.c
+++ b/drivers/media/i2c/s5k5baf.c
@@ -277,11 +277,11 @@ enum {
 
 struct s5k5baf_fw {
 	u16 count;
+	u16 data[0];
 	struct {
 		u16 id;
 		u16 offset;
-	} seq[0];
-	u16 data[];
+	} seq[];
 };
 
 struct s5k5baf {
-- 
2.26.0

