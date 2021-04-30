Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C366936F5E7
	for <lists+linux-media@lfdr.de>; Fri, 30 Apr 2021 08:48:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229692AbhD3Gtj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 30 Apr 2021 02:49:39 -0400
Received: from lb1-smtp-cloud9.xs4all.net ([194.109.24.22]:34469 "EHLO
        lb1-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229508AbhD3Gti (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 30 Apr 2021 02:49:38 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id cMxBlg1aNk1MGcMxFlRvr3; Fri, 30 Apr 2021 08:48:49 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1619765329; bh=dkEtC5XdY2RlhAON5hqFGT1ptsAWTSkPX7/TlnK/Ako=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=aqlUIIJa3hOke51i8QmkoW28pFiYa3sWvPDramymhZSggC1tc704Ek+FcC5cyAoaa
         4FO6DfSQeKxcATMOFcrgfi+2mG5vIOBtjsdV2ouD89rO7fLo60DW0lO4HIwn2O68GE
         EzvmUZIWQjX1TCgyic4aWgenq+kZk+WhtXGkO8kbGW8IcLYzdNu0JQO6uQeJqPWrS7
         Ql9qt7pl2qbsIzMxhMqiJuNexPph30hTMybe/bx4EBioTlVh/q3KCwJp/hhANsfTI/
         2CauefvquB+clc3mqRoE9EI0zd+6T4ABp0t76wHSm/AwCObDAzXP2/PRa/WjLLxa/b
         DftCrZEf93V1Q==
To:     Ezequiel Garcia <ezequiel@collabora.com>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Daniel Almeida <daniel.almeida@collabora.com>,
        =?UTF-8?Q?Jernej_=c5=a0krabec?= <jernej.skrabec@siol.net>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Jonas Karlman <jonas@kwiboo.se>,
        Maxime Ripard <mripard@kernel.org>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [RFC] Moving codec drivers out of staging
Message-ID: <9bde97ea-aea7-3db4-407b-2ac9e13a9a28@xs4all.nl>
Date:   Fri, 30 Apr 2021 08:48:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.9.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfJbaPYToG6IrChnq35lbVunfyAP19Q1j/g72I9f6kypW8zr4viU9qGbWxvsDgLtnv7V10L4kNLhv0NkkbSt7IiuexDCcfAz7/zIYYhixl/Zs6oaqTJnA
 L20Yxl5joC2VKfd9GSvqdF0qq8ov1iBrBVV4s37W+KZy9p34dyelWJKYcU8IRNPFZNA7eDVb2GPQi3wXNKG/wnG3WQQFfD3yrifuQU8ZgIK6NGjBCUQBodZP
 +3ZiZI9ExvpT8RQThNphAXeQ1jvhSQbdLATmmWt3sBYV1+NhV1a835C1Xzxob4ryKR4i6QfoFneBwJupXhN7T7WmR+hmFSXXeRlKNrUvXlvgvBIdq9KVpH1M
 qLfjHDze6qHGlG1BQJ7B1fIGKiHMCCD5juJ/T7zO11s5YNg9H4sFIGjUx/i2BMSWnE2gTEvq40QfZwvFo/YklNEV1FQ6pA==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi all,

I just posted the pull request to move the MPEG-2 stateless codec API out of staging,
so after that only the HEVC stateless codec API is still in staging.

I think it is time to move the stateless codec drivers out of staging, and use a
kernel config option to enable/disable the staging HEVC API:

---------------------------------------------------------------------------
diff --git a/drivers/staging/media/Kconfig b/drivers/staging/media/Kconfig
index ca59986b20f8..faa2fbeb29f0 100644
--- a/drivers/staging/media/Kconfig
+++ b/drivers/staging/media/Kconfig
@@ -22,6 +22,15 @@ if STAGING_MEDIA && MEDIA_SUPPORT
 # Please keep them in alphabetic order
 source "drivers/staging/media/atomisp/Kconfig"

+menuconfig STAGING_MEDIA_HEVC
+	bool "Support HEVC in stateless codec drivers"
+	default n
+	help
+	  This option allows you to enable support for the HEVC codec in
+	  stateless codec drivers. The public API for HEVC is still under
+	  development and is guaranteed to change in the future, so this
+	  option should not be enabled unless you know what you are doing!
+
 source "drivers/staging/media/hantro/Kconfig"

 source "drivers/staging/media/imx/Kconfig"
---------------------------------------------------------------------------

Is there any reason why hantro cannot be moved to mainline? It doesn't
support HEVC, so it can just be moved. Ezequiel, can you check the TODO?
I don't think there is anything there that prevents moving it.

Same question for rkvdec, that too looks ready to move over to mainline.

Same question for the cedrus driver, that too should be ready to move.
It only needs to be patched so that it depends on the suggested kernel option
above. Everything in the TODO is done, so there is no reason to keep it
in staging.

Regards,

	Hans
