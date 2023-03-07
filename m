Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8B5856AD413
	for <lists+linux-media@lfdr.de>; Tue,  7 Mar 2023 02:34:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229815AbjCGBet (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Mar 2023 20:34:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59986 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230000AbjCGBef (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Mar 2023 20:34:35 -0500
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A34894ECF1;
        Mon,  6 Mar 2023 17:34:33 -0800 (PST)
Received: by mail-pl1-x630.google.com with SMTP id a2so12562079plm.4;
        Mon, 06 Mar 2023 17:34:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678152873;
        h=content-transfer-encoding:content-language:cc:to:subject:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yPR0+brHjZoqQtZO+fXmGA/3VIbn0at5kpY2oa01Goo=;
        b=ZzsOiUFkovXfrLu5+zCbuz3k1Ge5qq+m+5pDUzByYC2TKkw+946Cpg7VUHNFzzFCW4
         yHt95jMqISaIokc0ppTUE/t0FXgfqKRyQ94A/+LHmRx8XlerrmWla8SuZJ2XyM+MIldK
         gRIXSCpRaTifRtJ6NKGd8UsucLf3Ra22NrH/w+2twUvQKn0xAdn1qHswmSNG+V3qRddn
         Gsoners++l25PmZSTVi0TMIefTGZ3FbE2hK63Q3h/q96slMOSNPNPXbBzhiLyD9cMycC
         lEQAH4JS8CRL+p5vCo4WZmA0HluEFGv5qenlYs0PH+mZHnTmp8G0lTFJwH78GorWy889
         D0fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678152873;
        h=content-transfer-encoding:content-language:cc:to:subject:from
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yPR0+brHjZoqQtZO+fXmGA/3VIbn0at5kpY2oa01Goo=;
        b=i/LsK3TtqhyoXSZ435X6S/aZGMf1fpPwuf3ofH36aokww0oRGILL0esRZwLMBq5+2f
         oKvLFErR+W2XsAsB7PIUFpDPTbh/WOvXEpClbPpRXc5jjhRUrLgeWvZeGv6vJUNGbwBv
         rJLakYBUya8UVgXEj+HkvraqCZR3PGsW45Mwh8/J3qCIj1fcf8WHELvKggVx6Z+WygGm
         w6jEKm3Ezf1LH24nYpAjLD4qCEwW3UgVYm88zLtujgrpn8ti3gNBa3hns7nq0/bOs24h
         oopILE8IriE+VMB53/XFMIE3vREk6zAc3HXPKNcRO0qwy9Utpg8jTkCZh+ABF5/TvJlc
         Cl0g==
X-Gm-Message-State: AO0yUKUW4+wk64ZCtTbEnduEiL5RXpxa1/nZRvkvLBDCst9BoQ1RVXM6
        xr38BttSMWwcKzY+UH4/z8ZaNkV+75fYBQ==
X-Google-Smtp-Source: AK7set92/wJgWVlIwq7R7wJzs2hbh3DXTEytPcsRWrIHoz7OU7jfRBYhvxaXN1Km/tbBQCoC1oZUDQ==
X-Received: by 2002:a05:6a20:918a:b0:cd:9664:3d5a with SMTP id v10-20020a056a20918a00b000cd96643d5amr14598342pzd.22.1678152873019;
        Mon, 06 Mar 2023 17:34:33 -0800 (PST)
Received: from [192.168.11.9] (KD106167171201.ppp-bb.dion.ne.jp. [106.167.171.201])
        by smtp.gmail.com with ESMTPSA id v25-20020aa78519000000b005d4e89b69e5sm6821422pfn.127.2023.03.06.17.34.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Mar 2023 17:34:32 -0800 (PST)
Message-ID: <29380b3e-1daa-3aef-1749-dbd9960ba620@gmail.com>
Date:   Tue, 7 Mar 2023 10:34:28 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
From:   Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH v2 1/2] media: Fix building pdfdocs
To:     linux-media@vger.kernel.org, linux-doc@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Akira Yokosawa <akiyks@gmail.com>,
        dri-devel@lists.freedesktop.org
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

Commit 8d0e3fc61abd ("media: Add 2-10-10-10 RGB formats") added
documentation for a few new RGB formats. The table has column-width
specifiers for 34 columns used in pdfdocs build.

However, the new table has a couple of rows with 35 columns which
confused Sphinx's latex builder. The resulting .tex file causes
an error in a later stage of a pdfdocs build.

Remove the trailing empty dash lines to fix the issue.

Fixes: 8d0e3fc61abd ("media: Add 2-10-10-10 RGB formats")
Reported-by: Akira Yokosawa <akiyks@gmail.com>
Link: https://lore.kernel.org/r/12250823-8445-5854-dfb8-b92c0ff0851e@gmail.com/
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Tested-by: Akira Yokosawa <akiyks@gmail.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Acked-by: Mauro Carvalho Chehab <mchehab@kernel.org>
  [akiyks: explain the cause of build error]
Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
Hi all,

Now that this fix missed v6.3-rc1, I went forward and amended the
Changelog to explain what was wrong in the offending commit.
I see that docs-next is ready for fixes to v6.3-rc1, but when the -media
tree gets ready, this can be picked by Mauro.
Either route is fine by me.
I'd really like to have this issue fixed sooner rather than later.

As a follow-up, patch 2/2 adjusts the column width specifiers.

        Thanks, Akira
--
v2: Changelog: explain the root cause,
    rebased on v6.3-rc1,
    picked tags from v1 thread.
v1: https://lore.kernel.org/r/20230208082916.68377-1-tomi.valkeinen@ideasonboard.com/

Documentation/userspace-api/media/v4l/pixfmt-rgb.rst | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/Documentation/userspace-api/media/v4l/pixfmt-rgb.rst b/Documentation/userspace-api/media/v4l/pixfmt-rgb.rst
index d330aeb4d3eb..ea545ed1aeaa 100644
--- a/Documentation/userspace-api/media/v4l/pixfmt-rgb.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt-rgb.rst
@@ -868,7 +868,6 @@ number of bits for each component.
       - r\ :sub:`4`
       - r\ :sub:`3`
       - r\ :sub:`2`
-      -
     * .. _V4L2-PIX-FMT-RGBA1010102:
 
       - ``V4L2_PIX_FMT_RGBA1010102``
@@ -909,7 +908,6 @@ number of bits for each component.
       - r\ :sub:`4`
       - r\ :sub:`3`
       - r\ :sub:`2`
-      -
     * .. _V4L2-PIX-FMT-ARGB2101010:
 
       - ``V4L2_PIX_FMT_ARGB2101010``
@@ -950,7 +948,6 @@ number of bits for each component.
       - r\ :sub:`6`
       - r\ :sub:`5`
       - r\ :sub:`4`
-      -
 
 .. raw:: latex
 

base-commit: fe15c26ee26efa11741a7b632e9f23b01aca4cc6
-- 
2.25.1

