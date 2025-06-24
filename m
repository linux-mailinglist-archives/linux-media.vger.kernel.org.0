Return-Path: <linux-media+bounces-35793-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B37E8AE684C
	for <lists+linux-media@lfdr.de>; Tue, 24 Jun 2025 16:22:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 07538172FE2
	for <lists+linux-media@lfdr.de>; Tue, 24 Jun 2025 14:17:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C07942D320E;
	Tue, 24 Jun 2025 14:15:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XgbPzP0q"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 945491EE03D;
	Tue, 24 Jun 2025 14:15:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750774524; cv=none; b=pLlgzHjBKvJlF9Z6muwR70xja75M4xWWg3sLHrfwI6ITU/BE2LUCxDOE4w5VM8z/kdqu/Zxwekd7HjhiS9G//OW9c19dMM9TVBhLsXJYjOMFob5qo065kQVV5OzsItDzTdjzxpWwGWSWj3W+iK/2W+6GtTxvsbfzy3f3imfw6qw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750774524; c=relaxed/simple;
	bh=EYBB5hzcAOt18RHPivhYOpPcVF9O5sHPejxC6FiOZNY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lYqFDA5D4xwEeuQUmnfYv67M/wnxcRVU66qQSKhKXEuSuOtneg6GB/EKGFKIJ+oVbmstBFzlwQb9wqaa/C48zyb0lpFyus0ZbAkw7xZgqELg4QazxMO0h4KC+/mfNvLcf3jpEoWsqcN5n9+Q5IJsVqFi6gx5d/KY8f+gOnJQRsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XgbPzP0q; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-60780d74c8cso8448875a12.2;
        Tue, 24 Jun 2025 07:15:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750774521; x=1751379321; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TgEeZ1NwzgeNOBBLWPbhKcGNzxqxdSNPOA/Y890PEHQ=;
        b=XgbPzP0qqvajbzsIS1f/0LfBAs5PT5E9PgDcCQzdIJZsDqZ6FLeZrzEdVk/eHaA9F/
         ZEESBkF3xFpIH8uYHGqcDGjw6i9fUb7ZNM0AJJ6hRRjUf3jsfNh5lbnSJq9Av2bCbUiC
         kjT54n3O1nwyXPL9Y/f8FG98uUibuUChS6jRMBeNwd6NG1ydP3qqfDKiIpLameaXisb2
         DeKjUfOZDXWmBA+voAerEQwge7Pkxkj+UYDnlp6xDplsXYEmW49ZKEGEtTIveRJ7L0et
         ty0qJBbGUoSmlhfm9AvKCKWWbhpILnxIeIUOrzaQ1AP9icu/I3ydYQ1JWeUuprsThWG6
         Jqxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750774521; x=1751379321;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TgEeZ1NwzgeNOBBLWPbhKcGNzxqxdSNPOA/Y890PEHQ=;
        b=C6Fe8I3ROLVTn+y/gx7aPPV7qgyOHweF2VUjrCAcbrnJXOQFV9msULi/LmmpuEJZLn
         EwCAe1lNHooSbOwut/LxHQGYLSFLDnOLxAf/eL+w/41nDv6TiZs23cdERBHeNAP8jATE
         gilpKIo5/nuT0Zg2Nin/9Fq3a/BbuLaqsbg5NV9MpxiW7yxtsPwAJA6op8fIUM3fUhR8
         hxEqp59NNros37q0t10xqRyig7DyBD+nTb8MIGGh5k3zt7kC2xie154eXlvd1ErQqR5p
         xzGRoBGgLoxANiwccmUeorGuYsz6aSI7VqaXbRnJR00bBvWAqOjkNW6DCcgN2VrrJLVZ
         FECQ==
X-Forwarded-Encrypted: i=1; AJvYcCV0I7P8iMeWBVuTtqK798R/rKc3Wjg1jFXU6ZcxgpezVgJKqCt+xI35xADyaAXY+SF8ToZAqb30Q2Dg+NE=@vger.kernel.org, AJvYcCVeS0YgU2cv+1JIxvytfgyFVXxJUI3DAirNO2vq0C/+cA0KUDolV0ja89CqNFW+ayHA/muRb2xGF23jHE8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyOSC5ua58HjgsWGQF6qL3JE+vJBopP6i43jWlHdngxdtunjeVI
	xp/rsrfumcR6SEtItILyV0aP67JsQFkB7N85JJVhTlWI1Sit1i7TRChxLXjFi/dsqjoMCuTWtkI
	/8TiYJFenYXtHmZ0m88T4lJXEcPy2xdA=
X-Gm-Gg: ASbGncv+x5cGwNi/b+sWB9cppT4fnS+UB8X/GLyepIUG67hZQJ2koDj/LG+ua05Bbuu
	PW13zLGZtinm3KP5PePVxFLtpK0FIR4hV015+PUxslJlzZVNKLwNsoOTHmeIf/fn5eDWXMuYLto
	Abm8sq1CVjHHhqfsPbYk5CKqev/d2oM+YgDsLTTd9apcQ9qw==
X-Google-Smtp-Source: AGHT+IEaLqgUCTgi/UDgbwhHHVKTVgJFfI8XH3ilfqmadSEjxKw9dZfOogiQ85oAjhJORbPUBGmOTbETdCj098Uck48=
X-Received: by 2002:a17:907:9087:b0:ad8:a935:b8e8 with SMTP id
 a640c23a62f3a-ae0579d1a99mr1127576466b.5.1750774520592; Tue, 24 Jun 2025
 07:15:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250624-bar-v4-1-9f9f9ae9f868@gmail.com>
In-Reply-To: <20250624-bar-v4-1-9f9f9ae9f868@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 24 Jun 2025 17:14:44 +0300
X-Gm-Features: AX0GCFuQATpLhLi-lMuhRabxfiCC90DvlL1jCZW9tpHUJF8q6CscEDY8rVRgI0w
Message-ID: <CAHp75Ve_G=ziR7sJmKw4t3BRASogGQ1kWUsNNNWESFmmS4rVhw@mail.gmail.com>
Subject: Re: [PATCH v4] staging: media: atomisp: fix coding style in ia_css_output.host.c
To: LiangCheng Wang <zaq14760@gmail.com>
Cc: Andy Shevchenko <andy@kernel.org>, Hans de Goede <hansg@kernel.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 24, 2025 at 5:10=E2=80=AFPM LiangCheng Wang <zaq14760@gmail.com=
> wrote:
>
> Fix multiple checkpatch.pl ERRORs and coding style issues:
>
> - Use tabs instead of spaces for indentation
> - Move trailing `if` statements to multiline format
> - Remove excessive space between type and asterisk in function
>   arguments
> - Move assignment operator '=3D' to the same line for static struct
>   definitions
> - Remove unnecessary line breaks in function definitions
>
> This cleanup improves code readability and follows Linux kernel
> coding standards.

Thanks for a new version. Now the question is, is this the only file
in the whole (>90kLoCs!) driver that has such problems? If not, fix
them all and update Subject respectively,

--=20
With Best Regards,
Andy Shevchenko

