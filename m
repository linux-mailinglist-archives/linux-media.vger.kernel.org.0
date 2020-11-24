Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0B6BF2C23D4
	for <lists+linux-media@lfdr.de>; Tue, 24 Nov 2020 12:08:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732176AbgKXLGe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 24 Nov 2020 06:06:34 -0500
Received: from mail.kernel.org ([198.145.29.99]:33606 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731805AbgKXLGb (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 24 Nov 2020 06:06:31 -0500
Received: from mail.kernel.org (ip5f5ad5c3.dynamic.kabel-deutschland.de [95.90.213.195])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C99CE20708;
        Tue, 24 Nov 2020 11:06:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1606215991;
        bh=KEkjnEi7VD0ghLguNP1p2mejNA2s8H7kLwUMpICIeLk=;
        h=From:To:Cc:Subject:Date:From;
        b=0Q3TDXu5QHp0drAD0nKnQhbt9TiQKnDTcF2IaXKq2YLCxLxhNPqwNXDlkQtQBCeS0
         eK/ZlxwLG712unNBd1vzxs4K5nH9NNtG3WR/MwBjfwEsRd6czkJdaobYanlSvEjAkq
         Dp1k3eXjKad8mQrSDwyu+bWu+T4gOx0/Oub3HGMk=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1khW9U-000FZL-Gh; Tue, 24 Nov 2020 12:06:28 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH 00/31] vidtv: address several issues at the driver
Date:   Tue, 24 Nov 2020 12:05:56 +0100
Message-Id: <cover.1606215584.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This series is on the top of the series sent by Daniel:
	https://lore.kernel.org/linux-media/20201031150552.663598-1-dwlsalmeida@gmail.com/

It address several issues at the driver:
- Fix error logic, specially handling troubles with memory alloc functions;
- Fix issues at PMT, SDT and EIT tables, making EIT work fine (tested with Kaffeine);
- Fix issues at the tone generator;
- Pass MPEG-TS var structs as pointers;
- Avoid re-initializing struct fields;
- Improves driver documentation;
- Do several other cleanups and fixes.

As there are lots of fixes here, and the driver will only appear on Kernel 5.10,
my plan is to merge those, together with Daniel's patches for Kernel 5.10.

Regards,
Mauro

Mauro Carvalho Chehab (31):
  media: vidtv: reorganize includes
  media: vidtv: add error checks
  media: vidtv: don't use recursive functions
  media: vidtv: fix the name of the program
  media: vidtv: fix the tone generator logic
  media: vidtv: fix some notes at the tone generator
  media: vidtv: avoid data copy when initializing the multiplexer
  media: vidtv: avoid copying data for PES structs
  media: vidtv: do some cleanups at the driver
  media: vidtv: remove some unused functions
  media: vidtv: pre-initialize mux arrays
  media: vidtv: cleanup null packet initialization logic
  media: vidtv: improve EIT data
  media: vidtv: fix the network ID range
  media: vidtv: properly fill EIT service_id
  media: vidtv: add a PID entry for the NIT table
  media: vidtv: fix service type
  media: vidtv: fix service_id at SDT table
  media: vidtv: add date to the current event
  media: vidtv: simplify PSI write function
  media: vidtv: simplify the crc writing logic
  media: vidtv: cleanup PSI descriptor write function
  media: vidtv: cleanup PSI table header function
  media: vidtv: cleanup PAT write function
  media: vidtv: cleanup PMT write table function
  media: vidtv: simplify SDT write function
  media: vidtv: simplify NIT write function
  media: vidtv: simplify EIT write function
  media: vidtv.rst: update vidtv documentation
  media: vidtv.rst: add kernel-doc markups
  media: vidtv: cleanup a few coding style issues

 .../driver-api/media/drivers/vidtv.rst        |  112 +-
 .../media/test-drivers/vidtv/vidtv_bridge.c   |  118 +-
 .../media/test-drivers/vidtv/vidtv_bridge.h   |    4 +-
 .../media/test-drivers/vidtv/vidtv_channel.c  |  220 ++-
 .../media/test-drivers/vidtv/vidtv_channel.h  |    8 +-
 .../media/test-drivers/vidtv/vidtv_common.h   |    1 -
 .../media/test-drivers/vidtv/vidtv_demod.c    |    2 +-
 .../media/test-drivers/vidtv/vidtv_demod.h    |   11 +-
 .../media/test-drivers/vidtv/vidtv_encoder.h  |    6 +-
 drivers/media/test-drivers/vidtv/vidtv_mux.c  |  249 ++--
 drivers/media/test-drivers/vidtv/vidtv_mux.h  |   10 +-
 drivers/media/test-drivers/vidtv/vidtv_pes.c  |  179 ++-
 drivers/media/test-drivers/vidtv/vidtv_pes.h  |    8 +-
 drivers/media/test-drivers/vidtv/vidtv_psi.c  | 1185 +++++++++--------
 drivers/media/test-drivers/vidtv/vidtv_psi.h  |   62 +-
 .../media/test-drivers/vidtv/vidtv_s302m.c    |  114 +-
 .../media/test-drivers/vidtv/vidtv_s302m.h    |    8 +-
 drivers/media/test-drivers/vidtv/vidtv_ts.c   |    5 +-
 drivers/media/test-drivers/vidtv/vidtv_ts.h   |    5 +-
 .../media/test-drivers/vidtv/vidtv_tuner.c    |    5 +-
 .../media/test-drivers/vidtv/vidtv_tuner.h    |    1 +
 21 files changed, 1325 insertions(+), 988 deletions(-)

-- 
2.28.0


