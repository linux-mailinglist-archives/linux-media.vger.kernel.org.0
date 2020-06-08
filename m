Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7A8901F2A39
	for <lists+linux-media@lfdr.de>; Tue,  9 Jun 2020 02:11:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731068AbgFHXU4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 8 Jun 2020 19:20:56 -0400
Received: from mail.kernel.org ([198.145.29.99]:44780 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731060AbgFHXUy (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 8 Jun 2020 19:20:54 -0400
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A246820842;
        Mon,  8 Jun 2020 23:20:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1591658454;
        bh=bOJZp4MY8yMotHM7SIxa+gP+l7ndwy2nMGpeBaSHfwA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ytYpVZ4G+H6NBbuVGo8CEU3Q40+TNAwnO+70/xB1RjmaEsXmRYj4B+LfHL39UVkft
         KC5Wft1vDSitWkj4Hq6noAX69pMheZ8WvnnM7bPe/U5lthxeKrZdnR7Q0SWJjsQ/im
         NH4IFCkI/2LW4RUVmprVtGPuObGFco/NERDlWe8A=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Dan Carpenter <dan.carpenter@oracle.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Sasha Levin <sashal@kernel.org>, linux-media@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 095/175] media: cec: silence shift wrapping warning in __cec_s_log_addrs()
Date:   Mon,  8 Jun 2020 19:17:28 -0400
Message-Id: <20200608231848.3366970-95-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200608231848.3366970-1-sashal@kernel.org>
References: <20200608231848.3366970-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>

[ Upstream commit 3b5af3171e2d5a73ae6f04965ed653d039904eb6 ]

The log_addrs->log_addr_type[i] value is a u8 which is controlled by
the user and comes from the ioctl.  If it's over 31 then that results in
undefined behavior (shift wrapping) and that leads to a Smatch static
checker warning.  We already cap the value later so we can silence the
warning just by re-ordering the existing checks.

I think the UBSan checker will also catch this bug at runtime and
generate a warning.  But otherwise the bug is harmless.

Fixes: 9881fe0ca187 ("[media] cec: add HDMI CEC framework (adapter)")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/media/cec/cec-adap.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/media/cec/cec-adap.c b/drivers/media/cec/cec-adap.c
index b14c09cd9593..06383b26712b 100644
--- a/drivers/media/cec/cec-adap.c
+++ b/drivers/media/cec/cec-adap.c
@@ -1732,6 +1732,10 @@ int __cec_s_log_addrs(struct cec_adapter *adap,
 		unsigned j;
 
 		log_addrs->log_addr[i] = CEC_LOG_ADDR_INVALID;
+		if (log_addrs->log_addr_type[i] > CEC_LOG_ADDR_TYPE_UNREGISTERED) {
+			dprintk(1, "unknown logical address type\n");
+			return -EINVAL;
+		}
 		if (type_mask & (1 << log_addrs->log_addr_type[i])) {
 			dprintk(1, "duplicate logical address type\n");
 			return -EINVAL;
@@ -1752,10 +1756,6 @@ int __cec_s_log_addrs(struct cec_adapter *adap,
 			dprintk(1, "invalid primary device type\n");
 			return -EINVAL;
 		}
-		if (log_addrs->log_addr_type[i] > CEC_LOG_ADDR_TYPE_UNREGISTERED) {
-			dprintk(1, "unknown logical address type\n");
-			return -EINVAL;
-		}
 		for (j = 0; j < feature_sz; j++) {
 			if ((features[j] & 0x80) == 0) {
 				if (op_is_dev_features)
-- 
2.25.1

