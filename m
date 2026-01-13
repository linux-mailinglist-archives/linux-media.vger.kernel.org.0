Return-Path: <linux-media+bounces-50543-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id AEDE5D1817E
	for <lists+linux-media@lfdr.de>; Tue, 13 Jan 2026 11:39:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 01F64302ABB0
	for <lists+linux-media@lfdr.de>; Tue, 13 Jan 2026 10:37:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B41BD341079;
	Tue, 13 Jan 2026 10:37:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YCjENTCZ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE0C9310636
	for <linux-media@vger.kernel.org>; Tue, 13 Jan 2026 10:37:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768300638; cv=none; b=ZSYmqrwbjYFqKSM9t3UTXnL9TOGuGWaabZPRuHHs7bhAEiwPTAWTmtriq4YLEFOMY+Gz22IABgi4iEcWX11OBnb+FmsRjjZ/QmXVy3yCDX/i0KhziKN3o8uH5ofn6oQvsHCqIR8EET0c5uGM/M8+vpcUXZaV8mb7VcvdwBZlYRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768300638; c=relaxed/simple;
	bh=hAurMlYNXTxNuMUZIHfUByvT/1w4awgpU24oNdEHWZc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MNUHgSr7JXKE/mWceDadeip3CHx6w306x/3VrztcIgHjZhSYWmoLFIML62HAoYWDJrnVLXex9G6gy9TVJoQ03ac+whkLNX3caCKKEEjfx7um95o9oRapocPlSUAHLJlQ/3YbgPVYKvvGKFSoWStXZo0ZQP3kxYZMmFWy9/pseXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YCjENTCZ; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-59b6c13b68dso5466169e87.0
        for <linux-media@vger.kernel.org>; Tue, 13 Jan 2026 02:37:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768300635; x=1768905435; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G3B11MsiVuh0j92dKh78EUalZ005qYKESUvNCO2I9ow=;
        b=YCjENTCZI3hapoptBTPUtA4xCnesuejQSGGchNtbRdVy2n9rPFfDPb6BvK1GUsgCKz
         iwyQBN9v4Aqwh0FmcbrE0fJDTC9tddz+XrQmLsJqK8xHbDJ1vX3HYRD+PgjZnUoFYjb2
         QvEFq6QcnMh4YTXHYKM0/HhEnlQ5b5ZCYovKfTfCkubCkHKBldhTjQ2+baQcBo9cNjz4
         S+joBRb1lZ2f5t9EfvL9rdL45GboK1SYbi8AB6AtIDZXfcQhpbAFRv2bDfk0MvjKXkVM
         BTno66KduRJvGpy+XmJQKJxrToeX1+Ax0xVqfo/wkZN1KEQMUnzktqdXqZbZcRjsWM7U
         BXbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768300635; x=1768905435;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=G3B11MsiVuh0j92dKh78EUalZ005qYKESUvNCO2I9ow=;
        b=KW5K/pcSqjcl4N5JagO5tY6JMN741GVnGsL4fBYDRk8W8CkBhhXdDKhC11c4pBMYWL
         XLobbPHZ1emWM8nrs10ypCoBDDQYeJXcPRCyyg6SqNmq35N3MUxy35dDMuSbpwWEBmuF
         vafAzK9q8O0hA+7LV3QETYqvbv2RKJG9zsoLrbV4WoKMSBO63UJ7fv7kfoUrl1yXbOMi
         z68OjSm2WVClQfmmBALOQtznNWSliGTDqYRxGgp2D9E+c3gHmXaoNxHNtUS3XDyFNPme
         ntJocsK1fY6zT/PshJ/KINDq8X/CDmTrOAje3tER2e5SFqrXB3M7AbOXNvT2EkB0nXDv
         cnfg==
