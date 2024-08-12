Return-Path: <linux-media+bounces-16130-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C49B94EA49
	for <lists+linux-media@lfdr.de>; Mon, 12 Aug 2024 11:51:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2574E1F22178
	for <lists+linux-media@lfdr.de>; Mon, 12 Aug 2024 09:51:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1EB516DC05;
	Mon, 12 Aug 2024 09:50:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="TE8suKoC"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 109CB16D4E6
	for <linux-media@vger.kernel.org>; Mon, 12 Aug 2024 09:50:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723456252; cv=none; b=s7Up6XXjfOSuA2SSvrnzbr/OZpmksWK6ldKgHR01V83at9hZC7RvbT3E3W/72Xh9i7w7EhQSFPOTABKQqImKDN6NxmnlzBMjaK1RvaupqydQpKYsRx75UG311Htd5DJeOZShX0UaDlfzv324DhJwhmT/5l9cyM75bhLdh51Vdfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723456252; c=relaxed/simple;
	bh=rFbhJ1kr9LbVJJHVCLKuVhtZqqyv3L8v38WNx4e/J0A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rpmJC+MT/EgUyRnDW39UN3sTcw0hgvXsyI9hM2vW8LkpCGA2iPY7QP2YztjSYUqpfR+/wclkZb9dk/OlwlxHbQQQd11jLMSuegpHI5GkdqmWIIP7GQNMg9C9sR7NldiKTPrQBpeOpy8DnipXpCOGRldndS8TkCHnIgODOTUX+Bo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=TE8suKoC; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a7d2a9a23d9so447230866b.3
        for <linux-media@vger.kernel.org>; Mon, 12 Aug 2024 02:50:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1723456247; x=1724061047; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=rFbhJ1kr9LbVJJHVCLKuVhtZqqyv3L8v38WNx4e/J0A=;
        b=TE8suKoCwDjWQG/MpeHI15uAlAj6J7bg5ChlMgmDcjtn79G3zmvUa9n4djqR689+Ux
         GFSXETj8ij4c4GbxEiaZgjtO/Wub/vqjzhG914kCNZFHpQm/LpZgSwFj/51wP+pjcNi8
         jpDxTk3PSINFkC9N0IW9OMuQ7iv/UkwyHW4Rg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723456247; x=1724061047;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rFbhJ1kr9LbVJJHVCLKuVhtZqqyv3L8v38WNx4e/J0A=;
        b=GvOy5Xlf945mMQXr5vWdtg/hKWsqHXlhj4kc429D+QhSGktWcUVYYjBVOvwOKWFeuT
         JsNC1KW4U1HTMD24W/ZCPIBh9PT6GCuNhmUDeRKq23HxXNIAfPIHmkeTsconxszS3XkY
         sSDAfyeor/pT4EUTHGeMsjJM7j0r9DVH/QF4WWZCEW6bJXzxVfiKIkVEzfO0/MuVRM8z
         6cSePBp5zy3IaOJk3O4C678ZhuZGSz0jvadWYDlbSUDLecrerBj+617gvUMmyiw8VA4j
         uNzhAomkNdltw9URmQH4B2N/WT4w032bRxeEDvvE6s8f8rb2oWLDtpaE9aNIXK43rVMS
         5H5w==
X-Forwarded-Encrypted: i=1; AJvYcCXjU8aUN9XYp7cMeHdIAtNDjcYU8YdOX/Z+dENo1JXnLh4cENH0F0bAWDdH6G0kl3+6Bp2ZiDG4YhGkp3ZKDl7SFFRaJJgrLcGP6jA=
X-Gm-Message-State: AOJu0Yx5WefywqGSgXPJLz3BMoQTFQ//KHOOuF/M0FnUkHSanBbjQRQg
	ckkzgSrTrL9zsWTi3KuqJY4GvaQ+EgecHIH5+oDjzFFB6lmnDRUDVbK9ivWCGrl1EbY11WrZIvM
	=
X-Google-Smtp-Source: AGHT+IGzjtkKm8SVCUjCAlXzsK6sj9wuby1YJvAgK7yDh+FuiJ6HT5jn/OYkNtazX0XNQSq7A0GTTg==
X-Received: by 2002:a17:907:e60b:b0:a7a:9a78:4b59 with SMTP id a640c23a62f3a-a80aa595cb9mr647738466b.23.1723456246961;
        Mon, 12 Aug 2024 02:50:46 -0700 (PDT)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com. [209.85.218.45])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a80bb119ab0sm216696366b.91.2024.08.12.02.50.46
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Aug 2024 02:50:46 -0700 (PDT)
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a7d2a9a23d9so447227466b.3
        for <linux-media@vger.kernel.org>; Mon, 12 Aug 2024 02:50:46 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWYkKgudEyM3DWst/rTWNhCAiUVYxQOzfcJ62v1Fy3mIqFYyYryEjRykVPN5K300b7dEjJkV5ph5I48zIi2qCZsqcaWWwqvYPXEOg8=
X-Received: by 2002:a17:907:2d91:b0:a7a:9ca6:528 with SMTP id
 a640c23a62f3a-a80aa546a28mr622117566b.11.1723456245700; Mon, 12 Aug 2024
 02:50:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240618-cocci-flexarray-v5-0-6a8294942f48@chromium.org> <4fsxowdpaeaxcnu7aewif6yqqk3jdgsjtksbznv2arnmmtiaq6@ibzf2qcel5lc>
In-Reply-To: <4fsxowdpaeaxcnu7aewif6yqqk3jdgsjtksbznv2arnmmtiaq6@ibzf2qcel5lc>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 12 Aug 2024 11:50:30 +0200
X-Gmail-Original-Message-ID: <CANiDSCtZWUx_RmZ8j3-x_LN_m76AzyrUUrUubCGt8kieLGvZfQ@mail.gmail.com>
Message-ID: <CANiDSCtZWUx_RmZ8j3-x_LN_m76AzyrUUrUubCGt8kieLGvZfQ@mail.gmail.com>
Subject: Re: [PATCH v5 00/10] media: Fix the last set of coccinelle warnings
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, 
	Vikash Garodia <quic_vgarodia@quicinc.com>, "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, 
	Hans Verkuil <hverkuil-cisco@xs4all.nl>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi

On Wed, 19 Jun 2024 at 08:41, Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On Tue, Jun 18, 2024 at 01:37:43PM GMT, Ricardo Ribalda wrote:
> > With this set we are done with all the cocci warning/errors.
> >
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > ---
> > Changes in v5: Thanks Vikash
> > - Remove patches already merged
> > - Fix typos and remove hfi_resource_ocmem_requirement
> > - Link to v4: https://lore.kernel.org/r/20240606-cocci-flexarray-v4-0-3379ee5eed28@chromium.org
> >
>
> Just for the clarfification: does the driver build without errors
> if only a part of the patchset is applied? I have the feeling that first
> patches introduce a build error which is fixed in a later patch. If
> that's the case, it's a no-go.


I believe it should build without errors for every patch: It has
passed the bisectability test

https://gitlab.freedesktop.org/linux-media/users/ribalda/-/jobs/62071294


>
> --
> With best wishes
> Dmitry



--
Ricardo Ribalda

