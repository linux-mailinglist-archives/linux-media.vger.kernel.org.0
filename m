Return-Path: <linux-media+bounces-6422-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F1E0C871C7A
	for <lists+linux-media@lfdr.de>; Tue,  5 Mar 2024 11:59:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 213251C22FF1
	for <lists+linux-media@lfdr.de>; Tue,  5 Mar 2024 10:59:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D93CF5D74A;
	Tue,  5 Mar 2024 10:54:47 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83DE45D742
	for <linux-media@vger.kernel.org>; Tue,  5 Mar 2024 10:54:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709636087; cv=none; b=dThL20paK4acbc+lZoRysKjNx5UOJeOWuV+IPeGfmsBSLRSg42jCCAJdxs/vi31PLdkSA5TdPBRghlHbJXLFh6h7tWX8c7UcyjdOxlglYhSTTIzoIB4oR81RI4Bk1rP4lVR4yBGgsBL7nts2HcCRAz14CZxgsxNwac4ACUHTPA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709636087; c=relaxed/simple;
	bh=h9BtwNBOPHqbGJomOJTI14f9pa807GHfdxZg8/JBhpY=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=uoxX9pJRRimwxGieTBaK40f2s43A+Hhrc+z6E0DY7kgIK+hq85bmragx6fF0gG/VRHcZ7zMyM5pDZpKmiTkN5B1CZwdXiDOBuHgGGl6CH5kMKJwBBvAljizn6/nur6XaXtJke9K3aKubZo+pqIHmKB/ToOPFF1pscGDKOuXChxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CA2BC433F1;
	Tue,  5 Mar 2024 10:54:45 +0000 (UTC)
Message-ID: <f4ea22f5-5cfb-4245-ab37-b8fc637f7968@xs4all.nl>
Date: Tue, 5 Mar 2024 11:54:43 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH][edid-decode] build: add support for building with meson
Content-Language: en-US, nl
To: Sebastian Wick <sebastian.wick@redhat.com>, linux-media@vger.kernel.org
References: <20240215120637.1559408-2-sebastian.wick@redhat.com>
From: Hans Verkuil <hverkuil@xs4all.nl>
Autocrypt: addr=hverkuil@xs4all.nl; keydata=
 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
In-Reply-To: <20240215120637.1559408-2-sebastian.wick@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Sebastian,

On 15/02/2024 1:06 pm, Sebastian Wick wrote:
> The immediate reason for adding support for meson is that this allows us
> to include edid-decode as a subproject in libdisplay-info.

Thank you for your patch, and apologies for me taking so long to review it.

I think this patch needs a bit more work. Mainly since I want this to replace
the old Makefile since there is no point in maintaining two build systems.

That means that besides removing the Makefile you also need to update the
README. That should also explain how to build the emscripten part. To be
honest, I don't know what the magic meson incantation is for that, so
this documentation is really needed.

Also one minor nit: instead of writing '[edid-decode]' in the Subject line,
just write 'edid-decode:'.

Regards,

	Hans

> 
> Signed-off-by: Sebastian Wick <sebastian.wick@redhat.com>
> ---
>  emscripten/wasm-crossfile.txt | 14 ++++++++
>  meson.build                   | 61 +++++++++++++++++++++++++++++++++++
>  2 files changed, 75 insertions(+)
>  create mode 100644 emscripten/wasm-crossfile.txt
>  create mode 100644 meson.build
> 
> diff --git a/emscripten/wasm-crossfile.txt b/emscripten/wasm-crossfile.txt
> new file mode 100644
> index 0000000..a41f46c
> --- /dev/null
> +++ b/emscripten/wasm-crossfile.txt
> @@ -0,0 +1,14 @@
> +[binaries]
> +c = '/usr/lib/emscripten/emcc'
> +cpp = '/usr/lib/emscripten/em++'
> +ar = '/usr/lib/emscripten/emar'
> +strip = '/usr/lib/emscripten/emstrip'
> +
> +[built-in options]
> +default_library = 'static'
> +
> +[host_machine]
> +system = 'emscripten'
> +cpu_family = 'wasm32'
> +cpu = 'wasm32'
> +endian = 'little'
> \ No newline at end of file
> diff --git a/meson.build b/meson.build
> new file mode 100644
> index 0000000..cda12de
> --- /dev/null
> +++ b/meson.build
> @@ -0,0 +1,61 @@
> +project(
> +	'edid-decode',
> +	'cpp',
> +)
> +
> +edid_decode_args = [
> +	'-Wno-missing-field-initializers',
> +	'-Wno-unused-parameter',
> +	'-Wimplicit-fallthrough',
> +]
> +edid_decode_link_args = []
> +
> +git = find_program('git', native: true, required: false)
> +if git.found()
> +	git_commit = run_command(
> +		[git, 'rev-parse', '--short=12', 'HEAD'],
> +		check: false,
> +	)
> +	git_date = run_command(
> +		[git, 'show', '--quiet', '--date=format-local:%F %T', '--format=%cd'],
> +		env: {'TZ': 'UTC'},
> +		check: false,
> +	)
> +
> +	if git_commit.returncode() == 0
> +		edid_decode_args += ['-DSHA=' + git_commit.stdout().strip()]
> +	endif
> +	if git_date.returncode() == 0
> +		edid_decode_args += ['-DDATE=' + git_date.stdout().strip()]
> +	endif
> +endif
> +
> +if target_machine.system() == 'emscripten'
> +	edid_decode_link_args += [
> +		'-sEXPORTED_FUNCTIONS=_parse_edid',
> +		'-sEXPORTED_RUNTIME_METHODS=ccall,cwrap'
> +	]
> +
> +	fs = import('fs')
> +	foreach filename : ['edid-decode.html', 'edid-decode.ico']
> +		fs.copyfile('emscripten' / filename)
> +	endforeach
> +endif
> +
> +executable(
> +	'edid-decode',
> +	'calc-gtf-cvt.cpp',
> +	'calc-ovt.cpp',
> +	'edid-decode.cpp',
> +	'parse-base-block.cpp',
> +	'parse-cta-block.cpp',
> +	'parse-di-ext-block.cpp',
> +	'parse-displayid-block.cpp',
> +	'parse-ls-ext-block.cpp',
> +	'parse-vtb-ext-block.cpp',
> +	cpp_args : edid_decode_args,
> +	link_args: edid_decode_link_args,
> +	install : true,
> +)
> +
> +install_man('edid-decode.1')
> \ No newline at end of file


