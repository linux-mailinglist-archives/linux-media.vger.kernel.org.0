Return-Path: <linux-media+bounces-64161-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id rzFWG62DJmptXwIAu9opvQ
	(envelope-from <linux-media+bounces-64161-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 08 Jun 2026 10:56:13 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id BA887654445
	for <lists+linux-media@lfdr.de>; Mon, 08 Jun 2026 10:56:12 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=siXA3k1X;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64161-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-media+bounces-64161-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3628E300B5BC
	for <lists+linux-media@lfdr.de>; Mon,  8 Jun 2026 08:52:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71D033B14AC;
	Mon,  8 Jun 2026 08:51:55 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC8D13AFD00
	for <linux-media@vger.kernel.org>; Mon,  8 Jun 2026 08:51:53 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780908714; cv=none; b=B+5Sri7RCApT+N6qUOvZOi/7tovmy2ySyO4c0fnNYGZAiAdFc2iaiI1/4yPjjBgBlYNAJvkQWq4oxwKb4bJWlqNJm5U0lq7yshBcXjNeCm2F5gMWF5FgSCplqLWYeoFRhr/JCwNBCG9bkCGNMNxn0uG5kw9S5pb0PKZZLwimBZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780908714; c=relaxed/simple;
	bh=KxzcZczBnWtnF71WrvbJ931DN27De2S8SoNvlQedRC8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SyvPWbyM1tPpuO7MKRSjbfkPg6vWUqtXiSFRqPF1iN52/ONgqykKbDtAtmH8WtMmuzYP9BIG2W1iM6KJYwi1r+u9n4OgBLx01TKhfaZDpM64ELSzsyykgqZ9irv5jE4vAkhhyhF8jWzlUYl3ioe8pkDzXhjLF4BXUhx/F9WgEbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=siXA3k1X; arc=none smtp.client-ip=209.85.219.42
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-8ccd1f57b32so41755406d6.2
        for <linux-media@vger.kernel.org>; Mon, 08 Jun 2026 01:51:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780908712; x=1781513512; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=O248v2PloCfOKOL55ryzQvPbQCl4x0VQe69JsI4A4+Y=;
        b=siXA3k1XawNuW6BznvuxXB+AHCIDx5YfIDJQOxl9N9opCtsynMtj7R5RLEZmbZ7LM/
         4Y/GRqImJ4b6daEGGsyO5lEefbua1McPm/XsgUB+4zVYMvH0RYusnk3SFohVcOwj+332
         LDhix7taLyG4MUMU7uY4VvsEwp/JP1Snibp8klCYgK0d7KcJWQJGT1ccITrgaI8VZmQw
         07Vp+eKnHKIHQhzhsrJyAfBHViAQ72Q6Key5eg9hFFBnMdsbO5RhBf/jlhr0W0PM1cVt
         vjFDFbZ2v9VyF5/iB7Bjn3NJgUgYoIZmYMaS1KHIiE/3Ku6AAOCYc6VfJNF4+pmmS2aj
         7/Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780908712; x=1781513512;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O248v2PloCfOKOL55ryzQvPbQCl4x0VQe69JsI4A4+Y=;
        b=hxjqZHcRwPaeVIdpIY7/v18deC31uY5NmkjWgsUE+zcPDPW1jWd07BXpYNwVaCUXVl
         hvmhaE+TTU7EmXdk3yn4KBvCxr/OVPMzPwd1iK6TcUZVvXlXCcdkbOkzKrWOe6pf0LBN
         GAHsmvapBm9/AkKWEp74/Oys4UidMfniQcixCxZ2MWxfs8oMMJWl6dN4TnUeiLiChZDA
         XICp60xwwyFPkWIYL4ES+MaVsbc/MgrHcHiJJ58u64kSWY0pIo0u3F/XK9Q3hZFZ4wiY
         QtRHNacZoA69o2Iue6j5XIMco0RTbDO7J7UqRyVc37cJbSTz6Ttu/rl5xGjxDKCglT/y
         W5gQ==
X-Forwarded-Encrypted: i=1; AFNElJ8vuQp0OOG36OOKwxflHIXpg7HdsBS1AVFTMk4kxBRdoxnzcWZYPGLWDyRnF16F7dVkZs2IHTEdxHz+fQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxCto5gZbHQgHUWtTY+Wx09wbuI6AlmHUX5xCJCtld1mWhYtU4a
	Wh2co4DOaIYbwFhHVvNFUbKALHAGEmdJMLKqqLTqCFU28URPjen8vGso
X-Gm-Gg: Acq92OGayx3u1mjYZF/fMC7vTkdwxwjuMMYdQadAD0s4z/3cLZWdk6xyis0ovNclje9
	FafNqE4uhI+ytYIajdAXHMST/S7Q7aVddB4ebDp24iVACnKvHwDWSwUoPRzrETFfttU0YfL0oxY
	Z7DVnMYg05AKOv5QmW2fXoMRrEqBLCmPIv8UQseG345wYnh9JHGC/hwJtWxirip7dPdb1jeY8+b
	w37MSYgrpE3VPNEY67uEYdbRYtSOhIRRlt5i/sMhn/n8SJj2ZkN8UwwgKSOMuUPXmwwRbcnpdLI
	wswJhTyVBjjcav3rVcBIG2fw8rddofn2ldQpXYaksYUepTBmpG3QK8/VD/GIWIEv3tSkI0ZJr7o
	+WcWQSR+Ecvro3lt+UYlKd+sfTRio1yMKT+h+4WsCxbxhMKrqJIxwar9+ZFoSkE7aMa3jg7t4PF
	zBG7qXmOcEYKOsh1Y9YY6HrFHbZUT+
X-Received: by 2002:a05:622a:6094:b0:516:ed02:c85d with SMTP id d75a77b69052e-51795b0e75fmr206862321cf.3.1780908712526;
        Mon, 08 Jun 2026 01:51:52 -0700 (PDT)
Received: from localhost ([43.225.189.113])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51775c08234sm149224681cf.6.2026.06.08.01.51.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 01:51:51 -0700 (PDT)
Date: Mon, 8 Jun 2026 11:51:45 +0300
From: Dan Carpenter <error27@gmail.com>
To: Dawei Feng <dawei.feng@seu.edu.cn>
Cc: andy@kernel.org, hansg@kernel.org, mchehab@kernel.org,
	sakari.ailus@linux.intel.com, gregkh@linuxfoundation.org,
	abdelrahmanfekry375@gmail.com, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	jianhao.xu@seu.edu.cn, Zilin Guan <zilin@seu.edu.cn>
Subject: Re: [PATCH] media: atomisp: Fix resource leak in atomisp_pci_probe()
Message-ID: <aiaCoV1DQKBx4ph6@stanley.mountain>
References: <20260608082706.3287831-1-dawei.feng@seu.edu.cn>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260608082706.3287831-1-dawei.feng@seu.edu.cn>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-64161-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:dawei.feng@seu.edu.cn,m:andy@kernel.org,m:hansg@kernel.org,m:mchehab@kernel.org,m:sakari.ailus@linux.intel.com,m:gregkh@linuxfoundation.org,m:abdelrahmanfekry375@gmail.com,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:linux-staging@lists.linux.dev,m:jianhao.xu@seu.edu.cn,m:zilin@seu.edu.cn,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[error27@gmail.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[kernel.org,linux.intel.com,linuxfoundation.org,gmail.com,vger.kernel.org,lists.linux.dev,seu.edu.cn];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[error27@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BA887654445

On Mon, Jun 08, 2026 at 04:27:06PM +0800, Dawei Feng wrote:
> During atomisp_pci_probe(), the ISP subdev is initialized via
> atomisp_initialize_modules() prior to entity registration. If
> atomisp_register_entities() fails, the current error path only
> uninitializes the CSI2 modules. This leaks the subdev entity and control
> handler that were previously set up by atomisp_subdev_init().
> 
> Fix this by calling atomisp_subdev_unregister_entities() to properly
> release the subdev state on this specific error path. Later error paths
> remain unchanged, as they correctly use atomisp_unregister_entities() to
> handle broader cleanup after successful registration.
> 
> The bug was first flagged by an experimental analysis tool we are
> developing for kernel memory-management bugs while analyzing v6.13-rc1.
> The tool is still under development and is not yet publicly available.
> Manual inspection confirms that the bug is still present in v7.1-rc5.
> 
> An x86_64 allyesconfig build showed no new warnings. As we do not have an
> Intel Atom ISP platform to test with, no runtime testing was able to be
> performed.
> 
> Fixes: 9d4fa1a16b28 ("media: atomisp: cleanup directory hierarchy")
> Signed-off-by: Zilin Guan <zilin@seu.edu.cn>
> Signed-off-by: Dawei Feng <dawei.feng@seu.edu.cn>
> ---

The code is buggy, but this isn't the right fix.

Here is generally the standard way to do error handling.
https://staticthinking.wordpress.com/2022/04/28/free-the-last-thing-style/

1. An allocation should clean up it's own partial allocations.  That
should not be handled in the caller.  2.  Every allocation function should
have a mirror cleanup function.

The atomisp_uninitialize_modules() function is just a dummy and was never
actually implemented.  The correct thing is to implement it.

regards,
dan carpenter


