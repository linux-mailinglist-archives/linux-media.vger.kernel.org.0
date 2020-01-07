Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E0BDE131D0A
	for <lists+linux-media@lfdr.de>; Tue,  7 Jan 2020 02:14:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727348AbgAGBOU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Jan 2020 20:14:20 -0500
Received: from mga12.intel.com ([192.55.52.136]:60822 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727250AbgAGBOU (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 6 Jan 2020 20:14:20 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 06 Jan 2020 17:14:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,404,1571727600"; 
   d="scan'208";a="216992309"
Received: from maru.jf.intel.com ([10.54.51.77])
  by fmsmga007.fm.intel.com with ESMTP; 06 Jan 2020 17:14:19 -0800
From:   Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
To:     Eddie James <eajames@linux.ibm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>
Cc:     linux-aspeed@lists.ozlabs.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, openbmc@lists.ozlabs.org,
        Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Subject: [PATCH 0/3] Add AST2600 Video Engine support
Date:   Mon,  6 Jan 2020 17:15:00 -0800
Message-Id: <20200107011503.17435-1-jae.hyun.yoo@linux.intel.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Video engine in AST2600 has the exactly same register set with
AST2500 except VR084 register which provides more precise JPEG
size read back. This patch set adds Video Engine node and driver
support for AST2600.

Please review it.

Thanks,

Jae

Jae Hyun Yoo (3):
  ARM: dts: aspeed-g6: Add Video Engine node
  Documentation: dt-bindings: media: add AST2600 Video Engine support
  media: aspeed: add AST2600 support

 .../devicetree/bindings/media/aspeed-video.txt    |  5 +++--
 arch/arm/boot/dts/aspeed-g6.dtsi                  | 10 ++++++++++
 drivers/media/platform/aspeed-video.c             | 15 +++++++++++----
 3 files changed, 24 insertions(+), 6 deletions(-)

-- 
2.17.1

