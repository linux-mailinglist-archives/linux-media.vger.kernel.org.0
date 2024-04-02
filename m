Return-Path: <linux-media+bounces-8395-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F18E8955FB
	for <lists+linux-media@lfdr.de>; Tue,  2 Apr 2024 16:00:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9F2FA1C224C5
	for <lists+linux-media@lfdr.de>; Tue,  2 Apr 2024 14:00:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92CFA85930;
	Tue,  2 Apr 2024 14:00:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="cdbeldvv"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F37484FA5
	for <linux-media@vger.kernel.org>; Tue,  2 Apr 2024 14:00:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712066410; cv=none; b=r3vTJuamhtf26epPSoYLQMiR5TvEPIAUu/FxweL2UkVBAWEyByizG6VH5X2sjzQ+vcDM5Zs4LBBb4H/+searpDcigOa1VWP6J6UnH+5lyqUraDlxqXE75WfLaaUAO/bQJ8kt/9Hm3Bff/aoWtoHC61naYqOWeGPzfXFbC5WxOTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712066410; c=relaxed/simple;
	bh=m6sNQTmfGxlsuizyDlXmcSM2iyLxXtFcL2BQDa3TpA4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XzJJ2qScDJzEOZHFQvvJQX5SekdzImUiP/0WKLP7lqLAd6m15aUmSU5/5lb6/0EfTHOxIfoa7iBqQz08wQks2YsMsSO78YYJHFhZzz0Ng1pUIoNvfzPnj/GMggoZhzsa5/KV0ZI13ObB8xJlRy4MtT0hlIFk1gQQ8xwGVlY/Ml8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=cdbeldvv; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-563cb3ba9daso5127121a12.3
        for <linux-media@vger.kernel.org>; Tue, 02 Apr 2024 07:00:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1712066407; x=1712671207; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m6sNQTmfGxlsuizyDlXmcSM2iyLxXtFcL2BQDa3TpA4=;
        b=cdbeldvvL+mBaSy03cdvQm24ZWKFfRaWj2h98PAW+ajXWjqnjZh8htpgWwLEhIu+Zj
         70Po7+4peuygNRxe9CRQtjI1qQQmVjMOmxaLU5BBa5NrS57WVW5klKy3v7H4pYwJhJFG
         8yonnl6PS8vOnytjX4ev3itzP3NScBPLy2sn8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712066407; x=1712671207;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m6sNQTmfGxlsuizyDlXmcSM2iyLxXtFcL2BQDa3TpA4=;
        b=vtpMXnUHaaSJgaXXphcB2qqLQrCjefRHAJOH3m398/nsOJoL1mlFWyLvnB2bhL5zl/
         KYWGodb6KiHeiZBANpYjqT3U9sB93uBKHLTM5XiO6utI8dt/4Bgitb/Sp20jmHCcvqT/
         8ooKsu6xXQeMmNYVQu8cadpKxwn3R1LOneisSYnEetzVYayP4KLrHmQA8E2efYt4CBMP
         rptZ/zz9eDamVl9NyvDabb+OWkGiTa1/OYGwx6QS7MgjLFOoESSIf1YUrsaeKHDH22yn
         WO6CmQz1obFgdBrMKWchgDcdvOVI/Jcdh8jEdMci1o/OXxlMy06QNhb22Q87TyIxIbD7
         LztQ==
X-Forwarded-Encrypted: i=1; AJvYcCWIcL6DNkaG7t4w6q7SYKRrcJQHtTrvvz5CBYf4rtSuPSKjOvNRV4X3q5fUnsEZ1F8hF7JG9rS4vVJ15q+eE9OqmjEV1ZGDh7SEc7E=
X-Gm-Message-State: AOJu0YxhMTVtl9uYcIfpxCg95HOgIcGpTVYp1EEYGmNbQbCr5dvZLSbS
	FhIr4OJJhqRw2naEfRyv9igeSA2XrcB/8AWbGTEzaUvQSQU8Qh5/QE2oQK16CIhgE9G49jteoed
	fidGA9E1A+L8ClVoxFzojFAlhC6TtgK/7DEk35CIFeTZKTh9mrg==
X-Google-Smtp-Source: AGHT+IGv7kzldk1Apny7yTRUZFx4YqoHlC5+McCjdum6s0g5nYhqkKti8NM86aOCnJZ3m2HqiQU1bxzstYaKKVyHl0o=
X-Received: by 2002:a50:c199:0:b0:56d:b7d6:d64b with SMTP id
 m25-20020a50c199000000b0056db7d6d64bmr8078495edf.29.1712066407417; Tue, 02
 Apr 2024 07:00:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20230920125939.1478-1-ricardo@ribalda.com> <ZQruPPVjqbWXAGmL@valkosipuli.retiisi.eu>
 <CAPybu_04iU75nFm3Misv9qQajzGKu9jmLvTX2nwsLn3AAZcdtg@mail.gmail.com>
In-Reply-To: <CAPybu_04iU75nFm3Misv9qQajzGKu9jmLvTX2nwsLn3AAZcdtg@mail.gmail.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 2 Apr 2024 15:59:56 +0200
Message-ID: <CAMrC3HsbgV23hAQ0T9_97XkhKwn07WOfinXSQ14wZT8SgTfd2g@mail.gmail.com>
Subject: Re: [PATCH] yavta: Format type errors for non x86 arches
To: Ricardo Ribalda Delgado <ricardo@ribalda.com>
Cc: Sakari Ailus <sakari.ailus@iki.fi>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, linux-media@vger.kernel.org, 
	hverkuil@xs4all.nl
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Laurent

I can see that you updated yavta recently...

Any chance that you can take a look at this?

Thanks!

On Fri, Oct 20, 2023 at 9:07=E2=80=AFAM Ricardo Ribalda Delgado
<ricardo@ribalda.com> wrote:
>
> @Laurent Pinchart
>
> Friendly Ping :)
>
> On Wed, Sep 20, 2023 at 10:06=E2=80=AFPM Sakari Ailus <sakari.ailus@iki.f=
i> wrote:
> >
> > Hi Ricardo,
> >
> > Thanks for the update.
> >
> > On Wed, Sep 20, 2023 at 02:59:39PM +0200, Ricardo Ribalda wrote:
> > > mipsel64el, ppc64el, ia64, ppc64, sparc64 and x32 have different leng=
hts
> > > for long long ints, which result in some compilation errors.
> > >
> > > Lets add some castings and inttypes macros to help the compiler deal =
with
> > > this.
> > >
> > > We have to use the castings, because kernel types (__u64 et al) does =
not
> > > seem to be compatible with inttypes macros.
> > >
> > > Signed-off-by: Ricardo Ribalda <ricardo@ribalda.com>
> >
> > It'd be great to address this in the kernel. The kernel UAPI integer ty=
pes
> > have been around for a very long time so there could be issues in doing
> > that, too.
> >
> > Reviewed-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> >
> > --
> > Kind regards,
> >
> > Sakari Ailus

