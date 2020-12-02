Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EB7F32CBF8A
	for <lists+linux-media@lfdr.de>; Wed,  2 Dec 2020 15:27:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727904AbgLBO1A (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Dec 2020 09:27:00 -0500
Received: from retiisi.eu ([95.216.213.190]:59404 "EHLO hillosipuli.retiisi.eu"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727570AbgLBO1A (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 2 Dec 2020 09:27:00 -0500
Received: from lanttu.localdomain (lanttu-e.localdomain [192.168.1.64])
        by hillosipuli.retiisi.eu (Postfix) with ESMTP id 30759634C24;
        Wed,  2 Dec 2020 16:24:07 +0200 (EET)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     mchehab@kernel.org
Subject: [PATCH 0/2] Clean up CCS register file a little
Date:   Wed,  2 Dec 2020 16:22:09 +0200
Message-Id: <20201202142211.10305-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi all,

This small set addresses two remaining review comments regarding the CCS
register file. The file is renamed as ccs-regs.asc and the SPDX tag line
is moved first in the file.

Sakari Ailus (2):
  Documentation: ccs: Rename ccs-regs.txt as ccs-regs.asc
  Documentation: ccs: Reorder SPDX and copyright notice lines

 .../media/drivers/ccs/{ccs-regs.txt => ccs-regs.asc}          | 2 +-
 Documentation/driver-api/media/drivers/ccs/ccs.rst            | 4 ++--
 Documentation/driver-api/media/drivers/ccs/mk-ccs-regs        | 4 ++--
 3 files changed, 5 insertions(+), 5 deletions(-)
 rename Documentation/driver-api/media/drivers/ccs/{ccs-regs.txt => ccs-regs.asc} (100%)

-- 
2.27.0

