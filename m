Return-Path: <linux-media+bounces-22688-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 36FAB9E5133
	for <lists+linux-media@lfdr.de>; Thu,  5 Dec 2024 10:23:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7DC06160901
	for <lists+linux-media@lfdr.de>; Thu,  5 Dec 2024 09:22:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EF4F1D5AB5;
	Thu,  5 Dec 2024 09:22:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="KX8axpjs"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 127F018E028
	for <linux-media@vger.kernel.org>; Thu,  5 Dec 2024 09:22:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733390575; cv=none; b=cTj7+sN//Q15FoKP5Xm4HmgfsnfGPKrU+5WduB7iBucVWlLEjnyciLnbIgXjbUFgxavJ4FwpZF8zJfPRxZ0jtGkl1eOHnWF8G/kbEr9iMjbv2GyVhEkzLgU5RNk8vWZRlfxXiOUn3W95O3v/1KkIzjcQ5f4i9EnMEen7dAqGiJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733390575; c=relaxed/simple;
	bh=sDh/m2nFj/UAohFldz+DiqeIMvmHqFQm6MxZdqMUZhk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Z4f0sNW9lkBgakYQOhZ+x+k7Ve3tDF4zOvlf8qn+zRmnRAnNqB+sXM8rK5tlKkzy5GqSiBjLkitIhWYHKm01iIJ+j6VyRpaOyOs67PUzBC0qxzhUe29m7N3KfI6c6jIE5RL9+Oz0MH5ucwj7zM8N6AopebrGY2R5Jau3yzznxNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=KX8axpjs; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-7fbbe0fb0b8so492828a12.0
        for <linux-media@vger.kernel.org>; Thu, 05 Dec 2024 01:22:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1733390573; x=1733995373; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=8ahubzkpEHy3ukBOlQwLknvIWXz0ZiPmbHepWtRlxrk=;
        b=KX8axpjsdiqcSBWaNmRDggfuFF95x37cawmus3k6QNkyCKQBXubaYTkVk3Inoz5Bd4
         +72C5lWt2YNm0y0aqP8XnOfh3YL7WK4e5quGIQVDWNiRQdc9gPHSIfInleUB394UQBCy
         Fs0ooV/Jxee+hn6oBKXZupWmkddinJgcsDtSA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733390573; x=1733995373;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8ahubzkpEHy3ukBOlQwLknvIWXz0ZiPmbHepWtRlxrk=;
        b=aw4JiRqqLKBeWD6/KEk6xYe22xKXdz2W2su8P2DNOyPhdXCe/aWglGOKCOwMOAnl4Y
         zbs8Z+Oj0Mm0PEFcNDhzMCfu431i20EZ0qewDPkydhY13pKrioD84YxWDdVol3ZIQr23
         yD685W7nr4Ja9aN+cdwl/Vys9qAUyaTy8G6gWFmGfErNtDP49+101qLRubV1hvyjyfB2
         HuKR+we2FSgo3NTKd/Fmzy7a5oCqp092Y00nJWbX/T9Kt7b8WTbSNKzRP7PqbhN4AHgy
         YxdjO8fcvK3NrIKRUYsLSCzNYp+GZlwyJFFzlJt2tDFCMzoHP1Ek4v0Q4hhG/2Wt9x7z
         hxHA==
X-Forwarded-Encrypted: i=1; AJvYcCXALzPxISQx4eMnHDvdUnPoWztX0GpTCoIrJeiT1bpRyH00WdCOaxmWzbm259n7TmF3DSCPAvij9HE6fw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwDoe86Ie/tZLrmIPCcQWnO7qvCraiLRvzxE/xvKYOPvoOStnq/
	QiQV9r2oe8vRCwZNBQtXHb9h1eCLVfbhxbe/WsYsnfBTNEY7XCE38200BY0B0PWccWb0ABwShGA
	=
X-Gm-Gg: ASbGncsj6FnB4qKlRr99W+TtgPLrJ7DKqcXi+kzLiNejWq83+DL/6Uc/+UFTM2J0uXl
	2EQyOQBM1K63gePHXaxWTBXztA60IYjrbqoZHoDZUlpvYF+NnyjmnzE5ANQ09SHP6chqMdUgKVD
	kCINVBXde7czigjKU8av/2WG9wyvp2utPute6p9FiV2vQtg9GrgB3KGrjJCUs8itglJHGvoalgo
	Oz3FkNLTzI0LcR+9TMMXRMwcbipNcYMiVqr2cC2X9wpfxuWW4FWsvRYYe2ca3Bd0svdxbJy2/UG
	WNLIJans934VwsFv
