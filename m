Return-Path: <linux-media+bounces-55374-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UB7RAThDsWlCtAIAu9opvQ
	(envelope-from <linux-media+bounces-55374-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 11 Mar 2026 11:26:00 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 099E3262174
	for <lists+linux-media@lfdr.de>; Wed, 11 Mar 2026 11:25:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 797C23068270
	for <lists+linux-media@lfdr.de>; Wed, 11 Mar 2026 10:12:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 643483C6A43;
	Wed, 11 Mar 2026 10:12:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YkXBu9KS"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85C533C5DD9
	for <linux-media@vger.kernel.org>; Wed, 11 Mar 2026 10:12:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773223932; cv=none; b=lce5CtArsPz/kGg1MzfwgnXmoHWnZ6rsTDUSp6rpqok33iajBDBp0D+X5llAUOE9XGhzb49aIui2QTITOAOZn1vjbQlj8bD274Xn+ShFAmRlxXX+UiXvKyRWkS2LVuVa/ovMLU1aHINlnS/f+njYzIs0AwOUQNDox5LtE4dCU2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773223932; c=relaxed/simple;
	bh=HHCHRMBlQWoG2h0erH2fneWs+r/ypJ7fbjpTRA584w0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uZRu8h8yUefI6VI+g5IdMHrwmzH6VdBjORjg0ybwhTj49wdYrayqVvg38oTtS71Ozf1bjuqVcVlbCcMp9k38xQrCZrIc2+PNJxtzZZ7rWwblthZS9FCItFBw/AwqP5sL2bU5A+W8eEbfxBdymNtxR917bVd2u2mFQW3lz920xlM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YkXBu9KS; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-439c6fc2910so5591772f8f.0
        for <linux-media@vger.kernel.org>; Wed, 11 Mar 2026 03:12:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773223930; x=1773828730; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yh7hOj6bN7zf2QqBV2lDsxvYwL2EPcm4zO7IO9jvMh0=;
        b=YkXBu9KSTo42ORojl2Bl3L7DtQHE8tnP5/KCiTUqOkEO+VM6Z21L2iN4/5F79HXR57
         ADrWnsOa/dtPJtsfTFj+DeURm6SeS5HVhxkFnktFUHP9DX0aKp5IZYL4RrPIH9zeL7px
         iQcBDuOI/GDXfP530tMEQoWZmXvA+f9ztCK2UAHwfBBqxrhqP+iv/wxRkYw6QGjeIchj
         wbeh4lwIzdf2HTFZSqT956Oq87qqslxmt1aKPYR9xc04qyy6DQo1bIX1CQkIybOHQX2x
         44dLznj0TN34o14tUXktFitVsPES3J1rwMQ69Cr2mknVfXkROvqfwSvWnMCl7PA9xSwF
         P9qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773223930; x=1773828730;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yh7hOj6bN7zf2QqBV2lDsxvYwL2EPcm4zO7IO9jvMh0=;
        b=jwcV5/IsvjbIql1TgAyCuX5hXhvwPotviU7n0GxecJ+wI6VlD9qOfPKoX++Z1oryer
         y98fFWXrKITHqycE/BirXCkwS/6y9L0YCWiybiobbdNDXf9dnUYLaom4etqJyxqflbMS
         oVTi9P/15IbujCG8nC4tK5t0/cmAIAIN6kACTT2oyca+22QFPsDgieUEoErQ38SJ2ZDC
         rmi963nkc2jAc46S1MgeiF4tCMO4r4ZzoLLF+8FjmMjVhpGBm5LftTc4nTBld+m0lQpN
         c9nIvl5/xJr+4/dg8+2iHPWRo/8N0J7AljektY1ah9M3E19jUHconZc2coZYqYv9JyAu
         pLmA==
X-Forwarded-Encrypted: i=1; AJvYcCU13IednxAtfbvkhvUSTSFh21HHd/Az4F00ivx+CgwE9Wgh6it8rHngITuiwWTzAus9tO3JX3UeM3+K9g==@vger.kernel.org
X-Gm-Message-State: AOJu0YzS/5vQ9g2PABdDvUN+pZb1bMTcUcdIrYJ1mtizf6Q8DwFmcPUd
	b04f2bZ6GBEVSfgPjHOlVjFY7Mt96/VHUGe6yKB3l67/0GP7Ho0kYCrG742fgB79U5E=
X-Gm-Gg: ATEYQzzsC1ECngZcLjFDo8SLEbMVGiCOmai9n2aLlrfgBpyMFo7osh3EsoDuQTko98c
	USJsxVP506UIu6vdTjaX92wm9C8+mBws2v/w3zjtvqIM9ZgEIY9YHnK8vXRiTtoPViXkBD1yFw4
	DrNecOgexHtJcAr5Jx1wVG3VYlAKqm2Wz4zfDPBppJ6mCkUx+MsgYMXeHDEQcoflh3BU5rhxQcB
	srrpeTQ+UMjRLTv7C7rVaTlDOwa+FPqccn47IqfYq+6qVQ1zGtZ6NT4MCDCdr77M0cAR9gkH9pp
	gEX3BvnCp6nxzPD7HCswF4+tPMsKus49aVKa379evYPyz+EzzN8RGfqBRnYJyNOr1gvy/IcYfuV
	6+dhtnkcNJ02iFnhgXI0DHcwfoRZ5Mj20b1uMhrrcp9f2Cf1PlQZyot0KIcTjwHEsMwsmOrcA1G
	jtsBGP0okbAv5oAonxRdJ6Ma+fd5aO
X-Received: by 2002:a05:6000:4011:b0:439:cbc2:63b with SMTP id ffacd0b85a97d-439f842c345mr3685482f8f.29.1773223929820;
        Wed, 11 Mar 2026 03:12:09 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439f818d209sm5231417f8f.5.2026.03.11.03.12.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 03:12:09 -0700 (PDT)
Date: Wed, 11 Mar 2026 13:12:06 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Tomasz Unger <tomasz.unger@yahoo.pl>
Cc: Andy Shevchenko <andy@kernel.org>, Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH v4] media: staging: atomisp: Remove unnecessary return
 statements from void functions
