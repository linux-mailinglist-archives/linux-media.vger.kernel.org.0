Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A40BC44C0F8
	for <lists+linux-media@lfdr.de>; Wed, 10 Nov 2021 13:10:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231851AbhKJMMc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 10 Nov 2021 07:12:32 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:60746 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231816AbhKJMMW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 10 Nov 2021 07:12:22 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: dafna)
        with ESMTPSA id 32D711F4555C
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=collabora.com; s=mail;
        t=1636546173; bh=drd7pjo9KNm9SXbJqSjRnoiOHd+JUDMpVHIVQiFuY6Q=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=OeNIpSg8PJEnbZjgzuqJEgRp4jXR+JmcSZQ3n392dgINfZfdwsyX9b1e1V00pP7bk
         AcTRnCTfnJ+kNcwWkaIHW6NOXngwxQBDIfPyB36tHKVLiR4fBcwsrTeanJZ/BlkDOg
         horCmUfrNTN7nDdcUXehZR5CPS65hpgX4e4Ph4EIUINJkMoaWYvbsjvZ4Ir8nYrdtM
         C4li4J7L0mbi+xjGo33ZPxnxaotw98a04/tvRsIjc9qNKiQ5NTkTLd5E0XVDUqbTCL
         nHcCRfBxFyWJEpBzRAczZbDQr8oZa8x3jXqb03D3f5QKgJ4PA0Wd6PGi/85aReeB3u
         sWnwX+scWAzng==
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     Robert Beckett <bob.beckett@collabora.com>,
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-staging@lists.linux.dev (open list:STAGING SUBSYSTEM),
        linux-kernel@vger.kernel.org (open list),
        laurent.pinchart@ideasonboard.com, hverkuil@xs4all.nl,
        kernel@collabora.com, dafna3@gmail.com,
        kiril.bicevski@collabora.com,
        Nas Chung <nas.chung@chipsnmedia.com>,
        lafley.kim@chipsnmedia.com, scott.woo@chipsnmedia.com,
        olivier.crete@collabora.com, dan.carpenter@oracle.com,
        rdunlap@infradead.org
Subject: [PATCH v3 6/6] media: wave5: Add wave5 driver to maintainers file
Date:   Wed, 10 Nov 2021 14:09:10 +0200
Message-Id: <20211110120910.12411-7-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211110120910.12411-1-dafna.hirschfeld@collabora.com>
References: <20211110120910.12411-1-dafna.hirschfeld@collabora.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Robert Beckett <bob.beckett@collabora.com>

Add the Chips&Media wave5 encoder/decoder driver
to the maintainers file

Signed-off-by: Robert Beckett <bob.beckett@collabora.com>
Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
---
 MAINTAINERS | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 0e6594a4ad8f..5704b8c17f72 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19962,6 +19962,15 @@ F:	drivers/watchdog/
 F:	include/linux/watchdog.h
 F:	include/uapi/linux/watchdog.h
 
+WAVE5 VPU CODEC DRIVER
+M:	Nas Chung <nas.chung@chipsnmedia.com>
+M:	Robert Beckett <bob.beckett@collabora.com>
+M:	Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
+L:	linux-media@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/staging/media/cnm,wave.yaml
+F:	drivers/staging/media/wave5/
+
 WHISKEYCOVE PMIC GPIO DRIVER
 M:	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
 L:	linux-gpio@vger.kernel.org
-- 
2.17.1

