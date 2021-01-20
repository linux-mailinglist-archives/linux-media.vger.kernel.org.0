Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7B66F2FCE6B
	for <lists+linux-media@lfdr.de>; Wed, 20 Jan 2021 11:55:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387542AbhATKku (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 20 Jan 2021 05:40:50 -0500
Received: from lb2-smtp-cloud8.xs4all.net ([194.109.24.25]:41331 "EHLO
        lb2-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1731649AbhATJon (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 20 Jan 2021 04:44:43 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id 2A14lJCTVftvz2A1Bl8jFk; Wed, 20 Jan 2021 10:43:13 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1611135793; bh=cs1cjxFmxTssq1ygaCbCIhvLeOoO+oVCiVzdkJyEZ3g=;
        h=From:To:Subject:Date:Message-Id:MIME-Version:From:Subject;
        b=unBak7/DC+sdpBIe6z1q8jbuyDM3uua0wX5jbnTPgK1ErxOf1SaVKq3E4SkZAtLgk
         uC+pMbUPgboW163mC4eWpU5U8gLLpjNvKEBLCKGJCnnYIYrYL0tWeGG4CD0r6LrwLs
         xAeY1p7Xiag9p7wXsuSAzIca83o3e62MAqxqEJiz2BgcRgXkhVNwL/0U1gEN6OnBJp
         1ZkHo5YnFR1vKFtIEokDsweWEvQfuZRW38Lt/EGmAxIIgNYE01B/PPqmJ35u/XyrqM
         Q9whJZ/9LVTuI1mGEfqZ10PnxFfGW/M8Q/eH5oE9E4XB5BR/L7cVwsxmjlavN6hxgX
         3Ohw8DPA+3j6Q==
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH 13/14] atomisp/pci: add missing include
Date:   Wed, 20 Jan 2021 10:43:05 +0100
Message-Id: <20210120094306.784318-14-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210120094306.784318-1-hverkuil-cisco@xs4all.nl>
References: <20210120094306.784318-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfAX5slZdcEG06gClf1fIbSEcdCCiibSaO57tXMNZ1RIGZ6Bnhop5RCmAwSDRBq0pMH9u1fnxz2YJnBjddl0CUTNYr+CsDS0ZgH7HSCI/FBqqF/Lc17c1
 spMTuaX3EY59qmTlxUrh7WdPKN+QMvl/ueTCuoV7ce54KMRIJcbPGXQgqeDUKYloleGy3kY3NfG34FOIu/4gLICuUcAx8qvPQhkcY/j7Cxe5kgNgO9ercodC
 59IpAWQKL4x5TIxzCbqj6A==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Fix two smatch warnings:

drivers/staging/media/atomisp//pci/ia_css_firmware.h:52:29: warning: 'struct device' declared inside parameter list will not be visible outside of this definition or declaration
drivers/staging/media/atomisp//pci/ia_css_control.h:49:24: warning: 'struct device' declared inside parameter list will not be visible outside of this definition or declaration

Add '#include <linux/device.h>' to ia_css_firmware.h so struct device is defined.

ia_css_control.h includes ia_css_firmware.h, so it is sufficient to
just modify ia_css_firmware.h.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/staging/media/atomisp/pci/ia_css_firmware.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/staging/media/atomisp/pci/ia_css_firmware.h b/drivers/staging/media/atomisp/pci/ia_css_firmware.h
index edab72256494..e5e2f6fb37e0 100644
--- a/drivers/staging/media/atomisp/pci/ia_css_firmware.h
+++ b/drivers/staging/media/atomisp/pci/ia_css_firmware.h
@@ -20,6 +20,7 @@
  * This file contains firmware loading/unloading support functionality
  */
 
+#include <linux/device.h>
 #include "ia_css_err.h"
 #include "ia_css_env.h"
 
-- 
2.29.2

