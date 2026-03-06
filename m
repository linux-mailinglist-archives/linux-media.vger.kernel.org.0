Return-Path: <linux-media+bounces-54696-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mEMZBtF0qmmuRwEAu9opvQ
	(envelope-from <linux-media+bounces-54696-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 06 Mar 2026 07:31:45 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 690B321C139
	for <lists+linux-media@lfdr.de>; Fri, 06 Mar 2026 07:31:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A0DDA303E483
	for <lists+linux-media@lfdr.de>; Fri,  6 Mar 2026 06:31:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2E0F370D6B;
	Fri,  6 Mar 2026 06:31:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ei3fzKIV"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58B1343147
	for <linux-media@vger.kernel.org>; Fri,  6 Mar 2026 06:31:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772778695; cv=pass; b=c5NdisURuvVK3Je4KnrtB93swyKuF5wfhByZbbEQNom21dv5ungB48JWc0V6dVDVrfAH5EE0m73xcMhpdHhvSCtn9sLB7NTsb5Z9N3Hp66iCt8YPUY1KrOQL3KsLCdqp3AKjF5pFDuC7EANP5Jxlsj35s6WDrx5XOOKWoqTa4DM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772778695; c=relaxed/simple;
	bh=eRMWhIFwsAS6ygTvQk7qL5zlhVHPsCNOcIbFDmaC3wU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=H3EON4cSPTtEqLlITLO9f7VgL1CxVUt1MiXmTjxNlrIUby6NJxoJTwygJe9Zil8cEUhwYWgaZYrsGB70mM6RsODcVMioZoY1oJ2MSeWc+dRR3brtRFxG3FTjiNczl4pF43R2spq0w3GUTZ1bSa60jZEvXvFNb0bWpFvh1tDQU/w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ei3fzKIV; arc=pass smtp.client-ip=74.125.82.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-12732165d1eso9806887c88.1
        for <linux-media@vger.kernel.org>; Thu, 05 Mar 2026 22:31:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772778693; cv=none;
        d=google.com; s=arc-20240605;
        b=PkmpgDbsxJSb0ctEq+tgHNCyYiMw0Oxdarfxg75jaV36Kby8fjTbrZxkmGqH/QPOwk
         vNG8Fqd5g+ZdPA7dn0ulMWDnQ5PdffMEdzO7Gx37N93Fa2XiF0W/A0Fk5xuPM4c9hose
         Ea9ZxslQdMsLlP+yzG7keCBRz7kVIBLdlyVWSIgUrFGHhaly69cehnlZWwBh+asIcS9S
         dQOfaOF8vmZ5pr9nToGc3mTnmGR0a+NiscUzuhUao8PdCaPMktP3l9m9KFqzzmpTIomU
         gNlifIq8b5id0r+yt5/XRepYtYP2yFSn/UJ782XTPpabeLXYDFczbyz2miyQtIMJJ1qv
         8I9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=S7+NjqRCL1ZEki4xzUKQ+i30HnWeDpBB7HSMyQhPGMo=;
        fh=FVhWSl7OeHFRTTn75JiLzpJ0t3/CyomfQpNST08UvjI=;
        b=bwzwE/f83d7Z1zQZb3g5sNchhrq9cSnYwn63Bethgu/hv8+h9hWNx/0zbGk6qb0pZb
         lhAYq558/8h+EIITwe1l/p3vA3zLzeQYOl3ZQCYYO/M8qhCyDC5Bqj3KQaVTva942mIh
         J3EwwIbalc7iYnNqCZEt6vW2FA5mwkQpabenxWukJjS3Hs3U08No9rg1JKXE0xdUsnp8
         uyl4KHPVS21D0b5a3lILzanT/tyIWGxqWM/g1OJpN+TswDxvA+sovfhHkLLlPaInesNz
         YG5uTyIG4yKCPNYPefob6W4io0oLquuaZTLUSFMTYgayCjj6FZo4skcYbON/mWWTBE9q
         4a0Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772778693; x=1773383493; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S7+NjqRCL1ZEki4xzUKQ+i30HnWeDpBB7HSMyQhPGMo=;
        b=ei3fzKIV1abdgwMJhnWYeApO6QtN+MjDJExuAsQHmn3WofvxPLNnXhGTU+5YY6PpQC
         SwVgWQNeQg02QItusIurOc5h7IGuj0yB6nxk+q98maLEziXcG5jN3K++L3ULSrTDXFKj
         i5tviS5ujd0Zeq7rv9VOAqv4Z9KSBE4sqf4whbhfOJDPbv17zIdz4G4MOR7usEyXW7DB
         gAUsNoXO8HU8yWJgiHnk9YWwUDtmmp6Xtyw8d6Nh0EVtgXxmO+ySKAt/MLKkEsPcgBDT
         PX9Aa0Mt8PCeQcnXm22FPTqJraxm2wF1hHDIQuUvgmucFjolFTY4iAxQVulTKYGx5H/m
         9fPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772778693; x=1773383493;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=S7+NjqRCL1ZEki4xzUKQ+i30HnWeDpBB7HSMyQhPGMo=;
        b=GnGloRxxXTKRlA7Z7Ja5SaRluL0pWbLbXrhATW6CefkLdktBBVZJk93x1xvdQK3lIS
         pAO5DCnzNYWc800kgkqTdKp1El8cZpAWOTyLqwzCtExgfoovjfXAOMudrQWbCWFkDU38
         yqZEuNTRYlkD06vYmdWPfE9mhXSkC+M3YoiE1F6hsWX/05Jli9n+TMqQnxwDWumtXDgJ
         25Egm38LhNC6/lGZUjtfP7iypsPrA7fPdaSDBqNbYpVgAVv+OSWSFiuie2TcLUSBTIA0
         imZKti2wZc15BkQJ8qXnvPAMilNKE7sSgeNRAKBl6eJOXwX/jqxaeHbmDOhrjUy06wag
         BSRw==
X-Gm-Message-State: AOJu0Ywkm9IcNnqoCf/o00dXn6UdZVglDP3f3cRivaQQVpScleLlOJjk
	ylm3MOnsPGKb+aTqRTxEE2JImIMdWXQ/HslUh/bAdMXhP5K5VgdWq/T1aRn2JX5KELUtWRqQJ0E
	sTP5KsU1GvGcOHOlBM2DMy4raO9UHYdUxKDcH
X-Gm-Gg: ATEYQzws8UqBF3Nj6FF2+3F6dY5Q+oyEcPJ6qQkRqQp76UNM4aInmAjmQe5kupGzO07
	HT33IoTlELPUsG430it5GLTAxykWIvnMUA54FkSmOgyR6vnqrGNohyo+VNV36ah5PtXfjAOBoWT
	cXi3USZZrRMbUvDbj44kfqQUne+PWuBozRrqRhpR/8CN+2JcnDKAdBStwZ1Jk5ITImF3Ol2YvT6
	Lzuq9oafz0gGkU8HCVEUy102++byXEIZf0s7wWk6N1B6JhGyKKXiwo3LsK2QP4GD0UbTVxJbw+A
	0SyOGjdrcS0TC0PNZZL5ZvOxsArLwTtdGs1AchkZ2YvoVGpJi+542Ylq0Fv741P95r/a7CRQiBE
	Hz5I=
X-Received: by 2002:a05:7022:671f:b0:127:9cad:1a65 with SMTP id
 a92af1059eb24-128c2e1136amr504589c88.14.1772778693248; Thu, 05 Mar 2026
 22:31:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260207091822.601255-1-alperyasinak1@gmail.com> <b525c449-652b-4557-9517-ae695ffc3105@web.de>
In-Reply-To: <b525c449-652b-4557-9517-ae695ffc3105@web.de>
From: Alper Ak <alperyasinak1@gmail.com>
Date: Fri, 6 Mar 2026 09:31:22 +0300
X-Gm-Features: AaiRm531pbhrvTCAuDSdNBAwpqpxmrXN7t9vfN1qx7uXTIHNAQi84VacUzui1X4
Message-ID: <CAGpma=7W2gOg__QnTL==5tydRRMyu-H=G+L0mvKYi=-cVEqNCw@mail.gmail.com>
Subject: Re: [PATCH] media: malic55: Fix possible ERR_PTR deference in enable_streams
To: Markus Elfring <Markus.Elfring@web.de>
Cc: linux-media@vger.kernel.org, Daniel Scally <dan.scally@ideasonboard.com>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, LKML <linux-kernel@vger.kernel.org>, 
	Hans Verkuil <hverkuil+cisco@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Nayden Kanchev <nayden.kanchev@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 690B321C139
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-54696-lists,linux-media=lfdr.de];
	FREEMAIL_TO(0.00)[web.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.982];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alperyasinak1@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	RCPT_COUNT_SEVEN(0.00)[8];
	FREEMAIL_FROM(0.00)[gmail.com];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,mail.gmail.com:mid]
X-Rspamd-Action: no action

Hello everyone, look like this patch hasn't been applied. Did I miss
something I needed to do to get it applied? If there is anything I
need to do, please let me know.


Markus Elfring <Markus.Elfring@web.de>, 14 =C5=9Eub 2026 Cmt, 17:37
tarihinde =C5=9Funu yazd=C4=B1:
>
> =E2=80=A6
> > pointer or an ERR_PTR() on failure =E2=80=A6
>
>                 error pointer
>
>
> > Add proper error checking with IS_ERR() before dereferencing the
> > pointer. Also set isp->remote_src to NULL on error to maintain
> > consistency with other error paths in the function.
> =E2=80=A6
>
> * See also once more:
>   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree=
/Documentation/process/stable-kernel-rules.rst?h=3Dv6.19#n34
>
> * Were any source code analysis tools involved here?
>
> * Would a summary phrase like =E2=80=9CPrevent error pointer dereference
>   in mali_c55_isp_enable_streams()=E2=80=9D be more appropriate?
>
>
> Regards,
> Markus
>

