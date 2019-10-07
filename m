Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F23D1CE335
	for <lists+linux-media@lfdr.de>; Mon,  7 Oct 2019 15:22:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727850AbfJGNVA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 7 Oct 2019 09:21:00 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:42472 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727010AbfJGNU7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 7 Oct 2019 09:20:59 -0400
Received: by mail-lj1-f193.google.com with SMTP id y23so13598979lje.9;
        Mon, 07 Oct 2019 06:20:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xBIWesDB/dHziUlCwEIGcihlRl2e0iqR/vgLz4iM0gA=;
        b=UEfJIDx+S84ZqS3QRTU+EZl7OoGdW05XHD+cGFcGnN4VB/9EFzI4U90d8/Vpn+dgoA
         wvGSdC2EPvEHZJVswIGz1Jrf66vAqZs3VJrmke7Zqe44NbfTTcty8276JlQHGFKTUifr
         LtHfyI+FYltauTXHOUPV1IE1beUfV69MWOkgxs6WAavkY7W8/iYqoInWQmnvEgnZQKAd
         flChV3zQNF4UMHsIZ4YoImObQyPIuMifrFf9YKkFopdpn5vOuOwbVwkV+dM0JMqHBxH9
         53zRId4x6LVgmaDPM64MlaAe3o6/SaEx4QxS3QR8xNGeOi9c2CsPzaTSWgl59T9fVtOq
         yZKw==
X-Gm-Message-State: APjAAAWqxthk4S4/wN3330Xg+9AO/S1xSTuYUEwjX4sfUbqeQ0T2NM9m
        il9RHnHJ9dTzT0CsiOVoxFQ=
X-Google-Smtp-Source: APXvYqy+1Vouvr0nCGZCYtloldzcM9zGlB30DFlleqe5rp/Y0T1KMISyN5/hmC8NdtNVveFz/accrg==
X-Received: by 2002:a2e:8507:: with SMTP id j7mr17858276lji.151.1570454456289;
        Mon, 07 Oct 2019 06:20:56 -0700 (PDT)
Received: from neopili.qtec.com (cpe.xe-3-0-1-778.vbrnqe10.dk.customer.tdc.net. [80.197.57.18])
        by smtp.gmail.com with ESMTPSA id z14sm2687360lfh.30.2019.10.07.06.20.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Oct 2019 06:20:54 -0700 (PDT)
From:   Ricardo Ribalda Delgado <ribalda@kernel.org>
To:     Pavel Machek <pavel@ucw.cz>, Sakari Ailus <sakari.ailus@iki.fi>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Ricardo Ribalda Delgado <ribalda@kernel.org>
Subject: [PATCH v7 0/6]  ad5820: Multiple fixes
Date:   Mon,  7 Oct 2019 15:20:38 +0200
Message-Id: <20191007132050.27298-1-ribalda@kernel.org>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

-Support for enable-pin, of-autoload, enable-gpios and ad5821 and ad5823

For some reason these patchset was lost in translation for a year ;)

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

