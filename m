Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 560D741875B
	for <lists+linux-media@lfdr.de>; Sun, 26 Sep 2021 10:33:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229695AbhIZIfI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 26 Sep 2021 04:35:08 -0400
Received: from omta001.cacentral1.a.cloudfilter.net ([3.97.99.32]:51462 "EHLO
        omta001.cacentral1.a.cloudfilter.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229532AbhIZIfI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 26 Sep 2021 04:35:08 -0400
Received: from shw-obgw-4004a.ext.cloudfilter.net ([10.228.9.227])
        by cmsmtp with ESMTP
        id U8Srmf7ImczbLUPbImV5U1; Sun, 26 Sep 2021 08:33:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=shaw.ca; s=s20180605;
        t=1632645212; bh=7RrSD11HV86r4h1fJrBNJdblpRUav6o+FQohOVub0vA=;
        h=From:To:Cc:Subject:Date;
        b=Y3zb8cfQ7Br3Mjt1OFS7lvJMZc07jFPdTX6iNUh68RQdPAn58x4K3mnvNPGu/tPVW
         stVb9k5EV1s1IU6/ffGJ632uxZ2bPPGK525wYxpEtNoqX80qzgD5harQofmJfVTWz2
         awIi47ekBwRTPkMfXjRVJqX5wlkDREGcAkJ4q1LBs4kNw+6HYhMdlSgHkYXg+5dlU2
         2xgy6BP1tykQrpUSaEVdCtxj0xH7fJHAS3RLd30Ikflm+6GotxalY1TqDDvnSmkaU3
         FStSgAkckpbMRB1rYjHyhejNVGOZpTrT61m89ikOXPnwgCgn5gbvMBayGqH6H0Dppt
         oUem4ymd/JECQ==
Received: from shaw.ca ([70.71.78.228])
        by cmsmtp with ESMTPA
        id UPbGmpVUmdCHGUPbHm6iE7; Sun, 26 Sep 2021 08:33:32 +0000
Authentication-Results: ; auth=pass (LOGIN) smtp.auth=joevt@shaw.ca
X-Authority-Analysis: v=2.4 cv=SdyUytdu c=1 sm=1 tr=0 ts=6150305c
 a=qDatE6m/3wxSEG8Wq7h0zQ==:117 a=qDatE6m/3wxSEG8Wq7h0zQ==:17
 a=GthV8c92ZZJlE00sHJIA:9
From:   joevt <joevt@shaw.ca>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     linux-media@vger.kernel.org
Subject: [PATCH v2 00/29] edid-decode: bug fixes, additions, changes
Date:   Sun, 26 Sep 2021 01:33:01 -0700
Message-Id: <20210926083330.5206-1-joevt@shaw.ca>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfCwsqoQToehvrwTgF2jkvt73Ak5WocNz1xLu1j8a9055jJ5AiZFhJ+ZZZZRktTUtxEV04TjMvqifMZDXR337K24pFGhQfbG1qUjy22BR0HI4McHEFp4N
 AKsavrqRiySDbX4h+HXUvVTdCG7v6ZI/NMIdQR2/id59D7R3V+TRGM8hVtQRZj0v3eCIp1u6HFtxZ4CprM7Xtwu29n199GicNbU=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Corrections from previous attempt:
- patches are rebased from current edid-decode git repo master branch.
- using smtpBatchSize 20 so hopefully the mails will be sent this time.

Notes:
- Patch 02/28 replaces my previous patch 05/11.
It adds a new warning message.

- The problem with my previous patch 07/11 is addressed in patch 01/28 and 04/28 (and maybe elsewhere).

- Patches 06/28 to 26/28 replace my previous patch 11/11 (broken down into smaller steps this time).
They contain some corrections.

- Includes some other changes.

joevt (29):
  edid-decode: remove unnecessary length check
  edid-decode: fix standard timing vertical pixels
  edid-decode: exclude oui from _block functions
  edid-decode: check cta_hdr10plus length
  edid-decode: Capitalize fail sentence
  edid-decode: Replace return with break in switch
  edid-decode: extended tag length check
  edid-decode: Output block type before fail
  edid-decode: update Microsoft expected length
  edid-decode: Capitalize fail sentence
  edid-decode: make all OUI handlers the same
  edid-decode: move OUI parsing to separate function
  edid-decode: move unknown block warning
  edid-decode: remove cta_ext_block
  edid-decode: change unknown CTA block names
  edid-decode: move audio fail/warn messages
  edid-decode: replace first_block with block_number
  edid-decode: move parse_displayid_block inner loop
  edid-decode: remove offset from displayid_block
  edid-decode: displayid_block len fixes
  edid-decode: ignore DisplayID version for OUI check.
  edid-decode: DisplayID non-0 filler fixes
  edid-decode: DisplayID length checks
  edid-decode: make OUI enum
  edid-decode: more OUI changes
  edid-decode: remove extra vendor field
  edid-decode: re-add one EDID
  edid-decode: add interesting EDID
  edid-decode: fix indents

 data/apple-imac-retina-4k-21.5-inch-late-2015 | Bin 0 -> 256 bytes
 data/vizio-m60c3-hdmi-onkyo-txnr555           | Bin 0 -> 256 bytes
 edid-decode.cpp                               | 106 +++-
 edid-decode.h                                 |  32 +-
 oui.h                                         |  20 +
 parse-base-block.cpp                          |   5 +-
 parse-cta-block.cpp                           | 482 +++++++----------
 parse-displayid-block.cpp                     | 502 +++++++++---------
 8 files changed, 555 insertions(+), 592 deletions(-)
 create mode 100644 data/apple-imac-retina-4k-21.5-inch-late-2015
 create mode 100644 oui.h

-- 
2.24.3 (Apple Git-128)

