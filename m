Return-Path: <linux-media+bounces-63068-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cD8VLHnnGWpDzwgAu9opvQ
	(envelope-from <linux-media+bounces-63068-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 29 May 2026 21:22:33 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 292DA607C89
	for <lists+linux-media@lfdr.de>; Fri, 29 May 2026 21:22:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4A2A6301A936
	for <lists+linux-media@lfdr.de>; Fri, 29 May 2026 19:22:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E0CC3AC0E4;
	Fri, 29 May 2026 19:22:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QG3kHPiq"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B719315D21
	for <linux-media@vger.kernel.org>; Fri, 29 May 2026 19:22:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780082538; cv=none; b=cqxyXBCtWlx0M8jFivJR4NfbUGSfuzCwt7nrWpLFkjz+/77fKw0IgkLOvaz0X5vwf9Ky/bdb9/irnV9XewVQtLbMjEiCiHgjHakdVroikZa+z49MSddWFqbqMzRIsOrog1e+K4s+yfZct4ee71PQqXm/HPyriLRLSf5durGzueY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780082538; c=relaxed/simple;
	bh=qad5S0TKvkXizSt9d067koQVLDXPM7wRwlG9JJU6zJM=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=b2foiu92FpWMSd3eG0KH11sB8ROl39sas/VAn+GW8HjUkUrCnj7y3DH/K868JXTC9hzEjvHkqowKsGdR6xzMaMe+Z0GqQuoTnByiuVBAYh822riZV2hgZaZ3r39M1WQEWauTyQWa2kotapQzbfzsfN62oOKmL81nQqNxHWFdOv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QG3kHPiq; arc=none smtp.client-ip=209.85.219.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-8cc0ef7c306so117165636d6.3
        for <linux-media@vger.kernel.org>; Fri, 29 May 2026 12:22:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780082535; x=1780687335; darn=vger.kernel.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=icViZXEQZu+vDX8FmGt79/IYs7Ix5jcBPZdqEEPOqW8=;
        b=QG3kHPiq/ALp5mJyQ+EhXMZ1SXSGGg7mil86WP9u/r442etszi2R4X6CFJWsqVY6f0
         Q11t8EkxO4MT30Q/DJvRyDpxkb7bq1dzI1rL73UCwfcirlIiyuCKD2lHMvKmXv2c1P0G
         9dkExJ7EMd79iPqs0s3WJDHoy5T6HaWRKy8vfMB3afdnaq225hnzCUoCYHJjw8Nf4kWB
         BuHgE8F7y8jBeZjbhMMWKGyMHXGepR/E8HqW+W9Ka6mWJ5f2oprovQHbA1EVRyf6WlsT
         zKrmJZTfyjxAaHUOmD3qN0Ii/ip6Jtlli9lJptRFpq4sHNRqLx7Q0BWoLOxIa5gTsEhj
         eO/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780082535; x=1780687335;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=icViZXEQZu+vDX8FmGt79/IYs7Ix5jcBPZdqEEPOqW8=;
        b=XytzxRStWBE8lYJvIYH1CClRcXL9q1cOHnxO1wroMYw2qwx0qt5jD+uGMXHstbbZAL
         35ndEFBdZvGDLsKj2rGVlcriuJ1elMpDsnJIji22gjut7S3Ta/IevBiPeMJ3IJqtJG/y
         PKU+gLzRgosKkUOQIaTKT/A0wJVuUBIeazAE1682aojjHrXtL3wjeG3H0IcwK4em6WDC
         RBmJDI+T6p1Ml7s72S3Q3+GoiGXBWkbxuwCCt7P15PfE6V2hjxsl3N5Q4w/XV6Tgdlzz
         YEZhffVQMlFSEAjQcSCxg2E0R6Q2yOgFROrd1WesmicZa3q6kOUkbwrW1299Jb2o4ZVo
         AbAw==
X-Forwarded-Encrypted: i=1; AFNElJ+KJJqdbPMrMw9i5jHlu9PdbSOKSuff9U0tIn+XA3TlvOd8bi0Z3a2iBNv6Q8XwogTTQpYU+kkbat3iWQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxoAiCqIFCkehqpThUBghv++TFC+GTA3RZKfAw24lde1bR06Jnb
	bH8J2Z/h7W+m36umZXs6KmWwXmhOW0f4AL3c9isN3BfwXQ7eHv5qnLM8e91sNDMi
X-Gm-Gg: Acq92OGSNsspOl7E8HbKOnodfPjKeC7gAdSjk06voIrhpDHcvG8BDfLiAfu+LauAsQH
	FCgFVGJ4YVT0j2RSG6iZI9UUQEPdXeTpIdbQCwzDe2mgx1MMr+ZOHTieVH3qAf7HEiGEiC4pHby
	wO+RGEBXLdeX8hHpwVowiH3is6y43k1uNwoxuUVWhz2+/RMaMRVHd72uorBdnum9UiGdQwyntSQ
	hveB9SSEyz94+D6ODzxTfQ/t8Lb1tcZPPoVItYJworoyfPW241Tlj5y4fJa9oWtBzxLbjCgj0if
	9F5bsCy77vjV2yhbSe45hPbQoImV9+n0i9IsM9RQIuRcmCV7XzmjNFiqPJXc6fkW0XnWFHGxRJh
	TnlCtZ19NjILuGCt+Vw22BB4bn2wZNCNkCRnkkMjp5X+t0JSqG1Wn6zYy/LHghJPlQK/K66TUB6
	/i3/+AsZleEH4U1+4LBxD9d7v7Pg0DwhTKoGJBa1XPgpjxSMRAe9uJiEQAsS6VkIDA
X-Received: by 2002:a05:6214:2301:b0:8cc:de92:882f with SMTP id 6a1803df08f44-8ccefdd473bmr18292926d6.36.1780082534930;
        Fri, 29 May 2026 12:22:14 -0700 (PDT)
Received: from smtpclient.apple ([104.39.165.68])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ccea1ca721sm25304916d6.32.2026.05.29.12.22.14
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 29 May 2026 12:22:14 -0700 (PDT)
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
In-Reply-To: <tencent_6DDC3554CD90D85E21277073C6AE67116F08@qq.com>
Date: Fri, 29 May 2026 15:22:03 -0400
Cc: brad@nextdimension.cc,
 hverkuil+cisco@kernel.org,
 linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org,
 mchehab@kernel.org,
 mingo@kernel.org,
 tglx@kernel.org,
 Pei Xiao <xiaopei01@kylinos.cn>
Content-Transfer-Encoding: quoted-printable
Message-Id: <2EBF1AF0-ED21-4B11-87DB-9E40AD082F7F@gmail.com>
References: <AAC17221-93BF-436F-92AC-906A18F882F0@gmail.com>
 <tencent_6DDC3554CD90D85E21277073C6AE67116F08@qq.com>
To: xiaopeitux@foxmail.com
X-Mailer: Apple Mail (2.3864.600.51.1.1)
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MV_CASE(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-63068-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[foxmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shuangpengkernel@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	RCPT_COUNT_SEVEN(0.00)[9];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,kylinos.cn:email]
X-Rspamd-Queue-Id: 292DA607C89
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



> On May 29, 2026, at 04:30, xiaopeitux@foxmail.com wrote:
>=20
> From: Pei Xiao <xiaopei01@kylinos.cn>
>=20
>> Hi Kernel Maintainers,
>>=20
>> We hit the following KASAN report while testing current upstream =
kernel:
>>=20
>> KASAN: slab-use-after-free in au0828_dvb_register
>>=20
>> on commit: e8c2f9fdadee7cbc75134dc463c1e0d856d6e5c7 (May 25 2026)
>>=20
>> The reproducer and .config files are here.
>> =
https://gist.github.com/shuangpengbai/c31163f8ef234ba4fe85038c2f97f9cc
>>=20
>> I=E2=80=99m happy to test debug patches or provide additional =
information.
>>=20
>> Reported-by: Shuangpeng Bai <shuangpeng.kernel@gmail.com>
> Can you help post all the crash logs?=20
> Does the kernel log have this print:=20
> "The frontend of your DVB/ATSC card isn't supported yet."=20

I did not see this message in log.


> Please help post all the logs, thank you!

Thank you for taking a look. All terminal outputs after running the =
reproducer:

[   64.807294][   T42] usb 3-1: new high-speed USB device number 2 using =
dummy_hcd
[   64.958989][   T42] usb 3-1: New USB device found, idVendor=3D0fe9, =
idProduct=3Dd620, bcdDevice=3D 1.00
[   64.961560][   T42] usb 3-1: New USB device strings: Mfr=3D0, =
Product=3D0, SerialNumber=3D0
[   65.351442][   T42] au0828: i2c bus registered
[   65.634777][   T42] au8522 1-0047: creating new instance
[   65.655406][   T42] DVB: Unable to find symbol xc5000_attach()
[   65.656022][   T42] dvbdev: DVB: registering new adapter (au0828)
[   65.656632][   T42] au0828: dvb_register_frontend failed (errno =3D =
-12)
[   65.658957][   T42] au8522 1-0047: destroying instance
[   65.659499][   T42] =
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
[   65.660261][   T42] BUG: KASAN: slab-use-after-free in =
au0828_dvb_register+0x1280/0x15f0
[   65.661023][   T42] Read of size 8 at addr ffff8881685f4118 by task =
kworker/1:1/42
[   65.661742][   T42]
[   65.661973][   T42] CPU: 1 UID: 0 PID: 42 Comm: kworker/1:1 Not =
tainted 7.1.0-rc5-00006-ge8c2f9fdadee #16 PREEMPT(
[   65.661978][   T42] Hardware name: QEMU Ubuntu 24.04 PC v2 (i440FX + =
PIIX, arch_caps fix, 1996), BIOS 1.16.3-debia4
[   65.661981][   T42] Workqueue: usb_hub_wq hub_event
[   65.661988][   T42] Call Trace:
[   65.661991][   T42]  <TASK>
[   65.661993][   T42]  dump_stack_lvl+0x26/0x80
[   65.661999][   T42]  print_report+0x16a/0x5d0
[   65.662013][   T42]  kasan_report+0xc3/0x100
[   65.662019][   T42]  au0828_dvb_register+0x1280/0x15f0
[   65.662026][   T42]  au0828_usb_probe+0x353/0x4b0
[   65.662029][   T42]  usb_probe_interface+0x4aa/0xa40
[   65.662034][   T42]  really_probe+0x259/0x9a0
[   65.662041][   T42]  __driver_probe_device+0x18b/0x370
[   65.662045][   T42]  driver_probe_device+0x4b/0x1e0
[   65.662049][   T42]  __device_attach_driver+0x1d0/0x2f0
[   65.662055][   T42]  bus_for_each_drv+0x22a/0x260
[   65.663294][   T42]  __device_attach+0x25a/0x480
[   65.663321][   T42]  device_initial_probe+0x68/0xa0
[   65.663324][   T42]  bus_probe_device+0x10a/0x1d0
[   65.663328][   T42]  device_add+0x56b/0x9c0
[   65.663332][   T42]  usb_set_configuration+0x1775/0x1d80
[   65.663337][   T42]  usb_generic_driver_probe+0x61/0xf0
[   65.663343][   T42]  usb_probe_device+0xd3/0x2a0
[   65.663346][   T42]  really_probe+0x259/0x9a0
[   65.663350][   T42]  __driver_probe_device+0x18b/0x370
[   65.663354][   T42]  driver_probe_device+0x4b/0x1e0
[   65.663357][   T42]  __device_attach_driver+0x1d0/0x2f0
[   65.663363][   T42]  bus_for_each_drv+0x22a/0x260
[   65.663381][   T42]  __device_attach+0x25a/0x480
[   65.663403][   T42]  device_initial_probe+0x68/0xa0
[   65.663405][   T42]  bus_probe_device+0x10a/0x1d0
[   65.663409][   T42]  device_add+0x56b/0x9c0
[   65.663412][   T42]  usb_new_device+0xbdd/0x1830
[   65.663423][   T42]  hub_event+0x2358/0x4090
[   65.663443][   T42]  process_scheduled_works+0x73d/0xed0
[   65.663451][   T42]  worker_thread+0x7d6/0xb60
[   65.663459][   T42]  kthread+0x322/0x410
[   65.663470][   T42]  ret_from_fork+0x285/0x750
[   65.663485][   T42]  ret_from_fork_asm+0x1a/0x30
[   65.663491][   T42]  </TASK>
[   65.663493][   T42]
[   65.702422][   T42] Freed by task 42 on cpu 1 at 65.659497s:
[   65.702994][   T42]  kasan_save_track+0x2e/0x90
[   65.703471][   T42]  kasan_save_free_info+0x3c/0x50
[   65.703965][   T42]  __kasan_slab_free+0x36/0x60
[   65.704450][   T42]  kfree+0x154/0x450
[   65.704839][   T42]  au8522_release_state+0x1b6/0x210
[   65.705364][   T42]  dvb_frontend_put+0x12a/0x170
[   65.705848][   T42]  au0828_dvb_register+0xfd9/0x15f0
[   65.706373][   T42]  au0828_usb_probe+0x353/0x4b0
[   65.706854][   T42]  usb_probe_interface+0x4aa/0xa40
[   65.707373][   T42]  really_probe+0x259/0x9a0
[   65.707822][   T42]  __driver_probe_device+0x18b/0x370
[   65.708347][   T42]  driver_probe_device+0x4b/0x1e0
[   65.708845][   T42]  __device_attach_driver+0x1d0/0x2f0
[   65.709383][   T42]  bus_for_each_drv+0x22a/0x260
[   65.709864][   T42]  __device_attach+0x25a/0x480
[   65.710339][   T42]  device_initial_probe+0x68/0xa0
[   65.710836][   T42]  bus_probe_device+0x10a/0x1d0
[   65.711323][   T42]  device_add+0x56b/0x9c0
[   65.711750][   T42]  usb_set_configuration+0x1775/0x1d80
[   65.712294][   T42]  usb_generic_driver_probe+0x61/0xf0
[   65.712822][   T42]  usb_probe_device+0xd3/0x2a0
[   65.713305][   T42]  really_probe+0x259/0x9a0
[   65.713752][   T42]  __driver_probe_device+0x18b/0x370
[   65.714282][   T42]  driver_probe_device+0x4b/0x1e0
[   65.714779][   T42]  __device_attach_driver+0x1d0/0x2f0
[   65.715313][   T42]  bus_for_each_drv+0x22a/0x260
[   65.715794][   T42]  __device_attach+0x25a/0x480
[   65.716271][   T42]  device_initial_probe+0x68/0xa0
[   65.716767][   T42]  bus_probe_device+0x10a/0x1d0
[   65.717262][   T42]  device_add+0x56b/0x9c0
[   65.717690][   T42]  usb_new_device+0xbdd/0x1830
[   65.717869][    C0] clocksource: Watchdog remote CPU 1 read timed out
[   65.718172][   T42]  hub_event+0x2358/0x4090
[   65.718177][   T42]  process_scheduled_works+0x73d/0xed0
[   65.718180][   T42]  worker_thread+0x7d6/0xb60
[   65.718183][   T42]  kthread+0x322/0x410
[   65.718187][   T42]  ret_from_fork+0x285/0x750
[   65.718189][   T42]  ret_from_fork_asm+0x1a/0x30
[   65.718192][   T42]
[   65.718194][   T42] The buggy address belongs to the object at =
ffff8881685f4000
[   65.718194][   T42]  which belongs to the cache kmalloc-4k of size =
4096
[   65.718197][   T42] The buggy address is located 280 bytes inside of
[   65.718197][   T42]  freed 4096-byte region [ffff8881685f4000, =
ffff8881685f5000)
[   65.718200][   T42]
[   65.718201][   T42] The buggy address belongs to the physical page:
[   65.718204][   T42] page: refcount:0 mapcount:0 =
mapping:0000000000000000 index:0x0 pfn:0x1685f0
[   65.718209][   T42] head: order:3 mapcount:0 entire_mapcount:0 =
nr_pages_mapped:0 pincount:0
[   65.718212][   T42] flags: =
0x17ff00000000040(head|node=3D0|zone=3D2|lastcpupid=3D0x7ff)
[   65.729357][   T42] page_type: f5(slab)
[   65.729757][   T42] raw: 017ff00000000040 ffff888100042140 =
dead000000000100 dead000000000122
[   65.730603][   T42] raw: 0000000000000000 0000000800040004 =
00000000f5000000 0000000000000000
[   65.731450][   T42] head: 017ff00000000040 ffff888100042140 =
dead000000000100 dead000000000122
[   65.732301][   T42] head: 0000000000000000 0000000800040004 =
00000000f5000000 0000000000000000
[   65.733211][   T42] head: 017ff00000000003 fffffffffffffe01 =
00000000ffffffff 00000000ffffffff
[   65.734064][   T42] head: ffffffffffffffff 0000000000000000 =
00000000ffffffff 0000000000000008
[   65.734922][   T42] page dumped because: kasan: bad access detected
[   65.735562][   T42] page_owner tracks the page as allocated
[   65.736133][   T42] page last allocated via order 3, migratetype =
Unmovable, gfp_mask 0xd20c0(__GFP_IO|__GFP_FS|__G2
[   65.738177][   T42]  post_alloc_hook+0x152/0x180
[   65.738654][   T42]  get_page_from_freelist+0x3996/0x3b50
[   65.739207][   T42]  __alloc_frozen_pages_noprof+0x243/0x750
[   65.739783][   T42]  allocate_slab+0x76/0x5e0
[   65.740242][   T42]  refill_objects+0x2e1/0x360
[   65.740706][   T42]  __pcs_replace_empty_main+0x233/0x440
[   65.741262][   T42]  __kmalloc_cache_noprof+0x2d0/0x490
[   65.741791][   T42]  au8522_get_state+0x266/0x4c0
[   65.742280][   T42]  au8522_attach+0xba/0x2d0
[   65.742728][   T42]  au0828_dvb_register+0xcc/0x15f0
[   65.743241][   T42]  au0828_usb_probe+0x353/0x4b0
[   65.743723][   T42]  usb_probe_interface+0x4aa/0xa40
[   65.744264][   T42]  really_probe+0x259/0x9a0
[   65.744713][   T42]  __driver_probe_device+0x18b/0x370
[   65.745246][   T42]  driver_probe_device+0x4b/0x1e0
[   65.745745][   T42]  __device_attach_driver+0x1d0/0x2f0
[   65.746284][   T42] page last free pid 4578 tgid 4578 stack trace:
[   65.746909][   T42]  __free_frozen_pages+0xb8c/0xcb0
[   65.747427][   T42]  __slab_free+0x219/0x260
[   65.747870][   T42]  qlist_free_all+0x33/0x120
[   65.748339][   T42]  kasan_quarantine_reduce+0x152/0x170
[   65.748877][   T42]  __kasan_slab_alloc+0x1f/0x60
[   65.749368][   T42]  kmem_cache_alloc_noprof+0x1f0/0x480
[   65.749908][   T42]  do_getname+0x2a/0x1c0
[   65.750337][   T42]  do_sys_openat2+0x99/0x190
[   65.750798][   T42]  __x64_sys_openat+0x20b/0x260
[   65.751287][   T42]  do_syscall_64+0x125/0x590
[   65.751744][   T42]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
[   65.752334][   T42]
[   65.752572][   T42] Memory state around the buggy address:
[   65.753132][   T42]  ffff8881685f4000: fa fb fb fb fb fb fb fb fb fb =
fb fb fb fb fb fb
[   65.753918][   T42]  ffff8881685f4080: fb fb fb fb fb fb fb fb fb fb =
fb fb fb fb fb fb
[   65.754712][   T42] >ffff8881685f4100: fb fb fb fb fb fb fb fb fb fb =
fb fb fb fb fb fb
[   65.755504][   T42]                             ^
[   65.755985][   T42]  ffff8881685f4180: fb fb fb fb fb fb fb fb fb fb =
fb fb fb fb fb fb
[   65.756775][   T42]  ffff8881685f4200: fb fb fb fb fb fb fb fb fb fb =
fb fb fb fb fb fb
[   65.757575][   T42] =
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
[   65.758570][   T42] Kernel panic - not syncing: KASAN: panic_on_warn =
set ...
[   65.759306][   T42] CPU: 1 UID: 0 PID: 42 Comm: kworker/1:1 Not =
tainted 7.1.0-rc5-00006-ge8c2f9fdadee #16 PREEMPT(
[   65.760402][   T42] Hardware name: QEMU Ubuntu 24.04 PC v2 (i440FX + =
PIIX, arch_caps fix, 1996), BIOS 1.16.3-debia4
[   65.761615][   T42] Workqueue: usb_hub_wq hub_event
[   65.762263][   T42] Call Trace:
[   65.762658][   T42]  <TASK>
[   65.762956][   T42]  dump_stack_lvl+0x26/0x80
[   65.763420][   T42]  vpanic+0x37d/0x710
[   65.764686][   T42]  panic+0x9f/0xa0
[   65.767120][   T42]  check_panic_on_warn+0x58/0x70
[   65.768155][   T42]  end_report+0x44/0xe0
[   65.769116][   T42]  kasan_report+0xd4/0x100
[   65.770092][   T42]  au0828_dvb_register+0x1280/0x15f0
[   65.771097][   T42]  au0828_usb_probe+0x353/0x4b0
[   65.771586][   T42]  usb_probe_interface+0x4aa/0xa40
[   65.772089][   T42]  really_probe+0x259/0x9a0
[   65.772549][   T42]  __driver_probe_device+0x18b/0x370
[   65.773069][   T42]  driver_probe_device+0x4b/0x1e0
[   65.773576][   T42]  __device_attach_driver+0x1d0/0x2f0
[   65.774692][   T42]  bus_for_each_drv+0x22a/0x260
[   65.777453][   T42]  __device_attach+0x25a/0x480
[   65.780818][   T42]  device_initial_probe+0x68/0xa0
[   65.781322][   T42]  bus_probe_device+0x10a/0x1d0
[   65.781800][   T42]  device_add+0x56b/0x9c0
[   65.782284][   T42]  usb_set_configuration+0x1775/0x1d80
[   65.782822][   T42]  usb_generic_driver_probe+0x61/0xf0
[   65.783361][   T42]  usb_probe_device+0xd3/0x2a0
[   65.783832][   T42]  really_probe+0x259/0x9a0
[   65.784286][   T42]  __driver_probe_device+0x18b/0x370
[   65.784804][   T42]  driver_probe_device+0x4b/0x1e0
[   65.785304][   T42]  __device_attach_driver+0x1d0/0x2f0
[   65.786416][   T42]  bus_for_each_drv+0x22a/0x260
[   65.789198][   T42]  __device_attach+0x25a/0x480
[   65.792606][   T42]  device_initial_probe+0x68/0xa0
[   65.793101][   T42]  bus_probe_device+0x10a/0x1d0
[   65.793602][   T42]  device_add+0x56b/0x9c0
[   65.794028][   T42]  usb_new_device+0xbdd/0x1830
[   65.795025][   T42]  hub_event+0x2358/0x4090
[   65.797580][   T42]  process_scheduled_works+0x73d/0xed0
[   65.798124][   T42]  worker_thread+0x7d6/0xb60
[   65.799085][   T42]  kthread+0x322/0x410
[   65.800465][   T42]  ret_from_fork+0x285/0x750
[   65.802356][   T42]  ret_from_fork_asm+0x1a/0x30
[   65.802830][   T42]  </TASK>
[   65.803886][   T42] Kernel Offset: disabled
[   65.804329][   T42] ---[ end Kernel panic - not syncing: KASAN: =
panic_on_warn set ... ]=E2=80=94

>=20
>>=20
>>=20
>> [  141.481576][   T48] =
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> [  141.482348][   T48] BUG: KASAN: slab-use-after-free in =
au0828_dvb_register (drivers/media/usb/au0828/au0828-dvb.c:636)
>> [  141.483148][   T48] Read of size 8 at addr ffff888171d4a118 by =
task kworker/1:1/48
>> [  141.483903][   T48]
>> [  141.484144][   T48] Hardware name: QEMU Ubuntu 24.04 PC v2 (i440FX =
+ PIIX, arch_caps fix, 1996), BIOS 1.16.34
>> [  141.484148][   T48] Workqueue: usb_hub_wq hub_event
>> [  141.484154][   T48] Call Trace:
>> [  141.484157][   T48]  <TASK>
>> [  141.484159][   T48]  dump_stack_lvl (lib/dump_stack.c:94 =
lib/dump_stack.c:120)
>> [  141.484164][   T48]  print_report (mm/kasan/report.c:378 =
mm/kasan/report.c:482)
>> [  141.484177][   T48]  kasan_report (mm/kasan/report.c:595)
>> [  141.484183][   T48]  au0828_dvb_register =
(drivers/media/usb/au0828/au0828-dvb.c:636)
>> [  141.484190][   T48]  au0828_usb_probe =
(drivers/media/usb/au0828/au0828-core.c:733)
>> [  141.484193][   T48]  usb_probe_interface =
(drivers/usb/core/driver.c:396)
>> [  141.484198][   T48]  really_probe (drivers/base/dd.c:? =
drivers/base/dd.c:709)
>> [  141.484204][   T48]  __driver_probe_device (drivers/base/dd.c:871)
>> [  141.484207][   T48]  driver_probe_device (drivers/base/dd.c:901)
>> [  141.484211][   T48]  __device_attach_driver =
(drivers/base/dd.c:1029)
>> [  141.484217][   T48]  bus_for_each_drv (drivers/base/bus.c:500)
>> [  141.484264][   T48]  __device_attach (drivers/base/dd.c:1101)
>> [  141.484289][   T48]  device_initial_probe (drivers/base/dd.c:1156)
>> [  141.484292][   T48]  bus_probe_device (drivers/base/bus.c:613)
>> [  141.484296][   T48]  device_add (drivers/base/core.c:3706)
>> [  141.484299][   T48]  usb_set_configuration =
(drivers/usb/core/message.c:2268)
>> [  141.484303][   T48]  usb_generic_driver_probe =
(drivers/usb/core/generic.c:250)
>> [  141.484308][   T48]  usb_probe_device =
(drivers/usb/core/driver.c:291)
>> [  141.484311][   T48]  really_probe (drivers/base/dd.c:? =
drivers/base/dd.c:709)
>> [  141.484315][   T48]  __driver_probe_device (drivers/base/dd.c:871)
>> [  141.484318][   T48]  driver_probe_device (drivers/base/dd.c:901)
>> [  141.484321][   T48]  __device_attach_driver =
(drivers/base/dd.c:1029)
>> [  141.484328][   T48]  bus_for_each_drv (drivers/base/bus.c:500)
>> [  141.484346][   T48]  __device_attach (drivers/base/dd.c:1101)
>> [  141.484367][   T48]  device_initial_probe (drivers/base/dd.c:1156)
>> [  141.484370][   T48]  bus_probe_device (drivers/base/bus.c:613)
>> [  141.484374][   T48]  device_add (drivers/base/core.c:3706)
>> [  141.484376][   T48]  usb_new_device (drivers/usb/core/hub.c:2695)
>> [  141.484386][   T48]  hub_event (drivers/usb/core/hub.c:5567 =
drivers/usb/core/hub.c:5707 drivers/usb/core/hub.c:5871 =
drivers/usb/core/hub.c:5953)
>> [  141.484406][   T48]  process_scheduled_works =
(kernel/workqueue.c:3314 kernel/workqueue.c:3397)
>> [  141.484412][   T48]  worker_thread (kernel/workqueue.c:3478)
>> [  141.484420][   T48]  kthread (kernel/kthread.c:436)
>> [  141.484431][   T48]  ret_from_fork (arch/x86/kernel/process.c:158)
>> [  141.484445][   T48]  ret_from_fork_asm =
(arch/x86/entry/entry_64.S:245)
>> [  141.484450][   T48]  </TASK>
>> [  141.484451][   T48]
>> [  141.523531][   T48] Freed by task 48 on cpu 1 at 141.481575s:
>> [  141.524120][   T48]  kasan_save_track (mm/kasan/common.c:57 =
mm/kasan/common.c:78)
>> [  141.524594][   T48]  kasan_save_free_info (mm/kasan/generic.c:584)
>> [  141.525089][   T48]  __kasan_slab_free (mm/kasan/common.c:253 =
mm/kasan/common.c:285)
>> [  141.525570][   T48]  kfree (./include/linux/kasan.h:235 =
mm/slub.c:2689 mm/slub.c:6251 mm/slub.c:6566)
>> [  141.525957][   T48]  au8522_release_state =
(drivers/media/dvb-frontends/au8522_common.c:124)
>> [  141.526467][   T48]  dvb_frontend_put =
(drivers/media/dvb-core/dvb_frontend.c:3093 =
drivers/media/dvb-core/dvb_frontend.c:141 =
drivers/media/dvb-core/dvb_frontend.c:166)
>> [  141.526957][   T48]  au0828_dvb_register =
(drivers/media/usb/au0828/au0828-dvb.c:518 =
drivers/media/usb/au0828/au0828-dvb.c:634)
>> [  141.527469][   T48]  au0828_usb_probe =
(drivers/media/usb/au0828/au0828-core.c:733)
>> [  141.527952][   T48]  usb_probe_interface =
(drivers/usb/core/driver.c:396)
>> [  141.528455][   T48]  really_probe (drivers/base/dd.c:? =
drivers/base/dd.c:709)
>> [  141.528908][   T48]  __driver_probe_device (drivers/base/dd.c:871)
>> [  141.529426][   T48]  driver_probe_device (drivers/base/dd.c:901)
>> [  141.529932][   T48]  __device_attach_driver =
(drivers/base/dd.c:1029)
>> [  141.530459][   T48]  bus_for_each_drv (drivers/base/bus.c:500)
>> [  141.530949][   T48]  __device_attach (drivers/base/dd.c:1101)
>> [  141.531419][   T48]  device_initial_probe (drivers/base/dd.c:1156)
>> [  141.531923][   T48]  bus_probe_device (drivers/base/bus.c:613)
>> [  141.532404][   T48]  device_add (drivers/base/core.c:3706)
>> [  141.532840][   T48]  usb_set_configuration =
(drivers/usb/core/message.c:2268)
>> [  141.533373][   T48]  usb_generic_driver_probe =
(drivers/usb/core/generic.c:250)
>> [  141.533907][   T48]  usb_probe_device =
(drivers/usb/core/driver.c:291)
>> [  141.534377][   T48]  really_probe (drivers/base/dd.c:? =
drivers/base/dd.c:709)
>> [  141.534833][   T48]  __driver_probe_device (drivers/base/dd.c:871)
>> [  141.535352][   T48]  driver_probe_device (drivers/base/dd.c:901)
>> [  141.535856][   T48]  __device_attach_driver =
(drivers/base/dd.c:1029)
>> [  141.536384][   T48]  bus_for_each_drv (drivers/base/bus.c:500)
>> [  141.536869][   T48]  __device_attach (drivers/base/dd.c:1101)
>> [  141.537340][   T48]  device_initial_probe (drivers/base/dd.c:1156)
>> [  141.537839][   T48]  bus_probe_device (drivers/base/bus.c:613)
>> [  141.538320][   T48]  device_add (drivers/base/core.c:3706)
>> [  141.538753][   T48]  usb_new_device (drivers/usb/core/hub.c:2695)
>> [  141.539226][   T48]  hub_event (drivers/usb/core/hub.c:5567 =
drivers/usb/core/hub.c:5707 drivers/usb/core/hub.c:5871 =
drivers/usb/core/hub.c:5953)
>> [  141.539672][   T48]  process_scheduled_works =
(kernel/workqueue.c:3314 kernel/workqueue.c:3397)
>> [  141.540205][   T48]  worker_thread (kernel/workqueue.c:3478)
>> [  141.540666][   T48]  kthread (kernel/kthread.c:436)
>> [  141.541069][   T48]  ret_from_fork (arch/x86/kernel/process.c:158)
>> [  141.541524][   T48]  ret_from_fork_asm =
(arch/x86/entry/entry_64.S:245)
>> [  141.541999][   T48]
>> [  141.542236][   T48] The buggy address belongs to the object at =
ffff888171d4a000
>> [  141.542236][   T48]  which belongs to the cache kmalloc-4k of size =
4096
>> [  141.543602][   T48] The buggy address is located 280 bytes inside =
of
>> [  141.543602][   T48]  freed 4096-byte region [ffff888171d4a000, =
ffff888171d4b000)



