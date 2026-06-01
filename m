Return-Path: <linux-media+bounces-63326-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KNk0FTvtHWoYgAkAu9opvQ
	(envelope-from <linux-media+bounces-63326-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 01 Jun 2026 22:36:11 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A2026625225
	for <lists+linux-media@lfdr.de>; Mon, 01 Jun 2026 22:36:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0A6063010B9E
	for <lists+linux-media@lfdr.de>; Mon,  1 Jun 2026 20:36:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 612D937F756;
	Mon,  1 Jun 2026 20:36:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ryg8mOGb"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B993F2F4A0C
	for <linux-media@vger.kernel.org>; Mon,  1 Jun 2026 20:36:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780346164; cv=none; b=SG+eAYPMf7HDJGSMYqQMhnB3UsjyfDnda0yAI25LDVJYBc8Z8/HbX9ZzstgWQt5ZUs1LKiI8BuRAR2LKYFSDXbwAUswWLtL52zQ1RRL2F2XFxffHzWGhiqfcuSL8gDtWBEbHdbgrJ/+bO2al0qgPcQJx2/WPH1dI+Mnu2nxmuwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780346164; c=relaxed/simple;
	bh=vN6YOIybbpzxOwYGnhK2S9z0u6a9NG31pma1TaDEpWA=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=R74aRlY+ln7ekBU4xI4w+AJ7QGS25Yar+q0VY5D2/MXT5nmlB8MAzhCegflD7diE8+75BmOYqyejCcHNDj1bA1rRER7XC+xDsM/EGagcRYF1OAh0SXVVqYvIUe5y3judqHNAhbDUDmjnA6qGL5jXmvo2c1z17UoheKm/fWh4Mpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ryg8mOGb; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-91563382988so104964585a.1
        for <linux-media@vger.kernel.org>; Mon, 01 Jun 2026 13:36:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780346162; x=1780950962; darn=vger.kernel.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5KrzO0e4cY8p1dPWyrkxENxJZHea6aAWbanNDlxeYpQ=;
        b=ryg8mOGbUIWIpJfA9kmtkq4BSZCgOtiJ6WMrdnF/MGBGSX5tAdWg6FPwQGWOHK10MZ
         EN0AnQEoYrxsyYlMLsKjVJCmhk5vP1Rq2UYgfmlOeTs7dBp3hjdsn6xolEqh1/LbwI/S
         Dq8pQUM8EQDADZA6LK/bhlSGTuU3Fc4YAtGJ/DNl4hzdesRlL+YXqYjjiCVcT2xKjCcD
         McJiXm6F3Uy/I6Celde5CTr1L/p0D16R+YwEZDup+LVktuN3rTDQaAdC7GdWPBHj6HHO
         Hjb4dj/UluuWEO5aWWGzw9d7RNoTEykbHd7glBI6Lknkq2eQQmWOZnG0Ls0fIEQnCPVV
         2U7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780346162; x=1780950962;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5KrzO0e4cY8p1dPWyrkxENxJZHea6aAWbanNDlxeYpQ=;
        b=TO9sezwCiGKqMeCisg4wtoOF5kKUtJ8eVLzAP/pmlpOVfyT2jZwDHBSHrttRmknSMd
         TkgNwW7peyFFtzmy1bpTmWYD2o9DhRI5aA6Auti9q1gafdzAcmgaTaNUv9wmadX5WRDr
         CH5Q8bdcr901ut7QpKIoNq0Eh7o5gusciFrxehJvd59u9+69JbfbhrKe81X1RoNG8fyh
         aXDnlqqgcwGheaScC/R/c1T5yud0FgIFAEbrhfWMVA2zImZgx8ynJxdwuxuFurMZ5yQ6
         G/0f4PiHGdb6+iajA2aBFPT8tf+Uzd4jWWP56Uplz+3DFqgC7L9iV2dCXMFWQkkR65/O
         /g+A==
X-Forwarded-Encrypted: i=1; AFNElJ9g8oR8/Jq42bhyBdBmmpBhn22WwWdMYBIVKcyFvMCsniNYd220UMuhjRK1CQwlJanHRIbzg4oZZGqi2Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YwPQxnSAmA7HfH8zZWpT4cAH+BIJ9Uqjn1fes4qDVR5RYfP7Mcg
	WzJV6xrYqG65bKicwb7TeZIfH1GAo1bUBBiEj1jEbSr36zOICJc3h4m5
X-Gm-Gg: Acq92OFedXOgP9dPjAnW9j3hxt3Jdc18m+UdxmwX91a/aW3J5YVNeFNdCB7kL+Ah7L/
	3Jz2GEZPYOBRgdyuxOXc+90LnX8TNxDXND7yevU1dDtkhKmfdBD9E76FiwpsywN0W0UNCKNOnYF
	iKuZM1PaW5p1OgwxQWAc1sZmCBUmSm6dpbO9aZp8fc/Yt2l+/495zUm0hiTPunfWEcPNxKYSQHD
	hZijQZDhlrkOE9tN11TwfYWIa8CByN7XbpytBghDEo2G84qvxLqzRnbk3JfjH6v4DCL191muF3j
	SK0rXnrWlAlxwycrF8FZScWn9hNzVVlWPzplRKg1Yvil3peb9Z1kz73aBi+Klg4d9rG7CWu1Cpe
	rtzyRDn/cm0BfWr6fez5yY0ZCvDcNF5D4XojIbCuOq/yplyrCxmpSpO8fOVgBNI7kGYmSDNNiey
	HoXFjSaxwnumhFjTDz0U9JayZn156DIL2aHCe7ughBe/qbJ/w/dPdd1bMHVGVgDOGt
X-Received: by 2002:a05:620a:1d09:b0:911:4cb1:8a60 with SMTP id af79cd13be357-9153f269362mr1685069785a.13.1780346161446;
        Mon, 01 Jun 2026 13:36:01 -0700 (PDT)
Received: from smtpclient.apple ([104.39.165.68])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9153244ad25sm1100302485a.3.2026.06.01.13.36.00
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 01 Jun 2026 13:36:01 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.600.51.1.1\))
Subject: Re: [BUG] KASAN: slab-use-after-free in au0828_dvb_register
From: Shuangpeng <shuangpeng.kernel@gmail.com>
In-Reply-To: <79734bf1-a6cd-45a3-af8b-a0d930f27041@kylinos.cn>
Date: Mon, 1 Jun 2026 16:35:50 -0400
Cc: xiaopeitux@foxmail.com,
 brad@nextdimension.cc,
 hverkuil+cisco@kernel.org,
 linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org,
 mchehab@kernel.org,
 mingo@kernel.org,
 tglx@kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <85EEDF0E-FBF5-4395-9BF4-45CE7BD5F139@gmail.com>
