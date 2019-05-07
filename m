Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6505216D68
	for <lists+linux-media@lfdr.de>; Wed,  8 May 2019 00:07:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726225AbfEGWHc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 7 May 2019 18:07:32 -0400
Received: from devnull.tasossah.com ([107.6.175.157]:45372 "EHLO
        devnull.tasossah.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725843AbfEGWHc (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 7 May 2019 18:07:32 -0400
X-Greylist: delayed 1775 seconds by postgrey-1.27 at vger.kernel.org; Tue, 07 May 2019 18:07:31 EDT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=devnull.tasossah.com; s=vps;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:Date:Message-ID:Subject:From:To; bh=q7ciQw+/emFPigr9WjtFarpFQrkbMebMvL4fCrnOMGQ=;
        b=BG2LS0tlBN8wbrehaz6N04nLE5DptDfKS9ye1dBxSa14HTYQly2ajpW/IQPHwopIAPID+p0Q5CSPkc0SrT55KWrT8T7BAn2Jf2TfMn2VgYqTFkMLmaLouUaD5NtoULYQIaP+dE4YZom7V5Oq/1evFePr98lPnhMcHHQus7rVqkY=;
Received: from [2a02:587:6a0c:c600::298]
        by devnull.tasossah.com with esmtpsa (TLS1.2:RSA_AES_128_CBC_SHA1:128)
        (Exim 4.82)
        (envelope-from <tasos@tasossah.com>)
        id 1hO7md-0002lJ-AL
        for linux-media@vger.kernel.org; Wed, 08 May 2019 00:37:55 +0300
To:     linux-media@vger.kernel.org
From:   Tasos Sahanidis <tasos@tasossah.com>
Openpgp: preference=signencrypt
Autocrypt: addr=tasos@tasossah.com; prefer-encrypt=mutual; keydata=
 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
Subject: [PATCH] qv4l2: Fix UTF8 error message strings
Message-ID: <59947a5a-c29e-1c8d-cb31-82ca41ce7e37@tasossah.com>
Date:   Wed, 8 May 2019 00:37:49 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

In locales such as el_GR.UTF-8, sterror() returns localised error
messages, which get printed as question marks due to the conversion
in QString::toLatin1().

Calling QString::toUtf8 instead, corrects this error.

Signed-off-by: Tasos Sahanidis <tasos@tasossah.com>
---
 utils/qv4l2/qv4l2.cpp | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/utils/qv4l2/qv4l2.cpp b/utils/qv4l2/qv4l2.cpp
index 832f479e..b52a3b60 100644
--- a/utils/qv4l2/qv4l2.cpp
+++ b/utils/qv4l2/qv4l2.cpp
@@ -1705,7 +1705,7 @@ void ApplicationWindow::error(const QString &error)
 {
 	statusBar()->showMessage(error, 20000);
 	if (!error.isEmpty())
-		fprintf(stderr, "%s\n", error.toLatin1().data());
+		fprintf(stderr, "%s\n", error.toUtf8().data());
 }
 
 void ApplicationWindow::error(int err)
@@ -1780,7 +1780,7 @@ static bool processShortOption(const QStringList &args, int &i, QString &dev)
 		return false;
 	if (args[i].length() == 2) {
 		if (i + 1 >= args.size()) {
-			usageError(args[i].toLatin1());
+			usageError(args[i].toUtf8());
 			return false;
 		}
 		dev = args[++i];
@@ -1803,7 +1803,7 @@ static bool processLongOption(const QStringList &args, int &i, QString &dev)
 		return true;
 	}
 	if (i + 1 >= args.size()) {
-		usageError(args[i].toLatin1());
+		usageError(args[i].toUtf8());
 		return false;
 	}
 	dev = args[++i];
@@ -1857,7 +1857,7 @@ int main(int argc, char **argv)
 		} else if (args[i] == "-R" || args[i] == "--raw") {
 			raw = true;
 		} else {
-			printf("Invalid argument %s\n", args[i].toLatin1().data());
+			printf("Invalid argument %s\n", args[i].toUtf8().data());
 			return 0;
 		}
 	}
-- 
2.20.1
