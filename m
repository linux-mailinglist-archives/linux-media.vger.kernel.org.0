Return-Path: <linux-media+bounces-64008-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id veFoEGbwI2qB0QEAu9opvQ
	(envelope-from <linux-media+bounces-64008-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 06 Jun 2026 12:03:18 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 913EA64D0D1
	for <lists+linux-media@lfdr.de>; Sat, 06 Jun 2026 12:03:17 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=pq38BseH;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64008-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64008-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id ACBC3303281D
	for <lists+linux-media@lfdr.de>; Sat,  6 Jun 2026 10:01:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93A593793C3;
	Sat,  6 Jun 2026 10:01:34 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFCFD36164D
	for <linux-media@vger.kernel.org>; Sat,  6 Jun 2026 10:01:32 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780740094; cv=none; b=BFYBGgd6aXlm6xRIoWYCORPXbvVU5EQ+Ebo+BL4c+26d+EFbnqyokdOIo4oS02GYB9cZjxyFDV/K5zsG3XXYNZyt7ospdX0xjHGmAgwJxc/1B9ZdFrjEtDL/0tdNR0eqS/p21dH9NsLGSJnTfYnKCg9NwEqVazTdAsA43RkXCCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780740094; c=relaxed/simple;
	bh=guHEDFa2rsm6aDL298zfk3vUhvYea+kgX4Mbo76bW0o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LnWEHOG11Hvw9K/oQfmbZC0n5uBg20nf8SVeHFv/JW6BfYnoW6OyCaImkptke7AT1dBUOQ1glOpkzyXNeHuoN73xuFlJ1tpyaJWN2NQ1Xbx0cDf034SgUCdpuQphRb/fzbgjP5rCrCp5L/1TOMaiBeLTlvSu/b34gh/9QFnmVSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pq38BseH; arc=none smtp.client-ip=209.85.128.51
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-490be29c1c5so33381965e9.2
        for <linux-media@vger.kernel.org>; Sat, 06 Jun 2026 03:01:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780740091; x=1781344891; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=W1uZ2JiW4gZ0Z6L+R/fOYTQ/AJABctRJmpqhLtiuumQ=;
        b=pq38BseHb+mixihUao4OKDLr3aFYgizUDpXZp9MItjsOzCA645W13RFwUFwPhMy9e/
         mmYdU1rAzpPsSHzV83qHT786yrCXbbZuIb7yB0YmiP7fFOQlqCEyd4AKBQcxqD7+OFh9
         9ZFvIAnktK+lCBq48YJTGQzlHO4Vl9J61A9t+CoAmHdvHT1P63eGJxF1Hej8KUz189g+
         EyIFMORGUcmhSV7tAe1GQM4DfybR7RiN1FBmHa6loN7LAqvvSWTJbT9ghtCXJfCtfrzv
         6edBPgMkLgmrx2wuPVP0KG1GAbVXUuKyFUB18UMylU3U4i5lbIRHtB4VsyVl4pir3+1Q
         knFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780740091; x=1781344891;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W1uZ2JiW4gZ0Z6L+R/fOYTQ/AJABctRJmpqhLtiuumQ=;
        b=gXRlkib/Criok4AzmzuMh0Sdbs5g+oaVZFpspYs/0VQzPOrYlA6X/Z+Tl+j9JFErN6
         1gpCbCxGpg/97AwecKhTSo5LD+W80+XyP8DDt4twWLGuIWRikHGzhrbetUIW4HxIUCRr
         j+HoTtJr/+A5oh/hIA2OivGikYmt2+JNyk8YFsbjoOP2gQGoH5gqd3yg25aDSc+yFV3h
         izmA1MJ903NRGDx9D2JY3Im4pBKEhHryjcGCe/BAxLJl9XvWWwYKE3qIirm87Y6i0GHV
         YonzdQog9clRQRMWaT+smL8/z4dAg53amk8QbfG5oGLs5r06sV3VELkxLHAOVn7EkNIJ
         PVXw==
X-Forwarded-Encrypted: i=1; AFNElJ87oSn29bpZtkuAAolaDJ+y5G11a6pHXzZiW+dOlT9z/CP4y/R/3Ycry+UtMKaNMoBClSGkm4G16E6TYQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6B6if7fRitICxuOzFnBVn1dYaaeVCszmrxkzAlONVdJ+2N3s7
	LNnwjFv4sLXgF6M0sKqRNmjfDFxg2g89jxI/Pb7enQ/ql+NvmuG5K8DK
X-Gm-Gg: Acq92OFncTZ4CqZNPOtGQtHZ8IazVK0XGBrYkIaV/I9OxJ2JPxku7qQusZlfRGw4sIn
	IQMSok/V3VUD45oAIgbk51gitjwkE5lR/XpayEvmGIr0YbU/3YweHv4am14735AmvJTJs+d4WfH
	Qh/9qSHxzfi3RcUnVngOgqXiIC1MsbP2kHTwDaZegvgH+eSZW7+GclbEMvXEUsiPqQKcS8BI0P1
	wF45He366HuFDDe7gxu7FY/6QOUPZJcvQECokk46MDVaFyS4TnSPkIy2srZGK1cAWLIFWTqgNm0
	obOLhKmaMthUt++Gyn7Uq0TZg7xEqwGkv1UfM8WYPhiljmFmipY/QdT16TzgZ0GoeAdX0vVeaZG
	Yd6GAl/JceCCHMenHf66dSzTklIoT6zW/6Mkt3LAv1WgpeLmab9k/d8U6pKEGK2b6Y5spPJvDXI
	jWXZkUfeqKbQmqV6FC9Iz4fBZEsd0HOg==
X-Received: by 2002:a05:600c:4e45:b0:490:c01a:5f10 with SMTP id 5b1f17b1804b1-490c257f8cdmr121984425e9.15.1780740089546;
        Sat, 06 Jun 2026 03:01:29 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f351d69sm57473786f8f.29.2026.06.06.03.01.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Jun 2026 03:01:28 -0700 (PDT)
Date: Sat, 6 Jun 2026 13:01:25 +0300
From: Dan Carpenter <error27@gmail.com>
To: Rhys Tumelty <rhys@tumelty.co.uk>
Cc: hansg@kernel.org, mchehab@kernel.org, gregkh@linuxfoundation.org,
	sakari.ailus@linux.intel.com, andy@kernel.org,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: media: atomisp: remove unused macros
Message-ID: <aiPv9TcyxoEFzcTx@stanley.mountain>
References: <20260606092842.179826-1-rhys@tumelty.co.uk>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260606092842.179826-1-rhys@tumelty.co.uk>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-64008-lists,linux-media=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[error27@gmail.com,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:rhys@tumelty.co.uk,m:hansg@kernel.org,m:mchehab@kernel.org,m:gregkh@linuxfoundation.org,m:sakari.ailus@linux.intel.com,m:andy@kernel.org,m:linux-media@vger.kernel.org,m:linux-staging@lists.linux.dev,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[error27@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,tumelty.co.uk:email,vger.kernel.org:from_smtp,stanley.mountain:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 913EA64D0D1

On Sat, Jun 06, 2026 at 10:28:42AM +0100, Rhys Tumelty wrote:
> removed unused macros across the atomisp driver that are defined
> in .c files, but never used, which was flagged as errors in a
> W=2 build, due to -Werror=unused-macros.
> 
> Signed-off-by: Rhys Tumelty <rhys@tumelty.co.uk>
> ---

Please slow down.  Don't resend a patch twice in the same day.
Follow all the v2 rules etc.  I will review this patch when you
resend it (not today hopefully).

https://staticthinking.wordpress.com/2022/07/27/how-to-send-a-v2-patch/

regards,
dan carpenter


