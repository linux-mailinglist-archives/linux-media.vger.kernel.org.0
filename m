Return-Path: <linux-media+bounces-14497-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9582591EF74
	for <lists+linux-media@lfdr.de>; Tue,  2 Jul 2024 08:52:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4B8B01F23697
	for <lists+linux-media@lfdr.de>; Tue,  2 Jul 2024 06:52:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55D5313D8BA;
	Tue,  2 Jul 2024 06:51:42 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F20F7537E7
	for <linux-media@vger.kernel.org>; Tue,  2 Jul 2024 06:51:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719903102; cv=none; b=ews5r4PXTEqPZ11R01RCBGCRLf55cf4EdWMn6cO+Ejb8ys8SGfr9REatSrQg+HFwN6aDETk17szBcBBUt+X8UgB9X8oCGbkCZuW8AnjYUmH3N98rtRpdeem0JKvVUuy0Yq4/C2mlKpjkgOKnISYh6iQBUcg4v4QebylBgEngbv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719903102; c=relaxed/simple;
	bh=qLXekBfWPezVslXmDDdbsJZsQSsmEy848++VKb83M4I=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:Content-Type; b=NUV7YjHu5PktGUS+wgkQODC1Ij+Nw1g5xYmpa8wuWuEXedMKL3asjlZwlPoP9Q2N0j9Te6I/495KiMk09ITsJDd07mJWaWCcBc8/xKkymbOIthO1aEGxUJ9W5SiKk1GCRVxCjBUdds42vOZB/w/U1VVtzU9R03d44v2Leu5lC0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 517A0C116B1;
	Tue,  2 Jul 2024 06:51:41 +0000 (UTC)
Message-ID: <93eb15e1-9f04-4536-baef-5b552dc230fc@xs4all.nl>
Date: Tue, 2 Jul 2024 08:51:39 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US, nl
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH] Documentation: media: vivid.rst: update TODO list
To: Linux Media Mailing List <linux-media@vger.kernel.org>
Cc: Dorcas Litunya <anonolitunya@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

The vivid driver supports media controller support for quite a long
time now, so drop that from the list.

Since commit 4c4dacb052d4 ("media: vivid: loopback based on
'Connected To' controls") making EDID changes causes correct signaling
to happen, but what is still missing is the 100 ms delay required before
signaling that there is an HPD. Modify this TODO item accordingly.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
diff --git a/Documentation/admin-guide/media/vivid.rst b/Documentation/admin-guide/media/vivid.rst
index 1306f19ecb5a..ac233b142a27 100644
--- a/Documentation/admin-guide/media/vivid.rst
+++ b/Documentation/admin-guide/media/vivid.rst
@@ -1343,7 +1343,7 @@ Some Future Improvements
 Just as a reminder and in no particular order:

 - Add a virtual alsa driver to test audio
-- Add virtual sub-devices and media controller support
+- Add virtual sub-devices
 - Some support for testing compressed video
 - Add support to loop raw VBI output to raw VBI input
 - Add support to loop teletext sliced VBI output to VBI input
@@ -1358,4 +1358,4 @@ Just as a reminder and in no particular order:
 - Make a thread for the RDS generation, that would help in particular for the
   "Controls" RDS Rx I/O Mode as the read-only RDS controls could be updated
   in real-time.
-- Changing the EDID should cause hotplug detect emulation to happen.
+- Changing the EDID doesn't wait 100 ms before setting the HPD signal.

