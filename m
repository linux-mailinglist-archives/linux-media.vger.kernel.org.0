Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2CFA015FEEE
	for <lists+linux-media@lfdr.de>; Sat, 15 Feb 2020 16:15:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726211AbgBOPPP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 15 Feb 2020 10:15:15 -0500
Received: from mail-qk1-f193.google.com ([209.85.222.193]:38622 "EHLO
        mail-qk1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726143AbgBOPPP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 15 Feb 2020 10:15:15 -0500
Received: by mail-qk1-f193.google.com with SMTP id z19so12145154qkj.5;
        Sat, 15 Feb 2020 07:15:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=uWzLjbBp8aRsVSLKA91aPxd7wXiz/npdTaFsiixqRhM=;
        b=ob1M+dVQyL97DzvdG6/rS1nbpt+LYfpjmAUF7JHhdbEl9u6fZrcYi8ZKLRxYs10wm+
         hbURUmByVSIB8x+5qdjbXtXCOgb+lKBqJwd+iyfL/Z+NhKrCm7ZD4H/5pTsS+R34P4Df
         CcMLOB0B0Tg7vQFawFdDQk1GlYgSWAF8lsGvMdJpQ7E+M1P3gFvJyvm6aMkpTHV5y1v2
         0hW9uDFk6pOIKTy5AN7tDMjhNwJpVcaU3dc5E/mefQCz+s89pVzmyt0LY/4WFnjstOYy
         a6aubSK0jx/Oj7sKE0Qbog7f84HUDCiCKKcS3HhaBnUeb1KmcMzMRJLBt+y6LoInnpil
         oVjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=uWzLjbBp8aRsVSLKA91aPxd7wXiz/npdTaFsiixqRhM=;
        b=Tdnm/t0Hel2XJHTuxM0s2lXCfu0y60pLtAORMGTRDlI2LElE1dWcMeCZJSjSUlL+FG
         TO67enMRzgrlexUdb7+WrgsJv8ZGTKwKTzgYcVQ1o5J2vKltP3qETrQpfsk+tNKvrLyV
         LT63qrcBVGVJcR5JATA2/qAPYzFKiIREDGDLuiJJ7KAbhZ8FH/XyMhxRoMkfcR6wbzMf
         dtN9PFZkef9g3gXF4CdM/N8Yf6E7juQFq1zoqodaSEzAKYsNsAG+jdr7fIuS6HilVHy+
         j+MZG8pfGH6HSaCgP/Trq/LnTrX4wypzzL0kUG3kAJ/kwmwRyD104ch8VWx30uRv03vw
         Wn8Q==
X-Gm-Message-State: APjAAAUQRK0LCtJ4YEqCKMdSTS1on6RtyYl6nU8aJDmiyasYM18AK9AS
        mfws4Z3MwFYFak/gieUCAPE=
X-Google-Smtp-Source: APXvYqxpvAHSD/naM2yaCHrG1MA+Xkos4kcUo2nI3mT+HBKkPxDMv80TmBa+NMdsC9D3tFlp12ooAQ==
X-Received: by 2002:a37:47c4:: with SMTP id u187mr7502718qka.165.1581779712998;
        Sat, 15 Feb 2020 07:15:12 -0800 (PST)
Received: from ?IPv6:2804:14d:72b1:8920:a2ce:f815:f14d:bfac? ([2804:14d:72b1:8920:a2ce:f815:f14d:bfac])
        by smtp.gmail.com with ESMTPSA id d16sm1487549qkc.132.2020.02.15.07.15.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 15 Feb 2020 07:15:12 -0800 (PST)
Subject: Re: [PATCH v5] media: dvb_dummy_tuner: implement driver skeleton
To:     Nathan Chancellor <natechancellor@gmail.com>
Cc:     mchehab@kernel.org, sean@mess.org, tglx@linutronix.de,
        gregkh@linuxfoundation.org, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, skhan@linuxfoundation.org,
        linux-kernel-mentees@lists.linuxfoundation.org
References: <20200210154102.118166-1-dwlsalmeida@gmail.com>
 <20200214050813.GA37036@ubuntu-m2-xlarge-x86>
From:   "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
Message-ID: <886c816b-65a4-9cd9-4c94-f8025b63de4c@gmail.com>
Date:   Sat, 15 Feb 2020 12:15:07 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200214050813.GA37036@ubuntu-m2-xlarge-x86>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Nathan,

> This patch and another one that you have [1] cause a ton of build
> warnings with clang, as reported by the 0day bot, because of the
> implicit conversions from floating points to integer. Is this
> intentional? Would you mind taking a look at them and addressing them if
> you do another revision?

Sorry I did not catch that back then. I'll fix it in a future revision.

Thank you for letting me know.


- Daniel.

