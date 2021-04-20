Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1CD24364F5C
	for <lists+linux-media@lfdr.de>; Tue, 20 Apr 2021 02:16:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232568AbhDTAQr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 19 Apr 2021 20:16:47 -0400
Received: from mail.kernel.org ([198.145.29.99]:43184 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229839AbhDTAQq (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 19 Apr 2021 20:16:46 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id D0BFE6109E;
        Tue, 20 Apr 2021 00:16:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1618877775;
        bh=RuGZCj+sX5ZTL28y992V3ayzipRD8egJRGrwzm9ZpZ4=;
        h=Date:From:To:Cc:Subject:From;
        b=bidhB3aQPkctWPKgxS8fzdGp9Dk84PrJWl2pA3v/8CgnjtvRwlPRZxh02VWbFV+83
         vyBidcnXeBtEEFoKzRFO+7nm+/WAYbseplJRCkmwpJGPYREYfH+w3+bD02ZbBoaeZt
         w20w52QnIWRpv+VL0E3dI9WBRp3weUM8r4iHKe6LusR8RyC+5j7i/8ajPbSE1c9xDU
         XnRYGWKx9FS57qriQjNJ+WpQ8oYUzktw9jq+b85eGPzBYXjsBAd9e/n5QHQyq1ZpHI
         Smeeah7bRtTiA6GnNyDQycKCJjy8rw9qgmahN7zbhtJOSfmThtr0tTWPScwpRw1DAQ
         vvl5ruQlVbEkA==
Date:   Mon, 19 Apr 2021 19:16:31 -0500
From:   "Gustavo A. R. Silva" <gustavoars@kernel.org>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Ralph Metzler <rjkm@metzlerbros.de>,
        Matthias Benesch <twoof7@freenet.de>,
        Oliver Endriss <o.endriss@gmx.de>
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        linux-hardening@vger.kernel.org, Kees Cook <keescook@chromium.org>
Subject: [PATCH] media: ngene: Fix out-of-bounds bug in
 ngene_command_config_free_buf()
Message-ID: <20210420001631.GA45456@embeddedor>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Fix an 11-year old bug in ngene_command_config_free_buf() while
addressing the following warnings caught with -Warray-bounds:

arch/alpha/include/asm/string.h:22:16: warning: '__builtin_memcpy' offset [12, 16] from the object at 'com' is out of the bounds of referenced subobject 'config' with type 'unsigned char' at offset 10 [-Warray-bounds]
arch/x86/include/asm/string_32.h:182:25: warning: '__builtin_memcpy' offset [12, 16] from the object at 'com' is out of the bounds of referenced subobject 'config' with type 'unsigned char' at offset 10 [-Warray-bounds]

The problem is that the original code is trying to copy 6 bytes of
data into a one-byte size member _config_ of the wrong structue
FW_CONFIGURE_BUFFERS, in a single call to memcpy(). This causes a
legitimate compiler warning because memcpy() overruns the length
of &com.cmd.ConfigureBuffers.config. It seems that the right
structure is FW_CONFIGURE_FREE_BUFFERS, instead, because it contains
6 more members apart from the header _hdr_. Also, the name of
the function ngene_command_config_free_buf() suggests that the actual
intention is to ConfigureFreeBuffers, instead of ConfigureBuffers
(which configuration takes place in the function ngene_command_config_buf(),
above).

Fix this by enclosing those 6 members of struct FW_CONFIGURE_FREE_BUFFERS
into new struct config, and use &com.cmd.ConfigureFreeBuffers.config as
the destination address, instead of &com.cmd.ConfigureBuffers.config,
when calling memcpy().

This also helps with the ongoing efforts to globally enable
-Warray-bounds and get us closer to being able to tighten the
FORTIFY_SOURCE routines on memcpy().

Link: https://github.com/KSPP/linux/issues/109
Fixes: dae52d009fc9 ("V4L/DVB: ngene: Initial check-in")
Cc: stable@vger.kernel.org
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
---
 drivers/media/pci/ngene/ngene-core.c |  2 +-
 drivers/media/pci/ngene/ngene.h      | 14 ++++++++------
 2 files changed, 9 insertions(+), 7 deletions(-)

diff --git a/drivers/media/pci/ngene/ngene-core.c b/drivers/media/pci/ngene/ngene-core.c
index 07f342db6701..7481f553f959 100644
--- a/drivers/media/pci/ngene/ngene-core.c
+++ b/drivers/media/pci/ngene/ngene-core.c
@@ -385,7 +385,7 @@ static int ngene_command_config_free_buf(struct ngene *dev, u8 *config)
 
 	com.cmd.hdr.Opcode = CMD_CONFIGURE_FREE_BUFFER;
 	com.cmd.hdr.Length = 6;
-	memcpy(&com.cmd.ConfigureBuffers.config, config, 6);
+	memcpy(&com.cmd.ConfigureFreeBuffers.config, config, 6);
 	com.in_len = 6;
 	com.out_len = 0;
 
diff --git a/drivers/media/pci/ngene/ngene.h b/drivers/media/pci/ngene/ngene.h
index 84f04e0e0cb9..3d296f1998a1 100644
--- a/drivers/media/pci/ngene/ngene.h
+++ b/drivers/media/pci/ngene/ngene.h
@@ -407,12 +407,14 @@ enum _BUFFER_CONFIGS {
 
 struct FW_CONFIGURE_FREE_BUFFERS {
 	struct FW_HEADER hdr;
-	u8   UVI1_BufferLength;
-	u8   UVI2_BufferLength;
-	u8   TVO_BufferLength;
-	u8   AUD1_BufferLength;
-	u8   AUD2_BufferLength;
-	u8   TVA_BufferLength;
+	struct {
+		u8   UVI1_BufferLength;
+		u8   UVI2_BufferLength;
+		u8   TVO_BufferLength;
+		u8   AUD1_BufferLength;
+		u8   AUD2_BufferLength;
+		u8   TVA_BufferLength;
+	} __packed config;
 } __attribute__ ((__packed__));
 
 struct FW_CONFIGURE_UART {
-- 
2.27.0

