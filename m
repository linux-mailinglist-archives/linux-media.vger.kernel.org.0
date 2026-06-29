Return-Path: <linux-media+bounces-65871-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id a6ZGIRouQmqH1QkAu9opvQ
	(envelope-from <linux-media+bounces-65871-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 10:34:34 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D5E826D7881
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 10:34:33 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=Us8L6piT;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65871-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-65871-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8280F30262C2
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 08:30:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF5B53F5BD3;
	Mon, 29 Jun 2026 08:30:48 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA5553F54BB
	for <linux-media@vger.kernel.org>; Mon, 29 Jun 2026 08:30:46 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782721848; cv=none; b=RufPmX32h0wZkf7M6/xVBm5YHPsl1XaNYRDmtoc0z48RblmD6diL3mSnOMF90fQg/8fcMez50EJAA0J/OGy8LPBm0LY24au8/AGznhNfvvsHpSouWMXQboViuREIj/iNceGrKO1Wx7RhCWEMDhJxTtTG/PcCQE6j5cWE5MOah70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782721848; c=relaxed/simple;
	bh=abts/1MRf4sGQNrs+Qra6uETICHxnjs03xjp5k5HK2Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q9WOLtdP/aq69YEZAadpE9rRr/skCrLc3VN9QEg05Gpvr2xzGViUPggX/yWy6bs/Zs+rU8nzfPvqF7L3+YaWcnEjFiq82PkcUyLWcz6Ho6W+hXbBYfB8sWdzRMDz+oLNPWKn8QK7ESAKBXCaTg4bG+6pseUwxu6sZzv3ui2zAxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Us8L6piT; arc=none smtp.client-ip=209.85.208.51
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-697bd41a4ecso3707908a12.2
        for <linux-media@vger.kernel.org>; Mon, 29 Jun 2026 01:30:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782721845; x=1783326645; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fq4MrGKf+YRbreREYMtKaIO+6uUYvLSEbh1uxDtYk3E=;
        b=Us8L6piTaw2CTj5R3lkxiqm27FcURXbi4dsVB3z1Re4Vk/TYMcuoCfHRadZ0noKd9K
         AV8lxqJFNfUrWAZcQmGKMQN5YCYCx9yEbVpTJfe5JWRH/uk+/elTXIj5asKcKBDrsqHq
         Uk7lT7RtPHeNSZNnze3Tg9h/QjkfVKDWYvTSbBiS/9AVJtOhPb93gObZl1z+t7Qj7kma
         pmB/0l9lMphn7DTApJgUajrpMiOD7Dg/e2Mhja43o1EQrFSPmFUzcNxNktj1OzddirxS
         73HHYfVS5ld19kxJzXdV2ELyG6iR6h7LmcVihtEX+tdOFl1wd4fqHupOcJOx1oM+YHjg
         v3Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782721845; x=1783326645;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fq4MrGKf+YRbreREYMtKaIO+6uUYvLSEbh1uxDtYk3E=;
        b=G4lMLK5nec4gQ49BRzKxcfNCqPsov+DfVNZ7ShqIzwPaMseH2xadWDFcL7E0R6TzGE
         AR6z5GsIUYhLqKD8FL/el/msbHUBwulOQCCp+8h3t0j41G7Z7atUG/hVi2Y0A0Fatbi+
         9gPVkLIngaB0Ce9qzP8MIA7WQhwZNRsyqEhVjAiMzYORPBMKnt5oljVBS55mSJfGRPeW
         WkzkyWgrK3mgBnnjNkCTUqfN5JgeoANMqH50f1A2z/s+SyYyRiASU6qbXVAODGtjjrJH
         0KESjcugY+DPfj1mrgu+VrvcZzJ5jYss6JdqaM56C/c2+vLXhOUGOePVXlnZAovZIOeK
         BqTg==
X-Forwarded-Encrypted: i=1; AHgh+RoUrqjtmz66clIoDQ/bB+xD+rEuleGqgwj3yWkeIowRx2DpWbzgfjElXZyQJOgcZZYBc1hBJxGP6OkYjw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxA7eVG66VpiPNzuU9KBg0WMhV4Ukqb3ZnG40G9Km+HxvmrZW9Y
	vqjsqaSlEZTUEJZalzqQlGqGHMVSerK6fIqXwgzWpruA2y/AHqvjZ1cJ
X-Gm-Gg: AfdE7clf+2WLjLeTaJfP4b+J1F1xhlaNbOrAHkEg9SszQj8w1wiIqJWa+RZx0KKe/aH
	cF6Gfac5nQ6wy2bNk6Vh5iAwwgHaPQBb9thFTYPNtJc0LGbS6LhXR3hImvtvQ4Ai/P/6NxJi92M
	06so+47NPOMTjzOqfWJaVV4A61z/hETVdGUQ0/7hfOEUNFy+KHg/GXDZBEygUgDXYnC7QCmzSV+
	AlpyXD4x9ms+6LPVqYAhoVsS4815cmJUL0xyN1+/xJsboYWP3N6P58Wy+//vTyO6PB0GEQJg+r6
	dOVDkrupiCfV2PKLpakc1/0ZoYJ6WJElvUr+UUE3GPzYIPl8VSHekScHtb7eX1cJ09c2m5ZI6JA
	2CAQpbgh9BqNFIlB/uwxXm0EzO2ex/vqCdXr4Zeho1Mi5Q3KyBJp7O/hhvfIJzSfT6qXZsQ+Hta
	txMyXOm3X0Jw==
X-Received: by 2002:a17:906:6206:b0:bed:87c:b24e with SMTP id a640c23a62f3a-c1205eef62emr702909766b.29.1782721845095;
        Mon, 29 Jun 2026 01:30:45 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:9cf4:43df:e612:817b])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1276ec6c96sm39712166b.43.2026.06.29.01.30.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 01:30:44 -0700 (PDT)
