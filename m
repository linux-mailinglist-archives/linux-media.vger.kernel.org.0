Return-Path: <linux-media+bounces-45031-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 70CADBF0F52
	for <lists+linux-media@lfdr.de>; Mon, 20 Oct 2025 13:57:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 79B434F3799
	for <lists+linux-media@lfdr.de>; Mon, 20 Oct 2025 11:57:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4BEF311C21;
	Mon, 20 Oct 2025 11:56:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LuosinnC"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B4C830595A;
	Mon, 20 Oct 2025 11:56:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760961416; cv=none; b=KOG39T/ZU3UoTVs0YJu29Od/6setiv5N+VH8c+hhm7EjsZLbM2KO1/3RuAyyFJRPd27pqV3Ldpt+lkNhe41YKBkLMx5NLXu7dsX9B/uLCrwTHYy5OgK2Z7oBxLleXO2XO+ftM39FZvxXDPRk7nPDClDbXMyo0DWE8EAXmrt/JTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760961416; c=relaxed/simple;
	bh=ZcmJIfsB4LChHE03FyuLCzwTi7dkvnBS3aWOnxBGojg=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=E2lc6i+Oex8fjzJ0uTYkhWziGNe9IVmnamEM3JU1fotPSjQHhRQG7a6szALZYWD3BeM62B2PnstIYL/DuK5GMkbwSLGXBeGKHRFRHt7qNwYvaqLofxjHraz6IcOk9hFkfmMp+a4KvDTYGqf7fEGshIH2YYaDXDUQfrkkk4HOHz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LuosinnC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DD59C113D0;
	Mon, 20 Oct 2025 11:56:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760961415;
	bh=ZcmJIfsB4LChHE03FyuLCzwTi7dkvnBS3aWOnxBGojg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=LuosinnCXLWb731Ac8RPagWrD082efqHx0geawEzhfsppoChEdah3buWDcIzNFMvP
	 dBjhbVF1FICX76U3U+smpICUiJLSKAtDF2j1RXc2InKv8KlPtOQ5xABWTneGPbfOIT
	 ZKbaex0+GtRGAsloox3PuttpCqBcZktL2E/9n8/v2SVhzl7hs94CebygnaJ0Obx7FV
	 2RGbjJ89+o/UXEom/8NOTLYDw0b+9zxX60pUV30BG6U6mSeyexURsFGm+eO+7F/as1
	 XAvqfjHE38OEQO6gvtF3Ta+OoJ4Rbf6iAS02EkuIBwoFE5NPCxdM8fDOkASx6slZqD
	 b53gQhd+bnhJQ==
Date: Mon, 20 Oct 2025 08:56:43 -0300
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Linux Doc Mailing List
 <linux-doc@vger.kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: Re: [PATCH 02/23] tools: docs: parse_data_structs.py: output a line
 number
Message-ID: <20251020085643.14007a29@sal.lan>
In-Reply-To: <1507fe55-d756-46bb-abf1-0d1fb7f9bee0@kernel.org>
References: <cover.1759329363.git.mchehab+huawei@kernel.org>
	<dcffa6844dede00052f5fb851a857991468f22b5.1759329363.git.mchehab+huawei@kernel.org>
	<1507fe55-d756-46bb-abf1-0d1fb7f9bee0@kernel.org>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Mon, 20 Oct 2025 12:46:50 +0200
Hans Verkuil <hverkuil+cisco@kernel.org> escreveu:

> On 01/10/2025 16:49, Mauro Carvalho Chehab wrote:
> 
> Missing commit message!

Weird, I'm almost sure I filled some description.

> 
> I'm less concerned about the missing message (it's clear what is happening here),
> than I am about the fact that checkpatch wasn't run.

My mailbomb script does run checkpatch for each patch, but I probably
missed the warnings(*).

(*) By the time I sent this series, I was playing with a new version
    written in Python. It had several issues, however, mostly because I
    was unable to find a way for Python to read an e-mail formatted with
    git format-patch without mangling with content encoding. I got problems
    on translations, with binary file patches and even with \n at the code.

    On my original script, written in 2015, it was easy to lose checkpatch 
    messages in the crowd on big series. I did several improvements on
    it, like running checkpatch in parallel and re-ordering warnings to
    avoid losing them, but it was done only after sending this series.

In any case, checkpatch currently doesn't have any logic for Python
or ReST files. It only reports patch descriptions issues like this.
IMO what it is needed for checkpatch to be more useful for tools is:

1. to define a coding style for Python;
2. to add some code at checkpatch to handle Python as well.

