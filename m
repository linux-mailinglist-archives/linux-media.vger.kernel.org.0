Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 66A543CFEF7
	for <lists+linux-media@lfdr.de>; Tue, 20 Jul 2021 18:13:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231515AbhGTPcs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 20 Jul 2021 11:32:48 -0400
Received: from smtp-relay-canonical-0.canonical.com ([185.125.188.120]:39970
        "EHLO smtp-relay-canonical-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S238592AbhGTP1X (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 20 Jul 2021 11:27:23 -0400
Received: from localhost (1.general.cking.uk.vpn [10.172.193.212])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPSA id 65E4C405FC;
        Tue, 20 Jul 2021 16:07:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1626797280;
        bh=BamL6ieKcOJ11og7wi6bzdOGpaM7S+jvOc9FCtOg8M8=;
        h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type;
        b=NyfLiqebzsym5tHDre5MuWTGGfK9ZUZ2cmBcjhN2wcgbuiCv5eUZFfLq+eZHn2L/i
         ZVl8gZeIr2MoF+Q77zTFpILtEQK8awIOFz5H6wVC7IL9mHlzlENMYDGwsfP4TdkWvB
         tvGOVz1p/h+pazRcJWxCugaWoCEVzn10CUqkAt0YXzh/rcx6FDXoZaXBN6yWDXuqrH
         x5anBAj6g/FSJVTS6lXGYqK5P0CHjNMQbqeAM9fk67gONo2Vdc4do2r6DlwQq8ur4T
         qlpR42+NfoCprnEceF7nkjKqFc5S0m/WETkDZCre9+cNn3Iwf/RYFV0s81HU427CcS
         C9ngs5Hlxrz1g==
From:   Colin King <colin.king@canonical.com>
To:     Yasunari Takiguchi <Yasunari.Takiguchi@sony.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        Sean Young <sean@mess.org>, linux-media@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH][next] media: cxd2880-spi: Fix a null pointer dereference on error handling path
Date:   Tue, 20 Jul 2021 17:07:49 +0100
Message-Id: <20210720160749.73928-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Currently the null pointer check on dvb_spi->vcc_supply is inverted and
this leads to only null values of the dvb_spi->vcc_supply being passed
to the call of regulator_disable causing null pointer dereferences.
Fix this by only calling regulator_disable if dvb_spi->vcc_supply is
not null.

Addresses-Coverity: ("Dereference after null check")
Fixes: dcb014582101 ("media: cxd2880-spi: Fix an error handling path")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/media/spi/cxd2880-spi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/spi/cxd2880-spi.c b/drivers/media/spi/cxd2880-spi.c
index b91a1e845b97..506f52c1af10 100644
--- a/drivers/media/spi/cxd2880-spi.c
+++ b/drivers/media/spi/cxd2880-spi.c
@@ -618,7 +618,7 @@ cxd2880_spi_probe(struct spi_device *spi)
 fail_attach:
 	dvb_unregister_adapter(&dvb_spi->adapter);
 fail_adapter:
-	if (!dvb_spi->vcc_supply)
+	if (dvb_spi->vcc_supply)
 		regulator_disable(dvb_spi->vcc_supply);
 fail_regulator:
 	kfree(dvb_spi);
-- 
2.31.1

