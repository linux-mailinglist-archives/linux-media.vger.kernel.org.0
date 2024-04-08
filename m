Return-Path: <linux-media+bounces-8852-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 62F8189C788
	for <lists+linux-media@lfdr.de>; Mon,  8 Apr 2024 16:54:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0E8511F22381
	for <lists+linux-media@lfdr.de>; Mon,  8 Apr 2024 14:54:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5295613F422;
	Mon,  8 Apr 2024 14:54:03 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF75B13F011
	for <linux-media@vger.kernel.org>; Mon,  8 Apr 2024 14:54:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712588043; cv=none; b=UWW6Rs/mUV85zjWUIlDP6ixbqZCXepgtrMPVzNRi0KvkySbEstlr/ItN1Mg8SZzdFblQP6zk2bYShfBe6H5HX2CbnAjVtDcz7R1t6qGugTz7NtRKdHhVCLg/DapR2nhHT/oJMJAw5jCyCQqflWtxFCYa3l41dbnhu77uHQ2+clw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712588043; c=relaxed/simple;
	bh=rt5DAiAgNwU/DfWEBcXPaKicSfaqx12MLfGvE0qO804=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=q5Mu08vHx/sL7V/gXPx5n93enlRHalwg7rOA9XpDZa5rbpivhmDzwAiOL0GPK3mhsNeRIBfJePcxjJwSZTdTn1AEdmPLBjvdpRrDkO4D93OVGDNBm/BQN7nWrUqF4luIUC/uxnpNfffJFfVkDrvrBaG59aQojF1YCDKvs6dQ4YM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 600A8C433F1;
	Mon,  8 Apr 2024 14:54:01 +0000 (UTC)
Message-ID: <fdd16aef-7feb-4de4-9d79-c9b682217a40@xs4all.nl>
Date: Mon, 8 Apr 2024 16:54:01 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/11] media: ttpci: make checkpatch happy
Content-Language: en-US, nl
To: Stefan Herdler <herdler@nurfuerspam.de>
Cc: linux-media@vger.kernel.org, smoch@web.de, tmn505@gmail.com,
 vinschen@redhat.com
References: <20240328020522.50995-1-herdler@nurfuerspam.de>
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <20240328020522.50995-1-herdler@nurfuerspam.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Stefan,

On 28/03/2024 03:05, Stefan Herdler wrote:
> Hi Hans,
> 
> last year I promised to take a look at the chackpatch warnings.
> Well, it took a little longer then expected but here is the first result.
> 
> This patchset should remove all chackpatch warnings and errors in the
> ttpci budget driver(s) if applied completely.
> 
> This is the first in a series of similar fixes for the SAA7146 related
> drivers (at least that is my plan).
> This first patchset is also a test for my whole tool chain. Please give
> me some feedback if there is something, that could be improved next time.
> 
> Initially I had planned to start with the AV7110 driver, but then decided
> to start with this one, because it was the easiest one to fix. It didn't
> had any complicated issues and the list of warnings was one of the
> shortest among the SAA7146 drivers.

If I run 'checkpatch.pl --strict' over these patches, then reports several
of these warnings about the subject line:

WARNING: A patch subject line should describe the change not the tool that found it

I think if you fix that and post a v2 (fixing 04/11 and dropping 11/11),
then I can merge it.

Regards,

	Hans

> 
> Regards
> Stefan
> 
> 
> Stefan Herdler (11):
>   media: ttpci: checkpatch fixes: whitespace and newlines
>   media: ttpci: checkpatch fixes: whitespace
>   media: ttpci: checkpatch fixes: comments
>   media: ttpci: checkpatch fixes: braces
>   media: ttpci: checkpatch fixes: export_symbol
>   media: ttpci: checkpatch fixes: assign_in_if
>   media: ttpci: checkpatch fixes: trailing_statements
>   media: ttpci: checkpatch fixes: constant_comparsation
>   media: ttpci: checkpatch fixes: miscellaneous
>   media: ttpci: checkpatch fixes: logging
>   media: ttpci: checkpatch fixes: msleep
> 
>  drivers/media/pci/ttpci/budget-av.c   | 574 +++++++++++++-------------
>  drivers/media/pci/ttpci/budget-ci.c   | 501 +++++++++++-----------
>  drivers/media/pci/ttpci/budget-core.c |  38 +-
>  drivers/media/pci/ttpci/budget.c      | 170 ++++----
>  drivers/media/pci/ttpci/budget.h      |  19 +-
>  5 files changed, 658 insertions(+), 644 deletions(-)
> 
> --
> 2.34.0
> 
> 


