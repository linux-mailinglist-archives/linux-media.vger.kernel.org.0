Return-Path: <linux-media+bounces-40186-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B6D2EB2B1AB
	for <lists+linux-media@lfdr.de>; Mon, 18 Aug 2025 21:30:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 52CE37B0E88
	for <lists+linux-media@lfdr.de>; Mon, 18 Aug 2025 19:28:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D496273D6D;
	Mon, 18 Aug 2025 19:29:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pinefeat.co.uk header.i=@pinefeat.co.uk header.b="DYOUSrJ1"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2FBF272E46
	for <linux-media@vger.kernel.org>; Mon, 18 Aug 2025 19:29:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755545359; cv=none; b=CXnfNHHSBxZK4WjZA0F1uYUmZCp/B2bSfMeqdCww8z5yedBZnZn0ttf5G6Qea4sq0PPpGmbfhyCsfVCxqK5uNazxQ8Gr8hQg5gK7v1kovksI/Ns5oYN6T34M5NvkyM5Ut/+DS1aiicwvGTEJn03iHkzKHSreUrMLushRUs28MXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755545359; c=relaxed/simple;
	bh=kRzVEa3uj/bg6oWKZkP005NMPIYVxoygwwWt84AO+ms=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WR6pmn0NAfoYDqG30uEK23NTk6Ef1NT2gXomNq0uMw3u5s6nFqcZ4UscYMRa0wVxaUqko2/gc3uvy70kxrxp8yS+sDN+DHGekszqfkzW9pArMsCaYiuzT08jXvauf4qV2PUh/7Wuj/Pod9Bf95ylRPBfayd8lpnQmSwFhCm5MTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pinefeat.co.uk; spf=pass smtp.mailfrom=pinefeat.co.uk; dkim=pass (2048-bit key) header.d=pinefeat.co.uk header.i=@pinefeat.co.uk header.b=DYOUSrJ1; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pinefeat.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pinefeat.co.uk
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-45a1b0c8867so37372155e9.3
        for <linux-media@vger.kernel.org>; Mon, 18 Aug 2025 12:29:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pinefeat.co.uk; s=google; t=1755545356; x=1756150156; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kRzVEa3uj/bg6oWKZkP005NMPIYVxoygwwWt84AO+ms=;
        b=DYOUSrJ1oFKFAk05xkH83HD3o/l3IRaqk32XsVf662XV1jNyY5JlVUppoL/f8dJPmu
         HkINMt2CSLF1w2Yrz9T3XoGUlehle9gDYSIZgKMnKA846T83X49tbWn8a92r278vGmw+
         luBu2OyHfXP5ouAZWDezV49sOWKq586kIIgEHbSKdkXCD9Mg78tdmPknCgJkAhnZR90T
         JvxpRVv27VPXenE43pnZ08Hh+8PLJzHMt3NX/ggYeZbSh1glHbnzsJYMBaQekNJLZ1r2
         vy6R+xMgayC59a0uP/7KrNQbBwMpVP/cPs/QBLlN6Rz5xThxqPCCZ1q9jYyYKAsCSefY
         SesA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755545356; x=1756150156;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kRzVEa3uj/bg6oWKZkP005NMPIYVxoygwwWt84AO+ms=;
        b=c426ytXbgzoTTEEsvWOgohuSz03zDUq9PJrUeDrBfVDknOV2aSU4csLfavgb72mhSH
         lX30S0AMfkznZgDkAUFatLnPfmIG4UpOfpfs3ITewVTJuXeHi/e9u13UYDUCQo1xlLY2
         Q8vKdIxxnXb3XKEBTLudBw9bahtdzsiMaT0I8yDxx+EeHIH1eQAvWIWIRPLIC2dpGsky
         cdvjSDu98RJeleQbP6pYnpK+VidKLPYcVLwZGn8xUntGkzydJ3odXAW8/STszqpEoZnq
         DuJkYYvosD+CvTO4yKlmcPNPaw/kw+6g9Wz295iUkx6sFbL1QuNF9TznIIYn8YLnDMP5
         aIpg==
