Return-Path: <linux-media+bounces-42160-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B610B51141
	for <lists+linux-media@lfdr.de>; Wed, 10 Sep 2025 10:31:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C7F881C22F56
	for <lists+linux-media@lfdr.de>; Wed, 10 Sep 2025 08:31:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B15C0301010;
	Wed, 10 Sep 2025 08:30:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EcGwd/RS"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17D0031D383
	for <linux-media@vger.kernel.org>; Wed, 10 Sep 2025 08:30:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757493055; cv=none; b=Nxx4M06ZrMP7mNMhrUPJyXWv1+ASPE4RitZkKesmBGFj2f3ujZCfL+xaye4270Mj0kmZ6AnPt2ZsH7Dc9FIuZfgPZVP2SOgmZzp62gy7H6zbRaOBML5B4tz8820y3Duf9F5pK3Claf47cOnKtulG7MpC53Th9qS3BVIwTTM9q8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757493055; c=relaxed/simple;
	bh=PwEywXh1Okz3a5eGHKmb1A6jlNMg3OtFxQcLP/b+RmA=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:References:Cc:
	 In-Reply-To:Content-Type; b=CrsV4p/BBrbz27TOPQ5JKtl90jjEA2yzesMXrZ5iW6Wlf/WeDXW5EU8FYKpQrTla7ceDqA6LAp3DJszL/2/YKtvzYrweJogtg0uci2EEusEYVAOeRwTB2L3h69bMCGLdB4zatZbiN2cD9k4/JzfQCTstY0B59cAeaRQlVZib5vI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EcGwd/RS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 403C4C4CEF0;
	Wed, 10 Sep 2025 08:30:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757493054;
	bh=PwEywXh1Okz3a5eGHKmb1A6jlNMg3OtFxQcLP/b+RmA=;
	h=Date:From:Subject:To:References:Cc:In-Reply-To:From;
	b=EcGwd/RSXv/z4audwAbVj0lYxW9UWhotrTLze46LhPRKnKTsy4aDvMNccLDffUaKA
	 KBotWCWWNL9cLUEcSBTBGI8AJfaFkaW4mHauK2K53xG27Sz4pBamf9ZHciCpRsbSRZ
	 wz6qi/ViNhPHgZFn8lE4O1lu2kuT5Vv0NSwA1fMuB3m7xooBBLrQjlfVe4YyLLn3YE
	 0c5Wm16vgSN5O2IiXyAt6pLM2lyBSbFAEn7jfzln3J+a6IqqTB54ELJ6XUokj/8H+N
	 tJH+e2gkPqbTLokIbmFCAhvvzwif5xXl/Dmp2Vpd/Og5hikVwU653JK89OZU0T2quf
	 Qhk4cNONKPgxQ==
Message-ID: <77a66be0-21b9-4308-8e2a-c5f3ed60cfa4@kernel.org>
Date: Wed, 10 Sep 2025 10:30:52 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: Re: [PATCH] v4l2-tracer: Allow building on systems using musl
To: =?UTF-8?Q?Zsolt_Vad=C3=A1sz?= <zsolt_vadasz@protonmail.com>
References: <4dgJekVdP7lLqOQ6JNW05sRHSkRmLLMMQnEn8NGUHPoHDn4SBkaGlHUW89vkJJu3IeFDAh3p6mlplTJJlWJx8V4rr62-hd83quCJ2sIuqoA=@protonmail.com>
Content-Language: en-US, nl
Cc: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
In-Reply-To: <4dgJekVdP7lLqOQ6JNW05sRHSkRmLLMMQnEn8NGUHPoHDn4SBkaGlHUW89vkJJu3IeFDAh3p6mlplTJJlWJx8V4rr62-hd83quCJ2sIuqoA=@protonmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Zsolt,

My apologies for the late review.

I need more details on this: how does musl differ from glibc? And is this the
right approach? It looks odd.

E.g. retrace_mmap/open are called twice, once with is_open64 is true, and once where
it is false. I would expect that this patch will change the callers (for example skip
the call with is_open64 == true). This patch will just have both call do the same
thing, which is weird.

Also, retrace_mmap/open are modified, but not trace_mmap/open, which I think does
something very similar.

