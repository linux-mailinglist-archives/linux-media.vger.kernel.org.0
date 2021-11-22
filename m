Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 301BF458B50
	for <lists+linux-media@lfdr.de>; Mon, 22 Nov 2021 10:26:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239059AbhKVJ3b (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 22 Nov 2021 04:29:31 -0500
Received: from mail.kernel.org ([198.145.29.99]:59128 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S239023AbhKVJ3W (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 22 Nov 2021 04:29:22 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 149AD60F9B;
        Mon, 22 Nov 2021 09:26:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1637573176;
        bh=4TDF/meSmH9P8NXdrllwOhgzw5y7vK0ZgL9dB9o7ei4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=GT3Sx4AMHGiuXTEMlltPOv+2cVn1Lvir3AJv/InfVK5lwmpYOK9F8jmqOfWJ9fb+a
         x7I2epu/1Nyvk4lQH/BpVgRlpFcFEkZQAvfs1Z0UaQ2GYKNucKf3jzH2lqCyhoPwoY
         QzHG5E651O4JBWpX8RhzTEDI9fgAGny+w3otZhfADGzW5qXad+18wXDypWvEgg3YSi
         i3Skflzwzh8bYyX1JwySxyk67XGKyAlzo2kuMP4q0XU6GcxmfyOhDpOR9WAC/BsPsx
         emMAqjXDvGxxANfT/N6cGb/x/Q985tVsMx9JoHSB6Dg4vkXBTM6iG630Jt5uC2Wd5z
         dfoLkytNzEvqA==
Received: by mail.kernel.org with local (Exim 4.94.2)
        (envelope-from <mchehab@kernel.org>)
        id 1mp5aX-003hiV-5f; Mon, 22 Nov 2021 09:26:13 +0000
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        llvm@lists.linux.dev
Subject: [PATCH 07/10] media: cx25840: drop some unused inline functions
Date:   Mon, 22 Nov 2021 09:26:09 +0000
Message-Id: <3848ff3a727c3af651eaf809cc4e41375e943f4e.1637573097.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <cover.1637573097.git.mchehab+huawei@kernel.org>
References: <cover.1637573097.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Solve some clang warnings about unused functions by dropping
some time-conversion inline funcs that aren't used anywhere.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---

To avoid mailbombing on a large number of people, only mailing lists were C/C on the cover.
See [PATCH 00/10] at: https://lore.kernel.org/all/cover.1637573097.git.mchehab+huawei@kernel.org/

 drivers/media/i2c/cx25840/cx25840-ir.c | 20 --------------------
 1 file changed, 20 deletions(-)

diff --git a/drivers/media/i2c/cx25840/cx25840-ir.c b/drivers/media/i2c/cx25840/cx25840-ir.c
index 2cf3e6a1f9e1..9d7d1d149f1a 100644
--- a/drivers/media/i2c/cx25840/cx25840-ir.c
+++ b/drivers/media/i2c/cx25840/cx25840-ir.c
@@ -136,19 +136,6 @@ static inline u16 count_to_clock_divider(unsigned int d)
 	return (u16) d;
 }
 
-static inline u16 ns_to_clock_divider(unsigned int ns)
-{
-	return count_to_clock_divider(
-		DIV_ROUND_CLOSEST(CX25840_IR_REFCLK_FREQ / 1000000 * ns, 1000));
-}
-
-static inline unsigned int clock_divider_to_ns(unsigned int divider)
-{
-	/* Period of the Rx or Tx clock in ns */
-	return DIV_ROUND_CLOSEST((divider + 1) * 1000,
-				 CX25840_IR_REFCLK_FREQ / 1000000);
-}
-
 static inline u16 carrier_freq_to_clock_divider(unsigned int freq)
 {
 	return count_to_clock_divider(
@@ -160,13 +147,6 @@ static inline unsigned int clock_divider_to_carrier_freq(unsigned int divider)
 	return DIV_ROUND_CLOSEST(CX25840_IR_REFCLK_FREQ, (divider + 1) * 16);
 }
 
-static inline u16 freq_to_clock_divider(unsigned int freq,
-					unsigned int rollovers)
-{
-	return count_to_clock_divider(
-		   DIV_ROUND_CLOSEST(CX25840_IR_REFCLK_FREQ, freq * rollovers));
-}
-
 static inline unsigned int clock_divider_to_freq(unsigned int divider,
 						 unsigned int rollovers)
 {
-- 
2.33.1

