Return-Path: <linux-media+bounces-17817-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CAEDC96FA23
	for <lists+linux-media@lfdr.de>; Fri,  6 Sep 2024 19:50:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 32967B231EC
	for <lists+linux-media@lfdr.de>; Fri,  6 Sep 2024 17:50:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA6DC1D45FA;
	Fri,  6 Sep 2024 17:50:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="S9ik7q7/"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD9E81D47DE
	for <linux-media@vger.kernel.org>; Fri,  6 Sep 2024 17:50:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725645020; cv=none; b=b+6H8NtInjqIiWF4FZeAfb/q3E3QwAaqxOg37dVVCue44xib/R6WpWz1Mdx4P3nWZHXZHdwHhbdG/wbI19Zan0rVKe/4F02g3IL1XSiPJXJoRxrSfjRwj48kZHP6J8bgdlTj7h77QZC/9UYvpfVB/dfIDTLgWfaQKOhdMFP8oQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725645020; c=relaxed/simple;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pR4WN90zUOyWynSU46C8SnKRjxwMLPUbDbuhcspBHxcJBFN7YXPEda0A2yYH9iv28J0MJcMcvNDIpUOFEEYWclOxmqKMgirlfkvcQ5Y2w40v1TnhPSFKwni2Mx8KeviVw0p0hoxBR9ejS1uDTXDu0fTC7QjqEUtIAYSVNkrvTfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=S9ik7q7/; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-42ca2d075a3so165e9.1
        for <linux-media@vger.kernel.org>; Fri, 06 Sep 2024 10:50:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1725645017; x=1726249817; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
        b=S9ik7q7/k29xUOpJQRD3mc+GL+x/r+ZRglHfWZzWlrqbw9wvYyEa3qbzbhI4x2tddn
         cKifEPDSUS4v05RMEUmTunZTWmf3/zpnBjEY4AR+L0lkCG3gh0ZL7ldCLQKfA1XEr1C7
         d07flH4+TqPVFOINEth9POE+r+B75eoX9b3YUvfyU7NXzmy2NqM5yHCRr772Ph3t+Zpn
         fL0WSKhWTEt9Vyrfec3UHtt84n7UcgaqCr6kORf30glzaM0jiHdNc5WO+R+Dgz3BuTc5
         v6e7X8cE0tpM0zfGoVgVjmHMAJxs/c48JMlCNrgSC9FTdLUOejAL3ocPYWiDITAHerbC
         I7DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725645017; x=1726249817;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
        b=NhQIStwVtsNqn904GQeziBT9Pp1wwe8jH+K4WHANU1xi7gVXrrLJUNNrJQSplNtmD5
         pUZfAJnFlp1dh0CHrfVAK8+40Epe14K/x/fBYYqtR4WDnMFOVInPRGe9aAs0k7+0twDg
         EJ/VuB2yAKRzI536Gcg8ja73mt7igff9tzCxdCuPr6jGn5ieBpRNoyPqcYYA/l8JXDHy
         IGAKySAIvzSaKjIAlme+6LfjVaHcs0VEHnwR3k7wD9dTrPCeU8N9ED0Gt8XQKW9CtS7/
         jvFK11o9v9OwaQFW8VqXAbUckVqd4k/g9R3KKtdHy0GXZuDQ9zbQ7XAjOJVl23/aKKEU
         F32g==
X-Forwarded-Encrypted: i=1; AJvYcCWR0jTlFDuCT+SV/h7kUlFdGNRsR5VagKNi4ARYYmKD7EmE0Vdv6sQ6gykp0kfTHghd8xi0xwxE7TsqgQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxT2pT72KhTKzYp/XO2dWEkHuajhUAM8598EEznE7NRKnf+XVWS
	zKkLyaedr5/9PG1OuNhsSE+ut31Ra0eJbwnJEFTaKcdPAa9pGZItXD9H1E0Ix1Y3kQkOLzOEpFu
	G0fepiDfas2MA1/Kk4MnhaNjPQ08liy47Cuk=
X-Gm-Gg: ASbGncsaK1w6KiGajBPtnKXl3SlTB1SZjvW6obH5KaZ2Sb/1JteHk2KNAZwlQxtplD0
	nbCqNMv1l1y2jGwqtuXpxUmjN+lrcL8hk7ZMNs2GJPwo28NLP1F2mblkdAg==
X-Google-Smtp-Source: AGHT+IHOlcv7vqlkgAnGOoFg/Cdu9KrQD+OEz5m6AJTBmUsgUHU751o/ZDkQMZfiOBrlPwGBZScRBDsy3iuUbw5u8dk=
X-Received: by 2002:a05:600c:254:b0:424:a2ae:8d1d with SMTP id
 5b1f17b1804b1-42cacd3ab7cmr25915e9.2.1725645016574; Fri, 06 Sep 2024 10:50:16
 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAFs7P=jk=wfo0nbHzqd1NrGX3NKpOezD4-u=nAMqzq7mq4Lidg@mail.gmail.com>
 <CAFs7P=jPqv2Zr6Fnw584TKhj5joBRt7X7gMidE4MiK1ABAMiRQ@mail.gmail.com>
In-Reply-To: <CAFs7P=jPqv2Zr6Fnw584TKhj5joBRt7X7gMidE4MiK1ABAMiRQ@mail.gmail.com>
From: Joshua Pius <joshuapius@google.com>
Date: Fri, 6 Sep 2024 13:49:39 -0400
Message-ID: <CAFs7P=jfzE6V4EMdVZ73ShdWLavv41kU_NdK-=CO+Cv8dfGBGw@mail.gmail.com>
Subject: Re: [PATCH] ALSA: Add logitech Audio profile quirk
To: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	Takashi Iwai <tiwai@suse.de>, Mark Brown <broonie@kernel.org>, alsa-devel@alsa-project.org
Cc: devicetree@vger.kernel.org, linux-sound@vger.kernel.org, 
	linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"



