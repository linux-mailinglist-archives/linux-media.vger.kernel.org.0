Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C0A6A2B1233
	for <lists+linux-media@lfdr.de>; Thu, 12 Nov 2020 23:53:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726543AbgKLWxI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 12 Nov 2020 17:53:08 -0500
Received: from bin-mail-out-06.binero.net ([195.74.38.229]:58855 "EHLO
        bin-mail-out-06.binero.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725973AbgKLWxI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 12 Nov 2020 17:53:08 -0500
X-Halon-ID: 7ad7cd74-2539-11eb-bcc0-005056917f90
Authorized-sender: niklas.soderlund@fsdn.se
Received: from bismarck.berto.se (p4fca2458.dip0.t-ipconnect.de [79.202.36.88])
        by bin-vsp-out-02.atm.binero.net (Halon) with ESMTPA
        id 7ad7cd74-2539-11eb-bcc0-005056917f90;
        Thu, 12 Nov 2020 23:50:47 +0100 (CET)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 0/4] rcar-csi2: Update handling of transfer error
Date:   Thu, 12 Nov 2020 23:51:43 +0100
Message-Id: <20201112225147.1672622-1-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.29.2
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

To do this we leverage the recent changes to support suspend/resume of 
time the whole pipeline and inform the C-Car VIN driver of the detected 
error so it can stop the whole pipeline and inform user-space of the 
detected fault.

Patch 1/4 and 2/4 fixes faults in the VIN driver that where detected 
when working on this. Patch 3/4 prepares the VIN driver to deal with the 
EOS event from R-Car CSI-2 driver And patch 4/4 changes the error logic 
of the CSI-2 receiver to match the datasheet.

This is tested on M3-N and a fault is injected by quickly removing and 
re-inserting the HDMI cable while streaming. This method does not always 
hit and is time consuming. To consistently prove correctness of handling 
a fake fault was introduced by a HACK and a debugfs entry.

Niklas Söderlund (4):
  rcar-vin: Do not try to stop stream if not running
  rcar-vin: Route events to correct video device
  rcar-vin: Stop stream when subdevice signal EOS
  rcar-csi2: Do not try to recover after transfer error

 drivers/media/platform/rcar-vin/rcar-csi2.c | 14 +++--
 drivers/media/platform/rcar-vin/rcar-dma.c  |  5 ++
 drivers/media/platform/rcar-vin/rcar-v4l2.c | 58 ++++++++++++++++++---
 3 files changed, 63 insertions(+), 14 deletions(-)

-- 
2.29.2

