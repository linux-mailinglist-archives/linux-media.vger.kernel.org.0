Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4213545CCE3
	for <lists+linux-media@lfdr.de>; Wed, 24 Nov 2021 20:14:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351122AbhKXTQn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 24 Nov 2021 14:16:43 -0500
Received: from mail.kernel.org ([198.145.29.99]:52772 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1350949AbhKXTQl (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 24 Nov 2021 14:16:41 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4E5BF61053;
        Wed, 24 Nov 2021 19:13:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1637781211;
        bh=g0AsuZ12k/WkxlcvsLFNmv8i+pWVEahe+94IcgxRpNA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=BfRhCP0KmFkhCfgS39ZOO6jGsw2Sm0SH//aSE6g6dEkTNIdSK+HyfIiN3vhM21fs+
         +FPntglC2f5vrm/ZYxmIspsIf6W8kNnLxWzQBcypuH4ziGl+rOdFTjfErjK3nfO5DH
         Ui+4Nai4fBqElDTXohgU6d9Thx3wEGuodn+XA6kJlSw4DRHlh6YwJ1KOvpf45Ehe+Y
         oNsMEDbXhZsmtUrI6jMXoLIj6CsVlU8XUKNowTgDTBLZ2MssBHyMAfdM3Fw5vh7tjL
         jeq6E+G4fRRxA8JFxHdq6GAlb237ne01HhkO/+DPDsC7nb+ZUkUsSngdMuAfmkt9Za
         oASCY8BF17jzg==
Received: by mail.kernel.org with local (Exim 4.94.2)
        (envelope-from <mchehab@kernel.org>)
        id 1mpxhs-004Q5J-Hj; Wed, 24 Nov 2021 20:13:24 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Antti Palosaari <crope@iki.fi>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        llvm@lists.linux.dev
Subject: [PATCH 06/20] media: m88ds3103: drop reg11 calculus from m88ds3103b_select_mclk()
Date:   Wed, 24 Nov 2021 20:13:09 +0100
Message-Id: <9e528a0ce280d8ce99f9bfe1a725baafa6bf1408.1637781097.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <cover.1637781097.git.mchehab+huawei@kernel.org>
References: <cover.1637781097.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This vaklue is never used at the code. So, drop it.

Solves a W=1 clang warning.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---

To avoid mailbombing on a large number of people, only mailing lists were C/C on the cover.
See [PATCH 00/20] at: https://lore.kernel.org/all/cover.1637781097.git.mchehab+huawei@kernel.org/

 drivers/media/dvb-frontends/m88ds3103.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/media/dvb-frontends/m88ds3103.c b/drivers/media/dvb-frontends/m88ds3103.c
index 02e8aa11e36e..bce0f42f3d19 100644
--- a/drivers/media/dvb-frontends/m88ds3103.c
+++ b/drivers/media/dvb-frontends/m88ds3103.c
@@ -451,7 +451,7 @@ static int m88ds3103b_select_mclk(struct m88ds3103_dev *dev)
 
 static int m88ds3103b_set_mclk(struct m88ds3103_dev *dev, u32 mclk_khz)
 {
-	u8 reg11 = 0x0A, reg15, reg16, reg1D, reg1E, reg1F, tmp;
+	u8 reg15, reg16, reg1D, reg1E, reg1F, tmp;
 	u8 sm, f0 = 0, f1 = 0, f2 = 0, f3 = 0;
 	u16 pll_div_fb, N;
 	u32 div;
@@ -480,8 +480,6 @@ static int m88ds3103b_set_mclk(struct m88ds3103_dev *dev, u32 mclk_khz)
 	div /= mclk_khz;
 
 	if (dev->cfg->ts_mode == M88DS3103_TS_SERIAL) {
-		reg11 |= 0x02;
-
 		if (div <= 32) {
 			N = 2;
 
@@ -532,8 +530,6 @@ static int m88ds3103b_set_mclk(struct m88ds3103_dev *dev, u32 mclk_khz)
 		else if ((f3 < 8) && (f3 != 0))
 			f3 = 8;
 	} else {
-		reg11 &= ~0x02;
-
 		if (div <= 32) {
 			N = 2;
 
-- 
2.33.1