X-Forwarded-Encrypted: i=1; AJvYcCUpF+noIyafh00ADZxtvSbBSnL6Mnwj+SqKLafovYl+1JSXjyh0xx6/rDdFAmtau3zvwLS2z3mzoh7+hw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyaf/l0IuRVNr0SVwe6QDmmDDDvYUMmpm65fljCQpz7GRPglwnS
	Au7Rf4uTPSNvmukLjFtKtiDHuVS6SaAZCytlR8c4VYipGM2wcokJxTm+P11hwMb1hPGeeKhHvZA
	7iRFq/pJCSDRY6J3cNRX6KoAehS1/N3g=
X-Gm-Gg: AY/fxX4Rmk9D9hByR/nhi56tRyaidk/evdIe8ZNhERFy2uNZU0cASx84qwGVRwd2Mft
	e1DxzNqd1oyr5dkISJQgmdhm4tQ46x/0WRqWcLY/Gw2RxZZUqO4vRWRvn/M/oKjT5SbCrgi3RTu
	A6nFmbb7O4F7lBJ9M1XNLiak9WGZlKDYtLw+bCc+/EFaxy2IMDdGgpa9JPJBirhNVVWGGCgIDEn
	aIxtkirNNQ0ttEj5XIN/tHUUHZWheyGZAnZ6JBXzzs0KjpoWqsD+Q61EgZIFWIGU9wls3yH
X-Google-Smtp-Source: AGHT+IHoNmdjYFJ1zXOk8KANbo3087Ay7K23A3X+9RXPVvQzCT5ooW0QixuipfeAgM0YO8yFijnKpgt0C5Sic0CvZ1E=
X-Received: by 2002:ac2:4e09:0:b0:594:2f72:2f89 with SMTP id
 2adb3069b0e04-59b9920de1bmr789651e87.9.1768300634672; Tue, 13 Jan 2026
 02:37:14 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260112190054.9828-1-dev.anubhavk@gmail.com> <aWVIF_rkHzxs3k-r@smile.fi.intel.com>
In-Reply-To: <aWVIF_rkHzxs3k-r@smile.fi.intel.com>
From: Anubhav Kokane <dev.anubhavk@gmail.com>
Date: Tue, 13 Jan 2026 16:07:02 +0530
X-Gm-Features: AZwV_QhO0hMTRZk8Y1rjJr3zYSAbRBJu9ux19E_5E1cEq0ry6Z0utp5qj3l2HvY
Message-ID: <CAF6CsJwg8EFtCT+zyKWex=RbWu4TyZanbXnqip=J7=sCZDab5Q@mail.gmail.com>
Subject: Re: [PATCH] staging: media: atomisp: refactor sizeof(struct type) to sizeof(*ptr)
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: hansg@kernel.org, mchehab@kernel.org, andy@kernel.org, 
	sakari.ailus@linux.intel.com, gregkh@linuxfoundation.org, 
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 13, 2026 at 12:44=E2=80=AFAM Andy Shevchenko  wrote:
> the preferred way is to switch to use kcalloc() in all three places.
>
>                 x =3D kcalloc(count, sizeof(*...), ...);
>                 if (!x)
>                         ...handle error...
>
>                 while (count--) {
>                         ...
>                 }
>                 ...
> err:
>                 list_for_each... {
>                         ...
>                 }
>                 kfree(x);
>
Hi Andy,
Thank you for the feedback.
I looked into implementing kcalloc() as suggested. But the issue is struct
atomisp_s3a_buf (and the other buffers) are defined as list nodes with
struct list_head list embedded in them. The driver relies on adding these
individually to asd->s3a_stats and freeing them individually using kfree()
in multiple cleanup paths (including error path here).

Switching to kcalloc() would mean the s3a_buf is no longer a standalone
object but a slice of an array. This would lead to invalid or double frees
if the existing code tries kfree() on this array element.

Addressing this requires a larger refactor of the buffer management logic
across the driver, would you prefer I stick to the sizeof(*ptr) hardening f=
or
now to fix the checkpatch warning?

Regards,
Anubhav

