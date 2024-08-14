Return-Path: <linux-media+bounces-16323-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 93501952617
	for <lists+linux-media@lfdr.de>; Thu, 15 Aug 2024 01:06:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 504DF2847D8
	for <lists+linux-media@lfdr.de>; Wed, 14 Aug 2024 23:06:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8746114D6F9;
	Wed, 14 Aug 2024 23:05:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OWHKHTz0"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C00D13C820;
	Wed, 14 Aug 2024 23:05:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723676754; cv=none; b=NfvFp8BT4Lo9awG9ulVBItAsPCI7F5K/bG63mZOwBPb8zQaA1Lo1NFTy25yMkMoNE3W21OvOXUPKviY0ll30NvcB28OY6I/HBv+oXHETZ4do61UPL1vT/zaVwAEDPylNuNlU7UkKGk0gR/Cc3+2rhzcChnh1jg3p4kU4AVsgr9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723676754; c=relaxed/simple;
	bh=IUvUGm/V0nCqDkIYsDq8Vbc8q/STJeH25QPDhv1EN8s=;
	h=References:From:To:Cc:Subject:Date:In-reply-to:Message-ID:
	 MIME-Version:Content-Type; b=daihnEQzQ3w81PTfAoEPyadqP3knVajkHqWfz5JzMs5I4l2YAQ+T8MzgZ0xqmPIceQDC8tF5mBPivKH/X19UIiIzn3PPp4ulnmbdxLaQ0c5MtvQ6TJeJZaXPTl4sGQmw3KPJktx8VTmQQslpV++4Ik+DQkBzfFbxoyuRlvQY4DE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OWHKHTz0; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5314c6dbaa5so438818e87.2;
        Wed, 14 Aug 2024 16:05:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723676750; x=1724281550; darn=vger.kernel.org;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=EUxNA3Cy2rNBrx7LkTwf7TKvxf2U4CHy2gZA/pu4uTw=;
        b=OWHKHTz0zrSshnsFQL35Z4F/E1y3EsVViP2/oNnn0gD1/60eYGd7g9mERgERNwIS8r
         6LQCu/4dFh89iWQE0NO3U+Z0tN3y6Z+FPzYmid3hbCG1u5KbKfTfEHZltqU5sLZ5vW0n
         if9wQdW+guDgfcDgOnLhDGiy1HgcQ5LldO41pLsXmNPlaa5AmfHmIbL+rtjQineijz6D
         979V8+ZD3UgjDuabGfchWTvoJahtW1PSeu4cGmAfKzvew7bIcZS/wYOXedtapTQ89n2T
         fqpw6f3FgrkdJA5pmY6rbugeLvuoFLUQ82NlKn8JOJWQ4WEOxkv51GZfkT64SGWsmzEc
         eMkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723676750; x=1724281550;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EUxNA3Cy2rNBrx7LkTwf7TKvxf2U4CHy2gZA/pu4uTw=;
        b=bEssjP59V0hfc8KgP5w+EOtJkaXNW0vB6AEOyjj2JIbQL/86n7KVlFs7VdlTAVHEYB
         NOT8uOBBEuxI0RHPLPiKTPKvhkA1As0UqfTDJS4vj/Czo4ivuESq7aabyO+whwrNMAO0
         dk/vifcm9mYufbnphKr+iaVSP1ievfCe7gnVF3bRZ0KwTVKFzdwxpCDynsDPIJeDBc92
         iulOyl0OWXlU4YfIudpzhOILmu5TxHxpIzHGLWCBJRD5QnnMjySk6M3ET/8Zu84E4KB5
         WVcnn/baT3JyHjehkx6krbH9BeJwhdHtV0v38KDil8zslbCuUpXxxXcjwaWtmFmzUaJs
         dusA==
X-Forwarded-Encrypted: i=1; AJvYcCXUgCacJOOEV/cSVigs52JMag9c8WkXV0c8iQ3gAM6sFlAbYGjL+RznWlrTCO5QFbFoXObTqNMELXUpjII6xbW0qw4KNR1IGcbmLbkN
X-Gm-Message-State: AOJu0Yw4e7BbvhXTneUOHJ4/S1ckhEioeIU5njWO7g3i+fVwBD4Nr1Lm
	uQqenTf+U3jQ+SFP945CqpmJbFWyvEdP7xFRmhn34ApCMFS430yo
X-Google-Smtp-Source: AGHT+IFYIFNwRXAVFQv3xJNu2gquUFbZ1LYoki8yuQzVAJ23YF3lMTLJ+qcWMCFpbRjK2wfbMTHvFA==
X-Received: by 2002:a05:6512:6c2:b0:52c:df77:6507 with SMTP id 2adb3069b0e04-532edbe9ce5mr2620009e87.37.1723676749908;
        Wed, 14 Aug 2024 16:05:49 -0700 (PDT)
Received: from razdolb ([77.220.204.220])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5330d41df96sm29991e87.202.2024.08.14.16.05.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Aug 2024 16:05:49 -0700 (PDT)
References: <20240616202433.227895-1-mike.rudenko@gmail.com>
User-agent: mu4e 1.10.8; emacs 29.3.50
From: Mikhail Rudenko <mike.rudenko@gmail.com>
To: Mikhail Rudenko <mike.rudenko@gmail.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, Sakari Ailus
 <sakari.ailus@linux.intel.com>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, Jacopo Mondi <jacopo@jmondi.org>,
 Tommaso Merciai <tomm.merciai@gmail.com>, Christophe JAILLET
 <christophe.jaillet@wanadoo.fr>, Dave Stevenson
 <dave.stevenson@raspberrypi.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>
Subject: Re: [PATCH 0/4] Omnivision OV4689 cropping and binning
Date: Thu, 15 Aug 2024 02:01:08 +0300
In-reply-to: <20240616202433.227895-1-mike.rudenko@gmail.com>
Message-ID: <8734n63dti.fsf@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On 2024-06-16 at 23:24 +03, Mikhail Rudenko <mike.rudenko@gmail.com> wrote:

> This small series consists of patches 17-20 from [1], which were
> requested to merged separately later. No significant changes have been
> made since and the R-b's are kept.
>
> Patch 1 implements configurable analogue crop rectangle via
> .set_selection callback. Patches 2 and 3 are refactorings and are not
> supposed to introduce any functional change. Patch 4 enables 2x2
> binning option.
>
> [1] https://lore.kernel.org/all/20240402164552.19171-1-mike.rudenko@gmail.com/
>
> Mikhail Rudenko (4):
>   media: i2c: ov4689: Configurable analogue crop
>   media: i2c: ov4689: Eliminate struct ov4689_mode
>   media: i2c: ov4689: Refactor ov4689_s_stream
>   media: i2c: ov4689: Implement 2x2 binning
>
>  drivers/media/i2c/ov4689.c | 483 +++++++++++++++++++++++++------------
>  1 file changed, 328 insertions(+), 155 deletions(-)

Gentle ping.

Sakari, in [1] you said the these four patches should be postponed until
internal API refactoring is complete. Is it complete now? Could you
point out the places where new API should be used?

[1] https://lore.kernel.org/all/ZhzEdXz-R2I6nZXf@kekkonen.localdomain/

--
Best regards,
Mikhail Rudenko

