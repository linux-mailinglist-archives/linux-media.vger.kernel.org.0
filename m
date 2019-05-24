Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4B7FA28FA6
	for <lists+linux-media@lfdr.de>; Fri, 24 May 2019 05:31:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388800AbfEXDbF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 23 May 2019 23:31:05 -0400
Received: from mail-io1-f65.google.com ([209.85.166.65]:46668 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388735AbfEXDbF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 23 May 2019 23:31:05 -0400
Received: by mail-io1-f65.google.com with SMTP id q21so6622593iog.13
        for <linux-media@vger.kernel.org>; Thu, 23 May 2019 20:31:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4IMXeSPz07H/1FS+L5wog9k24C98hcuyfvlIBRrFToQ=;
        b=JuooVbNFZqVGK0ePviE0+zQb5HLSPgmBhi22D2BkiE/7yFc3PTJNQPFhzTnHXwXDO/
         JweFIXmAX8zk6C7iGGlZ8FZ3K7jJswX+d2yJ+56Yho3vHWhkyP2jP4CFjXXhQCbbZTk6
         tn1Y3UpMIIKQI6eOHSBeOwAZuvY9AONqt+uic=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4IMXeSPz07H/1FS+L5wog9k24C98hcuyfvlIBRrFToQ=;
        b=d/p7i51W5x+v5yBvMZpUjpsf63wzCMK7t5cQtyVJuFQZuFc68fE5EpnQyqflJk9MhG
         CJOBCMiBjd1gYL3MW6FhAqsUxePode71yN+rzPsd2k2MprJg4SKRkkK9HcjJdXDo4flH
         HlIB8sv/2iVh64Q6HsScba5XmzLpPkE7cp1bKXeAm5ZMTcK3VntJxjL31DsSOKypDjpB
         luQmy+fGiQNqcefl4qRY+ahsOA2HAVIX+iXn01hMyxs+YTNWZ/RqxejesYz+Y3JJAL6t
         s/TCSA4QCJRc/IqlA5NRVr4ijyhGHepc/YtNTtNdJfM9Wk9p89ZrDUri08vG03w4Yy+x
         LexQ==
X-Gm-Message-State: APjAAAX4DWBUFff6eXTI9j/x7O7lltr4e34LDgZiWpEF6lRdUqjRcRq0
        Sdiv9xVIhLiuwZSN+f3tyot68g==
X-Google-Smtp-Source: APXvYqw5FmID+PmO0aMdsdSEbVeSQErU4FoC610/wj0wuiUVHLFvpKEsMgkeFn5w6ac6DAfyipIrXQ==
X-Received: by 2002:a6b:4408:: with SMTP id r8mr3147213ioa.103.1558668664632;
        Thu, 23 May 2019 20:31:04 -0700 (PDT)
Received: from shuah-t480s.internal (c-24-9-64-241.hsd1.co.comcast.net. [24.9.64.241])
        by smtp.gmail.com with ESMTPSA id h185sm794380itb.16.2019.05.23.20.31.03
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 23 May 2019 20:31:04 -0700 (PDT)
From:   Shuah Khan <skhan@linuxfoundation.org>
To:     mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        helen.koike@collabora.com
Cc:     Shuah Khan <skhan@linuxfoundation.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] Use Media Dev Allocator to fix vimc dev lifetime bugs
Date:   Thu, 23 May 2019 21:31:00 -0600
Message-Id: <cover.1558667245.git.skhan@linuxfoundation.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

media_device is embedded in struct vimc_device and when vimc is removed
vimc_device and the embedded media_device goes with it, while the active
stream and vimc_capture continue to access it.

Fix the media_device lifetime problem by changing vimc to create shared
media_device using Media Device Allocator API and vimc_capture getting
a reference to vimc module. With this change, vimc module can be removed
only when the references are gone. vimc can be removed after vimc_capture
is removed.

Media Device Allocator API supports just USB devices. Enhance it
adding a genetic device allocate interface to support other media
drivers.

The new interface takes pointer to struct device instead and creates
media device. This interface allows a group of drivers that have a
common root device to share media device resource and ensure media
device doesn't get deleted as long as one of the drivers holds its
reference.

The new interface has been tested with vimc component driver to fix
panics when vimc module is removed while streaming is in progress.

Shuah Khan (2):
  media: add generic device allocate interface to media-dev-allocator
  vimc: fix BUG: unable to handle kernel NULL pointer dereference

 drivers/media/Makefile                     |  4 +-
 drivers/media/media-dev-allocator.c        | 39 ++++++++++++++
 drivers/media/platform/vimc/vimc-capture.c | 17 +++++-
 drivers/media/platform/vimc/vimc-core.c    | 60 ++++++++++++----------
 include/media/media-dev-allocator.h        | 46 ++++++++++++++---
 5 files changed, 130 insertions(+), 36 deletions(-)

-- 
2.17.1

