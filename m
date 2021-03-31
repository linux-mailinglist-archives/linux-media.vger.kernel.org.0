Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 84D5E34FBAF
	for <lists+linux-media@lfdr.de>; Wed, 31 Mar 2021 10:33:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232476AbhCaIct (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 31 Mar 2021 04:32:49 -0400
Received: from lb3-smtp-cloud8.xs4all.net ([194.109.24.29]:50697 "EHLO
        lb3-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234406AbhCaIcT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 31 Mar 2021 04:32:19 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id RWGqlaMlPgIC3RWGvlscRd; Wed, 31 Mar 2021 10:32:17 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1617179537; bh=w3r73FVb2DUarie6ceGIXm8Q6FDbldVGdQ/arBUUeX4=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=m9uycZZjFQ3/ir+TlV8YGbACAdhckVOdsjS4NE2Q2BwzaomsWcU0qcMrjpGTGD8Ia
         TS54sI2p8oDSLI5tXipBC9gGB97sOmb0SAHgM/YKmCmLZoKm1VUm9WHh2VgMeSu71Z
         C7IDhQ/S+3nq1+ikZCNDp9XKtfzqJkyWVbSgF5GKnV9mtSZDxMKqQ89kXBcP8fYTr/
         tpPUiBVklF7fgfoDO9LWnHefXgVeqzA+bDg0v6zQJC4iIfjsvmml8sjJSiX0+z05Hm
         INSg1Up7SM+hkhf/ZYPsrxWyOtGExKwGo2CmJmnHEb44g3iWZs+V904LIIrA95wTkU
         Pj7jfKXTBLqaA==
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [PATCH] cec/core: clarify rx-arb-lost usage message
Message-ID: <4e09f4c8-d5b4-4234-d183-10a99271e4c1@xs4all.nl>
Date:   Wed, 31 Mar 2021 10:32:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.9.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfIVotX3RVpjoR5S+IhVca8uddIPEVH6WErfrLnTH7ECdpGok6sg8cJNpZgbbsQBPC9F8GsLabIiXfOLd0Dm9dC6WzZALpAQaDwGkFMbVidaxmauvP5Bb
 M4ndBK7VJlSURWHuhjopBQ3BHmnEm66Iearnny04sNHHiIrTuIJzU1ErwjxvM8TlvKmoaEN6GZOkxTjZocO8kTSSJq18punO19c=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The rx-arb-lost error injection command only works with <op> set to 'any'.
Explicitly say so in the usage message.

Also use [] to indicate that the <poll> argument is optional.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
diff --git a/Documentation/userspace-api/media/cec/cec-pin-error-inj.rst b/Documentation/userspace-api/media/cec/cec-pin-error-inj.rst
index 064c8c5a1943..b0efce40471f 100644
--- a/Documentation/userspace-api/media/cec/cec-pin-error-inj.rst
+++ b/Documentation/userspace-api/media/cec/cec-pin-error-inj.rst
@@ -44,7 +44,7 @@ error injection status::
 	#   <op>[,<mode>] rx-low-drive <bit>   force a low-drive condition at this bit position
 	#   <op>[,<mode>] rx-add-byte          add a spurious byte to the received CEC message
 	#   <op>[,<mode>] rx-remove-byte       remove the last byte from the received CEC message
-	#   <op>[,<mode>] rx-arb-lost <poll>   generate a POLL message to trigger an arbitration lost
+	#    any[,<mode>] rx-arb-lost [<poll>] generate a POLL message to trigger an arbitration lost
 	#
 	# TX error injection settings:
 	#   tx-ignore-nack-until-eom           ignore early NACKs until EOM
diff --git a/drivers/media/cec/core/cec-pin-error-inj.c b/drivers/media/cec/core/cec-pin-error-inj.c
index c0088d3b8e3d..fc0968b9d40e 100644
--- a/drivers/media/cec/core/cec-pin-error-inj.c
+++ b/drivers/media/cec/core/cec-pin-error-inj.c
@@ -277,7 +277,7 @@ int cec_pin_error_inj_show(struct cec_adapter *adap, struct seq_file *sf)
 	seq_puts(sf, "#   <op>[,<mode>] rx-low-drive <bit>   force a low-drive condition at this bit position\n");
 	seq_puts(sf, "#   <op>[,<mode>] rx-add-byte          add a spurious byte to the received CEC message\n");
 	seq_puts(sf, "#   <op>[,<mode>] rx-remove-byte       remove the last byte from the received CEC message\n");
-	seq_puts(sf, "#   <op>[,<mode>] rx-arb-lost <poll>   generate a POLL message to trigger an arbitration lost\n");
+	seq_puts(sf, "#    any[,<mode>] rx-arb-lost [<poll>] generate a POLL message to trigger an arbitration lost\n");
 	seq_puts(sf, "#\n");
 	seq_puts(sf, "# TX error injection settings:\n");
 	seq_puts(sf, "#   tx-ignore-nack-until-eom           ignore early NACKs until EOM\n");
