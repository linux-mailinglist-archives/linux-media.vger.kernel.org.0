Return-Path: <linux-media+bounces-51554-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4F2sJG1Pd2n0dwEAu9opvQ
	(envelope-from <linux-media+bounces-51554-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 26 Jan 2026 12:26:37 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E386187A17
	for <lists+linux-media@lfdr.de>; Mon, 26 Jan 2026 12:26:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 080C5303CD23
	for <lists+linux-media@lfdr.de>; Mon, 26 Jan 2026 11:23:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7352332EAA;
	Mon, 26 Jan 2026 11:23:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vl5YTcN2"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83AAB3314CB
	for <linux-media@vger.kernel.org>; Mon, 26 Jan 2026 11:23:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769426626; cv=pass; b=n6d6eyx4ZCoED3zJDKuIkl5r2R++UEQ4qkOrWobgFkRzwoABUL953bcgoE1v5/2hWM2eKLIOmk2zE9AzpNIIQsR4Fu3/H4O+orRlVDz3Oytz8gkuMe9Wq1OH5KEAJo3l2Et+YxuQfoeiNdJXALdPgSjECY3HJ5OpG6XYDj1l6EI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769426626; c=relaxed/simple;
	bh=IQCbKeJZSYei7ssSGmC2maGEK0rZqERmfT9zLaKYOiM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NJ7W9or5yQvqyQVo+uJgDtbA3rtR+3tTYGy1K0XnP1brKRmkJ39sIlF4dN6SCd7Nl1ix00BGXf+3goanbL+90DIL2S09zgvmNBL6K9kd/EICi/rd9RLNRsJtIeVs1mgF1xeW/AsnG13fnawedjNYImEesar2McIiXfwKoctLoek=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vl5YTcN2; arc=pass smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-34c3259da34so2482475a91.2
        for <linux-media@vger.kernel.org>; Mon, 26 Jan 2026 03:23:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769426624; cv=none;
        d=google.com; s=arc-20240605;
        b=R2+OvYInqRnOPAu2CeiWTsAgZnSaXtEXBxsDlu8aOaEfFGJcKZXOrMw4Xsr8SgWB+9
         C9+CoM7utGu/ZXC5jjW2fAXGUJo4ho85bL3YLYFVH/+wn4cCRdc0IErSRMX09GDN79lJ
         8sctBtwznaWt7FFTDINjF9t4/s1zu49CIqpM9bXW5GJuWtrAO9A/xJBITrdXaMnyAO7j
         rY3aU0WcJHV/RYBfYK0QTZvBljVADBvZUuTe0F+FnuVLUROluJZFe9ByUSduLLvUXZ17
         /BF8hpZdvtgM5V2tnDI6JyiFtqgxugMUz4wjpJTGZCWdj1VUCAvMoCzWQ3cy8BYAbnpU
         WIJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=blQRGDfCa98eK+RQCqGftRIq4FTOXC9Z5O4HK6CMBIM=;
        fh=bvRaeGdlb84b+8B2R5SKV6w6WfkPCRlSXg7YnipXzgo=;
        b=E5QuIin/dAsWJOYD5SSYFrfeSsKGGvMr18E3OMwxTzAEm7YRS1zrrJqYIVjnfAYG82
         jVarupWQnzD/Ao2R1D0SUX1ZZVS8hjhw6sC3kZr/E9E3aqIKZnQapFwz/eG9IycukKAN
         AY4cpz2FNXAc2S2vgfAzBOTxdkgUS5M9NFVEirvpsItg4/CWLs4YnalG6qZNW6SKusSQ
         Ydz+ZLKpunsyACPG457Q+joMVQ+54k8kgfb3BMziK6PgbzgRiT4NYFf6PsAzDIYC762f
         W6m8klGA6jPREhxPomG4R2wQ+Tp3Ydz5fct3IIb1E+O0w3f1thvFjlTp/G8R97LK3ppM
         bL2A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769426624; x=1770031424; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=blQRGDfCa98eK+RQCqGftRIq4FTOXC9Z5O4HK6CMBIM=;
        b=Vl5YTcN2bNsQUwxdJC+K0PIlhYCuDif81zpXCclxCE8HlU9LZWwMsKL6x/O/Owh2fi
         U4l7+8yNDPwmbSBfejSBhv1OXzF4uyJDR30Wo6CVXsviiCbbsGjf/clTEkEFrqZCzMdc
         23ralFCoU+i4tx5/rGh4BlhSJN6GB2jENTMoXw6QmlrnHkdnOjVbmkJ34PbDpcNn2g1D
         WlyQXRPwQG9M6Hcd6aI/87bNqIiNjBjCLuA2n4b9FYA0xb6Za2jl8hzMrB8gNpJkergc
         qGKN1oSfk89PNFHZAsvA3Xu8c7dQqbsmadhBKtEea0oFrLP5AKNkz148htcv9iXIRfwy
         5bFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769426624; x=1770031424;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=blQRGDfCa98eK+RQCqGftRIq4FTOXC9Z5O4HK6CMBIM=;
        b=EK2BlKTirXwLPcguRCV/X7pgR8yO06d70vD2elvoUGb7Iw74HAIDNBcAnmCQgy6j8t
         76BxFGltFJOC/wgEaxFUoncwGj1U+ciRwWJWVMnV9lkcvbePGhDqlZxeX/sKjwV9mvLV
         0GWBS/N+p7qlPf9jeR3/aCp9Wx4e6e4MounXJ8iEu/gknqeMfFIJb95SzQQMYJLpcao9
         SIe6LW4FU5PGFmFdOUCX+MdFr8806CrgZMXJNIxS0x2L417OfLQkl3aQiMZKE/SSLJlU
         Vg3hpM69j33haZLVEbSjrDYbkv50XikeglzR4zJ4qtsceq4q6ScIwKBVjMvuOXkpzaDu
         9X3A==
X-Gm-Message-State: AOJu0Yy/PMcjr3zowMwpPRM/FTcDrMl3NJ+LyyDHHrNDDQyTKxKk0Ji5
	Aw7EiqHKCG8xbIqkYnOxDfs8L/FItz3kq8BLgvr1amMmwjCnn6qlXUcVVV5MNhVOGGKxkTy/h+h
	qByuEVFIE4O64Bbl1/MtaWbNUhd4FCnc=
X-Gm-Gg: AZuq6aI7AhfxB1yqjQsiK6Q1IHXm0BXVdKDNGFUg2L1qILHziDeZM8xmTLcnt3oUMCR
	nBB3cUfcFBle1/Oe6F0Q665aOj6AIJ6apXSZysz8k6OqlAMSRq7G610bVMeK8i/lvCrJ8hMLsgH
	0hs3O3tJfMwh59nIrZY8zETwkLV6tJQS9yMIsmpvzwubygUQmG07o63nZ4kWuwjhPTDS0b34txS
	0D9C70OG5YPY9Z1PF1t07W30pxgh+zBlbIBroWSfIOLgVyU/qgfajTCZgfiKKkVqqJL5jjEbzSF
	TmbwHoyBLcPa3zG60IAB8Nmb2cBF
X-Received: by 2002:a17:90b:4e8c:b0:34a:e9b:26b1 with SMTP id
 98e67ed59e1d1-353c417d8a4mr3675478a91.26.1769426623674; Mon, 26 Jan 2026
 03:23:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260125171745.484806-1-bjsaikiran@gmail.com> <20260126061528.63785-1-bjsaikiran@gmail.com>
 <20260126061528.63785-2-bjsaikiran@gmail.com> <ef6cf6c5-3b5d-45f2-af67-0567262a4561@linaro.org>
In-Reply-To: <ef6cf6c5-3b5d-45f2-af67-0567262a4561@linaro.org>
From: Saikiran B <bjsaikiran@gmail.com>
Date: Mon, 26 Jan 2026 16:53:32 +0530
X-Gm-Features: AZwV_QjiFkOwrqNyXqjXlscyVFSqBgCPVKaRf61hcAGSxVI90l0jbhS3ZM5O3-o
Message-ID: <CAAFDt1spRkj7kySCa8P=jehQHbYVT2j+nxLira1vwYkiCJ7LDw@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] media: i2c: ov02c10: Keep power on and use reset
 for power management
