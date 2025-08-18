Return-Path: <linux-media+bounces-40106-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D970CB29C91
	for <lists+linux-media@lfdr.de>; Mon, 18 Aug 2025 10:46:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8F6F04E2489
	for <lists+linux-media@lfdr.de>; Mon, 18 Aug 2025 08:46:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15FD3304BBE;
	Mon, 18 Aug 2025 08:45:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JNYsLUe7"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36AF6367;
	Mon, 18 Aug 2025 08:45:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755506721; cv=none; b=AwHQ5sTqrVIbDFW/dtaiqIT2limfy45dY+WHpyE0/KJ6t6VN0gCMaP+4R/LK3exDfuFqT9uWU+E7pNeWsHX+ZG7zGL2q5q45P2mbENLXxNCVop//YtG5zDksT2pWX+mSZ0VOu86Do72iMuKdHjoSH7i1wCmyu3vWsYTc70R1azk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755506721; c=relaxed/simple;
	bh=eTMlQMOS+21Z8HpGFVqnesRdJSLE70jGtQaiCJcm3rs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=V3LAT2CdRO6Cl1DuFBeuL15MIAzmqQKUgxVpAONr86T3pCqBxg7Hz9sYQNE/ilX+Y8s8UmzfnIz/Spd2OcuMRy9/D66ckeg6HsOe9XPBgvpqIWwJgboLR6KAcNxaUx2zqccGdHXlVQ51VlXuVHLU8kXX1GcZJZcF8PtIRL0YXCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JNYsLUe7; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3234f8df749so186172a91.1;
        Mon, 18 Aug 2025 01:45:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755506719; x=1756111519; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eTMlQMOS+21Z8HpGFVqnesRdJSLE70jGtQaiCJcm3rs=;
        b=JNYsLUe7OU1jL3ZLlqV3jZNWOS9K570Tmpj+7zJY0lmiIqUtjmgJgk4JpKojtOtbI0
         8JFYPwV5DHs9rhLzxvYA76yWX2GXEo9lsVJEqhtkjhxo/s4E1PHVcWNhyZLVwlfAuibW
         KeWuhozdIYIVJfT2kOAT2CyK0A0Qhkvb5KHEGJP1UQhTaauB3+hXkMQqzlcTD1maujaw
         Lao3k+90lQgZP4jHNiPzl4eJoHp0jpF6/EmRcYEZso8TDf5D2ybH1jkiNHUkSYZwH4De
         LihGzOBe8fJhqwpnotiKX54ieU8vUqbeGVFScZDYh6ioWtL/QYCHy6mrExT7Q122hytJ
         cVVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755506719; x=1756111519;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eTMlQMOS+21Z8HpGFVqnesRdJSLE70jGtQaiCJcm3rs=;
        b=nk6qXZJWrTP3TDcq6JJVO4H8Rt9Z1012Ea+vIFw62moX5CT3X2I3PHLlMbq9SnDcTt
         dw2ufJNBY9Grd8VbSoyW/cy6CXbVYAmuN0907fL9NhAZAGYWqkjOG7vT4Mit5q/Fu4Et
         awMJ/1PYzaqSnj7zpgjXe8hs0gyJQla+odfYEeXycUpxa7GI2WdLEhmA6o46ePhvC9Qe
         5zemC+2K36xKLIPIL0uWIUQ4WB/U5tNfZVoL3AfJbgfWq3qmQOl+ntVoIs1z2ljvVdUN
         6spWgBloI//keU8gtRaG2ebnrSXvp9AZxnVHtkqzKUTdVJ9ySqDZf7ax/JtXPpo6yHpC
         +KLA==
X-Forwarded-Encrypted: i=1; AJvYcCUlOuWwLnm0+f2WY9zjp3hp/2q8jR6fm+kE2AU0wwE99vjcuhq5HgT10eda/T390a3V2LRkUEGtyPeV5A4=@vger.kernel.org, AJvYcCW011IOpE77o45RxUSbbncknqXKr7Ql73qlipMZ5nPLE1H9NpNjbBxEYDQ7rVuwFxFNimzJid8DWSIOLX4=@vger.kernel.org, AJvYcCXvWstyE/ada2JescQG5rmN/T8kYlww8IscTJziTJKLaHZllh5/B01qzkzcmB6gj86c5Sqq574gcuDmqkpLj6Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YzhXSEOuMHbcT1AXMLvuBU+/5Yxa6MC24hQKiX1U+mfP7TpuSOI
	JbJnWc3q2nvHhY3CNlsUFs9nO+UasSjc30RxBz7TuxeXlKoj5HZFwqCO7xcKdW7zmiStSVfoYeF
	neII9eWXgNZIpuM6HXDDgZbWbTHuisxk=
X-Gm-Gg: ASbGncs3ZZV6PZ5smzlohHTIw84KPclE+qsvw3EcUp0YC9MUZNtGNJBwCYrgderQeVZ
	4KTkezq2nNxK8HIwiZM9GChUnTVbc8laBtr6k8M3VuODuHtm9/6/vL7UsooINkUraiUkUzKvRqU
	u10QoX2x4WT90iAwRyMCWgnxMk2fVlpRSE41siDw13xfbPYNbX8QKBaMVXB/+SagJSy4gcOegx3
	LUBU68l
X-Google-Smtp-Source: AGHT+IFNI+s/vA9e9kA2OI42+j7AJF1zN8L4wf4YLxIkGEeFBObPtWb1SPQ+hFkMqlkjJZtzPlw+I/0+XvjWsCqH/is=
X-Received: by 2002:a17:902:c403:b0:240:3c1d:cbe3 with SMTP id
 d9443c01a7336-2446d7435f1mr74886845ad.4.1755506719363; Mon, 18 Aug 2025
 01:45:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250818-v4l2-v1-0-6887e772aac2@collabora.com>
In-Reply-To: <20250818-v4l2-v1-0-6887e772aac2@collabora.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 18 Aug 2025 10:45:08 +0200
X-Gm-Features: Ac12FXxeBBKUuR4sn1tQTr7n-uoBqDuKaZSfjHUh45fnWMRKJekRjBF3tm2-ZC4
Message-ID: <CANiq72=5847N+yV0APZPtO9fdR=U68RzFYgW2jgbZU-=xrXtfw@mail.gmail.com>
Subject: Re: [PATCH 0/7] rust: add initial v4l2 support
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, kernel@collabora.com, 
	linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 18, 2025 at 7:51=E2=80=AFAM Daniel Almeida
<daniel.almeida@collabora.com> wrote:
>
> I've decided to work on this once more after being told by a few people
> that they would likely try to play with Rust v4l2 drivers if only they
> did not have to write all of the infrastructure themselves. This work
> (and subsequent patches) will pave the way for them.

Glad to hear there is interest and to see you reviving this effort!

(Mentioning who is interested, if it is public, would be nice)

I see the media list Cc'd, but this should likely be sent to the
maintainers too.

Thanks!

Cheers,
Miguel

