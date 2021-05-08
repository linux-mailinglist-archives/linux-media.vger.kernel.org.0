Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 22DB437749F
	for <lists+linux-media@lfdr.de>; Sun,  9 May 2021 02:01:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229631AbhEIACC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 8 May 2021 20:02:02 -0400
Received: from mslow1.mail.gandi.net ([217.70.178.240]:41675 "EHLO
        mslow1.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229570AbhEIACB (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 8 May 2021 20:02:01 -0400
Received: from relay9-d.mail.gandi.net (unknown [217.70.183.199])
        by mslow1.mail.gandi.net (Postfix) with ESMTP id 91C7AC0B42
        for <linux-media@vger.kernel.org>; Sat,  8 May 2021 23:52:55 +0000 (UTC)
X-Originating-IP: 24.194.32.49
Received: from coplandos.local (cpe-24-194-32-49.nycap.res.rr.com [24.194.32.49])
        (Authenticated sender: vrzh@vrzh.net)
        by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id C5396FF805;
        Sat,  8 May 2021 23:52:30 +0000 (UTC)
From:   Martiros Shakhzadyan <vrzh@vrzh.net>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Martiros Shakhzadyan <vrzh@vrzh.net>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org
Subject: [PATCH 0/4] staging: media: atomisp: Fix minor issues in
Date:   Sat,  8 May 2021 19:56:18 -0400
Message-Id: <20210508235622.300394-1-vrzh@vrzh.net>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The following series of patches resolve some style and other minor
issues in sh_css.c

Martiros Shakhzadyan (4):
  staging: media: atomisp: Resolve goto style issue in sh_css.c
  staging: media: atomisp: Remove unnecessary parens in sh_css.c
  staging: media: atomisp: Use kcalloc instead of kzalloc with multiply
    in sh_css.c
  staging: media: atomisp: Fix line continuation style issue in sh_css.c

 drivers/staging/media/atomisp/pci/sh_css.c | 42 +++++++++++-----------
 1 file changed, 21 insertions(+), 21 deletions(-)

-- 
2.31.1

