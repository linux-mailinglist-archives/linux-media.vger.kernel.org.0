Return-Path: <linux-media+bounces-18405-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FFBA97CF51
	for <lists+linux-media@lfdr.de>; Fri, 20 Sep 2024 01:00:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CCAA61C21645
	for <lists+linux-media@lfdr.de>; Thu, 19 Sep 2024 23:00:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4779E19D086;
	Thu, 19 Sep 2024 23:00:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cowlark.com header.i=@cowlark.com header.b="05DAHdPa"
X-Original-To: linux-media@vger.kernel.org
Received: from mx2.mythic-beasts.com (mx2.mythic-beasts.com [46.235.227.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C992B1B2EC1
	for <linux-media@vger.kernel.org>; Thu, 19 Sep 2024 23:00:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726786814; cv=none; b=jm0rshsYcF/fPZ5C7p74KeoE8yIlzmseNAJpe2foKh98sSjRorR5gmqjW55KjqQGrrqz3L/OZavre5yoR5KO4dwmuSjWuNabmW7QDE3cW6Dt50sNGLdMUhSLBapjUIyAQ9ejpXOo72yjwft2B/rSQEhGaSZasjSAJjYdl+22NeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726786814; c=relaxed/simple;
	bh=hsvBowfZLpIk5IxHMBrtazYSfLGe8WbzSVWC6zmHxk0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QlDw9eudwHNcsvgFzAwl416Ca+gd+D6VNsVhYj+dtqRwj91RvmINQx/7L96PJrVK3DnDWKq2ZjkZvURZBbwB3mipolTeRR+kyi7xy1/qiw2VO6/+SJHbYCPw1RkwI8BTBiIdUYVgdY8+q9OHVu/5UZmRQbh70HTQc6MOSadmqL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cowlark.com; spf=pass smtp.mailfrom=cowlark.com; dkim=pass (2048-bit key) header.d=cowlark.com header.i=@cowlark.com header.b=05DAHdPa; arc=none smtp.client-ip=46.235.227.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cowlark.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cowlark.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=cowlark.com
	; s=mythic-beasts-k1; h=To:Subject:Date:From;
	bh=hsvBowfZLpIk5IxHMBrtazYSfLGe8WbzSVWC6zmHxk0=; b=05DAHdPaOuzGIn78CXDZcrIzao
	EsoWs8JxT0H8M2n/4m0Kx3K/i9hqcgn76kyR7fyxcS/NTPp+vm1p/qYawltsAJhHO+jqVtyOd3aLb
	L+BIrePH/yZwPpbsPVPvmf90uyuqwoXuuJXBwq+GM5ph4LFZ1ruVY7c+raxZ6pm8it2fZLHnsfAga
	qeZYZSkId/br/MujU1clXpKHjqfD2hu+cG/7u/doIvMXfyVSyTSuwUuAmqNtFvK8CN1dXnbDj+0GU
	b1Uvk4LaU9ZGLh9s09+i5u3CvFr9DuFccntfP0cQkQnm5CRxpAXth0QPJt554OHElTl/X/7zFk5CO
	+vm49Mpw==;
Received: by mailhub-hex-d.mythic-beasts.com with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <dg@cowlark.com>)
	id 1srQ88-00HFvM-PI
	for linux-media@vger.kernel.org; Fri, 20 Sep 2024 00:00:08 +0100
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-7db1f13b14aso1076313a12.1
        for <linux-media@vger.kernel.org>; Thu, 19 Sep 2024 16:00:08 -0700 (PDT)
X-Gm-Message-State: AOJu0YwrdEf1DNeQoHDt2FhaAftT0c324xj4FvjyCR+LsDAXwC9QkpCR
	D/+7y7pl87mKPztuwu5m2QsN0ElpLf9MWNE8g3GRSHp/Y8M2p14ddBoeN6OXrccc/DTuNIasBMZ
	nArl+6EdnXb+XmbQQJXuM7c1/VW0=
X-Google-Smtp-Source: AGHT+IHIvmT/esMhIiuVGsqtZWRQ0RG+6wsi0iSBHSlpf9pEdj4SWuLhodXFcMOUfVRLhmuT5tvn+EBQblLwNakuv9M=
X-Received: by 2002:a17:90b:4d0f:b0:2c9:7ebd:b957 with SMTP id
 98e67ed59e1d1-2dd80c17863mr929285a91.11.1726786807135; Thu, 19 Sep 2024
 16:00:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240918180540.10830-1-dg@cowlark.com> <20240919223001.GD29185@pendragon.ideasonboard.com>
In-Reply-To: <20240919223001.GD29185@pendragon.ideasonboard.com>
From: David Given <dg@cowlark.com>
Date: Fri, 20 Sep 2024 00:59:55 +0200
X-Gmail-Original-Message-ID: <CALgV52jY=UL1EnDr1hj=msf0Hhagcoyipg_DmCpuiJof2WdzOg@mail.gmail.com>
Message-ID: <CALgV52jY=UL1EnDr1hj=msf0Hhagcoyipg_DmCpuiJof2WdzOg@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] media: add support for the D3DFMT_R5G6B5 pixmap type
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-BlackCat-Spam-Score: 0

On Fri, 20 Sept 2024 at 00:30, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
[...]
> The subject line should start with "media: uvcvideo: ". I'll change then
> when applying the patch to my tree. No further action is needed from
> you.

Thanks very much!