To: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, bod@kernel.org, 
	rfoss@kernel.org, todor.too@gmail.com, vladimir.zapolskiy@linaro.org, 
	hansg@kernel.org, sakari.ailus@linux.intel.com, mchehab@kernel.org, 
	stable@vger.kernel.org
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
	TAGGED_FROM(0.00)[bounces-51554-lists,linux-media=lfdr.de];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,gmail.com,linaro.org,linux.intel.com];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linaro.org:email]
X-Rspamd-Queue-Id: E386187A17
X-Rspamd-Action: no action

"Where do you get this conclusion from ? Are you inferring it from
what you see on the platform or can you point to some known
data-source for this ?"

This is determined on the Lenovo Yoga Slim 7x (X1E80100). I tested
extensively and found that if I attempt to power-on the sensor less
than ~2.3 seconds after power-off, it fails to identify or times out
on I2C (brownout behavior). If we wait >2.3s, it works reliably 100%
of the time.

"2 seconds to discharge ? These regulators are PM8010 anyway - so
you're saying the PMIC takes two seconds to discharge ?"

Yes. I checked the regulator driver
(drivers/regulator/qcom-rpmh-regulator.c) and found that unlike other
Qualcomm regulator drivers (e.g., spmi/glink), it currently lacks
active_discharge / pull-down support. Without active discharge, the
voltage rails float and decay very slowly via leakage current when the
load (sensor) is in reset/high-Z.

