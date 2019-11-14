Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 435D1FCF0F
	for <lists+linux-media@lfdr.de>; Thu, 14 Nov 2019 21:04:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726767AbfKNUEU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 Nov 2019 15:04:20 -0500
Received: from bonobo.elm.relay.mailchannels.net ([23.83.212.22]:61256 "EHLO
        bonobo.elm.relay.mailchannels.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726755AbfKNUEU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 Nov 2019 15:04:20 -0500
X-Sender-Id: dreamhost|x-authsender|brad@nextdimension.ws
Received: from relay.mailchannels.net (localhost [127.0.0.1])
        by relay.mailchannels.net (Postfix) with ESMTP id BA5F03C114A;
        Thu, 14 Nov 2019 20:04:18 +0000 (UTC)
Received: from pdx1-sub0-mail-a96.g.dreamhost.com (100-96-196-8.trex.outbound.svc.cluster.local [100.96.196.8])
        (Authenticated sender: dreamhost)
        by relay.mailchannels.net (Postfix) with ESMTPA id 23C7E3C119A;
        Thu, 14 Nov 2019 20:04:18 +0000 (UTC)
X-Sender-Id: dreamhost|x-authsender|brad@nextdimension.ws
Received: from pdx1-sub0-mail-a96.g.dreamhost.com ([TEMPUNAVAIL].
 [64.90.62.162])
        (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384)
        by 0.0.0.0:2500 (trex/5.18.5);
        Thu, 14 Nov 2019 20:04:18 +0000
X-MC-Relay: Neutral
X-MailChannels-SenderId: dreamhost|x-authsender|brad@nextdimension.ws
X-MailChannels-Auth-Id: dreamhost
X-Daffy-Industry: 792117a22e000762_1573761858467_230749370
X-MC-Loop-Signature: 1573761858466:950087393
X-MC-Ingress-Time: 1573761858466
Received: from pdx1-sub0-mail-a96.g.dreamhost.com (localhost [127.0.0.1])
        by pdx1-sub0-mail-a96.g.dreamhost.com (Postfix) with ESMTP id F30638260A;
        Thu, 14 Nov 2019 12:04:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=nextdimension.cc; h=from
        :to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=nextdimension.cc; bh=aR+LPm7knrBHE
        Cak81exYvlwguA=; b=TODSUamHpBPw5tI9nyb/Vi1d8wvValLrzWBTU8O6DfV1u
        C4BPtmZSZ0JWOFTTMZJEWqwQEnfRpg/x5b0qv5AaghTBsHDgRurT9YyCNf4RMiqF
        iqpZp95OSsb7+IqPvEu63+wYdrKNC69OS2XPOmsi2hXKmWYlFj5TCsnRpSFbw0=
Received: from localhost.localdomain (67-198-57-188.static.grandenetworks.net [67.198.57.188])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: brad@nextdimension.ws)
        by pdx1-sub0-mail-a96.g.dreamhost.com (Postfix) with ESMTPSA id 915B58259B;
        Thu, 14 Nov 2019 12:04:15 -0800 (PST)
X-DH-BACKEND: pdx1-sub0-mail-a96
From:   Brad Love <brad@nextdimension.cc>
To:     linux-media@vger.kernel.org
Cc:     Brad Love <brad@nextdimension.cc>
Subject: [PATCH v3 00/14] si2157: Analog tuning and optimizations
Date:   Thu, 14 Nov 2019 14:03:54 -0600
Message-Id: <20191114200408.28883-1-brad@nextdimension.cc>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This series mainly enables analog tuning in the si2157
driver. Some various optimizations are included as well,
along with the dots connected to allow devices with
TUNER_ABSENT to utilize an analog frontend on two different
bridges. Finally two missing statistics are added to get
signal strength and CNR on a tuner and demod respectively.

Summary:
- Enable tuner status flags
- Check tuner status flags
- String cleanup and register labeling
- The analog tuning functions in si2157
- A function to wait for set_*params to complete
- Enable analog fe on TUNER_ABSENT devices in cx231xx and cx23885
- Include some signal strength DVBv5 stats

Now the two patches that 'Add i2c device analog tuner support'
I would like comment on. It looks quite ugly to have big case
statements identifying the TUNER_ABSENT models that have analog.
There is nothing unique done in the blocks, mostly. Right now
there is only a few models, but the addition of more would become
a bit excessive.

Instead of the case statement should a board profile field be
added to the two affected drivers? Something like .has_i2c_analog_fe ?

=3D=3D=3D

I split up the tune completion and tune lock (5 & 6) patches. Patch 5
should be acceptable, patch 6 has been found to be very insightful in
debugging situations.

Changes since v2:
- Rebase
- Enable HVR5525 analog tuner
- Remove bff option from NTSC analog capable boards
- Split tune completion and tuner lock patches
- Fix si2141 init with error status flags enabled
- Device caps and capabilities fixes

Changes since v1:
- One unnecessary patch removed
- __func__ removed from dev_XXX macros
- normalization logic simplified and explained in rf strength calculation

Brad Love (14):
  si2157: Enable tuner status flags
  si2157: Check error status bit on cmd execute
  si2157: Better check for running tuner in init
  si2157: Add analog tuning related functions
  si2157: Briefly wait for tuning operation to complete
  si2157: module debug option to wait on signal lock
  cx23885: Add analog frontend to Hauppauge QuadHD
  cx23885: Add analog frontend to 1265_K4
  cx23885: Add analog frontend to HVR5525
  cx23885: Add i2c device analog tuner support
  cx231xx: Add i2c device analog tuner support
  si2157: add on-demand rf strength func
  lgdt3306a: Add CNR v5 stat
  cx25840: Register labeling, chip specific correction

 drivers/media/dvb-frontends/lgdt3306a.c    |  14 +
 drivers/media/i2c/cx25840/cx25840-core.c   |  40 +-
 drivers/media/pci/cx23885/cx23885-cards.c  |  51 ++-
 drivers/media/pci/cx23885/cx23885-dvb.c    |  31 ++
 drivers/media/pci/cx23885/cx23885-video.c  |  98 ++++-
 drivers/media/tuners/si2157.c              | 415 ++++++++++++++++++++-
 drivers/media/tuners/si2157_priv.h         |   2 +
 drivers/media/usb/cx231xx/cx231xx-avcore.c |  35 +-
 drivers/media/usb/cx231xx/cx231xx-video.c  |  85 ++++-
 9 files changed, 697 insertions(+), 74 deletions(-)

--=20
2.23.0

