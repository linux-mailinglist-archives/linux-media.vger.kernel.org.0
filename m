Return-Path: <linux-media+bounces-44727-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id A7CACBE33A5
	for <lists+linux-media@lfdr.de>; Thu, 16 Oct 2025 14:05:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 226F4502387
	for <lists+linux-media@lfdr.de>; Thu, 16 Oct 2025 12:05:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDE5531D383;
	Thu, 16 Oct 2025 12:05:17 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yx1-f43.google.com (mail-yx1-f43.google.com [74.125.224.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0C3531B105
	for <linux-media@vger.kernel.org>; Thu, 16 Oct 2025 12:05:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760616317; cv=none; b=Xy75fqPC9ADAMPBq1E/0PHKNJZBOWIAD26pUtm7EeqtI3WEV1uPkWhb5MqfcoUdeaFGtsnjhgnvz3SpteVgC/8lsJAKdYdF/o6joL8dx0gKNNS/PtaGzkdlw4jldGCpZzqC3WUg6MTTLY01X7bFup+0VMfVL5EcUIaCODlbw1rw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760616317; c=relaxed/simple;
	bh=GqAKJK54/uF+NFRmildYJfAKhtlHFPU56asZDkSU5Rc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fj2Dgj55raB13YMREVJRTQEu5XImDWqRQOT0KVSbuNWlBtiyHnbYIb5Sn/upjWjnpZJyWCNQgOBCsSJkRAAPl9liIyLJzWt4M7Gw5+HWnOUggnKmXFAtDBBcyXrYyoQBi8zecYtjVO5UwF43U5U/Hrgrl9WRNyFZTYc5uiwZ2yY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chrisli.org; spf=pass smtp.mailfrom=chrisli.org; arc=none smtp.client-ip=74.125.224.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chrisli.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisli.org
Received: by mail-yx1-f43.google.com with SMTP id 956f58d0204a3-63cd60ca2b2so762452d50.2
        for <linux-media@vger.kernel.org>; Thu, 16 Oct 2025 05:05:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760616315; x=1761221115;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p6NCNp1v7fwHDK6nw1lwRkEI5nN2DLkyaDuxO07PW0g=;
        b=qNEEom//Wemr2DDJ+PCKNCW8eQvgneh/OZea/tHuiXEqNcJdymr0JQm1sGOYQMFzuY
         6CVkL7ub+As22cL0xejuT8D0EMuYD70htAlcCribI6fsq2idFpTJmq6jA8s7D+gnN0Ns
         A2wpjWWhtwAKrqWYRF7y7AFfYTi3aYMCaVnDrczjxvnUL6IL2ADMzGi08hJoIVYA0f7z
         PHwSAYR6sET8gpK2zwDmZNEqkneYflbiZuwAF4bxJ+wzy/Hpiv6t25F3duWv3+MkQyzR
         siufL2UAYduDr0Y2nceYHWhgF+I96fKUE/bzUsxTYZkiN6JuuCYAUYcQ15JvayFijvME
         7ErA==
X-Forwarded-Encrypted: i=1; AJvYcCWUOSj5LhmXPNXB886NdI90Z2/TkFDmkyI5WuzLy660sB+uH4J+G106cQe3AXeFOZwT+hAUtIiKKQeGYQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/OXHh8HbECBVjANNNw/nu/bRuppsSZroUbJS9FY1bTQwPQR+e
	Ol91tlhlk4XFRVWUY1g4dQyqdZq4IVr+e5vUnGXJJL3MZOOv35hmW1Y6uwYNa969PSYW7TuBX5d
	1E9fnGd3p7gJLKQYFuf2pbRIL1xyEdSVYO0UlJJcV8A==
X-Gm-Gg: ASbGnctfMD2Eo32wG5eLmqcq/TkrzItnhoarvHWfe+B8KAiewAFMo5298S9h9BfHbOW
	9IyA1VbwwsoQa2Bhd4V7oDT8vFkwmG0VoFmlzLV4Paa5Rz9sQwaVp8R+usazsRw/2Uk532xhh7O
	juyDz7hXTvtaucVBSvuCFyIxCi1J06s8FzrGNilL70s4KNeuTs8yc6hi6fjjwGTp7rfcDSrPx4q
	ZE9jcQHpCyzUTDX2ms5wTwbt3fIDEC6sXUSc7P4Rv6tbeDaIRB1ZPozLXETEZ7SePum4Q==
X-Google-Smtp-Source: AGHT+IEqVxED2LHwKa8sHNu/CN44BShEryScj0XS4qcB8mvl4A1/yCPvdGkXOwqINTlZjAL52MfgRJ2BTryRGWdFYJo=
X-Received: by 2002:a53:cd86:0:b0:63b:fcf:5c5c with SMTP id
 956f58d0204a3-63ccb817b33mr19824859d50.11.1760616314784; Thu, 16 Oct 2025
 05:05:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aO-cvXncl7dbnP_J@stanley.mountain> <CAHk-=wgKcf_dP0_7yTqL+JKc03mhFgqFHkN7jXLUrOy=WjWZUA@mail.gmail.com>
 <aPCs46Sno0a4dsyK@stanley.mountain>
In-Reply-To: <aPCs46Sno0a4dsyK@stanley.mountain>
From: Chris Li <sparse@chrisli.org>
Date: Thu, 16 Oct 2025 05:05:03 -0700
X-Gm-Features: AS18NWBv29VoayyVCgViVyockHfO_SFhnGOSkLe-qT_2MjboIajTGEGKPRI-1UE
Message-ID: <CACePvbVG2KrGQq4cNKV=wbO5h=jp3M0RO1SdfX8kV4OukjPG8A@mail.gmail.com>
Subject: Re: [PATCH] builtin: implement __builtin_strlen() for constants
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-sparse@vger.kernel.org, 
	Ricardo Ribalda <ribalda@chromium.org>, Kees Cook <kees@kernel.org>, linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks,

Will apply with Linus' fix up.

Chris

On Thu, Oct 16, 2025 at 1:29=E2=80=AFAM Dan Carpenter <dan.carpenter@linaro=
.org> wrote:
>
> On Wed, Oct 15, 2025 at 08:13:51AM -0700, Linus Torvalds wrote:
> > So you should add a
> >
> >     #include <string.h>
> >
> > at the top, and do something like
> >
> > -       expr->value =3D arg->string->length - 1;
> > +       expr->value =3D strlen(arg->string->data);
> >
> > in there instead, because constant strings can have embedded NUL charac=
ters.
> >
> >            Linus
>
> Ah.  Thanks.
>
> regards,
> dan carpenter
>

