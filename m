Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F2B7F5DF38
	for <lists+linux-media@lfdr.de>; Wed,  3 Jul 2019 10:00:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727049AbfGCIAk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 3 Jul 2019 04:00:40 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:48969 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726670AbfGCIAj (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 3 Jul 2019 04:00:39 -0400
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
        by youngberry.canonical.com with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
        (Exim 4.76)
        (envelope-from <colin.king@canonical.com>)
        id 1hiaBv-0007oX-V5; Wed, 03 Jul 2019 08:00:36 +0000
From:   Colin King <colin.king@canonical.com>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] media: cobalt: remove redundant assignment to variable data
Date:   Wed,  3 Jul 2019 09:00:35 +0100
Message-Id: <20190703080035.13975-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The variable data is being initialized with a value that is never
read and it is being updated later with a new value. The
initialization is redundant and can be removed.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/media/pci/cobalt/cobalt-flash.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/pci/cobalt/cobalt-flash.c b/drivers/media/pci/cobalt/cobalt-flash.c
index ef96e0f956d2..1d3c64b4cf6d 100644
--- a/drivers/media/pci/cobalt/cobalt-flash.c
+++ b/drivers/media/pci/cobalt/cobalt-flash.c
@@ -69,7 +69,7 @@ static void flash_copy_to(struct map_info *map, unsigned long to,
 
 	pr_info("%s: offset 0x%x: length %zu\n", __func__, dest, len);
 	while (len) {
-		u16 data = 0xffff;
+		u16 data;
 
 		do {
 			data = *src << (8 * (dest & 1));
-- 
2.20.1

