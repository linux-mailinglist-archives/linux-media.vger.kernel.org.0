Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A411A33437A
	for <lists+linux-media@lfdr.de>; Wed, 10 Mar 2021 17:46:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233497AbhCJQqR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 10 Mar 2021 11:46:17 -0500
Received: from bin-mail-out-06.binero.net ([195.74.38.229]:36949 "EHLO
        bin-mail-out-06.binero.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232278AbhCJQps (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 10 Mar 2021 11:45:48 -0500
X-Halon-ID: 0c5059af-81c0-11eb-a542-005056917a89
Authorized-sender: niklas.soderlund@fsdn.se
Received: from bismarck.berto.se (p54ac5521.dip0.t-ipconnect.de [84.172.85.33])
        by bin-vsp-out-01.atm.binero.net (Halon) with ESMTPA
        id 0c5059af-81c0-11eb-a542-005056917a89;
        Wed, 10 Mar 2021 17:45:46 +0100 (CET)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v3 0/2] rcar-csi2: Update handling of transfer error 
Date:   Wed, 10 Mar 2021 17:45:25 +0100
Message-Id: <20210310164527.3631395-1-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

This series adapts the R-Car CSI-2 receiver recovery logic to match
updates in the datasheet. The later datasheets recommend that the whole
video pipeline shall be stopped if an transmission error is detected
instead of just restarting the CSI-2 receiver.

This is tested on M3-N and a fault is injected by quickly removing and
re-inserting the HDMI cable while streaming. This method does not always
hit and is time consuming. To consistently prove correctness of handling
a fake fault was introduced by a HACK and a debugfs entry.

Niklas Söderlund (2):
  rcar-vin: Stop stream when subdevice signal EOS
  rcar-csi2: Do not try to recover after transfer error

 drivers/media/platform/rcar-vin/rcar-csi2.c | 14 ++++++--------
 drivers/media/platform/rcar-vin/rcar-v4l2.c | 16 +++++++++++++++-
 2 files changed, 21 insertions(+), 9 deletions(-)

-- 
2.30.1

