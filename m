Return-Path: <linux-media+bounces-42489-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E8AB5B5682F
	for <lists+linux-media@lfdr.de>; Sun, 14 Sep 2025 13:59:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AA23F16E726
	for <lists+linux-media@lfdr.de>; Sun, 14 Sep 2025 11:59:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6668256C8D;
	Sun, 14 Sep 2025 11:59:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VnMrSSpz"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD5A4226173
	for <linux-media@vger.kernel.org>; Sun, 14 Sep 2025 11:59:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757851167; cv=none; b=Znw+0QH1BMs7jJF928OspkGRQN1ooqwsFg3I/MI5E6VK5p+ExS6s/XK4/kCh90MDytY7jJVwf9nxCxVifFEAvb6vZR6xGhWY7WbfWPAfoFdX0px3TNC8Q+UbPFAMRGtjG0PMYHDXtwJU7S06nVMN9OxidmgQHfkMirm5aXHhd/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757851167; c=relaxed/simple;
	bh=TuJ6ZyIXo9169+QV437Uuh1TahXjuW3Nbjn9ho+NqUU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mII66pS/tKMp18pPQYXlVv/C1cWth+KitfnzvZOrp8GjBA5lFUqBv3PsbTZzQDClPysIIpy3T3RlFteuP0qPH/26AeX/yTqxMQiL6tzzcln+9vNpIGW2fH+3TsM0DWf49hrLOt/ImszOA/IsN0Wt6DlmerXIRPenpyXY6ugmcYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=VnMrSSpz; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1757851164;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TuJ6ZyIXo9169+QV437Uuh1TahXjuW3Nbjn9ho+NqUU=;
	b=VnMrSSpz2kxfge5cK3f0hWy2OUuzhvozdVorgJ1yOI5jSQPgh/fyeIaJoE3Ham8/4k862Q
	tgfxNbs5Gxfz6MzZFq1ZmuQkGUBRV47IDKy46Lt3iSE7VPqezcoQVaPxslivgBV6ouy5Bv
	WofcqCwm18QyVIGJSDFBG5s9LaKQesQ=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-538-7Z5cKzXQNwSH8QW1NYGa8g-1; Sun, 14 Sep 2025 07:59:23 -0400
X-MC-Unique: 7Z5cKzXQNwSH8QW1NYGa8g-1
X-Mimecast-MFC-AGG-ID: 7Z5cKzXQNwSH8QW1NYGa8g_1757851163
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-77766aadfd4so8500156d6.1
        for <linux-media@vger.kernel.org>; Sun, 14 Sep 2025 04:59:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757851163; x=1758455963;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TuJ6ZyIXo9169+QV437Uuh1TahXjuW3Nbjn9ho+NqUU=;
        b=oCth2R3OqTQJEtSPB0uy/RjAEspqLlL4M0BTWhlGAvfj5GdwjlXP/p4Narl6vJucTK
         MRtY15ssO8Zp+RCBLXd/2lxqEyLjlnp5UpmbRvhOp/5kN7+8x0NHF/nkhoIfKzFxqYJg
         3TtkGZ+NWVniF4LBdovQcljp4F6Af3mW8OT/IBSS4HKdu7Dsx/FiizfbqrjE98+ROceB
         aVZMXqf5I9WXb3AhAXHnnFu1Gu9M1X87BxdLXwtaxxmggAxHQ+xvMHGrYqbg+pKKtnhs
         la3BXTNM8AjjGDAaOiqkuugRr4F10BaIm2WE/RsPgrMeWEyT0i3+tDeqMoyP5g3re/CV
         1MsA==
X-Forwarded-Encrypted: i=1; AJvYcCW7gbPjjFY0VuSWKtmx+dfiU2tz9MnJK6SLU6HgpyUPsUYXN+s1it19AIxbHa5NLIZoxFujBbvXvTbCKg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5Wd+6+aGFmd9KwG8DW6cq2eh3z2ntFdfB09el83AbkzeA64H0
	TzKfXqbtPviznqCTiWrievQy5xGUp8fQl1vbNIfZZIBgGe9YCfPqt3SMApkVx9ELSP7yVE/8bx7
	BbPRkxmYeoN7iAPFrNjVq+5Gy0pQsT1wkGaMn1PG6Q5W0Eg1Wf6uBHAvRNZS3/uZ9
X-Gm-Gg: ASbGncssPbEMm8DBOy/zlXfuk2pF7PZGN8xPLGlqbaauJbKIuH+5936YKfhCsGQZ+3o
	pByMfNYDHZegzTF1CyjzH/nXXEo3LWvXSfLc9wtPWLmDkB1Gl6xqlS3T/TBQy4pA8qIXlogWc78
	lAdwauKt7ONyZ+jgmppQmeagMIlxwa7t05a2woQvY+p53ApkqgeMUQ0Bvk2USMr9iDvjzpXptJ6
	FgNQ92ptBsQcv5gZS40c7iwZIfYtVcMZUn4TmfSIrGSn3glyjretozp0/W0WGQWnk47XUXWqf2e
	MfqNgRYNOEYlS7ei8y7xyMcwVEivH/lzb3tVtGl8LmFp9Axk+IGqAauYcXDJvnycM5r1revJNiu
	0zlW5PuSzs/F6CreevJypiEocLHxKBZM=
X-Received: by 2002:a05:6214:29c2:b0:722:3a59:fd9c with SMTP id 6a1803df08f44-767bc9e3085mr125308576d6.23.1757851162705;
        Sun, 14 Sep 2025 04:59:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH8iWdV2eUk9Ftv51+HsH9mmPirIh3yTgTyTqB/S+vGeXIJXMY6wV4xvkdS+fQXOzonhJtDiQ==
X-Received: by 2002:a05:6214:29c2:b0:722:3a59:fd9c with SMTP id 6a1803df08f44-767bc9e3085mr125308326d6.23.1757851162326;
        Sun, 14 Sep 2025 04:59:22 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-763b3f49139sm58611576d6.9.2025.09.14.04.59.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Sep 2025 04:59:21 -0700 (PDT)
Date: Sun, 14 Sep 2025 07:59:20 -0400
From: Brian Masney <bmasney@redhat.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Julien Massot <julien.massot@collabora.com>,
	Maxime Ripard <mripard@kernel.org>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/4] media: convert from clk round_rate() to
 determine_rate()
Message-ID: <aMauGOA-9FvJJ7eD@redhat.com>
References: <20250710-media-clk-round-rate-v1-0-a9617b061741@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250710-media-clk-round-rate-v1-0-a9617b061741@redhat.com>
User-Agent: Mutt/2.2.14 (2025-02-20)

Hi all,

On Thu, Jul 10, 2025 at 01:29:05PM -0400, Brian Masney wrote:
> The round_rate() clk ops is deprecated in the clk framework in favor
> of the determine_rate() clk ops, so let's go ahead and convert the
> drivers in the media subsystem using the Coccinelle semantic patch
> posted below. I did a few minor cosmetic cleanups of the code in a
> few cases.

Would it be possible to get this picked up for v6.18? I'd like to remove
this API from drivers/clk in v6.19.

Thanks,

Brian


