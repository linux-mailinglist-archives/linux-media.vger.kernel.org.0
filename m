Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 93E701927F1
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2020 13:15:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727351AbgCYMPz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 25 Mar 2020 08:15:55 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:41778 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726969AbgCYMPz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 25 Mar 2020 08:15:55 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 02PCFomI062531;
        Wed, 25 Mar 2020 07:15:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1585138551;
        bh=4dpqFo+wvQLmWIlMVwaR4btSsb/TuYNx8RPWGAFF5Uo=;
        h=From:To:CC:Subject:Date;
        b=Bqvznc6/sByQdTRLVsXulPAdkqQRjkyKmhCVMZTGCDBzOagNYEzngO//GpluI801a
         9+7q/Ff5ucoUNRpHnktwdW+xJlhqxgCKgSUSbuUOiqOarewUdUT0u4qGfoAwBNkJBZ
         WfctNw9A6nligWREo4YneZf97QYoahpvMBK1gMew=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 02PCForg086992
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 25 Mar 2020 07:15:50 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Wed, 25
 Mar 2020 07:15:50 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Wed, 25 Mar 2020 07:15:50 -0500
Received: from deskari.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 02PCFm4x085323;
        Wed, 25 Mar 2020 07:15:49 -0500
From:   Tomi Valkeinen <tomi.valkeinen@ti.com>
To:     <linux-media@vger.kernel.org>, Benoit Parrot <bparrot@ti.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Hans Verkuil <hverkuil@xs4all.nl>
CC:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: [PATCH v3 00/19] CAL fixes and improvements
Date:   Wed, 25 Mar 2020 14:14:51 +0200
Message-ID: <20200325121510.25923-1-tomi.valkeinen@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

Third version of the series. No functional changes. Added reviewed-bys,
and removed a few debug prints in an earlier commit.

 Tomi

Tomi Valkeinen (19):
  media: ti-vpe: cal: fix DMA memory corruption
  media: ti-vpe: cal: improve enable_irqs
  media: ti-vpe: cal: fix use of wrong macro
  media: ti-vpe: cal: use runtime_resume for errata handling
  media: ti-vpe: cal: drop cal_runtime_get/put
  media: ti-vpe: cal: catch error irqs and print errors
  media: ti-vpe: cal: print errors on timeouts
  media: ti-vpe: cal: simplify irq handling
  media: ti-vpe: cal: remove useless CAL_GEN_* macros
  media: ti-vpe: cal: remove useless IRQ defines
  media: ti-vpe: cal: use reg_write_field
  media: ti-vpe: cal: cleanup CIO power enable/disable
  media: ti-vpe: cal: fix dummy read to phy
  media: ti-vpe: cal: program number of lines properly
  media: ti-vpe: cal: set DMA max seg size
  media: ti-vpe: cal: move code to separate functions
  media: ti-vpe: cal: improve wait for CIO resetdone
  media: ti-vpe: cal: improve wait for stop-state
  media: ti-vpe: cal: fix stop state timeout

 drivers/media/platform/ti-vpe/cal.c      | 398 ++++++++++++++---------
 drivers/media/platform/ti-vpe/cal_regs.h |  21 +-
 2 files changed, 245 insertions(+), 174 deletions(-)

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

