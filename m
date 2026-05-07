Return-Path: <linux-media+bounces-60831-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qMJiKDGu/GkNSgAAu9opvQ
	(envelope-from <linux-media+bounces-60831-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 07 May 2026 17:22:25 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 215664EAEF2
	for <lists+linux-media@lfdr.de>; Thu, 07 May 2026 17:22:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B0B50300E3C4
	for <lists+linux-media@lfdr.de>; Thu,  7 May 2026 15:22:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56CC942EED1;
	Thu,  7 May 2026 15:22:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="O/535ZfZ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D67E3ED12B
	for <linux-media@vger.kernel.org>; Thu,  7 May 2026 15:22:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778167337; cv=pass; b=J+zcVGdq5xCOaWHAxUy4aoyp4R5mX8NviHE2508CTamxkbelGuN0JzfTA7+fk5nZbjHjf/+4niVba8ILmgoa/urN548GzlsxnGKdV27KHKntEpBFUuunrG1V8r11HNO9v1ZrDbcMIK4gOuJ0ZXBS5sf2Z2118167mFJPMGAYfag=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778167337; c=relaxed/simple;
	bh=qk3B6x7RwXBT+9WjDuhL5HM1eQcvGA54Xq+g9RLd7QM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=p133StH6Op5QcpguFt2NJG7Hc4PvKO5r9KEfafSpwZAcJj1N1zGr0ztlKGBqYk7KQ4CP12TqUBTdboCOO6b5SOGdsRhHmDCvzQ2BJNCLzTFIvP2fC7ufHeNb9nHelJpWe6OKWZVWimQO7ygTK5mKmtE7QwgWwELOssUHDOSGT7o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=O/535ZfZ; arc=pass smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-79a535e7c00so11843347b3.3
        for <linux-media@vger.kernel.org>; Thu, 07 May 2026 08:22:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778167335; cv=none;
        d=google.com; s=arc-20240605;
        b=ERjlb0fz3SgCSMaWBpyk/INnivJLqW9NRjT5MhuHP7LbOVlUcHA4sri9/2Ta3rEOi9
         4eDCcVz9p/zJi6WOv5hxVOFdxCe7eBrmxr0lQTFjX9JFCAqg8PQwDcwCBP6L4CBLN7WW
         teVAKiydwbRzqqCx045IHiBEX2a7ybhOpMkbBacEDvGyLt5EE9XmjdHsiDP90HRXF3DX
         tcteRfx/3rT5sHDLB0jjph2I+icgZSlwPiUiPnBN/oQGnV3QPDHhxM8kF11kWZjJwj4P
         gAd6OrvI9cyINJX0F+GQ8pySYd7R08NNtZFiZbPYROG+Fox85PZ9TQp+BYo6jbEni7gM
         cH5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=0tgovNQZ6tf7aljtc1gHD8qdjoMmQrXrksXNmY7C50A=;
        fh=KTk+qJmALp2vvvuDh0aOANPNVszbkuM6ql9zr4bWkBQ=;
        b=hlwqfCIXuPpfu8cJimMmFv7aR7WxNvm1nW3GA6W4vGqgiljao/0rdnMo1JUfj+gbFR
         jBfSAIhZNkrBGuHKaP2+8miWzCqjKjY2k/bCWkEtWtSww6qQXf5YPOAd/I9WR5YTXoQI
         2nHFPstVwNwNj+Af9bh1fcY8twK9egrC2yqJ/CsLBArypS8zgr0MyqKm1Zc3aB6rE5y7
         IKSZTsORpz60ckuYp0n/1MGQftknhc/XRLHZ3H8J+NVaelHk29zD7Z1SnPRcqewdx6RW
         TGCL+VWUY4Fy1yi+kDqKkmK0cw8ToFmPcD5XG0uTditax7VzR5h43jtSczdCOdzOmTMg
         4m/g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1778167335; x=1778772135; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=0tgovNQZ6tf7aljtc1gHD8qdjoMmQrXrksXNmY7C50A=;
        b=O/535ZfZ/LDsnLsb8Irj4IMjVMBIVOWk7DAwS9g567gZVNv6hn5BgPoGCI/E9WwLrF
         aXeiM5dWb+fPON5Lu8BrEufezFVvMf5J4YM/44SgmHwbU7OwmEU1C24bDhE+HuhEyoep
         7xyc9G3ewGvaU25B+sIh5H7zt1kE4dgmriGmLiUVtMZyFz5W0fjAWBn0m0OzgZwQfmsq
         2JRPV17bUCWIQi78mxdxyg7ULjVzoFkyWmBb0uPEw9yhVRsGlAofUu+E0P0cOLSwwing
         wVuLoUEihb12BNPTDU3wdzWZd5rdxneFQZHVw9iEdSp6lmtNJlKq8vsJsuDBzL3T/d+A
         f8WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778167335; x=1778772135;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0tgovNQZ6tf7aljtc1gHD8qdjoMmQrXrksXNmY7C50A=;
        b=nUBp+sdi1BCNdZ/ljTpWm8q6R6fjJZmgabFuO1COTbV61sNvNByq+I+BRN4SXXYmra
         WQdHaPspgkw81vGg0TGBukBOMETXLGJIfPpGsvfT0pHrWTT4GqopQ132MOmMITXAzDCg
         DzZ8bj+0RwcZfJSCPu7dUgaT4d+HWph6T23IxBHV7MaTRXSgBlRoB9K88Hl/ijjehNI8
         E/HPDrrFcWHC7WaAYdBAcruJp9xhMIPvGyn9hLB9Mu47XtR2D8a93KSnNJXZKtpatVmF
         TXBh6dxEDJ4KIH7BHjRGmddKa348iUusHSXveIJPkV07Avg7211ZL9phvYIlMlsJ/IRR
         KUnA==
X-Forwarded-Encrypted: i=1; AFNElJ/vc2WZf/3s19vP0VOjVNRmD9J8lbV0+hbHhO4nYGFFCdRjA0RYDhpoaoim5cQN8/YoKAJpEfeE8A3JcA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyXtxx5aCV+YIBg8ETBuLP20dT78SwKEUMVYrQCRHxYznF2ofVD
	k6JNoBz7gjzvWlFcbeIxQJWlsoV6u9AF/jmvmUlYiP3WjVO9djTAq8uq3zIbSFqZSc+MgzoggVb
	zaWkoIm5tLGBWwVsrb/he0fj1bnuN1aLPxysKeHpYog==
X-Gm-Gg: Acq92OH3r8QmlRS3viDClmcMTzbeSK5FILuXEFAwvZDNV2ALQJGjcQNFQs8ZsS8QgCQ
	VP1DWEIAowbE9mjZMvqGL8Sc/A50sjs1OD3fTyYY8C7y5eS0fr6SnHqfExyiFEW0WQSRDNG6C3L
	djASKeIiC+uXU6a/TPCBAj3i+iXLMWxJqUxhu6qONrPt30hiC8QzVgJBNr/DRzEFAOANcuehUQG
	nL6iVthBYmqkUha3tzxbBtCm14YgCQF0rURV8/XUT/hk5uuXpF64CxXP3xr1zIJQQagL2m6Wv7V
	ljMPle+GE+Z2LCp9vKdaBLE0oQSPaawgZcqUSoDbZVnpcvzEPk1i81Eu2HHRU+fJjGPJ+l4nK22
	UxnC+wy+qvfBeyyQr2eDi0KQOcFme27k6DfA=
X-Received: by 2002:a05:690c:9:b0:7bb:712:a755 with SMTP id
 00721157ae682-7bdf5d6b898mr96910397b3.7.1778167335090; Thu, 07 May 2026
 08:22:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260506-media-imx355-v1-0-660685030455@raspberrypi.com>
 <20260506-media-imx355-v1-9-660685030455@raspberrypi.com> <afyhY2WmfjZ2OxrY@zed>
In-Reply-To: <afyhY2WmfjZ2OxrY@zed>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 7 May 2026 16:21:57 +0100
X-Gm-Features: AVHnY4L_MK_F3jFHW4IjEwBiSrTXhO3wFJq7jfDq1jANSJTPOr3kSwMsOljR9LI
Message-ID: <CAPY8ntBA1n6=mJeE6k1FXnsbbAfsUsDb2w7stGjCnZvvkLABeg@mail.gmail.com>
Subject: Re: [PATCH 09/13] media: imx355: Remove redundant fll_min, and
 implement fixed offset
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, David Heidelberg <david@ixit.cz>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: 215664EAEF2
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[raspberrypi.com,reject];
	R_DKIM_ALLOW(-0.20)[raspberrypi.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-60831-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dave.stevenson@raspberrypi.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[raspberrypi.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,raspberrypi.com:email,raspberrypi.com:dkim,ideasonboard.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Action: no action

Hi Jacopo

On Thu, 7 May 2026 at 15:29, Jacopo Mondi <jacopo.mondi@ideasonboard.com> wrote:
>
> Hi Dave
>
> On Wed, May 06, 2026 at 07:23:47PM +0100, Dave Stevenson wrote:
> > fll_min (Frame Length Lines) is set to the same value as fll_def
> > for all modes, which makes it redundant.
> >
> > The actual value is also erroneous as sensor works in all the
> > defined modes with FLL set at the mode height + 20 lines, so
> > set the vblank control minimum to 20 rather than varying it.
> > This also improves the maximum frame rate achievable.
> >
> > Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> > ---
> >  drivers/media/i2c/imx355.c | 27 +++++----------------------
> >  1 file changed, 5 insertions(+), 22 deletions(-)
> >
> > diff --git a/drivers/media/i2c/imx355.c b/drivers/media/i2c/imx355.c
> > index 12005bc40f36..5a3bfcd0f51c 100644
> > --- a/drivers/media/i2c/imx355.c
> > +++ b/drivers/media/i2c/imx355.c
> > @@ -33,6 +33,8 @@
> >  /* V_TIMING internal */
> >  #define IMX355_REG_FLL                       0x0340
> >  #define IMX355_FLL_MAX                       0xffff
> > +/* Number of lines above frame height that are required. */
> > +#define IMX355_FLL_OFFSET            20
>
> I would have called it FFL_MIN, but it's probably just a matter of
> taste

It's not the minimum value for the FFL register though as that
includes the image height.
It could be IMX355_VBLANK_MIN if preferred.

  Dave

> Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
>
> >
> >  #define IMX355_REG_LLP                       0x0342
> >  #define IMX355_LLP_MAX                       0xffff
> > @@ -105,7 +107,6 @@ struct imx355_mode {
> >
> >       /* V-timing */
> >       u32 fll_def;
> > -     u32 fll_min;
> >
> >       /* H-timing */
> >       u32 llp;
> > @@ -360,7 +361,6 @@ static const struct imx355_mode supported_modes[] = {
> >               .width = 3280,
> >               .height = 2464,
> >               .fll_def = 2615,
> > -             .fll_min = 2615,
> >               .llp = 3672,
> >               .reg_list = {
> >                       .num_of_regs = ARRAY_SIZE(mode_3280x2464_regs),
> > @@ -376,7 +376,6 @@ static const struct imx355_mode supported_modes[] = {
> >               .width = 3268,
> >               .height = 2448,
> >               .fll_def = 2615,
> > -             .fll_min = 2615,
> >               .llp = 3672,
> >               .reg_list = {
> >                       .num_of_regs = ARRAY_SIZE(mode_3268x2448_regs),
> > @@ -392,7 +391,6 @@ static const struct imx355_mode supported_modes[] = {
> >               .width = 3264,
> >               .height = 2448,
> >               .fll_def = 2615,
> > -             .fll_min = 2615,
> >               .llp = 3672,
> >               .reg_list = {
> >                       .num_of_regs = ARRAY_SIZE(mode_3264x2448_regs),
> > @@ -408,7 +406,6 @@ static const struct imx355_mode supported_modes[] = {
> >               .width = 1940,
> >               .height = 1096,
> >               .fll_def = 1306,
> > -             .fll_min = 1306,
> >               .llp = 3672,
> >               .reg_list = {
> >                       .num_of_regs = ARRAY_SIZE(mode_1940x1096_regs),
> > @@ -424,7 +421,6 @@ static const struct imx355_mode supported_modes[] = {
> >               .width = 1936,
> >               .height = 1096,
> >               .fll_def = 1306,
> > -             .fll_min = 1306,
> >               .llp = 3672,
> >               .reg_list = {
> >                       .num_of_regs = ARRAY_SIZE(mode_1936x1096_regs),
> > @@ -440,7 +436,6 @@ static const struct imx355_mode supported_modes[] = {
> >               .width = 1924,
> >               .height = 1080,
> >               .fll_def = 1306,
> > -             .fll_min = 1306,
> >               .llp = 3672,
> >               .reg_list = {
> >                       .num_of_regs = ARRAY_SIZE(mode_1924x1080_regs),
> > @@ -456,7 +451,6 @@ static const struct imx355_mode supported_modes[] = {
> >               .width = 1920,
> >               .height = 1080,
> >               .fll_def = 1306,
> > -             .fll_min = 1306,
> >               .llp = 3672,
> >               .reg_list = {
> >                       .num_of_regs = ARRAY_SIZE(mode_1920x1080_regs),
> > @@ -472,7 +466,6 @@ static const struct imx355_mode supported_modes[] = {
> >               .width = 1640,
> >               .height = 1232,
> >               .fll_def = 1306,
> > -             .fll_min = 1306,
> >               .llp = 1836,
> >               .reg_list = {
> >                       .num_of_regs = ARRAY_SIZE(mode_1640x1232_regs),
> > @@ -488,7 +481,6 @@ static const struct imx355_mode supported_modes[] = {
> >               .width = 1640,
> >               .height = 922,
> >               .fll_def = 1306,
> > -             .fll_min = 1306,
> >               .llp = 1836,
> >               .reg_list = {
> >                       .num_of_regs = ARRAY_SIZE(mode_1640x922_regs),
> > @@ -504,7 +496,6 @@ static const struct imx355_mode supported_modes[] = {
> >               .width = 1300,
> >               .height = 736,
> >               .fll_def = 1306,
> > -             .fll_min = 1306,
> >               .llp = 1836,
> >               .reg_list = {
> >                       .num_of_regs = ARRAY_SIZE(mode_1300x736_regs),
> > @@ -520,7 +511,6 @@ static const struct imx355_mode supported_modes[] = {
> >               .width = 1296,
> >               .height = 736,
> >               .fll_def = 1306,
> > -             .fll_min = 1306,
> >               .llp = 1836,
> >               .reg_list = {
> >                       .num_of_regs = ARRAY_SIZE(mode_1296x736_regs),
> > @@ -536,7 +526,6 @@ static const struct imx355_mode supported_modes[] = {
> >               .width = 1284,
> >               .height = 720,
> >               .fll_def = 1306,
> > -             .fll_min = 1306,
> >               .llp = 1836,
> >               .reg_list = {
> >                       .num_of_regs = ARRAY_SIZE(mode_1284x720_regs),
> > @@ -552,7 +541,6 @@ static const struct imx355_mode supported_modes[] = {
> >               .width = 1280,
> >               .height = 720,
> >               .fll_def = 1306,
> > -             .fll_min = 1306,
> >               .llp = 1836,
> >               .reg_list = {
> >                       .num_of_regs = ARRAY_SIZE(mode_1280x720_regs),
> > @@ -568,7 +556,6 @@ static const struct imx355_mode supported_modes[] = {
> >               .width = 820,
> >               .height = 616,
> >               .fll_def = 652,
> > -             .fll_min = 652,
> >               .llp = 3672,
> >               .reg_list = {
> >                       .num_of_regs = ARRAY_SIZE(mode_820x616_regs),
> > @@ -857,7 +844,6 @@ imx355_set_pad_format(struct v4l2_subdev *sd,
> >       const struct imx355_mode *mode;
> >       struct v4l2_mbus_framefmt *framefmt;
> >       s32 vblank_def;
> > -     s32 vblank_min;
> >       s64 h_blank;
> >       u32 height;
> >
> > @@ -882,10 +868,9 @@ imx355_set_pad_format(struct v4l2_subdev *sd,
> >               /* Update limits and set FPS to default */
> >               height = imx355->cur_mode->height;
> >               vblank_def = imx355->cur_mode->fll_def - height;
> > -             vblank_min = imx355->cur_mode->fll_min - height;
> >               height = IMX355_FLL_MAX - height;
>
> re-using 'height' here is not nice, but I understand it was there
> already
>
> > -             __v4l2_ctrl_modify_range(imx355->vblank, vblank_min, height, 1,
> > -                                      vblank_def);
> > +             __v4l2_ctrl_modify_range(imx355->vblank, IMX355_FLL_OFFSET,
> > +                                      height, 1, vblank_def);
> >               __v4l2_ctrl_s_ctrl(imx355->vblank, vblank_def);
> >               h_blank = mode->llp - imx355->cur_mode->width;
> >               /*
> > @@ -1146,7 +1131,6 @@ static int imx355_init_controls(struct imx355 *imx355)
> >       struct v4l2_ctrl_handler *ctrl_hdlr;
> >       s64 exposure_max;
> >       s64 vblank_def;
> > -     s64 vblank_min;
> >       s64 hblank;
> >       u64 pixel_rate;
> >       const struct imx355_mode *mode;
> > @@ -1176,9 +1160,8 @@ static int imx355_init_controls(struct imx355 *imx355)
> >       /* Initialize vblank/hblank/exposure parameters based on current mode */
> >       mode = imx355->cur_mode;
> >       vblank_def = mode->fll_def - mode->height;
> > -     vblank_min = mode->fll_min - mode->height;
> >       imx355->vblank = v4l2_ctrl_new_std(ctrl_hdlr, &imx355_ctrl_ops,
> > -                                        V4L2_CID_VBLANK, vblank_min,
> > +                                        V4L2_CID_VBLANK, IMX355_FLL_OFFSET,
> >                                          IMX355_FLL_MAX - mode->height,
> >                                          1, vblank_def);
> >
> >
> > --
> > 2.34.1
> >
> >

