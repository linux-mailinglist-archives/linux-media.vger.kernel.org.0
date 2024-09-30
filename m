Return-Path: <linux-media+bounces-18785-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D142998A125
	for <lists+linux-media@lfdr.de>; Mon, 30 Sep 2024 13:51:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 052031C20FBB
	for <lists+linux-media@lfdr.de>; Mon, 30 Sep 2024 11:51:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC54A18E346;
	Mon, 30 Sep 2024 11:51:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FtvxzVci"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C738D18E039;
	Mon, 30 Sep 2024 11:51:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727697090; cv=none; b=MGtiHiLcaJsFYi6yJ7GetiXwEQAKjuwA8npx9prYn7qB42UYXEf8B8cnuqQ+b4OC0hJ8m0jmQthP4QZCp4clOee8hsO8RhIvqIE1NFlUsvoRYLnY78BcQCBjhXNSfGZihIlNGrd9I1EtNOref8CkpCxUtplAV49Qo4KuNPLxgvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727697090; c=relaxed/simple;
	bh=tdV9uVts2mI3/F5PUrh9npWP04do1rqaF0hXOVll7rY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DNc6/KmrOA2VrH0AwY/uSHUaB5UT1j4gdkzkCH+w6Wqx7EDR7Az3crgK9sve4vtUWw6EYqFo7cCJkDnp97P8NVhMZXU6HRGuTVJKBgzu8IXkme5HtC37pA+t0/i7gt9/bT3jDV7UuSZnQoCRIMadbKzCPg1nsIXBTOYw/IobSt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FtvxzVci; arc=none smtp.client-ip=209.85.221.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-50958a19485so406866e0c.2;
        Mon, 30 Sep 2024 04:51:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727697087; x=1728301887; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tdV9uVts2mI3/F5PUrh9npWP04do1rqaF0hXOVll7rY=;
        b=FtvxzVciKnbUiPXyaUOXJzhTIa6iMYnU7PBiIWWO4eI8U5GB20zZZ4GorYJ5NJOU4l
         Hlgz35pWCsloYOyWR49hni2ciftwMdEDcNl1tZIiffCpDdnQVnOAI16hOnVaQa9oX+Zz
         t4hSZukFzPaL8ZjgcexJXE6iaViKJ6rQA2tUZLT50F6+avA7hm/L/pYdExQV2Kk1VENv
         ns6DAvRVsjBjvogNvVjKg7wlEofUhsiJbybG4AYx3Zb7aVeYQaoFN1gysQTqV9qw8C2A
         OyVkxtmJ3iAqgor53n6xYd0uHmcx1VD3RdDB+G6/w8HCQAQAJu36V/4psfSiOGPJ7bnK
         HuSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727697087; x=1728301887;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tdV9uVts2mI3/F5PUrh9npWP04do1rqaF0hXOVll7rY=;
        b=AGV+3/3VkS68SBujecj0N+WNelzvQjaz7cZepIaqJNnZYPq2lk2ilagFGA3Uf8dVA4
         uk7xASsoB6QXFLjOB7yWLoXvHKId36mt/4fAbHWA+rimVN/K+2At8hXG6HsR13SaavPv
         amLkmaPWZx0/3AC1Qj6vWRSVuWoP/kdFIgDa0srXGGrhJKy4YBzy4e5k54GH+OW2iYNQ
         JXSCcKJdcCFwOdwPtzNNVHMESc0w0Nr5LFq6hN5u8AVGOwWNiiTwjmSj13/QPFw3x7yO
         fMUmN2akLh6pEVzooJvsmAJehNoGdEhOPKKKrbnlGrxI5UtGCOPoy19Qw9k2ZXfsoJjo
         I70Q==
X-Forwarded-Encrypted: i=1; AJvYcCUfpx8tLswY0joE5Cp6mV06bdjqimESQbUTmH2hx7wYyNsk/5EnQCHkKc+e89qYWNnU2unGhBH16sul+fk=@vger.kernel.org, AJvYcCVyhVNIxWkTwPrylLEpndwgbKO6C7jVl+ujl2gNBHp7WyYci9J9Q0VXYtXy2wLqjAS2PI2M3bQ1SlsdJxbICFrCn0k=@vger.kernel.org, AJvYcCXt6HjC8gGCA0ZL853G9B91bacC5r0Hf0D7cm3VQZkqxUQQtyJi7qZpPCrTXjvDGesQ454uv6YFsMnFHgU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzHlKRFa9/pPwQBVhJmishQcPhYjg8BT6yYBeVJKRhtTV9zLxOL
	nSyRKDkDTK9ziDpoFLTeQ6crFBTBzIAftjDVVCq0EFGHDrV6Nk2GSlBiiYwDT3mk5cfLKKrRrZ7
	xged3LdsrdRfzWPV/MVRkLCduD2I=
X-Google-Smtp-Source: AGHT+IEr3HLb/CcIg/mYgqJo3eSkEV6VHqba8bGSn5TXI7VVhlA0l3O3Ei/7lzB+GuU7uh0727lyq+zaB26ullrGWdM=
X-Received: by 2002:a05:6122:17a8:b0:4f6:b240:4af8 with SMTP id
 71dfb90a1353d-507818cc9e7mr6876249e0c.11.1727697087426; Mon, 30 Sep 2024
 04:51:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240910175357.229075-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20240910175357.229075-4-prabhakar.mahadev-lad.rj@bp.renesas.com> <20240927222400.GE12322@pendragon.ideasonboard.com>
In-Reply-To: <20240927222400.GE12322@pendragon.ideasonboard.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 30 Sep 2024 12:51:01 +0100
Message-ID: <CA+V-a8v=Su=FPUVXoqRqPJkhoWALT5U-7BQmTaogbTAQ4Y-xJw@mail.gmail.com>
Subject: Re: [PATCH v2 03/16] media: platform: rzg2l-cru: rzg2l-csi2: Mark
 sink and source pad with MUST_CONNECT flag
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Laurent,

Thank you for the review.

On Fri, Sep 27, 2024 at 11:24=E2=80=AFPM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Prabhakar,
>
> Thank you for the patch.
>
> On Tue, Sep 10, 2024 at 06:53:44PM +0100, Prabhakar wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Mark the sink and source pad with the MEDIA_PAD_FL_MUST_CONNECT flag to
> > ensure pipeline validation fails if it is not connected.
>
> The MUST_CONNECT flag only affects sink pads. That's not documented
> though, and it seems that most drivers using the flag sets it on both
> sink and source pads. That's probably a good practice, and the fact that
> the flag is only checked for sink pads is more of an implementation
> detail. This patch is thus fine.
>
Agreed.

> Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
>
> However, I think you should then set the flag on the source pad of the
> IP entity in patch 02/16. You can keep my Rb.
>
Sure, I'll add this flag in v3.

Cheers,
Prabhakar

