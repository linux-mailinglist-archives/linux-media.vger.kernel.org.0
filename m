Return-Path: <linux-media+bounces-14572-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B13CE92564F
	for <lists+linux-media@lfdr.de>; Wed,  3 Jul 2024 11:18:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6D424285F52
	for <lists+linux-media@lfdr.de>; Wed,  3 Jul 2024 09:18:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA31413D89A;
	Wed,  3 Jul 2024 09:17:50 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8193313D61B;
	Wed,  3 Jul 2024 09:17:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719998270; cv=none; b=emTVW2TGqxYEX0DN1mo9Ebbz1/gz0zxlWGSBTigRHqCz6wgmwGN3Rz7IWKkMNLZvFbv/epDhSYi+1+UQ2Tj2KWduHDv0itPeFPvIrvT9QAHvwv7OLBh5PJpqs02eVGUC0kOtw5RtQRENfooKtmf6VgaBVk5ZcKxw5QNxlC/ZHLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719998270; c=relaxed/simple;
	bh=wT4lT4qeBdUZ9vjM++wAyGqTN4xndGVKQLyZVo3pJkc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gH+Bsl99bpByh67YbZ3LHgmKaWsUh71agsXDAjM7bhgY1fd5kvygzjZEL5aoWQTNzNftm8pjl3JGyQ8VyTrTLI8aYrKOpbGeEAFk7GNpdAkIeIkIOqPm6pF7xu+bF9+kmuGpFTqtLMEHfLAc2mspLih5l8ea11qj/5iFA5rTzVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 061C0C32781;
	Wed,  3 Jul 2024 09:17:48 +0000 (UTC)
Message-ID: <b47f96bb-b1a5-48a1-8002-1cee351bdb3f@xs4all.nl>
Date: Wed, 3 Jul 2024 11:17:47 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: Signed-off-by missing for commit in the v4l-dvb-next
 tree
To: Stephen Rothwell <sfr@canb.auug.org.au>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>
References: <20240703163317.55618738@canb.auug.org.au>
Content-Language: en-US, nl
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <20240703163317.55618738@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Stephen,

On 03/07/2024 08:33, Stephen Rothwell wrote:
> Hi all,
> 
> Commit
> 
>   57dd8f2f77bc ("Revert "media: stm32: dcmipp: correct error handling in dcmipp_create_subdevs"")
> 
> is missing a Signed-off-by from its author and committer.
> 
> Reverts are commits as well.
> 

My mistake. I discovered that git revert doesn't run the commit-msg hook.

Anyway, I installed a pre-push hook to double check this before I push to
our tree, so hopefully this won't happen again.

Question: does this have to be fixed? That would require a rebase, I think,
which makes some media developers unhappy. Or can this be left as-is for one
time?

Regards,

	Hans

