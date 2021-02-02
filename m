Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1EDAC30CB2B
	for <lists+linux-media@lfdr.de>; Tue,  2 Feb 2021 20:17:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239453AbhBBTPC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 2 Feb 2021 14:15:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60078 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239363AbhBBTNF (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 2 Feb 2021 14:13:05 -0500
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com [IPv6:2607:f8b0:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40770C061573
        for <linux-media@vger.kernel.org>; Tue,  2 Feb 2021 11:12:50 -0800 (PST)
Received: by mail-ot1-x329.google.com with SMTP id 36so20925636otp.2
        for <linux-media@vger.kernel.org>; Tue, 02 Feb 2021 11:12:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nextdimension-cc.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=aj3qcO3mlEHuGDjfgvkRMQXJBg27rVEcxkPoxKlJGq4=;
        b=2R8lWzidilFR5tCiYdE1derRcuhaodB3HSnBzYqicr5hyYhDveYqfUs1EGt7F2qXoc
         7YKTg9ghAmEa3mMPy+PiCTWyl2PuuZzF/SiJ6irSplbgK78yWTTxmaSVawbk15ndGakw
         DZzoRAUra+31t9L31uawTzVC8cIwfcC3LUm+dKj2TIyIgvqfmTNr5GeiaYONeANFpAGf
         A5pjk0dWpCvvAcU++nbz75Fe8OC16uughmVDst4Tz5/ArXewLls3aank/Uc1TFE3lPE1
         3YAZI4a/tJVUM9bSmMkdCvTR4/ZZvCu4Kzo7pbk+xpimL5ij+gOBPMjTwEU2nSkFVlYw
         yJ6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=aj3qcO3mlEHuGDjfgvkRMQXJBg27rVEcxkPoxKlJGq4=;
        b=pocI0eXg6Ep4fVcUG9UWTvKrbtUFQu2Jw1EDLWjaT3Pq9IwCCF0rEzb0HwmoR5gc2V
         QR3U61ihaTyqrcW7hrxZT+GZnqNiTbDJ7LkG0ILcg3d6FpiCzetz9NKYdHN/5TDRCNal
         053kclpuXnRh6/FKLjY1IcQH7PcJ///1/n8swMexIMWaB1fDv2pwMG3871DveG3E9qFl
         w6N35NZ1sLuH+uzPz5BLdhUn5Qz6Tq3Fu/h3cO8KfeW5aaKoyBmqKFAzYlHU9KVqIyES
         1e2Lgyq2ufDDMqwTkNJe1wLGDeb1rjcMlkBQsyqamwh5xgZMxshvlF6QNP3LMOeNSO0r
         I1Uw==
X-Gm-Message-State: AOAM531dClxsUcX1QSrd70PKETU8lWCdh3PqjhG8jHe2m1YE1xOw9CZ7
        y3cjoVSxSDLZ/HyVRDf8CAgzOVd9ZN6W+7WM
X-Google-Smtp-Source: ABdhPJzLQc6Q9MOdRKhpCMr89p+u63OYnXwshpg/npqDlzQt/TlhSHJzXBkmI8QPQi6pSSQxjNmUPA==
X-Received: by 2002:a9d:784a:: with SMTP id c10mr17453687otm.132.1612293169540;
        Tue, 02 Feb 2021 11:12:49 -0800 (PST)
Received: from localhost (66-90-181-52.dyn.grandenetworks.net. [66.90.181.52])
        by smtp.gmail.com with ESMTPSA id i24sm4912979oor.1.2021.02.02.11.12.48
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 02 Feb 2021 11:12:49 -0800 (PST)
From:   Brad Love <brad@nextdimension.cc>
To:     linux-media@vger.kernel.org, sean@mess.org, mchehab@kernel.org
Cc:     Brad Love <brad@nextdimension.cc>
Subject: [PATCH 0/2] em28xx: Add new bulk variant pids for Hauppauge 461e
Date:   Mon,  1 Feb 2021 19:40:28 -0600
Message-Id: <20210202014030.27466-1-brad@nextdimension.cc>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

To address issues with high bandwidth muxes all Hauppauge em28xx
devices are now being manufactured in bulk transport mode. To
signify a difference in the revision the new pid utilizes a 0x8000 mask.
This allows for easy conversion from original ISOC model to bulk
transport revision by an end user with a custom utility.

Patch 1/2 should be applied to linux-stable back as far as is currently
supported. 0x2013:0x0259 entered mainline in 3.14

For patch 2/2, 0x2013:0x4016 entered mainline at 5.7. It would appear
kernel 5.10 is the only maintained LTS is should be applied to.


Brad Love (2):
  em28xx: Add pid for bulk revision of Hauppauge 461e
  em28xx: Add pid for bulk revision of Hauppauge 461eV2

 drivers/media/usb/em28xx/em28xx-cards.c | 4 ++++
 1 file changed, 4 insertions(+)

-- 
2.28.0

