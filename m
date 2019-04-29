Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6560EDF44
	for <lists+linux-media@lfdr.de>; Mon, 29 Apr 2019 11:18:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727899AbfD2JSC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 29 Apr 2019 05:18:02 -0400
Received: from shell.v3.sk ([90.176.6.54]:59263 "EHLO shell.v3.sk"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727884AbfD2JRJ (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 29 Apr 2019 05:17:09 -0400
Received: from localhost (localhost [127.0.0.1])
        by zimbra.v3.sk (Postfix) with ESMTP id 8DFA01036A0;
        Mon, 29 Apr 2019 11:17:04 +0200 (CEST)
Received: from shell.v3.sk ([127.0.0.1])
        by localhost (zimbra.v3.sk [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id nfkfA1vzJ1e3; Mon, 29 Apr 2019 11:16:45 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
        by zimbra.v3.sk (Postfix) with ESMTP id A1853103695;
        Mon, 29 Apr 2019 11:16:43 +0200 (CEST)
X-Virus-Scanned: amavisd-new at zimbra.v3.sk
Received: from shell.v3.sk ([127.0.0.1])
        by localhost (zimbra.v3.sk [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id QUJh-FssglVF; Mon, 29 Apr 2019 11:16:39 +0200 (CEST)
Received: from belphegor.brq.redhat.com (nat-pool-brq-t.redhat.com [213.175.37.10])
        by zimbra.v3.sk (Postfix) with ESMTPSA id 6487810367B;
        Mon, 29 Apr 2019 11:16:38 +0200 (CEST)
From:   Lubomir Rintel <lkundrak@v3.sk>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>, linux-media@vger.kernel.org
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        James Cameron <quozl@laptop.org>, Pavel Machek <pavel@ucw.cz>,
        Libin Yang <lbyang@marvell.com>,
        Albert Wang <twang13@marvell.com>,
        jacopo mondi <jacopo@jmondi.org>,
        Sakari Ailus <sakari.ailus@iki.fi>
Subject: [PATCH v4 00/14] media: make Marvell camera work on DT-based OLPC XO-1.75
Date:   Mon, 29 Apr 2019 11:16:22 +0200
Message-Id: <20190429091632.2462285-1-lkundrak@v3.sk>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


Hi,

this is the fourth spin of a patchset that modernizes the Marvell MMP2 CC=
IC
driver.

At the core of the rework is the move to asynchronous sensor discovery
and clock management with the standard clock framework. There are also
some straightforward fixes for the bitrotten parts.

Compared the the previous version it addresses things pointed out in last
review, in patches [01/10] and [10/10]. Details in the changelogs of
the individual patches.

Tested on OLPC XO-1 and OLPC XO-1.75 laptops.

Thanks,
Lubo




