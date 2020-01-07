Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D966E131E0B
	for <lists+linux-media@lfdr.de>; Tue,  7 Jan 2020 04:43:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727440AbgAGDnl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Jan 2020 22:43:41 -0500
Received: from mail-pf1-f193.google.com ([209.85.210.193]:45585 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727295AbgAGDnk (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Jan 2020 22:43:40 -0500
Received: by mail-pf1-f193.google.com with SMTP id 2so27891652pfg.12;
        Mon, 06 Jan 2020 19:43:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gHUbb7q4zKarJa/jENsWhe5joUzhUsIi3+/OkwV0nCg=;
        b=NE5X04jTW9D4AAlZ1NLkRw5E9lCP2JS0FFDHcxeKeNssEwk0Mk+MrFridEDJinkcxq
         syLjplEhUDUrD8ygUiPRE9enG6yVswHHLvmVT2kvZS/klLV4fLBVu+c3K2OXJswU4afd
         9kIXv1MJ2R5GIvuXapD/4vTtXP60JPelynxOKGpuszywHtf6QU/F1JJ6tx2YkzGVMaop
         UC4Z5ZMiLbiG67W/X8Stcl2y83ASsmSXYLypJP+UVWCQt4rM1FMDNLhTtCPlX6FPvXD9
         I9pu0MoNcHR6B1pSIFLeoMD6/5OFVhTHALCAlBkg4EHpv6yPNsSoL2UeZvr9p6QwpFDP
         CnHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :mime-version:content-transfer-encoding;
        bh=gHUbb7q4zKarJa/jENsWhe5joUzhUsIi3+/OkwV0nCg=;
        b=OgMwkZ2WHhmU9sdJoSQDXgrYcNnIUJhTkMg2S642HTx8dfVnok74q55aAFkyzat5LV
         2UYn+39uhBTO05EJUaalAHGyfIzBF0Lr+wqU0EsWizV8irdu9v/lbH7ohP5MHzY2UTzK
         GOS0xdIMV991Zn2e9SygZ8lS60Riitf1dugLBsc0/pUUmqtsoAjm1MT69zb50DuCPpdG
         qvGw7tJIwMvgdF0RsvVD13uyvpnq5Mwc7cM1qOWCRiihg9aWak4B05RzlTQWrUoE5SOF
         QgW0N+DMfQGLbebK+kF03p6pmLMh71ZzZSIy4/I6ejJg4XsYohgkuzzbBj7PH9nLmW/w
         QY3w==
X-Gm-Message-State: APjAAAVWG/pggAbRPOnC+zkmpTpd1LS3flrehRAqDEyf9Ce/ijM/sdvO
        qTQL5Uv7Ki+lLZfExMTer+0=
X-Google-Smtp-Source: APXvYqzKmGQn30OyGYuc8Yfb7XzY/DQP1By/9LJ3V3cFnc8q3uPr3UXvgAaQ6v64km7Wwt3R6On/ZQ==
X-Received: by 2002:a63:ce55:: with SMTP id r21mr97706108pgi.156.1578368620173;
        Mon, 06 Jan 2020 19:43:40 -0800 (PST)
Received: from voyager.lan ([45.124.203.14])
        by smtp.gmail.com with ESMTPSA id g10sm73455929pgh.35.2020.01.06.19.43.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2020 19:43:39 -0800 (PST)
From:   Joel Stanley <joel@jms.id.au>
To:     Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>,
        Eddie James <eajames@linux.ibm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Andrew Jeffery <andrew@aj.id.au>, linux-media@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] video: aspeed video engine cleanups
Date:   Tue,  7 Jan 2020 14:13:21 +1030
Message-Id: <20200107034324.38073-1-joel@jms.id.au>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

When reviewing some patches from Jae I noticed the driver used compile
time tests for some registers. When thinking about how to avoid that, I
came up with a few cleanups.

Jae, feel free to base your patches on this series if you, Eddie and
Mauro are ok with the changes.

Joel Stanley (3):
  media: aspeed: Rework memory mapping in probe
  media: aspeed: Use runtime configuration
  video: aspeed: Update copyright information

 drivers/media/platform/aspeed-video.c | 73 ++++++++++++++++++---------
 1 file changed, 48 insertions(+), 25 deletions(-)

-- 
2.24.1

