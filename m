Return-Path: <linux-media+bounces-31420-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CC77CAA47C9
	for <lists+linux-media@lfdr.de>; Wed, 30 Apr 2025 11:59:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2D285464624
	for <lists+linux-media@lfdr.de>; Wed, 30 Apr 2025 09:59:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81EE9238145;
	Wed, 30 Apr 2025 09:59:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DdmQfHzR"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EB59236445
	for <linux-media@vger.kernel.org>; Wed, 30 Apr 2025 09:59:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746007169; cv=none; b=Y5KA5qH/hzn4BgHEwxE/UgrxRKNHKj5gx8fttGJtDydsRSSmNdteSkt6B7ON/+BaXH0Rfds78obb8pBD4sRG57GIMAE9HXpIDxbvduShh5rG/A1eZu+LEm5iW8P05HBzzm/q/KFnXfxzObNmHKcDdnBJkGN1+cuTzGTwQj31KR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746007169; c=relaxed/simple;
	bh=gU0cK+6rYhoCrfmO8Zc168gkmlEzEUm0imiU4BkXnxU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NKcHAQ61y0nqM4BSE2+j3LTS1TMmnbu33N1TFG2R5rqSbho5gFnibg+u7aGlBMiYPHUq93nls5rsTbEPw8Kmfk9D8fQL3s9SS+lyzlW0aitF6BUOBGYBXYqKg5oYErfjCpqd8eU9d/5jQGkTMVOY3jrkQ8QEBonRDjBvzDI4n+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DdmQfHzR; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43cec5cd73bso34855705e9.3
        for <linux-media@vger.kernel.org>; Wed, 30 Apr 2025 02:59:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746007165; x=1746611965; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6I143zOtsIb3U6VlapVBXBqNO181vL3QULnfrrsNbrQ=;
        b=DdmQfHzRHQn+QHmOY/jAwJGVb9U2v6D940luAPQsGcklSA0gIn310szYtwjcTZD3ZJ
         53c0V6W3pVUvqz6SDoR7AyJLH4ixqX9/A9Cx1ZBTujxw7qpYAIqz3D3TgCeRV+dPxfxT
         OEH7NUJQoOUvaSjRXmAkncSXOrE84m4j0q94pCp+Hi6IyYYMxh++nb0N1E2JQjpuWKpx
         O5qfVa3eYZV468Lh+pkywF2YdSunRfAT3eVaO69I01f6r5cJo1pAsLKFBUmAP4WSC+b9
         sRlm4mvd8doYs9kCdHpUCqgnn7MkBn1iV8g2Id6h9vHaIkddFUhVbrq/F7CyKb3z8/GP
         4zpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746007165; x=1746611965;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6I143zOtsIb3U6VlapVBXBqNO181vL3QULnfrrsNbrQ=;
        b=H14kT+D1A0tkEFPzsIAKMul293tbxEIZWmwVq1Ethw+59AaCxJA4XgpXvE7UUKmJUi
         vD48Bv6l7dx3BbPX4D6mVEJddNLXXOyLnN3RzTNUtbyAgG2dpqVkoRkW1m0msaI+ftI4
         hYOoDpSdhuh/9DHV0HxjvkatoxRGbEMKYy79Xw25DCQnioGxUTeIorwRkBKHbd9niiCo
         BIcwhbkT+ncZBgWMONn4D2BDjGvs9oysqCDB7+xFsscqGHO1gfYXFARYvpSjn8Ru53Cl
         +4EmksIwKaK9b0LvSeKfpWUf3bJpBG1jJajD8AaDt8MuZX8LBwdduUdd8G524r2o7bm2
         eljQ==
X-Forwarded-Encrypted: i=1; AJvYcCX4GwJ9YexooMGFnfcYGDikmOC0aqaNF4dwx0wlNAQaV9P5wKeHqKmYan1XNvJ53QHdIQyIgJi4EaMNNQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxdivIaU97v/sTuCmZS+2kMIxZDph48j1gzLONu0+qfl5J5rC06
	Hb+8iuPMr+qJtVSqpA+TGv5ikwoIzqHOGxHloGdZCGv6JQXcJDBVKDDpuZxS9q4=
X-Gm-Gg: ASbGnctjIeGuNP1Zgp7aTaYhguTRIzDJsLle7RSsOPMAD5+gFm791t664pFJw7B5Ap7
	HGmZ2sdGwIODbZTqGz6f3C+cd3eNH5T+K7Bc963xraq+jwNlKq38bDtOhwjVeY2jNcViQ3XrWjU
	E8pVQqSyCgie0JE4QtZ5dOQ4JzEB0vVMn2HpvOu4t4WODXRCsGOPWU+Wo271hF+dFlYuuitng6F
	t4PLb9bRzimxWypijHLXmt1wWK4w0lgsuUvPer2t4ZCG4x4x/+c/0xQE8t7Hd6Mo1pOYzgl+OTo
	SVNXaouvN26V3oe6BOP+3u6z/YOyeOB4akAmfxyohKAmyQ==
