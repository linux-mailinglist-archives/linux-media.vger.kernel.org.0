Return-Path: <linux-media+bounces-59438-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SB4QEcB26mnTzgIAu9opvQ
	(envelope-from <linux-media+bounces-59438-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 23 Apr 2026 21:45:04 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CBFA456E1C
	for <lists+linux-media@lfdr.de>; Thu, 23 Apr 2026 21:45:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D07BC302615C
	for <lists+linux-media@lfdr.de>; Thu, 23 Apr 2026 19:43:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37AE93446CC;
	Thu, 23 Apr 2026 19:43:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gsr.dev header.i=@gsr.dev header.b="h9KQQBs0";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="J/AW1Lpm"
X-Original-To: linux-media@vger.kernel.org
Received: from fhigh-a4-smtp.messagingengine.com (fhigh-a4-smtp.messagingengine.com [103.168.172.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 312A023EA9B
	for <linux-media@vger.kernel.org>; Thu, 23 Apr 2026 19:43:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776973428; cv=none; b=pJE2JcG2f+MVLNdnO5vsRCU50YJEkJySB6cWcn3O7gMvLkYn7L51z9b6xQWFHni66BdLJ2yn9qLKNYARGHMVVm80UggWtxtCjCIaVatSJX9hv4V6zmqh+WUd+m0tVXTnwt3LFk2SYlNL5rwXpoTYxJ+b8kWtoL9TPauNSFfU6hY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776973428; c=relaxed/simple;
	bh=WBu7Jo8C1Lvb2PhGxEpK2DsbNMHNdUyrwu8IeLOKnRE=;
	h=MIME-Version:Date:From:To:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=grKV1CkRsx2LZs4hxTIH2J9VIOosTRYS/M/Uc0EL+T9vB/OsEhhGN+mr+GciWeTJ26bVg0CyNvrcieaS8NUiGXpKV5GHr2nm/Y5aubyIaWI6YKm5YXEF73lV0iqhAwbdPDkprU8l92utjlt8wF5wsvZgzJUPbPqPenptdsxJjlg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gsr.dev; spf=pass smtp.mailfrom=gsr.dev; dkim=pass (2048-bit key) header.d=gsr.dev header.i=@gsr.dev header.b=h9KQQBs0; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=J/AW1Lpm; arc=none smtp.client-ip=103.168.172.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gsr.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gsr.dev
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 62E9C1400171
	for <linux-media@vger.kernel.org>; Thu, 23 Apr 2026 15:43:46 -0400 (EDT)
Received: from phl-imap-17 ([10.202.2.105])
  by phl-compute-03.internal (MEProxy); Thu, 23 Apr 2026 15:43:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gsr.dev; h=cc
	:content-transfer-encoding:content-type:content-type:date:date
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1776973426;
	 x=1777059826; bh=cmwPoLdoSdtePrxmb52SzE0HQmkxTc9at8PyhPJiIhY=; b=
	h9KQQBs06SmMG0h79PoGqTXORwpY8UwjuTeK935INX+jhhNoh08OTrgiVs2Wem3e
	XlJqPXdpX0sNnS3lempLwbTGgtkVSFxY824LHig5+UBnW2zSfx2fjblHuHMnveeZ
	9MbbtmSRbjySrCPdlINJwqGc+G70hNh5Sc5LaMxPHW882BO+RJFDKKYF7FNZf0LT
	KZHDgUW8EbtCqxGRyeJOG5DkMp9t4rvKKx7UlD1ds6yat9GCNbox5jXzBRr28s93
	pwfyq5Br92Sb2J5KPQBZJRIkX/HbVpuT7/SwsI3XXWb/4kRn/G0oQYm4wJiRTzck
	jtkzuBM5TB9k9Bb2HUeXTg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm2; t=1776973426; x=1777059826; bh=c
	mwPoLdoSdtePrxmb52SzE0HQmkxTc9at8PyhPJiIhY=; b=J/AW1Lpm51JJ9H6b6
	s9RCvidoL1gti2IvQU4BXAik5chYBFf4TbWxCy1CrfO3AteSDcUl8wmumSPK5rFF
	L1ldncURICIHrpa0RGhvVqO9Kz5OqLiCoJn3/dQV4+W2uoFnfoYsJGsXPBRdDR6p
	AzqYQ1rL4Xa7IyWhcdgo9KOBeI9JCW0tw85YxjIu4s9mRtYdxMEq2cslxm5H9sXo
	6Qg5IjJQ0IMccjX99aLUwC7uW4tgk1ZWKwlbw6vaG9w0mw/JpMIoaQPBFuJKzUlM
	d4FSwFcsxJjK94JsN4l5dkO6Ph/mnePHX3VxU4FwVDebXehx/9g1aGN4nRuI5U9V
	2LOCQ==
X-ME-Sender: <xms:cnbqaVWLd58OilcO3uEIKhOcZMcCzqhfUnFb95KGs0ImohKP0UMC1w>
    <xme:cnbqaQaF_1Aq6jkU1B72VU20Dj9InSJN7BdpwhCKKnSvV2rE4r6GmTAmmVq1CYneh
    QfjHLKfjXLAUbtN3QsKRAanhS7b4_FwNk2h3hiEuhHzPJNA_DuwOy-W>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdeikedtvdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecunecujfgurhepofggfffhvffkjghfufgtgfesthejredtre
    dttdenucfhrhhomhepifgrsghrihgvlhcuoehgrggsrhhivghlsehgshhrrdguvghvqeen
    ucggtffrrghtthgvrhhnpeeuieelgeelhfefkeefvdekteefiedtvdffkeejvdevfeettd
    ehuedvgeffudffteenucffohhmrghinhepfhhrvggvuggvshhkthhophdrohhrghdpkhgv
    rhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
    hfrhhomhepghgrsghrihgvlhesghhsrhdruggvvhdpnhgspghrtghpthhtohepuddpmhho
    uggvpehsmhhtphhouhhtpdhrtghpthhtoheplhhinhhugidqmhgvughirgesvhhgvghrrd
    hkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:cnbqaVHXsbFcxlcIwhrXqsPqAns16simhHPlamhnJGOxNJzpO3JMMA>
    <xmx:cnbqaaT0TJVZWP5C0IzupXlnXswRIA4EEZ5cYoZECIZu50dJ9vImIw>
    <xmx:cnbqaUB35BWA-yRmY6AzO4ieFEmeeffY388HOtDzYhwo4XwRU_VP7Q>
    <xmx:cnbqaS0zFcYBqm5Wz-bNZPdA0hC0BUKmtY5d2DVmlZUKYmk9dIS2Mw>
    <xmx:cnbqabbPF3FDo4qIJ-bAq2llM-vVJdgd41VhTvaxbrcqPJoZyA7JnxY1>
Feedback-ID: i4f594605:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 30270C40072; Thu, 23 Apr 2026 15:43:46 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: ABfAGTZ89NhV
Date: Thu, 23 Apr 2026 16:43:26 -0300
From: Gabriel <gabriel@gsr.dev>
To: linux-media@vger.kernel.org
Message-Id: <2ef32e2d-0262-464f-a46f-b6884bd62b9c@app.fastmail.com>
In-Reply-To: <69ea73c6.050a0220.2e08a.1ede@mx.google.com>
References: <20260423181443.46566-1-gabriel@gsr.dev>
 <69ea73c6.050a0220.2e08a.1ede@mx.google.com>
Subject: Re: media: atomisp: Use negation to check for NULL
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-1.65 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gsr.dev:s=fm2,messagingengine.com:s=fm2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	XM_UA_NO_VERSION(0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-59438-lists,linux-media=lfdr.de];
	DMARC_NA(0.00)[gsr.dev];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[gsr.dev:+,messagingengine.com:+];
	RCPT_COUNT_ONE(0.00)[1];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gabriel@gsr.dev,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_FIVE(0.00)[6];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[messagingengine.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,gsr.dev:dkim,app.fastmail.com:mid,pages.freedesktop.org:url]
X-Rspamd-Queue-Id: 5CBFA456E1C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Looks like a CI error:

ERROR: Failed to remove container f9fa45e1527a49c9d421f98e82fd1cd23b249da7325fb34ad7b8a86bf35fcbed
ERROR: Failed to remove container d79ed1127e9d8d8945eafad2585f86e05c503acb8a78d75991bda515b7a9f20a
ERROR: Failed to cleanup volumes
ERROR: Job failed (system failure): waiting for container: error during connect: Post "http://internal.tunnel.invalid/v1.47/containers/f9fa45e1527a49c9d421f98e82fd1cd23b249da7325fb34ad7b8a86bf35fcbed/wait?condition=not-running": ssh tunnel: read tcp 10.128.0.5:39928->10.128.0.121:22: read: connection reset by peer (%!s(<nil>))

I'm not sure there's anything for me to fix in the patch, considering how simple and minimal it is...

On Thu, Apr 23, 2026, at 16:32, Patchwork Integration wrote:
> Dear Gabriel Sanches:
>
> Thanks for your patches! Unfortunately the Media CI robot detected some
> issues:
>
>
>
> Please fix your series, and upload a new version. If you have a patchwork
> account, do not forget to mark the current series as Superseded.
>
> For more details, check the full report at:
> https://linux-media.pages.freedesktop.org/-/users/patchwork/-/jobs/98123422/artifacts/report.htm 
> .
>
>
>
> Best regards, and Happy Hacking!
> Media CI robot on behalf of the linux-media community.
>
> ---
> Check the latest rules for contributing your patches at:
> https://docs.kernel.org/driver-api/media/maintainer-entry-profile.html
>
> If you believe that the CI is wrong, kindly open an issue at
> https://gitlab.freedesktop.org/linux-media/media-ci/-/issues or reply-all
> to this message.

-- 
Gabriel Sanches