References: <AAC17221-93BF-436F-92AC-906A18F882F0@gmail.com>
 <tencent_6DDC3554CD90D85E21277073C6AE67116F08@qq.com>
 <2EBF1AF0-ED21-4B11-87DB-9E40AD082F7F@gmail.com>
 <79734bf1-a6cd-45a3-af8b-a0d930f27041@kylinos.cn>
To: Pei Xiao <xiaopei01@kylinos.cn>
X-Mailer: Apple Mail (2.3864.600.51.1.1)
X-Spamd-Result: default: False [3.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	SUSPICIOUS_URL_IN_SUSPICIOUS_MESSAGE(1.00)[];
	MV_CASE(0.50)[];
	URIBL_RED(0.50)[kylinos.cn:email];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	BAD_REP_POLICIES(0.10)[];
	HAS_ANON_DOMAIN(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[gmail.com,none];
	FREEMAIL_CC(0.00)[foxmail.com,nextdimension.cc,kernel.org,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-63326-lists,linux-media=lfdr.de];
	R_DKIM_ALLOW(0.00)[gmail.com:s=20251104];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-0.607];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shuangpengkernel@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	R_SPF_ALLOW(0.00)[+ip4:172.234.253.10:c];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	ARC_ALLOW(0.00)[subspace.kernel.org:s=arc-20240116:i=1];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,kylinos.cn:email]
X-Rspamd-Queue-Id: A2026625225
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



