Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AA06C41FEE4
	for <lists+linux-media@lfdr.de>; Sun,  3 Oct 2021 02:18:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234310AbhJCAUR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 2 Oct 2021 20:20:17 -0400
Received: from wrqvnhvw.outbound-mail.sendgrid.net ([149.72.32.137]:54061 "EHLO
        wrqvnhvw.outbound-mail.sendgrid.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233697AbhJCAUR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 2 Oct 2021 20:20:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cottsay.net;
        h=from:subject:mime-version:to:cc:content-transfer-encoding:
        content-type;
        s=s1; bh=Wc4ZDbRx9dSwzMCmPJqGpzuatH6YLgvjYbr25sQyxlk=;
        b=LME/FN2Qe/WpWXJITRxqoRcd2CvXSZkXOtv6DJH7KbaUGuM52Td6cezWRtUIoQiVfmuJ
        5VvOv2Gr5L+NAfcyp/ZKDUZ4mKcUSP9491/If6kuSjXoMQzQzHQYtyo8OsRJV9Pv2IHtW8
        wnnDNcgb9zJZbBXC8CRF5hNxmRfA2YDi7sh/yW/NMHDFQUErX3nuFygrckS2OUj5yo+CKv
        7SP/9ZOfKwZDU5qkvFH94gLxNVlNGowwGE/2IDHqE7AErpgz3CZYP4kZTLtIcWvTQ1lbT0
        K26Prkgul7cnub3P81kRw0v8cbL548HHcfrjLjZplvgt5fLg3B+rxLNxtPGWXv3w==
Received: by filterdrecv-64fcb979b9-7lnp4 with SMTP id filterdrecv-64fcb979b9-7lnp4-1-6158F6D6-2
        2021-10-03 00:18:30.05293069 +0000 UTC m=+1642856.983491058
Received: from cottsay-server.delphi.cottsay.net (unknown)
        by geopod-ismtpd-5-0 (SG) with ESMTP
        id HUHykGVCQJaa9hgCyknESA
        Sun, 03 Oct 2021 00:18:29.914 +0000 (UTC)
Received: from cottsay-lenovo.delphi.cottsay.net (cottsay-lenovo.delphi.cottsay.net [172.16.8.31])
        by cottsay-server.delphi.cottsay.net (Postfix) with ESMTPSA id 6BB1F3C0462;
        Sat,  2 Oct 2021 17:18:29 -0700 (PDT)
From:   Scott K Logan <logans@cottsay.net>
Subject: [PATCH] media: s5h1411.c: Fix a typo in the VSB SNR table
Date:   Sun, 03 Oct 2021 00:18:30 +0000 (UTC)
Message-Id: <20211003001805.735092-1-logans@cottsay.net>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-SG-EID: =?us-ascii?Q?v4Qh49l2kwszIc8ZaCpP76AQaq=2F9O0v3P=2FmBhAlry1T=2FzVhHBJ8w+hDrqxBvdA?=
 =?us-ascii?Q?KU3ehgFPlGwC1hR8j2nf+OmEIklhuR0Cmb7oLUB?=
 =?us-ascii?Q?U1VgxYkp14eNwID6tyIGTijSKS7EhXnETf7OFaG?=
 =?us-ascii?Q?dVQc1O2Hj98Dtc2Vi90wqjdieyFRiT=2FJVb45TMJ?=
 =?us-ascii?Q?TVIfffWthuVAhAvVOE4+GNJcjx6TEsm+7dX0EDo?=
 =?us-ascii?Q?9ENTdO+EG14TXxDwBZQPwOqyt9lpm5CZqR0=2Fax?=
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
Cc:     Scott K Logan <logans@cottsay.net>
X-Entity-ID: 4JzoG0JXdcXknftrbeCa4w==
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset=us-ascii
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This looks like a typo. By manipulating the antenna on a device while
monitoring the reported SNR, I was able to see the unexpected jump.
After applying this patch, the spike was no longer present.

Signed-off-by: Scott K Logan <logans@cottsay.net>
---
 drivers/media/dvb-frontends/s5h1411.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/dvb-frontends/s5h1411.c b/drivers/media/dvb-frontends/s5h1411.c
index c1334d7eb442..2563a72e98b7 100644
--- a/drivers/media/dvb-frontends/s5h1411.c
+++ b/drivers/media/dvb-frontends/s5h1411.c
@@ -150,7 +150,7 @@ static struct vsb_snr_tab {
 	{  0x35b, 235, },
 	{  0x353, 230, },
 	{  0x349, 225, },
-	{  0x340, 320, },
+	{  0x340, 220, },
 	{  0x337, 215, },
 	{  0x327, 210, },
 	{  0x31b, 205, },
-- 
2.31.1

