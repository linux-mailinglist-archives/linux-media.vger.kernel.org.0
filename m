Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 976B331487
	for <lists+linux-media@lfdr.de>; Fri, 31 May 2019 20:19:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727074AbfEaST7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 31 May 2019 14:19:59 -0400
Received: from bonobo.maple.relay.mailchannels.net ([23.83.214.22]:53804 "EHLO
        bonobo.maple.relay.mailchannels.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727013AbfEaST6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 31 May 2019 14:19:58 -0400
X-Sender-Id: dreamhost|x-authsender|brad@nextdimension.ws
Received: from relay.mailchannels.net (localhost [127.0.0.1])
        by relay.mailchannels.net (Postfix) with ESMTP id 1A4E95016C5;
        Fri, 31 May 2019 18:19:57 +0000 (UTC)
Received: from pdx1-sub0-mail-a61.g.dreamhost.com (100-96-4-95.trex.outbound.svc.cluster.local [100.96.4.95])
        (Authenticated sender: dreamhost)
        by relay.mailchannels.net (Postfix) with ESMTPA id 66D3150115F;
        Fri, 31 May 2019 18:19:55 +0000 (UTC)
X-Sender-Id: dreamhost|x-authsender|brad@nextdimension.ws
Received: from pdx1-sub0-mail-a61.g.dreamhost.com ([TEMPUNAVAIL].
 [64.90.62.162])
        (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384)
        by 0.0.0.0:2500 (trex/5.17.2);
        Fri, 31 May 2019 18:19:57 +0000
X-MC-Relay: Neutral
X-MailChannels-SenderId: dreamhost|x-authsender|brad@nextdimension.ws
X-MailChannels-Auth-Id: dreamhost
X-Abiding-White: 6ec2e34b5a7c5bd4_1559326796792_1342776319
X-MC-Loop-Signature: 1559326796792:1118432866
X-MC-Ingress-Time: 1559326796792
Received: from pdx1-sub0-mail-a61.g.dreamhost.com (localhost [127.0.0.1])
        by pdx1-sub0-mail-a61.g.dreamhost.com (Postfix) with ESMTP id 1140680192;
        Fri, 31 May 2019 11:19:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=nextdimension.cc; h=from
        :to:cc:subject:date:message-id; s=nextdimension.cc; bh=TodD5JQSJ
        iU0cOnxnkeJBx+FZj4=; b=IQtxe8rwaSt6owcm3nNHjK/UGjxq0/Rg3y57GPpjJ
        BUrxhPBjAE+XOL9kxtcN5C9845ZdTLBUFFN3qg21xFfKo2Kd7VM2goK5OOHAWtiH
        SQzJQjzw2t0rn4+GPMXL/KbraC+dVDsQsZqf+Cg57dpzH70bCuTw/qIvH9R52ErQ
        U0=
Received: from localhost.localdomain (67-198-57-188.static.grandenetworks.net [67.198.57.188])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: brad@nextdimension.ws)
        by pdx1-sub0-mail-a61.g.dreamhost.com (Postfix) with ESMTPSA id D6D5D80196;
        Fri, 31 May 2019 11:19:48 -0700 (PDT)
X-DH-BACKEND: pdx1-sub0-mail-a61
From:   Brad Love <brad@nextdimension.cc>
To:     linux-media@vger.kernel.org, mchehab@kernel.org, sean@mess.org
Cc:     Brad Love <brad@nextdimension.cc>
Subject: [PATCH v6 0/4] Add Hauppauge HVR1955/1975 devices
Date:   Fri, 31 May 2019 13:19:41 -0500
Message-Id: <1559326785-26574-1-git-send-email-brad@nextdimension.cc>
X-Mailer: git-send-email 2.7.4
X-VR-OUT-STATUS: OK
X-VR-OUT-SCORE: 30
X-VR-OUT-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduuddrudefuddguddviecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucggtfgfnhhsuhgsshgtrhhisggvpdfftffgtefojffquffvnecuuegrihhlohhuthemuceftddtnecufghrlhcuvffnffculdeftddmnecujfgurhephffvufffkffosedttdertdertddtnecuhfhrohhmpeeurhgrugcunfhovhgvuceosghrrggusehnvgigthguihhmvghnshhiohhnrdgttgeqnecukfhppeeijedrudelkedrheejrddukeeknecurfgrrhgrmhepmhhouggvpehsmhhtphdphhgvlhhopehlohgtrghlhhhoshhtrdhlohgtrghlughomhgrihhnpdhinhgvthepieejrdduleekrdehjedrudekkedprhgvthhurhhnqdhprghthhepuehrrgguucfnohhvvgcuoegsrhgrugesnhgvgihtughimhgvnhhsihhonhdrtggtqedpmhgrihhlfhhrohhmpegsrhgrugesnhgvgihtughimhgvnhhsihhonhdrtggtpdhnrhgtphhtthhopegsrhgrugesnhgvgihtughimhgvnhhsihhonhdrtggtnecuvehluhhsthgvrhfuihiivgepud
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hauppauge device HVR1955 and HVR1975 are old Cypress based
devices. When originally produced the demods were lacking
upstream drivers and the tuner was unsupported. Well fast
forward to now and the only thing missing is the identification
of si2177 tuner in the si2157 driver, as well as extension
of the pvrusb2 driver to accommodate i2c client devices
and multiple frontends. This series addresses what is necessary.

QAM/ATSC are fully tested and work, the DVB tuning
*should* work, but is completely untested. Both demod
drivers are compatible with multiple frontend usage due
to previous patches I've submitted, so things should
work in pvrusb2 as well.

Composite video input is tested. Unable to test s-video,
but it should work. Radio is fully untested. Analog TV is
a work in progress, coming soon.

HVR-1955:
- LGDT3306a ATSC/QAM demod
- si2177 tuner
- cx25840 decoder for analog tv/composite/s-video/audio

HVR-1975 dual-frontend:
- LGDT3306a ATSC/QAM demod
- si2168 DVB-C/T/T2 demod
- si2177 tuner
- cx25840 decoder for analog tv/composite/s-video/audio

Since v5:
- le16_to_cpu fix
Since v4:
- Checkpatch strict fixes
Since v3:
- Fix firmware name to be consistent
Since v2:
- Patch 4/4 build fix
Changes since v1:
- Patch 4/4 build fixes and reorganization


Brad Love (4):
  si2157: add detection of si2177 tuner
  pvrusb2: Add multiple dvb frontend support
  pvrusb2: Add i2c client demod/tuner support
  pvrusb2: Add Hauppauge HVR1955/1975 devices

 drivers/media/tuners/si2157.c                   |   6 +
 drivers/media/tuners/si2157_priv.h              |   3 +-
 drivers/media/usb/pvrusb2/pvrusb2-cx2584x-v4l.c |  25 +++
 drivers/media/usb/pvrusb2/pvrusb2-devattr.c     | 202 +++++++++++++++++++++---
 drivers/media/usb/pvrusb2/pvrusb2-devattr.h     |   1 +
 drivers/media/usb/pvrusb2/pvrusb2-dvb.c         |  88 ++++++++---
 drivers/media/usb/pvrusb2/pvrusb2-dvb.h         |   5 +-
 drivers/media/usb/pvrusb2/pvrusb2-fx2-cmd.h     |   4 +
 drivers/media/usb/pvrusb2/pvrusb2-hdw.c         |  36 ++++-
 9 files changed, 330 insertions(+), 40 deletions(-)

-- 
2.7.4

