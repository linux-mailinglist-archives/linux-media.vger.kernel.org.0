Return-Path: <linux-media+bounces-51580-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0O2LGjeLd2m9hgEAu9opvQ
	(envelope-from <linux-media+bounces-51580-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 26 Jan 2026 16:41:43 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CA40C8A414
	for <lists+linux-media@lfdr.de>; Mon, 26 Jan 2026 16:41:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 14886303BB23
	for <lists+linux-media@lfdr.de>; Mon, 26 Jan 2026 15:41:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7070A38DF9;
	Mon, 26 Jan 2026 15:41:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jDdmPIr8"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E4C333F8C7
	for <linux-media@vger.kernel.org>; Mon, 26 Jan 2026 15:40:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769442060; cv=pass; b=BVqkhISf0KSHx6PTGqlu3YUyDpVVd+xMBv/GPC4fPdgmUVGOvc6E69lRU2JIMUJWrNmLTODgcWeGTj5w9zt+wwd75ss+yw/V2nPei7mPD/uBJW8PQQ+1FjTxWfU5QepxfN7i1ZODKHLKCJXOe0BzAu7je5yoZpym0Xkhlp5Bt18=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769442060; c=relaxed/simple;
	bh=zwRBDHmFrmmmKheiwTc0t4jensYzVXi0yWNGwiA+LnY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ifJi/petJS5ZX4rBDqkBC7ru69tgU2OVEjsro4ANF+MBMFMYAbvNebzQpJju+v9A9+bYmke0fF5h/kpdTjnWZ1Vg/hSloK8pEcrvfsmvN5vmc4h4QjIVkXbXkeoPs/HPNVj8RQ0sgfnLJSJ29/Ud+et6jPM2CNbcMT4Qc0XzH6A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jDdmPIr8; arc=pass smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2a0c20ee83dso43515775ad.2
        for <linux-media@vger.kernel.org>; Mon, 26 Jan 2026 07:40:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769442059; cv=none;
        d=google.com; s=arc-20240605;
        b=CPfLVv1ESWxY7rBAlcIeJ7wZg7yiG8H+Yj0K4vsF9/4qfT3l6ut/wS7qNsAOhH1Gtt
         NXlsuf5sFNcUML1a0SzCgAdJsMSPaOdDNgklcO1W8xUr5zQ8A3rT8DABW8k8oWp+nbwI
         aQOgh5EFnjm5Ll3T/0vx+RzfWXP/WaDpNRZ+qGT31ZZyUMDJGHXsS2Bp7Rkd6A9/AVGM
         DN+kCcBmTxNwPkROe+NGuH+RObCRd6gXmXWJIe5GRmPWuBvTC2L+S79yUMZNOZVAw6lU
         jbOk20RoB6duooMSdEmtGiaVGufzS61/uXrfwTTAR5Y/wJsE7twwv9Wb1LSFMXO8bzkg
         Fn9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bWDS/deVR9I3gWwY2taM2sYKhn8M8sJv7RX/kPUm08E=;
        fh=LIQzqowGT9TEDKbo4bxJNwj+FYepOqf4HzF6CoU8slw=;
        b=QwF5i3UISjTtOsra6XAwYeGCQ/UpdilW0k8gHPA72o+V7/rM2PJfcWvVxBoQl6a2kL
         x+5FZOVf3xPV6kC5Znov2TIR9dM7b54jwGIMA3/MtpovkOClYAtCfTrXyUM6mb5WUu9k
         otz4O/+yVOxmxsOs6MH+/vB3DUjDopszTuUVhMW6tZCMIRhQt/bikx/2T/TGup2t1+t9
         jBVHFTxGSOOhChAS93aup32XpUj4WQVBPcIoAnLjOxyh7anTmCY6x/GrLqav0exm5++m
         qyw7/tthEzVSdaBQl1FoXeNVA0YBgsKQFQAwDlsRCJGAX5cSvVLahuYWuGBff9vEdsjr
         FSAg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769442059; x=1770046859; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bWDS/deVR9I3gWwY2taM2sYKhn8M8sJv7RX/kPUm08E=;
        b=jDdmPIr8RU3SZwfLc1+oAyBCAZnpi8LEhH5fw2Y/mdtEDllONqaFmCt7lSjOon25dg
         gQivD62u57dnBZyiNZPPSIWdPFkDnVyOa/8J8kWNx7IGHF0CZiqvsf1buKB84t1UFoGc
         nILPmS534l7LnKghpChZ6rd+M/Vj7JPQ0bvzrAsUqEdTyHbGXLbzIN428HLL1R84+PuV
         FEG4BiwtAt7BUyXgzADBM06cDefsOF4oH4LfG7fT/1sLOLjr+XyddR0iBF9b45neZQY3
         pfoPgZIH6c3cgIKr0L/0P+oWBRufU0z/QYGUH7qIDE7cfBBC+WLOWWdtMW0Yq0DDIJ5H
         033Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769442059; x=1770046859;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bWDS/deVR9I3gWwY2taM2sYKhn8M8sJv7RX/kPUm08E=;
        b=nUSOYVhzvgovC/5XnjDPfxZTgHq+BA63o8kl4mp0siByYaXIpXZgKJL/qAID7LXpqM
         mOQtSpZXexKcyXlGOHwJDpja+Y6olGtStPM3va2me97me0Vknl97SIdEpRr1ULP3tDIu
         hbtmaHhdFaGyLi1i3xAiHFPyw8c8AtklOwbsOiaN6kiipJkHtxjPpTpb6QtYFLC0HGS/
         kZmhcsaubxa+GgXES0GFFyoazzOE5WwTxBB71aB+PyR3lr3rFXYrj7bHxXqQ479/kyPV
         fQsoxCp7Ml0euFal3PFKoL8dp1qd+VCZFrUxqQF3K9JfydCIc5yziFdFEIaRbsRsf8XD
         /hlw==
X-Forwarded-Encrypted: i=1; AJvYcCVg5SfQ4j4T/q6Z3duLn4CAcExwZHh+NA1hwiHVXfbJHVm4Hq3w/lZpur8sdWRgAOuXHn2D5XPyBQesPg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxJfl2TCw/eMkjkk5dwpohxBvaaeMQpd10VTMm0wPtJWr6Jal2B
	jleXSW5ktpS/P4ytjwL+/yYuMPtjbHWA081GMjbaAhweA3LUugmaAJVvf7hnhs1F+xV1hM4PJYH
	lbx6ZEt7g6DGtleutE52QjfQclfA+Nm8=
X-Gm-Gg: AZuq6aKK6wwlMsPXz4GWGUS26rnLYWZaaI8dZIReT75qeeryRRh/IwwKaNBQUZ8RqWv
	qiV1CIXP2BBT9akAaKC5A6BmyCnLzKM5t0/V33MzhXoenvf48JMwZVJJyr/hN/XgQ7QWBdVwVhN
	6t6o99hLdraZH1eYncCqa2rzHHU0bArXKSlBPuKVWFdy9ZmqC+glWOspCWGH+fG+U8VlA4fXeN0
	tnan099kL4XZO40U1FrjXAyst4fS+MR6ISYsczcHAs1mJLvMKJZwn0/DmJNHG6v4PrHh33lOwS1
	sZnRQwil6lIT+NcSBgQ7X9SOfKFp
X-Received: by 2002:a17:902:f687:b0:2a0:b44e:9ab6 with SMTP id
 d9443c01a7336-2a8452223f4mr49229545ad.7.1769442058797; Mon, 26 Jan 2026
 07:40:58 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260125171745.484806-1-bjsaikiran@gmail.com> <20260126061528.63785-1-bjsaikiran@gmail.com>
 <20260126061528.63785-2-bjsaikiran@gmail.com> <ef6cf6c5-3b5d-45f2-af67-0567262a4561@linaro.org>
 <CAAFDt1spRkj7kySCa8P=jehQHbYVT2j+nxLira1vwYkiCJ7LDw@mail.gmail.com>
 <b699fcf5-5cb0-41eb-b9de-e5c6e98aefaa@linaro.org> <IlpLwcSSsQ89AZYFUkWtRcUkztg6PClgkVOyWG0StiDOUCE93t7KlF9q18JPi3GutJ1OQWj_2igjYq1OD8FLZg==@protonmail.internalid>
 <CAAFDt1tjiEXbuChcY73+NYxPW=rB83P4Bks1TPGsHTTqoSzOuw@mail.gmail.com>
 <ed1421d9-f094-4306-ae6d-e07b3a72f82b@kernel.org> <CAAFDt1ukAdXwADuFVoZrs6Ay2fB_sq6LMW5FCnsjqUL7V62mfg@mail.gmail.com>
 <eaf30b60-c0fb-4cf5-bc37-274faa187734@linaro.org> <CAAFDt1tgFf5MQcHm3s5DJEDHDtbTfj56_0-=fTz0ekDjSqY3CA@mail.gmail.com>
 <2084a247-053b-41c0-84ef-c56af640aa74@kernel.org> <I-1OPz69QKXF-LDqvufQARvv_3TIYaLyZIETdiGvSj_JSYhnJNeqiLERDUH2R0kclFyo6MqMRsaiZaS3RKmdZA==@protonmail.internalid>
 <CAAFDt1ufYyM4_xTy+AZTdXBB0cGNk+nFQHD5+5U7tUMQqZ+o=g@mail.gmail.com> <371b38d5-9322-4629-b378-ec62e0924fd4@kernel.org>
In-Reply-To: <371b38d5-9322-4629-b378-ec62e0924fd4@kernel.org>
From: Saikiran B <bjsaikiran@gmail.com>
Date: Mon, 26 Jan 2026 21:10:47 +0530
X-Gm-Features: AZwV_Qhlud8oUPekx6i6ENnr2kRsI9D2f9G25uacOGl9KQv7_---TR9F4VFcjYM
Message-ID: <CAAFDt1u1PxgurdGigY+maPhssWgCrj6srqKwqF9d3oUFzv-yJg@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] media: i2c: ov02c10: Keep power on and use reset
 for power management
