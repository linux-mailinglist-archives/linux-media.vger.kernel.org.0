Return-Path: <linux-media+bounces-37704-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E5EEEB046E8
	for <lists+linux-media@lfdr.de>; Mon, 14 Jul 2025 19:52:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3AA8E176F22
	for <lists+linux-media@lfdr.de>; Mon, 14 Jul 2025 17:53:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4EDA5266F0D;
	Mon, 14 Jul 2025 17:52:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dttQq4s9"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37EAF1F5433;
	Mon, 14 Jul 2025 17:52:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752515573; cv=none; b=Np4ytqYydzA5/AbNxWeT1kS/CU4jpnGbWVdWN0hiof91RZ1ahUhGZrPytZZMP5aICL9vo4VBn3FE/RZNQFrKYgTDKRp38OxXRuJak9r73Od9wLZVC5kmXNac2OTGA7oJ4kMwBR2vYnnZWT3rW+k7sZjeFQxq1B7w9iZgcPe1pjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752515573; c=relaxed/simple;
	bh=zCq/2mZHq/ntY8oalHFxYBS1i74/ZzELTNGs31STKs0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tOE6zxSGbNlYtdFWlwf7LWD5pfTbz/BJhyxiWrWvi7kv5Zjrw5bhGJFbE2BfuDaEFbqoj0X3LETngMs6wsh86kM2c9tje5K2wAxLwBoarhFj05dJlNvNNcw8GApos1XZ4lRgB2nW9H3uzEmMt6dxZy/T1tDKzwOyej2esksTheQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dttQq4s9; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-ae0dad3a179so780314166b.1;
        Mon, 14 Jul 2025 10:52:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752515570; x=1753120370; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zCq/2mZHq/ntY8oalHFxYBS1i74/ZzELTNGs31STKs0=;
        b=dttQq4s9vvMlCjj5n5ONk0xau7QXzNSQxLNghVKiG3N1+QvYLp5GEnkgzMC3cNbIkE
         xe0UMZsL7g3Y5S4hJWRJeoQWBm3klYlQQ1C5bSvowzda4x9ssIqGp5oCYkKOpjT3wR9S
         BZiRWrnXsRLf1qGlXH3f3JzxnowRb28nOKdIjkdLVzZaXAdElhcGAs+DXNxUQ4poaGj7
         iw53rW3qu2iin3cD6KFs7jVEBQX/iwgnZ5UyLqQMtuoY2DxeuhDloISxFNB8rs3RyaAk
         tEP6eAcL334FFklwGCr7TnRNYdClk/KL5vvurZcw5McXHPgQ2ZkNOvcnzycmCQE50bba
         bZPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752515570; x=1753120370;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zCq/2mZHq/ntY8oalHFxYBS1i74/ZzELTNGs31STKs0=;
        b=gOdiEx8J+1/2Mwge9Nhygvy1VZSuY3xEdwNXUDrYhR2tviqtbEpnizzdfFmZdAdMtz
         WZaZ6/6viT/4nsi5h5U+fGX5qSe0YkeNtWe3CUdQIYr3sbI8eYgDBR886ZpbeshwNcob
         p0rtRboONhiH6gn7bXAmnV2AljJjnV2kFahPehf3FVHHLa3kXn5DHD22LlJPm0GYjlL6
         8u3FD/VMw9n4qMudhEduE06WzxRN6rHOSZM7RtzwKmkqNpWgz7ZEI9laCc4NpH78qrXy
         mp/z0sB4uqpQxdUR2aN2Z9oU+btkoF/zxHYYUlRgDtd7q37lFJaaHCV7WTG/1tx0cf/g
         1q/w==
X-Forwarded-Encrypted: i=1; AJvYcCUJGuYHUHa1fbUn02OWTgm35G4f7pk/3YYpUKUrPNxq/XMHkbPTqR0+nLBbfZteQeHQv+DivmE5HRIvZdY=@vger.kernel.org, AJvYcCW5x2ziO1sD/G82oCo+4BPAcIwOC3XU307w1DJ2XAkUts00eC6o1pl6HeHzl4q3kO/wF92DTINWOyDFfzQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyDZVWBuhWBak8DZYG+1ulbEibS1JhqP3WP+fhztTwVWTLWo96G
	EID4LdJ+VYI48ISwtwHLKsbTF1a0+sf0zMXcnmXH7cWIJEcPaXOfzICzf9K9aF2m9uD5oKrOiKE
	6GEulNuXuBTo1VbA8u+xFa2E9xQkY4EA=
X-Gm-Gg: ASbGncurskrOODIz4WRBLP+4FLIsuI6kLJwBB6UHwdFySGjUDmuwjZo9ip5fxrI6bCp
	Ec4MyN8eOWGUnjpiQfx8HitPgpIG/k36+rQMzmetXNMmU4lMbwiSrGeMjxDgPGTXxsBdlbOKe+0
	tWZOrdUALtxggjWTmfI3PGZVVpi7I+1myMiyK61ANJpvn3gTxvvD2axJbbnz1K0I4k5ACsDF8xs
	Jq8JLw=
X-Google-Smtp-Source: AGHT+IHppmuBJAVnvU7iD2yEiRoTb2WqiF3hIcTYGCn0GFws3kLiMzGHRtx8vpxsrnEuQFvdpQLsnXvCatsqq/89dgg=
X-Received: by 2002:a17:907:7208:b0:ae3:5ff2:8ecd with SMTP id
 a640c23a62f3a-ae6fbc8878dmr1449677966b.20.1752515570314; Mon, 14 Jul 2025
 10:52:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250714132221.4611-1-devrtz@fortysixandtwo.eu> <CAHp75Ve6ejJSH3X4fMJ6MimH9On_V7Ors8xVWtcjWyp4jx+VHw@mail.gmail.com>
In-Reply-To: <CAHp75Ve6ejJSH3X4fMJ6MimH9On_V7Ors8xVWtcjWyp4jx+VHw@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 14 Jul 2025 20:52:13 +0300
X-Gm-Features: Ac12FXyJlqXKvwAc4CMMsV7GL7RdezTzq5kaHgCSaCWC_-zIt3Y6q1lh2LXK7Hc
Message-ID: <CAHp75VfFDWi2RVBsk3G0oW1LRrpVjjK=_Hn+DRzRSPO=Dj6EbA@mail.gmail.com>
Subject: Re: [PATCH] media: atomisp: put trailing statement on it's own line
To: Evangelos Ribeiro Tzaras <devrtz@fortysixandtwo.eu>
Cc: andy@kernel.org, hansg@kernel.org, mchehab@kernel.org, 
	sakari.ailus@linux.intel.com, gregkh@linuxfoundation.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev, ~lkcamp/patches@lists.sr.ht, koike@igalia.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 14, 2025 at 8:50=E2=80=AFPM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
> On Mon, Jul 14, 2025 at 4:22=E2=80=AFPM Evangelos Ribeiro Tzaras
> <devrtz@fortysixandtwo.eu> wrote:
> >
> > Fix checkpatch error "ERROR: trailing statements should be on next line=
"
> > in ia_css_formats.host.c:47.
>
> Is this the only single occurrence of such a problem in the whole driver?

There is another patch floating around targeting the same issue,
please coordinate and send only a few patches or ideally just one
against the whole driver (perhaps excluding i2c folder as Hans
actively working on it).


--=20
With Best Regards,
Andy Shevchenko

