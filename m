Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0D76A35B8AE
	for <lists+linux-media@lfdr.de>; Mon, 12 Apr 2021 04:37:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236609AbhDLChh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 11 Apr 2021 22:37:37 -0400
Received: from relay12.mail.gandi.net ([217.70.178.232]:37389 "EHLO
        relay12.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235857AbhDLChh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 11 Apr 2021 22:37:37 -0400
Received: from coplandos.local (cpe-24-194-32-49.nycap.res.rr.com [24.194.32.49])
        (Authenticated sender: vrzh@vrzh.net)
        by relay12.mail.gandi.net (Postfix) with ESMTPSA id E14C5200005;
        Mon, 12 Apr 2021 02:37:17 +0000 (UTC)
From:   Martiros Shakhzadyan <vrzh@vrzh.net>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Martiros Shakhzadyan <vrzh@vrzh.net>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org
Subject: [PATCH] staging: media: atomisp: Coding style fixes
Date:   Sun, 11 Apr 2021 22:35:55 -0400
Message-Id: <20210412023558.360103-1-vrzh@vrzh.net>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The following set of patches fixes coding style issues in
atomisp-ov2722.

Martiros Shakhzadyan (3):
  staging: media: atomisp: Removed a superfluous else clause
  staging: media: atomisp: Removed a function entry log
  staging: media: atomisp: Minor code style changes

 .../media/atomisp/i2c/atomisp-ov2722.c        | 20 +++++++++----------
 1 file changed, 9 insertions(+), 11 deletions(-)

-- 
2.31.1

