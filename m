Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A047E3BA918
	for <lists+linux-media@lfdr.de>; Sat,  3 Jul 2021 17:03:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229814AbhGCPG3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 3 Jul 2021 11:06:29 -0400
Received: from gofer.mess.org ([88.97.38.141]:33707 "EHLO gofer.mess.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229562AbhGCPG3 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 3 Jul 2021 11:06:29 -0400
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 4149FC6402; Sat,  3 Jul 2021 16:03:54 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mess.org; s=2020;
        t=1625324634; bh=hJd5ylgGrVxJnoBdLDH8epTS9YbthWJpbnJroHza6ro=;
        h=From:To:Subject:Date:From;
        b=W5i19j56PDPrpjFWdse7x73difnYg0BiL2uZ2KDZ0I1wXLoPwve/NZMnAhLAtTjZV
         NW8zIRuI9SgVMeQhyFto2jxNrEPDBZLjz57pCR7TevHE2hln41ZVU0wYMGX3KEDLPh
         XgBCTe0N5Oe3bgQbYWc4LN0xOaP5+pxuxeJ0CIGh140cqeOryBHTnpQIjrm4kjWAxY
         pBkF2Z5QqdgUbYZ+T9tqXPdvTGrHRWBQvRyRKmsuWD4RTkD9WvuaXO16rB94dmpn75
         qqh3Ph5M6mYGJxoe824I3Qn5HTGKhOiy/au858u5luAAmlIQ0mBFAkWucEr/kcm07X
         wBTlXRhTAZbSA==
From:   Sean Young <sean@mess.org>
To:     linux-media@vger.kernel.org
Subject: [PATCH 0/4] Various rc-loopback fixes
Date:   Sat,  3 Jul 2021 16:03:50 +0100
Message-Id: <cover.1625324530.git.sean@mess.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Sean Young (4):
  media: rc-loopback: return set of valid emitters rather error
  media: rc-loopback: use dev_dbg() rather than handrolled debug
  media: rc-loopback: send carrier reports
  media: rc: rename s_learning_mode() to s_wideband_receiver()

 drivers/media/rc/ene_ir.c      |  2 +-
 drivers/media/rc/lirc_dev.c    |  6 +--
 drivers/media/rc/mceusb.c      |  2 +-
 drivers/media/rc/rc-loopback.c | 78 +++++++++++++++++-----------------
 include/media/rc-core.h        |  4 +-
 5 files changed, 46 insertions(+), 46 deletions(-)

-- 
2.31.1

