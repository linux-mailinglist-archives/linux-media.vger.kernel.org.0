Return-Path: <linux-media+bounces-47143-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 121FDC5E576
	for <lists+linux-media@lfdr.de>; Fri, 14 Nov 2025 17:52:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 9E9D8387B2C
	for <lists+linux-media@lfdr.de>; Fri, 14 Nov 2025 16:08:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B220327208;
	Fri, 14 Nov 2025 15:59:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="oJ88zzv/"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f67.google.com (mail-ej1-f67.google.com [209.85.218.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 027F21DC1AB
	for <linux-media@vger.kernel.org>; Fri, 14 Nov 2025 15:59:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763135971; cv=none; b=rTTkIstOpPecMIBzz2gqO4UGMfZoVB4yrPUb4IPRsFstbFTU5irvK4VfURY/QDTT3LErifgAcKYzYzJe6YT6UI9OOyWp0NQtFtVo0Di0lHzv8gpZHrYl2ItviCKAj0g11X/+5FFNFpaLIyOk4+669qiKvJGwTyV9jOFgn6yyZTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763135971; c=relaxed/simple;
	bh=yXgFpiaxg0LZlcZZHrI9y6mWIPy0APOxvyrLswjcxuo=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=ryKmAzr0GTXLoPyNJ7WraVGJuaY/C3wS4QM3g53t92WtkaXoWVcwzWXFlk7u0J6IAufux5ORxGCfQWbsag7oBa1KMAXupofJP5aXLbG5lQ725a7CUXW5L34ACcV7SKGgQ60zkfrUIv05wtz8ggx76a0MdxF2NIktykVQIjmXBHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=oJ88zzv/; arc=none smtp.client-ip=209.85.218.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f67.google.com with SMTP id a640c23a62f3a-b735487129fso320232266b.0
        for <linux-media@vger.kernel.org>; Fri, 14 Nov 2025 07:59:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1763135966; x=1763740766; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yXgFpiaxg0LZlcZZHrI9y6mWIPy0APOxvyrLswjcxuo=;
        b=oJ88zzv/L6p11dI3kq9GolQii0X1LIitDEiGab06zALjLLGcKy/2pUt/AiIdWcBaj+
         t7LeXLBj4WKebtmH1wfCs2K8ap4pH/IMSIChyi3vpYe6K5JR1TRwTG6hyyhjdHvirNlL
         JzEpC4dUzprfsWOdsJFf7/YIEhCzYnO7QQwhXmS4gL8d/cTy/dRPRYeN5DYzE3y+ZJus
         6cZ3JVRwj6OWitFAxGyVeWLmPPYJj+dIqUdh85s7btp/ncy3ApPFUkGD55HgsnblooxM
         jJGwj+q1HslgvaUSF+SNHnqI2qqJ8iYHggQVYKEaA4rxyquj7kuNajK49+6ZtmYhKng+
         t0SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763135966; x=1763740766;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yXgFpiaxg0LZlcZZHrI9y6mWIPy0APOxvyrLswjcxuo=;
        b=JjqtwRak8YrcUeew30MZ01HdSl6D/qE4lf5x4wvQQJ2wm3zAOJnuYvjlEOcBDfBZQ6
         1DbgonMWP3Q6BYb+F41ShnSSK7CHnH/smoENAtxj4NQOm70fAMoa8yo8l+zJDqXOW8DI
         s5kYzID0iNQQlVFYfNyNczfNWqjx5lcs/DRyDOWoVjHA1UBJv+Q2+LBpJkiSD7nMEHv/
         bbZjv+CjNG77YfbwLPPn0JRyNv3uyBfRZzsLJuFVI1dr8ZbvkoW+v749angdQar/Ccfk
         JCco4QN6zHqpTjssTMjiI3wgotdZO6XctFkYmIJuFk2++CYFeKR0bM33PuVn9fKJ1NWl
         PSbQ==
X-Forwarded-Encrypted: i=1; AJvYcCUm/kEJ5X4KP1H0WAFn2U58+iVo9uag5a3p5UjIvYszFWlFHu1aXmEUnP64zdgjVG/3fvwJf47aprRCMA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyOE9cAcp3kIL9gjGXgzNXNCt7nRlk6P45QgPqkx8fB9pEdwYsI
	V83/lFV9x5JTNpELsmEL+L3Vvh+bZ35/9tkenoKlr3VfxxZpNNIBWNzCiyawTrO7nsc=
X-Gm-Gg: ASbGncvpdbRoO0Iu/EgIvDBgO1XIxg7eOR7LT/raGWSNIm/x66EviXWoF9E/VWydfea
	chKkVL0dxRDIdGTPBa4Su5AjwnmPXSTSeb2zEsLO9yRfdbboOtsv0cr+z2suB18iOeE1eQ84p4I
	tKXzjprbrDXehSuL7oaJQUkXnVHc0pfYXvi2fvJbpO+/8hD90Na/BGwcEzMIMhhqWilR3prcV9p
	88npKal0igjtHPF0ARXHUeq/h3Ps8KMiJWZIBuJTDU2rQpq7Wt+YkYhT7SYbRyHwcy59ODAsW2B
	Ti3VX1e8WC5CAjOhbFvzI6ASSfkHWc6VHabh0Eh14UuneJNOHzd3QMwRhgZYq51Qsm5QaSblOAW
	7bpuOsbMLbb18oNRmZg6+cyEEdoEZaqaAlTJt/ibGPkGJJ9SbMFVBRX0cAAI5oNWRp4zD5Fx1ut
	fECUe6kC8luJR/u+Msqc8oy+RGdt+Ho2KHfp1tjZVkqu7AgPvGl8WWq7yDSfOrcbYa6CW6rXAQX
	6YP8OuipFIH6EdsFe3F4fM=
X-Google-Smtp-Source: AGHT+IGWzubFZLtvC9cNEOlO/RkzPlBtEEASvIevatDsvh+QoQs8cTds4ZRPcjtgHk3tw2xqDW/ZxA==
X-Received: by 2002:a17:907:1b04:b0:b72:ddfd:bc5a with SMTP id a640c23a62f3a-b736780b420mr340472466b.14.1763135966460;
        Fri, 14 Nov 2025 07:59:26 -0800 (PST)
Received: from localhost (2001-1c04-0509-ec01-156d-fa6e-7f19-0b67.cable.dynamic.v6.ziggo.nl. [2001:1c04:509:ec01:156d:fa6e:7f19:b67])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b734fad41cesm406031466b.16.2025.11.14.07.59.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Nov 2025 07:59:26 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 14 Nov 2025 16:59:25 +0100
Message-Id: <DE8JJCQA0C4Q.35NEED7XG0K0V@fairphone.com>
Cc: <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <linux-media@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 0/3] Add CAMSS support for SM6350
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Bryan O'Donoghue" <bod@kernel.org>, "Luca Weiss"
 <luca.weiss@fairphone.com>, "Robert Foss" <rfoss@kernel.org>, "Todor Tomov"
 <todor.too@gmail.com>, "Vladimir Zapolskiy"
 <vladimir.zapolskiy@linaro.org>, "Mauro Carvalho Chehab"
 <mchehab@kernel.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, "Bjorn Andersson"
 <andersson@kernel.org>, "Konrad Dybcio" <konradybcio@kernel.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <3ph8XeidoxkUIsK7qiOH29pde94sdwa3ReWKVVrPabgS5enIAmwVAC5plyFnBMJGKQBnxFB6df6j69OMFIeavw==@protonmail.internalid> <20251114-sm6350-camss-v2-0-d1ff67da33b6@fairphone.com> <df4a6a77-9004-4dbe-9b11-7af2bea7e068@kernel.org>
In-Reply-To: <df4a6a77-9004-4dbe-9b11-7af2bea7e068@kernel.org>

On Fri Nov 14, 2025 at 4:51 PM CET, Bryan O'Donoghue wrote:
> On 14/11/2025 11:15, Luca Weiss wrote:
>> Add bindings, driver and dts to support the Camera Subsystem on the
>> SM6350 SoC.
>>=20
>> These patches were tested on a Fairphone 4 smartphone with WIP sensor
>> drivers (Sony IMX576 and IMX582), the camera pipeline works properly as
>> far as I can tell.
>>=20
>> Though when stopping the camera stream, the following clock warning
>> appears in dmesg. But it does not interfere with any functionality,
>> starting and stopping the stream works and debugcc is showing 426.4 MHz
>> while the clock is on, and 'off' while it's off.
>>=20
>> Any suggestion how to fix this, is appreciated.
>>=20
>> [ 5738.590980] ------------[ cut here ]------------
>> [ 5738.591009] gcc_camera_axi_clk status stuck at 'on'
>> [ 5738.591049] WARNING: CPU: 0 PID: 6918 at drivers/clk/qcom/clk-branch.=
c:87 clk_branch_toggle+0x170/0x190
>
> Do you have a full and complete kernel tree we could look at here ?

Sure, this branch has everything in:

https://github.com/sm6350-mainline/linux/tree/sm6350-6.17.y/

For further refence, at least two other people have tested this branch
in postmarketOS, nothing particularly exciting to report from there,
apart from that the sdm-skin-thermal thermal zone (thermistor right next
to SoC) is currently configured with 55 degC as critical trip, which is
quickly achieved when starting a video recording, but that's not really
an issue with camss, but will need some tweaking regardless.

https://gitlab.postmarketos.org/postmarketOS/pmaports/-/merge_requests/7281

Regards
Luca

>
> ---
> bod


