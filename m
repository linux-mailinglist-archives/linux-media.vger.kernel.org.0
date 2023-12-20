Return-Path: <linux-media+bounces-2824-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id ECE3781A6FD
	for <lists+linux-media@lfdr.de>; Wed, 20 Dec 2023 19:45:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 872BE1F2424C
	for <lists+linux-media@lfdr.de>; Wed, 20 Dec 2023 18:45:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C670F34566;
	Wed, 20 Dec 2023 18:45:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b="cgn45P+5"
X-Original-To: linux-media@vger.kernel.org
Received: from gofer.mess.org (gofer.mess.org [88.97.38.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91D881E514
	for <linux-media@vger.kernel.org>; Wed, 20 Dec 2023 18:45:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mess.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1703097917; bh=QW1tPpJ8SmVHpdBY7BemRv5s2E1OwB4H670Wug5emw8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cgn45P+5gZMVmNEshOrGxylAlBygipbJpr/p8n/YUJWOoA3oB5bFGouo+VlSwIjQA
	 rHt+xlanSzxkZusuu1/2ZVv1A4v3TSZGN+1uVol46I0cKHlpuKKsIzQoop7vABZFUG
	 6WDdJOFbxnh4puTReRIU6sl51nlwYCPNCg0tXTphFtF/XJ2B3z2y/7Soq2PPJxwGDm
	 f3ObFuJFioPcoN870mjtTCwOX5b45gaKhenuq8iPkLkNBtUJmba7G/ToT21cy4SXIU
	 yyh+YIcEYvbDo+jt92BECUb3Rd+VKf8rRMelsR9AmDEEpJNJaEPP+/x/8sGnT7+OuJ
	 RP45uVarZfVuQ==
Received: by gofer.mess.org (Postfix, from userid 1000)
	id 3BD551000FD; Wed, 20 Dec 2023 18:45:17 +0000 (GMT)
Date: Wed, 20 Dec 2023 18:45:17 +0000
From: Sean Young <sean@mess.org>
To: Matthias Reichl <hias@horus.com>
Cc: linux-media@vger.kernel.org
Subject: Re: [PATCH v4l-utils] keytable: fix segfault when reading legacy
 keymaps
Message-ID: <ZYM2PRKNT5_g2pa8@gofer.mess.org>
References: <20231220160003.84042-1-hias@horus.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231220160003.84042-1-hias@horus.com>

On Wed, Dec 20, 2023 at 05:00:03PM +0100, Matthias Reichl wrote:
> Since commit ae1492611432 ("keytable: remove line length limits")
> ir-keytable crashes when reading keymaps in legacy (non-toml) format
> and valgrind reports an UMR:
> 
> valgrind ir-keytable -w /etc/rc_keymaps/hiastest
> ...
> ==83788== Conditional jump or move depends on uninitialised value(s)
> ==83788==    at 0x48E8B8C: getdelim (iogetdelim.c:59)
> ==83788==    by 0x1105C6: getline (stdio.h:120)
> ==83788==    by 0x1105C6: parse_plain_keymap (keymap.c:98)
> ==83788==    by 0x1105C6: parse_keymap (keymap.c:533)
> ==83788==    by 0x112798: parse_opt (keytable.c:569)
> ==83788==    by 0x4986E50: group_parse (argp-parse.c:257)
> ==83788==    by 0x4986E50: parser_parse_opt (argp-parse.c:747)
> ==83788==    by 0x4986E50: parser_parse_next (argp-parse.c:867)
> ==83788==    by 0x4986E50: argp_parse (argp-parse.c:921)
> ==83788==    by 0x10E470: main (keytable.c:2071)
> 
> Fix this by properly initializing line to NULL so getline will allocate
> a buffer instead of using some random memory locations.

Nice catch, applied.

Thanks
Sean

> 
> Signed-off-by: Matthias Reichl <hias@horus.com>
> ---
>  utils/common/keymap.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/utils/common/keymap.c b/utils/common/keymap.c
> index 04c5ef54723c..21c1c0b5d581 100644
> --- a/utils/common/keymap.c
> +++ b/utils/common/keymap.c
> @@ -75,7 +75,7 @@ static error_t parse_plain_keymap(char *fname, struct keymap **keymap, bool verb
>  {
>  	FILE *fin;
>  	int line_no = 0;
> -	char *scancode, *keycode, *line;
> +	char *scancode, *keycode, *line = NULL;
>  	size_t line_size;
>  	struct scancode_entry *se;
>  	struct keymap *map;
> -- 
> 2.39.2
> 

