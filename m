Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 423F22D58E0
	for <lists+linux-media@lfdr.de>; Thu, 10 Dec 2020 12:06:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389194AbgLJK46 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 10 Dec 2020 05:56:58 -0500
Received: from mail.kernel.org ([198.145.29.99]:56182 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2389164AbgLJK4g (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 10 Dec 2020 05:56:36 -0500
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Authentication-Results: mail.kernel.org; dkim=permerror (bad message/signature format)
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 01/13] docs: conf.py: fix sphinx version detection for margin set
Date:   Thu, 10 Dec 2020 11:55:40 +0100
Message-Id: <0e610cbb57e85864b23d2b8fffa65c6b137daaac.1607597287.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1607597287.git.mchehab+huawei@kernel.org>
References: <cover.1607597287.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The PDF generator has a logic to detect the proper way to
setup the page margins. By default, the page has about
14.8 cm, which is too short to display some tables and literal
blocks. So, previous patches changed it to be around 17.5 cm,
but the logic only works with Sphinx version 1.x.x.

Fix it.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/conf.py | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/conf.py b/Documentation/conf.py
index ed2b43ec7754..66e121df59cd 100644
--- a/Documentation/conf.py
+++ b/Documentation/conf.py
@@ -375,9 +375,10 @@ if cjk_cmd.find("Noto Sans CJK SC") >= 0:
 if major == 1 and minor > 3:
     latex_elements['preamble']  += '\\renewcommand*{\\DUrole}[2]{ #2 }\n'
 
+# Set page margins
 if major == 1 and minor <= 4:
     latex_elements['preamble']  += '\\usepackage[margin=0.5in, top=1in, bottom=1in]{geometry}'
-elif major == 1 and (minor > 5 or (minor == 5 and patch >= 3)):
+elif (major == 1 and (minor > 5 or (minor == 5 and patch >= 3))) or (major > 1):
     latex_elements['sphinxsetup'] = 'hmargin=0.5in, vmargin=1in'
     latex_elements['preamble']  += '\\fvset{fontsize=auto}\n'
 
-- 
2.29.2

