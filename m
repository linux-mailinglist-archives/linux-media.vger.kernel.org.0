Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5682F28770D
	for <lists+linux-media@lfdr.de>; Thu,  8 Oct 2020 17:22:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730914AbgJHPWz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 8 Oct 2020 11:22:55 -0400
Received: from lb3-smtp-cloud9.xs4all.net ([194.109.24.30]:59081 "EHLO
        lb3-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730550AbgJHPWz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 8 Oct 2020 11:22:55 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id QXknkXIFb4gEjQXkrk7FY3; Thu, 08 Oct 2020 17:22:53 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1602170573; bh=AduLpatjotHxzxMCChIGPZc0Dpf1Rj0Z03cxOLwARrw=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=JNfKbpmqsfAqmRXR1129kdbDhTZ3tsQTnmYgPpQFFYZOo8aUCNJfYbJOKxs3KJfjc
         g0aIyNwlgcOkK6uM+QOEd7F27xDE+KFySNVdlqJp7TnH7qBQ3ije9sC1RydG60vMTE
         eiHuqMBV4uC1Ov416Y0wluNN2+B+slD34BJeQ96dukVrtGVxMI7Hqlo/dTu3RDkX78
         nelRyT5iIpou7Oy+v9nGmSWVzVKBRCXY6FONMGWxL2mh4F/inOtM0OTNzh1Y611uz8
         IYvoYuMVFS8RMgMdz04S1aTFqErjNTrUvtr4/pKfvKlWRQSHukXSwBnhshhADEr5so
         /EUYGje+pfxJw==
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [PATCH] cec-core.rst/cec-ioc-g-mode.rst: fix typos in monitor-all
 description
Message-ID: <2bfa5022-f680-327f-1596-f57b5849d07f@xs4all.nl>
Date:   Thu, 8 Oct 2020 17:22:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfC4IMUKtsPS4KeqGDxTwEcG1ZVzItLSa54AJRwB0y3zlVM7gOEY2WWnMZGCM0Xyv4UlKuxV13G9XvskI4e9jx6ej+3OYccU6j69ciFgTf493nCztc4bA
 eXZhMizKtbLQJSHwYQ0B3y0JvUnXnRc01wahaolZzrm0kmXDsFkcCs8Eks3ODs4cjHNWR+YLqSTSOQ==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

cec-core.rst was missing 'are', and cec-ioc-g-mode.rst was missing
a comma.

In both cases this made the description of the Monitor All functionality
hard to read.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
diff --git a/Documentation/driver-api/media/cec-core.rst b/Documentation/driver-api/media/cec-core.rst
index 03016eeaf8f4..64e4b60e7dd5 100644
--- a/Documentation/driver-api/media/cec-core.rst
+++ b/Documentation/driver-api/media/cec-core.rst
@@ -143,7 +143,7 @@ To enable/disable the 'monitor all' mode::
 	int (*adap_monitor_all_enable)(struct cec_adapter *adap, bool enable);

 If enabled, then the adapter should be put in a mode to also monitor messages
-that not for us. Not all hardware supports this and this function is only
+that are not for us. Not all hardware supports this and this function is only
 called if the CEC_CAP_MONITOR_ALL capability is set. This callback is optional
 (some hardware may always be in 'monitor all' mode).

diff --git a/Documentation/userspace-api/media/cec/cec-ioc-g-mode.rst b/Documentation/userspace-api/media/cec/cec-ioc-g-mode.rst
index 2093e373c93c..b3deb31f7307 100644
--- a/Documentation/userspace-api/media/cec/cec-ioc-g-mode.rst
+++ b/Documentation/userspace-api/media/cec/cec-ioc-g-mode.rst
@@ -186,7 +186,7 @@ Available follower modes are:
 	in combination with :ref:`CEC_MODE_NO_INITIATOR <CEC-MODE-NO-INITIATOR>`, otherwise
 	the ``EINVAL`` error code will be returned. In 'monitor all' mode all messages
 	this CEC device transmits and all messages it receives, including
-	directed messages for other CEC devices will be reported. This is
+	directed messages for other CEC devices, will be reported. This is
 	very useful for debugging, but not all devices support this. This
 	mode requires that the :ref:`CEC_CAP_MONITOR_ALL <CEC-CAP-MONITOR-ALL>` capability is set,
 	otherwise the ``EINVAL`` error code is returned. This is only allowed if
