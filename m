Return-Path: <linux-media+bounces-58148-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sLTjKkCl1GmkwAcAu9opvQ
	(envelope-from <linux-media+bounces-58148-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 07 Apr 2026 08:33:36 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 03D7E3AA51F
	for <lists+linux-media@lfdr.de>; Tue, 07 Apr 2026 08:33:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1618E30547FB
	for <lists+linux-media@lfdr.de>; Tue,  7 Apr 2026 06:32:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 317383890FA;
	Tue,  7 Apr 2026 06:32:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JFH5okfC"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4153F355F2D
	for <linux-media@vger.kernel.org>; Tue,  7 Apr 2026 06:32:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775543577; cv=pass; b=CwMOq/s0+G4/8uJ90bhT91larzvP0kwOSjtVDPy7FtcWjKFZnhAoGlKCONzq2wjjkzeFRHVOjd1Vlj7UnVTd3fkC3EtLxvkqLe5bOhVFlZIA9HvkJHyu7yfDFzTaaZ/Se4PKYfZ377YEpL5XqvI4W1NHU1JpT6RZXGqG72qcgUA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775543577; c=relaxed/simple;
	bh=BDU8G9o9xgJcAL08GeyWae/GCAQIm8z/fRlppWexggE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nA0qpPPli083KfXwsjNAUQVxgJevCuPWLEscZusMPdVndUhoRBPYOdbq+dnzPMrffx8IGUcH/uVw/vwE6qslfVjsWdsej85U1dM0UcsL/rTfQoT1hR3IRvZPhJYCNdQkvscd0lJkIDKQ5NrYaEhjT8Z6QypLHoooKx3G18EVOBU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JFH5okfC; arc=pass smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-43cfce3a195so2793681f8f.2
        for <linux-media@vger.kernel.org>; Mon, 06 Apr 2026 23:32:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775543575; cv=none;
        d=google.com; s=arc-20240605;
        b=Tv/4Dl6l63EgpBL926QjVAxZAcaLWQ0w4jIE9UFjI5hQUOaCmV047BxPZUw9sKKou8
         aSQh2UBqDSZiloaaqf4xa/iO0bVZ2ROFCU/UBfIMi+rQpvqZLIkTEv8DKPkvui9VePZa
         /PXLfcxFmmuuNkeob7xHxWMnOgGKI1Oza4tFxmjaJLoWxsWxH4RDb3NmFl+BGLIaAPEi
         VRK+O48mNeZ+fvPUfPmv4zuQirUa8m+vdlGdfiCXD0ENiCdQ6SGCEvunAC7XPpfmlir+
         TUjSSdtb1+5KTzWYrmNO9E99UjMBn1zw4z5kD4Gs4JgwwEYTuq50Wy8j5ipPsIRf4N3e
         +bFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=BDU8G9o9xgJcAL08GeyWae/GCAQIm8z/fRlppWexggE=;
        fh=wpzgcsW+0fd4JrFPHfugIgFKoEr0eOG538fQgz3IrDQ=;
        b=djo6mD3xV++ESVY5EWyh1lPtZSzpJynRIfOPkcMByWhxVj1diOkczDNexZVdWYNOdP
         fTg4m5jYLRA0GHWnrvYcIHJ0520Qw1T3LZm9KZKdNMdRPIDOfQ3H7DTwwrxFQjR/EjwY
         06bjJrN1qJWrP2LlgvQGjE2lvc1PAu13tKE+jCfYinIy6Zezs+SyueSmK6dZRnbqdA/u
         X7ayQhk4aNh2axk3Q58BSQaeaD9+VyxtVaTqNyFdWkYKRJsxcfbRoQ2BBvFDPmbHmHP3
         1lRpmJ3ptrwgOBjsuYnfyg39eiDyXbVK0o/T8TDhw6qrfhUqLoMwaC/qv6rkxsiWfEns
         DEiA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775543575; x=1776148375; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=BDU8G9o9xgJcAL08GeyWae/GCAQIm8z/fRlppWexggE=;
        b=JFH5okfCSedY7U0V9+zpvNfcYdN1lxt1JV97ISMw+Yo3qLTaZ5BSevb+4X+dfaWugV
         F9WPxl1PYNYCmEE84uPWbfqb/RJpPP9PIPsNtJ/FAOvcSI5/hjo/N69tHHlKZO/iSwvK
         tefPbnui/Yrf0jGLoe8pAMupo4D6k0EMsCoixoQUcYMu9UmGOVUP5UMMIL3GrExJN3Hy
         4ediOgpOGE/kB1smFHABQxwVmTpb1HGME69g1guKlmlU1LIel/PZIotqq2dcWCPePi7C
         wWfQTjvSY6fbI4tByZEb0g5QHDsTiK0wsp8nI7b94UKGezoph+W9QSQX8lKpQP7Uis0O
         haqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775543575; x=1776148375;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BDU8G9o9xgJcAL08GeyWae/GCAQIm8z/fRlppWexggE=;
        b=XJ2/0L3dGZI+6At4IFDgbmdUVa0OZMdgavv551MhiHTrXaBgnGYxKtkaBysiNpUt1W
         3Tv5hS7YYyhXvR6Y4gGdgqk17PfTCx3aqlSCyu6x550T67t3x2F6Ja8oBw+gO/je/XaU
         w+pgOnb/u3yErMKeAWZeVdJa1ZgapuEglAPiFDGsWCqPTckTHVdHYO20WSA44I/okXLp
         5otYelSFj0++Txu+6Fjtq72zCO12bGc5PRcFsxB9/rxBkB8/MjsrUn08pY7rP/Kkq7vj
         rLr6zq3OPK8JUoaK2vMHH4nj6yKMuxCpAFFdl1Kmo4zdjRmcQGgiucifRTNeUyr3Ee1p
         kCMA==
X-Forwarded-Encrypted: i=1; AJvYcCWeOlE9FDqRlTaAp8EU8/hOYzBrZ/oTKQp3qod8LqrIdzptQHToiS6iDOfP7ZnzPkDh6B0SwtCEVMQgpA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwndF4W4wA8fGvXSZgAxr2bvf7EaN3BniJbShlY/NkUJ097Nnht
	W13+pD6vjJgzayBJ0b1Piuh2NJoe5PCkDqiWYqvTJ+KXFYZAvb20W42aKfccd/ekApJ8bj2VvIF
	JTOMWO9b3Kpz0yqS9zI768PcZg6ojqBU=
X-Gm-Gg: AeBDieuGDvW33GWASW+iXMhleHuK1Ymfv7m9UGxTNAJGdHCDHS6AG+jS8SloQuu9g48
	3Tu0OyUy7AUNtoFMre3o4/qMhu10Oxrg2Nk7+v37Mx0nytNl7wh4Icj10Z/L745tnRPozFpXvPO
	EBrOFixWE756kygmEVk57frHLtcrul2DncARDuDbKBwF92H+/cfN01vZPC18nRh1B/zR5PcjjR2
	CFKpazlPD3FiYIq8z48LJnAmcYdhODnm8KKjWHLj27eFyAKrpDMpVGZTKVqSHlwts9L5Jm7jhZq
	yQN/M4ThLDIAwnZx4f/EEyyypk/Q5aJLn1QuP7b0BpHUB+3c19Rpp3Wn7+jwbVI2UXGthQXQqFh
	wrlmqfqM/WJF8J1nvo3gvS2sHH2kHKNT/TLqt
X-Received: by 2002:a05:6000:186c:b0:43b:41df:705e with SMTP id
 ffacd0b85a97d-43d2930fc4fmr22574573f8f.49.1775543574370; Mon, 06 Apr 2026
 23:32:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <adFrJmqSfx7dEJWt@ashevche-desk.local> <20260405143910.10517-1-joshua.crofts1@gmail.com>
 <adQMUrq7LlR2qAdF@ashevche-desk.local>
In-Reply-To: <adQMUrq7LlR2qAdF@ashevche-desk.local>
From: Joshua Crofts <joshua.crofts1@gmail.com>
Date: Tue, 7 Apr 2026 08:32:51 +0200
X-Gm-Features: AQROBzBpOTZjy8bjtOCcWEqUaBN85cH9_jFgAoPflaF1UBjSIeWB8hmh-oVZTZ8
Message-ID: <CALoEA-x-2hRQrAzJRKijrNhvM-a4kdNKbka4WBm9J4PY_5te9Q@mail.gmail.com>
Subject: Re: [PATCH v3] staging: media: atomisp: cleanup parenthesis alignment
 in pci.
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: hansg@kernel.org, mchehab@kernel.org, andy@kernel.org, 
	gregkh@linuxfoundation.org, sakari.ailus@linux.intel.com, grondon@gmail.com, 
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-58148-lists,linux-media=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,linuxfoundation.org,linux.intel.com,gmail.com,vger.kernel.org,lists.linux.dev];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	MISSING_XM_UA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[joshuacrofts1@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 03D7E3AA51F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, 6 Apr 2026 at 21:41, Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:
>
> Thanks for doing this. However, the proper fix should be the getting rid of
> copy_from_compatible() in favour of using iov_iter. You can consult with
> this example:
> 49aa6ed94c5e ("ALSA: korg1212: Convert to generic PCM copy ops")
>
Okay, I'll have a look at it. Thanks for the heads up about this problem.

> The current patch in its form is quite low priority and not guaranteed to be
> ever applied. Sorry, we consider real patches to be done first, see above.
>
Fair enough, I would've expected formatting to be low priority. This
is the first
patch I've worked on so at least I got to scope out what's what. Either way,
thanks for the reviews.

Kind regards

CJD

