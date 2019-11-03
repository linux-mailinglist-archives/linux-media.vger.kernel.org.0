Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2BBF5ED315
	for <lists+linux-media@lfdr.de>; Sun,  3 Nov 2019 12:23:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727520AbfKCLXo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 3 Nov 2019 06:23:44 -0500
Received: from lb3-smtp-cloud8.xs4all.net ([194.109.24.29]:41813 "EHLO
        lb3-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727425AbfKCLXo (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 3 Nov 2019 06:23:44 -0500
Received: from tschai.fritz.box ([46.9.232.237])
        by smtp-cloud8.xs4all.net with ESMTPA
        id RDysiydASTzKrRDyvigk6i; Sun, 03 Nov 2019 12:23:42 +0100
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Benoit Parrot <bparrot@ti.com>
Subject: [PATCH 1/8] am437x: fix smatch warning
Date:   Sun,  3 Nov 2019 12:23:31 +0100
Message-Id: <20191103112338.22569-2-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191103112338.22569-1-hverkuil-cisco@xs4all.nl>
References: <20191103112338.22569-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfHeaQRNmE7HXqnD3RDKc8r8MtUbGWQJZJ2jvNtuH5alFf4RPImjTd1ZYzmngj6WmEPSGQ//4kf4r/L/g2sH4UTfhjQGSOT7aiTKTuLvjXWhLqIjb/nTO
 YwYht/6HSUpjpOMXA5NJLyzoUq1h3oXqw0NWeqd3J6wiObbCZy6/zWmfNxvuZBF0Q96ySIT5KNIf5Mg3/GO+wpg9LXJnVw3k6pl/UWB8e3aTeYMZ/qY+cvxm
 c6mopC6Gf/bmDY4KeF5K9g==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Fixes this warning:

drivers/media/platform/am437x/am437x-vpfe.c:288 vpfe_ccdc_validate_param() warn: unsigned 'ccdcparam->alaw.gamma_wd' is never less than zero.

by dropping the gamma_wd < VPFE_CCDC_GAMMA_BITS_15_6 check
since VPFE_CCDC_GAMMA_BITS_15_6 is 0.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: Benoit Parrot <bparrot@ti.com>
---
 drivers/media/platform/am437x/am437x-vpfe.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/media/platform/am437x/am437x-vpfe.c b/drivers/media/platform/am437x/am437x-vpfe.c
index 447610b67db4..09104304bd06 100644
--- a/drivers/media/platform/am437x/am437x-vpfe.c
+++ b/drivers/media/platform/am437x/am437x-vpfe.c
@@ -285,7 +285,6 @@ vpfe_ccdc_validate_param(struct vpfe_ccdc *ccdc,
 	max_data = ccdc_data_size_max_bit(ccdcparam->data_sz);
 
 	if (ccdcparam->alaw.gamma_wd > VPFE_CCDC_GAMMA_BITS_09_0 ||
-	    ccdcparam->alaw.gamma_wd < VPFE_CCDC_GAMMA_BITS_15_6 ||
 	    max_gamma > max_data) {
 		vpfe_dbg(1, vpfe, "Invalid data line select\n");
 		return -EINVAL;
-- 
2.23.0