> 
> Regards,
> 
> 	Hans
> 
> > Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> > ---
> >  tools/docs/lib/parse_data_structs.py | 29 ++++++++++++++--------------
> >  1 file changed, 15 insertions(+), 14 deletions(-)
> > 
> > diff --git a/tools/docs/lib/parse_data_structs.py b/tools/docs/lib/parse_data_structs.py
> > index 6c868f84f029..d28471a045f1 100755
> > --- a/tools/docs/lib/parse_data_structs.py
> > +++ b/tools/docs/lib/parse_data_structs.py
> > @@ -143,7 +143,7 @@ class ParseDataStructs:
> >          for symbol_type in self.DEF_SYMBOL_TYPES:
> >              self.symbols[symbol_type] = {}
> >  
> > -    def store_type(self, symbol_type: str, symbol: str,
> > +    def store_type(self, ln, symbol_type: str, symbol: str,
> >                     ref_name: str = None, replace_underscores: bool = True):
> >          """
> >          Stores a new symbol at self.symbols under symbol_type.
> > @@ -172,7 +172,7 @@ class ParseDataStructs:
> >          else:
> >              ref_link = symbol
> >  
> > -        self.symbols[symbol_type][symbol] = f"{prefix}{ref_link}{suffix}"
> > +        self.symbols[symbol_type][symbol] = (f"{prefix}{ref_link}{suffix}", ln)
> >  
> >      def store_line(self, line):
> >          """Stores a line at self.data, properly indented"""
> > @@ -240,20 +240,20 @@ class ParseDataStructs:
> >                  if is_enum:
> >                      match = re.match(r"^\s*([_\w][\w\d_]+)\s*[\,=]?", line)
> >                      if match:
> > -                        self.store_type("symbol", match.group(1))
> > +                        self.store_type(line_no, "symbol", match.group(1))
> >                      if "}" in line:
> >                          is_enum = False
> >                      continue
> >  
> >                  match = re.match(r"^\s*#\s*define\s+([\w_]+)\s+_IO", line)
> >                  if match:
> > -                    self.store_type("ioctl", match.group(1),
> > +                    self.store_type(line_no, "ioctl", match.group(1),
> >                                      replace_underscores=False)
> >                      continue
> >  
> >                  match = re.match(r"^\s*#\s*define\s+([\w_]+)(\s+|$)", line)
> >                  if match:
> > -                    self.store_type("define", match.group(1))
> > +                    self.store_type(line_no, "define", match.group(1))
> >                      continue
> >  
> >                  match = re.match(r"^\s*typedef\s+([_\w][\w\d_]+)\s+(.*)\s+([_\w][\w\d_]+);",
> > @@ -261,20 +261,20 @@ class ParseDataStructs:
> >                  if match:
> >                      name = match.group(2).strip()
> >                      symbol = match.group(3)
> > -                    self.store_type("typedef", symbol, ref_name=name)
> > +                    self.store_type(line_no, "typedef", symbol, ref_name=name)
> >                      continue
> >  
> >                  for re_enum in self.RE_ENUMS:
> >                      match = re_enum.match(line)
> >                      if match:
> > -                        self.store_type("enum", match.group(1))
> > +                        self.store_type(line_no, "enum", match.group(1))
> >                          is_enum = True
> >                          break
> >  
> >                  for re_struct in self.RE_STRUCTS:
> >                      match = re_struct.match(line)
> >                      if match:
> > -                        self.store_type("struct", match.group(1))
> > +                        self.store_type(line_no, "struct", match.group(1))
> >                          break
> >  
> >      def process_exceptions(self, fname: str):
> > @@ -342,7 +342,8 @@ class ParseDataStructs:
> >  
> >                  # Change self.symbols to use the replacement rule
> >                  if old in self.symbols[c_type]:
> > -                    self.symbols[c_type][old] = new_ref
> > +                    (_, ln) = self.symbols[c_type][old]
> > +                    self.symbols[c_type][old] = (new_ref, ln)
> >                  else:
> >                      print(f"{name}:{ln}: Warning: can't find {old} {c_type}")
> >  
> > @@ -360,8 +361,8 @@ class ParseDataStructs:
> >  
> >              print(f"{c_type}:")
> >  
> > -            for symbol, ref in sorted(refs.items()):
> > -                print(f"  {symbol} -> {ref}")
> > +            for symbol, (ref, ln) in sorted(refs.items()):
> > +                print(f"  #{ln:<5d} {symbol} -> {ref}")
> >  
> >              print()
> >  
> > @@ -384,7 +385,7 @@ class ParseDataStructs:
> >  
> >          # Process all reference types
> >          for ref_dict in self.symbols.values():
> > -            for symbol, replacement in ref_dict.items():
> > +            for symbol, (replacement, _) in ref_dict.items():
> >                  symbol = re.escape(re.sub(r"([\_\`\*\<\>\&\\\\:\/])", r"\\\1", symbol))
> >                  text = re.sub(fr'{start_delim}{symbol}{end_delim}',
> >                                fr'\1{replacement}\2', text)
> > @@ -420,8 +421,8 @@ class ParseDataStructs:
> >              text.append("")
> >  
> >              # Sort symbols alphabetically
> > -            for symbol, ref in sorted(refs.items()):
> > -                text.append(f"* :{ref}:")
> > +            for symbol, (ref, ln) in sorted(refs.items()):
> > +                text.append(f"* {ref}: line #{ln}")
> >  
> >              text.append("")  # Add empty line between categories
> >    
> 

