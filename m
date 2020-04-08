Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 97C0E1A2BAE
	for <lists+linux-media@lfdr.de>; Thu,  9 Apr 2020 00:01:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726494AbgDHWBi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 8 Apr 2020 18:01:38 -0400
Received: from mail-lf1-f44.google.com ([209.85.167.44]:46323 "EHLO
        mail-lf1-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726467AbgDHWBi (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 8 Apr 2020 18:01:38 -0400
Received: by mail-lf1-f44.google.com with SMTP id m19so4334267lfq.13;
        Wed, 08 Apr 2020 15:01:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:reply-to:to:from:subject:autocrypt:message-id
         :date:user-agent:mime-version:content-language
         :content-transfer-encoding;
        bh=f6JfEQXeChTGMVyQAfPnaQ62Rk3S32XMsGnyhOV7Nf4=;
        b=ZH9aSTVevBP50q/6AaZsxfU59pu3iSGwDWR6aSry+p5hPYfZF+6QxWCgISiuRvsyoW
         wXehhtJ+ZbRYMdYZQPDesXyWpxbVXbjBVstTHPIhhupMejtxDCxfJMKRpiXarLc9BfGt
         ENU6HOdXMZCGchWVL6k5Q/uVJ9iBxcFcitQWcMMMW6eS6SdUidFi05KXA/NUzHp1yrX9
         D0WhzGZkKc/Qg0p1AJ+IyMsncpTOXH0qLwqXLxmfA90R5HIh7Vy92/zsrzrp+Jj5pj8I
         W5ED+KPmNM7CFcGwr/tmWxd9PMxh84fVW/5YWyfd2HcTAid6Z5qYalnJWVfoW0KNFhJR
         Qimg==
X-Gm-Message-State: AGi0Pub5oiePXAkboXLKrkIP6bUyruaowwOoulK2nfZCOC0DJjVPbwvY
        govff1FzjlXKrGFoDI9W+fdKOpxC9J4=
X-Google-Smtp-Source: APiQypI04wg2EbnPmhbHXFfKHaYOw5JC9fEgZa7M6IXRZAGhIhp+Gy7Y5e1Tjfj8KhLJjleE+UKwsw==
X-Received: by 2002:a19:48c3:: with SMTP id v186mr514163lfa.194.1586383293536;
        Wed, 08 Apr 2020 15:01:33 -0700 (PDT)
Received: from [192.168.1.183] ([176.15.215.153])
        by smtp.gmail.com with ESMTPSA id m7sm18780616lfh.54.2020.04.08.15.01.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Apr 2020 15:01:32 -0700 (PDT)
Reply-To: alex.popov@linux.com
To:     Julia Lawall <Julia.Lawall@lip6.fr>,
        Gilles Muller <Gilles.Muller@lip6.fr>,
        Nicolas Palix <nicolas.palix@imag.fr>,
        Michal Marek <michal.lkml@markovi.net>, cocci@systeme.lip6.fr,
        "kernel-hardening@lists.openwall.com" 
        <kernel-hardening@lists.openwall.com>,
        Jann Horn <jannh@google.com>,
        Kees Cook <keescook@chromium.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
From:   Alexander Popov <alex.popov@linux.com>
Subject: Coccinelle rule for CVE-2019-18683
Autocrypt: addr=alex.popov@linux.com; prefer-encrypt=mutual; keydata=
 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
 j3lCqPk=
Message-ID: <fff664e9-06c9-d2fb-738f-e8e591e09569@linux.com>
Date:   Thu, 9 Apr 2020 01:01:31 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello!

Some time ago I fixed CVE-2019-18683 in the V4L2 subsystem of the Linux kernel.

I created a Coccinelle rule that detects that bug pattern. Let me show it.


Bug pattern
===========

CVE-2019-18683 refers to three similar vulnerabilities caused by the same
incorrect approach to locking that is used in vivid_stop_generating_vid_cap(),
vivid_stop_generating_vid_out(), and sdr_cap_stop_streaming().

For fixes please see the commit 6dcd5d7a7a29c1e4 (media: vivid: Fix wrong
locking that causes race conditions on streaming stop).

These three functions are called during streaming stopping with vivid_dev.mutex
locked. And they all do the same mistake while stopping their kthreads, which
need to lock this mutex as well. See the example from
vivid_stop_generating_vid_cap():
    /* shutdown control thread */
    vivid_grab_controls(dev, false);
    mutex_unlock(&dev->mutex);
    kthread_stop(dev->kthread_vid_cap);
    dev->kthread_vid_cap = NULL;
    mutex_lock(&dev->mutex);

But when this mutex is unlocked, another vb2_fop_read() can lock it instead of
the kthread and manipulate the buffer queue. That causes use-after-free.

I created a Coccinelle rule that detects mutex_unlock+kthread_stop+mutex_lock
within one function.


Coccinelle rule
===============

virtual report

@race exists@
expression E;
position stop_p;
position unlock_p;
position lock_p;
@@

mutex_unlock@unlock_p(E)
...
kthread_stop@stop_p(...)
...
mutex_lock@lock_p(E)

@script:python@
stop_p << race.stop_p;
unlock_p << race.unlock_p;
lock_p << race.lock_p;
E << race.E;
@@

coccilib.report.print_report(unlock_p[0], 'mutex_unlock(' + E + ') here')
coccilib.report.print_report(stop_p[0], 'kthread_stop here')
coccilib.report.print_report(lock_p[0], 'mutex_lock(' + E + ') here\n')


Testing the rule
================

I reverted the commit 6dcd5d7a7a29c1e4 and called:
COCCI=./scripts/coccinelle/kthread_race.cocci make coccicheck MODE=report

The result:

./drivers/media/platform/vivid/vivid-kthread-out.c:347:1-13: mutex_unlock(& dev
-> mutex) here
./drivers/media/platform/vivid/vivid-kthread-out.c:348:1-13: kthread_stop here
./drivers/media/platform/vivid/vivid-kthread-out.c:350:1-11: mutex_lock(& dev ->
mutex) here

./drivers/media/platform/vivid/vivid-sdr-cap.c:306:1-13: mutex_unlock(& dev ->
mutex) here
./drivers/media/platform/vivid/vivid-sdr-cap.c:307:1-13: kthread_stop here
./drivers/media/platform/vivid/vivid-sdr-cap.c:309:1-11: mutex_lock(& dev ->
mutex) here

./drivers/media/platform/vivid/vivid-kthread-cap.c:1001:1-13: mutex_unlock(& dev
-> mutex) here
./drivers/media/platform/vivid/vivid-kthread-cap.c:1002:1-13: kthread_stop here
./drivers/media/platform/vivid/vivid-kthread-cap.c:1004:1-11: mutex_lock(& dev
-> mutex) here

There are no other bugs detected.

Do you have any idea how to improve it?
Do we need that rule for regression testing in the upstream?

Thanks in advance!
Alexander
