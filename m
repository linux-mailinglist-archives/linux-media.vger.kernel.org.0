Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 921E31FCEE4
	for <lists+linux-media@lfdr.de>; Wed, 17 Jun 2020 15:55:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726594AbgFQNzx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 17 Jun 2020 09:55:53 -0400
Received: from smtp4-g21.free.fr ([212.27.42.4]:12662 "EHLO smtp4-g21.free.fr"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726494AbgFQNzx (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 17 Jun 2020 09:55:53 -0400
Received: from [192.168.1.91] (unknown [77.207.133.132])
        (Authenticated sender: marc.w.gonzalez)
        by smtp4-g21.free.fr (Postfix) with ESMTPSA id 2497919F4F3;
        Wed, 17 Jun 2020 15:55:12 +0200 (CEST)
To:     Brad Love <brad@nextdimension.cc>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Cc:     linux-media <linux-media@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
From:   Marc Gonzalez <marc.w.gonzalez@free.fr>
Subject: Re: si2168: different default that windows driver
Message-ID: <bab43a4a-d213-96ed-cb88-fb2d1470e99f@free.fr>
Date:   Wed, 17 Jun 2020 15:55:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello Brad,

I found this patch you wrote:
https://github.com/b-rad-NDi/Ubuntu-media-tree-kernel-builder/blob/master/patches/mainline-extra/tip/10.random.patches/0004-si2168-different-default-that-windows-driver.patch

Subject: [PATCH 4/5] si2168: different default that windows driver

Unsure of meaning, look into...
---
 drivers/media/dvb-frontends/si2168.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/dvb-frontends/si2168.c b/drivers/media/dvb-frontends/si2168.c
index 0d9d384cf..72794ead8 100644
--- a/drivers/media/dvb-frontends/si2168.c
+++ b/drivers/media/dvb-frontends/si2168.c
@@ -418,6 +418,8 @@ static int si2168_set_frontend(struct dvb_frontend *fe)
 	}
 
 	cmd_init(&cmd, "\x14\x00\x0f\x10\x10\x00", 6, 4);
+	/* BUGBUG? FW defaults to 1, but windows driver uses 30; above is 0? */
+	cmd.args[5] = 30;
 	ret = si2168_cmd_execute(client, &cmd);
 	if (ret)
 		goto err;


0x14 = SET_PROPERTY
args[1] is ignored
args[2:3] = little-endian property = 0x100f
args[4:5] = little-endian prop_arg = 0x0010

0x100f configures the "Signal Quality Indicator" computation.
The value is averaged over the last N samples.
N = prop_arg_bits[0:4]
(legal values are 1-30, dunno what happens for 0 and 31)

You're not supposed to change args[5] i.e. prop_arg_bits[8:15]
Maybe you meant cmd.args[4] = 30; ?
Or just change the command to "\x14\x00\x0f\x10\x1e\x00" ?
Or just use 16 samples instead of 30 for the averaging?

Regards.
