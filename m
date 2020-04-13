Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8057F1A6929
	for <lists+linux-media@lfdr.de>; Mon, 13 Apr 2020 17:52:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731106AbgDMPv4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 13 Apr 2020 11:51:56 -0400
Received: from mail2.protonmail.ch ([185.70.40.22]:58459 "EHLO
        mail2.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730865AbgDMPv4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 13 Apr 2020 11:51:56 -0400
Date:   Mon, 13 Apr 2020 15:51:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=spuri.io;
        s=protonmail; t=1586793113;
        bh=rbra6vqOd3+0qys2zYRIijWqxNP8uT07e7frk2jM4G8=;
        h=Date:To:From:Cc:Reply-To:Subject:From;
        b=MW3vL5s7Ri/9vo39Esj9Es1VQu2rb9sR5VfbgJ7db6SF6w8akaXktT4pwCZKPdTlE
         o5pZ775qU8FtneMProovZJbhR2d/NdscIy48OUlR9sP3+U8m0OCnQ2Z4B+nZn8itjD
         9xRoLQSf4/CxtqX/3e0dj0zUSI6HPTMNf24yiWTU=
To:     dave.stevenson@raspberrypi.com
From:   Sameer Puri <purisame@spuri.io>
Cc:     mchehab@kernel.org, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org
Reply-To: Sameer Puri <purisame@spuri.io>
Subject: [PATCH] media: i2c: imx219: remove redundant writes
Message-ID: <20200413155134.250243-1-purisame@spuri.io>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.2 required=7.0 tests=ALL_TRUSTED,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
        autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on mail.protonmail.ch
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

These writes to 0x162, 0x163 already appear earlier in the struct for
the 1920x1080 mode and do not need to be repeated.

Signed-off-by: Sameer Puri <purisame@spuri.io>
---
 drivers/media/i2c/imx219.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
index cb03bdec1f9c..53dafb7f5f2c 100644
--- a/drivers/media/i2c/imx219.c
+++ b/drivers/media/i2c/imx219.c
@@ -253,8 +253,6 @@ static const struct imx219_reg mode_1920_1080_regs[] =
=3D {
 =09{0x4793, 0x10},
 =09{0x4797, 0x0e},
 =09{0x479b, 0x0e},
-=09{0x0162, 0x0d},
-=09{0x0163, 0x78},
 };
=20
 static const struct imx219_reg mode_1640_1232_regs[] =3D {

base-commit: 8f3d9f354286745c751374f5f1fcafee6b3f3136
--=20
2.26.0


