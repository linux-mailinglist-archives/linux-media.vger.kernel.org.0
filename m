Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C29CF3E9A9F
	for <lists+linux-media@lfdr.de>; Wed, 11 Aug 2021 23:57:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232316AbhHKV6L (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 11 Aug 2021 17:58:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49146 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232013AbhHKV6L (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 11 Aug 2021 17:58:11 -0400
Received: from gofer.mess.org (gofer.mess.org [IPv6:2a02:8011:d000:212::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1FEEBC061765
        for <linux-media@vger.kernel.org>; Wed, 11 Aug 2021 14:57:47 -0700 (PDT)
Received: by gofer.mess.org (Postfix, from userid 1000)
        id C5BD0C667C; Wed, 11 Aug 2021 22:57:45 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mess.org; s=2020;
        t=1628719065; bh=ABluVePpQAKggNgdMklqnEBQ/RQi6ImeJXB16Vzx8GM=;
        h=Date:From:To:Subject:From;
        b=HpEzASOPfivvjyAMde85Cuyu4qRofdoq+gLfkQQ2fBK0DQc7gQ+iHF14CywgrWt86
         QQ+2UZE8r4gjbOZyN9rGA1D5nMKsaRG/+XW4tJaV80CVjFqNI/7plCwHJ9+uda3xWL
         RVlKUx/55CKfGN9huay/qk9SQjlWqTKx615jlms/GC2JOHq7bP7edMtkeH97gXKCal
         kVeCTAtlZr61T953JKaJ2S4UuhsbJ24bJn3KiOdFt8uUjzA0GtgveVxUh99K3liObu
         ZOXcttMe60MQPGypnieIuvW0GJdk3XaDfw4SETG3vEX7283S1ii7ewqTFvbZMhGfW1
         HGg8TJEbAeYnA==
Date:   Wed, 11 Aug 2021 22:57:45 +0100
From:   Sean Young <sean@mess.org>
To:     linux-media@vger.kernel.org
Subject: [GIT PULL FOR v5.15] Single IR Toy fix
Message-ID: <20210811215745.GB28513@gofer.mess.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The following changes since commit 5cc88747f90f2076f1f8a1a473535fb36ac9e357:

  media: tuners: mxl5007t: Removed unnecessary 'return' (2021-08-10 13:09:02 +0200)

are available in the Git repository at:

  git://linuxtv.org/syoung/media_tree.git tags/v5.15d

for you to fetch changes up to 60c6d40a2dda2b7f9645d18bbca9553e68e22a1a:

  media: ir_toy: allow tx carrier to be set (2021-08-11 09:57:04 +0100)

----------------------------------------------------------------
v5.15d

----------------------------------------------------------------
Sean Young (1):
      media: ir_toy: allow tx carrier to be set

 drivers/media/rc/ir_toy.c | 34 +++++++++++++++++++++++++++++-----
 1 file changed, 29 insertions(+), 5 deletions(-)
