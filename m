Return-Path: <linux-media+bounces-58562-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4GyDIOwi2WlrmggAu9opvQ
	(envelope-from <linux-media+bounces-58562-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 10 Apr 2026 18:18:52 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id F1AE73DA470
	for <lists+linux-media@lfdr.de>; Fri, 10 Apr 2026 18:18:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3EFF7301D301
	for <lists+linux-media@lfdr.de>; Fri, 10 Apr 2026 16:14:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F8513D3490;
	Fri, 10 Apr 2026 16:14:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oyLqtGux"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A0963D9DCD
	for <linux-media@vger.kernel.org>; Fri, 10 Apr 2026 16:14:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775837674; cv=none; b=k9E5sjuY0X5TY0GZDs+T1Y0kWY7obJe9Mz0KDwdnHTtXiRbygkK3rjC8bfLi0syt+NlQM4zbkT8GEYN94Z91j68MoUYoJD+brSN1VIHIFZ1tG4MDzIiMU6lD3xS94e2DaAXAc19CJ6wGHziDMman+xQRpXU2RSSCNlCDEZk86yw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775837674; c=relaxed/simple;
	bh=1AzS82S56n+QGXJOncdKL9W5z7WDXflEXP+d4nQ61gk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rMhUnpJQO9/O5LSy4UNTWYSdRnbIZei+j8OP/4qCyF+ON+wgWxHQ61msd4EOEZ911okNtVFwR/qJLqBtAVOAwDmh72xgHrAPzu5laMnVCu0wp2WWgYbcg8lHI3aFSSGZqy01AmXfO043KAAoYSnelywMHSI85igHuaTUCUyuDT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oyLqtGux; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-43b95e5b3afso1446085f8f.3
        for <linux-media@vger.kernel.org>; Fri, 10 Apr 2026 09:14:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775837672; x=1776442472; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1AzS82S56n+QGXJOncdKL9W5z7WDXflEXP+d4nQ61gk=;
        b=oyLqtGuxU/Y522o/VZlLtNj0H+j1Y99Gj/uEAMxHO4uNHrPfEvzPr4f6s//skeJ5D9
         A/SbWRBECL3709La2pskoH1t/PktZngUqfbNdPxp7XWmibZNp2ELuDGpKmFriMu+aL/A
         sVQh2k3x4WBNA0zDyOj0CjkQznfAxEDwuuEj9v/EeAqa7vgFE/3SyIEyLGxDfnKKR3qu
         Av76flK03DYgsC2a8niVxmh2nfErVivHPc1l211noIn/7SH5v83341eGykZYiMvLLJrk
         cS0L6iB23HZWkvOf4Ie18cX85w1SbO2KprQlYye0jsPnOQbpqA65ERU2B4poPZZ1CwCz
         NBUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775837672; x=1776442472;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1AzS82S56n+QGXJOncdKL9W5z7WDXflEXP+d4nQ61gk=;
        b=k9IbOKaVz8RK073t5OwCRIMpFWPREPHaxW0RRBgqHoZIB7z2KYNW1aVWSk3DsrfPug
         xUxtGT9cIUQvM2UJPorKJ9sfBuGjscRt8QIOkIy25/Ryq1NBXJjQb8gamRJmofzVHtWK
         HfOKeo9AsbaFF/zElXe/E6JqjEp1Ki0zbgaVjMEgnYRGyh2/ux2VhRz6zHvajNzTv5ES
         2/yMEroZrqvUj3fiRILUwj8ObawCqsVuFfLDIMDb0TJ/Oe4UvA6f0PS+kYT9gezkLGc7
         eLvD0H0kHxJWG0WC2hWrFY21jP2ZQZOftvd+A5pDd14he4gpdFVww16kfMQ5vNvpkGkE
         oTXw==
X-Forwarded-Encrypted: i=1; AJvYcCWtNP0w+EMIqVTfBllRkAtkO8+TCbU42QB+oD0d3RJVGHp1MkoZAyLQOyxANmlh2BM2X07WdPGFlZ6lgQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6yAFdq5GPdCoPZ6D9i2CWyI+YLkCXzje2hrDczG7bQYGzY56h
	aHBt7iDujKhZWRPHosiFmwKspEKq0wGU8eP03JrJZH2QCv8zgDAv3v3h
X-Gm-Gg: AeBDievhcUaPjzO/Pwhng/wBq1TjLDvLwy3mS92jd9uxp0MbGVv7nSp5EuaPbZBl/wU
	aRGMR4+h/wWCn9j2n8qo4WemdVjeli5R1IingPjjDlBWVyUiQvfQAONEu0s4haAcEevwEXtGyVY
	Sed3NChTXgoN9l6gKjciOjiWQ2PCd9kr/2AREClkl1aVgKuyvNO/8EpD8Gk3y+HRO+RotkTwaj3
	KzEvBZH/hdCpwjgx7i8tzSWL6BqtnV9RDYy1p6IvRDuicYuisFSErpDFd8sWAHcFjSmXVm97i4J
	bdqs5Jzn/KFjCwBf9L46h72SG1vqqhffZSNzfnWjOejTcMms/530uK9hwRyNKYBAuaGqDAw94KU
	WW8lAHm24iZhh4ZEWaEYpqF02U1bfq8u4pmLfIuVcZCMMrodseL6ioTEK8YtX7NMNUbPa91Y2+4
	uDFBeLEx0mcZ+YIvOV3PATXAl/G++btA==
X-Received: by 2002:a5d:5846:0:b0:43b:3d4f:e18d with SMTP id ffacd0b85a97d-43d642c3db2mr5952453f8f.39.1775837671379;
        Fri, 10 Apr 2026 09:14:31 -0700 (PDT)
Received: from gmail.com ([2a00:f41:1c39:1fd5:2a0c:50ff:fe2f:36f4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d63de2e4csm9029419f8f.2.2026.04.10.09.14.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 09:14:30 -0700 (PDT)
Date: Fri, 10 Apr 2026 18:14:27 +0200
From: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
To: Josh Hesketh <josh.hesketh@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-media@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: media: av7110: remove dead code from av7110_hw.c
Message-ID: <adke6OqyRZcurrkn@gmail.com>
References: <20260410152502.25310-1-josh.hesketh@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260410152502.25310-1-josh.hesketh@gmail.com>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-58562-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[azpijr@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: F1AE73DA470
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Apr 10, 2026 at 04:25:02PM +0100, Josh Hesketh wrote:
> Remove functions av7110_reset_arm() and av7110_send_ci_cmd()
> which have both been disabled behind #if 0 since the introduction
> to staging. Code can be recovered from git history.
>

cleanup patches for this driver won't be accepted anymore :(

--
regards,
jose a. p-a

