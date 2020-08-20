Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 055E124BD1D
	for <lists+linux-media@lfdr.de>; Thu, 20 Aug 2020 14:59:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729269AbgHTM7Q (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 20 Aug 2020 08:59:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32948 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728857AbgHTM7J (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 20 Aug 2020 08:59:09 -0400
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80C11C061345
        for <linux-media@vger.kernel.org>; Thu, 20 Aug 2020 05:58:36 -0700 (PDT)
Received: by mail-wm1-x336.google.com with SMTP id t14so1504714wmi.3
        for <linux-media@vger.kernel.org>; Thu, 20 Aug 2020 05:58:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=bjjzUyjqxUTgADSqZ4AEGlgmQLd6hH97YwJfRgNRrW4=;
        b=RRO5W51xetH2hSun5LBxUXBN+1ILaB2b2Woui8OkARAIJOlWdAQPA7dyKZnP5p75IR
         HtXeQut75Cu1xU071fRPLL2WhuwWTLGPbpEUHf4Nocft9Nn8RF5eXeCU1+s4NMqG1hzF
         s/MSh2oHQLOWDc2mz55ji2AgsvjxWddxefAUs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=bjjzUyjqxUTgADSqZ4AEGlgmQLd6hH97YwJfRgNRrW4=;
        b=QkIyny9QFkwvLCEVR5hEk6qhtqI2iC8gzn1tq1vJbKIqWooPDrpeDLtxlpxcOeuxVI
         kyuqfhpLQl03Sxx9UQqQzktOYb8CDxy9X1ihW/WrQbnanTca+Tk+veYu5ttD+2XyB4TN
         7wWp64xqdfKJpnDmvW5qqoc20A7GUoEayNMmrjVrRAMKgvLO3ciUUSdpMDR4cKqP+TrW
         aUTYWOFuGWo2RN1waSK9LWPCtiPhSOWRCsXmW562s2GckIKY+IPnyV0D12Cy1gVjx48a
         YA9sTwczDrz1ayLsAQjTmJlszuZge/F5kS74HDsZYw7Vl9Y5dVMUG8Wy6kZJxbcvlkV5
         8MAw==
X-Gm-Message-State: AOAM5333w98hENMWoZUrxZ5BbYoh0DzxWXDljl4jxRAAksgt83EVCkpG
        m7KPoFGr7BUnZRn+zl7n43CXtTBPJVCHTTU8
X-Google-Smtp-Source: ABdhPJxBvtfxib5dNL686AtnsEgnavbEPNHEvjkC1eMzOzqRPR+lmo2H3iHzsR6k2KoeFiZn1iJ/wQ==
X-Received: by 2002:a05:600c:224e:: with SMTP id a14mr3518439wmm.80.1597928309945;
        Thu, 20 Aug 2020 05:58:29 -0700 (PDT)
Received: from tfiga.c.googlers.com.com (88.140.78.34.bc.googleusercontent.com. [34.78.140.88])
        by smtp.gmail.com with ESMTPSA id o66sm4517760wmb.27.2020.08.20.05.58.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2020 05:58:29 -0700 (PDT)
From:   Tomasz Figa <tfiga@chromium.org>
To:     linux-media@vger.kernel.org
Cc:     Mauro Carvalho hehab <mchehab+huawei@kernel.org>,
        linux-kernel@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>,
        =?UTF-8?q?Pawe=C5=82=20O=C5=9Bciak?= <posciak@chromium.org>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Pawel Osciak <pawel@osciak.com>,
        Tomasz Figa <tfiga@chromium.org>
Subject: [PATCH 0/3] Clean the videobuf2 maintainer list
Date:   Thu, 20 Aug 2020 12:58:22 +0000
Message-Id: <20200820125825.224788-1-tfiga@chromium.org>
X-Mailer: git-send-email 2.28.0.220.ged08abb693-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Currently the MAINTAINERS file lists 3 maintainers and 1 reviewer for
the VIDEOBUF2 FRAMEWORK entry. From the list, two people have been
inactive for several years. This series tries to clean the list to
ensure that the framework has only active maintainers.

The series proposes removing Kyungmin Park and Pawel Osciak from the
maintainers list. I know both of the people in person and am well aware
of their achievements for the framework in the past. However, the
framework needs to move forward and thus, it needs active maintainers.

Therefore, I'd like the people in question to comment on their plans
regarding the maintenance of this framework or lack of thereof (and thus
being fine with the removal).

Tomasz Figa (3):
  MAINTAINERS: Make Tomasz the main maintainer of videobuf2
  MAINTAINERS: Remove Kyungmin from the maintainers list of videobuf2
  MAINTAINERS: Remove Pawel from the maintainers list of videobuf2

 MAINTAINERS | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

-- 
2.28.0.220.ged08abb693-goog

