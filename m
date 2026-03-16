Return-Path: <linux-media+bounces-55860-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4P9uFVW+t2n5UwEAu9opvQ
	(envelope-from <linux-media+bounces-55860-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 09:24:53 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C983F2961D5
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 09:24:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 389A43008E1C
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 08:24:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01A6A37268B;
	Mon, 16 Mar 2026 08:24:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zdAA2bTx"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C53B6371882
	for <linux-media@vger.kernel.org>; Mon, 16 Mar 2026 08:24:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773649483; cv=none; b=AzvdZDFJuoKaCm5zl6sZPO59OmzwuPcJYeQLfDTo/3Q9mmM58/1EPsrOYxqeJ23rP7Pbk5Dx8s+fh1dotX9EF+jNeQkM1F9hK94UuflYZtF+84b9ZKsArZIw9ISJgemYp7tog/pWnjf8nmTdg6R+lVsQV1HULZhaAx/1CtRIMQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773649483; c=relaxed/simple;
	bh=3miNijcwl8Jc3wYIr0XHhXDKC8OavmVDnnPlzDD8k7o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=loSX+yDF4+jvYUHQQYnrrFmm8DNlzScrPhdtaf4LjzakZVnsKUd62DGH4pt9iA7M1d2o5/6eEiq6JmlP2WykE9WDwDad23cFv51zYOkvRmk7gix0Fonw6HhRwGSbxoKxVg+/346jqaViWQK/VCimrPK27ai3SnqsUFyvSvVGIpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zdAA2bTx; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-482f454be5bso49332205e9.0
        for <linux-media@vger.kernel.org>; Mon, 16 Mar 2026 01:24:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773649476; x=1774254276; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=a3irUY7KhJqlEd3mK9i9xdShte5YmZbK2Krg9U/BlPg=;
        b=zdAA2bTxQPSy6atWNc1ac8c8UyfPM5/JEdw4Bl+TzBc3krGg7l5TWymSDclSrc6Lw9
         nApLA39Cf9vIC8SpnNfrZHP1QsmiHcFS7f3Ld3H2wFRn+jCmdnFLxJ0IcQlsVbL4mp5/
         w4YJXLPExw3HHs3hrCQKKIYT6L5u88SGRhVZ5rwlYVV1A0MIrH+vtv3KbtCDE7gKO86q
         wQXBZRpPkdINF1fgGmUOVn7mUvMG31qpYm2rfdG0s5FysxRayTrfUg51fG2ukjNgtNSJ
         edte7bnWm+SIr9mZehj3H0+2YLBJTgRPIWem2p/Yowj1aoqPDCKQBZdBg82J3Vjl6L9q
         TJBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773649476; x=1774254276;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a3irUY7KhJqlEd3mK9i9xdShte5YmZbK2Krg9U/BlPg=;
        b=tNbZ8rjQzExupwXzqY3fcv2suyxelCx2dXgbkYgjfaairmv1KdNclgctmozob3kO3m
         Y/xSA7ysiWoDsZicfqDRjFOsrCtz8Qkx0+/TGMGN4IqlHLAf652qYBFjKZySEivgoOac
         ZRkCmL7cdMGieNlCh611+U9rapJw8otOksLF6fypgoGMoP+aLJuzmgcKUYdPQ1oPHher
         0dvR4roZ9H4XdDtdIXv+FupEVkOTr23jdmwNEBGrjOA2eDThdNMNd3wa2Ft7YPZ272c7
         XhNq5mRZxr7RuMUNPdBBuu7WA4WuXlO9zqgIqkhuGcDQkOC3+HAo0D0IDtvlbjW0OlUG
         p8tQ==
X-Forwarded-Encrypted: i=1; AJvYcCVRpXF4lIph9dql4G1pF5WOFbPeIH/Ju4+tXrK3UaByOGemY77Aj3CgltcgZIZcHXk5P4Ez1R/Luxo7nw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyVX9W7JbY78Dol0LTHp0YHDErx/mOlyFvY/vom/LoEO09nf9i9
	iHFL7iP6tEUDPep29J8oMc7E5z4my62TbWaSazl4bOal8bmf36+TKJyLxuUPyG0TFH8=
X-Gm-Gg: ATEYQzxIqQj/8pMHQ2K1AlQ8mmZB634bVmTDFsOrnpRrI+Ld0jRkVbb7GEodOBzH3AV
	X6M5p61H/dJAvo4hr9jQTEOJ6HbG4YxeTGbBBwuLUSMTS/o8nJfVgbKXp2wsDqn0S35XHttHEFz
	xdyeLsYg3/qhaxGp8+I1mvywneluAImNHn1QO4luq+eO00fjKA4gPsn1nwPycxXHJVAjgvb2nEC
	0qx+ollFhsMCeS3SsKYo4qhubWtzNH4Yu81Qn9NndI2bvjmKrmKW5lUxlKm/QQfu5bB0qo4unPI
	gBch/PoWQSjTvlR+K66Vf3bR3nK8xFqNbQb8LW7mo5qLjnzeUo0lhUC6q/WCIiAxxe8pqTmATas
	GLKIeZfzgGg+Mp7ivO6poVh0iZtZgwjlL3D3S5YJvBhxU2Gpn7GRQ4g8beU2NC7Jqo6jcdIUULr
	s+7fza1gc6EYwymdCsoMrrujIYvxEj
X-Received: by 2002:a05:600c:1907:b0:485:50ac:b8cf with SMTP id 5b1f17b1804b1-48555a5689amr196690125e9.0.1773649476013;
        Mon, 16 Mar 2026 01:24:36 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4854b5e92d5sm402893815e9.1.2026.03.16.01.24.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 01:24:35 -0700 (PDT)
Date: Mon, 16 Mar 2026 11:24:32 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Tomasz Unger <tomasz.unger@yahoo.pl>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: media: av7110: replace C++ comments with C
 style comments in sp8870.c
Message-ID: <abe-QCG4xF1L538e@stanley.mountain>
References: <20260313-sp8870-cleanup-v2-1-ca679e62f9b7.ref@yahoo.pl>
 <20260313-sp8870-cleanup-v2-1-ca679e62f9b7@yahoo.pl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260313-sp8870-cleanup-v2-1-ca679e62f9b7@yahoo.pl>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-55860-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[yahoo.pl];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linaro.org:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dan.carpenter@linaro.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,linaro.org:dkim,stanley.mountain:mid]
X-Rspamd-Queue-Id: C983F2961D5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Mar 13, 2026 at 05:32:18PM +0100, Tomasz Unger wrote:
> @@ -490,7 +490,7 @@ static int sp8870_set_frontend(struct dvb_frontend *fe)
>  			return err;
>  
>  		for (check_count = 0; check_count < MAXCHECKS; check_count++) {
> -//			valid = ((sp8870_readreg(i2c, 0x0200) & 4) == 0);
> +			/* valid = ((sp8870_readreg(i2c, 0x0200) & 4) == 0); */

Delete dead code.

>  			valid = sp8870_read_data_valid_signal(state);
>  			if (valid) {
>  				dprintk("delay = %i usec\n", check_count * 10);


