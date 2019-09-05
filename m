Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EB67DAAC97
	for <lists+linux-media@lfdr.de>; Thu,  5 Sep 2019 21:58:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391588AbfIET57 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 5 Sep 2019 15:57:59 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:58456 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388596AbfIET56 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 5 Sep 2019 15:57:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Sender:Content-Transfer-Encoding:
        MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=btp8OApGG/3UFKYYTxwfb9hcf8w0H2Q+kH4+OloUAmQ=; b=Mo0egFykTZYm3jAW18Ny4uIu0/
        os3uteHN//gSLMFWyQTtMjcyZ5rPrlhFwny4sc0p/KOc5OKVK5cpC/FcLnfh4Qj0SvCoeITdie5or
        Kg7Hn7oKL4brXaLz8lZ1wKnTmD2tz0+LrKhJ7FxYw/0ZEcA71LbQMKKzithJbdTEDS2QYorlA2txU
        dRtRNtkEYQ8jCsSdQMyzDeLq1qBEMf/ZtIYgJyq3rapo8xbxGDjabroWkeoe7MFz4F0AXxEF4r/A3
        wVao44R7iYYkrP/Ho6FHoRu/0A0yC7Qqn/f8QFheY3WEJaBmI+1zogti22c2a5R3tYnRwYcuwXkak
        sGLtS4Nw==;
Received: from [177.159.253.249] (helo=bombadil.infradead.org)
        by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
        id 1i5xtF-0000IF-Ce; Thu, 05 Sep 2019 19:57:57 +0000
Received: from mchehab by bombadil.infradead.org with local (Exim 4.92.1)
        (envelope-from <mchehab@bombadil.infradead.org>)
        id 1i5xtC-0005m8-Lu; Thu, 05 Sep 2019 16:57:54 -0300
From:   Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Mauro Carvalho Chehab <mchehab@infradead.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Joe Perches <joe@perches.com>, linux-kernel@vger.kernel.org,
        Jonathan Corbet <corbet@lwn.net>,
        Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@redhat.com>,
        Arnaldo Carvalho de Melo <acme@kernel.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Jiri Olsa <jolsa@redhat.com>,
        Namhyung Kim <namhyung@kernel.org>,
        Armijn Hemel <armijn@tjaldur.nl>,
        Allison Randal <allison@lohutok.net>,
        Thomas Gleixner <tglx@linutronix.de>
Subject: [PATCH 2/6] tools: perf: fix SPDX header in the light of PEP-263
Date:   Thu,  5 Sep 2019 16:57:49 -0300
Message-Id: <bd67fb319dcc2e7aabe853de5b37e97eda11c450.1567712829.git.mchehab+samsung@kernel.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <cover.1567712829.git.mchehab+samsung@kernel.org>
References: <cover.1567712829.git.mchehab+samsung@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

As stated at PEP-263, the coding tag should be at the first or
second line. On those two scripts, the tag is at the wrong line.

It also contains a separate e-macs line to tell it to consider
the file as a python one. Merge this with the encoding tag,
using the same coding line that we're using on other python files.

Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
---
 tools/perf/python/tracepoint.py | 3 +--
 tools/perf/python/twatch.py     | 3 +--
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/tools/perf/python/tracepoint.py b/tools/perf/python/tracepoint.py
index eb76f6516247..b7717b501fd8 100755
--- a/tools/perf/python/tracepoint.py
+++ b/tools/perf/python/tracepoint.py
@@ -1,7 +1,6 @@
 #! /usr/bin/python
+# -*- coding: utf-8; mode: python -*-
 # SPDX-License-Identifier: GPL-2.0
-# -*- python -*-
-# -*- coding: utf-8 -*-
 
 import perf
 
diff --git a/tools/perf/python/twatch.py b/tools/perf/python/twatch.py
index ff87ccf5b708..a95e59373ebd 100755
--- a/tools/perf/python/twatch.py
+++ b/tools/perf/python/twatch.py
@@ -1,7 +1,6 @@
 #! /usr/bin/python
+# -*- coding: utf-8; mode: python -*-
 # SPDX-License-Identifier: GPL-2.0-only
-# -*- python -*-
-# -*- coding: utf-8 -*-
 #   twatch - Experimental use of the perf python interface
 #   Copyright (C) 2011 Arnaldo Carvalho de Melo <acme@redhat.com>
 #
-- 
2.21.0

