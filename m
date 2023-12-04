Return-Path: <linux-media+bounces-1616-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 93D30803BFC
	for <lists+linux-media@lfdr.de>; Mon,  4 Dec 2023 18:49:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 201CA28111B
	for <lists+linux-media@lfdr.de>; Mon,  4 Dec 2023 17:49:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E70D22E85F;
	Mon,  4 Dec 2023 17:49:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="v/wo/cmb"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B6F46FF
	for <linux-media@vger.kernel.org>; Mon,  4 Dec 2023 09:49:36 -0800 (PST)
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-3332ad5b3e3so3261832f8f.2
        for <linux-media@vger.kernel.org>; Mon, 04 Dec 2023 09:49:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1701712175; x=1702316975; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9nMTL/hfEaPmfeAjvrqag0PKWdLeKIP4No4LGE5wQRg=;
        b=v/wo/cmbdS5QPCQENYPfqrMbNveWokKVH1KXfmvECebw6NS4a5eWM6jlctIykLsXti
         PpIihcNP3uKVDC7odSe8U5El9VpUx044HL0Wa/o7yziTGdPokVh8C/m3T4/trG3P20/B
         QfCMsFL2OV+T2JOm7OtAUS4UvHdCyBQay7MC7XrCfplITIZKSEDMIh29vlL732r1+HYM
         y4QAkljh/ru1ek3KMaefkflBsOlZB0bEMzcxpAzTkcWHhNBFZk3tHsoX3vyTZKBT/CUM
         V7aYBiV3v3uC1UT3yPbJ/YOn6aLdv8tj/JkhSOXMoDtws1dfEJ3brCSGOpP/uyhmTeJt
         BP9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701712175; x=1702316975;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9nMTL/hfEaPmfeAjvrqag0PKWdLeKIP4No4LGE5wQRg=;
        b=RvL+I3SpCi6HOa3hVoYuCSp9eR3cEc6bfD0Q4JZ8m/Cub98T77tI1QrNBG9TsEjeCR
         tCDWESxnhjdUt6ZvuT+AOLfU+/uwWAWzLLQ8wRWIzxNAk2RK7jpFKPJrkjsWDdi45Dqz
         k9+q2nwnIkHb7UPye/4qehu7yH7siztGRgWGT1U5VZPz7gx19skliHDXT+cqK1JeO5mP
         crobAto69HHcqcbUcYFh1gQ7bXdkwD7QzkDAVV/aLQZiYOhysm/ydv45bRl14+cVWiBJ
         DdhqhbnWt9rIk4AWRfSyC998v5sVuITuTH4cdZYYOWgVbTQmSNu0tMHw6f2n9+ZCUBph
         7hRg==
X-Gm-Message-State: AOJu0YzMZj+j6+mzl362tf8SrKp4G+BYpUlBfu/MC0BX0tSs87HP5X3f
	kemBBS4ArVOSl39JHDHHf00iDg==
X-Google-Smtp-Source: AGHT+IEZ7kB3cx7KQ8/SrkE8m8JSF0rnEkwEdjOi/inIqL/SKS50oF93F8hnwxRYY4xwJgZ52qJh7Q==
X-Received: by 2002:a5d:5f49:0:b0:333:4296:3c0a with SMTP id cm9-20020a5d5f49000000b0033342963c0amr1444977wrb.133.1701712175176;
        Mon, 04 Dec 2023 09:49:35 -0800 (PST)
Received: from localhost ([2a01:cb19:95ba:5000:d6dd:417f:52ac:335b])
        by smtp.gmail.com with ESMTPSA id b4-20020a5d4b84000000b003333c9ad4d6sm6652265wrt.116.2023.12.04.09.49.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Dec 2023 09:49:34 -0800 (PST)
From: Mattijs Korpershoek <mkorpershoek@baylibre.com>
To: Nicolas Dufresne <nicolas@ndufresne.ca>, Nas Chung
 <nas.chung@chipsnmedia.com>, Jackson Lee <jackson.lee@chipsnmedia.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Guillaume La Roque <glaroque@baylibre.com>, Brandon Brnich
 <b-brnich@ti.com>, Sebastian Fricke <sebastian.fricke@collabora.com>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: chips-media: wave5: fix panic on decoding
 DECODED_IDX_FLAG_SKIP
In-Reply-To: <42c1c5e14a30730bc140b6791f25e55d434aa4e3.camel@ndufresne.ca>
References: <20231129-wave5-panic-v1-1-e0fb5a1a8af4@baylibre.com>
 <42c1c5e14a30730bc140b6791f25e55d434aa4e3.camel@ndufresne.ca>
Date: Mon, 04 Dec 2023 18:49:34 +0100
Message-ID: <87jzpt3ljl.fsf@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Nicolas,

Thank you for your review.

On Fri, Dec 01, 2023 at 15:18, Nicolas Dufresne <nicolas@ndufresne.ca> wrot=
e:

