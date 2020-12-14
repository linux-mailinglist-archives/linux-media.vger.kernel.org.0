Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 111582D96E9
	for <lists+linux-media@lfdr.de>; Mon, 14 Dec 2020 12:04:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728225AbgLNLEE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 14 Dec 2020 06:04:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41594 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727892AbgLNLD5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 14 Dec 2020 06:03:57 -0500
Received: from faui03.informatik.uni-erlangen.de (faui03.informatik.uni-erlangen.de [IPv6:2001:638:a000:4130:131:188:30:103])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9478CC061793;
        Mon, 14 Dec 2020 03:03:03 -0800 (PST)
Received: from cipterm0.informatik.uni-erlangen.de (cipterm0.cip.cs.fau.de [IPv6:2001:638:a000:4130:131:188:30:90])
        by faui03.informatik.uni-erlangen.de (Postfix) with ESMTP id 78D9F240B57;
        Mon, 14 Dec 2020 12:02:17 +0100 (CET)
Received: by cipterm0.informatik.uni-erlangen.de (Postfix, from userid 67858)
        id 71B223280146; Mon, 14 Dec 2020 12:02:17 +0100 (CET)
From:   Philipp Gerlesberger <Philipp.Gerlesberger@fau.de>
To:     linux-kernel@vger.kernel.org
Cc:     Philipp Gerlesberger <Philipp.Gerlesberger@fau.de>,
        ij72uhux@stud.informatik.uni-erlangen.de,
        linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-kernel@i4.cs.fau.de, gregkh@linuxfoundation.org,
        sakari.ailus@linux.intel.com, mchehab@kernel.org
Subject: [PATCH v2 00/12] media: atomisp: Codingstyle
Date:   Mon, 14 Dec 2020 12:01:44 +0100
Message-Id: <20201214110156.6152-1-Philipp.Gerlesberger@fau.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello!

This series fix some codingstyle errors in the files
rmgr_vbuf.c, ia_css_rmgr.h, timer.c, spctrl.c and queue.c
in the drivers/staging/media area.

V2:
[Patch 1/12] Also remove NULL, 0 and false members to make it
	     C99 standard comform.

[Patch 6/12] Checkpatch throws COMPLEX_MACRO Error. Handle that
	     error by deleting these defines.

The other patches are the same. 

Best regards
Philipp

----------------------------------------------------------------------
  media: atomisp: Convert comments to C99 initializers
  media: atomisp: Fix Block Comments
  media: atomisp: Fix EMBEDDED_FUNCTION_NAME warning
  media: atomisp: Fix OPEN_ENDED_LINE
  media: atomisp: Fix overlong line
  media: atomisp: Remove defines
  media: atomisp: Fix funciton decleration
  media: atomisp: Delete braces
  media: atomisp: Fix PARENTHESIS_ALIGNMENT
  media: atomisp: Fix BLOCK_COMMENT_STYLE
  media: atomisp: Write function decleration in one line
  media: atomisp: Fix LOGICAL_CONTINUATIONS

 .../atomisp/pci/runtime/queue/src/queue.c     | 48 +++++--------------
 .../pci/runtime/rmgr/interface/ia_css_rmgr.h  |  5 +-
 .../atomisp/pci/runtime/rmgr/src/rmgr_vbuf.c  | 41 ++++++----------
 .../atomisp/pci/runtime/spctrl/src/spctrl.c   |  7 ++-
 .../atomisp/pci/runtime/timer/src/timer.c     |  7 +--
 5 files changed, 33 insertions(+), 75 deletions(-)

-- 
2.20.1

