Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AD02F2722E4
	for <lists+linux-media@lfdr.de>; Mon, 21 Sep 2020 13:44:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726748AbgIULnv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 21 Sep 2020 07:43:51 -0400
Received: from mail.kernel.org ([198.145.29.99]:60110 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726384AbgIULnv (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 21 Sep 2020 07:43:51 -0400
Received: from mail.kernel.org (ip5f5ad5b1.dynamic.kabel-deutschland.de [95.90.213.177])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 521E420EDD;
        Mon, 21 Sep 2020 11:43:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600688630;
        bh=QmQy/pcy8NDQkzIChqtlIR9cNRvb2k7XKNTUNepknX0=;
        h=From:To:Cc:Subject:Date:From;
        b=XiY5zKB0Jv54quG/qIq/lq2TKN0xvwyPlHutXGap3Vg4g6H7gpDgag/8e1rX6TDAH
         QwDKVgDEix6SmcxqlnJIUpkZgBtmX7eJfV5h/J6kvYetCNNheAxFjdXYUlbbynYmJ+
         SLkWKFdQEDyEYeiFx3k0qnKizRyHJjMnd2B2SRvw=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1kKKEV-0004V4-Uj; Mon, 21 Sep 2020 13:43:47 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH 0/9] vidtv: fix several things on it
Date:   Mon, 21 Sep 2020 13:43:37 +0200
Message-Id: <cover.1600688419.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

There are still several issues at vidtv driver. This series address
the ones I found so far.

After this series, the generated TS output can now be decoded
by Kaffeine, and probably by other DVB players.

There is still something weird there, though: after playing some
notes, there's a long silence that happens only when played with
VLC.  I suspect that the package times are not ok yet, but further
investigation is required.

Mauro Carvalho Chehab (9):
  media: vidtv: simplify PCR logic to get jiffies
  media: vidtv: remove more ENDIAN_BITFIELD nonsense
  media: vidtv: fix initialization of the network_id field at SDT
  media: vidtv: cleanup PSI version numbers
  media: vidtv: cleanup SDT string identifiers
  media: vidtv: fix a typo
  media: vidtv: simplify parameters for vidtv_pes_write_stuffing()
  media: vidtv: rewrite the adaption field logic
  media: vidtv: fix decoding with gstreamer and Vlc

 .../media/test-drivers/vidtv/vidtv_channel.c  |   7 +-
 drivers/media/test-drivers/vidtv/vidtv_mux.c  |   8 +-
 drivers/media/test-drivers/vidtv/vidtv_pes.c  | 216 +++++++++++-------
 drivers/media/test-drivers/vidtv/vidtv_pes.h  |   4 +-
 drivers/media/test-drivers/vidtv/vidtv_psi.c  |  18 +-
 drivers/media/test-drivers/vidtv/vidtv_psi.h  |   8 -
 drivers/media/test-drivers/vidtv/vidtv_ts.h   |  13 --
 7 files changed, 153 insertions(+), 121 deletions(-)

-- 
2.26.2


