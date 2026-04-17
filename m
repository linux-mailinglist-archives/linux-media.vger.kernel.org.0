Return-Path: <linux-media+bounces-59053-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id rVUbMHiy4mkE9QAAu9opvQ
	(envelope-from <linux-media+bounces-59053-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 18 Apr 2026 00:21:44 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id EBCE141EDDA
	for <lists+linux-media@lfdr.de>; Sat, 18 Apr 2026 00:21:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D705630580BA
	for <lists+linux-media@lfdr.de>; Fri, 17 Apr 2026 22:21:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2549D330B25;
	Fri, 17 Apr 2026 22:21:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="naWG3oLB"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46A5FDDCD
	for <linux-media@vger.kernel.org>; Fri, 17 Apr 2026 22:21:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776464495; cv=pass; b=A6XiFlJDuvTBoL7NvfuvBCI0cN/lSBPOtlZEJXNofijAvoVC3Lr28uYPeIiWDzx5RzKZ2wm+lWZIboNJq9nP70Yd4DCjmzqNZtcGNO4a+nMEPrcR8QhHMjOlcE+gtUiA2n6sZa+4c3+4DXbmPZ1tSN+zDfF9NsVQCVKgV0EiRJo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776464495; c=relaxed/simple;
	bh=3F0CvrAyaeJ+DjbcsdZ+65Bcq0X6BV+YYhgIHQZGwa4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uNCDW+LSZqhpN+wNLzO2dJdmkbbK4sDKKaVRb6i314xUYm8oxQPr+4JUnryw9CGxTpDsZump8CqCMcd0JUO6y5dxRN1tM7gYBDuySB2AL+qcDtwWqvel7NKl0VQnLAULSyUdqpnhVcio/KlxTfKbEro+4+BYbRw9PcFxVl4NgfA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=naWG3oLB; arc=pass smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-488b00ed86fso11739805e9.3
        for <linux-media@vger.kernel.org>; Fri, 17 Apr 2026 15:21:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776464493; cv=none;
        d=google.com; s=arc-20240605;
        b=M1oQS5yObBKWyJIIBQAm5XVX2bio00zpEGytmtiZtCmmTHl+sBMQFLTmWOAM5puYOh
         IRWK6+VmbeEVIB7e0QOKmKTfIw7nrvvyovn3CNQkc4ySSCC2GRd2whKFKB0JMieukxOB
         b13d0+6eFT3qD2ijmDdK4EW7LJEOfElxG90rBFovWmIqzZchfZhdnaVN5kUVqerCbHaL
         CtW3BhxJnZTfH/DJweTpX8rGHYn0WmX80VyksvzTHfcOgp8o9/sP4JEkB5hNCfqP/FT0
         TVxGzDOL++f1gdPiBzQTUsyByCsoaVU8w060EHllOFXliSaFTbVMCdtdE/PkK8NpQFLs
         O6yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=r4v9PMTAErmefRyadCWFG1MX53EX7cnax51QnXnaIho=;
        fh=gnQJfklydKnBrmTm9wBVBuQLpLVC7zhNVL2JsBI2IhM=;
        b=HMwsrlcbMtEeZ/93ZO0Wb6mlX5V49V65RHzBssl7wk2VsZ5mcjW6+GN5Z5mY0u6HyI
         we5vRhzk0Hr2aPRveDyu2XS8bdFdof6t/i3a8Fyjcje+8o2l6rsOtS60p6311nhsaQEx
         RELLX3WI6d4Fy2ya228s4FiUt55r2Q/okSfBFuiVpPoquH+oqax4ovnZ2i1w939QNIAr
         v8+j+JeXndcedFPE9DUR9CQzTOrQwIF1eeFqbwaNKYsui9GApxkJq+7ATJrVJJmHuGWZ
         /iqjZyJkB9lECuZOB/12ZsX7E6QS5ozQ4OmRDbbHd19gXhDhrcX3O+oblubRcvTBMPCv
         OVxg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776464493; x=1777069293; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r4v9PMTAErmefRyadCWFG1MX53EX7cnax51QnXnaIho=;
        b=naWG3oLB4crV2uyEATggi4IqHz7pIlEEzaWkbeA64ObfvSau+VR7sPtSPjdYWxxmh9
         WSapcG+UDjUprnnV32uLyVMzfq7xDQquVGce3/ddxJQYfIWP/rTrAc6o/7rFE/CamOW7
         p4zgdl4CdnDVhthdDsp68Cd/mUK0OmkGFBQq3S5dSVS/AIt2p3KfpLlFSfD0VPpu3XOM
         eEUPi8GLkVAI7jRwlbV8L1IHa9V3LR/MY1AO4PN5JqxZaO14ZE8Gp9D90AnK8wod+PSV
         IuBqdwmeRAjvQOhLBznDcufegWa5Y+3FHlg5Z8r2t+ek0VR4WoN8Z03mwMOGKB+x5J5w
         ++ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776464493; x=1777069293;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=r4v9PMTAErmefRyadCWFG1MX53EX7cnax51QnXnaIho=;
        b=apEtFhPgZbfdvhrPmVeyKbtMQKqxbtJ3b/G8fvGqZ2wta8iuq8du0lzoxkw39gz85H
         jDiOtPnWOz2ruW95ybtfHmoAxLSoB1vkfikIBFEGyzzGN9t5MycbMBZXew0Eac3rEJIX
         ARTXgMemIfoYwWWXmYLzlLw2yGNOLPdCIAxexVO5RAKT77uMhWWqxqOnuslDx5Ds7N8W
         /z+SBdblEqUM1fz0Rrlzg1ZURUBbT1+g9EKNQcDN6X7CfWFzFPu4SiHo52ZqRctX9gLg
         2bTvcKQiQvOhNcpAVBvtxKTcUrxYOFjSGLXZMKD5JoUab9MQ1Qx7sgNa9FtQu9SD2eFk
         PYbg==
X-Forwarded-Encrypted: i=1; AFNElJ/1ERB6aX0E4+PBzO3KF7q4iAIAE2TQQCtg4zuEXiEtv016JYHJavhTNljBD+uLRpUpdT6yyCQhWxdc1w==@vger.kernel.org
X-Gm-Message-State: AOJu0YyZVSiJBKg2Ml5N6fHi8BL+sP9jK81+P9QaPShcV141TlXvZ1gF
	9rORlW/W4DcukHk91mrC3iTMurOVkGfqwEo1zce8m6pbujoik/UD71CbXxSHg9+e1p0CDQpSjRX
	5xiU8UU/HpcPFy9y8Qu+5oWKchc0pTbsoWDZQ
X-Gm-Gg: AeBDiesNmDdR1S63nhRFkegHz60B1diyXpcsaTfYBl3uwGA2gB8C10DI/Hts8kx3V/N
	rCgSjP+cPDBE7TiOfuJgnF8XyoAhDjOIQLaNTyVgJw2e7aTNY72iFg9DyTBmyAiLTCWSoJZiBa+
	YoMAi+jz5llkn9nuCFPgPG+vzYT8E+9e72MFwJ+B8R6b+gx2Qb3fBDdkIhzJAPrAaDhZF++ijJz
	3SaH19QY4vVM5jjSDbH/1XPxj+oZ6OzYYlvPEmYxQ9iGkOdUCDv8gBwh1DMUK4FSQYB7cO6fCS8
	Dnlk2wH5yD38M9gFvPej+DoCnttM0Yc/t9LIpjN+DBEcfOYM3Q==
X-Received: by 2002:a05:600c:8b2e:b0:488:b749:8482 with SMTP id
 5b1f17b1804b1-488fb7469b3mr76350045e9.4.1776464492389; Fri, 17 Apr 2026
 15:21:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <09072a14-77bf-47cc-9b79-1edc3c1426ea@I-love.SAKURA.ne.jp>
In-Reply-To: <09072a14-77bf-47cc-9b79-1edc3c1426ea@I-love.SAKURA.ne.jp>
From: Tomoki Sekiyama <tomoki.sekiyama@gmail.com>
Date: Sat, 18 Apr 2026 07:21:20 +0900
X-Gm-Features: AQROBzCVDcvMN-LBMXdnn6NMz4RRcLt5xKpwDNtJkeOMbuDrxyEQUsazQBRfN_8
Message-ID: <CAM1upfObdH0tKZ3KcO4h3HG6hcD95ZcpjA9m-fqjdK7RHzHYXA@mail.gmail.com>
Subject: Re: [PATCH] media: usb: siano: don't set URB_FREE_BUFFER flag
To: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Kees Cook <kees@kernel.org>, linux-media@vger.kernel.org, 
	LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-59053-lists,linux-media=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tomokisekiyama@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,syzkaller.appspot.com:url,appspotmail.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,i-love.sakura.ne.jp:email]
