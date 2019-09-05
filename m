Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7A5AEAA0C2
	for <lists+linux-media@lfdr.de>; Thu,  5 Sep 2019 13:01:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388070AbfIELBe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 5 Sep 2019 07:01:34 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:48338 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731928AbfIELBe (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 5 Sep 2019 07:01:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Sender:Content-Transfer-Encoding:
        MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=btp8OApGG/3UFKYYTxwfb9hcf8w0H2Q+kH4+OloUAmQ=; b=H4AC6QROK9gZD7qqfPt1CtNbki
        vM/KrHR5a1dm7r1QFR9/MQAwj5yh09N+8A8sHcbiX+XjSwAtdT6wXJytkwdLetzLleQ7ndgD8gEuE
        7iU70EgH+OES4UfasNZYXgMfNKe2BFz+x10Ev6p+gG0aBGOmVL+PHODqcbMgIyPIF0x1GP6v+MtP0
        d112pnrU7WXlgFdaRgfJ+4PxUVa6llwdOVKL2qTaQmQ0k2z/YdcJgAUWP7/4xkwF4KLA2WfUX7LyF
        ODEuYJuQi4iPKlXCbFKZHlOZHRwHVCVRhigviN5iHNjUMQcszOgP3VWGlvJUQURFgRcDvtTkHqzS6
        z+meT36A==;
Received: from 177.17.137.173.dynamic.adsl.gvt.net.br ([177.17.137.173] helo=bombadil.infradead.org)
        by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
        id 1i5pW8-0003aa-Rv; Thu, 05 Sep 2019 11:01:32 +0000
Received: from mchehab by bombadil.infradead.org with local (Exim 4.92.1)
        (envelope-from <mchehab@bombadil.infradead.org>)
        id 1i5pW6-000310-KU; Thu, 05 Sep 2019 08:01:30 -0300
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
        Thomas Gleixner <tglx@linutronix.de>,
        Allison Randal <allison@lohutok.net>,
        Armijn Hemel <armijn@tjaldur.nl>
Subject: [PATCH 2/3] tools: perf: fix SPDX header in the light of PEP-263
Date:   Thu,  5 Sep 2019 08:01:28 -0300
Message-Id: <7df6e8b3afa04c350a795a366ac9d6fbb7f31980.1567681249.git.mchehab+samsung@kernel.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <d1331081c206afb4ba71e07d5b11a67896cbd99f.1567681249.git.mchehab+samsung@kernel.org>
References: <d1331081c206afb4ba71e07d5b11a67896cbd99f.1567681249.git.mchehab+samsung@kernel.org>
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

