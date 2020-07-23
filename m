Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AE9B322B11C
	for <lists+linux-media@lfdr.de>; Thu, 23 Jul 2020 16:17:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728630AbgGWORh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 23 Jul 2020 10:17:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47454 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726089AbgGWORe (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 23 Jul 2020 10:17:34 -0400
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com [IPv6:2607:f8b0:4864:20::742])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4B29C0619DC
        for <linux-media@vger.kernel.org>; Thu, 23 Jul 2020 07:17:33 -0700 (PDT)
Received: by mail-qk1-x742.google.com with SMTP id h7so5440364qkk.7
        for <linux-media@vger.kernel.org>; Thu, 23 Jul 2020 07:17:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vanguardiasur-com-ar.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=2LiwihvWW0t0hQ1nxsWSdrlPG1hvyHa/lTR1EPP1bqs=;
        b=CY6bT6qfsSCAWYmYLCe/3wU4AjPKfSXSspT/gmiqDIAXpou5xYrbbGUtsWehjkwgXg
         itkx1lcS2Hw+mxyD2encMlI7MmLaybcn6+qXRpoTxEvINAZMEgYpnhjILeYQQyXRLu7z
         OdritbG0B6uoj1oftmky+TLZGVnLjapnfGnD4JbfjUkiMDphbYcgxHSveo8XaQphF0x0
         aKqsUlZn7O+RC4DunuIdLVS14i6kMO+kuKQNogSnYXY+DTbKmPMKyBCYZUHn7y3x5aBc
         9pRLi1FgQhUkJZ9SIKbEM05yK1/soSoUskP8oaBXDGO/+N/3JKfHPNqgGZ+sj8EHXl90
         GLRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=2LiwihvWW0t0hQ1nxsWSdrlPG1hvyHa/lTR1EPP1bqs=;
        b=gfri0GZNCHgdxlDfTHS8Vjterj8x4dNbxUV4CeVi9+fxkIPaZXEHS9rw37UG4iZyM1
         rwyGDmA0Yli2PjkfxFjsKo8EpxmcAlrKfU/usAGecC3Ws5teSUsxeoTN3XiB6gNBPI5G
         9/imI3pUdXpRUy8uNUapNf44FqcmD4gOf4BGN5/cb8ZK/uWDYh+xp8lIuuvLUYHLzLEI
         XDp2a5NS+NobvI6oJDqXry9hiCbogWzNiaTQhwXWraMs9IcMObh7Pn4dN21LKMuWkGHe
         s98ZWNsX3+dz88WKRFNO/GptXLvxfMkDxsMUp3H6mRLQnM3bkXaC5wH87wf5nFQGQe0w
         ACjg==
X-Gm-Message-State: AOAM533ZNL2kqIWhBSzDWzrmv2hDzVK20pRY68OO29yz4zYD+2d4mCwA
        a/yQN4V4UXpHq9G6LROvvgheBQ==
X-Google-Smtp-Source: ABdhPJwsHtL+OaJzevgvh8+gj/etcnpcPMkpuszGBbDzXmpAd8JLF9mhOoDk2bxqETqeWi8gF6O6mQ==
X-Received: by 2002:a05:620a:4d9:: with SMTP id 25mr1447986qks.411.1595513852724;
        Thu, 23 Jul 2020 07:17:32 -0700 (PDT)
Received: from [192.168.0.102] ([186.136.155.69])
        by smtp.gmail.com with ESMTPSA id o187sm2568166qkd.112.2020.07.23.07.17.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jul 2020 07:17:32 -0700 (PDT)
Subject: Re: [PATCH v2 0/1] Add support for meson building
To:     Gregor Jasny <gjasny@googlemail.com>, linux-media@vger.kernel.org
Cc:     hverkuil@xs4all.nl, sean@mess.org, p.zabel@pengutronix.de,
        laurent.pinchart@ideasonboard.com, ezequiel@collabora.com,
        nicolas@ndufresne.ca, kieran.bingham@ideasonboard.com,
        xavier.claessens@collabora.com, nicolas.dufresne@collabora.com,
        user.vdr@gmail.com
References: <20200721151434.115651-1-ariel@vanguardiasur.com.ar>
 <5598a9af-9f97-76db-eb24-6deeb05f88c1@googlemail.com>
From:   Ariel D'Alessandro <ariel@vanguardiasur.com.ar>
Message-ID: <9f6cb0d7-e0fd-9af9-9683-32b544d21eff@vanguardiasur.com.ar>
Date:   Thu, 23 Jul 2020 11:17:34 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <5598a9af-9f97-76db-eb24-6deeb05f88c1@googlemail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Gregor,

On 7/22/20 6:32 AM, Gregor Jasny wrote:
> Hello,
> 
> On 7/21/20 5:14 PM, Ariel D'Alessandro wrote:
>> Hello there,
>>
>> Here's another step on porting v4l-utils to meson build system.
>> Following the discussion thread for v1, several changes were added (see
>> Changelog below).
>>
>> Further testing, deeper reviews, more comments, are all welcome :-)
> 
> Thanks you for polishing the patch. It looks good and the Debian package
> properly builds.
> 
> Before merging to master the build system needs to catch-up with the master
> branch. For example the following got added to configure.ac:

Right. I'll do that quickly.

> 
>> +# Obtain git SHA of HEAD
>> +AC_SUBST(GIT_SHA, ["-DGIT_SHA=\$(shell if test -d \$(top_srcdir)/.git ; then
>> git -C \$(top_srcdir) rev-parse HEAD ; else printf '\"not available\"'; fi)"])
>> +
>> +# Obtain git commit count of HEAD
>> +AC_SUBST(GIT_COMMIT_CNT, ["-DGIT_COMMIT_CNT=\$(shell if test -d
>> \$(top_srcdir)/.git ; then printf '-'; git -C \$(top_srcdir) rev-list --count
>> HEAD ; fi)"])
> 
> I'm wondering if we should drop autotools shortly after the meson patch was
> merged to prevent further drift.

+1 That'd be a good way to go.

Thanks,
Ariel
