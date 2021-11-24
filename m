Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0857045CCEC
	for <lists+linux-media@lfdr.de>; Wed, 24 Nov 2021 20:14:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351267AbhKXTQs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 24 Nov 2021 14:16:48 -0500
Received: from mail.kernel.org ([198.145.29.99]:52870 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1351111AbhKXTQm (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 24 Nov 2021 14:16:42 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6B7186109E;
        Wed, 24 Nov 2021 19:13:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1637781211;
        bh=A9kzMO8wWtY/42/gi65g4Ok6WX2I/r/77pq5M1BvF/Q=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=nWzaRJfL/smkHVo1lgXZUiu5xpz7mynotbLWo/PC0Wbl9JL+CRb/0mIJHSsS7xBbg
         DXiPXy0mE31qaOGrOBgrk0SwhV61ECRNq3rTsKZalQAu/HK3legGwzJPAsdL5O9HWz
         3FYhOJRDTpLSkFgSjtszIDGayvnKYC9bTz+GC0wXPOl8FtOSIZvDmrPG9JIBCPw1yg
         R/4kLwRNVMTYiWvji71ZMa90WrCWvtQFXIFRhslo6EtAamR4eNgPC5ocRfHA46lZTm
         U7By8CLcsjI3NZNmyYWYN6MYYu2GW86wSI7nrqbVVTL4MNv4wTICFxcNv2VKojSAx4
         3ixkTWHj9e75Q==
Received: by mail.kernel.org with local (Exim 4.94.2)
        (envelope-from <mchehab@kernel.org>)
        id 1mpxhs-004Q5b-K6; Wed, 24 Nov 2021 20:13:24 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Malcolm Priestley <tvboxspy@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        llvm@lists.linux.dev
Subject: [PATCH 11/20] media: lmedm04: don't ignore errors when setting a filter
Date:   Wed, 24 Nov 2021 20:13:14 +0100
Message-Id: <7da947b5433ecdd9cf1f2a50f4ae5cbc493dc844.1637781097.git.mchehab+huawei@kernel.org>
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

Solves a clang warning

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---

To avoid mailbombing on a large number of people, only mailing lists were C/C on the cover.
See [PATCH 00/20] at: https://lore.kernel.org/all/cover.1637781097.git.mchehab+huawei@kernel.org/

 drivers/media/usb/dvb-usb-v2/lmedm04.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/media/usb/dvb-usb-v2/lmedm04.c b/drivers/media/usb/dvb-usb-v2/lmedm04.c
index fe4d886442a4..8a34e6c0d6a6 100644
--- a/drivers/media/usb/dvb-usb-v2/lmedm04.c
+++ b/drivers/media/usb/dvb-usb-v2/lmedm04.c
@@ -423,6 +423,9 @@ static int lme2510_pid_filter_ctrl(struct dvb_usb_adapter *adap, int onoff)
 
 	mutex_unlock(&d->i2c_mutex);
 
+	if (ret)
+		return -EREMOTEIO;
+
 	return 0;
 }
 
-- 
2.33.1

