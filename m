Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9334A44A8B
	for <lists+linux-media@lfdr.de>; Thu, 13 Jun 2019 20:24:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727262AbfFMSYP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 13 Jun 2019 14:24:15 -0400
Received: from bisque.elm.relay.mailchannels.net ([23.83.212.18]:5965 "EHLO
        bisque.elm.relay.mailchannels.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727058AbfFMSYO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 13 Jun 2019 14:24:14 -0400
X-Greylist: delayed 560 seconds by postgrey-1.27 at vger.kernel.org; Thu, 13 Jun 2019 14:24:14 EDT
X-Sender-Id: dreamhost|x-authsender|brad@nextdimension.ws
Received: from relay.mailchannels.net (localhost [127.0.0.1])
        by relay.mailchannels.net (Postfix) with ESMTP id 562876A1B73;
        Thu, 13 Jun 2019 18:14:53 +0000 (UTC)
Received: from pdx1-sub0-mail-a91.g.dreamhost.com (100-96-88-48.trex.outbound.svc.cluster.local [100.96.88.48])
        (Authenticated sender: dreamhost)
        by relay.mailchannels.net (Postfix) with ESMTPA id B7D656A1B01;
        Thu, 13 Jun 2019 18:14:52 +0000 (UTC)
X-Sender-Id: dreamhost|x-authsender|brad@nextdimension.ws
Received: from pdx1-sub0-mail-a91.g.dreamhost.com ([TEMPUNAVAIL].
 [64.90.62.162])
        (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384)
        by 0.0.0.0:2500 (trex/5.17.2);
        Thu, 13 Jun 2019 18:14:53 +0000
X-MC-Relay: Neutral
X-MailChannels-SenderId: dreamhost|x-authsender|brad@nextdimension.ws
X-MailChannels-Auth-Id: dreamhost
X-Turn-Spicy: 5814b00864317f3b_1560449693129_1735585209
X-MC-Loop-Signature: 1560449693129:3277938691
X-MC-Ingress-Time: 1560449693128
Received: from pdx1-sub0-mail-a91.g.dreamhost.com (localhost [127.0.0.1])
        by pdx1-sub0-mail-a91.g.dreamhost.com (Postfix) with ESMTP id BF4C67F9E5;
        Thu, 13 Jun 2019 11:14:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=nextdimension.cc; h=from
        :to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=nextdimension.cc; bh=fLOEyPLSY0G70
        ZqfnRjl5Pn7aS4=; b=EdOXKvVqS1WywFD1J1tk6KVUxcje9kg0r+eL0dvrU3t2v
        uBjIc/AnVcuK0bMDGPvZpMQlLFU8XwrYehJLf7MyZ/WAVThK52tnBdqKG9I/6GdI
        Mz5v83tYCJ8Ad+naZizzwtIvVSLzLDt0qnvxUbVurYV+hJxvPqYp2lwb/2xbMI=
Received: from localhost.localdomain (67-198-57-188.static.grandenetworks.net [67.198.57.188])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: brad@nextdimension.ws)
        by pdx1-sub0-mail-a91.g.dreamhost.com (Postfix) with ESMTPSA id 9BEDA7F9DA;
        Thu, 13 Jun 2019 11:14:50 -0700 (PDT)
X-DH-BACKEND: pdx1-sub0-mail-a91
From:   Brad Love <brad@nextdimension.cc>
To:     linux-media@vger.kernel.org, mchehab@kernel.org
Cc:     Brad Love <brad@nextdimension.cc>
Subject: [GIT PULL FOR v5.3] Add Hauppauge DVB devices
Date:   Thu, 13 Jun 2019 13:14:47 -0500
Message-Id: <20190613181447.16036-1-brad@nextdimension.cc>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-VR-OUT-STATUS: OK
X-VR-OUT-SCORE: 30
X-VR-OUT-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduuddrudehledguddvudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucggtfgfnhhsuhgsshgtrhhisggvpdfftffgtefojffquffvnecuuegrihhlohhuthemuceftddtnecufghrlhcuvffnffculdeftddmnecujfgurhephffvufffkffoggfgsedtkeertdertddtnecuhfhrohhmpeeurhgrugcunfhovhgvuceosghrrggusehnvgigthguihhmvghnshhiohhnrdgttgeqnecuffhomhgrihhnpehlihhnuhigthhvrdhorhhgnecukfhppeeijedrudelkedrheejrddukeeknecurfgrrhgrmhepmhhouggvpehsmhhtphdphhgvlhhopehlohgtrghlhhhoshhtrdhlohgtrghlughomhgrihhnpdhinhgvthepieejrdduleekrdehjedrudekkedprhgvthhurhhnqdhprghthhepuehrrgguucfnohhvvgcuoegsrhgrugesnhgvgihtughimhgvnhhsihhonhdrtggtqedpmhgrihhlfhhrohhmpegsrhgrugesnhgvgihtughimhgvnhhsihhonhdrtggtpdhnrhgtphhtthhopegsrhgrugesnhgvgihtughimhgvnhhsihhonhdrtggtnecuvehluhhsthgvrhfuihiivgepud
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

Here is my first pull request. Please be gentle :)

This adds support for Hauppauge HVR1955 and HVR1975 devices, along with
adding a vid:pid for a missing OEM Hauppauge 955Q variant.

Cheers,

Brad
---
The following changes since commit 513dbd35b5d93c45fa7291147f21fc0227a9f9=
99:

  media: add SPDX headers to some files (2019-06-12 11:42:27 -0400)

are available in the Git repository at:

  git://linuxtv.org/brad/media_tree.git pr-5.3

for you to fetch changes up to 24a620ad0b74d485a1e61d5babe043f59a0ddd57:

  cx231xx-cards: Add Hauppauge 955Q variant (2019-06-13 12:27:57 -0500)

----------------------------------------------------------------
Brad Love (5):
      si2157: add detection of si2177 tuner
      pvrusb2: Add multiple dvb frontend support
      pvrusb2: Add i2c client demod/tuner support
      pvrusb2: Add Hauppauge HVR1955/1975 devices
      cx231xx-cards: Add Hauppauge 955Q variant

 drivers/media/tuners/si2157.c                   |   6 +
 drivers/media/tuners/si2157_priv.h              |   3 +-
 drivers/media/usb/cx231xx/cx231xx-cards.c       |   2 +
 drivers/media/usb/pvrusb2/Kconfig               |   2 +
 drivers/media/usb/pvrusb2/pvrusb2-cx2584x-v4l.c |  25 +++
 drivers/media/usb/pvrusb2/pvrusb2-devattr.c     | 212 ++++++++++++++++++=
+++---
 drivers/media/usb/pvrusb2/pvrusb2-devattr.h     |   1 +
 drivers/media/usb/pvrusb2/pvrusb2-dvb.c         |  88 +++++++---
 drivers/media/usb/pvrusb2/pvrusb2-dvb.h         |   5 +-
 drivers/media/usb/pvrusb2/pvrusb2-fx2-cmd.h     |   4 +
 drivers/media/usb/pvrusb2/pvrusb2-hdw.c         |  36 +++-
 11 files changed, 339 insertions(+), 45 deletions(-)
