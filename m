Return-Path: <linux-media+bounces-8695-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 76317899677
	for <lists+linux-media@lfdr.de>; Fri,  5 Apr 2024 09:24:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 30C6D28318E
	for <lists+linux-media@lfdr.de>; Fri,  5 Apr 2024 07:24:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E7CC381C6;
	Fri,  5 Apr 2024 07:23:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="VTtLasdR"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com [209.85.222.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EC5F36132
	for <linux-media@vger.kernel.org>; Fri,  5 Apr 2024 07:23:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712301805; cv=none; b=LJZiOpIvNnFrh5el0DVKyzvyV2JLxeNT8fZtXkxPQ9Z81zzAUrdPwojOU+lxRKY3BQbFVtRkyDComU5xy8vuvjbLNrDMM72wMBJEG164nNrxhC01PRyIHKUqn3YEELrLrQgo6isM3xbi7kFtWaEtmKLtDHbfgeLaoyYiMXyJOk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712301805; c=relaxed/simple;
	bh=nWhmRghyNt6Jg/NyCAzSPWxsJwzKVk2yWrFadbiL3wo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=crlABNZzzUw/A/k8DAXTwY7F7yk05gGY70I/aNX9rE5Tv7P8bqp3gxQbnlgn0TYREWtYKaGKGisXr/NN8m5xca5HqTPhdV9a8VLJYEfddNcAHnbdWGYAOpvjE0eCb5QpiTcjvaau9ikxz4DsiEcdqpEN85aapVnbLryGhRFlmpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=VTtLasdR; arc=none smtp.client-ip=209.85.222.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qk1-f194.google.com with SMTP id af79cd13be357-78a26803f1aso108740685a.3
        for <linux-media@vger.kernel.org>; Fri, 05 Apr 2024 00:23:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1712301803; x=1712906603; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=JUMwQHIkq2s6PP2HhBebNLyPm3hSUj+L7rns3+rNZm8=;
        b=VTtLasdR0Oc7wFnBWA1/rxtlI/YO71OnvucNT2Zvbb60eaum2WalbK0eToXQCVIl1/
         fTwlUggpOqqfIIFN7P+MH2NON0LaXEROkUfVdZdmITcrNv0R7pcIEl01CErsFG0HO30G
         WLdOQLJb9gPNbw0C8SBqQeWj/g4iQaMHzMWFM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712301803; x=1712906603;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JUMwQHIkq2s6PP2HhBebNLyPm3hSUj+L7rns3+rNZm8=;
        b=M7uFUB3me3ISMKNJZSnbhfFDzga8jXO4MgEb0Z1OnCQrHWxms3gmZFJynJ2IDYHVee
         9VJnPnC0NvJc+7wmYJvB2TMPXD0yc97d9AvuaGiX1h9RvfPk0faX1025z1QIc/IJeYuA
         DPkq5nc5x3p1A2W6ZiJeBGZOHClgNmdKnyEJbzrDqNrMgs7E+NJfI7/kUs7SbES6lOHY
         Wl7biYX+SR66iLb9brYQa57HAvLex2v+SjFbcYevNEGTvhd+XFAbDUZCn4I7iOTnZ/cI
         yOWWK9jmnPJb6xMSrKA9atTu/uvEJ4qqhmhDSNAXdKIpxjlPTUuaMf9o/1OTx4T/SP6g
         r1gw==
X-Forwarded-Encrypted: i=1; AJvYcCWffbnmZKqgDmo3xRFLljZYVpw6yj/OkI3YLrBfaQx03CkBzTNlIgYrI4ibhqRl974LsqpHRHFeNbJ4r6E9zIsBdJdnTvZQBsEPiNk=
X-Gm-Message-State: AOJu0YzcalAdgGonVw/ssk6Ao1O59lnQhqyFeB1BcjFK/TfCz79UTpZ7
	3K6hgLXxAO0KnVmZtwaFYQ9g+BkQ0aNta92CPbVABw4B0tb8tnPuNVt7BbcNfL7D5vUVLLPYEaD
	/Jg3s
X-Google-Smtp-Source: AGHT+IE12dVRbtr5usbjksSMPDENgQaHzs39L8uRsF98/yEfaS/pZW1PmDJKDHgXB5BzO3X5bRze5g==
X-Received: by 2002:ac8:5b8e:0:b0:431:3df7:ce48 with SMTP id a14-20020ac85b8e000000b004313df7ce48mr568322qta.12.1712301802868;
        Fri, 05 Apr 2024 00:23:22 -0700 (PDT)
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com. [209.85.219.53])
        by smtp.gmail.com with ESMTPSA id ea7-20020a05622a5b0700b004315aa3d5d7sm518297qtb.0.2024.04.05.00.23.21
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Apr 2024 00:23:22 -0700 (PDT)
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-6962e6fbf60so12029496d6.1
        for <linux-media@vger.kernel.org>; Fri, 05 Apr 2024 00:23:21 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUZ1OdiJBDynFjB0hXwbjjdJZQl/6sB+jKJQNxS3wNhiUo9BQe8Qm3HwGzmu7h0mVXjyIT1e+xtMzVdye6Y1tuPnUUBTkMn5Afk/MI=
