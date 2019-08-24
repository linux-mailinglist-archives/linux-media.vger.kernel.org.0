Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 46DD09BCF9
	for <lists+linux-media@lfdr.de>; Sat, 24 Aug 2019 12:10:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727061AbfHXKKh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 24 Aug 2019 06:10:37 -0400
Received: from mail-pl1-f194.google.com ([209.85.214.194]:45577 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726058AbfHXKKh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 24 Aug 2019 06:10:37 -0400
Received: by mail-pl1-f194.google.com with SMTP id y8so7144919plr.12
        for <linux-media@vger.kernel.org>; Sat, 24 Aug 2019 03:10:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=C/no0rATGiexqu7C3u19f6rIL4Dq8paWqmzNHd71aAw=;
        b=iM3p4J4UQl5cTKaYxnWSa0T50dSBb8ks6U3RCWVc6nhuo9cxlGCkB/fOJNXu0JbA6N
         71suazFUYlMeHDVGImF8fRm98tbUVDv9M1XT12wEJqg9wXh4m4793H51Z3iUhfNWFzqU
         5JGusNy/xQEbSaaCh3Qz7OksfRPgTd7qgPz7/qER5uqWwUT6tnTUPxVKOZ3FtqSBKxTk
         ezBr4jvP6Kq6667RTAV+opdWVjgJEVwTErEBKhImDgNVS9XmWI4M1Ye/a6zdhf5sf6Qa
         AQg6cJvnW8VBHxGhMcoVB+IwyGVU0v17E/n2hC/l76LOgEw9q7tn2APk+Vm+8Er7PyCv
         SHSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=C/no0rATGiexqu7C3u19f6rIL4Dq8paWqmzNHd71aAw=;
        b=TpLC46ln4Sj1eiAqT8wkoTuZ9YDKQ10F+Chjimruxk2pI6tFk4OT92ukbgnIXBYhKD
         iPABkt5g0QSHfZBqpcoIWJJZl3KMvw1CxM2Kr40vOBDVQmTEwLZBFcpApf+6mBZtk4lt
         swZndWZ4wHCEYNojwdtWMivd9ixV7EtBM4NDOTcBcnXjlMm124NUqlGy14zUwoBWzsIy
         4UL+uN92XBkf8XWOt/aDz15gma0IHH91FVuxwShRu91p60BfzR4BumhswOkoQSuORJR3
         P4PGBoO3XM/jbUtyMVvijLm/eLh3ySAHb/ABbL/kSuIuiFEE/CX2r4eajQvF9BbfEFlf
         nagQ==
X-Gm-Message-State: APjAAAVaBJIVN/if2QLj5LbNE1wucc53uPh5cSq/PZIzRoobgp8BcwxM
        LIgSNtc9awxPwnuR7LGAPHU=
X-Google-Smtp-Source: APXvYqxvZbuIc8etLwBfI5Jyk/MCuEFqWQtmd0LvhVG8T5YxeufA2sYnSEJrCn5NnNyUqoBZYE07cQ==
X-Received: by 2002:a17:902:9a8b:: with SMTP id w11mr9575600plp.171.1566641436381;
        Sat, 24 Aug 2019 03:10:36 -0700 (PDT)
Received: from [192.168.3.4] (softbank219203027033.bbtec.net. [219.203.27.33])
        by smtp.gmail.com with ESMTPSA id a11sm4665978pju.2.2019.08.24.03.10.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 24 Aug 2019 03:10:35 -0700 (PDT)
Subject: Re: [PATCH] gl861: re-implement i2c adapter logic
To:     Antti Palosaari <crope@iki.fi>
Cc:     linux-media@vger.kernel.org, sean@mess.org, mchehab@kernel.org
References: <20190822053452.20168-1-crope@iki.fi>
 <e0052c5b-de39-8fd6-abd8-3cc38d6f21ee@iki.fi>
 <3d2278c5-75a5-7a49-fd36-16e44fbc8849@gmail.com>
 <0a092b24-aa04-65b1-2575-1965e3870f34@iki.fi>
 <3c58a680-4a02-2e25-40c5-f064006f064b@iki.fi>
From:   Akihiro TSUKADA <tskd08@gmail.com>
Message-ID: <6e8af87f-0670-b016-3629-9ef6f87ed000@gmail.com>
Date:   Sat, 24 Aug 2019 19:10:32 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <3c58a680-4a02-2e25-40c5-f064006f064b@iki.fi>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US-large
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi, thanks for the patch.

> See updated patch on ml.

This raises two concerns for me:

[1]. Clients must split an I2C transaction of one read into two,
releasing the lock between them.
They might be interrupted (for example) by other read transaction
to another tuner, (or by other, un-related I2C to the demod),
and get wrong result.

ex.
1. write a read command to tuner@<I2C addr XX>
    40 03 00 30 fe 00 01 00 >>> (XX << 1) | 1
2. write another read command to tuner@<I2C addr YY>
    40 03 00 30 fe 00 01 00 >>> (YY << 1) | 1
3. read the result from tuner@XX
    C0 02 00 30 00 01 01 00 <<< ??? # which one?
4. read the result from tuner@YY
    C0 02 00 30 00 01 01 00 <<< ??? # right/valid answer?

[2]. There are (fairly common) use-cases of 2-Bytes, non-short writing,
     which is not seemed to be supported by this patch.
 ex. tuner read log from my previous post. (no tuner register)
    40 03 00 30 fe 00 01 00 >>> c1  # addr:0x18, buf = {0xfe, 0xc1}

And friio itself also uses those 2-Bytes non-short msgs in its reset,
to control some peripherals other than demod/tuners.
 ex. gl861.c::friio_reset()::line 422
    40 03 00 12 03 00 01 00 >>> 80  # addr:0x09, buf = {0x03, 0x80}


But It may be possible to get around all these concerns.
For [1], demod usually does not share tuner I2C access like this.
For example, tc90522 supports multiple tuner input but has separate
demod blocks for each input with distinct I2C address.

For [2], 'short write' version might work still. (not sure/verified)
    (40 02 c1 30 fe 00 00 00 >>>)
And friio can use gl861_ctrl_msg() directly instead.

So, anyway I will try to re-structure i2c in friio
and test/verify it.

Regards,
Akihiro

