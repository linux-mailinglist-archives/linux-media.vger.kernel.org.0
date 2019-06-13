Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 35EF944738
	for <lists+linux-media@lfdr.de>; Thu, 13 Jun 2019 18:58:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729920AbfFMQ56 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 13 Jun 2019 12:57:58 -0400
Received: from mail-io1-f65.google.com ([209.85.166.65]:36696 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729914AbfFMA40 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 12 Jun 2019 20:56:26 -0400
Received: by mail-io1-f65.google.com with SMTP id h6so14620504ioh.3
        for <linux-media@vger.kernel.org>; Wed, 12 Jun 2019 17:56:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jkcj3BQbpEkEnqOK+uHZ7nr7fw6gEDD/oUsx/9wwTd4=;
        b=LqRWBI0hJrcjJzYAivHAYqULbk0CIycXU6i0jDc7csOonzYn6F/eeIy4evS/8Rw+EA
         sOzowtAp8cRe2oAXrmK2oANmfRCc1RlcIo4SgG47KhoiW2isPpYm/15picKHGP1JLbbD
         KvSfq6QRyOmULADX6DtLp/hFsQeg/7lf+TwiQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jkcj3BQbpEkEnqOK+uHZ7nr7fw6gEDD/oUsx/9wwTd4=;
        b=J0j06zwJNjFGGC23A2Ef9vF1W8f/V0ciYH8e96BlE1LLb1KFzBIzDPG+SX7tmnW9DC
         TkjAm2liHNu7TTsk3XjsHwGifpt/sN+aHwwTI2xirRdOczhlB38ybSLw6n3oDCStnwI9
         iTOunHrKJgxHRMAu/BIT5jI1WT/6XtRIo7cLPo5bt8Bl5+o/4DOxCsl49jc88tUbrBBd
         pMoZpcm8g37aE0k5ttYiZcBk5ujCBdKvsOwQnVghRVWQUcYsl35AA52uz4hit+CBloW3
         URTN5jfJe8aLC/G32usZRL34Mmdh7VvLBP+ymhqkt4MjpAZEZiaYPjl7Dvo+R75vXysS
         BH0Q==
X-Gm-Message-State: APjAAAWuD3fIptioJ24FYX8iNFOvcHLtuDor/aKS8DlV8px09iyGNh+R
        bVgJ8RaB60CSjIUpCMnoFAuQugc5OFo=
X-Google-Smtp-Source: APXvYqxvC3zECoViy2agAnshwbumcqgc2CkHnX9zeTiVO5ngljLDWmHjYttKZ6NbHlppewno3l4rFA==
X-Received: by 2002:a5d:9047:: with SMTP id v7mr34272949ioq.18.1560387385204;
        Wed, 12 Jun 2019 17:56:25 -0700 (PDT)
Received: from shuah-t480s.internal (c-24-9-64-241.hsd1.co.comcast.net. [24.9.64.241])
        by smtp.gmail.com with ESMTPSA id f71sm723185itc.5.2019.06.12.17.56.23
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 12 Jun 2019 17:56:24 -0700 (PDT)
From:   Shuah Khan <skhan@linuxfoundation.org>
To:     mchehab@kernel.org, hverkuil-cisco@xs4all.nl
Cc:     Shuah Khan <skhan@linuxfoundation.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] media: media.h: Fix shifting signed 32-bit value by 31 bits problem
Date:   Wed, 12 Jun 2019 18:56:20 -0600
Message-Id: <20190613005620.7362-1-skhan@linuxfoundation.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Fix MEDIA_ENT_ID_FLAG_NEXT to use "U" cast to avoid shifting signed
32-bit value by 31 bits problem. This isn't a problem for kernel builds
with gcc.

This could be problem since this header is part of public API which
could be included for builds using compilers that don't handle this
condition safely resulting in undefined behavior.

Signed-off-by: Shuah Khan <skhan@linuxfoundation.org>
---
 include/uapi/linux/media.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/uapi/linux/media.h b/include/uapi/linux/media.h
index 9aedb187bc48..383ac7b7d8f0 100644
--- a/include/uapi/linux/media.h
+++ b/include/uapi/linux/media.h
@@ -146,7 +146,7 @@ struct media_device_info {
 #define MEDIA_ENT_FL_CONNECTOR			(1 << 1)
 
 /* OR with the entity id value to find the next entity */
-#define MEDIA_ENT_ID_FLAG_NEXT			(1 << 31)
+#define MEDIA_ENT_ID_FLAG_NEXT			(1U << 31)
 
 struct media_entity_desc {
 	__u32 id;
-- 
2.17.1

