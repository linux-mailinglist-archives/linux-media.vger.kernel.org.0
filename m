Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C7C7D2BB2D5
	for <lists+linux-media@lfdr.de>; Fri, 20 Nov 2020 19:37:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729877AbgKTS0L (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 20 Nov 2020 13:26:11 -0500
Received: from mail.kernel.org ([198.145.29.99]:47286 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729861AbgKTS0L (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 20 Nov 2020 13:26:11 -0500
Received: from embeddedor (187-162-31-110.static.axtel.net [187.162.31.110])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B32242224C;
        Fri, 20 Nov 2020 18:26:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1605896770;
        bh=seU4yUgdzjzcMiYARuvKKFDMQ2hsLlaQDOpY+Rp7xVA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=0LvOrjJ3g6Z9fx94QA8eV2yGvcmpgPkNP//qeL3x9uxabz2gofU+lk+aevLFFC/0R
         bLuA2ZhnIAOCh7W9r0prGDKU2TaaFsWnuIIL+yGHVW1BN2Jjj+opaQLBfuSUDjpqK5
         ozqPzhfvsXMMO3YhM8J1E6yJn/v765v3/6nnQjFE=
Date:   Fri, 20 Nov 2020 12:26:16 -0600
From:   "Gustavo A. R. Silva" <gustavoars@kernel.org>
To:     Antti Palosaari <crope@iki.fi>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Malcolm Priestley <tvboxspy@gmail.com>
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-hardening@vger.kernel.org,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>
Subject: [PATCH 014/141] media: usb: dvb-usb-v2: Fix fall-through warnings
 for Clang
Message-ID: <173371a50a3e26a2ab39baaa6aa883f6bd416b8a.1605896059.git.gustavoars@kernel.org>
References: <cover.1605896059.git.gustavoars@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1605896059.git.gustavoars@kernel.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

In preparation to enable -Wimplicit-fallthrough for Clang, fix multiple
warnings by explicitly adding a couple of break statements instead of
just letting the code fall through to the next case.

Link: https://github.com/KSPP/linux/issues/115
Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
---
 drivers/media/usb/dvb-usb-v2/af9015.c  | 1 +
 drivers/media/usb/dvb-usb-v2/lmedm04.c | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/media/usb/dvb-usb-v2/af9015.c b/drivers/media/usb/dvb-usb-v2/af9015.c
index c70b3cef3176..d33514acc2b5 100644
--- a/drivers/media/usb/dvb-usb-v2/af9015.c
+++ b/drivers/media/usb/dvb-usb-v2/af9015.c
@@ -51,6 +51,7 @@ static int af9015_ctrl_msg(struct dvb_usb_device *d, struct req_t *req)
 		if (((req->addr & 0xff00) == 0xff00) ||
 		    ((req->addr & 0xff00) == 0xae00))
 			state->buf[0] = WRITE_VIRTUAL_MEMORY;
+		break;
 	case WRITE_VIRTUAL_MEMORY:
 	case COPY_FIRMWARE:
 	case DOWNLOAD_FIRMWARE:
diff --git a/drivers/media/usb/dvb-usb-v2/lmedm04.c b/drivers/media/usb/dvb-usb-v2/lmedm04.c
index 5a7a9522d46d..67c37fb267e3 100644
--- a/drivers/media/usb/dvb-usb-v2/lmedm04.c
+++ b/drivers/media/usb/dvb-usb-v2/lmedm04.c
@@ -336,6 +336,7 @@ static void lme2510_int_response(struct urb *lme_urb)
 				st->signal_level = ibuf[5];
 				st->signal_sn = ibuf[4];
 				st->time_key = ibuf[7];
+				break;
 			default:
 				break;
 			}
-- 
2.27.0