Date: Mon, 29 Jun 2026 11:30:40 +0300
From: Dan Carpenter <error27@gmail.com>
To: Dawei Feng <dawei.feng@seu.edu.cn>
Cc: hansg@kernel.org, mchehab@kernel.org, sakari.ailus@linux.intel.com,
	andy@kernel.org, gregkh@linuxfoundation.org, azpijr@gmail.com,
	kees@kernel.org, arnd@arndb.de, pontescpedro@gmail.com,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev, jianhao.xu@seu.edu.cn,
	zilin@seu.edu.cn
Subject: Re: [PATCH] media: atomisp: fix CAS scaler descriptor leaks
Message-ID: <akItMNqgKTDBCGV0@stanley.mountain>
References: <20260627060151.2543613-1-dawei.feng@seu.edu.cn>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260627060151.2543613-1-dawei.feng@seu.edu.cn>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-65871-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:dawei.feng@seu.edu.cn,m:hansg@kernel.org,m:mchehab@kernel.org,m:sakari.ailus@linux.intel.com,m:andy@kernel.org,m:gregkh@linuxfoundation.org,m:azpijr@gmail.com,m:kees@kernel.org,m:arnd@arndb.de,m:pontescpedro@gmail.com,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-staging@lists.linux.dev,m:jianhao.xu@seu.edu.cn,m:zilin@seu.edu.cn,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[error27@gmail.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[kernel.org,linux.intel.com,linuxfoundation.org,gmail.com,arndb.de,vger.kernel.org,lists.linux.dev,seu.edu.cn];
	RCPT_COUNT_TWELVE(0.00)[15];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[seu.edu.cn:email,vger.kernel.org:from_smtp,stanley.mountain:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D5E826D7881

On Sat, Jun 27, 2026 at 02:01:51PM +0800, Dawei Feng wrote:
> load_video_binaries() and load_primary_binaries() create a CAS scaler
> descriptor before allocating and looking up the YUV scaler binaries.
> Several failure paths after descriptor creation return without destroying
> the descriptor, leaking the frame-info arrays owned by it.
> 
> Route those exits through a descriptor cleanup label while keeping the
> existing pipe_settings ownership model. Also clear num_yuv_scaler when
> capture scaler binary allocation fails, so the existing failure unwind does
> not iterate a NULL scaler array.
> 
> The bug was first flagged by an experimental analysis tool we are
> developing for kernel memory-management bugs while analyzing
> v6.13-rc1. The tool is still under development and is not yet publicly
> available. Manual inspection confirms that the bug is still
> present in v7.1.1.
> 
> An x86_64 allyesconfig build showed no new warnings. As we do not have
> an Intel Atom ISP camera platform with matching sensor firmware and ACPI
> camera graph to test with, no runtime testing was able to be performed.
> 
> Fixes: ad85094b293e ("Revert "media: staging: atomisp: Remove driver"")
> Signed-off-by: Dawei Feng <dawei.feng@seu.edu.cn>
> ---
>  drivers/staging/media/atomisp/pci/sh_css.c | 35 ++++++++++++----------
>  1 file changed, 19 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/staging/media/atomisp/pci/sh_css.c b/drivers/staging/media/atomisp/pci/sh_css.c
> index 00082276f1db..d0ff16ba890f 100644
> --- a/drivers/staging/media/atomisp/pci/sh_css.c
> +++ b/drivers/staging/media/atomisp/pci/sh_css.c
> @@ -4528,20 +4528,20 @@ static int load_video_binaries(struct ia_css_pipe *pipe)
>  			  NULL,
>  			  &cas_scaler_descr);
>  		if (err)
> -			return err;
> +			goto destroy_cas_scaler_desc;
>  		mycs->num_yuv_scaler = cas_scaler_descr.num_stage;
>  		mycs->yuv_scaler_binary = kzalloc_objs(struct ia_css_binary,
>  						       cas_scaler_descr.num_stage);
>  		if (!mycs->yuv_scaler_binary) {
>  			mycs->num_yuv_scaler = 0;
>  			err = -ENOMEM;
> -			return err;
> +			goto destroy_cas_scaler_desc;
>  		}
>  		mycs->is_output_stage = kzalloc_objs(bool,
>  						     cas_scaler_descr.num_stage);
>  		if (!mycs->is_output_stage) {
>  			err = -ENOMEM;
> -			return err;
> +			goto destroy_cas_scaler_desc;
>  		}
>  		for (i = 0; i < cas_scaler_descr.num_stage; i++) {
>  			struct ia_css_binary_descr yuv_scaler_descr;
> @@ -4557,10 +4557,13 @@ static int load_video_binaries(struct ia_css_pipe *pipe)
>  			if (err) {
>  				kfree(mycs->is_output_stage);
>  				mycs->is_output_stage = NULL;
> -				return err;
> +				goto destroy_cas_scaler_desc;

What about freeing mycs->yuv_scaler_binary?  There are a bunch of
other leaks...  I would prefer a more complete fix.

https://staticthinking.wordpress.com/2022/04/28/free-the-last-thing-style/

I would probably just do the free before the goto since this is not
part of the cleanup function.

		if (err) {
			ia_css_pipe_destroy_cas_scaler_desc(&cas_scaler_descr);
			goto free_output_stage;
		}

...

	return 0;

free_output_stage:
	if (need_scalar) {
		kfree(mycs->is_output_stage);
		mycs->is_output_stage = NULL;
	}
free_scalar_binary:
	if (need_scalar) {
		kfree(mycs->yuv_scaler_binary);
		mycs->yuv_scaler_binary = NULL;
	}

etc.

regards,
dan carpenter


