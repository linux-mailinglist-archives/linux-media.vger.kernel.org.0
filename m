Return-Path: <linux-media+bounces-45026-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BF91ABF0A65
	for <lists+linux-media@lfdr.de>; Mon, 20 Oct 2025 12:47:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6FF85188EB53
	for <lists+linux-media@lfdr.de>; Mon, 20 Oct 2025 10:47:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 127012505AF;
	Mon, 20 Oct 2025 10:46:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kSOkEo4T"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65CB1248F64;
	Mon, 20 Oct 2025 10:46:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760957213; cv=none; b=puzowVCg3V596Tb3O9Oq2GLfh6LjL9vQqhf4D7GTSUvl9jf8v08K7KX8LabwEIZzUp5uQPnkfprAMp59fnZYZ7zZw6xOEgRwMqFswrjbOUYbTBQ/4OAhnQbIrBxD6M2RJfJjANdC539SD3NNdhm9OcwtW1t+fprKSUN+Mog0EY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760957213; c=relaxed/simple;
	bh=D1ZkUGIvlqw3I085AUCc/kwgl9Idn6a5N0Vdlll34oU=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=HR3CaX4Wz8F3fvah+w8yVFToIBzRZTqXWvpD663/4PWkDf4SeMR8tue8vP+imAvWQaOegnm7KqtaYmFp3Jsx10PPTS9GgmRpR/DAofdknyHlp+PGh/aRh1xDfeM8lrcGF1x+piIkltr1vOIjTYawtKeYpP7hoCkXqyIf2nWN8kM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kSOkEo4T; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED912C4CEF9;
	Mon, 20 Oct 2025 10:46:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760957213;
	bh=D1ZkUGIvlqw3I085AUCc/kwgl9Idn6a5N0Vdlll34oU=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
	b=kSOkEo4TAPBJ+HG5+qKtiuAlWykbHxA/98Ke/2hhkNzNXTQGslxalWAYqvxvTNN2E
	 gYzbGCOJoxBGi9TvV1vTBOhrHJcKtjEqMLBww4mUlG+R/OVItocZMzjyz/RibwfX1c
	 3CKzJcrYIZiYK+iXeed1j6IJGppoDPQMTR9+M+i76spfKRF52XNmMl3qOY2xt8k+y9
	 FmjQ4sdlnUH7fmJNAJol8G6Vl3wEHepKJkxXUdFTm6r5cb1+NbMOfl1S4H6KUinXNU
	 Z8wPeoUKjFt5IG/RH0klRkM6LYKkSWevLNQTBMnmFS2oaeO3/cnyhzOW2gDV9LxcDP
	 E0CE9KzEvsRUQ==
Message-ID: <1507fe55-d756-46bb-abf1-0d1fb7f9bee0@kernel.org>
Date: Mon, 20 Oct 2025 12:46:50 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: Re: [PATCH 02/23] tools: docs: parse_data_structs.py: output a line
 number
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org
References: <cover.1759329363.git.mchehab+huawei@kernel.org>
 <dcffa6844dede00052f5fb851a857991468f22b5.1759329363.git.mchehab+huawei@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <dcffa6844dede00052f5fb851a857991468f22b5.1759329363.git.mchehab+huawei@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 01/10/2025 16:49, Mauro Carvalho Chehab wrote:

Missing commit message!

I'm less concerned about the missing message (it's clear what is happening here),
than I am about the fact that checkpatch wasn't run.

Regards,

	Hans

> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---
>  tools/docs/lib/parse_data_structs.py | 29 ++++++++++++++--------------
>  1 file changed, 15 insertions(+), 14 deletions(-)
> 
> diff --git a/tools/docs/lib/parse_data_structs.py b/tools/docs/lib/parse_data_structs.py
> index 6c868f84f029..d28471a045f1 100755
> --- a/tools/docs/lib/parse_data_structs.py
> +++ b/tools/docs/lib/parse_data_structs.py
> @@ -143,7 +143,7 @@ class ParseDataStructs:
>          for symbol_type in self.DEF_SYMBOL_TYPES:
>              self.symbols[symbol_type] = {}
>  
> -    def store_type(self, symbol_type: str, symbol: str,
> +    def store_type(self, ln, symbol_type: str, symbol: str,
>                     ref_name: str = None, replace_underscores: bool = True):
>          """
>          Stores a new symbol at self.symbols under symbol_type.
> @@ -172,7 +172,7 @@ class ParseDataStructs:
>          else:
>              ref_link = symbol
>  
> -        self.symbols[symbol_type][symbol] = f"{prefix}{ref_link}{suffix}"
> +        self.symbols[symbol_type][symbol] = (f"{prefix}{ref_link}{suffix}", ln)
>  
>      def store_line(self, line):
>          """Stores a line at self.data, properly indented"""
> @@ -240,20 +240,20 @@ class ParseDataStructs:
>                  if is_enum:
>                      match = re.match(r"^\s*([_\w][\w\d_]+)\s*[\,=]?", line)
>                      if match:
> -                        self.store_type("symbol", match.group(1))
> +                        self.store_type(line_no, "symbol", match.group(1))
>                      if "}" in line:
>                          is_enum = False
>                      continue
>  
>                  match = re.match(r"^\s*#\s*define\s+([\w_]+)\s+_IO", line)
>                  if match:
> -                    self.store_type("ioctl", match.group(1),
> +                    self.store_type(line_no, "ioctl", match.group(1),
>                                      replace_underscores=False)
>                      continue
>  
>                  match = re.match(r"^\s*#\s*define\s+([\w_]+)(\s+|$)", line)
>                  if match:
> -                    self.store_type("define", match.group(1))
> +                    self.store_type(line_no, "define", match.group(1))
>                      continue
>  
>                  match = re.match(r"^\s*typedef\s+([_\w][\w\d_]+)\s+(.*)\s+([_\w][\w\d_]+);",
> @@ -261,20 +261,20 @@ class ParseDataStructs:
>                  if match:
>                      name = match.group(2).strip()
>                      symbol = match.group(3)
> -                    self.store_type("typedef", symbol, ref_name=name)
> +                    self.store_type(line_no, "typedef", symbol, ref_name=name)
>                      continue
>  
>                  for re_enum in self.RE_ENUMS:
>                      match = re_enum.match(line)
>                      if match:
> -                        self.store_type("enum", match.group(1))
> +                        self.store_type(line_no, "enum", match.group(1))
>                          is_enum = True
>                          break
>  
>                  for re_struct in self.RE_STRUCTS:
>                      match = re_struct.match(line)
>                      if match:
> -                        self.store_type("struct", match.group(1))
> +                        self.store_type(line_no, "struct", match.group(1))
>                          break
>  
>      def process_exceptions(self, fname: str):
> @@ -342,7 +342,8 @@ class ParseDataStructs:
>  
>                  # Change self.symbols to use the replacement rule
>                  if old in self.symbols[c_type]:
> -                    self.symbols[c_type][old] = new_ref
> +                    (_, ln) = self.symbols[c_type][old]
> +                    self.symbols[c_type][old] = (new_ref, ln)
>                  else:
>                      print(f"{name}:{ln}: Warning: can't find {old} {c_type}")
>  
> @@ -360,8 +361,8 @@ class ParseDataStructs:
>  
>              print(f"{c_type}:")
>  
> -            for symbol, ref in sorted(refs.items()):
> -                print(f"  {symbol} -> {ref}")
> +            for symbol, (ref, ln) in sorted(refs.items()):
> +                print(f"  #{ln:<5d} {symbol} -> {ref}")
>  
>              print()
>  
> @@ -384,7 +385,7 @@ class ParseDataStructs:
>  
>          # Process all reference types
>          for ref_dict in self.symbols.values():
> -            for symbol, replacement in ref_dict.items():
> +            for symbol, (replacement, _) in ref_dict.items():
>                  symbol = re.escape(re.sub(r"([\_\`\*\<\>\&\\\\:\/])", r"\\\1", symbol))
>                  text = re.sub(fr'{start_delim}{symbol}{end_delim}',
>                                fr'\1{replacement}\2', text)
> @@ -420,8 +421,8 @@ class ParseDataStructs:
>              text.append("")
>  
>              # Sort symbols alphabetically
> -            for symbol, ref in sorted(refs.items()):
> -                text.append(f"* :{ref}:")
> +            for symbol, (ref, ln) in sorted(refs.items()):
> +                text.append(f"* {ref}: line #{ln}")
>  
>              text.append("")  # Add empty line between categories
>  


