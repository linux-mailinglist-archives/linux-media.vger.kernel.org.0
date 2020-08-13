Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6C012244053
	for <lists+linux-media@lfdr.de>; Thu, 13 Aug 2020 23:06:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726631AbgHMVGT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 13 Aug 2020 17:06:19 -0400
Received: from bin-mail-out-05.binero.net ([195.74.38.228]:24920 "EHLO
        bin-mail-out-05.binero.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726605AbgHMVGS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 13 Aug 2020 17:06:18 -0400
X-Halon-ID: cc5006eb-dda8-11ea-a39b-005056917f90
Authorized-sender: niklas.soderlund@fsdn.se
Received: from bismarck.berto.se (p54ac52a8.dip0.t-ipconnect.de [84.172.82.168])
        by bin-vsp-out-02.atm.binero.net (Halon) with ESMTPA
        id cc5006eb-dda8-11ea-a39b-005056917f90;
        Thu, 13 Aug 2020 23:06:12 +0200 (CEST)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 0/2] rcar-vin: Fix issues with partial probed media graphs
Date:   Thu, 13 Aug 2020 23:06:00 +0200
Message-Id: <20200813210602.3983805-1-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

The R-Car VIN driver have since it gain Gen3 support tried to be 
functional with a partial probed media graph. This was done to allow for 
situations where parts of the graph failed to probe, the hardware 
contains two separate CSI-2 receivers one of them could fail while still 
allow capturing from the other.

This design have been proven to be impractical as there are some issues 
in the V4L2 framework that needs to be worked on before a driver could 
be made to support this. And interacting with the media device or the 
video devices exposed by the driver when it's in a partially probed 
state have been proven to cause user-space issues as the driver gained 
new features.

Instead of playing wack-a-mole trying to make the driver work in a 
partially probed mode within a uncooperative framework. This series 
disallows any user-space interactions until the media graph is fully 
probed by withholding all video and media devices from user-space while 
the graph is not complete.

This series makes no attempt to improve on the object life-time 
management issues pointed out about V4L2 in general when a video device 
is unbound. Those problems should be worked on a framework level and can 
not be fixed in drivers alone.

This series is based on the media-tree and tested on R-Car M3-N.

Niklas Söderlund (2):
  rcar-vin: Unconditionally unregister notifier on remove
  rcar-vin: Register media device when all sub-devices bound

 drivers/media/platform/rcar-vin/rcar-core.c | 22 +++++++++------------
 1 file changed, 9 insertions(+), 13 deletions(-)

-- 
2.28.0

