Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D0F1D1361ED
	for <lists+linux-media@lfdr.de>; Thu,  9 Jan 2020 21:43:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731412AbgAIUnT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 9 Jan 2020 15:43:19 -0500
Received: from mail-qv1-f68.google.com ([209.85.219.68]:38909 "EHLO
        mail-qv1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731407AbgAIUnT (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 9 Jan 2020 15:43:19 -0500
Received: by mail-qv1-f68.google.com with SMTP id t6so3581785qvs.5;
        Thu, 09 Jan 2020 12:43:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=ef9/tFIDN6mikvhUQb4XMvHbbgBUrjC1EBqGZF+FLsk=;
        b=sXFXkHka6oKVtQKVKZiBjE9C/sNZvR9m0AACc3oWtVDWSoMaHGL02DqGyopAKIUsxv
         NCXnuHkaPglMJsl6oWOfQL3ICcECz229wJdXw5bxIfUtxQZNfY8G4AOEVWt9tFHfzcNI
         2WzPUiExo5v+4FOtJPA1ARVI9eA9kK8j6PlRuSJVxajHDSZddB3J+oIRHtXmnMFJvSuO
         wH3Jp9vqCGHD06jOJdG/TS/oKvzGsMXGWD0YcxH8BejChxm5UC7Hrd8Q+/WQ1MBuZXGO
         JMXao3zFB6DIjqCTXt5F1PV2yd0n7pldDn4hMgzzQou4FggV+q7AZw0dRpJpuUTxVAfK
         M2fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=ef9/tFIDN6mikvhUQb4XMvHbbgBUrjC1EBqGZF+FLsk=;
        b=EdvYvNyS52Hg+kifedt2EUDM2UG8oa01i3nCingWhfM2CHU0gTyD/v54dlQ1B0y/sS
         Wgw4Pi3yygIRSop0Wb1r1dFZJXUOqvZtL7hku0oSMF+bsPgFBj1caDRehVmoKP9d4RQ8
         l8SW+y3UxCPVfubzcbNh+4vyUFT3SBnuYbE7PmQTcM7oIKEi66WEFKjxkrMr6xj095OJ
         PfVLrXmqKYpQIVuF8Bt7opuPLNR0PcUGcPwznGo1a5lh66K0E2wj9HM/utj+nFsLo1rd
         AS9XxEnxpY5K7O2YiBRWT3RTKUTG2D2TvNTXwS3hsQNBnnRx2gQpM9XHyBDOOxNh0lIp
         UixQ==
X-Gm-Message-State: APjAAAXTD7j7pnGmsD4B+RbVmnfAIJHnbFivLT4V9xyIcWHnTj8ezqoY
        x9Xem50yIqMl2EVKXQMBLEE=
X-Google-Smtp-Source: APXvYqyy/kx651cOXGkIrrG6zslGb9MsDswmcdV/3oXSGQgr334qQh80B8EWLVv92a39Y/yyg/53Lw==
X-Received: by 2002:a05:6214:38c:: with SMTP id l12mr10604400qvy.224.1578602597906;
        Thu, 09 Jan 2020 12:43:17 -0800 (PST)
Received: from ?IPv6:2804:14d:72b1:8920:a2ce:f815:f14d:bfac? ([2804:14d:72b1:8920:a2ce:f815:f14d:bfac])
        by smtp.gmail.com with ESMTPSA id u52sm4018315qta.23.2020.01.09.12.43.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jan 2020 12:43:17 -0800 (PST)
Subject: Re: [PATCH 1/1] media: dvb_dummy_tuner: implement driver skeleton
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     mchehab@kernel.org, sean@mess.org, tglx@linutronix.de,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        skhan@linuxfoundation.org,
        linux-kernel-mentees@lists.linuxfoundation.org
References: <20200109152408.919325-1-dwlsalmeida@gmail.com>
 <20200109152408.919325-2-dwlsalmeida@gmail.com>
 <20200109155437.GA568342@kroah.com>
From:   "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
Message-ID: <c242068a-ad8c-be27-4c95-22cb5ff17216@gmail.com>
Date:   Thu, 9 Jan 2020 17:43:13 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <20200109155437.GA568342@kroah.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Greg! Thanks for chiming in.


> As you are a driver, you should never need to call any pr_* calls,
> instead use dev_*().  For this, you can use dev_dbg(), but really, why
> is that even needed except for your debugging bringup.  And for that,
> you can use ftrace, right?  So no need for any printing of anything
> here.
> Again, dev_err() would be proper, but there's no need for any error
> message here.

Let's take these out in v2 then.


> Don't you need to register the tuner ops with something in this
> function?
> Don't you need to unregister the tuner ops in here?

It is my understanding that bridge drivers are the ones responsible for 
this. For instance, I don't see this with either xc4000.c, xc5000.c or 
mt2060.c. I could be wrong, though. Maybe Mauro could clarify this?

What I did miss in this patch was an attach function. Let's also add 
this in v2.


Thanks again,

- Daniel.

