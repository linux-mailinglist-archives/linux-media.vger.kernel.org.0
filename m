Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BBB5F26B813
	for <lists+linux-media@lfdr.de>; Wed, 16 Sep 2020 02:36:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726772AbgIPAfz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 15 Sep 2020 20:35:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52672 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726634AbgION1R (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 15 Sep 2020 09:27:17 -0400
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com [IPv6:2607:f8b0:4864:20::741])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD14DC0611C2;
        Tue, 15 Sep 2020 06:26:23 -0700 (PDT)
Received: by mail-qk1-x741.google.com with SMTP id t138so4195164qka.0;
        Tue, 15 Sep 2020 06:26:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:message-id:in-reply-to:references:subject
         :mime-version:content-transfer-encoding:content-disposition;
        bh=ECv1tH4dixNsdKxQCqvGJD0xyYRqc/3rORp/BHVcsQ4=;
        b=rrUc/Nra5A278GUSmFmQgG0+9yiyz/Kp+IF8tT6eTd3T2zNG1ooEzO9ZlSCCOlPi9X
         hG+YWCMJqq8/nKJTh+UiUyP6E0SMGLppdAPCAjaCaYUxKK9DFJQnilOVBKn6ywicFDW9
         T/ep8wEpWgIA4CJKCzGviWoNMJFKt7DlgQ9U8gBz4HvwOmAkzWa1iRRXhtlTfNTo8kYK
         0Hh34hrXFgxJGrpV+bUnZYlVeXVlXR61XN5mr9hcMvIBijH7CUpZH5Ym59hVq3kWILQU
         DSxDsdz+dODQ0fV5f6teQgCvV8Lb7WfrlqTz0PghqhgX0cWebwp42woWsJ9gpR9iVoNM
         iUXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:message-id:in-reply-to
         :references:subject:mime-version:content-transfer-encoding
         :content-disposition;
        bh=ECv1tH4dixNsdKxQCqvGJD0xyYRqc/3rORp/BHVcsQ4=;
        b=Ju0QQeeXlNAkiUqnCFHgoU3oP5xMqJDNV+1x7BzbtboOmS+M5Z157hxVOS9SAFo7IH
         iR4gr4W7wVyHOy0jQ71E71c1JRXtdhM3wE5xhoaDr3wx+52Vct7RpqUSbnx1JgSkptap
         LWxEn/RjRaNz9OLtQEHISvb6V77yOfNcNZOuk9hlSF0XGyZ1BRbEeHomQg6Idho+0LdU
         EzAFNYvHZaKiBZKnukRDsZQ56bosvd/odS4joSmlmumruqJAADHxpPNvlYeH7mtXv3Vm
         pwi1x+hS25GPyhKRRpgeXnB+QxNm1L9eyc2heTEey/fAJ/OefUxiL2cumsbE/Eff/ukQ
         f9Cg==
X-Gm-Message-State: AOAM531ggIQXjc39GoT9KFwRBaG9DVRfb/5rJXo+xdQ5XoVvLoZehUqK
        Ff/l5IMh1qgZjDlRtsfRd8g=
X-Google-Smtp-Source: ABdhPJzuz0o4wLDw+Cjo2IgGvOxLPSDN8JBtV21hG89SBTjGoXxWC7vpcN1/qhgD+HtvnbTR9wKs5w==
X-Received: by 2002:a05:620a:13e8:: with SMTP id h8mr17496044qkl.322.1600176383031;
        Tue, 15 Sep 2020 06:26:23 -0700 (PDT)
Received: from dwls-dell ([2804:14d:72b1:8920:a2ce:f815:f14d:bfac])
        by smtp.gmail.com with ESMTPSA id g45sm17473139qtb.60.2020.09.15.06.26.20
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 15 Sep 2020 06:26:22 -0700 (PDT)
Date:   Tue, 15 Sep 2020 10:26:17 -0300
From:   "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     "=?utf-8?Q?mchehab+huawei=40kernel.org?=" <mchehab+huawei@kernel.org>,
        "=?utf-8?Q?r.verdejo=40samsung.com?=" <r.verdejo@samsung.com>,
        "=?utf-8?Q?nicolas=40ndufresne.ca?=" <nicolas@ndufresne.ca>,
        "=?utf-8?Q?linux-media=40vger.kernel.org?=" 
        <linux-media@vger.kernel.org>,
        "=?utf-8?Q?skhan=40linuxfoundation.org?=" <skhan@linuxfoundation.org>,
        "=?utf-8?Q?linux-kernel-mentees=40lists.linuxfoundation.org?=" 
        <linux-kernel-mentees@lists.linuxfoundation.org>,
        "=?utf-8?Q?linux-kernel=40vger.kernel.org?=" 
        <linux-kernel@vger.kernel.org>
Message-ID: <EA89ED5D-E477-4464-B523-D729796CE0D0@getmailspring.com>
In-Reply-To: <alpine.DEB.2.21.2009151345001.31296@ramsan.of.borg>
References: <alpine.DEB.2.21.2009151345001.31296@ramsan.of.borg>
Subject: Re: [v10 3/4] media: vidtv: add a bridge driver
X-Mailer: Mailspring
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Geert,

Thanks for bringing this to my attention.


>> +	u32 nbytes = 0;  /* the number of bytes written by this function */
>> +
>> +	u64 nbytes_expected; /* the number of bytes we should have written */
>> +	u64 nbytes_streamed; /* the number of bytes we actually wrote */
>> +	u32 num_null_pkts; /* number of null packets to bridge the gap */
>> +
>> +	u64 elapsed_time_msecs = jiffies_to_usecs(m->timing.current_jiffies -
>> +						  m->timing.past_jiffies);
>> +
>> +	elapsed_time_msecs = min(elapsed_time_msecs,
>> (u64)VIDTV_MAX_SLEEP_USECS / 1000);
>> +	nbytes_expected = div64_u64(m->mux_rate_kbytes_sec * 1000, MSEC_PER_SEC);
> 
> Seriously?!?
> 
> You multiply by 1000 first, followed by a division by 1000 using an
> expensive 64-by-64 division?

This entire function is broken and needs a do-over :)

> using an expensive 64-by-64 division?

I am new to kernel development. I wasn't even aware that this was
expensive, to be honest.


>> +	if (nbytes_streamed < nbytes_expected) {
>> +		/* can't write half a packet: roundup to a 188 multiple */
>> +		nbytes_expected  = roundup(nbytes_expected - nbytes_streamed, TS_PACKET_LEN);
> 
> drivers/media/test-drivers/vidtv/vidtv_mux.o: In function `vidtv_mux_tick':
> vidtv_mux.c:(.text+0x788): undefined reference to `__udivdi3'
> 
> This is a 64-by-32 division, hence it should use a helper from
> <linux/math64.h>.
> 
> However, I'm wondering if "nbytes_expected - nbytes_streamed" is
> guaranteed to be a "small" number, hence a 32-by-32 division would be
> sufficient?

I think so.

I will send a patch to address the things you pointed out in this email.

-- thanks
-- Daniel
