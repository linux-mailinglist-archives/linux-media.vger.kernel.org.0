Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9DF3F13C199
	for <lists+linux-media@lfdr.de>; Wed, 15 Jan 2020 13:48:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728899AbgAOMs0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 Jan 2020 07:48:26 -0500
Received: from lb3-smtp-cloud9.xs4all.net ([194.109.24.30]:49987 "EHLO
        lb3-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726132AbgAOMsZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 Jan 2020 07:48:25 -0500
Received: from cobaltpc1.rd.cisco.com
 ([IPv6:2001:420:44c1:2577:18d8:d5d6:4408:6200])
        by smtp-cloud9.xs4all.net with ESMTPA
        id ri5riEH6BT6sRri5viaE9X; Wed, 15 Jan 2020 13:48:23 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1579092503; bh=skQOh0UDnlq++woZzbxHhrfhetqgLU+bb5Fvkq/eJGw=;
        h=From:To:Subject:Date:Message-Id:MIME-Version:From:Subject;
        b=Hh/U0B0Srx++cMxq8ldK8BnC1Ntz5QElXufAAZJqCDcCKOrM6f6ikvYk8ZGBLZ3dJ
         N1gUmhzQ5iUXegwX6UfYSpVI1inLsfJFthr7UJiyLwo5/uK636obrecoSp0YqVGbbj
         Up99vlKpsvkNyrWLnAK7B5d/hgCmAWl66GF2TrFZQJeTi5PeuHYwfQzK8/zcbZtqO4
         8oUfZnNn2sqx3fa4IzDOChodwDvGnTQxOH1Rb4T1SF8iyR061iDoaPeVzScSArhDp8
         IXCVteOtlISmzlRIZXva1oyQJchSXA9AA1MfAGiB5v8bWSAs3QqcpmZSEFb9silTa1
         miHiMnDXNNhLw==
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     linux-input@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Timo Kaufmann <timokau@zoho.com>
Subject: [PATCH for v5.5 0/2] input/rmi4 regression fix
Date:   Wed, 15 Jan 2020 13:48:17 +0100
Message-Id: <20200115124819.3191024-1-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfHtLOMtd5cSJjLwITyux5LphDSHVMMSNoYyoe3o66her6nFGvAJ6AAeFmnV0N0XHsab3z1MnsAFMJ4Cru6j/poz9A2JrQ3+w6ypwGPu+3hFHjuTT9+eH
 q/WQ0zobB5qyLP505FK2w2ZLiZnw9YlyLUYX1mKUyPtvVDPYb7fTF+xAw8YZH6mPDQly6Qns62Huuow4x09AjDceD1T29iHvSXVmO1gu7Cv1WIggsC3QXedm
 k+zpGUAZ48R7mnxvaMSdUEucVnnEVq4RA9pX2A3DgWxMy0bbfDAyTPYY3XBXdMiijP96zymRtu22JU/KgLkNebi6+mSsdET67MEAfC7GbnlFed8xDL1+XEG0
 1IFz2noIzWF5jt8dPZRzKOQ0coWWeA==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dmitry,

Timo Kaufmann reported that the "don't increment rmiaddr" patch broke
his Thinkpad T450 (the cursor started drifting after a while).

Some more digging revealed that that patch was bad, and that the
real solution for the original problem (function F54 reported bad
data) had to be done in rmi_f54.c.

So the first patch reverts the old fix (and so will break F54 again),
and this should be merged for v5.5 asap. The second patch that fixes
F54 can be postponed to v5.6: F54 is rarely used and I don't think it
is important enough for v5.5.

I have only tested the F54 fix for smbus, I don't know if it is OK
for i2c/spi since I have no hardware to test that. It seems sane :-)

Regards,

	Hans

Hans Verkuil (2):
  Revert "Input: synaptics-rmi4 - don't increment rmiaddr for SMBus
    transfers"
  Input: rmi_f54: read from FIFO in 32 byte blocks

 drivers/input/rmi4/rmi_f54.c   | 43 +++++++++++++++++++++-------------
 drivers/input/rmi4/rmi_smbus.c |  2 ++
 2 files changed, 29 insertions(+), 16 deletions(-)

-- 
2.24.0

