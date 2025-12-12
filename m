Return-Path: <linux-media+bounces-48696-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F4B4CB85A7
	for <lists+linux-media@lfdr.de>; Fri, 12 Dec 2025 10:00:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EF1283009946
	for <lists+linux-media@lfdr.de>; Fri, 12 Dec 2025 09:00:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F6FA31078B;
	Fri, 12 Dec 2025 09:00:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="QuGjTaIL"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A901F2737E7
	for <linux-media@vger.kernel.org>; Fri, 12 Dec 2025 09:00:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765530053; cv=none; b=PQUsG+j+Hkn6479MPQBFYs/dB37XDz1nfq9JjlSz/ohGosP9NhR3c2PNwbiRlxopw4q5KAAtVdkbUdCaZHuokSkZayP0CPmovGqowHFxLM50MfX6IVPFTvtBq6l1O8+hqJzZZYAYUa2+OmcYwm/4NWs+H1lhZDhvuuEJnzVoW7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765530053; c=relaxed/simple;
	bh=0mw2ckxKrCqrlVWik5CQTkeiXSkBsBd0QUuzrYIPgiQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=o1c10WSDxFrczYj43yStktcvtMA3MiFuy8dlH3oIUjpNZ1GgKgC2njtRL1J3iK2VBf9k1ODxOKqs8glYlCrzLkufge4/KtsAzYIBnZ+nwGXSHis4rXz0I2YXCevYr2Etai8nBgXMt7RW4LS5f8445Rl/LsDuoStZcn2BSHfu0TE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=QuGjTaIL; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-59583505988so1298889e87.1
        for <linux-media@vger.kernel.org>; Fri, 12 Dec 2025 01:00:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1765530050; x=1766134850; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0mw2ckxKrCqrlVWik5CQTkeiXSkBsBd0QUuzrYIPgiQ=;
        b=QuGjTaILv+/rTrYYEtgNjhvJKJEoxaPhgH76AVWs1wejYUtG8/435v6PWRnVvh32g+
         aUXAUiX9cDq9j/JEILf4hdm/7t7jAuzARbXO9MdaCaHT0+sULfKw83hJWNTfsX7H7Dcy
         xZTDHKNq44q7GbNg0Y/z6zKr9q3D5vx0tSNm3NKnRcWKdR/NptGWlm3DpAA9MyHpyrbE
         JgZD5lFEZtcpieEkOp1brehAQPcdyeUJWv0fCLGRDRlKK/L5PYCb1geAWgD6448TLAl+
         4QXmLpR9SCxt8blBuMKB7B6t4ZOIAFSBG2WFkGV2HwuvikDyfC2VrjDFopSmwdCa2Qrw
         /s0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765530050; x=1766134850;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0mw2ckxKrCqrlVWik5CQTkeiXSkBsBd0QUuzrYIPgiQ=;
        b=rVR0wcfXeejs/mC3Inc5BlA0itoVxCO3EfKtF8hczsOKxR+yC97oKSxdZKn4CMfN43
         scIrc2fNt0tVix6AF4txEGL8u5rCvn44S8chNkLJa58iSKLQhMKz9fIYdjA5nivX5fNy
         z/LvBqJ3LRFx46P6wFmYLbDVxnWjjs47KYxyffEKL9T6HSeCGwlbdT4ym78IrU4l4/gA
         Nu/yg6rFnR31aUjaL4Ry1Pi4xpDZbr1FL7gF3e/8ToNy/alJ1JByjlE2m8r72A9AwveH
         89r2lIwCEnCnohjB2vh0bqgXtdkvUzjPfyOTcWQMP5J6wda9lyQ3Z6x97aGhyX/H8rb1
         J1YQ==
X-Forwarded-Encrypted: i=1; AJvYcCUAPAoVkpICiwdBs2jwlmg29voKUcbdoewgke5WpDlNv6NMWIZV6ukUMSaAZVRtxfJVnZPlXTWzbnfXPQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5cKP6MQk/kUATVx+0riy3/zwhq1+4N/0bcY5P7jfosMcbE4l/
	WJCz48fJwhTPR7plHo9/SMMNbRdyO8XChGRzuz6NZ/TJsBC1XJ86vmoucVhkJHGCjjJL8S35tkR
	t2U6IJ40FjIZrYLgmwEWn70rTbExmK4rNjxUyIjS1VQ==
X-Gm-Gg: AY/fxX7dmY63NZIYyfOZMdT/lShvaZ3AlAI6Z3lzKcpKkv23hSGVS241+4b1hKJcINs
	p4uaHszQCtJOfVZ5DGmGfqa5woHXB1b5fDFCEtRrVlS9JFj1nNht2dTqAYndeCAJU9UwjAEyZzf
	gCQnfILpO4v81G/mNzg8inliA8uopDUAHjvFwOVO4u0tJkTycszz3cDItURozyimdRWVJiJeOOR
	n1r+Cjgnj984aalf2E5REUoPCeKHAfnwSXMfKITGCfjRp8/R0meVGBnsACreVP2Rm1zpsbKL4u0
	ScLgGh6tGj78bx16uB7rwjF8QHpL
X-Google-Smtp-Source: AGHT+IGHt0jB653fstrXoO4vNaIHzgQTjgWqFmWp/4blz3V3HQcG84keViqz5W7TjXHTBEBk+A9OOWVA1fGP2/OdKUk=
X-Received: by 2002:a05:6512:39ca:b0:598:f392:897 with SMTP id
 2adb3069b0e04-598f3fdf577mr1812272e87.22.1765530048350; Fri, 12 Dec 2025
 01:00:48 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251107141303.223254-1-marco.crivellari@suse.com>
 <7e24110636db36e8c0a877d90d2ed9570c4aecf5.camel@ndufresne.ca>
 <CAAofZF44pUoyDPnnv9UUuMkYvqiSWP4gELg4rutgo=3tNpBZsw@mail.gmail.com> <fd401d1b4f1e7b7178699227d31976453de5891e.camel@ndufresne.ca>
In-Reply-To: <fd401d1b4f1e7b7178699227d31976453de5891e.camel@ndufresne.ca>
From: Marco Crivellari <marco.crivellari@suse.com>
Date: Fri, 12 Dec 2025 10:00:36 +0100
X-Gm-Features: AQt7F2qisoxfgXyJ_Gr6IYtNxxPMB4bbWODY-TGwkyfLroDt6ydW5EY7csE5T24
Message-ID: <CAAofZF45i42hvn9bN=77WzcRmAj8eGXFjY7uA+cmnSLrJUNaLA@mail.gmail.com>
Subject: Re: [PATCH] media: platform: mtk-mdp3: add WQ_PERCPU to
 alloc_workqueue users
To: Nicolas Dufresne <nicolas@ndufresne.ca>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>, 
	Frederic Weisbecker <frederic@kernel.org>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
	Michal Hocko <mhocko@suse.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Dec 10, 2025 at 5:04=E2=80=AFPM Nicolas Dufresne <nicolas@ndufresne=
.ca> wrote:
> I don't have strong opinion, if you think this driver can be ported in on=
e step,
> that is always my preference, and making things explicit is also nice. Bu=
t I'm
> also fine picking this as-is for now. Let me know, your preference, avail=
able
> time and safety of not breaking anything is valid argument to me.

I would like to wait before the conversion in this case, to avoid
breaking the driver.
So I would like to keep WQ_PERCPU instead, like it is now.

Many thanks, and sorry for the late reply.

--=20

Marco Crivellari

L3 Support Engineer

