Return-Path: <linux-media+bounces-51699-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oPsYLePleGlwtwEAu9opvQ
	(envelope-from <linux-media+bounces-51699-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 27 Jan 2026 17:20:51 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CFB397A9B
	for <lists+linux-media@lfdr.de>; Tue, 27 Jan 2026 17:20:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5641430214FA
	for <lists+linux-media@lfdr.de>; Tue, 27 Jan 2026 16:20:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6ACFA3033D7;
	Tue, 27 Jan 2026 16:20:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eFblznla"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77A9E35DD0C
	for <linux-media@vger.kernel.org>; Tue, 27 Jan 2026 16:20:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769530841; cv=pass; b=YZJIWBY4q59M8OiWomOyRqWNx+Hk/OxRo7ZfYRoFxpQ9p4BIRh5F8OazIQakIoTV4gKEQyYhgeGO7bq4SDGy5ADsS7fVJbvWz/XOUTFhOdev85BQ8K0W9KfedVuqjzXV9/wXgrn3aK70Lpty4CvsYBs12Q0awZIRmFXus8jtsUQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769530841; c=relaxed/simple;
	bh=p/BPlz45ZsnUOOv45A1fjPgdnS9vrperPPIkgwQyvPU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Q3gwxXwkuUCCqdjEZBHlcyhhTe4bvT3Lh0M4ybqIBReiM5bW89Vu4jBSkXVCt/J5IL/J/WK5t3MYaK6KMfYOX9dtXIMc8VTU8AbMHiR0zcblT4XsB6dtsevOvmXasxUvCe73/oagJaHoT6/x23KS8HkX+GsWB5wnDX2X65yGHlI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eFblznla; arc=pass smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-bde0f62464cso1823853a12.2
        for <linux-media@vger.kernel.org>; Tue, 27 Jan 2026 08:20:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769530840; cv=none;
        d=google.com; s=arc-20240605;
        b=Y9/KrsX7Fqo574wEyX6epC6eCjcIArwmJ3aNBfQ11sPo5ni4Yhdfay0xmAtqPhtBJu
         dbN3F/t8gaGeWeqR08olS0iDFdfDSHMMbfasZat+36br1QqHu2EQO9oY745ofB6bh/1X
         /OtCxZFARp1NvnN77dgYZmwZ8I0KWSdjxfOEpA4oMFGSUO6nYOVO0VgAia5zcHQNhyUV
         QSbM2FNaDBuGchDVr1csw4jVXu55dTQN1Oft1+vPNl++e2ZAE16MRoehOZ5w+NN8RaN/
         C/gSGSL1js2oq+C+gwcTSGkiwdAewDoaNkRtehzhxOBO+Ehm6kF/ROHWskVJ3RQKOrWA
         S+FQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=d65yytJ1MW2JgMvRS0O1lQIMly3lo2OKXfhreY51uFQ=;
        fh=khnm9D+aw/nLxOswpUleIP4t583IdOaRJf4F+uqZXH8=;
        b=hJW5dSQEaf53a9DGsgB60LtFF8ExTKNgm8pqZV6trAfkBRhkRegWCnTzuwolELLENB
         9S8rpeCBhr6+R+ZiQZoiBXCYYf/T2BRanlbNruzm3ca+1+YS7ziWuHRJxxv7cUS79kBy
         MZmvGT5BIfDlfh5U0GQDd6eZHWqe2kqLoXuXIk3tN6uD4kLq0dPtecr2NnmvL5MCb3Db
         NXFlut1TKzBtKvKlb2vebLu1E5DrCeejqCJfm5k9vIOiKf9lyDjoLBeXo4lXoIqSt/92
         wE0AsjkCquxc8dHJMXFt90pyQEyW3pWNIHz8u7eZZnLyGttgYQeBW7BuuUANFTMYpzj4
         AlOA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769530840; x=1770135640; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d65yytJ1MW2JgMvRS0O1lQIMly3lo2OKXfhreY51uFQ=;
        b=eFblznlaAM8ejSVhSXhmavjFxMQf00lhD/5n/xkQ4GZm9pQ9y1SYBtDMtnud7+Dbkv
         u1QkDeZDOczq1g5INH2DQXrf7lQJU3S7i0RLju03z9IWWbocTHFTO19bvby53/FexhXb
         s5NsuQaQyfCfc1Rzi2zaPsDXBQceAk/dqcbeQW0bwQIZTS8g30i8LjwYM0Q8M+XzlDdb
         ZnkkjChz9+kUrs984zjVkddMi9x9xacicZ/YYuaPGxwZkFHoJPhV6aTSkl+vSPqXKbq4
         r8D6g5iKPLjRDkw7EXlPCfzdUyUE89pgk5kxigqOzn/6P4e5FegThzzkVvA7X+8SCbHq
         sc2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769530840; x=1770135640;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=d65yytJ1MW2JgMvRS0O1lQIMly3lo2OKXfhreY51uFQ=;
        b=iqr38S+XRJZOjkzNIMWj01koNe7Un6RcAohSG6aQkdEJkkcBZO/MB4LHTTOnExnQE7
         wdCzZIwoxduXEd326y4yWf/UrQzU2Ld5DK26Hj8h6v5Y/1729e86lc/gME3T8UZFD385
         Wgob8Afo1dZsEKgknUBArZDqyLtwT5/zRaIhBLmLDk5WZlPXF+cIf7HN37YfJDX6M2HX
         7tnq6BWXQrPVwFsh/r82Ul3VJFSscYW7ZbT1usCUUIXdeuzJuh0iOjoK2/JwB/w9zhd8
         Oq6MULxD4K+gqyur+7+etgdjg3+h/mLXk3NQAvvw+mNlVdkJz2KtKYjMzKxyPQTgIE0B
         htxg==
X-Forwarded-Encrypted: i=1; AJvYcCUtwdDarg1GnmrM3ueBDntZWPxBEQqFJEDLwrFro19N7oa0gRb1MCd8RqF38a/BT46sswiju17gpBndGQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwfFGK1/BOtP9uni7KK0H8DQxXrktbNfqzQSqOvG7bxwj52fNC5
	HrUTH602nNOlZ7KCR6egKPp9tuCUA/tvQxOf1ESJuQhQ/8ZeiQuifKpI0aTFP960oIxp6DHkRik
	3pfTDBmhAB6woN0ChwfqdUIZKyi/gTO4=
X-Gm-Gg: AZuq6aKIsssnNNNz6hVLa6DgDDAfcUtAg9MDqMSy0ontUbGbAl76dnGZD6jv9afCapH
	aa9pByPHv9Iz1GDlkFOlzEpmDRHawwdQNsge7xIBk9RP22+ZdVZF8oJU0+Hx6i4uyrKiwe0Gb1o
	MbuLG73NhefKQpV1aholwBfX3Mj8ahdVrKVsguAe64+iC+R+5pDu0d4GM9fxUVmxivZ5ww5UkUf
	RTFK1GfJ4hMpHHVkz4xKIuHoPtvBd+Bvk9fEo7t5ZItJ8yxm5nMdmVrII+HO4u3QE10YgZcW1AA
	l9MTjInVp6bcoIsnVmfDhG9KSr0=
X-Received: by 2002:a17:90b:3b85:b0:340:2a3a:71b7 with SMTP id
 98e67ed59e1d1-353fecd6236mr2343805a91.12.1769530839689; Tue, 27 Jan 2026
 08:20:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260126173444.10228-1-bjsaikiran@gmail.com> <20260126173444.10228-4-bjsaikiran@gmail.com>
 <900cc5dd-c39d-42f6-9531-016f62da81e8@linaro.org> <CAAFDt1tsyvtAa84bFK2Hq5yG_F15SUUseBd5Xi-DB8GnUj7+7A@mail.gmail.com>
 <aaab1d32-9375-47d2-8524-e80e076b864e@linaro.org> <CAAFDt1vKn5ssoTQZduGKb5eOeN74P=FVk9f01go1d-JS71Zt0A@mail.gmail.com>
 <clmeor0Z59Dd_ymBj-m2zE0orMOFgVsPFXUBpBx39ZehM4t_GrlZV8y8f-lZbH6p9N-W7FLs7PqYhfG6VzwmBw==@protonmail.internalid>
 <571cd869-847f-4697-ace3-503f123e8486@linaro.org> <cb902c4e-f7b9-4d70-a997-1e84c90ea18b@kernel.org>
In-Reply-To: <cb902c4e-f7b9-4d70-a997-1e84c90ea18b@kernel.org>
From: Saikiran B <bjsaikiran@gmail.com>
Date: Tue, 27 Jan 2026 21:50:28 +0530
X-Gm-Features: AZwV_Qj_vb1x1lu6XXMunkVpxeZcvcZBHMOYFjYNAf2rHeYoii8GYdmNqCxCgXM
Message-ID: <CAAFDt1s+RUpUEUEERCuXqDHijxHXW=PemVaWk=to7WtQ9cYKEg@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] media: i2c: ov02c10: Use runtime PM autosuspend to
 avoid brownouts
