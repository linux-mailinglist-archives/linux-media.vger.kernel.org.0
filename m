Return-Path: <linux-media+bounces-45150-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D5D9BF8199
	for <lists+linux-media@lfdr.de>; Tue, 21 Oct 2025 20:34:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 35B713AD4AE
	for <lists+linux-media@lfdr.de>; Tue, 21 Oct 2025 18:34:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9B5134D924;
	Tue, 21 Oct 2025 18:34:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="FH603vwr"
X-Original-To: linux-media@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.17.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDDF834D902;
	Tue, 21 Oct 2025 18:34:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761071668; cv=none; b=Movaf6G3CbqFWrcsIHR1uqtTcsjmZcX4SUb8j4QoOTYcNlU6ugioccpf315YVxiVdSLDgiRRzakeAFQ4XueLiOh/8K5dyJG2aPgV2sQ7L/5jJvkP91XKlCclVQy3ayqqDzCc4l5fcwwd9gk5rzGb4qdxyiDMwbdPIzeKe3u6ToA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761071668; c=relaxed/simple;
	bh=o7KZQoS3Gd0pEWOeSJgHQDMBFnLTvt8KVyrnG2lW43A=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=MkPBKx2xl0ATgXq7g435hCgGpe7KAzrOzjK8Ch6o3SITuzEtleXxRRO07y8qNuXAt8ngUktXNnYi3RAD4RGxC4sRhCAi4eKsHDejdXZ9Epy12dGgEDWaAAr0xCmzefGjybc9WA4GJQMVwFGyJFM1vWNo4dT4adD0ZzfElkoe2Aw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=FH603vwr; arc=none smtp.client-ip=212.227.17.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1761071640; x=1761676440; i=markus.elfring@web.de;
	bh=6FRJssbtVPmOjx0o5zga2S5Cuou84TRsQ7XPGOO4XBs=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=FH603vwrqiDlmj5zVIDWLT6uSJkMCBL99djcXx3wGqQrhYoGKvk8XSQzLA5M1F7I
	 a/0uYOdVKIEKWFp5HStH9+r0dHt3onc0/VTWLCY+q+XSu4IhoSHMVfMarsCi2WqnR
	 MaftWX5+jb6FPwizIVRXEuhL7wu+2Z5BTRtDCpKLmCJFZkVW4kqp/ZKkl9NF5bo9i
	 Gaq0rfm/zO2IltMtqw3tcmKgPHrhEuM25jIsswsY3BEK3rtmXqtdUMdLAd+aKEKYI
	 6qkfRNisn89Pg7ncnWRo4rvz0VwV3gkVo9byklIFejuATKzvwnbwRIsnyb5gf0dlN
	 p0WF8QhuU7htXLBmtA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.69.255]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MVrg7-1ujTTB175R-00HzqL; Tue, 21
 Oct 2025 20:34:00 +0200
Message-ID: <2638dc88-a6e7-4b3c-8783-629bcfcd7d4b@web.de>
Date: Tue, 21 Oct 2025 20:33:50 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Biancaa Ramesh <biancaa2210329@ssn.edu.in>, linux-media@vger.kernel.org,
 Andy Walls <awalls@md.metrocast.net>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-kernel@vger.kernel.org
References: <20251021175711.49252-1-biancaa2210329@ssn.edu.in>
Subject: Re: [PATCH] media: cx18: kernel memory safety check in a block
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20251021175711.49252-1-biancaa2210329@ssn.edu.in>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:YEtOp7WJQhO8phDiZ/dDdjhLKTlwVb92JnYhcV/5nS5UWmwnEHW
 BKhy5WmG2etW04QnZ1U6owbjjVBTDrh3aDwfbGCJ/Q86BDnzXdH0DrFFn3YhG2nJGSDYIE9
 a8CYt10UJ+7m5tJyeSE/IFnVBPqT92xcZmZzVMSgdByheMo6rgLurXO/5JSbq3o3O6o6KAu
 rhCYe8PA0ecZeG7LjOAJw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:1vpL5lorpTA=;ES7GIEhH8WpP75ohic0YfNxyLR5
 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
 6nR83MYexgFXWhi3Bnsm3qQ7uM=

=E2=80=A6
> ---
>  drivers/media/pci/cx18/cx18-queue.c | 11 +++++++++--
=E2=80=A6

Thanks for your try to improve the implementation of the function =E2=80=
=9Ccx18_stream_alloc=E2=80=9D.
https://elixir.bootlin.com/linux/v6.18-rc2/source/drivers/media/pci/cx18/c=
x18-queue.c#L332-L408

I miss some information so far.

1. Helpful change description
   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree=
/Documentation/process/submitting-patches.rst?h=3Dv6.18-rc2#n45

2. Subsystem specification
   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree=
/Documentation/process/submitting-patches.rst?h=3Dv6.18-rc2#n646
   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/log=
/drivers/media/pci/cx18/cx18-queue.c

3. More appropriate recipient selection
   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree=
/Documentation/process/submitting-patches.rst?h=3Dv6.18-rc2#n231


=E2=80=A6
> --=20
> ::DISCLAIMER::
=E2=80=A6
> The=20
> contents of this e-mail and any attachment(s) are confidential and
=E2=80=A6

Such hints are probably misplaced for communication by the means of public=
 mailing lists.

See also once more:
https://subspace.kernel.org/etiquette.html#do-not-include-confidentiality-=
disclaimers

Regards,
Markus

