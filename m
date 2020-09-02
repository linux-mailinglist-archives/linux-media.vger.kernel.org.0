Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CD65E25B15C
	for <lists+linux-media@lfdr.de>; Wed,  2 Sep 2020 18:18:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728896AbgIBQSI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Sep 2020 12:18:08 -0400
Received: from mail.kernel.org ([198.145.29.99]:53872 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727991AbgIBQKs (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 2 Sep 2020 12:10:48 -0400
Received: from mail.kernel.org (ip5f5ad5c3.dynamic.kabel-deutschland.de [95.90.213.195])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id DD2D8214F1;
        Wed,  2 Sep 2020 16:10:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1599063046;
        bh=5Br08z5EHU347ymKSVPsmlv2b1oAPGH5xsj10Ivzd+8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=pdpEcpknJFkU98IyHqqtNNK8vHKCDK0nq3a+OkyxFNbyCbTCQyyGL5Ajo3M8HPjgz
         2g1iOTnZcQzciGbRcyzqKXOPHvz9khZunuLBu0QXWgSZogk89TsPpXZalTCXReJtNY
         Q/xKMs1oqd2OMMfJZX6q+NDBemfgpYi57uGkYCFI=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1kDVLP-000t9p-Nq; Wed, 02 Sep 2020 18:10:43 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 04/38] media: av7110_v4l: avoid a typecast
Date:   Wed,  2 Sep 2020 18:10:07 +0200
Message-Id: <e9cdd06dba6827cb6311b8514309648df85ec354.1599062230.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1599062230.git.mchehab+huawei@kernel.org>
References: <cover.1599062230.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

While smatch reports an issue there:

	drivers/media/pci/ttpci/av7110_v4l.c:163 ves1820_set_tv_freq() warn: unsigned 'freq' is never less than zero.
	drivers/media/pci/ttpci/av7110_v4l.c:165 ves1820_set_tv_freq() warn: unsigned 'freq' is never less than zero.

The logic is actually fine. Yet, removing the typecast
shuts up smatch and makes the code more readable.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/media/pci/ttpci/av7110_v4l.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/pci/ttpci/av7110_v4l.c b/drivers/media/pci/ttpci/av7110_v4l.c
index cabe006658dd..6d9c908be713 100644
--- a/drivers/media/pci/ttpci/av7110_v4l.c
+++ b/drivers/media/pci/ttpci/av7110_v4l.c
@@ -160,9 +160,9 @@ static int ves1820_set_tv_freq(struct saa7146_dev *dev, u32 freq)
 	buf[1] = div & 0xff;
 	buf[2] = 0x8e;
 
-	if (freq < (u32) (16 * 168.25))
+	if (freq < 16U * 168.25)
 		config = 0xa0;
-	else if (freq < (u32) (16 * 447.25))
+	else if (freq < 16U * 447.25)
 		config = 0x90;
 	else
 		config = 0x30;
-- 
2.26.2

