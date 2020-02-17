Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BF32016161E
	for <lists+linux-media@lfdr.de>; Mon, 17 Feb 2020 16:25:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727815AbgBQPZg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 17 Feb 2020 10:25:36 -0500
Received: from mail-wr1-f42.google.com ([209.85.221.42]:36137 "EHLO
        mail-wr1-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727283AbgBQPZg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 17 Feb 2020 10:25:36 -0500
Received: by mail-wr1-f42.google.com with SMTP id z3so20269861wru.3
        for <linux-media@vger.kernel.org>; Mon, 17 Feb 2020 07:25:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kynesim-co-uk.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:references:in-reply-to
         :user-agent:mime-version:content-transfer-encoding;
        bh=jiueTjnQkxPVXNbr2q9FbLY1p+XsiMj4uDetMSC4Rts=;
        b=rizarszHTce91EHTI/ACcy8DPFo4Cu2c3dGo4/q684SUDBUucL5RBrxB0q6nmYc1Vq
         mcuSc6J2/V5pk6h6cgcEMWXnEHwxmNM6zQaO90bvIZ6nW2ThCvoA/fmbzy650cjjR9Tz
         K2hkmOqQFqa9o3agbdPoRyy5PWfK9ivpwStMcxmLckWZkilKcMvFy5gXSm+9wYCQD/2R
         RFN75Z0zNjWGOjAztlvnQJb6Fr6uOTFj73TSRqccpouJhR/p2RHvVhkNf9+G9YLoxN0M
         YdZjYkUXQxpbJ2f/OO37M2H3OdzLr7RkqXD09AJ2S7GHyyCySLpd7DzQZD5xU7ho+IKt
         1Fyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:references
         :in-reply-to:user-agent:mime-version:content-transfer-encoding;
        bh=jiueTjnQkxPVXNbr2q9FbLY1p+XsiMj4uDetMSC4Rts=;
        b=k0pzLZfxpCORww9sDivS6Le/VjEd9E1YPkUnum1hWMIf2COaASomozxlavUqKV2syG
         GomV9ONGnehywc/tyd5TUGX7NneaN3n7BKlYAoIhfux9h+Gf3FEFWvJe9SnubLVhgqIg
         i8l901Ti6s0s6xUhWY5syChkDFnOBkjMzZYWYhocLyO6X2yXxKxLecLdNl80dtyk8GP8
         XSYBEFnljhSs5qAa4WvAX9VxR1KTf5jWmyVKSTgJLa3NLI9jWaNMiC5fUPnC3A/dwM6U
         Q5UtdO5sLibukZA+TSY6Mj8gC/ZxLd5w7M4vsunkTkQMhPlf6b4NSTmddDNGp6KTBfJ9
         F8pQ==
X-Gm-Message-State: APjAAAUlCA3cajVtADhlgHYTJlcs1K1ts3jZ3GLKtZQir1bfdYTT64Yz
        T/RH8tK/zCRlZP3vyZCuypoK9H8201I=
X-Google-Smtp-Source: APXvYqx/V1Q6Q9KkIdtNR6M8erRHYHS14Z21qhggNDVHeodrc+6/7APcugyhq5JKPACVKBrOuPTArw==
X-Received: by 2002:a5d:538e:: with SMTP id d14mr23669471wrv.358.1581953133993;
        Mon, 17 Feb 2020 07:25:33 -0800 (PST)
Received: from ULTRAMARINE.kynesim.co.uk (238.196-30-62.static.virginmediabusiness.co.uk. [62.30.196.238])
        by smtp.gmail.com with ESMTPSA id h10sm991603wml.18.2020.02.17.07.25.33
        (version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Mon, 17 Feb 2020 07:25:33 -0800 (PST)
From:   John Cox <jc@kynesim.co.uk>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     linux-media@vger.kernel.org
Subject: Re: Multiple activve jobs with the V4L2 request i/f?
Date:   Mon, 17 Feb 2020 15:25:33 +0000
Message-ID: <vlbl4f9fed602ou27elllg41p3genbb4lh@4ax.com>
References: <2p0l4fhbn1mvfcm8h5kubi44kujkmgm0sg@4ax.com> <e2c86cba-5800-927b-c0fe-f8f9d009d742@xs4all.nl>
In-Reply-To: <e2c86cba-5800-927b-c0fe-f8f9d009d742@xs4all.nl>
User-Agent: ForteAgent/8.00.32.1272
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi

>Hi John,
>
>On 2/17/20 1:16 PM, John Cox wrote:
>> Hi
>>=20
>> I have built a H265 V4L2 request decoder and I based it on the staged
>> sunxi cedrus decoder.  As it stands it appears to me that in the =
request
>> environment one request comes in which is processed and then is acked
>> with v4l2_m2m_buf_done_and_job_finish which returns the output & =
capture
>> (if not held) buffers and then the next request can start.  Our decode
>> process has two passes and so is most efficient if two frames are =
being
>> processed at the same time.  Is it possible in the stateless request
>> world to separate the return of the output & capture buffers and/or to
>> allow multiple requests to be active at the same time?  If so is there
>> any example code I can look at?
>
>If I understand it correctly, you want to start two buffers in
>flight at the same time: one doing phase 1, and the other in phase 2.
>And when both phases finish processing you return the buffer in phase 2,
>move the buffer in phase 1 to phase 2, and dequeue a new buffer to start
>processing in phase 1.
>
>Right?
Yes - that is exactly correct.

>This means that there are two jobs running, and I don't think the
>framework likes that.
Looking at the code I got that impression quite strongly.

>On the other hand, I think it should be possible to add support for this
>in v4l2-mem2mem.c, although I am not entirely sure what the right =
approach
>would be.
As I'm new to this area I have even less idea :-)

>One idea would be to model a pipeline as part of a job: so you can have
>multiple jobs running, but each would run at a different phase of the
>pipeline.
Comments?  Does this seem like the way to go?  If so I could have a
first hack at it (though beware my unfamiliarity with this code - I'm
still getting used to the usage of "output" & "capture").

>Erm, for the record, I have no plans to implement this, but patches are
>welcome! :-)
Bother :-)

>Regards,
>
>	Hans

Regards

John Cox
