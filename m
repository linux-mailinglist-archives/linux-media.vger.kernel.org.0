Return-Path: <linux-media+bounces-67540-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id s4cBBFXgVWqvugAAu9opvQ
	(envelope-from <linux-media+bounces-67540-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 14 Jul 2026 09:08:05 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CDB1751BC7
	for <lists+linux-media@lfdr.de>; Tue, 14 Jul 2026 09:08:04 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=q21vrEUS;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67540-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-67540-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 132A43071A4E
	for <lists+linux-media@lfdr.de>; Tue, 14 Jul 2026 07:07:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26BB33EB11B;
	Tue, 14 Jul 2026 07:07:06 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56CED286409
	for <linux-media@vger.kernel.org>; Tue, 14 Jul 2026 07:07:04 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784012825; cv=none; b=f1I+XqNs4UXqXd7knAARAF4szTsAqFr+N9RsPyL47wT6Bz17JmA1RDQFdrzncOL6Ls4DWVcumf/DhMC7g3s6fs+TyRRoQYtsKHihPf5TqUvoQSxhAInqISfadX3rK06Ok/mEem/r5jHizd9P5c5WdHzlDOGopQ5t5oPpLeoGcZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784012825; c=relaxed/simple;
	bh=/KzGKOlZ3bvNcEj7sYeqDf47jh7JWb8fyxkKwOKfcd8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gm324WRSQR/YjNl9rGUA0WSepF/WTQ0gsraWrYl3DYZ/7oRCWao+4udMxHuiKtrgz5aPK1NcdtueWz9kDSgSuH5+hgmZXZCQATJTGuUMeabyaIQh7PcWG4Pa6UvHhYU6GpebDA0s9eHtusSpTgcUeXLU1gqrf9gCeQkblyfm7cc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=q21vrEUS; arc=none smtp.client-ip=209.85.167.173
Received: by mail-oi1-f173.google.com with SMTP id 5614622812f47-4896ae35be9so1585223b6e.0
        for <linux-media@vger.kernel.org>; Tue, 14 Jul 2026 00:07:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784012823; x=1784617623; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TuyYrGZ1DyNEfIN58XUvMb0/+UabFx7P6cZQIsqhIhU=;
        b=q21vrEUSBfkgQZV8KynGMpv24gIWKddIfth04scG0gwpVb5yQYzyJYUZV48hESJe6K
         NbkhhNZ357vXRvussqSGmIF+jij9y8b4rOh+EXCJyVN4i/QtyTJ42QTEXQevzQe/JNwE
         m0TX8SferYfc6dKPvRTlmtXEDQ0xuAsrQeAA1OP+1wSy9pk0/HPxuPCOlcDD4ouze4jI
         HmbofXGEpR3D9GVlOdSd+fb9zhWg87dJaPoK4VN1vOVdTBzTnOZ27LRTMJx2xMZsVqh2
         SjoR1R0h2/p4Uu7AYcpjJrnpK/hKuns5KWRrz5FdNuaVBRiLwctkys0sLVaXd0gs6bHV
         H8XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784012823; x=1784617623;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TuyYrGZ1DyNEfIN58XUvMb0/+UabFx7P6cZQIsqhIhU=;
        b=E8NYaJtyj10iB8jyN0HjjDrqDJ3Eig4JZMkYBRO92a9S3GjLuJy8tq+u/kPHGhc6q5
         Q5UYRSEoicz2T3RcEwGkKaM0tr3qJ05fGLesrmuA+cpJ63oBo1nRAaZPhpT5xiDwC1dH
         36eP0qJ0Dthe3YkRMOtdV2uyqDTWaiR+U7k9S0KsJBzyuOp50Y81mGgVqcsaqzGys9rY
         Hds86ZVVa0ruK7VI2bZmQh6BCOgd7keFRXA33aUGBqhOV4O7+mZiI/TYi1M9V2aILP8L
         I0gKXb9ZSsqWucEB1oiczeW+RURoqsZqubhkO0BZsUFicRComKqJQCtdNC/E7ptRlM17
         OVdw==
X-Forwarded-Encrypted: i=1; AFNElJ9mUwl0cew8Et2Pt65Gf4rM8hD8eQ3tCEgUtcwvnsBFDh50RBJZWgERiuROyaXBRdCnJau39u02b9wong==@vger.kernel.org
X-Gm-Message-State: AOJu0YxNQlg9dmkBgucuW3DkX1cchH2XXQEASSY8USX4aK7lAvf679GF
	HLHX+avv5uGbpZ18hjmIUjYuQ4GMzhm7eqTo7/GCJs3mUalXx/gIBQCI
X-Gm-Gg: AfdE7clH5p9SLji30I+memhtgrqd/eZKdcUFFBB8CRBzBpejracrHybm674qzDhxfRZ
	gwaGi93BQFkLtSPLO+6eOiGux4VTdv0hPem1QXcvnN4bxkSTBKJ53Si0+UowDHjL5XblxQnthhp
	lrZYAjr/FVm9B5XsufPGFosDgan5gMzrbwPSk3bIGVuxoO3haqUai2ImyedY7LsJxePcxxocAum
	3iTN+m0BluFU4LKnfTPW+Cbou+dLLghrfpHAErnsPJg39k5u80phzzd3T9SZhaDLz9tsz/WPhJg
	oH7gHJ0iVhwnG6qeT3NMc6F1u9t+4kUHhJbOWV0IzfELRkgfsmBBMJeZ8qli1+hi9X+XM7fq1JX
	Co9Opj/rHNPrSyt6Tiu5moiQXC3AMyoyZ6KXGKHpMQU6ouwyiBZYe+0XBTyocisV8D2RJrVbygz
	s8yIUa
X-Received: by 2002:a05:6808:319b:b0:4a4:25b4:a0be with SMTP id 5614622812f47-4a42abc0379mr7380084b6e.2.1784012823154;
        Tue, 14 Jul 2026 00:07:03 -0700 (PDT)
Received: from localhost ([74.80.182.78])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4a1ad5a77e3sm13498322b6e.6.2026.07.14.00.06.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 00:07:01 -0700 (PDT)
Date: Tue, 14 Jul 2026 10:06:55 +0300
From: Dan Carpenter <error27@gmail.com>
To: Alfie Varghese <alfievarghese22@gmail.com>
Cc: neil.armstrong@linaro.org, gregkh@linuxfoundation.org,
	linux-media@vger.kernel.org, linux-amlogic@lists.infradead.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: media: meson: vdec: propagate devm_clk_get()
 errors
Message-ID: <alXgD1Vr1zAiVf4B@stanley.mountain>
References: <20260713171644.691-1-alfievarghese22@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260713171644.691-1-alfievarghese22@gmail.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-67540-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[error27@gmail.com,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:alfievarghese22@gmail.com,m:neil.armstrong@linaro.org,m:gregkh@linuxfoundation.org,m:linux-media@vger.kernel.org,m:linux-amlogic@lists.infradead.org,m:linux-staging@lists.linux.dev,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[gmail.com:+];
	MISSING_XM_UA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[error27@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stanley.mountain:mid,vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4CDB1751BC7

On Mon, Jul 13, 2026 at 10:46:44PM +0530, Alfie Varghese wrote:
> vdec_probe() maps any devm_clk_get() failure to -EPROBE_DEFER. This is
> incorrect because devm_clk_get() can fail with other error codes like
> -ENOMEM or -ENOENT (clock not registered). Hardcoding -EPROBE_DEFER
> masks these real errors, causing the driver core to retry probing
> indefinitely instead of failing early.

It will not keep retrying "indefinitely".  -EPROBE_DEFER handling
is smarter than that.  Fix the misleading commit message and add
a Fixes tag.

regards,
dan carpenter


