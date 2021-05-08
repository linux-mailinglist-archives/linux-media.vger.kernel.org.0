Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 95712377204
	for <lists+linux-media@lfdr.de>; Sat,  8 May 2021 15:17:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230488AbhEHNSB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 8 May 2021 09:18:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43988 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230438AbhEHNSA (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 8 May 2021 09:18:00 -0400
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4E14C061574;
        Sat,  8 May 2021 06:16:57 -0700 (PDT)
Received: by mail-lj1-x22b.google.com with SMTP id y9so15084585ljn.6;
        Sat, 08 May 2021 06:16:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=uQGOlx1y8xhrLtj22U5j8Zg9KBmr0pSSDAjHsnxb01o=;
        b=I5kjCO5ApJPpGf7tUK7/V1OjgeR5svT6W8embMQCIl5sIXvbS1ARPasMPams9FE71w
         kI4yrYQEWVtNTstGR53mTeAOXQr5/gZWrhz+tMR5hhGmboA2I4mvTtNHIeTYdnUg+Hrm
         L1n97AOuHhWmjPzJvYC5qrbGuvt0kY1E6b1gE8JSL5WinNjV0s2q6I7Rn60Mo+Ad9TCW
         UFdqobc+p6FjEKCbWPCB0WF//qEOqbXMS1yPfGuz2XaUUNHaK3PIMUqPIzuo69UgoWry
         ac9kB3Oy/yoAXhxi02drTvpoe5GUTSl0FsAPeGNL8FoO0aDwIRQCxGShXaH6xfVmVDQZ
         rlzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=uQGOlx1y8xhrLtj22U5j8Zg9KBmr0pSSDAjHsnxb01o=;
        b=r5w5j14ya/bRfpTyLKRX+ZLD4sIi0C/NNvESPTVcHH6wbRubATSJT5plEuT6NDhz0Z
         ar0a5s87YLsFXtuMxz+W5QLsk2vZBJjFi9jiz8CPHgHjttoCair3703qClPMSjGyOOrC
         x4he7nJ6agxgkIqbZu8kt0wr02Dd2KmSpBk1n1qSZX0/sMFhuZf63rEKdMdqjtq8sN2i
         ny4GwimVYrfBl0OYviYmyNOt0LgYi85pBjn/bi9YVlGSxeUR5PfoumfV5KZGLPZ8PXyL
         ZcnnXbEmIBBoq6s3rpUSZqZVHRsaGY+g+Ifc6Ub2IU9izNVmX2ebkMyIpHloBGe51YP3
         9BXg==
X-Gm-Message-State: AOAM532XJTRwWMKBt5bBjN6jtpt87mKejzYfT1HNJ9soqSl8eHOksHBl
        MdhTUpzeRa+pBTJGSrBAKUc=
X-Google-Smtp-Source: ABdhPJx9n8nzZvFCVZh3ez6MBbSoJMwUFIQI79Clvmm8Ib7vky89gPqJbIk1Fkk43axempwQRXKnVA==
X-Received: by 2002:a2e:7a09:: with SMTP id v9mr12485962ljc.33.1620479816024;
        Sat, 08 May 2021 06:16:56 -0700 (PDT)
Received: from localhost.localdomain ([185.215.60.119])
        by smtp.gmail.com with ESMTPSA id p2sm1138376lfc.115.2021.05.08.06.16.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 May 2021 06:16:55 -0700 (PDT)
From:   Pavel Skripkin <paskripkin@gmail.com>
To:     mchehab@kernel.org, sakari.ailus@linux.intel.com,
        gregkh@linuxfoundation.org
Cc:     linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org, Pavel Skripkin <paskripkin@gmail.com>
Subject: [PATCH v4 0/3] staging: media: atomisp: code clean up
Date:   Sat,  8 May 2021 16:16:47 +0300
Message-Id: <cover.1620479607.git.paskripkin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210508124334.GA1403@agape.jhs>
References: <20210508124334.GA1403@agape.jhs>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This patch series include code clean up for input_system.c.

Changes from v4:
  Fixed commit message in 3rd patch

Changes from v3:
  Removed returns at the end of void functions
  Split all changes into 3 patches

Changes from v2:
  Removed useless returns


Pavel Skripkin (3):
  staging: media: atomisp: remove useless breaks
  staging: media: atomisp: remove dublicate code
  staging: media: atomisp: remove useless returns

 .../hive_isp_css_common/host/input_system.c   | 62 -------------------
 1 file changed, 62 deletions(-)

-- 
2.31.1

