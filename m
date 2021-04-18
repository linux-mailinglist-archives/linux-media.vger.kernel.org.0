Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7D1D13633CE
	for <lists+linux-media@lfdr.de>; Sun, 18 Apr 2021 07:12:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229991AbhDRFMT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 18 Apr 2021 01:12:19 -0400
Received: from mslow1.mail.gandi.net ([217.70.178.240]:59717 "EHLO
        mslow1.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229671AbhDRFMS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 18 Apr 2021 01:12:18 -0400
Received: from relay6-d.mail.gandi.net (unknown [217.70.183.198])
        by mslow1.mail.gandi.net (Postfix) with ESMTP id 228BACA3F0
        for <linux-media@vger.kernel.org>; Sun, 18 Apr 2021 05:07:36 +0000 (UTC)
X-Originating-IP: 24.194.32.49
Received: from coplandos.local (cpe-24-194-32-49.nycap.res.rr.com [24.194.32.49])
        (Authenticated sender: vrzh@vrzh.net)
        by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id EDC49C0002;
        Sun, 18 Apr 2021 05:07:12 +0000 (UTC)
From:   Martiros Shakhzadyan <vrzh@vrzh.net>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Martiros Shakhzadyan <vrzh@vrzh.net>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org
Subject: [PATCH 0/8] A series of cleanup patches for sh_css.c
Date:   Sun, 18 Apr 2021 01:09:56 -0400
Message-Id: <20210418051004.261096-1-vrzh@vrzh.net>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The following set of patches for sh_css.c resolves all coding style
errors and a number of warnings/checks.

Martiros Shakhzadyan (8):
  staging: media: atomisp: Fix the rest of sh_css.c brace issues
  staging: media: atomisp: Remove all redundant assertions in sh_css.c
  staging: media: atomisp: Remove a superfluous else clause in sh_css.c
  staging: media: atomisp: Replace goto with immediate return in
    sh_css_pipe_get_grid_info()
  staging: media: atomisp: Refactor ia_css_stream_load()
  staging: media: atomisp: Replace if else clause with a ternary
  staging: media: atomisp: Fix line split style issues
  staging: media: atomisp: Fix alignment and line length issues

 drivers/staging/media/atomisp/pci/sh_css.c | 1850 +++++++++-----------
 1 file changed, 866 insertions(+), 984 deletions(-)

-- 
2.31.1

