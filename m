Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E982B11B882
	for <lists+linux-media@lfdr.de>; Wed, 11 Dec 2019 17:22:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730449AbfLKQWe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 11 Dec 2019 11:22:34 -0500
Received: from lb1-smtp-cloud7.xs4all.net ([194.109.24.24]:54875 "EHLO
        lb1-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728912AbfLKQWe (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 11 Dec 2019 11:22:34 -0500
Received: from marune.fritz.box ([IPv6:2001:983:e9a7:1:d0c4:2b08:27a4:6946])
        by smtp-cloud7.xs4all.net with ESMTPA
        id f4kxiY8tRapzpf4kziSRbM; Wed, 11 Dec 2019 17:22:33 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1576081353; bh=/QI3szXiTodpyYpNLtOwEe7wUmJMB+C09GP6S++vOgc=;
        h=From:To:Subject:Date:Message-Id:MIME-Version:From:Subject;
        b=hL5sVkFAjJw63eSWqG3fUSgaXR8Q7GvU4tLz/TWduTDZTUSvT+irpciX9bBtRanQV
         fN/F00rR8H8MQyM5hdQHWtit/7EkyikSMvH4MwOzobffk7xnF54i4AgaaUUf3Pgw5f
         9nERZUOKKR+g8HdtVT3Re63ac4eeONYPfyumPkfdZbzgT5MI6SlcxpMtc0Iece0qCc
         QCIRDukvTOnGOzfYUffjHER9CJy843NH6Ldp2zcw7qijxlVSknDUiGgcUkUMl+f8eS
         71HSmTNFGlQFJxoytyRGpvsG0zvw4wQKrMsi+0fLFkHQF/A2El2lhIxRq3W1p4QE46
         ri+S1JC9Za8Pw==
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Subject: [PATCH 00/10] pulse8-cec: improvements and many fixes
Date:   Wed, 11 Dec 2019 17:22:21 +0100
Message-Id: <20191211162231.99978-1-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfLIuqXjK/nGb1Cb9ikFROFqZEzmt2J7yWvtecDDS5F8o0dP/p5K1rS7xn74w8YDg+F2LT4hgg+nqsiYVn6jFki0p7KwOiFZnBesw3h0xLBDnPalo5IY5
 VE+BRsUOL/dTfjcMEXZaO0UO85SHdk3joVWdbVzGvBitF0wQ/jRdl3yVeoOAHWlm/vId6aznsElobC1r/XpgePWueqm+waHgGm5CIUQYqRfSMB8vudgTsglz
 W10d7CHX7ZOY+vG2b574wA==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This series assumes this v5.5 patch has been applied first:

https://patchwork.linuxtv.org/patch/60641/

This series improves the code and fixes many issues that would
only appear during stress testing.

Part of it was trial-and-error based on observing how the USB device
acted in corner cases. But after this series was applied this driver
now passes the 'cec-compliance --test-adapter' tests.

The stress testing was done by connecting two Pulse-Eight devices
together and running this in one shell:

	cec-ctl --playback
	cec-ctl -d1 --tv -p0

	while true; do date; cec-ctl -s -p f.f.f.f; sleep 2; cec-ctl -s -p 1.0.0.0; sleep 2; done

This in another:

	while true ; do cec-ctl -s -t0 --image-view-on -v; done

And this in a third:

	while true; do date; cec-ctl -s -d1 --tv; sleep .3; done

This tests continuously unconfiguring and reconfiguring the logical
addresses for both Pulse-Eights, and continuously sending the Image View On
message.

Regards,

	Hans

Hans Verkuil (10):
  pulse8-cec: improve debugging
  pulse8-cec: reorganize function order
  pulse8-cec: locking improvements
  pulse8-cec: add 2nd debug level
  pulse8-cec: set tx_done_status for transmit_done status
  pulse8-cec: move the transmit to a workqueue
  pulse8-cec: queue received messages in an array
  pulse8-cec: use adap_free callback
  pulse8-cec: schedule next ping after current ping finished
  pulse8-cec: log when a CEC message is received

 drivers/media/usb/pulse8-cec/pulse8-cec.c | 769 +++++++++++++---------
 1 file changed, 457 insertions(+), 312 deletions(-)

-- 
2.23.0

