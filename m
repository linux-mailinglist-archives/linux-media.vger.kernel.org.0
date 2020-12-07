Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5FFC82D19A9
	for <lists+linux-media@lfdr.de>; Mon,  7 Dec 2020 20:37:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725987AbgLGTfd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 7 Dec 2020 14:35:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59722 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725874AbgLGTfc (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 7 Dec 2020 14:35:32 -0500
Received: from faui03.informatik.uni-erlangen.de (faui03.informatik.uni-erlangen.de [IPv6:2001:638:a000:4130:131:188:30:103])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75B38C061794;
        Mon,  7 Dec 2020 11:34:52 -0800 (PST)
Received: from cipterm0.informatik.uni-erlangen.de (cipterm0.cip.cs.fau.de [131.188.30.90])
        by faui03.informatik.uni-erlangen.de (Postfix) with ESMTP id 5232B240D59;
        Mon,  7 Dec 2020 20:27:01 +0100 (CET)
Received: by cipterm0.informatik.uni-erlangen.de (Postfix, from userid 67858)
        id 450E73280304; Mon,  7 Dec 2020 20:27:01 +0100 (CET)
From:   Philipp Gerlesberger <Philipp.Gerlesberger@fau.de>
To:     linux-kernel@vger.kernel.org
Cc:     Philipp Gerlesberger <Philipp.Gerlesberger@fau.de>,
        linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        mchehab@kernel.org, sakari.ailus@linux.intel.com,
        gregkh@linuxfoundation.org,
        ij72uhux@stud.informatik.uni-erlangen.de, linux-kernel@i4.cs.fau.de
Subject: [PATCH 00/12] media: atomisp: Codingstyle
Date:   Mon,  7 Dec 2020 20:26:26 +0100
Message-Id: <20201207192638.15219-1-Philipp.Gerlesberger@fau.de>
X-Mailer: git-send-email 2.20.1
Reply-To: Philipp.Gerlesberger@fau.de,
          ij72uhux@stud.informatik.uni-erlangen.de
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

Best regards
Philipp

----------------------------------------------------------------------
  media: atomsip: Convert comments to C99 initializers
  media: atomisp: Fix Block Comments
  media: atomisp: Fix EMBEDDED_FUNCTION_NAME warning
  media: atomisp: Fix OPEN_ENDED_LINE
  media: atomisp: Fix overlong line
  media: atomisp: Add parentheses
  media: atomisp: Fix funciton decleration
  media: atomisp: Delete braces
  media: atomisp: Fix PARENTHESIS_ALIGNMENT
  media: atomisp: Fix BLOCK_COMMENT_STYLE
  media: atomisp: Write function decleration in one line
  media: atomisp: Fix LOGICAL_CONTINUATIONS

 .../atomisp/pci/runtime/queue/src/queue.c     | 48 +++++-------------
 .../pci/runtime/rmgr/interface/ia_css_rmgr.h  |  4 +-
 .../atomisp/pci/runtime/rmgr/src/rmgr_vbuf.c  | 49 +++++++++----------
 .../atomisp/pci/runtime/spctrl/src/spctrl.c   |  7 ++-
 .../atomisp/pci/runtime/timer/src/timer.c     |  7 +--
 5 files changed, 44 insertions(+), 71 deletions(-)

-- 
2.20.1

