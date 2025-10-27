Return-Path: <linux-media+bounces-45681-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D84DC0EE36
	for <lists+linux-media@lfdr.de>; Mon, 27 Oct 2025 16:18:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 37F1019C4597
	for <lists+linux-media@lfdr.de>; Mon, 27 Oct 2025 15:11:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C3C32566DD;
	Mon, 27 Oct 2025 15:11:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GmYOQkyR"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 409C02D2499
	for <linux-media@vger.kernel.org>; Mon, 27 Oct 2025 15:10:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761577860; cv=none; b=qfUZIQbtLC4oIbMLcMrBojpVEX4rZMinctxGvLNBDZLktUydR7zJdGH9UnTkd6RV7G1LSME98LDBHcmf/90/+QL3X8nNmtrlI8yr0XIaOySDelw/qIpZPcsJmSFPYZrTufWqqmLduVlZcdGChbZYxfpqWgZvfK4fR/Bfs8CAyLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761577860; c=relaxed/simple;
	bh=EAoPt6jv7RYVLe51KJHBeGBxB13CL2PFw+2NcmecyJo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uxaIzOAaFv1PtTu35cDai/9PvTYxxlQHeF4+FIi9KrAwwGSjsqlpx4sAjbWm+ThUG0ntRDxMS7oIz2pCWt3vGIhKj2IfZCYPLXzCGlnmjKbD8ptcct5WqzIjk/c0Ivjdq7xSigTaUlHZKta0Cx9l8jtuJKVYnUYnsPX0jLW+NE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GmYOQkyR; arc=none smtp.client-ip=209.85.160.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-3c9975a3d6eso1457576fac.2
        for <linux-media@vger.kernel.org>; Mon, 27 Oct 2025 08:10:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761577858; x=1762182658; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=DMx/DtxK2+AXbHtbFOgTT8Th+LDWX/DlurisQVihNgA=;
        b=GmYOQkyRyB4gCvtCHjsZAqrRcL9IRUU65wWy+XC6rOhmcw17MG4FNFiQskzvwGoTF8
         krAeC8Z6ks9seQGu72rUdPTASi+1gMHxUcYYWWZo8rMCGhJzwScLj6ki9KvGn6gstbQB
         Bs1kraj1TMKuFPph44WgGDDIlm/9mjYxGKu1efF+5uVvb7OdvDVYsZDZPRaXfOX9HDFD
         PB7trGBlBV9kTbSs4QlhWxQ2UHuy6mj+jQwqbCguuWgqK+DBBxNphLc0Fueq1hDVZskU
         +yIk5IdncTy5dHmz5659WxD1B7KC54iaXhFBj/J94fdsFuU7o9K5NuadE5Vf8/7gZRUl
         jsrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761577858; x=1762182658;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DMx/DtxK2+AXbHtbFOgTT8Th+LDWX/DlurisQVihNgA=;
        b=mb+hFAoyS5AIf4m7yjZVKq4AKjUp/DDbgct3eQIDGIenuQ6px5CDXpSKdzABbQmNuJ
         ds5UNla6Pvirzuc3jMeQXE42FgdRxMPNFaJUR9CjnxYU6P0P1WS4kpja72O98TLOjU+i
         KFl7FU0rX2qspXnORpygyi4Y9rE5QVZFvZMUXz9YPXpqgDT49AZrusZca6tbOSlH+Zug
         M5tpmKE8/4cWb98sw8XRhFuc4tSISF3y+Lls1JnTBrfEe2GIkOr/UhRLWaA3qHg828Zo
         Wj4yIFPXKcHT2Vk1rTmpT4dIj36t1D+aszPabQF7GKOrGQS6z/QRCqu64yUK60Y+cpcd
         FwQg==
