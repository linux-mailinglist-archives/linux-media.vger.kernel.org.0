Return-Path: <linux-media+bounces-10215-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 744FE8B3521
	for <lists+linux-media@lfdr.de>; Fri, 26 Apr 2024 12:18:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3074E28AC82
	for <lists+linux-media@lfdr.de>; Fri, 26 Apr 2024 10:18:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B270714533C;
	Fri, 26 Apr 2024 10:15:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DnXmegH0"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D88D1474D8;
	Fri, 26 Apr 2024 10:15:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714126540; cv=none; b=frCNbOprA1eR6F+UIrrQ+pzGQQJE7A/RMZVT98SDAOTihTralJbRqAuBnOJuepB37GWb13q9r2cpWTlCHL8m+nZJvuQkGkYBp0B4UtWzNQ3hjl+Bg5XQGGPcn0sCju/gl4bSHyrIeVDEttwS9d2KzIuN1WuEASVB0sMXJzRPAp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714126540; c=relaxed/simple;
	bh=ZYZa8gCD3uP/iTbMImuB3h3YvaLrCRfjyDRge32qZvk=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IDHsYmUyhwhymwMQcTC0skKkOlwVf9t40GtTSHPO0GUDaWsTlm6zbEv3VijmF9EMMsaw6VIAYRjr4dKkHS2ZocNiaErYFpKzFHoi386myYB9DQqzVwTXLThOSTlaT+Nsn/VNzBqbyzykSLSLh9He7b1rkHXI+IHH1ztiYW8aKbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DnXmegH0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4AC7C113CD;
	Fri, 26 Apr 2024 10:15:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714126539;
	bh=ZYZa8gCD3uP/iTbMImuB3h3YvaLrCRfjyDRge32qZvk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=DnXmegH0H6OP3IcufzqLB5mo8s742TBz97fCveX4NCJxEOvhQVCdLxJDrgb2BuF95
	 MVO5ok0Ah9FJdXOOXqP3bHfF55ZmdUkzKve7IWdZap1iR7cSx/ckZBlht7K2+UgdiY
	 JoKdrgIzRqUw2eHEU3jU7Za/l+WivM31mo1ghjhf1xVvL/+cNhImucA6QiL3LGJ6dR
	 eMNC0VLDCwfKG9igQQgwjhfkJMPgm2MLyc7cHV5xeJktP2OWivtECqB68NCFQCRXft
	 ZZ7nWZCUlwXg0ZSLSwae+7x/+irOohaP4108kQmnG1ezDGqBIpd0Xlqcdf56YsyERA
	 uAzzDpR+jMPwQ==
Date: Fri, 26 Apr 2024 11:15:33 +0100
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Linux Media Mailing List <linux-media@vger.kernel.org>, Hans Verkuil
 <hverkuil-cisco@xs4all.nl>, Sakari Ailus <sakari.ailus@linux.intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-staging@lists.linux.dev, Kate Hsuan <hpa@redhat.com>,
 "kieran.bingham@ideasonboard.com" <kieran.bingham@ideasonboard.com>
Subject: Re: [GIT PULL] media: atomisp: Changes for 6.10-2
Message-ID: <20240426111533.2b717d57@sal.lan>
In-Reply-To: <5f89adf7-23e3-4966-ac50-838335b13207@redhat.com>
References: <5f89adf7-23e3-4966-ac50-838335b13207@redhat.com>
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hi Hans,

Em Tue, 16 Apr 2024 11:33:51 +0200
Hans de Goede <hdegoede@redhat.com> escreveu:

> Hi Mauro, Hans,
> 
> Here is a second round of atomisp changes for 6.10,
> this pull-request supersedes / replace my
> "media: atomisp: Changes for 6.10-1" pull-request.
> 
> Various cleanup patches from Jonathan Bergh and Andy +
> a set of patches from me which has been reviewed
> by Andy and Kieran.

Atomisp patches applied, thanks!

I had to do a rebase here first, as it seems some patches were 
merged already on this series and on the previous one.

Please double-check if I picked everything, and rebase your
tree on the top of media-stage before the next PR, to avoid
potential issues during patch review.

Regards,
Mauro

