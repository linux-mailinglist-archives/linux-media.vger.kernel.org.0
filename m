Return-Path: <linux-media+bounces-44610-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C84CBDF4B5
	for <lists+linux-media@lfdr.de>; Wed, 15 Oct 2025 17:14:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id AC2C44E7EAF
	for <lists+linux-media@lfdr.de>; Wed, 15 Oct 2025 15:14:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C79F82DFF18;
	Wed, 15 Oct 2025 15:14:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="YBNZec5s"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08F272DF716
	for <linux-media@vger.kernel.org>; Wed, 15 Oct 2025 15:14:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760541255; cv=none; b=lueP+T0FOGd75eEBVYekPOBz6/a/lhzYY2WpW/xSddoLy/IDoJDQ1yR2NXlKqtEuuF+t+DbHz/Vpxj6fSJvXG67/rclTSNrtOt5boeHZuaxEsAIG7DK15iS+ghh6KlCySePpWYqMDYoOzoc/kZETl2SQBXJJSd3BX6vMSwszYQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760541255; c=relaxed/simple;
	bh=vIIalLX2jBXQDzgelXcqDB6pZDhnjKni+zOmpg1Apt0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TZYiSYAYkT/2CgO3GNaPvyh4kI3HBPlFtPXDyxIok/+nGgRKYYHX42Edke3HyNKUpaXic5iu3+gh9GU0DHEwjwRv2r6y3mmWynB1EmaSDagRXGdy/ivuuPgxyclZhS/E+ULrDywzD1iOFEoO79K+b56hfmpd/hK5yO3rBqfF1s8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=YBNZec5s; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-b3c2c748bc8so961023966b.2
        for <linux-media@vger.kernel.org>; Wed, 15 Oct 2025 08:14:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1760541251; x=1761146051; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=PznC/nuL3306rXw8EmSWxaCJn0QKZKxL1qK91E1ce2s=;
        b=YBNZec5s4JwktZDza5iILJXkaUE+VXJFjgfpjbJUeiX7jGlAAmKMk+ttpO+e40jNG0
         MhUsoGDsGzs37+pjJUc+yh6NF2OOvWwnURYcgASEbv5Tw2kaU+IPWMCH9vQhHvP+dd88
         7EJlKVmVVMlGgO/4gQRgYzta2HvoT+gp+0SmY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760541251; x=1761146051;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PznC/nuL3306rXw8EmSWxaCJn0QKZKxL1qK91E1ce2s=;
        b=TF3h+jAl6O7DbUKveyvZXuiBbb0O/sN/dNuRzo3Pj6i9UAXvq8gir8IocP3BT+XWd3
         w1USaamlqHGIjKC0Yb6O+hLocMNvN9+e5Xa4ryLsrhpncQqa/b9KqftoEO0xEkZwUmCG
         49ZmSUgc6j2LDW1DNCFC3ckD0FcJ1oBFYyg6bMd1lC8XR/gk5Gf/VqY55K3urt9mWrbX
         Ef5BMWsilove5KWoBnJCmNx/GPBzNT/yJHaiUVIeIvEz3BgRZnKqy/3jIbzoH9mJbg08
         BU1vL4jUevnK/aMeZm/IzrJvUWcYRDVBMTk0pch99rM+liVqSDjghzK9sbAjMtug0wAA
         QyFw==
X-Forwarded-Encrypted: i=1; AJvYcCUQX0Ao8qdhXLySJT0xK8iCoCM62+k7lib19wsPp6kTmpfJn32awZTE3c5aFfCy+NBdB4dQnQSpXiIGGw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+Dl6Mr0LIoBh5qTFqPnj5LqM2BnmBNSnd1eKQsDtiiy1wy3/l
	qNp58PMmxoLicaxSL5yMLK5ZJpWp7BGmdHf3x9VXhMNUCWudt0yHl1OLCaPTjjNfuJ8DWcalhPK
	CP9O7xTM=
