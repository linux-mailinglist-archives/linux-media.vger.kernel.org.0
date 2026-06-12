Return-Path: <linux-media+bounces-64658-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id iOWBE9TJK2oeFAQAu9opvQ
	(envelope-from <linux-media+bounces-64658-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 12 Jun 2026 10:56:52 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C0F5A677FDB
	for <lists+linux-media@lfdr.de>; Fri, 12 Jun 2026 10:56:51 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=JlZ7ksuG;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64658-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-64658-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 20B5930143F6
	for <lists+linux-media@lfdr.de>; Fri, 12 Jun 2026 08:56:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDD5B37C91E;
	Fri, 12 Jun 2026 08:56:45 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A4E83793AD
	for <linux-media@vger.kernel.org>; Fri, 12 Jun 2026 08:56:43 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781254605; cv=pass; b=BFfooAvfctDMPDKvhUZKuOunM7VBaqDpLJP62RjGsyI8kDOo9DMTaSnYZx0qurXOXMw1Ux4aHrWhe3JACE56ZEihS943qUhBs4xpuHvW4huRSr/Zj/EC7uDqXoKvd+Xyw50oUaeYZdO4YQjB8m5crH7fP8Ul5QkGIoYScL+ZaeQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781254605; c=relaxed/simple;
	bh=MunyWXbepY0QaqqzCGLsXCKznA6TknfTC548B46eYGQ=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=NwfcAxgwagxoV02NSLg9f5c6nV03u7EO92+yqk/BO4ObSXk0y8081dTqcKQWExntyBVy9Q26GLyYlC1iwglZOomtwF3cYkr/SLZYEGY00jcmvqmNkmGKTmh/0wtCNs6de2r15iWnasEovTqYM3FsbgvOk9IxKslzGVjnjz1j3fk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JlZ7ksuG; arc=pass smtp.client-ip=209.85.128.181
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-7ea6923cc94so7154017b3.3
        for <linux-media@vger.kernel.org>; Fri, 12 Jun 2026 01:56:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781254602; cv=none;
        d=google.com; s=arc-20240605;
        b=fyoripNntMRq+/J/ROiFnIPzuLvv/frsvRkU1A0DYVfH15soPfKttkc8Urhlv7oIVW
         /9OuRZ8k95rNAql4o15Y+2kCR7zgJWqTBcbDA0M9cyFB2xVyfsqYV69G6xffaBD1cgdC
         CjqCKfcpvqCjOA2YU1tK9tRtGZp/VsPpvgAMbImLQXoddKnfvIvBNMs3iPfPNa+/EY6+
         dUG5SPVAR6qt+r6i+F1Fhn3c7mSmIc2oijXoQhYVNxaMeTe4YEbOcsBcahe76JasI9gb
         iZjDXxg8sRoGH8gIdaMgGvBT6jzxRZtbLVg/ITLmyLyDbINZZ17pBwRMhHhOeXcdeioE
         DAhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=1R28P7pY9/B4uy5Hyc4tc/doZ5AWi7BIu8Wh1OQlkRI=;
        fh=RpYxnnRW5A5FvuL86z7f7YWfE0tvaTrs4Vecbev4fLA=;
        b=LLSZirWfD9PCAdsJWBpzY297MKnBxD1J8HTiqb4G1EIkQMvJGPKpZZcIa+Ru6XGfFQ
         l9SwRwNdB4BnkRlBjniJTKRfO1CGQN3FAn7Etu9XymI/u7jx0Eja+ERFprcoQPJJ+RyR
         zsmqdLsxv0ZgJeLH+zkM3k8AtSR8TworvTHIzdFB0in3y2f8q3JTSvyiErijtMvYVSzp
         3HCkMehnIazawBbZoXQWrwLXkQ6WX0PmZrRk8EONmbyqRlr1N0DFVY4VOb82wC/dcgbd
         7M6YowVU72ti8GKbwJldk1b/z7fBMV/4T46Tz/PB9WdVpovRNKQ4Rh/pTDfydTLrjn6X
         VqtA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781254602; x=1781859402; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=1R28P7pY9/B4uy5Hyc4tc/doZ5AWi7BIu8Wh1OQlkRI=;
        b=JlZ7ksuGLAcv0E4HDEZAU1TXe9pruLH8//jVsihkx/Co+EOx3BSp1DcF/Kk9OWKH9P
         KUU0VIz3tZJczCFpI5rjZDskmuR0vt/koZiH1mVUYHVNXfCys/B94OUoBKfW1AcTldq8
         63QZ6u0aglgMFMc39WEelGKDavb/1tYgyq98nIplALpNd8mowgL43kkRmYpzmRmIwM3C
         7xmCfCZg8s47zuk/Ox+j/+pQ7Aj/jGRkVRzEA/tR88noXjOJuURjwWUA/BMMdJyHU6d/
         xobYqsUtdJjkfb0yMI1IbUEFJu12RbF+CL9AM2HqNH9ombeCLtDUg0Eih8BB1qhVrGsl
         ScKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781254602; x=1781859402;
        h=to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1R28P7pY9/B4uy5Hyc4tc/doZ5AWi7BIu8Wh1OQlkRI=;
        b=JM1FGNzDe9x6D2GV5Dng80fw48ZsmekVuHZXs+ObztfWLQ4l9xZwTK4yebLLTRcSLO
         1acmwXGg9lQMdlxsRsvfPeMeYBvOquuVgVh4VkDiuYdhr8JvbdZc/97c3xE7nLxHGeMd
         Thyoh1eeRm6798spGN3tdyiosybkBGjaf45p9Uf+ZEPFheUgLaKryOKrNMbA2uBsu2xQ
         dwB8eHNbVVDzUyMzXfbq3D7pSr+q9dIPl6+evWsJkJ/2vMsnfPHn5TBvBdLnpSySvuBX
         pbhrFd+ZMZ0Hq2xuRo9i5Q2sOqchYVtIckI1/CcUyKiQRP+rqGMsg6ThIvekMhPFpgFC
         dNtQ==
X-Gm-Message-State: AOJu0Yz7AYUq5oU8/IJyDA30sC/fXAM5Sw3vqo1geQ/GZWdqnfxuYUgW
	tPidpw53QhCATgwg+5gNIsownbP58mzrOD4aVBlyiIWgilR2O4HxadMlIC6te6fT81hQFFkoC+w
	DyoALzVZHxXi4VDG5Yy99aX/v1ez4QXvN1DW+Ezc=
X-Gm-Gg: Acq92OHyLxezJYaDPgrTf6oIuyOhIyEqhm2fxeXsQQK7s+5knc0V02a5+S9s4siOiu9
	rOUvNWmcQDmY6xn1blnuBl2ybp9vpsuEQK9OcST5c2wuqPa1tpPd7qPKV7DebuZbMHasW8tEAhK
	HZE2Y/MJlnZ4cu956ru/Vx4+XTsDFvwpsYqqqrDhGxCjPgZtbIjVF/nYgbjaD2cO/e7H2uzKWwK
	JYWTnrDEkwkhrQBDGVoZL2NCTTO0iBQkXP0AiDnrYym3pdfoEux9wnWMWjgRNW1tSaPTsMEAyv+
	zuEqHi0m
X-Received: by 2002:a05:690c:2789:b0:7c5:f6c:d311 with SMTP id
 00721157ae682-7f7b644205fmr19149257b3.13.1781254602070; Fri, 12 Jun 2026
 01:56:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Ivan Arpentii <ivan.arpentii@gmail.com>
Date: Fri, 12 Jun 2026 10:56:30 +0200
X-Gm-Features: AVVi8Cfn2aPlTy7GbpwdNjzlFH7ETnaTLvK25OCmqJ6O3OEjlt1Qv2Hy5bi11yo
Message-ID: <CAFq5VVPHoYvL+X0+v_JvZCz3ZJfz9CEFHkbhnMeOg-4W8Prs8A@mail.gmail.com>
Subject: em2750 cammera support
To: linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-64658-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[ivanarpentii@gmail.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:linux-media@vger.kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	RCPT_COUNT_ONE(0.00)[1];
	DKIM_TRACE(0.00)[gmail.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	TO_DN_NONE(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ivanarpentii@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C0F5A677FDB

Hello,
I would like to add support for this camera in the linux kernel.

Hardware: ECS Elitegroup G220 integrated Webcam
USB ID: eb1a:2750
Chip: EM2750

The driver detects an I2C device at 0xba but fails to identify it:
"found i2c device @ 0xba on bus 0 [webcam sensor or tvp5150a]"
"No sensor detected"

########### Linux Information (uname -a) ###########
Linux MyPC 6.12.74+deb13+1-amd64 #1 SMP PREEMPT_DYNAMIC Debian
6.12.74-2 (2026-03-08) x86_64 GNU/Linux

########### Full dmesg log ###########
[770539.890172] em28xx 3-1.4.4.4:1.0: New device   @ 480 Mbps
(eb1a:2750, interface 0, class 0)
[770539.890182] em28xx 3-1.4.4.4:1.0: Video interface 0 found: isoc
[770539.944596] em28xx 3-1.4.4.4:1.0: chip ID is em2750
[770540.117129] em28xx 3-1.4.4.4:1.0: board has no eeprom
[770540.192599] em28xx 3-1.4.4.4:1.0: No sensor detected
[770540.211705] em28xx 3-1.4.4.4:1.0: found i2c device @ 0xba on bus 0
[webcam sensor or tvp5150a]
[770540.218750] em28xx 3-1.4.4.4:1.0: Your board has no unique USB ID
and thus need a hint to be detected.
                You may try to use card=<n> insmod option to workaround that.
                Please send an email with this log to:
                V4L Mailing List <linux-media@vger.kernel.org>
                Board eeprom hash is 0x00000000
                Board i2c devicelist hash is 0x1bdd0080
[770540.218758] em28xx 3-1.4.4.4:1.0: Here is a list of valid choices
for the card=<n> insmod option:
[770540.218761] em28xx 3-1.4.4.4:1.0:     card=0 -> Unknown EM2800 video grabber
[770540.218764] em28xx 3-1.4.4.4:1.0:     card=1 -> Unknown
EM2750/28xx video grabber
[770540.218767] em28xx 3-1.4.4.4:1.0:     card=2 -> Terratec Cinergy 250 USB
[770540.218769] em28xx 3-1.4.4.4:1.0:     card=3 -> Pinnacle PCTV USB 2
[770540.218771] em28xx 3-1.4.4.4:1.0:     card=4 -> Hauppauge WinTV USB 2
[770540.218773] em28xx 3-1.4.4.4:1.0:     card=5 -> MSI VOX USB 2.0
[770540.218775] em28xx 3-1.4.4.4:1.0:     card=6 -> Terratec Cinergy 200 USB
[770540.218777] em28xx 3-1.4.4.4:1.0:     card=7 -> Leadtek Winfast USB II
[770540.218780] em28xx 3-1.4.4.4:1.0:     card=8 -> Kworld USB2800
[770540.218782] em28xx 3-1.4.4.4:1.0:     card=9 -> Pinnacle Dazzle
DVC 90/100/101/107 / Kaiser Baas Video to DVD maker / Kworld DVD Maker
2 / Plextor ConvertX PX-AV100U
[770540.218784] em28xx 3-1.4.4.4:1.0:     card=10 -> Hauppauge WinTV HVR 900
[770540.218786] em28xx 3-1.4.4.4:1.0:     card=11 -> Terratec Hybrid XS
[770540.218789] em28xx 3-1.4.4.4:1.0:     card=12 -> Kworld PVR TV 2800 RF
[770540.218791] em28xx 3-1.4.4.4:1.0:     card=13 -> Terratec Prodigy XS
[770540.218793] em28xx 3-1.4.4.4:1.0:     card=14 -> SIIG AVTuner-PVR
/ Pixelview Prolink PlayTV USB 2.0
[770540.218795] em28xx 3-1.4.4.4:1.0:     card=15 -> V-Gear PocketTV
[770540.218797] em28xx 3-1.4.4.4:1.0:     card=16 -> Hauppauge WinTV HVR 950
[770540.218799] em28xx 3-1.4.4.4:1.0:     card=17 -> Pinnacle PCTV HD Pro Stick
[770540.218802] em28xx 3-1.4.4.4:1.0:     card=18 -> Hauppauge WinTV
HVR 900 (R2)
[770540.218804] em28xx 3-1.4.4.4:1.0:     card=19 -> EM2860/SAA711X
Reference Design
[770540.218806] em28xx 3-1.4.4.4:1.0:     card=20 -> AMD ATI TV Wonder HD 600
[770540.218808] em28xx 3-1.4.4.4:1.0:     card=21 -> eMPIA Technology,
Inc. GrabBeeX+ Video Encoder
[770540.218810] em28xx 3-1.4.4.4:1.0:     card=22 ->
EM2710/EM2750/EM2751 webcam grabber
[770540.218813] em28xx 3-1.4.4.4:1.0:     card=23 -> Huaqi DLCW-130
[770540.218815] em28xx 3-1.4.4.4:1.0:     card=24 -> D-Link DUB-T210 TV Tuner
[770540.218817] em28xx 3-1.4.4.4:1.0:     card=25 -> Gadmei UTV310
[770540.218819] em28xx 3-1.4.4.4:1.0:     card=26 -> Hercules Smart TV USB 2.0
[770540.218821] em28xx 3-1.4.4.4:1.0:     card=27 -> Pinnacle PCTV USB
2 (Philips FM1216ME)
[770540.218823] em28xx 3-1.4.4.4:1.0:     card=28 -> Leadtek Winfast
USB II Deluxe
[770540.218825] em28xx 3-1.4.4.4:1.0:     card=29 -> EM2860/TVP5150
Reference Design
[770540.218827] em28xx 3-1.4.4.4:1.0:     card=30 -> Videology 20K14XUSB USB2.0
[770540.218830] em28xx 3-1.4.4.4:1.0:     card=31 -> Usbgear VD204v9
[770540.218832] em28xx 3-1.4.4.4:1.0:     card=32 -> Supercomp USB 2.0 TV
[770540.218834] em28xx 3-1.4.4.4:1.0:     card=33 -> Elgato Video Capture
[770540.218836] em28xx 3-1.4.4.4:1.0:     card=34 -> Terratec Cinergy
A Hybrid XS
[770540.218838] em28xx 3-1.4.4.4:1.0:     card=35 -> Typhoon DVD Maker
[770540.218840] em28xx 3-1.4.4.4:1.0:     card=36 -> NetGMBH Cam
[770540.218842] em28xx 3-1.4.4.4:1.0:     card=37 -> Gadmei UTV330
[770540.218844] em28xx 3-1.4.4.4:1.0:     card=38 -> Yakumo MovieMixer
[770540.218847] em28xx 3-1.4.4.4:1.0:     card=39 -> KWorld PVRTV 300U
[770540.218849] em28xx 3-1.4.4.4:1.0:     card=40 -> Plextor ConvertX PX-TV100U
[770540.218851] em28xx 3-1.4.4.4:1.0:     card=41 -> Kworld 350 U DVB-T
[770540.218853] em28xx 3-1.4.4.4:1.0:     card=42 -> Kworld 355 U DVB-T
[770540.218855] em28xx 3-1.4.4.4:1.0:     card=43 -> Terratec Cinergy T XS
[770540.218858] em28xx 3-1.4.4.4:1.0:     card=44 -> Terratec Cinergy
T XS (MT2060)
[770540.218860] em28xx 3-1.4.4.4:1.0:     card=45 -> Pinnacle PCTV DVB-T
[770540.218862] em28xx 3-1.4.4.4:1.0:     card=46 -> Compro, VideoMate U3
[770540.218864] em28xx 3-1.4.4.4:1.0:     card=47 -> KWorld DVB-T 305U
[770540.218866] em28xx 3-1.4.4.4:1.0:     card=48 -> KWorld DVB-T 310U
[770540.218868] em28xx 3-1.4.4.4:1.0:     card=49 -> MSI DigiVox A/D
[770540.218870] em28xx 3-1.4.4.4:1.0:     card=50 -> MSI DigiVox A/D II
[770540.218872] em28xx 3-1.4.4.4:1.0:     card=51 -> Terratec Hybrid XS Secam
[770540.218874] em28xx 3-1.4.4.4:1.0:     card=52 -> DNT DA2 Hybrid
[770540.218877] em28xx 3-1.4.4.4:1.0:     card=53 -> Pinnacle Hybrid Pro
[770540.218879] em28xx 3-1.4.4.4:1.0:     card=54 -> Kworld VS-DVB-T 323UR
[770540.218881] em28xx 3-1.4.4.4:1.0:     card=55 -> Terratec Cinergy
Hybrid T USB XS (em2882)
[770540.218883] em28xx 3-1.4.4.4:1.0:     card=56 -> Pinnacle Hybrid Pro (330e)
[770540.218885] em28xx 3-1.4.4.4:1.0:     card=57 -> Kworld PlusTV HD Hybrid 330
[770540.218888] em28xx 3-1.4.4.4:1.0:     card=58 -> Compro VideoMate
ForYou/Stereo
[770540.218890] em28xx 3-1.4.4.4:1.0:     card=59 -> Pinnacle PCTV HD Mini
[770540.218892] em28xx 3-1.4.4.4:1.0:     card=60 -> Hauppauge WinTV HVR 850
[770540.218894] em28xx 3-1.4.4.4:1.0:     card=61 -> Pixelview PlayTV
Box 4 USB 2.0
[770540.218896] em28xx 3-1.4.4.4:1.0:     card=62 -> Gadmei TVR200
[770540.218898] em28xx 3-1.4.4.4:1.0:     card=63 -> Kaiomy TVnPC U2
[770540.218900] em28xx 3-1.4.4.4:1.0:     card=64 -> Easy Cap Capture DC-60
[770540.218902] em28xx 3-1.4.4.4:1.0:     card=65 -> IO-DATA GV-MVP/SZ
[770540.218904] em28xx 3-1.4.4.4:1.0:     card=66 -> Empire dual TV
[770540.218907] em28xx 3-1.4.4.4:1.0:     card=67 -> Terratec Grabby
[770540.218909] em28xx 3-1.4.4.4:1.0:     card=68 -> Terratec AV350
[770540.218911] em28xx 3-1.4.4.4:1.0:     card=69 -> KWorld ATSC 315U
HDTV TV Box
[770540.218913] em28xx 3-1.4.4.4:1.0:     card=70 -> Evga inDtube
[770540.218915] em28xx 3-1.4.4.4:1.0:     card=71 -> Silvercrest Webcam 1.3mpix
[770540.218917] em28xx 3-1.4.4.4:1.0:     card=72 -> Gadmei UTV330+
[770540.218919] em28xx 3-1.4.4.4:1.0:     card=73 -> Reddo DVB-C USB TV Box
[770540.218921] em28xx 3-1.4.4.4:1.0:     card=74 ->
Actionmaster/LinXcel/Digitus VC211A
[770540.218924] em28xx 3-1.4.4.4:1.0:     card=75 -> Dikom DK300
[770540.218926] em28xx 3-1.4.4.4:1.0:     card=76 -> KWorld PlusTV
340U or UB435-Q (ATSC)
[770540.218928] em28xx 3-1.4.4.4:1.0:     card=77 -> EM2874 Leadership ISDBT
[770540.218930] em28xx 3-1.4.4.4:1.0:     card=78 -> PCTV nanoStick T2 290e
[770540.218932] em28xx 3-1.4.4.4:1.0:     card=79 -> Terratec Cinergy H5
[770540.218934] em28xx 3-1.4.4.4:1.0:     card=80 -> PCTV DVB-S2 Stick (460e)
[770540.218937] em28xx 3-1.4.4.4:1.0:     card=81 -> Hauppauge WinTV HVR 930C
[770540.218939] em28xx 3-1.4.4.4:1.0:     card=82 -> Terratec Cinergy HTC Stick
[770540.218941] em28xx 3-1.4.4.4:1.0:     card=83 -> Honestech Vidbox NW03
[770540.218943] em28xx 3-1.4.4.4:1.0:     card=84 -> MaxMedia UB425-TC
[770540.218945] em28xx 3-1.4.4.4:1.0:     card=85 -> PCTV QuatroStick (510e)
[770540.218947] em28xx 3-1.4.4.4:1.0:     card=86 -> PCTV QuatroStick
nano (520e)
[770540.218949] em28xx 3-1.4.4.4:1.0:     card=87 -> Terratec Cinergy HTC USB XS
[770540.218952] em28xx 3-1.4.4.4:1.0:     card=88 -> C3 Tech Digital
Duo HDTV/SDTV USB
[770540.218954] em28xx 3-1.4.4.4:1.0:     card=89 -> Delock 61959
[770540.218956] em28xx 3-1.4.4.4:1.0:     card=90 -> KWorld USB ATSC
TV Stick UB435-Q V2
[770540.218958] em28xx 3-1.4.4.4:1.0:     card=91 -> SpeedLink Vicious
And Devine Laplace webcam
[770540.218960] em28xx 3-1.4.4.4:1.0:     card=92 -> PCTV DVB-S2 Stick (461e)
[770540.218962] em28xx 3-1.4.4.4:1.0:     card=93 -> KWorld USB ATSC
TV Stick UB435-Q V3
[770540.218965] em28xx 3-1.4.4.4:1.0:     card=94 -> PCTV tripleStick (292e)
[770540.218967] em28xx 3-1.4.4.4:1.0:     card=95 -> Leadtek VC100
[770540.218969] em28xx 3-1.4.4.4:1.0:     card=96 -> Terratec Cinergy
T2 Stick HD
[770540.218971] em28xx 3-1.4.4.4:1.0:     card=97 -> Elgato EyeTV
Hybrid 2008 INT
[770540.218973] em28xx 3-1.4.4.4:1.0:     card=98 -> PLEX PX-BCUD
[770540.218975] em28xx 3-1.4.4.4:1.0:     card=99 -> Hauppauge WinTV-dualHD DVB
[770540.218977] em28xx 3-1.4.4.4:1.0:     card=100 -> Hauppauge
WinTV-dualHD 01595 ATSC/QAM
[770540.218980] em28xx 3-1.4.4.4:1.0:     card=101 -> Terratec Cinergy H6 rev. 2
[770540.218982] em28xx 3-1.4.4.4:1.0:     card=102 -> :ZOLID HYBRID TV STICK
[770540.218984] em28xx 3-1.4.4.4:1.0:     card=103 -> Magix USB Videowandler-2
[770540.218986] em28xx 3-1.4.4.4:1.0:     card=104 -> PCTV DVB-S2
Stick (461e v2)
[770540.218988] em28xx 3-1.4.4.4:1.0:     card=105 -> MyGica iGrabber
[770540.218991] em28xx 3-1.4.4.4:1.0:     card=106 -> Hauppauge USB QuadHD ATSC
[770540.218993] em28xx 3-1.4.4.4:1.0:     card=107 -> MyGica UTV3
Analog USB2.0 TV Box
[770540.218995] em28xx 3-1.4.4.4:1.0: Board not discovered
[770540.218997] em28xx 3-1.4.4.4:1.0: Identified as
EM2710/EM2750/EM2751 webcam grabber (card=22)
[770540.219000] em28xx 3-1.4.4.4:1.0: Currently, V4L2 is not supported
on this model
[770540.219224] usbcore: registered new interface driver em28xx

########### lsusb -v -d eb1a:2750 ###########
Bus 003 Device 010: ID eb1a:2750 eMPIA Technology, Inc. ECS Elitegroup
G220 integrated Webcam
Couldn't open device, some information will be missing
Negotiated speed: High Speed (480Mbps)
Device Descriptor:
  bLength                18
  bDescriptorType         1
  bcdUSB               2.00
  bDeviceClass            0 [unknown]
  bDeviceSubClass         0 [unknown]
  bDeviceProtocol         0
  bMaxPacketSize0        64
  idVendor           0xeb1a eMPIA Technology, Inc.
  idProduct          0x2750 ECS Elitegroup G220 integrated Webcam
  bcdDevice            1.00
  iManufacturer           0
  iProduct                0
  iSerial                 0
  bNumConfigurations      1
  Configuration Descriptor:
    bLength                 9
    bDescriptorType         2
    wTotalLength       0x00f9
    bNumInterfaces          1
    bConfigurationValue     1
    iConfiguration          0
    bmAttributes         0x80
      (Bus Powered)
    MaxPower              500mA
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        0
      bAlternateSetting       0
      bNumEndpoints           3
      bInterfaceClass       255 Vendor Specific Class
      bInterfaceSubClass      0 [unknown]
      bInterfaceProtocol    255
      iInterface              0
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x81  EP 1 IN
        bmAttributes            3
          Transfer Type            Interrupt
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0001  1x 1 bytes
        bInterval              11
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x82  EP 2 IN
        bmAttributes            1
          Transfer Type            Isochronous
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0000  1x 0 bytes
        bInterval               1
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x84  EP 4 IN
        bmAttributes            1
          Transfer Type            Isochronous
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0000  1x 0 bytes
        bInterval               1
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        0
      bAlternateSetting       1
      bNumEndpoints           3
      bInterfaceClass       255 Vendor Specific Class
      bInterfaceSubClass      0 [unknown]
      bInterfaceProtocol    255
      iInterface              0
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x81  EP 1 IN
        bmAttributes            3
          Transfer Type            Interrupt
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0001  1x 1 bytes
        bInterval              11
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x82  EP 2 IN
        bmAttributes            1
          Transfer Type            Isochronous
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0000  1x 0 bytes
        bInterval               1
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x84  EP 4 IN
        bmAttributes            1
          Transfer Type            Isochronous
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0000  1x 0 bytes
        bInterval               1
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        0
      bAlternateSetting       2
      bNumEndpoints           3
      bInterfaceClass       255 Vendor Specific Class
      bInterfaceSubClass      0 [unknown]
      bInterfaceProtocol    255
      iInterface              0
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x81  EP 1 IN
        bmAttributes            3
          Transfer Type            Interrupt
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0001  1x 1 bytes
        bInterval              11
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x82  EP 2 IN
        bmAttributes            1
          Transfer Type            Isochronous
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0ad4  2x 724 bytes
        bInterval               1
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x84  EP 4 IN
        bmAttributes            1
          Transfer Type            Isochronous
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0000  1x 0 bytes
        bInterval               1
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        0
      bAlternateSetting       3
      bNumEndpoints           3
      bInterfaceClass       255 Vendor Specific Class
      bInterfaceSubClass      0 [unknown]
      bInterfaceProtocol    255
      iInterface              0
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x81  EP 1 IN
        bmAttributes            3
          Transfer Type            Interrupt
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0001  1x 1 bytes
        bInterval              11
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x82  EP 2 IN
        bmAttributes            1
          Transfer Type            Isochronous
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0c00  2x 1024 bytes
        bInterval               1
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x84  EP 4 IN
        bmAttributes            1
          Transfer Type            Isochronous
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0000  1x 0 bytes
        bInterval               1
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        0
      bAlternateSetting       4
      bNumEndpoints           3
      bInterfaceClass       255 Vendor Specific Class
      bInterfaceSubClass      0 [unknown]
      bInterfaceProtocol    255
      iInterface              0
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x81  EP 1 IN
        bmAttributes            3
          Transfer Type            Interrupt
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0001  1x 1 bytes
        bInterval              11
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x82  EP 2 IN
        bmAttributes            1
          Transfer Type            Isochronous
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x1300  3x 768 bytes
        bInterval               1
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x84  EP 4 IN
        bmAttributes            1
          Transfer Type            Isochronous
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0000  1x 0 bytes
        bInterval               1
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        0
      bAlternateSetting       5
      bNumEndpoints           3
      bInterfaceClass       255 Vendor Specific Class
      bInterfaceSubClass      0 [unknown]
      bInterfaceProtocol    255
      iInterface              0
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x81  EP 1 IN
        bmAttributes            3
          Transfer Type            Interrupt
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0001  1x 1 bytes
        bInterval              11
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x82  EP 2 IN
        bmAttributes            1
          Transfer Type            Isochronous
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x135c  3x 860 bytes
        bInterval               1
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x84  EP 4 IN
        bmAttributes            1
          Transfer Type            Isochronous
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0000  1x 0 bytes
        bInterval               1
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        0
      bAlternateSetting       6
      bNumEndpoints           3
      bInterfaceClass       255 Vendor Specific Class
      bInterfaceSubClass      0 [unknown]
      bInterfaceProtocol    255
      iInterface              0
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x81  EP 1 IN
        bmAttributes            3
          Transfer Type            Interrupt
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0001  1x 1 bytes
        bInterval              11
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x82  EP 2 IN
        bmAttributes            1
          Transfer Type            Isochronous
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x13c4  3x 964 bytes
        bInterval               1
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x84  EP 4 IN
        bmAttributes            1
          Transfer Type            Isochronous
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0000  1x 0 bytes
        bInterval               1
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        0
      bAlternateSetting       7
      bNumEndpoints           3
      bInterfaceClass       255 Vendor Specific Class
      bInterfaceSubClass      0 [unknown]
      bInterfaceProtocol    255
      iInterface              0
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x81  EP 1 IN
        bmAttributes            3
          Transfer Type            Interrupt
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0001  1x 1 bytes
        bInterval              11
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x82  EP 2 IN
        bmAttributes            1
          Transfer Type            Isochronous
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x1400  3x 1024 bytes
        bInterval               1
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x84  EP 4 IN
        bmAttributes            1
          Transfer Type            Isochronous
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0000  1x 0 bytes
        bInterval               1

Can the sensor detection be forced or added for this device?

-- 
Regards,
Ivan Arpentii

