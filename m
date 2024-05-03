Return-Path: <linux-media+bounces-10680-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B3C078BABCC
	for <lists+linux-media@lfdr.de>; Fri,  3 May 2024 13:43:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 451E92816EA
	for <lists+linux-media@lfdr.de>; Fri,  3 May 2024 11:42:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28B44152DE0;
	Fri,  3 May 2024 11:42:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="jt9Fmets"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3239515219D
	for <linux-media@vger.kernel.org>; Fri,  3 May 2024 11:42:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714736572; cv=none; b=PGPaJ7dqQNH9hFa+JC6UqmX+fVBEFMDPanE5mn8z7OUbxRxae/dtwrGyeVYZU8aWksUp2r8alJHEmfrdFxCn56h6Un+rEXdwTUXrr+M3PEngeS4u28ek6N378eGz8gmf1T5+oOXyTQibflMWCCyzGfa6LnlpurN72O0OfqMehiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714736572; c=relaxed/simple;
	bh=/wlb8TiqJK+x6as5LHo7tXicTp/D7BIbTNgcz0tBL7M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jMZmX6hGprKG4Es29AoyvI9R7c+6O0v4me3BpI4eebIDzI6ipe5XGzBTRxSQdSQvoK/mzftPMR+Jwd+Zv5q+5Sw54J28B8Kk9x85sbRVz30Y8QL6KVIJXifDuBu6hRFgiEt0DS0LLy5H1+r7BEpGb3zMYLXEVuJfeomj5+jOLfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=jt9Fmets; arc=none smtp.client-ip=209.85.210.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-6ee4dcc4567so2924209a34.3
        for <linux-media@vger.kernel.org>; Fri, 03 May 2024 04:42:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1714736570; x=1715341370; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=cawhOxgt5c+quQfk7K7byhyd32UGGEJDRxeJnf59vWI=;
        b=jt9Fmets1rtuHIH4gzSQHf6Ly1fmMNS5JVtZupwgFqo4ojc+z2vRV3oWz9ljxDFNvF
         q6yheu+cHid39MFDIISH34GONZ/wkyGQG6NCYplR8Gm85OtFlxR7QuJNBerzztab2pLZ
         HE2bwjia7kI0zEwz3wQGFel+LWeJjRaFW1fdk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714736570; x=1715341370;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cawhOxgt5c+quQfk7K7byhyd32UGGEJDRxeJnf59vWI=;
        b=ouLy8uSsw7p+Sp0Z+YLdnWW2MK5C0rmHKqfS4br5seE5UpDkDiu5dKubGdUTk7sQSR
         GRQKfqAAw6TXTEycN35V98vAVpetGWqjnhF0VEB+S+PLfMINzmem9tl+RJKJwUM2lSoU
         ohKEfN+bLyxDDxEVPd2aiQ6dWWSV4lzrBn0jE/kstQIxVohNN33hWzN34cLjXu2m/h5h
         LM4FQE//jRtXisoeyUAzoYmN7F5et9IrYMiRXdUB1dRO/cD09WGPRABEycQInxxHbo+Y
         XM0QcDTCLRJvBF02ph9nj8tbHVNSqtcaJTVfzs1QJ/Md6erFxwfhLOr662O20/ccQSYK
         plNA==
X-Forwarded-Encrypted: i=1; AJvYcCX2yVW6ZPLOwAYfEGhrFJhfnKbuXbSc9dqwmYJofd7Rv5cc3AwLgKiKyrpaXezIXZ68SU1Sga8Gj5qosWp4yhGPI2E7pFzS+jErgik=
X-Gm-Message-State: AOJu0YxBZNZCGsBrmlLaSMZfVvsW8zECxJXqujavvaDeKd1HSTzSa3IA
	ZZmKXTHjc9EXDr7nG/bEvIXZBJxv3m0rnopQzfkPenYkIp+2H9HnaWiQ4YFfM1YgsHyxBk2wcp5
	6fg==
