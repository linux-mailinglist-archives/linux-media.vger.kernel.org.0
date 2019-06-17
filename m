Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 711884807B
	for <lists+linux-media@lfdr.de>; Mon, 17 Jun 2019 13:19:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727836AbfFQLS3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 17 Jun 2019 07:18:29 -0400
Received: from mout.kundenserver.de ([212.227.17.13]:52571 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727831AbfFQLS3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 17 Jun 2019 07:18:29 -0400
Received: from threadripper.lan ([149.172.19.189]) by mrelayeu.kundenserver.de
 (mreue108 [212.227.15.145]) with ESMTPA (Nemesis) id
 1MvJwN-1iTQEy0IQj-00rD7A; Mon, 17 Jun 2019 13:18:25 +0200
From:   Arnd Bergmann <arnd@arndb.de>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Arnd Bergmann <arnd@arndb.de>, Sean Young <sean@mess.org>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] media: ttpci: add RC_CORE dependency
Date:   Mon, 17 Jun 2019 13:16:53 +0200
Message-Id: <20190617111718.2277220-3-arnd@arndb.de>
X-Mailer: git-send-email 2.20.0
In-Reply-To: <20190617111718.2277220-1-arnd@arndb.de>
References: <20190617111718.2277220-1-arnd@arndb.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:jRxuqDqYInydq+mFQ7vU6M2j8TIBGPA36Ci/8tRJAJtPkw1oek7
 gd5oG/veApoWmXb6IQ2wtbYKZ+aKf8Q0H9+2Jer6ORlHU5BX7K0DiZhWnrusMwi+fw8YnfZ
 sAuaH9KeKh+8Min4BZ9bN2TVqMnfWGEyyAEdXVY0/xaHHKVbDBHc4MhMlwRad1rJ//xcq2a
 dWOfpMuWWYT5SAuSa1hKg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:+d2WlyjE6Qg=:suzsE7HbIN0vVUzhIAoKl/
 NnebyOq4NMDjq1nx/h3mthYsO2DDJUuyydAMzVkicdOfz08QGd+1iS2s2M10So3YkTmjHuM3y
 r69SS80U+IEX0Sc9HeA1iCq1xPMVPcIaoLBO6o8uQcDkXxbLBIyGkwHNpjM0FdyC4gemGO9Ax
 cfHoHPajVFNlvAaWzEnEkvfhAfwO8XaFo8xkm22s9UAGt1L83m9tBv5qeRh2uQ3pkYVlbp3pg
 TaPj/6ladWz+5++PO1Sl+TrFZwDbNKdlOjdrqO077G3wBMeKexH1p2HdhnNFYs7AnHKyRU/wj
 x+VQquWNwLD1PQeLris8ceS5r80enyt1WzNgX2x9XF/vHRKSd6BKOotG7Bae8uT7UmwfEU9Ti
 PRDluiej/qpRhp4lg6E47HO2GmvVoS8mnd1wuao70EfDWf4F1cnttEAaH7WkXdjgUtYPxhQ95
 k9Y75qrIuM2QnkfbhjyMMGWZOI5OBJh9AhX/Ba3baBAmSqRCklNqwxiiigNJhFW/id34bLsIh
 oTOLN4L4qMGMe8xjhftjARQcKD2u98z7gtn0KcnZXsUCbP6IjfE1D03Js4MWAeJBOvhxhkqlo
 P7n2gpuhw0cnEPDtnxGJZ5ItrJJntfQhZzL/i8NTC0Wuoff3NgY8noprpydBIMyPwTGj0Cltw
 mnyr66Yr9zC2mu9M4A2TgKvnU2wSIkaAwSZ/ELMpzBMHQNUZ+bfSg3AATtQbNro+9Qeyx6jNN
 g5lbyylzMEhpCNVDi6fvg1Kfm5hUxgBbGkI4Ow==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The ttpci driver now uses the rc-core, so we need to ensure it
is enabled:

ERROR: "rc_unregister_device" [drivers/media/pci/ttpci/dvb-ttpci.ko] undefined!
ERROR: "rc_allocate_device" [drivers/media/pci/ttpci/dvb-ttpci.ko] undefined!
ERROR: "rc_free_device" [drivers/media/pci/ttpci/dvb-ttpci.ko] undefined!
ERROR: "rc_keydown" [drivers/media/pci/ttpci/dvb-ttpci.ko] undefined!
ERROR: "rc_register_device" [drivers/media/pci/ttpci/dvb-ttpci.ko] undefined!

Fixes: 71f49a8bf5c5 ("media: ttpci: use rc-core for the IR receiver")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/media/pci/ttpci/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/pci/ttpci/Kconfig b/drivers/media/pci/ttpci/Kconfig
index d96d4fa20457..70bc25fb0a6f 100644
--- a/drivers/media/pci/ttpci/Kconfig
+++ b/drivers/media/pci/ttpci/Kconfig
@@ -9,6 +9,7 @@ config DVB_AV7110
 	select VIDEO_SAA7146_VV
 	select DVB_AV7110_IR if INPUT_EVDEV=y || INPUT_EVDEV=DVB_AV7110
 	depends on VIDEO_DEV	# dependencies of VIDEO_SAA7146_VV
+	depends on RC_CORE
 	select DVB_VES1820 if MEDIA_SUBDRV_AUTOSELECT
 	select DVB_VES1X93 if MEDIA_SUBDRV_AUTOSELECT
 	select DVB_STV0299 if MEDIA_SUBDRV_AUTOSELECT
-- 
2.20.0

