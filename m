Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 479C73F1B94
	for <lists+linux-media@lfdr.de>; Thu, 19 Aug 2021 16:28:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239252AbhHSO26 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 19 Aug 2021 10:28:58 -0400
Received: from mail-m973.mail.163.com ([123.126.97.3]:38888 "EHLO
        mail-m973.mail.163.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238595AbhHSO25 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 19 Aug 2021 10:28:57 -0400
X-Greylist: delayed 911 seconds by postgrey-1.27 at vger.kernel.org; Thu, 19 Aug 2021 10:28:57 EDT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
        s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=LqhkW
        OTtdIT7p2npUf1GtbNwZzGn75JEoosgJAVBjO0=; b=NenUaFqr/zbzisGFetMoL
        EC+Udbx66+LcnM4UenfvlsABZsc+RC1w9c2fNlBFRXjaN73UnpCCAKASDeoPKLc+
        kLFcDzjaEp62OFYNjc5lVIa94WchJ1BagOC7Jqnt9xbKc5akaU1RFZvJjF1ll15r
        48yF4N37pCvF+7HKyviiFk=
Received: from localhost.localdomain (unknown [111.201.47.26])
        by smtp3 (Coremail) with SMTP id G9xpCgC3GbDjZh5h4bjzDA--.1787S4;
        Thu, 19 Aug 2021 22:13:01 +0800 (CST)
From:   Wentao_Liang <Wentao_Liang_g@163.com>
To:     dongchun.zhu@mediatek.com
Cc:     mchehab@kernel.org, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, Wentao_Liang <Wentao_Liang_g@163.com>
Subject: [PATCH] drivers:media:i2c:ov02a10.c: fix a potential use-after-put bug
Date:   Thu, 19 Aug 2021 22:12:49 +0800
Message-Id: <20210819141249.257945-1-Wentao_Liang_g@163.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: G9xpCgC3GbDjZh5h4bjzDA--.1787S4
X-Coremail-Antispam: 1Uf129KBjvJXoW7WF13Zw4UWrWUJrW5Xr4xJFb_yoW8ArWUpa
        97A3y5Cry8Wr48ZFy8AFn8ArZIkw1fGrWfJrW3u3sF93WDJFs2yry5KFyYvrZ5CryrZayf
        Xr4rta47ZF4DCw7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07bUBMNUUUUU=
X-Originating-IP: [111.201.47.26]
X-CM-SenderInfo: xzhq3t5rboxtpqjbwqqrwthudrp/xtbB3Q3zL2BHKE8HjgAAsF
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

In line 825 (#1), "fwnode_handle_put(ep);" drops the reference to ep
and may cause ep to be released. However, ep is subsequently used in
lines 831 (#3) by "ret = fwnode_property_read_u32(ep, "ovti,mipi-clock-
voltage", &clk_volt);". This may result in an use-after-put bug.

It can be fixed by removing "fwnode_handle_put(ep);" in line 825 (#1)
and call it respectively before the function returns (line 827, #2) and
after ep has been used again (line 831, #3).

 806 static int ov02a10_check_hwcfg(struct device *dev,
                              struct ov02a10 *ov02a10)
 807 {
 ...
 825     fwnode_handle_put(ep); //#1 Memory can be released.
 826     if (ret)
 827         return ret;
             //#2 One of the branch ways ends here.
	     //   Function returns.

 ...
 830     ret = fwnode_property_read_u32(ep, "ovti,mipi-clock-voltage",
 831                        &clk_volt);
			//#3 Use of memory after it may be freed.
 ...
 853     return ret;
 854 }

Signed-off-by: Wentao_Liang <Wentao_Liang_g@163.com>
---
 drivers/media/i2c/ov02a10.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/ov02a10.c b/drivers/media/i2c/ov02a10.c
index a3ce5500d355..1066a17e9cf8 100644
--- a/drivers/media/i2c/ov02a10.c
+++ b/drivers/media/i2c/ov02a10.c
@@ -822,13 +822,15 @@ static int ov02a10_check_hwcfg(struct device *dev, struct ov02a10 *ov02a10)
 		return -ENXIO;
 
 	ret = v4l2_fwnode_endpoint_alloc_parse(ep, &bus_cfg);
-	fwnode_handle_put(ep);
-	if (ret)
+	if (ret) {
+		fwnode_handle_put(ep);
 		return ret;
+	}
 
 	/* Optional indication of MIPI clock voltage unit */
 	ret = fwnode_property_read_u32(ep, "ovti,mipi-clock-voltage",
 				       &clk_volt);
+	fwnode_handle_put(ep);
 
 	if (!ret)
 		ov02a10->mipi_clock_voltage = clk_volt;
-- 
2.25.1

