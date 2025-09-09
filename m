Return-Path: <linux-media+bounces-42135-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B19FDB506A9
	for <lists+linux-media@lfdr.de>; Tue,  9 Sep 2025 21:59:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 72D41447CFF
	for <lists+linux-media@lfdr.de>; Tue,  9 Sep 2025 19:59:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DDA6335BB1;
	Tue,  9 Sep 2025 19:59:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Hu7fbN5u"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2F45225415
	for <linux-media@vger.kernel.org>; Tue,  9 Sep 2025 19:59:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757447987; cv=none; b=dw1G67oz7U6LMZHquXCJkxZ+9lxpF1TrnYqxwMHeAIabHIOHl+ROfbQW3zLnXBkT/7cXiSC9p/FJcGVRWQNtXwQwxKMkN8y7oz09CvWTJ9+fu/qimzgc1ZY6kXVMQN2nZju5VYROvHDT+AkftCwH0da1vl+DcZpUS6Q87VhrLzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757447987; c=relaxed/simple;
	bh=QIaGzWv15+L0Mfp0Su6ZQ/0bPK3caEErB4Y/h0D/PZ0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=i0glqM7I016QQ/wQ+4xLjVjiT/NJ3i4yYIyfswZPK/BagddK5t3r0j0DXzyljBNae3RRaFOtjK5GQFBaPAYIL4fPeZGR6w9S98MzJ7/BNTpYwSvb6dSChh10/0EZoR4KkBlnaDZXJWA8n7T+wIdJudmaW9cAiPUvNFvfAw/5T3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Hu7fbN5u; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-55f6ad5146eso5657561e87.0
        for <linux-media@vger.kernel.org>; Tue, 09 Sep 2025 12:59:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1757447984; x=1758052784; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=qpW3cFG8piul5aephD/7WBITZVYhMP3rmz4/bgrrLu0=;
        b=Hu7fbN5up2v1UOOSG9SFwjFUe4bT4rpWNyaL1U3k62femk6e/hw9RA3VKvKz8FhLHJ
         xeAaWzLPKDwtmx2PHJONz95e0biqvJUuGAW0WW/eS1ozJ7nZkAJTeZrMeoQBfbEZBAq9
         5J2uiN1tsbQW2WyNu37FfI5tvDMC99Ll0iSEc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757447984; x=1758052784;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qpW3cFG8piul5aephD/7WBITZVYhMP3rmz4/bgrrLu0=;
        b=m9cDN0iB4rH9BF5HYZT3rxJfu292XMPA+aJUzCAeweLNOYfK37DRnc0WkUfB5AFDoB
         +hs6v/tKPueXbpyL+aRwD/QHwcJlzTySIsaPy/Y6ASrJNrAlgFWGxQP6MxViSwUeQKdB
         eVktJUcxTiBoXoPHB8O5I7+g2/NqSsZuSFVlrmTPUHzy/W8nLKd86AEFiyjDJuz5QbaO
         nfQiU1xzZZQJWvDykVgiM4fhY4xBfK4326RCOA/kg82g1CW9jiRwIaGPdj5YIWBb177D
         5ksZTH7wTUEfOK0KXCr2DQL1+Yhh+z1NlUPM7UHhIL4SM5MvAUmstQjeFe9p3WrVD8cU
         oeIA==
X-Gm-Message-State: AOJu0YzJ2EtwkRMhHC3B+7stdYc/MKBaL4aKGoYKcJAkT2Xx2sETw9mx
	4TKfhppz0A7lZyv8vR6kbenzocBhwL7HdHhrB4P6A7qpU6lz34+BdVh84CcOG3zL7G4foaw+VuD
	2dMCoiw==