> Hi Mattijs,
>
> Le mercredi 29 novembre 2023 =C3=A0 11:37 +0100, Mattijs Korpershoek a =
=C3=A9crit=C2=A0:
>> The display frame region information received from the vpu also
>> contains the frame display index: info->index_frame_display.
>>=20
>> This index, being a s32, can be negative when a skip option is passed.
>> In that case, its value is DECODED_IDX_FLAG_SKIP (-2).
>>=20
>> When disp_idx =3D=3D -2, the following exception occurs:
>>=20
>> [ 1530.782246][ T1900] Hardware name: Texas Instruments AM62P5 SK (DT)
>> [ 1530.788501][ T1900] pstate: a0400005 (NzCv daif +PAN -UAO -TCO -DIT -=
SSBS BTYPE=3D--)
>> [ 1530.796144][ T1900] pc : wave5_vpu_dec_get_output_info+0x300/0x308 [w=
ave5]
>> [ 1530.803060][ T1900] lr : wave5_vpu_dec_get_output_info+0x80/0x308 [wa=
ve5]
>> [ 1530.809873][ T1900] sp : ffffffc00b85bc00
>> [ 1530.813872][ T1900] x29: ffffffc00b85bc00 x28: 0000000000000000 x27: =
0000000000000001
>> [ 1530.821695][ T1900] x26: 00000000fffffffd x25: 00000000ffffffff x24: =
ffffff8812820000
>> [ 1530.829516][ T1900] x23: ffffff88199f7840 x22: ffffff8873f5e000 x21: =
ffffffc00b85bc58
>> [ 1530.837336][ T1900] x20: 0000000000000000 x19: ffffff88199f7920 x18: =
ffffffc00a899030
>> [ 1530.845156][ T1900] x17: 00000000529c6ef0 x16: 00000000529c6ef0 x15: =
0000000000198487
>> [ 1530.852975][ T1900] x14: ffffffc009f2b650 x13: 0000000000058016 x12: =
0000000005000000
>> [ 1530.860795][ T1900] x11: 0000000000000000 x10: 0000000000000000 x9 : =
0000000000000000
>> [ 1530.868615][ T1900] x8 : 0000000000000000 x7 : 0000000000000000 x6 : =
0000000000004086
>> [ 1530.876434][ T1900] x5 : 0000000000000001 x4 : ffffffc001454b94 x3 : =
ffffffc001454d94
>> [ 1530.884256][ T1900] x2 : ffffffc00b8201d0 x1 : 0000000000000020 x0 : =
0000000000000000
>> [ 1530.892087][ T1900] Call trace:
>> [ 1530.895225][ T1900]  wave5_vpu_dec_get_output_info+0x300/0x308 [wave5]
>> [ 1530.901788][ T1900]  wave5_vpu_dec_finish_decode+0x6c/0x3dc [wave5]
>> [ 1530.908081][ T1900]  wave5_vpu_irq_thread+0x140/0x168 [wave5]
>> [ 1530.913856][ T1900]  irq_thread_fn+0x44/0xa4
>> [ 1530.918154][ T1900]  irq_thread+0x15c/0x288
>> [ 1530.922330][ T1900]  kthread+0x104/0x1d4
>> [ 1530.926247][ T1900]  ret_from_fork+0x10/0x20
>> [ 1530.930520][ T1900] Code: 2a1f03ea 2a1f03eb 35ffef2c 17ffff74 (d42aa2=
40)
>> [ 1530.937296][ T1900] ---[ end trace 0000000000000000 ]---
>> [ 1530.942596][ T1900] Kernel panic - not syncing: BRK handler: Fatal ex=
ception
>> [ 1530.949629][ T1900] SMP: stopping secondary CPUs
>> [ 1530.954244][ T1900] Kernel Offset: disabled
>> [ 1530.958415][ T1900] CPU features: 0x00,00000000,00800184,0000421b
>> [ 1530.964496][ T1900] Memory Limit: none
>>=20
>> Move the disp_info assignment after testing that the index is positive
>> to avoid the exception.
>>=20
>> Fixes: 45d1a2b93277 ("media: chips-media: wave5: Add vpuapi layer")
>> Signed-off-by: Mattijs Korpershoek <mkorpershoek@baylibre.com>
>> ---
>>  drivers/media/platform/chips-media/wave5/wave5-vpuapi.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>=20
>> diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpuapi.c b/d=
rivers/media/platform/chips-media/wave5/wave5-vpuapi.c
>> index 86b3993722db..1a3efb638dde 100644
>> --- a/drivers/media/platform/chips-media/wave5/wave5-vpuapi.c
>> +++ b/drivers/media/platform/chips-media/wave5/wave5-vpuapi.c
>> @@ -508,8 +508,8 @@ int wave5_vpu_dec_get_output_info(struct vpu_instanc=
e *inst, struct dec_output_i
>>  	info->rc_decoded =3D rect_info;
>>=20=20
>>  	disp_idx =3D info->index_frame_display;
>> -	disp_info =3D &p_dec_info->dec_out_info[disp_idx];
>>  	if (info->index_frame_display >=3D 0 && info->index_frame_display < WA=
VE5_MAX_FBS) {
>> +		disp_info =3D &p_dec_info->dec_out_info[disp_idx];
>
> I could not reproduce the crash, it probably depends on the compiler vers=
ion and
> compiler options. This negative index should normally generate a pointer,=
 even
> if that points to bad location. I'd like to understand how that lead to a=
 crash.
> If you have further information on this, I really like to get to the bott=
om on
> these subjects.

I can reproduce it consistently with my setup:
https://pastebin.com/0Mdfw1EC

Here is a copy of the .config when my kernel is build:
https://pastebin.com/RHxLV8cf

I build the kernel via KLeaf (Android's way of building kernels) so I'm
not sure how I can provide you with the exact compile command.

I do know that LTO is used, if that gives any hint.

If prefer chatting about this, I'm also reachable on irc (oftc.net, nicknam=
e:
mkorpershoek)

Let me know if other information is needed to get to the bottom on this.

>
> Meanwhile, this fix is obviously correct, we should not do that unless we=
 have a
> valid index.
>
> Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
>
>>  		if (info->index_frame_display !=3D info->index_frame_decoded) {
>>  			/*
>>  			 * when index_frame_decoded < 0, and index_frame_display >=3D 0
>>=20
>> ---
>> base-commit: a00b3f296eac3d43328615c3113e1a74143fc67a
>> change-id: 20231129-wave5-panic-82ea2d30042f
>>=20
>> Best regards,

