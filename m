Return-Path: <linux-media+bounces-56750-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GDRPFFhiwWnnSgQAu9opvQ
	(envelope-from <linux-media+bounces-56750-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 23 Mar 2026 16:55:04 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BB05D2F71C3
	for <lists+linux-media@lfdr.de>; Mon, 23 Mar 2026 16:55:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1BF003201501
	for <lists+linux-media@lfdr.de>; Mon, 23 Mar 2026 15:42:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F3573B27C1;
	Mon, 23 Mar 2026 15:37:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="Pj5+mKyk"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yx1-f46.google.com (mail-yx1-f46.google.com [74.125.224.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB8AE3B19AA
	for <linux-media@vger.kernel.org>; Mon, 23 Mar 2026 15:37:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774280278; cv=pass; b=bWKBletFV2XyvyfFsL3D/+Uq+Yrb8EOjmBjDzRgZdj1+NCiozx0uA3qChGSuu6VMRWVuVceh7U4eAALs2D0laWXMRRRJ/OrA98AjzopuMch4nsxEA165Ui0Xw0Dvd/YktsyBIOT7cflgcbtBTiHWhm22ECDetZinRIxZf8USg/M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774280278; c=relaxed/simple;
	bh=NPBZu9fTz00phfR8AvUCoM9kehhC0ewbcsS67oGkNdw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=poxfluc+AbaTpLvrgKwk6v+INsHCcuhmBf0geTOeWDtAh9ep6NcgdDyzHkPdzhLqokvLmik4gKTOQPHNcKj/SJjkHqvYtHPMERTjVlTkFhTs4fq7Z06ljdKMthWjq0u11pbG/Xshg+SaxNhcA+VMpXhi5ffN8NcajXhruVU67Kg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=Pj5+mKyk; arc=pass smtp.client-ip=74.125.224.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Received: by mail-yx1-f46.google.com with SMTP id 956f58d0204a3-64ea5b45673so4143602d50.0
        for <linux-media@vger.kernel.org>; Mon, 23 Mar 2026 08:37:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774280275; cv=none;
        d=google.com; s=arc-20240605;
        b=L1k9GDuJqld+Z0wuQniGEepyRt1rGjdRr7slm5jp1B/FoY3sZechvlZqMnjsSkqadV
         g4W+baZuQyhjpT7p9WTikty+3QsPSzqurUxRpPxEjRTqsKjR6ToP0b2/8QT0/TZpkTAL
         PxC1yZ7sbIn0ApYD3lWLNaJXLvsk/Xr/SzLU5gBSWXy/olEayttVSqUjgOm3wweNSaiv
         8mE5cszFGrN9Wj1CS7r9ZBK/oUpinkwKtKXmqS7Q4Gfy9GfLtu6P3HycqsGRQwqyogFw
         VongwTlv21NIB6nDracDVAeVIh+VUZJsm87ZJappyipcXnYAVg2Qh02XPpdw8iiJqopU
         qY7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=cPUg6Q95DL8NV4y71GhAY/ww78q1UpeJPCQwYj3WZW4=;
        fh=aHw1vE/INPf/OjGEJ6dHmhuLEgAXOxeG1erzrFhWuKk=;
        b=HTIHYQAyyhP3FkcDgBJW65Y5r9wDDG0PDlcXYkboGeANjhxHvhQTF2nzw9JZUEFcTu
         mY5oc778FDJ+OLPkX8i19pwHpRuNXI3sHBRbajEJ+Ru9Cj0yXw+liG/dFExlcXRijF/a
         J1R1CmScF/+IntuoNqKtL23dEavaQzSH0nfbbQIUj0QHtgxlmbDP4UaPPgR8VdTpSulj
         OSm0G5OvxoZjYyun0q0xQy6sfoQ5+ZDt3ZLMtQYSrIDPSO/cpWOGE0tE9oJj5x8KSTEx
         G8UGpoxUIZsl934R9drc6DE8IiQOtVdwWGHdOblZXh+qZGJyBlH6wIk0/f7BAzeSFx7u
         rX0w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1774280275; x=1774885075; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=cPUg6Q95DL8NV4y71GhAY/ww78q1UpeJPCQwYj3WZW4=;
        b=Pj5+mKyk0+ZHSHNlDjsM/i9D2ybR3FS9bFhk/wwSr+qYlby1+u5lFUhtD7ELmHlSIa
         8Qzhvoc2iFOOFmemqAzX1Hm+Nn6Kgis8GznC53ZigVktIdp9ED+KzEdFxnSy97yHZmwH
         tQ6y/3BhgrwcLQT+j8OM7ggzIvl41yCMXONmQNoxf/Ngub7BO5fstEaYoEbH5IaLoQIN
         JXmZ4wTYb2wyIoxNwO4i0Jm9W6sGOM+lDseyuSbGAc9cnD46yuVEwWCLsMnWhO0g2ZxY
         ZKq5jV1yRXYC1KMpbUZfAGzzPw82lFhGK1dmhwL8w0vKN5gph2VAv9NR+YU59is42ocf
         GXtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774280275; x=1774885075;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cPUg6Q95DL8NV4y71GhAY/ww78q1UpeJPCQwYj3WZW4=;
        b=TxQStRfbQCovQ7Ajl4ZjxspGFP1/lr20DdOfgDdR94YK5dCCqaPFg05vQ1SklBdaYx
         yKYnaRe6CpVA0kGKldms0vibq9DS4MnSW9mWo/7HeI0+5LPPjD2HpUH+C1vftEC7RvPB
         I1c4iIyxbX442ybwwjQTiDUAt8yTiRigIKRnP93kN1/noxI2N3fL+X5Xd0x8Q13JAKsr
         As0fXM8uqWWy6YRlo/edZ6FtDBLtVYOsPiJwy+Wv3aIRKv8OfqKshQWM5dC8R1t+4hBS
         P72xDVuKGZFzO+ryAfcKGR7WiF2NVMe7+n95z82DILBbyspX5Q8CSiJE77Ljncx+fwbR
         hDSA==
X-Forwarded-Encrypted: i=1; AJvYcCVl18GGsiFtcHF0oRN0axvIqxc8FNgXwoNaN/sxXNx3z9tn7yQZdDLy/Ufh4dz+NWZHhGfPuNM7yp3wdw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yys5LpQSr6cz54OcQBOsEF6LhqSrnY2RpUJBZaKEOAL5VU3Beck
	4ko9Lhzhqb/QZOmxUBOuoe47zqAM4AjZh1NStbsGo8fXgFRLgUyWKqBlt5//Z9WkxkdnthzJ9SG
	S/GKCnLt4F4+yDck8qzLnwNfc/23jmUoU9WK7iaMKRw==
X-Gm-Gg: ATEYQzyz14aFacrla+ISkzTY6y4M2R3dOmg/l2x+t423q+KOW14zjZ9LuT4AEcVqKf2
	03rgz4C+ZktgT4Nl2IgYfZ25mtl5vtWMmsCixE0HHh7zhUNjcHC+kkMipekS5ByJhc9l0kfm+A5
	l2B+c1JG0CDvzOiFtpwCGIMjXdjKiDUu0aZ1bEndDEzBuIpbCt+/HlMhAQv9YURFpoIPOarlGom
	Y+2EVc0l5hvURt4PdzjibjgWRDftATU7n8GmX8RThNP3ypAVuGrAvLMBdLWwQStXOA0S5+RtgB4
	iz6kM+TXSXi6szH+l3OeXImkVkRzJ/2fEaZ4oIs=
X-Received: by 2002:a53:e031:0:b0:64e:7311:eb85 with SMTP id
 956f58d0204a3-64ed7916779mr14985d50.24.1774280274611; Mon, 23 Mar 2026
 08:37:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260322135348.11339-1-surajsonawane0215@gmail.com>
In-Reply-To: <20260322135348.11339-1-surajsonawane0215@gmail.com>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Mon, 23 Mar 2026 15:37:37 +0000
X-Gm-Features: AQROBzAbDpd6RhrVm1H8H0pT4OlirwzVY_OTpC_XPzSIAOxZNSgcMEmVW-yO5U4
Message-ID: <CAPY8ntAKzB42sNzW+FV283rHktD3OEE9cePS4Dg1iihJtB3nyA@mail.gmail.com>
Subject: Re: [PATCH] media: i2c: ov5647: handle V4L2_CID_LINK_FREQ in s_ctrl
To: Suraj Sonawane <surajsonawane0215@gmail.com>
Cc: Jacopo Mondi <jacopo@jmondi.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[raspberrypi.com,reject];
	R_DKIM_ALLOW(-0.20)[raspberrypi.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-56750-lists,linux-media=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dave.stevenson@raspberrypi.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[raspberrypi.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,mail.gmail.com:mid,raspberrypi.com:dkim]
X-Rspamd-Queue-Id: BB05D2F71C3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Suraj

On Sun, 22 Mar 2026 at 13:59, Suraj Sonawane
<surajsonawane0215@gmail.com> wrote:
>
> Handle V4L2_CID_LINK_FREQ in ov5647_s_ctrl().
>
> Currently this control is defined but not handled in s_ctrl(),
> so V4L2 falls back to estimating link frequency from pixel rate
> and prints warning like:
>
>   v4l2_get_link_freq: Link frequency estimated using pixel rate:
>   result might be inaccurate
>   v4l2_get_link_freq: Consider implementing support for V4L2_CID_LINK_FREQ
>   in the transmitter driver
>
> Handle it as no-op since link frequency is fixed per mode and
> not meant to be changed at runtime.

I'm confused by this description compared to the patch.

v4l2_get_link_freq searches for the V4L2_CID_LINK_FREQ control, and if
found then it calls g_ctrl (not s_ctrl).
If it can't find the control then it searches for V4L2_CID_PIXEL_RATE
and will log the error message quoted.

The control is registered by the ov5647 driver, therefore it should
never go into that second clause, so how have you got that error
message logged?

AFAIK no part of that code path will result in a call to ov5647_s_ctrl
that you're patching.
I've just run with the ov5647 driver on a Pi5 (which uses
v4l2_get_link_freq) running 7.0.0-rc5, and I can't get an error
logged. v4l2_get_link_freq finds V4L2_CID_LINK_FREQ and uses the value
it reports.


You are right that ov5647_s_ctrl doesn't handle V4L2_CID_LINK_FREQ,
which could mean that an error is returned from the __v4l2_ctrl_s_ctrl
calls from within the driver to change the link frequency and lead to
the dev_info in the driver being logged iff the sensor was powered up
at the time (otherwise pm_runtime_get_if_in_use will fail). Generally
the sensor won't be powered on as the pad format is set before
enable_streams, and it shouldn't be possible to change it whilst
streaming.

However, as I understand it, the current preferred way to handle this
case of read only controls where the value is changed by the driver is
to pass NULL as the ops for the ctrl when registering. That is already
the case looking at c6e115144b50 ("media: i2c: ov5647: Add
V4L2_CID_LINK_FREQUENCY control"). So how are you managing to get
ov5647_s_ctrl called for control V4L2_CID_LINK_FREQ at all when it has
no s_ctrl op?

Have I totally missed something here?

  Dave

> Avoid these warnings when control is queried.
>
> Signed-off-by: Suraj Sonawane <surajsonawane0215@gmail.com>
> ---
>  drivers/media/i2c/ov5647.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/media/i2c/ov5647.c b/drivers/media/i2c/ov5647.c
> index 6a46ef723..a5a9cff5a 100644
> --- a/drivers/media/i2c/ov5647.c
> +++ b/drivers/media/i2c/ov5647.c
> @@ -999,6 +999,9 @@ static int ov5647_s_ctrl(struct v4l2_ctrl *ctrl)
>                 ret = cci_write(sensor->regmap, OV5647_REG_HTS,
>                                 sensor->mode->format.width + ctrl->val, &ret);
>                 break;
> +       case V4L2_CID_LINK_FREQ:
> +               ret = 0;
> +               break;
>         case V4L2_CID_TEST_PATTERN:
>                 ret = cci_write(sensor->regmap, OV5647_REG_ISPCTRL3D,
>                                 ov5647_test_pattern_val[ctrl->val], NULL);
> --
> 2.34.1
>

