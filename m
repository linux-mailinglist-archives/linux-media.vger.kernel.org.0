Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E09DC5EBB84
	for <lists+linux-media@lfdr.de>; Tue, 27 Sep 2022 09:33:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229603AbiI0Hc6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Sep 2022 03:32:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46066 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229652AbiI0Hc5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Sep 2022 03:32:57 -0400
Received: from mail.turbocat.net (turbocat.net [IPv6:2a01:4f8:c17:6c4b::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE90F7B1D8
        for <linux-media@vger.kernel.org>; Tue, 27 Sep 2022 00:32:54 -0700 (PDT)
Received: from [10.36.2.155] (unknown [178.232.223.95])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by mail.turbocat.net (Postfix) with ESMTPSA id B24E02600F3;
        Tue, 27 Sep 2022 09:32:52 +0200 (CEST)
Message-ID: <eeb06501-2119-1e22-8fb9-c19a691b24a3@selasky.org>
Date:   Tue, 27 Sep 2022 09:32:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; FreeBSD amd64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
To:     linux-media@vger.kernel.org,
        =?UTF-8?B?7Jyg7Jqp7IiY?= <yongsuyoo0215@gmail.com>
Content-Language: en-US
From:   Hans Petter Selasky <hps@selasky.org>
Subject: [PATCH] media: dvb_ringbuffer: Fix bug in DVB's ringbuffer logic
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Properly account for negative values when computing the consumed
value for DVB ringbuffers, by adding the size of the ring-buffer.
The modulus is unsigned so no out of bounds is possible, but
dvb_ringbuffer_pkt_next() may fail for CA's at least when the
default buffer size of 65535 bytes is used.

The current logic only works for buffer sizes that are power of two.

Signed-off-by: Yong Su Yoo <yongsuyoo0215@gmail.com>
Signed-off-by: Hans Petter Selasky <hps@selasky.org>
---
  drivers/media/dvb-core/dvb_ringbuffer.c | 4 +++-
  1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/media/dvb-core/dvb_ringbuffer.c 
b/drivers/media/dvb-core/dvb_ringbuffer.c
index d1d471af0636..7d4558de8e83 100644
--- a/drivers/media/dvb-core/dvb_ringbuffer.c
+++ b/drivers/media/dvb-core/dvb_ringbuffer.c
@@ -335,7 +335,9 @@ ssize_t dvb_ringbuffer_pkt_next(struct 
dvb_ringbuffer *rbuf, size_t idx, size_t*
  		idx = (idx + curpktlen + DVB_RINGBUFFER_PKTHDRSIZE) % rbuf->size;
  	}

-	consumed = (idx - rbuf->pread) % rbuf->size;
+	consumed = (idx - rbuf->pread);
+	if (consumed < 0)
+		consumed += rbuf->size;

  	while((dvb_ringbuffer_avail(rbuf) - consumed) > 
DVB_RINGBUFFER_PKTHDRSIZE) {

-- 
2.37.3
