Return-Path: <linux-media+bounces-9863-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 90BB78ACBF5
	for <lists+linux-media@lfdr.de>; Mon, 22 Apr 2024 13:23:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0742B1F22A1E
	for <lists+linux-media@lfdr.de>; Mon, 22 Apr 2024 11:23:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B05221465BD;
	Mon, 22 Apr 2024 11:23:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SMriD5vl"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A322146591
	for <linux-media@vger.kernel.org>; Mon, 22 Apr 2024 11:23:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713784984; cv=none; b=mzD2lzjacSYCfURvqvNsFvbRcWxSl0smKmYE3TRaqZURuH+x58Vy5LbfSc3ZBkiqA4dISSW1A3Dadmt+Ni9dTtmJtJwhYvAIj8etpxMDRh9TMehpQtmzDCpRSvicYrW6ujgmcyVllp5i7cAzVkLTvKuanWh530X94Qdsaeo6qGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713784984; c=relaxed/simple;
	bh=XGoajSu+/Do3RKNMn4jsKUYia62CDpDURgb1HAcIDEs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IX27tUhKJ9viRVfChd+0Y25glyKTiXZZgGy0Hu1UKTj17QysCZqEE0gpT32CGvRlpzJevfXoPjTQKhJhYAMg4dRlmrbOzxM8Hbi6GZP1u1yH3kAPEwW5YBgwLHGg5RTS3qfBOqg3Qfhj47QlpIpo5MN6zRXpkMJudnG3EYgYfUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SMriD5vl; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-572146dd1c8so367787a12.3
        for <linux-media@vger.kernel.org>; Mon, 22 Apr 2024 04:23:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713784980; x=1714389780; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7KxlxiaM2PGBV+BkGeXxmbLGJIAVZ06jcBBCJ5bRZFs=;
        b=SMriD5vlF+cYA17dkvNDqI3W4G1MSfctL9IlmKqsMIHxgUNoIlhZfKKxrDuayWZzPK
         8qUjN0Ru9DUySUXWCv8nCdQQJInpErUOUnF5piRGaACMfMfBwNFbzFu3l31Gli2Ucjvd
         lJ1sknoHDAEoPscFnxgP3FedYMlUy1EV4e2jBes9PhHkwpc8a1vaUS93fx28okXTZCXR
         6/B1WVG85GhMIz4MJrX2phumvDFv1Eva20q3flhNwSJySakQkVfb4RVrvqLN9Fr3Y94x
         ZNDKRT7+FI+lsGaZ1vzSGhCktGxhof6LqXhNvRCW6w+vH1teuRWrMy6YFjo6ubS7/qhX
         pryg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713784980; x=1714389780;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7KxlxiaM2PGBV+BkGeXxmbLGJIAVZ06jcBBCJ5bRZFs=;
        b=A1dkibvlnb1eITbDM8biLaenrMASQJ5yzVzaS4DdP9pSZzWo/JjavPCxAszVnMrEwC
         WSohH6/bv/tlvzNZBmGdqaIJvs/1BYdp1bu6lJGNKsRrUeczMl/O2sQ7N8Z90akPZiZ6
         o4Z3QgTLVl9SOd6nlGbJjlw4vOt0Mt2lNeWNcZIhdAIS/pfqRXH4TEuLpEEMXds1W4e6
         VKNUox/4HOa3zk/n+Y+YtSI/SA27b6UvNX8/6ZG1QYbW3RIxmtCgRrSdqxLaaDehgcmz
         nEfI2f2cKzzt+XO3iQJgnSvtAWzY/y1CN892IYb4QbPBtZUE4VA3J9PNJQ93iki+Tvfc
         uM5A==
X-Forwarded-Encrypted: i=1; AJvYcCVK7ZL80zkj9dV3RmVV5puhBSEym8SNFO+ClLAaIitxjjQJy7i7zuHAcv8SbH5DD+JHROM/1ZZxv0BZ3qo6XwLnoKPbqnbAxnJGRis=
X-Gm-Message-State: AOJu0YxqZtQ1jDeXS5D0F5Mv/pLm3k2Bnuei4xzQNpBEjgdIfFEaYvU/
	46sCkzdGe2vEmVikZ4qy3jnUKasxkBgsWjrfGQKtk/MJHh/NdDg5bZ5i5duv8Es=
