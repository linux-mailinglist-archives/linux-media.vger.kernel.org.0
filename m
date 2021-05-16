Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7BC3B381DDA
	for <lists+linux-media@lfdr.de>; Sun, 16 May 2021 12:18:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231473AbhEPKTx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 16 May 2021 06:19:53 -0400
Received: from mail.kernel.org ([198.145.29.99]:37506 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229586AbhEPKTv (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sun, 16 May 2021 06:19:51 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5B16E61183;
        Sun, 16 May 2021 10:18:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1621160317;
        bh=CTBuH+LNVhsBxUwNdF586jYH3Pgby8Vqy5VANBKVw/M=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Ib2VqkT+/CeQxHv3Cx90FooD0wSdPp4zfIF88Q0d9XrDRdFfwwC0NiwaUmItQOR2C
         CFKev9aRfRsFUvWSWpBviL954i4S9NPkc630zw8ENpPO1OgEqiht6u2eKs9LWfqG0d
         40PxpkHxzolSqBxNRY608+7unmucOFeLDuH7X81ai2AQm+cwdhxMfFUCrBkea0YJ5L
         Q9rcZRZw4cS8qwycNMVZiVZzm02+huNBCcv4oBpLBxixG/xXwm2LJE9fI/mevLmqxc
         6AZ7MojZBDRBT3A1u0ZqjlDOfIlMa2eAzMqt7c+Ys1uGXvCjwpMU4rhyZLmaEp+IBn
         xH4hIY1gtShfw==
Received: by mail.kernel.org with local (Exim 4.94.2)
        (envelope-from <mchehab@kernel.org>)
        id 1liDr1-003o8e-Fc; Sun, 16 May 2021 12:18:35 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        "Jonathan Corbet" <corbet@lwn.net>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH v3 08/16] docs: userspace-api: media: dvb: intro.rst: replace some characters
Date:   Sun, 16 May 2021 12:18:25 +0200
Message-Id: <e0b326e9fe056467fff9bbd32b4db7d1fe5261b1.1621159997.git.mchehab+huawei@kernel.org>
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

	- U+00a0 (' '): NO-BREAK SPACE
	  as it can cause lines being truncated on PDF output

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/userspace-api/media/dvb/intro.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/userspace-api/media/dvb/intro.rst b/Documentation/userspace-api/media/dvb/intro.rst
index a935f3914e56..c39ad9fc94f1 100644
--- a/Documentation/userspace-api/media/dvb/intro.rst
+++ b/Documentation/userspace-api/media/dvb/intro.rst
@@ -148,9 +148,9 @@ individual devices are called:
 
 -  ``/dev/dvb/adapterN/caM``,
 
-where ``N`` enumerates the Digital TV cards in a system starting from 0, and
+where ``N`` enumerates the Digital TV cards in a system starting from 0, and
 ``M`` enumerates the devices of each type within each adapter, starting
-from 0, too. We will omit the “``/dev/dvb/adapterN/``\ ” in the further
+from 0, too. We will omit the “``/dev/dvb/adapterN/``\ ” in the further
 discussion of these devices.
 
 More details about the data structures and function calls of all the
-- 
2.31.1