X-Received: by 2002:ad4:5fcf:0:b0:699:225b:bb7d with SMTP id
 jq15-20020ad45fcf000000b00699225bbb7dmr526982qvb.36.1712301801562; Fri, 05
 Apr 2024 00:23:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240405-uvc-fix-relative-ptz-speed-v1-0-c32cdb2a899d@securitylive.com>
In-Reply-To: <20240405-uvc-fix-relative-ptz-speed-v1-0-c32cdb2a899d@securitylive.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 5 Apr 2024 09:23:04 +0200
X-Gmail-Original-Message-ID: <CANiDSCv50XHMA5-DQco2r8EbqvB3X9CyaKzyig4JyfiR=3AnfQ@mail.gmail.com>
Message-ID: <CANiDSCv50XHMA5-DQco2r8EbqvB3X9CyaKzyig4JyfiR=3AnfQ@mail.gmail.com>
Subject: Re: [PATCH 0/2] media: uvcvideo: UVC minimum relative pan/tilt/zoom
 speed fix
To: johnebgood@securitylive.com
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linh.tp.vu@gmail.com, soyer@irl.hu
Content-Type: text/plain; charset="UTF-8"

Hi John

On Fri, 5 Apr 2024 at 09:07, John Bauer via B4 Relay
<devnull+johnebgood.securitylive.com@kernel.org> wrote:
>
> Thanks for the help Ricardo, still figuring out this whole workflow.

Thanks for the changes. Can you squash 2/2 on 1/2 ?

I wonder why the patches are sent as PATCH instead of PATCHv2 ... :?
Are you using the last version of b4?

btw, if you want to avoid sending the patches to the list for testing you can do
b4 send --dry-run
and that will print the email instead of sending it.


>
> Signed-off-by: John Bauer <johnebgood@securitylive.com>
> ---
> Changes in v2:
> - Made recommended changes, moved control check to helper function and removed dead code.
> - Link to v1: https://lore.kernel.org/all/20240326-uvc-relative-ptz-speed-fix-v1-1-453fd5ccfd37@securitylive.com/
>
> ---
> John Bauer (2):
>       media: uvcvideo: UVC minimum relative pan/tilt/zoom speed fix.
>       Made recommended changes
>
>  drivers/media/usb/uvc/uvc_ctrl.c | 38 +++++++++++++++++++++++++++++++++-----
>  1 file changed, 33 insertions(+), 5 deletions(-)
> ---
> base-commit: e8f897f4afef0031fe618a8e94127a0934896aba
> change-id: 20240405-uvc-fix-relative-ptz-speed-e671f9a34449
>
> Best regards,
> --
> John Bauer <johnebgood@securitylive.com>
>
>


-- 
Ricardo Ribalda