X-Google-Smtp-Source: AGHT+IF0sIK+G+eqh6ZNY5C0/zr8EDIQ7ynWfEBKk80BR2SveU6nr66XABxJ/pSEjMBgs40I7BL8qg==
X-Received: by 2002:a17:906:c1cf:b0:a52:3316:bc29 with SMTP id bw15-20020a170906c1cf00b00a523316bc29mr8835339ejb.3.1713784980311;
        Mon, 22 Apr 2024 04:23:00 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id k15-20020a170906128f00b00a473a1fe089sm5640374ejb.1.2024.04.22.04.22.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Apr 2024 04:22:59 -0700 (PDT)
Date: Mon, 22 Apr 2024 14:22:54 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Ezequiel =?iso-8859-1?Q?Garc=EDa?= <elezegarcia@gmail.com>,
	Ghanshyam Agrawal <ghanshyam1898@gmail.com>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] media: stk1160: fix bounds checking in
 stk1160_copy_video()
Message-ID: <f2e9cdcd-46e7-41ab-9d5f-c1237a0a6222@moroto.mountain>
References: <e43980df-1ca5-459d-b037-788dd7d9085d@moroto.mountain>
 <CANiDSCtjEPqEstuo92QeVK_rWkW9icsjKWakPyN19ETM+MJuuQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANiDSCtjEPqEstuo92QeVK_rWkW9icsjKWakPyN19ETM+MJuuQ@mail.gmail.com>

