Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 446F51A3AAF
	for <lists+linux-media@lfdr.de>; Thu,  9 Apr 2020 21:41:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726786AbgDITlI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 9 Apr 2020 15:41:08 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:35454 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725970AbgDITlI (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 9 Apr 2020 15:41:08 -0400
Received: by mail-lf1-f65.google.com with SMTP id r17so581550lff.2;
        Thu, 09 Apr 2020 12:41:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:reply-to:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=ERTd4mfk8JOS5WQBAswgbozE6klDjp263zhVMIMngac=;
        b=ln524cEWT309D03x0SNEUemPf6lk/2y89syw1nGGqsGE/wpEWjTDHg4paIpX1a6VEp
         PcNwft0xv+KuXWZJ4GfBJmOPn2OFa7r9PdL3nUTE0cTlBI9ZI6rcy79kMb+nP16/5rzZ
         4kc3IgJx/d2wZpVeHSIZSfwoq/DDxW9kC7mCi1WZOfNhNutYzucvUCxAHBReUle2NH4u
         ueYsBB5UM2U0k2VJOF/DJ8NW7+hnPLTOdh0rVOPKtiRmNEac/ih2R/wdpJdro9K+yYci
         NC7QUN8d0exBI54/dzpfwoUxhYDRTMDjf9UuKa4l0SHw1359tjL6iIzbTtcUlAj8QDFP
         FERA==
X-Gm-Message-State: AGi0Pub8KgXRNZoNda279vRYeZjtRAUSb71fEqnQMsfb+nWR3o1wvwhG
        Tmu4NX0nP6hD4g4Pw4Ugaq4=
X-Google-Smtp-Source: APiQypJM8b4r5yXZv6f+xhnXlzrwyTBkfWyVPssfGZtnQh09uCrB6D+KWrqxVnY/46747UJGCzk5Yw==
X-Received: by 2002:a19:b10:: with SMTP id 16mr220286lfl.133.1586461264044;
        Thu, 09 Apr 2020 12:41:04 -0700 (PDT)
Received: from [192.168.42.234] ([213.87.131.218])
        by smtp.gmail.com with ESMTPSA id t81sm11021lff.52.2020.04.09.12.41.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Apr 2020 12:41:03 -0700 (PDT)
Reply-To: alex.popov@linux.com
Subject: Re: Coccinelle rule for CVE-2019-18683
To:     Jann Horn <jannh@google.com>
Cc:     Julia Lawall <Julia.Lawall@lip6.fr>,
        Gilles Muller <Gilles.Muller@lip6.fr>,
        Nicolas Palix <nicolas.palix@imag.fr>,
        Michal Marek <michal.lkml@markovi.net>, cocci@systeme.lip6.fr,
        "kernel-hardening@lists.openwall.com" 
        <kernel-hardening@lists.openwall.com>,
        Kees Cook <keescook@chromium.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Markus Elfring <Markus.Elfring@web.de>
References: <fff664e9-06c9-d2fb-738f-e8e591e09569@linux.com>
 <CAG48ez09gn1Abv-EwwW5Rgjqo2CQsbq6tjDeTfpr_FnJC7f5zA@mail.gmail.com>
From:   Alexander Popov <alex.popov@linux.com>
Autocrypt: addr=alex.popov@linux.com; prefer-encrypt=mutual; keydata=
 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
 j3lCqPk=
Message-ID: <e41fc912-0a4f-70c3-b924-50126f0f185a@linux.com>
Date:   Thu, 9 Apr 2020 22:41:01 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <CAG48ez09gn1Abv-EwwW5Rgjqo2CQsbq6tjDeTfpr_FnJC7f5zA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Jann, thanks for your reply!

On 09.04.2020 01:26, Jann Horn wrote:
> On Thu, Apr 9, 2020 at 12:01 AM Alexander Popov <alex.popov@linux.com> wrote:
>> CVE-2019-18683 refers to three similar vulnerabilities caused by the same
>> incorrect approach to locking that is used in vivid_stop_generating_vid_cap(),
>> vivid_stop_generating_vid_out(), and sdr_cap_stop_streaming().
>>
>> For fixes please see the commit 6dcd5d7a7a29c1e4 (media: vivid: Fix wrong
>> locking that causes race conditions on streaming stop).
>>
>> These three functions are called during streaming stopping with vivid_dev.mutex
>> locked. And they all do the same mistake while stopping their kthreads, which
>> need to lock this mutex as well. See the example from
>> vivid_stop_generating_vid_cap():
>>     /* shutdown control thread */
>>     vivid_grab_controls(dev, false);
>>     mutex_unlock(&dev->mutex);
>>     kthread_stop(dev->kthread_vid_cap);
>>     dev->kthread_vid_cap = NULL;
>>     mutex_lock(&dev->mutex);
>>
>> But when this mutex is unlocked, another vb2_fop_read() can lock it instead of
>> the kthread and manipulate the buffer queue. That causes use-after-free.
>>
>> I created a Coccinelle rule that detects mutex_unlock+kthread_stop+mutex_lock
>> within one function.
> [...]
>> mutex_unlock@unlock_p(E)
>> ...
>> kthread_stop@stop_p(...)
>> ...
>> mutex_lock@lock_p(E)
> 
> Is the kthread_stop() really special here? It seems to me like it's
> pretty much just a normal instance of the "temporarily dropping a
> lock" pattern - which does tend to go wrong quite often, but can also
> be correct.

Right, searching without kthread_stop() gives more cases.

> I think it would be interesting though to have a list of places that
> drop and then re-acquire a mutex/spinlock/... that was not originally
> acquired in the same block of code (but was instead originally
> acquired in an outer block, or by a parent function, or something like
> that). So things like this:

It's a very good idea. I tried it and got first results (described below).

> void X(...) {
>   mutex_lock(A);
>   for (...) {
>     ...
>     mutex_unlock(A);
>     ...
>     mutex_lock(A);
>     ...
>   }
>   mutex_unlock(A);
> }

I'm not an expert in SmPL yet. Don't know how to describe this case.

> or like this:
> 
> void X(...) {
>   ... [no mutex operations on A]
>   mutex_unlock(A);
>   ...
>   mutex_lock(A);
>   ...
> }

Yes, I adapted the rule for that easier case:

```
virtual report
virtual context

@race exists@
expression E;
position unlock_p;
position lock_p;
@@

... when != mutex_lock(E)
* mutex_unlock@unlock_p(E)
...
* mutex_lock@lock_p(E)

@script:python@
unlock_p << race.unlock_p;
lock_p << race.lock_p;
E << race.E;
@@

coccilib.report.print_report(unlock_p[0], 'see mutex_unlock(' + E + ') here')
coccilib.report.print_report(lock_p[0], 'see mutex_lock(' + E + ') here\n')
```

The command to run it:
  COCCI=./scripts/coccinelle/kthread_race.cocci make coccicheck MODE=context
It shows the code context around in a form of diff.

This rule found 195 matches. Not that much!

> But of course, there are places where this kind of behavior is
> correct; so such a script wouldn't just return report code, just code
> that could use a bit more scrutiny than normal. 

I've spent some time looking through the results.
Currently I see 3 types of cases.


1. Cases that look legit: a mutex is unlocked for some waiting or sleeping.

Example:
./fs/io_uring.c:7908:2-14: see mutex_unlock(& ctx -> uring_lock) here
./fs/io_uring.c:7910:2-12: see mutex_lock(& ctx -> uring_lock) here

diff -u -p ./fs/io_uring.c /tmp/nothing/fs/io_uring.c
--- ./fs/io_uring.c
+++ /tmp/nothing/fs/io_uring.c
@@ -7905,9 +7905,7 @@ static int __io_uring_register(struct io
 		 * to drop the mutex here, since no new references will come in
 		 * after we've killed the percpu ref.
 		 */
-		mutex_unlock(&ctx->uring_lock);
 		ret = wait_for_completion_interruptible(&ctx->completions[0]);
-		mutex_lock(&ctx->uring_lock);
 		if (ret) {
 			percpu_ref_resurrect(&ctx->refs);
 			ret = -EINTR;


Another example that looks legit:
./mm/ksm.c:2709:2-14: see mutex_unlock(& ksm_thread_mutex) here
./mm/ksm.c:2712:2-12: see mutex_lock(& ksm_thread_mutex) here

diff -u -p ./mm/ksm.c /tmp/nothing/mm/ksm.c
--- ./mm/ksm.c
+++ /tmp/nothing/mm/ksm.c
@@ -2706,10 +2706,8 @@ void ksm_migrate_page(struct page *newpa
 static void wait_while_offlining(void)
 {
 	while (ksm_run & KSM_RUN_OFFLINE) {
-		mutex_unlock(&ksm_thread_mutex);
 		wait_on_bit(&ksm_run, ilog2(KSM_RUN_OFFLINE),
 			    TASK_UNINTERRUPTIBLE);
-		mutex_lock(&ksm_thread_mutex);
 	}
 }


2. Weird cases that look like just avoiding a deadlock.

Example. This mutex is unlocked for a while by an interrupt handler:
./sound/pci/pcxhr/pcxhr_core.c:1210:3-15: see mutex_unlock(& mgr -> lock) here
./sound/pci/pcxhr/pcxhr_core.c:1212:3-13: see mutex_lock(& mgr -> lock) here

diff -u -p ./sound/pci/pcxhr/pcxhr_core.c /tmp/nothing/sound/pci/pcxhr/pcxhr_core.c
--- ./sound/pci/pcxhr/pcxhr_core.c
+++ /tmp/nothing/sound/pci/pcxhr/pcxhr_core.c
@@ -1207,9 +1207,7 @@ static void pcxhr_update_timer_pos(struc
 		}

 		if (elapsed) {
-			mutex_unlock(&mgr->lock);
 			snd_pcm_period_elapsed(stream->substream);
-			mutex_lock(&mgr->lock);
 		}
 	}
 }

Another weird example. Looks a bit similar to V4L2 bugs.

./drivers/net/wireless/broadcom/b43/main.c:4334:1-13: see mutex_unlock(& wl ->
mutex) here
./drivers/net/wireless/broadcom/b43/main.c:4338:1-11: see mutex_lock(& wl ->
mutex) here

diff -u -p ./drivers/net/wireless/broadcom/b43/main.c
/tmp/nothing/drivers/net/wireless/broadcom/b43/main.c
--- ./drivers/net/wireless/broadcom/b43/main.c
+++ /tmp/nothing/drivers/net/wireless/broadcom/b43/main.c
@@ -4331,11 +4331,9 @@ redo:
 		return dev;

 	/* Cancel work. Unlock to avoid deadlocks. */
-	mutex_unlock(&wl->mutex);
 	cancel_delayed_work_sync(&dev->periodic_work);
 	cancel_work_sync(&wl->tx_work);
 	b43_leds_stop(dev);
-	mutex_lock(&wl->mutex);
 	dev = wl->current_dev;
 	if (!dev || b43_status(dev) < B43_STAT_STARTED) {
 		/* Whoops, aliens ate up the device while we were unlocked. */


3. False positive cases.
The pointer to mutex changes between unlocking and locking.

Example:
./fs/ceph/caps.c:2103:4-16: see mutex_unlock(& session -> s_mutex) here
./fs/ceph/caps.c:2105:3-13: see mutex_lock(& session -> s_mutex) here

@@ -2100,9 +2094,7 @@ retry_locked:
 		if (session != cap->session) {
 			spin_unlock(&ci->i_ceph_lock);
 			if (session)
-				mutex_unlock(&session->s_mutex);
 			session = cap->session;
-			mutex_lock(&session->s_mutex);
 			goto retry;
 		}
 		if (cap->session->s_state < CEPH_MDS_SESSION_OPEN) {


I would be grateful for your ideas and feedback.
Alexander
