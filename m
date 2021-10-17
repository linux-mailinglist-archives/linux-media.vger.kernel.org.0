Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 002BC430AB3
	for <lists+linux-media@lfdr.de>; Sun, 17 Oct 2021 18:25:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344241AbhJQQ1N (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 17 Oct 2021 12:27:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36232 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344217AbhJQQ1M (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 17 Oct 2021 12:27:12 -0400
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4965CC061765;
        Sun, 17 Oct 2021 09:25:03 -0700 (PDT)
Received: by mail-pl1-x636.google.com with SMTP id l6so9600388plh.9;
        Sun, 17 Oct 2021 09:25:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=va1wOEK7prq0g6xbMM0ouEtB510a8wuP54vz2v0aIcY=;
        b=GcLww3LN2g8DJDDSHxZm7EUvgM99s3wD5LI+OpFaDduYIS7FQuENACFR/JWHyduY1W
         HHbFm4kQRYm0hYGCnccoMoVroZFbGjBMwS2Vh7MtEOyinyjwqhNtqgqs7eF/QVT8pYeR
         gq9UGBjhFMZ6eECqIzaNzLdXKRGOhwCk+w6gTJA6CrMhj1M7Ta0KAqQvQv0FSA9b7tVG
         hpf6bwTLOox2Mh88rJsl2vj6me9HCOMp8BAyzOZ+qYVdPGsyogvFaFsTp5N/lFTFCZLi
         c6mh8MYxG185HiaqxlhgXCI97ZTo40XSacdHoSWQtXzXon2WTw00MVBJ8OiSn6X0o3aR
         xnbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=va1wOEK7prq0g6xbMM0ouEtB510a8wuP54vz2v0aIcY=;
        b=Dhtto60tpoTHavCCz6uHDHNS+YCVF8cprjPKgHvnCjvZKPziSPyTUk6MzQ403lQdlQ
         edr6IgfxvoDGjpiRM28NlpFcqLRHBuD9z93Mjss8efYNNijw4Pz/XBTEjgTh5OWqbrb6
         +jvw57iitOCQzJBMdavLq3TffB/krvSUINS97eZ4mDQvtvsEMma7ARAF7aruWT58LGPZ
         6Hz54SfBLzqqY9rTUj8TphwmQI4Zd6EGC1yEzYk6qJrHoHpwPNnbHHwPwOGUa1+CzOMK
         BJXRHflaHeQ2ZBIScryGAWjzHnfYUh6jqS9sQ1ZUiZlAKaqlSpHUIFVYeGVjWABUBT2C
         +9MQ==
X-Gm-Message-State: AOAM533YPN3DawFy2VkeI1US0TbBAD2zph9AR6fFYy0PSFdNijivoKNz
        1wDOGr7HHtuWUoHy5pWfRDpgK7Ps4GQ9QA==
X-Google-Smtp-Source: ABdhPJwrgPLl1nNNQaWQMXtYN4uy23b/Hi1FG6PMsJgEmMSwZ6zbKOqr+ApFspjeujU5Ii3v0lU/HA==
X-Received: by 2002:a17:90b:3588:: with SMTP id mm8mr42281447pjb.238.1634487902794;
        Sun, 17 Oct 2021 09:25:02 -0700 (PDT)
Received: from sbwpb-arch.flets-east.jp ([2400:4052:6980:3800:dba7:2b1f:3f26:a5ec])
        by smtp.gmail.com with ESMTPSA id f30sm10814332pfq.142.2021.10.17.09.24.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Oct 2021 09:25:02 -0700 (PDT)
From:   Tsuchiya Yuto <kitakar@gmail.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Patrik Gfeller <patrik.gfeller@gmail.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@kernel.org>,
        Kaixu Xia <kaixuxia@tencent.com>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        Arnd Bergmann <arnd@arndb.de>, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [BUG 5/5] [BUG] media: atomisp: atomisp causes touchscreen to stop working on Microsoft Surface 3
Date:   Mon, 18 Oct 2021 01:23:36 +0900
Message-Id: <20211017162337.44860-6-kitakar@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211017162337.44860-1-kitakar@gmail.com>
References: <20211017162337.44860-1-kitakar@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Touchscreen input works fine before loading atomisp driver on Surface 3.

However, after loading atomisp driver, touchscreen works only when
capturing images. This sounds like atomisp turns off something needed
for touchscreen when atomisp is idle.

There is no useful kernel log. Just the touchscreen stops working
with no log.

I'll update if I find something further. First of all, can someone
reproduce this issue on the other devices?
-- 
2.33.1

