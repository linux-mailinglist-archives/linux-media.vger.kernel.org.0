Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 356D4A9BED
	for <lists+linux-media@lfdr.de>; Thu,  5 Sep 2019 09:33:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731878AbfIEHdq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 5 Sep 2019 03:33:46 -0400
Received: from lb1-smtp-cloud7.xs4all.net ([194.109.24.24]:47829 "EHLO
        lb1-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1731731AbfIEHdp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 5 Sep 2019 03:33:45 -0400
Received: from tschai.fritz.box ([46.9.232.237])
        by smtp-cloud7.xs4all.net with ESMTPA
        id 5mGyiVQ6750xT5mH1ipZ2P; Thu, 05 Sep 2019 09:33:44 +0200
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Jiunn Chang <c0d1n61at3@gmail.com>
Subject: [PATCH 0/2] cec: add defines for the CEC UI Command Operand
Date:   Thu,  5 Sep 2019 09:33:38 +0200
Message-Id: <20190905073340.8474-1-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.23.0.rc1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfMS8HxhvTvWT2ytbv0HAz+WSIO5WqUtT82XxzPWln2TpdLe+nny8r3YdRGlJBkW/ra1Tdw/Ro2sV0/+O2LnPq0uge4bRYXX8FaBbYirBk5ZB5IpDxbGY
 28bBmBOJWiKA/i46g5Yf6UzwUGICxns8ri5Lqj22kTzyfZCOM6k4wYNFsrJSRAyXsS14Q7vp1iATmjM25mwLkWUyNA8a8/smT7ysm/XVsNmTp93pM68cP9QT
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This series adds defines for the CEC UI Command Operand. I suspect
the reason these weren't added before was laziness :-)

Anyway, this adds them and uses the new defines in cec-adap.c.

I decided not to use them in drivers/media/rc/keymaps/rc-cec.c
since I think it would actually make that keymap table harder to
read and understand.

Once this is merged, then the cec utilities in v4l-utils can
start to use these defines as well.

Regards,

	Hans

Hans Verkuil (2):
  uapi/linux/cec.h: add defines for the CEC UI Command Operand
  cec/cec-adap.c: use new UI_CMD defines

 drivers/media/cec/cec-adap.c | 10 ++--
 include/uapi/linux/cec.h     | 89 ++++++++++++++++++++++++++++++++++++
 2 files changed, 96 insertions(+), 3 deletions(-)

-- 
2.23.0.rc1

