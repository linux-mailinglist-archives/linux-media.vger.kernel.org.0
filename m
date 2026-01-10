Return-Path: <linux-media+bounces-50331-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C8C4D0CACD
	for <lists+linux-media@lfdr.de>; Sat, 10 Jan 2026 02:02:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 8458C300DD86
	for <lists+linux-media@lfdr.de>; Sat, 10 Jan 2026 01:02:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB89619CD0A;
	Sat, 10 Jan 2026 01:02:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f1zGE/ap"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEF061AA7A6
	for <linux-media@vger.kernel.org>; Sat, 10 Jan 2026 01:02:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768006967; cv=none; b=i0IuKorxiu0PS5AcfsRSkDoYpEdINvqmc8e5XBof3Ry1FpkdYVGIqOSOJLfVDXkC1bHl3w2MkoQfCunCd7aTiO4A0KI/x6CekZs1fWSzUDQ9DWmblZMYPrsmaFak/BeDDXA0YnNq/5ivn7KnfK0O6WS4YebEabOGj2LQn7N6Ny4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768006967; c=relaxed/simple;
	bh=ixJdBpkE90qTHpaWpqSYWXgG2UnXLGOifDLwOvD7fYo=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZJNTUtmkpZAr7NsnV1PROyATnek+SE/IaiTRBq/58Gc4L8YflemqoPFEh3ErxJX/UEBXa0+sBg1nn9JHNPNcanMhVMkCy6/t2myopShi7H1gAfeY9xnMBTtcFj5W3+nO7OAgVs9BDi7Uq+OoyORpBMaxJ5QJ+N4qMxBZlJcvzic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f1zGE/ap; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-8b2d6df99c5so360681885a.1
        for <linux-media@vger.kernel.org>; Fri, 09 Jan 2026 17:02:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768006965; x=1768611765; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=D46mdQMDj5+zG9XaeLULmbTRXkuU68sa+3jgTbNzvHI=;
        b=f1zGE/apwKIZ9XuSlDBjitRepgmRXnjNFx5hCiGOdhcTpvuOTZxFe5NLzZCAScDzIB
         30KGjdOB49YmdDjm6fVMeYgXK30nwVDADY1cuB6ifSihuMwpe9aEASlYcfRIuT4+JVeE
         NqwyqTl5IBcjr+owxzZ8n19KlPU3sUeI0AGBYC5MtDUOIfiVr1tsboEhLNW6Vi7eSzq8
         FRKwZ0k5Ve39d6sD0mrG06ZhXSEkfqT6jpjI5daIjEnmfHqpqPeoP/hGWVYFX4jVXr80
         F47Ncx0/+T7g9MlN0h2JzRxRCaEZDrj0kcFtKaQVW984hkZdvUbcKsDAbGqkFBPMlx4/
         CwFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768006965; x=1768611765;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=D46mdQMDj5+zG9XaeLULmbTRXkuU68sa+3jgTbNzvHI=;
        b=HFUjpBsI8Iz80fYn6TXqOEjUQ/Av9YiFWaY/YrtcEw99z+cwC7xbb+c6SYLyq2NFDn
         HpMvA5XWKf+tE7G2ZmilT5OwPA7S+0jDX1Kcvp7Z8PrdmUmCU7eGhP8ILPtPGjDqhv6B
         Oz9AkYHUJQ0LEVoMI4C54YxVNNeBrelocgPSWbcYNu5n/HDPTHW0e2tE1BCsbZW6wYg3
         KzjtJa1iVGtIDzdDFyQ4l9vy4a4p+0cDez2cc+Jvq3xTTNAbCyYIv5fgP+FonEbjvQKi
         SPWNisoV91nL4yXRTr/275j0eDF+DpU0GiFaYor1/Eq4c0x1v+af4c6zWrMW+ivzLk/u
         u+NA==
X-Forwarded-Encrypted: i=1; AJvYcCWT8oWTYOh3TcXFEqMrs1a+EfK/ZSfxWh+68iS83MHghpoKfxGyIVsAok5nqhNMG0Aog0FmvNfK0IKOhw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwNzfTWA2SXIu1xk9scZFwQt63d5FxXy74VWNe4t32p8KX78qur
	18wvC/8eGBTyPi56+Zv0K1gn5NbKb+h/qSQq+FdIyy7jd3NmQxMFH1sC
X-Gm-Gg: AY/fxX6wIwDlJ477iZ5tsiN1dMV/rqVUaIZM49RkvLzJ/pDqGLcT1166wtlOR0b1FKA
	6AL4XDrjnlpFlgC+WGZmu/lV/vnQQw52nkrj54GQN+TbMbRTJx19EVpntOzwXyCeVjoVvTzeQkr
	t9eZxbdWaKHaF2AQFtuAREuSNdtmyHil8ok34NIjHEdncQl05w/W3pnSyqHCp2QcO+9Zan/1vPt
	gz71wwIflcsuB2THGJ4eluooxTq2P2U8xhqL19YqDIvwBY2u8XJlVghbggMPLvaGMPRayLL4wAl
	dwXriqp3u15pckV5/AX0RV44KueYy358SArskt4cpMxiZoMSrn86jzvVTngn2GwMxOXcPcJqcSF
	kWJoTDURKQ6sAi5xHctQHDqCavwIizk3Ni0fVWSX7Y2Gu5Yz2NfY+Fn0OiyZbks6T3eGnjzJX3y
	LB/YOLfuEyZy2Rqw==
X-Google-Smtp-Source: AGHT+IHBDzRmIpO26TQmtd7BhHH/NO3lWFMVLoQAqkeDRXpg/uMd9p6q/2JbD1+tj8TUF+imdXBEMQ==
X-Received: by 2002:a05:620a:4805:b0:8c1:aadb:5313 with SMTP id af79cd13be357-8c388bd8ef1mr1683928485a.25.1768006964911;
        Fri, 09 Jan 2026 17:02:44 -0800 (PST)
Received: from localhost ([184.144.58.243])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c37f51ceb5sm996870685a.35.2026.01.09.17.02.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jan 2026 17:02:44 -0800 (PST)
Date: Fri, 9 Jan 2026 20:03:03 -0500
From: Richard Acayan <mailingradian@gmail.com>
To: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [RFC PATCH 0/3] media: qcom: camss: support for empty endpoint
 nodes
Message-ID: <aWGlR31aNYbogtrg@rdacayan>
References: <20251230022759.9449-1-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251230022759.9449-1-mailingradian@gmail.com>

On Mon, Dec 29, 2025 at 09:27:56PM -0500, Richard Acayan wrote:
> This series adds support for empty endpoint nodes. It is currently RFC
> because it continues an ongoing discussion on how to selectively connect
> some CAMSS ports to cameras and leave others disconnected.
> 
> The SDM670 patches are for a full example. If agreed on, this should
> expand to SoCs that have CAMSS.

This series is abandoned now that it seems fine to add port labels. No
need for me to revisit this unless someone has an issue with the
proposed port labels in SDM670[1].

[1] https://lore.kernel.org/all/20260107043044.92485-4-mailingradian@gmail.com/

