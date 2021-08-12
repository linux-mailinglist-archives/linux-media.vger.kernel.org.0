Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D29473EA908
	for <lists+linux-media@lfdr.de>; Thu, 12 Aug 2021 19:02:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234215AbhHLRCc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 12 Aug 2021 13:02:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41273 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234160AbhHLRCa (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 12 Aug 2021 13:02:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1628787724;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=lzfndhflF+wd6yiYGmCwi7SKf8tfaBBXC1snuqNvgik=;
        b=cRYqsnsiMaNFZIXsgOO60j2N4/SWxZpGZ6g1DzOttd9b/2LCKfOYf8k1F0zUDj464DRfky
        njblFcH25/rqMA/QYhhMNxr92pUIY7SO7IxfWVLhlR4mTxwpb84mPTIoVpK51HDNgXsGZj
        6feU2IKJybN5QmvFeEgiWwtlnSSmwaU=
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com
 [209.85.167.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-7-WkQDscbWPA-L70wR910P_w-1; Thu, 12 Aug 2021 13:00:57 -0400
X-MC-Unique: WkQDscbWPA-L70wR910P_w-1
Received: by mail-oi1-f200.google.com with SMTP id t42-20020a05680815aab0290267a116f6b3so3180923oiw.0
        for <linux-media@vger.kernel.org>; Thu, 12 Aug 2021 10:00:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lzfndhflF+wd6yiYGmCwi7SKf8tfaBBXC1snuqNvgik=;
        b=F66rhz7XEOpmQWi8zRUYsZiICU132xUYyoFcV6JpBQKlxbnrSekBOGYlJpueEzE+uW
         gW6ymcsqpTgECiLmnXiygTew6ptUyh0lrNZ7edxxNs37UKuMBwUWsrWRCgfLMCfmRHts
         NmFU8NfPTsOFbtbcjTw2Panpg+VfpQsdu940CVkxcVzs8WY4weDqL0oIsFsUJaG6ahQ5
         2NfFHQnGdwEFc42yyZFP1iWx1WLnv/tdMdU2kRnvMP9GdERl8GIGO8MhCbb7JUwDjOhj
         LNkCWXPPoetEh/LPMS+M1AXsIBvwLGAb3oVivpqHrnhjbULxvw4K9oU/PqOtFOAeoesA
         Xhpw==
X-Gm-Message-State: AOAM533eevOh8HnpgtLqnUhQ47XqIvz+h1WbJ17dT83DxPiu5+GoqzAZ
        PDJHQOzxDRb57uJIDGBHiibr3BseB45TVg76Gwjq99lN1NWwwCfpB4mlCecz5/0tLLqU+pFxaRc
        1qXVGRUtD4zO4H1COQxPw5jc=
X-Received: by 2002:a9d:206a:: with SMTP id n97mr4153368ota.247.1628787656516;
        Thu, 12 Aug 2021 10:00:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzLJG+qeojkPAWrgQnIckkIT0lYWQZF7QBKca/wrMOL4142OtxbdL+wDGfvvHhTpw7wuRL3Bg==
X-Received: by 2002:a9d:206a:: with SMTP id n97mr4153342ota.247.1628787656245;
        Thu, 12 Aug 2021 10:00:56 -0700 (PDT)
Received: from localhost.localdomain.com (075-142-250-213.res.spectrum.com. [75.142.250.213])
        by smtp.gmail.com with ESMTPSA id l9sm733981otr.34.2021.08.12.10.00.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Aug 2021 10:00:55 -0700 (PDT)
From:   trix@redhat.com
To:     tharvey@gateworks.com, mchehab@kernel.org, hans.verkuil@cisco.com
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Tom Rix <trix@redhat.com>
Subject: [PATCH] media: TDA1997x: handle short reads of hdmi info frame.
Date:   Thu, 12 Aug 2021 10:00:43 -0700
Message-Id: <20210812170043.1046669-1-trix@redhat.com>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Tom Rix <trix@redhat.com>

Static analysis reports this representative problem

tda1997x.c:1939: warning: 7th function call argument is an uninitialized
value

The 7th argument is buffer[0], which is set in the earlier call to
io_readn().  When io_readn() call to io_read() fails with the first
read, buffer[0] is not set and 0 is returned and stored in len.

The later call to hdmi_infoframe_unpack()'s size parameter is the
static size of buffer, always 40, so a short read is not caught
in hdmi_infoframe_unpacks()'s checking.  The variable len should be
used instead.

Zero initialize buffer to 0 so it is in a known start state.

Fixes: 9ac0038db9a7 ("media: i2c: Add TDA1997x HDMI receiver driver")
Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/media/i2c/tda1997x.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/media/i2c/tda1997x.c b/drivers/media/i2c/tda1997x.c
index 1e2a263be9335..0b995424cb346 100644
--- a/drivers/media/i2c/tda1997x.c
+++ b/drivers/media/i2c/tda1997x.c
@@ -1248,13 +1248,13 @@ tda1997x_parse_infoframe(struct tda1997x_state *state, u16 addr)
 {
 	struct v4l2_subdev *sd = &state->sd;
 	union hdmi_infoframe frame;
-	u8 buffer[40];
+	u8 buffer[40] = { 0 };
 	u8 reg;
 	int len, err;
 
 	/* read data */
 	len = io_readn(sd, addr, sizeof(buffer), buffer);
-	err = hdmi_infoframe_unpack(&frame, buffer, sizeof(buffer));
+	err = hdmi_infoframe_unpack(&frame, buffer, len);
 	if (err) {
 		v4l_err(state->client,
 			"failed parsing %d byte infoframe: 0x%04x/0x%02x\n",
@@ -1928,13 +1928,13 @@ static int tda1997x_log_infoframe(struct v4l2_subdev *sd, int addr)
 {
 	struct tda1997x_state *state = to_state(sd);
 	union hdmi_infoframe frame;
-	u8 buffer[40];
+	u8 buffer[40] = { 0 };
 	int len, err;
 
 	/* read data */
 	len = io_readn(sd, addr, sizeof(buffer), buffer);
 	v4l2_dbg(1, debug, sd, "infoframe: addr=%d len=%d\n", addr, len);
-	err = hdmi_infoframe_unpack(&frame, buffer, sizeof(buffer));
+	err = hdmi_infoframe_unpack(&frame, buffer, len);
 	if (err) {
 		v4l_err(state->client,
 			"failed parsing %d byte infoframe: 0x%04x/0x%02x\n",
-- 
2.26.3

