Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 954352AC3F7
	for <lists+linux-media@lfdr.de>; Mon,  9 Nov 2020 19:37:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730185AbgKIShg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 9 Nov 2020 13:37:36 -0500
Received: from 82-65-109-163.subs.proxad.net ([82.65.109.163]:40064 "EHLO
        luna.linkmauve.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729493AbgKIShg (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 9 Nov 2020 13:37:36 -0500
X-Greylist: delayed 1483 seconds by postgrey-1.27 at vger.kernel.org; Mon, 09 Nov 2020 13:37:35 EST
Received: by luna.linkmauve.fr (Postfix, from userid 1000)
        id E06F2F4158B; Mon,  9 Nov 2020 17:23:06 +0100 (CET)
From:   Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>
To:     Ezequiel Garcia <ezequiel@collabora.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org
Cc:     Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>
Subject: [RESEND PATCH 0/2] media: uapi: Expose VP8 probability lengths as defines
Date:   Mon,  9 Nov 2020 17:22:42 +0100
Message-Id: <20201109162244.16531-1-linkmauve@linkmauve.fr>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

These values will be used by various drivers implementing the VP8
stateless API.

This had been suggested by Ezequiel Garcia for the Cedrus VP8 driver.

The only driver using this API (until now) has also been updated to use
these new defines.

This is a resend because I forgot to include most maintainers, sorry for
that.  It’s my very first patch to the kernel, I didn’t know about
scripts/get_maintainers.pl

Emmanuel Gil Peyrot (2):
  media: uapi: Expose probability lengths as defines
  media: hantro: Use VP8 lengths defined in uapi

 drivers/staging/media/hantro/hantro_vp8.c | 4 ++--
 include/media/vp8-ctrls.h                 | 6 ++++--
 2 files changed, 6 insertions(+), 4 deletions(-)

-- 
2.29.2

