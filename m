Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A28E6C9EBD
	for <lists+linux-media@lfdr.de>; Thu,  3 Oct 2019 14:46:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728336AbfJCMpp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Oct 2019 08:45:45 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:55849 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725827AbfJCMpp (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 3 Oct 2019 08:45:45 -0400
Received: by mail-wm1-f66.google.com with SMTP id a6so2153104wma.5;
        Thu, 03 Oct 2019 05:45:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=JwNDq6/SadVRzUHCqVoOmovQ7PK6KJzhM3n6l1+VwQw=;
        b=QLU9n8bBhqXmt8lGv7af64X51iGtqGBHhT0fkxfwZ8AAKxnLLqMws4iyMnkXs9cYTu
         mG04JBsDBVYAF0JFcKa2cXiKAH4R7nbS8s7tq5H6sV2P/YVzcphEHB8K/0s69tyJ0Q+N
         t5pTB8dSpXjhmB5A6cBp4IGHacuXTK4IIF6C9HqD5mUXoxG7V0A28WxmuUHZVDAnAL0m
         ZPhVj/o/8rk3GPHkShYLLYGksuaRUGa/JaQbja7qe69AkkxmIhtabIRKPYsHheYWpG45
         a1ec5v5s7aariSunAqS53SGjzTfT0XLm8LWmyFIitoFO8Uwafxl4cIDmgeKqUOu9zleA
         TWBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JwNDq6/SadVRzUHCqVoOmovQ7PK6KJzhM3n6l1+VwQw=;
        b=DLI7PTURMtobGDZDvU5C2/CGiUlACut4QL4NDLtTf+ijw65tCWJBkQOn16Yiav5FMk
         xFDylpX16Xqdhskw5X6B7VYeWNr6aLldk/OT3qjNEjEp1EavJubYlfkwNj6akMKGjgQ1
         rziUBak1ptdOD50OO1MDzgRxIDOKr5pXTdnJjzoaqq6gegzbvmfWu+gdgsBLaHcfbElX
         6y5Q2rhV6L0mp/EHcX+TWGPz+myMhSWvAQKvq91tWR0PaY2O4SluKbcll3k5v+rv0gi4
         cFfbyFAuC3DPDHc4DV9pOZ/VeDHRjnFJM/uNGQ/lH5W3vOGnrciZi9GtLyOqQpgjGB8E
         PFqg==
X-Gm-Message-State: APjAAAXAyKoY98st0686ZRpbhPkLEUbZpYLYTossoiADxUq1Yy3rsnf8
        kh1vxxk6E/ucvRPA/MBSi0Y=
X-Google-Smtp-Source: APXvYqzFVdDRYehCTkSXgwbUMPcJUvaLQ/qFVs0OlFYGCy22gnleF6yu+1qt/f9/WtiFnxJc6ATTEQ==
X-Received: by 2002:a1c:3904:: with SMTP id g4mr7134014wma.116.1570106743615;
        Thu, 03 Oct 2019 05:45:43 -0700 (PDT)
Received: from localhost.localdomain ([46.114.33.103])
        by smtp.googlemail.com with ESMTPSA id y3sm12880507wmg.2.2019.10.03.05.45.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Oct 2019 05:45:42 -0700 (PDT)
From:   Gon Solo <gonsolo@gmail.com>
To:     mchehab+samsung@kernel.org
Cc:     sean@mess.org, crope@iki.fi, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, Gon Solo <gonsolo@gmail.com>
Subject: [PATCH 0/3] Add support for Logilink VG0022A
Date:   Thu,  3 Oct 2019 14:45:29 +0200
Message-Id: <20191003124532.10945-1-gonsolo@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191003122027.GA2674@Limone>
References: <20191003122027.GA2674@Limone>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

These three patches make the Logilink VG0022A work.
Being cheap hardware a bogus chip version is returned but this is catched in
the driver.

Gon Solo (3):
  af9035: Better explain how i2c bus speed is computed.
  s2157: Handle bogus chip version.
  af9035: Add Logilink VG0022A id.

 drivers/media/tuners/si2157.c         | 19 ++++++++++++-------
 drivers/media/usb/dvb-usb-v2/af9035.c | 13 +++++++++----
 2 files changed, 21 insertions(+), 11 deletions(-)

-- 
2.20.1

