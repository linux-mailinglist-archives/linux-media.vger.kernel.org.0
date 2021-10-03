Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E316B41FF3A
	for <lists+linux-media@lfdr.de>; Sun,  3 Oct 2021 04:36:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229588AbhJCCim (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 2 Oct 2021 22:38:42 -0400
Received: from wrqvnhvw.outbound-mail.sendgrid.net ([149.72.32.137]:8308 "EHLO
        wrqvnhvw.outbound-mail.sendgrid.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229534AbhJCCil (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 2 Oct 2021 22:38:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cottsay.net;
        h=from:subject:mime-version:to:cc:content-transfer-encoding:
        content-type;
        s=s1; bh=It6jebDl3nuns7IOICpyjNP6KBken6kJglWUNWJd05c=;
        b=Fjen4CAFgDAzU0TeZGdLzoV3XSdhunLat8sDYUmUqcaO9HkhUR7pGyUbaVTmh0cBM/BB
        w/2F9dGCGYMpI/HNNx3Je+bUfDHVZHuw8opG/j/Z5cqOzm1T9oPTeWVENi1pVYWY6fgzJh
        HV4Pknj2tqQFWOusOdlGEYwo6mt9Hg13/9kRSut0apxvlqV1/lCYWFgDJimd/mSmhh/bpB
        Wry5CAQFl/52VAQBNElBrCrUUgHqR7SS1DmoagDGX6dOhDl806jRcSkejaBylbg6+WjVFW
        vDnTxKS5v0MfP/MNzwLTI075Vr4oItnkOabwrfdiO4qwnr+x02nl6zJQ1XC+g5TA==
Received: by filterdrecv-7bc86b958d-gt6pz with SMTP id filterdrecv-7bc86b958d-gt6pz-1-61591746-15
        2021-10-03 02:36:54.713588009 +0000 UTC m=+2693817.404992980
Received: from cottsay-server.delphi.cottsay.net (unknown)
        by geopod-ismtpd-2-0 (SG) with ESMTP
        id dP__pBiOTCa1nC87CW5o3Q
        Sun, 03 Oct 2021 02:36:54.518 +0000 (UTC)
Received: from cottsay-lenovo.delphi.cottsay.net (cottsay-lenovo.delphi.cottsay.net [172.16.8.31])
        by cottsay-server.delphi.cottsay.net (Postfix) with ESMTPSA id ED2B53C0436;
        Sat,  2 Oct 2021 19:36:53 -0700 (PDT)
From:   Scott K Logan <logans@cottsay.net>
Subject: [PATCH 0/1] media: uvcvideo: Add quirk for exponential exposure
Date:   Sun, 03 Oct 2021 02:36:54 +0000 (UTC)
Message-Id: <20211003023554.885815-1-logans@cottsay.net>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-SG-EID: =?us-ascii?Q?v4Qh49l2kwszIc8ZaCpP76AQaq=2F9O0v3P=2FmBhAlry1T=2FzVhHBJ8w+hDrqxBvdA?=
 =?us-ascii?Q?KU3ehgFPlGwC1hR8j2nf+OmGtuprMcj=2FTu7H5rE?=
 =?us-ascii?Q?yJ7p4WUeAcPe9mMZdpr8ZVq11J8Ws8QnGKDoQSg?=
 =?us-ascii?Q?j66lfmXaXkZK7g6E5AlF8LYP3u4Xaacawm+ltaP?=
 =?us-ascii?Q?NhBRzkhu1m93oL6VMMm0T4Yz6j=2FngMVY3A2eTb0?=
 =?us-ascii?Q?gt=2F1oge7IjzkBB6nJYbeHp=2F3UiwnDsOZtNw9jn?=
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        subscribers-only <linux-uvc-devel@lists.sourceforge.net>,
        linux-media@vger.kernel.org
Cc:     Scott K Logan <logans@cottsay.net>
X-Entity-ID: 4JzoG0JXdcXknftrbeCa4w==
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset=us-ascii
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Ever since I started using them, I've noticed that the absolute exposure
control for the LifeCam webcam hasn't functioned properly. After some
poking around, I managed to charactarize the behavior. To summarize,
only values which follow an exponential pattern appear to result in the
intended change to the webcam's image.

Ideally this quirky behavior could be handled with an extension unit,
but I'm not sure this behavior can be implemented there. I tested this
patch with the two LifeCam webcams I have on hand.

Scott K Logan (1):
  media: uvcvideo: Add quirk for exponential exposure

 drivers/media/usb/uvc/uvc_ctrl.c   | 41 ++++++++++++++++++++++++++++++
 drivers/media/usb/uvc/uvc_driver.c | 18 +++++++++++++
 drivers/media/usb/uvc/uvcvideo.h   |  1 +
 3 files changed, 60 insertions(+)

-- 
2.31.1