X-Forwarded-Encrypted: i=1; AJvYcCXN99ONe6Ohdy6PlDLRfYjYf9aSZ3UiC8WUC6c4dzTXjhW7jGsaWatAgu4ny93HoCsANpmlkJ3errYerA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyC8iK6P8YSQ2HczJj0m76W15DqCrcqMT5Pug22T6/a259l1UYy
	lNog26ngON6VCCRDgBg97hzAU3rmaKmas9gHWOyZfKhDhWBMCNRf5UooaShwbyy95ao=
X-Gm-Gg: ASbGncs/RMuE7cf4bbCp67OM7OLHzl8IbzBBBy7Psbs9tarpLgksnkZLDxDzA6kOCQS
	y5jLZC5oOSr9jszJxUpQfujYN0A2VSVV2k/KkjpTaWK0TqNVeXcEfH4EETZ1nbpkik1NsfdnLqy
	xXE3UtBBiMz5uPgIh/dTEW8orGrlWZQnbDRTdCkGUJmPn4c0qXvtS60BZ/9RuwiaC/Kcf2PJmsq
	bFQwvm9psA0t5cLscZzNviqijGVX4uVgeCsuHzvkjQclUyOI3EA6RWaMb3gWZSyFdGraNk0XpLp
	90bnR0LK+dswrjVxH/4OZig/l0b3L1pwH0Kk7qgNe4dj71QBpH7QTD7LcomKeldEaloG524N02p
	ZLI53ZM4WJa3sB+glwpyreQeHsEOApBRN32LTqr23sEWeG7iZtw==
X-Google-Smtp-Source: AGHT+IF9kyuM/7SxTLAYcltj+VM5hsAzPk1pKCnX/Es6jfMyWvT1CYbhhXwEBvZ4yeGfejQ064uTqw==
X-Received: by 2002:a05:600c:3ba5:b0:458:c059:7d86 with SMTP id 5b1f17b1804b1-45b43617e09mr2167245e9.10.1755545355967;
        Mon, 18 Aug 2025 12:29:15 -0700 (PDT)
Received: from asmirnov-G751JM.Home ([2a02:c7c:b28c:1f00:47f5:3f34:f5c7:2ef])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b42a7647bsm10882195e9.8.2025.08.18.12.29.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Aug 2025 12:29:15 -0700 (PDT)
From: Aliaksandr Smirnou <support@pinefeat.co.uk>
To: conor@kernel.org
Cc: conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	krzk+dt@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	mchehab@kernel.org,
	robh@kernel.org,
	support@pinefeat.co.uk
Subject: Re: [PATCH v3 1/2] dt-bindings: Pinefeat cef168 lens control board
Date: Mon, 18 Aug 2025 20:29:15 +0100
Message-Id: <20250818192915.11553-1-support@pinefeat.co.uk>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250818-stark-unsocial-96d32a311cab@spud>
References: <20250818-stark-unsocial-96d32a311cab@spud>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=yes
Content-Transfer-Encoding: 8bit

On Mon, 18 Aug 2025 18:36:50 +0100, Conor Dooley wrote:
> Wut? This doesn't make sense, you have supplies so they should be
> documented. The fact that they're shared with a bunch of other things on
> the SBC you're aiming the product at doesn't matter. What if someone
> doesn't use this sensor with an RPi and there is a dedicated regulator?

The supply was introduced in the second patch version but later removed
following feedback from another maintainer. I’m fine with adding it back
if needed - I just want to make sure we’re consistent.

https://lore.kernel.org/all/c1b848b9-b1da-4976-9838-d474394a0992@kernel.org/

Would you prefer it described as before?

> Is that actually your email address?

will change to a named one

> Don't mention drivers in bindings, how linux handles things is not
relevant to a hardware description.

will remove driver mention

