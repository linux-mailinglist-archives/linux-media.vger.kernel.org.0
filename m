Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EBCC7381DF6
	for <lists+linux-media@lfdr.de>; Sun, 16 May 2021 12:18:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235039AbhEPKUH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 16 May 2021 06:20:07 -0400
Received: from mail.kernel.org ([198.145.29.99]:37632 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230460AbhEPKTw (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sun, 16 May 2021 06:19:52 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6A1DE611B0;
        Sun, 16 May 2021 10:18:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1621160317;
        bh=vAsWsVaNiWeXZMG2ChkHaeM/crfIX9zFJo3VbTPS//Q=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=LIuU7emlEXMnoqjnou+bjfWHr71DvZqbduFKpVc0sf7jx0ObYsx2JFkAFTHOTsBzK
         x4ElE9qZx8OF5RHSwUlvKYYr28ZBSy0TcDhkuQ3UEq29/1z7lcBwuP6SC2QL4Hxv0g
         G2TYAZbywyJlTdu7Xb+FuT0upJA8mwkZf1d+JER2XLg+eJHeSwDOSIbV/HPVCFBunM
         4JIHWGHo0Z9k+M1GCvBmac4U9VGEPfGpNhp526N3h9fwvwOKso3aZDK49exX+Ebo2w
         zbWN3oIorw24kI+dspBBp0fDqbX+Nry/JZ4LeiizTo1D6SsBKcP2Zpff9bA+Gfs4Ui
         Q4LdI1J8x3J4A==
Received: by mail.kernel.org with local (Exim 4.94.2)
        (envelope-from <mchehab@kernel.org>)
        id 1liDr1-003o8S-CA; Sun, 16 May 2021 12:18:35 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        "Jonathan Corbet" <corbet@lwn.net>,
        Corentin Labbe <clabbe@baylibre.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        mjpeg-users@lists.sourceforge.net
Subject: [PATCH v3 05/16] docs: driver-api: media: drivers: zoran.rst: replace some characters
Date:   Sun, 16 May 2021 12:18:22 +0200
Message-Id: <fb2e971bc2fa4ed1e6f0d5aae6260191ff64c883.1621159997.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1621159997.git.mchehab+huawei@kernel.org>
References: <cover.1621159997.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The conversion tools used during DocBook/LaTeX/html/Markdown->ReST
conversion and some cut-and-pasted text contain some characters that
aren't easily reachable on standard keyboards and/or could cause
troubles when parsed by the documentation build system.

Replace the occurences of the following characters:

	- U+00ad ('­'): SOFT HYPHEN
	  as ASCII HYPHEN is preferred over SOFT HYPHEN

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/driver-api/media/drivers/zoran.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/driver-api/media/drivers/zoran.rst b/Documentation/driver-api/media/drivers/zoran.rst
index 83cbae9cedef..b205e10c3154 100644
--- a/Documentation/driver-api/media/drivers/zoran.rst
+++ b/Documentation/driver-api/media/drivers/zoran.rst
@@ -319,7 +319,7 @@ Conexant bt866 TV encoder
 ~~~~~~~~~~~~~~~~~~~~~~~~~
 
 - is used in AVS6EYES, and
-- can generate: NTSC/PAL, PAL­M, PAL­N
+- can generate: NTSC/PAL, PAL-M, PAL-N
 
 The adv717x, should be able to produce PAL N. But you find nothing PAL N
 specific in the registers. Seem that you have to reuse a other standard
-- 
2.31.1

