Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7419227B655
	for <lists+linux-media@lfdr.de>; Mon, 28 Sep 2020 22:33:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726692AbgI1UdZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 28 Sep 2020 16:33:25 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:49166 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726607AbgI1UdZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 28 Sep 2020 16:33:25 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 08SKXLGN013287;
        Mon, 28 Sep 2020 15:33:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1601325201;
        bh=t/hP2PNT7fH3omwmKWNOUyNxf0rEpsiIYB3gL/A/KQw=;
        h=From:To:CC:Subject:Date;
        b=lb4qUFol/Wc28PSf3PKmUNqESpMvy5W6P2qXsNKLBLQ2ombWynmBBB581mfpMk9FI
         mJx5vLYu6uFuk+P40Ntdx70cottQCEdB5DRZ/5AWPHGDHdhfbSRNRzDTI9C8OrIdqF
         U1QwWnanlkJLN9mMTNZMW/0FCESYS6cktY4kcl+4=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 08SKXLV6110967
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 28 Sep 2020 15:33:21 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Mon, 28
 Sep 2020 15:33:21 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Mon, 28 Sep 2020 15:33:21 -0500
Received: from NiksLab.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 08SKXHYw084953;
        Mon, 28 Sep 2020 15:33:18 -0500
From:   Nikhil Devshatwar <nikhil.nd@ti.com>
To:     <linux-firmware@kernel.org>, <linux-media@vger.kernel.org>
CC:     <dmurphy@ti.com>, <tomi.valkeinen@ti.com>, <bparrot@ti.com>,
        <nsekhar@ti.com>, <laurent.pinchart@ideasonboard.com>,
        <nikhil.nd@ti.com>
Subject: [PATCH 0/1] linux-firmware: Add VPDMA firmware binary
Date:   Tue, 29 Sep 2020 02:03:02 +0530
Message-ID: <20200928203303.32178-1-nikhil.nd@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This patch adds a firmware binary for VPDMA, which is a hardware
block used in Texas Instrument's VPE (Video Processing Engine)

Nikhil Devshatwar (1):
  linux-firmware: Add new VPDMA firmware 1b8.bin

 LICENCE.ti-tspa               |  46 ++++++++++++++++++++++++++++++++++
 WHENCE                        |   8 ++++++
 ti-connectivity/vpdma-1b8.bin | Bin 0 -> 4002 bytes
 3 files changed, 54 insertions(+)
 create mode 100644 LICENCE.ti-tspa
 create mode 100644 ti-connectivity/vpdma-1b8.bin

-- 
2.17.1

