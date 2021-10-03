Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1A15941FEE0
	for <lists+linux-media@lfdr.de>; Sun,  3 Oct 2021 02:13:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234306AbhJCAPJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 2 Oct 2021 20:15:09 -0400
Received: from wrqvnhvw.outbound-mail.sendgrid.net ([149.72.32.137]:43076 "EHLO
        wrqvnhvw.outbound-mail.sendgrid.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233697AbhJCAPI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 2 Oct 2021 20:15:08 -0400
X-Greylist: delayed 302 seconds by postgrey-1.27 at vger.kernel.org; Sat, 02 Oct 2021 20:15:08 EDT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cottsay.net;
        h=from:subject:mime-version:to:cc:content-transfer-encoding:
        content-type;
        s=s1; bh=KraF7UdlMTZZ+oyKMyPLjyuvN3f6cFuy+ElM1j+/U+M=;
        b=mDVtusOeRgeoyTQ8Dq8COV4hhQGSBGEqh8pvN09o/xDXlGcA54nCZkBdyO1ZnMWQyM91
        QAz9fysnwYnVKtbERSpYHlvZjs7FNUxgdINc0yUzm6XCCNx0zrqOFvkkxQGnR3Ma09RcD/
        slB0134nw3aRJHpvuc0LGeTWeJPKBoZZ8iYH//o9mVz/9Q5OS4TO62vwXC13/eW/x7/ivb
        wqLcKe1RhMU+iX1+VR4iW7gO9+OQWXXNW1rVVsno1M9HutYuTYdxO+9zGhP8QSTfJu/QG/
        cg+9AJ0lIdztF7IzbLoNt5Nc9A4fpCXVkLLYjpZhgIdAWv7tse0fKdto9xq3v4Ow==
Received: by filterdrecv-656998cfdd-8pml9 with SMTP id filterdrecv-656998cfdd-8pml9-1-6158F473-1B
        2021-10-03 00:08:19.60815276 +0000 UTC m=+952859.780140040
Received: from cottsay-server.delphi.cottsay.net (unknown)
        by geopod-ismtpd-6-0 (SG) with ESMTP
        id -HZxIlsPTFeAD_oK9dGBxw
        Sun, 03 Oct 2021 00:08:19.433 +0000 (UTC)
Received: from cottsay-lenovo.delphi.cottsay.net (cottsay-lenovo.delphi.cottsay.net [172.16.8.31])
        by cottsay-server.delphi.cottsay.net (Postfix) with ESMTPSA id D7E143C00D6;
        Sat,  2 Oct 2021 17:08:18 -0700 (PDT)
From:   Scott K Logan <logans@cottsay.net>
Subject: [PATCH 0/1] media: saa7134: Add support for Leadtek WinFast HDTV200 H
Date:   Sun, 03 Oct 2021 00:08:19 +0000 (UTC)
Message-Id: <20211003000644.734529-1-logans@cottsay.net>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-SG-EID: =?us-ascii?Q?v4Qh49l2kwszIc8ZaCpP76AQaq=2F9O0v3P=2FmBhAlry1T=2FzVhHBJ8w+hDrqxBvdA?=
 =?us-ascii?Q?KU3ehgFPlGwC1hR8j2nf+OmMBOZRbkJCh=2FvbOrG?=
 =?us-ascii?Q?eQ2AAUZH39pxxcvxJ4Xi4YJcENK2qjmJ7ycu78N?=
 =?us-ascii?Q?iOvE7CRRYmlOxdu7XP37WRuDkUTzguF0PdYAazw?=
 =?us-ascii?Q?UDq8H82dj6F9k9EOjxJMhsuc+Oxbv8+xnBLp+FA?=
 =?us-ascii?Q?Td=2FlTMAKX7okEYdVlcJR2PpKMwwgHffLsayvme?=
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        linux-media@vger.kernel.org
Cc:     Scott K Logan <logans@cottsay.net>
X-Entity-ID: 4JzoG0JXdcXknftrbeCa4w==
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset=us-ascii
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello folks -

I know that this is a pretty old device, but the patch to support it is
pretty simple so I thought I'd send it your way. To discover the more
nuanced behaviors, I monitored PCI traffic using dtrace on a Windows VM
with the PCI device configured to passthrough.

I don't have the original IR hardware so I'm unable to test that, but
the rest of the device should work as intended.

Scott K Logan (1):
  media: saa7134: Add support for Leadtek WinFast HDTV200 H

 drivers/media/pci/saa7134/saa7134-cards.c | 53 +++++++++++++++++++++++
 drivers/media/pci/saa7134/saa7134-dvb.c   | 29 +++++++++++++
 drivers/media/pci/saa7134/saa7134.h       |  1 +
 3 files changed, 83 insertions(+)

-- 
2.31.1

