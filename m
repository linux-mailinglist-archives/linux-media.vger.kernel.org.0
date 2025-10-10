Return-Path: <linux-media+bounces-44156-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 89845BCC533
	for <lists+linux-media@lfdr.de>; Fri, 10 Oct 2025 11:22:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7B7DB1A6430C
	for <lists+linux-media@lfdr.de>; Fri, 10 Oct 2025 09:22:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 605F726D4DE;
	Fri, 10 Oct 2025 09:22:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="kl5cv36I"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDB06238171
	for <linux-media@vger.kernel.org>; Fri, 10 Oct 2025 09:22:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760088136; cv=none; b=P4IQZUUDmLy5I0ojQGlC+ZwdzriBgvI/RQh1AOl+4RoapoG49Wqy93YVcXTEst1EALnAaDTfl7WOqcXQio6KE/fAT3hRBBe0y6LfPgCijtltYUzAhh1dKaqZ5K+6XWe8ceuZe4skonzDBXQN1CMoZB2EqfZL/dCyTWmpJl3QPRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760088136; c=relaxed/simple;
	bh=CzvDsWLampg9VAf/LvOkvSrTcQwH28X2GWyg/bdnTyo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=poRo+cCGX3ND2s/FA58vy1DvTCWMzE8jY3E/0EANlGcI53samxBUb2aMjNiCO+rISm9ZeQ2tN9H9lLQrGxMWyoS6PrQR8wtOzjIBgO8U0TSiz2Jh/2opiBiQB9tdnUvEkmu8s5CnwfJGsuaMhbIwyg+EbqEtzeUy5HI4UP4RO1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=kl5cv36I; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-57d5ccd73dfso1949443e87.0
        for <linux-media@vger.kernel.org>; Fri, 10 Oct 2025 02:22:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1760088132; x=1760692932; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=yA5OiQ4i/rUoM5qYhKKP074hHPjtqMdjdXLHXj7WRdk=;
        b=kl5cv36IFf7tclD5j/7Kf7zVg2djk6BRqEGJtmq+rXsccrviE4G9r9FxyRZIwYvdVF
         rWg6kOlGnypd9ihik5Rj6M6ZpgvBwnl2TdH690F11Y9IWyAh+HSgUyyvjz5jYM4zjQZ0
         olEXZwfhTUItASMPWE5lHw3GAtvL8Ec5lw5Pk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760088132; x=1760692932;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yA5OiQ4i/rUoM5qYhKKP074hHPjtqMdjdXLHXj7WRdk=;
        b=qS5hzLH9Wdc6R6j2TqkOsR1DUg9UgPUYLQxeduUT02EYgXZ4TA+uQZ5AH8gMEMl0Co
         tjFXvd6JyU+zWlULrjWJVyQg2+F373mRxdX24NK3FP5a9bjAIDLikdDF6jJ8EmjQXlaH
         PAo/lKspZKlSIDcOk0p+QIsl1TIqk/mc9TXvyzE+3FiW3gh5j+BZXi06r5k4ZjyXS8oQ
         jc+6MrgcImmQvPkpUTlymGv48iSYetHWe62LtFO7bxDzo4j2VB5ycZpKYMuykjXVaqd2
         Qo7J73nl0XZkYhm88rMpeO++lRw0NBLDWOEJx4DgAf6nKEV5lwm+WgfbAJA8OnVv0EWc
         NwGg==
X-Forwarded-Encrypted: i=1; AJvYcCVNV59ZLBYSD3NIApcY5rBP0IOWkshFrQxx5g6S4Ozl9Gqgd9mQGy3izaeCpkeg5tK6aUq7BtyYgZBO8A==@vger.kernel.org
X-Gm-Message-State: AOJu0YzscZUWsBZsUGSnXj/FV51zOX3T/GZPIwIfD/VG0vTlOLC4bXlY
	7GMnxjy63GWalpNHlzOp0oq6U6AvSR56NZXSYvulkXb+4aaEaziM8A8XVE6YHkds5qLYUDOBeo5
	T9wU=
