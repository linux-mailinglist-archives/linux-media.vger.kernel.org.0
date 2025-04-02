Return-Path: <linux-media+bounces-29271-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0843BA79713
	for <lists+linux-media@lfdr.de>; Wed,  2 Apr 2025 23:05:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 725FC1893A2F
	for <lists+linux-media@lfdr.de>; Wed,  2 Apr 2025 21:05:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35F181F3B89;
	Wed,  2 Apr 2025 21:05:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ICxkprF5"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1870119ABB6;
	Wed,  2 Apr 2025 21:05:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743627927; cv=none; b=eWXLAJBQo73MQT2GJNww0ldLCVuqcB+YgneUbSkb+ldRB6KErv694Xs8O/sN8cKB95gbkm82ApkLgrUmYi1wMlFo6rjedO3lqSrIUxQYRF70oJ8jojRNLsXKGQcAnlzhXZRiUIxzY9ioqyKgskWr8p4j6P2qzP944DFPGvRy42A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743627927; c=relaxed/simple;
	bh=U//9wy/+NhgWXL7IC0MqbiPHBN2i8djRmoCN4KGzWsw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=juVqoGcmO74nB31ZTfYwNtzU4uhBuXuoPUp0f8SG6xMDP5slKP+5ditDWuXq+S+JEiSlfe80ZxPo4sUHXUw7rDvIOeQU8jbuqAo74mIPsM/vXWEJahBtJt+kN7oOhNCDg4mP0RM1SeARoTsfjlIw4jvHp3PPl/fLEgHHJSbLjbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ICxkprF5; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5efe8d9eb12so390984a12.1;
        Wed, 02 Apr 2025 14:05:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743627924; x=1744232724; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U//9wy/+NhgWXL7IC0MqbiPHBN2i8djRmoCN4KGzWsw=;
        b=ICxkprF5p3Hc+DjE+Hnx1aXSXo6DqidSScasLSdZCDQ6kPmMO6CCDXKcC0IT34XMfS
         dgm0zjMUlOb5AaodgPvEzjrQrUy0sI7Yv0mdK4+QXC1dAeEqE9G+l0n9ETqWhZRRz7DU
         uAxLKBFml22C9OiQlvHdLhV0NEH+uPCHg6AVPcF0v4SJUMbmP3G1IKc0kuDR5v6UbkC0
         QH4KPbYkhibRwxogLpiA6gn+2Vjl+2LQ0T7xJprdkBkwboTnN/wh7A7lzeLxl41aZSWi
         6dY7BTgoXQhYVvNue/MoUXdL0WaOqyF6Ui+x+0rRM9teFyXkZE8+EheQBAoQJK8YquMG
         gqHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743627924; x=1744232724;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U//9wy/+NhgWXL7IC0MqbiPHBN2i8djRmoCN4KGzWsw=;
        b=Lzzs7pvfS0sCalrZlFdaUQCPMfBQk0j5+a1TWMAzTPUmHDJrwPg/QDY5AMnDdCKxUC
         oxcmJYNEzxyjJivni43TedNqgI75JvziyhhivxZm6JyviY1IZItytdua1yKRp9ZcW5aR
         RTFfKNVsqFEuo2jHWsUqFQYUFn/HJi2fsp45eSmNcsYJB7KI0Ut5kkwddsLn5mF8de1e
         DwQLBYgsStw72nA+6LbnHoK1db+dcn592hvB4+Kv2u/IJsxhcSfCkZjNYelhzjJLv5hc
         rql4jfJHeaIPUJbrzkKE5pv2ZN3YlzixzDKfiyw4/TAoU1K/mcOgb64ntw/l+wVde+rd
         Klsg==
X-Forwarded-Encrypted: i=1; AJvYcCUk8SqddM/4VYthRdYjbyve1neiJ1yJzhvPxZweuWt/sVBsAGgU+JiMd5+6tziZaG0qzN3aA57WhKmcfw==@vger.kernel.org, AJvYcCXxfJ/AK5G/FKzfjKXRMNUxLimBUj3uHKPVr0h0pln+Ey3U9cOQ9hRq+Mr2s17ViaQZ6PIKfx25bSS0p6CxNUWA4MCq8Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzxx72c1ksubjB82piv/cz510HBQ5wE4+OvjIa+iRoSJqDimNPw
	w6cim3tLdfphORt04IunXaI2EmB3ZrctkOFhtxaDhUyktguDjJ82wSSKBUUQDCjGuysQ49aC2p2
	Fq5ngRoExJphxxwl/xCCb0qRiJhI=
X-Gm-Gg: ASbGnctz2dZUdqjJpYZqmnBKmN8VpsR6zHkCRePLv68L1inhcJwEZm4pEoZXf9120M1
	Un9Bg5Ej7eNcvvQmu2oo3rB/T1Dz6r1HnqcGsM50NOCPB3ZLG3/vdPV9Yd83xr149c/P6ZU3Yrk
	eHTN5bj9NECgHIZ780olF3kmfSDg==
X-Google-Smtp-Source: AGHT+IHhf4dYdk9fI2QhNAgCC0vmEkMIh6q2dpIJPOK5KCw8EVlAOKqpFEUOdXp3nXiQhEpKx39KoickpD5fallY6tA=
X-Received: by 2002:a17:907:7e95:b0:ac2:a473:4186 with SMTP id
 a640c23a62f3a-ac7bc176fd4mr17827666b.34.1743627924184; Wed, 02 Apr 2025
 14:05:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250402202510.432888-1-hdegoede@redhat.com> <20250402202510.432888-7-hdegoede@redhat.com>
In-Reply-To: <20250402202510.432888-7-hdegoede@redhat.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 3 Apr 2025 00:04:48 +0300
X-Gm-Features: AQ5f1JoyOs7BHk-fA3yMaJX9ZzAgjYLiPNQVsmLOk1AXMKVbIwuM_etc6GExyCs
Message-ID: <CAHp75Vcok+-NPEGKFbZawiJcjhgJK5upbyfXfCEtezYiMspvRw@mail.gmail.com>
Subject: Re: [PATCH v2 6/9] platform/x86: int3472: Avoid GPIO regulator spikes
To: Hans de Goede <hdegoede@redhat.com>
Cc: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Andy Shevchenko <andy@kernel.org>, Dan Scally <djrscally@gmail.com>, 
	Alan Stern <stern@rowland.harvard.edu>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Hao Yao <hao.yao@intel.com>, Bingbu Cao <bingbu.cao@intel.com>, Duane <duanek@chorus.net>, 
	platform-driver-x86@vger.kernel.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 2, 2025 at 11:25=E2=80=AFPM Hans de Goede <hdegoede@redhat.com>=
 wrote:
>
> Avoid the GPIO controlling the avdd regulator being driven low or high
> for a very short time leading to spikes by adding an enable delay of 2 ms
> and a minimum off to on delay of also 2 ms.

How 2ms was derived? From experiments or is there any other hint
(Intel published sources somewhere, etc)?

The code looks good to me
Reviewed-by: Andy Shevchenko <andy@kernel.org>

--=20
With Best Regards,
Andy Shevchenko

