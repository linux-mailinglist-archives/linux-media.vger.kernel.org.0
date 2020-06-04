Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 063E91EEC5A
	for <lists+linux-media@lfdr.de>; Thu,  4 Jun 2020 22:47:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730026AbgFDUrJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 4 Jun 2020 16:47:09 -0400
Received: from mail.kernel.org ([198.145.29.99]:40996 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729174AbgFDUrJ (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 4 Jun 2020 16:47:09 -0400
Received: from mail.kernel.org (ip5f5ad5c5.dynamic.kabel-deutschland.de [95.90.213.197])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A87D5206DC;
        Thu,  4 Jun 2020 20:47:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1591303628;
        bh=Qo4iouPHpf3BJiYOoLSBBWarAnUgUp44p/1xY7iDdbs=;
        h=From:To:Cc:Subject:Date:From;
        b=p25+39YGs09UTDVBmtDmLT+oKJy/0KC1yHGPY4Y+AJ1smzRMuCUAR8S7ddNUsT0FY
         Em8J36/ctZ4PMn7Yr7JNABCUOoKQVJAZq9brxC21U95Ff/tRDgQ/2aVeSnH3cGyh2s
         Rsd8UvacHo8qieFeZ3XhD1w04be83FYMVtnxpKRQ=
Received: from mchehab by mail.kernel.org with local (Exim 4.93)
        (envelope-from <mchehab@kernel.org>)
        id 1jgwlW-0004AW-ME; Thu, 04 Jun 2020 22:47:06 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        linux-kernel@vger.kernel.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        devel@driverdev.osuosl.org, linux-media@vger.kernel.org
Subject: [PATCH 0/5] Improve ACPI detection code for atomisp
Date:   Thu,  4 Jun 2020 22:47:00 +0200
Message-Id: <cover.1591303518.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add support to read the sensor configuration directly from the BIOS,
instead of relying on DMI match tables.

As we don't have the legacy models there which has their own
DMI match tables, we can't remove them, but this change should
make this driver to better detect unlisted devices.

Mauro Carvalho Chehab (5):
  media: atomisp: improve sensor detection code to use _DSM table
  Revert "media: atomisp: Add some ACPI detection info"
  Revert "media: atomisp: add Asus Transform T101HA ACPI vars"
  media: atomisp: change clock source default for ISP2401
  media: atomisp: improve ACPI/DMI detection logs

 drivers/staging/media/atomisp/TODO            |  43 +----
 .../media/atomisp/i2c/atomisp-gc0310.c        |  11 --
 .../media/atomisp/i2c/atomisp-gc2235.c        |  11 --
 .../media/atomisp/i2c/atomisp-lm3554.c        |  11 --
 .../media/atomisp/i2c/atomisp-mt9m114.c       |  11 --
 .../media/atomisp/i2c/atomisp-ov2680.c        |  11 --
 .../media/atomisp/i2c/atomisp-ov2722.c        |  11 --
 .../media/atomisp/i2c/ov5693/atomisp-ov5693.c |  11 --
 .../media/atomisp/pci/atomisp_gmin_platform.c | 157 ++++++++++++++----
 9 files changed, 129 insertions(+), 148 deletions(-)

-- 
2.26.2


