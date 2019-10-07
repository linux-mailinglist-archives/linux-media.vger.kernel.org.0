Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7D229CE3A7
	for <lists+linux-media@lfdr.de>; Mon,  7 Oct 2019 15:29:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728081AbfJGN3D (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 7 Oct 2019 09:29:03 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:43661 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727324AbfJGN3C (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 7 Oct 2019 09:29:02 -0400
Received: by mail-lj1-f196.google.com with SMTP id n14so13621738ljj.10;
        Mon, 07 Oct 2019 06:29:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GUwqvYzDSTdSfMQoCXaG3dow07W7ol65UVuVyQZTU18=;
        b=nZkdOvh1joIOOII1patoJUc1cj/lQoH20c3LOtKLvLvtaiMdxG0ijjs77HyB27wAAn
         m8ahIOrhHrdXahb0QPoKjM/DunU6X6oz7XUBZJ8X1TKlE20eI1mILrdm3b8ParCpWLRd
         /LVaAHzsuBG267Ir8b+x2pNNPPWgWCKMRBvWD3i+8C+1R1iZfLvQ3syb+tqJ9Caj3UWW
         NoeY70ql5UDNU4BrdheKcqxj2kzK9KJFR8HjRZTUFw0G2n66EW832BNrimVOph0S0U7g
         hIpgli5XpVsP5hJw2QhZxtRVycKI6ebmPE5KCPv0i+3kFk29teJ92WxTW8ayBklNd7Cw
         Ejqg==
X-Gm-Message-State: APjAAAUFMHXuY3L+hoQ+F7M9S1HaPA3V1vD65nDZA1ih13jXL0lw05ds
        eM7i4e7jquDTcuPCKbIn9NI=
X-Google-Smtp-Source: APXvYqyE/GMVtDsrPH6ycVzjcqa83YXxFu+vG0JExAuyukA1gzNy5+AGj3hxzcoCl0e+YQOxdaReIw==
X-Received: by 2002:a2e:8199:: with SMTP id e25mr15068093ljg.246.1570454940758;
        Mon, 07 Oct 2019 06:29:00 -0700 (PDT)
Received: from neopili.qtec.com (cpe.xe-3-0-1-778.vbrnqe10.dk.customer.tdc.net. [80.197.57.18])
        by smtp.gmail.com with ESMTPSA id f22sm2702245lfk.56.2019.10.07.06.28.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Oct 2019 06:28:59 -0700 (PDT)
From:   Ricardo Ribalda Delgado <ribalda@kernel.org>
To:     Pavel Machek <pavel@ucw.cz>, Sakari Ailus <sakari.ailus@iki.fi>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Ricardo Ribalda Delgado <ribalda@kernel.org>
Subject: [PATCH v8 0/6] ad5820: Multiple fixes
Date:   Mon,  7 Oct 2019 15:28:50 +0200
Message-Id: <20191007132856.27948-1-ribalda@kernel.org>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

-Support for enable-pin, of-autoload, enable-gpios and ad5821 and ad5823

For some reason these patchset was lost in translation for a year ;)


v8: I screwed up sending v7, I sent it from a dirty directory
and clicked on send-all without checking what was under v7*. Sorry :(
This made patchwork very unhappy. I send v8 to make patchwork happy and
hopefuly also the maintainer. Sorry again

v7: Rebase on current media/master


Ricardo Ribalda Delgado (6):
  media: ad5820: Define entity function
  media: ad5820: DT new optional field enable-gpios
  media: ad5820: Add support for enable pin
  media: ad5820: Add support for of-autoload
  media: ad5820: DT new compatible devices
  media: ad5820: Add support for ad5821 and ad5823

 .../devicetree/bindings/media/i2c/ad5820.txt  | 11 +++++-
 drivers/media/i2c/Kconfig                     |  2 +-
 drivers/media/i2c/ad5820.c                    | 35 ++++++++++++++++---
 3 files changed, 42 insertions(+), 6 deletions(-)

-- 
2.23.0

