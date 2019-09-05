Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0E9C6AAC95
	for <lists+linux-media@lfdr.de>; Thu,  5 Sep 2019 21:58:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391580AbfIET56 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 5 Sep 2019 15:57:58 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:58454 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388357AbfIET56 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 5 Sep 2019 15:57:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Sender:Content-Transfer-Encoding:
        MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=Es/zISrtwllZAcTDfnj7OAQJAy+Bnf95m2mw7+BsncA=; b=cRUQgJXyebsUtHonyp0KxzifBH
        WglPXPcpQ/tfLzvGpVcV8nitEA4RYBci9KhrGdaTMBQuneXeGyrnRlpEpTOncpRDfrdZ+xQgdDaUG
        IEj53CSxz0Q7OmCTXdW1YlexxFQQzsFLCj6gHmxBIWo7Uglgt/ipRI0JSwesg9s2ATpAd9R547Gwa
        eLPNjxXk2XEt/GCA5PP430YL2f+mUGJsG17K/tRohChOHwTgggbb6dbPwmKvUOEPvrzQJ6as2QlfM
        jb0yhBWgB1+RumQLT8g/yLeXKx5GMt2EdNyq8V+NPU41Ab8WWH1IISteSEv9wQ/Y46uwaNILtNRO7
        BLPrG5KQ==;
Received: from [177.159.253.249] (helo=bombadil.infradead.org)
        by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
        id 1i5xtF-0000IE-CY; Thu, 05 Sep 2019 19:57:57 +0000
Received: from mchehab by bombadil.infradead.org with local (Exim 4.92.1)
        (envelope-from <mchehab@bombadil.infradead.org>)
        id 1i5xtC-0005mC-Mj; Thu, 05 Sep 2019 16:57:54 -0300
From:   Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Mauro Carvalho Chehab <mchehab@infradead.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Joe Perches <joe@perches.com>, linux-kernel@vger.kernel.org,
        Jonathan Corbet <corbet@lwn.net>,
        Doug Smythies <doug.smythies@gmail.com>,
        "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        Allison Randal <allison@lohutok.net>,
        Thomas Gleixner <tglx@linutronix.de>
Subject: [PATCH 3/6] tools: intel_pstate_tracer.py: fix SPDX header in the light of PEP-263
Date:   Thu,  5 Sep 2019 16:57:50 -0300
Message-Id: <51e941b6b028ed619dfa93e29ab0c2930050af5b.1567712829.git.mchehab+samsung@kernel.org>
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

Place it at the right place and use the same kind of line that we're
using on other python scripts that also work fine with emacs.

Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
---
 tools/power/x86/intel_pstate_tracer/intel_pstate_tracer.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/power/x86/intel_pstate_tracer/intel_pstate_tracer.py b/tools/power/x86/intel_pstate_tracer/intel_pstate_tracer.py
index 2d6d342b148f..1009be489f9a 100755
--- a/tools/power/x86/intel_pstate_tracer/intel_pstate_tracer.py
+++ b/tools/power/x86/intel_pstate_tracer/intel_pstate_tracer.py
@@ -1,6 +1,6 @@
 #!/usr/bin/python
+# -*- coding: utf-8; mode: python -*-
 # SPDX-License-Identifier: GPL-2.0-only
-# -*- coding: utf-8 -*-
 #
 """ This utility can be used to debug and tune the performance of the
 intel_pstate driver. This utility can be used in two ways:
-- 
2.21.0

