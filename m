Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EF0BB35E32A
	for <lists+linux-media@lfdr.de>; Tue, 13 Apr 2021 17:51:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346048AbhDMPvb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 13 Apr 2021 11:51:31 -0400
Received: from lb1-smtp-cloud7.xs4all.net ([194.109.24.24]:49989 "EHLO
        lb1-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1345974AbhDMPva (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 13 Apr 2021 11:51:30 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id WLJilG0m7MxedWLJlljJne; Tue, 13 Apr 2021 17:51:10 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1618329070; bh=Ie3wp1+1dCQBBy3KLb+FMcWsM4fsMUhqu6NQ6RXAILE=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=baaLvTpfqzDJrPOlC9zBdA/q50HRlyDAyrFNZTl2Y3r1WFVX9pSTCKmiSW3/zK7Oj
         s7Vt85PRnvxMnhdVOwTl86PSXQivE6fYem+vYa3WIMWIskyNds4Rbms093VrHKlXcg
         nTFYIHWbUDmFqAqeU8L/BGw2iMPnhmkNwRWDTg2iQ5v+0uOhX7fRYOP05L27BeydSf
         Pnn/GKkSA/Hk5XQlsong8Uwsg62Ge9hJm4VgHfyNn+c5UbBXR5uWxNjcC+NlJKXiQg
         WIuKKnVMTChCe/c4CrX2xslfN6ttNLzzcqS6+Ij6PY4/rxI0Q8yin6aH4dVv6hnPJY
         VB+zDeQMPkadw==
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v5.13] Three fixes
Message-ID: <1299bfaf-4d99-263c-53f0-bb00f8c63199@xs4all.nl>
Date:   Tue, 13 Apr 2021 17:51:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.9.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfEXvTu0rggkykuWhpfhJWH5xIAgPiAtH1skIeEfTb0NmnPg9BFD8kXnEYPcPxCwefkkU43WDGkO7X8rxB2vsV+xbKpWhqYh//zUa4HK6iemaqzReh/zs
 3rHdjw9fP3bVlx9whJcxTV2PondeP2iF6MUFOAwBXofN0gsrTLUGdilDVP5o1ScKMSU2jFWrPlqDhE0o6rKtJns2SQCkcGpwdTY=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Three fixes for 5.13. They would actually qualify for 5.12, but
since it is so late in the rc cycle it is easier to wait for the
5.13 merge window.

The v4l2-ctrls.c patch is also larger than I'd like, but it fixes
a more fundamental code design flaw that required a bit of an overhaul.
The end result is a lot more robust, though.

Regards,

	Hans

The following changes since commit 4f4e6644cd876c844cdb3bea2dd7051787d5ae25:

  media: gscpa/stv06xx: fix memory leak (2021-04-09 13:19:38 +0200)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v5.13c

for you to fetch changes up to 13a31e27d4b7fcb8ec0118fc94518b6c2705db60:

  media: cedrus: Fix H265 status definitions (2021-04-13 16:22:37 +0200)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Hans Verkuil (1):
      v4l2-ctrls: fix reference to freed memory

Jernej Skrabec (1):
      media: cedrus: Fix H265 status definitions

Neil Armstrong (1):
      media: meson-ge2d: fix rotation parameters

 drivers/media/platform/meson/ge2d/ge2d.c         |   4 +-
 drivers/media/v4l2-core/v4l2-ctrls.c             | 137 +++++++++++++++++++++++----------------------------
 drivers/staging/media/sunxi/cedrus/cedrus_regs.h |  17 ++++---
 include/media/v4l2-ctrls.h                       |  12 +++--
 4 files changed, 81 insertions(+), 89 deletions(-)
