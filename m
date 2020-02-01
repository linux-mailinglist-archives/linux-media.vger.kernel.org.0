Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5AF8A14FABF
	for <lists+linux-media@lfdr.de>; Sat,  1 Feb 2020 22:48:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726530AbgBAVsh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 1 Feb 2020 16:48:37 -0500
Received: from bonobo.elm.relay.mailchannels.net ([23.83.212.22]:57359 "EHLO
        bonobo.elm.relay.mailchannels.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726514AbgBAVsh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 1 Feb 2020 16:48:37 -0500
X-Sender-Id: dreamhost|x-authsender|brad@nextdimension.ws
Received: from relay.mailchannels.net (localhost [127.0.0.1])
        by relay.mailchannels.net (Postfix) with ESMTP id 5112C1415C5;
        Sat,  1 Feb 2020 21:48:36 +0000 (UTC)
Received: from pdx1-sub0-mail-a33.g.dreamhost.com (100-96-9-4.trex.outbound.svc.cluster.local [100.96.9.4])
        (Authenticated sender: dreamhost)
        by relay.mailchannels.net (Postfix) with ESMTPA id D95941421E1;
        Sat,  1 Feb 2020 21:48:35 +0000 (UTC)
X-Sender-Id: dreamhost|x-authsender|brad@nextdimension.ws
Received: from pdx1-sub0-mail-a33.g.dreamhost.com ([TEMPUNAVAIL].
 [64.90.62.162])
        (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384)
        by 0.0.0.0:2500 (trex/5.18.5);
        Sat, 01 Feb 2020 21:48:36 +0000
X-MC-Relay: Neutral
X-MailChannels-SenderId: dreamhost|x-authsender|brad@nextdimension.ws
X-MailChannels-Auth-Id: dreamhost
X-Trail-Wipe: 5ba566e6507569ff_1580593716099_3785759780
X-MC-Loop-Signature: 1580593716099:1718106807
X-MC-Ingress-Time: 1580593716098
Received: from pdx1-sub0-mail-a33.g.dreamhost.com (localhost [127.0.0.1])
        by pdx1-sub0-mail-a33.g.dreamhost.com (Postfix) with ESMTP id 76B647FE2A;
        Sat,  1 Feb 2020 13:48:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=nextdimension.cc; h=from
        :to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=nextdimension.cc; bh=mEZQhKkZ60wDo
        MrZov4MwXq0xDk=; b=GBmN280S6rmp4ev7FsEnFU5EWhozADq9kc/Z/d0ffllrR
        NmllAYeyd+jFhvDKqK3aWQLyTms0JgkWNQA1o7rpOdml3eo19Sr2BCOtp09V+aQM
        rPGLENtY7DtUS2hg1aidPOSD9zBsHUtgJLi32KW2RNoGoVEPH+1EQ+uuzY+7cA=
Received: from localhost.localdomain (66-90-181-52.dyn.grandenetworks.net [66.90.181.52])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: brad@nextdimension.ws)
        by pdx1-sub0-mail-a33.g.dreamhost.com (Postfix) with ESMTPSA id DC49E7FE29;
        Sat,  1 Feb 2020 13:48:29 -0800 (PST)
X-DH-BACKEND: pdx1-sub0-mail-a33
From:   Brad Love <brad@nextdimension.cc>
To:     linux-media@vger.kernel.org
Cc:     Brad Love <brad@nextdimension.cc>
Subject: [PATCH 0/3] m88ds3103: Add support for Montage 3103b DVB-S demod
Date:   Sat,  1 Feb 2020 15:48:23 -0600
Message-Id: <20200201214826.22873-1-brad@nextdimension.cc>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
X-VR-OUT-STATUS: OK
X-VR-OUT-SCORE: 30
X-VR-OUT-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedugedrgedvgdduheefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuggftfghnshhusghstghrihgsvgdpffftgfetoffjqffuvfenuceurghilhhouhhtmecufedttdenucgfrhhlucfvnfffucdlfedtmdenucfjughrpefhvffufffkofgggfestdekredtredttdenucfhrhhomhepuehrrgguucfnohhvvgcuoegsrhgrugesnhgvgihtughimhgvnhhsihhonhdrtggtqeenucfkphepieeirdeltddrudekuddrhedvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhppdhhvghloheplhhotggrlhhhohhsthdrlhhotggrlhguohhmrghinhdpihhnvghtpeeiiedrledtrddukedurdehvddprhgvthhurhhnqdhprghthhepuehrrgguucfnohhvvgcuoegsrhgrugesnhgvgihtughimhgvnhhsihhonhdrtggtqedpmhgrihhlfhhrohhmpegsrhgrugesnhgvgihtughimhgvnhhsihhonhdrtggtpdhnrhgtphhtthhopegsrhgrugesnhgvgihtughimhgvnhhsihhonhdrtggt
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The following series implements the necessary changes to allow the
Montage m88ds3103b satellite demodulator to work.

The 3103b demod identifies as an m88rs6000, but has significant operating
differences. The 3103b demod has a dynamic clocking chip that must be set
up. There are also register settings that only apply to the 3103b.
There is also a new firmware that must be used.

The driver was developed by reverse engineering the differences between
i2c traffic using an instrumented downstream GPLv2 vendor driver and
the upstream m88ds3103 driver. The mclk functions are from the downstream
driver.

The demodulator is used by Hauppauge 461e Rev2 B8H9.
The demodulator is also used by Terratec S2 USB Box Rev 4.

Bridge support for detection of the new demodulator has been added to
handle both devices. Both models are confirmed working.




Brad Love (3):
  m88ds3103: Add support for ds3103b demod
  em28xx: Enable Hauppauge 461e rev2
  dw2102: probe for demodulator i2c address

 drivers/media/dvb-frontends/m88ds3103.c      | 466 ++++++++++++++++++-
 drivers/media/dvb-frontends/m88ds3103_priv.h |  14 +-
 drivers/media/usb/dvb-usb/dw2102.c           |  45 +-
 drivers/media/usb/em28xx/em28xx-cards.c      |  18 +
 drivers/media/usb/em28xx/em28xx-dvb.c        |  60 +++
 drivers/media/usb/em28xx/em28xx.h            |   1 +
 6 files changed, 589 insertions(+), 15 deletions(-)

--=20
2.23.0

