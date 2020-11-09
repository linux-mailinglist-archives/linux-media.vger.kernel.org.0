Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 961FB2ABFD9
	for <lists+linux-media@lfdr.de>; Mon,  9 Nov 2020 16:29:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731911AbgKIP3e (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 9 Nov 2020 10:29:34 -0500
Received: from mo4-p01-ob.smtp.rzone.de ([81.169.146.164]:10297 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731898AbgKIP3e (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 9 Nov 2020 10:29:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1604935772;
        s=strato-dkim-0002; d=fossekall.de;
        h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=3/PcyM/l/9H+hlNAgtQDHAtlA4KPvhoQcMLvAC/QXUM=;
        b=jmaZBQnHCEEqzMgs+OMmil1QQFsWt5kk0LxcGbDis+xxbrs77KuzjHsK6MHlAe/pNg
        0G8lA12NQUfkOfNIilV4H48qQLVHeDMW/Eg/pUMaHF6uUjLIaI3MYACiWjb1mryFW3qF
        dWVWWG6ZXBF1YEx73Nhcpt7DjOCxhDN1mrrTUohx4D0vPbyZMAfXK/ZbcyM33OX8VYIg
        Emg6tACro/vKfqmigPLBZ8SCf/dcSBqATtk9DQKVXkHI8TaLtRwA8L756BrsnX/q0KgS
        Ob0gOSsUXFwkcXOqkp5EiSIbdwyDxH67nlQgHVotNAhcIh9YBiLa7mkFpUOuRVqxNlGq
        IYEQ==
X-RZG-AUTH: ":O2kGeEG7b/pS1EzgE2y7nF0STYsSLflpbjNKxx7cGrBOdI6BL9pkS3QW19mO7I+/JwRspuzJFZuRzQ=="
X-RZG-CLASS-ID: mo00
Received: from aerfugl
        by smtp.strato.de (RZmta 47.3.3 AUTH)
        with ESMTPSA id Y03aecwA9FNSCIK
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
        Mon, 9 Nov 2020 16:23:28 +0100 (CET)
Received: from koltrast.a98shuttle.de ([192.168.1.27] helo=a98shuttle.de)
        by aerfugl with smtp (Exim 4.89)
        (envelope-from <michael@a98shuttle.de>)
        id 1kc90t-0008Ot-91; Mon, 09 Nov 2020 16:23:23 +0100
Received: (nullmailer pid 3164309 invoked by uid 502);
        Mon, 09 Nov 2020 15:23:23 -0000
From:   Michael Klein <michael@fossekall.de>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, Sean Young <sean@mess.org>
Cc:     linux-media@vger.kernel.org, Michael Klein <michael@fossekall.de>
Subject: [PATCH RESEND v2 1/2] media: rc: gpio-ir-recv: add recorder timeout property
Date:   Mon,  9 Nov 2020 16:23:10 +0100
Message-Id: <f6113028e0f22e319172f2f074e64250f0238263.1604589023.git.michael@fossekall.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <cover.1604589023.git.michael@fossekall.de>
References: <cover.1604589023.git.michael@fossekall.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This optional property allows to set the recorder timeout via the
devicetree:

- linux,timeout-us: set the length of a space at which
  the recorder goes idle, specified in microseconds.

Signed-off-by: Michael Klein <michael@fossekall.de>
---
 drivers/media/rc/gpio-ir-recv.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/rc/gpio-ir-recv.c b/drivers/media/rc/gpio-ir-recv.c
index 22e524b69806..eb3e56c27c29 100644
--- a/drivers/media/rc/gpio-ir-recv.c
+++ b/drivers/media/rc/gpio-ir-recv.c
@@ -99,7 +99,8 @@ static int gpio_ir_recv_probe(struct platform_device *pdev)
 	rcdev->dev.parent = dev;
 	rcdev->driver_name = KBUILD_MODNAME;
 	rcdev->min_timeout = 1;
-	rcdev->timeout = IR_DEFAULT_TIMEOUT;
+	if (of_property_read_u32(np, "linux,timeout-us", &rcdev->timeout))
+		rcdev->timeout = IR_DEFAULT_TIMEOUT;
 	rcdev->max_timeout = 10 * IR_DEFAULT_TIMEOUT;
 	rcdev->allowed_protocols = RC_PROTO_BIT_ALL_IR_DECODER;
 	rcdev->map_name = of_get_property(np, "linux,rc-map-name", NULL);
-- 
2.28.0