> On May 31, 2026, at 23:38, Pei Xiao <xiaopei01@kylinos.cn> wrote:
>=20
>=20
>=20
> =E5=9C=A8 2026/5/30 03:22, Shuangpeng =E5=86=99=E9=81=93:
>>=20
>>> On May 29, 2026, at 04:30, xiaopeitux@foxmail.com wrote:
>>>=20
>>> From: Pei Xiao <xiaopei01@kylinos.cn>
>>>=20
>>>> Hi Kernel Maintainers,
>>>>=20
>>>> We hit the following KASAN report while testing current upstream =
kernel:
>>>>=20
>>>> KASAN: slab-use-after-free in au0828_dvb_register
>>>>=20
>>>> on commit: e8c2f9fdadee7cbc75134dc463c1e0d856d6e5c7 (May 25 2026)
>>>>=20
>>>> The reproducer and .config files are here.
>>>> =
https://gist.github.com/shuangpengbai/c31163f8ef234ba4fe85038c2f97f9cc
>>>>=20
>>>> I=E2=80=99m happy to test debug patches or provide additional =
information.
>>>>=20
>>>> Reported-by: Shuangpeng Bai <shuangpeng.kernel@gmail.com>
>>> Can you help post all the crash logs?=20
>>> Does the kernel log have this print:=20
>>> "The frontend of your DVB/ATSC card isn't supported yet."=20
>> I did not see this message in log.
>>=20
>>=20
>>> Please help post all the logs, thank you!
>> Thank you for taking a look. All terminal outputs after running the =
reproducer:
>  au0828_usb_probe
>          au0828_dvb_register
>             dvb_attach(xc5000_attach, dvb->frontend,
>             dvb_register =20
>                    if (dvb->frontend->ops.release)
>                         dvb->frontend->ops.release(dvb->frontend);
>=20
> dvb_register=20
>     result =3D dvb_register_frontend(&dvb->adapter, dvb->frontend);
>         pr_err("dvb_register_frontend failed (errno =3D %d)\n",//-12,  =
no kref_init(&fe->refcount);=EF=BC=8Cfe->frontend_priv is NULL
>                        result);
>         goto fail_frontend
>=20
> fail_frontend:
> dvb_frontend_detach(dvb->frontend);
>=20
> dvb_frontend_detach:
>     dvb_frontend_put =20
>         __dvb_frontend_free
>             dvb_frontend_invoke_release(fe, fe->ops.release);
> =20
> =20
> static void dvb_frontend_invoke_release(struct dvb_frontend *fe,
>                                         void (*release)(struct =
dvb_frontend *fe))
> {
>         if (release) {
>                 release(fe);
> #ifdef CONFIG_MEDIA_ATTACH
>                 dvb_detach(release);
> #endif =20
>         }
> } =20
>=20
> au8522_attach
> .release              =3D au8522_release,
>     au8522_release_state
>         kfree(state);//have free
>=20
> How did this problem occur, and is the probability of it occurring =
high?

I found this issue during testing kernel with our tool. This bug can be =
reliably reproduced.

> so we can remove in au0828_dvb_register function follow lines to fix =
this UAF bug?=20
>=20
> ret =3D dvb_register(dev);
>         if (ret < 0) {
>                // if (dvb->frontend->ops.release)
>                //        dvb->frontend->ops.release(dvb->frontend);
>                //  dvb->frontend =3D NULL;
>                 return ret;
>         }
> Could you please help test this modified code?

Could you please confirm whether the following is the intended change?

I locally tested it by commenting out the three lines in the error path =
of
au0828_dvb_register():

diff --git a/drivers/media/usb/au0828/au0828-dvb.c =
b/drivers/media/usb/au0828/au0828-dvb.c
index 31123e6f9fc3..f3d5a2b0de71 100644
--- a/drivers/media/usb/au0828/au0828-dvb.c
+++ b/drivers/media/usb/au0828/au0828-dvb.c
@@ -633,9 +633,9 @@ int au0828_dvb_register(struct au0828_dev *dev)
        /* register everything */
        ret =3D dvb_register(dev);
        if (ret < 0) {
-               if (dvb->frontend->ops.release)
-                       dvb->frontend->ops.release(dvb->frontend);
-               dvb->frontend =3D NULL;
+               // if (dvb->frontend->ops.release)
+               //      dvb->frontend->ops.release(dvb->frontend);
+               // dvb->frontend =3D NULL;
                return ret;
        }

With this change, I reran the reproducer and hit a NULL pointer
dereference:

[ 90.096547][ T10] BUG: kernel NULL pointer dereference, address: =
0000000000000000
[ 90.107156][ T10] au0828_dvb_unregister =
(drivers/media/usb/au0828/au0828-dvb.c:543)
[ 90.107518][ T10] au0828_usb_disconnect =
(drivers/media/usb/au0828/au0828-core.c:179)
[ 90.107875][ T10] usb_unbind_interface (drivers/usb/core/driver.c:458)
[ 90.108965][ T10] device_release_driver_internal (drivers/base/dd.c:621 =
drivers/base/dd.c:1352 drivers/base/dd.c:1375)
[ 90.109384][ T10] bus_remove_device (drivers/base/bus.c:657)
[ 90.110494][ T10] device_del (drivers/base/core.c:3895)
[ 90.111787][ T10] usb_disable_device (drivers/usb/core/message.c:1478)
[ 90.112134][ T10] usb_disconnect (drivers/input/misc/yealink.c:421)
[ 90.112460][ T10] hub_event (drivers/usb/core/hub.c:5407 =
drivers/usb/core/hub.c:5707 drivers/usb/core/hub.c:5871 =
drivers/usb/core/hub.c:5953)
[ 90.114436][ T10] process_scheduled_works (kernel/workqueue.c:3314 =
kernel/workqueue.c:3397)
[ 90.114817][ T10] worker_thread (kernel/workqueue.c:3478)
[ 90.115490][ T10] kthread (kernel/kthread.c:436)
[ 90.116448][ T10] ret_from_fork (arch/x86/kernel/process.c:158)
[ 90.117759][ T10] ret_from_fork_asm (arch/x86/entry/entry_64.S:245)

The crash happens in au0828_dvb_unregister() at:
dvb->demux.dmx.remove_frontend(&dvb->demux.dmx, &dvb->fe_mem);

So if this is the intended change, it seems to avoid the original =
release path,
but it also leaves the device in a partially initialized state and =
triggers a
NULL pointer dereference during disconnect.

Please let me know if there is a new patch you would like me to test.


>> [   64.807294][   T42] usb 3-1: new high-speed USB device number 2 =
using dummy_hcd
>> [   64.958989][   T42] usb 3-1: New USB device found, idVendor=3D0fe9, =
idProduct=3Dd620, bcdDevice=3D 1.00
>> [   64.961560][   T42] usb 3-1: New USB device strings: Mfr=3D0, =
Product=3D0, SerialNumber=3D0
>> [   65.351442][   T42] au0828: i2c bus registered
>> [   65.634777][   T42] au8522 1-0047: creating new instance
>> [   65.655406][   T42] DVB: Unable to find symbol xc5000_attach()
>> [   65.656022][   T42] dvbdev: DVB: registering new adapter (au0828)
>> [   65.656632][   T42] au0828: dvb_register_frontend failed (errno =3D =
-12)
>> [   65.658957][   T42] au8522 1-0047: destroying instance
>> [   65.659499][   T42] =
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> [   65.660261][   T42] BUG: KASAN: slab-use-after-free in =
au0828_dvb_register+0x1280/0x15f0
>> [   65.661023][   T42] Read of size 8 at addr ffff8881685f4118 by =
task kworker/1:1/42
>> [   65.661742][   T42]
>> [   65.661973][   T42] CPU: 1 UID: 0 PID: 42 Comm: kworker/1:1 Not =
tainted 7.1.0-rc5-00006-ge8c2f9fdadee #16 PREEMPT(
>> [   65.661978][   T42] Hardware name: QEMU Ubuntu 24.04 PC v2 (i440FX =
+ PIIX, arch_caps fix, 1996), BIOS 1.16.3-debia4
>> [   65.661981][   T42] Workqueue: usb_hub_wq hub_event
>> [   65.661988][   T42] Call Trace:
>> [   65.661991][   T42]  <TASK>
>> [   65.661993][   T42]  dump_stack_lvl+0x26/0x80
>> [   65.661999][   T42]  print_report+0x16a/0x5d0
>> [   65.662013][   T42]  kasan_report+0xc3/0x100
>> [   65.662019][   T42]  au0828_dvb_register+0x1280/0x15f0
>> [   65.662026][   T42]  au0828_usb_probe+0x353/0x4b0
>> [   65.662029][   T42]  usb_probe_interface+0x4aa/0xa40
>> [   65.662034][   T42]  really_probe+0x259/0x9a0
>> [   65.662041][   T42]  __driver_probe_device+0x18b/0x370
>> [   65.662045][   T42]  driver_probe_device+0x4b/0x1e0
>> [   65.662049][   T42]  __device_attach_driver+0x1d0/0x2f0
>> [   65.662055][   T42]  bus_for_each_drv+0x22a/0x260
>> [   65.663294][   T42]  __device_attach+0x25a/0x480
>> [   65.663321][   T42]  device_initial_probe+0x68/0xa0
>> [   65.663324][   T42]  bus_probe_device+0x10a/0x1d0
>> [   65.663328][   T42]  device_add+0x56b/0x9c0
>> [   65.663332][   T42]  usb_set_configuration+0x1775/0x1d80
>> [   65.663337][   T42]  usb_generic_driver_probe+0x61/0xf0
>> [   65.663343][   T42]  usb_probe_device+0xd3/0x2a0
>> [   65.663346][   T42]  really_probe+0x259/0x9a0
>> [   65.663350][   T42]  __driver_probe_device+0x18b/0x370
>> [   65.663354][   T42]  driver_probe_device+0x4b/0x1e0
>> [   65.663357][   T42]  __device_attach_driver+0x1d0/0x2f0
>> [   65.663363][   T42]  bus_for_each_drv+0x22a/0x260
>> [   65.663381][   T42]  __device_attach+0x25a/0x480
>> [   65.663403][   T42]  device_initial_probe+0x68/0xa0
>> [   65.663405][   T42]  bus_probe_device+0x10a/0x1d0
>> [   65.663409][   T42]  device_add+0x56b/0x9c0
>> [   65.663412][   T42]  usb_new_device+0xbdd/0x1830
>> [   65.663423][   T42]  hub_event+0x2358/0x4090
>> [   65.663443][   T42]  process_scheduled_works+0x73d/0xed0
>> [   65.663451][   T42]  worker_thread+0x7d6/0xb60
>> [   65.663459][   T42]  kthread+0x322/0x410
>> [   65.663470][   T42]  ret_from_fork+0x285/0x750
>> [   65.663485][   T42]  ret_from_fork_asm+0x1a/0x30
>> [   65.663491][   T42]  </TASK>
>> [   65.663493][   T42]
>> [   65.702422][   T42] Freed by task 42 on cpu 1 at 65.659497s:
>> [   65.702994][   T42]  kasan_save_track+0x2e/0x90
>> [   65.703471][   T42]  kasan_save_free_info+0x3c/0x50
>> [   65.703965][   T42]  __kasan_slab_free+0x36/0x60
>> [   65.704450][   T42]  kfree+0x154/0x450
>> [   65.704839][   T42]  au8522_release_state+0x1b6/0x210
>> [   65.705364][   T42]  dvb_frontend_put+0x12a/0x170
>> [   65.705848][   T42]  au0828_dvb_register+0xfd9/0x15f0
>> [   65.706373][   T42]  au0828_usb_probe+0x353/0x4b0
>> [   65.706854][   T42]  usb_probe_interface+0x4aa/0xa40
>> [   65.707373][   T42]  really_probe+0x259/0x9a0
>> [   65.707822][   T42]  __driver_probe_device+0x18b/0x370
>> [   65.708347][   T42]  driver_probe_device+0x4b/0x1e0
>> [   65.708845][   T42]  __device_attach_driver+0x1d0/0x2f0
>> [   65.709383][   T42]  bus_for_each_drv+0x22a/0x260
>> [   65.709864][   T42]  __device_attach+0x25a/0x480
>> [   65.710339][   T42]  device_initial_probe+0x68/0xa0
>> [   65.710836][   T42]  bus_probe_device+0x10a/0x1d0
>> [   65.711323][   T42]  device_add+0x56b/0x9c0
>> [   65.711750][   T42]  usb_set_configuration+0x1775/0x1d80
>> [   65.712294][   T42]  usb_generic_driver_probe+0x61/0xf0
>> [   65.712822][   T42]  usb_probe_device+0xd3/0x2a0
>> [   65.713305][   T42]  really_probe+0x259/0x9a0
>> [   65.713752][   T42]  __driver_probe_device+0x18b/0x370
>> [   65.714282][   T42]  driver_probe_device+0x4b/0x1e0
>> [   65.714779][   T42]  __device_attach_driver+0x1d0/0x2f0
>> [   65.715313][   T42]  bus_for_each_drv+0x22a/0x260
>> [   65.715794][   T42]  __device_attach+0x25a/0x480
>> [   65.716271][   T42]  device_initial_probe+0x68/0xa0
>> [   65.716767][   T42]  bus_probe_device+0x10a/0x1d0
>> [   65.717262][   T42]  device_add+0x56b/0x9c0
>> [   65.717690][   T42]  usb_new_device+0xbdd/0x1830
>> [   65.717869][    C0] clocksource: Watchdog remote CPU 1 read timed =
out
>> [   65.718172][   T42]  hub_event+0x2358/0x4090
>> [   65.718177][   T42]  process_scheduled_works+0x73d/0xed0
>> [   65.718180][   T42]  worker_thread+0x7d6/0xb60
>> [   65.718183][   T42]  kthread+0x322/0x410
>> [   65.718187][   T42]  ret_from_fork+0x285/0x750
>> [   65.718189][   T42]  ret_from_fork_asm+0x1a/0x30
>> [   65.718192][   T42]
>> [   65.718194][   T42] The buggy address belongs to the object at =
ffff8881685f4000
>> [   65.718194][   T42]  which belongs to the cache kmalloc-4k of size =
4096
>> [   65.718197][   T42] The buggy address is located 280 bytes inside =
of
>> [   65.718197][   T42]  freed 4096-byte region [ffff8881685f4000, =
ffff8881685f5000)
>> [   65.718200][   T42]
>> [   65.718201][   T42] The buggy address belongs to the physical =
page:
>> [   65.718204][   T42] page: refcount:0 mapcount:0 =
mapping:0000000000000000 index:0x0 pfn:0x1685f0
>> [   65.718209][   T42] head: order:3 mapcount:0 entire_mapcount:0 =
nr_pages_mapped:0 pincount:0
>> [   65.718212][   T42] flags: =
0x17ff00000000040(head|node=3D0|zone=3D2|lastcpupid=3D0x7ff)
>> [   65.729357][   T42] page_type: f5(slab)
>> [   65.729757][   T42] raw: 017ff00000000040 ffff888100042140 =
dead000000000100 dead000000000122
>> [   65.730603][   T42] raw: 0000000000000000 0000000800040004 =
00000000f5000000 0000000000000000
>> [   65.731450][   T42] head: 017ff00000000040 ffff888100042140 =
dead000000000100 dead000000000122
>> [   65.732301][   T42] head: 0000000000000000 0000000800040004 =
00000000f5000000 0000000000000000
>> [   65.733211][   T42] head: 017ff00000000003 fffffffffffffe01 =
00000000ffffffff 00000000ffffffff
>> [   65.734064][   T42] head: ffffffffffffffff 0000000000000000 =
00000000ffffffff 0000000000000008
>> [   65.734922][   T42] page dumped because: kasan: bad access =
detected
>> [   65.735562][   T42] page_owner tracks the page as allocated
>> [   65.736133][   T42] page last allocated via order 3, migratetype =
Unmovable, gfp_mask 0xd20c0(__GFP_IO|__GFP_FS|__G2
>> [   65.738177][   T42]  post_alloc_hook+0x152/0x180
>> [   65.738654][   T42]  get_page_from_freelist+0x3996/0x3b50
>> [   65.739207][   T42]  __alloc_frozen_pages_noprof+0x243/0x750
>> [   65.739783][   T42]  allocate_slab+0x76/0x5e0
>> [   65.740242][   T42]  refill_objects+0x2e1/0x360
>> [   65.740706][   T42]  __pcs_replace_empty_main+0x233/0x440
>> [   65.741262][   T42]  __kmalloc_cache_noprof+0x2d0/0x490
>> [   65.741791][   T42]  au8522_get_state+0x266/0x4c0
>> [   65.742280][   T42]  au8522_attach+0xba/0x2d0
>> [   65.742728][   T42]  au0828_dvb_register+0xcc/0x15f0
>> [   65.743241][   T42]  au0828_usb_probe+0x353/0x4b0
>> [   65.743723][   T42]  usb_probe_interface+0x4aa/0xa40
>> [   65.744264][   T42]  really_probe+0x259/0x9a0
>> [   65.744713][   T42]  __driver_probe_device+0x18b/0x370
>> [   65.745246][   T42]  driver_probe_device+0x4b/0x1e0
>> [   65.745745][   T42]  __device_attach_driver+0x1d0/0x2f0
>> [   65.746284][   T42] page last free pid 4578 tgid 4578 stack trace:
>> [   65.746909][   T42]  __free_frozen_pages+0xb8c/0xcb0
>> [   65.747427][   T42]  __slab_free+0x219/0x260
>> [   65.747870][   T42]  qlist_free_all+0x33/0x120
>> [   65.748339][   T42]  kasan_quarantine_reduce+0x152/0x170
>> [   65.748877][   T42]  __kasan_slab_alloc+0x1f/0x60
>> [   65.749368][   T42]  kmem_cache_alloc_noprof+0x1f0/0x480
>> [   65.749908][   T42]  do_getname+0x2a/0x1c0
>> [   65.750337][   T42]  do_sys_openat2+0x99/0x190
>> [   65.750798][   T42]  __x64_sys_openat+0x20b/0x260
>> [   65.751287][   T42]  do_syscall_64+0x125/0x590
>> [   65.751744][   T42]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
>> [   65.752334][   T42]
>> [   65.752572][   T42] Memory state around the buggy address:
>> [   65.753132][   T42]  ffff8881685f4000: fa fb fb fb fb fb fb fb fb =
fb fb fb fb fb fb fb
>> [   65.753918][   T42]  ffff8881685f4080: fb fb fb fb fb fb fb fb fb =
fb fb fb fb fb fb fb
>> [   65.754712][   T42] >ffff8881685f4100: fb fb fb fb fb fb fb fb fb =
fb fb fb fb fb fb fb
>> [   65.755504][   T42]                             ^
>> [   65.755985][   T42]  ffff8881685f4180: fb fb fb fb fb fb fb fb fb =
fb fb fb fb fb fb fb
>> [   65.756775][   T42]  ffff8881685f4200: fb fb fb fb fb fb fb fb fb =
fb fb fb fb fb fb fb
>> [   65.757575][   T42] =
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> [   65.758570][   T42] Kernel panic - not syncing: KASAN: =
panic_on_warn set ...
>> [   65.759306][   T42] CPU: 1 UID: 0 PID: 42 Comm: kworker/1:1 Not =
tainted 7.1.0-rc5-00006-ge8c2f9fdadee #16 PREEMPT(
>> [   65.760402][   T42] Hardware name: QEMU Ubuntu 24.04 PC v2 (i440FX =
+ PIIX, arch_caps fix, 1996), BIOS 1.16.3-debia4
>> [   65.761615][   T42] Workqueue: usb_hub_wq hub_event
>> [   65.762263][   T42] Call Trace:
>> [   65.762658][   T42]  <TASK>
>> [   65.762956][   T42]  dump_stack_lvl+0x26/0x80
>> [   65.763420][   T42]  vpanic+0x37d/0x710
>> [   65.764686][   T42]  panic+0x9f/0xa0
>> [   65.767120][   T42]  check_panic_on_warn+0x58/0x70
>> [   65.768155][   T42]  end_report+0x44/0xe0
>> [   65.769116][   T42]  kasan_report+0xd4/0x100
>> [   65.770092][   T42]  au0828_dvb_register+0x1280/0x15f0
>> [   65.771097][   T42]  au0828_usb_probe+0x353/0x4b0
>> [   65.771586][   T42]  usb_probe_interface+0x4aa/0xa40
>> [   65.772089][   T42]  really_probe+0x259/0x9a0
>> [   65.772549][   T42]  __driver_probe_device+0x18b/0x370
>> [   65.773069][   T42]  driver_probe_device+0x4b/0x1e0
>> [   65.773576][   T42]  __device_attach_driver+0x1d0/0x2f0
>> [   65.774692][   T42]  bus_for_each_drv+0x22a/0x260
>> [   65.777453][   T42]  __device_attach+0x25a/0x480
>> [   65.780818][   T42]  device_initial_probe+0x68/0xa0
>> [   65.781322][   T42]  bus_probe_device+0x10a/0x1d0
>> [   65.781800][   T42]  device_add+0x56b/0x9c0
>> [   65.782284][   T42]  usb_set_configuration+0x1775/0x1d80
>> [   65.782822][   T42]  usb_generic_driver_probe+0x61/0xf0
>> [   65.783361][   T42]  usb_probe_device+0xd3/0x2a0
>> [   65.783832][   T42]  really_probe+0x259/0x9a0
>> [   65.784286][   T42]  __driver_probe_device+0x18b/0x370
>> [   65.784804][   T42]  driver_probe_device+0x4b/0x1e0
>> [   65.785304][   T42]  __device_attach_driver+0x1d0/0x2f0
>> [   65.786416][   T42]  bus_for_each_drv+0x22a/0x260
>> [   65.789198][   T42]  __device_attach+0x25a/0x480
>> [   65.792606][   T42]  device_initial_probe+0x68/0xa0
>> [   65.793101][   T42]  bus_probe_device+0x10a/0x1d0
>> [   65.793602][   T42]  device_add+0x56b/0x9c0
>> [   65.794028][   T42]  usb_new_device+0xbdd/0x1830
>> [   65.795025][   T42]  hub_event+0x2358/0x4090
>> [   65.797580][   T42]  process_scheduled_works+0x73d/0xed0
>> [   65.798124][   T42]  worker_thread+0x7d6/0xb60
>> [   65.799085][   T42]  kthread+0x322/0x410
>> [   65.800465][   T42]  ret_from_fork+0x285/0x750
>> [   65.802356][   T42]  ret_from_fork_asm+0x1a/0x30
>> [   65.802830][   T42]  </TASK>
>> [   65.803886][   T42] Kernel Offset: disabled
>> [   65.804329][   T42] ---[ end Kernel panic - not syncing: KASAN: =
panic_on_warn set ... ]=E2=80=94
>>=20
>>>>=20
>>>> [  141.481576][   T48] =
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>>> [  141.482348][   T48] BUG: KASAN: slab-use-after-free in =
au0828_dvb_register (drivers/media/usb/au0828/au0828-dvb.c:636)
>>>> [  141.483148][   T48] Read of size 8 at addr ffff888171d4a118 by =
task kworker/1:1/48
>>>> [  141.483903][   T48]
>>>> [  141.484144][   T48] Hardware name: QEMU Ubuntu 24.04 PC v2 =
(i440FX + PIIX, arch_caps fix, 1996), BIOS 1.16.34
>>>> [  141.484148][   T48] Workqueue: usb_hub_wq hub_event
>>>> [  141.484154][   T48] Call Trace:
>>>> [  141.484157][   T48]  <TASK>
>>>> [  141.484159][   T48]  dump_stack_lvl (lib/dump_stack.c:94 =
lib/dump_stack.c:120)
>>>> [  141.484164][   T48]  print_report (mm/kasan/report.c:378 =
mm/kasan/report.c:482)
>>>> [  141.484177][   T48]  kasan_report (mm/kasan/report.c:595)
>>>> [  141.484183][   T48]  au0828_dvb_register =
(drivers/media/usb/au0828/au0828-dvb.c:636)
>>>> [  141.484190][   T48]  au0828_usb_probe =
(drivers/media/usb/au0828/au0828-core.c:733)
>>>> [  141.484193][   T48]  usb_probe_interface =
(drivers/usb/core/driver.c:396)
>>>> [  141.484198][   T48]  really_probe (drivers/base/dd.c:? =
drivers/base/dd.c:709)
>>>> [  141.484204][   T48]  __driver_probe_device =
(drivers/base/dd.c:871)
>>>> [  141.484207][   T48]  driver_probe_device (drivers/base/dd.c:901)
>>>> [  141.484211][   T48]  __device_attach_driver =
(drivers/base/dd.c:1029)
>>>> [  141.484217][   T48]  bus_for_each_drv (drivers/base/bus.c:500)
>>>> [  141.484264][   T48]  __device_attach (drivers/base/dd.c:1101)
>>>> [  141.484289][   T48]  device_initial_probe =
(drivers/base/dd.c:1156)
>>>> [  141.484292][   T48]  bus_probe_device (drivers/base/bus.c:613)
>>>> [  141.484296][   T48]  device_add (drivers/base/core.c:3706)
>>>> [  141.484299][   T48]  usb_set_configuration =
(drivers/usb/core/message.c:2268)
>>>> [  141.484303][   T48]  usb_generic_driver_probe =
(drivers/usb/core/generic.c:250)
>>>> [  141.484308][   T48]  usb_probe_device =
(drivers/usb/core/driver.c:291)
>>>> [  141.484311][   T48]  really_probe (drivers/base/dd.c:? =
drivers/base/dd.c:709)
>>>> [  141.484315][   T48]  __driver_probe_device =
(drivers/base/dd.c:871)
>>>> [  141.484318][   T48]  driver_probe_device (drivers/base/dd.c:901)
>>>> [  141.484321][   T48]  __device_attach_driver =
(drivers/base/dd.c:1029)
>>>> [  141.484328][   T48]  bus_for_each_drv (drivers/base/bus.c:500)
>>>> [  141.484346][   T48]  __device_attach (drivers/base/dd.c:1101)
>>>> [  141.484367][   T48]  device_initial_probe =
(drivers/base/dd.c:1156)
>>>> [  141.484370][   T48]  bus_probe_device (drivers/base/bus.c:613)
>>>> [  141.484374][   T48]  device_add (drivers/base/core.c:3706)
>>>> [  141.484376][   T48]  usb_new_device =
(drivers/usb/core/hub.c:2695)
>>>> [  141.484386][   T48]  hub_event (drivers/usb/core/hub.c:5567 =
drivers/usb/core/hub.c:5707 drivers/usb/core/hub.c:5871 =
drivers/usb/core/hub.c:5953)
>>>> [  141.484406][   T48]  process_scheduled_works =
(kernel/workqueue.c:3314 kernel/workqueue.c:3397)
>>>> [  141.484412][   T48]  worker_thread (kernel/workqueue.c:3478)
>>>> [  141.484420][   T48]  kthread (kernel/kthread.c:436)
>>>> [  141.484431][   T48]  ret_from_fork =
(arch/x86/kernel/process.c:158)
>>>> [  141.484445][   T48]  ret_from_fork_asm =
(arch/x86/entry/entry_64.S:245)
>>>> [  141.484450][   T48]  </TASK>
>>>> [  141.484451][   T48]
>>>> [  141.523531][   T48] Freed by task 48 on cpu 1 at 141.481575s:
>>>> [  141.524120][   T48]  kasan_save_track (mm/kasan/common.c:57 =
mm/kasan/common.c:78)
>>>> [  141.524594][   T48]  kasan_save_free_info =
(mm/kasan/generic.c:584)
>>>> [  141.525089][   T48]  __kasan_slab_free (mm/kasan/common.c:253 =
mm/kasan/common.c:285)
>>>> [  141.525570][   T48]  kfree (./include/linux/kasan.h:235 =
mm/slub.c:2689 mm/slub.c:6251 mm/slub.c:6566)
>>>> [  141.525957][   T48]  au8522_release_state =
(drivers/media/dvb-frontends/au8522_common.c:124)
>>>> [  141.526467][   T48]  dvb_frontend_put =
(drivers/media/dvb-core/dvb_frontend.c:3093 =
drivers/media/dvb-core/dvb_frontend.c:141 =
drivers/media/dvb-core/dvb_frontend.c:166)
>>>> [  141.526957][   T48]  au0828_dvb_register =
(drivers/media/usb/au0828/au0828-dvb.c:518 =
drivers/media/usb/au0828/au0828-dvb.c:634)
>>>> [  141.527469][   T48]  au0828_usb_probe =
(drivers/media/usb/au0828/au0828-core.c:733)
>>>> [  141.527952][   T48]  usb_probe_interface =
(drivers/usb/core/driver.c:396)
>>>> [  141.528455][   T48]  really_probe (drivers/base/dd.c:? =
drivers/base/dd.c:709)
>>>> [  141.528908][   T48]  __driver_probe_device =
(drivers/base/dd.c:871)
>>>> [  141.529426][   T48]  driver_probe_device (drivers/base/dd.c:901)
>>>> [  141.529932][   T48]  __device_attach_driver =
(drivers/base/dd.c:1029)
>>>> [  141.530459][   T48]  bus_for_each_drv (drivers/base/bus.c:500)
>>>> [  141.530949][   T48]  __device_attach (drivers/base/dd.c:1101)
>>>> [  141.531419][   T48]  device_initial_probe =
(drivers/base/dd.c:1156)
>>>> [  141.531923][   T48]  bus_probe_device (drivers/base/bus.c:613)
>>>> [  141.532404][   T48]  device_add (drivers/base/core.c:3706)
>>>> [  141.532840][   T48]  usb_set_configuration =
(drivers/usb/core/message.c:2268)
>>>> [  141.533373][   T48]  usb_generic_driver_probe =
(drivers/usb/core/generic.c:250)
>>>> [  141.533907][   T48]  usb_probe_device =
(drivers/usb/core/driver.c:291)
>>>> [  141.534377][   T48]  really_probe (drivers/base/dd.c:? =
drivers/base/dd.c:709)
>>>> [  141.534833][   T48]  __driver_probe_device =
(drivers/base/dd.c:871)
>>>> [  141.535352][   T48]  driver_probe_device (drivers/base/dd.c:901)
>>>> [  141.535856][   T48]  __device_attach_driver =
(drivers/base/dd.c:1029)
>>>> [  141.536384][   T48]  bus_for_each_drv (drivers/base/bus.c:500)
>>>> [  141.536869][   T48]  __device_attach (drivers/base/dd.c:1101)
>>>> [  141.537340][   T48]  device_initial_probe =
(drivers/base/dd.c:1156)
>>>> [  141.537839][   T48]  bus_probe_device (drivers/base/bus.c:613)
>>>> [  141.538320][   T48]  device_add (drivers/base/core.c:3706)
>>>> [  141.538753][   T48]  usb_new_device =
(drivers/usb/core/hub.c:2695)
>>>> [  141.539226][   T48]  hub_event (drivers/usb/core/hub.c:5567 =
drivers/usb/core/hub.c:5707 drivers/usb/core/hub.c:5871 =
drivers/usb/core/hub.c:5953)
>>>> [  141.539672][   T48]  process_scheduled_works =
(kernel/workqueue.c:3314 kernel/workqueue.c:3397)
>>>> [  141.540205][   T48]  worker_thread (kernel/workqueue.c:3478)
>>>> [  141.540666][   T48]  kthread (kernel/kthread.c:436)
>>>> [  141.541069][   T48]  ret_from_fork =
(arch/x86/kernel/process.c:158)
>>>> [  141.541524][   T48]  ret_from_fork_asm =
(arch/x86/entry/entry_64.S:245)
>>>> [  141.541999][   T48]
>>>> [  141.542236][   T48] The buggy address belongs to the object at =
ffff888171d4a000
>>>> [  141.542236][   T48]  which belongs to the cache kmalloc-4k of =
size 4096
>>>> [  141.543602][   T48] The buggy address is located 280 bytes =
inside of
>>>> [  141.543602][   T48]  freed 4096-byte region [ffff888171d4a000, =
ffff888171d4b000)



