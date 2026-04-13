Return-Path: <linux-media+bounces-58624-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4EMpA/OU3GkkTQkAu9opvQ
	(envelope-from <linux-media+bounces-58624-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 13 Apr 2026 09:02:11 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 122203E80B9
	for <lists+linux-media@lfdr.de>; Mon, 13 Apr 2026 09:02:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 837BF30074E4
	for <lists+linux-media@lfdr.de>; Mon, 13 Apr 2026 07:02:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B811392C50;
	Mon, 13 Apr 2026 07:01:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VSu9s4sN"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 384BB363C6C
	for <linux-media@vger.kernel.org>; Mon, 13 Apr 2026 07:01:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776063717; cv=none; b=rTLpBIFgA1kh7CAJOC35MalrTsLt2gTP13zyJh17N0fh0ZYVQRQ71SWX0MZwNd0K6qyjBCy31dR+aTPZHZgxAHshHyS9DcBuOjPygyz7c+Kib9MKEUKwCiL58I24nok9CwbdtPZebOk1mQ905/dttgyZR5oHkZIHu5cCOFWLcf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776063717; c=relaxed/simple;
	bh=OQWhhxZqYKALJZ3N763IzPmDXKZvPVfT1efgkV7AF2k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KAZMbYTDdQTFbjqTwPMFMMiBwN2Cvmq85HaZEZeeBv0DmrPuMZgBe1cXLoWZiJ36OlEIeWkp0uGPE8k2zHyWWzQ1CkJ3/Z1vN6i8lpx9en+sOEfzJ7lDryYLTpVAVTNivb1qbBv9KCFeD/MWYZq8p3/5JcXoAcB3FxGR7C04H+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VSu9s4sN; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-43cfbd17589so2683495f8f.0
        for <linux-media@vger.kernel.org>; Mon, 13 Apr 2026 00:01:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776063714; x=1776668514; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8CjsWBGHpOx6h2pu1a1t11cz0On6SSLxT2QaJ9+1BPE=;
        b=VSu9s4sNCVocmz/QCpB+AHd1e/yt8kxc7IOms5YbN/IBpCMBk20I4wt3MKfyLxCr0K
         lgwJOpVmyE4Dob0SuJclMGnEtU9kGPoSmU5owwxbXV9/EG3y4rn/AY+Cz1dpXPrNjFKk
         GoM/L+Sir/1KGcvPlX+zdSaqycpmeLDXLxTxlBt0Kl2tpQyaRlakI1vTsEK4bjO3I7wu
         TvIW+fs+Q5OJOjl0IK8pZNAFOUcxj66W+rHaX2UM+k1phyzAYDEKJgmJ7FZelcGuql6J
         FnM92G+RbbXfk6Rocdyzuy1ryf/PbQZL8usRkJ/rlBNkf5/SuTBawvr6zByJ6aTrfurT
         cf4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776063714; x=1776668514;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8CjsWBGHpOx6h2pu1a1t11cz0On6SSLxT2QaJ9+1BPE=;
        b=QaCehNJU62JmbaOlmEnCXxwP0FZBWLesW9+F9PEimR35lp+klK8z34mMQ4EeTLW0oA
         h07NqGcUXsu1KqUybKkBbHfA/18Oxor6LwEBNZCkymR3fmOK1FfsarLVIZZJB2s9WrgH
         N9hAGPKOU/Upx8aX6Qv4LkHhVREUvAOMg+7BC3jcJlHrpGOzKin+kVV7kGh5OB0JUpi5
         5GlbWhT7IW1eooiFJe5WPrHfCrwzgWv2Z0jnyhqfaTtga0N3qmUhSARq0mDDm9m33lGP
         ITxvdNlVdMLP/x1FmFa7X/nsULGSnQMMIYDLICI5uCqLR7WpXX7PVJrLRp1cpyZHzct2
         RsTg==
X-Forwarded-Encrypted: i=1; AFNElJ9Mr8aqrLFnVF5nDUeKH01O4dQc2C4a4qbLz+ATWFGwRDi4hFxAixPUZYxhQxiqtVflO6YwywpfI6tAOw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwGZJ4Vg6hpJiO+rbVteuQ1cPlMQnOv89lFzWUDrZkNLeaw5pjH
	0M6E1BUdGkRieJf51VYpazzHyTLwDN9S++RCAQvuavWqB8Wb3AXb2glM
X-Gm-Gg: AeBDievIYmo/dyKwuNO+zJ7kHAyhbeCHtErHvKc/1qtp64u1Yn001tnOu5tnuLtPySF
	Le6wo/x9Tp/a2ghzOx0gsNMrTVnKh48+PbViuKtZ/F0+kx2HwGgCA5FDtNwHF5beawKPchuVjAz
	2EOneLChYHah/o3186lgS9osDpxVfLbNNPJc5oq8dgxXL7y8SBDNYdxvdlaLBdINpWS/LX2Ciyu
	ZSLYWCNJgStNbDnD5gsXMoX48Aga+Gt33qrVlxmwBVYOFATRce06+TQV7hak2a+klKO1YKOsqxa
	xZvKbZu4kuzDOgR5UVZ7QFzV6XATpj9BaVnTzvT+48LB0l6T4YhdG08N6LwU2GeR+FizXZLwbMG
	QH67ZbIs0zzqG3hBo1ycmQJBMIbMw9WlvK2n9e5o283AbKxhIwNCZMLomOpulGSgee7XoE9kryu
	E8IwbkpRISBm/inoKyaPo=
X-Received: by 2002:a5d:584e:0:b0:43d:781d:37b9 with SMTP id ffacd0b85a97d-43d781d38e6mr3972596f8f.42.1776063714250;
        Mon, 13 Apr 2026 00:01:54 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d7b543057sm3291602f8f.6.2026.04.13.00.01.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 00:01:53 -0700 (PDT)
Date: Mon, 13 Apr 2026 10:01:50 +0300
From: Dan Carpenter <error27@gmail.com>
To: Michael Ugrin <mugrinphoto@gmail.com>
Cc: hansg@kernel.org, mchehab@kernel.org, sakari.ailus@linux.intel.com,
	andy@kernel.org, gregkh@linuxfoundation.org,
	David Laight <david.laight.linux@gmail.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH v2] staging: media: atomisp: use umin() for strscpy size
 arguments
Message-ID: <adyU3gvOhmUNX3l_@stanley.mountain>
References: <20260411005512.46142-1-mugrinphoto@gmail.com>
 <20260411173405.14485-1-mugrinphoto@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260411173405.14485-1-mugrinphoto@gmail.com>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-58624-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,linux.intel.com,linuxfoundation.org,gmail.com,vger.kernel.org,lists.linux.dev];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[error27@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FREEMAIL_FROM(0.00)[gmail.com];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 122203E80B9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sat, Apr 11, 2026 at 10:34:05AM -0700, Michael Ugrin wrote:
> Replace open-coded ternary min expressions with umin() in
> strscpy() calls, as suggested by Dan Carpenter.
> 
> Signed-off-by: Michael Ugrin <mugrinphoto@gmail.com>
> ---

LGTM.

Reviewed-by: Dan Carpenter <error27@gmail.com>

regards,
dan carpenter


