Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 147DD44DB1B
	for <lists+linux-media@lfdr.de>; Thu, 11 Nov 2021 18:28:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234377AbhKKRay (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 11 Nov 2021 12:30:54 -0500
Received: from mail.kernel.org ([198.145.29.99]:47844 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234322AbhKKRaw (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 11 Nov 2021 12:30:52 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id EB0AF6135E;
        Thu, 11 Nov 2021 17:28:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1636651683;
        bh=ueipiCytwFJxvKJD62tdW8ada4b24UusAypKRGrgaRk=;
        h=From:To:Cc:Subject:Date:From;
        b=DYWM3KTr9mFgktAw6oJV/Yxz5N6gcqmydmDV45igr6o6gBwOpiPnBDd/dk0pvAnyI
         4iWKR/35xkCgfKFL3APcAg9gYZigi23B96D/VUaSdHRT1ncAPfVkPldRLscFOqXL6k
         WpKfBURqx3/gTQJgHDMLfmT0BhYhTWAgWgA/tB3emoqEmg0dFlmEtgNbJuxZkmBotX
         t34GR+yEnQmXjj8L/t57KFsKn+Qd7mwqV3F7TPLevFKLvi96rPyvaPZlPJCyYIln3n
         iF2DlQVFU0ztXJYd5B/nYZ7c1zZcLOol+ouy96rbIbKdq4Pl6AkDSHhtYgLfkoHVbV
         qmzXWnbJ5DdHw==
Received: by mail.kernel.org with local (Exim 4.94.2)
        (envelope-from <mchehab@kernel.org>)
        id 1mlDrj-0001oZ-VG; Thu, 11 Nov 2021 17:27:59 +0000
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Bhaskar Chowdhury <unixbhaskar@gmail.com>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        Deepak R Varma <drv@mailo.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Hans de Goede <hdegoede@redhat.com>,
        Ingo Molnar <mingo@kernel.org>,
        Kaixu Xia <kaixuxia@tencent.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev
Subject: [PATCH 0/3] atomisp: add support for enum frame rate and sizes
Date:   Thu, 11 Nov 2021 17:27:55 +0000
Message-Id: <cover.1636651027.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Adding support for those two ioctls are trivial, and allow testing
different resolutions with the driver.

Together with some improvements I made at camorama, it is now
possible to change the atomisp sensor's resolution at the GUI.

Talking about camorama, I also added there an option to disable
the Gtk cairo_scale() calls. On my tests here, placing ov2680 on
its maximum resolution, I'm getting a framerate of 26 fps, which
sounds reasonable, as the maximum would be 30fps, and I'm not
using daylight.

When letting cairo_scale() to run, the rate reduces to 8 fps, meaning 
that Gtk is not using GPU acceleration.

Funny enough, when resolution is lower, atomisp is giving a very
bad framerate (around 3fps, even with the scaler disabled).

This is a very weird result, probably indicating some problems inside
the driver. That requires further investigation.

Mauro Carvalho Chehab (3):
  media: atomisp-ov2680: implement enum frame intervals
  media: atomisp-ov2680: adjust the maximum frame rate
  media: atomisp: implement enum framesize/frameinterval

 .../media/atomisp/i2c/atomisp-ov2680.c        | 21 ++++++++
 drivers/staging/media/atomisp/i2c/ov2680.h    | 14 ++---
 .../staging/media/atomisp/pci/atomisp_ioctl.c | 53 +++++++++++++++++++
 3 files changed, 81 insertions(+), 7 deletions(-)

-- 
2.33.1


