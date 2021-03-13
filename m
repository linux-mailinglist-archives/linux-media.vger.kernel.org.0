Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1EBC6339E14
	for <lists+linux-media@lfdr.de>; Sat, 13 Mar 2021 13:49:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233530AbhCMMra (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 13 Mar 2021 07:47:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232627AbhCMMrI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 13 Mar 2021 07:47:08 -0500
Received: from mail-qt1-x830.google.com (mail-qt1-x830.google.com [IPv6:2607:f8b0:4864:20::830])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14FFDC061574
        for <linux-media@vger.kernel.org>; Sat, 13 Mar 2021 04:47:08 -0800 (PST)
Received: by mail-qt1-x830.google.com with SMTP id m7so5976568qtq.11
        for <linux-media@vger.kernel.org>; Sat, 13 Mar 2021 04:47:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:from:subject:message-id:date:user-agent:mime-version
         :content-transfer-encoding:content-language;
        bh=xPMxu1i7ySnCtlAxqDUy8YuoEWDrWveu4K7uvohihos=;
        b=no8CFuLB+KVhEPMgpcK3vnLikhactCVjNBfyk6Q+sEQa0wF2Vy3BS9+nGpYLTPRa6r
         DXtp8rltEgTTfkxwG6HYfLXl36tS8ZECCivADVX3BNkArNeZzqSJ2EL+jGDroK/u7yvK
         wc1zmSA9EBGrKAlEYkFLZjC9uppMK6/MBJUlrFHCv3PTCiKt/g5vHSaEXL0kNielDYPK
         JTu6d/8Bo9KhV44t/MtiBSnlj8nFlLeEzKwGNAkHv3xzpd6RSt/w+IECLaYefrYGFBVa
         gcKkh4wjHRfums6DPh1+a/rMzTWAsY3LMp79OS27MoaP5ncxbkOxAqI444Fs9AkCsaeC
         FLeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:from:subject:message-id:date:user-agent
         :mime-version:content-transfer-encoding:content-language;
        bh=xPMxu1i7ySnCtlAxqDUy8YuoEWDrWveu4K7uvohihos=;
        b=h3aMCTUYGyWz/qnkSFg+WmQ4VGiGwyQgqoA+qOX5maf/6EP9rzb9FKkjc0kOfO0rHT
         CqMWcaegXJX0kromruwFLW4vVZ5BYTbkFDCMZfXKrGuVfTbTY4w/ISy/RAwRqW9rfTO+
         AR1+xIadrtog2nD8RORFAJPTlZ2U+3JtKxt5nwDpMiNVO40/JBySn+W5hft2C/w4va//
         OQihSG3qekswq+HzYzyFHJ4d0/IzeH1aK9rETXtw3H3eX6hfkzssI8Nqhf5t4f631lLp
         0x1A3W25UiTvNoNR4y5A1coRaLdOGrQHjGeMiyFo4nXnryPKr3J/cQfvRBkEhxSqGbUE
         SVvA==
X-Gm-Message-State: AOAM531l+KAXAP/aPLjkYE7bCA8SiMKX0wjmwou4LwW7RtEOX0g+X094
        UBmC33ouZKYs3IyomKKpCcdkP0b2EaQaxg==
X-Google-Smtp-Source: ABdhPJzXBe32MtTmgiBsldTdVG/D/j/A1omfmNOLsVUJwNtHg+GlyLIrRQwIpLHKFfWbImndSPHrUQ==
X-Received: by 2002:ac8:7091:: with SMTP id y17mr9993578qto.333.1615639626992;
        Sat, 13 Mar 2021 04:47:06 -0800 (PST)
Received: from [192.168.80.12] ([24.105.64.120])
        by smtp.gmail.com with ESMTPSA id c13sm6499630qkc.99.2021.03.13.04.47.06
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 13 Mar 2021 04:47:06 -0800 (PST)
To:     linux-media@vger.kernel.org
From:   Vincent Fortier <th0ma7@gmail.com>
Subject: LinuxTV Web site information needing update
Message-ID: <a07552a3-4dd2-09ff-f288-80c1ea43a9de@gmail.com>
Date:   Sat, 13 Mar 2021 07:47:05 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi all,

For your consideration (and might not be the right place for this).  
While reading through the various pages of LinuxTV project I noticed 
that the Mailing Lists and Repository info needs updating.


Repository all uses the https://git.linuxtv.org/cgit.cgi/* URL where the 
cgit.cgi make the URL point to "no repositories found"

media_tree points to https://git.linuxtv.org/cgit.cgi/media_tree.git 
while it should point to https://git.linuxtv.org/media_tree.git

media_build points to https://git.linuxtv.org/cgit.cgi/media_build.git 
instead of https://git.linuxtv.org/media_build.git

etc...


Mailing lists:

dir.gmane.org/gmane.linux.drivers.video-input-infrastructure does not 
work anymore.

http://www.mail-archive.com/linux-media @vger.kernel.org 
<http://www.mail-archive.com/linux-media@vger.kernel.org/> seems to have 
stopped archiving since 2019/10/23

This leaves only https://www.spinics.net/lists/linux-media/ as a 
reliable source.


News: last update dates of more than a year.  Not an issue but seeing 
the amount of exchanges going over the mailing list I'm surprised there 
wasn't anything new since (besides the pandemic I guess).


Cheers!


- vin

