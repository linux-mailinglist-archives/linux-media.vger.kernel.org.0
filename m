Return-Path: <linux-media+bounces-59357-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id APOuOt/H6WnAkAIAu9opvQ
	(envelope-from <linux-media+bounces-59357-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 23 Apr 2026 09:18:55 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 534AC44DE26
	for <lists+linux-media@lfdr.de>; Thu, 23 Apr 2026 09:18:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EC9483059E18
	for <lists+linux-media@lfdr.de>; Thu, 23 Apr 2026 07:17:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB3F31F5821;
	Thu, 23 Apr 2026 07:17:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O7QEb3Dw"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E471B8BE9
	for <linux-media@vger.kernel.org>; Thu, 23 Apr 2026 07:17:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776928643; cv=none; b=Mv4RvGPM46/hxP5c9a56oyEwFgX7GGTAycfGO0bjj1nh4mDfEgWdFhiUkeb+sh6I1vbr4YiU58jDBu4LzYvrd+7V46M7BEk354tgp7MGVfTpJh5yt0ithd+UqfLwpkofkdwiw4HS9J4/0PxSvftyJFN9zmNdElp2OII/IJCHaHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776928643; c=relaxed/simple;
	bh=zqTtblBgVBvR4PqgE3QaoFiL53X3HfCSi/tlFkgspTY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y6wmbjZAYok7QNUHI1LotbT2xogr74aVnPprGgQ47xA3TE/Br7PX75ZNp4hMJpEm5+Uquao+6bvnBJ5aIRcUA5JRmXvtoBkqiJoHdllRiO7Q/umnom+GEmam/DFbVTtkK6zMn8n76yl8yKcAxUKQ4BWTxsTPRTjFsuMfLym9GdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O7QEb3Dw; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-79a60975dc5so69095527b3.0
        for <linux-media@vger.kernel.org>; Thu, 23 Apr 2026 00:17:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776928641; x=1777533441; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=naCAeEutfEuGQvFW2rc7B0bW9t3/crv6VVbt4Hmx2q8=;
        b=O7QEb3DwJIc76GN3HHUq6vqYxlthAXTNjZ9yrWyAe5kko7k2YrfUxQMI7HiTm8xBo8
         SMm675hy16WqJnozMdAbOD58zaf9SJz/GKTUg8N17SPOOTx10K7BEXx4CUkI6fsZVU05
         yieMBrpR+qIEaxo+BWdfqTywwiRaR6xSERQSJIB06lsj2OYtAkVdhI+W0FeXH/y9/hMT
         7XD6j7i3QmN7G/QmOGmUHq8sozNAafo9rYONMSH/FgvLre0aIznWgNGecRCUeAgI8lIy
         9gREA3E9rX8fweFbOQjGFp4rjrSVdC8cX4CKFG1Sbf1YGfsnA3I3V92upl1e6zI/I4kd
         OvsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776928641; x=1777533441;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=naCAeEutfEuGQvFW2rc7B0bW9t3/crv6VVbt4Hmx2q8=;
        b=VHFQr8U3dwiTjNxZUp4kALG6rLVYcUevEKbzScahhNNN/9hbhJ7PMccL54qgbZYqEg
         PgLHHyGvPYCHpB5h6OXiZ1z4ncipXxAhSz6vycpAdkue9pZuxk9wnXgK8vbAc7ldy9co
         2nybSt9H9uRD/Lyrqt2LV+df4kuWGzZlHo+UDNGQ0pwKgI1omu26MLVsa1utGDEP42Oo
         xQGNNyzxMb5wa4Aa060F7lKfFnqBMt3iyGTADgkFo213ZdbHilirgnV4yp2tO4L5xNCV
         /cwBiTyCX3OGriXnECqadK1slJEM5jSspP6BAd//fHO08xcVpz4CrS32kboZAd9NO6bJ
         pisQ==
X-Forwarded-Encrypted: i=1; AFNElJ/OnBYfbNh854atc6K12M68NEX4jKf1f9xyTbZgF/bj7X86yDaacPeUDa98hwVcy3oUQNx2Ef2QKqNXZQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzjHK/Xff4HcjXW1ERgrK8UgvrIvxIWUMybfTnjY8W/7XxDkn5C
	VUFi3eR7SibthqDC/1DiBCNH9LgKRLYilbWDoYv0O7EI3j0nwltEslgh
X-Gm-Gg: AeBDiesfO0v1RZFlS9qD2EjXMKCkP8V50r50sNikZ5fz0OZMHPft6VxPq1OnUnUs2Al
	Pfx3R4veRdUP3Wm7EqUFEhAoPDbwrjUWEY5jmaEKhJceQFTJSSB8ACqhRNhVkn9rJnhaDZrq0gV
	HcugKqaGsFOpYCvKLE/Crq2oDOPw4Bdy6aovkHESrjpUd747cMGl8Ox1ymmirWMacCOGGe0+p27
	YYdfzdgL0UkCX3Sx8rH5VGfaF7E+fxO1ofnDDbmn+J9T0VXqL3cZQyle6pzOXdH5EvcaHvDL50d
	GyhboHljzoo/2oefAzWXkLVT5DmQ8bpzdwadeFsLgD3G4hEl+1Km11V8X/d+lNtSIbpPFsSWI/L
	tBEva2GL0ieYvDQkKoSmAKAhEE93VRAceaXa32O+eBeLg3WETbRdMV5QKV2oKFHvLMde8ZUkTcO
	IXKaAxXibvKBzPTNlw3CTKJ3cpevwa
X-Received: by 2002:a05:690c:698a:b0:7b7:fb9f:e9a1 with SMTP id 00721157ae682-7b9ed0279c4mr260079227b3.47.1776928641023;
        Thu, 23 Apr 2026 00:17:21 -0700 (PDT)
Received: from localhost ([172.216.252.33])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7b9ee8e2bb7sm77076787b3.22.2026.04.23.00.17.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 00:17:19 -0700 (PDT)
Date: Thu, 23 Apr 2026 10:17:13 +0300
From: Dan Carpenter <error27@gmail.com>
To: Robertus Diawan Chris <robertusdchris@gmail.com>
Cc: andy@kernel.org, hansg@kernel.org, mchehab@kernel.org,
	sakari.ailus@linux.intel.com, gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel-mentees@lists.linuxfoundation.org,
	skhan@linuxfoundation.org, me@brighamcampbell.com
Subject: Re: [PATCH RFT] media: atomisp: Add error check in
 create_host_regular_capture_pipeline()
Message-ID: <aenHeWS4y8iLkMAn@stanley.mountain>
References: <20260423060246.296986-1-robertusdchris@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260423060246.296986-1-robertusdchris@gmail.com>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-59357-lists,linux-media=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_TO(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[error27@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,stanley.mountain:mid]
X-Rspamd-Queue-Id: 534AC44DE26
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Apr 23, 2026 at 01:02:46PM +0700, Robertus Diawan Chris wrote:
> When calling ia_css_pipeline_create_and_add_stage() function, there's no
> condition to check whether ia_css_pipeline_create_and_add_stage() throw
> an error or not. So add conditional check for the return value of
> ia_css_pipeline_create_and_add_stage() function.
> 
> This is reported by Coverity Scan with CID 1408952 as UNUSED_VALUE.
> 
> Signed-off-by: Robertus Diawan Chris <robertusdchris@gmail.com>
> ---

You need a Fixes tag.

regards,
dan carpenter


