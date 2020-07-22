Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1320B2294F9
	for <lists+linux-media@lfdr.de>; Wed, 22 Jul 2020 11:33:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731338AbgGVJcJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 22 Jul 2020 05:32:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33804 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726147AbgGVJcI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 22 Jul 2020 05:32:08 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 853EDC0619DC
        for <linux-media@vger.kernel.org>; Wed, 22 Jul 2020 02:32:08 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id y3so1209312wrl.4
        for <linux-media@vger.kernel.org>; Wed, 22 Jul 2020 02:32:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=QcBJJpEsvONE+Kw+kBbBDvB6GcRiNrNAeTp+cXLFTAA=;
        b=QEQnbBYjiSZvcQ9jQ5Qdctq2CqwBf8ShPW14IDlLhIK/zTQIevJZrnliwMsopusKf6
         WrzUOGf63ZdXqRQgBhfjByKruSDpijif6/bSKAgEsx6qZLOXsqX8nqHRyKIMK8u1g6Rx
         uWHJT7Rc6iBqI8YbHxJrZKgQ4Nm9t/ZAtxbYW+7MqZRYYdH9wfOE6+Iv3jX1dxvaJpoW
         KtIO+W7evo5yIOHmt1o4EfA9oK4DJjz7axujF2kDuBxtZ/Lo5/aZy1WFcceebC1ofSBf
         pXM9ZcEd1dizk7R+487IHsOYYjVZnA3puijeKabaVMeeXb0Z/ZruHCdBOMQTvq/hjZ2y
         Zz6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=QcBJJpEsvONE+Kw+kBbBDvB6GcRiNrNAeTp+cXLFTAA=;
        b=m5Q4CEfukbJyW8X96U1oeNJPonITIIcrPFlpt7x4uJMrKXf8BcI1BzN3p+KyD5khEw
         RbtlhGOjWpB/7liMkI0ea+nEpNuVMA8YssmWKSMmkZq88YI1Tet6gs/g7oyLp3L/MuPK
         VlBfLMIoJL98/RTl0dwYdED/ZMBFZzpxoUsEWbqgPxUFd/vQwPCBBjXDVX3AeZO+j52a
         bK5N+CPpIN55aReEgURpUb8jWQSxNPaXqRg/TQgi7x3JX5ujCPM1dXzAikdOJOA03akx
         BKXTYuzvizR/08q4DibM1ar0aiIDyCzZEJQyJQJc8d+FftR2MmHMTkVySqzKLBP8BAbq
         KgnA==
X-Gm-Message-State: AOAM532Ac4j39fMDn6Ix7Z7GeO1Hh35O/xaRA8NDncK8sy8sCFdKpeCu
        z+oA3Bj7tVynm1f1VZncBHI=
X-Google-Smtp-Source: ABdhPJzb2ePYQ3Aa5TJBkHOhHyzoP21QX4SHOT3Z8Trr59mJbHTzyiA351B5NM0J27BZRNI779zl4Q==
X-Received: by 2002:a05:6000:1206:: with SMTP id e6mr29986844wrx.346.1595410327355;
        Wed, 22 Jul 2020 02:32:07 -0700 (PDT)
Received: from ?IPv6:2a02:810a:8340:5198:98cf:713c:30ea:8ca6? ([2a02:810a:8340:5198:98cf:713c:30ea:8ca6])
        by smtp.gmail.com with ESMTPSA id n189sm6292260wmf.38.2020.07.22.02.32.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Jul 2020 02:32:06 -0700 (PDT)
Subject: Re: [PATCH v2 0/1] Add support for meson building
To:     Ariel D'Alessandro <ariel@vanguardiasur.com.ar>,
        linux-media@vger.kernel.org
Cc:     hverkuil@xs4all.nl, sean@mess.org, p.zabel@pengutronix.de,
        laurent.pinchart@ideasonboard.com, ezequiel@collabora.com,
        nicolas@ndufresne.ca, kieran.bingham@ideasonboard.com,
        xavier.claessens@collabora.com, nicolas.dufresne@collabora.com,
        user.vdr@gmail.com
References: <20200721151434.115651-1-ariel@vanguardiasur.com.ar>
From:   Gregor Jasny <gjasny@googlemail.com>
Message-ID: <5598a9af-9f97-76db-eb24-6deeb05f88c1@googlemail.com>
Date:   Wed, 22 Jul 2020 11:32:05 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.0
MIME-Version: 1.0
In-Reply-To: <20200721151434.115651-1-ariel@vanguardiasur.com.ar>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

On 7/21/20 5:14 PM, Ariel D'Alessandro wrote:
> Hello there,
> 
> Here's another step on porting v4l-utils to meson build system.
> Following the discussion thread for v1, several changes were added (see
> Changelog below).
> 
> Further testing, deeper reviews, more comments, are all welcome :-)

Thanks you for polishing the patch. It looks good and the Debian package 
properly builds.

Before merging to master the build system needs to catch-up with the 
master branch. For example the following got added to configure.ac:

> +# Obtain git SHA of HEAD
> +AC_SUBST(GIT_SHA, ["-DGIT_SHA=\$(shell if test -d \$(top_srcdir)/.git ; then git -C \$(top_srcdir) rev-parse HEAD ; else printf '\"not available\"'; fi)"])
> +
> +# Obtain git commit count of HEAD
> +AC_SUBST(GIT_COMMIT_CNT, ["-DGIT_COMMIT_CNT=\$(shell if test -d \$(top_srcdir)/.git ; then printf '-'; git -C \$(top_srcdir) rev-list --count HEAD ; fi)"])

I'm wondering if we should drop autotools shortly after the meson patch 
was merged to prevent further drift.

Thanks,
Gregor