On Mon, Apr 22, 2024 at 05:52:36PM +0800, Ricardo Ribalda wrote:
> Hi Dan
> 
> On Mon, 22 Apr 2024 at 17:32, Dan Carpenter <dan.carpenter@linaro.org> wrote:
> >
> > The subtract in this condition is reversed.  The ->length is the length
> > of the buffer.  The ->bytesused is how many bytes we have copied thus
> > far.  When the condition is reversed that means the result of the
> > subtraction is always negative but since it's unsigned then the result
> > is a very high positive value.  That means the overflow check is never
> > true.
> >
> > Additionally, the ->bytesused doesn't actually work for this purpose
> > because we're not writing to "buf->mem + buf->bytesused".  Instead, the
> > math to calculate the destination where we are writing is a bit
> > involved.  You calculate the number of full lines already written,
> > multiply by two, skip a line if necessary so that we start on an odd
> > numbered line, and add the offset into the line.
> >
> > To fix this buffer overflow, just take the actual destination where we
> > are writing, if the offset is already out of bounds print an error and
> > return.  Otherwise, write up to buf->length bytes.
> >
> > Fixes: 9cb2173e6ea8 ("[media] media: Add stk1160 new driver (easycap replacement)")
> > Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> > ---
> > v2: My first patch just reversed the if statement but that wasn't the
> > correct fix.
> >
> > Ghanshyam Agrawal sent a patch last year to ratelimit the output from
> > this function because it was spamming dmesg.  This patch should
> > hopefully fix the issue.  Let me know if there are still problems.
> >
> >  drivers/media/usb/stk1160/stk1160-video.c | 20 +++++++++++++++-----
> >  1 file changed, 15 insertions(+), 5 deletions(-)
> >
> > diff --git a/drivers/media/usb/stk1160/stk1160-video.c b/drivers/media/usb/stk1160/stk1160-video.c
> > index 366f0e4a5dc0..e79c45db60ab 100644
> > --- a/drivers/media/usb/stk1160/stk1160-video.c
> > +++ b/drivers/media/usb/stk1160/stk1160-video.c
> > @@ -99,7 +99,7 @@ void stk1160_buffer_done(struct stk1160 *dev)
> >  static inline
> >  void stk1160_copy_video(struct stk1160 *dev, u8 *src, int len)
> >  {
> > -       int linesdone, lineoff, lencopy;
> > +       int linesdone, lineoff, lencopy, offset;
> >         int bytesperline = dev->width * 2;
> >         struct stk1160_buffer *buf = dev->isoc_ctl.buf;
> >         u8 *dst = buf->mem;
> > @@ -139,8 +139,13 @@ void stk1160_copy_video(struct stk1160 *dev, u8 *src, int len)
> >          * Check if we have enough space left in the buffer.
> >          * In that case, we force loop exit after copy.
> >          */
> > -       if (lencopy > buf->bytesused - buf->length) {
> > -               lencopy = buf->bytesused - buf->length;
> > +       offset = dst - (u8 *)buf->mem;
> > +       if (offset > buf->length) {
> Maybe you want offset >= buf->length.
> 

The difference between > and >= is whether or not we print an error
message.  In the original code, we didn't print an error message for
this and I feel like that's the correct behavior.

> And remember to add at the beginning of the function
> 
> if (!len)
>  return 0;
> 

That's checked in the caller so it's fine.

   260                  /* Empty packet */
   261                  if (len <= 4)
   262                          continue;

Generally we don't add duplicate checks.

> And I would have done:
> len -= 4;
> src += 4;
> 
> In the caller function
> 

I don't really think it makes sense to move that into the caller and
anyway, doing cleanups like this is outside the scope of this patch.
Really, there is a lot that could be cleaned up here.  People knew there
was a bug here but they didn't figure out what was causing it.  We could
delete that code.  Looking at it now, I think that code would actually
be enough to prevent a buffer overflow, although the correct behavior is
to write up to the end of the buffer instead of returning early.
Probably?

To be honest, I'm still concerned there is a read overflow in
stk1160_buffer_done().  I'd prefer to do:

	len = buf->bytesused;
	if (len > buf->length) {
		dev_warn_ratelimited(dev->dev, "buf->bytesused invalid %u\n", len);
		len = buf->length;
	}
	vb2_set_plane_payload(&buf->vb.vb2_buf, 0, len);

regards,
dan carpenter

diff --git a/drivers/media/usb/stk1160/stk1160-video.c b/drivers/media/usb/stk1160/stk1160-video.c
index ed261f0241da..f7977b07c066 100644
--- a/drivers/media/usb/stk1160/stk1160-video.c
+++ b/drivers/media/usb/stk1160/stk1160-video.c
@@ -112,16 +112,6 @@ void stk1160_copy_video(struct stk1160 *dev, u8 *src, int len)
 	u8 *dst = buf->mem;
 	int remain;
 
-	/*
-	 * TODO: These stk1160_dbg are very spammy!
-	 * We should check why we are getting them.
-	 *
-	 * UPDATE: One of the reasons (the only one?) for getting these
-	 * is incorrect standard (mismatch between expected and configured).
-	 * So perhaps, we could add a counter for errors. When the counter
-	 * reaches some value, we simply stop streaming.
-	 */
-
 	len -= 4;
 	src += 4;
 
@@ -160,18 +150,6 @@ void stk1160_copy_video(struct stk1160 *dev, u8 *src, int len)
 	if (lencopy == 0 || remain == 0)
 		return;
 
-	/* Let the bug hunt begin! sanity checks! */
-	if (lencopy < 0) {
-		printk_ratelimited(KERN_DEBUG "copy skipped: negative lencopy\n");
-		return;
-	}
-
-	if ((unsigned long)dst + lencopy >
-		(unsigned long)buf->mem + buf->length) {
-		printk_ratelimited(KERN_WARNING "stk1160: buffer overflow detected\n");
-		return;
-	}
-
 	memcpy(dst, src, lencopy);
 
 	buf->bytesused += lencopy;
@@ -208,17 +186,6 @@ void stk1160_copy_video(struct stk1160 *dev, u8 *src, int len)
 		if (lencopy == 0 || remain == 0)
 			return;
 
-		if (lencopy < 0) {
-			printk_ratelimited(KERN_WARNING "stk1160: negative lencopy detected\n");
-			return;
-		}
-
-		if ((unsigned long)dst + lencopy >
-			(unsigned long)buf->mem + buf->length) {
-			printk_ratelimited(KERN_WARNING "stk1160: buffer overflow detected\n");
-			return;
-		}
-
 		memcpy(dst, src, lencopy);
 		remain -= lencopy;
 