To: "Bryan O'Donoghue" <bod@kernel.org>
Cc: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, linux-media@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, rfoss@kernel.org, todor.too@gmail.com, 
	vladimir.zapolskiy@linaro.org, Hans de Goede <hansg@kernel.org>, 
	sakari.ailus@linux.intel.com, mchehab@kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-51699-lists,linux-media=lfdr.de];
	FREEMAIL_CC(0.00)[linaro.org,vger.kernel.org,kernel.org,gmail.com,linux.intel.com];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid]
X-Rspamd-Queue-Id: 2CFB397A9B
X-Rspamd-Action: no action

Hi Bryan and Hans,

I implemented your suggested debug probe in qcom-rpmh-regulator.c to inspec=
t
the registers directly. Unfortunately, on this platform (X1E80100), it retu=
rns:

  rpmh_regulator_probe: --- OV02C10 PMIC DUMP: Failed to get parent regmap =
---

This confirms that the AP does not have direct access to the PMIC configura=
tion
registers (likely blocked by the RPMh firewall/access control).

However, I have confirmed definitively that the root cause is the 2.3s pass=
ive
discharge requiring a mandatory off-time.

When I apply the `regulator-off-on-delay-us =3D <2300000>;` property to the
camera regulators in the device tree (and patch the regulator driver to sup=
port
it), the camera operates flawlessly without needing any workarounds (like
autosuspend / Software reset / additional delays) in the sensor driver.
The regulator core correctly blocks the
re-enable until the discharge constraint is met.