X-Google-Smtp-Source: AGHT+IEUfhAIqrvTP64WKq/fTwrrOx8wkFnGWBtipj4fnd1KvyikhOC5bl45VSHctebZPdk7mJZNXA==
X-Received: by 2002:a9d:6d0b:0:b0:6eb:d847:ff8a with SMTP id o11-20020a9d6d0b000000b006ebd847ff8amr2819294otp.9.1714736570152;
        Fri, 03 May 2024 04:42:50 -0700 (PDT)
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com. [209.85.167.175])
        by smtp.gmail.com with ESMTPSA id bb9-20020a056830470900b006ee512d78f2sm588306otb.26.2024.05.03.04.42.48
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 May 2024 04:42:49 -0700 (PDT)
Received: by mail-oi1-f175.google.com with SMTP id 5614622812f47-3c868e82bf8so2749486b6e.0
        for <linux-media@vger.kernel.org>; Fri, 03 May 2024 04:42:48 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW7zsE/Pun13oDsQdYAzghABECL/7P4GofWlFl1hQv6I6bRYVQm+ARq6a/GuHDSr7bA/JtpbbXnL72WfjQBUiNdtkbuuL5GxcS8v4k=
X-Received: by 2002:a05:6808:9aa:b0:3c7:2030:9820 with SMTP id
 e10-20020a05680809aa00b003c720309820mr2335714oig.33.1714736568411; Fri, 03
 May 2024 04:42:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240503-fixdoc-v1-1-44d26e6f9dba@chromium.org> <60c08e6b-4a1b-408b-9317-3abe1346cdc5@xs4all.nl>
In-Reply-To: <60c08e6b-4a1b-408b-9317-3abe1346cdc5@xs4all.nl>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 3 May 2024 13:42:34 +0200
X-Gmail-Original-Message-ID: <CANiDSCsN8yTMBmORrmLvKuMHdJ+Durj8gWV8HK7gGP=x0kqMiw@mail.gmail.com>
Message-ID: <CANiDSCsN8yTMBmORrmLvKuMHdJ+Durj8gWV8HK7gGP=x0kqMiw@mail.gmail.com>
Subject: Re: [PATCH] media: cec.h: Fix kerneldoc
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 3 May 2024 at 13:41, Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:
>
> On 03/05/2024 13:33, Ricardo Ribalda wrote:
> > is_claiming_log_addrs documentation was missing.
> >
> > fix this kernel-doc warning:
> > include/media/cec.h:296: warning: Function parameter or struct member 'is_claiming_log_addrs' not described in 'cec_adapter'
> >
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
>
> Reviewed-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
>
> Hmm, that happens when you don't run your own patches through the build tests :-(

There is an easy way to test your patches with gitlab. No need to
install anything in your computer :P

>
> Regards,
>
>         Hans
>
> > ---
> > https://gitlab.freedesktop.org/linux-media/media-staging/-/pipelines/1169148/test_report?job_name=doc
> > ---
> >  include/media/cec.h | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/include/media/cec.h b/include/media/cec.h
> > index d3abe84c9c9e..d131514032f2 100644
> > --- a/include/media/cec.h
> > +++ b/include/media/cec.h
> > @@ -187,6 +187,7 @@ struct cec_adap_ops {
> >   *   in order to transmit or receive CEC messages. This is usually a HW
> >   *   limitation.
> >   * @is_enabled:              the CEC adapter is enabled
> > + * @is_claiming_log_addrs:  true if cec_claim_log_addrs() is running
> >   * @is_configuring:  the CEC adapter is configuring (i.e. claiming LAs)
> >   * @must_reconfigure:        while configuring, the PA changed, so reclaim LAs
> >   * @is_configured:   the CEC adapter is configured (i.e. has claimed LAs)
> >
> > ---
> > base-commit: 1aa1329a67cc214c3b7bd2a14d1301a795760b07
> > change-id: 20240503-fixdoc-d1380eb243cd
> >
> > Best regards,
>


-- 
Ricardo Ribalda

