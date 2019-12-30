Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9794A12CEAA
	for <lists+linux-media@lfdr.de>; Mon, 30 Dec 2019 11:16:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727334AbfL3KQC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 30 Dec 2019 05:16:02 -0500
Received: from retiisi.org.uk ([95.216.213.190]:43704 "EHLO
        hillosipuli.retiisi.org.uk" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727322AbfL3KQC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 30 Dec 2019 05:16:02 -0500
Received: from valkosipuli.localdomain (valkosipuli.retiisi.org.uk [IPv6:2a01:4f9:c010:4572::80:2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.org.uk (Postfix) with ESMTPS id ACC21634C86
        for <linux-media@vger.kernel.org>; Mon, 30 Dec 2019 12:15:13 +0200 (EET)
Received: from sailus by valkosipuli.localdomain with local (Exim 4.92)
        (envelope-from <sakari.ailus@retiisi.org.uk>)
        id 1ils4w-0001YI-0a
        for linux-media@vger.kernel.org; Mon, 30 Dec 2019 12:15:14 +0200
Date:   Mon, 30 Dec 2019 12:15:13 +0200
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     linux-media@vger.kernel.org
Subject: [GIT FIXES for 5.5] Ipu3 alignment warning fix
Message-ID: <20191230101513.GE5050@valkosipuli.retiisi.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

Here's a fix for the compiler warning from the ipu3 driver. The warning was
generated only by some of the latest GCC versions and hence it went
unnoticed for some time.

Please pull.


The following changes since commit e5a52a1d15c79bb48a430fb263852263ec1d3f11:

  media: pulse8-cec: fix lost cec_transmit_attempt_done() call (2019-12-13 11:22:10 +0100)

are available in the Git repository at:

  git://linuxtv.org/sailus/media_tree.git tags/fixes-5.5-1-signed

for you to fetch changes up to c870130f7a22c104385c82f326d29249108c7c85:

  intel-ipu3: Align struct ipu3_uapi_awb_fr_config_s to 32 bytes (2019-12-30 11:52:20 +0200)

----------------------------------------------------------------
Ipu3 compiler warning fix

----------------------------------------------------------------
Sakari Ailus (1):
      intel-ipu3: Align struct ipu3_uapi_awb_fr_config_s to 32 bytes

 drivers/staging/media/ipu3/include/intel-ipu3.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
Sakari Ailus
