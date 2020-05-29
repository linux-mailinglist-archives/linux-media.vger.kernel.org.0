Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F35A61E885B
	for <lists+linux-media@lfdr.de>; Fri, 29 May 2020 22:01:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728223AbgE2UBL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 29 May 2020 16:01:11 -0400
Received: from mout.kundenserver.de ([217.72.192.75]:37863 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728062AbgE2UAv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 29 May 2020 16:00:51 -0400
Received: from threadripper.lan ([149.172.98.151]) by mrelayeu.kundenserver.de
 (mreue109 [212.227.15.145]) with ESMTPA (Nemesis) id
 1MkHEN-1jGNZx1rr7-00kj3D; Fri, 29 May 2020 22:00:40 +0200
From:   Arnd Bergmann <arnd@arndb.de>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-kernel@vger.kernel.org, clang-built-linux@googlegroups.com,
        Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH 2/9] staging: media: atomisp: declare 'struct device' before using it
Date:   Fri, 29 May 2020 22:00:24 +0200
Message-Id: <20200529200031.4117841-2-arnd@arndb.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200529200031.4117841-1-arnd@arndb.de>
References: <20200529200031.4117841-1-arnd@arndb.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:TarMTBYqeIin+lnZ4LmtumzaUlpm/qpb9KM44D2gAllthm2qRrv
 sC59cp8NfYINafBl2Vdc62hWHo8PDCDo5gs0KXVFJdxzbDBwGr4kaKkbTYcUeIN0dbHDuoz
 x+49RaodJ9WvlUyCSTRvFKe7lQKlToCkknwxWKJl5seuW//ppuMJfKGprZ3FdStSX5dMU0A
 9jyc66JdrDYJbBpjyGtng==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:agZbiHQ3QcI=:7qYJ0h5aCaOWsSDNrfq5CH
 qaSr3TmIoq2uEzVm8Q7EqUphclJUPPAOLl4X9InIsqvKpB/MO6s6tK7c6/oFcxLuCEhrufKts
 rQhxrNL/DMp+rVq2OHDexV/7svguarZHyvz/aL/kvxF+EeaGeORpdobYZ8Umt+BnPBSFJCU2X
 ID5vVJpkDdEAGHNtZI4amT7klgTwhc26+FEvCBxUG62XtIIs1vXbYFr6Ux25buwq8qX363OKM
 ELr+FHf1xwaybM/zakqPZStMWMWl+dovCRCEIT65T9l977Su/eq6+wk1sBe1vbkYZYuGY4J11
 G6AVkYWewWpiMKaGj5IOlAKINVKBjMxBley9rYMhC/jwSEwJyX2U3ecpYzK9/Vp4ZzNDdCZRg
 En9kgVOksCPW2MU1+xscYSqz65A7PlaELeuk7iRYe4DWjJU6o/gPlzOT+zKi01rMmbFtzHA2y
 +nX2ALvZOplgWBWgqroORiZZkkc8KOi1vQO/2vht/UNAS/JyvINYVaCClu5kpvnF0DGLvlSKg
 2oyYb+p/IAvi7W/CF1DjQK8tTw0suXiX6hk55fxTr34BheDzFfVqMmmAciDThPBWmqKTUxJcp
 QBswMwwhZcID8mDzAUtl+4IAOF4GyD44+txsmQe2vmFVGxb+ayQ2bYho1A1pPranfCgarRjy6
 6z59byyo8t+fD40ar3uOqJX0+M9Ifqdi9QLtid2FrBBoj5omZbVM6QvAzcuVLNkq9E//x5H0q
 Be08aE3Oy/+iIgHrnah8QttnzCe8lPPW6uzS1x/36ZAe9KVnGZ6XBkvDEZihRf9P5bSq1EFuI
 7IWstP1FHkMkbUL5HAqq9Yi8KKU8GtFDYlUGR4OxKuDJolWZeA=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

In some configurations, including this header leads to a warning:

drivers/staging/media/atomisp//pci/sh_css_firmware.h:41:38: error: declaration of 'struct device' will not be visible outside of this function [-Werror,-Wvisibility]

Make sure the struct tag is known before declaring a function
that uses it as an argument.

Fixes: 9d4fa1a16b28 ("media: atomisp: cleanup directory hierarchy")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/staging/media/atomisp/pci/sh_css_firmware.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/staging/media/atomisp/pci/sh_css_firmware.h b/drivers/staging/media/atomisp/pci/sh_css_firmware.h
index f6253392a6c9..317559c7689f 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_firmware.h
+++ b/drivers/staging/media/atomisp/pci/sh_css_firmware.h
@@ -37,6 +37,7 @@ extern unsigned int sh_css_num_binaries;
 char
 *sh_css_get_fw_version(void);
 
+struct device;
 bool
 sh_css_check_firmware_version(struct device *dev, const char *fw_data);
 
-- 
2.26.2