"Did you try out the suggested fix I gave you yesterday ? Make
power_on/power_off be more consistent with the data-sheet."

Yes, I implemented your suggested power sequence (asserting reset
before power-on, respecting T1 and T2 timings). While this is correct
and good practice, it did not solve the brownout issue during rapid
cycling. The sensor internal state machine seems to require the rails
to drop near 0V to reset completely, and the passive discharge is
simply too slow on this platform.

"If we really can establish and show a two second discharge delay then
the thing that needs to change is the regulator driver"

I agree with you and Hans that solving the discharge time belongs in
the regulator driver. However, implementing off-on-delay or active
discharge in the shared RPMh driver is a larger task that affects the
whole platform.

As Hans suggested, I will switch to using Runtime PM Autosuspend with
a ~2s delay and check.

Thanks & Regards,
Saikiran

On Mon, Jan 26, 2026 at 4:39=E2=80=AFPM Bryan O'Donoghue
<bryan.odonoghue@linaro.org> wrote:
>
> On 26/01/2026 06:15, Saikiran wrote:
> > The OV02C10 sensor was experiencing brownout conditions during rapid
> > power cycles (e.g., browser WebRTC permission checks) on Qualcomm
> > platforms, causing the sensor to lock up and require a system reboot.
> >
> > Root cause:
> > The Qualcomm RPMh regulator driver does not support active discharge,
> > requiring regulators to passively discharge via leakage current. This
> > takes 2+ seconds on X1E80100 platforms. Without complete voltage
> > discharge, the sensor's internal microcontroller does not fully reset,
> > leading to I2C timeouts and a locked state.
>
> Where do you get this conclusion from ?
>
> Are you inferring it from what you see on the platform or can you point
> to some known data-source for this ?
>
> 2 seconds to discharge ? These regulators are PM8010 anyway - so you're
> saying the PMIC takes two seconds to discharge ?
>
> > Solution:
> > Instead of power cycling the regulators, keep them continuously enabled
> > and use reset signals to control the sensor state:
>
> If this is really a problem with the regulators and I don't think we
> have established that - then it is a fix that needs to go into the
> regulators.
>
> Did you try out the suggested fix I gave you yesterday ?
>
> The options are:
>
> 1. Make power_on/power_off be more consistent with the data-sheet.
>     This I'd guess 99% certain what is going wrong for you or
>
> 2. If we really can establish and show a two second discharge delay
>     then bring the required delay into the RPMh code so that
>     regulator_bulk_disable(); is atomic from the perspective of the
>     caller.
>
> I honestly can't imagine two seconds is a real thing here but, if it is,
> then the thing that needs to change is the regulator driver to account
> for that long delay not the users of the regulators.
> > - power_off(): Assert hardware reset GPIO (keep regulators/clock ON)
> > - power_on(): Release hardware reset + trigger software reset via
> >    register 0x0103 (standard OmniVision software reset)
> >
> > This approach:
> > - Eliminates the 2+ second discharge delay
> > - Enables instant camera reopening (~17ms vs 2.3s)
> > - Properly resets the sensor state machine via reset signals
> > - Maintains correct power sequencing on first initialization
> > - Follows OmniVision sensor conventions (0x0103 software reset)
> >
> > The first power-on still performs full regulator and clock
> > initialization. Subsequent power cycles only toggle reset signals,
> > avoiding the discharge delay entirely.
> >
> > Tested on Lenovo Yoga Slim 7x (X1E80100) with rapid camera open/close
> > cycles - no brownouts or lockups observed.
> >
> > Fixes: 44f89010dae0 ("media: i2c: add OmniVision OV02C10 sensor driver"=
)
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Saikiran <bjsaikiran@gmail.com>
> > ---
> >   drivers/media/i2c/ov02c10.c | 119 +++++++++++++++++++++--------------=
-
> >   1 file changed, 69 insertions(+), 50 deletions(-)
> >
> > diff --git a/drivers/media/i2c/ov02c10.c b/drivers/media/i2c/ov02c10.c
> > index 7e9454e8540c..08d268de60ec 100644
> > --- a/drivers/media/i2c/ov02c10.c
> > +++ b/drivers/media/i2c/ov02c10.c
> > @@ -22,6 +22,8 @@
> >   #define OV02C10_CHIP_ID                     0x5602
> >
> >   #define OV02C10_REG_STREAM_CONTROL  CCI_REG8(0x0100)
> > +#define OV02C10_REG_SOFTWARE_RESET   CCI_REG8(0x0103)
> > +#define OV02C10_SOFTWARE_RESET_TRIGGER       0x01
> >
> >   #define OV02C10_REG_HTS                     CCI_REG16(0x380c)
> >
> > @@ -390,8 +392,8 @@ struct ov02c10 {
> >       u32 link_freq_index;
> >       u8 mipi_lanes;
> >
> > -     /* Power cycling rate limit */
> > -     ktime_t last_power_off;
> > +     /* Power management: track if regulators are enabled */
> > +     bool powered;
> >   };
> >
> >   static inline struct ov02c10 *to_ov02c10(struct v4l2_subdev *subdev)
> > @@ -680,25 +682,16 @@ static int ov02c10_power_off(struct device *dev)
> >       struct v4l2_subdev *sd =3D dev_get_drvdata(dev);
> >       struct ov02c10 *ov02c10 =3D to_ov02c10(sd);
> >
> > -     /* 1. Assert Reset */
> > -     gpiod_set_value_cansleep(ov02c10->reset, 1);
> > -
> > -     /* 2. Disable Clock (Stop sensor state machine) */
> > -     clk_disable_unprepare(ov02c10->img_clk);
> > -     usleep_range(1000, 1500);
> > -
> > -     /* 3. Disable Power */
> > -     regulator_bulk_disable(ARRAY_SIZE(ov02c10_supply_names),
> > -                            ov02c10->supplies);
> > -
> >       /*
> > -      * 4. Discharge Wait
> > -      * Wait for regulators to fully discharge before returning.
> > -      * This delay ensures clean power cycling.
> > +      * Keep regulators and clock ON to avoid discharge delay.
> > +      * Just assert hardware reset to put sensor in reset state.
> > +      * This allows instant power-on without waiting for regulator dis=
charge.
> >        */
> > -     usleep_range(50000, 55000);
> > +     if (ov02c10->reset)
> > +             gpiod_set_value_cansleep(ov02c10->reset, 1);
> >
> > -     ov02c10->last_power_off =3D ktime_get();
> > +     /* Keep clock running - sensor needs it for software reset */
> > +     /* Keep regulators enabled - avoids 2.3s discharge delay */
> >
> >       return 0;
> >   }
> > @@ -708,50 +701,63 @@ static int ov02c10_power_on(struct device *dev)
> >       struct v4l2_subdev *sd =3D dev_get_drvdata(dev);
> >       struct ov02c10 *ov02c10 =3D to_ov02c10(sd);
> >       int ret;
> > -     s64 delta_us;
> >
> >       /*
> > -      * Mandatory Cool-Down:
> > -      * If the camera was powered off within the last 3 seconds, ensur=
e at least
> > -      * 2 seconds have elapsed to allow full regulator discharge and s=
ensor reset.
> > -      * This prevents brownouts during rapid open/close/open sequences=
.
> > +      * On first power-on, do full initialization.
> > +      * On subsequent power-ons, regulators/clock are already on,
> > +      * so we just need to release reset and do software reset.
> >        */
> > -     delta_us =3D ktime_us_delta(ktime_get(), ov02c10->last_power_off)=
;
> > -     if (delta_us < 3000000) {
> > -             dev_dbg(dev, "Enforcing %lld us cool-down period\n", 2000=
000 - delta_us);
> > -             fsleep(2000000 - delta_us);
> > +     if (!ov02c10->powered) {
> > +             /* First time: enable everything */
> > +             if (ov02c10->reset) {
> > +                     gpiod_set_value_cansleep(ov02c10->reset, 1);
> > +                     usleep_range(2000, 2200);
> > +             }
> > +
> > +             ret =3D clk_prepare_enable(ov02c10->img_clk);
> > +             if (ret < 0) {
> > +                     dev_err(dev, "failed to enable imaging clock: %d"=
, ret);
> > +                     return ret;
> > +             }
> > +
> > +             usleep_range(2000, 2200);
> > +
> > +             ret =3D regulator_bulk_enable(ARRAY_SIZE(ov02c10_supply_n=
ames),
> > +                                         ov02c10->supplies);
> > +             if (ret < 0) {
> > +                     dev_err(dev, "failed to enable regulators: %d", r=
et);
> > +                     clk_disable_unprepare(ov02c10->img_clk);
> > +                     return ret;
> > +             }
> > +
> > +             ov02c10->powered =3D true;
> >       }
> >
> > -     /*
> > -      * Standard Power-Up Sequence:
> > -      * 1. Enable Regulators
> > -      * 2. Enable Clock
> > -      * 3. Release Reset (with ample boot time)
> > -      */
> > -
> > -     ret =3D regulator_bulk_enable(ARRAY_SIZE(ov02c10_supply_names),
> > -                                 ov02c10->supplies);
> > -     if (ret < 0) {
> > -             dev_err(dev, "failed to enable regulators: %d", ret);
> > -             return ret;
> > +     /* Release hardware reset */
> > +     if (ov02c10->reset) {
> > +             /* Ensure reset was asserted for at least 2ms */
> > +             usleep_range(2000, 2200);
> > +             gpiod_set_value_cansleep(ov02c10->reset, 0);
> > +             /*
> > +              * Wait for sensor microcontroller to stabilize after res=
et release.
> > +              * 50ms prevents black frames during rapid power cycling =
by ensuring
> > +              * the sensor's internal state machine is fully initializ=
ed before
> > +              * software reset and register configuration.
> > +              */
> > +             msleep(50);
> >       }
> >
> > -     ret =3D clk_prepare_enable(ov02c10->img_clk);
> > -     if (ret < 0) {
> > -             dev_err(dev, "failed to enable imaging clock: %d", ret);
> > -             regulator_bulk_disable(ARRAY_SIZE(ov02c10_supply_names),
> > -                                    ov02c10->supplies);
> > +     /* Perform software reset to ensure clean state */
> > +     ret =3D cci_write(ov02c10->regmap, OV02C10_REG_SOFTWARE_RESET,
> > +                     OV02C10_SOFTWARE_RESET_TRIGGER, NULL);
> > +     if (ret) {
> > +             dev_err(dev, "failed to send software reset: %d", ret);
> >               return ret;
> >       }
> >
> > -     /* Wait for power/clock to stabilize */
> > +     /* Wait for software reset to complete */
> >       usleep_range(5000, 5500);
> >
> > -     if (ov02c10->reset) {
> > -             gpiod_set_value_cansleep(ov02c10->reset, 0);
> > -             usleep_range(80000, 85000);
> > -     }
> > -
> >       return 0;
> >   }
> >
> > @@ -924,6 +930,19 @@ static void ov02c10_remove(struct i2c_client *clie=
nt)
> >               ov02c10_power_off(ov02c10->dev);
> >               pm_runtime_set_suspended(ov02c10->dev);
> >       }
> > +
> > +     /* Clean up regulators/clock if still enabled */
> > +     if (ov02c10->powered) {
> > +             /* Assert reset before disabling power for clean shutdown=
 */
> > +             if (ov02c10->reset)
> > +                     gpiod_set_value_cansleep(ov02c10->reset, 1);
> > +
> > +             clk_disable_unprepare(ov02c10->img_clk);
> > +             regulator_bulk_disable(ARRAY_SIZE(ov02c10_supply_names),
> > +                                    ov02c10->supplies);
> > +             ov02c10->powered =3D false;
> > +     }
> > +
> >       v4l2_subdev_cleanup(sd);
> >       media_entity_cleanup(&sd->entity);
> >       v4l2_ctrl_handler_free(sd->ctrl_handler);
>

