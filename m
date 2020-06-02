Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 948811EC3D6
	for <lists+linux-media@lfdr.de>; Tue,  2 Jun 2020 22:41:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728318AbgFBUl0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 2 Jun 2020 16:41:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60528 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727898AbgFBUl0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 2 Jun 2020 16:41:26 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6740C08C5C0
        for <linux-media@vger.kernel.org>; Tue,  2 Jun 2020 13:41:25 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id a127so3765375pfa.12
        for <linux-media@vger.kernel.org>; Tue, 02 Jun 2020 13:41:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dynamicaims-com.20150623.gappssmtp.com; s=20150623;
        h=to:subject:from:message-id:date:user-agent:mime-version
         :content-transfer-encoding:content-language;
        bh=0G8JOBXyUZnOLZwrO0XhFn8UGvz/hCFdWgAun3sEnbI=;
        b=cTXf9bjr1NR0h3D+qS8SyNPZo1cZRPNqgxMP2mXwoZqdshRgq6msFRQ1Ti6EyBNFOG
         v2lEjnbqubjasSvnzUAkG02QtCJCQH7lBion8cpNFQSVa4Ygi5A7J2DYqJPSzs2PXAKO
         0twXsFug63LGgdHSSRzHHzdC4NAnAR8a2B8OdIdMWGFL5/nl1T7KxgatlEUut1P+7PtH
         lqQpGamWgbQEyM2TLl4sYijI/FHifO1sXQ6MAdidOxl7agWUpc2zqXiGlqnGpiz9EfP1
         TFLAo/4mkP1zc1iPyzl4gC/2RHodObtKvKRXdfxna6HzgdWf4GmHtgXsUURNF+MKuQqm
         5LKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:subject:from:message-id:date:user-agent
         :mime-version:content-transfer-encoding:content-language;
        bh=0G8JOBXyUZnOLZwrO0XhFn8UGvz/hCFdWgAun3sEnbI=;
        b=ox5tE1L0bd22Mgc4TDHMByRRqzLHcgeJkMCWs/q4/0Lw3+EW63hebB2ZADwcysVLzZ
         PynHfvRvc/bsKOQAfBxh0No7VKRswoVvFmE6b0JWskVdwlRU6gVheUSNIuKF4qF7MT9d
         mUVVvjUqzyNJJ2GNLMWapPUFM6J+VdMHIc6Op3oqleY58Z38JfJsdmPD9rb5WG9U2M9R
         XQ8EZYy3hney0xVKPUZjpsjOmyGgjR3RrucltvufZITBqIVhRQygDTdP99SooJsCmw2Q
         UL5GtKoTRy4yjez7R9UBM5Mk9TdTXY7K79OS2oe27gomw++dej8gg/lP28gpcC9aHeoL
         wV9A==
X-Gm-Message-State: AOAM532b8zXchHsOdNyDY0WEtJt1aQf9rXZTK2uIXChyPixBpIhIMVTc
        7ul8aVwMArQZtu/vXoIKwr+W+bpMZAQ=
X-Google-Smtp-Source: ABdhPJyzT9uqJFFM/QyKi6Wredzt3Rt0W1SKzRSNeErL3OWhZSG/bfw0WKLaLW4uebkkElEHffj8zA==
X-Received: by 2002:a63:7c50:: with SMTP id l16mr26226712pgn.59.1591130485131;
        Tue, 02 Jun 2020 13:41:25 -0700 (PDT)
Received: from [192.168.0.13] ([103.16.71.222])
        by smtp.gmail.com with ESMTPSA id d21sm29605pfd.109.2020.06.02.13.41.23
        for <linux-media@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 02 Jun 2020 13:41:24 -0700 (PDT)
To:     linux-media@vger.kernel.org
Subject: Wine List
From:   Billie Rogers <billier@dynamicaims.com>
Message-ID: <06c7dc96-1c0b-297c-5592-a6fb404e636f@dynamicaims.com>
Date:   Tue, 2 Jun 2020 16:10:29 -0400
User-Agent: Mozilla/5.0 (Windows NT 6.3; rv:52.0) Gecko/20100101
 Thunderbird/52.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Antivirus: Avast (VPS 180103-0, 01/03/2018), Outbound message
X-Antivirus-Status: Clean
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


Hi,

Would you be interested in acquiring an email list of "Wine Enthusiasts List" from USA?

We also have data for Beer Enthusiasts List, Liquor Enthusiasts List, Beverage Enthusiasts List, Spa and Resort Visitors List, Entertainment Enthusiasts List and many more.

All the contacts are opt-in verified, Complete permission based and can be used for unlimited multi-channel marketing.

Please let me know if you'd be interested in hearing more about it.


Best Regards,
Billie Rogers
Research Analyst

We respect your privacy, if you do not wish to receive any further emails from our end, please reply with a subject “Leave Out”.

