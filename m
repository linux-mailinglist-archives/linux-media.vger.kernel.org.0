Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E453722006B
	for <lists+linux-media@lfdr.de>; Wed, 15 Jul 2020 00:06:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728252AbgGNWGH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 Jul 2020 18:06:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41222 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728202AbgGNWGD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 Jul 2020 18:06:03 -0400
Received: from merlin.infradead.org (merlin.infradead.org [IPv6:2001:8b0:10b:1231::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84A1AC061755;
        Tue, 14 Jul 2020 15:06:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:MIME-Version:
        References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
        Content-Type:Content-ID:Content-Description;
        bh=8RgdJXxBE+uBRXDQKO8AempfXZnFJmeo0OjB3cMIVO8=; b=EZcwvLP/MRMRByjW6HKra8+oIa
        Nx7ocwE8j5k4bzt2ItMDCrdsp6V41p5lbOKRWOZfU8LzGj+advNGH4AtKO1L+RfTRf163dRjnQqyk
        5R0Wt9CD5Bwq4OmsjK1hBKd6I4ivoNAFfAbQEZxdh4q+dNf4HLNl09t47xV32gOBsmvsQH5eCkwlR
        uuGrOhlNz2b75D+SViOcslKItL31s3ihYFH27U0kajkJoxcZrq95kffjc/EmrSA+6qPwh/G91IL2j
        Hg/MMAZzgM7TXuS5p3NKWvDklnc10RtBTt6yu2w0NhgmdbyVVdIt9BY6EOPLqTGqPmRIppDZLYNcY
        jmWlNyfw==;
Received: from [2601:1c0:6280:3f0::19c2] (helo=smtpauth.infradead.org)
        by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1jvT3p-0001IZ-6w; Tue, 14 Jul 2020 22:06:01 +0000
From:   Randy Dunlap <rdunlap@infradead.org>
To:     linux-kernel@vger.kernel.org
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
Subject: [PATCH 3/5] media/dvbdev.h: fix duplicated word in comment
Date:   Tue, 14 Jul 2020 15:05:51 -0700
Message-Id: <20200714220553.20294-3-rdunlap@infradead.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200714220553.20294-1-rdunlap@infradead.org>
References: <20200714220553.20294-1-rdunlap@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Change the doubled word "the" in a comment to "to the".

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org
---
 include/media/dvbdev.h |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- linux-next-20200714.orig/include/media/dvbdev.h
+++ linux-next-20200714/include/media/dvbdev.h
@@ -385,7 +385,7 @@ struct i2c_client;
  * with dvb_module_probe() should use dvb_module_release() to unbind.
  *
  * Return:
- *	On success, return an &struct i2c_client, pointing the the bound
+ *	On success, return an &struct i2c_client, pointing to the bound
  *	I2C device. %NULL otherwise.
  *
  * .. note::
