Return-Path: <linux-media+bounces-60830-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +IfaIpKt/GkNSgAAu9opvQ
	(envelope-from <linux-media+bounces-60830-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 07 May 2026 17:19:46 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 89A4E4EAE66
	for <lists+linux-media@lfdr.de>; Thu, 07 May 2026 17:19:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7883530252B8
	for <lists+linux-media@lfdr.de>; Thu,  7 May 2026 15:18:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5EFD43E488;
	Thu,  7 May 2026 15:18:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="JPc+2wWo"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B10AB2D060C
	for <linux-media@vger.kernel.org>; Thu,  7 May 2026 15:18:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778167131; cv=pass; b=IwHUYByFWpQj0xJ3Ib5+hAK1yjR2kNmGeo0162HkgdJhd05nEEWxaqNtswZ85ADP7kBBwZQS0IlM3wPeFdsIKYiKMg3grCrVqkfKYptHCfp8RoXx8hbSp51kbGi9fm7sjOsKuGoCG661V7shbNsqIglb5hXOka2wIdf/NGvwETM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778167131; c=relaxed/simple;
	bh=gQz0TyxyVnn+AHqK7P11nBWdTMq8juHaWFYiA2oL1Uo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Dd4o1TqdTCY8lUnuy8X9l76dPrRuMxRzZK54E3smsziN+khGN+j/BfWRFt0LaBCz/MgQWle/vt70IbAxGmeUs5YxgVwT/GedJp0pfj438w580/iYNaaktp25aesb5PPc7lrUGrMf0yM+G7HNBEMcUB0WN2JHbUzisSQ7VYGrTYY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=JPc+2wWo; arc=pass smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-7bdec52f48dso25998747b3.0
        for <linux-media@vger.kernel.org>; Thu, 07 May 2026 08:18:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778167129; cv=none;
        d=google.com; s=arc-20240605;
        b=dQKsvOWCv5SK0tzKXPCCKs+9Xg5+HOCvftvPuYp93Q0QaEEjVNHBDVgC+DFbTmNSC7
         IyQ6EenWPVz/rEf3cpsbNJpPXJvH/ZxaLjksTW8bLiXoJIlnosNGaPU+Vc01rfNqcdnX
         w789Lk6qLZvGA8Scxx/hucQORoy+wl7HzqUQLCoIkJfdA+IOen+KgVeMu3G12GARwYkd
         yg7mO0jMY56tdDXQ4K/1B1cA3LLLv+sQjzwZKv6n+UFWxsZRIKaSiIuI/ykFKCCty37j
         Iv3lb/Go5ktmDd5Baqy5wlArb6I2XhR1pzG0QXPjSdRkdu77GxoZvkx4Y/wbFfgbmvje
         ML2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=MCpwPps0OARJLfSyl6MCzFMqTex7S+LLtv21NFH8W2Y=;
        fh=yQbiGr8OG87nqpCnzjXjr+S4Qqk0QZhDZkHxtUbqQiE=;
        b=PRRyymmjCnEEW3MWbAN3H6sfJqqN2qI4BEp6OsA0Lul/xDA3wMZJyaiHAz8ZM0MkjI
         137CU6VIKgxuaXP70NlsTEEVYYcf16DmGiSmdLLhwWToK5YTq9TWNgudmFJI5CXjXMdl
         nOJYqRPWgZ6J1PtNSS/RwWbiyGl75XqPheaUBvHWL/wWtLDMQPz4MTPWdxGsfE8Zqe4+
         Vh3DjJgsp0CR8ECmfVm788UAShqz2nY5cVEoEh/WInY+ngoG4QSMp+VWh8ikcVrpqTnu
         nqapSt6oWTsW0I+4qMw/fM8p1o+JDbd21iEe/HGtF6+taPeK/YovDs5SP3OhnL9dlwmV
         OabA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1778167129; x=1778771929; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=MCpwPps0OARJLfSyl6MCzFMqTex7S+LLtv21NFH8W2Y=;
        b=JPc+2wWoDqgsl9qJaprmtiHVpDEejUDxvolpXzJFEpN6RqIBqfFpOaxR9KmxSxE+f2
         B74DOOaKtK4trvBWHEeHLvSdXE7qRrT8mwXNZbes/iRi+/yq8og43E8/pegrZMq8ddnE
         q8sw2dLGmD6JXanf7JFlEF5f2hIn3eJRWT+9q5So8OsbGC0fnZuu2/Je3Tb/JzhG6b1d
         4pPfrHTiS80cMTixZZa15/mnXq9MT3J6qU/g28BlZesHEWhk8vOsboxNF+8xtD2T804B
         hKlduY3AdE7XHnzbCNdj3ilznVQtiuXS/toPYYSSFMzohJpv+HCkMx4k1mSXdYkU1+IA
         E4xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778167129; x=1778771929;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MCpwPps0OARJLfSyl6MCzFMqTex7S+LLtv21NFH8W2Y=;
        b=efkoJRMDBkIEeAopy51baxZ9MLopCBOfmCfrvDZVYXqBUjhcrHSIjQHXs/Ozl4NqYX
         4o4qtAOLblNEr5A3HnnVoXZaohgZ8fvQ0Vl0kC+BhbTw0gla4HMP/01eHN56FeOA3ZVa
         szNmRBjW7KqS+pF/eE8zvACGNjMCnMyQgfqvmK36k6ypyJ7GSHgdkLIlDsmFBk3H6ZoF
         kJNBwqjAEpvOGAEajGWioauVXnQSTF61cwsK73cu+xcBEZXCUd8ocliZY3N0BQ4fozpn
         uUAJquTX6TTMkA5Kdeycc/0sbqEc+z59Jg3VHF1y6h0CLeV6hDAOrZZS2oJGElML59wc
         kdkA==
X-Forwarded-Encrypted: i=1; AFNElJ891VVooF72PBYKISPkVOVQXiSdUUNjSUoVKWCx6zT2gb7dtn1oJ7ESczrDCeqluTOJfFtryUoDs9fLcg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzN84ifIQSjpv961hOC9T3clq3pulI0pW59bRWJZ0rXK1b1heDA
	NBkX6DPH7O3NSMTb/B3y6TTKQhc5qj2el+3MQ9J9WZZHFTXkkhjB6OV2HfIRtEdeSKzYEClpe/7
	uq1g5aDEh5cpHjyCuMOgV6ZMYw1eOGTS9bZ+oD6yS/g==
X-Gm-Gg: Acq92OFlDz38uhzfeD3mpKdQ1Kshcvy37qRNfFnMnLd9F7VD4JMRX+om8tB81d7ZU6J
	fXa+hp9EFmSP51hGmaMaHKYZ5ZmdH/0My4TmY9pa9RfUgOMMY9D8I0ihvPxxBrE6s717ZlbRxSs
	vygZg+pXoAZQIR842PVCLAYm8vo6oskzNMHFjSpDlDjP9NnF82t3dr4vgvv6yY3U9tYPTmVBNBW
	GmOfoXyOVLipPZDcL+nswULLgLv8U2D4BC82Xm2tv5WAc69sjJJN50oWGeGQU+lJ/pmayJiSgcV
	HyC9PfqP+0nXokWTgbhJBv2s+7IgcsHEFJQylaLr3o2p/DTsqLPdn3udJRXyWhEfuMIarl95nh5
	gO0DDNnQhnOI5ItJKZidn+k4LV+l7gWNHWfE=
X-Received: by 2002:a05:690c:c6cb:b0:7bd:7a1c:9ae8 with SMTP id
 00721157ae682-7bf04c7906cmr17407527b3.26.1778167128634; Thu, 07 May 2026
 08:18:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260506-media-imx355-v1-0-660685030455@raspberrypi.com>
 <20260506-media-imx355-v1-5-660685030455@raspberrypi.com> <afycja3nlkEFSPeU@zed>
In-Reply-To: <afycja3nlkEFSPeU@zed>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 7 May 2026 16:18:32 +0100
X-Gm-Features: AVHnY4L2AbXIYBXgKOSf3J2G2re38BDnokJh7L7BV5HmrrOV08HB5bHPz8BfE4Q
Message-ID: <CAPY8ntAUvRiMtbSAyG6G-D+uGx3MvOW6Di0Okpyz4QUWnDfawQ@mail.gmail.com>
Subject: Re: [PATCH 05/13] media: imx355: Set register LINE_LENGTH_PCK programmatically
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Tianshu Qiu <tian.shu.qiu@intel.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, David Heidelberg <david@ixit.cz>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: 89A4E4EAE66
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[raspberrypi.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[raspberrypi.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-60830-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[raspberrypi.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dave.stevenson@raspberrypi.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[7];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ideasonboard.com:email,raspberrypi.com:email,raspberrypi.com:dkim]
X-Rspamd-Action: no action

Hi Jacopo

On Thu, 7 May 2026 at 15:09, Jacopo Mondi <jacopo.mondi@ideasonboard.com> wrote:
>
> Hi Dave
>
> On Wed, May 06, 2026 at 07:23:43PM +0100, Dave Stevenson wrote:
> > The driver already has the LLP value stored in the mode structure,
> > but also had the same value set via register writes in the mode's
> > register list. Remove this duplication.
>
> Moving stuff from register data tables to modes is .. better for sure.
> You know.. freely configurable etc etc
> But this is an improvement, so...

AFAIK there is currently no accepted way to convert a driver from
having a load of defined modes to freely configurable.
This driver already has 14 modes advertised, so how do you retain
backwards compatibility with selecting those modes via set_fmt whilst
also allowing freely configurable cropping? AIUI set_fmt is not
allowed to update the value returned from get_selection. That means
we're stuck with these modes.
I also don't currently have a datasheet for this sensor, so I don't
know what restrictions are documented with respect to cropping on this
sensor.

> Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
>
> >
> > This can't be implemented via a s_ctrl handler for V4L2_CID_HBLANK
> > as __v4l2_ctrl_handler_setup doesn't call s_ctrl for read only
> > controls.
>
> Kind of unrelated, but I wonder if imx355_set_ctrl() doesn't actually
> get called for hblank but the error simply goes ignored. The real
> solution here would be to initialize the hblank control with a NULL
> control handler.

This was partly a comment for future me as well as reviewers. I'd
expected to be able to handle it in s_ctrl and then found it didn't
work.

I believe you are right that the
__v4l2_ctrl_modify_range(imx355->hblank....) call in
imx355_set_pad_format will result in s_ctrl being called for
V4L2_CID_HBLANK, but the return value isn't checked. When min, max,
and def are all the same, it isn't going to fail. Using a NULL control
handler would tidy that up though.

 Dave

> >
> > Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> > ---
> > ---
> >  drivers/media/i2c/imx355.c | 38 ++++++++++----------------------------
> >  1 file changed, 10 insertions(+), 28 deletions(-)
> >
> > diff --git a/drivers/media/i2c/imx355.c b/drivers/media/i2c/imx355.c
> > index 589bad6c58e4..56a82f37709e 100644
> > --- a/drivers/media/i2c/imx355.c
> > +++ b/drivers/media/i2c/imx355.c
> > @@ -34,6 +34,9 @@
> >  #define IMX355_REG_FLL                       0x0340
> >  #define IMX355_FLL_MAX                       0xffff
> >
> > +#define IMX355_REG_LLP                       0x0342
> > +#define IMX355_LLP_MAX                       0xffff
> > +
> >  #define IMX355_REG_X_ADD_START               0x0344
> >  #define IMX355_REG_Y_ADD_START               0x0346
> >  #define IMX355_REG_X_ADD_END         0x0348
> > @@ -266,8 +269,6 @@ static const struct imx355_reg_list imx355_global_setting = {
> >  };
> >
> >  static const struct imx355_reg mode_3268x2448_regs[] = {
> > -     { 0x0342, 0x0e },
> > -     { 0x0343, 0x58 },
> >       { 0x0900, 0x00 },
> >       { 0x0901, 0x11 },
> >       { 0x0902, 0x00 },
> > @@ -276,8 +277,6 @@ static const struct imx355_reg mode_3268x2448_regs[] = {
> >  };
> >
> >  static const struct imx355_reg mode_3264x2448_regs[] = {
> > -     { 0x0342, 0x0e },
> > -     { 0x0343, 0x58 },
> >       { 0x0900, 0x00 },
> >       { 0x0901, 0x11 },
> >       { 0x0902, 0x00 },
> > @@ -286,8 +285,6 @@ static const struct imx355_reg mode_3264x2448_regs[] = {
> >  };
> >
> >  static const struct imx355_reg mode_3280x2464_regs[] = {
> > -     { 0x0342, 0x0e },
> > -     { 0x0343, 0x58 },
> >       { 0x0900, 0x00 },
> >       { 0x0901, 0x11 },
> >       { 0x0902, 0x00 },
> > @@ -296,8 +293,6 @@ static const struct imx355_reg mode_3280x2464_regs[] = {
> >  };
> >
> >  static const struct imx355_reg mode_1940x1096_regs[] = {
> > -     { 0x0342, 0x0e },
> > -     { 0x0343, 0x58 },
> >       { 0x0900, 0x00 },
> >       { 0x0901, 0x11 },
> >       { 0x0902, 0x00 },
> > @@ -306,8 +301,6 @@ static const struct imx355_reg mode_1940x1096_regs[] = {
> >  };
> >
> >  static const struct imx355_reg mode_1936x1096_regs[] = {
> > -     { 0x0342, 0x0e },
> > -     { 0x0343, 0x58 },
> >       { 0x0900, 0x00 },
> >       { 0x0901, 0x11 },
> >       { 0x0902, 0x00 },
> > @@ -316,8 +309,6 @@ static const struct imx355_reg mode_1936x1096_regs[] = {
> >  };
> >
> >  static const struct imx355_reg mode_1924x1080_regs[] = {
> > -     { 0x0342, 0x0e },
> > -     { 0x0343, 0x58 },
> >       { 0x0900, 0x00 },
> >       { 0x0901, 0x11 },
> >       { 0x0902, 0x00 },
> > @@ -326,8 +317,6 @@ static const struct imx355_reg mode_1924x1080_regs[] = {
> >  };
> >
> >  static const struct imx355_reg mode_1920x1080_regs[] = {
> > -     { 0x0342, 0x0e },
> > -     { 0x0343, 0x58 },
> >       { 0x0900, 0x00 },
> >       { 0x0901, 0x11 },
> >       { 0x0902, 0x00 },
> > @@ -336,8 +325,6 @@ static const struct imx355_reg mode_1920x1080_regs[] = {
> >  };
> >
> >  static const struct imx355_reg mode_1640x1232_regs[] = {
> > -     { 0x0342, 0x07 },
> > -     { 0x0343, 0x2c },
> >       { 0x0900, 0x01 },
> >       { 0x0901, 0x22 },
> >       { 0x0902, 0x00 },
> > @@ -346,8 +333,6 @@ static const struct imx355_reg mode_1640x1232_regs[] = {
> >  };
> >
> >  static const struct imx355_reg mode_1640x922_regs[] = {
> > -     { 0x0342, 0x07 },
> > -     { 0x0343, 0x2c },
> >       { 0x0900, 0x01 },
> >       { 0x0901, 0x22 },
> >       { 0x0902, 0x00 },
> > @@ -356,8 +341,6 @@ static const struct imx355_reg mode_1640x922_regs[] = {
> >  };
> >
> >  static const struct imx355_reg mode_1300x736_regs[] = {
> > -     { 0x0342, 0x07 },
> > -     { 0x0343, 0x2c },
> >       { 0x0900, 0x01 },
> >       { 0x0901, 0x22 },
> >       { 0x0902, 0x00 },
> > @@ -366,8 +349,6 @@ static const struct imx355_reg mode_1300x736_regs[] = {
> >  };
> >
> >  static const struct imx355_reg mode_1296x736_regs[] = {
> > -     { 0x0342, 0x07 },
> > -     { 0x0343, 0x2c },
> >       { 0x0900, 0x01 },
> >       { 0x0901, 0x22 },
> >       { 0x0902, 0x00 },
> > @@ -376,8 +357,6 @@ static const struct imx355_reg mode_1296x736_regs[] = {
> >  };
> >
> >  static const struct imx355_reg mode_1284x720_regs[] = {
> > -     { 0x0342, 0x07 },
> > -     { 0x0343, 0x2c },
> >       { 0x0900, 0x01 },
> >       { 0x0901, 0x22 },
> >       { 0x0902, 0x00 },
> > @@ -386,8 +365,6 @@ static const struct imx355_reg mode_1284x720_regs[] = {
> >  };
> >
> >  static const struct imx355_reg mode_1280x720_regs[] = {
> > -     { 0x0342, 0x07 },
> > -     { 0x0343, 0x2c },
> >       { 0x0900, 0x01 },
> >       { 0x0901, 0x22 },
> >       { 0x0902, 0x00 },
> > @@ -396,8 +373,6 @@ static const struct imx355_reg mode_1280x720_regs[] = {
> >  };
> >
> >  static const struct imx355_reg mode_820x616_regs[] = {
> > -     { 0x0342, 0x0e },
> > -     { 0x0343, 0x58 },
> >       { 0x0900, 0x01 },
> >       { 0x0901, 0x44 },
> >       { 0x0902, 0x00 },
> > @@ -1041,6 +1016,13 @@ static int imx355_start_streaming(struct imx355 *imx355)
> >       if (ret)
> >               return ret;
> >
> > +     /* set line length */
> > +     ret = imx355_write_reg(imx355, IMX355_REG_LLP,
> > +                            imx355->hblank->val + imx355->cur_mode->width,
> > +                            2);
> > +     if (ret)
> > +             return ret;
> > +
> >       /* Apply customized values from user */
> >       ret =  __v4l2_ctrl_handler_setup(imx355->sd.ctrl_handler);
> >       if (ret)
> >
> > --
> > 2.34.1
> >
> >

