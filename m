Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 500783D2325
	for <lists+linux-media@lfdr.de>; Thu, 22 Jul 2021 14:13:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231853AbhGVLcf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 22 Jul 2021 07:32:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42518 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231824AbhGVLc2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 22 Jul 2021 07:32:28 -0400
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E24D6C0613C1
        for <linux-media@vger.kernel.org>; Thu, 22 Jul 2021 05:13:02 -0700 (PDT)
Received: by mail-wm1-x333.google.com with SMTP id 14-20020a05600c028eb0290228f19cb433so1448535wmk.0
        for <linux-media@vger.kernel.org>; Thu, 22 Jul 2021 05:13:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=52MfpyqjokIGwcHAbxbTdslNqMBGmWn7imp1R+Sfufg=;
        b=QI7fNxqRsS4P7U4DU8JkdrkP2NMfeVSldHtiJUfgnBKbC8v+8182QfDezPtmkIgXFV
         thWSRx3NwstpCBUaGQ3237xMJXOJt2TLtl1RaubfTCZhmZHekXlPNYDowfUsvpkWii6+
         ulVcrYS2Aj9nciiOsStc1dNAlnr7JanEfIE4H/XGL4dMOKBz5ejPLQkYG7hIQbLHKr6M
         yi6pa6lssNI3d5VKEaAtShYaT7VZfQKuP1IM7sW2vlcIzCuPpQHKuQsqXgjtSkSamGdO
         ElatVJo0E2rPoevRoOK054FVup9GKQUqFba5nEtnxL3clfCJfgHj3T9kNpbRRikuhKyv
         xY7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=52MfpyqjokIGwcHAbxbTdslNqMBGmWn7imp1R+Sfufg=;
        b=J/V7GtOCkhA7d74O3LsJaLqFUaw5GCOCG8dFuf/Lmv9FGD+CSbxrhu8oOrpancx+mZ
         VBxRRHVSM2RzCEiUdEjgbIAeEnQgHwlASXmv+GIXSmwcMV1Rgw5Q1+Qebzp1u919NxNM
         fHkc95NPfQYYSHJ0bZBUFT9IW4Jvt0HCjNr/oSEjPesmoODI1Ew/NJLV3OJZdY/mUHny
         LMPA0SjgCtWiohut+2PU7xHF2CMNGabozrBkup3Z04VB5GyVYn1nyYk9hHppJjXSdS1k
         9BxuXApiNHOkTiLI3tusM+OvCQWK+ztKdSdpzwryXs3p1419VCqsfIUd4vurCTbnSE5V
         uG5Q==
X-Gm-Message-State: AOAM533tZ5o1/zoozJ2bIFv3BP5jo5G6F/UalkV7CtsaOSX/W1BrbHKH
        32bYIhMCYjgPThmftLtvokdSrU1CF6Kcgw==
X-Google-Smtp-Source: ABdhPJy/Grd8DplsB/n4C0l3rd21anapHB55iNRs+b6IwT2lMKHbthgNuwIzJxoUHMQH46hHDjlOdQ==
X-Received: by 2002:a1c:7707:: with SMTP id t7mr8927223wmi.186.1626955981303;
        Thu, 22 Jul 2021 05:13:01 -0700 (PDT)
Received: from davidp-xps-13.pitowers.org ([2a00:1098:3142:14:b918:b36f:9ba:b778])
        by smtp.gmail.com with ESMTPSA id e8sm8448228wrc.6.2021.07.22.05.13.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jul 2021 05:13:00 -0700 (PDT)
From:   David Plowman <david.plowman@raspberrypi.com>
To:     linux-media@vger.kernel.org, sakari.ailus@iki.fi,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     David Plowman <david.plowman@raspberrypi.com>
Subject: [PATCH v3 0/2] New V4L2 controls V4L2_CID_NOTIFY_GAIN_XXX
Date:   Thu, 22 Jul 2021 13:12:47 +0100
Message-Id: <20210722121249.16483-1-david.plowman@raspberrypi.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi

Sorry for the delay with these patches, I think my previous attempt
didn't cast the email net wide enough and they got rather lost - my
apologies!

Anyway, this version addresses the feedback I had received originally,
so thank you for that. Therefore:

* The values are now specified to be linear gains.

* The default value is defined to be the value that is equivalent to a
  gain of 1x.

* I think there was a minor comment over the repetitiveness of the
  documentation, so I've tried to address that too.

Thanks very much and best regards

David

David Plowman (2):
  media: v4l2-ctrls: Add V4L2_CID_NOTIFY_GAIN_XXX controls
  media: v4l2-ctrls: Document V4L2_CID_NOTIFY_GAIN_XXX controls

 .../media/v4l/ext-ctrls-image-source.rst      | 25 +++++++++++++++++++
 drivers/media/v4l2-core/v4l2-ctrls-defs.c     |  4 +++
 include/uapi/linux/v4l2-controls.h            |  4 +++
 3 files changed, 33 insertions(+)

-- 
2.30.2