X-Rspamd-Queue-Id: EBCE141EDDA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi,
I have tested your patch with PLEX PX-S1UD V2.0 (siano USB tuner) and
confirmed that it fixes the following warnings
originally shown when the driver is unloaded or the tuner is unplugged
WITHOUT your patch.

[  109.352681] WARNING: mm/slub.c:6914 at
free_large_kmalloc+0x71/0xc0, CPU#3: modprobe/18686
...
[  109.352856] Call Trace:
[  109.352858]  <TASK>
[  109.352862]  usb_free_urb+0x4e/0x60
[  109.352868]  smsusb_term_device+0x5d/0xd0 [smsusb]
[  109.352875]  usb_unbind_interface+0x9d/0x2c0
[  109.352881]  device_release_driver_internal+0x19e/0x200
[  109.352887]  driver_detach+0x48/0x90
[  109.352890]  bus_remove_driver+0x6d/0x100
[  109.352894]  usb_deregister+0x64/0xe7
[  109.352899]  __do_sys_delete_module.isra.0+0x1b6/0x2e0
[  109.352906]  do_syscall_64+0x7e/0x690
...
[  109.353204] page dumped because: Not a kmalloc allocation


> If nobody is using this module, we should consider removing this module?
At least I have a device for this module and compatible devices like
MyGica S270 seems still available on Amazon.

