Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A48431EE86A
	for <lists+linux-media@lfdr.de>; Thu,  4 Jun 2020 18:16:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729783AbgFDQQK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 4 Jun 2020 12:16:10 -0400
Received: from mga17.intel.com ([192.55.52.151]:25667 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729699AbgFDQQK (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 4 Jun 2020 12:16:10 -0400
IronPort-SDR: PYPgzZr5f4cVt3jEsGyA/I3zOOAa4SKqppoq9yXhUXjD2e5d45zuAa1bkV2KKSr94zKiqGo84G
 EAUo7Uq/HA6A==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2020 09:15:45 -0700
IronPort-SDR: 5j+gICrUYsT6/W5kFmavGdZPcoW0MWCoeCET0ho6I4I0fmqt0uB8OYsSWneHb+9gCSXjpEZt5v
 fECKlqbIxuGA==
X-IronPort-AV: E=Sophos;i="5.73,472,1583222400"; 
   d="scan'208";a="258930715"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2020 09:15:44 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
        by paasikivi.fi.intel.com (Postfix) with ESMTP id 20FD021505;
        Thu,  4 Jun 2020 19:15:42 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.92)
        (envelope-from <sakari.ailus@linux.intel.com>)
        id 1jgsXV-0002Qf-CA; Thu, 04 Jun 2020 19:16:21 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     mchehab@kernel.org
Cc:     linux-media@vger.kernel.org
Subject: [PATCH 4/4] staging: atomisp: Check return value from compat_alloc_user_space
Date:   Thu,  4 Jun 2020 19:16:21 +0300
Message-Id: <20200604161621.9282-5-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200604161621.9282-1-sakari.ailus@linux.intel.com>
References: <20200604161621.9282-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/staging/media/atomisp/pci/atomisp_compat_ioctl32.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_compat_ioctl32.c b/drivers/staging/media/atomisp/pci/atomisp_compat_ioctl32.c
index c8649923b6b9e..e06cf1883fc4b 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_compat_ioctl32.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_compat_ioctl32.c
@@ -863,6 +863,8 @@ static long atomisp_do_compat_ioctl(struct file *file,
 				 sizeof(struct atomisp_morph_table) +
 				 sizeof(struct atomisp_dis_coefficients) +
 				 sizeof(struct atomisp_dvs_6axis_config) : 0));
+	if (!karg)
+		return -ENOMEM;
 
 	/* First, convert the command. */
 	switch (cmd) {
-- 
2.20.1