Message-ID: <abE_9phG4OhjBLKS@stanley.mountain>
References: <20260311-atomisp-remove-void-return-v2b-v4-1-62275c55e353.ref@yahoo.pl>
 <20260311-atomisp-remove-void-return-v2b-v4-1-62275c55e353@yahoo.pl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260311-atomisp-remove-void-return-v2b-v4-1-62275c55e353@yahoo.pl>
X-Rspamd-Queue-Id: 099E3262174
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-55374-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[yahoo.pl];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dan.carpenter@linaro.org,linux-media@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:dkim,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Action: no action

On Wed, Mar 11, 2026 at 10:48:07AM +0100, Tomasz Unger wrote:
> diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_formatter.c b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_formatter.c
> index 40b3f1e48c56..db4052ab3665 100644
> --- a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_formatter.c
> +++ b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_formatter.c
> @@ -6,7 +6,6 @@
>  
>  #include "system_global.h"
>  
> -

I was debating whether I should ignore this...  When you delete a return
and a blank line those have to be done as one step otherwise you're
introducing new checkpatch warnings.  But this blank line is an
unrelated change.  The patch does it a couple other places as well.

>  #include "input_formatter.h"
>  #include <type_support.h>
>  #include "gp_device.h"
> @@ -65,8 +64,6 @@ void input_formatter_rst(
>  	if (!HIVE_IF_BIN_COPY[ID]) {
>  		input_formatter_reg_store(ID, addr, rst);
>  	}
> -
> -	return;
>  }
>  

[ snip ]

> @@ -483,7 +482,6 @@ void hmm_bo_release(struct hmm_buffer_object *bo)
>  	__bo_insert_to_free_rbtree(&bdev->free_rbtree, bo);
>  
>  	mutex_unlock(&bdev->rbtree_mutex);
> -	return;
>  }
>  
>  void hmm_bo_device_exit(struct hmm_bo_device *bdev)
> @@ -737,8 +735,6 @@ void hmm_bo_free_pages(struct hmm_buffer_object *bo)
>  	kfree(bo->pages);
>  	mutex_unlock(&bo->mutex);
>  
> -	return;
> -

Deleting this return introduces a bug.

>  status_err2:
>  	mutex_unlock(&bo->mutex);
>  	dev_err(atomisp_dev,
> @@ -868,8 +864,6 @@ void hmm_bo_unbind(struct hmm_buffer_object *bo)
>  
>  	mutex_unlock(&bo->mutex);
>  
> -	return;
> -

Bug.

>  status_err:
>  	mutex_unlock(&bo->mutex);
>  	dev_err(atomisp_dev,

regards,
dan carpenter


