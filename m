Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1B27C38C813
	for <lists+linux-media@lfdr.de>; Fri, 21 May 2021 15:29:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235582AbhEUNax (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 21 May 2021 09:30:53 -0400
Received: from mail.kernel.org ([198.145.29.99]:47040 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235435AbhEUNat (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 21 May 2021 09:30:49 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4247161261;
        Fri, 21 May 2021 13:29:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1621603766;
        bh=Xq1IHDaEQhd6sGQ6a4trEwMvUACX7tTodHm4aI8dm1s=;
        h=From:To:Cc:Subject:Date:From;
        b=NIVZCEqi3ku77x14vQwDo3U+7LVxthPBab8byUlrKwT0l0iQGMwvkXMkTj4oMaxdp
         OQcTDxzBah2Fc8GaxWBHEEnrEJPgKr2zweFbYh+J5pHBYOK+puy436u1vsfZspWbMG
         pR5hGDDdhxM7o2CpV4RjedhyIAEYuqZTAZ8kW3IdiWWMpu0NayEJZjKMjIL4ojluez
         wi/BJw7okbwh02oz6mnlJ5BD5qeE0BpMTqnf2wwD8U76QR29aw8XSZRuYRJE+9Y4Rm
         0enmeeMcjx1tZerLK4RR77j3yflAYmc3QaR9+OpPQNzfqlCBvl0cGfy8TVIj/bXGGH
         3QUO+uJDeoaag==
Received: from johan by xi.lan with local (Exim 4.94.2)
        (envelope-from <johan@kernel.org>)
        id 1lk5DT-0004To-6v; Fri, 21 May 2021 15:29:27 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Johan Hovold <johan@kernel.org>
Subject: [PATCH 0/2] media: fix USB control-request directions
Date:   Fri, 21 May 2021 15:28:37 +0200
Message-Id: <20210521132839.17163-1-johan@kernel.org>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The direction of the pipe argument must match the request-type
direction bit or USB control requests may fail depending on the
host-controller-driver implementation.

This series fixes two media driver that got this wrong.

Johan


Johan Hovold (2):
  media: dtv5100: fix control-request directions
  media: gspca/sq905: fix control-request direction

 drivers/media/usb/dvb-usb/dtv5100.c | 7 +++++--
 drivers/media/usb/gspca/sq905.c     | 2 +-
 2 files changed, 6 insertions(+), 3 deletions(-)

-- 
2.26.3

