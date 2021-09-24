Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D524E417E38
	for <lists+linux-media@lfdr.de>; Sat, 25 Sep 2021 01:31:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344487AbhIXXd1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 24 Sep 2021 19:33:27 -0400
Received: from omta002.cacentral1.a.cloudfilter.net ([3.97.99.33]:32974 "EHLO
        omta002.cacentral1.a.cloudfilter.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232572AbhIXXd0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 24 Sep 2021 19:33:26 -0400
Received: from shw-obgw-4001a.ext.cloudfilter.net ([10.228.9.142])
        by cmsmtp with ESMTP
        id ToOTmFeAMps7PTufXmwEGd; Fri, 24 Sep 2021 23:31:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=shaw.ca; s=s20180605;
        t=1632526311; bh=pj+RHrhICqKJoRuBhb7ZmfdXw8gdksDk1APSkKlQohg=;
        h=From:To:Cc:Subject:Date;
        b=C4DiPqZKJzk0aoU7AluYZFKu91HjxkMhIV3bT+PQLsqR1IszAFsAa7qU5DRYOnxBq
         0ksS7q0Gx+V8AIOlg0CRVBIUy28z3ozFze4HVfgozTS19v2pGUNLnnDcxm0UY1vaGd
         DZYtpqmhFb1OU72G2aoH5aIqGOrQ2qQlJWemSQUPqChbQQa2AMVdXB8byM7DDQxKn/
         W2exi1qcZsrdWy0beLToITTWzJV/qYR/RP2h76oHjBmWkS2JT9vxIKs+WLcoxx6k6J
         JNSCUD16CufGNPY9jdR2l5lFrpZNqizzjCC3WYKm75KfeYMGVDeJV8G4Bh9QToBBIb
         dAcBV1DJre4Fw==
Received: from shaw.ca ([70.71.78.228])
        by cmsmtp with ESMTPA
        id TufVmyJPGU9pxTufXmYw6Y; Fri, 24 Sep 2021 23:31:51 +0000
Authentication-Results: ; auth=pass (LOGIN) smtp.auth=joevt@shaw.ca
X-Authority-Analysis: v=2.4 cv=Bbi7bph2 c=1 sm=1 tr=0 ts=614e5fe7
 a=qDatE6m/3wxSEG8Wq7h0zQ==:117 a=qDatE6m/3wxSEG8Wq7h0zQ==:17
 a=GthV8c92ZZJlE00sHJIA:9
From:   joevt <joevt@shaw.ca>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     linux-media@vger.kernel.org
Subject: [PATCH 00/28] bug fixes, additions, changes
Date:   Fri, 24 Sep 2021 16:31:21 -0700
Message-Id: <20210924233149.10028-1-joevt@shaw.ca>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfAyM3s+ovMFQRQpc/cLhegYJhJaS7WXisWfQB1L3na/VZqh5EoI3HBtsqVMzHCYzMFRON95FUwMrkdgVW3Vq/ONyfWd2GbM6jr5TJ5VhrzUDBqG8AgqM
 GVlpXJSm0SYMViWdafa9HqCOfvG2u3cRMmkkGYoJB59OsOMyIiqX1/IfrYbb/jeDadhRS+APoaq4qbHszrxY65WsrriYj4bdQ58=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

- Patch 02/28 replaces my previous patch 05/11.
It adds a new warning message.

- The problem with my previous patch 07/11 is addressed in patch 01/28 and 04/28 (and maybe elsewhere).

- Patches 06/28 to 26/28 replace my previous patch 11/11 (broken down into smaller steps this time).
They contain some corrections.

- Includes some other changes.


joevt (28):
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

 data/apple-imac-retina-4k-21.5-inch-late-2015 | Bin 0 -> 256 bytes
 data/vizio-m60c3-hdmi-onkyo-txnr555           | Bin 0 -> 256 bytes
 edid-decode.cpp                               | 106 +++-
 edid-decode.h                                 |  32 +-
 oui.h                                         |  20 +
 parse-base-block.cpp                          |   5 +-
 parse-cta-block.cpp                           | 482 +++++++----------
 parse-displayid-block.cpp                     | 498 +++++++++---------
 8 files changed, 553 insertions(+), 590 deletions(-)
 create mode 100644 data/apple-imac-retina-4k-21.5-inch-late-2015
 create mode 100644 oui.h

-- 
2.24.3 (Apple Git-128)

