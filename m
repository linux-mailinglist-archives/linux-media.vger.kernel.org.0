Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 53AA1BC552
	for <lists+linux-media@lfdr.de>; Tue, 24 Sep 2019 11:58:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2504417AbfIXJ6b (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 24 Sep 2019 05:58:31 -0400
Received: from mx07-00252a01.pphosted.com ([62.209.51.214]:26900 "EHLO
        mx07-00252a01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2504402AbfIXJ6b (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 24 Sep 2019 05:58:31 -0400
Received: from pps.filterd (m0102628.ppops.net [127.0.0.1])
        by mx07-00252a01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id x8O9wR24006516
        for <linux-media@vger.kernel.org>; Tue, 24 Sep 2019 10:58:27 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=raspberrypi.org; h=subject : to :
 references : from : cc : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp;
 bh=eUOGg08hT/El2gaPgfweQkjqfO61g6ucjaADPvf7Yic=;
 b=qInWuI5htxcAQETvJ54rlb5232lWVNcGepnkKSfMVq0c22RIx50WkMl90IztflfB/CZP
 OvkCkeiHGZBXlPpHCnkGMvoFaS6sIzNnl0FPMioRHFG0VaDD2vZKd0iXVaGbBw1CKq+f
 G4jwjuAGRZIPX2jHpqJAL7Y0H44/AGiEC7rDIPIOTY1TkL1vaG67btAZOcTkXKNzajW3
 DamVM3s++8W2mlErNUzqtsIHtVbLpHdqydA/kxn3qaiHOSLsCFxJkV5C8Zxhct64u9We
 81QuTzMsu/ESVhpttGTxx9Ltt/LC5hogxjBEIfuKRjU5kgLRvvHDcD01+64M4R2KaIdp cg== 
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com [209.85.128.70])
        by mx07-00252a01.pphosted.com with ESMTP id 2v59999dt3-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=OK)
        for <linux-media@vger.kernel.org>; Tue, 24 Sep 2019 10:58:27 +0100
Received: by mail-wm1-f70.google.com with SMTP id 124so711167wmz.1
        for <linux-media@vger.kernel.org>; Tue, 24 Sep 2019 02:58:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.org; s=google;
        h=subject:to:references:from:cc:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=eUOGg08hT/El2gaPgfweQkjqfO61g6ucjaADPvf7Yic=;
        b=NWhID3J4crVHA9dnTKlsRb5OzUoAjT+3WSC6yTmG189gxaLCyrtMd4T6i3XT8GTNHJ
         HcdoVAKEdXxmn3CfAVmHk0y0bkC3n9hge5732n4n3M1EvMXaL2R3dTKqlYMcqIGEr8Hp
         zXW6gZ9tW+90EoE9yKVVdsY0J/udZe44R3Pxcrg/2Bu2/4Ti3aoAmUdt7sPdsD9ifjRa
         TsCiwYn7RaFPjGblLb0YjWVa19+eG/q1K7v/QeAwsWsGpx4DaVFBrmzaDmSiFQsMv9xC
         Fc6CSPo5GWt58sWvKoCwfrDH0hes8/THWi8tgJaq8xNuyRV6Cc6j27nKZ9Qd+Yoxi75m
         I5Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:cc:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=eUOGg08hT/El2gaPgfweQkjqfO61g6ucjaADPvf7Yic=;
        b=l6PxjschvP1SmjP7ZpowZeU7Fcf1ruWPP63RJHhYtx6U4MOw713p+T4l4PNnwvE7DN
         mmjP9ixbkaXTkkcBPDcdVDK7n1I0vQxHfRKQmqtITWdeZXGf9R61G8NjyCyltX0MAz6v
         8MpWYx6LwB/Nazabkj5GD6xiX0Y/exQeJyncm+JmSv+zb3q1tpets6uHXgochodPrWwv
         OXZlyQqgMVPQ5RvvXMDNl7qKDadGGErVYheTX1hphkR9AVQmgjSM464txwp/bqrLozct
         og/kzOV+CPwxkg2qpjPyNzdrdwvkE7jW22PR7/kY3/B81dDWNL0VzghQ52Ffj4WUnWDQ
         QjKA==
X-Gm-Message-State: APjAAAU9Krkh8S5bzoanuPT/BlT7tp6WaCaq4kbgQE+80h58ZaAOiEUk
        pHdFSFKDYhH2OJCqNWiIsRH5cGgD9P0fSIdhj1bnlaRU+/z12h+mf8PiUdJXTeVGFISQVvUMGix
        q7NwlIVn5VvxRuQnrkZNhGQ==
X-Received: by 2002:a5d:6ace:: with SMTP id u14mr1703745wrw.385.1569319107002;
        Tue, 24 Sep 2019 02:58:27 -0700 (PDT)
X-Google-Smtp-Source: APXvYqySn5092ZixdKiWNVL7T0CpP18ONMInXYW1KjfUhHsnaB4Rx748xN8g5pM9RMiWb3HihTR+Xg==
X-Received: by 2002:a5d:6ace:: with SMTP id u14mr1703727wrw.385.1569319106787;
        Tue, 24 Sep 2019 02:58:26 -0700 (PDT)
Received: from ?IPv6:2a00:1098:3142:14:4004:4e18:7f37:4b39? ([2a00:1098:3142:14:4004:4e18:7f37:4b39])
        by smtp.gmail.com with ESMTPSA id a18sm4229429wrh.25.2019.09.24.02.58.25
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 24 Sep 2019 02:58:26 -0700 (PDT)
Subject: Re: [ANN] Media sessions in Lyon in October: libcamera
To:     Hans Verkuil <hverkuil@xs4all.nl>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
References: <07f46758-66e3-5ac1-cc41-807a30f93359@xs4all.nl>
From:   Dave Stevenson <dave.stevenson@raspberrypi.org>
Cc:     Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Alexandre Courbot <acourbot@chromium.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Daniel Gomez <daniel@qtec.com>,
        Eugen Hristev <Eugen.Hristev@microchip.com>,
        Dafna Hirschfeld <dafna3@gmail.com>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Helen Koike <helen.koike@collabora.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Message-ID: <262eb602-b190-126b-6bb6-09fae4b10bed@raspberrypi.org>
Date:   Tue, 24 Sep 2019 10:58:25 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <07f46758-66e3-5ac1-cc41-807a30f93359@xs4all.nl>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
 definitions=2019-09-24_05:2019-09-23,2019-09-24 signatures=0
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 23/09/2019 15:21, Hans Verkuil wrote:
> Hi all,
> 
> Since we have three separate half-day sessions for different topics I decided
> to split the announcement for this in three emails as well, so these things
> can be discussed in separate threads.
> 
> All sessions are in room Terreaux VIP Lounge - Level 0.
> There is a maximum of 15 people.
> 
> The second session deals with libcamera and is on Wednesday morning
> from 9:00 to 13:00.
> 
> Attendees for this session:
> 
> Kieran Bingham <kieran.bingham@ideasonboard.com>
> Boris Brezillon <boris.brezillon@collabora.com>
> Alexandre Courbot <acourbot@chromium.org>
> Tomasz Figa <tfiga@chromium.org>
> Ezequiel Garcia <ezequiel@collabora.com>
> Daniel Gomez <daniel@qtec.com>
> Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
> Eugen Hristev <Eugen.Hristev@microchip.com>
> Shuah Khan <skhan@linuxfoundation.org>
> Helen Koike <helen.koike@collabora.com>
> Jacopo Mondi <jacopo@jmondi.org>
> Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Niklas Söderlund <niklas.soderlund@ragnatech.se>
> Hans Verkuil <hverkuil@xs4all.nl>
> 
> If I missed someone, or you are on the list but won't attend after all, then
> please let me know.

Could I be added to the list please?
Dave Stevenson <dave.stevenson@raspberrypi.org>

> Attendees: it is probably useful if you let us know whether you have to
> join this meeting because you plan to use libcamera, or if you are 'just
> interested'. After the libcamera presentation on Tuesday afternoon we
> should know how many of the 'just interested' list can join.

We're actively working with Laurent and team to get libcamera running on 
the Pi.

> Agenda:
> 
> Laurent, can you fill this in?
> 
> Regards,
> 
> 	Hans

Thanks
   Dave

PS Apologies if the formatting has gone mad on this. I no longer get 
linux-media messages directly due to some issue with mail servers 
somewhere, so I'm having to pull this off the NNTP server.
