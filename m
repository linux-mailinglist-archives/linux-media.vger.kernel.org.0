Return-Path: <linux-media+bounces-56099-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aLNVB+x4uWnQGQIAu9opvQ
	(envelope-from <linux-media+bounces-56099-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 16:53:16 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B890E2AD56D
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 16:53:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4F1B130CA947
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 15:52:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7EDE2D46A1;
	Tue, 17 Mar 2026 15:52:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="ccvSKwg4"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yx1-f42.google.com (mail-yx1-f42.google.com [74.125.224.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 300842D593E
	for <linux-media@vger.kernel.org>; Tue, 17 Mar 2026 15:52:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773762749; cv=pass; b=BBHe5v4z/0Ddi6fn18YmlmLpyFXZCwjENx/GTnY9JRQfH/81jDL44flLSzskMG2q/BzpHr/3ifIgriRO7yRaFzfan0fivAwSWrEjrlk7H46A3vcUodNm4OLDrE2RIK1GCOyvXrF9W+nU93SUr1F4gZtC/St6vJAhcOhgYTZouX8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773762749; c=relaxed/simple;
	bh=6OxqeyKBaIICqgKj1cmgQHPL50VHasHMsjVgG+cyUoA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IqHJLwHKS1XI5R4zq7pKRiMkSL13eKAMOumTRRc1YPHFZGFbSfeQddfM7518pGK77SjgE4n7UZHoNVMlrCKJVwglQLr9cYcPgoMi5PtOSicgI3KMr85kcYMbXscf5tsjdfsflZXTc4HNR63trSV30khOA12llVjey0qMsMUCP/U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=ccvSKwg4; arc=pass smtp.client-ip=74.125.224.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Received: by mail-yx1-f42.google.com with SMTP id 956f58d0204a3-64ae222d87dso5469467d50.2
        for <linux-media@vger.kernel.org>; Tue, 17 Mar 2026 08:52:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773762746; cv=none;
        d=google.com; s=arc-20240605;
        b=GnQofq+kAQSZPN89ySFDKtArsqoBtFg/Fi2wLEbZJCaPTkyDd/NzsgzSXr3/KFBB6X
         NdmODxa6sc7wjtbKOSubOIDS8q5OxzKAk+MHgUIK8sVyV2YLhaTkcU08BFE2etyiFBnj
         92ONh0fjAaLD1Qy6Cveb+eeVd0cGC8hbYYm4F14dTCgGAybAkJebqvOM2uZ4tSJ2FdxS
         H8WUrdi+iKm+yB968lRULZ18cYL90wfGILWUN0SEHceWGLmSm7O9Wc5ZupvAMWRAvxDY
         0xw+P++GqtaoXWjWgK1L4T/inOo6suk+hthPQAEdqzZ2UWvJx7xqcnI0t9aPL29ik+SC
         Q6lQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=xWOba+wwzwLOr6/8lB5VON9f6bR8lPOgvlBWpxZ52Z0=;
        fh=K2lq50AO7T2eCKwteKU41qTo3+z/9mxzcWJx+yOqnHc=;
        b=RkKQNN9EADV5JvHm4VoVODWRmiw/2gg+lQH76trHtNPHNvyFly0zYrTiLhQf0qtZVu
         u/UhEhH740zAsImUXliakdWmPCFCXgTEWUqGMv8mbDRpCfmR3SnP+rIbDfEHwRDBVvh/
         35f2Uj9G5xKOMvwUKF28spzQSM14cYuizctjdaJFMXZHsaqfM1+nIl9FDxR1nORbK3TW
         nG0dPYUm2RM5QZ4KTWZ6BhxQsWfHQLqECFg/r0YVfTdRjKp/FNqlp50ekVeIKW5VHV+X
         Ich4MneJmxDK8ttzRzzKT/6SFm3duj9tMlVrrKvF3xFy96B8IE+lVPAqQa3o4rFmAx/M
         sWmQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1773762746; x=1774367546; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=xWOba+wwzwLOr6/8lB5VON9f6bR8lPOgvlBWpxZ52Z0=;
        b=ccvSKwg4HzVlit44/twQQ80HlWw87czok3ovPF1ndW+0iitJMmF3gAZwawcbgimT/o
         n4VEpY6ChoJbixdaNTemgOp2bA1292RBSyTFMDoYfU2LrdaiBJgQTx5xMwGbYWqK6OnY
         72Iz2t8G1jpS+OiF9H71LPg19ihF2aZclChOKm7gDyZG+KkwvxMGIlybfcqlf+nH9CwK
         u92pUl248oF5WnJAZLvnwIL+J7UVWTYPe0Swnp1ZQRAPY7JQdFriNuBV6Evbaym6mBgC
         9c0P2mtJLIXWEmY9ytYZODThLZwYXbpHp5p8wJJewvsy+XP1Ckd7Fl0bieYL1n67ZqKW
         jBHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773762746; x=1774367546;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xWOba+wwzwLOr6/8lB5VON9f6bR8lPOgvlBWpxZ52Z0=;
        b=ATQ3tUYWUuA3lMdg+kq5dkwaxr0ZqC6rSUmO71hC6Nj26kVwJWqX1YhusJllsSntyS
         Y5PTS0oQ1rHzPFV5Igf/7F9ItZqNgY+YX7Y3EKfge9O8QR9Ghjfc42ecWjBvNBfcTbYm
         R8LR9ZGcAilrAQVDHJsRfzbYSD33GVnDZn0v49LVaHhHwXbNt+x6MO7gLM9cXLfKoKlR
         7ro5vWHRLg+RS55r2/QYLODL9KUzfypT8Zjzj8fXR9rYahjqFGaPGSRmBYkzLdRR58LB
         /vkJdMHIXs+70G2xDAKmEo+FwqcOh+Tqo5XrqL7jgcCPHgjC6ub7CZlQUzeo7X9ZNUFt
         1M6A==
X-Gm-Message-State: AOJu0Yw5z5G6MZRkQf5bEwC60SZV+bf1+zs91sYcMFsDNA0OLr6YoWLb
	jJWaZqanNoLMm/g8zW83KhsvF0SzTTqYY61Y+ZUaQQRo4Ehtt2hISP+GlCGkgkt2imZwDl3BC/H
	iCrSH7l0Gf9k+y9c9JTxr4Lpe+uKnH2MghuvkOy5D0w==
X-Gm-Gg: ATEYQzxksz+Asre52SGiZgpYQzr9j0gADlJWcW1Whv/EZHST9OYVlnMRwUfQ5AbBA1F
	p4QcLu/HcCbiHKfzCXqxXCoHFou/0p+gNVGa9RX2hvPgehhWkIjONdRZ9e/9+t0SbXsbxbELhsj
	u3wsI+NrehPrCofYJ7VE/31ThCyNSPc+0QU3EmmGVquW2Zo5sgDLYodAtx2bLq9VK/V4kpjAap6
	Ty1SGEkgD3FOaOlgCPGZzp0WJOqQUpp6+oqEf8MSLBQE9usdw76qzUf22iesqWWqXPQiNFbXeb9
	04pCZB34UTlX75368eRFdF22KwLlWllcqpN9xsc=
X-Received: by 2002:a05:690e:144c:b0:64c:4f97:e8b0 with SMTP id
 956f58d0204a3-64e915dc474mr145258d50.61.1773762745884; Tue, 17 Mar 2026
 08:52:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260312150437.1091195-1-eagle.alexander923@gmail.com>
 <20260312150437.1091195-3-eagle.alexander923@gmail.com> <CAPY8ntAf9TjgW-E6WeJuMdsHy8pV8-CvqQJriWEFpgLB-brD5A@mail.gmail.com>
 <CAP1tNvRMoHteLcjjGbEFcp_8JRALC7mQM6efHyTrgvrZFfiByA@mail.gmail.com>
In-Reply-To: <CAP1tNvRMoHteLcjjGbEFcp_8JRALC7mQM6efHyTrgvrZFfiByA@mail.gmail.com>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Tue, 17 Mar 2026 15:52:09 +0000
X-Gm-Features: AaiRm50L_KLDOLoSffajcnLGX2yYxGpeTEO1YhHeOHbjBcaYCHEyII6i_Ilt_rM
Message-ID: <CAPY8ntAcKW70adZuGK5LdWn3pmzM0TXRyMvuCzioYUe9usG8iQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] media: i2c: Add driver for Sony IMX662 sensor
To: Alexander Shiyan <eagle.alexander923@gmail.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Hans Verkuil <hverkuil@kernel.org>, 
	Hans de Goede <hansg@kernel.org>, Tetsuya Nomura <tetsuya.nomura@soho-enterprise.com>, 
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[raspberrypi.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[raspberrypi.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-56099-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dave.stevenson@raspberrypi.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[raspberrypi.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,raspberrypi.com:dkim,raspberrypi.com:url]
X-Rspamd-Queue-Id: B890E2AD56D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Alexander

On Fri, 13 Mar 2026 at 07:55, Alexander Shiyan
<eagle.alexander923@gmail.com> wrote:
>
> Hello, Dave.
>
> > > This patch adds a V4L2 subdevice driver for the Sony IMX662 CMOS image
> > > sensor. The sensor has a native resolution of 1936x1100 (effective
> > > 1920x1080) and can achieve up to 90 frames per second depending on
> > > the configuration. The driver supports:
> > > - MIPI CSI-2 with 2 or 4 data lanes.
> > > - RAW10 and RAW12 formats (both colour and monochrome).
> > > - Controls: exposure, analogue gain, horizontal/vertical blanking,
> > >   horizontal/vertical flip, brightness.
> > > - A placeholder V4L2_CID_HDR_SENSOR_MODE control for future Clear HDR
> > >   support (the actual HDR modes are not yet implemented).
> > > - Runtime PM.
> > > - Cropping via the selection API.
> > > - Multiple link frequencies selectable via device tree.
> > >
> > > Tested on ARM64 Rockchip RK3568 platform with a 24 MHz external clock
> > > and various link frequencies.
> >
> > Interesting timing as I've been looking at IMX662 too, but on a Raspberry Pi.
> > FWIW my driver is at
> > https://github.com/6by9/linux/blob/rpi-6.12.y-imx662/drivers/media/i2c/imx662.c
> >
> > Comments are based on brief testing and reading of the code. This is
> > not a full review.
> >
> > > Signed-off-by: Alexander Shiyan <eagle.alexander923@gmail.com>
> ...
> > > diff --git a/drivers/media/i2c/imx662.c b/drivers/media/i2c/imx662.c
> > > new file mode 100644
> > > index 000000000000..d7be17b5a47d
> > > --- /dev/null
> > > +++ b/drivers/media/i2c/imx662.c
> ...
> > > +static int imx662_set_gain(struct imx662 *imx662, u32 value)
> > > +{
> > > +       int ret = 0;
> > > +
> > > +       if (imx662->hdr == IMX662_HDR_OFF) {
> > > +               bool useHGC = value >= IMX662_ANA_GAIN_HCG_MIN;
> > > +
> > > +               cci_write(imx662->regmap, IMX662_REGHOLD, 1, &ret);
> > > +               cci_write(imx662->regmap, IMX662_GAIN, value, &ret);
> > > +               cci_write(imx662->regmap, IMX662_FDG_SEL0,
> > > +                         useHGC ? IMX662_FDG_SEL0_HCG : IMX662_FDG_SEL0_LCG,
> > > +                         &ret);
> >
> > IIRC HCG adds in another 12dB or something of gain. Automatically
> > enabling it above a value of 0x22 means that the gain response isn't
> > consistent with a band of gains that can't be achieved.
> > Running libcamera with this driver I get significant oscillation as
> > HCG gets turned on and off. Fix useHGC = 0 and the exposure and gain
> > control is stable.
> > AIUI Use of HCG should be a separate control if it is to be used.
>
> Thanks for the feedback.
>
> I haven't found any mention of a 12 dB value or any other specific gain value
> when enabling LCG/HCG in the datasheet or application notes.

I've had previous conversations regarding HCG on imx290/imx462. Whilst
I've never found exact details in the datasheet or associated docs,
Nomura-san has commented on our forums[1] that on those sensors it
adds x5.8 of gain. I'd expect it to be in a similar ballpark for this
sensor. Enabling it automatically certainly makes a step change in the
gain response though.

[1] https://forums.raspberrypi.com/viewtopic.php?p=2186273#p2186273

> I agree it would
> be more correct to use a separate user control here, as is done in the
> driver that
> Tetsuya Nomura referred to in his email. (It's strange that his email
> didn't make it
> to the mailing list.)

It did - https://lore.kernel.org/linux-media/00ea01dcb286$d14e6590$73eb30b0$@soho-enterprise.com/

Will's IMX585 driver which adds the V4L2_CID_IMX585_HCG_GAIN control
isn't merged, but the principle of a V4L2 control for HCG would be
nice. I resorted to a module parameter to enable it.

> ...
> > > +static void imx662_set_link_limits(struct imx662 *imx662)
> > > +{
> > > +       u64 pixel_rate;
> > > +
> > > +       pixel_rate = imx662_link_freqs[imx662->link_freq_index] * 2;
> > > +       pixel_rate *= imx662->num_data_lanes;
> > > +       do_div(pixel_rate, imx662->format->bpp);
> > > +
> > > +       __v4l2_ctrl_s_ctrl_int64(imx662->pixel_rate, pixel_rate);
> >
> > Are you sure on this? All my testing had pixel rate being independent
> > of bit depth and number of lanes.
> > Trying your driver with 360Hz link freq / 720Mbit/s data rate on 2
> > lanes. All the computations end up with a max frame rate of 60fps in
> > 10bit mode and 50fps in 12bit, when I'm expecting a max of 30fps from
> > the datasheet.
> > Asking for 1920x1080 12bit @ 30fps via libcamera results in hblank of
> > 0 and vblank of 1003 with a pixel rate of 120000000. The actual
> > framerate achieved is 27.85fps.
> >
> > I'd found working from a pixel rate of 222750000 (INCK of 74.250*3),
> > and writing HMAX with the "normal" line length value of width+hblank
> > but divided by 3, all the numbers for line time and frame rate control
> > fall out.
> > IMX415 was similar, but some input clocks multiplied up to 72MHz
> > instead of 74.25MHz and produced a set of different link frequencies,
> > so complicated matters.
>
> I'm not entirely sure I understand the suggestion.
> Of course, having some fixed value would greatly simplify the driver,
> but it's still unclear to me where these calculations come from, and where
> does the divisor of 3 come from?
> Nevertheless, looking at the mode table, it becomes clear that the resulting
> frame rate does not depend on the CSI-2 format (10 or 12 bits),
> so apparently something needs to be changed...

I'd worked from the HMAX register value of 660 with VMAX of 1250
giving 90fps, whilst altering HMAX to 990 gives 60fps. That implies it
is a linear relationship.

V4L2 equates HMAX to (width + hblank). Whilst hblank can be negative,
trying to use 660 in computing the pixel rate would confuse matters as
there are more pixels generated than the pixel rate implies.
Multiplying 660 by 3 gives 1980 pixels per line (width=1920 and
hblank=60), which is greater than the number of active pixels and
therefore makes logical sense. All the other numbers fall out
correctly from there.

> > > +       case V4L2_CID_BRIGHTNESS:
> > > +               cci_write(imx662->regmap, IMX662_BLKLEVEL, ctrl->val, &ret);
> >
> > Setting the black level based on the brightness control isn't one I've
> > seen done on any other image sensor. It has similarities, but feels
> > very wrong.
>
> As far as I understand, V4L2_CID_BRIGHTNESS is exactly the control
> that sets an offset added to the signal. This matches the intended use for
> black level adjustment. According to the V4L2 specification,
> V4L2_CID_BLACK_LEVEL is deprecated because its functionality is covered
> by V4L2_CID_BRIGHTNESS (offset) and gain controls.
> So I believe this is the correct mapping. Am I wrong?

AFAIK No other sensor has exposed black level via V4L2_CID_BRIGHTNESS.
It's more usually used for changing the luma component on TV tuners or
other YUV video capture devices.

Very few sensors benefit from having manual control of the black
level. Seeing as there isn't a standardised mechanism for reporting
the black level, any image tuning will have been done with a reference
black level. If something (eg this control) changes that level then a
large proportion of the image tuning becomes invalid.
If V4L2_CID_BRIGHTNESS is to be used to set black level then that's a
V4L2 policy decision and so falls to Sakari or Laurent.

  Dave

