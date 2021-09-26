Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E54EF418777
	for <lists+linux-media@lfdr.de>; Sun, 26 Sep 2021 10:34:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229951AbhIZIg0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 26 Sep 2021 04:36:26 -0400
Received: from omta001.cacentral1.a.cloudfilter.net ([3.97.99.32]:51462 "EHLO
        omta001.cacentral1.a.cloudfilter.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229561AbhIZIgZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 26 Sep 2021 04:36:25 -0400
Received: from shw-obgw-4001a.ext.cloudfilter.net ([10.228.9.142])
        by cmsmtp with ESMTP
        id UC4amfNfCczbLUPcXmV5Vq; Sun, 26 Sep 2021 08:34:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=shaw.ca; s=s20180605;
        t=1632645289; bh=dQy5ZqKwM5EZ0Z1EXrmc/GIPO2CPrIhxn1M3R01s3dI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=aR6e/g7ybNT9EaaGLVlDcNTaSSWaLF1QD3beszTukaM3/dWdptz6g7XpZ7sKeSSDi
         UbWKQl5hceRgcpappqlytIT9ih1xQJ14BUOFVWc1LJ1WZDn/novDItG2DoyuTfCKQU
         1B0BWXnBpolutoOVBAs+lsbHrDUQ7BAhy2v/HZsU2Y6I5r5+FWfuBtZotUA17MBXbG
         5hfzVB1MDR8gqKalaK1+HQ1lb/aNeNreR7oP9uWrUYvssEuhozudRb9gIGOA0BkHEu
         IiohxWu8kf3awSEcgDZxdVsUeNtOniubNMT267HCLynjsVg/GcXe5fyU5bM9VnIGNh
         h863bQuiuAC9A==
Received: from shaw.ca ([70.71.78.228])
        by cmsmtp with ESMTPA
        id UPcQm9l35U9pxUPcWmdRJh; Sun, 26 Sep 2021 08:34:49 +0000
Authentication-Results: ; auth=pass (LOGIN) smtp.auth=joevt@shaw.ca
X-Authority-Analysis: v=2.4 cv=Bbi7bph2 c=1 sm=1 tr=0 ts=615030a9
 a=qDatE6m/3wxSEG8Wq7h0zQ==:117 a=qDatE6m/3wxSEG8Wq7h0zQ==:17 a=_Dj-zB-qAAAA:8
 a=dLOKK2dYXMX4MAETwpcA:9 a=c-cOe7UV8MviEfHuAVEQ:22
From:   joevt <joevt@shaw.ca>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     linux-media@vger.kernel.org
Subject: [PATCH v2 28/29] edid-decode: add interesting EDID
Date:   Sun, 26 Sep 2021 01:33:29 -0700
Message-Id: <20210926083330.5206-29-joevt@shaw.ca>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <20210926083330.5206-1-joevt@shaw.ca>
References: <20210926083330.5206-1-joevt@shaw.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfJBSncQJzUV+HHvi7hQavYn1Kcuyqd7WHuHQQ427TzabV0NqwCuQ2lema/+L4t2HOVAeW+DNBbeScuU3p7bKGQSgSeWiven36N7LjjrIhaz46BVeLVjl
 H123nH7mnqOh5f4qb2msh3/Gc453BgR/FBKvwBjaQ3ey746QINvsbF/H9ffz1s1ufU+GPvPNRomymfPJqGVDqYF1HcQwYpZjaoo=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

It contains "Audio information is present, but bit ..." message and "CTA-861 DisplayID Data Block" data block.

Looks like nested blocks (CTA blocks in a DisplayID block) need more indenting. Currently, indents are mostly hardcoded so they aren't suited for nested blocks.
Maybe we could add indenting using the following:
- Store current indent level in edid_state.
- Replace printf with printi which will print spaces for current indent level.
- For changing indent, you could use indent++ to indent and indent-- to outdent.
- Maybe some C++ tricks can be used to automatically outdent:
  - Call a function that returns an object that has a constructor that increments indent.
  - Then the destructor can automatically decrement indent when the scope of the object ends.
- We could also add a custom indenting string (currently it's two spaces per indent, but we could make it 4 or 8 spaces, or we could make it a tab).

Signed-off-by: Joe van Tunen <joevt@shaw.ca>
---
 data/apple-imac-retina-4k-21.5-inch-late-2015 | Bin 0 -> 256 bytes
 1 file changed, 0 insertions(+), 0 deletions(-)
 create mode 100644 data/apple-imac-retina-4k-21.5-inch-late-2015

diff --git a/data/apple-imac-retina-4k-21.5-inch-late-2015 b/data/apple-imac-retina-4k-21.5-inch-late-2015
new file mode 100644
index 0000000000000000000000000000000000000000..0a28a06cf6b2fb0332c64a21a476c3919173c26d
GIT binary patch
literal 256
zcmZSh4+acu0!9mz_k8u2lw@RCY9L*q;6HI)pz{Vb{(uk$1_nkn;Cq2#!G{971_K3C
zhTGhN3=C3IW(^ApEaV*!B0z0_7&3hmlerY204VaG!OYmg$iUgn$k@r**pzW;fp8@=
z12cn7@EeAf|NQeA^c&<E{&P4oFfp(&L@r=pk>`boC9<1>#X{p4SpIWD#OAYVfW_(?
r#eN9@-N+zRX85OK<6b6#4#!KMzyAB*$iSh@$<E%)2(%e1xH$m;)b2b1

literal 0
HcmV?d00001

-- 
2.24.3 (Apple Git-128)