Tested-by: Tomoki Sekiyama <tomoki.sekiyama@gmail.com>

Thanks!

2026=E5=B9=B44=E6=9C=8817=E6=97=A5(=E9=87=91) 23:30 Tetsuo Handa <penguin-k=
ernel@i-love.sakura.ne.jp>:
>
> syzbot is reporting invalid free at usb_free_urb(), for
>
>   smscore_register_device() allocates all buffers at once as an array
>
>   smscore_createbuffer() maps each element in the array to cb->p
>
>   usb_fill_bulk_urb() assigns urb->transfer_buffer using cb->p
>   which may point to a non-head element in the array
>
>   URB_FREE_BUFFER causes usb_free_urb() to free urb->transfer_buffer
>   which may point to a non-head element in the array
>
> The urb->transfer_buffer must point to an address returned by kmalloc()
> family if URB_FREE_BUFFER flag is set. But since the urb->transfer_buffer
> allocation strategy for this module is to allocate buffers upon device
> registration and free buffers upon device unregistration, we should
> avoid setting URB_FREE_BUFFER flag. Otherwise, double free or invalid
> free will happen.
>
> Reported-by: syzbot+b466336413a1fba398a5@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=3Db466336413a1fba398a5
> Fixes: 564246fd3ff4 ("media: siano: Fix coherent memory allocation failur=
e on arm64")
> Signed-off-by: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
> ---
> I found that the same change was proposed at
> https://lore.kernel.org/all/20250522140048.2811356-1-n.zhandarovich@finte=
ch.ru/T/
> after I wrote this patch.
> If nobody is using this module, we should consider removing this module?
>
>  drivers/media/usb/siano/smsusb.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/media/usb/siano/smsusb.c b/drivers/media/usb/siano/s=
msusb.c
> index 0fdc2e0950b7..8140dc0c8b7d 100644
> --- a/drivers/media/usb/siano/smsusb.c
> +++ b/drivers/media/usb/siano/smsusb.c
> @@ -168,7 +168,6 @@ static int smsusb_submit_urb(struct smsusb_device_t *=
dev,
>                 smsusb_onresponse,
>                 surb
>         );
> -       surb->urb->transfer_flags |=3D URB_FREE_BUFFER;
>
>         return usb_submit_urb(surb->urb, GFP_ATOMIC);
>  }
> --
> 2.47.3
>

