Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2CDD5356E46
	for <lists+linux-media@lfdr.de>; Wed,  7 Apr 2021 16:16:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344321AbhDGOQd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Apr 2021 10:16:33 -0400
Received: from lb1-smtp-cloud7.xs4all.net ([194.109.24.24]:44553 "EHLO
        lb1-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232839AbhDGOQd (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 7 Apr 2021 10:16:33 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id U8yglSP3zMxedU8yjlIlFk; Wed, 07 Apr 2021 16:16:21 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1617804981; bh=IsG8FvnYVpgdJNRgzCZ2evHn1fmb45MTm5fXbXT7bH4=;
        h=From:To:Subject:Date:Message-Id:MIME-Version:From:Subject;
        b=XvGhlLPO4SG+R9789RAiVICOyfB6ubaTOSB05EhK7BWBLJIRImqvQToYxYY939EsM
         Epa/rj4gGjMTsB91iCsG0tj9s89+OR+XtsbNp3S8bvyLSWt+iFXe4K6MSA17hcLq1E
         Lqal0pfAf1Y6+dHY9lEtvafGJetguq3jyq+QxFRC76lJogeA13XgnTxzO0cHn/do0O
         WOaopN3kLqZtJ1jsUpalz1w5tHPtQu6CO8jPpzlVpgjcfgzB5+1KUCi9mkH4Y6pagL
         dI9i0EnwjhNcLcPWRUBV6/mokGuQOQ1yP7x5L3cOid3cwiwaPmQPTzMAGIERYH7KCp
         SfixYAszeTZ/A==
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Subject: [PATCH 0/2] adv7842 fixes
Date:   Wed,  7 Apr 2021 16:16:16 +0200
Message-Id: <20210407141618.196617-1-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfGyGCop30MyFVBBPIP6FFYHLC/LuTcnNd1bp6n37Fa/QzDP8Db/JUnkKB/hEJED6XM74/Ioj+ZO0wERvYS6iJb6b/CHvvhsHUoiTE8ueK9684aalyraf
 j4NGQ9C7yy/WUpP4xZ/g6ZVscUXEO8hCWnr9FkoJqnXEk5nbW6FSYqnQaWMfcyFf+FfPvcGvbqxL5WSsPAPtsi3FDGRN83wIKEo=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

I hadn't tested adv7842 for years and it had suffered some bit rot.
The first patch fixes incorrect pad configuration that wasn't checked
before, but now makes it impossible to call the pad ops.

The second adds support for reading EDIDs consisting of a single block
and fixes a kernel oops when clearing the EDID.

Regards,

	Hans

Hans Verkuil (2):
  adv7842: configure all pads
  adv7842: support 1 block EDIDs, fix clearing EDID

 drivers/media/i2c/adv7842.c | 81 +++++++++++++++++++++++--------------
 1 file changed, 50 insertions(+), 31 deletions(-)

-- 
2.30.2

