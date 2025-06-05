Return-Path: <linux-media+bounces-34128-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 47911ACEFA5
	for <lists+linux-media@lfdr.de>; Thu,  5 Jun 2025 14:55:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0956D17796E
	for <lists+linux-media@lfdr.de>; Thu,  5 Jun 2025 12:55:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 349E4225795;
	Thu,  5 Jun 2025 12:54:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="jPNxNGl/"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5184E221F11
	for <linux-media@vger.kernel.org>; Thu,  5 Jun 2025 12:54:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749128091; cv=none; b=ey4edOr8DfcAWEGfy9b8KV/3/n8HZRhoKLroPh6tm7BQm/Hlt6VjE/3r3AqmZblvY8pa6C61nG+uK0Rlg4BymwTnnUS1XZfjzMyTS7jKtoVNOngHC5xFcvUJbHD9XsRflxIdgy0cPVfLoZAZePg5ECE38JMVoCYdYP7LBTkP9Oo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749128091; c=relaxed/simple;
	bh=BNZa5KZigyQRXP4muBDV8RUA36S0Ug+TyXEMrcT3StU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Nt7goppOfXi7ml+oN1hJIgRB22wgGpHIuV/b0Sd2VxtiKaCHcb2mwh8dgnTsFHUzG/T7IKHOqv30uz6qGEe8Mw+pv0+siQPv2AdqTM2DFGtqHUnlFBItY6F6tVVs5nZT14ugrDZYtTcFjYWVfbzifFfXZOuxZYMV5Wq7kpB5M3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=jPNxNGl/; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-54acc0cd458so1053095e87.0
        for <linux-media@vger.kernel.org>; Thu, 05 Jun 2025 05:54:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1749128087; x=1749732887; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=5eiCt7U5RbCUKlDlFPTLISQ9RAxLArIz4eS02clZaEA=;
        b=jPNxNGl/zPAZeY8BvnCCqVAaUOgO4RBL7kyClqOif/oLFgF8Yzs0UppPWRzCGWZmOC
         zOGli39cr2e8R5/DVibj7Gz+pKrCU+HrudnSZDDR9fTg/R6IU/gF534Q6OsyF/1Elqju
         NCbxhHTg6lKxBRX0V/IZd0K45gHE9C5qEZpMs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749128087; x=1749732887;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5eiCt7U5RbCUKlDlFPTLISQ9RAxLArIz4eS02clZaEA=;
        b=Hw7qSwkEtFJLv46H6MssNq7vrek65XCRCfAuk36mrmOL21+6CxvSRCzgQYqvG/xhIn
         8LmQwE83BYmEu7eKAB9kVLcd1Mdd7yUYuwD2iQ+Nf5rdKQ43Mimqo48PGmgr4iBfi50p
         P5nQgZGOx2UfP1Xiv2f7PpzpMa5THXLHjIcUPkb/o3PWo8wqnXgzxk8cfRYUnwoY1x7P
         oNtTt8bFLRYqvlXHzUYepr9wgtk1FRYB92i+4c44HtFgF9qar9bgfEfsVP0iTo4TEbna
         i+vO3CJHoelCs7CFc1QNmplKUrG7EoiRLP6pTxhSqa9R5fpWjO/MqplHw0qzC819H5p+
         Eazg==
X-Forwarded-Encrypted: i=1; AJvYcCUHRJVQ3HyKbUESJ3mx/gW9TJlFahmbQRUyDWuprzhRGs3R8gkOe5Jns6WWtbWXT5MnTHSdCezRSotRyA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5JAhvIOa1lgilmF0sspqd2UGRUKuSIW6Pbi4eE13v6VtAFlG6
	gkgv5cynrfyMRira9f0v4YkQV/43MJyvCchln6gLUeqSlbvwUAuWyvEQ0SzD52TLwGA80iJScBq
	ejVA=
X-Gm-Gg: ASbGncsQD0UBtNdxgx3KybmJYjNxRfXyytGZ1cCdir21ODMNesF04dyj8882YZiRxK5
	djkDJb4PL/4fH1EthW5AQRmJIWHRjp3sCWJXin0WUEzalBiH6u1bN/BzdXdOJEr5Or2ePQaYe4u
	WGZhbB8qkd+3ef0u3wf/iOJPyf1c7P0NScD+tcjkrUSHIwKaYtvgPhmLPV5XkthfMrqDEV7gL/T
	u4VEJ+tajxb3MTFMHgo8tTiCV0mYKJUJ1QKNh5Z/WznByvo0Pt/GmWc9lRQVmoCHqx+6jJfsiE3
	JkAhbP4elNUQ778p55LTfyRVX8PZ57TKKuOllPz1mFCcPIhHsd61XdwWJtMLmVbwcqBqtkJfkX0
	wzExxMh9kQAh/tQ==
