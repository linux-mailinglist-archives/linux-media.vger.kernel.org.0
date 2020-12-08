Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D0CB32D2AB3
	for <lists+linux-media@lfdr.de>; Tue,  8 Dec 2020 13:26:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728460AbgLHM0f (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 8 Dec 2020 07:26:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46732 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727452AbgLHM0d (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 8 Dec 2020 07:26:33 -0500
Received: from hillosipuli.retiisi.eu (unknown [IPv6:2a01:4f9:c010:4572::e8:2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A12AC061749
        for <linux-media@vger.kernel.org>; Tue,  8 Dec 2020 04:25:53 -0800 (PST)
Received: from valkosipuli.localdomain (unknown [IPv6:fd35:1bc8:1a6:d3d5::80:2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id E24F7634C87
        for <linux-media@vger.kernel.org>; Tue,  8 Dec 2020 14:25:43 +0200 (EET)
Received: from sailus by valkosipuli.localdomain with local (Exim 4.92)
        (envelope-from <sakari.ailus@retiisi.org.uk>)
        id 1kmc3s-0000Vf-32
        for linux-media@vger.kernel.org; Tue, 08 Dec 2020 14:25:44 +0200
Date:   Tue, 8 Dec 2020 14:25:44 +0200
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     linux-media@vger.kernel.org
Subject: [GIT PULL for 5.11] One more fix for this cycle
Message-ID: <20201208122543.GA1167@valkosipuli.retiisi.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

Here's another fix for patches applied during this cycle. If this can make
it to master it'd be nice, but could be applied as a fix later on as well.

Please pull.


The following changes since commit 7ea4d23293300ca2f225595849a4fe444fb80ea4:

  media: ccs: Add support for obtaining C-PHY configuration from firmware (2020-12-07 17:05:16 +0100)

are available in the Git repository at:

  git://linuxtv.org/sailus/media_tree.git tags/for-5.11-7-signed

for you to fetch changes up to e4b861187c41e7c978364db591444bcf74854a62:

  media: rcar-vin: fix return, use ret instead of zero (2020-12-07 20:34:10 +0200)

----------------------------------------------------------------
Fix rcar-vin return value for 5.11

----------------------------------------------------------------
Colin Ian King (1):
      media: rcar-vin: fix return, use ret instead of zero

 drivers/media/platform/rcar-vin/rcar-core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
Sakari Ailus