Finally, the commit log is empty, but given the questions I had above it really needs
a proper log message explaining what is going on.

Regards,

	Hans

On 11/05/2025 14:34, Zsolt Vadász wrote:
> Signed-off-by: Zsolt Vadasz <zsolt_vadasz@protonmail.com>
> ---
>  utils/v4l2-tracer/retrace.cpp | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
> 
> diff --git a/utils/v4l2-tracer/retrace.cpp b/utils/v4l2-tracer/retrace.cpp
> index 010936c0..0acce10c 100644
> --- a/utils/v4l2-tracer/retrace.cpp
> +++ b/utils/v4l2-tracer/retrace.cpp
> @@ -10,10 +10,14 @@ extern struct retrace_context ctx_retrace;
>  void retrace_mmap(json_object *mmap_obj, bool is_mmap64)
>  {
>  	json_object *mmap_args_obj;
> +#if defined(linux) && defined(__GLIBC__)
>  	if (is_mmap64)
>  		json_object_object_get_ex(mmap_obj, "mmap64", &mmap_args_obj);
>  	else
>  		json_object_object_get_ex(mmap_obj, "mmap", &mmap_args_obj);
> +#else
> +	json_object_object_get_ex(mmap_obj, "mmap", &mmap_args_obj);
> +#endif
>  
>  	json_object *len_obj;
>  	json_object_object_get_ex(mmap_args_obj, "len", &len_obj);
> @@ -46,16 +50,24 @@ void retrace_mmap(json_object *mmap_obj, bool is_mmap64)
>  		return;
>  
>  	void *buf_address_retrace_pointer = nullptr;
> +#if defined(linux) && defined(__GLIBC__)
>  	if (is_mmap64)
>  		buf_address_retrace_pointer = mmap64(0, len, prot, flags, fd_retrace, off);
>  	else
>  		buf_address_retrace_pointer = mmap(0, len, prot, flags, fd_retrace, off);
> +#else
> +	buf_address_retrace_pointer = mmap(0, len, prot, flags, fd_retrace, off);
> +#endif
>  
>  	if (buf_address_retrace_pointer == MAP_FAILED) {
> +#if defined(linux) && defined(__GLIBC__)
>  		if (is_mmap64)
>  			perror("mmap64");
>  		else
>  			perror("mmap");
> +#else
> +        perror("mmap");
> +#endif
>  		debug_line_info();
>  		print_context();
>  		exit(EXIT_FAILURE);
> @@ -116,10 +128,14 @@ void retrace_open(json_object *jobj, bool is_open64)
>  	int fd_trace = json_object_get_int(fd_trace_obj);
>  
>  	json_object *open_args_obj;
> +#if defined(linux) && defined(__GLIBC__)
>  	if (is_open64)
>  		json_object_object_get_ex(jobj, "open64", &open_args_obj);
>  	else
>  		json_object_object_get_ex(jobj, "open", &open_args_obj);
> +#else
> +	json_object_object_get_ex(jobj, "open", &open_args_obj);
> +#endif
>  
>  	json_object *path_obj;
>  	std::string path_trace;
> @@ -148,10 +164,14 @@ void retrace_open(json_object *jobj, bool is_open64)
>  		mode = s2number(json_object_get_string(mode_obj));
>  
>  	int fd_retrace = 0;
> +#if defined(linux) && defined(__GLIBC__)
>  	if (is_open64)
>  		fd_retrace = open64(path_retrace.c_str(), oflag, mode);
>  	else
>  		fd_retrace = open(path_retrace.c_str(), oflag, mode);
> +#else
> +	fd_retrace = open(path_retrace.c_str(), oflag, mode);
> +#endif
>  
>  	if (fd_retrace <= 0) {
>  		line_info("\n\tCan't open: %s", path_retrace.c_str());
> @@ -162,10 +182,14 @@ void retrace_open(json_object *jobj, bool is_open64)
>  
>  	if (is_verbose() || errno != 0) {
>  		fprintf(stderr, "path: %s ", path_retrace.c_str());
> +#if defined(linux) && defined(__GLIBC__)
>  		if (is_open64)
>  			perror("open64");
>  		else
>  			perror("open");
> +#else
> +		perror("open");
> +#endif
>  		debug_line_info();
>  		print_context();
>  	}