X-Forwarded-Encrypted: i=1; AJvYcCW1yzFTbk0xvd/92lgpSG/Cs0x9fGuoWK9fLY2iBYX4p7v7Bqdhr6nMDQBz7pvKTGuJzeas74mG6CUIew==@vger.kernel.org
X-Gm-Message-State: AOJu0YwIZfx94vChLMP5/J0ymhEaSeqphfSIH1/eiN0Uae6ayIp5k1je
	kQr4GJ+Qr+QiFSwA0GoYIq5544b6thHygb0hpaMPLmQEXRvGKXpRxXYY+ssU5WrCLG3lWUI3GzN
	1s/B1Eb1hSmKkHWC56juxlDDbdXsDGDfBh6wKMcdTymYb26+duR0diec=
X-Gm-Gg: ASbGnctBFgmhVb5WgTXI/5/U/aYiY6GBBPxOzmu0Do+B/jci3ARJrQv5gewNoWx2uIU
	YvPuwmmhivbpbqBoELQQjRC3j51RrbcpSZ5cA1TgNlddpN/A5mU2QL8fZw3+oy5H6NPtWGknBdO
	ByF2b3aDkjghZlobI9tiln6vOMR9dGdwweyfQU694/a3kRl1yj+TmMjfuqfG0gEn8xD5m8avqDi
	Kl+KJUG5m9baUPpq8pLvj593EOhvXoOZoSL+84C6pKbqFQEzT+4FZai00Fxmnt44E9RXXrf
X-Google-Smtp-Source: AGHT+IHd+W4IcFgJ85hqjhm+BkDqXnza/5grh6+beTj8ol5IgsaZlL3T/yI5duqd9WMVuK7QnVMu5fYn0lx+pNPIZGo=
X-Received: by 2002:a05:6870:de10:b0:3cd:aa5b:9d1f with SMTP id
 586e51a60fabf-3d17757ce8cmr4451260fac.51.1761577858254; Mon, 27 Oct 2025
 08:10:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250923151605.17689-1-johan@kernel.org> <aP91OoGkrSxxpsf1@hovoldconsulting.com>
 <8487acd9-3c8f-4eba-99e4-6a937618aa55@foss.st.com>
In-Reply-To: <8487acd9-3c8f-4eba-99e4-6a937618aa55@foss.st.com>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Mon, 27 Oct 2025 15:10:46 +0000
X-Gm-Features: AWmQ_bk8-GIOj3a66ntdRL-XYsBVqfxaejexXxbTpzCfX6YeH3gwqk-lE3Q3OUY
Message-ID: <CADrjBPrez1Zi3njGMUVgKeyYu_XCt3qNWATfpsrJZk3ALevOVg@mail.gmail.com>
Subject: Re: [PATCH] media: c8sectpfe: fix probe device leaks
To: Patrice CHOTARD <patrice.chotard@foss.st.com>
Cc: Johan Hovold <johan@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi folks,

On Mon, 27 Oct 2025 at 14:34, Patrice CHOTARD
<patrice.chotard@foss.st.com> wrote:
>
>
>
> On 10/27/25 14:35, Johan Hovold wrote:
> > On Tue, Sep 23, 2025 at 05:16:05PM +0200, Johan Hovold wrote:
> >> Make sure to drop the references taken to the I2C adapters during probe
> >> on probe failure (e.g. probe deferral) and on driver unbind.
> >>
> >> Fixes: c5f5d0f99794 ("[media] c8sectpfe: STiH407/10 Linux DVB demux support")
> >> Cc: stable@vger.kernel.org   # 4.3
> >> Cc: Peter Griffin <peter.griffin@linaro.org>
> >> Signed-off-by: Johan Hovold <johan@kernel.org>
> >> ---
> >
> > Can this one be picked up for 6.19?
> >
> > Johan
>
>
> Hi Johan
>
> The removal of c8sectpfe driver has been initiated see https://lore.kernel.org/linux-media/c3a35ad6-c4f6-46ad-9b5b-1fe43385ecc5@foss.st.com/

Interesting, I hadn't seen that. I guess I should dispose of my b2120
board then!

Peter.