The regulator delay and figuring the 2.3s out is another issue which I
will keep digging at from now.

Plan for v4:

1. For this ov02c10 series (v4), I will drop the "Autosuspend" patch as it =
is
   no longer needed with the correct platform fix.

3. I will keep the "Race Fix" (Patch 1) and a cleaned-up "Power Sequence"
   (Patch 2) which addresses Hans's feedback (5ms reset assertion, no
software reset) to ensure
   the driver is compliant with the datasheet.

Please let me know if you have any questions.

Regards,
Saikiran

On Tue, Jan 27, 2026 at 4:41=E2=80=AFPM Bryan O'Donoghue <bod@kernel.org> w=
rote:
>
> On 27/01/2026 11:06, Bryan O'Donoghue wrote:
> > So, SPMI is not exported in /sys/kernel/debug/regmap - however
> >
> > drivers/regulator/qcom-rpmh-regulator.c
> >
> > Lets add this to probe
> >
> > unsigned int val, i;
> >       u16 bases[] =3D {0x4000, 0x4300, 0x4600}; // LDO1, LDO4, LDO7
> >       const char *names[] =3D {"LDO1(1.2V)", "LDO4(1.8V)", "LDO7(2.8V)"=
};
> >       struct regmap *p_regmap =3D dev_get_regmap(dev->parent, NULL);
> >
> >       if (p_regmap) {
> >           pr_info("--- OV02C10 PMIC RAIL DUMP START ---\n");
> >           for (i =3D 0; i < 3; i++) {
> >               // Check Config (Active Discharge)
> >               regmap_read(p_regmap, bases[i] + 0x41, &val);
> >               pr_info("!!! %s SEC_CTRL (0x%04x) =3D 0x%02x (Bit7: Activ=
e
> > Discharge)\n",
> >                       names[i], bases[i] + 0x41, val);
> >
> >               // Check Status (Is it actually on?)
> >               regmap_read(p_regmap, bases[i] + 0x08, &val);
> >               pr_info("!!! %s STATUS   (0x%04x) =3D 0x%02x (Bit7: VREG_=
OK,
> > Bit0: VREG_ON)\n",
> >                       names[i], bases[i] + 0x08, val);
> >
> >               // Check Pull-down config (Secondary check)
> >               regmap_read(p_regmap, bases[i] + 0x42, &val);
> >               pr_info("!!! %s PD_CTRL   (0x%04x) =3D 0x%02x\n",
> >                       names[i], bases[i] + 0x42, val);
> >           }
> >           pr_info("--- OV02C10 PMIC RAIL DUMP END ---\n");
> >       }
>
> Obviously only do this for PM8010 for the other RPMh which may not have
> this offset.
>
> ---
> bod

