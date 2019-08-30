Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E260FA3637
	for <lists+linux-media@lfdr.de>; Fri, 30 Aug 2019 14:05:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727781AbfH3MF1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 30 Aug 2019 08:05:27 -0400
Received: from retiisi.org.uk ([95.216.213.190]:38438 "EHLO
        hillosipuli.retiisi.org.uk" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727729AbfH3MF1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 30 Aug 2019 08:05:27 -0400
Received: from valkosipuli.localdomain (valkosipuli.retiisi.org.uk [IPv6:2a01:4f9:c010:4572::80:2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.org.uk (Postfix) with ESMTPS id B0C4C634C87
        for <linux-media@vger.kernel.org>; Fri, 30 Aug 2019 15:05:00 +0300 (EEST)
Received: from sailus by valkosipuli.localdomain with local (Exim 4.92)
        (envelope-from <sakari.ailus@retiisi.org.uk>)
        id 1i3feG-00011V-Jc
        for linux-media@vger.kernel.org; Fri, 30 Aug 2019 15:05:00 +0300
Date:   Fri, 30 Aug 2019 15:05:00 +0300
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     linux-media@vger.kernel.org
Subject: [GIT PULL for 5.4] sun4i csi driver sparse fix
Message-ID: <20190830120500.GB3568@valkosipuli.retiisi.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

Here's a small sparse fix for the sun4i csi driver.

Please pull.


The following changes since commit 968bce2f59ce462d296af28610628fe7e03b120a:

  media: imx: remove unused including <linux/version.h> (2019-08-29 10:23:18 -0300)

are available in the Git repository at:

  ssh://linuxtv.org/git/sailus/media_tree.git tags/for-5.4-8-signed

for you to fetch changes up to 3b4dd9dd5db0f77a9541588e7d05bfcf97823d0c:

  media: sun4i: Make sun4i_csi_formats static (2019-08-30 14:55:49 +0300)

----------------------------------------------------------------
sparse fix for sun4i csi driver

----------------------------------------------------------------
Maxime Ripard (1):
      media: sun4i: Make sun4i_csi_formats static

 drivers/media/platform/sunxi/sun4i-csi/sun4i_v4l2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
Sakari Ailus