X-Google-Smtp-Source: AGHT+IHLLxyeTc1HcEGag1qjfI4wrS/rupaaqDuV0HhYG9K4MQxOD+AmR9eIPJEaGfGvBmIL287Urw==
X-Received: by 2002:a05:6000:2509:b0:391:3f64:ed00 with SMTP id ffacd0b85a97d-3a08f7793cdmr1998311f8f.26.1746007165306;
        Wed, 30 Apr 2025 02:59:25 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a073e5d479sm17012964f8f.92.2025.04.30.02.59.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 02:59:24 -0700 (PDT)
Date: Wed, 30 Apr 2025 12:59:21 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Tarang Raval <tarang.raval@siliconsignals.io>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Shravan Chippa <Shravan.Chippa@microchip.com>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/3] media: i2c: imx334: uninitialized variable in
 imx334_update_exp_gain()
Message-ID: <255a8604-5aa9-441a-a4d6-ebc592a00be9@stanley.mountain>
References: <cover.1746001540.git.dan.carpenter@linaro.org>
 <ee811e7c6eabc390241e0227f7a26d1eaa7818a1.1746001540.git.dan.carpenter@linaro.org>
 <PN3P287MB18296802E1A6C2CD55997BC68B832@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <PN3P287MB18296802E1A6C2CD55997BC68B832@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>

On Wed, Apr 30, 2025 at 09:47:44AM +0000, Tarang Raval wrote:
> Hi Dan,
> 
> > The "ret" variable is not initialized on the success path.  Set it to
> > zero.
> >
> > Fixes: 7b19b0fc8ac8 ("media: i2c: imx334: Convert to CCI register access helpers")
> > Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> > ---
> >  drivers/media/i2c/imx334.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/media/i2c/imx334.c b/drivers/media/i2c/imx334.c
> > index fc875072f859..846b9928d4e8 100644
> > --- a/drivers/media/i2c/imx334.c
> > +++ b/drivers/media/i2c/imx334.c
> > @@ -536,7 +536,8 @@ static int imx334_update_controls(struct imx334 *imx334,
> >  static int imx334_update_exp_gain(struct imx334 *imx334, u32 exposure, u32 gain)
> >  {
> >         u32 lpfr, shutter;
> > -       int ret, ret_hold;
> > +       int ret_hold;
> > +       int ret = 0;
> 
> I think this initialization may not really be necessary.
> 
> If all of those cci_write are skipped, then yes, using ret uninitialized 
> would be a problem.
> 
> However, I don’t see any case where they would be skipped in the 
> current implementation.
> 
> So, is this initialization really needed?
> 
> Best Regards,
> Tarang

This is a new bug that was introduced in linux-next...

drivers/media/i2c/imx334.c
   536  static int imx334_update_exp_gain(struct imx334 *imx334, u32 exposure, u32 gain)
   537  {
   538          u32 lpfr, shutter;
   539          int ret, ret_hold;
   540  
   541          lpfr = imx334->vblank + imx334->cur_mode->height;
   542          shutter = lpfr - exposure;
   543  
   544          dev_dbg(imx334->dev, "Set long exp %u analog gain %u sh0 %u lpfr %u\n",
   545                  exposure, gain, shutter, lpfr);
   546  
   547          cci_write(imx334->cci, IMX334_REG_HOLD, 1, &ret);

This first call will do an unitialized read of ret to check if it holds
an error code.

   548          cci_write(imx334->cci, IMX334_REG_VMAX, lpfr, &ret);
   549          cci_write(imx334->cci, IMX334_REG_SHUTTER, shutter, &ret);
   550          cci_write(imx334->cci, IMX334_REG_AGAIN, gain, &ret);

cci_write() is designed to preserve the error codes from previous calls.
It will only write error codes to "ret", it will not write success.  If
everything succeeds then "ret" is uninitialized.

   551  
   552          ret_hold = cci_write(imx334->cci, IMX334_REG_HOLD, 0, NULL);
   553          if (ret_hold)
   554                  return ret_hold;
   555  
   556          return ret;
   557  }

In production then everyone should run with INIT_STACK_ALL_ZERO.  In that
case everything works fine.  However some older distributions do not use
this option.  Also in testing, I would encourage everyone to run with
INIT_STACK_ALL_PATTERN.

regards,
dan carpenter


