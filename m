Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 23A531C69C2
	for <lists+linux-media@lfdr.de>; Wed,  6 May 2020 09:06:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727123AbgEFHGK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 6 May 2020 03:06:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37274 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726480AbgEFHGJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 6 May 2020 03:06:09 -0400
Received: from mail-qt1-x82d.google.com (mail-qt1-x82d.google.com [IPv6:2607:f8b0:4864:20::82d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A7AEDC061A0F;
        Wed,  6 May 2020 00:06:09 -0700 (PDT)
Received: by mail-qt1-x82d.google.com with SMTP id j2so540705qtr.12;
        Wed, 06 May 2020 00:06:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:message-id:in-reply-to:references:subject
         :mime-version:content-transfer-encoding:content-disposition;
        bh=K6l8KY9KgPkWGL14r+EOHJ+Api8UIYnDz5GCp2L57d4=;
        b=nIVSMDCXdP4EBpkn+DWvEUbG+JWKBVV/MPWp+Dzlx+waX/5WNtffLnl4+Gm8TuYZeg
         EledgtW0wZNrxITAro7N62EugfevycLKWXzX10OykEvmGhOtGmAC3x6LOnG5YXtn1ohG
         9YOAb1mbzoxEJyZuMfvkYcH+BakWoNQEq7A09MHm00FZ8XeW+VLdPj6F2a5UvZ0fyaNK
         ElXs2WHUjsBTV9Z2zOb+Qbs736wSw64LyxB70h47BY/zikFTJzTk6hjLvtZHo2XP+wKj
         wLlhaMscmnnzFhhS4RlsFMZyAelKcVDPABl9U67VTVbPaxZowWiVn5UDzySLBW48olNk
         szQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:message-id:in-reply-to
         :references:subject:mime-version:content-transfer-encoding
         :content-disposition;
        bh=K6l8KY9KgPkWGL14r+EOHJ+Api8UIYnDz5GCp2L57d4=;
        b=RTpi2R14h4YYD0IXB7gulNPKljThGKiKJfnAXPyvBPffneT1ZKcvzZUZ/j5BsxaeHi
         kji69Ut6ypyi1mq6Pl+FFvnj+S2bej5R9lrfSs2dykBuUC7JyE72ulZS7T5y0S1HtN2C
         telpELtLKm3H4VDDX+yC68VKwwKRJV8PVEoNYM8AlegLIYJrFRowPIz1A69tj5E7J8ly
         35lL7TDeuAxfggoF86/Gc/u3f6DJlnrBPIiL6XxeZjMGg1u4NnU5eFRK09fYCwlF1f8P
         IbS/yWrXxMMOLNPI2xTVFIctjcL6jV3pfhVi7Ca84DVpmvZwVBbRJspuDWmF8DP7WIum
         KnPQ==
X-Gm-Message-State: AGi0PuZdmTgos0ojX8//lJW5OgYkxw3kQDouqsmDiqjcQgatwGWHCNfx
        vNHcSgC7Gm1FiKgSuAD2xMQ=
X-Google-Smtp-Source: APiQypJzL+DMV903BNl1mG0nAnxu64WBIMH2Hl/jOjf8pJ3K006CWQLtjtbEh2Mk7Xl67VaZX2VRTw==
X-Received: by 2002:ac8:66cf:: with SMTP id m15mr6777065qtp.146.1588748768680;
        Wed, 06 May 2020 00:06:08 -0700 (PDT)
Received: from dwls-dell ([177.193.195.148])
        by smtp.gmail.com with ESMTPSA id z40sm818400qtj.45.2020.05.06.00.06.05
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 06 May 2020 00:06:07 -0700 (PDT)
Date:   Wed, 6 May 2020 04:05:25 -0300
From:   "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     "=?utf-8?Q?sean=40mess.org?=" <sean@mess.org>,
        "=?utf-8?Q?kstewart=40linuxfoundation.org?=" 
        <kstewart@linuxfoundation.org>,
        "=?utf-8?Q?allison=40lohutok.net?=" <allison@lohutok.net>,
        "=?utf-8?Q?tglx=40linutronix.de?=" <tglx@linutronix.de>,
        "=?utf-8?Q?linux-media=40vger.kernel.org?=" 
        <linux-media@vger.kernel.org>,
        "=?utf-8?Q?skhan=40linuxfoundation.org?=" <skhan@linuxfoundation.org>,
        "=?utf-8?Q?linux-kernel-mentees=40lists.linuxfoundation.org?=" 
        <linux-kernel-mentees@lists.linuxfoundation.org>,
        "=?utf-8?Q?linux-kernel=40vger.kernel.org?=" 
        <linux-kernel@vger.kernel.org>
Message-ID: <48DFD57D-AE44-4117-A408-F6D557281FB0@getmailspring.com>
In-Reply-To: <20200503111338.53db66b8@coco.lan>
References: <20200503111338.53db66b8@coco.lan>
Subject: Re: [RFC, WIP, v4 11/11] media: vidtv: Add a MPEG Transport
 Stream Multiplexer
X-Mailer: Mailspring
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro! Thank you for reviewing this!


>> Add a MPEG Transport Stream multiplexer responsible for polling encoders,
>> interleaving packets, padding the resulting stream with NULL packets if
>> necessary and then delivering the resulting TS packets to the bridge
>> driver so it can feed the demux.
>> 
>> This patch includes a "channel" abstraction, which attempts to map a
>> MPEG service into a struct that vidtv can work with.
>> 
>> When vidtv boots, it will create some hardcoded channels:
>> 
>> -Their services will be concatenated to populate the SDT.
>> -Their programs will be concatenated to populate the PAT
>> -For each program in the PAT, a PMT section will be created
>> -The PMT section for a channel will be assigned its streams.
>> -Every stream will have its corresponding encoder polled to produce
>> TS packets
>> -These packets may be interleaved by the mux and then delivered to
>> the bridg
>> 
>> Signed-off-by: Daniel W. S. Almeida <dwlsalmeida@gmail.com>
> 
> The same notes I made on previous patches apply here.

I did not understand this. Do you mean to say that I should remove these
dashes in the beginning of the lines?


thanks
- Daniel