X-Gm-Gg: ASbGncuKbhSUVVwFuknYvlvBmINZ4YUSSItRibOMmnBURDm0ppVhVXsCnh6OfG1PXPT
	ruKABOY8xtAKKejlwpa1SR6GCZu09whx5hUP6AZcaS9hu2UythOv0dDUlSjru2PCc8F0Mg/IppZ
	cCJ2ESOwCiR+EB/ayNlqaSIdLKRf73nFBTdxX8WYpq9oAxfg6N66wvolDEtA4xrgSJIU47rlQh6
	dS/ohM8dr0adakKZ+XneuNKzt54Z0uO62EV7QKrwAF2Q7HIp8i2mL1ZHFT2yFt0iCQEDh0FfhNB
	kHytI82CxnI9dpvJCt5XCGfulMle+6PkxNb4U+rz0QjmHCu7dyYXA5b/zbb7vET+EG/PtuFBD2T
	GGNzAa5jtTTrEGqMwvOjlN5519gODHkLszpvt3Ha/Y5PVrdR3I4MyDzVfQr6d
X-Google-Smtp-Source: AGHT+IFQqd1TPrGGY1GC4GJKBMWWlQEDD51K8BpfXb3iiQPZq32K8fRCd2yRPBQTuQPn5pJe6b3KyQ==
X-Received: by 2002:a05:6512:b1c:b0:55f:6524:1a83 with SMTP id 2adb3069b0e04-5626228a0eamr3624710e87.40.1757447983593;
        Tue, 09 Sep 2025 12:59:43 -0700 (PDT)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com. [209.85.167.46])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5681795eac6sm719066e87.92.2025.09.09.12.59.42
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Sep 2025 12:59:43 -0700 (PDT)
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5688ac2f39dso1232770e87.3
        for <linux-media@vger.kernel.org>; Tue, 09 Sep 2025 12:59:42 -0700 (PDT)
X-Received: by 2002:a05:6512:3b9e:b0:55f:4d51:7ef4 with SMTP id
 2adb3069b0e04-562603a2244mr4899828e87.24.1757447982448; Tue, 09 Sep 2025
 12:59:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250820125516.494408-1-thuth@redhat.com> <68a5ea9e.050a0220.2a8c29.7282@mx.google.com>
 <680c0aa0-fb89-480a-bd28-f33b9f3b6343@redhat.com>
In-Reply-To: <680c0aa0-fb89-480a-bd28-f33b9f3b6343@redhat.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 9 Sep 2025 21:59:29 +0200
X-Gmail-Original-Message-ID: <CANiDSCsmsVaLScHdGZR8QyV7+g8RAWVyTrO=3L5yfZZqMy8wcg@mail.gmail.com>
X-Gm-Features: Ac12FXx9ljkZiY-kZsMtwMMURdZPZv-ry8hlo_98WnETnNZH5YMQxmonENDCmyk
Message-ID: <CANiDSCsmsVaLScHdGZR8QyV7+g8RAWVyTrO=3L5yfZZqMy8wcg@mail.gmail.com>
Subject: Re: media: mxl5005s: Replace GPLv2 boilerplate text with SPDX
To: Thomas Huth <thuth@redhat.com>
Cc: linux-media@vger.kernel.org, patchwork@media-ci.org
Content-Type: text/plain; charset="UTF-8"

Hi Thomas

I can restart the process, but bare in mind that its results will not
be updated in patchwork, just in gitlab.


Regards


On Tue, 9 Sept 2025 at 15:14, Thomas Huth <thuth@redhat.com> wrote:
>
> On 20/08/2025 17.32, Patchwork Integration wrote:
> > Dear Thomas Huth:
> >
> > Thanks for your patches! Unfortunately the Media CI robot detected some
> > issues:
> >
> > Please fix your series, and upload a new version. If you have a patchwork
> > account, do not forget to mark the current series as Superseded.
> >
> > For more details, check the full report at:
> > https://linux-media.pages.freedesktop.org/-/users/patchwork/-/jobs/82873240/artifacts/report.htm .
> >
> > Best regards, and Happy Hacking!
> > Media CI robot on behalf of the linux-media community.
> >
> > ---
> > Check the latest rules for contributing your patches at:
> > https://docs.kernel.org/driver-api/media/maintainer-entry-profile.html
> >
> > If you believe that the CI is wrong, kindly open an issue at
> > https://gitlab.freedesktop.org/linux-media/media-ci/-/issues or reply-all
> > to this message.
>
> The failure looks like a networking problem in the CI job to me... Could
> somebody please restart that job?
>
>   Thanks,
>    Thomas
>


--
Ricardo Ribalda

