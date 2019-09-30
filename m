Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B82F4C24E6
	for <lists+linux-media@lfdr.de>; Mon, 30 Sep 2019 18:14:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732153AbfI3QM5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 30 Sep 2019 12:12:57 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:35840 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731459AbfI3QM5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 30 Sep 2019 12:12:57 -0400
Received: by mail-lj1-f195.google.com with SMTP id v24so10126202ljj.3;
        Mon, 30 Sep 2019 09:12:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=AHlZ2LOaSE7OHrbGjaVF2FEkUoJaJEmgh7aqAGxCpLE=;
        b=BgsVwWhxBobswAdNQ8Zvl9vF3NZywUBV13SqKtCC4puzNn52RWM+cnCO9kCYMOgh21
         mBvqKv+e91DJCF3esURvn8BzXrdbjlac7hOaEhifhzfSU582VVKGqJM6xUUlF+RJbqO9
         mVkhzDgC/KSfFpCh2qtg3LblfL6jOTlewbVHSSPFs02uLBEAnu1edDVepQF6CncsNV7O
         3Zz03n9JqFMvAYSoAzvS0BFTUrtSKaVCO5ntvkOTmxX1T+cSM1q5mYBmuOqJmkV9g36M
         lI8L3oWlD8jBWiaaSiLNtyRlGafjjXYRGjc+YUKmxJ7X1PLs2rZ9dkiOCyOAy7rZU2Mt
         p/eQ==
X-Gm-Message-State: APjAAAVVUI102W3sSUuNWpXNqOn4MWV3MImZ3U+yKjCmMN0G0GhLe+2n
        UBv230ELHwE0fdAn7nYw2EnyQeNn
X-Google-Smtp-Source: APXvYqyn9GFzb7vPBX3mYtFnBb9YViKDiDhSa7YTEaDYzv0rMF3wYhamzXs2jYdFRN+OQ+l87OHL0w==
X-Received: by 2002:a2e:1415:: with SMTP id u21mr13244044ljd.22.1569859974665;
        Mon, 30 Sep 2019 09:12:54 -0700 (PDT)
Received: from xi.terra (c-51f1e055.07-184-6d6c6d4.bbcust.telenor.se. [85.224.241.81])
        by smtp.gmail.com with ESMTPSA id k23sm3410962ljk.93.2019.09.30.09.12.53
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 30 Sep 2019 09:12:53 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.92.2)
        (envelope-from <johan@xi.terra>)
        id 1iEyIF-0004uM-BW; Mon, 30 Sep 2019 18:13:00 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Pete Zaitcev <zaitcev@redhat.com>,
        Alan Stern <stern@rowland.harvard.edu>,
        linux-media@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>
Subject: [PATCH 0/4] USB: fix runtime PM after driver unbind
Date:   Mon, 30 Sep 2019 18:12:01 +0200
Message-Id: <20190930161205.18803-1-johan@kernel.org>
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

I guess Greg could take all of these directly through his tree, unless
the media maintainers disagree.

Johan


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

