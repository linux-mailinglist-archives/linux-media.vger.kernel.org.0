Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A1D0639585F
	for <lists+linux-media@lfdr.de>; Mon, 31 May 2021 11:45:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231280AbhEaJrd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 31 May 2021 05:47:33 -0400
Received: from mail.kernel.org ([198.145.29.99]:56118 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231183AbhEaJra (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 31 May 2021 05:47:30 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 19AB2611EE;
        Mon, 31 May 2021 09:45:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622454351;
        bh=wZAAmPPbRYOf0H8CXkKXFYk4mvXla/HH3PD4TIXMdFU=;
        h=From:To:Cc:Subject:Date:From;
        b=fvtxcdmrUYuO3TQKAAIUPbb8Dku6hA1QMY96MwVpJbQtf68siBxux2Z49iaty0ena
         ljr5JZtk6C9TUvzxCF4t6u09CzpL2W/GsLO+od4FzfDgV6n+//51yJi5/5QipeOm7v
         KwW3AHkh20Q/L6EU3NIJJ4TKUNMQLBOyRMl2bUsu4pEq1JLUXLqms/wXlbz5VbsgzS
         V7DMaGCxpv8pW9yR9Y5FKSu0eSnPAc14O/+w5azlP3e9vLVFIxvRoJXDQ+UA/xx8Fe
         pvFRMOumDHWRSPmVd0OLOH+vepWfwHtOo8vfrItbB3Y4vG4IcNampi44YiylnKe/kR
         ULWXmbSeDpriw==
Received: from johan by xi.lan with local (Exim 4.94.2)
        (envelope-from <johan@kernel.org>)
        id 1lneUT-0003JJ-ED; Mon, 31 May 2021 11:45:46 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Eero Lehtinen <debiangamer2@gmail.com>,
        Johan Hovold <johan@kernel.org>
Subject: [PATCH v2 0/3] media: fix zero-length USB control requests
Date:   Mon, 31 May 2021 11:44:31 +0200
Message-Id: <20210531094434.12651-1-johan@kernel.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The direction of the pipe argument must match the request-type direction
bit or control requests may fail depending on the host-controller-driver
implementation.
    
Control transfers without a data stage are treated as OUT requests by
the USB stack and should be using usb_sndctrlpipe(). Failing to do so
will now trigger a warning.

This series fixes the three media drivers that got this wrong.

Johan

Changes in v2
 - keep the rtl28xxu zero-length read request which is needed for
   proper type detection (Eero)


Johan Hovold (3):
  media: gspca/gl860: fix zero-length control requests
  media: gspca/sunplus: fix zero-length control requests
  media: rtl28xxu: fix zero-length control request

 drivers/media/usb/dvb-usb-v2/rtl28xxu.c | 11 ++++++++++-
 drivers/media/usb/gspca/gl860/gl860.c   |  4 ++--
 drivers/media/usb/gspca/sunplus.c       |  8 ++++++--
 3 files changed, 18 insertions(+), 5 deletions(-)

-- 
2.31.1

