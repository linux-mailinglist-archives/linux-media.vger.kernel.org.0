Return-Path: <linux-media+bounces-6724-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 179FC876501
	for <lists+linux-media@lfdr.de>; Fri,  8 Mar 2024 14:20:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C72F428174D
	for <lists+linux-media@lfdr.de>; Fri,  8 Mar 2024 13:20:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C68173BBD3;
	Fri,  8 Mar 2024 13:18:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b="pmkUME9B"
X-Original-To: linux-media@vger.kernel.org
Received: from gofer.mess.org (gofer.mess.org [88.97.38.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 983C03307B
	for <linux-media@vger.kernel.org>; Fri,  8 Mar 2024 13:18:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=88.97.38.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709903936; cv=none; b=Jte6IcTNFjQLtEq3pP7bcJkN+eSRpJ+2eg5JYSZvR7whruxZlGbYej7vxXuIEA8KnzLtDux3Fzjc1HXxUUAIs47bXNxMmkSDnxscebO5qv7O5DNSsIEY+1410U5tOVVf4lFBEkVqL2/djZMDJMbbST/0AysA+fzN51athaCpqXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709903936; c=relaxed/simple;
	bh=y9YEPGKInXAFuJRK5EarZTyW/BOSxB50o4lCq1gsXB0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o/dbL2JxfjfymaOb+54esaCs9ZfOfSeEnHJE5TezFY6xwJcbgHOWzVIQgKGmFTW6Ts3G+mO7bEWBA+Bg88I9vGLUKBAY0c1CTcu6CudjHP90kkwvVBoMxh9y80r2/bIcCc3LHQMvBQPJyn5d43R3/pcS/grsdSTgYBp9xO+hoKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org; spf=pass smtp.mailfrom=mess.org; dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b=pmkUME9B; arc=none smtp.client-ip=88.97.38.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mess.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1709903926; bh=y9YEPGKInXAFuJRK5EarZTyW/BOSxB50o4lCq1gsXB0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pmkUME9B2EHsoue6pVz3ismA/GlpXHXHRoOGV0DX2RMbfqKCgrhcuJqjhhw/9sZsp
	 7fwDfi1Ug+vTdN2VROseOlG6mQSTwDtyG1wp0P+pA5Cu3yuQqvyfQXJkxYsM3spncb
	 1V0iAQGbM/2FOVhKoqlBipsdmjfYNMckBtz19F592E8NxYCs5vfFmfv6nO8MehzyNI
	 L96bYVqp8HpvYP8BsC7s/Tso52XjYrcGsT7HoSTF1uCSzj1JabzhwROT80L4JZDYDh
	 0jdvz5lmWj2KjckoPw3ciyyRbFJxugckEQ99ueyn6oM2zqR23QWznK7RNtDzEutXzl
	 lPyNRhw7wtquQ==
Received: by gofer.mess.org (Postfix, from userid 1000)
	id 318E41000B8; Fri,  8 Mar 2024 13:18:46 +0000 (GMT)
Date: Fri, 8 Mar 2024 13:18:46 +0000
From: Sean Young <sean@mess.org>
To: Vince Ricosti <vricosti@outlook.com>
Cc: linux-media@vger.kernel.org
Subject: Re: [PATCH] add missing errno before strtol
Message-ID: <ZesQNqpEBXXRz2iP@gofer.mess.org>
References: <BL3PR19MB65148E663E21F7739BC39628D3272@BL3PR19MB6514.namprd19.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <BL3PR19MB65148E663E21F7739BC39628D3272@BL3PR19MB6514.namprd19.prod.outlook.com>

On Fri, Mar 08, 2024 at 10:59:27AM +0100, Vince Ricosti wrote:
> When testing yesterday the latest master on my raspberry pi I could not send
> my usual file because
> when entering read_file_raw the errno was already wrong (don't asky why
> because this morning it works). Anyway since strtol do not update errno
> except for overflow conditions it's better to set it to 0 as done in other
> parts of code.
> 
> Signed-off-by: Vince Ricosti <vricosti@outlook.com>
> ---
> utils/ir-ctl/ir-ctl.c | 1 +
> 1 file changed, 1 insertion(+)
> 
> diff --git a/utils/ir-ctl/ir-ctl.c b/utils/ir-ctl/ir-ctl.c
> index c480a2b1..e662651e 100644
> --- a/utils/ir-ctl/ir-ctl.c
> +++ b/utils/ir-ctl/ir-ctl.c
> @@ -413,6 +413,7 @@ static struct send *read_file_raw(struct arguments
> *args, const char *fname, FIL
> (keyword[0] == '/' && keyword[1] == '/'))
> break;
> + errno = 0;

The formatting is all wrong, but I've fixed it up and applied it, with
some minor rewording.

Thanks!

Sean

> value = strtol(keyword, &p, 10);
> if (errno || *p) {
> fprintf(stderr, _("%s:%d: error: expected integer, got `%s'\n"),
> 
> -- 
> 2.30.2
> 