X-Gm-Gg: ASbGncteS4RCO/tZnVYYeTiha8U4tva4SfCHSIeTACvsNeWurgDUkmfRFc5bstlH6ho
	hnevyZdp+RjUmhVBl2JFTvMZG99ly1x5Bsca6ntORnhvpqxVPRqiqS8+TDHbDee0HbGuQW73qgp
	cG7XeXh6Y4j4abivOxrIkZOI85JjBQezPEuNrmHNycPY9mqqkk9e4/i/WHTjYaKB8qqsrYmoLDw
	D8YohKNlVDjos8X7Dz/hEpY/TaF15xz2BDYmdQLORnxQga1N0v+1s7jQUaqVtGpIw2lc8h6voy8
	IAYYJCQFvKYdy6SbYzg1PJSZ2WQxlFuHHJft7crFwfyHtPbrAMo7m2ZFWGpldeJIhETvi4729V6
	okbcOiLVupEFDFcBKkSy0lag2uOUzmsFaixKsn+9zkGmqsM9XA+VmaOHnpqCKgdfMM9UM/P4lIg
	daeoyFO9e4CXoCEA==
X-Google-Smtp-Source: AGHT+IHy2Qm1ByUhq1kpDLqDcyLfQepVtnj7NwtsEqJ+rS/k0tDxA/+swL4XZuM9LX6feec4sNXmsg==
X-Received: by 2002:a05:6512:b29:b0:579:e5da:e530 with SMTP id 2adb3069b0e04-5906d87b299mr3247381e87.10.1760088131900;
        Fri, 10 Oct 2025 02:22:11 -0700 (PDT)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com. [209.85.167.46])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59088584812sm692039e87.122.2025.10.10.02.22.10
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Oct 2025 02:22:11 -0700 (PDT)
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-579d7104c37so2387183e87.3
        for <linux-media@vger.kernel.org>; Fri, 10 Oct 2025 02:22:10 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWDDGFnAJHorijSMWTdpQQAutJi4ZHSocCXZ/D0Ga0IJeo5PIURKZPi5zwXUr3vp5OCIL2OZafA4WY8tA==@vger.kernel.org
X-Received: by 2002:a05:6512:3f12:b0:576:dc1e:d6c9 with SMTP id
 2adb3069b0e04-5906d87baafmr2977784e87.11.1760088129654; Fri, 10 Oct 2025
 02:22:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CO1PR18MB463349680603EC2C284B7FEFF71BA@CO1PR18MB4633.namprd18.prod.outlook.com>
 <CANiDSCtwhpCAgQY73phJE0okN+Smv_AbA6Q+w2tuTVW1_qcbDg@mail.gmail.com> <wm5gfxhvifqamhatze5pfeyzfm6hnyknd4ww2bf75nwmw3okyn@7jmk66eibia5>
In-Reply-To: <wm5gfxhvifqamhatze5pfeyzfm6hnyknd4ww2bf75nwmw3okyn@7jmk66eibia5>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 10 Oct 2025 11:21:56 +0200
X-Gmail-Original-Message-ID: <CANiDSCuwo2NnA_fcVVeTw2hSJn=KfxbuxkwjU7=+uEhasNzpzg@mail.gmail.com>
X-Gm-Features: AS18NWAPzHNRmyOVCv95sZ7F2KHolfcZcGSMyykNA4IF0XlRHqwOJmhypj3CWW4
Message-ID: <CANiDSCuwo2NnA_fcVVeTw2hSJn=KfxbuxkwjU7=+uEhasNzpzg@mail.gmail.com>
Subject: Re: Realsense camera patch
To: =?UTF-8?Q?Wojciech_G=C5=82adysz?= <kontra.wojciech.gladysz@gmail.com>
Cc: Gladysz WojciechX <wojciechx.gladysz@realsenseai.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Hans de Goede <hansg@kernel.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, 
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, yogev.modlin@realsenseai.com
Content-Type: text/plain; charset="UTF-8"

Hi Wojciech


Thanks for collecting the lsusb info. Unfortunately neither b4 nor
patchwork seem to understand the patch

ribalda@ribalda:~/work/linux$ b4 shazam
wm5gfxhvifqamhatze5pfeyzfm6hnyknd4ww2bf75nwmw3okyn@7jmk66eibia5
Grabbing thread from
lore.kernel.org/all/wm5gfxhvifqamhatze5pfeyzfm6hnyknd4ww2bf75nwmw3okyn@7jmk66eibia5/t.mbox.gz
Analyzing 4 messages in the thread
No patches found.

https://patchwork.linuxtv.org/project/linux-media/patch/wm5gfxhvifqamhatze5pfeyzfm6hnyknd4ww2bf75nwmw3okyn@7jmk66eibia5/
The page URL requested
(/project/linux-media/patch/wm5gfxhvifqamhatze5pfeyzfm6hnyknd4ww2bf75nwmw3okyn%407jmk66eibia5/)
does not exist.


Maybe you can try one of these two methods:
https://git-send-email.io/
https://b4.docs.kernel.org/en/latest/contributor/overview.html


Thanks :)



-- 
Ricardo Ribalda

