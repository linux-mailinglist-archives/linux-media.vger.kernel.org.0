Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CEC461398CB
	for <lists+linux-media@lfdr.de>; Mon, 13 Jan 2020 19:23:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728741AbgAMSXJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 13 Jan 2020 13:23:09 -0500
Received: from mail-qk1-f196.google.com ([209.85.222.196]:34040 "EHLO
        mail-qk1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728633AbgAMSXI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 13 Jan 2020 13:23:08 -0500
Received: by mail-qk1-f196.google.com with SMTP id j9so9458275qkk.1;
        Mon, 13 Jan 2020 10:23:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=YmmSvyn5Ka4mUit6kvopVG0e++A9vopcwQJc+Ac8cPw=;
        b=g3m860U9KBcklp4Vfp3dHNeOazKl1B5xu7fRIlJZWuhUQz0Cx4K17MuU1Fz+04I6GK
         f2gKden77W05LeVTFtP/oKlhs+VjKw+BPwbC0lMAKVp5l9VPICVLujTcx7KqtAWxIm5r
         jpJSMfnCwUdE7zfsmhrLwQI1sF27RKuKhMgVnERPMI9ASwcqNJ8FmfGeGPQk/Ioh4Vas
         Ju+b9MohiFDL6WYYs3tECijiFTJbJc9MS/F3mMveT9fzC5k966lxdZ/V5/7/6wG3vr8w
         4SKGcNOfRDCDnAlL75BhVkUi6eH9pX82JMfZkget/d5O/qFBYPs1G9bs2lwnNgjnaPwl
         xClA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=YmmSvyn5Ka4mUit6kvopVG0e++A9vopcwQJc+Ac8cPw=;
        b=C+/1Zyi8bVjzMa+l6KOp0vbEhqf550729cZaweSm684QHePXmkY5LRccXTwEf6MuGC
         p/k6hMXtY8yAW8ugZquSFdLn0PQyrockXJ9CNcTap+jTEyNE8b+RqMW4RyBtFViDa200
         txBiyIEF7nKoxZ8SiIR1Y/cfvXB07ddclXaNsWaun+/FUL7lpoa2KSL/L3GDadYZ86T+
         2/BAi5NnZh0XsV/Zgtb3MUVo5dsXGfrTMqI/Ohq87EHQ+kg34mGYpD27FsIJLXGJZgIY
         wfNYPp48tcv5phimvjP7q5iwfXTSNmjke00pXMEgBe5aA13xViCGkc3isY/ybBVe+gAl
         fXkw==
X-Gm-Message-State: APjAAAVVwOccdzpBPt8vT6o3xQylmMLwKGcFBrE5krS6osI8Qbh5l7oY
        6ucB6o04xq3qskiO9k1y+Ug=
X-Google-Smtp-Source: APXvYqzpHpCANvGcMQtO+BCaZNdbqhnWjfbggggFs7EUVOZ3FcLytDzEYS3jnGLSYEpcYWgZynigQg==
X-Received: by 2002:a37:e210:: with SMTP id g16mr17483419qki.413.1578939787671;
        Mon, 13 Jan 2020 10:23:07 -0800 (PST)
Received: from ?IPv6:2804:14d:72b1:8920:a2ce:f815:f14d:bfac? ([2804:14d:72b1:8920:a2ce:f815:f14d:bfac])
        by smtp.gmail.com with ESMTPSA id w25sm6098136qts.91.2020.01.13.10.23.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jan 2020 10:23:07 -0800 (PST)
Subject: Re: [PATCH v2] media: dvb_dummy_tuner: implement driver skeleton
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     mchehab@kernel.org, sean@mess.org, tglx@linutronix.de,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        skhan@linuxfoundation.org,
        linux-kernel-mentees@lists.linuxfoundation.org
References: <20200109233757.734008-1-dwlsalmeida@gmail.com>
 <20200110073024.GA156006@kroah.com>
From:   "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
Message-ID: <d6d119cf-7447-31ce-37db-25503cf2f9bc@gmail.com>
Date:   Mon, 13 Jan 2020 15:23:02 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <20200110073024.GA156006@kroah.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Greg,

I am working on v3. Would you mind clarifying this?


>> + *
>> + * The virtual DVB test driver serves as a reference DVB driver and helps
>> + * validate the existing APIs in the media subsystem. It can also aid developers
>> + * working on userspace applications.
>> + *
>> + * This dummy tuner should support common TV standards such as DVB-T/T2/S/S2,
>> + * ISDB-T and ATSC when completed.
>> + *
>> + * Copyright (c) 2020 Daniel W. S. Almeida <dwlsalmeida@gmail.com>
> Normally this is the first comment line above in this block.
>

Just so we're clear, do you mean this? e.g.:

+ * Copyright (c) 2020 Daniel W. S. Almeida <dwlsalmeida@gmail.com>
+ *
+ * The virtual DVB test driver serves as a reference DVB driver and helps
+ * validate the existing APIs in the media subsystem. It can also aid developers
+ * working on userspace applications.
+ *
+ * This dummy tuner should support common TV standards such as DVB-T/T2/S/S2,
+ * ISDB-T and ATSC when completed.
+ *


> Not the same license as your .c file?  Odd :(

Oops! :(


> If you keep this file, same comments as above for the comment block, but
> really, you don't need this .h file at all, just drop it.

OK.


- Daniel


