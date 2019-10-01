Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DB323C2F3C
	for <lists+linux-media@lfdr.de>; Tue,  1 Oct 2019 10:49:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732765AbfJAItU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 1 Oct 2019 04:49:20 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:36879 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726148AbfJAItU (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 1 Oct 2019 04:49:20 -0400
Received: by mail-lj1-f195.google.com with SMTP id l21so12461577lje.4;
        Tue, 01 Oct 2019 01:49:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=HA6BOTuvv8pcHm8tehLJmXVXIQIbxIkiRW0rNiff8Fc=;
        b=EqvR4IYCWWp7f96oxI/cp8Vn1kNHhSVVebuxSuIeOLqa7gBG39GSRGSo4ND+w2EKEU
         IIXQyq5Oo9XJR0jK4mGpfU7qyWlOTnauIbUomQWXJHaZ6Gi2eaxarHjCKaCIPHC5mWm0
         /FMge46s113SZkFaVfe/jUbn6eNXerPJta9mNxy/PoYKTnz5XfZ+QP2fHo9hMrc6AbPc
         rqAocWW62DxgrR6SgKjsiK+AK0XzSuJR79FeUWmJ/etchz76Rm2HI6TItclFG0qrwSmE
         0EYztaqZHQvjYfBu3drPu+w3Buuf7Qi/olnNZZ8SdcX4Ka8fuDcMpGCGlHjad4DThD+C
         Tnng==
X-Gm-Message-State: APjAAAVwHoTdVsyvvCAC6vSq8n5Gqr48AQ0rsHe0LJ5r/K/hyRHBsWPT
        7SY0Yun9GVN/BTwpZtzPhPU=
X-Google-Smtp-Source: APXvYqzkIETn5pkp7Rrs2hkbj/rr8CAiMh2InNvloMxxIYy4hVUpST9y/PTpBc7n37kGM4OfK8bFYQ==
X-Received: by 2002:a2e:2e13:: with SMTP id u19mr15564208lju.112.1569919757596;
        Tue, 01 Oct 2019 01:49:17 -0700 (PDT)
Received: from xi.terra (c-51f1e055.07-184-6d6c6d4.bbcust.telenor.se. [85.224.241.81])
        by smtp.gmail.com with ESMTPSA id m15sm3954239ljg.97.2019.10.01.01.49.16
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 01 Oct 2019 01:49:16 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.92.2)
        (envelope-from <johan@xi.terra>)
        id 1iFDqW-0000X6-VU; Tue, 01 Oct 2019 10:49:25 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Pete Zaitcev <zaitcev@redhat.com>,
        Alan Stern <stern@rowland.harvard.edu>,
        linux-media@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>
Subject: [PATCH v2 0/4] USB: fix runtime PM after driver unbind
Date:   Tue,  1 Oct 2019 10:49:04 +0200
Message-Id: <20191001084908.2003-1-johan@kernel.org>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

A recent change in USB core broke runtime-PM after driver unbind in
several drivers (when counting all USB serial drivers). Specifically,
drivers which took care not modify the runtime-PM usage counter after
their disconnect callback had returned, would now fail to be suspended
when a driver is later bound.

Greg, feel free to pick these up directly. The media patch has been
acked by Mauro.

Johan


v2
 - rebase on usb-next, I had a conflicting change to usb-skeleton in my
   tree
 - add Mauro's ack to the media patch


Johan Hovold (4):
  USB: usb-skeleton: fix runtime PM after driver unbind
  USB: usblp: fix runtime PM after driver unbind
  USB: serial: fix runtime PM after driver unbind
  media: stkwebcam: fix runtime PM after driver unbind

 drivers/media/usb/stkwebcam/stk-webcam.c | 3 +--
 drivers/usb/class/usblp.c                | 8 +++++---
 drivers/usb/serial/usb-serial.c          | 5 +----
 drivers/usb/usb-skeleton.c               | 8 +++-----
 4 files changed, 10 insertions(+), 14 deletions(-)

-- 
2.23.0

