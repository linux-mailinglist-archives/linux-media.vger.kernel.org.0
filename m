Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6570C2873BF
	for <lists+linux-media@lfdr.de>; Thu,  8 Oct 2020 13:59:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729030AbgJHL7V (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 8 Oct 2020 07:59:21 -0400
Received: from lb2-smtp-cloud8.xs4all.net ([194.109.24.25]:49951 "EHLO
        lb2-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725978AbgJHL7V (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 8 Oct 2020 07:59:21 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id QUZlkBbKmTHgxQUZokHmpx; Thu, 08 Oct 2020 13:59:18 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1602158358; bh=K73TOff0Z4PHgrKaDZjD3nwd8yn8qXIflb1Gv/r1M7k=;
        h=From:To:Subject:Date:Message-Id:MIME-Version:From:Subject;
        b=tKdc/+qw3b1YjCTFQ+Jx1b4zhgIEHLsSgANY2O+zf8489JLcKkwRnEFqWnPqjfb8I
         VpP2Y+wAAJ+Q+8Pwhl47agirnYJjaBQ96LfGXF3iMdSiOzBIBhl5QKODTqMC6jT+C5
         CZN8ulDpVSRKny2IL+SAJpaOpbkkXybIbxoVWTGh7FcFzMQ9x/LP8VGC9fApQQ4M64
         gJffa2vxLuHF0WO4qYbXAjhpIF1X+kIlfio0fTdoi8a11OOV2ZyF0DoIHwRyluP1o2
         SYNcA2mWP3kl011RyZ0glwrMnmVpMnfn01zgbkErGfbqiR1YF9Z9VWBpljPH0C+mHR
         dwL8NJsXhnDcQ==
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Subject: [PATCHv2 0/3] Three fixes to clean up daily build warnings
Date:   Thu,  8 Oct 2020 13:59:10 +0200
Message-Id: <20201008115913.3579973-1-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfAZk21hCLI8VStI2AfbWci8q3BTCC+HOgCsjACXqxricSbs4WC8dAq7R65HAVv7WmRpI3+nBe4yPzoDkW/8Yf2ZXBqEcIxeO+vDVLJxeprZI/IYlIXRg
 3mE6Gv23fRbStV/kbUQwkAmcYw5AqdL4hY9GTkp2VOEjJR8kK6piJZnRS/kVHWCURgWX57FnXjMppQ==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

New warnings appeared in the daily build after switching to gcc 10.2.0.
These patches fix those warnings.

Changes since v1: incorporated irc comments from Mauro

- tvp7002.c: rather than initializing val, just don't fill 'reg' on error.
- drxk_hard.c: the underlying cause is a wrong while condition, fix that.

	Hans

Hans Verkuil (3):
  s5k5baf: drop 'data' field in struct s5k5baf_fw
  tvp7002: fix uninitialized variable warning
  dvb-frontends/drxk_hard.c: fix uninitialized variable warning

 drivers/media/dvb-frontends/drxk_hard.c | 3 +--
 drivers/media/i2c/s5k5baf.c             | 5 ++---
 drivers/media/i2c/tvp7002.c             | 4 +++-
 3 files changed, 6 insertions(+), 6 deletions(-)

-- 
2.28.0

