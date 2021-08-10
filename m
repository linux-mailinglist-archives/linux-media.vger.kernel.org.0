Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8B2623E59C8
	for <lists+linux-media@lfdr.de>; Tue, 10 Aug 2021 14:20:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239470AbhHJMUa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 Aug 2021 08:20:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231678AbhHJMU3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 Aug 2021 08:20:29 -0400
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E669C0613D3
        for <linux-media@vger.kernel.org>; Tue, 10 Aug 2021 05:20:02 -0700 (PDT)
Received: by mail-wm1-x332.google.com with SMTP id 6so760670wme.5
        for <linux-media@vger.kernel.org>; Tue, 10 Aug 2021 05:20:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kynesim-co-uk.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:references:in-reply-to
         :user-agent:mime-version:content-transfer-encoding;
        bh=8C61os9vOikF5WRkEQgKVhZfsvet6MRMjjcgwSxYueU=;
        b=kw9FOf5ZHWkU8gNkImhhYYudbhOBsHcAUaJ7w91TXM9d/2ij30njFPE4PkLrTB4PRx
         vdxGvIVPEuvMd15iBcAoB5MY8i26K4SWjvg1xZ5uChrtfaTCUzA7delUZ4R7IW81Nft9
         ohY2GwVH6M3e2bXipojQFcvwl7G1fpqCff1pFxER2DoRoTQ0ooPWWjWqAy8XZd2rXK3d
         MgRdIdNujgW6Eazz0sVImYr1IymXDm8D8o/0oyn7XsRvjPraWajacEzPSbp48xkbeInx
         hlopnFEB5sDz2YMzh9HHe7mpxLTbMVxlDR08uM4U2lFUPh+gBNUct0szTSLIGOKT7ZWy
         FeEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:references
         :in-reply-to:user-agent:mime-version:content-transfer-encoding;
        bh=8C61os9vOikF5WRkEQgKVhZfsvet6MRMjjcgwSxYueU=;
        b=T/4JturR8N6L1VrsgL9kK81YwAHTrC47J7nhKg7CmH65YzZrHc6ULOB2QdY3sjYr5O
         4//KKxaWst/DemNzxqKC0APK0IAHj9lruEjF13sr/61ZTEP6Jyl0DF57qh+F+00AW63v
         P0RxepjW7ZtfbdM0D594p/8zDQAhbCNHeYGCLgOytBTBUm+LeQS/M2rqukMB/WP0/FEW
         5NTGqjV3+SZ9fVBCUmtR+zA8pH255SVo1USG/pmS/7mjKQHkSjTMyTmD4vdK2AQvOoUI
         hjNK8ulnRDEXq3/grWultzs/zjQ1SMNAcO3XlhzArY0EXMEf0xFSMAEhm6yZPtArBN43
         TDAQ==
X-Gm-Message-State: AOAM530mQ+MBdhoxd1ZTBv/fdSkQG5VCwC0s9HV/NcB2IoKibsl/oO4H
        reZL/C+4MvoUbCDQz4Md/7487w==
X-Google-Smtp-Source: ABdhPJzMsOcFoTO8QkCUTXVuEaz+Vc8WhclEot0/wMwP7lY67cQGo7dCOZFh9p+AjWsQVkgvXJlpSA==
X-Received: by 2002:a1c:a90d:: with SMTP id s13mr12282142wme.132.1628598000649;
        Tue, 10 Aug 2021 05:20:00 -0700 (PDT)
Received: from CTHALPA.outer.uphall.net (cpc1-cmbg20-2-0-cust759.5-4.cable.virginm.net. [86.21.218.248])
        by smtp.gmail.com with ESMTPSA id e3sm9513495wro.15.2021.08.10.05.19.59
        (version=TLS1 cipher=ECDHE-ECDSA-AES128-SHA bits=128/128);
        Tue, 10 Aug 2021 05:20:00 -0700 (PDT)
From:   John Cox <jc@kynesim.co.uk>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Ezequiel Garcia <ezequiel@collabora.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Subject: Re: Dynamic array control support: please test!
Date:   Tue, 10 Aug 2021 13:19:59 +0100
Message-ID: <59r4hglra4lvi1m3o6oa9mubf41uikqc81@4ax.com>
References: <c423e924-9380-0806-b9dd-26cb2caf9fa7@xs4all.nl>
In-Reply-To: <c423e924-9380-0806-b9dd-26cb2caf9fa7@xs4all.nl>
User-Agent: ForteAgent/8.00.32.1272
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi

>Hi Ezequiel, John,
>
>After creating extensive new compliance tests for this feature I am now
>confident enough about the implementation.
>
>You can find it here:
>
>https://git.linuxtv.org/hverkuil/media_tree.git/log/?h=3Dctrl-refactor
>
>There are two items that I want to fix before I will post this:
>
>1) The new flag needs to be documented
>2) I think there are some simplifications possible w.r.t. storing the
>   size of the new array, I want to look at that a bit more.
>
>In the meantime it would be great if some testing of this series can be
>done with real drivers instead of just vivid.

Have dynamic arrays got lost or have they made it in under another name?
The ctrl split made it, but dynamic arrays less obviously.

Regards

John Cox
