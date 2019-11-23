Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4CF19107F6B
	for <lists+linux-media@lfdr.de>; Sat, 23 Nov 2019 17:46:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726887AbfKWQqR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 23 Nov 2019 11:46:17 -0500
Received: from smtp-out-so.shaw.ca ([64.59.136.139]:37140 "EHLO
        smtp-out-so.shaw.ca" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726762AbfKWQqQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 23 Nov 2019 11:46:16 -0500
Received: from shaw.ca ([70.71.78.228])
        by shaw.ca with ESMTPA
        id YYXziRYDERnrKYYY2iYY0y; Sat, 23 Nov 2019 09:46:15 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shaw.ca;
        s=s20180605; t=1574527575;
        bh=AQdv4G/mSkEfz7b1eoaRqAXKVimupndYiBmQr3Yo3NA=;
        h=From:To:Cc:Subject:Date;
        b=gxY8tlrVUPJR4+vUsOnfh4b1A7/z7JQ8Hy02fV6weTLTw0yySzWBkn1zd6+mHss5a
         VNc3+ysFm0JUk+vilsqd9Nsy5aVDdF9O7RDnOEb1o4EFuYkE833IHzaRSr78aSy18M
         SgCLdeQRjYF9fFm3qXgyazC+XsnN4ZUjuIH/7P7c6v2kMJ+O4vY68bsRnKfdcWRLXi
         6FPtZHj7tsTNPgV28z99wwjyle8WYtrCKFxhbpc/6AOI07b3yZFyfMykr3PG2whjwf
         UU1sswJ9qHm7M2lRu1NDk3rMYQpo7i9EMovBEoxTUtH9AW4nq2VlY+ZNjD6QhcOYOl
         359auYB6qPSeg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shaw.ca;
        s=s20180605; t=1574527575;
        bh=AQdv4G/mSkEfz7b1eoaRqAXKVimupndYiBmQr3Yo3NA=;
        h=From:To:Cc:Subject:Date;
        b=gxY8tlrVUPJR4+vUsOnfh4b1A7/z7JQ8Hy02fV6weTLTw0yySzWBkn1zd6+mHss5a
         VNc3+ysFm0JUk+vilsqd9Nsy5aVDdF9O7RDnOEb1o4EFuYkE833IHzaRSr78aSy18M
         SgCLdeQRjYF9fFm3qXgyazC+XsnN4ZUjuIH/7P7c6v2kMJ+O4vY68bsRnKfdcWRLXi
         6FPtZHj7tsTNPgV28z99wwjyle8WYtrCKFxhbpc/6AOI07b3yZFyfMykr3PG2whjwf
         UU1sswJ9qHm7M2lRu1NDk3rMYQpo7i9EMovBEoxTUtH9AW4nq2VlY+ZNjD6QhcOYOl
         359auYB6qPSeg==
X-Authority-Analysis: v=2.3 cv=L7FjvNb8 c=1 sm=1 tr=0
 a=qDatE6m/3wxSEG8Wq7h0zQ==:117 a=qDatE6m/3wxSEG8Wq7h0zQ==:17
 a=Q9Rj0_lbYESmYbdiyZkA:9
From:   joevt <joevt@shaw.ca>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     linux-media@vger.kernel.org, joevt <joevt@shaw.ca>
Subject: [PATCH 00/10] edid-decode: bug fixes, additions, changes
Date:   Sat, 23 Nov 2019 08:45:54 -0800
Message-Id: <20191123164604.268-1-joevt@shaw.ca>
X-Mailer: git-send-email 2.21.0 (Apple Git-122.2)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfOY6nnjBSesckqm77OB5dyWnLm6UQqNHBC7vZ047/8VRMvM6rNflFdVjf6nubFnhlRqoWuSaML5TpDL7gY6UtKQ9Pk5mYHLY/Ck9TSN39sE3kukH3vL+
 3vxf2yAYlkIAJKUDOtsw1JO9FDvEwO4CMcloVDH5RyAXMv0G7K9p+3yC/+wlJXV5bal3MLmvPjTsW9WVRaM91d6qU+HCWJvN14g=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This patchset is a set of bug-fixes, additions, and changes I've made while examining various EDIDs I have encountered.

joevt (10):
  edid-decode: change horizontal refresh rates to kHz
  edid-decode: correct horizontal range in Monitor Ranges
  edid-decode: correct calculation of DisplayID type 1 timings
  edid-decode: add front porch, pulse width, and back porch
  edid-decode: output timings for YCbCr 4:2:0 cmdb
  edid-decode: Dump hex of unknown CTA Vendor-Specific blocks
  edid-decode: cleanup printf format string compiler warnings
  edid-decode: Dump hex of non-decoded extension blocks
  edid-decode: DisplayID additions
  edid-decode: add example EDIDs

 data/acer-xv273k-dp1                          | Bin 0 -> 384 bytes
 data/acer-xv273k-dp1-tile0                    | Bin 0 -> 384 bytes
 data/acer-xv273k-dp2                          | Bin 0 -> 384 bytes
 data/acer-xv273k-dp2-tile1                    | Bin 0 -> 384 bytes
 data/dell-p2415q-dp-mdp                       | Bin 0 -> 256 bytes
 data/dell-p2415q-hdmi1.4                      | Bin 0 -> 256 bytes
 data/dell-p2415q-hdmi2.0                      | Bin 0 -> 256 bytes
 data/dell-up2715k-dp1-tile1                   | Bin 0 -> 384 bytes
 data/dell-up2715k-dp2-tile0                   | Bin 0 -> 256 bytes
 data/dell-up2715k-mdp                         | Bin 0 -> 256 bytes
 data/dell-up2715k-mdp-switchresx              | Bin 0 -> 384 bytes
 data/kogan-kaled24144f-dp                     | Bin 0 -> 256 bytes
 data/kogan-kaled24144f-hdmi                   | Bin 0 -> 256 bytes
 data/lg-ultrafine-5k-v2-thunderbolt-dp1-tile0 | Bin 0 -> 384 bytes
 data/lg-ultrafine-5k-v2-thunderbolt-dp2-tile1 | Bin 0 -> 256 bytes
 edid-decode.c                                 | 758 ++++++++++++++++--
 16 files changed, 671 insertions(+), 87 deletions(-)
 create mode 100644 data/acer-xv273k-dp1
 create mode 100644 data/acer-xv273k-dp1-tile0
 create mode 100644 data/acer-xv273k-dp2
 create mode 100644 data/acer-xv273k-dp2-tile1
 create mode 100644 data/dell-p2415q-dp-mdp
 create mode 100644 data/dell-p2415q-hdmi1.4
 create mode 100644 data/dell-p2415q-hdmi2.0
 create mode 100644 data/dell-up2715k-dp1-tile1
 create mode 100644 data/dell-up2715k-dp2-tile0
 create mode 100644 data/dell-up2715k-mdp
 create mode 100644 data/dell-up2715k-mdp-switchresx
 create mode 100644 data/kogan-kaled24144f-dp
 create mode 100644 data/kogan-kaled24144f-hdmi
 create mode 100644 data/lg-ultrafine-5k-v2-thunderbolt-dp1-tile0
 create mode 100644 data/lg-ultrafine-5k-v2-thunderbolt-dp2-tile1

-- 
2.21.0 (Apple Git-122.2)

