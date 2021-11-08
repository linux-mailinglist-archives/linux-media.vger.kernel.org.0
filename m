Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A0D2A447F43
	for <lists+linux-media@lfdr.de>; Mon,  8 Nov 2021 13:07:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239383AbhKHMJn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 8 Nov 2021 07:09:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36444 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237547AbhKHMJl (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 8 Nov 2021 07:09:41 -0500
Received: from lb2-smtp-cloud8.xs4all.net (lb2-smtp-cloud8.xs4all.net [IPv6:2001:888:0:108::2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84362C061570
        for <linux-media@vger.kernel.org>; Mon,  8 Nov 2021 04:06:57 -0800 (PST)
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id k3QKm37wuDjkdk3QNmU9yi; Mon, 08 Nov 2021 13:06:55 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1636373215; bh=1/wmLVso+M9F/SmbqIwx5l8jxdX/4E8zz0Tqnw2U2Hc=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=OPlxoXfgZzNEzfsJr9quzxc7R3AltEhO7cysKnkca/HgszFqHZ0N+mK1SfXNLOz5u
         fxfwIWK2gY/vVi80J9ERea5hcuOD05rsfHb0/rlyH93BzPTaca6suyrK9a4+IfbJue
         zuJJ02eJFOGWbRShd0kydZW7YwnVfCKw4N0rFjlf4+UKr3C2vNAkdhIwpw62WFXRCS
         D12oaDdf/+Hd7RbA5Dsal2KKGnvtsaBuUnJrF8SnFJ/Fde3gtOOdHD/CU1p+90uCgs
         lqEU/YsW8CyIIbvO+scDqBL9q7x3Wrldl+Knf/s4SxrRnKVKJ4MwDSdcXheNQ539I7
         +hZ3GxofmzlQA==
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH] media: drivers/index.rst: add missing rkisp1 entry
Message-ID: <dc59d3c5-35a4-269e-d038-8756d8aa3603@xs4all.nl>
Date:   Mon, 8 Nov 2021 13:06:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.14.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfPemdPVnCqzdJLVRx09z7t3b+EVxWP1mvGpFjYo3u0+7SwRHjS+OaWV1ZEqqUW9yzgnqc90jqjomsMU0uBoa3J4Ux5og7jUNtVPWuQ/3XY0TOZ5iGy8w
 zyZldBZK/q4qt6fFNg6+L7xkT2MfGF9b1o+uWDsPovnE0nr574iZmt/GyTXq7BqrxQUh3k1LBj55JXGJ26wb80XMvPiBbMPdtWE=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The Documentation/driver-api/media/drivers/rkisp1.rst file
wasn't referenced in the index.rst file, so it was never included.

Add it.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
diff --git a/Documentation/driver-api/media/drivers/index.rst b/Documentation/driver-api/media/drivers/index.rst
index 426cda633bf0..32406490557c 100644
--- a/Documentation/driver-api/media/drivers/index.rst
+++ b/Documentation/driver-api/media/drivers/index.rst
@@ -21,6 +21,7 @@ Video4Linux (V4L) drivers
 	pvrusb2
 	pxa_camera
 	radiotrack
+	rkisp1
 	saa7134-devel
 	sh_mobile_ceu_camera
 	tuners