To: "Bryan O'Donoghue" <bod@kernel.org>
Cc: Hans de Goede <hansg@kernel.org>, "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, 
	linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, rfoss@kernel.org, 
	todor.too@gmail.com, vladimir.zapolskiy@linaro.org, 
	sakari.ailus@linux.intel.com, mchehab@kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-51580-lists,linux-media=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,linaro.org,vger.kernel.org,gmail.com,linux.intel.com];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	MISSING_XM_UA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bjsaikiran@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid,0.0.0.36:email]
X-Rspamd-Queue-Id: CA40C8A414
X-Rspamd-Action: no action

"Failing that we should try a more liberal power_on() Assert Reset ...
Wait 10ms ... Enable ... Wait 20ms ... Clock ..."

I have implemented a strict power sequencing in v3 as you and Hans requeste=
d:

- Assert Reset (5ms)
- Enable Regulators
- Enable Clock
- Wait 2ms
- De-assert Reset
- Wait 20ms (T2/Boot)

Regarding the root cause (LDO active discharge / pin states): I
suspect you are right that active_discharge should be enabled by
firmware but isn't, or the sleep state pinctrls are missing (causing
back-feeding). I will investigate the SPMI registers and sleep
pinctrls separately as a follow-up, as that affects the platform
stability beyond just this driver.

