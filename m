Return-Path: <linux-media+bounces-58034-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gDg6NZyCz2mwwwYAu9opvQ
	(envelope-from <linux-media+bounces-58034-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 03 Apr 2026 11:04:28 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C61B3928A2
	for <lists+linux-media@lfdr.de>; Fri, 03 Apr 2026 11:04:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 276B3301DCEA
	for <lists+linux-media@lfdr.de>; Fri,  3 Apr 2026 09:02:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03DA53859EB;
	Fri,  3 Apr 2026 09:02:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Js8Z/Q4R"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36843371881
	for <linux-media@vger.kernel.org>; Fri,  3 Apr 2026 09:02:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775206943; cv=none; b=gWVxcMy9SwYkZ4BtNWzXNPRCiM00xZiBdDJ7vhS56xTuPXxVclXdga9Rs17YABDxwxYosTSD36XboDpBE+756CnT1epNuXSDyV3A77izqtw9fRVqEfWT3veDqWm8TQJBcaM03LAogMQ8b+v+JbXxTtX7LeJ1lP3XNAONwKfbHwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775206943; c=relaxed/simple;
	bh=7XGrSCNrN5uhRtsxuhz5xVWLn597vTSmrRo+qSOXmXQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hvL3zrjolyI52UeIC8yxptENT37MFUotos1lnB0hKrhmrRVxas+opgExXJ7GTfCnnia4K7QG2PdUdgKtydK0ZCvhXsh2q50VyyIKc8WttDAOf4DUbHQY2o0sbyocxxVHf60A8ZNsjkb3wE0vbYrNpDDrSLimlgGCrHleMpZKcqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Js8Z/Q4R; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-488895ad947so19584325e9.3
        for <linux-media@vger.kernel.org>; Fri, 03 Apr 2026 02:02:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775206941; x=1775811741; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NSuDIoeoytZjS9lz1nCHQAgnrLXZ7nvk4L/rgRFQaoQ=;
        b=Js8Z/Q4R4fQLHS8DnI0JMDgTj/BwVhI/MUKBgyp+756JiKZIjYFC/Uj0KikdKWdAFi
         0WP4ju61hfmkNj0aMbCXIXsPvBY3Kiwo0/77ZYces+fO4K+WN1P4zgOxKW6mgFNwTwdc
         SF9rNf+10PP0GzexcLx/xdR3zRRdhHrVGH/RmM96y9PVyL26Fj50FYRBxm5O+6rNKiCA
         yYZ1H/tSQNpy5ZmsFbw8b88gxI4109cliJYhLjK/aabaliW3x5PzJUsgkXEgPubnDhrn
         FCOhTGwmWUcghBh3KGasOK4bYPCElsL1gmchiIKKccdkLbWxXL1Nfkkhr2tXZX1sAExk
         3qjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775206941; x=1775811741;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NSuDIoeoytZjS9lz1nCHQAgnrLXZ7nvk4L/rgRFQaoQ=;
        b=E3Vjfo0jT0+MblBoDPb+hrpvpZYPHxxVt5g7j06EsWVgS9lfsgH33rW56HigMDZ85B
         ATEYWAvWfWsus5I8wglEEWI7QrkpcE/0lA3i0jTK5hCGkfey2LIb/G53Be2Gzcy06YRk
         RZILZkNR3pkg+gYGMIBwLLxbacmrAiMSWHWi9ZEEMog5Tyqp6UF8i24d1brGaLgpsDWU
         b8N4BIscmmnyr7iUCHeoOBuzQvA2yFFZZC+9E96sfzE97zNYGj4Y4WkdXa+zJvJEVf6Z
         39wwCETnGzOFdig4EKDpXhKcdRQo6fCafgv5C49uOzBzqALhY1mqlkJr4aV8XubLautz
         66Bw==
X-Forwarded-Encrypted: i=1; AJvYcCXgKtInAYrAIstyp+mg5d8qH1IzaavbyVHoIdj3MOxh85p9w3cEjsJZuqvVzKsAi+gPDFBbe7Fp1pIaXQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxSAQhuiDGhpa/cLBwbRnmi7V3dEDTrGgBNiUToU9ZzT7hUJYkK
	8u85Xi2oDU+StaG3KwfvWoNnUx/CCi2RMA8KhX4vj27LIIagDsJ0zmaH
X-Gm-Gg: ATEYQzwJvhmpunFZWYaPRn6bdShnGmdfOapY+PZk5jkMfvHyozSGF5wpaxVUclF/NoZ
	9dbsMLxI2rVUkdPhbw/4bEaVjRw8YTS3Z1AccxifkFypX6G8gNFtMW9luMTGEBTiRziQQerwGC5
	MjiXp7WlCs+8yUtghyKJhSoJzEo9gr0HaQQi5p8UFJPIjkWf6PPP3/4+ctyJqE8P+KAPS6qZYbc
	f9sL05NxzHRDKJ0aSjkjrMAMvE8NWWRZDpma164qdLYv839pLOPxxzGkCZvD4QEU5acwCXG6rpg
	R4NL5gLTg9zvJuEtaqsVasfE8gvB9CEufHKhGb3iqUQZesO7xYAhril/WoeANmxosabZMebpHol
	1pCQ3J/+xz77xs6JteIBR1R5LEj1RX3WYy4EuZ8vbF+azpFKcT5enZjWCMGxBHn2M1gH2XaBrQj
	OaMRHXhzMhQ1DNafio5d7VkG9qPCJ7
X-Received: by 2002:a05:600c:8b52:b0:486:f9d0:aac8 with SMTP id 5b1f17b1804b1-4889978140bmr38999785e9.18.1775206940413;
        Fri, 03 Apr 2026 02:02:20 -0700 (PDT)
Received: from gmail.com ([2a00:f41:1cc5:ab9:2a0c:50ff:fe2f:36f4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4888a626100sm218963985e9.1.2026.04.03.02.02.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 02:02:19 -0700 (PDT)
Date: Fri, 3 Apr 2026 11:02:17 +0200
From: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, Andy Shevchenko <andy@kernel.org>, 
	Hans de Goede <hansg@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: Re: [PATCH v3 2/2] media: atomisp: remove redundant call to
 ia_css_output0_configure()
Message-ID: <ac9864qwMrHuU8Sy@gmail.com>
References: <20260402183402.444630-1-azpijr@gmail.com>
 <20260402183402.444630-3-azpijr@gmail.com>
 <2026040336-humvee-throwback-72cf@gregkh>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2026040336-humvee-throwback-72cf@gregkh>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-58034-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[azpijr@gmail.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 4C61B3928A2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Apr 03, 2026 at 08:42:11AM +0200, Greg Kroah-Hartman wrote:
> On Thu, Apr 02, 2026 at 08:33:45PM +0200, Jose A. Perez de Azpillaga wrote:
> > The function configure_isp_from_args() contained a duplicate call to
> > ia_css_output0_configure() using the same output frame index. Remove the
> > redundant call to simplify the configuration path.
>
> Are you sure the hardware doesn't actually need this called twice?  Lots
> of devices need to be told multiple times what to do in order for it to
> "stick", hardware is "fun" that way :(
>

The concern is valid in general, but ia_css_output0_configure() does not
write to a hardware register.

ia_css_configure_output0() writes into binary->mem_params.params[], a
software-side DMEM parameter buffer in kernel memory. the ISP firmware
receives these parameters later as a batch, not at the time of the call.
calling a pure memory write twice with the same pointer and same value
simply overwrites the same location with identical data, there is no
hardware interaction that could require repetition.

> Have you tested this?
>

as noted in the cover letter, I don't have the hardware to test this.

--
regards,
jose a. p-a

