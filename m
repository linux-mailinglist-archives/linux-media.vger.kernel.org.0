Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ED2A327929
	for <lists+linux-media@lfdr.de>; Thu, 23 May 2019 11:27:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729836AbfEWJ1h (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 23 May 2019 05:27:37 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:36724 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728518AbfEWJ1h (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 23 May 2019 05:27:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Sender:Content-Transfer-Encoding:
        MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=U3SIZWwdixPE5Gzjbi/xgO7y/RgMkVRc69U4kPPKbeI=; b=DgGt/ih0/kqZAcKorU+Ect1B1
        BmJw4VtuSBFjivJ6KJ6muHXSUMhBcdKyX8bi1d/yVm2Tv6xSoaxcWd2h5/XuBEDXWaHp0YQ3b4T8T
        rN427ataavon8S2128aGgYD0soY7hDMZ8wAr1rnKaeYakLFSCsRj5CaO963EbGvQ+qyTlduEkThlI
        l3JnQs4GSNYHC5OO8xcyuVIqM4kvApp+PRriqyNh7fqgik4diWRTBXMYWPFS3mPEJp47AuazdqOZb
        O/ITpYSq7+bxyUt9qPNDbcdhW52gdTUyB2Zq+d2bzf0G9aP0ORe2ZDOSV1RMWkxUwiUtOYXL4zAHI
        yeqsGHO4g==;
Received: from [179.182.168.126] (helo=bombadil.infradead.org)
        by bombadil.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
        id 1hTk0e-0005Bt-Cz; Thu, 23 May 2019 09:27:36 +0000
Received: from mchehab by bombadil.infradead.org with local (Exim 4.92)
        (envelope-from <mchehab@bombadil.infradead.org>)
        id 1hTk0Z-0007Um-RA; Thu, 23 May 2019 05:27:31 -0400
From:   Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@infradead.org>,
        Sean Young <sean@mess.org>,
        Benjamin Valentin <benpicco@googlemail.com>,
        Patrick Lerda <patrick9876@free.fr>,
        Matthias Reichl <hias@horus.com>
Subject: [PATCH] media: rc-main: clean-up two warnings
Date:   Thu, 23 May 2019 05:27:30 -0400
Message-Id: <eda16d66b830a1bb62129b4771b5ca8ca0ed0a9b.1558603642.git.mchehab+samsung@kernel.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

While correct, the code is too complex for smatch to undersdand
that protocol will always be initialized:

	drivers/media/rc/rc-main.c:1531 store_wakeup_protocols() error: uninitialized symbol 'protocol'.
	drivers/media/rc/rc-main.c:1541 store_wakeup_protocols() error: uninitialized symbol 'protocol'.

So, change it a little bit in order to avoid such warning.

Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
---
 drivers/media/rc/rc-main.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/media/rc/rc-main.c b/drivers/media/rc/rc-main.c
index be5fd129d728..13da4c5c7d17 100644
--- a/drivers/media/rc/rc-main.c
+++ b/drivers/media/rc/rc-main.c
@@ -1502,7 +1502,7 @@ static ssize_t store_wakeup_protocols(struct device *device,
 				      const char *buf, size_t len)
 {
 	struct rc_dev *dev = to_rc_dev(device);
-	enum rc_proto protocol;
+	enum rc_proto protocol = RC_PROTO_UNKNOWN;
 	ssize_t rc;
 	u64 allowed;
 	int i;
@@ -1511,9 +1511,7 @@ static ssize_t store_wakeup_protocols(struct device *device,
 
 	allowed = dev->allowed_wakeup_protocols;
 
-	if (sysfs_streq(buf, "none")) {
-		protocol = RC_PROTO_UNKNOWN;
-	} else {
+	if (!sysfs_streq(buf, "none")) {
 		for (i = 0; i < ARRAY_SIZE(protocols); i++) {
 			if ((allowed & (1ULL << i)) &&
 			    sysfs_streq(buf, protocols[i].name)) {
-- 
2.21.0

