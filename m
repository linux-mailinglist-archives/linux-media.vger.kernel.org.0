Return-Path: <linux-media+bounces-49118-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EC143CCE00D
	for <lists+linux-media@lfdr.de>; Fri, 19 Dec 2025 00:50:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5BB4B302B763
	for <lists+linux-media@lfdr.de>; Thu, 18 Dec 2025 23:50:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8E6B30AACF;
	Thu, 18 Dec 2025 23:50:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eKTj6/09"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C14DD2192FA
	for <linux-media@vger.kernel.org>; Thu, 18 Dec 2025 23:50:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766101820; cv=none; b=J2O329VDCbY+QGs6RbV0MoVbSlHDMGinzK/5leC/il0LdGlS0mgxc8GpD4BH88cVg3rEkzmUdkvcdAqN1mHGfHFNcGH9QD1ZF68rQkL2C1dM6XqxzzFKWPlWC/zQGSmD9oZSwWJSU8vBZUdR6j5TuBxzvDVvobWhMf1DpcqSNAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766101820; c=relaxed/simple;
	bh=Wpo+wLLHCpnhYHi2PJBLdVcFRSpCm4lu8tCRZjT0PmM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BPqllSEP6MqUEck0fR2PXTIJnd4Ea4mDmtrZRbqhzN8S0vP62/46xfY/elZkg8zWnH6eS3395wXU5HvbN3nNLvQS/k/KUJ+VJ4V941gJcPd+AdFKcvl9iIa07JMZXkYIMAlXtWWuiTZtcJC17i9DsUNw8G5p3GJLhNKGvh3uEH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eKTj6/09; arc=none smtp.client-ip=209.85.221.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-55b4dafb425so1445075e0c.1
        for <linux-media@vger.kernel.org>; Thu, 18 Dec 2025 15:50:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766101817; x=1766706617; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wpo+wLLHCpnhYHi2PJBLdVcFRSpCm4lu8tCRZjT0PmM=;
        b=eKTj6/09B7TxnLU0aUg3I9qMa0I7x17P5smurSk7ZBKHNdZAoYLww0CgjP8moJM/r4
         hybM3KMHFTaFmEHhFrtF9xtMbn7kRJdA1lw9Nyb/ynSjE7XEDKyew2mowf036VkryuDO
         T51SXyd9D0WliLh4p4mPnFLJL+WbBLxpbbSIYJUe6xxZxsQ3CTge4pwd2UThZfvu+DKV
         juXfTLPs+jp9nbTPFzp+3DnA1XaBq+3aYPsXEpbuo5lopz57yPRq/hnUvqaBeh+NWAc/
         hRzAW77jI1qR9bdRlqcLqsg+hYs0mzU6vLonyYp/3nQHLUUXl7IGxgXFlhmL+NowUh1N
         Qy0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766101817; x=1766706617;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Wpo+wLLHCpnhYHi2PJBLdVcFRSpCm4lu8tCRZjT0PmM=;
        b=adNI8174qjoVOt+jttgpAynEDlVbAEeMhlNy/TBb+9EeGNBOCKeJGJX0DgQP4I49/f
         YA8c9LWbuQ/hi9oNJ2fvG2P5bE8syEQHGEdPNkjAKRT85S6gbntPHzQgk8+OIGTAVeLr
         OkVkFos+C3M0aH6daL6W/N5fFhd43DoVL0kGXFoYhvdA2Kw4HudErG+3Z8b8WMGTcgIJ
         c2slELG6UD11YO72NmLDGYi0qzl02+3PQ06KN5iBezVDWultsNHe9ERFIFsoVMiTpqyl
         CgI2kjewwAu16OAM26O4yM5l2oLrCLpVt4oKY0K2//vydREhv1xpk5yl9Nonx67OxziB
         9cxA==
X-Forwarded-Encrypted: i=1; AJvYcCVxD5P0o4zMp0v3niTEs+ZlxnoYTH+Tjp0d9p53x+aEK/XGKNX6FXg7GSgbOunAfySr4eeo8ShOU5lBhw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy46t2pwCiNGhAxCUSaA6iw2Kc8lh1VY00DxsHNl0ANtxyc8jQ4
	xBG+9YUhOr3su8API47TB8u0CbPDqI/NMilJV+sfuKNtSBQfw4aGK4C4xfBnKglQ2qLxs+lwrTN
	Ggo7pF8/f114QuKOJOg1tT7IqzV5SS0wI3RO7
X-Gm-Gg: AY/fxX5uUOVs12/DEeK3J78hlYg0IUp5aPGaSEuTOjBpWp7pKj+THm8Tq4pMkXAyBvC
	/Ry+IX4l7Xrm/lgkPRtjidNDGM+txKFm1AX3LWT4JCMExWuY0EKnumQhaFZ3GZtD2t1RqxN60gt
	tS0FiyPv44CN9pmOdvucwTSjmai3EmDAvwwmQpYyYs0sahjWPaVezNk6prZy9ZI1G9XqSTmeCf2
	z9v3IQTpJ35jEY+i4vkxDQqymp1qyjJGudvQsJrAOtFsuyVNplvWjgcYB6POeKc4oHkLGV4
X-Google-Smtp-Source: AGHT+IHnR0GwUbTrm534Q1/m+ZZ9jujPq927Scm445ly1trjGF6X85R1mpAdN8dr7fgifrDpAhdDQKgkprkeXjmw/40=
X-Received: by 2002:a05:6122:1d91:b0:559:6b7f:b0f4 with SMTP id
 71dfb90a1353d-5615b851ddemr573987e0c.5.1766101817628; Thu, 18 Dec 2025
 15:50:17 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1765782992.git.alex.t.tran@gmail.com> <ddb6f986cb54e513ba508fa28fc9d2c8df0e2987.1765782992.git.alex.t.tran@gmail.com>
 <20251217-fast-ambrosial-angelfish-ee39d2@quoll>
In-Reply-To: <20251217-fast-ambrosial-angelfish-ee39d2@quoll>
From: Alex Tran <alex.t.tran@gmail.com>
Date: Thu, 18 Dec 2025 15:50:06 -0800
X-Gm-Features: AQt7F2rJOOeUEfoWBXbDLMuMFvL8gBPhYhG18hZjfPdHPgZoluvju0-roqYQ1wM
Message-ID: <CA+hkOd5ASoO_HcRuOTzx3vMan+ZiKEwndTZ8fRBRATCo8MTFFA@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] dt-bindings: media: i2c: et8ek8: document missing
 crc as optional property
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Pavel Machek <pavel@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 17, 2025 at 12:27=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.o=
rg> wrote:
>
> On Sun, Dec 14, 2025 at 11:58:33PM -0800, Alex Tran wrote:
> > Convert the et8ek8 sensor device tree binding from TXT to YAML format.
>
> Commit subject is completely wrong. You are not documenting missing
> properties.
>
> > Add the optional crc property to the endpoint node for the et8ek8 senso=
r.
>
> Why?
>
> > This property enables CRC checksums for the sensor bus and was added to
> > match the new driver support for reading it from the device tree.
>
> This does not explain me why.
>
> I asked you first to convert the bindings, not add new properties. If
> you add new properties, you must provide justification why binding has
> to be changed - see other commits how to do this. Also please read
> submitting patches how to split your work into logical chunks.
>
> Best regards,
> Krzysztof
>
Thanks for the review. I'll send in a separate patch series first,
focusing solely on the conversion of the bindings without any new
properties.

--=20
Yours,
Alex Tran