X-Gm-Gg: ASbGnctfsrqxhJBEYRNP4iLXqSBB53Z1QDmpkXBict6QIJ+Kf1zkdRwG/ePbXMNBlp9
	vL8W6xaMPPTZnm1DbMgF0T2hiH7i07wvvL604xAQe+RwlO04+WCb6erXfSbBbRt2L6PMkXPn+Tx
	HqsEchFDDHuJjiKNVEnKwlMcFb3WWskCypw4S4fnOFnalnCZXYbaWhstOnItOQEfHgAJj5VNCzm
	EiJ+vP7JcJ3Hwy+I2I+qojQ6kRs/hOmfnXU+oH+0PRO4Vfde2son0ecHgqa0aOrX9nbTyDQseq5
	HNKV+gtBFlIH+6GrzQCDA2VKMB3TIc8OhNWzuCy7BArKoxN65Q+Acw++pkEF3CYV58OyAQc3oGf
	GxCaLb0FOClx+EUHdoV9jHd5lhUY7vPvvSb/eD35f55JdBGX9VNDVecetYpI10AE0rqa1vsZXWk
	6lh7SZf/JKZw/kdErR4aP6qUoSjg==
X-Google-Smtp-Source: AGHT+IGEVMjbNklUm1AchFH9kPSaQrRLeplGFgCRWjSWZdajZoRDjuFIszKDoI7DOy3jys8fh4qZRQ==
X-Received: by 2002:a17:907:9409:b0:b50:893f:6fb8 with SMTP id a640c23a62f3a-b50acd2d7a7mr3104810266b.63.1760541250982;
        Wed, 15 Oct 2025 08:14:10 -0700 (PDT)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com. [209.85.208.41])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b5ccd6b03e8sm245872166b.75.2025.10.15.08.14.10
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Oct 2025 08:14:10 -0700 (PDT)
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6399328ff1fso11677448a12.0
        for <linux-media@vger.kernel.org>; Wed, 15 Oct 2025 08:14:10 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUgD8YhWMHUnN1rsTj1HJocouX/yiynxW1EHIqXYKh33uORkz0kUL76h/BVt97BBwuPmCgaquT46OKETw==@vger.kernel.org
X-Received: by 2002:a05:6402:84d:b0:618:528b:7f9b with SMTP id
 4fb4d7f45d1cf-639d5c514a7mr24205812a12.31.1760541247570; Wed, 15 Oct 2025
 08:14:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aO-cvXncl7dbnP_J@stanley.mountain>
In-Reply-To: <aO-cvXncl7dbnP_J@stanley.mountain>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 15 Oct 2025 08:13:51 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgKcf_dP0_7yTqL+JKc03mhFgqFHkN7jXLUrOy=WjWZUA@mail.gmail.com>
X-Gm-Features: AS18NWDdPlEEBZ1MVYFnkl3KJ8oytP--YOd7-XiMvlSP6Blf7tJGYJvbcV6IMuA
Message-ID: <CAHk-=wgKcf_dP0_7yTqL+JKc03mhFgqFHkN7jXLUrOy=WjWZUA@mail.gmail.com>
Subject: Re: [PATCH] builtin: implement __builtin_strlen() for constants
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: linux-sparse@vger.kernel.org, Ricardo Ribalda <ribalda@chromium.org>, 
	Kees Cook <kees@kernel.org>, linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 15 Oct 2025 at 06:09, Dan Carpenter <dan.carpenter@linaro.org> wrote:
>
> People are adding compile time asserts to check whether strings are
> the expected length.  In GCC and Clang strlen("foo") is expanded at
> compile time so this works, but in Sparse it triggers a "bad constant
> expression" warning.  Implement expand_strlen() to handle string
> literals.

Ack.

Except it's not quite right.

Try this:

    int i(void)
    {
        return __builtin_strlen("hello\0hi");
    }

and you'll see that it returns 8, even though the correct string length is 5.

So you should add a

    #include <string.h>

at the top, and do something like

-       expr->value = arg->string->length - 1;
+       expr->value = strlen(arg->string->data);

in there instead, because constant strings can have embedded NUL characters.

           Linus