For this patch series (v3): I have implemented Runtime PM Autosuspend
(1000ms). This effectively masks the issue for the user (rapid
open/close works instantly because regulators stay on), while using
standard kernel infrastructure instead of custom workarounds.

This approach:
- Fixes the immediate "camera fails on reload" user bug.
- Uses the rigorous power sequence you defined.
- Aligns with other drivers (e.g. ov2680) using autosuspend for
performance/stability.

I'm sending the v3 series in a bit with all these changes. I'll
continue debugging the LDO configuration on the side.

Thanks for all the feedback. Much appreciated.

Thanks,
Saikiran

On Mon, Jan 26, 2026 at 8:34=E2=80=AFPM Bryan O'Donoghue <bod@kernel.org> w=
rote:
>
> On 26/01/2026 14:08, Saikiran B wrote:
> > The exact issue is:
> > 1. Open Camera -> Close -> Wait 3s -> Open: WORKS.
> > 2. Open Camera -> Close -> Wait 1.5s -> Open: FAILS (I2C Timeout /
> > Device Busy).
> >
> > If the VDD rail is floating in the brownout region (~1.0V) during that
> > 1.5s window, does the sensor's internal Reset Logic Gate even have
> > enough bias voltage to function?
>
> I think the VDD rail floating is unlikely, this would require the
> description of the LDO configured by XBL to be incorrect - possible but,
> then you'd expect to see an update for Windows to fix it.
>
> Have you gotten the latest firmware for the board from Lenovo ? A
> misconfigured LDO - without active discharge set, should receive a
> firmware update to address.
>
> Another possibility is CCI is powering the chip in sleep.
>
> Lets have a look at the CCI pins.
>
>          cam_rgb_default: cam-rgb-default-state {
>                  mclk-pins {
>                          pins =3D "gpio100";
>                          function =3D "cam_aon";
>                          drive-strength =3D <16>;
>                          bias-disable;
>                  };
>
>                  reset-n-pins {
>                          pins =3D "gpio237";
>                          function =3D "gpio";
>                          drive-strength =3D <2>;
>                          bias-disable;
>                  };
>          };
>
> add
>         cam_rgb_sleep: cam-rgb-sleep-state {
>                  mclk-pins {
>                          pins =3D "gpio100";
>                          function =3D "cam_aon";
>                          drive-strength =3D <2>;
>                          bias-pull-down; // Force to Ground
>                  };
>
>                  reset-n-pins {
>                          pins =3D "gpio237";
>                          function =3D "gpio";
>                          drive-strength =3D <2>;
>                          bias-pull-down; // Force to Ground
>                  };
>          };
>
>
> &cci1_i2c1 {
>          camera@36 {
>                  compatible =3D "ovti,ov02c10";
>                  reg =3D <0x36>;
>
>                  reset-gpios =3D <&tlmm 237 GPIO_ACTIVE_LOW>;
>                  pinctrl-names =3D "default", "sleep";
>                  pinctrl-0 =3D <&cam_rgb_default>;
>                  pinctrl-1 =3D <&cam_rgb_sleep>;
>
> Failing that we should try a more liberal power_on()
>
> power_on():
>
>      Assert Reset (GPIO Low).
>      Wait 10ms.
>      Enable all regulators (RPMh votes).
>      Wait 20ms (Allow PM8010 to ramp and stabilize).
>      Start the Clock (MCLK).
>      Wait 10ms.
>      De-assert Reset (GPIO High).
>      Wait 5ms.
>
> If that doesn't work, we will have to go and look at the LDO
> configuration via SPMI directly.
>
> During the 2.3 second window can you run
>
> Getting the kernel's view:
> cat /sys/kernel/debug/regulator/regulator_summary
>
> We are looking for use_count > 0 and open_count
>
> We could also look at the SPMI LDO config register
>
> Getting the firmware's view:
> cat /sys/kernel/debug/regmap/spmi0-0x08/registers
>
> It should be possible to interrogate the configruation of all of the
> relevant LDOs and ascertain if active-discharge is set, which TBH it
> should be.
>
> > My testing suggests the sensor is physically incapable of processing
> > the Reset signal until the rail fully discharges (~2.3s), which is why
> > the 5ms delay has no effect.
>
> Yes accepted but, a 2.3 second delay is avoidable if we root-cause.
> P.S.
> Please bottom post !
>
> ---
> bod