X-Google-Smtp-Source: AGHT+IGNOSFCkp/lCLvOsZZdAwewdU7dJ+c1RX2SONXU334rdUyJTo9dp3iAgn1L9w4WgeOCrYS5qg==
X-Received: by 2002:a17:90b:3907:b0:2ee:bbe0:98cd with SMTP id 98e67ed59e1d1-2ef011e369dmr13566849a91.7.1733390573276;
        Thu, 05 Dec 2024 01:22:53 -0800 (PST)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com. [209.85.210.170])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-725a2cd1fb6sm821529b3a.194.2024.12.05.01.22.50
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Dec 2024 01:22:51 -0800 (PST)
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-724e1742d0dso625371b3a.0
        for <linux-media@vger.kernel.org>; Thu, 05 Dec 2024 01:22:50 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXT3UiTblWiOQxH0wylLry4gty7bKOkwjrfSzGCRcOvmA8nqbkrTnA9lCzUA5Sn3sF2nQqvII/PtmEgCA==@vger.kernel.org
X-Received: by 2002:a05:6a00:4b12:b0:725:9edd:dc30 with SMTP id
 d2e1a72fcca58-7259edddd9dmr2912405b3a.12.1733390569947; Thu, 05 Dec 2024
 01:22:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241204-ub9xx-fixes-v3-0-a933c109b323@ideasonboard.com>
 <67505692.920a0220.1e4a28.5c89@mx.google.com> <dce7f8d3-f682-448a-982b-3890f223bedf@ideasonboard.com>
 <Z1FvOiiNbl7jrqil@kekkonen.localdomain>
In-Reply-To: <Z1FvOiiNbl7jrqil@kekkonen.localdomain>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Thu, 5 Dec 2024 10:22:38 +0100
X-Gmail-Original-Message-ID: <CANiDSCt173zrs2pWEWXNYpVwzmi67cyPQTuYDcpiKMLwoAPifA@mail.gmail.com>
Message-ID: <CANiDSCt173zrs2pWEWXNYpVwzmi67cyPQTuYDcpiKMLwoAPifA@mail.gmail.com>
Subject: Re: [v3,00/15] media: i2c: ds90ub9xx: Misc fixes and improvements
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, linux-media@vger.kernel.org, 
	Hans Verkuil <hverkuil-cisco@xs4all.nl>
Content-Type: text/plain; charset="UTF-8"

In your patch you

Cc: Sakari
Signed-off: Sakari

You need to remove the Cc: once someone is already Signed-off:

I have improved the error message in media-ci.

On Thu, 5 Dec 2024 at 10:15, Sakari Ailus <sakari.ailus@linux.intel.com> wrote:
>
> On Wed, Dec 04, 2024 at 03:44:53PM +0200, Tomi Valkeinen wrote:
> > Hi,
> >
> > On 04/12/2024 15:18, Patchwork Integration wrote:
> > > Dear Tomi Valkeinen:
> > >
> > > Thanks for your patches! Unfortunately media-ci detected some issues:
> > >
> > > # Test media-patchstyle:./0001-media-i2c-ds90ub9x3-Fix-extra-fwnode_handle_put.patch
> > > WARNING: ./0001-media-i2c-ds90ub9x3-Fix-extra-fwnode_handle_put.patch: Don't Cc Sakari. They are already in Signed-off-by
> > > WARNING: ./0001-media-i2c-ds90ub9x3-Fix-extra-fwnode_handle_put.patch: Don't Cc Ailus. They are already in Signed-off-by
> > > WARNING: ./0001-media-i2c-ds90ub9x3-Fix-extra-fwnode_handle_put.patch: Don't Cc <sakari.ailus@linux.intel.com>. They are already in Signed-off-by
> >
> > What could these mean?
>
> Cc'd Ricardo.
>
> --
> Sakari Ailus



-- 
Ricardo Ribalda

