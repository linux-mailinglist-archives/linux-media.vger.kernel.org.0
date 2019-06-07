Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5557038663
	for <lists+linux-media@lfdr.de>; Fri,  7 Jun 2019 10:35:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727057AbfFGIfa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 7 Jun 2019 04:35:30 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:38877 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726671AbfFGIf3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 7 Jun 2019 04:35:29 -0400
Received: by mail-pf1-f196.google.com with SMTP id a186so781716pfa.5
        for <linux-media@vger.kernel.org>; Fri, 07 Jun 2019 01:35:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GOLXUpq3s4svc3Cb5o0cuO6zNdr2zIZ53GxxO13HULA=;
        b=cNtJuPJdBf+76+FIHXRqrb62Gu0a3W5bwRWSGq/Awpg612ChWmX34W/4ee+7sMq6cB
         OdsiTvGx/uswbz32NfXfuf9d0wREnzw5qCeujamyKkTpviW94LFzkTawp0gw1n6MZdyf
         azN9VWlvdHaocIMwVVa5KskNRl++9A5zAlswQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GOLXUpq3s4svc3Cb5o0cuO6zNdr2zIZ53GxxO13HULA=;
        b=srWKjvmh6j/JVeFyTbP0Ou4JsQPZoER8Ksxqw40jJzrhsTLXAN5Ef4b41uHzJfrAjK
         j5zoFB0bYbj+Ebv7bC1U6j56OekUOM9GJRInbzvF+1yhQdmXAjh+9S7bfLH4egDZtIWb
         7WJfWg8Om6gspmX4tMm4RwB9YhZXYIYnCWkNAeGBbPWVcg1P3mzEAnck8wQ6oRNjEOWh
         hoZ06W4jf+l1DwbBsl93mch01wjufa7S4Q7uOiyDnsCITMaODDnyB6RdH97kI0iGamiW
         AfCXhe7SUzgP2zjPirvzm2V2f6CPvSQ/3EQuRszTfnIPlwqrci7SUMvfKRmcZL8cS5Ps
         Flfg==
X-Gm-Message-State: APjAAAWeh5nRzQSweP/47Jpm6IwEpOlbT6Ll4rIEBzwAy0B00Jaa7Dpc
        IFd9WZs0aUzzuSi/OabhmJ2UeEBsrIuM+Q==
X-Google-Smtp-Source: APXvYqyQFIagXtjKC+oKCI13OrcGrXZcIXeRXH0yCpp8sYK+T78yBASGcqSO+GyLmvngeJ8aX5FkvA==
X-Received: by 2002:a17:90a:a410:: with SMTP id y16mr4268037pjp.62.1559896528709;
        Fri, 07 Jun 2019 01:35:28 -0700 (PDT)
Received: from tfiga.tok.corp.google.com ([2401:fa00:4:4:6d27:f13:a0fa:d4b6])
        by smtp.gmail.com with ESMTPSA id l13sm1240509pjq.20.2019.06.07.01.35.26
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 07 Jun 2019 01:35:28 -0700 (PDT)
From:   Tomasz Figa <tfiga@chromium.org>
To:     linux-media@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        =?UTF-8?q?Pawe=C5=82=20O=C5=9Bciak?= <posciak@chromium.org>,
        Pawel Osciak <pawel@osciak.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Tomasz Figa <tfiga@chromium.org>
Subject: [PATCH] MAINTAINERS: media: Add Tomasz Figa as a videobuf2 reviewer
Date:   Fri,  7 Jun 2019 17:35:18 +0900
Message-Id: <20190607083518.90078-1-tfiga@chromium.org>
X-Mailer: git-send-email 2.22.0.rc1.311.g5d7573a151-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

I tend to review most of the vb2 patches anyway and we need some active
reviewers, so let add me to the MAINTAINERS file as such.

Signed-off-by: Tomasz Figa <tfiga@chromium.org>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 98cd84977350..b5f65f61becb 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -16758,6 +16758,7 @@ VIDEOBUF2 FRAMEWORK
 M:	Pawel Osciak <pawel@osciak.com>
 M:	Marek Szyprowski <m.szyprowski@samsung.com>
 M:	Kyungmin Park <kyungmin.park@samsung.com>
+R:	Tomasz Figa <tfiga@chromium.org>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 F:	drivers/media/common/videobuf2/*
-- 
2.22.0.rc1.311.g5d7573a151-goog