X-Google-Smtp-Source: AGHT+IHVIw/6nWdTKxhSB8B7JpwwWnVCDjAV2rHwJPQJbEbr6UIS1HZfqT+U7MpZtQWGf8BcM6OZ7w==
X-Received: by 2002:a05:6512:e89:b0:553:5429:bb87 with SMTP id 2adb3069b0e04-55356bf973cmr1853269e87.36.1749128086992;
        Thu, 05 Jun 2025 05:54:46 -0700 (PDT)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com. [209.85.167.45])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55337910dedsm2605198e87.135.2025.06.05.05.54.46
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Jun 2025 05:54:46 -0700 (PDT)
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-551ed563740so1158037e87.2
        for <linux-media@vger.kernel.org>; Thu, 05 Jun 2025 05:54:46 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVZhmpxodpz4r4Yr4CHjUCuaWclcTPC18DALIuqabZHdXLUTJJgPT2t1VOVjXjdsVmYlovJt9lOgwi84g==@vger.kernel.org
X-Received: by 2002:a05:6512:68b:b0:553:515a:5ebd with SMTP id
 2adb3069b0e04-55356adfe74mr2076188e87.8.1749128086036; Thu, 05 Jun 2025
 05:54:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250605-prefix-v1-1-450aff98308a@chromium.org> <20250605124635.GC29935@pendragon.ideasonboard.com>
In-Reply-To: <20250605124635.GC29935@pendragon.ideasonboard.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Thu, 5 Jun 2025 14:54:33 +0200
X-Gmail-Original-Message-ID: <CANiDSCs4B8ovA2jipUiDr3tC3SSCpJOownohx-X+UvD+2W2w9g@mail.gmail.com>
X-Gm-Features: AX0GCFshUqowHPi69zzJo3XkzLlZN-cSE8yUmNs2V-YicCQHtAbJ_9mZ0L9ffxI
Message-ID: <CANiDSCs4B8ovA2jipUiDr3tC3SSCpJOownohx-X+UvD+2W2w9g@mail.gmail.com>
Subject: Re: [PATCH v4l-utils] CONTRIBUTE: Add simple contribution instructions
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Hans Verkuil <hans@jjverkuil.nl>, linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 5 Jun 2025 at 14:46, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> On Thu, Jun 05, 2025 at 12:09:57PM +0000, Ricardo Ribalda wrote:
> > In the media summit we discussed the need of a special prefix for
> > v4l-utils. This helps patchwork and media-ci.
> >
> > Create a new file with a brief introductions on how to contribute and
> > make the `v4l-utils` official.
> >
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
>
> I think this is a good idea. I don't know how we'll get users to
> actually use the prefix, but documenting it is a necessary first step.

I can add a comment in the media-ci email. Something like:

I could not apply your series. Maybe it is for v4l-utils, if so,
please check  http://XXXX/CONTRIBUTE.md

>
> > ---
> >  CONTRIBUTE.md | 19 +++++++++++++++++++
> >  1 file changed, 19 insertions(+)
> >
> > diff --git a/CONTRIBUTE.md b/CONTRIBUTE.md
> > new file mode 100644
> > index 0000000000000000000000000000000000000000..19a2c5814b45462f3cfeea921e277f8da00ccbd1
> > --- /dev/null
> > +++ b/CONTRIBUTE.md
> > @@ -0,0 +1,19 @@
> > +## Repository
> > +
> > +v4l-utils official repository is hosted at https://git.linuxtv.org/v4l-utils.git
> > +
> > +## Contributions
> > +
> > +Patches are welcome! Please send your patches to `linux-media@vger.kernel.org`
> > +using the prefix `[PATCH v4l-utils]`.
>
> Nitpicking, I was thinking of '[v4l-utils] [PATCH]' as that's what I
> used previously. Looking at the list archives, both (and more) have been
> used. I don't object to using '[PATCH v4l-utils]' if that's easier for
This seems to be prefered by b4.... and who does not love b4 :P?

> tools.
>
> I have this in my .git/config for v4l-utils:
>
> [format]
>         subjectPrefix = "v4l-utils] [PATCH"
>
> With your proposal, this would be
>
> [format]
>         subjectPrefix = "PATCH v4l-utils"
>
> In either case, let's document this in addition to the b4 configuration.

Something like this?:

diff --git a/CONTRIBUTE.md b/CONTRIBUTE.md
index 19a2c581..708939df 100644
--- a/CONTRIBUTE.md
+++ b/CONTRIBUTE.md
@@ -5,7 +5,11 @@ v4l-utils official repository is hosted at
https://git.linuxtv.org/v4l-utils.git
 ## Contributions

 Patches are welcome! Please send your patches to `linux-media@vger.kernel.org`
-using the prefix `[PATCH v4l-utils]`.
+using the prefix `[PATCH v4l-utils]`. E.g:
+
+```
+git config set format.subjectPrefix "PATCH v4l-utils"
+```

 ## b4 config


>
> > +
> > +## b4 config
> > +
> > +If you use b4[1] for your contributor workflow you can use these options:
> > +
> > +```
> > +git config set b4.send-series-cc linux-media@vger.kernel.org
> > +git config set b4.send-prefixes v4l-utils
> > +```
> > +
> > +[1] https://b4.docs.kernel.org/en/latest/contributor/overview.html
> >
> > ---
> > base-commit: 0d4e8e2d4e2d9d87863222e03fd3a6a4a3ff3d86
> > change-id: 20250605-prefix-a1a47dbdaa75
>
> --
> Regards,
>
> Laurent Pinchart



-- 
Ricardo Ribalda

