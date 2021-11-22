Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D95D5458B54
	for <lists+linux-media@lfdr.de>; Mon, 22 Nov 2021 10:26:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239137AbhKVJ3f (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 22 Nov 2021 04:29:35 -0500
Received: from mail.kernel.org ([198.145.29.99]:59122 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S239002AbhKVJ3W (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 22 Nov 2021 04:29:22 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0FEE860F6E;
        Mon, 22 Nov 2021 09:26:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1637573176;
        bh=IFDTMmTh8HFMsvlLSyw8+5NpCNZ/IGPyxSr0OJMAc9A=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=IEBaaXQjSewfSfM8OxNh+rGrwuxaT6sGPUhT1L3laKny5POk+eehD/o6ZtgZ5x3BV
         j3E13u+Bj2rd4YdRPs5Mu/3KGzjq/b0J7vXUI6U0ti50sLcpJC2YFpr/doo0xigfk8
         lLUd8NSszW1T5YckppNIhuP4yq0i9mGWqV1MHY7aDkqYsTfRUEF565jT7GXFI+/+Ai
         wmSj7YHAouePOGcETcIwQIaVtbl+hGxwP6SQCgrpHsHTbooFcC7wqfZKTvFr7kicfb
         O/Kig92CXOxFFYv6xlthwBBHw2DcHJ2ZN3cNWozG8PZw1MYtQ5zSqXAQqo5MrRnqqz
         9R9VcSjtVUEpw==
Received: by mail.kernel.org with local (Exim 4.94.2)
        (envelope-from <mchehab@kernel.org>)
        id 1mp5aX-003hiM-47; Mon, 22 Nov 2021 09:26:13 +0000
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        llvm@lists.linux.dev
Subject: [PATCH 04/10] media: stb6100: mark a currently unused function as such
Date:   Mon, 22 Nov 2021 09:26:06 +0000
Message-Id: <7c6019a794f8d009ce931197943fe4871cd6d6c3.1637573097.git.mchehab+huawei@kernel.org>
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

The stb6100_normalise_regs() function is not used with current
boards, but the driver says that some devices could need it.
Ok, we could simply drop it, but as there's a macro to mark
unused functions, use it.

This should shut up a clang warning.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---

To avoid mailbombing on a large number of people, only mailing lists were C/C on the cover.
See [PATCH 00/10] at: https://lore.kernel.org/all/cover.1637573097.git.mchehab+huawei@kernel.org/

 drivers/media/dvb-frontends/stb6100.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/dvb-frontends/stb6100.c b/drivers/media/dvb-frontends/stb6100.c
index d541d6613610..ea1d260e4d70 100644
--- a/drivers/media/dvb-frontends/stb6100.c
+++ b/drivers/media/dvb-frontends/stb6100.c
@@ -110,7 +110,7 @@ static const struct stb6100_regmask stb6100_template[] = {
 /*
  * Currently unused. Some boards might need it in the future
  */
-static inline void stb6100_normalise_regs(u8 regs[])
+static __maybe_unused inline void stb6100_normalise_regs(u8 regs[])
 {
 	int i;
 
-- 
2.33.1

